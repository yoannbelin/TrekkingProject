var _treks = [];

/**
 Changement de page
 */
function infoTrek(i) {
    var html = "";
    html += "<ul>";
    html += "<li> Nom du trek </li>";
    html += "<li> Distance du trek </li>";
    html += "<li> Temps estimés </li>";
    html += "<li> Niveau de difficulté </li>";
    html += "</ul>";

    document.getElementById('idListInfo').innerHTML = html;
}

/**
 * Mise à jour du Trek
 */
function updateTrek() {
    show_btn('.saveupdate');
    show_btn('.delete');
    show_btn('.cancelupdate');
    hide_btn('.update');
}

/**
 * Suppression du Trek
 */
function deleteTrek() {
    hide_btn('.saveupdate');
    hide_btn('.cancelupdate');
    hide_btn('.delete');
    show_btn('.update');
}

/**
 * Sauvegarder les modification du Trek
 */
function saveupdate() {
    hide_btn('.saveupdate');
    hide_btn('.cancelupdate');
    hide_btn('.delete');
    show_btn('.update');
}

/**
 * Annuler les modification du Trek
 */
function cancelupdate() {
    hide_btn('.saveupdate');
    hide_btn('.cancelupdate');
    hide_btn('.delete');
    show_btn('.update');
}

/**
 * Afficher / Cacher les buttons
 */
function hide_btn(id) {
    if (document.querySelector(id).style.visibility === "visible") {
        document.querySelector(id).style.visibility = "";
    }
}

function show_btn(id) {
    if (document.querySelector(id).style.visibility === "") {
        document.querySelector(id).style.visibility = "visible";
    }
}

/**
 * Load treks list
 */
function loadTreks() {
    infoTrek();
    $http.get('/api-rest/treks', function(res) {
        _treks = res;
    }, 'json');
    show_btn('.update');
}

/**
 * Reset Page
 */
function resetPage() {
    window.location.reload();
}

window.onload = loadTreks();