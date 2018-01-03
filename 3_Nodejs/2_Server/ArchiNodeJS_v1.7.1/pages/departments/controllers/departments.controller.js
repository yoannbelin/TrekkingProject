let DepartmentsService = require(__base + 'api-rest/departments/services/departments.service');
let DepartmentModel = require(__base + 'api-rest/departments/models/department.model');
let UsersService = require(__base + 'api-rest/users/services/users.service');

//
// Departments index page
//
module.exports.index = function(req, res) {
    res.render('departments/views/index');
}

//
// Department show page
//
module.exports.show = function(req, res) {
    DepartmentsService.find(req.params.id, (err, department) => {
        if (err) {
            console.log(' in pages/departmentController :' + err)
            res.end(err)
        } else {
            res.render('departments/views/show', { department: department });
        }
    });
}