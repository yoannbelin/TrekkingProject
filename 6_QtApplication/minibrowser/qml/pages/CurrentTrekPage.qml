import QtQuick 2.9
import QtQuick.Controls 2.2
import QtWebView 1.1
import QtQuick.Layouts 1.1
import QtQuick.Controls.Styles 1.2


Page {
    header: Label {
        text: "Pixel Ratio: " + pixelRatio + " and Pixel Density: " + pixelDensity
        font.pixelSize: Qt.application.font.pixelSize * 1
        padding: 10
    }

}
