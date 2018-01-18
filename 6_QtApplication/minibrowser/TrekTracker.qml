import QtQuick 2.2
import QtQuick.Controls 1.1
import QtWebView 1.1
import QtQuick.Layouts 1.1
import QtQuick.Controls.Styles 1.2

Item {
    Column{

        MyButton{
            id: startTrekButton
            text: "Start Trek"
            visible: true
            onClicked:
            {
                gpsPosition.active = true
                startTrekButton.visible = false
                pauseTrekButton.visible = true
            }
        }

        MyButton{
            id: pauseTrekButton
            text: "Pause Trek"
            visible: false
            onClicked: {
                gpsPosition.active = false
                pauseTrekButton.visible = false
                startTrekButton.visible = true
            }
        }

        TextArea {
            id : test
            text : "enregistrement : " + MyContext.myTrek.test
            font.family: "Calibri"
            font.pointSize: 11
            verticalAlignment : TextEdit.AlignVCenter
            selectByMouse: true
            wrapMode: TextEdit.Wrap
        }

    }
}
