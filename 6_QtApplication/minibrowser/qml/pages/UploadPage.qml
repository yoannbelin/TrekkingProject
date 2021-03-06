import QtQuick 2.9
import QtQuick.Controls 2.2
import QtQuick.Layouts 1.1
import QtQuick.Controls.Styles 1.2

import "../modules"
import "UploadPage"

Page {
    id : uploadPage

    property bool upload1_visibilite: true

    header: Label {
        text: qsTr("Upload Page")
        font.pixelSize: Qt.application.font.pixelSize * 2
        font.family: "acumin-pro"
        padding: 10
    }

    Etat1 {
        id : etat1
        visible: upload1_visibilite
    }

}
