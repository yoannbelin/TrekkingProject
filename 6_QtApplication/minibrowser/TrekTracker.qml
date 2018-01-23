import QtQuick 2.9
import QtQuick.Controls 2.2
import QtWebView 1.1
import QtQuick.Layouts 1.1
import QtQuick.Controls.Styles 1.2


Page {
    header: Label {
        text: qsTr("Trek Tracker")
        font.pixelSize: Qt.application.font.pixelSize * 2
        padding: 10
    }

    Column{
        spacing: 10

        Row{
            spacing: 10

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
        }

            TextArea {
                id : test
                text : "enregistrement : " + MyContext.myTrek.test
                font.family: "Calibri"
                font.pointSize: 11
                width: 300
                verticalAlignment : TextEdit.AlignVCenter
                selectByMouse: true
                wrapMode: TextEdit.Wrap
            }

        Text{
            id: trekName
            text: "Trek Name: " + "TBC"
        }

        Text{
            id: runningTime
            text: "Time: " + "--:--:--"
        }

        Text{
            id: distanceTravelled
            text: "Distance: " + "0.00" + "km"
        }

        Text{
            id: photoCount
            text: "Photos taken: " + "00"
        }
    }
}
