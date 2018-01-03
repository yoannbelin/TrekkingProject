//=========================================================================
// Le controleur fait le lien entre la vue et le service, il controle la
// validité des entrés utilisateurs, passe le traitement au service puis
// rends la vue (typiquement).
//=========================================================================

let DepartmentsService = require('../services/departments.service');
let DepartmentModel = require('../models/department.model');

//
// Create a department
//
module.exports.create = function(req, res) {

    let departmentModel = new DepartmentModel(req.body);
    console.log(departmentModel);

    if (!departmentModel.isValid()) {
        console.log("invalid");
        return res.status(500).json({ 'error': 'Failed to create department, missing fields !' });
    }

    DepartmentsService.create(departmentModel, (err, department) => {
        if (err) {
            res.status(500).json({ 'error': 'Failed to create department !' });
        } else {
            res.json({ 'success': 'Department created !', 'department': department });
        }
    });
}

//
// Read a department
//
module.exports.read = function(req, res) {
    DepartmentsService.find(req.params.idDepartment, (err, department) => { // à voir pour utiliser le middleware departmentByID
        res.json(department); // department est du type DepartmentModel, pas besoin d'écrire toJSON  ##1
    });
}

//
// Update a department
//
module.exports.update = function(req, res) {
    let departmentModel = new DepartmentModel(req.body);
    console.log(departmentModel);

    if (!departmentModel.isValid()) {
        return res.status(500).json({ 'error': 'Failed to update department, missing fields !' });
    }

    departmentModel.id = req.params.idDepartment;

    DepartmentsService.update(departmentModel, (err, department) => {
        if (err) {
            res.status(500).json({ 'error': 'Failed to update department !' });
        } else {
            res.json({ 'success': 'Department updated !', 'department': department });
        }
    });
}

//
// Delete a department
//
module.exports.delete = function(req, res) {
    DepartmentsService.delete(req.params.idDepartment, (err, department) => {
        if (err) {
            res.status(500).json({ 'error': 'Failed to delete department !' });
        } else {
            res.json({ 'success': 'Department deleted !', 'department': department });
        }
    });
}

//
// List of departments
//
module.exports.list = function(req, res) {
    DepartmentsService.list((err, departments) => {

        res.json(departments); // cast with toJSON

    });
}