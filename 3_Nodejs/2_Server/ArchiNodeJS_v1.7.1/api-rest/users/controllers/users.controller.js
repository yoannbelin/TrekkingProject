//=========================================================================
// Le controleur fait le lien entre la vue et le service, il controle la
// validité des entrés utilisateurs, passe le traitement au service puis
// rends la vue (typiquement).
//=========================================================================

let UsersService = require('../services/users.service');
let UserModel = require('../models/user.model');

/**
 * Create a user
 */
module.exports.create = function(req, res) {

    let userModel = new UserModel(req.body);
    console.log(userModel);

    if (!userModel.isValid()) {
        console.log("invalid");
        return res.status(500).json({ 'error': 'Failed to create user, missing fields !' });
    }

    UsersService.create(userModel, (err, user) => {
        if (err) {
            res.status(500).json({ 'error': 'Failed to create user !' });
        } else {
            res.json({ 'success': 'User created !', 'user': user });
        }
    });
}

/**
 * Read a user
 */
module.exports.read = function(req, res) {
    UsersService.find(req.params.idUser, (err, user) => { // à voir pour utiliser le middleware userByID
        res.json(user); // user est du type UserModel, pas besoin d'écrire toJSON  ##1
        console.log("#" +  JSON.stringify(user))
    });
}

/**
 * Update a user
 */
module.exports.update = function(req, res) {
    let userModel = new UserModel(req.body);
    console.log(userModel);

    if (!userModel.isValid()) {
        return res.status(500).json({ 'error': 'Failed to update user, missing fields !' });
    }
    userModel.id = req.params.idUser;

    UsersService.update(userModel, (err, user) => {
        if (err) {
            res.status(500).json({ 'error': 'Failed to update user !' });
        } else {
            res.json({ 'success': 'User updated !', 'user': user });
        }
    });
}

/**
 * Delete a user
 */
module.exports.delete = function(req, res) {
    UsersService.delete(req.params.idUser, (err, user) => {
        if (err) {
            res.status(500).json({ 'error': 'Failed to delete user !' });
        } else {
            res.json({ 'success': 'User deleted !', 'user': user });
        }
    });
}

/**
 * List of users
 */
module.exports.list = function(req, res) {
    UsersService.list((err, users) => {
        res.json(users); // cast with toJSON
    });
}