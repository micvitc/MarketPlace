const mongoose = require('mongoose');

const reportSchema = mongoose.Schema(
    {
        serviceType: {
            type:String,
            required:true,
            enum: ['lostandfound','student','seller']
        },
        issueTitle: {
            type: String,
            required: true
        },
        issueDescription: {
            type: String,
            required: true,
        },
        issueCapture: {
            type: Array,
            default: [] 
        },
        resolved: {
            type: Boolean,
            default: false
        },
        created_by: {
            type: String,
            required: true
        },
    },
    {
        timestamps: true
    }
)

const Report = mongoose.model('report', reportSchema);
module.exports = Report;