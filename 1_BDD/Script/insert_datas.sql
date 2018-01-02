
INSERT INTO user
(lastname, firstname, username, password, mail, active, created_at)
VALUES
('Estabsent', 'Luc', 'flyerMan', '1234', 'luc@bbb.com', 1, '2017:05:30'),
('Bali', 'Ballo', 'berceau', '4567', 'bali@bbb.com', 0, '2016:02:24'),
('Crément', 'Alex', 'odorant', '8910', 'alex@bbb.com', 1, '2017:01:01'),
('Danslesnuages', 'Max', 'dodoMan', '7410', 'max@bbb.com', 1, '2017:01:01'),
('Attend', 'John', 'prof', '8520', 'john@bbb.com', 1, '2017:01:01'),
('Bon', 'Jean', 'cochonou', '9630', 'jean@bbb.com', 1, '2017:01:01');

 
INSERT INTO department
(name_department, num_department)
VALUES
('Ariège', 09),
('Aude', 11),
('Gard', 30),
('Haute-Garonne', 31),
('Aveyron', 12),
('Gers', 32),
('Hérault', 34),
('Lot', 46),
('Lozère', 48),
('Hautes-Pyrénées', 65),
('Pyrénées-Orientales', 66),
('Tarn', 81),
('Tarn-et-Garonne', 82);


INSERT INTO trek -- généraux
(label, level, length, time, id_Trek_1)
VALUES
("ma première rando", 2, '10.56', '03:35:10', null),
("Au bord de la falaise", null , '25.10', '05:10:55', null),
("Au bord de la rivière", 2, '54.10', '10:01:54', null);


INSERT INTO trek -- personnels
(label, level, length, time, id_Trek_1)
VALUES
("Je saute ...", 10, '00.03', '00:00:15', 2),
("Tour des cairns avec Amine", null , '42.53', '15:56:41', 2),
("Au clair de lune", 3, '05.23', '02:45:11', 3),
("un test de trek général", 3, '15.69', '03:02:02', 1);
 
 
INSERT INTO GPS_point
(latitude, longitude, altitude)
VALUES
('3.547093', '44.092308', '1226.0'),
('3.549324','44.082371','1191.0'),
('3.576699','44.012753','686.0'),
('3.594938','43.961464','521.0'),
('3.516484','43.90247','625.0'),
('3.508952','43.89824','489.0'),
('3.512087','43.893891','338.0'),
('3.520506','43.853486','573.0'),
('3.324577','43.727001','183.0'),
('3.196957','43.665635','318.0');


 INSERT INTO type
(label)
VALUES
('Cairn'),
('Panorama'),
('Faune/Flore'),
('Autre');


INSERT INTO point_of_interest
(label, description, private, id_type, id_GPS_point)
VALUES
("Belle Vues", null, false, 2, 2),
("Cairn", null, true, 1, 4),
("Pause pipi", "Attention orties", false, 4, 7),
("Zolie n animals", "Zozio", true, 3, 9),
("Pic-nique", "Jolie ruissaux", true, 2, 1),
("Pic-nique", "Jolie ruissaux", true, 4, 1);


INSERT INTO cairn
(id_PoI)
VALUES
(2);


INSERT INTO fauna_flora
(Latin_label, id_PoI)
VALUES
("Serinus canaria", 4);


INSERT INTO panorama
(orientation, id_PoI)
VALUES
("nord-ouest", 1),
("sud-est", 2);


INSERT INTO photos
(title, url, date_Photo, private, id_User, id_PoI)
VALUES
("Cairn", 'azerty.com', '2017-05-12 15:54:02', true, 1, 2),
("Un lapinou tout doux", 'azerty2.com', '2017-04-02 12:25:02', false, 1, 5),
("Montagne", 'azerty.com/qwerty.jpg', '2016-11-25 17:42:2', true, 2, 1),
("Jolie petit coin", 'azerty.com/jolie_coin.jpg', '2017-08-20 13:30:25', true, 3, 5),
("Zoizo", 'azerty.com/zoizo.jpg', '2017-10-04 20:42:25', false, 1, 4);


INSERT INTO user_comment_photo
(content, date_comment, id_user, id_photo)
VALUES
("lorem ipsum", '2017-12-11 16:45:02', 2, 5),
("Abracadabra", '2017-11-02 15:02:20', 3, 2),
("azertyuiop", '2017-05-02 09:02:20', 1, 5);
 

INSERT INTO user_comment_trek
(content, date_comment, id_user, id_trek)
VALUES
("qsdfghjklm", '2017-08-21 19:26:20', 1, 1),
("Ocus Pocus maleficus totalus", '2017-01-12 05:42:20', 4, 7),
("Abracadabra en grenouille tu te transformera", '2017-11-02 15:02:20', 5, 7);


INSERT INTO user_comment_PoI
(content, date_comment, id_user, id_PoI)
VALUES
("wxcvbn,qsdfghjklml", '2017-11-02 17:02:20', 6, 1),
("Hello world", '2017-01-22 12:42:20', 6, 4),
("Poupoupidou pou", '2016-04-01 17:02:20', 2, 1),
("Wouahhhh !", '2017-09-02 09:02:20', 3, 2),
("encore un test et j'arrête", '2017-11-02 17:02:20', 4, 3);

 
INSERT INTO trek_locate_department
(id_trek, id_department)
VALUES
(1, 1),
(2, 5), 
(2, 3),
(3, 1),
(5, 1),
(6, 3),
(5, 2);

 
INSERT INTO user_do_trek
(date_trek, id_trek, id_user)
VALUES
('2017-11-02', 1, 6),
('2017-04-02', 1, 5),
('2017-08-20', 5, 2),
('2017-01-12', 4, 3),
('2017-12-11', 6, 4),
('2017-12-11', 6, 1),
('2017-04-07', 3, 3),
('2016-03-29', 2, 6);
 
 
INSERT INTO trek_has_gps_point
(id_trek, id_GPS_point)
VALUES
(1, 1),
(1, 2),
(1, 3),
(2, 5),
(2, 7),
(2, 6),
(3, 2),
(3, 4),
(3, 8),
(4, 4),
(4, 10),
(5, 9),
(5,1);

