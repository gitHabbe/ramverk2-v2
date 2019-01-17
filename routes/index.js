var express = require('express');
var router  = express.Router();
var fs      = require('fs');

router.get('/', function(req, res, next) {
    const text = fs.readFileSync("./reports/me.txt", 'utf8');
    const data = {
        data: { text }
    };

    res.json(data);
});

module.exports = router;
