const logger = require("../middlewares/logger");
const prisma = require("../prisma/client");
const otpGenerator = require("otp-generator");
const nodemailer = require("nodemailer");
const Mailgen = require("mailgen");
const bcrypt = require("bcrypt");
const firebase = require("../utils/firebase/firebaseConfig");
const jwt = require("jsonwebtoken");

//? generate OTP AND SEND it to the phoneNumber
const generateOTP = async (req, res) => {
  try {
    const { email, phoneNumber, register } = req.body;

    if (register) {
      //? check is email or phoneNumber already exist in database if this is for register
      const existedUser = await prisma.user.findFirst({
        where: {
          OR: [
            {
              email: email,
            },
            {
              phoneNumber: phoneNumber,
            },
          ],
        },
      });

      if (existedUser) {
        return res.status(409).json({
          status: "failed",
          message: "Phone number or email is already used",
        });
      }
    }

    //!creating OTP using otp-generator
    const otp = otpGenerator.generate(6, {
      lowerCaseAlphabets: false,
      specialChars: false,
    });

    //!send otp through email
    let config = {
      service: "gmail",
      auth: {
        user: process.env.MAIL,
        pass: process.env.PASS,
      },
      tls: {
        rejectUnauthorized: false,
      },
    };

    let transporter = nodemailer.createTransport(config);

    let MailGenerator = new Mailgen({
      theme: "cerberus",
      product: {
        name: "LaundryMama",
        link: "https://mailgen.js/",
      },
    });

    let response = {
      body: {
        name: "",
        intro: [
          "Please enter the following verification code to verify your LaundryMama account.",
          `<h2>${otp}</h2>`,
        ],

        outro:
          "Need help, or have questions? Just reply to this email, we'd love to help.",
      },
    };

    let mail = MailGenerator.generate(response);

    let message = {
      from: process.env.MAIL,
      to: email,
      subject: "Verify account using OTP",
      html: mail,
    };
    try {
      await transporter.sendMail(message);
      //!save otp to database
      const duplicateOtpByEmail = await prisma.otp.findUnique({
        where: {
          email,
        },
      });
      if (duplicateOtpByEmail) {
        await prisma.otp.update({
          where: {
            email,
          },
          data: {
            code: otp,
          },
        });
      } else {
        await prisma.otp.create({
          data: {
            email,
            code: otp,
          },
        });
      }

      return res.status(201).json({
        status: "success",
        message: "OTP has sent to the email",
      });
    } catch (error) {
      logger.error(error);
      return res.status(506).json({
        status: "failed",
        message: "failed to send mail",
      });
    }
  } catch (error) {
    logger.error(error);
    return res.status(400).json({
      status: "failed",
      message: "Something went wrong",
    });
  }
};

//verify otp
const verifyOtp = async (req, res) => {
  try {
    const { otp, email } = req.body;

    //verify the  otp
    const verifiedOtp = await prisma.otp.findUnique({
      where: {
        email,
        code: otp,
      },
    });
    if (!verifiedOtp) {
      // Send a failed response
      return res.status(401).json({
        status: "failed",
        message: "OTP verification failed",
      });
    }
    //OTP verification succeeded, so  can delete the OTP
    await prisma.otp.delete({
      where: {
        email,
        code: otp,
      },
    });
    return res.status(200).json({
      isVerified: true,
      status: "success",
      message: "OTP validation successful",
    });
  } catch (error) {
    return res.status(400).json({
      status: "failed",
      message: "Something went wrong",
    });
  }
};

//register new user
const registerUser = async (req, res) => {
  try {
    const { name, email, phoneNumber, image, address, password, isVerified } =
      req.body;

    if (isVerified) {
      if (!name || !email || !phoneNumber || !image || !address || !password) {
        return res.status(400).json({
          status: "failed",
          message: "Invalid or incomplete user data",
        });
      }
      //? check is email or phoneNumber already exist in database if this is for register
      const existedUser = await prisma.user.findFirst({
        where: {
          OR: [
            {
              email: email,
            },
            {
              phoneNumber: phoneNumber,
            },
          ],
        },
      });

      if (existedUser) {
        return res.status(409).json({
          status: "failed",
          message: "Phone number or email is already used",
        });
      }

      try {
        //encrypt password
        const hashPassword = await bcrypt.hash(password, 10);
        //create user in database
        await prisma.user.create({
          data: {
            name,
            email,
            phoneNumber,
            isVerified,
            image,
            address,
            password: hashPassword,
          },
        });
        return res.status(201).json({
          status: "success",
          message: "New account is created successfully",
        });
      } catch (error) {
        logger.error(error);
        return res.status(500).json({
          status: "failed",
          message: "register failed",
        });
      }
    }
  } catch (error) {
    return res.status(400).json({
      status: "failed",
      message: "You have to verify your account first",
    });
  }
};

