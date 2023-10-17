// Importing necessary modules from firebase-admin
const { initializeApp } = require("firebase-admin/app");
const admin = require("firebase-admin");

// Path to the service account credentials
const serviceAccount = require("./serviceAccountKey.json");

// Initializing the Firebase app with the service account credentials
const firebase=admin.initializeApp({
    credential: admin.credential.cert(serviceAccount),
    storageBucket: 'gs://laundrymama-ace5c.appspot.com'
});







module.exports = firebase;
