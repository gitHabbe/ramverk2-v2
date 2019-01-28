var express     = require('express');
var router      = express.Router();
const bcrypt    = require('bcrypt');
const sqlite3   = require('sqlite3').verbose();
const db        = new sqlite3.Database('./db/texts.sqlite');

router.post('/', async function(req, res, next) {
    const { email, password } = req.body;

    const getUser = () => {
        return new Promise((resolve, reject) => {
            db.all(
                "SELECT * FROM users WHERE email = ?",
                [ email ], (err, data) => {
                if(err) reject("Read error: " + err.message)
                else {
                    resolve(data[0])
                }
            })
        });
    };
    const user = await getUser();
    const isCorrectPass = await bcrypt.compare(password, user.password);
    res.send("ok");
});

module.exports = router;
