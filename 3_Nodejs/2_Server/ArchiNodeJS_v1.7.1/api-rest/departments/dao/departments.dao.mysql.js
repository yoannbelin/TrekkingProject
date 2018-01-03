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

        let script = 'INSERT INTO department (name , num) '
        script += 'SELECT * FROM ( SELECT ?,  ?) AS tmp '
        script += 'WHERE NOT EXISTS ( '
        script += 'SELECT * FROM department WHERE (name = ' + department.name + ') AND (num = ' + department.num + ') '
        script += '); '

        db.query(script, [department.name, department.num], (err, result) => {
            department.id = result.insertId;
            if (result) {
                console.log('mesage inséré : !!' + result.insertId);
            } else { console.log("erreur à l insertion : " + err) }
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
        console.log("yo");
        db.query('SELECT * FROM department', (err, rows) => {
            rows = rows || [];
            cb(err, rows.map((row) => {
                return new DepartmentModel(row)
            }));
        });
    }

    static find(id, cb) {
        let script = 'SELECT department.id_department, department.name, department.num'
        script += 'FROM department '

        db.query(script, [id], (err, rows) => {

            if (rows && rows[0] !== undefined) {
          
                var currentDepartment = new DepartmentModel(rows[0])

                cb(err, currentDepartment);
            } else {
                cb('Aucun department ne correspond à votre requète !')
            }
        });
    }
}
module.exports = DepartmentsDAO;