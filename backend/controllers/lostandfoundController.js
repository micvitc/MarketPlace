const LostAndFound = require("../models/lostandfound");

const getLostAndFounds = async (req, res) => {
  try {
    const LostAndFounds = await LostAndFound.find();
    res.status(200).json(LostAndFounds);
  } catch (error) {
    console.error(error.message);
    res.status(500).json({ message: "Internal Server Error" });
  }
};

const getLostAndFound = async (req, res) => {
  try {
    const lostandfoundid = req.params.lostandfoundid;
    const existingLostAndFound = await LostAndFound.findById(lostandfoundid);

    if (!existingLostAndFound) {
      return res.status(404).json({ message: "LostAndFound not found" });
    }

    res.status(200).json(existingLostAndFound);
  } catch (error) {
    console.error(error.message);
    res.status(500).json({ message: "Internal Server Error" });
  }
};

const getLostAndFoundOfUser = async (req, res) => {
    try {
        const uid = req.params.uid;
        const existingLostAndFound = await LostAndFound.find({ created_by: uid });
    
        if (!existingLostAndFound) {
        return res.status(404).json({ message: "No LostAndFound Found." });
        }
    
        res.status(200).json(existingLostAndFound);
    } catch (error) {
        console.error(error.message);
        res.status(500).json({ message: "Internal Server Error" });
    }
}

const createLostAndFound = async (req, res) => {
  try {
    const result = await LostAndFound.create(req.body);
    res.status(200).json(result);
  } catch (error) {
    console.log(error.message);
    res.status(500).json({ message: error.message });
  }
};

const updatedLostAndFound = async (req, res) => {
  try {
    const lostandfoundid = req.params.lostandfoundid;
    const UID = req.body.uid;
    const updatedData = req.body;

    const existingLostAndFound = await LostAndFound.findById(lostandfoundid);
    if (!existingLostAndFound) {
      return res.status(404).json({ message: "LostAndFound not found" });
    } else if (existingLostAndFound.created_by !== UID) {
      return res.status(401).json({ message: "Not Authorized" });
    } else {
      Object.assign(existingLostAndFound, updatedData);
      const updatedLostAndFound = await existingLostAndFound.save();

      res.status(200).json(updatedLostAndFound);
    }
  } catch (error) {
    console.error(error.message);
    res.status(500).json({ message: "Internal Server Error" });
  }
};

const deleteLostAndFound = async (req, res) => {
  try {
    const lostandfoundid = req.params.lostandfoundid;
    const UID = req.body.uid;
    
    const existingLostAndFound = await LostAndFound.findById(lostandfoundid);

    if (!existingLostAndFound) {
        return res.status(404).json({ message: "LostAndFound not found" });
    }else if (existingLostAndFound.created_by !== UID) {
        return res.status(401).json({ message: "Not Authorized" });
    }else{
        await existingLostAndFound.remove();
        res.status(200).json({ message: "LostAndFound deleted", existingLostAndFound });
    } 

    res
      .status(200)
      .json({ message: "LostAndFound deleted", existingLostAndFound });
  } catch (error) {
    console.error(error.message);
    res.status(500).json({ message: "Internal Server Error" });
  }
};

const resolveLostAndFound = async (req, res) => {
  try {
    const lostandfoundid = req.params.lostandfoundid;
    const existingLostAndFound = await LostAndFound.findById(lostandfoundid);

    if (!existingLostAndFound) {
      return res.status(404).json({ message: "Lost And Found item not found" });
    }

    existingLostAndFound.resolved = true;
    const updatedLostAndFound = await existingLostAndFound.save();

    res.status(200).json(updatedLostAndFound);
  } catch (error) {
    console.error(error.message);
    res.status(500).json({ message: "Internal Server Error" });
  }
};

module.exports = {
  getLostAndFounds,
  getLostAndFound,
  createLostAndFound,
  updatedLostAndFound,
  deleteLostAndFound,
  resolveLostAndFound,
  getLostAndFoundOfUser
};
