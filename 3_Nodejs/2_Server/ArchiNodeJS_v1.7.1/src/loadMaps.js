var _treks = [];
var selectedTrek = null;

function buildListTreks() {
    var html = "";
    html += "<tr>";
    html += "<td> Nom du trek </td>";
    html += "</tr>";

    for (var i = 0; i < _treks.length; i++) {
        html += "<tr id=row_" + i + " onClick=\"selectUser(" + i + ")\">";
        html += "<td onClick=\"test(" + i + ")\">" + _treks[i].label + "</td>";
    }
    /**
     * Build table
     */
    function buildTable() {
        var html = "";
        html += "<tr>";
        html += "<td> Nom du trek </td>";
        html += "<td> Distance du trek </td>";
        html += "<td> Temps estimés </td>";
        html += "<td> Niveau de difficulté </td>";
        html += "</tr>";

        for (var i = 0; i < _treks.length; i++) {
            html += "<tr id=row_" + i + " onClick=\"selectUser(" + i + ")\">";
            html += "<td onClick=\"test(" + i + ")\">" + _treks[i].label + "</td>";
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

            document.getElementById('nom').value = _treks[index]['label'];
            document.getElementById('distance').value = _treks[index]['length'];
            document.getElementById('temps').value = _treks[index]['time'];
            document.getElementById('difficulté').value = _treks[index]['level'];

            selectedTrek = _treks[index];
        }
    }

    /**
     * Load treks list
     */
    function loadTreks() {
        $http.get('/api-rest/treks', function(res) {
            _treks = res;
            buildListTreks();
        }, 'json');
    }

    /**
     * Add trek
     */
    function addTrek() {
        var input = {
            'label': document.getElementById('nom').value,
            'length': document.getElementById('distance').value,
            'time': document.getElementById('temps').value,
            'level': document.getElementById('difficulté').value
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
            'label': document.getElementById('nom').value,
            'length': document.getElementById('distance').value,
            'time': document.getElementById('temps').value,
            'level': document.getElementById('difficulté').value
        };

        $http.update('/api-rest/treks/' + selectedTrek.id, input, function(res) {
            _treks[_treks.indexOf(selectedTrek)] = res.trek;
            buildTable();
        }, 'json');
    }
 window.onload = loadTreks()