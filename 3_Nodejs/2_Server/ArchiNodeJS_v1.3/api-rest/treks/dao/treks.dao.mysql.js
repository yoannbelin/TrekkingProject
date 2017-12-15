//=========================================================================
// Le module DAO contient les requetes pour une base de donnée spécifique.
// Il peut y avoir une DAO MySQL, une DAO PostgreSQL, une DAO Oracle, etc...
// Par la suite il sera facile de switcher de l'une à l'autre sans toucher
// au reste du code de l'application.
//=========================================================================

let db = require(__base + '/config/db')
let TrekModel = require('../models/trek.model');
let GpsPointModel = require('../../gpsPoints/models/gpsPoint.model');


class TreksDAO {
    static create(trek, cb) {
        db.query('INSERT INTO trek SET length = ?, auteur = ?, create_at = ?', [trek.content, trek.auteur, new Date()], (err, result) => {
            trek.id = result.insertId;
            if (result) { console.log('mesage inséré : !!' + result.insertId) } else { console.log("erreur à l insertion : " + err) }
            cb(err, trek);
        });
    }

    static update(trek, cb) {
        db.query('UPDATE trek SET content = ?, WHERE id = ?', [trek.content, trek.id], (err) => {
            cb(err, trek);
        });
    }

    static delete(id, cb) {
        db.query('DELETE FROM trek WHERE id = ?', [id], (err) => {
            cb(err);
        });
    }

    static list(cb) {
        // OUUUUUUUUUUUUUUUUUUUUUUUULALALAAAAAAAAAAAAAAAAA
        let script = 'SELECT Trek.id_trek, Trek.label FROM Trek'
        script += 'JOIN User_do_Trek ON Trek.id_trek = User_do_Trek.id_trek'
        script += 'JOIN User ON User_do_Trek.id_user = User.id_user'
        script += 'WHERE User.id_user = 1'
        script += 'UNION'
        script += 'SELECT Trek.id_trek, Trek.label FROM Trek'
        script += 'WHERE Trek.id_trek_1 is null'
        db.query(script, (err, rows) => {
            rows = rows || [];
            cb(err, rows.map((row) => {
                return new TrekModel(row)
            }));
        });
    }

    static find(id, cb) {
        let script = 'SELECT * FROM GPS_point '
        script += 'JOIN Trek_has_GPS_point ON GPS_point.id_GPS_point =  '
        script += 'Trek_has_GPS_point.id_GPS_point '
        script += 'JOIN Trek ON Trek_has_GPS_point.id_Trek = Trek.id_trek AND Trek.id_trek = 3 '
        script += 'ORDER BY GPS_point.latitude';

        db.query(script, [id], (err, rows) => {

            if (rows && rows[0] !== undefined) {
                var enreg = rows[0]

                var userAuthor = {
                    id: enreg.idAuthor,
                    firstname: enreg.firstname,
                    lastname: enreg.lastname,
                    age: enreg.age,
                    created_at: enreg.created_at
                }

                var currentTrek = new TrekModel(rows[0])
                currentTrek.setAuthor(new UserModel(userAuthor))

                cb(err, currentTrek);
            } else {
                cb('Aucun trek ne correspond à votre requète !')
            }
        });
    }
}

module.exports = TreksDAO;