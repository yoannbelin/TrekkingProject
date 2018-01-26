import QtQuick 2.9
import QtQuick.Controls 2.2
//import QtWebView 1.1
import QtQuick.Layouts 1.1
import QtQuick.Controls.Styles 1.2
import QtPositioning 5.8


import "MapPage"

Page {
    id : mapPage

    property bool map0_visibilite: true
    property bool map1_visibilite: false

    Etat0 {
        id : etat0
        visible: map0_visibilite
    }

    Etat1 {
        id : etat1
        visible: map1_visibilite
    }


    footer: Label {
        text: "lat ; lng"
        font.pixelSize: Qt.application.font.pixelSize * 1.25
        font.family: "Calibri"

    }

    PositionSource{
        id: gpsPosition
        updateInterval: 3000
        active: false

        onPositionChanged: {
            var coord = gpsPosition.position.coordinate;
            MyContext.updateTrek("new Gps Point sent", coord.latitude, coord.longitude);
        }
    }

}
