const express = require("express");
const router = express.Router();

const LostAndFound = require("../models/lostandfound");

// Fetch all lost and found entries
router.get("/", async (req, res) => {
  try {
    const LostAndFounds = await LostAndFound.find();
    res.status(200).json(LostAndFounds);
  } catch (error) {
    console.error(error.message);
    res.status(500).json({ message: "Internal Server Error" });
  }
});

// Create lost and found entry
router.post("/create", async (req, res) => {
  try {
    const result = await LostAndFound.create(req.body);
    res.status(200).json(result);
  } catch (error) {
    console.log(error.message);
    res.status(500).json({ message: error.message });
  }
});

// Update lost and found entry
router.put("/:lostandfoundid", async (req, res) => {
  try {
    const lostandfoundid = req.params.lostandfoundid;
    const updatedData = req.body;

    const existingLostAndFound = await LostAndFound.findById(lostandfoundid);

    if (!existingLostAndFound) {
      return res.status(404).json({ message: "LostAndFound not found" });
    }

    Object.assign(existingLostAndFound, updatedData);
    const updatedLostAndFound = await existingLostAndFound.save();

    res.status(200).json(updatedLostAndFound);
  } catch (error) {
    console.error(error.message);
    res.status(500).json({ message: "Internal Server Error" });
  }
});

// Delete lost and found entry
router.delete("/:lostandfoundid", async (req, res) => {
    try {
      const lostandfoundid = req.params.lostandfoundid;  
      const existingLostAndFound = await LostAndFound.findByIdAndRemove(lostandfoundid);
  
    //   if (!existingLostAndFound) {
    //     return res.status(404).json({ message: "LostAndFound not found" });
    //   }
  
    //   await existingLostAndFound.remove();
      res.status(200).json({ message: "LostAndFound deleted", existingLostAndFound });
    } catch (error) {
      console.error(error.message);
      res.status(500).json({ message: "Internal Server Error" });
    }
})

// Resolve lost and found
router.put("/resolve/:lostandfoundid", async (req, res) => {
    try {
      const lostandfoundid = req.params.lostandfoundid;
      const existingLostAndFound = await LostAndFound.findById(lostandfoundid);
  
      if (!existingLostAndFound) {
        return res.status(404).json({ message: "Lost And Found item not found" });
      }
  
      existingLostAndFound.resolved = true
      const updatedLostAndFound = await existingLostAndFound.save();
  
      res.status(200).json(updatedLostAndFound);
    } catch (error) {
      console.error(error.message);
      res.status(500).json({ message: "Internal Server Error" });
    }
})

module.exports = router;
