#------------------------------------------------------------
#        Script MySQL.
#------------------------------------------------------------


#------------------------------------------------------------
# Table: Trek
#------------------------------------------------------------

CREATE TABLE Trek(
        Id_Ttrek int (11) Auto_increment  NOT NULL ,
        length   Float NOT NULL ,
        time     Time ,
        level    Int ,
        label    Varchar (25) NOT NULL ,
        PRIMARY KEY (Id_Ttrek )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: Departement
#------------------------------------------------------------

CREATE TABLE Departement(
        id_Departement  int (11) Auto_increment  NOT NULL ,
        name_Department Varchar (25) NOT NULL ,
        num_Departement Int ,
        PRIMARY KEY (id_Departement )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: GPS_point
#------------------------------------------------------------

CREATE TABLE GPS_point(
        id_GPS_point int (11) Auto_increment  NOT NULL ,
        longitude    Varchar (25) NOT NULL ,
        lattitude    Varchar (25) NOT NULL ,
        altitude     Varchar (25) ,
        PRIMARY KEY (id_GPS_point )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: point_of_interest
#------------------------------------------------------------

CREATE TABLE point_of_interest(
        id_PoI       int (11) Auto_increment  NOT NULL ,
        label        Varchar (25) NOT NULL ,
        description  Varchar (240) ,
        private      Bool NOT NULL ,
        id_GPS_point Int NOT NULL ,
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
        private    Bool NOT NULL ,
        url        Varchar (25) NOT NULL ,
        title      Varchar (25) NOT NULL ,
        date_Photo Datetime NOT NULL ,
        id_User    Int NOT NULL ,
        id_PoI     Int NOT NULL ,
        PRIMARY KEY (id_Photo )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: Fauna_Flora
#------------------------------------------------------------

CREATE TABLE Fauna_Flora(
        Latin_label Varchar (50) ,
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
# Table: Comment
#------------------------------------------------------------

CREATE TABLE Comment(
        id_comment   int (11) Auto_increment  NOT NULL ,
        content      Varchar (25) NOT NULL ,
        date_Comment Datetime NOT NULL ,
        id_User      Int NOT NULL ,
        PRIMARY KEY (id_comment )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: Trek_locate_department
#------------------------------------------------------------

CREATE TABLE Trek_locate_department(
        Id_Ttrek       Int NOT NULL ,
        id_Departement Int NOT NULL ,
        PRIMARY KEY (Id_Ttrek ,id_Departement )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: User_do_Trek
#------------------------------------------------------------

CREATE TABLE User_do_Trek(
        date_Trek Date NOT NULL ,
        Id_Ttrek  Int NOT NULL ,
        id_User   Int NOT NULL ,
        PRIMARY KEY (Id_Ttrek ,id_User )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: Trek_has_GPS_point
#------------------------------------------------------------

CREATE TABLE Trek_has_GPS_point(
        Id_Ttrek     Int NOT NULL ,
        id_GPS_point Int NOT NULL ,
        PRIMARY KEY (Id_Ttrek ,id_GPS_point )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: about
#------------------------------------------------------------

CREATE TABLE about(
        id_comment Int NOT NULL ,
        id_PoI     Int NOT NULL ,
        id_Photo   Int NOT NULL ,
        Id_Ttrek   Int NOT NULL ,
        PRIMARY KEY (id_comment ,id_PoI ,id_Photo ,Id_Ttrek )
)ENGINE=InnoDB;

ALTER TABLE point_of_interest ADD CONSTRAINT FK_point_of_interest_id_GPS_point FOREIGN KEY (id_GPS_point) REFERENCES GPS_point(id_GPS_point);
ALTER TABLE Cairn ADD CONSTRAINT FK_Cairn_id_PoI FOREIGN KEY (id_PoI) REFERENCES point_of_interest(id_PoI);
ALTER TABLE Photos ADD CONSTRAINT FK_Photos_id_User FOREIGN KEY (id_User) REFERENCES User(id_User);
ALTER TABLE Photos ADD CONSTRAINT FK_Photos_id_PoI FOREIGN KEY (id_PoI) REFERENCES point_of_interest(id_PoI);
ALTER TABLE Fauna_Flora ADD CONSTRAINT FK_Fauna_Flora_id_PoI FOREIGN KEY (id_PoI) REFERENCES point_of_interest(id_PoI);
ALTER TABLE Panorama ADD CONSTRAINT FK_Panorama_id_PoI FOREIGN KEY (id_PoI) REFERENCES point_of_interest(id_PoI);
ALTER TABLE Comment ADD CONSTRAINT FK_Comment_id_User FOREIGN KEY (id_User) REFERENCES User(id_User);
ALTER TABLE Trek_locate_department ADD CONSTRAINT FK_Trek_locate_department_Id_Ttrek FOREIGN KEY (Id_Ttrek) REFERENCES Trek(Id_Ttrek);
ALTER TABLE Trek_locate_department ADD CONSTRAINT FK_Trek_locate_department_id_Departement FOREIGN KEY (id_Departement) REFERENCES Departement(id_Departement);
ALTER TABLE User_do_Trek ADD CONSTRAINT FK_User_do_Trek_Id_Ttrek FOREIGN KEY (Id_Ttrek) REFERENCES Trek(Id_Ttrek);
ALTER TABLE User_do_Trek ADD CONSTRAINT FK_User_do_Trek_id_User FOREIGN KEY (id_User) REFERENCES User(id_User);
ALTER TABLE Trek_has_GPS_point ADD CONSTRAINT FK_Trek_has_GPS_point_Id_Ttrek FOREIGN KEY (Id_Ttrek) REFERENCES Trek(Id_Ttrek);
ALTER TABLE Trek_has_GPS_point ADD CONSTRAINT FK_Trek_has_GPS_point_id_GPS_point FOREIGN KEY (id_GPS_point) REFERENCES GPS_point(id_GPS_point);
ALTER TABLE about ADD CONSTRAINT FK_about_id_comment FOREIGN KEY (id_comment) REFERENCES Comment(id_comment);
ALTER TABLE about ADD CONSTRAINT FK_about_id_PoI FOREIGN KEY (id_PoI) REFERENCES point_of_interest(id_PoI);
ALTER TABLE about ADD CONSTRAINT FK_about_id_Photo FOREIGN KEY (id_Photo) REFERENCES Photos(id_Photo);
ALTER TABLE about ADD CONSTRAINT FK_about_Id_Ttrek FOREIGN KEY (Id_Ttrek) REFERENCES Trek(Id_Ttrek);
