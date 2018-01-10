//=========================================================================
// Le module DAO contient les requetes pour une base de donnée spécifique.
// Il peut y avoir une DAO MySQL, une DAO PostgreSQL, une DAO Oracle, etc...
// Par la suite il sera facile de switcher de l'une à l'autre sans toucher
// au reste du code de l'application.
//=========================================================================

let db = require(__base + '/config/db')
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
                console.log('mesage inséré : !!' + result.insertId);
            } else { console.log("erreur à l insertion : " + err) }
            cb(err, photo);
        });
    }

    static update(photo, cb) {
        db.query('UPDATE photo SET name = ?, num = ?, WHERE id_photo = ?', [photo.name, photo.num, photo.id], (err) => {
            cb(err, photo);
        });
    }

    static delete(id, cb) {
        db.query('DELETE FROM photo WHERE id_photo = ?', [id], (err) => {
            cb(err);
        });
    }

    static list(cb) {
        console.log("yo");
        db.query('SELECT * FROM photo', (err, rows) => {
            rows = rows || [];
            cb(err, rows.map((row) => {
                return new PhotoModel(row)
            }));
        });
    }

    static find(id, cb) {
        let script = 'SELECT photo.id_photo, photo.name, photo.num'
        script += 'FROM photo '

        db.query(script, [id], (err, rows) => {

            if (rows && rows[0] !== undefined) {
          
                var currentPhoto = new PhotoModel(rows[0])

                cb(err, currentPhoto);
            } else {
                cb('Aucun photo ne correspond à votre requète !')
            }
        });
    }
}
module.exports = PhotosDAO;