import QtQuick 2.7
import QtQuick.Layouts 1.1
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.4


RowLayout {

    property bool checkedValue: true
    property int switchWidth: 100
    property int switchHeight: 30

    anchors.fill: parent
    spacing: 0

    Rectangle {
        Layout.fillHeight: parent * (2/3)
        Layout.fillWidth: true
        color: "lightBlue"

        Text {
            text : "public"

            font.family: "Calibri"
            font.pixelSize: Qt.application.font.pixelSize * 0.75

            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter
        }
    }

    Rectangle {
        Layout.fillHeight: parent * (2/3)
        Layout.fillWidth: true
        color: "blue"

        Switch {
            checked: checkedValue
            onClicked: {
                checkedValue === true ? checkedValue = false : checkedValue = true
            }

            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.bottom

            style: SwitchStyle {
                groove: Rectangle {
                    implicitWidth: switchWidth
                    implicitHeight: switchHeight
                    radius: 9
                    border.color: control.activeFocus ? "darkblue" : "gray"
                    border.width: 1
                }
            }
        }
    }

    Rectangle {
        Layout.fillHeight: parent * (2/3)
        Layout.fillWidth: true
        color: "lightBlue"

        Text {
            text : "private"

            font.family: "Calibri"
            font.pixelSize: Qt.application.font.pixelSize * 0.75

            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter
        }
    }
}
