var express = require('express');
var router = express.Router();
var signups = require('../controllers/signups.controller');

router.route('/')
    .get(signups.index);

router.route('/:idSignup')
    .get(signups.show);

module.exports = router;