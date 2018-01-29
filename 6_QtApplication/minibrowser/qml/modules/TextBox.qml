import QtQuick 2.9
import QtQuick.Controls 2.2

Text {

    property string titre: "value"

    text : titre

    font.family: "Californian FB"
    font.pixelSize: Qt.application.font.pixelSize * 1.5

    leftPadding: 10
    horizontalAlignment: Text.AlignLeft

    anchors.verticalCenter: parent.verticalCenter
}
