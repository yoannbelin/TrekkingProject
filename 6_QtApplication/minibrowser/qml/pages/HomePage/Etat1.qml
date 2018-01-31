import QtQuick 2.9
import QtQuick.Controls 2.2
import QtQuick.Layouts 1.1
import QtQuick.Controls.Styles 1.2

import "../../modules"
import "../../../images"

import "../../javascript/ButtonControl.js" as MyScript

ColumnLayout {
    id : etat

    property bool userUsernameCompleted:
        (userUsername.text != "" && userUsername.text.length > 3)
    property bool userEmailCompleted :
    {
        if(/([a-z A-Z 0-9 _.-]+)([@])([a-z A-Z]+)([.])([a-z])+/.test(userEmail.text))
        {
            return true;
        }
        else {return false;}
    }


    anchors.fill: parent
    anchors.top : header.bottom
    spacing: 0

    RowLayout {
        spacing: 0
        Layout.preferredHeight: 0.25*parent.height
        Layout.fillHeight: true
        Layout.fillWidth: true

        Rectangle {
            Layout.fillHeight: true
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
            Layout.fillHeight: true
            Layout.fillWidth: true
            //color: "grey"

            InputBox {
                id : userEmail
                placeholderText: "Entrez votre adresse email"
                validator: RegExpValidator{ regExp: /([a-z A-Z 0-9 _.-]+)([@])([a-z A-Z]+)([.])([a-z])+/ }
            }
        }
    } //fin rowlayout

    RowLayout {
        spacing: 0
        Layout.preferredHeight: (1/8)*parent.height
        Layout.fillHeight: true
        Layout.fillWidth: true

        Rectangle {
            Layout.fillHeight: true
            Layout.fillWidth: true
            //color: "red"

            InputBox {
                id : userUsername
                placeholderText: "Entrez votre pseudo"
            }
        }
    } //fin rowlayout

    RowLayout {
        spacing: 0
        Layout.preferredHeight: 0.25*parent.height
        Layout.fillHeight: true
        Layout.fillWidth: true

        Rectangle {
            Layout.fillHeight: true
            Layout.fillWidth: true
            //color: "red"

            MyButton {
                text : "Sign In"
                height: etat.height / 15
                width: etat.width /3
                enabled: (userEmailCompleted && userUsernameCompleted)
                onClicked: {
                    console.log("check datas and save profil in localFile : " + userEmail.text + " " + userUsername.text);
                    home1_visibilite = false;
                    home2_visibilite = true;
                }
            }
        }

        Rectangle {
            Layout.fillHeight: true
            Layout.fillWidth: true
            //color: "red"

            MyButton {
                text : "Sign Up"
                height: etat.height / 15
                width: etat.width /3
                onClicked: {
                    console.log("connexion to webAppli");
                    home1_visibilite = false;
                    home3_visibilite = true;
                }

            }
        }
    } //fin rowlayout

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

} //fin columnlayout



