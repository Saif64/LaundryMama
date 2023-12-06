const logger = require("../middlewares/logger");
const prisma = require("../prisma/client");



//register new user
const registerUser = async (req, res) => {
  const { name, email, phoneNumber } = req.body;

  if (!name || !email || !phoneNumber) {
    return res.status(400).json({
      status: "failed",
      message: "Invalid or incomplete user data",
    });
  }

  try {
    //create user in database
    await prisma.user.create({
      data: {
        name,
        email,
        phoneNumber,
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
      message: "Registration failed",
    });
  }
};

//signin user
const handleSignin = async (req, res) => {
  //?extract email  from the body of req and check if any value is missing
  const { email } = req.body;
  if (!email) {
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
      message: "Email doesn't match with any account",
    }); //Unauthorized

  //? return accessToken in res
  return res.status(200).json({
    status: "success",
    message: "Logged in  successfully",
  });
};

module.exports = {
  registerUser,
  handleSignin,
  
};
