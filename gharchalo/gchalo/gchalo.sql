-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: localhost    Database: gharchalo
-- ------------------------------------------------------
-- Server version	8.0.34

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add user',4,'add_user'),(14,'Can change user',4,'change_user'),(15,'Can delete user',4,'delete_user'),(16,'Can view user',4,'view_user'),(17,'Can add content type',5,'add_contenttype'),(18,'Can change content type',5,'change_contenttype'),(19,'Can delete content type',5,'delete_contenttype'),(20,'Can view content type',5,'view_contenttype'),(21,'Can add session',6,'add_session'),(22,'Can change session',6,'change_session'),(23,'Can delete session',6,'delete_session'),(24,'Can view session',6,'view_session'),(25,'Can add route',7,'add_route'),(26,'Can change route',7,'change_route'),(27,'Can delete route',7,'delete_route'),(28,'Can view route',7,'view_route'),(29,'Can add routedetails',8,'add_routedetails'),(30,'Can change routedetails',8,'change_routedetails'),(31,'Can delete routedetails',8,'delete_routedetails'),(32,'Can view routedetails',8,'view_routedetails'),(33,'Can add bus',9,'add_bus'),(34,'Can change bus',9,'change_bus'),(35,'Can delete bus',9,'delete_bus'),(36,'Can view bus',9,'view_bus'),(37,'Can add routedetails_shift2',10,'add_routedetails_shift2'),(38,'Can change routedetails_shift2',10,'change_routedetails_shift2'),(39,'Can delete routedetails_shift2',10,'delete_routedetails_shift2'),(40,'Can view routedetails_shift2',10,'view_routedetails_shift2'),(41,'Can add routedetails_shift1',8,'add_routedetails_shift1'),(42,'Can change routedetails_shift1',8,'change_routedetails_shift1'),(43,'Can delete routedetails_shift1',8,'delete_routedetails_shift1'),(44,'Can view routedetails_shift1',8,'view_routedetails_shift1'),(45,'Can add student',11,'add_student'),(46,'Can change student',11,'change_student'),(47,'Can delete student',11,'delete_student'),(48,'Can view student',11,'view_student'),(49,'Can add subscribe',12,'add_subscribe'),(50,'Can change subscribe',12,'change_subscribe'),(51,'Can delete subscribe',12,'delete_subscribe'),(52,'Can view subscribe',12,'view_subscribe'),(53,'Can add admin verification',13,'add_adminverification'),(54,'Can change admin verification',13,'change_adminverification'),(55,'Can delete admin verification',13,'delete_adminverification'),(56,'Can view admin verification',13,'view_adminverification'),(57,'Can add reset password',14,'add_resetpassword'),(58,'Can change reset password',14,'change_resetpassword'),(59,'Can delete reset password',14,'delete_resetpassword'),(60,'Can view reset password',14,'view_resetpassword');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$600000$mQPffpIg50OLVXRiHSBR4d$j0jYY9nOwlXljqyE9rndKUhPGYPgHhYEPMbcstPZWEc=','2023-11-07 16:19:05.575733',1,'hamza','','','hamzasanwala31@gmail.com',1,1,'2023-10-15 15:18:25.786739'),(2,'pbkdf2_sha256$600000$a2aRBvx1chMR5aUARiSjJl$jtJSEsYVV1YaKBZsQiBua/qdNRUEU+0iZmnQ8LsOzDQ=','2023-10-16 05:20:10.892603',0,'lnctadmin','','','',0,1,'2023-10-15 15:23:13.128410'),(3,'pbkdf2_sha256$600000$qO6DAOaXl4JlgtG2Or8u6N$Bos79Rsb+/jUHHBd5lwHox0IhUEQOLajCk5iQJQ3Ykc=','2023-11-08 18:00:06.325475',0,'gharchalo','','','',0,1,'2023-10-16 15:39:08.059006'),(11,'pbkdf2_sha256$600000$yuByxCPsXE8jW923gC6OgI$nXV5xFORqnBq7Ss455STuijaocopDWTV3u36SPS4en8=','2023-11-08 17:35:22.949851',0,'hamzasanwala31@gmail.com','','','',0,1,'2023-10-18 14:06:59.270063'),(12,'pbkdf2_sha256$600000$KjdWYBCfu43njESDN3WO98$+yNTcLKAiMLlcgnf88O/8vyv7qNFh/WMjdbUQQl4ezo=','2023-10-18 14:48:51.954673',0,'contactkushik@gmail.com','','','',0,1,'2023-10-18 14:47:18.823948'),(13,'pbkdf2_sha256$600000$iIjQaDQHEmJuLl1gd5lSAd$cZAemggc9BudYix1vp5XCOg189vdhOxGLydbSXv6J4o=','2023-10-18 14:58:10.535934',0,'meenahitesh253@gmail.com','','','',0,1,'2023-10-18 14:56:04.279001'),(15,'pbkdf2_sha256$600000$uUOCXz1NA2ehtvHYjWwajC$9ek9eBt8ER/Cyhrt3mfCAb58lTgIodm9SsXS2Dkz6fg=','2023-10-19 19:52:23.018722',0,'lnct','','','hamzamovies31@gmail.com',0,1,'2023-10-18 19:11:59.951527'),(16,'pbkdf2_sha256$600000$sqNPGZKsKAMiTs3SFeMbRu$4nPdTZlbOaRm86dKX4ib+eja8CRvjKL4EU7tMnIq0/4=','2023-10-19 07:09:37.311682',0,'himanshu','','','www.himanshubankey@gmail.com',0,1,'2023-10-19 07:06:34.434169'),(17,'pbkdf2_sha256$600000$qWp1eBiBP0zYiL01bY8iyk$6LMH22krHN22uG/HHZYN6Oi39Wy95hQxrD/3t6MuOwU=','2023-10-19 07:17:37.077372',0,'www.himanshubankey@gmail.com','','','',0,1,'2023-10-19 07:13:09.718617'),(18,'pbkdf2_sha256$600000$M4BtcYTkPOeVMJd7pBmqJ3$Fx+EiaHO0NIxJE3h+8fjQLj0kWrPXVlgXCCjDgQgOmM=',NULL,0,'hamzamovies31@gmail.com','','','',0,1,'2023-10-19 07:19:53.384991'),(19,'pbkdf2_sha256$600000$vuNFoKeGqtdoPNXksU0Akt$O6zRcJiTgO2COg74798WvHH8Wx1d1f/G5KrWrcnT1xs=','2023-10-19 19:12:43.388814',0,'aditianand1112@gmail.com','','','',0,1,'2023-10-19 19:07:30.416682'),(20,'pbkdf2_sha256$600000$Hd6JqdvkSB0Ve6tgEu3D5y$krZbSIQU9PxZZUYQJzuat9j6XQcEGbuiiAo5mHTU2U8=','2023-10-20 09:21:32.404779',0,'admin','','','hamzasanwala31@gmail.com',0,1,'2023-10-19 20:15:33.808155'),(21,'pbkdf2_sha256$600000$nFFWsXAugnz5s9dqTqi90Y$KQ89oWPBn9RUsRk3zWdpZOEnR3To2d/3iUcXlcV4Opo=','2023-11-06 17:42:24.908488',0,'zainabsanwala52@gmail.com','','','',0,1,'2023-11-06 16:00:20.078810'),(22,'pbkdf2_sha256$600000$L7TwqfH4g9yKpR0tXPiIZR$UfGcuJ7R2AlnIYdpC1znK1Z3TXdYPCrGAjMAcOlrFDA=','2023-11-06 18:51:57.389100',0,'hakimuddinsanwala52@gmail.com','','','',0,1,'2023-11-06 18:50:25.653456'),(23,'pbkdf2_sha256$600000$hD7M2gJBdeyN85eR10gWE4$LfqwOsHNIoD9vLVlARe8j8l6UdSTYpNRXJAyZwRd1nc=','2023-11-07 16:21:14.812247',0,'hatimsanwala10@gmail.com','','','',0,1,'2023-11-07 16:20:00.618391'),(24,'pbkdf2_sha256$600000$4UO6WSMFjAieEX3DE14woR$eK62AxylQGoaUOLPaTx9SrYeWdtDIlHo0wZAWJSd5ww=','2023-11-07 16:35:41.724024',0,'kushiksahu51@gmail.com','','','',0,1,'2023-11-07 16:34:37.461929'),(25,'pbkdf2_sha256$600000$OaYObBktjnucaeVLLttPfv$wqjDWkZrKTGAH1ULs0IABJm6ePZg+bkD+y8KksyfeeE=','2023-11-08 17:20:53.446989',0,'hakimuddin','','','hakimuddinsanwala52@gmail.com',0,1,'2023-11-08 17:18:09.309196'),(26,'pbkdf2_sha256$600000$iqqMxCiHHzai9o4iebeyvI$0MvC/54wb5JWZS6ZUwNaSVmGq3RXElFwg+SMDN4N04A=',NULL,0,'Kelvin','','','sahurani321@gmail.com',0,0,'2023-11-08 18:02:30.896637');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_groups` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_admin_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `django_admin_log_chk_1` CHECK ((`action_flag` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=268 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2023-10-15 15:23:13.721639','2','lnctadmin',1,'[{\"added\": {}}]',4,1),(2,'2023-10-15 15:45:26.666436','1','Route object (1)',1,'[{\"added\": {}}]',7,1),(3,'2023-10-15 15:46:05.990940','3','Route object (3)',1,'[{\"added\": {}}]',7,1),(4,'2023-10-15 15:46:19.627369','2','Route object (2)',1,'[{\"added\": {}}]',7,1),(5,'2023-10-15 15:46:38.331984','4','Route object (4)',1,'[{\"added\": {}}]',7,1),(6,'2023-10-15 15:47:02.892559','5','Route object (5)',1,'[{\"added\": {}}]',7,1),(7,'2023-10-15 15:47:13.985734','7','Route object (7)',1,'[{\"added\": {}}]',7,1),(8,'2023-10-15 15:47:25.588179','9','Route object (9)',1,'[{\"added\": {}}]',7,1),(9,'2023-10-15 15:47:42.318071','11','Route object (11)',1,'[{\"added\": {}}]',7,1),(10,'2023-10-15 15:48:04.970564','6','Route object (6)',1,'[{\"added\": {}}]',7,1),(11,'2023-10-15 15:48:19.337234','8','Route object (8)',1,'[{\"added\": {}}]',7,1),(12,'2023-10-15 15:48:33.041623','10','Route object (10)',1,'[{\"added\": {}}]',7,1),(13,'2023-10-15 15:48:41.285382','12','Route object (12)',1,'[{\"added\": {}}]',7,1),(14,'2023-10-15 15:49:03.187621','13','Route object (13)',1,'[{\"added\": {}}]',7,1),(15,'2023-10-15 15:49:13.951531','15','Route object (15)',1,'[{\"added\": {}}]',7,1),(16,'2023-10-15 15:49:24.745902','17','Route object (17)',1,'[{\"added\": {}}]',7,1),(17,'2023-10-15 15:49:36.294838','19','Route object (19)',1,'[{\"added\": {}}]',7,1),(18,'2023-10-15 15:49:56.302081','14','Route object (14)',1,'[{\"added\": {}}]',7,1),(19,'2023-10-15 15:50:28.269724','16','Route object (16)',1,'[{\"added\": {}}]',7,1),(20,'2023-10-15 15:50:40.897729','18','Route object (18)',1,'[{\"added\": {}}]',7,1),(21,'2023-10-15 15:50:52.618469','20','Route object (20)',1,'[{\"added\": {}}]',7,1),(22,'2023-10-15 15:51:06.941042','21','Route object (21)',1,'[{\"added\": {}}]',7,1),(23,'2023-10-15 15:51:24.419717','23','Route object (23)',1,'[{\"added\": {}}]',7,1),(24,'2023-10-15 15:51:45.620497','25','Route object (25)',1,'[{\"added\": {}}]',7,1),(25,'2023-10-15 15:52:01.975555','27','Route object (27)',1,'[{\"added\": {}}]',7,1),(26,'2023-10-15 15:52:25.288825','22','Route object (22)',1,'[{\"added\": {}}]',7,1),(27,'2023-10-15 15:52:38.494864','24','Route object (24)',1,'[{\"added\": {}}]',7,1),(28,'2023-10-15 15:52:53.980293','26','Route object (26)',1,'[{\"added\": {}}]',7,1),(29,'2023-10-15 15:53:06.249873','28','Route object (28)',1,'[{\"added\": {}}]',7,1),(30,'2023-10-15 15:53:23.852710','29','Route object (29)',1,'[{\"added\": {}}]',7,1),(31,'2023-10-15 15:53:40.554036','30','Route object (30)',1,'[{\"added\": {}}]',7,1),(32,'2023-10-16 05:02:58.738680','1','Routedetails_shift2 object (1)',1,'[{\"added\": {}}]',10,1),(33,'2023-10-16 05:03:09.174673','2','Routedetails_shift2 object (2)',1,'[{\"added\": {}}]',10,1),(34,'2023-10-16 05:03:22.620291','3','Routedetails_shift2 object (3)',1,'[{\"added\": {}}]',10,1),(35,'2023-10-16 05:03:45.388358','4','Routedetails_shift2 object (4)',1,'[{\"added\": {}}]',10,1),(36,'2023-10-16 05:04:06.577640','5','Routedetails_shift2 object (5)',1,'[{\"added\": {}}]',10,1),(37,'2023-10-16 05:04:15.116938','6','Routedetails_shift2 object (6)',1,'[{\"added\": {}}]',10,1),(38,'2023-10-16 05:04:25.842698','7','Routedetails_shift2 object (7)',1,'[{\"added\": {}}]',10,1),(39,'2023-10-16 05:04:39.762906','8','Routedetails_shift2 object (8)',1,'[{\"added\": {}}]',10,1),(40,'2023-10-16 05:04:55.014431','9','Routedetails_shift2 object (9)',1,'[{\"added\": {}}]',10,1),(41,'2023-10-16 05:05:05.768364','10','Routedetails_shift2 object (10)',1,'[{\"added\": {}}]',10,1),(42,'2023-10-16 05:05:16.392062','11','Routedetails_shift2 object (11)',1,'[{\"added\": {}}]',10,1),(43,'2023-10-16 05:05:26.924898','12','Routedetails_shift2 object (12)',1,'[{\"added\": {}}]',10,1),(44,'2023-10-16 05:06:14.311406','13','Routedetails_shift2 object (13)',1,'[{\"added\": {}}]',10,1),(45,'2023-10-16 05:06:26.309981','14','Routedetails_shift2 object (14)',1,'[{\"added\": {}}]',10,1),(46,'2023-10-16 05:06:54.480203','15','Routedetails_shift2 object (15)',1,'[{\"added\": {}}]',10,1),(47,'2023-10-16 05:07:07.639777','16','Routedetails_shift2 object (16)',1,'[{\"added\": {}}]',10,1),(48,'2023-10-16 05:07:19.452845','17','Routedetails_shift2 object (17)',1,'[{\"added\": {}}]',10,1),(49,'2023-10-16 05:07:39.021144','18','Routedetails_shift2 object (18)',1,'[{\"added\": {}}]',10,1),(50,'2023-10-16 05:07:56.071915','19','Routedetails_shift2 object (19)',1,'[{\"added\": {}}]',10,1),(51,'2023-10-16 05:08:15.608634','20','Routedetails_shift2 object (20)',1,'[{\"added\": {}}]',10,1),(52,'2023-10-16 05:08:29.662869','21','Routedetails_shift2 object (21)',1,'[{\"added\": {}}]',10,1),(53,'2023-10-16 05:08:46.122207','22','Routedetails_shift2 object (22)',1,'[{\"added\": {}}]',10,1),(54,'2023-10-16 05:08:54.013946','23','Routedetails_shift2 object (23)',1,'[{\"added\": {}}]',10,1),(55,'2023-10-16 05:09:56.358487','1','Bus object (1)',1,'[{\"added\": {}}]',9,1),(56,'2023-10-16 05:10:30.793745','2','Bus object (2)',1,'[{\"added\": {}}]',9,1),(57,'2023-10-16 05:10:41.430063','3','Bus object (3)',1,'[{\"added\": {}}]',9,1),(58,'2023-10-16 05:11:43.118584','4','Bus object (4)',1,'[{\"added\": {}}]',9,1),(59,'2023-10-17 06:09:23.331265','26','Routedetails_shift2 object (26)',1,'[{\"added\": {}}]',10,1),(60,'2023-10-17 06:09:36.352888','27','Routedetails_shift2 object (27)',1,'[{\"added\": {}}]',10,1),(61,'2023-10-17 06:09:45.255520','28','Routedetails_shift2 object (28)',1,'[{\"added\": {}}]',10,1),(62,'2023-10-17 06:09:55.545639','29','Routedetails_shift2 object (29)',1,'[{\"added\": {}}]',10,1),(63,'2023-10-17 06:10:07.743380','30','Routedetails_shift2 object (30)',1,'[{\"added\": {}}]',10,1),(64,'2023-10-17 06:10:18.051999','31','Routedetails_shift2 object (31)',1,'[{\"added\": {}}]',10,1),(65,'2023-10-17 06:10:36.009280','32','Routedetails_shift2 object (32)',1,'[{\"added\": {}}]',10,1),(66,'2023-10-17 06:10:53.451291','33','Routedetails_shift2 object (33)',1,'[{\"added\": {}}]',10,1),(67,'2023-10-17 06:11:09.398051','34','Routedetails_shift2 object (34)',1,'[{\"added\": {}}]',10,1),(68,'2023-10-17 06:11:26.379844','35','Routedetails_shift2 object (35)',1,'[{\"added\": {}}]',10,1),(69,'2023-10-17 06:11:46.635802','36','Routedetails_shift2 object (36)',1,'[{\"added\": {}}]',10,1),(70,'2023-10-17 06:12:03.805823','37','Routedetails_shift2 object (37)',1,'[{\"added\": {}}]',10,1),(71,'2023-10-17 06:12:13.797126','38','Routedetails_shift2 object (38)',1,'[{\"added\": {}}]',10,1),(72,'2023-10-17 06:12:31.559405','39','Routedetails_shift2 object (39)',1,'[{\"added\": {}}]',10,1),(73,'2023-10-17 06:12:41.287230','40','Routedetails_shift2 object (40)',1,'[{\"added\": {}}]',10,1),(74,'2023-10-17 06:12:54.788872','41','Routedetails_shift2 object (41)',1,'[{\"added\": {}}]',10,1),(75,'2023-10-17 06:13:05.702169','42','Routedetails_shift2 object (42)',1,'[{\"added\": {}}]',10,1),(76,'2023-10-17 06:13:14.203773','43','Routedetails_shift2 object (43)',1,'[{\"added\": {}}]',10,1),(77,'2023-10-17 06:13:25.450946','44','Routedetails_shift2 object (44)',1,'[{\"added\": {}}]',10,1),(78,'2023-10-17 06:13:38.316846','45','Routedetails_shift2 object (45)',1,'[{\"added\": {}}]',10,1),(79,'2023-10-17 06:13:48.544651','46','Routedetails_shift2 object (46)',1,'[{\"added\": {}}]',10,1),(80,'2023-10-17 06:13:59.331687','47','Routedetails_shift2 object (47)',1,'[{\"added\": {}}]',10,1),(81,'2023-10-17 06:14:13.028067','48','Routedetails_shift2 object (48)',1,'[{\"added\": {}}]',10,1),(82,'2023-10-17 06:14:21.853437','49','Routedetails_shift2 object (49)',1,'[{\"added\": {}}]',10,1),(83,'2023-10-17 06:14:33.711263','50','Routedetails_shift2 object (50)',1,'[{\"added\": {}}]',10,1),(84,'2023-10-17 06:14:43.956204','51','Routedetails_shift2 object (51)',1,'[{\"added\": {}}]',10,1),(85,'2023-10-17 06:14:53.634313','52','Routedetails_shift2 object (52)',1,'[{\"added\": {}}]',10,1),(86,'2023-10-17 06:15:04.556720','53','Routedetails_shift2 object (53)',1,'[{\"added\": {}}]',10,1),(87,'2023-10-17 06:15:16.307482','54','Routedetails_shift2 object (54)',1,'[{\"added\": {}}]',10,1),(88,'2023-10-17 06:15:28.561130','55','Routedetails_shift2 object (55)',1,'[{\"added\": {}}]',10,1),(89,'2023-10-17 06:15:40.752834','56','Routedetails_shift2 object (56)',1,'[{\"added\": {}}]',10,1),(90,'2023-10-17 06:15:52.145844','57','Routedetails_shift2 object (57)',1,'[{\"added\": {}}]',10,1),(91,'2023-10-17 06:16:09.482248','58','Routedetails_shift2 object (58)',1,'[{\"added\": {}}]',10,1),(92,'2023-10-17 06:16:19.098748','59','Routedetails_shift2 object (59)',1,'[{\"added\": {}}]',10,1),(93,'2023-10-17 06:16:37.034872','60','Routedetails_shift2 object (60)',1,'[{\"added\": {}}]',10,1),(94,'2023-10-17 06:16:53.398754','61','Routedetails_shift2 object (61)',1,'[{\"added\": {}}]',10,1),(95,'2023-10-17 06:17:09.456145','62','Routedetails_shift2 object (62)',1,'[{\"added\": {}}]',10,1),(96,'2023-10-17 06:17:19.699817','63','Routedetails_shift2 object (63)',1,'[{\"added\": {}}]',10,1),(97,'2023-10-17 06:17:26.787075','64','Routedetails_shift2 object (64)',1,'[{\"added\": {}}]',10,1),(98,'2023-10-17 06:17:36.943697','65','Routedetails_shift2 object (65)',1,'[{\"added\": {}}]',10,1),(99,'2023-10-17 06:17:47.301705','66','Routedetails_shift2 object (66)',1,'[{\"added\": {}}]',10,1),(100,'2023-10-17 06:17:59.493520','67','Routedetails_shift2 object (67)',1,'[{\"added\": {}}]',10,1),(101,'2023-10-17 06:18:11.570501','68','Routedetails_shift2 object (68)',1,'[{\"added\": {}}]',10,1),(102,'2023-10-17 06:18:23.574499','69','Routedetails_shift2 object (69)',1,'[{\"added\": {}}]',10,1),(103,'2023-10-17 06:18:39.892658','70','Routedetails_shift2 object (70)',1,'[{\"added\": {}}]',10,1),(104,'2023-10-17 06:18:53.059514','71','Routedetails_shift2 object (71)',1,'[{\"added\": {}}]',10,1),(105,'2023-10-17 06:19:09.805143','71','Routedetails_shift2 object (71)',2,'[{\"changed\": {\"fields\": [\"Time\"]}}]',10,1),(106,'2023-10-17 06:19:22.688126','72','Routedetails_shift2 object (72)',1,'[{\"added\": {}}]',10,1),(107,'2023-10-17 06:19:35.285769','73','Routedetails_shift2 object (73)',1,'[{\"added\": {}}]',10,1),(108,'2023-10-17 06:19:46.413970','74','Routedetails_shift2 object (74)',1,'[{\"added\": {}}]',10,1),(109,'2023-10-17 06:20:01.324852','75','Routedetails_shift2 object (75)',1,'[{\"added\": {}}]',10,1),(110,'2023-10-17 06:20:12.040928','76','Routedetails_shift2 object (76)',1,'[{\"added\": {}}]',10,1),(111,'2023-10-17 06:20:21.113875','77','Routedetails_shift2 object (77)',1,'[{\"added\": {}}]',10,1),(112,'2023-10-17 06:20:31.519067','78','Routedetails_shift2 object (78)',1,'[{\"added\": {}}]',10,1),(113,'2023-10-17 06:20:40.235691','79','Routedetails_shift2 object (79)',1,'[{\"added\": {}}]',10,1),(114,'2023-10-17 06:21:26.146408','80','Routedetails_shift2 object (80)',1,'[{\"added\": {}}]',10,1),(115,'2023-10-17 06:21:35.377636','81','Routedetails_shift2 object (81)',1,'[{\"added\": {}}]',10,1),(116,'2023-10-17 06:21:41.342222','82','Routedetails_shift2 object (82)',1,'[{\"added\": {}}]',10,1),(117,'2023-10-17 06:21:53.517393','83','Routedetails_shift2 object (83)',1,'[{\"added\": {}}]',10,1),(118,'2023-10-17 06:22:04.223879','84','Routedetails_shift2 object (84)',1,'[{\"added\": {}}]',10,1),(119,'2023-10-17 06:22:14.753299','85','Routedetails_shift2 object (85)',1,'[{\"added\": {}}]',10,1),(120,'2023-10-17 06:22:23.912555','86','Routedetails_shift2 object (86)',1,'[{\"added\": {}}]',10,1),(121,'2023-10-17 06:22:35.346848','87','Routedetails_shift2 object (87)',1,'[{\"added\": {}}]',10,1),(122,'2023-10-17 06:22:44.726571','88','Routedetails_shift2 object (88)',1,'[{\"added\": {}}]',10,1),(123,'2023-10-17 06:23:10.196000','88','Routedetails_shift2 object (88)',2,'[]',10,1),(124,'2023-10-17 06:23:28.041507','89','Routedetails_shift2 object (89)',1,'[{\"added\": {}}]',10,1),(125,'2023-10-17 06:23:50.672664','90','Routedetails_shift2 object (90)',1,'[{\"added\": {}}]',10,1),(126,'2023-10-17 06:24:00.622383','91','Routedetails_shift2 object (91)',1,'[{\"added\": {}}]',10,1),(127,'2023-10-17 06:24:10.664243','92','Routedetails_shift2 object (92)',1,'[{\"added\": {}}]',10,1),(128,'2023-10-17 06:24:50.931696','93','Routedetails_shift2 object (93)',1,'[{\"added\": {}}]',10,1),(129,'2023-10-17 06:24:57.147163','94','Routedetails_shift2 object (94)',1,'[{\"added\": {}}]',10,1),(130,'2023-10-17 06:25:08.211903','95','Routedetails_shift2 object (95)',1,'[{\"added\": {}}]',10,1),(131,'2023-10-17 06:25:18.317387','96','Routedetails_shift2 object (96)',1,'[{\"added\": {}}]',10,1),(132,'2023-10-17 06:25:29.359218','97','Routedetails_shift2 object (97)',1,'[{\"added\": {}}]',10,1),(133,'2023-10-17 06:25:38.386723','98','Routedetails_shift2 object (98)',1,'[{\"added\": {}}]',10,1),(134,'2023-10-17 06:26:03.746047','99','Routedetails_shift2 object (99)',1,'[{\"added\": {}}]',10,1),(135,'2023-10-17 06:26:10.523151','100','Routedetails_shift2 object (100)',1,'[{\"added\": {}}]',10,1),(136,'2023-10-17 06:26:28.708789','101','Routedetails_shift2 object (101)',1,'[{\"added\": {}}]',10,1),(137,'2023-10-17 06:26:37.740268','102','Routedetails_shift2 object (102)',1,'[{\"added\": {}}]',10,1),(138,'2023-10-17 06:26:51.482311','103','Routedetails_shift2 object (103)',1,'[{\"added\": {}}]',10,1),(139,'2023-10-17 06:27:07.796245','104','Routedetails_shift2 object (104)',1,'[{\"added\": {}}]',10,1),(140,'2023-10-17 06:27:19.882692','105','Routedetails_shift2 object (105)',1,'[{\"added\": {}}]',10,1),(141,'2023-10-17 06:27:27.585425','106','Routedetails_shift2 object (106)',1,'[{\"added\": {}}]',10,1),(142,'2023-10-17 06:27:36.785284','107','Routedetails_shift2 object (107)',1,'[{\"added\": {}}]',10,1),(143,'2023-10-17 06:27:47.580487','108','Routedetails_shift2 object (108)',1,'[{\"added\": {}}]',10,1),(144,'2023-10-17 06:27:57.337940','109','Routedetails_shift2 object (109)',1,'[{\"added\": {}}]',10,1),(145,'2023-10-17 06:28:05.373648','110','Routedetails_shift2 object (110)',1,'[{\"added\": {}}]',10,1),(146,'2023-10-17 06:28:16.445541','111','Routedetails_shift2 object (111)',1,'[{\"added\": {}}]',10,1),(147,'2023-10-17 06:28:25.463798','112','Routedetails_shift2 object (112)',1,'[{\"added\": {}}]',10,1),(148,'2023-10-17 06:28:33.257124','113','Routedetails_shift2 object (113)',1,'[{\"added\": {}}]',10,1),(149,'2023-10-17 06:28:47.386133','114','Routedetails_shift2 object (114)',1,'[{\"added\": {}}]',10,1),(150,'2023-10-17 06:28:54.375397','115','Routedetails_shift2 object (115)',1,'[{\"added\": {}}]',10,1),(151,'2023-10-17 06:29:04.543075','116','Routedetails_shift2 object (116)',1,'[{\"added\": {}}]',10,1),(152,'2023-10-17 06:29:16.996921','117','Routedetails_shift2 object (117)',1,'[{\"added\": {}}]',10,1),(153,'2023-10-17 06:29:36.216727','118','Routedetails_shift2 object (118)',1,'[{\"added\": {}}]',10,1),(154,'2023-10-17 06:29:48.006284','119','Routedetails_shift2 object (119)',1,'[{\"added\": {}}]',10,1),(155,'2023-10-17 06:29:58.741434','120','Routedetails_shift2 object (120)',1,'[{\"added\": {}}]',10,1),(156,'2023-10-17 06:30:13.408865','121','Routedetails_shift2 object (121)',1,'[{\"added\": {}}]',10,1),(157,'2023-10-17 06:30:22.352111','122','Routedetails_shift2 object (122)',1,'[{\"added\": {}}]',10,1),(158,'2023-10-17 06:32:22.804009','122','Routedetails_shift2 object (122)',2,'[]',10,1),(159,'2023-10-17 06:32:32.885757','123','Routedetails_shift2 object (123)',1,'[{\"added\": {}}]',10,1),(160,'2023-10-17 06:32:43.912542','124','Routedetails_shift2 object (124)',1,'[{\"added\": {}}]',10,1),(161,'2023-10-17 06:32:53.500405','125','Routedetails_shift2 object (125)',1,'[{\"added\": {}}]',10,1),(162,'2023-10-17 06:33:03.654321','126','Routedetails_shift2 object (126)',1,'[{\"added\": {}}]',10,1),(163,'2023-10-17 06:33:22.250024','127','Routedetails_shift2 object (127)',1,'[{\"added\": {}}]',10,1),(164,'2023-10-17 06:33:34.123795','128','Routedetails_shift2 object (128)',1,'[{\"added\": {}}]',10,1),(165,'2023-10-17 06:33:57.251789','129','Routedetails_shift2 object (129)',1,'[{\"added\": {}}]',10,1),(166,'2023-10-17 06:34:06.585278','130','Routedetails_shift2 object (130)',1,'[{\"added\": {}}]',10,1),(167,'2023-10-17 06:34:17.713115','131','Routedetails_shift2 object (131)',1,'[{\"added\": {}}]',10,1),(168,'2023-10-17 06:34:32.581453','132','Routedetails_shift2 object (132)',1,'[{\"added\": {}}]',10,1),(169,'2023-10-17 06:34:47.362325','133','Routedetails_shift2 object (133)',1,'[{\"added\": {}}]',10,1),(170,'2023-10-17 06:35:00.195684','134','Routedetails_shift2 object (134)',1,'[{\"added\": {}}]',10,1),(171,'2023-10-17 06:35:17.944266','135','Routedetails_shift2 object (135)',1,'[{\"added\": {}}]',10,1),(172,'2023-10-17 06:35:26.545734','136','Routedetails_shift2 object (136)',1,'[{\"added\": {}}]',10,1),(173,'2023-10-17 06:35:36.680241','137','Routedetails_shift2 object (137)',1,'[{\"added\": {}}]',10,1),(174,'2023-10-17 06:36:20.391968','138','Routedetails_shift2 object (138)',1,'[{\"added\": {}}]',10,1),(175,'2023-10-17 06:36:27.860235','139','Routedetails_shift2 object (139)',1,'[{\"added\": {}}]',10,1),(176,'2023-10-17 06:36:41.148898','140','Routedetails_shift2 object (140)',1,'[{\"added\": {}}]',10,1),(177,'2023-10-17 06:37:00.809245','141','Routedetails_shift2 object (141)',1,'[{\"added\": {}}]',10,1),(178,'2023-10-17 06:37:08.672922','142','Routedetails_shift2 object (142)',1,'[{\"added\": {}}]',10,1),(179,'2023-10-17 06:37:22.568011','143','Routedetails_shift2 object (143)',1,'[{\"added\": {}}]',10,1),(180,'2023-10-17 06:37:31.332485','144','Routedetails_shift2 object (144)',1,'[{\"added\": {}}]',10,1),(181,'2023-10-17 06:37:45.609313','145','Routedetails_shift2 object (145)',1,'[{\"added\": {}}]',10,1),(182,'2023-10-17 06:37:57.975128','146','Routedetails_shift2 object (146)',1,'[{\"added\": {}}]',10,1),(183,'2023-10-17 06:38:08.591713','147','Routedetails_shift2 object (147)',1,'[{\"added\": {}}]',10,1),(184,'2023-10-17 06:38:19.583605','148','Routedetails_shift2 object (148)',1,'[{\"added\": {}}]',10,1),(185,'2023-10-17 06:38:33.276910','149','Routedetails_shift2 object (149)',1,'[{\"added\": {}}]',10,1),(186,'2023-10-17 06:38:45.238006','150','Routedetails_shift2 object (150)',1,'[{\"added\": {}}]',10,1),(187,'2023-10-17 06:38:56.679470','151','Routedetails_shift2 object (151)',1,'[{\"added\": {}}]',10,1),(188,'2023-10-17 06:39:08.533696','152','Routedetails_shift2 object (152)',1,'[{\"added\": {}}]',10,1),(189,'2023-10-17 06:39:21.200631','153','Routedetails_shift2 object (153)',1,'[{\"added\": {}}]',10,1),(190,'2023-10-17 06:39:30.854479','154','Routedetails_shift2 object (154)',1,'[{\"added\": {}}]',10,1),(191,'2023-10-17 06:39:42.545507','155','Routedetails_shift2 object (155)',1,'[{\"added\": {}}]',10,1),(192,'2023-10-17 06:39:51.777128','156','Routedetails_shift2 object (156)',1,'[{\"added\": {}}]',10,1),(193,'2023-10-17 06:40:10.332416','157','Routedetails_shift2 object (157)',1,'[{\"added\": {}}]',10,1),(194,'2023-10-17 06:40:23.927888','158','Routedetails_shift2 object (158)',1,'[{\"added\": {}}]',10,1),(195,'2023-10-17 06:40:33.744722','159','Routedetails_shift2 object (159)',1,'[{\"added\": {}}]',10,1),(196,'2023-10-17 06:40:48.075806','160','Routedetails_shift2 object (160)',1,'[{\"added\": {}}]',10,1),(197,'2023-10-17 06:41:10.310056','161','Routedetails_shift2 object (161)',1,'[{\"added\": {}}]',10,1),(198,'2023-10-17 06:41:19.166693','162','Routedetails_shift2 object (162)',1,'[{\"added\": {}}]',10,1),(199,'2023-10-17 06:41:31.381001','163','Routedetails_shift2 object (163)',1,'[{\"added\": {}}]',10,1),(200,'2023-10-17 06:41:47.697953','164','Routedetails_shift2 object (164)',1,'[{\"added\": {}}]',10,1),(201,'2023-10-17 06:41:57.057555','165','Routedetails_shift2 object (165)',1,'[{\"added\": {}}]',10,1),(202,'2023-10-17 06:42:22.108334','166','Routedetails_shift2 object (166)',1,'[{\"added\": {}}]',10,1),(203,'2023-10-17 06:42:41.069665','167','Routedetails_shift2 object (167)',1,'[{\"added\": {}}]',10,1),(204,'2023-10-17 06:42:48.406427','168','Routedetails_shift2 object (168)',1,'[{\"added\": {}}]',10,1),(205,'2023-10-17 06:43:09.538858','169','Routedetails_shift2 object (169)',1,'[{\"added\": {}}]',10,1),(206,'2023-10-17 06:43:18.836479','170','Routedetails_shift2 object (170)',1,'[{\"added\": {}}]',10,1),(207,'2023-10-17 06:43:26.945340','171','Routedetails_shift2 object (171)',1,'[{\"added\": {}}]',10,1),(208,'2023-10-17 06:43:40.611665','172','Routedetails_shift2 object (172)',1,'[{\"added\": {}}]',10,1),(209,'2023-10-17 06:43:50.790893','173','Routedetails_shift2 object (173)',1,'[{\"added\": {}}]',10,1),(210,'2023-10-17 06:44:06.082482','174','Routedetails_shift2 object (174)',1,'[{\"added\": {}}]',10,1),(211,'2023-10-17 06:44:17.032970','175','Routedetails_shift2 object (175)',1,'[{\"added\": {}}]',10,1),(212,'2023-10-17 06:44:33.950327','176','Routedetails_shift2 object (176)',1,'[{\"added\": {}}]',10,1),(213,'2023-10-17 06:44:42.231388','177','Routedetails_shift2 object (177)',1,'[{\"added\": {}}]',10,1),(214,'2023-10-17 06:44:54.302220','178','Routedetails_shift2 object (178)',1,'[{\"added\": {}}]',10,1),(215,'2023-10-17 06:45:04.757877','179','Routedetails_shift2 object (179)',1,'[{\"added\": {}}]',10,1),(216,'2023-10-17 06:45:14.174733','180','Routedetails_shift2 object (180)',1,'[{\"added\": {}}]',10,1),(217,'2023-10-17 06:45:21.100298','181','Routedetails_shift2 object (181)',1,'[{\"added\": {}}]',10,1),(218,'2023-10-17 06:45:32.551651','182','Routedetails_shift2 object (182)',1,'[{\"added\": {}}]',10,1),(219,'2023-10-17 06:45:49.521881','183','Routedetails_shift2 object (183)',1,'[{\"added\": {}}]',10,1),(220,'2023-10-17 06:46:08.276612','184','Routedetails_shift2 object (184)',1,'[{\"added\": {}}]',10,1),(221,'2023-10-17 06:46:17.394013','184','Routedetails_shift2 object (184)',2,'[]',10,1),(222,'2023-10-17 06:46:28.613104','185','Routedetails_shift2 object (185)',1,'[{\"added\": {}}]',10,1),(223,'2023-10-17 06:46:38.202586','186','Routedetails_shift2 object (186)',1,'[{\"added\": {}}]',10,1),(224,'2023-10-17 06:46:52.227963','187','Routedetails_shift2 object (187)',1,'[{\"added\": {}}]',10,1),(225,'2023-10-17 06:47:12.387896','188','Routedetails_shift2 object (188)',1,'[{\"added\": {}}]',10,1),(226,'2023-10-17 06:47:22.687922','189','Routedetails_shift2 object (189)',1,'[{\"added\": {}}]',10,1),(227,'2023-10-17 06:47:53.579584','190','Routedetails_shift2 object (190)',1,'[{\"added\": {}}]',10,1),(228,'2023-10-17 06:48:01.380816','191','Routedetails_shift2 object (191)',1,'[{\"added\": {}}]',10,1),(229,'2023-10-17 06:50:46.084306','191','Routedetails_shift2 object (191)',2,'[]',10,1),(230,'2023-10-17 06:50:57.047273','192','Routedetails_shift2 object (192)',1,'[{\"added\": {}}]',10,1),(231,'2023-10-17 06:51:05.319940','193','Routedetails_shift2 object (193)',1,'[{\"added\": {}}]',10,1),(232,'2023-10-17 06:51:21.961272','194','Routedetails_shift2 object (194)',1,'[{\"added\": {}}]',10,1),(233,'2023-10-17 06:51:33.912703','195','Routedetails_shift2 object (195)',1,'[{\"added\": {}}]',10,1),(234,'2023-10-17 06:51:52.291770','196','Routedetails_shift2 object (196)',1,'[{\"added\": {}}]',10,1),(235,'2023-10-17 06:52:05.492713','197','Routedetails_shift2 object (197)',1,'[{\"added\": {}}]',10,1),(236,'2023-10-17 06:52:15.858140','198','Routedetails_shift2 object (198)',1,'[{\"added\": {}}]',10,1),(237,'2023-10-17 06:52:25.202607','199','Routedetails_shift2 object (199)',1,'[{\"added\": {}}]',10,1),(238,'2023-10-17 06:52:36.594276','200','Routedetails_shift2 object (200)',1,'[{\"added\": {}}]',10,1),(239,'2023-10-17 06:52:51.241448','201','Routedetails_shift2 object (201)',1,'[{\"added\": {}}]',10,1),(240,'2023-10-17 06:53:07.527396','201','Routedetails_shift2 object (201)',2,'[{\"changed\": {\"fields\": [\"Time\"]}}]',10,1),(241,'2023-10-17 06:53:18.350425','202','Routedetails_shift2 object (202)',1,'[{\"added\": {}}]',10,1),(242,'2023-10-17 06:53:44.343563','203','Routedetails_shift2 object (203)',1,'[{\"added\": {}}]',10,1),(243,'2023-10-17 06:53:54.850050','204','Routedetails_shift2 object (204)',1,'[{\"added\": {}}]',10,1),(244,'2023-10-17 06:54:04.126731','205','Routedetails_shift2 object (205)',1,'[{\"added\": {}}]',10,1),(245,'2023-10-17 06:54:18.703150','206','Routedetails_shift2 object (206)',1,'[{\"added\": {}}]',10,1),(246,'2023-10-17 06:54:27.481886','207','Routedetails_shift2 object (207)',1,'[{\"added\": {}}]',10,1),(247,'2023-10-17 06:54:39.337450','208','Routedetails_shift2 object (208)',1,'[{\"added\": {}}]',10,1),(248,'2023-10-17 06:54:49.578853','209','Routedetails_shift2 object (209)',1,'[{\"added\": {}}]',10,1),(249,'2023-10-17 06:54:57.294753','210','Routedetails_shift2 object (210)',1,'[{\"added\": {}}]',10,1),(250,'2023-10-17 06:55:11.222877','211','Routedetails_shift2 object (211)',1,'[{\"added\": {}}]',10,1),(251,'2023-10-17 06:55:23.322579','212','Routedetails_shift2 object (212)',1,'[{\"added\": {}}]',10,1),(252,'2023-10-17 06:55:31.140666','213','Routedetails_shift2 object (213)',1,'[{\"added\": {}}]',10,1),(253,'2023-10-17 06:55:49.380647','214','Routedetails_shift2 object (214)',1,'[{\"added\": {}}]',10,1),(254,'2023-10-17 06:55:57.664636','215','Routedetails_shift2 object (215)',1,'[{\"added\": {}}]',10,1),(255,'2023-10-17 06:56:16.726391','216','Routedetails_shift2 object (216)',1,'[{\"added\": {}}]',10,1),(256,'2023-10-17 06:56:26.502617','217','Routedetails_shift2 object (217)',1,'[{\"added\": {}}]',10,1),(257,'2023-10-17 06:56:49.586073','218','Routedetails_shift2 object (218)',1,'[{\"added\": {}}]',10,1),(258,'2023-10-17 06:56:56.439479','219','Routedetails_shift2 object (219)',1,'[{\"added\": {}}]',10,1),(259,'2023-10-18 09:38:37.104550','5','hamzasanwala31@gmail.com',3,'',4,1),(260,'2023-10-18 09:39:45.463244','6','hamzasanwala31@gmail.com',3,'',4,1),(261,'2023-10-18 11:10:54.243894','hamzasanwala31@gmail.com','Hamza Sanwala',3,'',11,1),(262,'2023-10-18 11:11:35.327591','7','hamzasanwala31@gmail.com',3,'',4,1),(263,'2023-10-18 11:14:40.428082','8','hamzasanwala31@gmail.com',3,'',4,1),(264,'2023-10-18 11:29:06.601718','9','hamzasanwala31@gmail.com',3,'',4,1),(265,'2023-10-18 14:06:23.989490','10','hamzasanwala31@gmail.com',3,'',4,1),(266,'2023-10-18 19:11:26.770357','14','lnct',3,'',4,1),(267,'2023-11-07 16:16:10.877983','contactkushik@gmail.com','Kushik Sahu',3,'',11,1);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_content_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(5,'contenttypes','contenttype'),(13,'gchalo','adminverification'),(9,'gchalo','bus'),(14,'gchalo','resetpassword'),(7,'gchalo','route'),(8,'gchalo','routedetails_shift1'),(10,'gchalo','routedetails_shift2'),(11,'gchalo','student'),(12,'gchalo','subscribe'),(6,'sessions','session');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_migrations` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2023-10-15 15:15:34.108671'),(2,'auth','0001_initial','2023-10-15 15:15:34.394580'),(3,'admin','0001_initial','2023-10-15 15:15:34.467506'),(4,'admin','0002_logentry_remove_auto_add','2023-10-15 15:15:34.467506'),(5,'admin','0003_logentry_add_action_flag_choices','2023-10-15 15:15:34.476018'),(6,'contenttypes','0002_remove_content_type_name','2023-10-15 15:15:34.532258'),(7,'auth','0002_alter_permission_name_max_length','2023-10-15 15:15:34.612651'),(8,'auth','0003_alter_user_email_max_length','2023-10-15 15:15:34.644951'),(9,'auth','0004_alter_user_username_opts','2023-10-15 15:15:34.658458'),(10,'auth','0005_alter_user_last_login_null','2023-10-15 15:15:34.770682'),(11,'auth','0006_require_contenttypes_0002','2023-10-15 15:15:34.776199'),(12,'auth','0007_alter_validators_add_error_messages','2023-10-15 15:15:34.785710'),(13,'auth','0008_alter_user_username_max_length','2023-10-15 15:15:34.834894'),(14,'auth','0009_alter_user_last_name_max_length','2023-10-15 15:15:34.876414'),(15,'auth','0010_alter_group_name_max_length','2023-10-15 15:15:34.913945'),(16,'auth','0011_update_proxy_permissions','2023-10-15 15:15:34.913945'),(17,'auth','0012_alter_user_first_name_max_length','2023-10-15 15:15:34.961768'),(18,'gchalo','0001_initial','2023-10-15 15:15:35.403740'),(19,'gchalo','0002_alter_route1_time_alter_route10_time_and_more','2023-10-15 15:15:35.624869'),(20,'gchalo','0003_routedetails_delete_route1_delete_route10_and_more','2023-10-15 15:15:35.815349'),(21,'gchalo','0004_delete_bus','2023-10-15 15:15:35.829677'),(22,'gchalo','0005_bus','2023-10-15 15:15:35.835990'),(23,'sessions','0001_initial','2023-10-15 15:15:35.866482'),(24,'gchalo','0006_routedetails_shift2_and_more','2023-10-16 04:59:46.282740'),(25,'gchalo','0007_bus','2023-10-16 05:00:51.098800'),(26,'gchalo','0008_student','2023-10-18 09:37:08.225943'),(27,'gchalo','0009_subscribe','2023-10-18 13:31:46.967649'),(28,'gchalo','0010_delete_subscribe','2023-10-18 14:05:21.516634'),(29,'gchalo','0011_subscribe','2023-10-18 14:06:02.492525'),(30,'gchalo','0012_adminverification','2023-10-18 18:45:38.745986'),(31,'gchalo','0013_delete_adminverification','2023-10-18 19:01:55.387287'),(32,'gchalo','0014_adminverification','2023-10-18 19:02:39.691941'),(33,'gchalo','0015_resetpassword','2023-10-19 18:56:49.836074');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('c2nomos0630ps2a1gk81mi1zkb8d25h8','.eJxVjDsOwjAQBe_iGln-26GkzxmsXa-DA8iW4qRC3J1ESgHtm5n3ZhG2tcSt5yXOxK5Ms8vvhpCeuR6AHlDvjadW12VGfij8pJ2PjfLrdrp_BwV62WscEoRJKDDgUSGRk2ZIxghyVmftEtpgpcdggvMiqzRZDG43lFNAQbLPF-wdN6c:1r0mbJ:WCt4KJxY7T5j2FDr3RDfepIlEcgYaURxsroVeH0T5Ng','2023-11-22 17:44:25.989691'),('iedayny8zcxk08g08pw02pl5810vmbbo','.eJxVjDsOwjAQBe_iGln-26GkzxmsXa-DA8iW4qRC3J1ESgHtm5n3ZhG2tcSt5yXOxK5Ms8vvhpCeuR6AHlDvjadW12VGfij8pJ2PjfLrdrp_BwV62WscEoRJKDDgUSGRk2ZIxghyVmftEtpgpcdggvMiqzRZDG43lFNAQbLPF-wdN6c:1qtnVD:rKRh6I_zdEuSVDadLmTgyI71KI8nsPLDMbyzYmaMwlA','2023-11-03 11:17:15.394580'),('kbgrelli8a40gpivj2rxhvsz7g74wkuy','.eJxVjDsOwjAQBe_iGln-26GkzxmsXa-DA8iW4qRC3J1ESgHtm5n3ZhG2tcSt5yXOxK5Ms8vvhpCeuR6AHlDvjadW12VGfij8pJ2PjfLrdrp_BwV62WscEoRJKDDgUSGRk2ZIxghyVmftEtpgpcdggvMiqzRZDG43lFNAQbLPF-wdN6c:1r0mqU:1235_qcxw4B6FJss3jwdKnsisFcN6E5JP4CExrFuGuA','2023-11-22 18:00:06.329489');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gchalo_adminverification`
--

