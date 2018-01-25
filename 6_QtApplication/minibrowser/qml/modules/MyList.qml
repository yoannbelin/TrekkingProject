import QtQuick 2.0

Rectangle {
    id: root

    ListView {
        id: view

        anchors { fill: parent; margins: 2 }

        model: MyModel {}


        delegate: Component {
            id: dragDelegate

            Item {
                id: content

                anchors { left: parent.left; right: parent.right }
                height: column.implicitHeight + 4

                Column {
                    id: column
                    anchors { fill: parent; margins: 2 }

                    Text { id : label ; text: labelTreck
                        font.pixelSize: Qt.application.font.pixelSize * 1.5}
                    Text { id : parametre ; text: distance + "\t" + duree
                        font.pixelSize: Qt.application.font.pixelSize * 1
                    }

                }

                MouseArea {
                    anchors.fill: parent
                    onClicked: view.currentIndex = index

                }

            }
        }

        highlight: Rectangle { color: 'orange' ; radius : 4 }
        focus: true
        onCurrentItemChanged: console.log(model.get(view.currentIndex).labelTreck)

        spacing: 4
    }
}
