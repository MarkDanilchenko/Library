-- MySQL dump 10.13  Distrib 8.0.33, for macos13.3 (arm64)
--
-- Host: localhost    Database: Library
-- ------------------------------------------------------
-- Server version	8.0.33

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
INSERT INTO `auth_group` VALUES (2,'Library admins'),(1,'Library members'),(3,'Library workers');
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
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
INSERT INTO `auth_group_permissions` VALUES (1,1,24),(2,1,32),(4,2,21),(5,2,22),(6,2,23),(7,2,24),(8,2,26),(9,2,27),(10,2,28),(11,2,29),(12,2,30),(13,2,31),(3,2,32),(14,3,24),(16,3,28),(15,3,32);
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
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add content type',4,'add_contenttype'),(14,'Can change content type',4,'change_contenttype'),(15,'Can delete content type',4,'delete_contenttype'),(16,'Can view content type',4,'view_contenttype'),(17,'Can add session',5,'add_session'),(18,'Can change session',5,'change_session'),(19,'Can delete session',5,'delete_session'),(20,'Can view session',5,'view_session'),(21,'Can add book',6,'add_book'),(22,'Can change book',6,'change_book'),(23,'Can delete book',6,'delete_book'),(24,'Can view book',6,'view_book'),(25,'Can add user',7,'add_customuser'),(26,'Can change user',7,'change_customuser'),(27,'Can delete user',7,'delete_customuser'),(28,'Can view user',7,'view_customuser'),(29,'Can add book instance',8,'add_bookinstance'),(30,'Can change book instance',8,'change_bookinstance'),(31,'Can delete book instance',8,'delete_bookinstance'),(32,'Can view book instance',8,'view_bookinstance');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
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
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_Library__main_customuser_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_Library__main_customuser_id` FOREIGN KEY (`user_id`) REFERENCES `Library__main_customuser` (`id`),
  CONSTRAINT `django_admin_log_chk_1` CHECK ((`action_flag` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2023-10-25 11:35:53.363758','1','Library members',1,'[{\"added\": {}}]',3,1),(2,'2023-10-25 11:51:21.485223','1','Library members',2,'[]',3,1),(3,'2023-10-25 11:52:05.542194','2','Library admins',1,'[{\"added\": {}}]',3,1),(4,'2023-10-25 11:52:58.249396','3','Library workers',1,'[{\"added\": {}}]',3,1);
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
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'contenttypes','contenttype'),(6,'Library__main','book'),(8,'Library__main','bookinstance'),(7,'Library__main','customuser'),(5,'sessions','session');
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
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2023-10-25 11:25:44.923007'),(2,'contenttypes','0002_remove_content_type_name','2023-10-25 11:25:44.934913'),(3,'auth','0001_initial','2023-10-25 11:25:44.975866'),(4,'auth','0002_alter_permission_name_max_length','2023-10-25 11:25:44.986467'),(5,'auth','0003_alter_user_email_max_length','2023-10-25 11:25:44.988800'),(6,'auth','0004_alter_user_username_opts','2023-10-25 11:25:44.992033'),(7,'auth','0005_alter_user_last_login_null','2023-10-25 11:25:44.994489'),(8,'auth','0006_require_contenttypes_0002','2023-10-25 11:25:44.995264'),(9,'auth','0007_alter_validators_add_error_messages','2023-10-25 11:25:44.997423'),(10,'auth','0008_alter_user_username_max_length','2023-10-25 11:25:44.999596'),(11,'auth','0009_alter_user_last_name_max_length','2023-10-25 11:25:45.001705'),(12,'auth','0010_alter_group_name_max_length','2023-10-25 11:25:45.005912'),(13,'auth','0011_update_proxy_permissions','2023-10-25 11:25:45.008450'),(14,'auth','0012_alter_user_first_name_max_length','2023-10-25 11:25:45.010571'),(15,'Library__main','0001_initial','2023-10-25 11:25:45.059008'),(16,'Library__main','0002_alter_customuser_phone','2023-10-25 11:25:45.062013'),(17,'Library__main','0003_alter_book_options_bookinstance','2023-10-25 11:25:45.085017'),(18,'Library__main','0004_alter_book_year_published_alter_customuser_phone','2023-10-25 11:25:45.090679'),(19,'Library__main','0005_alter_book_description','2023-10-25 11:25:45.092666'),(20,'Library__main','0006_alter_bookinstance_due_back_and_more','2023-10-25 11:25:45.103389'),(21,'Library__main','0007_remove_bookinstance_status_alter_bookinstance_id','2023-10-25 11:25:45.117700'),(22,'Library__main','0008_book_status','2023-10-25 11:25:45.128654'),(23,'admin','0001_initial','2023-10-25 11:25:45.155825'),(24,'admin','0002_logentry_remove_auto_add','2023-10-25 11:25:45.159415'),(25,'admin','0003_logentry_add_action_flag_choices','2023-10-25 11:25:45.164132'),(26,'sessions','0001_initial','2023-10-25 11:25:45.170654');
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
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Library__main_book`
--

