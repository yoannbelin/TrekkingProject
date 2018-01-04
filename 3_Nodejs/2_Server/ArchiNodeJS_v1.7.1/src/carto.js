var CartoManager = {

map : new L.map('map'),
_polyline: "",
drawnItems: "",

//Get GPS points (json object of Leaflet) of a drawn trail 
outputPoints: function (datas) {
    var points = datas;
    return datas;
},

//Get length of a drawn trail
outputLength: function (data) {
    var length_in_km = data / 1000;
    document.getElementById('distance').innerHTML = CartoManager._round(length_in_km, 2);
},

// Rounded
_round: function (num, len) {
    return Math.round(num * (Math.pow(10, len))) / (Math.pow(10, len));
},

// Truncation of GPS point
strLatLng: function (latlng) {
    return "(" + this._round(latlng.lat, 6) + ", " + this._round(latlng.lng, 6) + ")";
},


// Initialization map
init: function () {

    this.map.setView([43.58506, 3.86021], 10);

    // Load Tiles of map
    var tuile = 'http://{s}.tile.osm.org/{z}/{x}/{y}.png';
    var attrib = '&copy; <a href="http://www.openstreetmap.org/copyright">OpenStreetMap</a>';

    _osm = L.tileLayer(tuile, {
        attribution: attrib,
        maxZoom: 18,
        minZoom: 5
    }).addTo(this.map);

    // Add tile's selector
    this.drawnItems = L.featureGroup().addTo(this.map);

    L.control.layers({
        'osm': _osm.addTo(this.map),
        'google': L.tileLayer('http://www.google.cn/maps/vt?lyrs=s@189&gl=cn&x={x}&y={y}&z={z}', {
            attribution: 'google',
            maxZoom: 18,
            minZoom: 5
        })
    }, {
            'drawlayer': this.drawnItems
        }, {
            position: 'topleft',
            collapsed: false
        }).addTo(this.map);

    this.addKmlLayers();
},

// Add drawing Tools
addDrawTools: function () {

    // Add control buttons
    this.map.addControl(new L.Control.Draw({
        edit: {
            featureGroup: this.drawnItems,
            poly: {
                allowIntersection: false
            }
        },
        draw: {
            polygon: {
                allowIntersection: false,
                showArea: true
            }
        }
    }));

    this.map.on(L.Draw.Event.CREATED, function (event) {
        var layer = event.layer;

        CartoManager.drawnItems.addLayer(layer);
    });


    // Bind trail and information GPS _ Generate a popup content based on layer type
    // - Returns HTML string, or null if unknown object

    var getPopupContent = function (layer) {

        // Marker - add lat/long
        if (layer instanceof L.Marker || layer instanceof L.CircleMarker) {
            return CartoManager.strLatLng(layer.getLatLng());

            // Circle - lat/long, radius
        } else if (layer instanceof L.Circle) {
            var center = layer.getLatLng(),
                radius = layer.getRadius();
            return "Center: " + this.strLatLng(center) + "<br />" +
                "Radius: " + CartoManager._round(radius, 2) + " m";

            // Rectangle/Polygon - area
        } else if (layer instanceof L.Polygon) {

            var latlngs = layer._defaultShape ? layer._defaultShape() : layer.getLatLngs(),
                area = L.GeometryUtil.geodesicArea(latlngs);

            /* return "Area: "+L.GeometryUtil.readableArea(area, true); */
            return "latlngs : " + latlngs

            // Polyline - distance
        } else if (layer instanceof L.Polyline) {

            var latlngs = layer._defaultShape ? layer._defaultShape() : layer.getLatLngs(),
                distance = 0;

            if (latlngs.length < 2) {
                return "Distance: N/A";
            } else {
                for (var i = 0; i < latlngs.length - 1; i++) {
                    distance += latlngs[i].distanceTo(latlngs[i + 1]);
                    /* var datas = latlngs; */
                }
                CartoManager.outputPoints(latlngs);
                CartoManager.outputLength(distance);
                document.chemin_trek = latlngs;

                return "Distance: " + CartoManager._round(distance, 2) + " m";
            }

        }
        return null;
    };

    /* Object created - bind popup to layer, add to feature group */
    this.map.on(L.Draw.Event.CREATED, function (event) {
        var layer = event.layer;
        var content = getPopupContent(layer);
        if (content !== null) {
            layer.bindPopup(content);
        }
        CartoManager.drawnItems.addLayer(layer);
    });

    // Object(s) edited - update popups
    this.map.on(L.Draw.Event.EDITED, function (event) {
        var layers = event.layers,
            content = null;
        layers.eachLayer(function (layer) {
            content = getPopupContent(layer);
            if (content !== null) {
                layer.setPopupContent(content);
            }
        });
    });
},

// Add KML files
addKmlLayers: function () {

    // KML without popups
    /* omnivore.kml('gr-kml/gr60b.kml').addTo(map); */

    // Layers KML with active popups
    var tabKml = [
        '/src/gr-kml/gr7i.kml',
        '/src/gr-kml/gr7j.kml',
        '/src/gr-kml/gr60b.kml',
        '/src/gr-kml/gr71a.kml',
        '/src/gr-kml/gr71b.kml',
        '/src/gr-kml/gr74.kml',
        '/src/gr-kml/gr77.kml',
        '/src/gr-kml/gr653a.kml',
        '/src/gr-kml/gr653c.kml',
        /* 'gr-kml/gr653d.kmz', */
        '/src/gr-kml/grp-larzac.kml'
    ]

    // Change color trails KML
    var customLayer = L.geoJson(null, {
        /* http://leafletjs.com/reference.html#geojson-style */
        style: function (feature) {
            return {
                color: 'purple',
                weight: 2
            };
        }
    });

    // Draw KML trails
    var i = 0;
    while (i < tabKml.length) {

        var runLayer = omnivore.kml(tabKml[i], null, customLayer)
            .on('ready', function () {
                /* map.fitBounds(runLayer.getBounds()); */

                runLayer.eachLayer(function (layer) {
                    layer.bindPopup(layer.feature.properties.name);
                })
            }).addTo(this.map);
        i++
    }
},

// Draw trail from Database
drawTrek: function(datas) {

    var points = datas.chemin;
    var polylinePoints = [];

    for (var i = 0; i < points.length; i++) {
        polylinePoints.push(new L.LatLng(points[i].lat, points[i].lng));
    }

    // Customisation trail
    var polylineOptions = {
        color: 'blue',
        weight: 2,
        opacity: 0.9
    };

    if (this._polyline == "") {
        this._polyline = new L.Polyline(polylinePoints, polylineOptions);
    }
    else {
        console.log(this._polyline);
        this._polyline.setLatLngs(polylinePoints);
    }

    this.map.addLayer(this._polyline);
    this.map.fitBounds(this._polyline.getBounds());
}
};
window.onload = CartoManager.init();