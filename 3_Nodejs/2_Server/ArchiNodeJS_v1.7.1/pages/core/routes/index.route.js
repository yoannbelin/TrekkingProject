var express = require('express');
var router = express.Router();

/* GET home page. */
router.get('/', function(req, res, next) {
  res.render('core/views/index', { title: 'tuto  CRUD lessive AJAX' });
});

module.exports = router;