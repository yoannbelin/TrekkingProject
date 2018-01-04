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
    afficher_btn('.saveupdate');
    afficher_btn('.delete');
    afficher_btn('.cancelupdate');
    cacher_btn('.update');
}

/**
 * Suppression du Trek
 */
function deleteTrek() {
    cacher_btn('.saveupdate');
    cacher_btn('.cancelupdate');
    cacher_btn('.delete');
    afficher_btn('.update');
}

/**
 * Sauvegarder les modification du Trek
 */
function saveupdate() {
    cacher_btn('.saveupdate');
    cacher_btn('.cancelupdate');
    cacher_btn('.delete');
    afficher_btn('.update');
}

/**
 * Annuler les modification du Trek
 */
function cancelupdate() {
    cacher_btn('.saveupdate');
    cacher_btn('.cancelupdate');
    cacher_btn('.delete');
    afficher_btn('.update');
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
 * Load treks list
 */
function loadTreks() {
    console.log("loadtrek");
    infoTrek();

    $http.get('/api-rest/treks', function(res) {
        _treks = res;
    }, 'json');
    afficher_btn('.update');
}

/**
 * Reset Page
 */
function resetPage() {
    window.location.reload();
}

window.onload = loadTreks();