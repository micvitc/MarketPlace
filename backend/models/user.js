const mongoose = require('mongoose');

const userSchema = mongoose.Schema(
    {
        name: {
            type:String,
            required:[true, "Please enter the user's name"]
        },
        _id: {
            type: String,
            required: [true, "Please provide the user id"]
        },
        phoneNo: {
            type: Number,
        },
        profilePic: {
            type: String,
        },
        emailId: {
            type: String,
            required: true
        },
        favourites: {
            type: Array,
            default: []
        },
        cart: {
            type: Array,
            default: []
        },
        userType: {
            type: String,
            default: 'user'
        }
    },
    {
        timestamps: true
    }
)

const User = mongoose.model('user', userSchema);

module.exports = User;