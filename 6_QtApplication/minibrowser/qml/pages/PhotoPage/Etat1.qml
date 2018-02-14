import QtQuick 2.9
import QtQuick.Controls 2.2
import QtQuick.Layouts 1.1
import QtQuick.Controls.Styles 1.2
import QtMultimedia 5.8

import QtWebView 1.1

import "../../modules"
import "../../modules/camera"

ColumnLayout {

<<<<<<< HEAD
<<<<<<< HEAD
=======
    property alias urlLastPhoto: maCam.urlLastPhoto
    signal urlSet

>>>>>>> master
=======
    property alias urlLastPhoto: maCam.urlLastPhoto
    signal urlSet

>>>>>>> master
    id : etat

    anchors.fill: parent
    Layout.fillHeight: true
    Layout.fillWidth: true

    spacing: 0

<<<<<<< HEAD
<<<<<<< HEAD
    //insert camera module

    Rectangle {
        id : cameraUI
        Layout.fillHeight: true
        Layout.fillWidth: true
        //        color: "lightblue"

        //        Rectangle {
        //            width: parent.width
        //            height: parent.height
=======
=======
>>>>>>> master
    Rectangle {
        id : cameraUI

        Layout.fillHeight: true
        Layout.fillWidth: true
<<<<<<< HEAD
>>>>>>> master
=======
>>>>>>> master

        color: "black"
        state: "PhotoCapture"

<<<<<<< HEAD
<<<<<<< HEAD
        states: [
            State {
                name: "PhotoCapture"
                StateChangeScript {
                    script: {
                        camera.captureMode = Camera.CaptureStillImage
                        camera.start()
                    }
                }
            },
            State {
                name: "PhotoPreview"
            }
        ]
        Camera {
            id: camera
            captureMode: Camera.CaptureStillImage // added

            imageCapture {
                onImageCaptured: {
                    photoPreview.source = preview
                    stillControls.previewAvailable = true
                    cameraUI.state = "PhotoPreview"
                }
            }
        }
// added segment from here =>
        PhotoPreview {
            id : photoPreview
            anchors.fill : parent
            onClosed: cameraUI.state = "PhotoCapture"
            visible: cameraUI.state == "PhotoPreview"
            focus: visible
        }
// => til here;

        VideoOutput {
            id: viewfinder
            visible: cameraUI.state == "PhotoCapture"
            width: parent.width
            height: parent.height
            source: camera
            autoOrientation: true
        }
        PhotoCaptureControls {
            id: stillControls
            anchors.fill: parent
            camera: camera
            visible: cameraUI.state == "PhotoCapture"
            onPreviewSelected: cameraUI.state = "PhotoPreview"
        }
    }
}

=======
=======
>>>>>>> master
        MyCamera {
            id : maCam
            anchors.fill: parent
            onUrlLastPhotoChanged: {
                console.log("camera.urlLastPhoto -> " + urlLastPhoto)
                urlSet();
            }
        }
    }
}
<<<<<<< HEAD
>>>>>>> master
=======
>>>>>>> master
