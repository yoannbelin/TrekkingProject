let GpsPointsService = require(__base + 'api-rest/gpsPoints/services/gpsPoints.service');
let GpsPointModel = require(__base + 'api-rest/gpsPoints/models/gpsPoint.model');
let TreksService = require(__base + 'api-rest/treks/services/treks.service');

/**
 * GpsPoints index page
 */
module.exports.index = function (req, res) {
    res.render('gpsPoints/views/index');
}

/**
 * GpsPoint show page
 */
module.exports.show = function (req, res) {
    GpsPointsService.find(req.params.idGpsPoint, (err, gpsPoint) => {
        if (err) {
            console.log(' in pages/gpsPointController :' + err)
            res.end(err)
        }
        else {
            res.render('gpsPoints/views/show', { gpsPoint: gpsPoint });
        }
    });
}
