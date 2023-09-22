const express = require("express");
const app = express();
var bodyParser = require('body-parser')
const Product = require("./models/product")
const PORT = 3000

const connectDB = require('./database')

// Middleware
// app.use(express.json())
app.use(bodyParser.urlencoded({ extended: false }))
app.use(bodyParser.json())

// Routes
const reportRoute = require('./routes/Report')
app.use('/report',reportRoute)

const lostAndFoundRoute = require('./routes/LostAndFound')
app.use('/lostandfound', lostAndFoundRoute)

const studentRoute = require('./routes/Student')
app.use('/student', studentRoute)


app.get("/", (req, res) => {
  res.send("hello world");
});



app.listen(PORT || 8080,()=>{
    console.log(`Server is running on  http://localhost:${PORT}`)
    connectDB()
})