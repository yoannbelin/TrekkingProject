let moment = require(__base + 'config/moment')


class GpsPointModel {
    constructor(row) {
        //console.log(row);
        this.row = row;
    }

    get id() {
        return this.row.id_GPS_point;
    }
    set id(val) {
        this.row.id_GPS_point = val;
    }

    get longitude() {
        return this.row.longitude;
    }
    set longitude(val) {
        this.row.longitude = val;
    }

    get latitude() {
        return this.row.latitude;
    }
    set latitude(val) {
        this.row.latitude = val;
    }

    get altitude() {
        return this.row.altitude;
    }
    set altitude(val) {
        this.row.altitude = val;
    }

    //== conversion "automatique" dans le controlleur, Cf. ##1
    toJSON() {
        return {
            id: this.id,
            longitude: this.longitude,
            latitude: this.latitude,
            altitude: this.altitude,
        };
    }

    isValid() {
        return !(isNaN(this.latitude) ||
            isNaN(this.longitude));
    }
}

module.exports = GpsPointModel