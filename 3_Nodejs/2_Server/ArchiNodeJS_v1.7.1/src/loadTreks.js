var LoadTreksManager = new Object();

LoadTreksManager._treks = [];

//
// Build combobox
//
LoadTreksManager.buildCombo = function() {
    var html = "";
    html += "<option disabled selected>" + "Selectionner votre trek" + "</option>"
    _treks.forEach((option) => {
        html += "<option data-id= " + option.id + ">" + option.label + "</option>";
    })
    document.getElementById("idCombo").innerHTML = html;
}

//
//Show trek's characteritics
//
LoadTreksManager.infoTrek = function(i) {
    LoadTreksManager.show_btn('.raz');
    LoadTreksManager.show_btn('.detail');
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
LoadTreksManager.createNewTrek = function() {

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

    LoadTreksManager.show_btn('.save');
    LoadTreksManager.show_btn('.raz');
    LoadTreksManager.hide_btn('.detail');
    LoadTreksManager.hide_btn('.newtrek');
}


//
// Load trek list in combobox
//
LoadTreksManager.loadTreks = function() {
    $http.get('/api-rest/treks', function(res) {
        _treks = res;
        LoadTreksManager.buildCombo();
    }, 'json');
    LoadTreksManager.show_btn('.newtrek');
}

//
// Add trek
//
LoadTreksManager.addTrek = function() {
    LoadTreksManager.hide_btn('.save');
    LoadTreksManager.show_btn('.newtrek');

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
        LoadTreksManager.infoTrek(_treks.length - 1);
    }, 'json');
    document.getElementById('messageToUser').innerHTML = 'success!';
    LoadTreksManager.loadTreks();
}

//
// Hide / Show drawing buttons
//
LoadTreksManager.hide_btn = function(id) {
    if (document.querySelector(id).style.visibility === "visible") {
        document.querySelector(id).style.visibility = "";
    }
};

LoadTreksManager.show_btn = function(id) {
    if (document.querySelector(id).style.visibility === "") {
        document.querySelector(id).style.visibility = "visible";
    }
};

//
// Reset Page
//
LoadTreksManager.resetPage = function() {
    window.location.reload();
}

window.onload = LoadTreksManager.loadTreks();
