const express = require("express");
const app = express();
var bodyParser = require('body-parser')
const Product = require("./models/product")
const PORT = 3000
const checkEmailInDb=require("./service/FireBase-GoogleAuth")
const connectDB = require('./database')

// Middleware
// app.use(express.json())
app.use(bodyParser.urlencoded({ extended: true }))
app.use(bodyParser.json())

// Routes
const userRoute = require('./routes/User')
app.use('/user', userRoute)

const reportRoute = require('./routes/Report')
app.use('/report',reportRoute)

const lostAndFoundRoute = require('./routes/LostAndFound')
app.use('/lostandfound', lostAndFoundRoute)

const studentRoute = require('./routes/Student')
app.use('/student', studentRoute)

const sellerRoute = require('./routes/Seller')
app.use('/seller', sellerRoute)


app.get("/",(req, res) => {
  res.send("hello world")
});

app.listen(PORT || 8080,()=>{
  try{
    console.log(`Server is running on  http://localhost:${PORT}`)
    connectDB()
  }catch(err){
    console.log("Unable to start server: " + err)
  }
})