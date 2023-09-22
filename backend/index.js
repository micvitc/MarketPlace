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




app.get("/", (req, res) => {
  res.send("hello world");
});

app.post("/student", async(req, res) => {
  try {
    const student = await Product.Student.create(req.body);
    res.status(200).json(student);
  } catch (error) {
    console.log(error.message)
    res.status(500).json({message: error.message})
  }
})

app.listen(PORT || 8080,()=>{
  try{
    console.log(`Server is running on  http://localhost:${PORT}`)
    connectDB()
  }catch(err){
    console.log("Unable to start server: " + err)
  }
})