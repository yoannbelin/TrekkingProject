import QtQuick 2.2
import QtQuick.Controls 1.1
import QtWebView 1.1
import QtQuick.Layouts 1.1
import QtQuick.Controls.Styles 1.2

import QtPositioning 5.8

import "JSControl.js" as JSC

ToolBar {
    RowLayout {
        anchors.fill: parent
        spacing: 0

        ToolButton {
            id: webPageButton
            tooltip: qsTr("Website")
            iconSource: "images/browser_icon.png"
            onClicked: {
                JSC.call_window(webPage)
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
                JSC.call_window(trekPage)
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
                JSC.call_window(currentTrekPage)
            }

            enabled: webView.canGoForward
            Layout.preferredWidth: parent.height
            style: ButtonStyle {
                background: Rectangle { color: "transparent" }
            }
        }

        ToolButton {
            id: uploadPageButton
            tooltip: qsTr("UpLoad Page")
            iconSource: "images/upload_icon.png"
            onClicked:{
                JSC.call_window(uploadPage)
            }

            enabled: webView.canGoForward
            Layout.preferredWidth: parent.height
            style: ButtonStyle {
                background: Rectangle { color: "transparent" }
            }
        }
    }
}
