var _treks = [];

//
// Build combobox
//
function buildCombo() {
    var html = "";
    html += "<option disabled selected>" + "Selectionner votre trek" + "</option>";
    html += "<optgroup label=\'Randonnées Officielles\'>"
    _treks.forEach((option) => {
        if (option.official === 1) {
            html += "<option data-id= " + option.id + ">" + option.label + "</option>";
        }
    })
    html += "</optgroup>"
    html += "<optgroup label=\'Randonnées Persos\'>"
    _treks.forEach((option) => {
        if (option.official === 0) {
            html += "<option data-id= " + option.id + ">" + option.label + "</option>";
        }
    })
    html += "</optgroup>"

    document.getElementById("idCombo").innerHTML = html;
}

//
// Show trek's characteritics
//
function infoTrek(i) {
    show_btn('.reset');
    show_btn('.detail');

    var html = "";
    html += "<tr>";
    html += "<td> Nom du trek </td>";
    html += "<td> Distance du trek </td>";
    html += "<td> Temps estimés </td>";
    html += "<td> Niveau de difficulté </td>";
    html += "</tr>";
    html += "<tr>";
    html += "<td>" + _treks[i].label + "</td>";
    html += "<td>" + _treks[i].length + "</td>";
    html += "<td>" + _treks[i].time + "</td>";
    html += "<td>" + _treks[i].level + "</td>";
    html += "</tr>";
    document.getElementById('idTableau').innerHTML = html;

    var datas = JSON.parse(_treks[i].pathway)
    drawTrek(datas);
}

//
// Add trek by drawing with Leaflet and input html
//
function createNewTrek() {

    addDrawTools();

    var html = "";
    html += "<tr>";
    html += "<td> Nom du trek </td>";
    html += "<td> Distance du trek </td>";
    html += "<td> Temps estimés </td>";
    html += "<td> Niveau de difficulté </td>";
    html += "</tr>";

    html += "<tr>";
    html += "<td>" + '<textarea name="" id="nom"></textarea>' + "</td>";
    html += "<td>" + '<textarea name="" id="distance", readonly></textarea>' + "</td>";
    html += "<td>" + '<textarea  name="" id="temps"></textarea>' + "</td>";
    html += "<td>" + '<textarea  name="" id="difficulte"></textarea>' + "</td>";
    html += "</tr>";

    document.getElementById('idTableau').innerHTML = html;

    show_btn('.save');
    show_btn('.reset');
    hide_btn('.detail');
    hide_btn('.newtrek');
}

//
// Load trek list in combobox
//
function loadTreks() {
    $http.get('/api-rest/treks', function(res) {
        _treks = res;
        buildCombo();
    }, 'json');
    show_btn('.newtrek');
}

//
// Add trek
//
function addTrek() {
    hide_btn('.save');
    show_btn('.newtrek');

    let trek_path = document.chemin_trek;

    var input = {
        'label': document.getElementById('nom').value,
        'length': document.getElementById('distance').value,
        'time': document.getElementById('temps').value,
        'level': document.getElementById('difficulte').value,
        'pathway': { 'chemin': trek_path }
    };

    $http.post('/api-rest/treks', input, function(res) {
        if (res.trek.id !== 0) {
            _treks.push(res.trek);
        }
        infoTrek(_treks.length - 1);
    }, 'json');
    document.getElementById('messageToUser').innerHTML = 'success!';
    loadTreks();
}

//
// Hide / Show drawing buttons
//
function hide_btn(id) {
    if (document.querySelector(id).style.visibility === "visible") {
        document.querySelector(id).style.visibility = "";
    }
};

function show_btn(id) {
    if (document.querySelector(id).style.visibility === "") {
        document.querySelector(id).style.visibility = "visible";
    }
};

//
// Reset Page
//
function resetPage() {
    window.location.reload();
};
window.onload = loadTreks();