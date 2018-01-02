var _treks = [];
var selectedTrek = null;

function buildListTreks() {
    var html = "";
    html += "<tr>";
    html += "<td> Nom du trek </td>";
    html += "</tr>";


    for (var i = 0; i < _treks.length; i++) {
        html += "<tr id=row_" + i + " onClick=\"selectTrek(" + i + ")\">";
        html += "<td onClick=\"infoTrek(" + i + ")\">" + _treks[i].label + "</td>";
        html += "</tr>";
    }
    document.getElementById('idTableaulist').innerHTML = html;
}

/**
 * Build Combobox
 */
function buildCombo() {
    var html = "";
    _treks.forEach((option) => {
        html += "<option data-id= " + option.id + ">" + option.label + "</option>";
    })
    document.getElementById("idCombo").innerHTML = html;
}

/**
 * Build table
 */
function buildTable() {
    var html = "";
    html += "<tr>";
    html += "<td> Nom du trek </td>";
    html += "<td> Distance du trek </td>";
    html += "<td> Temps estimé </td>";
    html += "<td> Difficulté </td>";
    html += "</tr>";

    for (var i = 0; i < _treks.length; i++) {
        html += "<tr id=row_" + i + " onClick=\"selectTrek(" + i + ")\">";
        html += "<td>" + _treks[i].label + "</td>";
        html += "<td>" + _treks[i].length + "</td>";
        html += "<td>" + _treks[i].time + "</td>";
        html += "<td>" + _treks[i].level + "</td>";
        html += "</tr>";
    }

    document.getElementById('idTableau').innerHTML = html;
};

/**
Changement de page
*/
function infoTrek(i) {
    // window.location.href = 'infoTrek/' + _treks[i].id;
    console.log('testbox');
    var html = "";
    html += "<tr>";
    html += "<td> Nom du trek </td>";
    html += "<td> Distance du trek </td>";
    html += "<td> Temps estimés </td>";
    html += "<td> Niveau de difficulté </td>";
    html += "</tr>";
    html += "<tr>";
    // html += "<tr id=row_" + document.getElementById('id').value = _treks[index]['id'] + " onClick=\"selectTrek(" + i + ")\">";
    html += "<td>" + _treks[i].label + "</td>";
    html += "<td>" + _treks[i].length + "</td>";
    html += "<td>" + _treks[i].time + "</td>";
    html += "<td>" + _treks[i].level + "</td>";
    html += "</tr>";
    html += "<tr>";
    html += "<td>" + '<textarea name="" id="nom"></textarea>' + "</td>";
    html += "<td>" + '<textarea  name="" id="distance"></textarea>' + "</td>";
    html += "<td>" + '<textarea  name="" id="temps"></textarea>' + "</td>";
    html += "<td>" + '<textarea  name="" id="difficulte"></textarea>' + "</td>";
    html += "</tr>";
    document.getElementById('idTableau').innerHTML = html;

    var datas = JSON.parse(_treks[i].pathway)

    return datas
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

        document.getElementById('nom').value = _treks[index]['label'];
        document.getElementById('distance').value = _treks[index]['length'];
        document.getElementById('temps').value = _treks[index]['time'];
        document.getElementById('difficulte').value = _treks[index]['level'];

        selectedTrek = _treks[index];
    }
}


/**
 * Load treks list
 */
function loadTreks() {
    $http.get('/api-rest/treks', function(res) {
        _treks = res;
        buildCombo();
    }, 'json');
}


/**
 * Add trek
 */
function addTrek() {
    console.log("Added Trek")
    var input = {
        'label': document.getElementById('nom').value,
        'length': document.getElementById('distance').value,
        'time': document.getElementById('temps').value,
        'level': document.getElementById('difficulte').value
    };


    $http.post('/api-rest/treks', input, function(res) {
        if (res.trek.id !== 0) {
            _treks.push(res.trek);
        }
        infoTrek();
        buildCombo();
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
        'label': document.getElementById('nom').value,
        'length': document.getElementById('distance').value,
        'time': document.getElementById('temps').value,
        'level': document.getElementById('difficulte').value
    };

    $http.update('/api-rest/treks/' + selectedTrek.id, input, function(res) {
        _treks[_treks.indexOf(selectedTrek)] = res.trek;
        infoTrek(selectedTrek.id - 1);
        buildListTreks();
    }, 'json');
    // selectedTrek = _treks[selectedTrek.id - 1];
}

window.onload = loadTreks()