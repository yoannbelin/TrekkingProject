var express = require('express');
var router = express.Router();
var gpsPoints = require('../controllers/gpsPoints.controller');

router.route('/')
    .get(gpsPoints.list)
    .post(gpsPoints.create);

router.route('/:idGpsPoint')
    .get(gpsPoints.read)
    .put(gpsPoints.update)
    .delete(gpsPoints.delete);

//router.param(':idGpsPoint', gpsPointByID);

module.exports = router;
