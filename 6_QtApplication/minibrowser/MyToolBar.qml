import QtQuick 2.2
import QtQuick.Controls 1.1
import QtWebView 1.1
import QtQuick.Layouts 1.1
import QtQuick.Controls.Styles 1.2

import QtPositioning 5.8

import "JSControl.js" as JSC

ToolBar {
    RowLayout {
        anchors.fill: parent
        spacing: 0

        ToolButton {
            id: webPageButton
            tooltip: qsTr("Website")
            iconSource: "images/browser_icon.png"
            onClicked: {
                JSC.call_window(webPage)
            }
            Layout.preferredWidth: parent.height
            style: ButtonStyle {
                background: Rectangle { color: "transparent" }
            }
        }

        ToolButton {
            id: trekPageButton
            tooltip: qsTr("Trek Page")
            iconSource: "images/trekking_icon.png"
            onClicked: {
                JSC.call_window(trekPage)
            }

            Layout.preferredWidth: parent.height
            style: ButtonStyle {
                background: Rectangle { color: "transparent" }
            }
        }

        ToolButton {
            id: currentTrekPageButton
            tooltip: qsTr("Path Page")
            iconSource: "images/current_trek_icon.png"
            onClicked: {
                JSC.call_window(currentTrekPage)
            }

            Layout.preferredWidth: parent.height
            style: ButtonStyle {
                background: Rectangle { color: "transparent" }
            }
        }

        ToolButton {
            id: photoPageButton
            tooltip: qsTr("Photo Page")
            iconSource: "images/camera_icon.png"
            onClicked:{
                JSC.call_window(photoPage)
            }

            Layout.preferredWidth: parent.height
            style: ButtonStyle {
                background: Rectangle { color: "transparent" }
            }
        }

        ToolButton {
            id: uploadPageButton
            tooltip: qsTr("UpLoad Page")
            iconSource: "images/upload_icon.png"
            onClicked:{
                JSC.call_window(uploadPage)
            }

            Layout.preferredWidth: parent.height
            style: ButtonStyle {
                background: Rectangle { color: "transparent" }
            }
        }
        MyButton{
            onClicked:
            {
                MyContext.updateTrek("new Gps Point sent", 32.465466, 45.1645644);
//                statusBarLabel.text =   "lat: " + MyContext.myTrek.path[MyContext.myTrek.path.length-1].latitude +
//                                        "long " + MyContext.myTrek.path[MyContext.myTrek.path.length-1].longitude;
            }
        }
    }
}
