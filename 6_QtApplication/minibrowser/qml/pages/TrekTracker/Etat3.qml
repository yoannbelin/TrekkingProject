import QtQuick 2.9
import QtQuick.Controls 2.2
//import QtWebView 1.1
import QtQuick.Layouts 1.1
import QtQuick.Controls.Styles 1.2

import "../../modules"
import "../../javascript/JSControl.js" as JSC

ColumnLayout {
    id : etat
<<<<<<< HEAD
<<<<<<< HEAD
    anchors.fill: parent
    spacing: 0
=======
=======
>>>>>>> master

    //    property string labelTrek: etat2.labelTrek
    //    property double lengthTrek: etat2.lengthTrek
    //    property var timeTrek : etat2.timeTrek
<<<<<<< HEAD
>>>>>>> master
=======
>>>>>>> master

    property int lapsedTime : 0
    property var timeInString : JSC.timeToString(etat.lapsedTime)

<<<<<<< HEAD
<<<<<<< HEAD
=======
    anchors.fill: parent
    spacing: 0

>>>>>>> master
=======
    anchors.fill: parent
    spacing: 0

>>>>>>> master
    onLapsedTimeChanged: {
        if(lapsedTime % 30000 == 0)
        {
            MyContext.myTrek.setTime(timeInString);
        }
    }


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
<<<<<<< HEAD
<<<<<<< HEAD
                text : "Titre du treck"
=======
                text : etat2.labelTrek
>>>>>>> master
=======
                text : etat2.labelTrek
>>>>>>> master

                font.family: "acumin-pro"
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
<<<<<<< HEAD
<<<<<<< HEAD
                visible: true
=======
                visible: etat2.lengthTrek === "" ? false : true
>>>>>>> master
=======
                visible: etat2.lengthTrek === "" ? false : true
>>>>>>> master

                spacing: 0
                Layout.preferredHeight: (1/5)*parent.height
                Layout.fillHeight: false

                Rectangle {
                    Layout.fillHeight: true
                    Layout.fillWidth: true
                    color: "lightGrey"

                    TextBox {
<<<<<<< HEAD
<<<<<<< HEAD
                        text : "temps estimé : "
=======
                        text : "temps estimé : " + timeTrek
>>>>>>> master
=======
                        text : "temps estimé : " + timeTrek
>>>>>>> master
                    }
                }
            }

            RowLayout { //rowlayout 2.2
                id : dist_estimee
<<<<<<< HEAD
<<<<<<< HEAD
                visible: true
=======
                visible: etat2.lengthTrek === 0 ? false : true
>>>>>>> master
=======
                visible: etat2.lengthTrek === 0 ? false : true
>>>>>>> master

                spacing: 0
                Layout.preferredHeight: (1/5)*parent.height
                Layout.fillHeight: false

                Rectangle {
                    Layout.fillHeight: true
                    Layout.fillWidth: true
                    color: "lightGrey"

                    TextBox {
<<<<<<< HEAD
<<<<<<< HEAD
                        text : "distance estimé : "
=======
                        text : "distance estimé : " + etat2.lengthTrek
>>>>>>> master
=======
                        text : "distance estimé : " + etat2.lengthTrek
>>>>>>> master
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
                        text : "temps réel : " + etat.timeInString
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
                            returnButton.visible = false ;
                            stopButton.visible = true ;
                            pause.visible = true ;
                            start.visible = false ;

<<<<<<< HEAD
<<<<<<< HEAD
=======
                            mapPage.trekName = label.text;
                            mapPage.startNewTrek = true;
>>>>>>> master
=======
                            mapPage.trekName = label.text;
                            mapPage.startNewTrek = true;
>>>>>>> master
                            mapPage.gpsActive = true ;
                            // code start timer

                            trekTimer.start() ;

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

                            mapPage.gpsActive = false ;
                            trekTimer.stop() ;

                            console.log("pause Treck _ arrêt de la prise de pts GPS")}
                    }
                }

                Rectangle {
                    Layout.fillHeight: true
                    Layout.fillWidth: true
                    //color: "darkBlue"

                    MyButton {
                        id : returnButton
                        visible: true

                        text : "Retour"
                        height: etat.height / 15
                        width: etat.width / 3
                        onClicked: {
                            trek3_visibilite = false ;
                            trek2_visibilite = true ;
<<<<<<< HEAD
<<<<<<< HEAD
=======
=======
>>>>>>> master

                            labelTrek = "";
                            lengthTrek = 0;
                            timeTrek = "";

                            trek1_error = "";
<<<<<<< HEAD
>>>>>>> master
=======
>>>>>>> master
                        }
                    }

                    MyButton {
                        id : stopButton
                        visible: false

                        text : "Stop"
                        height: etat.height / 15
                        width: etat.width / 3
                        onClicked: {
                            start.visible = false ;
                            pause.visible = false ;

                            // code function to stop timer
                            trekTimer.stop()
                            // code function to save Trek Object
                            MyContext.myTrek.setTime(etat.timeInString)

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



    Timer {
        id: trekTimer
        interval: 10 ;
        running: false ;
        repeat: true ;
        onTriggered: etat.lapsedTime += 10
    }
}
