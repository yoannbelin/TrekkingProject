let UsersService = require(__base + 'api-rest/users/services/users.service');
let UserModel = require(__base + 'api-rest/users/models/user.model');

/**
 * Logins index page
 */
module.exports.index = function(req, res) {
    res.render('login/views/index');
}

/**
 * show page
 */
module.exports.show = function(req, res) {
    LoginsService.find(req.params.idLogin, (err, login) => {
        if (err) {
            console.log(' in pages/loginController :' + err)
            res.end(err)
        } else {
            res.render('login/views/show', { login: login });
        }
    });
}