DROP TABLE IF EXISTS `Library__main_book`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Library__main_book` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL,
  `description` longtext NOT NULL,
  `author` varchar(100) NOT NULL,
  `year_published` int NOT NULL,
  `genre` varchar(100) NOT NULL,
  `publisher` varchar(100) NOT NULL,
  `status` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Library__main_book`
--

LOCK TABLES `Library__main_book` WRITE;
/*!40000 ALTER TABLE `Library__main_book` DISABLE KEYS */;
/*!40000 ALTER TABLE `Library__main_book` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Library__main_bookinstance`
--

DROP TABLE IF EXISTS `Library__main_bookinstance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Library__main_bookinstance` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `due_back` date NOT NULL,
  `book_id` bigint DEFAULT NULL,
  `user_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `Library__main_bookin_book_id_ec1f9f40_fk_Library__` (`book_id`),
  KEY `Library__main_bookin_user_id_43db5cad_fk_Library__` (`user_id`),
  CONSTRAINT `Library__main_bookin_book_id_ec1f9f40_fk_Library__` FOREIGN KEY (`book_id`) REFERENCES `Library__main_book` (`id`),
  CONSTRAINT `Library__main_bookin_user_id_43db5cad_fk_Library__` FOREIGN KEY (`user_id`) REFERENCES `Library__main_customuser` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Library__main_bookinstance`
--

LOCK TABLES `Library__main_bookinstance` WRITE;
/*!40000 ALTER TABLE `Library__main_bookinstance` DISABLE KEYS */;
/*!40000 ALTER TABLE `Library__main_bookinstance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Library__main_customuser`
--

DROP TABLE IF EXISTS `Library__main_customuser`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Library__main_customuser` (
  `id` bigint NOT NULL AUTO_INCREMENT,
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
  `phone` varchar(12) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Library__main_customuser`
--

LOCK TABLES `Library__main_customuser` WRITE;
/*!40000 ALTER TABLE `Library__main_customuser` DISABLE KEYS */;
INSERT INTO `Library__main_customuser` VALUES (1,'pbkdf2_sha256$600000$tsQCk4eePz3ZEmAjf1wBZz$D4mtWxXOpP8atqQ07E02F/KdBscUldIWwOYC87gKzBQ=','2023-10-25 11:34:41.013815',1,'admin','','','',1,1,'2023-10-25 11:33:39.502192','');
/*!40000 ALTER TABLE `Library__main_customuser` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Library__main_customuser_groups`
--

DROP TABLE IF EXISTS `Library__main_customuser_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Library__main_customuser_groups` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `customuser_id` bigint NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `Library__main_customuser_customuser_id_group_id_a19a78f7_uniq` (`customuser_id`,`group_id`),
  KEY `Library__main_custom_group_id_ffd28a32_fk_auth_grou` (`group_id`),
  CONSTRAINT `Library__main_custom_customuser_id_c6f8b323_fk_Library__` FOREIGN KEY (`customuser_id`) REFERENCES `Library__main_customuser` (`id`),
  CONSTRAINT `Library__main_custom_group_id_ffd28a32_fk_auth_grou` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Library__main_customuser_groups`
--

LOCK TABLES `Library__main_customuser_groups` WRITE;
/*!40000 ALTER TABLE `Library__main_customuser_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `Library__main_customuser_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Library__main_customuser_user_permissions`
--

DROP TABLE IF EXISTS `Library__main_customuser_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Library__main_customuser_user_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `customuser_id` bigint NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `Library__main_customuser_customuser_id_permission_9951ad10_uniq` (`customuser_id`,`permission_id`),
  KEY `Library__main_custom_permission_id_2800b4b8_fk_auth_perm` (`permission_id`),
  CONSTRAINT `Library__main_custom_customuser_id_c535fcd9_fk_Library__` FOREIGN KEY (`customuser_id`) REFERENCES `Library__main_customuser` (`id`),
  CONSTRAINT `Library__main_custom_permission_id_2800b4b8_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Library__main_customuser_user_permissions`
--

LOCK TABLES `Library__main_customuser_user_permissions` WRITE;
/*!40000 ALTER TABLE `Library__main_customuser_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `Library__main_customuser_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-10-25 15:04:32
