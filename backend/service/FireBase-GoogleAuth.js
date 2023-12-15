const db = require('./firebaseAdmin'); 
const checkEmailInDb = async (req, res, next) => {
    try {
      const { email } = req.body;
      const userSnapshot = await db.collection('users').where('email', '==', email).get();
      if (userSnapshot.empty) {
        req.body.userExists = false; 
        next(); 
      } else {
        req.body.userExists = true; 
        next(); 
      }
    }
    catch(err){
      res.send(`Error:${err}`);  
    } 
}        

module.exports=checkEmailInDb;
