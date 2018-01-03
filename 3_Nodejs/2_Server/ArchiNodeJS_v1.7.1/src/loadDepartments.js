var _departments = [];
var selectedDepartment = null;

//
// Build table
// 
function buildTable() {
    console.log(_departments);
    var html = "";
    html += "<tr>";
    html += "<td> Id </td>";
    html += "<td> Nom </td>"
    html += "<td> Numero </td>";
    html += "</tr>";

    for (var i = 0; i < _departments.length; i++) {
        html += "<tr id=row_" + i + " onClick=\"selectDepartment(" + i + ")\">";
        html += "<td onClick=\"test(" + i + ")\">" + _departments[i].id + "</td>";
        html += "<td>" + _departments[i].name + "</td>";
        html += "<td>" + _departments[i].num + "</td>";
        html += "</tr>";
    }

    document.getElementById('idTableau').innerHTML = html;
};

//
// Route to show page
//
function goToShow(i) {
    window.location.href = 'departments/' + _departments[i].idDepartment;
}

// Select department in table (hightlight the selected line & insert data in controls)
function selectDepartment(index) {

    console.log("salut");
    if (index < _departments.length) {
        var elems = document.querySelectorAll("tr");

        for (var i = 0; i < elems.length; i++) {
            elems[i].style.background = "transparent";
        }

        var elem = document.querySelector("#row_" + index);
        elem.style.background = "red";

        /*document.getElementById('create at').value = _departments[index]['create_at'];*/
        document.getElementById('name').value = _departments[index]['name'];
        document.getElementById('num').value = _departments[index]['num'];

        selectedDepartment = _departments[index];
    }
}

//
// Load departments list
//
function loadDepartments() {
    $http.get('/api-rest/departments', function(res) {
        _departments = res;
        buildTable();
    }, 'json');
}

//
// Add Department
//
function addDepartment() {
    console.log("trying to add dept")
    var input = {
        'name': document.getElementById('name').value,
        'num': document.getElementById('num').value
    };

    console.log(input);

    $http.post('/api-rest/departments', input, function(res) {
        _departments.push(res.department);
        buildTable();
    }, 'json');
}

//
// Delete selected department
//
function delDepartment() {
    $http.delete('/api-rest/departments/' + selectedDepartment.idDepartment, function() {
        _departments.splice(_departments.indexOf(selectedDepartment), 1);
        buildTable();
    });
}

//
// Update selected department
//
function updateDepartment() {

    var input = {
        'create_at': document.getElementById('create_at').value,
        'content': document.getElementById('content').value
    };
    $http.update('/api-rest/departments/' + selectedDepartment.idDepartment, input, function(res) {
        _departments[_departments.indexOf(selectedDepartment)] = res.department;
        buildTable();
    }, 'json');
}
window.onload = loadDepartments()