var express = require('express');
var router = express.Router();
var treks = require('../controllers/treks.controller');

router.route('/')
    .get(treks.listCurrentUser)
    .post(treks.create);

router.route('/:idTrek')
    .get(treks.read)
    .put(treks.update)
    .delete(treks.delete);

module.exports = router;