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

    //insert camera module

    Rectangle {
        Layout.fillHeight: true
        Layout.fillWidth: true

        MyButton {
            text : "Prendre photo"
            height: etat.height / 15
            width: etat.width /3
            onClicked: {
                console.log("Cheeeeese !");
                photo1_visibilite = false ;
                photo2_visibilite = true ;
            }
        }
    }
}

