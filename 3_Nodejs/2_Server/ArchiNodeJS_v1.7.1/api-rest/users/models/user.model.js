let moment = require(__base + 'config/moment')

class UserModel {
    constructor(row) {
        this.row = row;
    }

    get id() {
        return this.row.id_user;
    }
    set id(val) {
        this.row.id_user = val;
    }

    get firstname() {
        return this.row.firstname;
    }
    set firstname(val) {
        this.row.firstname = val;
    }

    get lastname() {
        return this.row.lastname;
    }
    set lastname(val) {
        this.row.lastname = val;
    }

    get username() {
        return this.row.username;
    }
    set username(val) {
        this.row.username = val;
    }

    get password() {
        return this.row.password;
    }
    set password(val) {
        this.row.password = val;
    }

    get mail() {
        return this.row.mail;
    }
    set mail(val) {
        this.row.mail = val;
    }

    get active() {
        return this.row.active;
    }
    set active(val) {
        this.row.active = val;
    }

    get created_at() {
        return moment(this.row.created_at);
    }
    set created_at(val) {
        this.row.created_at = val;
    }

    //== conversion "automatique" dans le controlleur, Cf. ##1
    toJSON() {
        return {
            id: this.id,
            firstname: this.firstname,
            lastname: this.lastname,
            username: this.username,
            password: this.password,
            mail: this.mail,
            active: this.active,
            created_at: this.created_at
        };
    }

    isValid() {
        return !(this.firstname === '' ||
            this.firstname === undefined ||
            this.lastname === '' ||
            this.lastname === undefined ||
            this.username === '' ||
            this.username === undefined ||
            this.password === '' ||
            this.password === undefined ||
            this.mail === '' ||
            this.mail === undefined);
    }
}
module.exports = UserModel