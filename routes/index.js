var express     = require('express');
var router      = express.Router();
var fs          = require('fs');
const jwt       = require('jsonwebtoken');
const sqlite3   = require('sqlite3').verbose();
const db        = new sqlite3.Database('./db/texts.sqlite');

router.get('/', function(req, res, next) {
    
    const text = fs.readFileSync("./reports/me.txt", 'utf8');
    const data = {
        data: { text }
    };

    res.json(data);
});

router.get("/jwt_outh", checkToken, (req, res) => {
	console.log('TCL: res', res)
    // return res.sendStatus(200);
    console.log("test");
    // return res.redirect("http://me-react.nhallberg.me/")
    return res.status(200).json();

});

router.post("/reports", checkToken, (req, res) => {
    const { kmom, writer, report } = req.body;
    const newKmom = {
        kmom,
        writer,
        report
    };

    db.run(
        "INSERT INTO reports (kmom, writer, report) VALUES (?, ?, ?)",
        [ kmom, writer, report ], err => {
        if (err) {
            return console.log('​err', err)
        } else {
            return console.log("report created");
        }
    });
    res.status(201).json(newKmom);
});

function checkToken(req, res, next) {
    const token = req.headers['x-access-token'] || req.headers['authorization'];
	console.log('TCL: checkToken -> token', token)

    jwt.verify(token, process.env.JWT_SECRET, (err, decoded) => {
        if (err) {
			// console.log('​checkToken -> err', err);
            res.json({'err': '401'});
        } else {
            res.json({'data': token});
        }
        next();
    });
}

module.exports = router;
