<<<<<<< HEAD
<<<<<<< HEAD
import QtQuick 2.6
import QtQuick.Window 2.3
import QtMultimedia 5.8
import QtQuick.Controls 2.2
=======
=======
>>>>>>> master
import QtQuick 2.9
import QtQuick.Window 2.2
import QtQuick.Controls 1.4
import QtQuick.Layouts 1.1
import QtMultimedia 5.8
<<<<<<< HEAD
>>>>>>> master
=======
>>>>>>> master

FocusScope {
    property Camera camera
    property bool previewAvailable : false

<<<<<<< HEAD
<<<<<<< HEAD
    signal previewSelected
    signal videoModeSelected
    id : captureControls
    
    Rectangle {
        id: buttonPaneShadow
        width: parent.width
        height: parent.height
        anchors.bottom: parent.bottom
        color: Qt.rgba(0.08, 0.08, 0.08, 1)
        
        Row {
            id: buttonsColumn
            anchors {
                bottom: parent.bottom
                horizontalCenter: parent.horizontalCenter
                margins: 8
            }
            spacing: 8
            
=======
=======
>>>>>>> master
    property int buttonsPanelWidth: buttonPaneShadow.width

    signal previewSelected
//    signal videoModeSelected
    id : captureControls

    Rectangle {
        id: buttonPaneShadow
        width: parent.width
        height: buttonsRow.height

        color: Qt.rgba(0.08, 0.08, 0.08, 1)

        anchors.horizontalCenter: parent.horizontalCenter

        Row {
            id: buttonsRow
            anchors.fill: parent

            layoutDirection: Qt.LeftToRight

            spacing: 8

<<<<<<< HEAD
>>>>>>> master
=======
>>>>>>> master
            FocusButton {
                camera: captureControls.camera
                visible: camera.cameraStatus == Camera.ActiveStatus && camera.focus.isFocusModeSupported(Camera.FocusAuto)
            }
            Button {
<<<<<<< HEAD
<<<<<<< HEAD
                id: captureButton
                text: "Capture"
                onClicked: {
                    camera.imageCapture.capture()

                    //                visible: camera.imageCapture.ready
                }
                Button {
                    text: "View"
                    onClicked: captureControls.previewSelected()
                    //                visible: captureControls.previewAvailable
                }
            }
        }
        ZoomControl {
            width : 100
            height: parent.height

            currentZoom: camera.digitalZoom
            maximumZoom: Math.min(4.0, camera.maximumDigitalZoom)
            onZoomTo: camera.setDigitalZoom(value)
        }
    }
}
=======
=======
>>>>>>> master
                text: "Capture"
                visible: camera.imageCapture.ready
                onClicked: {
                    camera.imageCapture.capture();
                }
            }
            Button {
                text: "View"
                onClicked: captureControls.previewSelected()
                visible: captureControls.previewAvailable
            }
            Button {
                text: "Edit"
                onClicked: {
                    camera.stop();
                    photo1_visibilite = false;
                    photo2_visibilite = true;
                }
            }
        }
    }
}

<<<<<<< HEAD
>>>>>>> master
=======
>>>>>>> master
