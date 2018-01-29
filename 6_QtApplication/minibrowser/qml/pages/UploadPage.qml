import QtQuick 2.9
import QtQuick.Controls 2.2
import QtQuick.Layouts 1.1
import QtQuick.Controls.Styles 1.2

import "../modules"
import "UploadPage"

Page {
    header: Label {
        text: qsTr("Upload Page")
        font.pixelSize: Qt.application.font.pixelSize * 2
        padding: 10

        Button{
            text: "Et ben alors"
            onClicked: {

                MyContext.updateTrek(43.465, 3.265)
                MyContext.updateTrek(43.45, 3.25)
            }
        }
    }

    Etat1 {
        id : etat1
        visible: true
        //visible: false
    }

}
