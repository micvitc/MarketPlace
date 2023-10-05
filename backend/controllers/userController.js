const User = require("../models/user");

const getUsers = async(req, res) => {
    try {
        const users = await User.find({})
        return res.status(200).json(users);
    } catch (error) {
        console.log(error.message);
        return res.status(500).json({message: error.message});
    }
}

const getUser = async(req, res) => {
    try {
        const { id } = req.params;

        const user = await User.findById(id);

        if (!user) {
            return res.status(404).json({ message: `User with ${id} not found` });
          }

        return res.status(200).json(user);
    } catch (error) {
        console.log(error.message);
        return res.status(500).json({message: error.message});
    }
}

const createUser = async(req, res) => {
    try {
        const user = await User.create(req.body);
        return res.status(200).json(user);
    } catch (error) {
        console.log(error.message)
        return res.status(500).json({message: "Internal Server Error"})
    }
}

const updateUser = async(req, res) => {
    try {
        const { id } = req.params;

        const user = await User.findByIdAndUpdate(id, req.body);
        if(!user){
        return res.status(404).json({message: `Cannot find User with id ${id}`});
        }

        const updateduser = await User.findById(id);
        return res.status(200).json(updateduser);
    } catch (error) {
        console.log(error.message);
        return res.status(500).json({message: "Internal Server Error"});
    }
}

const removeUser = async(req, res) => {
    try {
        const { id } = req.params;

        const user = await User.findByIdAndDelete(id);

        if(!user){
            return res.status(404).json({message: `Cannot find User with id ${id}`});
        }

        return res.status(200).json("User removed");
    } catch (error) {
        return res.status(500).json({message: "Internal Server Error"})
    }
}


module.exports = {getUsers, getUser, createUser, updateUser, removeUser}