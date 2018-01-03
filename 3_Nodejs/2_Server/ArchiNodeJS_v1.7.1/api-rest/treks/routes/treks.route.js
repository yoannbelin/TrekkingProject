var express = require('express');
var router = express.Router();
var treks = require('../controllers/treks.controller');

router.route('/')
    .get(treks.list)
    .post(treks.create);

router.route('/:idTrek')
    .get(treks.read)
    .put(treks.update)
    .delete(treks.delete);

//router.param(':idTrek', trekByID);
module.exports = router;
