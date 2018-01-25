import QtQuick 2.9
import QtQuick.Controls 2.2
import QtQuick.Layouts 1.1
import QtQuick.Controls.Styles 1.2

import QtWebView 1.1

import "../../modules"

ColumnLayout {

    id : etat

    anchors.fill: parent
    Layout.fillHeight: true
    Layout.fillWidth: true

    spacing: 0

    RowLayout {
        spacing: 0
        Layout.preferredHeight: (1/12)*parent.height
        Layout.fillHeight: true
        Layout.fillWidth: true

        Rectangle {
            Layout.fillHeight: true
            Layout.fillWidth: true
            //color: "blue"

            TextBox {
                text : "Etat actuel de la sauvegarde : "

                anchors.verticalCenter: parent.verticalCenter
                anchors.horizontalCenter: parent.horizontalCenter
            }
        }
    }

    RowLayout {
        spacing: 0
        Layout.preferredHeight: (5/12)*parent.height
        Layout.fillHeight: true
        Layout.fillWidth: true

        Rectangle {
            Layout.fillHeight: true
            Layout.fillWidth: true
            //color: "yellow"

            TextBox {
                id : localStorageStatus
                text : "aucune sauvegarde"

                anchors.verticalCenter: parent.verticalCenter
                anchors.horizontalCenter: parent.horizontalCenter

            }


        }
    }

    RowLayout {
        spacing: 0
        Layout.preferredHeight: (1/8)*parent.height
        Layout.fillHeight: true
        Layout.fillWidth: true

        Rectangle {
            Layout.fillHeight: true
            Layout.fillWidth: true
            //color: "grey"

            MyButton {
                text : "Sauvegarder"
                height: etat.height / 15
                width: etat.width / 3

                onClicked: console.log("sauvegarde de la photo & edition du LocalFile")
            }
        }

        Rectangle {
            Layout.fillHeight: true
            Layout.fillWidth: true
            //color: "grey"

            MyButton {
                text : "Supprimer"
                height: etat.height / 15
                width: etat.width / 3

                onClicked: { dialog.visible = true }
            }
        }
    }

    RowLayout {
        spacing: 0
        Layout.preferredHeight: (1/8)*parent.height
        Layout.fillHeight: true
        Layout.fillWidth: true

        Rectangle {
            Layout.fillHeight: true
            Layout.fillWidth: true
            //color: "red"

            ErrorBox {
                height : parent.height
                width : parent.width

                anchors.centerIn : parent

            }
        }
    }


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
}
