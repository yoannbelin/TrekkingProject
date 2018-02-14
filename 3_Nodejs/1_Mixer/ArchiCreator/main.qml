import QtQuick 2.7
import QtQuick.Window 2.2
import QtQuick.Controls 2.2
import Qt.labs.platform 1.0
import QtQuick.Dialogs 1.2


Window {
    visible: true
    width: 750
    height: 480
    title: qsTr("Hello World")

    Rectangle {
        id: container
        anchors.fill: parent

        Text{
            id: title
            height: parent.height * 0.1
            width: parent.width
            y: parent.height * 0.2
            text: "Architecture Creator"
            font.pixelSize: 23
            horizontalAlignment: Text.AlignHCenter
        }

        Column {
            anchors.top: title.bottom
            x: 5
            spacing: 10

            Row {
                spacing: 10

                MyButton{
                    id: originFolderExplorerButton
                    text: "Select Origin Folder"
                    width: 200
                    onClicked: {
                        originFolderExplorer.visible = true
                    }
                }

                Text {
                    id: originFolderUrl
                    height: 40
                    width: 500
                    text: originFolderExplorer.fileUrl
                    verticalAlignment: Text.AlignVCenter
                }

                FileDialog{
                    id: originFolderExplorer
                    title: "Choose a directory"
                    selectFolder: true

                    onAccepted: {
                        console.log("You chose: " + originFolderExplorer.fileUrl)
                    }
                    onRejected: {
                        console.log("Canceled")
                    }
                    Component.onCompleted: visible = false
                }
            }

            Row {
                spacing: 10

                MyButton{
                    id: targetFolderExplorerButton
                    text: "Select Target Folder"
                    width: 200
                    onClicked: {
                        targetFolderExplorer.visible = true
                    }
                }

                Text {
                    id: targetFolderUrl
                    height: 40
                    width: 500
                    text: targetFolderExplorer.fileUrl + "/" + replacementString.text
                    verticalAlignment: Text.AlignVCenter
                }

                FileDialog{
                    id: targetFolderExplorer
                    title: "Choose a target directory"
                    selectFolder: true

                    onAccepted: {
                        console.log("You chose: " + targetFolderExplorer.fileUrl)
                    }
                    onRejected: {
                        console.log("Canceled")
                    }
                    Component.onCompleted: visible = false
                }

            }
            Row {
                spacing: 10

                Text{
                    text: "I'd like to replace all occurences of: \n(name must start with a lower case)"
                    height: 40
                    verticalAlignment: Text.AlignVCenter
                    horizontalAlignment: Text.AlignHCenter
                }

                TextField{
                    id: originalString
                    height: 40
                    width: 100
                    placeholderText: "originalString"
                    verticalAlignment: Text.AlignVCenter
                    horizontalAlignment: Text.AlignHCenter
//                    validator:  RegExpValidator{ regExp: /^[a-z][a-zA-Z0-9_-]+/ }
                }

                Text{
                    text: "with"
                    height: 40
                    verticalAlignment: Text.AlignVCenter
                    horizontalAlignment: Text.AlignHCenter
                }

                TextField{
                    id: replacementString
                    height: 40
                    width: 100
                    placeholderText: "replacementString"
                    verticalAlignment: Text.AlignVCenter
                    horizontalAlignment: Text.AlignHCenter
//                    validator:  RegExpValidator{ regExp: /^[a-z][a-zA-Z0-9_-]+/ }
                }
            }

            Row{
                spacing: 10

                MyButton{
                    id: confirmUrlButton
                    text: "Confirm Url"
                    onClicked: {
                        MyContext.sendActionToCpp("set Folders Url", originFolderUrl.text, targetFolderUrl.text)
                        finalButton.enabled = true
                    }

                }

                MyButton{
                    id: finalButton
                    text: "Create Copy Folder"
                    enabled: false
                    onClicked: {
                        MyContext.sendActionToCpp("Create Copy Folder", originalString.text, replacementString.text)
                    }
                }
            }
        }
    }
}
