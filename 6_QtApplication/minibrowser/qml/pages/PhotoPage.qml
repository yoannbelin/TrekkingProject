import QtQuick 2.9
import QtQuick.Controls 2.2
import QtQuick.Layouts 1.1
import QtQuick.Controls.Styles 1.2

import "../modules"
import "PhotoPage"

Page {
    id : photoPage

    property bool photo1_visibilite: false
    property bool photo2_visibilite: true
    property bool photo3_visibilite: false

    header: Label {
        text: qsTr("Photo")
        font.pixelSize: Qt.application.font.pixelSize * 2
        font.family: "acumin-pro"
        padding: 10
    }

    Etat1 {
        id : etat1
        visible: photo1_visibilite
    }

    Etat2 {
        id : etat2
        visible: photo2_visibilite
    }

    Etat3 {
        id : etat3
        visible: photo3_visibilite
    }


}


