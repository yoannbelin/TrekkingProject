var express = require('express');
var router = express.Router();
var usersControler = require('../controllers/users.controller');

router.route('/')
    .get(usersControler.index);

router.route('/:idUser')
    .get(usersControler.show);

module.exports = router;
