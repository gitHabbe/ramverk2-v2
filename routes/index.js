var express = require('express');
var router  = express.Router();
var fs      = require('fs');
const jwt   = require('jsonwebtoken');

router.get('/', function(req, res, next) {
    
    const text = fs.readFileSync("./reports/me.txt", 'utf8');
    const data = {
        data: { text }
    };

    res.json(data);
});


router.post("/reports", checkToken, (req, res) => {
    const { kmom, data } = req.body;
    const newKmom = {
        kmom,
        data
    };

    // console.log("/reports route with middleware");
	// console.log('​data', data)
    res.status(201).json(newKmom);
});

function checkToken(req, res, next) {
    const token = req.headers['x-access-token'] || req.headers['authorization'];

    jwt.verify(token, process.env.JWT_SECRET, (err, decoded) => {
        if (err) {
			console.log('​checkToken -> err', err);
            return res.sendStatus(401);
        }

        // Valid token send on the request
        next();
    });
}

module.exports = router;
