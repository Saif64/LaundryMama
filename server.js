//all import
const express=require("express")
require('dotenv').config();
const cookieParser = require('cookie-parser');
const cors = require('cors');
const logger=require("./middlewares/logger")
const expressPino=require("express-pino-logger")




//code 
const app = express();

//middleware for cookies
app.use(cookieParser());
// built-in middleware for json 
app.use(express.json());
// built-in middleware to handle urlencoded form data
app.use(express.urlencoded({ extended: false }));

// Cross Origin Resource Sharing
app.use(
  cors({
    credentials: true,
    origin: ["http://localhost:3000"],//!write frontend route here
  })
);

//logger as a middleware
//logger as middleware
app.use(expressPino({logger}))


//routes
app.use("/",(req,res)=>{
    logger.info("first route")
    return res.send("The first route o LaundryMama")

})




//start the express server
const PORT = process.env.PORT || 3501;
app.listen(PORT, () => logger.info(`Server running on port ${PORT}`));


