-- --------------------------------------------------------
-- Hôte :                        127.0.0.1
-- Version du serveur:           5.7.19-log - MySQL Community Server (GPL)
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

-- Les données exportées n'étaient pas sélectionnées.
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

-- Les données exportées n'étaient pas sélectionnées.
-- Export de la structure de la table trek_test. fauna_flora
CREATE TABLE IF NOT EXISTS `fauna_flora` (
  `latin_label` varchar(50) DEFAULT NULL,
  `id_poi` int(11) NOT NULL,
  PRIMARY KEY (`id_poi`),
  CONSTRAINT `FK_Fauna_Flora_id_poi` FOREIGN KEY (`id_poi`) REFERENCES `point_of_interest` (`id_poi`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Les données exportées n'étaient pas sélectionnées.
-- Export de la structure de la table trek_test. gps_point
CREATE TABLE IF NOT EXISTS `gps_point` (
  `id_gps_point` int(11) NOT NULL AUTO_INCREMENT,
  `longitude` varchar(25) NOT NULL,
  `latitude` varchar(25) NOT NULL,
  `altitude` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`id_gps_point`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

-- Les données exportées n'étaient pas sélectionnées.
-- Export de la structure de la table trek_test. panorama
CREATE TABLE IF NOT EXISTS `panorama` (
  `orientation` varchar(25) DEFAULT NULL,
  `id_poi` int(11) NOT NULL,
  PRIMARY KEY (`id_poi`),
  CONSTRAINT `FK_Panorama_id_poi` FOREIGN KEY (`id_poi`) REFERENCES `point_of_interest` (`id_poi`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Les données exportées n'étaient pas sélectionnées.
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

-- Les données exportées n'étaient pas sélectionnées.
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

-- Les données exportées n'étaient pas sélectionnées.
-- Export de la structure de la table trek_test. trek
CREATE TABLE IF NOT EXISTS `trek` (
  `id_trek` int(11) NOT NULL AUTO_INCREMENT,
  `label` varchar(50) NOT NULL,
  `length` float NOT NULL,
  `time` time DEFAULT NULL,
  `level` int(11) DEFAULT NULL,
  `done` tinyint(1) DEFAULT NULL,
  `pathway` text,
  `bounding_box` text,
  `official` tinyint(4) NOT NULL DEFAULT '0',
  `id_trek_1` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_trek`),
  KEY `FK_Trek_id_trek_1` (`id_trek_1`),
  CONSTRAINT `FK_Trek_id_trek_1` FOREIGN KEY (`id_trek_1`) REFERENCES `trek` (`id_trek`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=latin1;

-- Les données exportées n'étaient pas sélectionnées.
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

-- Les données exportées n'étaient pas sélectionnées.
-- Export de la structure de la table trek_test. trek_has_poi
CREATE TABLE IF NOT EXISTS `trek_has_poi` (
  `id_trek` int(11) NOT NULL,
  `id_poi` int(11) NOT NULL,
  PRIMARY KEY (`id_trek`,`id_poi`),
  KEY `FK_Trek_has_PoI_id_poi` (`id_poi`),
  CONSTRAINT `FK_Trek_has_PoI_id_poi` FOREIGN KEY (`id_poi`) REFERENCES `point_of_interest` (`id_poi`),
  CONSTRAINT `FK_Trek_has_PoI_id_trek` FOREIGN KEY (`id_trek`) REFERENCES `trek` (`id_trek`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Les données exportées n'étaient pas sélectionnées.
-- Export de la structure de la table trek_test. trek_locate_department
CREATE TABLE IF NOT EXISTS `trek_locate_department` (
  `id_trek` int(11) NOT NULL,
  `id_department` int(11) NOT NULL,
  PRIMARY KEY (`id_trek`,`id_department`),
  KEY `FK_Trek_locate_Department_id_department` (`id_department`),
  CONSTRAINT `FK_Trek_locate_Department_id_department` FOREIGN KEY (`id_department`) REFERENCES `department` (`id_department`),
  CONSTRAINT `FK_Trek_locate_Department_id_trek` FOREIGN KEY (`id_trek`) REFERENCES `trek` (`id_trek`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Les données exportées n'étaient pas sélectionnées.
-- Export de la structure de la table trek_test. type
CREATE TABLE IF NOT EXISTS `type` (
  `id_type` int(11) NOT NULL AUTO_INCREMENT,
  `label` varchar(25) NOT NULL,
  PRIMARY KEY (`id_type`),
  UNIQUE KEY `label` (`label`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

-- Les données exportées n'étaient pas sélectionnées.
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

-- Les données exportées n'étaient pas sélectionnées.
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

-- Les données exportées n'étaient pas sélectionnées.
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

-- Les données exportées n'étaient pas sélectionnées.
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

-- Les données exportées n'étaient pas sélectionnées.
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

-- Les données exportées n'étaient pas sélectionnées.
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
