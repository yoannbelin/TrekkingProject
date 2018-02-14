var express = require('express');
var router = express.Router();
var logins = require('../controllers/logins.controller');

router.route('/')
    .get(logins.index);

router.route('/:idLogin')
    .get(logins.show);

module.exports = router;