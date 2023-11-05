const express = require("express");
const router = express.Router();

const AuthUser=require('../service/userAuth');
const {getProducts, getProduct, createProduct, updateProduct, removeProduct} = require("../controllers/sellerController");

// Fetch ALL reports from database
router.get("/",AuthUser, getProducts);
  
// Fetch a single item from database
router.get("/:id",AuthUser, getProduct);

// Add a new item to the database
router.post("/create",AuthUser, createProduct);
  
// Edit an attribute of an existing item
router.put("/:id/:uid",AuthUser, updateProduct);

// Remove an item from the database
router.delete("/:id/:uid",AuthUser, removeProduct);

module.exports = router;