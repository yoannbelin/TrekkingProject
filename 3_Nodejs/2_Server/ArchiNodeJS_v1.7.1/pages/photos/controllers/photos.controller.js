let PhotosService = require(__base + 'api-rest/photos/services/photos.service');
let PhotoModel = require(__base + 'api-rest/photos/models/photo.model');
//let UsersService = require(__base + 'api-rest/users/services/users.service');

/**
 * Photos index page
 */
<<<<<<< HEAD
<<<<<<< HEAD
module.exports.index = function (req, res) {
=======
module.exports.index = function(req, res) {
>>>>>>> master
=======
module.exports.index = function(req, res) {
>>>>>>> master
    res.render('photos/views/index');
}

/**
 * Trek show page
 */
<<<<<<< HEAD
<<<<<<< HEAD
module.exports.show = function (req, res) {
=======
module.exports.show = function(req, res) {
>>>>>>> master
=======
module.exports.show = function(req, res) {
>>>>>>> master
    PhotosService.find(req.params.idPhoto, (err, photo) => {
        if (err) {
            console.log(' in pages/photoController :' + err)
            res.end(err)
<<<<<<< HEAD
<<<<<<< HEAD
        }
        else {
=======
        } else {
>>>>>>> master
=======
        } else {
>>>>>>> master
            res.render('photos/views/show', { photo: photo });
        }
    });
}