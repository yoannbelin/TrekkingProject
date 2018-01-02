let UsersService = require(__base + 'api-rest/treks/services/treks.service');
let UserModel = require(__base + 'api-rest/treks/models/treks.model');

/**
 * Treks index page
 */
module.exports.index = function(req, res) {
    res.render('maps/views/index');
}

/**
 * Treks show page
 */
module.exports.show = function(req, res) {

    console.log('page d affichage des user demandée')

    UsersService.find(req.params.idUser, (err, user) => {
        if (err) {
            console.log('page d affichage des utilisateurs : erreur' + err)
            res.end(err)
        } else
            res.render('users/views/show', { user: user });
    });
}