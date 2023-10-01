const express = require("express");
const router = express.Router();
const {getLostAndFoundOfUser,getLostAndFounds,getLostAndFound,createLostAndFound,updatedLostAndFound,deleteLostAndFound,resolveLostAndFound} = require('../controllers/lostandfoundController')

// Fetch all lost and found entries
router.get("/", getLostAndFounds);

// Fetch a single lost and found entry
router.get("/:lostandfoundid", getLostAndFound);

// Fetch user's lost and found entries
router.get("/user/:uid", getLostAndFoundOfUser);

// Create lost and found entry
router.post("/create", createLostAndFound);

// Update lost and found entry
router.put("/:lostandfoundid", updatedLostAndFound);

// Delete lost and found entry
router.delete("/:lostandfoundid", deleteLostAndFound)

// Resolve lost and found
router.put("/resolve/:lostandfoundid", resolveLostAndFound)

module.exports = router;
