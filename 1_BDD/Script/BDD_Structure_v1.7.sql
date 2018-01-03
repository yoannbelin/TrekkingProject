CREATE DATABASE  IF NOT EXISTS `trek_test` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `trek_test`;
-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: localhost    Database: trek_test
-- ------------------------------------------------------
-- Server version	5.5.5-10.2.7-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `cairn`
--

DROP TABLE IF EXISTS `cairn`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cairn` (
  `id_poi` int(11) NOT NULL,
  PRIMARY KEY (`id_poi`),
  CONSTRAINT `FK_Cairn_id_poi` FOREIGN KEY (`id_poi`) REFERENCES `point_of_interest` (`id_poi`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `department`
--

DROP TABLE IF EXISTS `department`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `department` (
  `id_department` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(25) NOT NULL,
  `num` int(11) NOT NULL,
  PRIMARY KEY (`id_department`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `fauna_flora`
--

DROP TABLE IF EXISTS `fauna_flora`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fauna_flora` (
  `latin_label` varchar(50) DEFAULT NULL,
  `id_poi` int(11) NOT NULL,
  PRIMARY KEY (`id_poi`),
  CONSTRAINT `FK_Fauna_Flora_id_poi` FOREIGN KEY (`id_poi`) REFERENCES `point_of_interest` (`id_poi`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `gps_point`
--

DROP TABLE IF EXISTS `gps_point`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gps_point` (
  `id_gps_point` int(11) NOT NULL AUTO_INCREMENT,
  `longitude` varchar(25) NOT NULL,
  `latitude` varchar(25) NOT NULL,
  `altitude` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`id_gps_point`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `panorama`
--

DROP TABLE IF EXISTS `panorama`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `panorama` (
  `orientation` varchar(25) DEFAULT NULL,
  `id_poi` int(11) NOT NULL,
  PRIMARY KEY (`id_poi`),
  CONSTRAINT `FK_Panorama_id_poi` FOREIGN KEY (`id_poi`) REFERENCES `point_of_interest` (`id_poi`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `photo`
--

DROP TABLE IF EXISTS `photo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `photo` (
  `id_photo` int(11) NOT NULL AUTO_INCREMENT,
  `private` tinyint(1) NOT NULL,
  `url` varchar(50) NOT NULL,
  `title` varchar(25) NOT NULL,
  `date_photo` datetime NOT NULL,
  `id_user` int(11) NOT NULL,
  `id_poi` int(11) NOT NULL,
  `id_trek` int(11) NOT NULL,
  PRIMARY KEY (`id_photo`),
  KEY `FK_Photo_id_user` (`id_user`),
  KEY `FK_Photo_id_poi` (`id_poi`),
  KEY `FK_Photo_id_trek` (`id_trek`),
  CONSTRAINT `FK_Photo_id_poi` FOREIGN KEY (`id_poi`) REFERENCES `point_of_interest` (`id_poi`),
  CONSTRAINT `FK_Photo_id_trek` FOREIGN KEY (`id_trek`) REFERENCES `trek` (`id_trek`),
  CONSTRAINT `FK_Photo_id_user` FOREIGN KEY (`id_user`) REFERENCES `user` (`id_user`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `point_of_interest`
--

DROP TABLE IF EXISTS `point_of_interest`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `point_of_interest` (
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `trek`
--

DROP TABLE IF EXISTS `trek`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `trek` (
  `id_trek` int(11) NOT NULL AUTO_INCREMENT,
  `label` varchar(50) NOT NULL,
  `length` float NOT NULL,
  `time` time DEFAULT NULL,
  `level` int(11) DEFAULT NULL,
  `done` tinyint(1) DEFAULT NULL,
  `pathway` text DEFAULT NULL,
  `id_trek_1` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_trek`),
  KEY `FK_Trek_id_trek_1` (`id_trek_1`),
  CONSTRAINT `FK_Trek_id_trek_1` FOREIGN KEY (`id_trek_1`) REFERENCES `trek` (`id_trek`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `trek_has_gps_point`
--

DROP TABLE IF EXISTS `trek_has_gps_point`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `trek_has_gps_point` (
  `id_trek` int(11) NOT NULL,
  `id_gps_point` int(11) NOT NULL,
  PRIMARY KEY (`id_trek`,`id_gps_point`),
  KEY `FK_Trek_has_GPS_Point_id_gps_point` (`id_gps_point`),
  CONSTRAINT `FK_Trek_has_GPS_Point_id_gps_point` FOREIGN KEY (`id_gps_point`) REFERENCES `gps_point` (`id_gps_point`),
  CONSTRAINT `FK_Trek_has_GPS_Point_id_trek` FOREIGN KEY (`id_trek`) REFERENCES `trek` (`id_trek`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `trek_has_poi`
--

DROP TABLE IF EXISTS `trek_has_poi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `trek_has_poi` (
  `id_trek` int(11) NOT NULL,
  `id_poi` int(11) NOT NULL,
  PRIMARY KEY (`id_trek`,`id_poi`),
  KEY `FK_Trek_has_PoI_id_poi` (`id_poi`),
  CONSTRAINT `FK_Trek_has_PoI_id_poi` FOREIGN KEY (`id_poi`) REFERENCES `point_of_interest` (`id_poi`),
  CONSTRAINT `FK_Trek_has_PoI_id_trek` FOREIGN KEY (`id_trek`) REFERENCES `trek` (`id_trek`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `trek_locate_department`
--

DROP TABLE IF EXISTS `trek_locate_department`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `trek_locate_department` (
  `id_trek` int(11) NOT NULL,
  `id_department` int(11) NOT NULL,
  PRIMARY KEY (`id_trek`,`id_department`),
  KEY `FK_Trek_locate_Department_id_department` (`id_department`),
  CONSTRAINT `FK_Trek_locate_Department_id_department` FOREIGN KEY (`id_department`) REFERENCES `department` (`id_department`),
  CONSTRAINT `FK_Trek_locate_Department_id_trek` FOREIGN KEY (`id_trek`) REFERENCES `trek` (`id_trek`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `type`
--

DROP TABLE IF EXISTS `type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `type` (
  `id_type` int(11) NOT NULL AUTO_INCREMENT,
  `label` varchar(25) NOT NULL,
  PRIMARY KEY (`id_type`),
  UNIQUE KEY `label` (`label`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `id_user` int(11) NOT NULL AUTO_INCREMENT,
  `lastname` varchar(25) NOT NULL,
  `firstname` varchar(25) NOT NULL,
  `username` varchar(25) NOT NULL,
  `password` varchar(25) NOT NULL,
  `mail` varchar(25) NOT NULL,
  `active` tinyint(1) NOT NULL,
  `created_at` date NOT NULL,
  PRIMARY KEY (`id_user`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `user_comment_photo`
--

DROP TABLE IF EXISTS `user_comment_photo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_comment_photo` (
  `content` varchar(400) NOT NULL,
  `date_comment` datetime NOT NULL,
  `id_user` int(11) NOT NULL,
  `id_photo` int(11) NOT NULL,
  PRIMARY KEY (`id_user`,`id_photo`),
  KEY `FK_User_comment_photo_id_photo` (`id_photo`),
  CONSTRAINT `FK_User_comment_photo_id_photo` FOREIGN KEY (`id_photo`) REFERENCES `photo` (`id_photo`),
  CONSTRAINT `FK_User_comment_photo_id_user` FOREIGN KEY (`id_user`) REFERENCES `user` (`id_user`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `user_comment_poi`
--

DROP TABLE IF EXISTS `user_comment_poi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_comment_poi` (
  `content` varchar(400) NOT NULL,
  `date_comment` datetime NOT NULL,
  `id_user` int(11) NOT NULL,
  `id_poi` int(11) NOT NULL,
  PRIMARY KEY (`id_user`,`id_poi`),
  KEY `FK_User_comment_PoI_id_poi` (`id_poi`),
  CONSTRAINT `FK_User_comment_PoI_id_poi` FOREIGN KEY (`id_poi`) REFERENCES `point_of_interest` (`id_poi`),
  CONSTRAINT `FK_User_comment_PoI_id_user` FOREIGN KEY (`id_user`) REFERENCES `user` (`id_user`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `user_comment_trek`
--

DROP TABLE IF EXISTS `user_comment_trek`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_comment_trek` (
  `content` varchar(400) NOT NULL,
  `date_comment` datetime NOT NULL,
  `id_trek` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  PRIMARY KEY (`id_trek`,`id_user`),
  KEY `FK_User_comment_Trek_id_user` (`id_user`),
  CONSTRAINT `FK_User_comment_Trek_id_trek` FOREIGN KEY (`id_trek`) REFERENCES `trek` (`id_trek`),
  CONSTRAINT `FK_User_comment_Trek_id_user` FOREIGN KEY (`id_user`) REFERENCES `user` (`id_user`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `user_do_trek`
--

DROP TABLE IF EXISTS `user_do_trek`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_do_trek` (
  `date_trek` date DEFAULT NULL,
  `id_trek` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  PRIMARY KEY (`id_trek`,`id_user`),
  KEY `FK_User_do_Trek_id_user` (`id_user`),
  CONSTRAINT `FK_User_do_Trek_id_trek` FOREIGN KEY (`id_trek`) REFERENCES `trek` (`id_trek`),
  CONSTRAINT `FK_User_do_Trek_id_user` FOREIGN KEY (`id_user`) REFERENCES `user` (`id_user`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping routines for database 'trek_test'
--
/*!50003 DROP PROCEDURE IF EXISTS `trek_all` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
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
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-01-03 11:00:47
