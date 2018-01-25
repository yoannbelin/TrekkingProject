import QtQuick 2.0
import QtQuick.Window 2.0
import QtLocation 5.6
import QtPositioning 5.6

import "../javascript/JSControl.js" as JSC

Item{
    property var pathway : []
    anchors.fill: parent
    Plugin {
        id: mapPlugin
        name: "osm"
    }

    Map {
        anchors.fill: parent
        plugin: mapPlugin
        center: QtPositioning.coordinate(JSC.lastLat(), JSC.lastLng()) // Oslo
        zoomLevel: 14

        MapPolyline {
            id: lineOfPathway
            line.width: 3
            line.color: 'green'
            path: JSC.pathwayToJSon()
//                  [
//                  { latitude: 43.462, longitude: 3.2527},
//                  { latitude: 43.462, longitude: 3.2527},
//                  { latitude: 43.463, longitude: 3.2528},
//                  { latitude: 43.464, longitude: 3.252}
//              ]
        }

    }
//    Component.onCompleted: lineOfPathway.path =
}
