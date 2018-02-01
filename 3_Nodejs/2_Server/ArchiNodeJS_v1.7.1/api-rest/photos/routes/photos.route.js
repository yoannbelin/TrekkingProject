var express = require('express');
var router = express.Router();
var photos = require('../controllers/photos.controller');

router.route('/')
    .get(photos.listCurrentUser)
    .post(photos.create);

router.route('/:idPhoto')
    .get(photos.read)
    .put(photos.update)
    .delete(photos.delete);

module.exports = router;