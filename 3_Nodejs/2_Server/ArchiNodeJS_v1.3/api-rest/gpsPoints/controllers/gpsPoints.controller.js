//=========================================================================
// Le controleur fait le lien entre la vue et le service, il controle la
// validité des entrés utilisateurs, passe le traitement au service puis
// rends la vue (typiquement).
//=========================================================================

let GpsPointsService = require('../services/gpsPoints.service');
let GpsPointModel = require('../models/gpsPoint.model');


/**
 * Create a gpsPoint
 */
module.exports.create = function(req, res) {
  
  let gpsPointModel = new GpsPointModel(req.body);

  if (!gpsPointModel.isValid()) {
    return res.status(500).json({ 'error': 'Failed to create gpsPoint, missing fields !' });
  }

  GpsPointsService.create(gpsPointModel, (err, gpsPoint) => {
    if (err) {
      res.status(500).json({ 'error': 'Failed to create gpsPoint !' });
    } else {
      res.json({ 'success': 'GpsPoint created !', 'gpsPoint': gpsPoint });
    }
  });
}


/**
 * Read a gpsPoint
 */
module.exports.read = function(req, res) {
  GpsPointsService.find(req.params.idGpsPoint, (err, gpsPoint) => { // à voir pour utiliser le middleware gpsPointByID
    res.json(gpsPoint); // gpsPoint est du type GpsPointModel, pas besoin d'écrire toJSON  ##1
  });
}


/**
 * Update a gpsPoint
 */
module.exports.update = function(req, res) {
  let gpsPointModel = new GpsPointModel(req.body);

  if (!gpsPointModel.isValid()) {
    return res.status(500).json({ 'error': 'Failed to update gpsPoint, missing fields !' });
  }

  gpsPointModel.id = req.params.idGpsPoint;

  GpsPointsService.update(gpsPointModel, (err, gpsPoint) => {
    if (err) {
      res.status(500).json({ 'error': 'Failed to update gpsPoint !' });
    } else {
      res.json({ 'success': 'GpsPoint updated !', 'gpsPoint': gpsPoint });
    }
  });
}


/**
 * Delete a gpsPoint
 */
module.exports.delete = function(req, res) {
  GpsPointsService.delete(req.params.idGpsPoint, (err, gpsPoint) => {
    if (err) {
      res.status(500).json({ 'error': 'Failed to delete gpsPoint !' });
    } else {
      res.json({ 'success': 'GpsPoint deleted !', 'gpsPoint': gpsPoint });
    }
  });
}


/**
 * List of gpsPoints
 */
module.exports.list = function(req, res) {
  GpsPointsService.list((err, gpsPoints) => {
    res.json(gpsPoints); // cast with toJSON
  });
}
