var _gpsPoints = [];
var selectedGpsPoint = null;

/**
 * Build table
 */
function buildTable() {
  var html = "";
  html += "<tr>";
  html += "<td> Id </td>";
  html += "<td> create at </td>"
  html += "<td> Content </td>";
  html += "</tr>";

  for (var i = 0; i < _gpsPoints.length; i++) {
    html += "<tr id=row_" + i + " onClick=\"selectGpsPoint(" + i + ")\">";
    html += "<td onClick=\"test(" + i + ")\">" + _gpsPoints[i].id + "</td>";
    html += "<td>" + _gpsPoints[i].create_at + "</td>";
    html += "<td>" + _gpsPoints[i].content + "</td>";
    html += "</tr>";
  }

  document.getElementById('idTableau').innerHTML = html;
};

/**
Changement de page
*/
function test(i) {
  window.location.href = 'gpsPoints/' + _gpsPoints[i].id;
}

/**
 * Select gpsPoint in table (hightlight the selected line & insert data in controls)
 */
 function selectGpsPoint(index) {
   if (index < _gpsPoints.length) {
     var elems = document.querySelectorAll("tr");

     for (var i = 0; i < elems.length; i++) {
       elems[i].style.background = "transparent";
     }

     var elem = document.querySelector("#row_" + index);
     elem.style.background = "red";

     document.getElementById('gpsPoint').value = _gpsPoints[index]['content'];

     selectedGpsPoint = _gpsPoints[index];
   }
 }

/**
 * Load gpsPoints list
 */
function loadGpsPoints() {
  $http.get('/api-rest/gpsPoints', function(res) {
    _gpsPoints = res;
    buildTable();
  }, 'json');
}


/**
 * Add GpsPoint
 */
function addGpsPoint() {
  console.log(1)
  var input = {
    'content': document.getElementById('gpsPoint').value
  };

  $http.post('/api-rest/gpsPoints', input, function(res) {
    _gpsPoints.push(res.gpsPoint);
    buildTable();
  }, 'json');
}

/**
 * Delete selected gpsPoint
 */
function delGpsPoint() {
  $http.delete('/api-rest/gpsPoints/' + selectedGpsPoint.id, function() {
    _gpsPoints.splice(_gpsPoints.indexOf(selectedGpsPoint), 1);
    buildTable();
  });
}

/**
 * Update selected gpsPoint
 */
function updateGpsPoint() {

  var input = {
    'create_at': document.getElementById('create_at').value,
    'content': document.getElementById('content').value
  };

  $http.update('/api-rest/gpsPoints/' + selectedGpsPoint.id, input, function(res) {
    _gpsPoints[_gpsPoints.indexOf(selectedGpsPoint)] = res.gpsPoint;
    buildTable();
  }, 'json');
}
window.onload = loadGpsPoints()
