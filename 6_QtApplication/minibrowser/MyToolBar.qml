import QtQuick 2.2
import QtQuick.Controls 1.1
import QtWebView 1.1
import QtQuick.Layouts 1.1
import QtQuick.Controls.Styles 1.2

import QtPositioning 5.8

ToolBar {
    RowLayout {
        anchors.fill: parent
        spacing: 0

        ToolButton {
            id: webPageButton
            tooltip: qsTr("Website")
            iconSource: "images/browser_icon.png"
            onClicked: {

            }

            enabled: webView.canGoBack
            Layout.preferredWidth: parent.height
            style: ButtonStyle {
                background: Rectangle { color: "transparent" }
            }
        }

        ToolButton {
            id: trekPageButton
            tooltip: qsTr("Trek Page")
            iconSource: "images/trekking_icon.png"
            onClicked: {

            }

            enabled: webView.canGoForward
            Layout.preferredWidth: parent.height
            style: ButtonStyle {
                background: Rectangle { color: "transparent" }
            }
        }

        ToolButton {
            id: currentTrekPageButton
            tooltip: qsTr("Path Page")
            iconSource: "images/current_trek_icon.png"
            onClicked: {

            }

            enabled: webView.canGoForward
            Layout.preferredWidth: parent.height
            style: ButtonStyle {
                background: Rectangle { color: "transparent" }
            }
        }

        ToolButton {
            id: photoPageButton
            tooltip: qsTr("Photo Page")
            iconSource: "images/upload_icon.png"
            onClicked:{

            }

            enabled: webView.canGoForward
            Layout.preferredWidth: parent.height
            style: ButtonStyle {
                background: Rectangle { color: "transparent" }
            }
        }
    }
}
