var express = require('express');
var router = express.Router();
var showTreks = require('../controllers/showTreks.controller');

router.route('/')
    .get(showTreks.index);

router.route('/:idShowTrek')
    .get(showTreks.index);

module.exports = router;