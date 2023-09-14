const mongoose = require('mongoose');

const productSchema = mongoose.Schema(
    {
        name: {
            type:String,
            required:[true, "Please enter a product name"]
        },
        description: {
            type: String,
        },
        quantity: {
            type: Number,
            required: true,
            default: 0
        },
        price: {
            type: Number,
            required: true 
        },
        tags: {
            type: Array,
            default: []
        },
        image: {
            type: Array,
            default: []
        },
        created_by: {
            type: String,
            required: true
        },
        category: {
            type: String,
            required: true
        }
    },
    {
        timestamps: true
    }
)

const Student = mongoose.model('student', productSchema);
const LostandFound = mongoose.model('lostandfound', productSchema);
const Seller = mongoose.model('seller', productSchema);

module.exports = {Student, LostandFound, Seller};