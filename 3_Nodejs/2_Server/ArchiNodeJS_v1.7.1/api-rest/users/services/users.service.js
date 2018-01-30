//=========================================================================
// Le service contient le code métier, il doit traiter des données (si besoin)
// et les rendre au controller.
//=========================================================================

let UsersDAO = require('../dao/users.dao.mysql');
let UserDAO = require('./../dao/users.dao.mysql')

class UsersService {
    static create(user, cb) {
        console.log('## userservice create()')
        UsersDAO.create(user, cb);
    }

    static update(user, cb) {
        UsersDAO.update(user, cb);
    }

    static delete(id, cb) {
        return UsersDAO.delete(id, (err, user) => {
            cb(err, user);
        });
    }

    static find(id, cb) {
        return UsersDAO.find(id, (err, user) => {
            cb(err, user);
        });
    }

    static list(cb) {
        return UsersDAO.list(cb);
    }

    static findById(id, cb) {
        return UsersDAO.findById(id, cb);
    }

    static findByEmail(email, cb) {
        return UsersDAO.findByEmail(email, cb);
    }
}
module.exports = UsersService;