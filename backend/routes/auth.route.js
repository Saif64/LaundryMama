const express = require('express');
const { generateOTP, verifyOtp, registerUser, handleSignin, handleSignout, updateAccessToken } = require('../controllers/auth.controller');
const router = express.Router();


//generate otp route
router.post("/generateOTP",generateOTP)

// verify token
router.post("/verifyOTP",verifyOtp)

//register new user after verification 
router.post("/register",registerUser)

//sign in
router.get("/signin",handleSignin)

//sign out
router.get("/signout",handleSignout)

//update Access token
router.get("/updateAT",updateAccessToken)



module.exports=router

