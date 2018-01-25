import QtQuick 2.9
import QtQuick.Controls 2.2
import QtQuick.Layouts 1.1
import QtQuick.Controls.Styles 1.2

import "../../modules"
import "../../../images"

ColumnLayout {
    id : etat

    anchors.fill: parent
    anchors.top : header.bottom
    spacing: 0

    RowLayout {
        spacing: 0
        Layout.preferredHeight: (15/36)*parent.height
        Layout.fillHeight: true
        Layout.fillWidth: true

        Rectangle {
            Layout.fillHeight: true
            Layout.fillWidth: true
            //color: "lightBlue"

            Text {
                id : label
                text : "Bonjour" + "\n" + "utilisateur"

                font.family: "Calibri"
                font.pixelSize: Qt.application.font.pixelSize * 3
                font.bold: true
                font.capitalization: Font.SmallCaps

                anchors.centerIn : parent
                horizontalAlignment: Text.AlignHCenter

            }
        }
    }

    RowLayout {
        id : erreur
        visible: true

        spacing: 0
        Layout.preferredHeight: (2/9)*parent.height
        Layout.fillHeight: true
        Layout.fillWidth: true

        Rectangle {
            Layout.fillHeight: true
            Layout.fillWidth: true
            //color: "grey"

            ErrorBox {
                height : parent.height
                width : parent.width

                anchors.centerIn : parent
            }
        }
    } //fin rowlayout

    RowLayout {
        id : boutons
        visible: true

        spacing: 0
        Layout.preferredHeight: (1/9)*parent.height
        Layout.fillHeight: true
        Layout.fillWidth: true

        Rectangle {
            Layout.fillHeight: true
            Layout.fillWidth: true
            //color: "red"

            MyButton {
                id : saveButton
                visible: true

                text : "Sauver"
                height: etat.height / 15
                width: etat.width /3
                onClicked: console.log("switch to UploadPage")
            }

            MyButton {
                id: continueButton
                visible : false

                text : "Continuer"
                height: etat.height / 15
                width: etat.width /3
                onClicked: console.log("switch to TrekTracker")
            }
        }

        Rectangle {
            Layout.fillHeight: true
            Layout.fillWidth: true
            //color: "red"

            MyButton {
                id: deleteButton
                visible : true

                text : "Effacer"
                height: etat.height / 15
                width: etat.width /3
                onClicked: dialog.visible = true
            }
        }
    } //fin rowlayout

    RowLayout {
        spacing: 0
        Layout.preferredHeight: (1/4)*parent.height
        Layout.fillHeight: true
        Layout.fillWidth: true

        Rectangle {
            Layout.fillHeight: true
            Layout.fillWidth: true
            //color: "blue"

            Image {
                id: logoAfpa
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.bottom: parent.bottom
                source: "../../../images/logoAfpa.jpg"
            }
        }
    } // fin RowLayout

    MyDialog {
        id : dialog
        titre: ""
        instruction: "Are you sure ?"
    }

} //fin columnlayout



