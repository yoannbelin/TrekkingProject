let PhotosService = require(__base + 'api-rest/photos/services/photos.service');
let PhotoModel = require(__base + 'api-rest/photos/models/photo.model');
//let UsersService = require(__base + 'api-rest/users/services/users.service');

/**
 * Photos index page
 */
module.exports.index = function(req, res) {
    res.render('photos/views/index');
}

/**
 * Trek show page
 */
module.exports.show = function(req, res) {
    PhotosService.find(req.params.idPhoto, (err, photo) => {
        if (err) {
            console.log(' in pages/photoController :' + err)
            res.end(err)
        } else {
            res.render('photos/views/show', { photo: photo });
        }
    });
}