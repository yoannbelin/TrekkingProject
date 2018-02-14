import QtQuick 2.9
import QtQuick.Controls 2.2

TextField {
    id : label
    text : ""

    font.family: "Californian FB"
    font.pixelSize: Qt.application.font.pixelSize * 1.5

    horizontalAlignment: TextInput.AlignHCenter
    verticalAlignment: TextInput.AlignVCenter

    anchors.centerIn : parent
}
