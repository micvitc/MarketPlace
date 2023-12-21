const express = require("express");
const router = express.Router();
const AuthUser=require('../service/userAuth');
const {getUsers, getUser, createUser, updateUser, removeUser} = require("../controllers/userController");

// Fetch ALL reports from database
router.get("/",getUsers);
  
// Fetch a single item from database
router.get("/:id",getUser);

// Add a new item to the database
router.post("/create",createUser);
  
// Edit an attribute of an existing item
router.put("/:id",updateUser);

// Remove an item from the database
router.delete("/:id",removeUser);

module.exports = router;