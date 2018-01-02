//=========================================================================
// Le module DAO contient les requetes pour une base de donnée spécifique.
// Il peut y avoir une DAO MySQL, une DAO PostgreSQL, une DAO Oracle, etc...
// Par la suite il sera facile de switcher de l'une à l'autre sans toucher
// au reste du code de l'application.
//=========================================================================

let db = require(__base + '/config/db')
let UserModel = require('../models/user.model');

class UsersDAO {
    static create(user, cb) {
        console.log(user.mail);

        let script = 'INSERT INTO user ( firstname, lastname, username, password, mail, active, created_at ) '
        script += 'SELECT * FROM ( SELECT ?, ?, ?, ?, ?, ?, ?) AS tmp '
        script += 'WHERE NOT EXISTS ( '
        script += 'SELECT * FROM user WHERE username = ' + user.username
            // script += 'SELECT * FROM user WHERE mail = mysql_real_escape_string($' + user.mail + ')'
        script += '); '

        db.query(script, [user.firstname, user.lastname, user.username, user.password, user.mail, user.active, new Date()], (err, result) => {
            user.id = result.insertId;
            console.log("adding script");
            if (result) {
                // user.id = result.insertId;
                console.log('mesage inséré : !!' + result.insertId);
            } else { console.log("erreur à l insertion : " + err) }
            cb(err, user);
        });
    }

    static update(user, cb) {
        db.query('UPDATE user SET name = ?, num = ?, WHERE id_user = ?', [user.name, user.num, user.id], (err) => {
            cb(err, user);
        });
    }

    static delete(id, cb) {
        db.query('DELETE FROM user WHERE id_user = ?', [id], (err) => {
            cb(err);
        });
    }

    static list(cb) {
        db.query('SELECT * FROM user', (err, rows) => {
            rows = rows || [];
            cb(err, rows.map((row) => {
                return new UserModel(row)
            }));
        });
    }

    static find(id, cb) {
        let script = 'SELECT user.id_user, user.name, user.num'
        script += 'FROM user '

        db.query(script, [id], (err, rows) => {

            if (rows && rows[0] !== undefined) {
                var currentUser = new UserModel(rows[0])

                cb(err, currentUser);
            } else {
                cb('Aucun user ne correspond à votre requète !')
            }
        });
    }
}
module.exports = UsersDAO;