var express = require('express');
var router  = express.Router();
var fs      = require('fs');

router.get('/kmom01', function(req, res, next) {
    const text = fs.readFileSync("./reports/kmom01.txt", 'utf8')
    const data = {
        data: { text }
    };

    res.json(data);
});

module.exports = router;
