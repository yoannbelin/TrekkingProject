import QtQuick 2.9
import QtQuick.Controls 2.2
import QtWebView 1.1
import QtQuick.Layouts 1.1
import QtQuick.Controls.Styles 1.2
import QtQuick.Window 2.2

import "../../modules"
import "../../../images"

ColumnLayout {
    id : etat

    anchors.fill: parent
    spacing: 0


    RowLayout {
        spacing: 0
        Layout.preferredHeight: 0.25*parent.height
        Layout.fillHeight: true
        Layout.fillWidth: true

        Rectangle {
            Layout.fillHeight: false
            Layout.fillWidth: true
            //color: "red"
        }
    }

    RowLayout {
        spacing: 0
        Layout.preferredHeight: (1/8)*parent.height
        Layout.fillHeight: true
        Layout.fillWidth: true

        Rectangle {
            Layout.fillHeight: false
            Layout.fillWidth: true
            //color: "grey"
            MyButton {
                text : "Nouveau Treck"
                height: etat.height / 15
                width: etat.width / 2
                onClicked: form.visible = true
            }
        }
    } // fin RowLayout

    RowLayout {
        spacing: 0
        Layout.preferredHeight: (1/8)*parent.height
        Layout.fillHeight: true
        Layout.fillWidth: true

        Rectangle {
            Layout.fillHeight: false
            Layout.fillWidth: true
            //color: "grey"
            MyButton {
                text : "Charger un Treck"
                height: etat.height / 15
                width: etat.width / 2
                onClicked: {
                    etat2.visible = true
                    etat1.visible = false
                }

            }
        }
    } // fin RowLayout

    RowLayout {
        spacing: 0

        Layout.preferredHeight: 0.25*parent.height
        Layout.fillHeight: true
        Layout.fillWidth: true


        Rectangle {
            Layout.fillHeight: true
            Layout.fillWidth: true
            //color: "darkGreen"

            ErrorBox {
                height : parent.height
                width : parent.width

                anchors.centerIn : parent
            }
        }

    } //fin RowLayout

    RowLayout {
        spacing: 0
        Layout.preferredHeight: 0.25*parent.height
        Layout.fillHeight: true
        Layout.fillWidth: true


        Rectangle {
            Layout.fillHeight: true
            Layout.fillWidth: true
            //color: "blue"

            Image {
                id: logoAfpa
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.bottom: parent.bottom
                source: "../../../images/logoAfpa.jpg"
            }


        }
    } // fin RowLayout

    MyDialog {
        id : form
        titre: "Enter le nom de votre treck"
    }

}



