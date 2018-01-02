var express = require('express');
var router = express.Router();
var departments = require('../controllers/departments.controller');

router.route('/')
    .get(departments.index);

router.route('/:id')
    .get(departments.show);

module.exports = router;