//signin user
const handleSignin = async (req, res) => {
  //?extract email and password from the body of req and check if any value is missing
  const { email, password } = req.body;
  if (!email || !password) {
    return res.status(400).json({
      status: "failed",
      message: "Invalid or incomplete user data",
    });
  }

  //?find the user in db using email
  const findUser = await prisma.user.findUnique({
    where: {
      email: email,
    },
  });
  if (!findUser)
    return res.status(401).json({
      status: "failed",
      message: "Email or Password doesn't match with any account",
    }); //Unauthorized

  //? evaluate and compare password
  const matchPassword = await bcrypt.compare(password, findUser.password);
  if (!matchPassword) {
    return res.status(401).json({
      status: "failed",
      message: "Email or Password doesn't match with any account",
    }); //Unauthorized
  }

  //?creating accessToken and refreshToken
  const accessToken = jwt.sign(
    {
      id: findUser.id,
      email: findUser.email,
      role: findUser.role,
    },
    process.env.ACCESS_TOKEN_SECRET,
    { expiresIn: "60s" }
  );
  const refreshToken = jwt.sign(
    {
      id: findUser.id,
      email: findUser.email,
      role: findUser.role,
    },
    process.env.REFRESH_TOKEN_SECRET,
    { expiresIn: "180s" }
  );

  //?Update the user in the database with the refresh token.
  await prisma.user.update({
    where: {
      email: findUser.email,
    },
    data: {
      refreshToken: refreshToken,
    },
  });

  //? // Creates Secure Cookie with refresh token
  res.cookie("laundryMamaJwt", refreshToken, {
    httpOnly: true,
    sameSite: "None",
    secure: true,
    maxAge: 3 * 60 * 1000, //3min
  });
  //? return accessToken in res
  return res.status(200).json({
    accessToken: accessToken,
    status: "success",
    message: "Logged in  successfully",
  });
};

//signout
const handleSignout = async (req, res) => {
  const cookies = req.cookies;
  if (!cookies?.laundryMamaJwt)
    return res.status(401).json({
      status: "failed",
      message: "No refresh token found",
    }); //No content
  const refreshToken = cookies.laundryMamaJwt;

  //?Is refreshToken in db?
  const findUser = await prisma.user.findUnique({
    where: {
      refreshToken: refreshToken,
    },
  });
  if (!findUser) {
    res.clearCookie("laundryMamaJwt", {
      httpOnly: true,
      sameSite: "None",
      secure: true,
    });
    return res.status(403).json({
      status: "failed",
      message: "Not Authorized",
    });
  }

  //?remove refresh token from db and delete it from cookie
  await prisma.user.update({
    where: {
      refreshToken: refreshToken,
    },
    data: {
      refreshToken: "",
    },
  });
  res.clearCookie("laundryMamaJwt", {
    httpOnly: true,
    sameSite: "None",
    secure: true,
  });

  return res.status(200).json({
    status: "success",
    message: "Signed out successfully",
  });
};

//update expired access token
const updateAccessToken = async (req, res) => {
  const cookies = req.cookies;
  if (!cookies?.laundryMamaJwt)
    return res.status(401).json({
      status: "failed",
      message: "No refresh token found",
    }); //No content
  const refreshToken = cookies.laundryMamaJwt;

  //?Is refreshToken in db?
  const findUser = await prisma.user.findFirst({
    where: {
      refreshToken: refreshToken,
    },
  });
  if (!findUser) {
    return res.status(403).json({
      status: "failed",
      message: "Not Authorized",
    });
  }

  //?verify jwt
  jwt.verify(refreshToken, process.env.REFRESH_TOKEN_SECRET, (err, decoded) => {
    if (err || findUser.id !== decoded.id)
      return res.status(403).json({
        status: "failed",
        message: "Invalid access token",
      });
    const accessToken = jwt.sign(
      {
        id: decoded.id,
        email: decoded.email,
        role: decoded.role,
      },
      process.env.ACCESS_TOKEN_SECRET,
      { expiresIn: "60s" }
    );
    return res.status(200).json({
      accessToken: accessToken,
      status: "success",
      message: "Access token updated successfully",
    });
  });
};

module.exports = {
  generateOTP,
  verifyOtp,
  registerUser,
  handleSignin,
  handleSignout,
  updateAccessToken
};
