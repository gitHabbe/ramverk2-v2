const express   = require('express');
const router    = express.Router();
const sqlite3   = require('sqlite3').verbose();
const db        = new sqlite3.Database('./db/texts.sqlite');
const bcrypt = require('bcrypt');
const saltRounds = 10;

router.post('/', async (req, res, next) => {
    const { email, password } = req.body;
    const hashedPassword = await bcrypt.hash(password, saltRounds);
    db.run(
        "INSERT INTO users (email, password) VALUES (?, ?)",
        [ email, hashedPassword ], err => {
        if (err) {
            return console.log('​err', err)
        } else {
            return console.log("user created");
        }
    });

    res.send("ok");
});

module.exports = router;
