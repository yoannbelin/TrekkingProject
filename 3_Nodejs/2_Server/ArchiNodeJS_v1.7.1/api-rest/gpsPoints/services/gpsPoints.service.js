//=========================================================================
// Le service contient le code métier, il doit traiter des données (si besoin)
// et les rendre au controller.
//=========================================================================

let GpsPointsDAO  = require('../dao/gpsPoints.dao.mysql');
let TrekDAO = require('./../dao/gpsPoints.dao.mysql')

class GpsPointsService
{
    static create(gpsPoint, cb) {
        GpsPointsDAO.create(gpsPoint, cb);
    }

    static update(gpsPoint, cb) {
        GpsPointsDAO.update(gpsPoint, cb);
    }

    static delete(id, cb) {
        return GpsPointsDAO.delete(id, (err, gpsPoint) => {
          cb(err, gpsPoint);
        });
    }

    static find(id, cb) {
        return GpsPointsDAO.find(id, (err, gpsPoint) => {
          cb(err, gpsPoint);
        });
    }
    
    static list(cb) {
        return GpsPointsDAO.list(cb);
    }
}
module.exports = GpsPointsService;