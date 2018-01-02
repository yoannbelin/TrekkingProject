var _treks = [];

/**
 * Build Combobox
 */
function buildCombo() {
    var html = "";
    html += "<option disabled selected>" + "Selectionner votre trek" + "</option>"
    _treks.forEach((option) => {
        html += "<option data-id= " + option.id + ">" + option.label + "</option>";
    })
    document.getElementById("idCombo").innerHTML = html;
}

/**
 Changement de page
 */
function infoTrek(i) {
    afficher_btn('.raz');
    afficher_btn('.detail');
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
    itineraire(datas);
}

/**
 * Créer un nouveau Trek
 */
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

    afficher_btn('.save');
    afficher_btn('.raz');
    cacher_btn('.detail');
    cacher_btn('.newtrek');
}


/**
 * Load treks list
 */
function loadTreks() {
    $http.get('/api-rest/treks', function(res) {
        _treks = res;
        buildCombo();
    }, 'json');
    afficher_btn('.newtrek');
}

/**
 * Add trek
 */
function addTrek() {
    cacher_btn('.save');
    afficher_btn('.newtrek');

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

/**
 * Afficher / Cacher les buttons
 */
function cacher_btn(id) {
    if (document.querySelector(id).style.visibility === "visible") {
        document.querySelector(id).style.visibility = "";
    }
}

function afficher_btn(id) {
    if (document.querySelector(id).style.visibility === "") {
        document.querySelector(id).style.visibility = "visible";
    }
}

/**
 * Reset Page
 */
function resetPage() {
    window.location.reload();
}
window.onload = loadTreks();