var LoadTreksManager = {

    selfTreks: undefined,

    _treks: [],

    init: function() {
        selfTreks = this; // pour permettre d'accéder au "this" dans toutes les fonctions (les callBacks par exemple)
        selfTreks.loadTreks();
    },

    //
    // Build combobox
    //
    buildCombo: function() {
        // var html = "";
        // html += "<option disabled selected>" + "Selectionner votre trek" + "</option>"
        // this._treks.forEach((option) => {
        //     html += "<option data-id= " + option.id + ">" + option.label + "</option>";
        // })
        // document.getElementById("idCombo").innerHTML = html;
        var html = "";
        html += "<option disabled selected>" + "Selectionner votre trek" + "</option>";
        html += "<optgroup label=\'Randonnées Officielles\'>"
        selfTreks._treks.forEach((option) => {
            if (option.official === 1) {
                html += "<option data-id= " + option.id + ">" + option.label + "</option>";
            }
        })
        html += "</optgroup>"
        html += "<optgroup label=\'Randonnées Persos\'>"
        selfTreks._treks.forEach((option) => {
            if (option.official === 0) {
                html += "<option data-id= " + option.id + ">" + option.label + "</option>";
            }
        })
        html += "</optgroup>"

        document.getElementById("idCombo").innerHTML = html;
    },

    //
    //Show trek's characteritics
    //
    infoTrek: function(i) {
        this.show_btn('.newtrek');
        this.show_btn('.reset');
        this.show_btn('.detail');
        this.hide_btn('.save');
        var html = "";
        html += "<tr>";
        html += "<td> Nom du trek </td>";
        html += "<td> Distance du trek </td>";
        html += "<td> Temps estimés </td>";
        html += "<td> Niveau de difficulté </td>";
        html += "</tr>";
        html += "<tr>";
        html += "<td>" + selfTreks._treks[i].label + "</td>";
        html += "<td>" + selfTreks._treks[i].length + "</td>";
        html += "<td>" + selfTreks._treks[i].time + "</td>";
        html += "<td>" + selfTreks._treks[i].level + "</td>";
        html += "</tr>";
        document.getElementById('idTableau').innerHTML = html;

        var datas = JSON.parse(selfTreks._treks[i].pathway)
        CartoManager.drawTrek(datas);
    },

    //
    // Add trek by drawing with Leaflet and input html
    //
    createNewTrek: function() {

        CartoManager.addDrawTools();

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

        selfTreks.show_btn('.save');
        selfTreks.show_btn('.reset');
        selfTreks.hide_btn('.detail');
        selfTreks.hide_btn('.newtrek');
    },

    //
    // Load trek list in combobox
    //
    loadTreks: function() {

        $http.get('/api-rest/treks', function(res) {
            selfTreks._treks = res;
            selfTreks.buildCombo();

            selfTreks.show_btn('.newtrek');
        }, 'json');
        selfTreks.show_btn('.update');
    },

    //
    // Add trek
    //
    addTrek: function() {
        selfTreks.hide_btn('.save');
        selfTreks.show_btn('.newtrek');

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
                selfTreks.push(res.trek);
            }
            selfTreks.infoTrek(selfTreks._treks.length - 1);
        }, 'json');
        document.getElementById('messageToUser').innerHTML = 'success!';
        selfTreks.loadTreks();
    },

    /**
     * Affiche details trek
     */
    showTrek: function(i) {
        console.log(selfTreks._treks[i].id);
        window.location.href = 'treks/' + selfTreks._treks[i].id;
    },

    /**
     * Mise à jour du Trek
     */
    updateTrek: function() {
        document.querySelector("#labelDiv").style.display = (window.getComputedStyle(document.querySelector('#labelDiv')).display == 'none') ? "block" : "none";
        document.querySelector("#difficulteDiv").style.display = (window.getComputedStyle(document.querySelector('#difficulteDiv')).display == 'none') ? "block" : "none";
        selfTreks.hide_btn('.update');
        selfTreks.show_btn('.delete');
        selfTreks.show_btn('.saveUpdate');
        selfTreks.show_btn('.cancelupdate');

    },

    /**
     * Suppression du Trek
     */
    deleteTrek: function() {
        window.location.href = '/treks';
    },

    /**
     * Sauvegarder les modification du Trek
     */
    saveUpdate: function() {
        document.querySelector("#labelDiv").style.display = (window.getComputedStyle(document.querySelector('#labelDiv')).display == 'none') ? "block" : "none";
        document.querySelector("#difficulteDiv").style.display = (window.getComputedStyle(document.querySelector('#difficulteDiv')).display == 'none') ? "block" : "none";
        selfTreks.show_btn('.update');
        selfTreks.hide_btn('.delete');
        selfTreks.hide_btn('.saveUpdate');
        selfTreks.hide_btn('.cancelupdate');
    },

    /**
     * Annuler les modification du Trek
     */
    cancelupdate: function() {
        document.querySelector("#labelDiv").style.display = (window.getComputedStyle(document.querySelector('#labelDiv')).display == 'none') ? "block" : "none";
        document.querySelector("#difficulteDiv").style.display = (window.getComputedStyle(document.querySelector('#difficulteDiv')).display == 'none') ? "block" : "none";
        selfTreks.show_btn('.update');
        selfTreks.hide_btn('.delete');
        selfTreks.hide_btn('.saveUpdate');
        selfTreks.hide_btn('.cancelupdate');
    },

    //
    // Hide / Show drawing buttons
    //
    hide_btn: function(id) {
        if (document.querySelector(id).style.visibility === "visible") {
            document.querySelector(id).style.visibility = "";
        }
    },

    show_btn: function(id) {
        if (document.querySelector(id).style.visibility === "") {
            document.querySelector(id).style.visibility = "visible";
        }
    },

    //
    // Reset Page
    //
    resetPage: function() {
        window.location.reload();
    }
};

window.onload = LoadTreksManager.init();