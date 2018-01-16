//=========================================================================
// Le service contient le code métier, il doit traiter des données (si besoin)
// et les rendre au controller.
//=========================================================================

let PhotosDAO = require('../dao/photos.dao.mysql');
let PhotoDAO = require('./../dao/photos.dao.mysql') // pour info

class PhotosService {
    static create(photo, cb) {
        PhotosDAO.create(photo, cb);
    }

    static update(photo, cb) {
        PhotosDAO.update(photo, cb);
    }

    static delete(id, cb) {
        return PhotosDAO.delete(id, (err, photo) => {
            cb(err, photo);
        });
    }

    static find(id, cb) {
        return PhotosDAO.find(id, (err, photo) => {
            cb(err, photo);
        });
    }

    static list(cb) {
        console.log("service called");
        return PhotosDAO.list(cb);
    }
}
module.exports = PhotosService;