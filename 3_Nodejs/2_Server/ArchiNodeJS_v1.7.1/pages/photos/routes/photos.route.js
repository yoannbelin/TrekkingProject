var express = require('express');
var router = express.Router();
var photos = require('../controllers/photos.controller');

router.route('/')
    .get(photos.index);

router.route('/:idPhoto')
    .get(photos.show);

module.exports = router;