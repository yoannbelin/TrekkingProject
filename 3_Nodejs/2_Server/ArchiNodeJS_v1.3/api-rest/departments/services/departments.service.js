//=========================================================================
// Le service contient le code métier, il doit traiter des données (si besoin)
// et les rendre au controller.
//=========================================================================

let DepartmentsDAO  = require('../dao/departments.dao.mysql');
let UserDAO = require('./../dao/departments.dao.mysql') // pour info


class DepartmentsService
{
    static create(department, cb) {
        DepartmentsDAO.create(department, cb);
    }

    static update(department, cb) {
        DepartmentsDAO.update(department, cb);
    }

    static delete(id, cb) {
        return DepartmentsDAO.delete(id, (err, department) => {
          cb(err, department);
        });
    }

    static find(id, cb) {
        return DepartmentsDAO.find(id, (err, department) => {
          cb(err, department);
        });
    }
    
    static list(cb) {
        return DepartmentsDAO.list(cb);
    }
}

module.exports = DepartmentsService;
