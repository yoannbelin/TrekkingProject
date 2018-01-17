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
function saveUpdatePhoto() {

    var input = {
        'create_at': document.getElementById('create_at').value,
        'content': document.getElementById('content').value
    };
    $http.update('/api-rest/photos/' + selectedPhoto.idPhoto, input, function(res) {
        _photos[_photos.indexOf(selectedPhoto)] = res.photo;
        buildTable();
    }, 'json');
}

function updatePhoto() {
    document.querySelector("#titleDiv").style.display = (window.getComputedStyle(document.querySelector('#labelDiv')).display == 'none') ? "block" : "none";
    hide_btn('.update');
    show_btn('.delete');
    show_btn('.saveupdate');
    show_btn('.cancelupdate');
}

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


window.onload = loadPhotos()