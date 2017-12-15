//=========================================================================
// Le module DAO contient les requetes pour une base de donnée spécifique.
// Il peut y avoir une DAO MySQL, une DAO PostgreSQL, une DAO Oracle, etc...
// Par la suite il sera facile de switcher de l'une à l'autre sans toucher
// au reste du code de l'application.
//=========================================================================

let db = require(__base + '/config/db')
let DepartmentModel = require('../models/department.model');


class DepartmentsDAO {
    static create(department, cb) {
        console.log("called create function in Dao");
        db.query('INSERT INTO department SET name = ?, num = ?', [department.name, department.num], (err, result) => {
            department.id = result.insertId;
            if (result) { console.log('mesage inséré : !!' + result.insertId) } else { console.log("erreur à l insertion : " + err) }
            cb(err, department);
        });
    }

    static update(department, cb) {
        db.query('UPDATE department SET name = ?, num = ?, WHERE id_department = ?', [department.name, department.num, department.id], (err) => {
            cb(err, department);
        });
    }

    static delete(id, cb) {
        db.query('DELETE FROM department WHERE id_department = ?', [id], (err) => {
            cb(err);
        });
    }

    static list(cb) {
        db.query('SELECT * FROM department', (err, rows) => {
            rows = rows || [];
            cb(err, rows.map((row) => {

                // let trekDepartment = {
                //     id: row.id_Department,
                //     name: row.name_Department,
                //     num: row.num_Department
                // }

                return new DepartmentModel(row)
            }));
        });
    }

    static find(id, cb) {
        let script = 'SELECT department.id_department, department.name, department.num'
        script += 'FROM department '
            // script += 'JOIN user '
            // script += 'WHERE department.id = ? AND department.idauthor = user.id LIMIT 1';

        db.query(script, [id], (err, rows) => {

            if (rows && rows[0] !== undefined) {
                //   var enreg = rows[0]

                //   var userAuthor = {
                //     id: enreg.idAuthor,
                //     firstname: enreg.firstname,
                //     lastname: enreg.lastname,
                //     age: enreg.age ,
                //     created_at: enreg.created_at
                //   }

                var currentDepartment = new DepartmentModel(rows[0])
                    // currentDepartment.setAuthor(new UserModel(userAuthor))

                cb(err, currentDepartment);
            } else {
                cb('Aucun department ne correspond à votre requète !')
            }
        });
    }
}

module.exports = DepartmentsDAO;