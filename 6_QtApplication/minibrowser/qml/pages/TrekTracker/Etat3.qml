import QtQuick 2.9
import QtQuick.Controls 2.2
//import QtWebView 1.1
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
                id : tps_estime
                //visible: true
                visible: false

                spacing: 0
                Layout.preferredHeight: (1/5)*parent.height
                Layout.fillHeight: false

                Rectangle {
                    Layout.fillHeight: true
                    Layout.fillWidth: true
                    color: "lightGrey"

                    TextBox {
                        text : "temps estimé : "
                    }
                }
            }

            RowLayout { //rowlayout 2.2
                id : dist_estimee
                //visible: true
                visible: false

                spacing: 0
                Layout.preferredHeight: (1/5)*parent.height
                Layout.fillHeight: false

                Rectangle {
                    Layout.fillHeight: true
                    Layout.fillWidth: true
                    color: "lightGrey"

                    TextBox {
                        text : "distance estimé : "
                    }
                }
            }

            RowLayout { //rowlayout 2.3
                id : tps_reel
                visible: true

                spacing: 0
                Layout.preferredHeight: (1/5)*parent.height
                Layout.fillHeight: false

                Rectangle {
                    Layout.fillHeight: true
                    Layout.fillWidth: true
                    color: "lightGrey"

                    TextBox {
                        text : "temps réel : "
                    }
                }
            }

            RowLayout { //rowlayout 2.4
                id : dist_reelle
                visible: true

                spacing: 0
                Layout.preferredHeight: (1/5)*parent.height
                Layout.fillHeight: false

                Rectangle {
                    Layout.fillHeight: true
                    Layout.fillWidth: true
                    color: "lightGrey"

                    TextBox {
                        text : "distance parcourue : "
                    }
                }
            }

            RowLayout { //rowlayout 2.5
                id : nb_photo
                visible: true

                spacing: 0
                Layout.preferredHeight: (1/5)*parent.height
                Layout.fillHeight: false

                Rectangle {
                    Layout.fillHeight: true
                    Layout.fillWidth: true
                    color: "lightGrey"

                    TextBox {
                        text : "nombre de photo prises : "
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
                        onClicked: {
                            start.visible = false ;
                            pause.visible = false ;
                            console.log("stop Treck _ fin de la prise de pts GPS")}
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



