//all import
const express=require("express")
require('dotenv').config();
const cookieParser = require('cookie-parser');
const cors = require('cors');




//code 
const app = express();

//middleware for cookies
app.use(cookieParser());
// built-in middleware for json 
app.use(express.json());
// built-in middleware to handle urlencoded form data
app.use(express.urlencoded({ extended: false })); //why false?

// Cross Origin Resource Sharing
app.use(
  cors({
    credentials: true,
    origin: ["http://localhost:3000"],//!write frontend route here
  })
);


//routes
app.use("/",(req,res)=>{
    return res.send("The first route o LaundryMama")

})




//start the express server
const PORT = process.env.PORT || 3501;
app.listen(PORT, () => console.log(`Server running on port ${PORT}`));


