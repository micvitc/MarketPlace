const Product = require("../models/product");
const User = require("../models/user")

const getProducts = async(req, res) => {
    try {
        const students = await Product.Student.find({})
        res.status(200).json(students);
    } catch (error) {
        console.log(error.message);
        res.status(500).json({message: error.message});
    }
}

const getProduct = async(req, res) => {
    try {
        const { id } = req.params;

        const student = await Product.Student.findById(id);

        if (!student) {
            return res.status(404).json({ message: `Product with ${id} not found` });
          }

        res.status(200).json(student);
    } catch (error) {
        console.log(error.message);
        res.status(500).json({message: error.message});
    }
}

const createProduct = async(req, res) => {
    try {
        const student = await Product.Student.create(req.body);
        res.status(200).json(student);
    } catch (error) {
        console.log(error.message)
        res.status(500).json({message: "Internal Server Error"})
    }
}

const updateProduct = async(req, res) => {
    try {
        const id = req.params.id;
        const uid = req.params.uid;

        const user = await User.findById(uid);
        if(!user){
            return res.status(404).json({message: `Cannot find user with id ${uid}`});
        }
        userType = user['userType'];
        const student = await Product.Student.findById(id);
        if(!student){
            return res.status(404).json({message: `Cannot find product with id ${id}`});
        }
        if((student['created_by']==uid) || (userType == 'admin')){
            await Product.Student.findByIdAndUpdate(id, req.body);
            const updatedStudent = await Product.Student.findById(id);
            return res.status(200).json(updatedStudent);
        }
        return res.status(403).json({message: "You don't have the permission to modify this object"})
    } catch (error) {
        console.log(error.message);
        return res.status(500).json({message: "Internal Server Error"});
    }
}

const removeProduct = async(req, res) => {
    try {
        const id = req.params.id;
        const uid = req.params.uid;

        const user = await User.findById(uid);
        if(!user){
            return res.status(404).json({message: `Cannot find user with id ${uid}`});
        }
        userType = user['userType'];
        const student = await Product.Student.findById(id);
        if(!student){
            return res.status(404).json({message: `Cannot find product with id ${id}`});
        }
        if((student['created_by']==uid) || (userType == 'admin')){
            await Product.Student.findByIdAndDelete(id, req.body);
            const updatedStudent = await Product.Student.findById(id);
            return res.status(200).json(updatedStudent);
        }
        return res.status(403).json({message: "You don't have the permission to delete this object"})
    } catch (error) {
        console.log(error.message);
        return res.status(500).json({message: "Internal Server Error"});
    }
}


module.exports = {getProducts, getProduct, createProduct, updateProduct, removeProduct}