DROP TABLE IF EXISTS `gchalo_adminverification`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gchalo_adminverification` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `verification_token` varchar(255) NOT NULL,
  `usname_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `gchalo_adminverification_usname_id_be679c99_fk_auth_user_id` (`usname_id`),
  CONSTRAINT `gchalo_adminverification_usname_id_be679c99_fk_auth_user_id` FOREIGN KEY (`usname_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gchalo_adminverification`
--

LOCK TABLES `gchalo_adminverification` WRITE;
/*!40000 ALTER TABLE `gchalo_adminverification` DISABLE KEYS */;
INSERT INTO `gchalo_adminverification` VALUES (6,'f0ee0db6-a9c1-4579-aa12-967bbd0a3a20',26);
/*!40000 ALTER TABLE `gchalo_adminverification` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gchalo_bus`
--

DROP TABLE IF EXISTS `gchalo_bus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gchalo_bus` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `bno` int NOT NULL,
  `rno` int NOT NULL,
  `towards` varchar(20) NOT NULL,
  `shift` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gchalo_bus`
--

LOCK TABLES `gchalo_bus` WRITE;
/*!40000 ALTER TABLE `gchalo_bus` DISABLE KEYS */;
INSERT INTO `gchalo_bus` VALUES (7,7084,1,'College',2),(10,5084,1,'Home',2),(11,4056,1,'Home',1),(13,6067,1,'College',1),(14,8679,1,'College',2),(15,2078,1,'Home',2),(16,6089,2,'College',2),(17,6089,2,'Home',2),(18,4078,3,'College',2),(19,4078,3,'Home',2);
/*!40000 ALTER TABLE `gchalo_bus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gchalo_resetpassword`
--

DROP TABLE IF EXISTS `gchalo_resetpassword`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gchalo_resetpassword` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `reset_token` varchar(200) NOT NULL,
  `usname_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `gchalo_resetpassword_usname_id_e10c8632_fk_auth_user_id` (`usname_id`),
  CONSTRAINT `gchalo_resetpassword_usname_id_e10c8632_fk_auth_user_id` FOREIGN KEY (`usname_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gchalo_resetpassword`
--

LOCK TABLES `gchalo_resetpassword` WRITE;
/*!40000 ALTER TABLE `gchalo_resetpassword` DISABLE KEYS */;
INSERT INTO `gchalo_resetpassword` VALUES (1,'d2e02e8f-93cb-4a2d-8da2-7bf658150cda',11),(5,'232e8ee4-1e1e-44b4-bc83-44a28e74b3b8',3),(10,'7beb9adf-0cb1-4b20-a9ab-dbd3901f466e',3);
/*!40000 ALTER TABLE `gchalo_resetpassword` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gchalo_route`
--

DROP TABLE IF EXISTS `gchalo_route`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gchalo_route` (
  `rno` int NOT NULL,
  `stpt` varchar(50) NOT NULL,
  `ept` varchar(50) NOT NULL,
  PRIMARY KEY (`rno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gchalo_route`
--

LOCK TABLES `gchalo_route` WRITE;
/*!40000 ALTER TABLE `gchalo_route` DISABLE KEYS */;
INSERT INTO `gchalo_route` VALUES (1,'Khanugaon','College'),(2,'Danish','College'),(3,'Baaghsewaniya Police Station','College'),(4,'Amrai','College'),(5,'Railway Colony','College'),(6,'Vidya Sagar College','College'),(7,'Dana Pani','College'),(8,'Jyoti Talkies','College'),(9,'Neelbad','College'),(10,'Geetanjali Complex','College'),(11,'New Sabji Mandi','College'),(12,'Dig','College'),(13,'Coach Factory','College'),(14,'Famous Hotel','College'),(15,'Bharat Talkies','College'),(16,'Bima Hospital','College'),(17,'Piplani','College'),(18,'New Minal','College'),(19,'Shravankanta','College'),(20,'Bhartiya Niketan','College'),(21,'Ayodhya Nagar','College'),(22,'Prakash Nagar','College'),(23,'Ayappa Mandir','College'),(24,'Anand Nagar','College'),(25,'Sehore Bus Stand','College'),(26,'Nayapura Kolad Road','College'),(27,'Sarvdharam','College'),(28,'Obedullah Ganj','College'),(29,'Vidisha City Center','College'),(30,'J.K. Hospital','College');
/*!40000 ALTER TABLE `gchalo_route` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gchalo_routedetails_shift1`
--

DROP TABLE IF EXISTS `gchalo_routedetails_shift1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gchalo_routedetails_shift1` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `rno` int NOT NULL,
  `stop` varchar(50) NOT NULL,
  `time` varchar(8) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=222 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gchalo_routedetails_shift1`
--

LOCK TABLES `gchalo_routedetails_shift1` WRITE;
/*!40000 ALTER TABLE `gchalo_routedetails_shift1` DISABLE KEYS */;
INSERT INTO `gchalo_routedetails_shift1` VALUES (1,1,'Khanugaon','07:35'),(2,1,'Lalghati','07:45'),(3,1,'Koh E Fiza','07:48'),(4,1,'Paripark','07:53'),(5,1,'Shajanabad Pani Tanki','07:55'),(6,1,'Thana','07:57'),(7,1,'Taj Mahal','07:58'),(8,1,'Royal Market','08:00'),(9,1,'Peer Gate','08:02'),(10,1,'Moti Masjid','08:06'),(11,1,'Kamla Park','08:08'),(12,1,'Polytechniq','08:11'),(13,1,'Link Road No. 1','08:14'),(14,1,'College','08:35'),(15,3,'Baaghsewaniya Police Station','07:40'),(16,3,'Raja Bhoj','07:43'),(17,3,'Central Plaza','07:46'),(18,3,'Mount Carmel','07:52'),(19,3,'Rameshwaram','07:55'),(20,3,'Global Park City','07:57'),(21,3,'Spring Valley','07:59'),(22,3,'Signature 360','08:01'),(23,3,'College','08:35'),(26,2,'Danish','07:25'),(27,2,'Akriti Eco City','07:30'),(28,2,'Indus','07:33'),(29,2,'Rohit Nagar','07:35'),(30,2,'Trilanga','07:38'),(31,2,'Aura Mall','07:39'),(32,2,'Shivay Complex','07:41'),(33,2,'1100 Quarters','07:45'),(34,2,'College','08:35'),(35,5,'Railway Colony','07:40'),(36,5,'Shakti Nagar Complex','07:42'),(37,5,'Pnachvati','07:44'),(38,5,'Gulab Garden','07:46'),(39,5,'Higher Secondary Square','07:48'),(40,5,'Piplani','07:53'),(41,5,'College','08:35'),(42,4,'Amrai','07:40'),(43,4,'Bda','07:45'),(44,4,'Sagar Public School','07:47'),(45,4,'Barkheda Pathan','07:50'),(46,4,'Vijay Market','07:52'),(47,4,'Adhaarshila','07:58'),(48,4,'Rishipuram','08:01'),(49,4,'College','08:35'),(50,7,'Dana Pani','07:35'),(51,7,'12 No.','07:40'),(52,7,'Sai Board','07:41'),(53,7,'11 No','07:42'),(54,7,'10.1/2','07:44'),(55,7,'Fracture Hospital','07:46'),(56,7,'Habibganj Naka','07:50'),(57,7,'Narmada Hospital','07:52'),(58,7,'Pragati Petrol Pump','07:55'),(59,7,'College','08:35'),(60,6,'Vidya Sagar College','08:10'),(61,6,'Awadhpuri Chouraha','08:13'),(62,6,'Sos','08:19'),(63,6,'Gopal NAgar','08:21'),(64,6,'College','08:35'),(65,9,'Neelbad','07:15'),(66,9,'Bhadbahada','07:20'),(67,9,'Police Line','07:25'),(68,9,'Depo','07:30'),(69,9,'Jawahar Chowk','07:33'),(70,9,'Rangmahal Chouraha','07:36'),(71,9,'Roshanpura Chouraha','07:38'),(72,9,'Teen Shed','07:40'),(73,9,'Mata Mandir','07:43'),(74,9,'Mata Mandir','07:45'),(75,9,'St Mary','07:47'),(76,9,'5 No Dudh Diary','07:49'),(77,9,'6 No','07:51'),(78,9,'Board office','07:53'),(79,9,'College','08:30'),(80,8,'Jyoti Talkies','08:05'),(81,8,'Chetak Bridge','08:10'),(82,8,'College','08:35'),(83,11,'New Sabji Mandi','07:35'),(84,11,'Ganesh Nagar','07:38'),(85,11,'Foota Maqbara','07:39'),(86,11,'Bus Stand','07:41'),(87,11,'Alpana','07:44'),(88,11,'Sangam Talkies','07:47'),(89,11,'Jaishree Hostel','07:48'),(90,11,'Bajariya Police Station','07:50'),(91,11,'Pushpa Nagar','07:52'),(92,11,'College','08:30'),(93,10,'Geetanjali Complex','07:32'),(94,10,'Pnt','07:35'),(95,10,'Nehru Nagar','07:37'),(96,10,'Kamla Nagar Thana','07:40'),(97,10,'Vaishali Nagar','07:42'),(98,10,'Manit','07:48'),(99,10,'Second Stop Bus No.','07:50'),(100,10,'College','08:35'),(101,13,'Coach factory','07:40'),(102,13,'Dwarka Nagar','07:43'),(103,13,'Railway Station','07:45'),(104,13,'Habibia School','07:46'),(105,13,'Pushpa Nagar','07:48'),(106,13,'College','08:35'),(107,12,'Dig','07:50'),(108,12,'Sindhi Colony','07:52'),(109,12,'Bhopal Talkies','07:55'),(110,12,'Bus Stand','07:58'),(111,12,'Lady Hospital','08:02'),(112,12,'Lily Talkies','08:03'),(113,12,'Zinci','08:06'),(114,12,'Prabhat','08:08'),(115,12,'College','08:35'),(116,15,'Bharat Talkies','08:05'),(117,15,'Barkhedi','08:08'),(118,15,'Capital Petrol Pump','08:10'),(119,15,'Prabhat','08:12'),(120,15,'Apsara','08:14'),(121,15,'Bijli Gate','08:16'),(122,15,'College','08:35'),(123,14,'Famous Hotel','07:50'),(124,14,'Ashoka Garden Thana','07:52'),(125,14,'Dussera Maidan','07:54'),(126,14,'Gopi Hotel','07:56'),(127,14,'Prabhat','07:58'),(128,14,'College','08:35'),(129,17,'Piplani','08:15'),(130,17,'Kalpana Nagar','08:25'),(131,17,'College','08:35'),(132,16,'Bima Hospital','08:15'),(133,16,'College','08:35'),(134,19,'Shravankanta','08:00'),(135,19,'Tea Point(Nizamuddin)','08:02'),(136,19,'Bharat Nagar','08:04'),(137,19,'College','08:35'),(138,18,'New Minal','07:55'),(139,18,'Minal','07:57'),(140,18,'J.K. Road','08:00'),(141,18,'Sankriti Hostel','08:15'),(142,18,'College','08:35'),(143,21,'Ayodhya Nagar','08:00'),(144,21,'Narela Jod','08:15'),(145,21,'Rajiv Nagar','08:17'),(146,21,'Tanatan Dhaba','08:17'),(147,21,'Prakash nagar','08:19'),(148,21,'College','08:35'),(149,20,'Bhartiya Niketan','07:55'),(150,20,'Gautam Nagar','07:55'),(151,20,'Rachna Nagar','07:58'),(152,20,'Subhas Nagar Fatak','08:00'),(153,20,'Prabhat','08:02'),(154,20,'College','08:35'),(155,23,'Ayappa Mandir','07:30'),(156,23,'Gandhi Nagar','07:40'),(157,23,'Asharam Bapu Chouraha','07:45'),(158,23,'Karond','07:55'),(159,23,'Peoples Hospital','07:58'),(160,23,'Bhanpur','08:00'),(161,23,'Sagar Estate','08:03'),(162,23,'Ayodhya Nagar','08:05'),(163,23,'College','08:35'),(164,22,'Prakash Nagar','08:05'),(165,22,'Sabji Mandi','08:07'),(166,22,'Sidhartha Lake','08:12'),(167,22,'Patel nagar','08:17'),(168,22,'College','08:35'),(169,25,'Sehore Bus Stand','07:00'),(170,25,'Bairagarh','07:30'),(171,25,'Lalghati','07:40'),(172,25,'Panchvati','07:43'),(173,25,'Data Colony','07:46'),(174,25,'Asharam Bapu Chouraha','07:50'),(175,25,'Rajiv Gandhi','07:55'),(176,25,'Karond','08:00'),(177,25,'College','08:35'),(178,24,'Anand Nagar','08:20'),(179,24,'Sidhartha Lake','08:22'),(180,24,'Patel Nagar','08:24'),(181,24,'College','08:35'),(182,27,'Sarvsharam','07:40'),(183,27,'Kala Mata mandir(Chunabhatti)','07:44'),(184,27,'Suyash Hospital','07:47'),(185,27,'Petrol Pump','07:50'),(186,27,'Kolar Guest House','07:55'),(187,27,'Akshay Hospital','07:57'),(188,27,'Char Imli Tiraha','07:59'),(189,27,'College','08:35'),(190,26,'Nayapura Kola Road','07:30'),(191,26,'Banjari','07:35'),(192,26,'Bimakunj','07:37'),(193,26,'Shalimar','07:40'),(194,26,'Bansal Hospital','07:42'),(195,26,'Manisha','07:44'),(196,26,'Shaitan Singh Chouraha','07:45'),(197,26,'1100 Quarters','07:47'),(198,26,'E-7','07:49'),(199,26,'7 No','07:51'),(200,26,'Parul Hospital','07:53'),(201,26,'Board Office Chouraha','07:55'),(202,26,'College','08:35'),(203,29,'Vidisha City Center','06:55'),(204,29,'Raisen','07:35'),(205,29,'College','08:35'),(206,28,'Obedullah Ganj','07:10'),(207,28,'Mandideep','07:30'),(208,28,'Samardha','07:35'),(209,28,'11 Mile','07:38'),(210,28,'Misrod','07:42'),(211,28,'Vidya Nagar','07:45'),(212,28,'Bagh Sewaniya','07:47'),(213,28,'College','08:35'),(214,30,'J.K. Hospital','07:35'),(215,30,'Bima Kunj','07:40'),(216,30,'Bansal Hospital','07:50'),(217,30,'Manisha Market','07:52'),(218,30,'Banskhedi','08:00'),(219,30,'College','08:35');
/*!40000 ALTER TABLE `gchalo_routedetails_shift1` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gchalo_routedetails_shift2`
--

DROP TABLE IF EXISTS `gchalo_routedetails_shift2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gchalo_routedetails_shift2` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `rno` int NOT NULL,
  `stop` varchar(50) NOT NULL,
  `time` varchar(8) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=251 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gchalo_routedetails_shift2`
--

LOCK TABLES `gchalo_routedetails_shift2` WRITE;
/*!40000 ALTER TABLE `gchalo_routedetails_shift2` DISABLE KEYS */;
INSERT INTO `gchalo_routedetails_shift2` VALUES (1,1,'Khanugaon','09:10'),(2,1,'Lalghati','09:20'),(3,1,'Koh E Fiza','09:23'),(4,1,'Paripark','09:28'),(5,1,'Shajanabad Pani Tanki','09:30'),(6,1,'Thana','09:32'),(7,1,'Taj Mahal','09:33'),(8,1,'Royal Market','09:35'),(9,1,'Peer Gate','09:37'),(10,1,'Moti Masjid ','09:41'),(11,1,'Kamla Park','09:43'),(12,1,'Polytechniq','09:46'),(13,1,'Link Road No. 1','09:49'),(14,1,'College','10:10'),(15,3,'Baaghsewaniya Police Station','09:15'),(16,3,'Raja Bhoj','09:18'),(17,3,'Central Plaza','09:21'),(18,3,'Mount Carmel','09:27'),(19,3,'Rameshwaram','09:30'),(20,3,'Global Park City','09:32'),(21,3,'Spring Valley','09:34'),(22,3,'Signature 360','09:36'),(23,3,'College','10:10'),(26,2,'Danish','09:10'),(27,2,'Akriti Eco City','09:15'),(28,2,'Indus','09:18'),(29,2,'Rohit Nagar','09:20'),(30,2,'Trilanga','09:23'),(31,2,'Aura Mall','09:24'),(32,2,'Shivay Complex','09:26'),(33,2,'1100 Quarters','09:30'),(34,2,'College','10:10'),(35,5,'Railway Colony','09:15'),(36,5,'Shakti Nagar Complex','09:17'),(37,5,'Pnachvati','09:19'),(38,5,'Gulab Garden','09:21'),(39,5,'Higher Secondary Square','09:23'),(40,5,'Piplani','09:28'),(41,5,'College','10:10'),(42,4,'Amrai','09:15'),(43,4,'Bda','09:20'),(44,4,'Sagar Public School','09:22'),(45,4,'Barkheda Pathan','09:25'),(46,4,'Vijay Market','09:27'),(47,4,'Adhaarshila','09:33'),(48,4,'Rishipuram','09:36'),(49,4,'College','10:10'),(50,7,'Dana Pani','09:10'),(51,7,'12 No.','09:15'),(52,7,'Sai Board','09:16'),(53,7,'11 No','09:17'),(54,7,'10.1/2','09:19'),(55,7,'Fracture Hospital','09:21'),(56,7,'Habibganj Naka','09:25'),(57,7,'Narmada Hospital','09:27'),(58,7,'Pragati Petrol Pump','09:30'),(59,7,'College','10:10'),(60,6,'Vidya Sagar College','09:45'),(61,6,'Awadhpuri Chouraha','09:48'),(62,6,'Sos','09:54'),(63,6,'Gopal NAgar','09:56'),(64,6,'College','10:10'),(65,9,'Neelbad','08:50'),(66,9,'Bhadbahada','08:55'),(67,9,'Police Line','09:00'),(68,9,'Depo','09:05'),(69,9,'Jawahar Chowk','09:08'),(70,9,'Rangmahal Chouraha','09:11'),(71,9,'Roshanpura Chouraha','09:13'),(72,9,'Teen Shed','09:15'),(73,9,'Mata Mandir','09:18'),(74,9,'Mata Mandir','09:20'),(75,9,'St Mary','09:22'),(76,9,'5 No Dudh Diary','09:24'),(77,9,'6 No','09:26'),(78,9,'Board office','09:28'),(79,9,'College','10:05'),(80,8,'Jyoti Talkies','09:40'),(81,8,'Chetak Bridge','09:45'),(82,8,'College','10:10'),(83,11,'New Sabji Mandi','09:10'),(84,11,'Ganesh Nagar','09:13'),(85,11,'Foota Maqbara','09:14'),(86,11,'Bus Stand','09:16'),(87,11,'Alpana','09:19'),(88,11,'Sangam Talkies','09:22'),(89,11,'Jaishree Hostel','09:23'),(90,11,'Bajariya Police Station','09:25'),(91,11,'Pushpa Nagar','09:27'),(92,11,'College','10:05'),(93,10,'Geetanjali Complex','09:07'),(94,10,'Pnt','09:10'),(95,10,'Nehru Nagar','09:12'),(96,10,'Kamla Nagar Thana','09:15'),(97,10,'Vaishali Nagar','09:17'),(98,10,'Manit','09:23'),(99,10,'Second Stop Bus No.','09:25'),(100,10,'College','10:10'),(101,13,'Coach factory','09:15'),(102,13,'Dwarka Nagar','09:18'),(103,13,'Railway Station','09:20'),(104,13,'Habibia School','09:21'),(105,13,'Pushpa Nagar','09:23'),(106,13,'College','10:10'),(107,12,'Dig','09:25'),(108,12,'Sindhi Colony','09:27'),(109,12,'Bhopal Talkies','09:30'),(110,12,'Bus Stand','09:33'),(111,12,'Lady Hospital','09:37'),(112,12,'Lily Talkies','09:38'),(113,12,'Zinci','09:41'),(114,12,'Prabhat','09:43'),(115,12,'College','10:10'),(116,15,'Bharat Talkies','09:40'),(117,15,'Barkhedi','09:43'),(118,15,'Capital Petrol Pump','09:45'),(119,15,'Prabhat','09:47'),(120,15,'Apsara','09:49'),(121,15,'Bijli Gate','09:51'),(122,15,'College','10:10'),(123,14,'Famous Hotel','09:25'),(124,14,'Ashoka Garden Thana','09:27'),(125,14,'Dussera Maidan','09:29'),(126,14,'Gopi Hotel','09:31'),(127,14,'Prabhat','09:33'),(128,14,'College','10:10'),(129,17,'Piplani','09:50'),(130,17,'Kalpana Nagar','09:52'),(131,17,'College','10:10'),(132,16,'Bima Hospital','09:50'),(133,16,'College','10:10'),(134,19,'Shravankanta','09:35'),(135,19,'Tea Point(Nizamuddin)','09:37'),(136,19,'Bharat Nagar','09:39'),(137,19,'College','10:10'),(138,18,'New Minal','09:30'),(139,18,'Minal','09:32'),(140,18,'J.K. Road','09:35'),(141,18,'Sankriti Hostel','09:50'),(142,18,'College','10:10'),(143,21,'Ayodhya Nagar','09:45'),(144,21,'Narela Jod','09:50'),(145,21,'Rajiv Nagar','09:52'),(146,21,'Tanatan Dhaba','09:52'),(147,21,'Prakash nagar','09:54'),(148,21,'College','10:10'),(149,20,'Bhartiya Niketan','09:30'),(150,20,'Gautam Nagar','09:30'),(151,20,'Rachna Nagar','09:33'),(152,20,'Subhas Nagar Fatak','09:35'),(153,20,'Prabhat','09:37'),(154,20,'College','10:10'),(155,23,'Ayappa Mandir','09:05'),(156,23,'Gandhi Nagar','09:15'),(157,23,'Asharam Bapu Chouraha','09:20'),(158,23,'Karond','09:30'),(159,23,'Peoples Hospital','09:33'),(160,23,'Bhanpur','09:35'),(161,23,'Sagar Estate','09:38'),(162,23,'Ayodhya Nagar','09:40'),(163,23,'College','10:10'),(164,22,'Prakash Nagar','09:40'),(165,22,'Sabji Mandi','09:42'),(166,22,'Sidhartha Lake','09:47'),(167,22,'Patel nagar','09:52'),(168,22,'College','10:10'),(169,25,'Sehore Bus Stand','08:35'),(170,25,'Bairagarh','09:05'),(171,25,'Lalghati','09:15'),(172,25,'Panchvati','09:18'),(173,25,'Data Colony','09:21'),(174,25,'Asharam Bapu Chouraha','09:25'),(175,25,'Rajiv Gandhi','09:30'),(176,25,'Karond','09:35'),(177,25,'College','10:10'),(178,24,'Anand Nagar','09:55'),(179,24,'Sidhartha Lake','09:57'),(180,24,'Patel Nagar','09:59'),(181,24,'College','10:10'),(182,27,'Sarvsharam','09:15'),(183,27,'Kala Mata mandir(Chunabhatti)','09:19'),(184,27,'Suyash Hospital','09:22'),(185,27,'Petrol Pump','09:25'),(186,27,'Kolar Guest House','09:30'),(187,27,'Akshay Hospital','09:32'),(188,27,'Char Imli Tiraha','09:34'),(189,27,'College','10:10'),(190,26,'Nayapura Kola Road','09:05'),(191,26,'Banjari','09:10'),(192,26,'Bimakunj','09:12'),(193,26,'Shalimar','09:15'),(194,26,'Bansal Hospital','09:17'),(195,26,'Manisha','09:19'),(196,26,'Shaitan Singh Chouraha','09:20'),(197,26,'1100 Quarters','09:22'),(198,26,'E-7','09:24'),(199,26,'7 No','09:26'),(200,26,'Parul Hospital','09:28'),(201,26,'Board Office Chouraha','09:30'),(202,26,'College','10:10'),(203,29,'Vidisha City Center','08:35'),(204,29,'Raisen','09:05'),(205,29,'College','10:10'),(206,28,'Obedullah Ganj','08:45'),(207,28,'Mandideep','09:05'),(208,28,'Samardha','09:10'),(209,28,'11 Mile','09:13'),(210,28,'Misrod','09:17'),(211,28,'Vidya Nagar','09:20'),(212,28,'Bagh Sewaniya','09:22'),(213,28,'College','10:10'),(214,30,'J.K. Hospital','09:10'),(215,30,'Bima Kunj','09:15'),(216,30,'Bansal Hospital','09:25'),(217,30,'Manisha Market','09:27'),(218,30,'Banskhedi','09:35'),(219,30,'College','10:10');
/*!40000 ALTER TABLE `gchalo_routedetails_shift2` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gchalo_student`
--

DROP TABLE IF EXISTS `gchalo_student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gchalo_student` (
  `name` varchar(50) NOT NULL,
  `email` varchar(254) NOT NULL,
  `college` varchar(10) NOT NULL,
  `verification_token` varchar(255) NOT NULL,
  `stname_id` int NOT NULL,
  PRIMARY KEY (`email`),
  KEY `gchalo_student_stname_id_f4d43b37_fk_auth_user_id` (`stname_id`),
  CONSTRAINT `gchalo_student_stname_id_f4d43b37_fk_auth_user_id` FOREIGN KEY (`stname_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gchalo_student`
--

LOCK TABLES `gchalo_student` WRITE;
/*!40000 ALTER TABLE `gchalo_student` DISABLE KEYS */;
INSERT INTO `gchalo_student` VALUES ('Aditi Anand','aditianand1112@gmail.com','Lnct','',19),('Hakimuddin Sanwala','hakimuddinsanwala52@gmail.com','LnctE','',22),('Idris Sanwala','hamzamovies31@gmail.com','LnctE','',18),('Hamza Sanwala','hamzasanwala31@gmail.com','Lnct','',11),('Hatim Sanwala','hatimsanwala10@gmail.com','Lnct','',23),('Kushik Sahus','kushiksahu51@gmail.com','Lnct','',24),('Hitesh Meena','meenahitesh253@gmail.com','Lnct','',13),('Himanshu Bankey','www.himanshubankey@gmail.com','Lnct','',17),('Zainab Sanwala','zainabsanwala52@gmail.com','Lnct','',21);
/*!40000 ALTER TABLE `gchalo_student` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gchalo_subscribe`
--

DROP TABLE IF EXISTS `gchalo_subscribe`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gchalo_subscribe` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `contact` varchar(10) NOT NULL,
  `rno` int NOT NULL,
  `shift` int NOT NULL,
  `stname_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `gchalo_subscribe_stname_id_cb78a63b_fk_auth_user_id` (`stname_id`),
  CONSTRAINT `gchalo_subscribe_stname_id_cb78a63b_fk_auth_user_id` FOREIGN KEY (`stname_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gchalo_subscribe`
--

LOCK TABLES `gchalo_subscribe` WRITE;
/*!40000 ALTER TABLE `gchalo_subscribe` DISABLE KEYS */;
INSERT INTO `gchalo_subscribe` VALUES (3,'7809785645',25,2,12),(7,'9425928784',1,1,21),(8,'9425085727',1,2,22),(9,'8103932153',1,2,23),(10,'7692807755',1,2,24),(11,'9424428796',1,2,11);
/*!40000 ALTER TABLE `gchalo_subscribe` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-11-08 23:34:44
