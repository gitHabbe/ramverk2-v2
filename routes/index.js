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


router.get("/reports", checkToken, (req, res) => {
    console.log("/reports route with middleware");
    res.sendStatus(200);
});

function checkToken(req, res, next) {
    const token = req.headers['x-access-token'] || req.headers['authorization'];
	// console.log('​checkToken -> req.headers', req.headers)
	console.log('​checkToken -> token', token)
    // next();
    jwt.verify(token, process.env.JWT_SECRET, (err, decoded) => {
		console.log('​jwt.verify -> decoded', decoded)
        if (err) {
			console.log('​checkToken -> err', err);
            return res.sendStatus(401);
        }

        // Valid token send on the request
        next();
    });
}

module.exports = router;
