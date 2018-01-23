import QtQuick 2.9
import QtQuick.Controls 2.2
import QtWebView 1.1
import QtQuick.Layouts 1.1
import QtQuick.Controls.Styles 1.2

import QtPositioning 5.8

import "../qml/modules"
import "../qml/pages"



ApplicationWindow {
    //    property bool showProgress: webView.loading
    //                                && Qt.platform.os !== "ios"
    //                                && Qt.platform.os !== "winrt"
    visible: true
    x: 20
    y: 20
    width: 1280
    height: 1024
    title: "yepyep"

    header: MyToolBar{
        id: tabBar
    }

    PositionSource{
        id: gpsPosition
        updateInterval: 3000
        active: false

        onPositionChanged: {
            var coord = gpsPosition.position.coordinate;
            //            if ( !isNaN(coord.latitude) && !isNaN(coord.longitude) ){
            MyContext.updateTrek("new Gps Point sent", coord.latitude, coord.longitude);


            //            }
        }
    }

    /// This Status Bar is temporary
//    footer: StatusBar {
//        id: statusBar
//        Label {
//            id: statusBarLabel
//            //              text: "lat: " + gpsPosition.position.coordinate.latitude + " ; lng: " + gpsPosition.position.coordinate.longitude
//            text:   "lat: " + MyContext.myTrek.path[MyContext.myTrek.path.length-1].latitude +
//                    "long " + MyContext.myTrek.path[MyContext.myTrek.path.length-1].longitude
//        }
//    }

    SwipeView{
        id: swipeView
        anchors.fill: parent
        currentIndex: tabBar.currentIndex

        WebPage{
            id: webPage
        }

        TrekTracker{
            id: trekPage
        }

        CurrentTrekPage{
            id: currentTrekPage
        }

        PhotoPage{
            id: photoPage
        }

        UploadPage{
            id: uploadPage
        }

    }
}
