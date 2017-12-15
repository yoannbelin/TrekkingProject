//=========================================================================
// Le module DAO contient les requetes pour une base de donnée spécifique.
// Il peut y avoir une DAO MySQL, une DAO PostgreSQL, une DAO Oracle, etc...
// Par la suite il sera facile de switcher de l'une à l'autre sans toucher
// au reste du code de l'application.
//=========================================================================

let db = require(__base + 'config/db')
let UserModel = require('../models/user.model');


class UsersDAO {
  static create(user, cb) {
    db.query('INSERT INTO user SET firstname = ?, lastname = ?, age = ?, created_at = ?', [user.firstname, user.lastname, user.age, new Date()], (err, result) => {
      if (result)
        user.id = result.insertId;
      else
        console.log(err);

      cb(err, user);
    });
  }

  static update(user, cb) {
    db.query('UPDATE user SET firstname = ?, lastname = ?, age = ? WHERE id = ?', [user.firstname, user.lastname, user.age, user.id], (err) => {
      cb(err, user);
    });
  }

  static delete(id, cb) {
    db.query('DELETE FROM user WHERE id = ?', [id], (err) => {
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
    console.log('in UsersDAO::find')

    let script = 'SELECT user.id, user.lastname, user.firstname, user.age, user.created_at, cairn.content '
    script += 'FROM user '
    script += 'JOIN cairn '
    script += 'WHERE cairn.idauthor = ? AND cairn.idauthor = user.id';

    db.query(script, [id], (err, rows) => {

      if (rows) {
        if (rows[0] !== undefined) {
          console.log('in UsersDAO : rslt OK');
          cb(err, new UserModel(rows[0]));
        }
        else{
          cb('Aucun cairn associé à l utilisateur d id : '+ id )
        }       
      }
      else {
        console.log('in UsersDAO : requête KO');
        cb('Un problème est survenu en base de données !')
      }
    });

  }
}

module.exports = UsersDAO;
