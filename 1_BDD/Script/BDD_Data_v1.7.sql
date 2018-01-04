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
-- Dumping data for table `cairn`
--

LOCK TABLES `cairn` WRITE;
/*!40000 ALTER TABLE `cairn` DISABLE KEYS */;
INSERT INTO `cairn` VALUES (2),(3);
/*!40000 ALTER TABLE `cairn` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `department`
--

LOCK TABLES `department` WRITE;
/*!40000 ALTER TABLE `department` DISABLE KEYS */;
INSERT INTO `department` VALUES (1,'Ariège',9),(2,'Aude',11),(3,'Gard',30),(4,'Haute-Garonne',31),(5,'Aveyron',12),(6,'Gers',32),(7,'Hérault',34),(8,'Lot',46),(9,'Lozère',48),(10,'Hautes-Pyrénées',65),(11,'Pyrénées-Orientales',66),(12,'Tarn',81),(13,'Tarn-et-Garonne',82),(14,'GwanderNation',33),(15,'Kowan',54);
/*!40000 ALTER TABLE `department` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `fauna_flora`
--

LOCK TABLES `fauna_flora` WRITE;
/*!40000 ALTER TABLE `fauna_flora` DISABLE KEYS */;
INSERT INTO `fauna_flora` VALUES ('Serinus canaria',5);
/*!40000 ALTER TABLE `fauna_flora` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `gps_point`
--

LOCK TABLES `gps_point` WRITE;
/*!40000 ALTER TABLE `gps_point` DISABLE KEYS */;
INSERT INTO `gps_point` VALUES (1,'44.092308','3.547093','1226.0'),(2,'44.082371','3.549324','1191.0'),(3,'44.012753','3.576699','686.0'),(4,'43.961464','3.594938','521.0'),(5,'43.90247','3.516484','625.0'),(6,'43.89824','3.508952','489.0'),(7,'43.893891','3.512087','338.0'),(8,'43.853486','3.520506','573.0'),(9,'43.727001','3.324577','183.0'),(10,'43.665635','3.196957','318.0');
/*!40000 ALTER TABLE `gps_point` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `panorama`
--

LOCK TABLES `panorama` WRITE;
/*!40000 ALTER TABLE `panorama` DISABLE KEYS */;
INSERT INTO `panorama` VALUES ('nord-ouest',1),('sud-est',6);
/*!40000 ALTER TABLE `panorama` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `photo`
--

LOCK TABLES `photo` WRITE;
/*!40000 ALTER TABLE `photo` DISABLE KEYS */;
INSERT INTO `photo` VALUES (1,1,'azerty.com','Cairn','2017-05-12 15:54:02',1,2,4),(2,0,'azerty2.com','Un lapinou tout doux','2017-04-02 12:25:02',2,5,5),(3,1,'azerty.com/qwerty.jpg','Montagne','2016-11-25 17:42:02',4,1,7),(4,1,'azerty.com/jolie_coin.jpg','Jolie petit coin','2017-08-20 13:30:25',6,7,9),(5,0,'azerty.com/zoizo.jpg','Zoizo','2017-10-04 20:42:25',6,4,9);
/*!40000 ALTER TABLE `photo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `point_of_interest`
--

LOCK TABLES `point_of_interest` WRITE;
/*!40000 ALTER TABLE `point_of_interest` DISABLE KEYS */;
INSERT INTO `point_of_interest` VALUES (1,'Belle Vues',NULL,0,1,2),(2,'Zolie tatdePierre','2PIR',1,10,1),(3,'Cairn',NULL,1,4,1),(4,'Pause pipi','Attention orties',0,7,4),(5,'Zolie n animals','Zozio',1,9,3),(6,'Pic-nique','Jolie ruissaux',1,8,2),(7,'Pic-nique','Jolie ruissaux',1,8,4);
/*!40000 ALTER TABLE `point_of_interest` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `trek`
--

LOCK TABLES `trek` WRITE;
/*!40000 ALTER TABLE `trek` DISABLE KEYS */;
INSERT INTO `trek` VALUES (1,'général 1',10.56,'03:35:10',2,0,'{\"chemin\": [{\"lat\": \"43.824062505915236\", \"lng\": \"3.6529541015625004\"},{\"lat\": \"43.57983126519669\", \"lng\": \"3.6447143554687504\"}]}',NULL,1,NULL),(2,'général 2',25.1,'05:10:55',NULL,0,'{\"chemin\": [{\"lat\": \"01.01\", \"lng\": \"02.02\"},{\"lat\": \"03.03\",\"lng\": \"04.04\"}]}',NULL,1,NULL),(3,'général 3',54.1,'10:01:54',2,0,'{\"chemin\": [{\"lat\": \"43.829016238174994\", \"lng\": \"4.003143310546876\"},{\"lat\": \"43.72291663731014\", \"lng\": \"4.130859375000001\"}]}',NULL,1,NULL),(4,'Je saute ...',0.03,'00:00:15',10,1,'{\"chemin\": [{\"lat\": \"01.01\", \"lng\": \"02.02\"},{\"lat\": \"03.03\",\"lng\": \"04.04\"}]}',NULL,0,1),(5,'Tour des cairns avec Amine',42.53,'15:56:41',NULL,1,'{\"chemin\": [{\"lat\": \"01.01\", \"lng\": \"02.02\"},{\"lat\": \"03.03\",\"lng\": \"04.04\"}]}',NULL,0,1),(6,'Au clair de lune',5.23,'02:45:11',3,0,'{\"chemin\": [{\"lat\": \"01.01\", \"lng\": \"02.02\"},{\"lat\": \"03.03\",\"lng\": \"04.04\"}]}',NULL,0,2),(7,'un test de trek général',15.69,'03:02:02',3,0,'{\"chemin\": [{\"lat\": \"01.01\", \"lng\": \"02.02\"},{\"lat\": \"03.03\",\"lng\": \"04.04\"}]}',NULL,0,2),(8,'ma première rando',10.56,'03:35:10',2,1,'{\"chemin\": [{\"lat\": \"01.01\", \"lng\": \"02.02\"},{\"lat\": \"03.03\",\"lng\": \"04.04\"}]}',NULL,0,2),(9,'Au bord de la falaise',25.1,'05:10:55',NULL,1,'{\"chemin\": [{\"lat\": \"01.01\", \"lng\": \"02.02\"},{\"lat\": \"03.03\",\"lng\": \"04.04\"}]}',NULL,0,3),(10,'Au bord de la rivière',54.1,'10:01:54',2,0,'{\"chemin\": [{\"lat\": \"01.01\", \"lng\": \"02.02\"},{\"lat\": \"03.03\",\"lng\": \"04.04\"}]}',NULL,0,3),(13,'try it again',25.07,NULL,NULL,NULL,'{\"chemin\": [{\"lat\": \"01.01\", \"lng\": \"02.02\"},{\"lat\": \"03.03\",\"lng\": \"04.04\"}]}',NULL,0,NULL),(14,'sdfsafd',59.92,'10:10:10',2,0,'{\"chemin\":[{\"lat\":\"43.57883642495716\",\"lng\":\"3.702478408813477\"},{\"lat\":\"43.720931674984534\",\"lng\":\"3.804101943969727\"},{\"lat\":\"43.70306405462156\",\"lng\":\"3.989496231079102\"},{\"lat\":\"43.59574647349491\",\"lng\":\"4.0128421783447275\"},{\"lat\":\"43.54102031586806\",\"lng\":\"3.9016056060791016\"},{\"lat\":\"43.5708771112904\",\"lng\":\"3.870019912719727\"}]}',NULL,0,NULL),(15,'Ultimate Marathon',58.83,NULL,99,NULL,'{\"chemin\":[{\"lat\":43.56689705995962,\"lng\":3.839807510375977},{\"lat\":43.69214233094498,\"lng\":3.823328018188477},{\"lat\":43.74871516277156,\"lng\":3.918085098266602},{\"lat\":43.72192416436807,\"lng\":4.0897464752197275},{\"lat\":43.651416562664785,\"lng\":4.0224552154541025},{\"lat\":43.6037024995974,\"lng\":3.971643447875977},{\"lat\":43.56888711849962,\"lng\":3.940057754516602}]}',NULL,0,NULL),(16,'ouam',67.11,NULL,NULL,NULL,'{\"chemin\":[{\"lat\":43.8082078001123,\"lng\":3.794488906860352},{\"lat\":43.69313529711951,\"lng\":3.959283828735352},{\"lat\":43.824062505915236,\"lng\":3.953790664672852},{\"lat\":43.695121180146415,\"lng\":3.751916885375977},{\"lat\":43.80424346591425,\"lng\":3.788995742797852}]}',NULL,0,NULL),(17,'Grand Tour',114.91,NULL,99,NULL,'{\"chemin\":[{\"lat\":43.57655133904518,\"lng\":3.7802195549011235},{\"lat\":43.63124521825444,\"lng\":3.7541270256042485},{\"lat\":43.6680113034769,\"lng\":3.7939524650573735},{\"lat\":43.67794421991334,\"lng\":3.8694834709167485},{\"lat\":43.6680113034769,\"lng\":3.9477610588073735},{\"lat\":43.620310420515246,\"lng\":3.9903330802917485},{\"lat\":43.593462029427215,\"lng\":3.9738535881042485},{\"lat\":43.56859172334056,\"lng\":3.9216685295104985},{\"lat\":43.59644577577047,\"lng\":4.054877758026124},{\"lat\":43.64515935672089,\"lng\":4.096076488494874},{\"lat\":43.723614460003134,\"lng\":4.057624340057374},{\"lat\":43.75734836412478,\"lng\":3.9216685295104985},{\"lat\":43.747428600656335,\"lng\":3.8365244865417485},{\"lat\":43.73949160604922,\"lng\":3.7156748771667485},{\"lat\":43.69085455345099,\"lng\":3.6456370353698735},{\"lat\":43.62130457523125,\"lng\":3.6772227287292485},{\"lat\":43.57854107859674,\"lng\":3.7019419670104985}]}',NULL,0,NULL),(18,'Nimes Montpel',47.89,NULL,45,NULL,'{\"chemin\":[{\"lat\":43.84358092518573,\"lng\":4.358375072479249},{\"lat\":43.812868653397466,\"lng\":4.317176342010499},{\"lat\":43.76627474542637,\"lng\":4.252631664276124},{\"lat\":43.74346023488879,\"lng\":4.186713695526124},{\"lat\":43.719644515827724,\"lng\":4.134528636932374},{\"lat\":43.68886852913706,\"lng\":4.054877758026124},{\"lat\":43.67297796719731,\"lng\":3.9985728263854985},{\"lat\":43.651121572559525,\"lng\":3.9450144767761235},{\"lat\":43.63124521825444,\"lng\":3.8955760002136235},{\"lat\":43.6044017094082,\"lng\":3.8763499259948735}]}',NULL,0,NULL),(19,'fgfgsjg',43.16,NULL,30,NULL,'{\"chemin\":[{\"lat\":43.81187767184972,\"lng\":3.763740062713623},{\"lat\":43.75933211951108,\"lng\":3.6964488029479985},{\"lat\":43.719644515827724,\"lng\":3.7857127189636235},{\"lat\":43.77718295833278,\"lng\":3.8996958732604985},{\"lat\":43.83169417847459,\"lng\":3.9683604240417485},{\"lat\":43.78114908792438,\"lng\":4.028785228729249}]}',NULL,0,NULL),(20,'sdfsdf',23.05,NULL,5,NULL,'{\"chemin\":[{\"lat\":43.471997680417566,\"lng\":3.6456370353698735},{\"lat\":43.49391916706005,\"lng\":3.7143015861511235},{\"lat\":43.54669735589176,\"lng\":3.8021922111511235},{\"lat\":43.58351513981761,\"lng\":3.8845896720886235}]}',NULL,0,NULL),(21,'yoyoyo',188.4,NULL,3,NULL,'{\"chemin\":[{\"lat\":43.56262132119515,\"lng\":3.6827158927917485},{\"lat\":43.75338065604419,\"lng\":3.7788462638854985},{\"lat\":43.73552271413926,\"lng\":3.9917063713073735},{\"lat\":43.61036796922853,\"lng\":3.9477610588073735},{\"lat\":43.67595776814767,\"lng\":3.8447642326354985},{\"lat\":43.72262199862146,\"lng\":3.6703562736511235},{\"lat\":43.844571380523476,\"lng\":3.8420176506042485},{\"lat\":43.849523410545046,\"lng\":3.9958262443542485},{\"lat\":43.78511495442906,\"lng\":4.112555980682374},{\"lat\":43.67794421991334,\"lng\":4.050757884979249},{\"lat\":43.59147278300837,\"lng\":3.9669871330261235},{\"lat\":43.57157670251024,\"lng\":3.8722300529479985},{\"lat\":43.58948347083776,\"lng\":3.7431406974792485},{\"lat\":43.64913423303804,\"lng\":3.6731028556823735},{\"lat\":43.74346023488879,\"lng\":3.5797190666198735}]}',NULL,0,NULL),(22,'Avoid Nimes',58.56,NULL,5,NULL,'{\"chemin\":[{\"lat\":43.81316284787894,\"lng\":4.3369388580322275},{\"lat\":43.78243492502658,\"lng\":4.3959903717041025},{\"lat\":43.80919884255291,\"lng\":4.4385623931884775},{\"lat\":43.89238770157165,\"lng\":4.4509220123291025},{\"lat\":43.926026393624255,\"lng\":4.3602848052978525},{\"lat\":43.91415608493973,\"lng\":4.2861270904541025},{\"lat\":43.8399130020632,\"lng\":4.2641544342041025},{\"lat\":43.800278868620275,\"lng\":4.2929935455322275},{\"lat\":43.75962657759534,\"lng\":4.3259525299072275},{\"lat\":43.81316284787894,\"lng\":4.3314456939697275}]}',NULL,0,NULL),(23,'Kyoto Trip',9.75,NULL,3,NULL,'{\"chemin\":[{\"lat\":34.96798361497661,\"lng\":-224.24177169799808},{\"lat\":34.93871866336308,\"lng\":-224.22803878784183},{\"lat\":34.91394785253979,\"lng\":-224.21979904174808},{\"lat\":34.88466361836388,\"lng\":-224.20881271362308}]}',NULL,0,NULL),(24,'Japan for Beasts',1877.94,NULL,9001,NULL,'{\"chemin\":[{\"lat\":31.658641741850396,\"lng\":-229.5847320556641},{\"lat\":32.73703926550904,\"lng\":-228.8816070556641},{\"lat\":33.729479368838945,\"lng\":-228.0905914306641},{\"lat\":34.45731417753458,\"lng\":-226.9480133056641},{\"lat\":34.8188768568138,\"lng\":-225.4538726806641},{\"lat\":34.99906617556976,\"lng\":-223.69606018066406},{\"lat\":35.2147706835869,\"lng\":-222.42164611816406},{\"lat\":35.60874315730877,\"lng\":-220.6198883056641},{\"lat\":36.673375615028284,\"lng\":-219.96070861816406},{\"lat\":38.4154004575845,\"lng\":-219.4333648681641},{\"lat\":39.61044924864762,\"lng\":-218.9499664306641},{\"lat\":41.0177286587949,\"lng\":-219.2136383056641},{\"lat\":42.39557261051852,\"lng\":-219.3454742431641},{\"lat\":43.07340216393554,\"lng\":-218.5105133056641}]}',NULL,0,NULL);
/*!40000 ALTER TABLE `trek` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `trek_has_gps_point`
--

LOCK TABLES `trek_has_gps_point` WRITE;
/*!40000 ALTER TABLE `trek_has_gps_point` DISABLE KEYS */;
INSERT INTO `trek_has_gps_point` VALUES (1,1),(1,2),(1,3),(2,5),(2,6),(2,7),(3,2),(3,4),(3,8),(4,4),(4,10),(5,1),(5,9),(6,4),(6,7),(6,10),(7,1),(7,2),(7,3),(8,4),(8,5),(8,6),(9,7),(9,8),(10,9),(10,10);
/*!40000 ALTER TABLE `trek_has_gps_point` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `trek_has_poi`
--

LOCK TABLES `trek_has_poi` WRITE;
/*!40000 ALTER TABLE `trek_has_poi` DISABLE KEYS */;
INSERT INTO `trek_has_poi` VALUES (1,5),(1,7),(4,2),(4,3),(4,6),(5,1),(6,2),(6,3),(6,4),(7,1),(8,3),(9,4),(9,6),(9,7),(10,2),(10,5);
/*!40000 ALTER TABLE `trek_has_poi` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `trek_locate_department`
--

LOCK TABLES `trek_locate_department` WRITE;
/*!40000 ALTER TABLE `trek_locate_department` DISABLE KEYS */;
INSERT INTO `trek_locate_department` VALUES (1,1),(2,3),(2,5),(3,1),(5,1),(5,2),(6,3);
/*!40000 ALTER TABLE `trek_locate_department` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `type`
--

LOCK TABLES `type` WRITE;
/*!40000 ALTER TABLE `type` DISABLE KEYS */;
INSERT INTO `type` VALUES (4,'Autre'),(1,'Cairn'),(3,'Faune/Flore'),(2,'Panorama');
/*!40000 ALTER TABLE `type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'Estabsent','Luc','flyerMan','1234','luc@bbb.com',1,'2017-05-30'),(2,'Bali','Ballo','berceau','4567','bali@bbb.com',0,'2016-02-24'),(3,'Crément','Alex','odorant','8910','alex@bbb.com',1,'2017-01-01'),(4,'Danslesnuages','Max','dodoMan','7410','max@bbb.com',1,'2017-01-01'),(5,'Attend','John','prof','8520','john@bbb.com',1,'2017-01-01'),(6,'Bon','Jean','cochonou','9630','jean@bbb.com',1,'2017-01-01');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `user_comment_photo`
--

LOCK TABLES `user_comment_photo` WRITE;
/*!40000 ALTER TABLE `user_comment_photo` DISABLE KEYS */;
INSERT INTO `user_comment_photo` VALUES ('azertyuiop','2017-05-02 09:02:20',1,5),('lorem ipsum','2017-12-11 16:45:02',2,5),('Abracadabra','2017-11-02 15:02:20',3,2);
/*!40000 ALTER TABLE `user_comment_photo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `user_comment_poi`
--

LOCK TABLES `user_comment_poi` WRITE;
/*!40000 ALTER TABLE `user_comment_poi` DISABLE KEYS */;
INSERT INTO `user_comment_poi` VALUES ('Poupoupidou pou','2016-04-01 17:02:20',2,1),('Wouahhhh !','2017-09-02 09:02:20',3,2),('encore un test et j\'arrête','2017-11-02 17:02:20',4,3),('wxcvbn,qsdfghjklml','2017-11-02 17:02:20',6,1),('Hello world','2017-01-22 12:42:20',6,4);
/*!40000 ALTER TABLE `user_comment_poi` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `user_comment_trek`
--

LOCK TABLES `user_comment_trek` WRITE;
/*!40000 ALTER TABLE `user_comment_trek` DISABLE KEYS */;
INSERT INTO `user_comment_trek` VALUES ('qsdfghjklm','2017-08-21 19:26:20',1,1),('Ocus Pocus maleficus totalus','2017-01-12 05:42:20',2,4),('Abracadabra en grenouille tu te transformera','2017-11-02 15:02:20',3,5);
/*!40000 ALTER TABLE `user_comment_trek` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `user_do_trek`
--

LOCK TABLES `user_do_trek` WRITE;
/*!40000 ALTER TABLE `user_do_trek` DISABLE KEYS */;
INSERT INTO `user_do_trek` VALUES ('2017-11-02',4,1),('2017-04-02',5,2),('2017-08-20',6,3),('2017-01-12',7,4),('2017-12-11',8,5),('2017-12-11',9,6),('2017-04-07',10,1),('2016-03-29',10,2),(NULL,13,3),('2016-03-28',14,3),(NULL,15,3),('2017-12-21',16,3),(NULL,17,3),(NULL,18,3),(NULL,19,3),(NULL,20,3),(NULL,21,3),(NULL,22,3),(NULL,23,3),(NULL,24,3);
/*!40000 ALTER TABLE `user_do_trek` ENABLE KEYS */;
UNLOCK TABLES;

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

-- Dump completed on 2018-01-04 15:51:11
