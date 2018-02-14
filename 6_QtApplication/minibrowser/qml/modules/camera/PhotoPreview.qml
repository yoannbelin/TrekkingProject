<<<<<<< HEAD
<<<<<<< HEAD
import QtQuick 2.0
import QtMultimedia 5.0

Item {
=======
=======
>>>>>>> master
import QtQuick 2.9
import QtQuick.Window 2.2
import QtMultimedia 5.8

Item {
    id : test

    property string urlLastPhoto: "aaa"
<<<<<<< HEAD
>>>>>>> master
=======
>>>>>>> master
    property alias source : preview.source
    signal closed

    Image {
        id: preview
        anchors.fill : parent
        fillMode: Image.PreserveAspectFit
        smooth: true
    }
<<<<<<< HEAD
<<<<<<< HEAD

    MouseArea {
        anchors.fill: parent
        onClicked: {
            parent.closed();
=======
=======
>>>>>>> master
    
    MouseArea {
        anchors.fill: parent
        onClicked: {
            var path = "file:///" + camera.imageCapture.capturedImagePath;
            MyContext.saveLastImageTakenUrl(path);
            console.log("photoTaken: url -> " + path);
            parent.closed();
            urlLastPhoto = path;
            console.log("photoPreview.urlLastPhoto -> " + urlLastPhoto)

            if(!camera.ActiveStatus)
                camera.start()
<<<<<<< HEAD
>>>>>>> master
=======
>>>>>>> master
        }
    }
}
