var express = require('express');
var router = express.Router();
var departments = require('../controllers/departments.controller');

router.route('/')
    .get(departments.list)
    .post(departments.create);

router.route('/:idDepartment')
    .get(departments.read)
    .put(departments.update)
    .delete(departments.delete);

//router.param(':idDepartment', departmentByID);

module.exports = router;
