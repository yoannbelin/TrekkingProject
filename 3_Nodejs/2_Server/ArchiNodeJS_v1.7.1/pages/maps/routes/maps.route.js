var express = require('express');
var router = express.Router();
var usersControler = require('../controllers/maps.controller');

router.route('/')
    .get(maps.index);

router.route('/:idMap')
    .get(maps.show);

module.exports = router;