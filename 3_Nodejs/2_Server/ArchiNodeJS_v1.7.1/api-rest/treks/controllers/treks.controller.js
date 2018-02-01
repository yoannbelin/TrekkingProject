//=========================================================================
// Le controleur fait le lien entre la vue et le service, il controle la
// validité des entrés utilisateurs, passe le traitement au service puis
// rends la vue (typiquement).
//=========================================================================

let TreksService = require('../services/treks.service');
let TrekModel = require('../models/trek.model');

/**
 * Create a trek
 */
module.exports.create = function(req, res) {

    let trekModel = new TrekModel(req.body);
    console.log(trekModel);

    if (!trekModel.isValid()) {
        console.log("invalid");
        return res.status(500).json({ 'error': 'Failed to create trek, missing fields !' });
    }

    TreksService.create(req.session.user.id, trekModel, (err, trek) => {
        if (err) {
            res.status(500).json({ 'error': 'Failed to create trek !' });
        } else {
            res.json({ 'success': 'Trek created !', 'trek': trek });
        }
    });
}

/**
 * Read a trek
 */
module.exports.read = function(req, res) {
    TreksService.find(req.params.idTrek, (err, trek) => { // à voir pour utiliser le middleware trekByID
        res.json(trek); // trek est du type TrekModel, pas besoin d'écrire toJSON  ##1
    });
}

/**
 * Update a trek
 */
module.exports.update = function(req, res) {
    let trekModel = new TrekModel(req.body);
    console.log(trekModel);

    if (!trekModel.isValid()) {
        return res.status(500).json({ 'error': 'Failed to update trek, missing fields !' });
    }
    console.log("Trek Updated");
    trekModel.id = req.params.idTrek;

    TreksService.update(trekModel, (err, trek) => {
        if (err) {
            res.status(500).json({ 'error': 'Failed to update trek !' });
        } else {
            res.json({ 'success': 'Trek updated !', 'trek': trek });
        }
    });
}

/**
 * Delete a trek
 */
module.exports.delete = function(req, res) {
    TreksService.delete(req.params.idTrek, (err, trek) => {
        if (err) {
            res.status(500).json({ 'error': 'Failed to delete trek !' });
        } else {
            res.json({ 'success': 'Trek deleted !', 'trek': trek });
        }
        console.log("Trek Deleted");
    });
}

/**
 * List of treks
 */
module.exports.list = function(req, res) {
    TreksService.list((err, treks) => {
        res.json(treks); // cast with toJSON
    });
}

/**
 * List Treks for current user
 */
module.exports.listCurrentUser = function(req, res) {
    TreksService.listByUserID(req.session.user.id, (err, treks) => {
        res.json(treks);
    });
}

/**
 * TrekByID middleware
 */
exports.trekByID = function(req, res, next, idTrek) {
    if (isNaN(idTrek)) {
        return res.status(400).send({ trek: 'trek is invalid' });
    }

    TreksService.find(idTrek, (err, trek) => {
        if (!trek) {
            return res.status(500).json({ 'errors': [{ msg: 'Failed to load trek ' + idTrek }] });
        }

        req.trek = trek;

        next();
    });
}