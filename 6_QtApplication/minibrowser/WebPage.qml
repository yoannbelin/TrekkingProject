import QtQuick 2.2
import QtQuick.Controls 1.1
import QtWebView 1.1
import QtQuick.Layouts 1.1
import QtQuick.Controls.Styles 1.2


WebView {
    anchors.fill: parent
    url: initialUrl
    onLoadingChanged: {
        if (loadRequest.errorString)
            console.error(loadRequest.errorString);
    }
}
