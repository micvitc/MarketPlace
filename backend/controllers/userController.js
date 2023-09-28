const User = require("../models/user");

const getUsers = async(req, res) => {
    try {
        const users = await User.find({})
        res.status(200).json(users);
    } catch (error) {
        console.log(error.message);
        res.status(500).json({message: error.message});
    }
}

const getUser = async(req, res) => {
    try {
        const { id } = req.params;

        const user = await User.findById(id);

        if (!user) {
            return res.status(404).json({ message: `User with ${id} not found` });
          }

        res.status(200).json(user);
    } catch (error) {
        console.log(error.message);
        res.status(500).json({message: error.message});
    }
}

const createUser = async(req, res) => {
    try {
        const user = await User.create(req.body);
        res.status(200).json(user);
    } catch (error) {
        console.log(error.message)
        res.status(500).json({message: "Internal Server Error"})
    }
}

const updateUser = async(req, res) => {
    try {
        const { id } = req.params;

        const user = await User.findByIdAndUpdate(id, req.body);
        if(!user){
        res.status(404).json({message: `Cannot find User with id ${id}`});
        }

        const updateduser = await User.findById(id);
        res.status(200).json(updateduser);
    } catch (error) {
        console.log(error.message);
        res.status(500).json({message: "Internal Server Error"});
    }
}

const removeUser = async(req, res) => {
    try {
        const { id } = req.params;

        const user = await User.findByIdAndDelete(id);

        if(!user){
            res.status(404).json({message: `Cannot find User with id ${id}`});
        }

        res.status(200).json("User removed");
    } catch (error) {
        res.status(500).json({message: "Internal Server Error"})
    }
}


module.exports = {getUsers, getUser, createUser, updateUser, removeUser}