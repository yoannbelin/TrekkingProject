-- --------------------------------------------------------
-- Hôte :                        127.0.0.1
-- Version du serveur:           10.2.7-MariaDB - mariadb.org binary distribution
-- SE du serveur:                Win64
-- HeidiSQL Version:             9.4.0.5125
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Export de la structure de la base pour trek_test
CREATE DATABASE IF NOT EXISTS `trek_test` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `trek_test`;

-- Export de la structure de la table trek_test. cairn
CREATE TABLE IF NOT EXISTS `cairn` (
  `id_poi` int(11) NOT NULL,
  PRIMARY KEY (`id_poi`),
  CONSTRAINT `FK_Cairn_id_poi` FOREIGN KEY (`id_poi`) REFERENCES `point_of_interest` (`id_poi`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Export de données de la table trek_test.cairn : ~2 rows (environ)
/*!40000 ALTER TABLE `cairn` DISABLE KEYS */;
INSERT INTO `cairn` (`id_poi`) VALUES
	(2),
	(3);
/*!40000 ALTER TABLE `cairn` ENABLE KEYS */;

-- Export de la structure de la procédure trek_test. del_trek
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `del_trek`(IN p_id_user INT, IN p_id_trek INT)
BEGIN
DELETE FROM user_do_trek
WHERE user_do_trek.id_trek = p_id_trek
AND user_do_trek.id_user = p_id_user;
DELETE FROM trek
WHERE trek.id_trek = p_id_trek;
END//
DELIMITER ;

-- Export de la structure de la table trek_test. department
CREATE TABLE IF NOT EXISTS `department` (
  `id_department` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(25) NOT NULL,
  `num` int(11) NOT NULL,
  PRIMARY KEY (`id_department`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;

-- Export de données de la table trek_test.department : ~15 rows (environ)
/*!40000 ALTER TABLE `department` DISABLE KEYS */;
INSERT INTO `department` (`id_department`, `name`, `num`) VALUES
	(1, 'Ariège', 9),
	(2, 'Aude', 11),
	(3, 'Gard', 30),
	(4, 'Haute-Garonne', 31),
	(5, 'Aveyron', 12),
	(6, 'Gers', 32),
	(7, 'Hérault', 34),
	(8, 'Lot', 46),
	(9, 'Lozère', 48),
	(10, 'Hautes-Pyrénées', 65),
	(11, 'Pyrénées-Orientales', 66),
	(12, 'Tarn', 81),
	(13, 'Tarn-et-Garonne', 82),
	(14, 'GwanderNation', 33),
	(15, 'Kowan', 54);
/*!40000 ALTER TABLE `department` ENABLE KEYS */;

-- Export de la structure de la table trek_test. fauna_flora
CREATE TABLE IF NOT EXISTS `fauna_flora` (
  `latin_label` varchar(50) DEFAULT NULL,
  `id_poi` int(11) NOT NULL,
  PRIMARY KEY (`id_poi`),
  CONSTRAINT `FK_Fauna_Flora_id_poi` FOREIGN KEY (`id_poi`) REFERENCES `point_of_interest` (`id_poi`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Export de données de la table trek_test.fauna_flora : ~1 rows (environ)
/*!40000 ALTER TABLE `fauna_flora` DISABLE KEYS */;
INSERT INTO `fauna_flora` (`latin_label`, `id_poi`) VALUES
	('Serinus canaria', 5);
/*!40000 ALTER TABLE `fauna_flora` ENABLE KEYS */;

-- Export de la structure de la table trek_test. gps_point
CREATE TABLE IF NOT EXISTS `gps_point` (
  `id_gps_point` int(11) NOT NULL AUTO_INCREMENT,
  `longitude` varchar(25) NOT NULL,
  `latitude` varchar(25) NOT NULL,
  `altitude` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`id_gps_point`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

-- Export de données de la table trek_test.gps_point : ~10 rows (environ)
/*!40000 ALTER TABLE `gps_point` DISABLE KEYS */;
INSERT INTO `gps_point` (`id_gps_point`, `longitude`, `latitude`, `altitude`) VALUES
	(1, '44.092308', '3.547093', '1226.0'),
	(2, '44.082371', '3.549324', '1191.0'),
	(3, '44.012753', '3.576699', '686.0'),
	(4, '43.961464', '3.594938', '521.0'),
	(5, '43.90247', '3.516484', '625.0'),
	(6, '43.89824', '3.508952', '489.0'),
	(7, '43.893891', '3.512087', '338.0'),
	(8, '43.853486', '3.520506', '573.0'),
	(9, '43.727001', '3.324577', '183.0'),
	(10, '43.665635', '3.196957', '318.0');
/*!40000 ALTER TABLE `gps_point` ENABLE KEYS */;

-- Export de la structure de la table trek_test. panorama
CREATE TABLE IF NOT EXISTS `panorama` (
  `orientation` varchar(25) DEFAULT NULL,
  `id_poi` int(11) NOT NULL,
  PRIMARY KEY (`id_poi`),
  CONSTRAINT `FK_Panorama_id_poi` FOREIGN KEY (`id_poi`) REFERENCES `point_of_interest` (`id_poi`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Export de données de la table trek_test.panorama : ~2 rows (environ)
/*!40000 ALTER TABLE `panorama` DISABLE KEYS */;
INSERT INTO `panorama` (`orientation`, `id_poi`) VALUES
	('nord-ouest', 1),
	('sud-est', 6);
/*!40000 ALTER TABLE `panorama` ENABLE KEYS */;

-- Export de la structure de la table trek_test. photo
CREATE TABLE IF NOT EXISTS `photo` (
  `id_photo` int(11) NOT NULL AUTO_INCREMENT,
  `private` tinyint(1) NOT NULL,
  `url` varchar(400) DEFAULT NULL,
  `title` varchar(25) DEFAULT NULL,
  `date_photo` datetime DEFAULT NULL,
  `id_user` int(11) DEFAULT NULL,
  `id_poi` int(11) DEFAULT NULL,
  `id_trek` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_photo`),
  KEY `FK_Photo_id_user` (`id_user`),
  KEY `FK_Photo_id_poi` (`id_poi`),
  KEY `FK_Photo_id_trek` (`id_trek`),
  CONSTRAINT `FK_Photo_id_poi` FOREIGN KEY (`id_poi`) REFERENCES `point_of_interest` (`id_poi`),
  CONSTRAINT `FK_Photo_id_trek` FOREIGN KEY (`id_trek`) REFERENCES `trek` (`id_trek`),
  CONSTRAINT `FK_Photo_id_user` FOREIGN KEY (`id_user`) REFERENCES `user` (`id_user`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

-- Export de données de la table trek_test.photo : ~5 rows (environ)
/*!40000 ALTER TABLE `photo` DISABLE KEYS */;
INSERT INTO `photo` (`id_photo`, `private`, `url`, `title`, `date_photo`, `id_user`, `id_poi`, `id_trek`) VALUES
	(1, 1, 'http://www.photodenature.fr/wp-content/uploads/2015/01/photo-photo-paysage-libre-de-droit-8.jpg', 'Cairn', '2017-05-12 15:54:02', 1, 2, 4),
	(2, 0, 'https://imgc.allpostersimages.com/img/print/affiches/the-vintage-collection-keep-calm-and-eat-chocolate_a-G-8594717-0.jpg', 'Un lapinou tout doux', '2017-04-02 12:25:02', 2, 5, 5),
	(3, 1, 'http://www.afrokanlife.com/wp-content/uploads/2012/03/photo-libre-3-640x425.jpg', 'Montagne', '2016-11-25 17:42:02', 4, 1, 7),
	(4, 1, 'https://i.pinimg.com/736x/06/e6/e9/06e6e97678a4b8bc75fa59d4401b4e09.jpg', 'Jolie petit coin', '2017-08-20 13:30:25', 6, 7, 9),
	(5, 0, '/pictures/Keep_Calm_And_Run_QMake.jpg', 'Zoizo', '2017-10-04 20:42:25', 6, 4, 9);
/*!40000 ALTER TABLE `photo` ENABLE KEYS */;

-- Export de la structure de la table trek_test. point_of_interest
CREATE TABLE IF NOT EXISTS `point_of_interest` (
  `id_poi` int(11) NOT NULL AUTO_INCREMENT,
  `label` varchar(25) NOT NULL,
  `description` varchar(240) DEFAULT NULL,
  `private` tinyint(1) NOT NULL,
  `id_gps_point` int(11) NOT NULL,
  `id_type` int(11) NOT NULL,
  PRIMARY KEY (`id_poi`),
  KEY `FK_Point_of_Interest_id_gps_point` (`id_gps_point`),
  KEY `FK_Point_of_Interest_id_type` (`id_type`),
  CONSTRAINT `FK_Point_of_Interest_id_gps_point` FOREIGN KEY (`id_gps_point`) REFERENCES `gps_point` (`id_gps_point`),
  CONSTRAINT `FK_Point_of_Interest_id_type` FOREIGN KEY (`id_type`) REFERENCES `type` (`id_type`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

-- Export de données de la table trek_test.point_of_interest : ~7 rows (environ)
/*!40000 ALTER TABLE `point_of_interest` DISABLE KEYS */;
INSERT INTO `point_of_interest` (`id_poi`, `label`, `description`, `private`, `id_gps_point`, `id_type`) VALUES
	(1, 'Belle Vues', NULL, 0, 1, 2),
	(2, 'Zolie tatdePierre', '2PIR', 1, 10, 1),
	(3, 'Cairn', NULL, 1, 4, 1),
	(4, 'Pause pipi', 'Attention orties', 0, 7, 4),
	(5, 'Zolie n animals', 'Zozio', 1, 9, 3),
	(6, 'Pic-nique', 'Jolie ruissaux', 1, 8, 2),
	(7, 'Pic-nique', 'Jolie ruissaux', 1, 8, 4);
/*!40000 ALTER TABLE `point_of_interest` ENABLE KEYS */;

-- Export de la structure de la table trek_test. trek
CREATE TABLE IF NOT EXISTS `trek` (
  `id_trek` int(11) NOT NULL AUTO_INCREMENT,
  `label` varchar(50) NOT NULL,
  `length` float NOT NULL,
  `time` time DEFAULT NULL,
  `level` int(11) DEFAULT NULL,
  `done` tinyint(1) DEFAULT NULL,
  `pathway` text DEFAULT NULL,
  `bounding_box` text DEFAULT NULL,
  `official` tinyint(4) NOT NULL DEFAULT 0,
  `id_trek_1` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_trek`),
  KEY `FK_Trek_id_trek_1` (`id_trek_1`),
  CONSTRAINT `FK_Trek_id_trek_1` FOREIGN KEY (`id_trek_1`) REFERENCES `trek` (`id_trek`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=latin1;

-- Export de données de la table trek_test.trek : ~22 rows (environ)
/*!40000 ALTER TABLE `trek` DISABLE KEYS */;
INSERT INTO `trek` (`id_trek`, `label`, `length`, `time`, `level`, `done`, `pathway`, `bounding_box`, `official`, `id_trek_1`) VALUES
	(1, 'général 1', 10.56, '03:35:10', 2, 0, '{"chemin": [{"lat": "43.824062505915236", "lng": "3.6529541015625004"},{"lat": "43.57983126519669", "lng": "3.6447143554687504"}]}', NULL, 1, NULL),
	(2, 'général 2', 25.1, '05:10:55', NULL, 0, '{"chemin": [{"lat": "01.01", "lng": "02.02"},{"lat": "03.03","lng": "04.04"}]}', NULL, 1, NULL),
	(3, 'général 3', 54.1, '10:01:54', 2, 0, '{"chemin": [{"lat": "43.829016238174994", "lng": "4.003143310546876"},{"lat": "43.72291663731014", "lng": "4.130859375000001"}]}', NULL, 1, NULL),
	(4, 'Je saute ...', 0.03, '00:00:15', 10, 1, '{"chemin": [{"lat": "01.01", "lng": "02.02"},{"lat": "03.03","lng": "04.04"}]}', NULL, 0, 1),
	(5, 'Tour des cairns avec Amine', 42.53, '15:56:41', NULL, 1, '{"chemin": [{"lat": "01.01", "lng": "02.02"},{"lat": "03.03","lng": "04.04"}]}', NULL, 0, 1),
	(6, 'Au clair de lune', 5.23, '02:45:11', 3, 0, '{"chemin": [{"lat": "01.01", "lng": "02.02"},{"lat": "03.03","lng": "04.04"}]}', NULL, 0, 2),
	(7, 'un test de trek général', 15.69, '03:02:02', 3, 0, '{"chemin": [{"lat": "01.01", "lng": "02.02"},{"lat": "03.03","lng": "04.04"}]}', NULL, 0, 2),
	(8, 'ma première rando', 10.56, '03:35:10', 2, 1, '{"chemin": [{"lat": "01.01", "lng": "02.02"},{"lat": "03.03","lng": "04.04"}]}', NULL, 0, 2),
	(9, 'Au bord de la falaise', 25.1, '05:10:55', NULL, 1, '{"chemin": [{"lat": "01.01", "lng": "02.02"},{"lat": "03.03","lng": "04.04"}]}', NULL, 0, 3),
	(10, 'Au bord de la rivière', 54.1, '10:01:54', 2, 0, '{"chemin": [{"lat": "01.01", "lng": "02.02"},{"lat": "03.03","lng": "04.04"}]}', NULL, 0, 3),
	(13, 'try it again', 25.07, NULL, NULL, NULL, '{"chemin": [{"lat": "01.01", "lng": "02.02"},{"lat": "03.03","lng": "04.04"}]}', NULL, 0, NULL),
	(14, 'sdfsafd', 59.92, '10:10:10', 2, 0, '{"chemin":[{"lat":"43.57883642495716","lng":"3.702478408813477"},{"lat":"43.720931674984534","lng":"3.804101943969727"},{"lat":"43.70306405462156","lng":"3.989496231079102"},{"lat":"43.59574647349491","lng":"4.0128421783447275"},{"lat":"43.54102031586806","lng":"3.9016056060791016"},{"lat":"43.5708771112904","lng":"3.870019912719727"}]}', NULL, 0, NULL),
	(15, 'Ultimate Marathon', 58.83, NULL, 99, NULL, '{"chemin":[{"lat":43.56689705995962,"lng":3.839807510375977},{"lat":43.69214233094498,"lng":3.823328018188477},{"lat":43.74871516277156,"lng":3.918085098266602},{"lat":43.72192416436807,"lng":4.0897464752197275},{"lat":43.651416562664785,"lng":4.0224552154541025},{"lat":43.6037024995974,"lng":3.971643447875977},{"lat":43.56888711849962,"lng":3.940057754516602}]}', NULL, 0, NULL),
	(16, 'ouam', 67.11, NULL, NULL, NULL, '{"chemin":[{"lat":43.8082078001123,"lng":3.794488906860352},{"lat":43.69313529711951,"lng":3.959283828735352},{"lat":43.824062505915236,"lng":3.953790664672852},{"lat":43.695121180146415,"lng":3.751916885375977},{"lat":43.80424346591425,"lng":3.788995742797852}]}', NULL, 0, NULL),
	(17, 'Grand Tour', 114.91, NULL, 99, NULL, '{"chemin":[{"lat":43.57655133904518,"lng":3.7802195549011235},{"lat":43.63124521825444,"lng":3.7541270256042485},{"lat":43.6680113034769,"lng":3.7939524650573735},{"lat":43.67794421991334,"lng":3.8694834709167485},{"lat":43.6680113034769,"lng":3.9477610588073735},{"lat":43.620310420515246,"lng":3.9903330802917485},{"lat":43.593462029427215,"lng":3.9738535881042485},{"lat":43.56859172334056,"lng":3.9216685295104985},{"lat":43.59644577577047,"lng":4.054877758026124},{"lat":43.64515935672089,"lng":4.096076488494874},{"lat":43.723614460003134,"lng":4.057624340057374},{"lat":43.75734836412478,"lng":3.9216685295104985},{"lat":43.747428600656335,"lng":3.8365244865417485},{"lat":43.73949160604922,"lng":3.7156748771667485},{"lat":43.69085455345099,"lng":3.6456370353698735},{"lat":43.62130457523125,"lng":3.6772227287292485},{"lat":43.57854107859674,"lng":3.7019419670104985}]}', NULL, 0, NULL),
	(18, 'Nimes Montpel', 47.89, NULL, 45, NULL, '{"chemin":[{"lat":43.84358092518573,"lng":4.358375072479249},{"lat":43.812868653397466,"lng":4.317176342010499},{"lat":43.76627474542637,"lng":4.252631664276124},{"lat":43.74346023488879,"lng":4.186713695526124},{"lat":43.719644515827724,"lng":4.134528636932374},{"lat":43.68886852913706,"lng":4.054877758026124},{"lat":43.67297796719731,"lng":3.9985728263854985},{"lat":43.651121572559525,"lng":3.9450144767761235},{"lat":43.63124521825444,"lng":3.8955760002136235},{"lat":43.6044017094082,"lng":3.8763499259948735}]}', NULL, 0, NULL),
	(19, 'fgfgsjg', 43.16, NULL, 30, NULL, '{"chemin":[{"lat":43.81187767184972,"lng":3.763740062713623},{"lat":43.75933211951108,"lng":3.6964488029479985},{"lat":43.719644515827724,"lng":3.7857127189636235},{"lat":43.77718295833278,"lng":3.8996958732604985},{"lat":43.83169417847459,"lng":3.9683604240417485},{"lat":43.78114908792438,"lng":4.028785228729249}]}', NULL, 0, NULL),
	(20, 'sdfsdf', 23.05, NULL, 5, NULL, '{"chemin":[{"lat":43.471997680417566,"lng":3.6456370353698735},{"lat":43.49391916706005,"lng":3.7143015861511235},{"lat":43.54669735589176,"lng":3.8021922111511235},{"lat":43.58351513981761,"lng":3.8845896720886235}]}', NULL, 0, NULL),
	(21, 'yoyoyo', 188.4, NULL, 3, NULL, '{"chemin":[{"lat":43.56262132119515,"lng":3.6827158927917485},{"lat":43.75338065604419,"lng":3.7788462638854985},{"lat":43.73552271413926,"lng":3.9917063713073735},{"lat":43.61036796922853,"lng":3.9477610588073735},{"lat":43.67595776814767,"lng":3.8447642326354985},{"lat":43.72262199862146,"lng":3.6703562736511235},{"lat":43.844571380523476,"lng":3.8420176506042485},{"lat":43.849523410545046,"lng":3.9958262443542485},{"lat":43.78511495442906,"lng":4.112555980682374},{"lat":43.67794421991334,"lng":4.050757884979249},{"lat":43.59147278300837,"lng":3.9669871330261235},{"lat":43.57157670251024,"lng":3.8722300529479985},{"lat":43.58948347083776,"lng":3.7431406974792485},{"lat":43.64913423303804,"lng":3.6731028556823735},{"lat":43.74346023488879,"lng":3.5797190666198735}]}', NULL, 0, NULL),
	(22, 'Avoid Nimes', 58.56, NULL, 5, NULL, '{"chemin":[{"lat":43.81316284787894,"lng":4.3369388580322275},{"lat":43.78243492502658,"lng":4.3959903717041025},{"lat":43.80919884255291,"lng":4.4385623931884775},{"lat":43.89238770157165,"lng":4.4509220123291025},{"lat":43.926026393624255,"lng":4.3602848052978525},{"lat":43.91415608493973,"lng":4.2861270904541025},{"lat":43.8399130020632,"lng":4.2641544342041025},{"lat":43.800278868620275,"lng":4.2929935455322275},{"lat":43.75962657759534,"lng":4.3259525299072275},{"lat":43.81316284787894,"lng":4.3314456939697275}]}', NULL, 0, NULL),
	(23, 'Kyoto Trip', 9.75, NULL, 3, NULL, '{"chemin":[{"lat":34.96798361497661,"lng":-224.24177169799808},{"lat":34.93871866336308,"lng":-224.22803878784183},{"lat":34.91394785253979,"lng":-224.21979904174808},{"lat":34.88466361836388,"lng":-224.20881271362308}]}', NULL, 0, NULL),
	(24, 'Japan for Beasts', 1877.94, NULL, 9001, NULL, '{"chemin":[{"lat":31.658641741850396,"lng":-229.5847320556641},{"lat":32.73703926550904,"lng":-228.8816070556641},{"lat":33.729479368838945,"lng":-228.0905914306641},{"lat":34.45731417753458,"lng":-226.9480133056641},{"lat":34.8188768568138,"lng":-225.4538726806641},{"lat":34.99906617556976,"lng":-223.69606018066406},{"lat":35.2147706835869,"lng":-222.42164611816406},{"lat":35.60874315730877,"lng":-220.6198883056641},{"lat":36.673375615028284,"lng":-219.96070861816406},{"lat":38.4154004575845,"lng":-219.4333648681641},{"lat":39.61044924864762,"lng":-218.9499664306641},{"lat":41.0177286587949,"lng":-219.2136383056641},{"lat":42.39557261051852,"lng":-219.3454742431641},{"lat":43.07340216393554,"lng":-218.5105133056641}]}', NULL, 0, NULL);
/*!40000 ALTER TABLE `trek` ENABLE KEYS */;

-- Export de la structure de la procédure trek_test. trek_all
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `trek_all`(IN p_id_user INT, IN p_label VARCHAR(50), IN p_length FLOAT, IN p_level INT, IN p_pathway JSON)
BEGIN
INSERT INTO trek
(label, length, level, pathway)
VALUES
(p_label, p_length, p_level, p_pathway);
INSERT INTO user_do_trek
(id_user, id_trek)
VALUES
(p_id_user, (SELECT max(trek.id_trek) FROM trek));
END//
DELIMITER ;

-- Export de la structure de la table trek_test. trek_has_gps_point
CREATE TABLE IF NOT EXISTS `trek_has_gps_point` (
  `id_trek` int(11) NOT NULL,
  `id_gps_point` int(11) NOT NULL,
  PRIMARY KEY (`id_trek`,`id_gps_point`),
  KEY `FK_Trek_has_GPS_Point_id_gps_point` (`id_gps_point`),
  CONSTRAINT `FK_Trek_has_GPS_Point_id_gps_point` FOREIGN KEY (`id_gps_point`) REFERENCES `gps_point` (`id_gps_point`),
  CONSTRAINT `FK_Trek_has_GPS_Point_id_trek` FOREIGN KEY (`id_trek`) REFERENCES `trek` (`id_trek`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Export de données de la table trek_test.trek_has_gps_point : ~26 rows (environ)
/*!40000 ALTER TABLE `trek_has_gps_point` DISABLE KEYS */;
INSERT INTO `trek_has_gps_point` (`id_trek`, `id_gps_point`) VALUES
	(1, 1),
	(1, 2),
	(1, 3),
	(2, 5),
	(2, 6),
	(2, 7),
	(3, 2),
	(3, 4),
	(3, 8),
	(4, 4),
	(4, 10),
	(5, 1),
	(5, 9),
	(6, 4),
	(6, 7),
	(6, 10),
	(7, 1),
	(7, 2),
	(7, 3),
	(8, 4),
	(8, 5),
	(8, 6),
	(9, 7),
	(9, 8),
	(10, 9),
	(10, 10);
/*!40000 ALTER TABLE `trek_has_gps_point` ENABLE KEYS */;

-- Export de la structure de la table trek_test. trek_has_poi
CREATE TABLE IF NOT EXISTS `trek_has_poi` (
  `id_trek` int(11) NOT NULL,
  `id_poi` int(11) NOT NULL,
  PRIMARY KEY (`id_trek`,`id_poi`),
  KEY `FK_Trek_has_PoI_id_poi` (`id_poi`),
  CONSTRAINT `FK_Trek_has_PoI_id_poi` FOREIGN KEY (`id_poi`) REFERENCES `point_of_interest` (`id_poi`),
  CONSTRAINT `FK_Trek_has_PoI_id_trek` FOREIGN KEY (`id_trek`) REFERENCES `trek` (`id_trek`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Export de données de la table trek_test.trek_has_poi : ~16 rows (environ)
/*!40000 ALTER TABLE `trek_has_poi` DISABLE KEYS */;
INSERT INTO `trek_has_poi` (`id_trek`, `id_poi`) VALUES
	(1, 5),
	(1, 7),
	(4, 2),
	(4, 3),
	(4, 6),
	(5, 1),
	(6, 2),
	(6, 3),
	(6, 4),
	(7, 1),
	(8, 3),
	(9, 4),
	(9, 6),
	(9, 7),
	(10, 2),
	(10, 5);
/*!40000 ALTER TABLE `trek_has_poi` ENABLE KEYS */;

-- Export de la structure de la table trek_test. trek_locate_department
CREATE TABLE IF NOT EXISTS `trek_locate_department` (
  `id_trek` int(11) NOT NULL,
  `id_department` int(11) NOT NULL,
  PRIMARY KEY (`id_trek`,`id_department`),
  KEY `FK_Trek_locate_Department_id_department` (`id_department`),
  CONSTRAINT `FK_Trek_locate_Department_id_department` FOREIGN KEY (`id_department`) REFERENCES `department` (`id_department`),
  CONSTRAINT `FK_Trek_locate_Department_id_trek` FOREIGN KEY (`id_trek`) REFERENCES `trek` (`id_trek`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Export de données de la table trek_test.trek_locate_department : ~7 rows (environ)
/*!40000 ALTER TABLE `trek_locate_department` DISABLE KEYS */;
INSERT INTO `trek_locate_department` (`id_trek`, `id_department`) VALUES
	(1, 1),
	(2, 3),
	(2, 5),
	(3, 1),
	(5, 1),
	(5, 2),
	(6, 3);
/*!40000 ALTER TABLE `trek_locate_department` ENABLE KEYS */;

-- Export de la structure de la table trek_test. type
CREATE TABLE IF NOT EXISTS `type` (
  `id_type` int(11) NOT NULL AUTO_INCREMENT,
  `label` varchar(25) NOT NULL,
  PRIMARY KEY (`id_type`),
  UNIQUE KEY `label` (`label`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

-- Export de données de la table trek_test.type : ~4 rows (environ)
/*!40000 ALTER TABLE `type` DISABLE KEYS */;
INSERT INTO `type` (`id_type`, `label`) VALUES
	(4, 'Autre'),
	(1, 'Cairn'),
	(3, 'Faune/Flore'),
	(2, 'Panorama');
/*!40000 ALTER TABLE `type` ENABLE KEYS */;

-- Export de la structure de la table trek_test. user
CREATE TABLE IF NOT EXISTS `user` (
  `id_user` int(11) NOT NULL AUTO_INCREMENT,
  `lastname` varchar(25) NOT NULL,
  `firstname` varchar(25) NOT NULL,
  `username` varchar(25) NOT NULL,
  `password` varchar(25) NOT NULL,
  `mail` varchar(25) NOT NULL,
  `active` tinyint(1) NOT NULL,
  `created_at` date NOT NULL,
  PRIMARY KEY (`id_user`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

-- Export de données de la table trek_test.user : ~6 rows (environ)
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` (`id_user`, `lastname`, `firstname`, `username`, `password`, `mail`, `active`, `created_at`) VALUES
	(1, 'Estabsent', 'Luc', 'flyerMan', '1234', 'luc@bbb.com', 1, '2017-05-30'),
	(2, 'Bali', 'Ballo', 'berceau', '4567', 'bali@bbb.com', 0, '2016-02-24'),
	(3, 'Crément', 'Alex', 'odorant', '8910', 'alex@bbb.com', 1, '2017-01-01'),
	(4, 'Danslesnuages', 'Max', 'dodoMan', '7410', 'max@bbb.com', 1, '2017-01-01'),
	(5, 'Attend', 'John', 'prof', '8520', 'john@bbb.com', 1, '2017-01-01'),
	(6, 'Bon', 'Jean', 'cochonou', '9630', 'jean@bbb.com', 1, '2017-01-01');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;

-- Export de la structure de la table trek_test. user_comment_photo
CREATE TABLE IF NOT EXISTS `user_comment_photo` (
  `content` varchar(400) NOT NULL,
  `date_comment` datetime NOT NULL,
  `id_user` int(11) NOT NULL,
  `id_photo` int(11) NOT NULL,
  PRIMARY KEY (`id_user`,`id_photo`),
  KEY `FK_User_comment_photo_id_photo` (`id_photo`),
  CONSTRAINT `FK_User_comment_photo_id_photo` FOREIGN KEY (`id_photo`) REFERENCES `photo` (`id_photo`),
  CONSTRAINT `FK_User_comment_photo_id_user` FOREIGN KEY (`id_user`) REFERENCES `user` (`id_user`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Export de données de la table trek_test.user_comment_photo : ~3 rows (environ)
/*!40000 ALTER TABLE `user_comment_photo` DISABLE KEYS */;
INSERT INTO `user_comment_photo` (`content`, `date_comment`, `id_user`, `id_photo`) VALUES
	('azertyuiop', '2017-05-02 09:02:20', 1, 5),
	('lorem ipsum', '2017-12-11 16:45:02', 2, 5),
	('Abracadabra', '2017-11-02 15:02:20', 3, 2);
/*!40000 ALTER TABLE `user_comment_photo` ENABLE KEYS */;

-- Export de la structure de la table trek_test. user_comment_poi
CREATE TABLE IF NOT EXISTS `user_comment_poi` (
  `content` varchar(400) NOT NULL,
  `date_comment` datetime NOT NULL,
  `id_user` int(11) NOT NULL,
  `id_poi` int(11) NOT NULL,
  PRIMARY KEY (`id_user`,`id_poi`),
  KEY `FK_User_comment_PoI_id_poi` (`id_poi`),
  CONSTRAINT `FK_User_comment_PoI_id_poi` FOREIGN KEY (`id_poi`) REFERENCES `point_of_interest` (`id_poi`),
  CONSTRAINT `FK_User_comment_PoI_id_user` FOREIGN KEY (`id_user`) REFERENCES `user` (`id_user`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Export de données de la table trek_test.user_comment_poi : ~5 rows (environ)
/*!40000 ALTER TABLE `user_comment_poi` DISABLE KEYS */;
INSERT INTO `user_comment_poi` (`content`, `date_comment`, `id_user`, `id_poi`) VALUES
	('Poupoupidou pou', '2016-04-01 17:02:20', 2, 1),
	('Wouahhhh !', '2017-09-02 09:02:20', 3, 2),
	('encore un test et j\'arrête', '2017-11-02 17:02:20', 4, 3),
	('wxcvbn,qsdfghjklml', '2017-11-02 17:02:20', 6, 1),
	('Hello world', '2017-01-22 12:42:20', 6, 4);
/*!40000 ALTER TABLE `user_comment_poi` ENABLE KEYS */;

-- Export de la structure de la table trek_test. user_comment_trek
CREATE TABLE IF NOT EXISTS `user_comment_trek` (
  `content` varchar(400) NOT NULL,
  `date_comment` datetime NOT NULL,
  `id_trek` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  PRIMARY KEY (`id_trek`,`id_user`),
  KEY `FK_User_comment_Trek_id_user` (`id_user`),
  CONSTRAINT `FK_User_comment_Trek_id_trek` FOREIGN KEY (`id_trek`) REFERENCES `trek` (`id_trek`),
  CONSTRAINT `FK_User_comment_Trek_id_user` FOREIGN KEY (`id_user`) REFERENCES `user` (`id_user`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Export de données de la table trek_test.user_comment_trek : ~3 rows (environ)
/*!40000 ALTER TABLE `user_comment_trek` DISABLE KEYS */;
INSERT INTO `user_comment_trek` (`content`, `date_comment`, `id_trek`, `id_user`) VALUES
	('qsdfghjklm', '2017-08-21 19:26:20', 1, 1),
	('Ocus Pocus maleficus totalus', '2017-01-12 05:42:20', 2, 4),
	('Abracadabra en grenouille tu te transformera', '2017-11-02 15:02:20', 3, 5);
/*!40000 ALTER TABLE `user_comment_trek` ENABLE KEYS */;

-- Export de la structure de la table trek_test. user_do_trek
CREATE TABLE IF NOT EXISTS `user_do_trek` (
  `date_trek` date DEFAULT NULL,
  `id_trek` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  PRIMARY KEY (`id_trek`,`id_user`),
  KEY `FK_User_do_Trek_id_user` (`id_user`),
  CONSTRAINT `FK_User_do_Trek_id_trek` FOREIGN KEY (`id_trek`) REFERENCES `trek` (`id_trek`),
  CONSTRAINT `FK_User_do_Trek_id_user` FOREIGN KEY (`id_user`) REFERENCES `user` (`id_user`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Export de données de la table trek_test.user_do_trek : ~20 rows (environ)
/*!40000 ALTER TABLE `user_do_trek` DISABLE KEYS */;
INSERT INTO `user_do_trek` (`date_trek`, `id_trek`, `id_user`) VALUES
	('2017-11-02', 4, 3),
	('2017-04-02', 5, 2),
	('2017-08-20', 6, 3),
	('2017-01-12', 7, 4),
	('2017-12-11', 8, 5),
	('2017-12-11', 9, 6),
	('2017-04-07', 10, 1),
	('2016-03-29', 10, 2),
	(NULL, 13, 3),
	('2016-03-28', 14, 3),
	(NULL, 15, 3),
	('2017-12-21', 16, 3),
	(NULL, 17, 3),
	(NULL, 18, 3),
	(NULL, 19, 3),
	(NULL, 20, 3),
	(NULL, 21, 3),
	(NULL, 22, 3),
	(NULL, 23, 3),
	(NULL, 24, 3);
/*!40000 ALTER TABLE `user_do_trek` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
