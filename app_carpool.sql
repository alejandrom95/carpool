-- MySQL dump 10.13  Distrib 5.6.31, for linux-glibc2.5 (x86_64)
--
-- Host: localhost    Database: app_carpool
-- ------------------------------------------------------
-- Server version	5.6.31

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES UTF8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `messages`
--

DROP TABLE IF EXISTS `messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `messages` (
  `message_id` int(11) NOT NULL AUTO_INCREMENT,
  `route_id` int(11) NOT NULL,
  `thread_name` varchar(25) NOT NULL,
  `username` varchar(25) NOT NULL,
  `message_text` varchar(1000) NOT NULL,
  PRIMARY KEY (`message_id`)
) ENGINE=InnoDB AUTO_INCREMENT=165 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `messages`
--

LOCK TABLES `messages` WRITE;
/*!40000 ALTER TABLE `messages` DISABLE KEYS */;
INSERT INTO `messages` VALUES (1,1,'user1@gmail.com','user1@gmail.com','Hi.  I would like to join your ride.  Let me know'),(2,1,'user1@gmail.com','fernie255@yahoo.com','How flexible are you in he departure time?'),(3,1,'user1@gmail.com','user1@gmail.com','I can leave whenever you want to.'),(4,1,'user1@gmail.com','fernie255@yahoo.com','Ok.  I\'ll let you know.'),(5,2,'user1@gmail.com','user1@gmail.com','Hi.  I would like to join your 2nd ride.  Let me know'),(6,2,'user1@gmail.com','fernie255@yahoo.com','How flexible are you in he 2nd departure time?'),(7,2,'user1@gmail.com','user1@gmail.com','I can leave whenever you want to go on 2nd ride.'),(8,2,'user1@gmail.com','fernie255@yahoo.com','Ok.  I\'ll let you know about the 2nd ride.'),(9,2,'user1@gmail.com','fernie255@yahoo.com','I\'m going to leave 1 hour later on the 2nd ride.'),(10,3,'user1@gmail.com','fernie255@yahoo.com','How flexible are you in he 3nd departure time?'),(11,3,'user1@gmail.com','user1@gmail.com','I can leave whenever you want to go on 3nd ride.'),(12,1,'user2@gmail.com','user2@gmail.com','Are you still doing this ride?'),(13,1,'user2@gmail.com','fernie255@yahon.com','Yes.'),(14,4,'user2@gmail.com','user2@gmail.com','Yes.'),(15,4,'fernie255@yahoo.com','fernie255@yahoo.com','Yes no.'),(16,5,'user2@gmail.com','user1@gmail.com','Hello i can drive'),(17,5,'user2@gmail.com','user1@gmail.com','You are now the driver for route_id=5'),(18,5,'user2@gmail.com','user2@gmail.com','You have been added to route_id=5'),(19,5,'user2@gmail.com','user2@gmail.com','Thank you for driving.'),(20,3,'user1@gmail.com','fernie255@yahoo.com','You are now the driver for route_id=3'),(21,3,'user1@gmail.com','user1@gmail.com','You have been added to route_id=3'),(22,7,'user2@gmail.com','user1@gmail.com','i can drive\n'),(23,7,'user2@gmail.com','user1@gmail.com','You are now the driver for route_id=7'),(24,7,'user2@gmail.com','user2@gmail.com','You have been added to route_id=7'),(25,8,'user1@gmail.com','user1@gmail.com','Drive me PLS'),(26,9,'user2@gmail.com','user1@gmail.com','asdfdsafs'),(27,9,'user2@gmail.com','user1@gmail.com','You are now the driver for route_id=9'),(28,9,'user2@gmail.com','user2@gmail.com','You have been added to route_id=9'),(29,10,'user2@gmail.com','user1@gmail.com','8798798jhgjhghj'),(30,10,'user2@gmail.com','user1@gmail.com','You are now the driver for route_id=10'),(31,10,'user2@gmail.com','user2@gmail.com','You have been added to route_id=10'),(32,10,'user3@gmail.com','user3@gmail.com','Hey hey'),(33,11,'user3@gmail.com','user1@gmail.com','sdfasdfsdfaa'),(34,11,'user3@gmail.com','user1@gmail.com','You are now the driver for route_id=11'),(35,11,'user3@gmail.com','user3@gmail.com','You have been added to route_id=11'),(36,12,'user2@gmail.com','user1@gmail.com','afdefasefsaf'),(37,12,'user2@gmail.com','user1@gmail.com','You are now the driver for route_id=12'),(38,12,'user2@gmail.com','user2@gmail.com','You have been added to route_id=12'),(39,12,'user3@gmail.com','user3@gmail.com','test test'),(40,10,'user3@gmail.com','user1@gmail.com','You have been added to route_id=10'),(41,4,'fernie255@yahoo.com','user1@gmail.com','You have been added to route_id=4'),(42,13,'user2@gmail.com','user1@gmail.com','hi'),(43,13,'user2@gmail.com','user1@gmail.com','You are now the driver for route_id=13'),(44,13,'user2@gmail.com','user2@gmail.com','You have been added to route_id=13'),(45,13,'user2@gmail.com','user1@gmail.com','You have been removed from route_id=13'),(46,13,'user2@gmail.com','user1@gmail.com','You have been added to route_id=13'),(47,14,'user2@gmail.com','user1@gmail.com','asdf'),(48,14,'user2@gmail.com','user1@gmail.com','You are now the driver for route_id=14'),(49,14,'user2@gmail.com','user2@gmail.com','You have been added to route_id=14'),(50,14,'user2@gmail.com','user1@gmail.com','You have been removed from route_id=14'),(51,14,'user2@gmail.com','user1@gmail.com','You have been added to route_id=14'),(52,14,'user2@gmail.com','user1@gmail.com','You have been removed from route_id=14'),(53,14,'user2@gmail.com','user1@gmail.com','You have been removed from route_id=14'),(54,14,'user2@gmail.com','user1@gmail.com','You have been added to route_id=14'),(55,14,'user2@gmail.com','user1@gmail.com','You have been removed from route_id=14'),(56,14,'user2@gmail.com','user1@gmail.com','You have been removed from route_id=14'),(57,14,'user2@gmail.com','user1@gmail.com','You have been added to route_id=14'),(58,14,'user2@gmail.com','user2@gmail.com','I have dropped from route_id=14'),(59,14,'user2@gmail.com','user1@gmail.com','You have been added to route_id=14'),(60,14,'user2@gmail.com','user2@gmail.com','I have dropped from route_id=14'),(61,5,'user2@gmail.com','user1@gmail.com','You have been removed from route_id=5'),(62,5,'user2@gmail.com','user1@gmail.com','You have been added to route_id=5'),(63,5,'user2@gmail.com','user1@gmail.com','This ride has completed.  Thank you for riding. Please rate the driver: <a href=abc.php>1 2 3 4 5</a>'),(64,5,'user2@gmail.com','user1@gmail.com','alex'),(65,5,'user2@gmail.com','user1@gmail.com','alex'),(66,5,'user2@gmail.com','user1@gmail.com','This ride has completed.  Thank you for riding. Please rate the driver: <a href=abc.php>1 2 3 4 5</a>'),(67,5,'user2@gmail.com','user1@gmail.com','Thank you for your feedback.'),(68,7,'user2@gmail.com','user1@gmail.com','Thank you for your feedback.'),(69,9,'user2@gmail.com','user1@gmail.com','This ride has completed.  Thank you for riding. Please rate the driver: \n			<a href= dummy.php?target=rating&id=user1@gmail.com&message_id=0&route_id=9&rating=1>1 </a>\n			<a href= dummy.php?target=rating&id=user1@gmail.com&message_id=0&route_id=9&rating=2> 2 </a>\n			<a href= dummy.php?target=rating&id=user1@gmail.com&message_id=0&route_id=9&rating=3> 3 </a>\n			<a href= dummy.php?target=rating&id=user1@gmail.com&message_id=0&route_id=9&rating=4> 4 </a>\n			<a href= dummy.php?target=rating&id=user1@gmail.com&message_id=0&route_id=9&rating=5> 5</a>'),(88,10,'user2@gmail.com','user1@gmail.com','Thank you for your feedback.'),(91,10,'user2@gmail.com','user1@gmail.com','Thank you for your feedback.'),(97,10,'user2@gmail.com','user1@gmail.com','Thank you for your feedback.'),(100,10,'user2@gmail.com','user1@gmail.com','Thank you for your feedback.'),(103,10,'user2@gmail.com','user1@gmail.com','Thank you for your feedback.'),(104,10,'user3@gmail.com','user1@gmail.com','Thank you for your feedback.'),(106,11,'user3@gmail.com','user1@gmail.com','Thank you for your feedback.'),(107,11,'user3@gmail.com','user1@gmail.com','Thank you for your feedback.'),(108,14,'user2@gmail.com','user1@gmail.com','You have been added to route_id=14'),(109,14,'user2@gmail.com','user1@gmail.com','Thank you for your feedback.'),(110,14,'user2@gmail.com','user1@gmail.com','Thank you for your feedback.'),(111,14,'user2@gmail.com','user1@gmail.com','temp'),(112,12,'user3@gmail.com','user1@gmail.com','You have been added to route_id=12'),(113,12,'user2@gmail.com','user1@gmail.com','This ride has completed.  Thank you for riding. Please rate the driver: \n			<a href= \"cManageRating.php?target=rating&action=rate&thread=user2@gmail.com&message_id=113&route_id=12&rating=1&id=myloggedinid\">1 </a>\n			<a href= \"cManageRating.php?target=rating&action=rate&thread=user2@gmail.com&message_id=113&route_id=12&rating=2&id=myloggedinid\"> 2 </a>\n			<a href= \"cManageRating.php?target=rating&action=rate&thread=user2@gmail.com&message_id=113&route_id=12&rating=3&id=myloggedinid\"> 3 </a>\n			<a href= \"cManageRating.php?target=rating&action=rate&thread=user2@gmail.com&message_id=113&route_id=12&rating=4&id=myloggedinid\"> 4 </a>\n			<a href= \"cManageRating.php?target=rating&action=rate&thread=user2@gmail.com&message_id=113&route_id=12&rating=5&id=myloggedinid\"> 5</a>'),(114,12,'user3@gmail.com','user1@gmail.com','This ride has completed.  Thank you for riding. Please rate the driver: \n			<a href= \"cManageRating.php?target=rating&action=rate&thread=user3@gmail.com&message_id=114&route_id=12&rating=1&id=myloggedinid\">1 </a>\n			<a href= \"cManageRating.php?target=rating&action=rate&thread=user3@gmail.com&message_id=114&route_id=12&rating=2&id=myloggedinid\"> 2 </a>\n			<a href= \"cManageRating.php?target=rating&action=rate&thread=user3@gmail.com&message_id=114&route_id=12&rating=3&id=myloggedinid\"> 3 </a>\n			<a href= \"cManageRating.php?target=rating&action=rate&thread=user3@gmail.com&message_id=114&route_id=12&rating=4&id=myloggedinid\"> 4 </a>\n			<a href= \"cManageRating.php?target=rating&action=rate&thread=user3@gmail.com&message_id=114&route_id=12&rating=5&id=myloggedinid\"> 5</a>'),(116,12,'user2@gmail.com','user1@gmail.com','Thank you for your feedback.'),(117,12,'user3@gmail.com','user1@gmail.com','Thank you for your feedback.'),(119,18,'user1@gmail.com','user2@gmail.com','Test test 1243'),(120,18,'user3@gmail.com','user3@gmail.com','user 3 test'),(121,18,'user1@gmail.com','user2@gmail.com','You are now the driver for route_id=18'),(122,18,'user1@gmail.com','user1@gmail.com','You have been added to route_id=18'),(123,18,'user3@gmail.com','user2@gmail.com','You have been added to route_id=18'),(124,18,'user1@gmail.com','user2@gmail.com','You have been removed from route_id=18'),(125,18,'user3@gmail.com','user2@gmail.com','You have been removed from route_id=18'),(126,18,'user3@gmail.com','user2@gmail.com','You have been removed from route_id=18'),(127,18,'user1@gmail.com','user2@gmail.com','You have been added to route_id=18'),(128,18,'user3@gmail.com','user2@gmail.com','You have been added to route_id=18'),(129,18,'user1@gmail.com','user2@gmail.com','Thank you for your feedback.'),(130,18,'user3@gmail.com','user2@gmail.com','Thank you for your feedback.'),(132,19,'user2@gmail.com','user2@gmail.com','hi'),(133,20,'user1@gmail.com','user1@gmail.com','we'),(134,21,'user1@gmail.com','user1@gmail.com','adsfdsafsfdaf'),(135,20,'user1@gmail.com','user1@gmail.com','hello test'),(136,22,'user3@gmail.com','user3@gmail.com','test'),(137,22,'user1@gmail.com','user1@gmail.com','asdfeafsa'),(138,22,'user1@gmail.com','user2@gmail.com','You have been added to route_id=22'),(139,22,'user3@gmail.com','user2@gmail.com','You have been added to route_id=22'),(140,22,'user3@gmail.com','user3@gmail.com','I have dropped from route_id=22'),(141,22,'user3@gmail.com','user2@gmail.com','Thank you for your feedback.'),(142,22,'user1@gmail.com','user2@gmail.com','This ride has completed.  Thank you for riding. Please rate the driver: \n			<a href= \"cManageRating.php?target=rating&action=rate&thread_name=user1@gmail.com&message_id=142&route_id=22&rating=1&id=myloggedinid\">1 </a>\n			<a href= \"cManageRating.php?target=rating&action=rate&thread_name=user1@gmail.com&message_id=142&route_id=22&rating=2&id=myloggedinid\"> 2 </a>\n			<a href= \"cManageRating.php?target=rating&action=rate&thread_name=user1@gmail.com&message_id=142&route_id=22&rating=3&id=myloggedinid\"> 3 </a>\n			<a href= \"cManageRating.php?target=rating&action=rate&thread_name=user1@gmail.com&message_id=142&route_id=22&rating=4&id=myloggedinid\"> 4 </a>\n			<a href= \"cManageRating.php?target=rating&action=rate&thread_name=user1@gmail.com&message_id=142&route_id=22&rating=5&id=myloggedinid\"> 5</a>'),(144,22,'user3@gmail.com','user2@gmail.com','You have been added to route_id=22'),(145,26,'Fern@gmail.com','Fern@gmail.com','Hello I would like a ride please.'),(146,26,'Alex@gmail.com','Alex@gmail.com','I would like the ride please.'),(147,26,'Alex@gmail.com','mike@gmail.com','Alright you are in!'),(148,26,'Alex@gmail.com','mike@gmail.com','You have been added to route_id=26'),(149,26,'Fern@gmail.com','mike@gmail.com','you are in !'),(150,26,'Fern@gmail.com','mike@gmail.com','You have been added to route_id=26'),(151,26,'Fern@gmail.com','Fern@gmail.com','Thanks for accepting me!'),(152,26,'Alex@gmail.com','Alex@gmail.com','I have dropped from route_id=26'),(154,26,'Fern@gmail.com','mike@gmail.com','Thank you for your feedback.'),(155,24,'mike@gmail.com','Fern@gmail.com','kjh'),(156,24,'mike@gmail.com','Fern@gmail.com','You are now the driver for route_id=24'),(157,24,'mike@gmail.com','mike@gmail.com','You have been added to route_id=24'),(158,24,'mike@gmail.com','Fern@gmail.com','This ride has completed.  Thank you for riding. Please rate the driver: \n			<a href= \"cManageRating.php?target=rating&action=rate&thread_name=mike@gmail.com&message_id=158&route_id=24&rating=1&id=myloggedinid\">1 </a>\n			<a href= \"cManageRating.php?target=rating&action=rate&thread_name=mike@gmail.com&message_id=158&route_id=24&rating=2&id=myloggedinid\"> 2 </a>\n			<a href= \"cManageRating.php?target=rating&action=rate&thread_name=mike@gmail.com&message_id=158&route_id=24&rating=3&id=myloggedinid\"> 3 </a>\n			<a href= \"cManageRating.php?target=rating&action=rate&thread_name=mike@gmail.com&message_id=158&route_id=24&rating=4&id=myloggedinid\"> 4 </a>\n			<a href= \"cManageRating.php?target=rating&action=rate&thread_name=mike@gmail.com&message_id=158&route_id=24&rating=5&id=myloggedinid\"> 5</a>'),(159,23,'user3@gmail.com','user3@gmail.com','asdf'),(160,23,'user3@gmail.com','user3@gmail.com','You have been added to route_id=23'),(161,27,'user2@gmail.com','user3@gmail.com','rating test'),(162,27,'user2@gmail.com','user3@gmail.com','You are now the driver for route_id=27'),(163,27,'user2@gmail.com','user2@gmail.com','You have been added to route_id=27'),(164,27,'user2@gmail.com','user3@gmail.com','Thank you for your feedback.');
/*!40000 ALTER TABLE `messages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `passenger_list`
--

