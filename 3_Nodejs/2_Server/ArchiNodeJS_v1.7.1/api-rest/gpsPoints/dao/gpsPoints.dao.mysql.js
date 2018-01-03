//=========================================================================
// Le module DAO contient les requetes pour une base de donnée spécifique.
// Il peut y avoir une DAO MySQL, une DAO PostgreSQL, une DAO Oracle, etc...
// Par la suite il sera facile de switcher de l'une à l'autre sans toucher
// au reste du code de l'application.
//=========================================================================

let db = require(__base + '/config/db')
let GpsPointModel = require('../models/gpsPoint.model');

class GpsPointsDAO {
    static create(gpsPoint, cb) {
        /* let altitude = gpsPoint.altitude || 'null'      => WANTED TO GET A NULL FIELD INSTEAD OF AN EMPTY STRING */

        let script = 'INSERT INTO gps_point (longitude, latitude, altitude) '
        script += 'SELECT * FROM ( SELECT ?,  ?) AS tmp '
        script += 'WHERE NOT EXISTS ( '
        script += 'SELECT longitude, latitude, altitude FROM gps_point '
        script += 'WHERE longitude = ' + gpsPoint.longitude + ' AND latitude = ' + gpsPoint.latitude + ' AND altitude = ' + gpsPoint.altitude
        script += '); '

        db.query(script, [gpsPoint.longitude, gpsPoint.latitude, gpsPoint.altitude], (err, result) => {
            gpsPoint.id = result.insertId;
            if (result) {
                console.log('mesage inséré : !!' + result.insertId)
            } else {
                console.log("erreur à l insertion : " + err)
            }
            cb(err, gpsPoint);
        });
    }

    static update(gpsPoint, cb) {
        db.query('UPDATE gpsPoint SET longitude = ?, latitude = ?, altitude = ?, WHERE id_GPS_point = ?', [gpsPoint.longitude, gpsPoint.latitude, gpsPoint.altitude, gpsPoint.id], (err) => {
            cb(err, gpsPoint);
        });
    }

    static delete(id, cb) {
        db.query('DELETE FROM gpsPoint WHERE id_GPS_point = ?', [id], (err) => {
            cb(err);
        });
    }

    static list(cb) {
        db.query('SELECT * FROM gpsPoint', (err, rows) => {
            rows = rows || [];
            cb(err, rows.map((row) => {
                return new GpsPointModel(row)
            }));
        });
    }

    static find(id, cb) {
        db.query(script, [id], (err, rows) => {

        });
    }
}
module.exports = GpsPointsDAO;