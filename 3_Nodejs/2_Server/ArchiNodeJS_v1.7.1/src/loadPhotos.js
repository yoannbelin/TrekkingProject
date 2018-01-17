var _photos = [];
var selectedPhoto = null;

//
// Build table
// 
function buildTable() {

    var html = "";

    for (var i = 0; i < _photos.length; i++) {  
    html += '<div class=\"lien_show\"></div><a href=\"photos/' + _photos[i].id + '\"> <img src=\"' + _photos[i].url + '\" alt=\"photo\"/> </a>'
    }   
    document.getElementById('photos').innerHTML = html;
};

//
// Route to show page
//
function goToShow(i) {
    window.location.href = 'photos/' + _photos[i].idPhoto;
}

// Select Photo in table (hightlight the selected line & insert data in controls)
function selectPhoto(index) {

    console.log("salut");
    // if (index < _photos.length) {
    //     var elems = document.querySelectorAll("tr");

    //     for (var i = 0; i < elems.length; i++) {
    //         elems[i].style.background = "transparent";
    //     }

    //     var elem = document.querySelector("#row_" + index);
    //     elem.style.background = "red";

    //     /*document.getElementById('create at').value = _photos[index]['create_at'];*/
    //     document.getElementById('name').value = _photos[index]['name'];
    //     document.getElementById('num').value = _photos[index]['num'];

    //     selectedPhoto = _photos[index];
    //}
}

//
// Load photos list
//
function loadPhotos() {
    $http.get('/api-rest/photos', function(res) {
        console.log('## fonction load')
        _photos = res;
        buildTable();
        
    }, 'json');
    document.querySelector("#titleDiv").style.display = (window.getComputedStyle(document.querySelector('#titleDiv')).display == 'none') ? "block" : "none";
    document.querySelector("#urlDiv").style.display = (window.getComputedStyle(document.querySelector('#url')).display == 'none') ? "block" : "none";
    document.querySelector("#statusDiv").style.display = (window.getComputedStyle(document.querySelector('#statusDiv')).display == 'none') ? "block" : "none";
    show_btn('.update');
    
}

//
// Add Photo
//
function addPhoto() {
    console.log("trying to add dept")
    var input = {
        'name': document.getElementById('name').value,
        'num': document.getElementById('num').value
    };

    console.log(input);

    $http.post('/api-rest/photos', input, function(res) {
        _photos.push(res.photo);
        buildTable();
    }, 'json');
}

//
// Delete selected photo
//
function delPhoto() {
    $http.delete('/api-rest/photos/' + selectedPhoto.idPhoto, function() {
        _photos.splice(_photos.indexOf(selectedPhoto), 1);
        buildTable();
    });
}

//
// Update selected Photo
//
function saveUpdatePhoto(i) {
    //console.log(document.getElementById('status').value);
    
    var status;

    var element = document.getElementsByName('radio');
    for (var j=0 ; j < element.length ; j++) {
        if (element[j].checked) {
            status = parseInt(element[j].value) ;
        }
    }
    console.log('##' + status);

    var input = {
        'url': document.getElementById('url').value,
        'title': document.getElementById('title').value,
        'private': status
    };

    $http.update('/api-rest/photos/' + i, input, function(res) {
        console.log(input)
        _photos[i] = res.photo;
    }, 'json');
    window.location.href = i;
}

function updatePhoto() {
    document.querySelector("#titleDiv").style.display = (window.getComputedStyle(document.querySelector('#titleDiv')).display == 'none') ? "block" : "none";
    document.querySelector("#statusDiv").style.display = (window.getComputedStyle(document.querySelector('#statusDiv')).display == 'none') ? "block" : "none";
    show_btn('.delete');
    show_btn('.saveupdate');
    show_btn('.cancelupdate');
    hide_btn('.update');
}

/**
     * Discard the changes for the photo
     */
function cancelupdate(i) {
    document.querySelector("#titleDiv").style.display = (window.getComputedStyle(document.querySelector('#titleDiv')).display == 'none') ? "block" : "none";
    show_btn('.update');
    hide_btn('.delete');
    hide_btn('.saveupdate');
    hide_btn('.cancelupdate');
    window.location.href = i;
    }

function hide_btn(id) {
    if (document.querySelector(id).style.visibility === "visible") {
        document.querySelector(id).style.visibility = "hidden";
    }
}

function show_btn(id) {
    if (document.querySelector(id).style.visibility === "") {
        document.querySelector(id).style.visibility = "visible";
    }
}


window.onload = loadPhotos()