DROP TABLE IF EXISTS `passenger_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `passenger_list` (
  `route_id` int(11) NOT NULL,
  `username` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `passenger_list`
--

LOCK TABLES `passenger_list` WRITE;
/*!40000 ALTER TABLE `passenger_list` DISABLE KEYS */;
INSERT INTO `passenger_list` VALUES (3,'user1@gmail.com'),(7,'user2@gmail.com'),(9,'user2@gmail.com'),(10,'user2@gmail.com'),(11,'user3@gmail.com'),(12,'user2@gmail.com'),(10,'user3@gmail.com'),(4,'fernie255@yahoo.com'),(13,'user2@gmail.com'),(5,'user2@gmail.com'),(14,'user2@gmail.com'),(12,'user3@gmail.com'),(18,'user1@gmail.com'),(18,'user3@gmail.com'),(22,'user1@gmail.com'),(22,'user3@gmail.com'),(26,'Fern@gmail.com'),(24,'mike@gmail.com'),(23,''),(27,'user2@gmail.com');
/*!40000 ALTER TABLE `passenger_list` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ratings`
--

DROP TABLE IF EXISTS `ratings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ratings` (
  `route_id` int(11) NOT NULL,
  `username_passenger` varchar(100) NOT NULL,
  `rating` int(11) NOT NULL,
  PRIMARY KEY (`route_id`,`username_passenger`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ratings`
--

LOCK TABLES `ratings` WRITE;
/*!40000 ALTER TABLE `ratings` DISABLE KEYS */;
INSERT INTO `ratings` VALUES (10,'user2@gmail.com',5),(10,'user3@gmail.com',3),(11,'user3@gmail.com',2),(12,'user2@gmail.com',5),(12,'user3@gmail.com',1),(14,'',1),(14,'user2@gmail.com',5),(18,'user1@gmail.com',4),(18,'user3@gmail.com',1),(22,'user3@gmail.com',5),(26,'Fern@gmail.com',4),(27,'user2@gmail.com',5);
/*!40000 ALTER TABLE `ratings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `routes`
--

DROP TABLE IF EXISTS `routes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `routes` (
  `route_id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(25) NOT NULL,
  `start_address` varchar(200) NOT NULL,
  `start_lat` double NOT NULL,
  `start_lng` double NOT NULL,
  `start_google_place_id` varchar(200) NOT NULL,
  `end_address` varchar(200) NOT NULL,
  `end_lat` double NOT NULL,
  `end_lng` double NOT NULL,
  `end_google_place_id` varchar(200) NOT NULL,
  `time_window_start` datetime NOT NULL,
  `time_window_end` datetime NOT NULL,
  `create_date` datetime NOT NULL,
  `status` varchar(25) NOT NULL,
  `type` varchar(10) NOT NULL,
  PRIMARY KEY (`route_id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `routes`
--

LOCK TABLES `routes` WRITE;
/*!40000 ALTER TABLE `routes` DISABLE KEYS */;
INSERT INTO `routes` VALUES (1,'fernie255@yahoo.com','California State University Long Beach, Long Beach, CA, United States',33.783782,-118.114082,'ChIJQ_aCKdgx3YARqy3HziZ_3B8','STAPLES Center, South Figueroa Street, Los Angeles, CA',34.04295,-118.267123,'ChIJWXNsX7jHwoARaduMfEQ0HuU','2016-10-07 10:00:00','2016-10-07 12:00:00','2016-12-08 02:59:17','VISIBLE','REQUEST'),(2,'fernie255@yahoo.com','California State University Long Beach, Long Beach, CA, United States',33.783782,-118.114082,'ChIJQ_aCKdgx3YARqy3HziZ_3B8','STAPLES Center, South Figueroa Street, Los Angeles, CA',34.04295,-118.267123,'ChIJWXNsX7jHwoARaduMfEQ0HuU','2016-10-07 10:00:00','2016-10-07 12:00:00','2016-12-08 02:59:17','VISIBLE','REQUEST'),(3,'fernie255@yahoo.com','California State University Long Beach, Long Beach, CA, United States',33.783782,-118.114082,'ChIJQ_aCKdgx3YARqy3HziZ_3B8','STAPLES Center, South Figueroa Street, Los Angeles, CA',34.04295,-118.267123,'ChIJWXNsX7jHwoARaduMfEQ0HuU','2016-10-07 10:00:00','2016-10-07 12:00:00','2016-12-08 02:59:17','VISIBLE','OFFER'),(4,'user1@gmail.com','California State University Long Beach, Long Beach, CA, United States',33.7838235,-118.11409040000001,'ChIJQ_aCKdgx3YARqy3HziZ_3B8','STAPLES Center, South Figueroa Street, Los Angeles, CA, United States',34.043021,-118.26683559999998,'ChIJWXNsX7jHwoARaduMfEQ0HuU','2016-10-07 10:00:00','2016-10-07 18:17:00','2016-12-08 02:59:17','CLOSED','OFFER'),(5,'user1@gmail.com','LAX Terminal #6, World Way, Los Angeles, CA, United States',33.9426955,-118.4021869,'ChIJmdHj5iixwoARt8s0V2r87iY','California State University Long Beach, Long Beach, CA, United States',33.7838235,-118.11409040000001,'ChIJQ_aCKdgx3YARqy3HziZ_3B8','2016-12-07 21:18:00','2016-12-07 22:59:00','2016-12-08 02:59:55','CLOSED','OFFER'),(6,'user1@gmail.com','San Pedro, Los Angeles, CA, United States',33.73606189999999,-118.2922461,'ChIJpYrtFq413YARX4eG8Fd9FAQ','Korean Friendship Bell, Los Angeles, CA, United States',33.709731,-118.29380200000003,'ChIJCycjg9433YARd_SDCaS-ASs','2016-12-08 13:57:00','2016-12-08 14:57:00','2016-12-08 21:57:56','VISIBLE','OFFER'),(7,'user1@gmail.com','Long Beach, CA, United States',33.7700504,-118.19373949999999,'ChIJWdeZQOjKwoARqo8qxPo6AKE','California State University Long Beach, Long Beach, CA, United States',33.7838235,-118.11409040000001,'ChIJQ_aCKdgx3YARqy3HziZ_3B8','2016-12-08 16:50:00','2016-12-08 22:50:00','2016-12-09 00:50:21','CLOSED','OFFER'),(8,'user2@gmail.com','Long Beach, CA, United States',33.7700504,-118.19373949999999,'ChIJWdeZQOjKwoARqo8qxPo6AKE','Gaslamp Music + Bar + Kitchen, East Pacific Coast Highway, Long Beach, CA, United States',33.76707,-118.11647299999998,'ChIJUWGwDSkw3YARQudV1HEzpRQ','2016-12-08 17:20:00','2016-12-08 23:20:00','2016-12-09 01:20:56','CLOSED','OFFER'),(9,'user1@gmail.com','Venice, Los Angeles, CA, United States',33.98504689999999,-118.46948320000001,'ChIJXWhSMMC6woARPI1cDbQBEY8','Long Beach Airport, Donald Douglas Drive, Long Beach, CA, United States',33.8190566,-118.14547770000001,'ChIJhQxDwTYy3YAR_ydWCFAr1wM','2016-12-08 17:39:00','2016-12-08 23:39:00','2016-12-09 01:39:37','COMPLETED','OFFER'),(10,'user1@gmail.com','Long Beach, CA, United States',33.7700504,-118.19373949999999,'ChIJWdeZQOjKwoARqo8qxPo6AKE','E 2nd St, Long Beach, CA, United States',33.7614565,-118.13750249999998,'ChIJy_6b9Eww3YAR1a7HsGEW6dQ','2016-12-08 18:13:00','2016-12-08 23:13:00','2016-12-09 02:13:16','CLOSED','OFFER'),(11,'user1@gmail.com','Santa Ana, CA, United States',33.7455731,-117.86783379999997,'ChIJhTCCbJXb3IARvP0eHzqET8c','Long Beach Towne Center, Carson Boulevard, Long Beach, CA, United States',33.8290361,-118.08662290000001,'ChIJzfJy8twt3YARD0mTsEa_cjI','2016-12-13 18:16:00','2016-12-13 23:16:00','2016-12-09 02:39:55','VISIBLE','OFFER'),(12,'user1@gmail.com','Carson, CA, United States',33.8316745,-118.28169300000002,'ChIJfcS6fx7LwoARZYDiqXgXL6E','California State University Long Beach, Long Beach, CA, United States',33.7838235,-118.11409040000001,'ChIJQ_aCKdgx3YARqy3HziZ_3B8','2016-12-08 18:52:00','2016-12-08 22:52:00','2016-12-09 02:52:32','CLOSED','OFFER'),(13,'user1@gmail.com','Long Beach, CA, United States',33.7700504,-118.19373949999999,'ChIJWdeZQOjKwoARqo8qxPo6AKE','California State University Long Beach, Long Beach, CA, United States',33.7838235,-118.11409040000001,'ChIJQ_aCKdgx3YARqy3HziZ_3B8','2016-12-12 16:12:00','2016-12-12 22:12:00','2016-12-13 00:12:34','VISIBLE','OFFER'),(14,'user1@gmail.com','California State University Long Beach, Long Beach, CA, United States',33.7838235,-118.11409040000001,'ChIJQ_aCKdgx3YARqy3HziZ_3B8','2nd Street Beauty, East 2nd Street, Long Beach, CA, United States',33.7610164,-118.13714240000002,'ChIJZx-7GEow3YAR4gk-8FI0u-c','2016-12-12 16:44:00','2016-12-12 21:44:00','2016-12-13 00:44:58','CLOSED','OFFER'),(15,'user1@gmail.com','CSS Music, Los Angeles, CA, United States',34.0980234,-118.24801150000002,'ChIJvdXStNvGwoARLVS57Qz57B4','CSULB University Student Union, Long Beach, CA, United States',33.7813767,-118.11346650000002,'ChIJrXqlH9sx3YARCi-SFP2b_8g','2016-12-12 18:41:00','2016-12-12 21:41:00','2016-12-13 02:41:26','VISIBLE','OFFER'),(16,'email@2016-12-13.15.18.18','Long Beach, CA, United States',33.7700504,-118.19373949999999,'ChIJWdeZQOjKwoARqo8qxPo6AKE','California State University Long Beach, Long Beach, CA, United States',33.7838235,-118.11409040000001,'ChIJQ_aCKdgx3YARqy3HziZ_3B8','2016-12-13 15:18:00','2016-12-13 16:18:00','2016-12-13 23:18:57','VISIBLE','REQUEST'),(17,'email@2016-12-13.15.20.18','Long Beach, CA, United States',33.7700504,-118.19373949999999,'ChIJWdeZQOjKwoARqo8qxPo6AKE','California State University Long Beach, Long Beach, CA, United States',33.7838235,-118.11409040000001,'ChIJQ_aCKdgx3YARqy3HziZ_3B8','2016-12-13 15:20:00','2016-12-13 16:20:00','2016-12-13 23:20:55','VISIBLE','REQUEST'),(18,'user2@gmail.com','Long Beach, CA, United States',33.7700504,-118.19373949999999,'ChIJWdeZQOjKwoARqo8qxPo6AKE','California State University Long Beach, Long Beach, CA, United States',33.7838235,-118.11409040000001,'ChIJQ_aCKdgx3YARqy3HziZ_3B8','2016-12-14 15:14:00','2016-12-14 23:14:00','2016-12-14 23:14:27','CLOSED','OFFER'),(19,'user2@gmail.com','California State University Long Beach, Long Beach, CA, United States',33.7838235,-118.11409040000001,'ChIJQ_aCKdgx3YARqy3HziZ_3B8','Long Beach Airport, Donald Douglas Drive, Long Beach, CA, United States',33.8190566,-118.14547770000001,'ChIJhQxDwTYy3YAR_ydWCFAr1wM','2016-12-14 15:26:00','2016-12-14 19:26:00','2016-12-14 23:26:24','CLOSED','REQUEST'),(20,'user2@gmail.com','California State University Long Beach, Long Beach, CA, United States',33.7838235,-118.11409040000001,'ChIJQ_aCKdgx3YARqy3HziZ_3B8','E 2nd St, Long Beach, CA, United States',33.7614565,-118.13750249999998,'ChIJy_6b9Eww3YAR1a7HsGEW6dQ','2016-12-14 15:29:00','2016-12-14 19:29:00','2016-12-14 23:29:52','CLOSED','REQUEST'),(21,'user2@gmail.com','California State University Long Beach, Long Beach, CA, United States',33.7838235,-118.11409040000001,'ChIJQ_aCKdgx3YARqy3HziZ_3B8','Long Beach V.A. Medical Center Radiation Therapy, East 7th Street, Long Beach, CA, United States',33.7768708,-118.11929459999999,'ChIJrc-vWdEx3YARE93l8lYDo9Y','2016-12-14 15:31:00','2016-12-14 23:31:00','2016-12-14 23:31:24','CLOSED','OFFER'),(22,'user2@gmail.com','California State University Long Beach, Long Beach, CA, United States',33.7838235,-118.11409040000001,'ChIJQ_aCKdgx3YARqy3HziZ_3B8','Belmont Shore, Long Beach, CA, United States',33.7569251,-118.13713769999998,'ChIJz5yIIDsw3YARuhdF_MeWV30','2016-12-14 16:13:00','2016-12-14 21:13:00','2016-12-15 00:13:19','CLOSED','OFFER'),(23,'user3@gmail.com','CSUF, North State College Boulevard, Fullerton, CA, United States',33.8829226,-117.88692609999998,'ChIJkRPGjM7V3IARVfNKubsQmCs','California State University Long Beach, Long Beach, CA, United States',33.7838235,-118.11409040000001,'ChIJQ_aCKdgx3YARqy3HziZ_3B8','2016-12-14 16:25:00','2016-12-14 21:25:00','2016-12-15 00:25:55','COMPLETED','OFFER'),(24,'Fern@gmail.com','Long Beach, CA, United States',33.7700504,-118.19373949999999,'ChIJWdeZQOjKwoARqo8qxPo6AKE','California State University Long Beach, Long Beach, CA, United States',33.7838235,-118.11409040000001,'ChIJQ_aCKdgx3YARqy3HziZ_3B8','2016-12-14 17:01:00','2016-12-14 20:01:00','2016-12-15 01:01:53','COMPLETED','OFFER'),(25,'mike@gmail.com','Long Beach, CA, United States',33.7700504,-118.19373949999999,'ChIJWdeZQOjKwoARqo8qxPo6AKE','Long Beach Airport, Donald Douglas Drive, Long Beach, CA, United States',33.8190566,-118.14547770000001,'ChIJhQxDwTYy3YAR_ydWCFAr1wM','2016-12-14 17:02:00','2016-12-14 21:02:00','2016-12-15 01:02:26','CLOSED','OFFER'),(26,'mike@gmail.com','Long Beach, CA, United States',33.7700504,-118.19373949999999,'ChIJWdeZQOjKwoARqo8qxPo6AKE','Aquarium of the Pacific, Long Beach, CA, United States',33.7622467,-118.19692880000002,'ChIJtXzMMjAx3YARLQXRGh5OQik','2016-12-14 17:02:00','2016-12-14 20:10:00','2016-12-15 01:02:53','CLOSED','OFFER'),(27,'user3@gmail.com','Long Beach, CA, United States',33.7700504,-118.19373949999999,'ChIJWdeZQOjKwoARqo8qxPo6AKE','Signal Hill, CA, United States',33.80446140000001,-118.16784560000002,'ChIJ5YZ9qM8z3YARyXxmX3G13es','2016-12-14 17:46:00','2016-12-14 23:46:00','2016-12-15 01:46:49','CLOSED','OFFER');
/*!40000 ALTER TABLE `routes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `email` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `first_name` varchar(100) DEFAULT NULL,
  `last_name` varchar(100) DEFAULT NULL,
  `bday` date DEFAULT NULL,
  `drivers_license_number` varchar(40) DEFAULT NULL,
  `connected_facebook_email` varchar(100) NOT NULL,
  `is_facebook_user` varchar(1) NOT NULL,
  `create_date` datetime NOT NULL,
  `update_date` datetime NOT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES ('','','www.google.com/intl/en/policies/terms/','','0000-00-00','','','N','2016-12-10 04:45:20','2016-12-10 04:45:20'),('Alex@gmail.com','password','alex','fe','1990-01-01','','','N','2016-12-14 17:01:06','2016-12-14 17:01:06'),('email@2016-12-13.15.18.18','password2016-12-13.15.18.18','first','last','1990-01-01','','','N','2016-12-13 15:18:24','2016-12-13 15:18:24'),('email@2016-12-13.15.20.18','password2016-12-13.15.20.18','first','last','1990-01-01','','','N','2016-12-13 15:20:23','2016-12-13 15:20:23'),('Fern@gmail.com','password','f','c','1990-01-01','','','N','2016-12-14 17:00:44','2016-12-14 17:00:44'),('fernie255@yahoo.com','password','Fernando','Fajardo','2000-01-01','7ABCDEF','fernie255@yahoo.com','N','2016-12-08 02:59:17','2016-12-08 02:59:17'),('mike@gmail.com','password','m','c','1990-01-01','','','N','2016-12-14 17:00:20','2016-12-14 17:00:20'),('user1@gmail.com','password','first1','last1','1996-01-01','5ABC001','user1@gmail.com','N','2016-12-08 02:59:17','2016-12-08 02:59:17'),('user2@gmail.com','password','first2','last2','1996-01-01','5ABC002','user2@gmail.com','N','2016-12-08 02:59:17','2016-12-08 02:59:17'),('user3@gmail.com','password','mike','craw','1990-01-01','','','N','2016-12-08 18:31:44','2016-12-08 18:31:44');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-12-15  2:20:53
