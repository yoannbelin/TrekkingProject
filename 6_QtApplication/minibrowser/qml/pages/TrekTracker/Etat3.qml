import QtQuick 2.9
import QtQuick.Controls 2.2
import QtWebView 1.1
import QtQuick.Layouts 1.1
import QtQuick.Controls.Styles 1.2

import "../../modules"

ColumnLayout {
    id : etat
    anchors.fill: parent
    spacing: 0


    RowLayout { //rowlayout 1
        spacing: 0
        Layout.preferredHeight: 0.25*parent.height
        Layout.fillHeight: false
        Layout.fillWidth: true

        Rectangle {
            Layout.fillHeight: true
            Layout.fillWidth: true
            //color: "red"

            Text {
                id : label
                text : "Titre du treck"

                font.family: "Calibri"
                font.pixelSize: Qt.application.font.pixelSize * 3
                font.bold: true
                font.capitalization: Font.SmallCaps

                anchors.centerIn : parent
            }
        }
    } // fin rowlayout 1

    RowLayout { //rowlayout 2
        spacing: 0
        Layout.preferredHeight: 0.5*parent.height
        Layout.fillHeight: false

        ColumnLayout {
            anchors.fill: parent
            spacing: 0

            RowLayout { //rowlayout 2.1
                spacing: 0
                Layout.preferredHeight: (1/5)*parent.height
                Layout.fillHeight: false

                Rectangle {
                    Layout.fillHeight: true
                    Layout.fillWidth: true
                    color: "lightGrey"

                    TextBox {
                        id : tps_estime
                        text : "temps estimé : "
                        visible: true
                    }
                }
            }

            RowLayout { //rowlayout 2.2
                spacing: 0
                Layout.preferredHeight: (1/5)*parent.height
                Layout.fillHeight: false

                Rectangle {
                    Layout.fillHeight: true
                    Layout.fillWidth: true
                    color: "lightGrey"

                    TextBox {
                        id : dist_estimee
                        text : "distance estimé : "
                        visible: true
                    }
                }
            }

            RowLayout { //rowlayout 2.3
                spacing: 0
                Layout.preferredHeight: (1/5)*parent.height
                Layout.fillHeight: false

                Rectangle {
                    Layout.fillHeight: true
                    Layout.fillWidth: true
                    color: "lightGrey"

                    TextBox {
                        id : tps_reel
                        text : "temps réel : "
                        visible: true
                    }
                }
            }

            RowLayout { //rowlayout 2.4
                spacing: 0
                Layout.preferredHeight: (1/5)*parent.height
                Layout.fillHeight: false

                Rectangle {
                    Layout.fillHeight: true
                    Layout.fillWidth: true
                    color: "lightGrey"

                    TextBox {
                        id : dist_reelle
                        text : "distance parcourue : "
                        visible: true
                    }
                }
            }

            RowLayout { //rowlayout 2.5
                spacing: 0
                Layout.preferredHeight: (1/5)*parent.height
                Layout.fillHeight: false

                Rectangle {
                    Layout.fillHeight: true
                    Layout.fillWidth: true
                    color: "lightGrey"

                    TextBox {
                        id : nb_photo
                        text : "nombre de photo prises : "
                        visible: true
                    }
                }
            }

        } //fin columnlayout
    } //fin rowlayout 2


    RowLayout { //rowlayout 3
        spacing: 0
        Layout.preferredHeight: 0.25*parent.height
        Layout.fillHeight: false

        ColumnLayout {
            anchors.fill: parent
            spacing: 0

            RowLayout { //rowlayout 3.1
                spacing: 0
                Layout.preferredHeight: 0.5*parent.height
                Layout.fillHeight: false
                Rectangle {
                    Layout.fillHeight: true
                    Layout.fillWidth: true
                    //color: "lightBlue"

                    MyButton {
                        id : start
                        visible: true

                        text : "Start"
                        height: etat.height / 15
                        width: etat.width / 3
                        onClicked: {
                            pause.visible = true ;
                            start.visible = false ;
                            console.log("start Treck _ debut de la prise de pts GPS") }
                    }

                    MyButton {
                        id : pause
                        visible: false

                        text : "Pause"
                        height: etat.height / 15
                        width: etat.width / 3
                        onClicked: {
                            start.visible = true ;
                            pause.visible = false ;
                            console.log("pause Treck _ arrêt de la prise de pts GPS")}
                    }
                }

                Rectangle {
                    Layout.fillHeight: true
                    Layout.fillWidth: true
                    //color: "darkBlue"

                    MyButton {
                        text : "Stop"
                        height: etat.height / 15
                        width: etat.width / 3
                        onClicked: console.log("stop Treck _ fin de la prise de pts GPS")
                    }
                }
            }

            RowLayout { //rowlayout 3.2
                spacing: 0
                Layout.preferredHeight: 0.5*parent.height
                Layout.fillHeight: false

                Rectangle {
                    Layout.fillHeight: true
                    Layout.fillWidth: true

                    Image {
                        id: logoAfpa
                        anchors.horizontalCenter: parent.horizontalCenter
                        anchors.bottom: parent.bottom
                        source: "../../../images/logoAfpa.jpg"
                    }
                }
            }

        } //fin columnlayout
    } //fin rowlayout 3

}



