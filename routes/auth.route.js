const jwt = require("jsonwebtoken");
const prisma = require("../prisma/client");
const bcrypt = require("bcrypt");


const handleRegisration = async (req,res) => {
    try{
        // taking values from body
        const { username, email, password } = req.body;

        //check for duplicate username and email
        const duplicateUserByUsername = await prisma.User.findUnique({
            where: {
            username,
            },
        });
        const duplicateUserByEmail = await prisma.user.findUnique({
            where: {
              email,
            },
          });
        if (duplicateUserByUsername || duplicateUserByEmail){
          return res.status(409).json({
            message: "Username or email is already used",
          });
        }
           //encrypt password
        const hashPassword = await bcrypt.hash(password, 10);

        //create user in database
        const user = await prisma.user.create({
        data: {
            username,
            email,
            password: hashPassword,
        },
        });

        return res.json({
        message: `${user.username} is created successfully`,
        });

    }catch(error){
        res.send({
            message: "Registration failed",
        });
    }
};