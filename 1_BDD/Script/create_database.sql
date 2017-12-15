#------------------------------------------------------------
#        Script MySQL.
#------------------------------------------------------------


#------------------------------------------------------------
# Table: Trek
#------------------------------------------------------------

CREATE TABLE Trek(
        id_trek   int (11) Auto_increment  NOT NULL ,
        length    Float NOT NULL ,
        time      Time ,
        level     Int ,
        label     Varchar (50) NOT NULL ,
        id_trek_1 Int ,
        PRIMARY KEY (id_trek )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: Department
#------------------------------------------------------------

CREATE TABLE Department(
        id_department int (11) Auto_increment  NOT NULL ,
        name          Varchar (25) NOT NULL ,
        num           Int NOT NULL ,
        PRIMARY KEY (id_department )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: GPS_Point
#------------------------------------------------------------

CREATE TABLE GPS_Point(
        id_GPS_point int (11) Auto_increment  NOT NULL ,
        longitude    Varchar (25) NOT NULL ,
        latitude     Varchar (25) NOT NULL ,
        altitude     Varchar (25) ,
        PRIMARY KEY (id_GPS_point )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: Point_of_Interest
#------------------------------------------------------------

CREATE TABLE Point_of_Interest(
        id_PoI       int (11) Auto_increment  NOT NULL ,
        label        Varchar (25) NOT NULL ,
        description  Varchar (240) ,
        private      Bool NOT NULL ,
        id_GPS_point Int NOT NULL ,
        id_type      Int NOT NULL ,
        PRIMARY KEY (id_PoI )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: User
#------------------------------------------------------------

CREATE TABLE User(
        id_user    int (11) Auto_increment  NOT NULL ,
        lastName   Varchar (25) NOT NULL ,
        firstName  Varchar (25) NOT NULL ,
        username   Varchar (25) NOT NULL ,
        password   Varchar (25) NOT NULL ,
        mail       Varchar (50) NOT NULL ,
        active     Bool NOT NULL ,
        created_at Date NOT NULL ,
        PRIMARY KEY (id_user )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: Cairn
#------------------------------------------------------------

CREATE TABLE Cairn(
        id_PoI Int NOT NULL ,
        PRIMARY KEY (id_PoI )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: Photo
#------------------------------------------------------------

CREATE TABLE Photo(
        id_photo   int (11) Auto_increment  NOT NULL ,
        private    Bool NOT NULL ,
        url        Varchar (50) NOT NULL ,
        title      Varchar (25) NOT NULL ,
        date_photo Datetime NOT NULL ,
        id_user    Int NOT NULL ,
        id_PoI     Int NOT NULL ,
        id_trek    Int NOT NULL ,
        PRIMARY KEY (id_photo )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: Fauna_Flora
#------------------------------------------------------------

CREATE TABLE Fauna_Flora(
        latin_label Varchar (50) ,
        id_PoI      Int NOT NULL ,
        PRIMARY KEY (id_PoI )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: Panorama
#------------------------------------------------------------

CREATE TABLE Panorama(
        orientation Varchar (25) ,
        id_PoI      Int NOT NULL ,
        PRIMARY KEY (id_PoI )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: Type
#------------------------------------------------------------

CREATE TABLE Type(
        id_type int (11) Auto_increment  NOT NULL ,
        label   Varchar (25) NOT NULL ,
        PRIMARY KEY (id_type ) ,
        UNIQUE (label )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: Trek_locate_Department
#------------------------------------------------------------

CREATE TABLE Trek_locate_Department(
        id_trek       Int NOT NULL ,
        id_department Int NOT NULL ,
        PRIMARY KEY (id_trek ,id_department )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: User_do_Trek
#------------------------------------------------------------

CREATE TABLE User_do_Trek(
        date_trek Date NOT NULL ,
        id_trek   Int NOT NULL ,
        id_user   Int NOT NULL ,
        PRIMARY KEY (id_trek ,id_user )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: Trek_has_GPS_Point
#------------------------------------------------------------

CREATE TABLE Trek_has_GPS_Point(
        id_trek      Int NOT NULL ,
        id_GPS_point Int NOT NULL ,
        PRIMARY KEY (id_trek ,id_GPS_point )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: User_comment_photo
#------------------------------------------------------------

CREATE TABLE User_comment_Photo(
        content      Varchar (400) NOT NULL ,
        date_comment Datetime NOT NULL ,
        id_user      Int NOT NULL ,
        id_photo     Int NOT NULL ,
        PRIMARY KEY (id_user ,id_photo )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: User_comment_Trek
#------------------------------------------------------------

CREATE TABLE User_comment_Trek(
        content      Varchar (400) NOT NULL ,
        date_comment Datetime NOT NULL ,
        id_trek      Int NOT NULL ,
        id_user      Int NOT NULL ,
        PRIMARY KEY (id_trek ,id_user )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: User_comment_PoI
#------------------------------------------------------------

CREATE TABLE User_comment_PoI(
        content      Varchar (400) NOT NULL ,
        date_comment Datetime NOT NULL ,
        id_user      Int NOT NULL ,
        id_PoI       Int NOT NULL ,
        PRIMARY KEY (id_user ,id_PoI )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: Trek_has_PoI
#------------------------------------------------------------

CREATE TABLE Trek_has_PoI(
        id_trek Int NOT NULL ,
        id_PoI  Int NOT NULL ,
        PRIMARY KEY (id_trek ,id_PoI )
)ENGINE=InnoDB;

ALTER TABLE Trek ADD CONSTRAINT FK_Trek_id_trek_1 FOREIGN KEY (id_trek_1) REFERENCES Trek(id_trek);
ALTER TABLE Point_of_Interest ADD CONSTRAINT FK_Point_of_Interest_id_GPS_point FOREIGN KEY (id_GPS_point) REFERENCES GPS_Point(id_GPS_point);
ALTER TABLE Point_of_Interest ADD CONSTRAINT FK_Point_of_Interest_id_type FOREIGN KEY (id_type) REFERENCES Type(id_type);
ALTER TABLE Cairn ADD CONSTRAINT FK_Cairn_id_PoI FOREIGN KEY (id_PoI) REFERENCES Point_of_Interest(id_PoI);
ALTER TABLE Photo ADD CONSTRAINT FK_Photo_id_user FOREIGN KEY (id_user) REFERENCES User(id_user);
ALTER TABLE Photo ADD CONSTRAINT FK_Photo_id_PoI FOREIGN KEY (id_PoI) REFERENCES Point_of_Interest(id_PoI);
ALTER TABLE Photo ADD CONSTRAINT FK_Photo_id_trek FOREIGN KEY (id_trek) REFERENCES Trek(id_trek);
ALTER TABLE Fauna_Flora ADD CONSTRAINT FK_Fauna_Flora_id_PoI FOREIGN KEY (id_PoI) REFERENCES Point_of_Interest(id_PoI);
ALTER TABLE Panorama ADD CONSTRAINT FK_Panorama_id_PoI FOREIGN KEY (id_PoI) REFERENCES Point_of_Interest(id_PoI);
ALTER TABLE Trek_locate_Department ADD CONSTRAINT FK_Trek_locate_Department_id_trek FOREIGN KEY (id_trek) REFERENCES Trek(id_trek);
ALTER TABLE Trek_locate_Department ADD CONSTRAINT FK_Trek_locate_Department_id_department FOREIGN KEY (id_department) REFERENCES Department(id_department);
ALTER TABLE User_do_Trek ADD CONSTRAINT FK_User_do_Trek_id_trek FOREIGN KEY (id_trek) REFERENCES Trek(id_trek);
ALTER TABLE User_do_Trek ADD CONSTRAINT FK_User_do_Trek_id_user FOREIGN KEY (id_user) REFERENCES User(id_user);
ALTER TABLE Trek_has_GPS_Point ADD CONSTRAINT FK_Trek_has_GPS_Point_id_trek FOREIGN KEY (id_trek) REFERENCES Trek(id_trek);
ALTER TABLE Trek_has_GPS_Point ADD CONSTRAINT FK_Trek_has_GPS_Point_id_GPS_point FOREIGN KEY (id_GPS_point) REFERENCES GPS_Point(id_GPS_point);
ALTER TABLE User_comment_photo ADD CONSTRAINT FK_User_comment_photo_id_user FOREIGN KEY (id_user) REFERENCES User(id_user);
ALTER TABLE User_comment_photo ADD CONSTRAINT FK_User_comment_photo_id_photo FOREIGN KEY (id_photo) REFERENCES Photo(id_photo);
ALTER TABLE User_comment_Trek ADD CONSTRAINT FK_User_comment_Trek_id_trek FOREIGN KEY (id_trek) REFERENCES Trek(id_trek);
ALTER TABLE User_comment_Trek ADD CONSTRAINT FK_User_comment_Trek_id_user FOREIGN KEY (id_user) REFERENCES User(id_user);
ALTER TABLE User_comment_PoI ADD CONSTRAINT FK_User_comment_PoI_id_user FOREIGN KEY (id_user) REFERENCES User(id_user);
ALTER TABLE User_comment_PoI ADD CONSTRAINT FK_User_comment_PoI_id_PoI FOREIGN KEY (id_PoI) REFERENCES Point_of_Interest(id_PoI);
ALTER TABLE Trek_has_PoI ADD CONSTRAINT FK_Trek_has_PoI_id_trek FOREIGN KEY (id_trek) REFERENCES Trek(id_trek);
ALTER TABLE Trek_has_PoI ADD CONSTRAINT FK_Trek_has_PoI_id_PoI FOREIGN KEY (id_PoI) REFERENCES Point_of_Interest(id_PoI);
