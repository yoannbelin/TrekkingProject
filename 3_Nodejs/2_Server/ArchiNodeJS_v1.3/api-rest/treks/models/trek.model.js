let moment = require(__base + 'config/moment')
let GpsPointModel = require('../../gpsPoints/models/gpsPoint.model')


class TrekModel {
    constructor(row) {
        //console.log(row);
        this.row = row;
        // this.row.path = new Array of GPS POINTS => GOD HELP US
    }

    get id() {
        return this.row.id_trek;
    }
    set id(val) {
        this.row.id_trek = val;
    }

    get length() {
        return this.row.length;
    }
    set length(val) {
        this.row.length = val;
    }

    get time() {
        return this.row.time;
    }
    set time(val) {
        this.row.time = val;
    }

    get level() {
        return this.row.level;
    }
    set level(val) {
        this.row.level = val;
    }

    get label() {
        return this.row.label;
    }
    set label(val) {
        this.row.label = val;
    }

    get reference() {
        return this.row.id_trek_1;
    }
    set reference(val) {
        this.row.id_trek_1 = val;
    }

    get pathway_() {
        return this.pathway_;
    }
    set pathway_(val) {
        this.pathway_ = val;
    }


    //== conversion "automatique" dans le controlleur, Cf. ##1
    toJSON() {
        return {
            id: this.id,
            length: this.length,
            time: this.time,
            level: this.level,
            label: this.label,
            reference: this.reference,
            pathway_: this.pathway_
        };
    }

    isValid() {
        return !(
            // isNaN(this.length) ||
            this.label === '' ||
            this.label === undefined);
    }
}

module.exports = TrekModel