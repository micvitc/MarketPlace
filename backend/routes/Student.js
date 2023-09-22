const express = require("express");
const router = express.Router();

const {getProducts, getProduct, createProduct, updateProduct, removeProduct} = require("../controllers/studentController");

// Fetch ALL reports from database
router.get("/", getProducts);
  
// Fetch a single item from database
router.get("/:id", getProduct);

// Add a new item to the database
router.post("/create", createProduct);
  
// Edit an attribute of an existing item
router.put("/:id", updateProduct);

// Remove an item from the database
router.delete("/:id", removeProduct);

module.exports = router;