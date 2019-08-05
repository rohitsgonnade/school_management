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
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_user`
--

LOCK TABLES `users_user` WRITE;
/*!40000 ALTER TABLE `users_user` DISABLE KEYS */;
INSERT INTO `users_user` VALUES (1,'pbkdf2_sha256$150000$MOTP48xDtTw0$Xdo2VwRIrwRlvfIZXRrXz940W1lALaTQuWpfBTofl90=','2019-08-05 06:57:06.672165',1,'rohit','rohit','','r@gmail.com',1,1,'2019-07-31 11:34:57.000000','t'),(4,'pbkdf2_sha256$150000$aO4Z8Fq5Frsv$/wmAYPyS+71hVAujNf6yU9EItI0cgS/QhepSO7Qkj08=',NULL,0,'rohit_gonnade','Rohit','Gonnade','rohit_gonnade@live.in',0,1,'2019-07-31 11:58:56.000000','s'),(5,'pbkdf2_sha256$150000$CZsZExzaMDXh$FDh10mNf9I17AxE+oX7CQQ2oP+IaRqxgnK5QgeePsDw=','2019-08-05 06:59:18.563489',0,'prachi_sutane','Prachi','Sutane','prachisutane@gmail.com',0,1,'2019-07-31 12:07:07.000000','s'),(6,'pbkdf2_sha256$150000$qUHckvkgFIn8$5mLY3lmgwLuoiEdu78u37OcBSoUOeuWckgrzDt+cyqM=',NULL,0,'wrushabh_gonnade','Wrushabh','Gonnade','wr@gmail.com',0,1,'2019-07-31 12:07:07.000000','s'),(7,'pbkdf2_sha256$150000$NXgJ2aJisoHD$X/0X3+9Oon5nTiWT3tg0zDFcu5qX8KMPuCnn8oGTLgU=',NULL,0,'sammer_sutane','Sameer','Sutane','sameer@gmail.com',0,1,'2019-07-31 12:07:08.000000','s'),(8,'pbkdf2_sha256$150000$m8mPQOQ3ktpA$Blugc01GAU45FAez33f2eNSyg5SUciDHhu2BTs7hp2U=','2019-08-02 10:31:13.148065',0,'sharad_gonnade','Sharad','Gonnade','sg@gmail.com',0,1,'2019-07-31 12:07:08.000000','p'),(9,'pbkdf2_sha256$150000$wm2w1CWRFNgZ$BzzC+emAE5DFXpPOLxbNfKELQfIZQ/CBWjCafJEU+j0=','2019-08-05 06:59:28.880191',0,'prashant_sutane','Prashant','Sutane','ps@gmail.com',0,1,'2019-07-31 12:07:08.000000','p'),(10,'pbkdf2_sha256$150000$PrgszOHVcNSd$uozdbsoMFe6zB4gShfuRdE4v2euYltX9VgHwsZjJVtw=','2019-08-01 11:11:20.441149',0,'narendra_gonnade','Narendra','Gonnade','nr@gmail.com',0,1,'2019-07-31 12:07:08.000000','p'),(11,'pbkdf2_sha256$150000$s9cXjOk53ZRP$spIRYu2PQ0L8wf08op/pDrHvk4X3HxD1NupqO/4hPa0=','2019-08-05 06:59:48.975108',0,'abdullah_ansari','Abdullah','Ansari','aa@gmail.com',0,1,'2019-07-31 12:07:09.000000','t'),(12,'pbkdf2_sha256$150000$B6tpoNuumneT$md8sok4G9v9kwrNoKNwQSwSExsRrbUsPVt2D6lVY5CU=',NULL,0,'palak_valeja','Palak','Valeja','pv@gmail.com',0,1,'2019-07-31 12:07:09.000000','t'),(13,'pbkdf2_sha256$150000$O1DfSiwrFuOi$NlLH5wIrWHHmzYIT+rdxQFNR/Nwxu+b0cjVURiqOl90=',NULL,0,'suraj_malpure','Suraj','Malpure','sm@gmail.com',0,1,'2019-07-31 12:07:09.000000','t'),(14,'pbkdf2_sha256$150000$wJd3MU67XIun$R+9eFbpAN3X2e45E3SPIwV9j5ED3TD+rp8wBOnHrIJE=','2019-08-05 07:02:15.659976',0,'abhijit_mane','Abhijit','Mane','am@gmail.com',0,1,'2019-07-31 12:07:09.000000','t'),(15,'text_123',NULL,0,'xyz','xyz','xyz','x@gmail.com',0,1,'2019-08-02 06:35:04.000000','s');
/*!40000 ALTER TABLE `users_user` ENABLE KEYS */;
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
INSERT INTO `users_parentprofile` VALUES (8,'Nagpur'),(9,'Chandwad,Nashik'),(10,'Talodhi');
/*!40000 ALTER TABLE `users_parentprofile` ENABLE KEYS */;
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
INSERT INTO `users_studentprofile` VALUES (4,'1990-09-22','2019-07-31',1,8),(5,'1996-04-02','2019-07-31',1,9),(6,'1998-07-13','2019-07-31',1,10),(7,'2003-05-28','2019-07-31',2,9),(15,'2003-05-28','2019-08-02',1,10);
/*!40000 ALTER TABLE `users_studentprofile` ENABLE KEYS */;
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
-- Table structure for table `users_exam`
--

DROP TABLE IF EXISTS `users_exam`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users_exam` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL,
  `exam_date` date NOT NULL,
  `exam_time` time(6) NOT NULL,
  `max_marks` int(11) NOT NULL,
  `created_by_id` int(11) NOT NULL,
  `subject_id_id` varchar(60) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_exam_subject_id_id_exam_date_37dbecd7_uniq` (`subject_id_id`,`exam_date`),
  KEY `users_exam_created_by_id_83205c79_fk_users_tea` (`created_by_id`),
  CONSTRAINT `users_exam_created_by_id_83205c79_fk_users_tea` FOREIGN KEY (`created_by_id`) REFERENCES `users_teacherprofile` (`user_id`),
  CONSTRAINT `users_exam_subject_id_id_dcb9dce1_fk_school_da` FOREIGN KEY (`subject_id_id`) REFERENCES `school_data_subject` (`subject_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_exam`
--

LOCK TABLES `users_exam` WRITE;
/*!40000 ALTER TABLE `users_exam` DISABLE KEYS */;
INSERT INTO `users_exam` VALUES (8,'Mid Sem','2019-08-10','12:00:00.000000',20,11,'BSC_CS_101'),(9,'Evaluation','2019-08-01','12:00:00.000000',10,11,'BSC_CS_101'),(10,'mid Sem','2019-08-11','12:00:00.000000',10,14,'BSC_chem_102');
/*!40000 ALTER TABLE `users_exam` ENABLE KEYS */;
UNLOCK TABLES;


--
-- Table structure for table `users_exam_marks`
--

DROP TABLE IF EXISTS `users_exam_marks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users_exam_marks` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `marks_obtained` int(11) NOT NULL,
  `exam_id_id` int(11) NOT NULL,
  `student_id_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_exam_marks_student_id_id_exam_id_id_e8b5223d_uniq` (`student_id_id`,`exam_id_id`),
  KEY `users_exam_marks_exam_id_id_2c6831ec_fk_users_exam_id` (`exam_id_id`),
  CONSTRAINT `users_exam_marks_exam_id_id_2c6831ec_fk_users_exam_id` FOREIGN KEY (`exam_id_id`) REFERENCES `users_exam` (`id`),
  CONSTRAINT `users_exam_marks_student_id_id_6d689de5_fk_users_stu` FOREIGN KEY (`student_id_id`) REFERENCES `users_studentprofile` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_exam_marks`
