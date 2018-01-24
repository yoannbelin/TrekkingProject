import QtQuick 2.9
import QtQuick.Controls 2.2


Rectangle {

    property string content: "value = message d'erreur"

    Text {
        id : errorBox
        text : content

        color : "red"
        font.family: "Calibri"
        font.pixelSize: Qt.application.font.pixelSize * 1.5
        font.bold: true

        anchors.centerIn : parent

    }

}
