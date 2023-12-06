const express = require("express");
const {
  registerUser,
  handleSignin,
} = require("../controllers/auth.controller");
const router = express.Router();

//register new user after verification
router.post("/register", registerUser);

//sign in
router.get("/signin", handleSignin);



module.exports = router;
