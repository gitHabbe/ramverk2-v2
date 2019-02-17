const express       = require('express');
const router        = express.Router();
const db            = require("../db/database.js");
const bcrypt        = require('bcryptjs');
const saltRounds    = 10;

router.post('/', async (req, res, next) => {
    const { email, password } = req.body;
    const hashedPassword = await bcrypt.hash(password, saltRounds);
    console.log("/register");
    db.run(
        "INSERT INTO users (email, password) VALUES (?, ?)",
        [ email, hashedPassword ], err => {
            console.log("IN DB");
            if (err) {
                console.log('​err', err)
            } else {
                console.log("user created");
            }
    });

    res.send("ok");
});

module.exports = router;
