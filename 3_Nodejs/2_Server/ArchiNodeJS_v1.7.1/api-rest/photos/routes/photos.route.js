var express = require('express');
var router = express.Router();
var photos = require('../controllers/photos.controller');

router.route('/')
<<<<<<< HEAD
<<<<<<< HEAD
    .get(photos.list)
=======
    .get(photos.listCurrentUser)
>>>>>>> master
=======
    .get(photos.listCurrentUser)
>>>>>>> master
    .post(photos.create);

router.route('/:idPhoto')
    .get(photos.read)
    .put(photos.update)
    .delete(photos.delete);

<<<<<<< HEAD
//router.param(':idPhoto', photoByID);    
=======
>>>>>>> master
module.exports = router;