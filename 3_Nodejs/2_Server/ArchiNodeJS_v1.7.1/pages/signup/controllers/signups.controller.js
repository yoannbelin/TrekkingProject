let UsersService = require(__base + 'api-rest/users/services/users.service');
let UserModel = require(__base + 'api-rest/users/models/user.model');

/**
 * Signups index page
 */
module.exports.index = function(req, res) {
    res.render('signup/views/index');
}

/**
 * Trek show page
 */
module.exports.show = function(req, res) {
    SignupsService.find(req.params.idSignup, (err, signup) => {
        if (err) {
            console.log(' in pages/signupController :' + err)
            res.end(err)
        } else {
            res.render('signup/views/show', { signup: signup });
        }
    });
}