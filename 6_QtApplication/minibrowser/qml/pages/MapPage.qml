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
    property bool startNewTrek : false
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

        onActiveChanged: {
            var coord = gpsPosition.position.coordinate;
            if (root.gpsActive && startNewTrek)
            {
//                MyContext.startTrek(trekName, 43.48, 3.26);
//                MyContext.updateTrek(43.465, 3.25);
//                MyContext.updateTrek(43.475, 3.255);
                MyContext.startTrek(trekName, coord.latitude, coord.longitude);
                startNewTrek = false;
            }
        }

        onPositionChanged: {
            var coord = gpsPosition.position.coordinate;
            if (root.gpsActive)
//            {
//            if (MyContext.myTrek.path.length == 0)
//            {
//                MyContext.startTrek(trekName, coord.latitude, coord.longitude);
//            }
//            else
            {
                MyContext.updateTrek(coord.latitude, coord.longitude);
            }
//            }
        }
    }

}
