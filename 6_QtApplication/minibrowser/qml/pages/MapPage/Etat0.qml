import QtQuick 2.9
import QtQuick.Controls 2.2
import QtQuick.Layouts 1.1
import QtQuick.Controls.Styles 1.2

import "../../modules"
import "../../../images"

ColumnLayout {

    property bool anime: true
    id : etat

    anchors.fill: parent
    anchors.top : header.bottom
    spacing: 0

    RowLayout {
        spacing: 0
        Layout.preferredHeight: (1/4)*parent.height
        Layout.fillHeight: true
        Layout.fillWidth: true

        Rectangle {
            Layout.fillHeight: true
            Layout.fillWidth: true
            //color: "red"

            Text {
                text : "mode hors connexion"

                font.family: "Calibri"
                font.pixelSize: Qt.application.font.pixelSize * 1
                font.bold: true

                anchors.bottom: parent.bottom
                anchors.horizontalCenter: parent.horizontalCenter
            }
        }
    }

    RowLayout {
        spacing: 0
        Layout.preferredHeight: (1/2)*parent.height
        Layout.fillHeight: true
        Layout.fillWidth: true

        Rectangle {
            Layout.fillHeight: true
            Layout.fillWidth: true
            //color: "lightBlue"

            AnimatedImage { //taille à modifier !
                id: animation
                source: "../../../images/nordic.gif"
                playing: anime
            }

            Rectangle {
                property int frames: animation.frameCount

                width: 4; height: 8
                x: (animation.width - width) * animation.currentFrame / frames
                y: animation.height
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
            //color: "red"
        }
    }






} //fin columnlayout



