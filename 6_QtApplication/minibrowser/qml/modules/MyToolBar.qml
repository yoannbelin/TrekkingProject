import QtQuick 2.9
import QtQuick.Controls 2.2
//import QtWebView 1.1
import QtQuick.Layouts 1.1
import QtQuick.Controls.Styles 1.2

import QtPositioning 5.8

//import "JSControl.js" as JSC

TabBar {
    currentIndex: swipeView.currentIndex

    TabButton {
        Image {
            source: "../../../images/icon/home_logo.png"
            anchors.verticalCenter: parent.verticalCenter
            anchors.horizontalCenter: parent.horizontalCenter

        }
    }

    TabButton {
        Image {
            source: "../../../images/icon/trekking_icon.png"
            anchors.verticalCenter: parent.verticalCenter
            anchors.horizontalCenter: parent.horizontalCenter

        }
    }

    TabButton {
        Image {
            source: "../../../images/icon/current_trek_icon.png"
            anchors.verticalCenter: parent.verticalCenter
            anchors.horizontalCenter: parent.horizontalCenter

        }
    }

    TabButton {
        Image {
            source: "../../../images/icon/camera_icon.png"
            anchors.verticalCenter: parent.verticalCenter
            anchors.horizontalCenter: parent.horizontalCenter

        }
    }

    TabButton {
        Image {
            source: "../../../images/icon/upload_icon.png"
            anchors.verticalCenter: parent.verticalCenter
            anchors.horizontalCenter: parent.horizontalCenter

        }
    }

//    ToolButton {
//        id: currentTrekPageButton
//        tooltip: qsTr("Path Page")
//        iconSource: "images/current_trek_icon.png"
//        onClicked: {
//            JSC.call_window(currentTrekPage)
//        }

//        Layout.preferredWidth: parent.height
//        style: ButtonStyle {
//            background: Rectangle { color: "transparent" }
//        }
//    }

//    ToolButton {
//        id: photoPageButton
//        tooltip: qsTr("Photo Page")
//        iconSource: "images/camera_icon.png"
//        onClicked:{
//            JSC.call_window(photoPage)
//        }

//        Layout.preferredWidth: parent.height
//        style: ButtonStyle {
//            background: Rectangle { color: "transparent" }
//        }
//    }

//    ToolButton {
//        id: uploadPageButton
//        tooltip: qsTr("UpLoad Page")
//        iconSource: "images/upload_icon.png"
//        onClicked:{
//            JSC.call_window(uploadPage)
//        }

//        Layout.preferredWidth: parent.height
//        style: ButtonStyle {
//            background: Rectangle { color: "transparent" }
//        }
//    }
//    MyButton{
//        onClicked:
//        {
//            MyContext.updateTrek(32.465996, 45.1645644);
//            //                statusBarLabel.text =   "lat: " + MyContext.myTrek.path[MyContext.myTrek.path.length-1].latitude +
//            //                                        "long " + MyContext.myTrek.path[MyContext.myTrek.path.length-1].longitude;
//        }
//    }
//}
}
