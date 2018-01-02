#------------------------------------------------------------
#        Script MySQL.
#------------------------------------------------------------


#------------------------------------------------------------
# Table: Trek
#------------------------------------------------------------

CREATE TABLE Trek(
        id_Trek   int (11) Auto_increment  NOT NULL ,
        label     Varchar (50) NOT NULL ,
        length    Float NOT NULL ,
        time      Time ,
        level     Int ,
        pathway   JSON  NOT NULL ,
        done	  bool,
        id_Trek_1 Int ,
        PRIMARY KEY (id_Trek )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: Department
#------------------------------------------------------------

CREATE TABLE Department(
        id_Department   int (11) Auto_increment  NOT NULL ,
        name Varchar (25) NOT NULL ,
        num Int NOT NULL ,
        PRIMARY KEY (id_Department )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: GPS_Point
#------------------------------------------------------------

CREATE TABLE GPS_Point(
        id_GPS_point int (11) Auto_increment  NOT NULL ,
        latitude 	 Varchar (45) NOT NULL ,
        longitude	 Varchar (45) NOT NULL ,
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
        private      Bool NOT NULL DEFAULT '1',
        id_GPS_point Int NOT NULL ,
        id_type      Int NOT NULL ,
        PRIMARY KEY (id_PoI )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: User
#------------------------------------------------------------

CREATE TABLE User(
        id_User   int (11) Auto_increment  NOT NULL ,
        lastName  Varchar (25) NOT NULL ,
        firstName Varchar (25) NOT NULL ,
        username  Varchar (25) NOT NULL ,
        password  Varchar (25) NOT NULL ,
        mail      Varchar (25) NOT NULL ,
        active    Bool NOT NULL DEFAULT '1',
        created_at Date NOT NULL ,
        PRIMARY KEY (id_User )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: Cairn
#------------------------------------------------------------

CREATE TABLE Cairn(
        id_PoI Int NOT NULL ,
        PRIMARY KEY (id_PoI )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: Photos
#------------------------------------------------------------

CREATE TABLE Photos(
        id_Photo   int (11) Auto_increment  NOT NULL ,
        private    Bool NOT NULL DEFAULT '1',
        url        Varchar (50) NOT NULL ,
        title      Varchar (25) NOT NULL ,
        date_Photo Datetime NOT NULL ,
        id_User    Int NOT NULL ,
        id_PoI     Int NOT NULL ,
        id_Trek	   Int NOT NULL ,
        PRIMARY KEY (id_Photo )
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
        id_Trek       Int NOT NULL ,
        id_Department Int NOT NULL ,
        PRIMARY KEY (id_Trek ,id_Department )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: User_do_Trek
#------------------------------------------------------------

CREATE TABLE User_do_Trek(
        date_Trek Date ,
        id_Trek   Int NOT NULL ,
        id_User   Int NOT NULL ,
        PRIMARY KEY (id_Trek ,id_User )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: Trek_has_Photo
#------------------------------------------------------------

CREATE TABLE Trek_has_Photo(
        id_Trek       Int NOT NULL ,
        id_Photo Int NOT NULL ,
        PRIMARY KEY (id_Trek ,id_Photo )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: Trek_has_PoI
#------------------------------------------------------------

CREATE TABLE Trek_has_PoI(
        id_Trek       Int NOT NULL ,
        id_PoI Int NOT NULL ,
        PRIMARY KEY (id_Trek ,id_PoI )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: User_comment_photo
#------------------------------------------------------------

CREATE TABLE User_comment_photo(
        content      Varchar (400) NOT NULL ,
        date_comment Datetime NOT NULL ,
        id_User      Int NOT NULL ,
        id_Photo     Int NOT NULL ,
        PRIMARY KEY (id_User ,id_Photo )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: User_comment_Trek
#------------------------------------------------------------

CREATE TABLE User_comment_Trek(
        content      Varchar (400) NOT NULL ,
        date_comment Datetime NOT NULL ,
        id_Trek      Int NOT NULL ,
        id_User      Int NOT NULL ,
        PRIMARY KEY (id_Trek ,id_User )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: User_comment_PoI
#------------------------------------------------------------

CREATE TABLE User_comment_PoI(
        content      Varchar (400) NOT NULL ,
        date_comment Datetime NOT NULL ,
        id_User      Int NOT NULL ,
        id_PoI       Int NOT NULL ,
        PRIMARY KEY (id_User ,id_PoI )
)ENGINE=InnoDB;

ALTER TABLE Trek ADD CONSTRAINT FK_Trek_id_Trek_1 FOREIGN KEY (id_Trek_1) REFERENCES Trek(id_Trek);
ALTER TABLE Point_of_Interest ADD CONSTRAINT FK_Point_of_Interest_id_GPS_point FOREIGN KEY (id_GPS_point) REFERENCES GPS_Point(id_GPS_point);
ALTER TABLE Point_of_Interest ADD CONSTRAINT FK_Point_of_Interest_id_type FOREIGN KEY (id_type) REFERENCES Type(id_type);
ALTER TABLE Cairn ADD CONSTRAINT FK_Cairn_id_PoI FOREIGN KEY (id_PoI) REFERENCES Point_of_Interest(id_PoI);
ALTER TABLE Photos ADD CONSTRAINT FK_Photos_id_User FOREIGN KEY (id_User) REFERENCES User(id_User);
ALTER TABLE Photos ADD CONSTRAINT FK_Photos_id_PoI FOREIGN KEY (id_PoI) REFERENCES Point_of_Interest(id_PoI);
ALTER TABLE Fauna_Flora ADD CONSTRAINT FK_Fauna_Flora_id_PoI FOREIGN KEY (id_PoI) REFERENCES Point_of_Interest(id_PoI);
ALTER TABLE Panorama ADD CONSTRAINT FK_Panorama_id_PoI FOREIGN KEY (id_PoI) REFERENCES Point_of_Interest(id_PoI);
ALTER TABLE Trek_locate_Department ADD CONSTRAINT FK_Trek_locate_Department_id_Trek FOREIGN KEY (id_Trek) REFERENCES Trek(id_Trek);
ALTER TABLE Trek_locate_Department ADD CONSTRAINT FK_Trek_locate_Department_id_Department FOREIGN KEY (id_Department) REFERENCES Department(id_Department);
ALTER TABLE User_do_Trek ADD CONSTRAINT FK_User_do_Trek_id_Trek FOREIGN KEY (id_Trek) REFERENCES Trek(id_Trek);
ALTER TABLE User_do_Trek ADD CONSTRAINT FK_User_do_Trek_id_User FOREIGN KEY (id_User) REFERENCES User(id_User);
ALTER TABLE Trek_has_Photo ADD CONSTRAINT FK_Trek_has_Photo_id_Trek FOREIGN KEY (id_Trek) REFERENCES Trek(id_Trek);
ALTER TABLE Trek_has_Photo ADD CONSTRAINT FK_Trek_has_Photo_id_Photo FOREIGN KEY (id_Photo) REFERENCES Photos(id_Photo);
ALTER TABLE Trek_has_PoI ADD CONSTRAINT FK_Trek_has_PoI_id_Trek FOREIGN KEY (id_Trek) REFERENCES Trek(id_Trek);
ALTER TABLE Trek_has_PoI ADD CONSTRAINT FK_Trek_has_PoI_id_PoI FOREIGN KEY (id_PoI) REFERENCES Point_of_Interest(id_PoI);
ALTER TABLE User_comment_photo ADD CONSTRAINT FK_User_comment_photo_id_User FOREIGN KEY (id_User) REFERENCES User(id_User);
ALTER TABLE User_comment_photo ADD CONSTRAINT FK_User_comment_photo_id_Photo FOREIGN KEY (id_Photo) REFERENCES Photos(id_Photo);
ALTER TABLE User_comment_Trek ADD CONSTRAINT FK_User_comment_Trek_id_Trek FOREIGN KEY (id_Trek) REFERENCES Trek(id_Trek);
ALTER TABLE User_comment_Trek ADD CONSTRAINT FK_User_comment_Trek_id_User FOREIGN KEY (id_User) REFERENCES User(id_User);
ALTER TABLE User_comment_PoI ADD CONSTRAINT FK_User_comment_PoI_id_User FOREIGN KEY (id_User) REFERENCES User(id_User);
ALTER TABLE User_comment_PoI ADD CONSTRAINT FK_User_comment_PoI_id_PoI FOREIGN KEY (id_PoI) REFERENCES Point_of_Interest(id_PoI);
