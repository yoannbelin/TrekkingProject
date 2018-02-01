import QtQuick 2.9
import QtQuick.Controls 2.2
import QtQuick.Layouts 1.1
import QtQuick.Controls.Styles 1.2

import "../modules"
import "HomePage"

Page {
    id : homePage

    property bool home1_visibilite: (MyContext.user.idUser === 0)
    property bool home2_visibilite: (MyContext.user.idUser !== 0)
    property bool home3_visibilite: false


    header: Label {
        text: qsTr("Home")
        font.pixelSize: Qt.application.font.pixelSize * 2
        font.family: "acumin-pro"
        padding: 10
    }

    Etat1 {
        id : etat1
        visible: home1_visibilite
    }

    Etat2 {
        id : etat2
        visible: home2_visibilite
    }

    Etat3 {
        id : etat3
        visible: home3_visibilite
    }

}


