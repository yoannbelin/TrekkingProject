import QtQuick 2.3
import QtQuick.Controls 1.2
import QtQuick.Dialogs 1.2

Dialog {

    property string titre: "titre de la boite Dialog"
    property string instruction: "instruction"

    width: 300
    height: 200

    //visible: true

    title: titre

    standardButtons: Dialog.Yes | Dialog.No
    onAccepted: console.log(label.text)
    onRejected: console.log("abandon")

    Column {
        anchors.fill: parent
        spacing: 0

        Row {
            height: (1/2)*parent.height
            width : parent.width

            Rectangle {
                anchors.fill: parent
                //color: "red"

                Text {
                    text : instruction

                    font.family: "Calibri"
                    font.pixelSize: Qt.application.font.pixelSize * 1.5
                    font.bold: true

                    anchors.centerIn : parent

                }
            }
        }

    }
}