--

LOCK TABLES `users_exam_marks` WRITE;
/*!40000 ALTER TABLE `users_exam_marks` DISABLE KEYS */;
INSERT INTO `users_exam_marks` VALUES (5,8,9,4),(6,9,9,5);
/*!40000 ALTER TABLE `users_exam_marks` ENABLE KEYS */;
UNLOCK TABLES;



--
-- Table structure for table `users_attendance`
--

DROP TABLE IF EXISTS `users_attendance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users_attendance` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date_of_lecture` date NOT NULL,
  `subject_id_id` varchar(60) NOT NULL,
  `teacher_id_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_attendance_subject_id_id_teacher_id_688a1c0e_uniq` (`subject_id_id`,`teacher_id_id`,`date_of_lecture`),
  KEY `users_attendance_teacher_id_id_5765d620_fk_users_tea` (`teacher_id_id`),
  CONSTRAINT `users_attendance_subject_id_id_73979a93_fk_school_da` FOREIGN KEY (`subject_id_id`) REFERENCES `school_data_subject` (`subject_id`),
  CONSTRAINT `users_attendance_teacher_id_id_5765d620_fk_users_tea` FOREIGN KEY (`teacher_id_id`) REFERENCES `users_teacherprofile` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_attendance`
--

LOCK TABLES `users_attendance` WRITE;
/*!40000 ALTER TABLE `users_attendance` DISABLE KEYS */;
INSERT INTO `users_attendance` VALUES (2,'2019-08-01','BSC_chem_101',11),(5,'2019-08-02','BSC_chem_101',11),(6,'2019-08-01','BSC_chem_102',14),(7,'2019-08-02','BSC_chem_102',14),(1,'2019-08-01','BSC_CS_101',11),(4,'2019-08-02','BSC_CS_101',11);
/*!40000 ALTER TABLE `users_attendance` ENABLE KEYS */;
UNLOCK TABLES;




--
-- Table structure for table `users_student_attendance`
--

DROP TABLE IF EXISTS `users_student_attendance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users_student_attendance` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `present` tinyint(1) NOT NULL,
  `attendance_id_id` int(11) NOT NULL,
  `student_id_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_student_attendance_student_id_id_attendance_560ce6f1_uniq` (`student_id_id`,`attendance_id_id`),
  KEY `users_student_attend_attendance_id_id_354a6d12_fk_users_att` (`attendance_id_id`),
  CONSTRAINT `users_student_attend_attendance_id_id_354a6d12_fk_users_att` FOREIGN KEY (`attendance_id_id`) REFERENCES `users_attendance` (`id`),
  CONSTRAINT `users_student_attend_student_id_id_551172e3_fk_users_stu` FOREIGN KEY (`student_id_id`) REFERENCES `users_studentprofile` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_student_attendance`
--

LOCK TABLES `users_student_attendance` WRITE;
/*!40000 ALTER TABLE `users_student_attendance` DISABLE KEYS */;
INSERT INTO `users_student_attendance` VALUES (1,1,1,4),(2,1,1,5),(3,1,2,6),(4,1,5,6),(5,1,4,4),(6,1,4,5),(7,1,6,6),(8,1,7,6);
/*!40000 ALTER TABLE `users_student_attendance` ENABLE KEYS */;
UNLOCK TABLES;

