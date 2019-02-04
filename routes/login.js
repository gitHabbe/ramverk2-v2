var express     = require('express');
var router      = express.Router();
const bcrypt    = require('bcryptjs');
const sqlite3   = require('sqlite3').verbose();
const db        = new sqlite3.Database('./db/texts.sqlite');
const jwt       = require('jsonwebtoken');

router.post('/', async function(req, res, next) {
    const { email, password } = req.body;
	console.log('​password', password)

    const getUser = (email) => {
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
    const user = await getUser(email);
    if (!user) {
        return res.sendStatus(401);
    }
    const isCorrectPass = await bcrypt.compare(password, user.password);
    if (isCorrectPass) {
        const payload = { "email": email };
        const secret = process.env.JWT_SECRET;
        var token = jwt.sign(payload, secret, { expiresIn: '1h'});
		console.log('​token', token)
        // return token;
        return res.json(token);
    } else {
        return res.status(401);
    }

});

module.exports = router;
