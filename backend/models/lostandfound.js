const mongoose = require('mongoose');

const lostandfoundSchema = mongoose.Schema(
    {
        name: {
            type:String,
            required:[true, "Please enter a product name"]
        },
        description: {
            type: String,
        },
        // lost = 0, found = 1
        lostorfound: {
            type: Boolean,
            required: true,
            default: 0
        },
        resolved: {
            type: Boolean,
            default: false
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

const LostAndFound = mongoose.model('lostandfound', lostandfoundSchema);
module.exports = LostAndFound;