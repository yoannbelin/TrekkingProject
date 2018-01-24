import QtQuick 2.9
import QtQuick.Controls 2.2

TextField {
    id : label
    text : ""

    font.family: "Calibri"
    font.pixelSize: Qt.application.font.pixelSize * 1.5

    anchors.centerIn : parent
}
