import QtQuick 2.9
import QtQuick.Controls 2.2

    TextArea {
        width: 0.95*parent.width
        height: 0.95*parent.height

        anchors.verticalCenter: parent.verticalCenter
        anchors.horizontalCenter: parent.horizontalCenter

        text : ""
        placeholderText: "Ajouter une description"

        readOnly: false

        padding: 5

        font.family: "Californian FB"
        font.pixelSize: Qt.application.font.pixelSize * 1.5

        wrapMode: TextEdit.WrapAnywhere
        selectByMouse: true

        background : Rectangle {
            border.color: "grey"
            color: "white"
        }
    }
