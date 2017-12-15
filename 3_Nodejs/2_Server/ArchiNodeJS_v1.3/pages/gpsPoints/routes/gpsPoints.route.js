var express = require('express');
var router = express.Router();
var gpsPoints = require('../controllers/gpsPoints.controller');

router.route('/')
    .get(gpsPoints.index);

router.route('/:idGpsPoint')
    .get(gpsPoints.show);

module.exports = router;
