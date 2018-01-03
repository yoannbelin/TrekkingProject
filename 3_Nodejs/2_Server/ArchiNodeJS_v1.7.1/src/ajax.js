// Fonctions AJAX

var $http = {
    //
    // GET
    //
    get: function(url, cb, type) {
        var xhr = new XMLHttpRequest();
        xhr.open('GET', url, true);

        xhr.onreadystatechange = function() {
            if (xhr.readyState === 4) {
                if (type == 'json') {
                    cb(JSON.parse(xhr.responseText));
                } else {
                    cb(xhr.responseText);
                }
            }
        }
        xhr.send();
    },

    //
    // POST
    //
    post: function(url, params, cb, type) {
        var xhr = new XMLHttpRequest();
        xhr.open('POST', url, true);

        if (type == 'json') {
            xhr.setRequestHeader('Content-type', 'application/json; charset=utf-8');
            console.log("type cleared");
        } else {
            xhr.setRequestHeader('Content-type', 'application/x-www-form-urlencoded');
        }
        xhr.onreadystatechange = function() {
            if (xhr.readyState === 4) {
                if (type == 'json') {
                    cb(JSON.parse(xhr.responseText));
                    console.log("cb called");
                } else {
                    cb(xhr.responseText);
                }
            }
        }
        console.log(params);
        xhr.send(JSON.stringify(params));
        /* xhr.send(params); */
    },

    //
    // UPDATE
    //
    update: function(url, params, cb, type) {
        var xhr = new XMLHttpRequest();
        xhr.open('PUT', url, true);

        if (type == 'json') {
            xhr.setRequestHeader('Content-type', 'application/json; charset=utf-8');
        } else {
            xhr.setRequestHeader('Content-type', 'application/x-www-form-urlencoded');
        }

        xhr.onreadystatechange = function() {
            if (xhr.readyState === 4) {
                if (type == 'json') {
                    cb(JSON.parse(xhr.responseText));
                } else {
                    cb(xhr.responseText);
                }
            }
        }
        xhr.send(JSON.stringify(params));
    },

    //
    // DELETE
    //
    delete: function(url, cb, type) {
        var xhr = new XMLHttpRequest();

        xhr.open('DELETE', url, true);

        xhr.onreadystatechange = function() {
            if (xhr.readyState === 4) {
                if (type == 'json') {
                    cb(JSON.parse(xhr.responseText));
                } else {
                    cb(xhr.responseText);
                }
            }
        }
        xhr.send();
    }
};