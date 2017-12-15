var _treks = [];
var selectedTrek = null;

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

    for (var i = 0; i < _treks.length; i++) {
        html += "<tr id=row_" + i + " onClick=\"selectTrek(" + i + ")\">";
        html += "<td onClick=\"test(" + i + ")\">" + _treks[i].id + "</td>";
        html += "<td>" + _treks[i].create_at + "</td>";
        html += "<td>" + _treks[i].content + "</td>";
        html += "</tr>";
    }

    document.getElementById('idTableau').innerHTML = html;
};

/**
Chengement de page
*/
function test(i) {
    window.location.href = 'treks/' + _treks[i].id;
}

/**
 * Select trek in table (hightlight the selected line & insert data in controls)
 */
function selectTrek(index) {
    if (index < _treks.length) {
        var elems = document.querySelectorAll("tr");

        for (var i = 0; i < elems.length; i++) {
            elems[i].style.background = "transparent";
        }

        var elem = document.querySelector("#row_" + index);
        elem.style.background = "red";

        //document.getElementById('create at').value = _treks[index]['create_at'];
        document.getElementById('trek').value = _treks[index]['content'];

        selectedTrek = _treks[index];
    }
}


/**
 * Load treks list
 */
function loadTreks() {
    $http.get('/api-rest/treks', function(res) {
        _treks = res;
        buildTable();
    }, 'json');
}


/**
 * Add Trek
 */
function addTrek() {
    console.log(1)
    var input = {
        'length': document.getElementById('length').value,
        'time': document.getElementById('time').value,
        'level': document.getElementById('level').value,
        'label': document.getElementById('label').value,
        'id_trek1': document.getElementById('id_trek1').value
    };

    $http.post('/api-rest/treks', input, function(res) {
        _treks.push(res.trek);
        buildTable();
    }, 'json');
}


/**
 * Delete selected trek
 */
function delTrek() {
    $http.delete('/api-rest/treks/' + selectedTrek.id, function() {
        _treks.splice(_treks.indexOf(selectedTrek), 1);
        buildTable();
    });
}


/**
 * Update selected trek
 */
function updateTrek() {

    var input = {
        'create_at': document.getElementById('create_at').value,
        'content': document.getElementById('content').value
    };

    $http.update('/api-rest/treks/' + selectedTrek.id, input, function(res) {
        _treks[_treks.indexOf(selectedTrek)] = res.trek;
        buildTable();
    }, 'json');
}



window.onload = loadTreks()