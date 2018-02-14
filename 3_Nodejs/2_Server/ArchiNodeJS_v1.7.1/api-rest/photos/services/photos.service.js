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
            cb(err, id);
        });
    }

    static find(id, cb) {
        return PhotosDAO.find(id, (err, photo) => {
            cb(err, photo);
        });
    }

    static list(cb) {
<<<<<<< HEAD
<<<<<<< HEAD
        console.log("service called");
        return PhotosDAO.list(cb);
    }
=======
        return PhotosDAO.list(cb);
    }
=======
        return PhotosDAO.list(cb);
    }
>>>>>>> master

    static listByUserID(idUser, cb) {
        return PhotosDAO.listByUserID(idUser, (err, photosReturned) => {
            if (err) {
                console.error(err);
            }

            cb(err, photosReturned);
        });
    }
<<<<<<< HEAD
>>>>>>> master
=======
>>>>>>> master
}
module.exports = PhotosService;