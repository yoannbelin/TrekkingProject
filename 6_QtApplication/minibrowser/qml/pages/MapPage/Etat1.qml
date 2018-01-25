import QtQuick 2.9
import QtQuick.Controls 2.2
import QtQuick.Layouts 1.1
import QtQuick.Controls.Styles 1.2

import QtWebView 1.1

import "../../modules"
import "../../../images"

ColumnLayout {

    id : etat

    anchors.fill: parent
    Layout.fillHeight: true
    Layout.fillWidth: true
    spacing: 0


    Rectangle {

        Layout.fillHeight: true
        Layout.fillWidth: true
        //color: "red"

        MyMap{
            id: myMap

        }
    }
}
