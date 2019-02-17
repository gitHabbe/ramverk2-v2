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

    return res.json(data);
});

router.get("/jwt_outh", checkToken, (req, res) => {
	// console.log('TCL: res', res)
    return res.status(200);

});

router.post("/reports", checkToken, (req, res) => {
    const { kmomNum, writer, report } = req.body;
    // res.status(201);
    const newKmom = { kmomNum: "kmom" + kmomNum, writer, report };
    db.run(
        "INSERT INTO reports (kmom, writer, report) VALUES (?, ?, ?)",
        [ "kmom" + kmomNum, writer, report ], err => {
        if (err) {
            return console.log('​err', err)
        } else {
            return console.log("report created");
        }
    });
    return res.status(201);
    // return res;
});

function checkToken(req, res, next) {
    const token = req.headers['x-access-token'] || req.headers['authorization'];
	console.log('TCL: checkToken -> token', token)

    jwt.verify(token, process.env.JWT_SECRET, (err, decoded) => {
        if (err) {
            return res.status(403).json({'err': 403});
        } else {
            res.asdf = "test";
            res.json({'token': token, email: decoded.email});
        }
        next();
    });
}

module.exports = router;
