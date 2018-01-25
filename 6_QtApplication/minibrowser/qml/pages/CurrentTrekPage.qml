import QtQuick 2.9
import QtQuick.Controls 2.2
//import QtWebView 1.1
import QtQuick.Layouts 1.1
import QtQuick.Controls.Styles 1.2
import QtPositioning 5.8


import "MapPage"

Page {
//    header: Label {
//        text: "Pixel Ratio: " + pixelRatio + " and Pixel Density: " + pixelDensity
//        font.pixelSize: Qt.application.font.pixelSize * 1
//        padding: 10
//    }

    Etat0 {
        id : etat0
        visible: true
        //visible: false
    }

    footer: Label {
        text: "lat ; lng"
        font.pixelSize: Qt.application.font.pixelSize * 1

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
