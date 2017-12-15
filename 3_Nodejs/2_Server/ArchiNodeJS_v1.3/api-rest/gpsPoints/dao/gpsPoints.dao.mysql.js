//=========================================================================
// Le module DAO contient les requetes pour une base de donnée spécifique.
// Il peut y avoir une DAO MySQL, une DAO PostgreSQL, une DAO Oracle, etc...
// Par la suite il sera facile de switcher de l'une à l'autre sans toucher
// au reste du code de l'application.
//=========================================================================

let db = require(__base + '/config/db')
let GpsPointModel = require('../models/gpsPoint.model');
let UserModel = require('../../users/models/user.model');


class GpsPointsDAO {
    static create(gpsPoint, cb) {
        db.query('INSERT INTO gpsPoint SET longitude = ?, latitude = ?, altitude = ?', [gpsPoint.longitude, gpsPoint.latitude, gpsPoint.altitude], (err, result) => {
            gpsPoint.id = result.insertId;
            if (result) { console.log('mesage inséré : !!' + result.insertId) } else { console.log("erreur à l insertion : " + err) }
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
        // let script = 'SELECT gpsPoint.id, user.lastname, user.firstname, gpsPoint.create_at, gpsPoint.content, user.created_at, user.age, user.id AS idAuthor '
        // script += 'FROM gpsPoint '
        // script += 'JOIN user '
        // script += 'WHERE gpsPoint.id = ? AND gpsPoint.idauthor = user.id LIMIT 1';

        db.query(script, [id], (err, rows) => {

            // if (rows && rows[0] !== undefined) {
            //     var enreg = rows[0]

            //     var userAuthor = {
            //         id: enreg.idAuthor,
            //         firstname: enreg.firstname,
            //         lastname: enreg.lastname,
            //         age: enreg.age,
            //         created_at: enreg.created_at
            //     }

            //     var currentGpsPoint = new GpsPointModel(rows[0])
            //     currentGpsPoint.setAuthor(new UserModel(userAuthor))

            //     cb(err, currentGpsPoint);
            // } else {
            //     cb('Aucun gpsPoint ne correspond à votre requète !')
            // }
        });
    }
}

module.exports = GpsPointsDAO;