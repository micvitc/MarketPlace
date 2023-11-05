const express = require("express");
const router = express.Router();
const AuthUser=require('../service/userAuth');
const {getUsers, getUser, createUser, updateUser, removeUser} = require("../controllers/userController");

// Fetch ALL reports from database
router.get("/",AuthUser, getUsers);
  
// Fetch a single item from database
router.get("/:id",AuthUser, getUser);

// Add a new item to the database
router.post("/create",AuthUser, createUser);
  
// Edit an attribute of an existing item
router.put("/:id",AuthUser, updateUser);

// Remove an item from the database
router.delete("/:id",AuthUser, removeUser);

module.exports = router;