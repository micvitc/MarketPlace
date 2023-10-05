const Product = require("../models/product");
const User = require("../models/user")

const getProducts = async(req, res) => {
    try {
        const sellers = await Product.Seller.find({})
        res.status(200).json(sellers);
    } catch (error) {
        console.log(error.message);
        res.status(500).json({message: error.message});
    }
}

const getProduct = async(req, res) => {
    try {
        const { id } = req.params;

        const seller = await Product.Seller.findById(id);

        if (!seller) {
            return res.status(404).json({ message: `Product with ${id} not found` });
          }

        res.status(200).json(seller);
    } catch (error) {
        console.log(error.message);
        res.status(500).json({message: error.message});
    }
}

const createProduct = async(req, res) => {
    try {
        const seller = await Product.Seller.create(req.body);
        res.status(200).json(seller);
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
        const seller = await Product.Seller.findById(id);
        if(!seller){
            return res.status(404).json({message: `Cannot find product with id ${id}`});
        }
        if((seller['created_by']==uid) || (userType == 'admin')){
            await Product.Seller.findByIdAndUpdate(id, req.body);
            const updatedSeller = await Product.Seller.findById(id);
            return res.status(200).json(updatedSeller);
        }
        return res.status(403).json({message: "You don't have the permission to modify the object"})
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
        const seller = await Product.Seller.findById(id);
        if(!seller){
            return res.status(404).json({message: `Cannot find product with id ${id}`});
        }
        if((seller['created_by']==uid) || (userType == 'admin')){
            await Product.Seller.findByIdAndDelete(id, req.body);
            const updatedSeller = await Product.Seller.findById(id);
            return res.status(200).json(updatedSeller);
        }
        return res.status(403).json({message: "You don't have the permission to delete the object"})
    } catch (error) {
        console.log(error.message);
        return res.status(500).json({message: "Internal Server Error"});
    }
}


module.exports = {getProducts, getProduct, createProduct, updateProduct, removeProduct}