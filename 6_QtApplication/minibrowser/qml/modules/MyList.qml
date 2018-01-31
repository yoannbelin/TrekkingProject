import QtQuick 2.0

Rectangle {
    id: root

    ListModel {
        id: treksModel
        ListElement {
            label: "Titre du trek"
            length: 00
            time : "00:00:00"
        }
    }

    Component {
        id: treksDelegate

        Item {
            anchors { left: parent.left; right: parent.right }
            height: column.implicitHeight + 4

            Column {
                id: column
                anchors { fill: parent; margins: 2 }

                Text { text: label
                    font.family: "acumin-pro"
                    font.pixelSize: Qt.application.font.pixelSize * 1.5
                }
                Text { text: length + " km" + "\t" + time
                    font.family: "acumin-pro"
                    font.pixelSize: Qt.application.font.pixelSize * 1
                }
            }

            MouseArea {
                anchors.fill: parent
                onClicked: view.currentIndex = index
            }
        }
    }

    ListView {
        id : view
        anchors { fill: parent; margins: 2 }

        model: treksModel
        delegate: treksDelegate

        highlight: Rectangle { color: 'orange' ; radius : 4 }
        focus: true
        onCurrentItemChanged: console.log(model.get(view.currentIndex).labelTreck)

        spacing: 4
    }


    Component.onCompleted: {
        getTreksJSON()
    }

    function getTreksJSON() {
        var uri = "http://localhost:3000/api-rest/users/3"; //remplacer le /3 par l'id_user sauvé en local

        var request = new XMLHttpRequest()
        request.open('GET', uri, true);

        request.onreadystatechange = function() {
            if (request.readyState === XMLHttpRequest.DONE && request.status == 200) {

                //console.log("response", request.responseText)
                var result = JSON.parse(request.responseText)

                for (var ligne in result.treks) {

                    treksModel.append({
                                          "label": result.treks[ligne].label,
                                          "length": result.treks[ligne].length,
                                          "time": result.treks[ligne].time
                                      })
                }

            } else {
                console.log("HTTP:", request.status, request.statusText)
            }
        }

        request.send()
    }
}
