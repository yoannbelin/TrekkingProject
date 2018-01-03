//=========================================================================
// Le service contient le code métier, il doit traiter des données (si besoin)
// et les rendre au controller.
//=========================================================================

let TreksDAO  = require('../dao/treks.dao.mysql');
let TrekDAO = require('./../dao/treks.dao.mysql') // pour info

class TreksService
{
    static create(trek, cb) {
        TreksDAO.create(trek, cb);
    }

    static update(trek, cb) {
        TreksDAO.update(trek, cb);
    }

    static delete(id, cb) {
        return TreksDAO.delete(id, (err, trek) => {
          cb(err, trek);
        });
    }

    static find(id, cb) {
        return TreksDAO.find(id, (err, trek) => {
          cb(err, trek);
        });
    }
    
    static list(cb) {
        return TreksDAO.list(cb);
    }
}
module.exports = TreksService;
