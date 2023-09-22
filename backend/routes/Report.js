const express = require("express");
const router = express.Router();

const Report = require("../models/report");

// Fetch All reports from database.
router.get("/", async (req, res) => {
  try {
    const reports = await Report.find();
    res.status(200).json(reports);
  } catch (error) {
    console.error(error.message);
    res.status(500).json({ message: "Internal Server Error" });
  }
});

// Fetch a single report from database.
router.get("/:reportId", async (req, res) => {
    try {
      const report = await Report.findById(req.params.reportId);
  
      if (!report) {
        return res.status(404).json({ message: "Report not found" });
      }
  
      res.status(200).json(report);
    } catch (error) {
      console.error(error.message);
      res.status(500).json({ message: "Internal Server Error" });
    }
  });

// Create a new report.
router.post("/create", async (req, res) => {
  try {
    const report = await Report.create(req.body);
    res.status(200).json(report);
  } catch (error) {
    console.error(error.message);
    res.status(500).json({ message: "Couldn't create a new Report." });
  }
});

// Update a report.
router.put("/:reportId", async (req, res) => {
    try {
      const reportId = req.params.reportId;
      const updatedData = req.body;

      const existingReport = await Report.findById(reportId);
  
      if (!existingReport) {
        return res.status(404).json({ message: "Report not found" });
      }
  
      Object.assign(existingReport, updatedData);
      const updatedReport = await existingReport.save();
  
      res.status(200).json(updatedReport);
    } catch (error) {
      console.error(error.message);
      res.status(500).json({ message: "Internal Server Error" });
    }
  });

// Delete a report.
router.delete("/:reportId", async (req, res) => {
    try {
      const reportId = req.params.reportId;  
      const existingReport = await Report.findById(reportId);
  
      if (!existingReport) {
        return res.status(404).json({ message: "Report not found" });
      }
  
      await existingReport.remove();
      res.status(200).json({ message: "Report removed" });
    } catch (error) {
      console.error(error.message);
      res.status(500).json({ message: "Internal Server Error" });
    }
})

// Resolved the report
router.put("/resolve/:reportId", async (req, res) => {
    try {
      const reportId = req.params.reportId;
      const existingReport = await Report.findById(reportId);
  
      if (!existingReport) {
        return res.status(404).json({ message: "Report not found" });
      }
  
      existingReport.resolved = true
      const updatedReport = await existingReport.save();
  
      res.status(200).json(updatedReport);
    } catch (error) {
      console.error(error.message);
      res.status(500).json({ message: "Internal Server Error" });
    }
})

module.exports = router;
