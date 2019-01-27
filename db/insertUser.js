const sqlite3   = require('sqlite3').verbose();
const db        = new sqlite3.Database('./texts.sqlite');

db.run("INSERT INTO users (email, password) VALUES (?, ?)",
    ["user@example.com",
    "superlonghashedpasswordthatwewillseehowtohashinthenextsection"], (err) => {
    if (err) {
	    console.log('​err', err)
    }
    console.log('inserted');
    // returnera korrekt svar
});
