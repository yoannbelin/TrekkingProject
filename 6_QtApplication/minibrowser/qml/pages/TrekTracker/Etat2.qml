import QtQuick 2.9
import QtQuick.Controls 2.2
//import QtWebView 1.1
import QtQuick.Layouts 1.1
import QtQuick.Controls.Styles 1.2

import "../../modules"

ColumnLayout {
    id : etat
<<<<<<< HEAD
<<<<<<< HEAD
=======
=======
>>>>>>> master

    property string labelTrek: list.labelTrek
    property double lengthTrek: list.lengthTrek
    property var timeTrek : list.timeTrek

<<<<<<< HEAD
>>>>>>> master
=======
>>>>>>> master
    anchors.fill: parent
    anchors.top : header.bottom
    spacing: 0


    RowLayout {
        spacing: 0
        Layout.preferredHeight: (1/2)*parent.height
        Layout.fillHeight: false
        Layout.fillWidth: true

        Rectangle {
            Layout.fillHeight: true
            Layout.fillWidth: true
            //color: "red"

<<<<<<< HEAD
<<<<<<< HEAD
            MyList {width : parent.width ;  height : parent.height}
=======
            MyList {id : list ; width : parent.width ;  height : parent.height}
>>>>>>> master
=======
            MyList {id : list ; width : parent.width ;  height : parent.height}
>>>>>>> master

        } //fin rectangle
    }

    RowLayout {
        spacing: 0
        Layout.preferredHeight: (2/6)*parent.height
        Layout.fillHeight: false

        Rectangle {
            Layout.fillHeight: true
            Layout.preferredWidth: 0.5*parent.width
            Layout.fillWidth: true
            //color: "darkGreen"

            MyButton {
                text : "Retour"
                height: etat.height / 15
                width: etat.width /3
                onClicked: {
                    trek2_visibilite = false ;
                    trek1_visibilite = true ;
                }
            }
        }

        Rectangle {
            Layout.fillHeight: true
            Layout.preferredWidth: 0.5*parent.width
            //color: "lightGreen"

            MyButton {
                text : "Selectionner"
                height: etat.height / 15
                width: etat.width /3
                onClicked: {
<<<<<<< HEAD
<<<<<<< HEAD
                    console.log("sauvegarde des données du treck dans LocalFile + changement de pahe > TrekTracker.Etat3");
=======
                    console.log("sauvegarde des données du treck dans LocalFile");
>>>>>>> master
=======
                    console.log("sauvegarde des données du treck dans LocalFile");
>>>>>>> master
                    trek2_visibilite = false;
                    trek3_visibilite = true;

                }
            }
        }
    }


    RowLayout {
        spacing: 0
        Layout.preferredHeight: (1/6)*parent.height
        Layout.fillHeight: false
        Rectangle {
            Layout.fillHeight: true
            Layout.fillWidth: true
            //color: "darkBlue"

            Image {
                id: logoAfpa
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.bottom: parent.bottom
                source: "../../../images/logoAfpa.jpg"
            }
        }
    }
}



