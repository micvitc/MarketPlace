const jwt=require("jsonwebtoken");

function AuthUser(req, res, next){
  const token = req.headers.authorization; // Assuming the token is sent in the "Authorization" header
  const secret = 'MYWEBTOKEN'; // Replace with your actual secret

  jwt.verify(token, secret, (err, decoded) => {
    if (err) {
      return res.status(401).json({ message: 'Unauthorized' });
    }

    // If the token is valid, store the user data in the request for later use
    req.user = decoded;

    // Continue to the next middleware or route handler
    next();
  });
};

