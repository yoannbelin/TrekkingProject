var _users = [];
var selectedUser = null;

/**
 * Build table
 */
function buildTable() {
  var html = "";
  html += "<tr>";
  html += "<td> Id </td>";
  html += "<td>Prenom</td>";
  html += "<td>Nom</td>";
  html += "<td>Age</td>";
  html += "</tr>";

  for (var i = 0; i < _users.length; i++) {
    html += "<tr id=row_" + i + " onClick=\"selectUser(" + i + ")\">";
    html += "<td onClick=\"test(" + i + ")\">" + _users[i].id + "</td>";
    html += "<td>" + _users[i].firstname + "</td>";
    html += "<td>" + _users[i].lastname + "</td>";
    html += "<td>" + _users[i].age + "</td>";
    html += "</tr>";
  }

  document.getElementById('idTableau').innerHTML = html;
};

/**
Chengement de page
*/
function test(i) {
  window.location.href = 'users/' + _users[i].id;
}

/**
 * Select user in table (hightlight the selected line & insert data in controls)
 */
function selectUser(index) {
  if (index < _users.length) {
    var elems = document.querySelectorAll("tr");

    for (var i = 0; i < elems.length; i++) {
      elems[i].style.background = "transparent";
    }

    var elem = document.querySelector("#row_" + index);
    elem.style.background = "red";

    document.getElementById('prenom').value = _users[index]['firstname'];
    document.getElementById('nom').value = _users[index]['lastname'];
    document.getElementById('age').value = _users[index]['age'];

    selectedUser = _users[index];
  }
}


/**
 * Load users list
 */
function loadUsers() {
  $http.get('/api-rest/users', function(res) {
    _users = res;
    buildTable();
  }, 'json');
}


/**
 * Add user
 */
function addUser() {
  var input = {
    'firstname': document.getElementById('prenom').value,
    'lastname': document.getElementById('nom').value,
    'age': document.getElementById('age').value
  };

  $http.post('/api-rest/users', input, function(res) {
    _users.push(res.user);
    buildTable();
  }, 'json');
}


/**
 * Delete selected user
 */
function delUser() {
  $http.delete('/api-rest/users/' + selectedUser.id, function() {
    _users.splice(_users.indexOf(selectedUser), 1);
    buildTable();
  });
}


/**
 * Update selected user
 */
function updateUser() {

  var input = {
    'firstname': document.getElementById('prenom').value,
    'lastname': document.getElementById('nom').value,
    'age': document.getElementById('age').value
  };

  $http.update('/api-rest/users/' + selectedUser.id, input, function(res) {
    _users[_users.indexOf(selectedUser)] = res.user;
    buildTable();
  }, 'json');
}



window.onload = loadUsers()
