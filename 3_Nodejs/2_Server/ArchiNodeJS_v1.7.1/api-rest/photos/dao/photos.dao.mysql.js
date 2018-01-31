//=========================================================================
// Le module DAO contient les requetes pour une base de donnée spécifique.
// Il peut y avoir une DAO MySQL, une DAO PostgreSQL, une DAO Oracle, etc...
// Par la suite il sera facile de switcher de l'une à l'autre sans toucher
// au reste du code de l'application.
//=========================================================================

let db = require(__base + '/config/db')
let UserModel = require('../../users/models/user.model');
let PhotoModel = require('../models/photo.model');

class PhotosDAO {
    static create(photo, cb) {

        let script = 'INSERT INTO photo (name , num) '
        script += 'SELECT * FROM ( SELECT ?,  ?) AS tmp '
        script += 'WHERE NOT EXISTS ( '
        script += 'SELECT * FROM photo WHERE (name = ' + photo.name + ') AND (num = ' + photo.num + ') '
        script += '); '

        db.query(script, [photo.name, photo.num], (err, result) => {
            photo.id = result.insertId;
            if (result) {
                console.log('message inséré : !!' + result.insertId);
            } else { console.log("erreur à l insertion : " + err) }
            cb(err, photo);
        });
    }

    static update(photo, cb) {
        console.log("!!!" + photo.id);
        console.log("???" + JSON.stringify(photo));

        let id = photo.id;

        let script = 'UPDATE photo SET title = ?, url = ?, private = ? '
        script += 'WHERE id_photo = ' + id + ';'

        db.query(script, [photo.title, photo.url, photo.private], (err) => {
            cb(err, photo);
        });
    }

    static delete(id, cb) {
        /* Quand ajout commentaires faire une procédure stockée pour supprimer de la table 'user_comment_photos' avant de supprimer la photo*/
        db.query('DELETE FROM photo WHERE id_photo = ?', [id], (err) => {
            cb(err);
        });
    }

    static list(cb) {

        let script = 'SELECT * FROM photo '
        script += 'JOIN user ON photo.id_user = user.id_user '
        script += 'JOIN trek ON trek.id_trek = photo.id_trek '
        script += 'WHERE user.id_user = ? '
        script += 'ORDER BY photo.date_photo '

        console.log('script = ' + script);

        db.query(script, [6], (err, rows) => {
            rows = rows || [];
            cb(err, rows.map((row) => {
                console.log('#' + row);
                return new PhotoModel(row)
            }));
        });
    }

    static listByUserID(idUser, cb) {

        let script = 'SELECT * FROM photo '
        script += 'JOIN user ON photo.id_user = user.id_user '
        script += 'JOIN trek ON trek.id_trek = photo.id_trek '
        script += 'WHERE user.id_user = ? '
        script += 'ORDER BY photo.date_photo '

        console.log('script = ' + script);

        db.query(script, [idUser], (err, rows) => {
            rows = rows || [];
            cb(err, rows.map((row) => {
                console.log('#' + row);
                return new PhotoModel(row)
            }));
        });
    }

    static find(id, cb) {

        console.log(id);

        let script = 'SELECT * FROM photo '
        script += 'WHERE id_photo = ?'

        db.query(script, [id], (err, rows) => {

            if (rows && rows[0] !== undefined) {

                var currentPhoto = new PhotoModel(rows[0])

                cb(err, currentPhoto);
            } else {
                cb('Aucune photo ne correspond à votre requète !')
            }
        });
    }
}
module.exports = PhotosDAO;