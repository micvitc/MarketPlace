const mongoose = require('mongoose');

const userSchema = mongoose.Schema(
    {
        name: {
            type:String,
            required:[true, "Please enter the user's name"]
        },
        id: {
            type: String,
            required: [true, "Please provide the user id"]
        },
        phoneNo: {
            type: Number,
            required: true
        },
        profilePic: {
            type: String,
        },
        emailId: {
            type: String,
            required: true
        }
    },
    {
        timestamps: true
    }
)

const User = mongoose.model('user', userSchema);

module.exports = User;