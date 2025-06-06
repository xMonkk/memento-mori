// Import the necessary Firebase modules for Node.js client-side usage
const { initializeApp } = require('firebase/app');
// Import specific functions from the database module
const { getDatabase, ref, get } = require('firebase/database'); // Added ref and get here!

// --- Firebase Configuration ---
// !!! REPLACE WITH YOUR ACTUAL PROJECT'S CONFIG !!!
// Using your details provided earlier
const firebaseConfig = {
    apiKey: "SVRs4vccx77rjKpL8MKQlAigXvkxezGrUdJBe0z7",
    authDomain: "analytics-css.firebaseapp.com",
    databaseURL: "https://analytics-css-default-rtdb.europe-west1.firebasedatabase.app",
    projectId: "analytics-css",
    // You might need other fields from your config object,
    // but these are often sufficient for Realtime Database access
    // storageBucket: "...",
    // messagingSenderId: "...",
    // appId: "..."
};

// Initialize Firebase App
const app = initializeApp(firebaseConfig);

// Get a reference to the Realtime Database service
const database = getDatabase(app);

// --- Get the Key from Command Line Arguments ---
// In Node.js, command line arguments are in process.argv
// process.argv[0] is 'node'
// process.argv[1] is the script file path
// Arguments start from process.argv[2]
const accessKey = process.argv[2]; // Get the first argument after the script name

// --- Database Access Logic ---

console.log("Attempting to load data...");

if (accessKey) {
    console.log(`Using key: ${accessKey}`);

    // Construct the path to the specific data block using the accessKey
    // Assuming your data blocks are stored under the '/Keys' path
    // Use ref() with the database instance and the path string
    const dataRef = ref(database, `Keys/${accessKey}`);

    // Attempt to read the data once using get()
    get(dataRef)
        .then((snapshot) => {
            if (snapshot.exists()) {
                // Data exists AND rules allowed the read
                console.log("Data found:");
                console.log(snapshot.val()); // Log the data value
            } else {
                // Key was provided, but no data exists at that path,
                // OR the rules denied access (which usually triggers the catch block)
                 console.log(`No data found at Keys/${accessKey}, or access denied by rules.`);
            }
        })
        .catch((error) => {
            // This catch block is where Security Rule denials land!
            console.error("Firebase read failed:", error);
            // error.code will be 'PERMISSION_DENIED' if rules blocked it
            // error.message will give more details
            console.error(`Error details: Code - ${error.code}, Message - ${error.message}`);
        });

} else {
    // No key provided in command line arguments
    console.log('Please provide a key as a command line argument (e.g., node your_script_name.js FirstKey)');
}
// --- End Database Access Logic ---

// Note: Node.js scripts usually exit once async operations are complete.
// No need for document manipulation or event listeners like in a browser.
