'use strict'

let UsersService = require('./users.service');
let passwordHash = require('password-hash');

class UsersRegisterService {
    static register(newUser, cb) {
        UsersService.findByEmail(newUser.mail, (err, user) => {
            if (user) {
                console.log('e-mail is already used');
                return cb(new Error('Account already exist !'));
            }
            UsersService.findByPseudo(newUser.username, (err, user) => {
                if (user) {
                    console.log('username is already used');
                    return cb(new Error('Account already exist !'));
                }

                newUser.password = passwordHash.generate(newUser.password);

                UsersService.create(newUser, (err, user) => {
                    if (user) {
                        cb(null, user);
                    } else {
                        cb(new Error('Subscription failed !'));
                    }
                });
            });
        });
    }
}

module.exports = UsersRegisterService;