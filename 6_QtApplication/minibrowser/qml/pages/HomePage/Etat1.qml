import QtQuick 2.9
import QtQuick.Controls 2.2
import QtWebView 1.1
import QtQuick.Layouts 1.1
import QtQuick.Controls.Styles 1.2
import QtQuick.Window 2.2

import "../../modules"
import "../../../images"

ColumnLayout {
    id : etat

    anchors.fill: parent
    anchors.top : header.bottom
    spacing: 0

    RowLayout {
        spacing: 0
        Layout.preferredHeight: 0.25*parent.height
        Layout.fillHeight: true
        Layout.fillWidth: true

        Rectangle {
            Layout.fillHeight: true
            Layout.fillWidth: true
            //color: "red"
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

            InputBox {
                id : pseudo
                placeholderText: "Entrer votre pseudo"
            }
        }
    } //fin rowlayout

    RowLayout {
        spacing: 0
        Layout.preferredHeight: (1/8)*parent.height
        Layout.fillHeight: true
        Layout.fillWidth: true

        Rectangle {
            Layout.fillHeight: true
            Layout.fillWidth: true
            //color: "red"

            InputBox {
                id : mdp
                placeholderText: "Entrer votre mot de passe"
            }
        }
    } //fin rowlayout

    RowLayout {
        spacing: 0
        Layout.preferredHeight: 0.25*parent.height
        Layout.fillHeight: true
        Layout.fillWidth: true

        Rectangle {
            Layout.fillHeight: true
            Layout.fillWidth: true
            //color: "red"

            MyButton {
                text : "Log In"
                height: etat.height / 15
                width: etat.width /3
            }
        }

        Rectangle {
            Layout.fillHeight: true
            Layout.fillWidth: true
            //color: "red"

            MyButton {
                text : "Sign Up"
                height: etat.height / 15
                width: etat.width /3
            }
        }
    } //fin rowlayout

    RowLayout {
        spacing: 0
        Layout.preferredHeight: 0.25*parent.height
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

} //fin columnlayout


