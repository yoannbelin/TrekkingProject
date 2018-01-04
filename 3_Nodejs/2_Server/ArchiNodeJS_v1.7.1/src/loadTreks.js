var LoadTreksManager = {

    _treks: [],

    //
    // Build combobox
    //
    buildCombo: function () {
        var html = "";
        html += "<option disabled selected>" + "Selectionner votre trek" + "</option>"
        this._treks.forEach((option) => {
            html += "<option data-id= " + option.id + ">" + option.label + "</option>";
        })
        document.getElementById("idCombo").innerHTML = html;
    },

    //
    //Show trek's characteritics
    //
    infoTrek: function (i) {
        this.show_btn('.raz');
        this.show_btn('.detail');
        var html = "";
        html += "<tr>";
        html += "<td> Nom du trek </td>";
        html += "<td> Distance du trek </td>";
        html += "<td> Temps estimés </td>";
        html += "<td> Niveau de difficulté </td>";
        html += "</tr>";
        html += "<tr>";
        html += "<td>" + this._treks[i].label + "</td>";
        html += "<td>" + this._treks[i].length + "</td>";
        html += "<td>" + this._treks[i].time + "</td>";
        html += "<td>" + this._treks[i].level + "</td>";
        html += "</tr>";
        document.getElementById('idTableau').innerHTML = html;

        var datas = JSON.parse(this._treks[i].pathway)
        CartoManager.drawTrek(datas);
    },

    //
    // Add trek by drawing with Leaflet and input html
    //
    createNewTrek: function () {

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

        this.show_btn('.save');
        this.show_btn('.raz');
        this.hide_btn('.detail');
        this.hide_btn('.newtrek');
    },

    //
    // Load trek list in combobox
    //
    loadTreks: function () {
        $http.get('/api-rest/treks', function (res) {
            LoadTreksManager._treks = res;
            LoadTreksManager.buildCombo();
        }, 'json');
        this.show_btn('.newtrek');
    },

    //
    // Add trek
    //
    addTrek: function () {
        this.hide_btn('.save');
        this.show_btn('.newtrek');

        let trek_path = document.chemin_trek;

        var input = {
            'label': document.getElementById('nom').value,
            'length': document.getElementById('distance').value,
            'time': document.getElementById('temps').value,
            'level': document.getElementById('difficulte').value,
            'pathway': { 'chemin': trek_path }
        };

        $http.post('/api-rest/treks', input, function (res) {
            if (res.trek.id !== 0) {
                this._treks.push(res.trek);
            }
            this.infoTrek(this._treks.length - 1);
        }, 'json');
        document.getElementById('messageToUser').innerHTML = 'success!';
        this.loadTreks();
    },

    //
    // Hide / Show drawing buttons
    //
    hide_btn: function (id) {
        if (document.querySelector(id).style.visibility === "visible") {
            document.querySelector(id).style.visibility = "";
        }
    },

    show_btn: function (id) {
        if (document.querySelector(id).style.visibility === "") {
            document.querySelector(id).style.visibility = "visible";
        }
    },

    //
    // Reset Page
    //
    resetPage: function () {
        window.location.reload();
    }
};

window.onload = LoadTreksManager.loadTreks();

