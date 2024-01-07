const db = require('./firebaseAdmin'); 
const checkEmailInDb = async (req, res, next) => {
  
    try {
      const { email } = req.query;
      const userSnapshot = await db.collection('users').where('Email', '==', email).get();
      if (userSnapshot.size===0) {
        req.body.userExists = false;
        console.log("user doesnt exist") 
        next(); 
      } else {
        req.body.userExists = true; 
        console.log("found Email")
        next(); 
      }
    }
    catch(err){
      res.send(`Error:${err}`);  
    } 
}        

module.exports=checkEmailInDb;
