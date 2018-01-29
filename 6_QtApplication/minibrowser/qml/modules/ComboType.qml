import QtQuick 2.0
import QtQuick.Controls 2.2

ComboBox {
    editable: false

    model : ListModel {
        ListElement {text : ""}
        ListElement {text : "Cairn"}
        ListElement {text : "Faune & Flore"}
        ListElement {text : "Paysage"}
    }
}
