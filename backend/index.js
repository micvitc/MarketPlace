const express = require("express");
const app = express();
const Product = require("./models/product")

const connectDB = require('./database')

const PORT = 3000

app.use(express.json())

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
    console.log(`Server is running on  http://localhost:${PORT}`)
    connectDB()
})