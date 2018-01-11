let treksService = require(__base + 'api-rest/treks/services/treks.service');
let trekModel = require(__base + 'api-rest/treks/models/trek.model');
let UsersService = require(__base + 'api-rest/users/services/users.service');

/**
 * ShowTreks index page
 */
module.exports.index = function(req, res) {
    res.render('showTreks/views/index');
}

/**
 * ShowTrek show page
 */
module.exports.show = function(req, res) {
    ShowTreksService.find(req.params.idShowTrek, (err, showTrek) => {
        if (err) {
            console.log(' in pages/showTrekController :' + err)
            res.end(err)
        } else {
            res.render('showTreks/views/show', { showTrek: showTrek });
        }
    });
}