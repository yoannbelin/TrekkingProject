import QtQuick 2.0

/* module temporaire avant liaison avec BDD */

ListModel {
    id: libraryModel
    ListElement {
        labelTreck: "Un jour en montagne"
        distance: "10.23 km"
        duree: "03:21:00"
    }
    ListElement {
        labelTreck: "Un jour au bord de la mer"
        distance: "21.41 km"
        duree: "06:21:00"
    }
    ListElement {
        labelTreck: "Le GR20 (partie 1)"
        distance: "31.00 km"
        duree: "10:21:35"
    }
    ListElement {
        labelTreck: "Le GR20 (partie 2)"
        distance: "25.31 km"
        duree: "09:10:45"
    }
    ListElement {
        labelTreck: "Tour des vignobles de l'Hérault"
        distance: "05.31 km"
        duree: "15:21:00"
    }


}
