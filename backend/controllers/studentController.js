const Product = require("../models/product");

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
        const { id } = req.params;

        const student = await Product.Student.findByIdAndUpdate(id, req.body);
        if(!student){
        res.status(404).json({message: `Cannot find product with id ${id}`});
        }

        const updatedStudent = await Product.Student.findById(id);
        res.status(200).json(updatedStudent);
    } catch (error) {
        console.log(error.message);
        res.status(500).json({message: "Internal Server Error"});
    }
}

const removeProduct = async(req, res) => {
    try {
        const { id } = req.params;

        const student = await Product.Student.findByIdAndDelete(id);

        if(!student){
            res.status(404).json({message: `Cannot find product with id ${id}`});
        }

        res.status(200).json("Product removed");
    } catch (error) {
        res.status(500).json({message: "Internal Server Error"})
    }
}


module.exports = {getProducts, getProduct, createProduct, updateProduct, removeProduct}