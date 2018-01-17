import QtQuick 2.2
import QtQuick.Controls 1.1
import QtWebView 1.1
import QtQuick.Layouts 1.1
import QtQuick.Controls.Styles 1.2

import QtPositioning 5.8



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

    toolBar: MyToolBar{}

    PositionSource{
        id: gpsPosition
        updateInterval: 3000
        active: true

        onPositionChanged: {
            var coord = gpsPosition.position.coordinate;
            //            if ( !isNaN(coord.latitude) && !isNaN(coord.longitude) ){
            MyContext.updateTrek("new Gps Point sent", coord.latitude, coord.longitude);


            //            }
        }
    }

    /// This Status Bar is temporary
    statusBar: StatusBar {
        id: statusBar
        Label {
            id: statusBarLabel
            //              text: "lat: " + gpsPosition.position.coordinate.latitude + " ; lng: " + gpsPosition.position.coordinate.longitude
            text:   "lat: " + MyContext.myTrek.path[MyContext.myTrek.path.length-1].latitude +
                    "long " + MyContext.myTrek.path[MyContext.myTrek.path.length-1].longitude
        }
    }

    Rectangle{

        width: parent.width
        height: parent.height


        WebPage{
            id: webPage
            visible: true
        }

        TrekTracker{
            id: trekPage
            visible: false

        }

        CurrentTrekPage{
            id: currentTrekPage
            visible: false
        }

        PhotoPage{
            id: photoPage
            visible: false
        }

        UploadPage{
            id: uploadPage
            visible: false
        }

    }
}
