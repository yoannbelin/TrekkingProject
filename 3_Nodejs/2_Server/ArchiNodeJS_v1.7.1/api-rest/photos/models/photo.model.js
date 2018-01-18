let moment = require(__base + 'config/moment')

class PhotoModel {
    constructor(row) {
        this.row = row;
    }

    get id() {
        return this.row.id_photo;
    }
    set id(val) {
        this.row.id_photo = val;
    }

    get private() {
        return this.row.private;
    }
    set private(val) {
        this.row.private = val;
    }

    get url() {
        return this.row.url;
    }
    set url(val) {
        this.row.url = val;
    }

    get title() {
        return this.row.title;
    }
    set title(val) {
        this.row.title = val;
    }

    get date_photo() {
        return this.row.date_photo;
    }
    set date_photo(val) {
        this.row.date_photo = val;
    }

    get idTrek() {
        return this.row.id_trek;
    }
    set idTrek(val) {
        this.row.id_trek = val;
    }

    get labelTrek() {
        return this.row.label;
    }
    set labelTrek(val) {
        this.row.label = val;
    }


    //== conversion "automatique" dans le controlleur, Cf. ##1
    toJSON() {
        return {
            id: this.id,
            url: this.url,
            title: this.title,
            date_photo: this.date_photo,
            private: this.private,
            idTrek: this.idTrek,
            labelTrek: this.labelTrek
        };
    }

    isValid() {
        return !(this.url === '' ||
            this.url === undefined ||
            this.title === '' ||
            this.title === undefined);
    }
}
module.exports = PhotoModel