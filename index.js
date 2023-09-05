const express = require("express");
const app = express();

const PORT = 3000

app.get("/", (req, res) => {
  res.send("hello world");
});

app.listen(PORT || 8080,()=>{
    console.log(`Server is running on  http://localhost:${PORT}`)
})