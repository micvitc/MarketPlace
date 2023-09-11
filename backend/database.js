require('dotenv').config()

let mongoose = require('mongoose')

async function conntectDB(){
    try{
        await mongoose.connect(process.env.MONGO_URI)
        console.log('Database Connected Succesfully');
    }catch(err){
        console.log("MongoDB Couldnt Connect: ",err);
    }
}



module.exports = conntectDB