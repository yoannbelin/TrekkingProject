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

  if (!userModel.isValid()) {
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
  UsersService.find(req.params.idUser, (err, user) => { //##2 à voir pour utiliser le middleware userByID
    if ( err )
    {
      console.log( 'UsersService est renvoyée au client : '+ err)
      res.json( {error : err})
    }
    else
      res.json(user); // user est du type UserModel, pas besoin d'écrire toJSON  ##1
  });
}


/**
 * Update a user
 */
module.exports.update = function(req, res) {
  let userModel = new UserModel(req.body);

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


/**
 * User middleware
 */
// exports.userByID = function (req, res, next, idUser) {
//   if (isNaN(idUser)) {
//     return res.status(400).send({
//       cairn: 'User is invalid'
//     });
//   }

//   UsersService.find(idUser, (err, user) => {
//     if (!user) {
//       return next(new Error('Failed to load user ' + idUser));
//     }

//     req.user = user;
//     next();
//   });
// }