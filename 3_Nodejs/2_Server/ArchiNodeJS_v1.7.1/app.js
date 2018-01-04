var express = require('express');
var session = require('express-session');
var path = require('path');
var logger = require('morgan');
var bodyParser = require('body-parser');

var app = express();

// set global variable for root directory
global.__base = __dirname + '/';

// view engine setup
app.set('views', path.join(__dirname, 'pages'));
app.set('view engine', 'jade');
app.locals.basedir = path.join(__dirname, 'pages');

// middlewares
app.use(logger('dev'));
app.use('/src', express.static('src'));
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: false }));

app.use(session({
    secret: 'keyboard cat',
    resave: false,
    saveUninitialized: true,
    cookie: { secure: false }
}));

app.use('/assets', express.static('public'));

// api-rest routes
app.use('/api-rest/users', require('./api-rest/users/routes/users.route'));
app.use('/api-rest/departments', require('./api-rest/departments/routes/departments.route'));
app.use('/api-rest/gpspoints', require('./api-rest/gpspoints/routes/gpspoints.route'));
app.use('/api-rest/treks', require('./api-rest/treks/routes/treks.route'));

// pages routes
app.use('/', require('./pages/core/routes/index.route'));
app.use('/users', require('./pages/users/routes/users.route'));
app.use('/departments', require('./pages/departments/routes/departments.route'));
app.use('/gpspoints', require('./pages/gpspoints/routes/gpspoints.route'));
app.use('/treks', require('./pages/treks/routes/treks.route'));
app.use('/showTreks', require('./pages/showTreks/routes/showTreks.route'));

// catch 404 and forward to error handler
app.use(function(req, res, next) {
    var err = new Error('Not Found')
    err.status = 404
    next()
});

// error handler
app.use(function(err, req, res, next) {
    res.locals.cairn = err.cairn;
    res.locals.error = req.app.get('env') === 'development' ? err : {};
    res.status(err.status || 500);
    res.redirect('/')
});
module.exports = app;