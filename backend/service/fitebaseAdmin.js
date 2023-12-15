const admin = require('firebase-admin');

const serviceAccount = require('./vit-marketplace-adminSdk.json');

const databaseURL = 'https://console.firebase.google.com/project/vit-marketplace-5c31b/database/vit-marketplace-5c31b-default-rtdb/data/~2F';

admin.initializeApp({
  credential: admin.credential.cert(serviceAccount),
  databaseURL: databaseURL,
});

const db = admin.firestore();

module.exports = db;
