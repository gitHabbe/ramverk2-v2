var express     = require('express');
var router      = express.Router();
var fs          = require('fs');
const db            = require("../db/database.js");


router.get('/kmom01', async (req, res) => {
    const kmomData = await getReport("kmom01");
    const data = {
        kmomData
    };

    res.status(200).json(data);
});

router.get('/kmom02', async (req, res) => {
    const kmomData = await getReport("kmom02");
    const data = {
        kmomData
    };

    res.status(200).json(data);
});

router.get('/kmom03', async (req, res) => {
    const kmomData = await getReport("kmom03");
    const data = {
        kmomData
    };

    res.status(200).json(data);
});

async function getReport(kmom) {
    return new Promise((resolve, reject) => {
        db.all(
            "SELECT * FROM reports WHERE kmom = ?",
            [ kmom ], (err, data) => {
            if(err) reject("Read error: " + err.message)
            else {
                resolve(data[0])
            }
        })
    });
};

module.exports = router;
