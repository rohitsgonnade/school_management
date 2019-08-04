-- MySQL dump 10.13  Distrib 5.7.26, for Linux (x86_64)
--
-- Host: localhost    Database: school_management
-- ------------------------------------------------------
-- Server version	5.7.26-0ubuntu0.16.04.1

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
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add group',2,'add_group'),(6,'Can change group',2,'change_group'),(7,'Can delete group',2,'delete_group'),(8,'Can view group',2,'view_group'),(9,'Can add permission',3,'add_permission'),(10,'Can change permission',3,'change_permission'),(11,'Can delete permission',3,'delete_permission'),(12,'Can view permission',3,'view_permission'),(13,'Can add content type',4,'add_contenttype'),(14,'Can change content type',4,'change_contenttype'),(15,'Can delete content type',4,'delete_contenttype'),(16,'Can view content type',4,'view_contenttype'),(17,'Can add session',5,'add_session'),(18,'Can change session',5,'change_session'),(19,'Can delete session',5,'delete_session'),(20,'Can view session',5,'view_session'),(21,'Can add user',6,'add_user'),(22,'Can change user',6,'change_user'),(23,'Can delete user',6,'delete_user'),(24,'Can view user',6,'view_user'),(25,'Can add subject',8,'add_subject'),(26,'Can change subject',8,'change_subject'),(27,'Can delete subject',8,'delete_subject'),(28,'Can view subject',8,'view_subject'),(29,'Can add department',7,'add_department'),(30,'Can change department',7,'change_department'),(31,'Can delete department',7,'delete_department'),(32,'Can view department',7,'view_department'),(33,'Can add courses',9,'add_courses'),(34,'Can change courses',9,'change_courses'),(35,'Can delete courses',9,'delete_courses'),(36,'Can view courses',9,'view_courses'),(37,'Can add parent profile',13,'add_parentprofile'),(38,'Can change parent profile',13,'change_parentprofile'),(39,'Can delete parent profile',13,'delete_parentprofile'),(40,'Can view parent profile',13,'view_parentprofile'),(41,'Can add teacher_ subject',10,'add_teacher_subject'),(42,'Can change teacher_ subject',10,'change_teacher_subject'),(43,'Can delete teacher_ subject',10,'delete_teacher_subject'),(44,'Can view teacher_ subject',10,'view_teacher_subject'),(45,'Can add student_ subject',14,'add_student_subject'),(46,'Can change student_ subject',14,'change_student_subject'),(47,'Can delete student_ subject',14,'delete_student_subject'),(48,'Can view student_ subject',14,'view_student_subject'),(49,'Can add teacher profile',11,'add_teacherprofile'),(50,'Can change teacher profile',11,'change_teacherprofile'),(51,'Can delete teacher profile',11,'delete_teacherprofile'),(52,'Can view teacher profile',11,'view_teacherprofile'),(53,'Can add student profile',12,'add_studentprofile'),(54,'Can change student profile',12,'change_studentprofile'),(55,'Can delete student profile',12,'delete_studentprofile'),(56,'Can view student profile',12,'view_studentprofile');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_users_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_users_user_id` FOREIGN KEY (`user_id`) REFERENCES `users_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2019-07-31 11:36:21.180988','1','t:rohit ',2,'[{\"changed\": {\"fields\": [\"first_name\", \"role\"]}}]',6,1),(2,'2019-07-31 11:37:02.510090','2','s:Rohit Gonnade',1,'[{\"added\": {}}]',6,1),(3,'2019-07-31 11:40:23.084444','2','s:Rohit Gonnade',3,'',6,1),(4,'2019-07-31 11:51:10.308773','3','s:Rohit Gonnade',2,'[{\"changed\": {\"fields\": [\"first_name\", \"last_name\", \"role\"]}}]',6,1),(5,'2019-07-31 11:52:49.433117','3','s:Rohit Gonnade',3,'',6,1),(6,'2019-07-31 12:08:54.365614','4','s:Rohit Gonnade',2,'[{\"changed\": {\"fields\": [\"first_name\", \"last_name\", \"email\", \"role\"]}}]',6,1),(7,'2019-07-31 12:08:59.114761','4','s:Rohit Gonnade',2,'[]',6,1),(8,'2019-07-31 12:09:15.861989','14','t:Abhijit Mane',2,'[{\"changed\": {\"fields\": [\"first_name\", \"last_name\", \"email\", \"role\"]}}]',6,1),(9,'2019-07-31 12:09:34.442005','13','t:Suraj Malpure',2,'[{\"changed\": {\"fields\": [\"first_name\", \"last_name\", \"email\", \"role\"]}}]',6,1),(10,'2019-07-31 12:10:09.549675','12','t:Palak Valeja',2,'[{\"changed\": {\"fields\": [\"first_name\", \"last_name\", \"email\", \"role\"]}}]',6,1),(11,'2019-07-31 12:10:27.509823','11','t:Abdullah Ansari',2,'[{\"changed\": {\"fields\": [\"first_name\", \"last_name\", \"email\", \"role\"]}}]',6,1),(12,'2019-07-31 12:10:47.266765','10','p:Narendra Gonnade',2,'[{\"changed\": {\"fields\": [\"first_name\", \"last_name\", \"email\", \"role\"]}}]',6,1),(13,'2019-07-31 12:11:06.909454','9','p:Prashant Sutane',2,'[{\"changed\": {\"fields\": [\"first_name\", \"last_name\", \"email\", \"role\"]}}]',6,1),(14,'2019-07-31 12:11:31.036403','8','p:Sharad Gonnade',2,'[{\"changed\": {\"fields\": [\"first_name\", \"last_name\", \"email\", \"role\"]}}]',6,1),(15,'2019-07-31 12:11:46.739376','7','s:Sameer Sutane',2,'[{\"changed\": {\"fields\": [\"first_name\", \"last_name\", \"email\", \"role\"]}}]',6,1),(16,'2019-07-31 12:12:05.268505','6','s:Wrushabh Gonnade',2,'[{\"changed\": {\"fields\": [\"first_name\", \"last_name\", \"email\", \"role\"]}}]',6,1),(17,'2019-07-31 12:12:05.451464','6','s:Wrushabh Gonnade',2,'[]',6,1),(18,'2019-07-31 12:12:40.501459','5','s:Prachi Sutane',2,'[{\"changed\": {\"fields\": [\"first_name\", \"last_name\", \"email\", \"role\"]}}]',6,1),(19,'2019-07-31 12:17:49.460694','7','Sameer Sutane',3,'',13,1),(20,'2019-07-31 12:17:49.599190','6','Wrushabh Gonnade',3,'',13,1),(21,'2019-07-31 12:18:05.808065','9','Prashant Sutane',1,'[{\"added\": {}}]',13,1),(22,'2019-07-31 12:18:15.585206','10','Narendra Gonnade',1,'[{\"added\": {}}]',13,1),(23,'2019-07-31 12:18:32.527137','4','4 Rohit Gonnade',1,'[{\"added\": {}}]',12,1),(24,'2019-07-31 12:18:42.798162','5','5 Prachi Sutane',1,'[{\"added\": {}}]',12,1),(25,'2019-07-31 12:18:58.645489','6','6 Wrushabh Gonnade',1,'[{\"added\": {}}]',12,1),(26,'2019-07-31 12:19:10.940882','7','7 Sameer Sutane',1,'[{\"added\": {}}]',12,1),(27,'2019-07-31 12:19:22.224307','11','Abdullah Ansari',1,'[{\"added\": {}}]',11,1),(28,'2019-07-31 12:19:28.967323','12','Palak Valeja',1,'[{\"added\": {}}]',11,1),(29,'2019-07-31 12:19:33.402570','13','Suraj Malpure',1,'[{\"added\": {}}]',11,1),(30,'2019-07-31 12:19:39.025352','14','Abhijit Mane',1,'[{\"added\": {}}]',11,1),(31,'2019-07-31 12:20:12.087372','1','4 Rohit Gonnade BSC_CS_101 : C Programming',1,'[{\"added\": {}}]',14,1),(32,'2019-07-31 12:20:18.378006','2','5 Prachi Sutane BSC_CS_101 : C Programming',1,'[{\"added\": {}}]',14,1),(33,'2019-07-31 12:20:24.389553','3','4 Rohit Gonnade BSC_CS_102 : Parallel Programming',1,'[{\"added\": {}}]',14,1),(34,'2019-07-31 12:20:28.381832','4','5 Prachi Sutane BSC_CS_102 : Parallel Programming',1,'[{\"added\": {}}]',14,1),(35,'2019-07-31 12:20:34.306121','5','6 Wrushabh Gonnade BSC_chem_101 : Molecular Structure',1,'[{\"added\": {}}]',14,1),(36,'2019-07-31 12:20:38.738517','6','6 Wrushabh Gonnade BSC_chem_102 : Aldehydes',1,'[{\"added\": {}}]',14,1),(37,'2019-07-31 12:20:49.346261','7','7 Sameer Sutane Eng_IT_101 : Computer Architecture',1,'[{\"added\": {}}]',14,1),(38,'2019-07-31 12:20:54.143049','8','7 Sameer Sutane Eng_IT_102 : C Programming',1,'[{\"added\": {}}]',14,1),(39,'2019-07-31 12:21:03.915299','1','Abdullah Ansari BSC_CS_101 : C Programming',1,'[{\"added\": {}}]',10,1),(40,'2019-07-31 12:21:09.159101','2','Suraj Malpure BSC_CS_102 : Parallel Programming',1,'[{\"added\": {}}]',10,1),(41,'2019-07-31 12:21:14.530108','3','Palak Valeja Eng_IT_101 : Computer Architecture',1,'[{\"added\": {}}]',10,1),(42,'2019-07-31 12:21:19.284744','4','Palak Valeja Eng_IT_102 : C Programming',1,'[{\"added\": {}}]',10,1),(43,'2019-07-31 12:21:29.507153','5','Abdullah Ansari BSC_chem_101 : Molecular Structure',1,'[{\"added\": {}}]',10,1),(44,'2019-07-31 12:21:37.492183','6','Abhijit Mane BSC_chem_102 : Aldehydes',1,'[{\"added\": {}}]',10,1);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(2,'auth','group'),(3,'auth','permission'),(4,'contenttypes','contenttype'),(9,'school_data','courses'),(7,'school_data','department'),(8,'school_data','subject'),(5,'sessions','session'),(13,'users','parentprofile'),(12,'users','studentprofile'),(14,'users','student_subject'),(11,'users','teacherprofile'),(10,'users','teacher_subject'),(6,'users','user');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2019-07-31 11:33:27.301519'),(2,'contenttypes','0002_remove_content_type_name','2019-07-31 11:33:28.304139'),(3,'auth','0001_initial','2019-07-31 11:33:29.298580'),(4,'auth','0002_alter_permission_name_max_length','2019-07-31 11:33:32.066808'),(5,'auth','0003_alter_user_email_max_length','2019-07-31 11:33:32.111864'),(6,'auth','0004_alter_user_username_opts','2019-07-31 11:33:32.157650'),(7,'auth','0005_alter_user_last_login_null','2019-07-31 11:33:32.201095'),(8,'auth','0006_require_contenttypes_0002','2019-07-31 11:33:32.232651'),(9,'auth','0007_alter_validators_add_error_messages','2019-07-31 11:33:32.280090'),(10,'auth','0008_alter_user_username_max_length','2019-07-31 11:33:32.323506'),(11,'auth','0009_alter_user_last_name_max_length','2019-07-31 11:33:32.362657'),(12,'auth','0010_alter_group_name_max_length','2019-07-31 11:33:32.478144'),(13,'auth','0011_update_proxy_permissions','2019-07-31 11:33:32.527245'),(14,'users','0001_initial','2019-07-31 11:33:33.449570'),(15,'admin','0001_initial','2019-07-31 11:33:37.000046'),(16,'admin','0002_logentry_remove_auto_add','2019-07-31 11:33:38.354447'),(17,'admin','0003_logentry_add_action_flag_choices','2019-07-31 11:33:38.397618'),(18,'admin','0004_auto_20190731_1005','2019-07-31 11:33:39.167141'),(19,'admin','0005_auto_20190731_1012','2019-07-31 11:33:39.991865'),(20,'school_data','0001_initial','2019-07-31 11:33:41.249925'),(21,'sessions','0001_initial','2019-07-31 11:33:43.007949'),(22,'users','0002_auto_20190731_1213','2019-07-31 12:13:33.368131');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('0uqp6cqz8bq84ogum61q7vhz4lvc7l65','NjdiMzk4NmJkMzQ2M2NkMDg1NGM1YmQ3NjFiZWNhNzJlODFhMDNmZjp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9oYXNoIjoiY2Q1YWExMDBiZGJiYmVmMGIwNjRjNTM2Njk5YTk0M2RiYTYzNzM0YSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIn0=','2019-08-14 11:51:50.570000');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `school_data_courses`
--

