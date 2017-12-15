let moment = require(__base + 'config/moment')


class DepartmentModel {
    constructor(row) {
        //console.log(row);
        this.row = row;
    }

    get id() {
        return this.row.id_department;
    }
    set id(val) {
        this.row.id_department = val;
    }

    get name() {
        return this.row.name;
    }
    set name(val) {
        this.row.name = val;
    }

    get num() {
        return this.row.num;
    }
    set num(val) {
        this.row.num = val;
    }

    //== conversion "automatique" dans le controlleur, Cf. ##1
    toJSON() {
        return {
            id: this.id,
            name: this.name,
            num: this.num
        };
    }

    isValid() {
        return !(isNaN(this.num) ||
            this.name === '' ||
            this.name === undefined);
    }
}

module.exports = DepartmentModel