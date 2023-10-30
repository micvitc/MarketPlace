const express = require("express");
const router = express.Router();
const {getLostAndFoundOfUser,getLostAndFounds,getLostAndFound,createLostAndFound,updatedLostAndFound,deleteLostAndFound,resolveLostAndFound} = require('../controllers/lostandfoundController')
const AuthUser =require('../service/userAuth');

// Fetch all lost and found entries
router.get("/",AuthUser, getLostAndFounds);

// Fetch a single lost and found entry
router.get("/:lostandfoundid",AuthUser, getLostAndFound);

// Fetch user's lost and found entries
router.get("/user/:uid",AuthUser, getLostAndFoundOfUser);

// Create lost and found entry
router.post("/create",AuthUser, createLostAndFound);

// Update lost and found entry
router.put("/:lostandfoundid",AuthUser, updatedLostAndFound);

// Delete lost and found entry
router.delete("/:lostandfoundid",AuthUser, deleteLostAndFound)

// Resolve lost and found
router.put("/resolve/:lostandfoundid",AuthUser, resolveLostAndFound)

module.exports = router;
