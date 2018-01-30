import QtQuick 2.6
import QtQuick.Window 2.3
import QtMultimedia 5.8
import QtQuick.Controls 2.2

FocusScope {
    property Camera camera
    property bool previewAvailable : false

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
            
            FocusButton {
                camera: captureControls.camera
                visible: camera.cameraStatus == Camera.ActiveStatus && camera.focus.isFocusModeSupported(Camera.FocusAuto)
            }
            Button {
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