DROP TABLE IF EXISTS `school_data_courses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `school_data_courses` (
  `name` varchar(100) NOT NULL,
  `course_id` varchar(20) NOT NULL,
  `department_id` int(11) NOT NULL,
  PRIMARY KEY (`course_id`),
  KEY `school_data_courses_department_id_03e3d174_fk_school_da` (`department_id`),
  CONSTRAINT `school_data_courses_department_id_03e3d174_fk_school_da` FOREIGN KEY (`department_id`) REFERENCES `school_data_department` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `school_data_courses`
--

LOCK TABLES `school_data_courses` WRITE;
/*!40000 ALTER TABLE `school_data_courses` DISABLE KEYS */;
INSERT INTO `school_data_courses` VALUES ('Chemistry','BSC_chem',1),('Computer Science','BSC_CS',1),('Civil','Eng_civil',2),('IT','Eng_IT',2);
/*!40000 ALTER TABLE `school_data_courses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `school_data_department`
--

DROP TABLE IF EXISTS `school_data_department`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `school_data_department` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `school_data_department`
--

LOCK TABLES `school_data_department` WRITE;
/*!40000 ALTER TABLE `school_data_department` DISABLE KEYS */;
INSERT INTO `school_data_department` VALUES (1,'Bachelor of Science'),(2,'Engineering');
/*!40000 ALTER TABLE `school_data_department` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `school_data_subject`
--

DROP TABLE IF EXISTS `school_data_subject`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `school_data_subject` (
  `subject_id` varchar(60) NOT NULL,
  `subject_name` varchar(200) NOT NULL,
  `course_id_id` varchar(20) NOT NULL,
  PRIMARY KEY (`subject_id`),
  KEY `school_data_subject_course_id_id_4cde33de_fk_school_da` (`course_id_id`),
  CONSTRAINT `school_data_subject_course_id_id_4cde33de_fk_school_da` FOREIGN KEY (`course_id_id`) REFERENCES `school_data_courses` (`course_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `school_data_subject`
--

LOCK TABLES `school_data_subject` WRITE;
/*!40000 ALTER TABLE `school_data_subject` DISABLE KEYS */;
INSERT INTO `school_data_subject` VALUES ('BSC_chem_101','Molecular Structure','BSC_chem'),('BSC_chem_102','Aldehydes','BSC_chem'),('BSC_CS_101','C Programming','BSC_CS'),('BSC_CS_102','Parallel Programming','BSC_CS'),('Eng_civil_101','History of building','Eng_civil'),('Eng_civil_102','Structures','Eng_civil'),('Eng_IT_101','Computer Architecture','Eng_IT'),('Eng_IT_102','C Programming','Eng_IT');
/*!40000 ALTER TABLE `school_data_subject` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_parentprofile`
--

DROP TABLE IF EXISTS `users_parentprofile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users_parentprofile` (
  `user_id` int(11) NOT NULL,
  `address` longtext NOT NULL,
  PRIMARY KEY (`user_id`),
  CONSTRAINT `users_parentprofile_user_id_efbb6144_fk_users_user_id` FOREIGN KEY (`user_id`) REFERENCES `users_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_parentprofile`
--

LOCK TABLES `users_parentprofile` WRITE;
/*!40000 ALTER TABLE `users_parentprofile` DISABLE KEYS */;
INSERT INTO `users_parentprofile` VALUES (8,'Talodhi'),(9,'Chandwad,Nashik'),(10,'Talodhi');
/*!40000 ALTER TABLE `users_parentprofile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_student_subject`
--

DROP TABLE IF EXISTS `users_student_subject`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users_student_subject` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date_joined` date NOT NULL,
  `date_completed` date DEFAULT NULL,
  `student_id_id` int(11) NOT NULL,
  `subject_id_id` varchar(60) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_student_subject_student_id_id_subject_id_id_9c72075a_uniq` (`student_id_id`,`subject_id_id`),
  KEY `users_student_subjec_subject_id_id_7a31b7dc_fk_school_da` (`subject_id_id`),
  CONSTRAINT `users_student_subjec_student_id_id_438de3ce_fk_users_stu` FOREIGN KEY (`student_id_id`) REFERENCES `users_studentprofile` (`user_id`),
  CONSTRAINT `users_student_subjec_subject_id_id_7a31b7dc_fk_school_da` FOREIGN KEY (`subject_id_id`) REFERENCES `school_data_subject` (`subject_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_student_subject`
--

LOCK TABLES `users_student_subject` WRITE;
/*!40000 ALTER TABLE `users_student_subject` DISABLE KEYS */;
INSERT INTO `users_student_subject` VALUES (1,'2019-07-31',NULL,4,'BSC_CS_101'),(2,'2019-07-31',NULL,5,'BSC_CS_101'),(3,'2019-07-31',NULL,4,'BSC_CS_102'),(4,'2019-07-31',NULL,5,'BSC_CS_102'),(5,'2019-07-31',NULL,6,'BSC_chem_101'),(6,'2019-07-31',NULL,6,'BSC_chem_102'),(7,'2019-07-31',NULL,7,'Eng_IT_101'),(8,'2019-07-31',NULL,7,'Eng_IT_102');
/*!40000 ALTER TABLE `users_student_subject` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_studentprofile`
--

DROP TABLE IF EXISTS `users_studentprofile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users_studentprofile` (
  `user_id` int(11) NOT NULL,
  `date_of_birth` date NOT NULL,
  `date_of_admission` date NOT NULL,
  `department_id_id` int(11) NOT NULL,
  `parent_id` int(11) NOT NULL,
  PRIMARY KEY (`user_id`),
  KEY `users_studentprofile_department_id_id_72910fd2_fk_school_da` (`department_id_id`),
  KEY `users_studentprofile_parent_id_c535cf3d_fk_users_par` (`parent_id`),
  CONSTRAINT `users_studentprofile_department_id_id_72910fd2_fk_school_da` FOREIGN KEY (`department_id_id`) REFERENCES `school_data_department` (`id`),
  CONSTRAINT `users_studentprofile_parent_id_c535cf3d_fk_users_par` FOREIGN KEY (`parent_id`) REFERENCES `users_parentprofile` (`user_id`),
  CONSTRAINT `users_studentprofile_user_id_d0e95184_fk_users_user_id` FOREIGN KEY (`user_id`) REFERENCES `users_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_studentprofile`
--

LOCK TABLES `users_studentprofile` WRITE;
/*!40000 ALTER TABLE `users_studentprofile` DISABLE KEYS */;
INSERT INTO `users_studentprofile` VALUES (4,'1990-09-22','2019-07-31',1,8),(5,'1996-04-02','2019-07-31',1,9),(6,'1998-07-13','2019-07-31',1,10),(7,'2003-05-28','2019-07-31',2,9);
/*!40000 ALTER TABLE `users_studentprofile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_teacher_subject`
--

DROP TABLE IF EXISTS `users_teacher_subject`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users_teacher_subject` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date_joined` date NOT NULL,
  `subject_id_id` varchar(60) NOT NULL,
  `teacher_id_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `users_teacher_subjec_subject_id_id_769c2234_fk_school_da` (`subject_id_id`),
  KEY `users_teacher_subjec_teacher_id_id_759e7a40_fk_users_tea` (`teacher_id_id`),
  CONSTRAINT `users_teacher_subjec_subject_id_id_769c2234_fk_school_da` FOREIGN KEY (`subject_id_id`) REFERENCES `school_data_subject` (`subject_id`),
  CONSTRAINT `users_teacher_subjec_teacher_id_id_759e7a40_fk_users_tea` FOREIGN KEY (`teacher_id_id`) REFERENCES `users_teacherprofile` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_teacher_subject`
--

LOCK TABLES `users_teacher_subject` WRITE;
/*!40000 ALTER TABLE `users_teacher_subject` DISABLE KEYS */;
INSERT INTO `users_teacher_subject` VALUES (1,'2019-07-31','BSC_CS_101',11),(2,'2019-07-31','BSC_CS_102',13),(3,'2019-07-31','Eng_IT_101',12),(4,'2019-07-31','Eng_IT_102',12),(5,'2019-07-31','BSC_chem_101',11),(6,'2019-07-31','BSC_chem_102',14);
/*!40000 ALTER TABLE `users_teacher_subject` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_teacherprofile`
--

DROP TABLE IF EXISTS `users_teacherprofile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users_teacherprofile` (
  `user_id` int(11) NOT NULL,
  `department_id` int(11) NOT NULL,
  PRIMARY KEY (`user_id`),
  KEY `users_teacherprofile_department_id_0cdacfc7_fk_school_da` (`department_id`),
  CONSTRAINT `users_teacherprofile_department_id_0cdacfc7_fk_school_da` FOREIGN KEY (`department_id`) REFERENCES `school_data_department` (`id`),
  CONSTRAINT `users_teacherprofile_user_id_976ceafc_fk_users_user_id` FOREIGN KEY (`user_id`) REFERENCES `users_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_teacherprofile`
--

LOCK TABLES `users_teacherprofile` WRITE;
/*!40000 ALTER TABLE `users_teacherprofile` DISABLE KEYS */;
INSERT INTO `users_teacherprofile` VALUES (11,1),(13,1),(14,1),(12,2);
/*!40000 ALTER TABLE `users_teacherprofile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_user`
--

DROP TABLE IF EXISTS `users_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  `role` varchar(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_user`
--

LOCK TABLES `users_user` WRITE;
/*!40000 ALTER TABLE `users_user` DISABLE KEYS */;
INSERT INTO `users_user` VALUES (1,'pbkdf2_sha256$150000$MOTP48xDtTw0$Xdo2VwRIrwRlvfIZXRrXz940W1lALaTQuWpfBTofl90=','2019-07-31 11:51:50.502223',1,'rohit','rohit','','r@gmail.com',1,1,'2019-07-31 11:34:57.000000','t'),(4,'pbkdf2_sha256$150000$aO4Z8Fq5Frsv$/wmAYPyS+71hVAujNf6yU9EItI0cgS/QhepSO7Qkj08=',NULL,0,'rohit_gonnade','Rohit','Gonnade','rohit_gonnade@live.in',0,1,'2019-07-31 11:58:56.000000','s'),(5,'pbkdf2_sha256$150000$CZsZExzaMDXh$FDh10mNf9I17AxE+oX7CQQ2oP+IaRqxgnK5QgeePsDw=',NULL,0,'prachi_sutane','Prachi','Sutane','prachisutane@gmail.com',0,1,'2019-07-31 12:07:07.000000','s'),(6,'pbkdf2_sha256$150000$qUHckvkgFIn8$5mLY3lmgwLuoiEdu78u37OcBSoUOeuWckgrzDt+cyqM=',NULL,0,'wrushabh_gonnade','Wrushabh','Gonnade','wr@gmail.com',0,1,'2019-07-31 12:07:07.000000','s'),(7,'pbkdf2_sha256$150000$NXgJ2aJisoHD$X/0X3+9Oon5nTiWT3tg0zDFcu5qX8KMPuCnn8oGTLgU=',NULL,0,'sammer_sutane','Sameer','Sutane','sameer@gmail.com',0,1,'2019-07-31 12:07:08.000000','s'),(8,'pbkdf2_sha256$150000$m8mPQOQ3ktpA$Blugc01GAU45FAez33f2eNSyg5SUciDHhu2BTs7hp2U=',NULL,0,'sharad_gonnade','Sharad','Gonnade','sg@gmail.com',0,1,'2019-07-31 12:07:08.000000','p'),(9,'pbkdf2_sha256$150000$wm2w1CWRFNgZ$BzzC+emAE5DFXpPOLxbNfKELQfIZQ/CBWjCafJEU+j0=',NULL,0,'prashant_sutane','Prashant','Sutane','ps@gmail.com',0,1,'2019-07-31 12:07:08.000000','p'),(10,'pbkdf2_sha256$150000$PrgszOHVcNSd$uozdbsoMFe6zB4gShfuRdE4v2euYltX9VgHwsZjJVtw=',NULL,0,'narendra_gonnade','Narendra','Gonnade','nr@gmail.com',0,1,'2019-07-31 12:07:08.000000','p'),(11,'pbkdf2_sha256$150000$s9cXjOk53ZRP$spIRYu2PQ0L8wf08op/pDrHvk4X3HxD1NupqO/4hPa0=',NULL,0,'abdullah_ansari','Abdullah','Ansari','aa@gmail.com',0,1,'2019-07-31 12:07:09.000000','t'),(12,'pbkdf2_sha256$150000$B6tpoNuumneT$md8sok4G9v9kwrNoKNwQSwSExsRrbUsPVt2D6lVY5CU=',NULL,0,'palak_valeja','Palak','Valeja','pv@gmail.com',0,1,'2019-07-31 12:07:09.000000','t'),(13,'pbkdf2_sha256$150000$O1DfSiwrFuOi$NlLH5wIrWHHmzYIT+rdxQFNR/Nwxu+b0cjVURiqOl90=',NULL,0,'suraj_malpure','Suraj','Malpure','sm@gmail.com',0,1,'2019-07-31 12:07:09.000000','t'),(14,'pbkdf2_sha256$150000$wJd3MU67XIun$R+9eFbpAN3X2e45E3SPIwV9j5ED3TD+rp8wBOnHrIJE=',NULL,0,'abhijit_mane','Abhijit','Mane','am@gmail.com',0,1,'2019-07-31 12:07:09.000000','t');
/*!40000 ALTER TABLE `users_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_user_groups`
--

DROP TABLE IF EXISTS `users_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_user_groups_user_id_group_id_b88eab82_uniq` (`user_id`,`group_id`),
  KEY `users_user_groups_group_id_9afc8d0e_fk_auth_group_id` (`group_id`),
  CONSTRAINT `users_user_groups_group_id_9afc8d0e_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `users_user_groups_user_id_5f6f5a90_fk_users_user_id` FOREIGN KEY (`user_id`) REFERENCES `users_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_user_groups`
--

LOCK TABLES `users_user_groups` WRITE;
/*!40000 ALTER TABLE `users_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `users_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_user_user_permissions`
--

DROP TABLE IF EXISTS `users_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_user_user_permissions_user_id_permission_id_43338c45_uniq` (`user_id`,`permission_id`),
  KEY `users_user_user_perm_permission_id_0b93982e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `users_user_user_perm_permission_id_0b93982e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `users_user_user_permissions_user_id_20aca447_fk_users_user_id` FOREIGN KEY (`user_id`) REFERENCES `users_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_user_user_permissions`
--

LOCK TABLES `users_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `users_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `users_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-07-31 17:53:17
