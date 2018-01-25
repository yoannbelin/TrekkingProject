import QtQuick 2.3
import QtQuick.Controls 1.2
import QtQuick.Dialogs 1.2
import QtQuick.Layouts 1.1

import "../javascript/ButtonControl.js"

ColumnLayout {

    property int page: "0"

    anchors.fill: parent
    spacing: 0

    RowLayout {
        spacing: 0
        Layout.preferredHeight: (1/3)*parent.height
        Layout.fillHeight: true
        Layout.fillWidth: true

        Rectangle {
            Layout.fillHeight: true
            Layout.fillWidth: true
            //color: "grey"

            Text {
                text : "Etes vous sûr ?"

                font.family: "Calibri"
                font.pixelSize: Qt.application.font.pixelSize * 1.5
                font.bold: true

                anchors.centerIn : parent
            }
        }
    } //fin rowlayout


    RowLayout {
        spacing: 0
        Layout.preferredHeight: (1/3)*parent.height
        Layout.fillHeight: true
        Layout.fillWidth: true

        Rectangle {
            Layout.fillHeight: true
            Layout.fillWidth: true
            //color: "red"

            MyButton {
                id : valid
                visible: true

                text : "OK"
                height: etat.height / 15
                width: etat.width /3
                onClicked: console.log("valid")
            }
        }

        Rectangle {
            Layout.fillHeight: true
            Layout.fillWidth: true
            //color: "red"

            MyButton {
                id: cancel
                visible : true

                text : "cancel"
                height: etat.height / 15
                width: etat.width /3
                onClicked: uploadCancel(page)
//                {
//                    helloBox.visible = true
//                    boutons.visible = true
//                    check.visible = false
//                    console.log("cancel")
//                }
            }
        }
    }
} //fin rowlayout
