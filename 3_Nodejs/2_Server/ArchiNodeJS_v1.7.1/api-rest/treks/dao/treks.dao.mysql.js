//=========================================================================
// Le module DAO contient les requetes pour une base de donnée spécifique.
// Il peut y avoir une DAO MySQL, une DAO PostgreSQL, une DAO Oracle, etc...
// Par la suite il sera facile de switcher de l'une à l'autre sans toucher
// au reste du code de l'application.
//=========================================================================

let db = require(__base + '/config/db')
let TrekModel = require('../models/trek.model');

let GpsPointsDao = require('../../gpsPoints/dao/gpsPoints.dao.mysql')


class TreksDAO {
    static create(trek, cb) {

        trek.length = trek.length || null;
        trek.level = trek.level || null;
        trek.label = trek.label || null;

        console.log("trek object" + trek.pathway);

        let script = 'CALL trek_all (?, ?, ?, ?, ?); ';

        db.query(script, [3, trek.label, trek.length, trek.level, JSON.stringify(trek.pathway)], (err, result) => { // id_user à mettre en variables
            trek.id = result.insertId;
            if (result) {
                console.log('message inséré : !!' + result.insertId);

            } else {
                console.log("erreur à l insertion : " + err)
            }
        });
    }

    static update(trek, cb) {
        db.query('UPDATE trek SET name = ?, num = ?, WHERE id_trek = ?', [trek.name, trek.num, trek.id], (err) => {
            cb(err, trek);
        });
    }

    static delete(id, cb) {
        db.query('DELETE FROM trek WHERE id_trek = ?', [id], (err) => {
            cb(err);
        });
    }

    static list(cb) {
        db.query('SELECT * FROM trek', (err, rows) => {
            rows = rows || [];
            cb(err, rows.map((row) => {
                return new TrekModel(row)
            }));
        });
    }

    static find(id, cb) {
        let script = 'SELECT *FROM trek'
            // script += 'JOIN trek '
            // script += 'WHERE trek.id = ? AND trek.idauthor = trek.id LIMIT 1';

        db.query(script, [id], (err, rows) => {

            if (rows && rows[0] !== undefined) {

                var currentTrek = new TrekModel(rows[0])

                cb(err, currentTrek);
            } else {
                cb('Aucun trek ne correspond à votre requête !')
            }
        });
    }
}
module.exports = TreksDAO;