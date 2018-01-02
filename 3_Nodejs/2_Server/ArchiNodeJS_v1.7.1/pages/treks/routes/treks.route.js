var express = require('express');
var router = express.Router();
var treks = require('../controllers/treks.controller');

router.route('/')
    .get(treks.index);

router.route('/:idTrek')
    .get(treks.index);

module.exports = router;