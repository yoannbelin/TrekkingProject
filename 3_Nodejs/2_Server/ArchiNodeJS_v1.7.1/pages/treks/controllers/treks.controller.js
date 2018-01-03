let TreksService = require(__base + 'api-rest/treks/services/treks.service');
let TrekModel = require(__base + 'api-rest/treks/models/trek.model');
let UsersService = require(__base + 'api-rest/users/services/users.service');

/**
 * Treks index page
 */
module.exports.index = function (req, res) {
    res.render('treks/views/index');
}

/**
 * Trek show page
 */
module.exports.show = function (req, res) {
    TreksService.find(req.params.idTrek, (err, trek) => {
        if (err) {
            console.log(' in pages/trekController :' + err)
            res.end(err)
        }
        else {
            res.render('treks/views/show', { trek: trek });
        }
    });
}