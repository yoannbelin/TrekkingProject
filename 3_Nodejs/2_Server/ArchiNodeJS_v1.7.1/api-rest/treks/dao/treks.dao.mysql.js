//=========================================================================
// Le module DAO contient les requetes pour une base de donnée spécifique.
// Il peut y avoir une DAO MySQL, une DAO PostgreSQL, une DAO Oracle, etc...
// Par la suite il sera facile de switcher de l'une à l'autre sans toucher
// au reste du code de l'application.
//=========================================================================

let db = require(__base + '/config/db')
let TrekModel = require('../models/trek.model');


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

        let script = '';
        script += 'SELECT trek.id_trek, trek.label, trek.length, trek.time, trek.level, trek.pathway, trek.official FROM trek '
        script += 'WHERE trek.official = 1 '
        script += 'UNION '
        script += 'SELECT trek.id_trek, trek.label, trek.length, trek.time, trek.level, trek.pathway, trek.official FROM trek '
        script += 'JOIN user_do_trek ON trek.id_Trek = user_do_trek.id_Trek '
        script += 'JOIN user ON user_do_trek.id_User = user.id_User '
        script += 'WHERE user.id_User = 3 ' //a modifier en variable de session

        db.query(script, (err, rows) => {
            rows = rows || [];
            cb(err, rows.map((row) => {
                return new TrekModel(row)
            }));
        });
    }

    static find(id, cb) {
        let script = 'SELECT * FROM trek'
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