import QtQuick 2.9
import QtQuick.Controls 2.2
import QtQuick.Layouts 1.1
import QtQuick.Controls.Styles 1.2

import "../../modules"
import "../../../images"

ColumnLayout {

    property string currenturl: "../../../images/defaultPhoto.png"

    id : etat

    anchors.fill: parent
    spacing: 0

    RowLayout {
        spacing: 0
        Layout.preferredHeight: (1/3)*parent.height
        Layout.fillHeight: true
        Layout.fillWidth: true

        Rectangle {
            Layout.fillHeight: true
            Layout.fillWidth: true
            //color: "red"

            Image {
                id: currentPhoto
                source: currenturl

                height: parent.height
                fillMode: Image.PreserveAspectFit
                anchors.horizontalCenter: parent.horizontalCenter
            }
        }
    }

    RowLayout {
        spacing: 0
        Layout.preferredHeight: (13/24)*parent.height
        Layout.fillHeight: true
        Layout.fillWidth: true

        ColumnLayout {
            anchors.fill: parent
            spacing: 0

            Rectangle {
                Layout.fillHeight: true
                Layout.fillWidth: true
                color: "lightBlue"

                InputBox {
                    id : label
                    placeholderText: "titre de la photo"
                }
            }

            RowLayout {
                spacing: 0
                Layout.fillHeight: true
                Layout.fillWidth: true
                Layout.rightMargin: 5
                Layout.leftMargin: 5

                Rectangle {
                    Layout.fillHeight: true
                    Layout.fillWidth: true
                    color: "blue"

                    ComboType {
                        id : poi_type

                        height: etat.height / 15
                        width: parent.width * 0.90
                        anchors.verticalCenter: parent.verticalCenter
                        anchors.horizontalCenter: parent.horizontalCenter

                    }
                }

                Rectangle {
                    Layout.fillHeight: true
                    Layout.fillWidth: true
                    color: "red"
                }
            }

            Rectangle {
                Layout.fillHeight: true
                Layout.fillWidth: true
                color: "lightBlue"
            }

            Rectangle {
                Layout.fillHeight: true
                Layout.fillWidth: true
                color: "blue"
            }

        }
    } // fin RowLayout

    RowLayout {
        spacing: 0
        Layout.preferredHeight: (1/8)*parent.height
        Layout.fillHeight: true
        Layout.fillWidth: true

        Rectangle {
            Layout.fillHeight: true
            Layout.fillWidth: true
            //color: "grey"

            MyButton {
                text : "Sauvegarder"
                height: etat.height / 15
                width: etat.width / 3

                onClicked: console.log("sauvegarde de la photo & edition du LocalFile")
            }
        }

        Rectangle {
            Layout.fillHeight: true
            Layout.fillWidth: true
            //color: "grey"

            MyButton {
                text : "Supprimer"
                height: etat.height / 15
                width: etat.width / 3

                onClicked: { dialog.visible = true }
            }
        }
    } // fin RowLayout



    MyDialog {
        id : dialog
        titre: ""
        instruction: "Are you sure ?"
    }

}



