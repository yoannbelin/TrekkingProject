import QtQuick 2.9
import QtQuick.Controls 2.2
import QtQuick.Layouts 1.1
import QtQuick.Controls.Styles 1.2

import "../modules"
import "TrekTracker"

Page {
    id : page
    width: 384
    height: 640

    header: Label {
        text: qsTr("Trek Tracker")
        font.pixelSize: Qt.application.font.pixelSize * 2
        padding: 10
    }

    Etat1 {
        id : etat1
        visible: true
        //visible: false
    }

    Etat2 {
        id : etat2
        visible: false
        //visible: true
    }

    Etat3 {
        id : etat3
        visible: false
        //visible: true
    }


}
