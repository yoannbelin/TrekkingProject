import QtQuick 2.9
import QtQuick.Controls 2.2
//import QtWebView 1.1
import QtQuick.Layouts 1.1
import QtQuick.Controls.Styles 1.2
import QtPositioning 5.8

import "MapPage"
import "../javascript/JSControl.js" as JSC

Page {
    id: root
    property bool gpsActive : false
    property var trekName : ""

    Etat0 {
        id : etat0
        //        visible: true
        visible: false
    }

    Etat1 {
        id : etat1
        visible: true
        //        visible: false
    }


    footer: Label {

        text: "lat: " + JSC.lastLat() + ", lng: " + JSC.lastLng()
        font.pixelSize: Qt.application.font.pixelSize * 1.25


    }

    PositionSource{
        id: gpsPosition
        updateInterval: 3000
        active: root.gpsActive

        onPositionChanged: {
            var coord = gpsPosition.position.coordinate;
            if (MyContext.myTrek.path.length == 0)
            {
                MyContext.startTrek(trekName, coord.latitude, coord.longitude);
            }
            else
            {
                MyContext.updateTrek("new Gps Point sent", coord.latitude, coord.longitude);
            }
        }
    }

}
