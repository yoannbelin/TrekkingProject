'use strict';

let acl = require('acl');
acl = new acl(new acl.memoryBackend());

acl.allow([{
    roles: ['admin'],
    allows: [{
        ressources: '/',
        permission: ['get']
    }]
}, {
    roles: ['user'],
    allows: [{
        ressources: '/',
        permission: ['post']
    }, {
        ressources: '/me',
        permission: ['get']
    }, {
        ressources: '/:idTrek',
        permission: '*'
    }]
}, {
    roles: ['guest'],
    allows: []
}]);

exports.isAllowed = function(req, res, next) {
    var userRoles = (req.session.user) ? req.session.user.roles.split(',') : ['guest']; //## Récupération des valeurs de la table "user"

    // ## Checker les paramètres de acl.areAnyRolesAllowed qui parlent d'eux même => Cf documentation
    // comparaison des userRoles avec aacl.roles pour donner les droits, (Cf. https://github.com/OptimalBits/node_acl#areAnyRolesAllowed )
    acl.areAnyRolesAllowed(userRoles, req.route.path, req.method.toLowerCase(), function(err, isAllowed) {
        if (err) {
            return res.status(500).send('Unexpected authorization error');
        } else {
            if (isAllowed) {
                return next();
            } else {
                return res.status(403).json({
                    message: 'Access denied'
                });
            }
        }
    });
};

exports.isOwner = function(req, res, next) {
    // Check if user is owner of this car
    if (req.carUser && req.carUser.user.id !== req.session.user.id) {
        return res.status(500).send('You are not the owner !');
    }

    next();
};