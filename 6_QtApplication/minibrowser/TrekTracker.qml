import QtQuick 2.2
import QtQuick.Controls 1.1
import QtWebView 1.1
import QtQuick.Layouts 1.1
import QtQuick.Controls.Styles 1.2

Item {
    Column{

    MyButton{
        text: "Start Trek"
        onClicked: gpsPosition.active = true
    }

    Text{
        text: "lat: " + MyContext.myTrek.path[MyContext.myTrek.path.length-1].latitude +
              "long " + MyContext.myTrek.path[MyContext.myTrek.path.length-1].longitude
    }
    }
}
