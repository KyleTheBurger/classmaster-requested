-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: localhost    Database: classmaster
-- ------------------------------------------------------
-- Server version	8.0.35

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
-- Table structure for table `cohort`
--

DROP TABLE IF EXISTS `cohort`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cohort` (
  `cohort_id` char(5) COLLATE utf8mb4_general_ci NOT NULL,
  `cohort_name` varchar(45) COLLATE utf8mb4_general_ci NOT NULL,
  `description` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`cohort_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cohort`
--

LOCK TABLES `cohort` WRITE;
/*!40000 ALTER TABLE `cohort` DISABLE KEYS */;
INSERT INTO `cohort` VALUES ('C0001','ABM','DAE KO SURE'),('C0002','GAS','DAE KO ARAM'),('C0003','STEM 11','ANO SIYA'),('C0004','STEM 12','GARO SIYA AROG KANI'),('C0005','TVL','OUMS IYO');
/*!40000 ALTER TABLE `cohort` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cohort_assignment`
--

DROP TABLE IF EXISTS `cohort_assignment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cohort_assignment` (
  `cohort_assignment_id` char(5) COLLATE utf8mb4_general_ci NOT NULL,
  `employee_id` char(4) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `cohort_id` char(5) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `designation` enum('Learning Facilitator','Learning Supervisor') COLLATE utf8mb4_general_ci DEFAULT NULL,
  `status` enum('Active','Deactivated') COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'Active',
  PRIMARY KEY (`cohort_assignment_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cohort_assignment`
--

LOCK TABLES `cohort_assignment` WRITE;
/*!40000 ALTER TABLE `cohort_assignment` DISABLE KEYS */;
INSERT INTO `cohort_assignment` VALUES ('CA001','0043','C0002','Learning Supervisor','Active'),('CA002','0105','C0003','Learning Supervisor','Active'),('CA003','1275','C0001','Learning Supervisor','Active'),('CA004','7345','C0004','Learning Supervisor','Active'),('CA005','2206','C0005','Learning Supervisor','Active'),('CA006','2201','C0005','Learning Facilitator','Active'),('CA007','2204','C0005','Learning Facilitator','Deactivated'),('CA008','2207','C0005','Learning Facilitator','Deactivated'),('CA009','2235','C0005','Learning Facilitator','Active'),('CA010','2205','C0005','Learning Facilitator','Deactivated'),('CA011','2207','C0001','Learning Facilitator','Deactivated'),('CA012','2205','C0001','Learning Facilitator','Deactivated'),('CA013','0924','C0003','Learning Facilitator','Active'),('CA014','0924','C0005','Learning Facilitator','Deactivated'),('CA015','0002','C0003','Learning Facilitator','Active'),('CA016','0345','C0001','Learning Facilitator','Deactivated'),('CA017','0006','C0001','Learning Facilitator','Deactivated'),('CA018','0026','C0001','Learning Facilitator','Active'),('CA019','0019','C0001','Learning Facilitator','Active'),('CA020','2235','C0002','Learning Facilitator','Deactivated'),('CA021','0345','C0002','Learning Facilitator','Deactivated'),('CA022','0012','C0002','Learning Facilitator','Deactivated'),('CA023','0024','C0002','Learning Facilitator','Active'),('CA024','0015','C0002','Learning Facilitator','Active'),('CA025','0022','C0002','Learning Facilitator','Active'),('CA026','0030','C0002','Learning Facilitator','Active'),('CA027','0014','C0002','Learning Facilitator','Active'),('CA028','0025','C0002','Learning Facilitator','Active'),('CA029','0012','C0003','Learning Facilitator','Active'),('CA030','0013','C0003','Learning Facilitator','Active'),('CA031','0023','C0003','Learning Facilitator','Active'),('CA032','0026','C0003','Learning Facilitator','Active'),('CA033','0018','C0004','Learning Facilitator','Active'),('CA034','0020','C0004','Learning Facilitator','Active'),('CA035','0011','C0004','Learning Facilitator','Active'),('CA036','0021','C0004','Learning Facilitator','Active'),('CA037','0025','C0004','Learning Facilitator','Active'),('CA038','0004','C0004','Learning Facilitator','Active'),('CA039','0007','C0005','Learning Facilitator','Active'),('CA040','0023','C0005','Learning Facilitator','Active'),('CA041','0026','C0005','Learning Facilitator','Active'),('CA042','0009','C0005','Learning Facilitator','Active'),('CA043','0004','C0001','Learning Facilitator','Deactivated'),('CA044','0023','C0001','Learning Facilitator','Deactivated'),('CA045','0016','C0001','Learning Facilitator','Deactivated'),('CA046','0011','C0001','Learning Facilitator','Deactivated'),('CA047','2235','C0001','Learning Facilitator','Active'),('CA048','2204','C0001','Learning Facilitator','Active'),('CA049','0017','C0001','Learning Facilitator','Active'),('CA050','0005','C0001','Learning Facilitator','Active');
/*!40000 ALTER TABLE `cohort_assignment` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`admin`@`localhost`*/ /*!50003 TRIGGER `cohort_assignment_insert_trigger` BEFORE INSERT ON `cohort_assignment` FOR EACH ROW BEGIN
    DECLARE lastCohortAssignmentID VARCHAR(10);
    DECLARE nextID INT;

    SELECT cohort_assignment_id INTO lastCohortAssignmentID
    FROM `classmaster`.cohort_assignment
    ORDER BY cohort_assignment_id DESC
    LIMIT 1;
    
    IF lastCohortAssignmentID IS NULL THEN
        SET NEW.cohort_assignment_id = 'CA001';
    ELSE
        SET nextID = CONVERT(SUBSTRING(lastCohortAssignmentID, 3, 3), UNSIGNED) + 1;
        SET NEW.cohort_assignment_id = CONCAT('CA', LPAD(nextID, 3, '0'));
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Temporary view structure for view `cohortlist`
--

DROP TABLE IF EXISTS `cohortlist`;
/*!50001 DROP VIEW IF EXISTS `cohortlist`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `cohortlist` AS SELECT 
 1 AS `cohort_id`,
 1 AS `cohort_name`,
 1 AS `description`,
 1 AS `employee_id`,
 1 AS `learning_supervisor`,
 1 AS `learning_facilitator`,
 1 AS `associated_strands`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `cohortloading`
--

DROP TABLE IF EXISTS `cohortloading`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cohortloading` (
  `cohortloading_id` char(5) COLLATE utf8mb4_general_ci NOT NULL,
  `domain_id` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `section_id` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `employee_id` varchar(8) COLLATE utf8mb4_general_ci NOT NULL,
  `adviser` tinyint DEFAULT NULL,
  `status` enum('Active','Deactivated') COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`cohortloading_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cohortloading`
--

LOCK TABLES `cohortloading` WRITE;
/*!40000 ALTER TABLE `cohortloading` DISABLE KEYS */;
INSERT INTO `cohortloading` VALUES ('CL001','4','S0024','2201',1,'Active'),('CL002','2','S0001','0006',1,'Active'),('CL003','2','S0002','0006',0,'Active'),('CL004','2','S0003','0006',0,'Active'),('CL005','2','S0004','0006',0,'Active'),('CL006','1','S0001','0345',0,'Active'),('CL007','1','S0002','0345',1,'Active'),('CL008','1','S0003','0345',0,'Active'),('CL009','1','S0004','0345',0,'Active'),('CL010','3','S0001','2207',0,'Active'),('CL011','3','S0002','2207',0,'Active'),('CL012','3','S0003','2207',1,'Active'),('CL013','3','S0004','2207',0,'Active'),('CL015','4','S0002','2205',0,'Active'),('CL016','4','S0003','2205',0,'Active'),('CL017','4','S0004','2205',1,'Active'),('CL018','5','S0001','0026',0,'Active'),('CL019','5','S0002','0026',0,'Active'),('CL020','5','S0003','0026',0,'Active'),('CL021','5','S0004','0026',0,'Active'),('CL022','4','S0001','2205',0,'Active'),('CL023','3','S0017','7345',0,'Active'),('CL024','3','S0018','7345',0,'Active'),('CL025','4','S0001','2235',0,'Active');
/*!40000 ALTER TABLE `cohortloading` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`admin`@`localhost`*/ /*!50003 TRIGGER `cohortloading_insert_trigger` BEFORE INSERT ON `cohortloading` FOR EACH ROW BEGIN
DECLARE lastCohortLoadingID VARCHAR(10);

	SELECT cohortloading_id INTO lastCohortLoadingID
    FROM `classmaster`.cohortloading
    ORDER BY cohortloading_id DESC
    LIMIT 1;

    IF NEW.cohortloading_id IS NULL THEN 
            SET NEW.cohortloading_id = CONCAT(
                "CL",
                LPAD(CONVERT(SUBSTRING(lastCohortLoadingID, 3, 5), UNSIGNED) + 1, 3, '0')
            );

	END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Temporary view structure for view `cohortloadingview`
--

DROP TABLE IF EXISTS `cohortloadingview`;
/*!50001 DROP VIEW IF EXISTS `cohortloadingview`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `cohortloadingview` AS SELECT 
 1 AS `employee_id`,
 1 AS `name`,
 1 AS `specialization`,
 1 AS `cohort`,
 1 AS `unit_load`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `domain`
--

DROP TABLE IF EXISTS `domain`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `domain` (
  `domain_id` int NOT NULL AUTO_INCREMENT,
  `domain_name` varchar(20) COLLATE utf8mb4_general_ci NOT NULL,
  `description` varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`domain_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `domain`
--

LOCK TABLES `domain` WRITE;
/*!40000 ALTER TABLE `domain` DISABLE KEYS */;
INSERT INTO `domain` VALUES (1,'English','lksajdlsj'),(2,'Math','The Mathematics domain encompasses the study of numerical concepts, problem-solving, and logical reasoning. Students in this domain will explore topics such as algebra, geometry, trigonometry, and statistics. The curriculum aims to enhance mathematical skills, logical thinking, and the application of mathematical principles to real-world scenarios.'),(3,'Sci-Tech','The Sci-Tech domain integrates the study of science and technology. Students in this domain will delve into subjects like biology, chemistry, physics, and computer science. The curriculum emphasizes the scientific method, laboratory experimentation, technological advancements, and the understanding of natural phenomena.'),(4,'Specialization','The Specialization domain allows students to focus on a specific field or track of their choice, such as Accountancy, Business, and Management (ABM), Humanities and Social Sciences (HUMSS), Science, Technology, Engineering, and Mathematics (STEM), or Technical-Vocational-Livelihood (TVL) programs. This domain enables students to explore their interests and develop specialized skills in preparation for their future careers or further education.'),(5,'PE','The Physical Education domain focuses on promoting physical fitness, health, and well-being. Students in this domain will participate in various physical activities, sports, and wellness programs. The curriculum aims to instill the importance of an active lifestyle, develop motor skills, and foster teamwork and sportsmanship.'),(6,'Filipino','Filipino is a subject that focused on literature and etc.. idk');
/*!40000 ALTER TABLE `domain` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `faculty`
--

DROP TABLE IF EXISTS `faculty`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `faculty` (
  `employee_id` char(4) COLLATE utf8mb4_general_ci NOT NULL,
  `lname` varchar(45) COLLATE utf8mb4_general_ci NOT NULL,
  `fname` varchar(45) COLLATE utf8mb4_general_ci NOT NULL,
  `mname` varchar(45) COLLATE utf8mb4_general_ci NOT NULL,
  `role` enum('Learning Facilitator','Learning Supervisor') COLLATE utf8mb4_general_ci DEFAULT NULL,
  `degree` varchar(55) COLLATE utf8mb4_general_ci NOT NULL,
  `specialization` varchar(55) COLLATE utf8mb4_general_ci NOT NULL,
  `email` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `prc_license_num` varchar(7) COLLATE utf8mb4_general_ci NOT NULL,
  `mobile_num` varchar(11) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `birthdate` date DEFAULT NULL,
  `sex` enum('M','F') COLLATE utf8mb4_general_ci NOT NULL,
  `status` enum('Active','Deactivated') COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'Active',
  PRIMARY KEY (`employee_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `faculty`
--

LOCK TABLES `faculty` WRITE;
/*!40000 ALTER TABLE `faculty` DISABLE KEYS */;
INSERT INTO `faculty` VALUES ('0001','Ocampo','Simonn','V',NULL,'Bachelor in Education','Math','simonn.ocampo@unc.edu.ph','1234567','9001234567','1990-01-01','M','Active'),('0002','Florida','Christian','F',NULL,'Bachelor in Science','English','christian.florida@unc.edu.ph','2345678','9002345678','1991-02-02','M','Active'),('0003','Sariba','Mary Allysa Jenica','P',NULL,'Bachelor in Education','Math','mary.sariba@unc.edu.ph','3456789','9003456789','1992-03-03','F','Active'),('0004','Romero','Juancho Martiniano','V',NULL,'Bachelor in Science','Science','juancho.romero@unc.edu.ph','4567890','9004567890','1989-04-04','M','Active'),('0005','Lagos','Nhel Vincent','A',NULL,'Bachelor in Science','Specialization','nhel.lagos@unc.edu.ph','5678901','9005678901','1993-05-05','M','Active'),('0006','Abetchuela','Ehrna Ysabelle','S',NULL,'Bachelor in Arts','Specialization','ehrna.abetchuela@unc.edu.ph','6789012','9006789012','1988-06-06','F','Active'),('0007','San Luis','Mary Grace','E',NULL,'Bachelor in Science','English','mary.sanluis@unc.edu.ph','7890123','9007890123','1994-07-07','F','Active'),('0008','Serrado','Earl Dwight','R',NULL,'Bachelor in Education','Math','earl.serrado@unc.edu.ph','8901234','9008901234','1990-08-08','M','Active'),('0009','Genio','Harold','F',NULL,'Bachelor in Science','Science','harold.genio@unc.edu.ph','9012345','9009012345','1987-09-09','M','Active'),('0010','Severa','Deocon','G',NULL,'Bachelor in Arts','Specialization','deocon.severa@unc.edu.ph','1234567','9001234567','1995-10-10','M','Active'),('0011','Junio','Nikko','D',NULL,'Bachelor in Science','English','nikko.junio@unc.edu.ph','2345678','9002345678','1989-11-11','M','Active'),('0012','Borbe','Charlene Kris','A',NULL,'Bachelor in Science','English','charlene.borbe@unc.edu.ph','3456789','9003456789','1992-12-12','F','Active'),('0013','Norberto','Joey-Roy','F',NULL,'Bachelor in Education','Math','joey.norberto@unc.edu.ph','4567890','9004567890','1991-01-13','M','Active'),('0014','Gaor','Mark Andrew','S',NULL,'Bachelor in Science','Science','mark.gaor@unc.edu.ph','5678901','9005678901','1993-02-14','M','Active'),('0015','Cavite','James Paul','O',NULL,'Bachelor in Arts','Specialization','james.cavite@unc.edu.ph','6789012','9006789012','1988-03-15','M','Active'),('0016','Garcia','Mae Roselle','C',NULL,'Bachelor in Science','Science','mae.garcia@unc.edu.ph','7890123','9007890123','1990-04-16','F','Active'),('0017','Juridico','Richard','B',NULL,'Bachelor in Science','English','richard.juridico@unc.edu.ph','8901234','9008901234','1987-05-17','M','Active'),('0018','Fausto','Win Michael','B',NULL,'Bachelor in Education','Math','win.fausto@unc.edu.ph','9012345','9009012345','1992-06-18','M','Active'),('0019','Hertez','Mary Joy','M',NULL,'Bachelor in Science','Science','mary.hertez@unc.edu.ph','1234567','9001234567','1990-07-19','F','Active'),('0020','Fordan','Oxygen','P',NULL,'Bachelor in Arts','Specialization','oxygen.fordan@unc.edu.ph','2345678','9002345678','1995-08-20','M','Active'),('0021','Lopez','Marivic','S',NULL,'Bachelor in Science','Math','marivic.lopez@unc.edu.ph','3456789','9003456789','1991-09-21','F','Active'),('0022','De Jesus','Jona Christine','P',NULL,'Bachelor in Science','English','jona.dejesus@unc.edu.ph','4567890','9004567890','1993-10-22','F','Active'),('0023','Sandoval','Mariel','C',NULL,'Bachelor in Arts','Filipino','mariel.sandoval@unc.edu.ph','5678901','9005678901','1988-11-23','F','Active'),('0024','Benosa','Samantha','A',NULL,'Bachelor in Arts','Filipino','samantha.benosa@unc.edu.ph','6789012','9006789012','1990-12-24','F','Active'),('0025','Manuel','Judel','T',NULL,'Bachelor in Arts','Filipino','judel.manuel@unc.edu.ph','7890123','9007890123','1992-01-25','M','Active'),('0026','Gavica','Remark','D',NULL,'Bachelor in Physical Education','PE','remark.gavica@unc.edu.ph','8901234','9008901234','1987-02-26','M','Active'),('0030','De Los Reyes','Myra','S',NULL,'Bachelor in Physical Education','PE','myra.delosreyes@unc.edu.ph','3456789','9003456789','1990-06-30','F','Active'),('0043','Portuguez','Jovel','B',NULL,'Bachelor in Nursing','Surgeon','jovel.portuguez@unc.edu.ph','6745655','9656175543','1994-11-08','M','Active'),('0105','Pornillos','Maria Jan Kyla','B',NULL,'Bachelor in Education','Journalism','mariajankyla.pornillos@unc.edu.ph','6234455','9871433752','1985-09-24','F','Active'),('0345','Arvin','Sibulo','I',NULL,'Bachelor in Education','Literacy','arvin.sibulo@unc.edu.ph','2746480','9485538504','1985-09-24','M','Active'),('0924','Pogie','Xhie','K',NULL,'Bachelor in Computer Engineering','Automation','pogi.xhie@unc.edu.ph','9999881','9376302040','2004-09-23','M','Active'),('1275','Bragais','Alexandra','M',NULL,'Bachelor in Law','Corporate Law','alexandra.bragais@unc.edu.ph','1139252','9342409808','2002-03-29','F','Active'),('1342','Rodriguez','Mark','A',NULL,'Bachelor in Computer Science','Database Management','markanthony.rodriguez@unc.edu.ph','5435258','9379021125','1985-09-24','M','Active'),('2201','Pornillos','Kyle','B',NULL,'Bachelor in Computer Science','Data Science','kyle.pornillos@unc.edu.ph','7749601','9687063791','1985-09-24','M','Active'),('2204','Archivido','Giuseppe','B',NULL,'Bachelor in Computer Science','Data Structure','giuseppe.archivido@unc.edu.ph','3445063','9696967749','1985-09-24','M','Active'),('2205','Lucman','Lei','V',NULL,'Bachelor in Computer Science','Data Structure','lei.lucman@unc.edu.ph','9055641','9407643119','1985-09-24','F','Active'),('2206','Tapan','Jesse','C',NULL,'Bachelor in Nursing','Cardiac Nurse','jesse.tappan@unc.edu.ph','9415709','9184756266','1985-09-24','M','Active'),('2207','De Mesa','Marie','T',NULL,'Bachelor in Education','Poem','marie.tadeo@unc.edu.ph','5438601','9491745498','1985-09-24','F','Active'),('2235','Aguirre','Sofia','F',NULL,'Bachelor in Computer Science','Software Engineering','sofia.aguirre@unc.edu.ph','6732563','9523990031','1985-09-24','F','Active'),('7345','Pulido','Jonas','J',NULL,'Bachelor in Education','Philosophy','jonas.pulido@unc.edu.ph','2807831','9218622177','1985-09-24','M','Active');
/*!40000 ALTER TABLE `faculty` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `facultylist`
--

DROP TABLE IF EXISTS `facultylist`;
/*!50001 DROP VIEW IF EXISTS `facultylist`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `facultylist` AS SELECT 
 1 AS `employee_id`,
 1 AS `name`,
 1 AS `degree`,
 1 AS `specialization`,
 1 AS `sex`,
 1 AS `status`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `room`
--

DROP TABLE IF EXISTS `room`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `room` (
  `room_id` varchar(20) COLLATE utf8mb4_general_ci NOT NULL,
  `room_name` varchar(20) COLLATE utf8mb4_general_ci NOT NULL,
  `building` varchar(30) COLLATE utf8mb4_general_ci NOT NULL,
  `room_floor` varchar(20) COLLATE utf8mb4_general_ci NOT NULL,
  `room_type` varchar(20) COLLATE utf8mb4_general_ci NOT NULL,
  `capacity` int NOT NULL,
  PRIMARY KEY (`room_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `room`
--

LOCK TABLES `room` WRITE;
/*!40000 ALTER TABLE `room` DISABLE KEYS */;
INSERT INTO `room` VALUES ('R0001','AMS 201','AMS','2nd Floor','Classroom',45),('R0002','AMS 202','AMS','2nd Floor','Classroom',45),('R0003','AMS 203','AMS','2nd Floor','Classroom',45),('R0004','AMS 204','AMS','2nd Floor','Classroom',45),('R0005','AMS 205','AMS','2nd Floor','Classroom',45),('R0006','AMS 206','AMS','2nd Floor','Classroom',45),('R0007','AMS 207','AMS','2nd Floor','Classroom',40),('R0008','AMS 208','AMS','2nd Floor','Classroom',40),('R0009','AMS 209','AMS','2nd Floor','Classroom',45),('R0010','AMS 210','AMS','2nd Floor','Classroom',40),('R0011','AMS 211','AMS','2nd Floor','Classroom',45),('R0012','AMS 212','AMS','2nd Floor','Classroom',45),('R0013','AMS 213','AMS','2nd Floor','Classroom',45),('R0014','AMS 214','AMS','2nd Floor','Classroom',45),('R0015','AMS 215','AMS','2nd Floor','Classroom',45),('R0016','AMS 216','AMS','2nd Floor','Classroom',45),('R0017','AMS 217','AMS','2nd Floor','Classroom',45),('R0018','AMS 218','AMS','2nd Floor','Classroom',45),('R0019','AMS 219','AMS','2nd Floor','Classroom',45),('R0020','AMS 220','AMS','2nd Floor','Classroom',40),('R0021','AMS 221','AMS','2nd Floor','Classroom',40),('R0022','AMS 222','AMS','2nd Floor','Classroom',40),('R0023','AMS 223','AMS','2','Classroom',45),('R0024','AMS 224','AMS','2','Classroom',45),('R0025','AMS 225','AMS','2','Classroom',40);
/*!40000 ALTER TABLE `room` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `schedule`
--

DROP TABLE IF EXISTS `schedule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `schedule` (
  `schedule_id` char(5) COLLATE utf8mb4_general_ci NOT NULL,
  `shift` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `modality` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `day_of_week` varchar(20) COLLATE utf8mb4_general_ci NOT NULL,
  `start_time` time NOT NULL,
  `end_time` time NOT NULL,
  `cohortloading_id` char(5) COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schedule`
--

LOCK TABLES `schedule` WRITE;
/*!40000 ALTER TABLE `schedule` DISABLE KEYS */;
INSERT INTO `schedule` VALUES ('SC001','AM','Onsite','M','07:00:00','10:00:00','CL001'),('SC002','AM','Onsite','M','10:45:00','13:45:00','CL002'),('SC003','AM','Onsite','W','14:00:00','17:00:00','CL003'),('SC004','PM','Onsite','Thursday','14:00:00','17:00:00','CL004');
/*!40000 ALTER TABLE `schedule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `schedule_view_table`
--

DROP TABLE IF EXISTS `schedule_view_table`;
/*!50001 DROP VIEW IF EXISTS `schedule_view_table`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `schedule_view_table` AS SELECT 
 1 AS `employee_num`,
 1 AS `faculty_name`,
 1 AS `specialization`,
 1 AS `schedule_id`,
 1 AS `shift`,
 1 AS `modality`,
 1 AS `day_of_week`,
 1 AS `start_time`,
 1 AS `end_time`,
 1 AS `cohortloading_id`,
 1 AS `domain`,
 1 AS `domain_id`,
 1 AS `section_name`,
 1 AS `section_id`,
 1 AS `status`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `section`
--

DROP TABLE IF EXISTS `section`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `section` (
  `section_id` char(5) COLLATE utf8mb4_general_ci NOT NULL,
  `section_name` varchar(20) COLLATE utf8mb4_general_ci NOT NULL,
  `cohort_id` char(5) COLLATE utf8mb4_general_ci NOT NULL,
  `room_id` char(5) COLLATE utf8mb4_general_ci NOT NULL,
  `strand_id` char(5) COLLATE utf8mb4_general_ci NOT NULL,
  `section_lvl` enum('11','12') COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`section_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `section`
--

LOCK TABLES `section` WRITE;
/*!40000 ALTER TABLE `section` DISABLE KEYS */;
INSERT INTO `section` VALUES ('S0001','ABM K','C0001','R0001','ST001','11'),('S0002','ABM L','C0001','R0002','ST001','11'),('S0003','ABM A','C0001','R0003','ST001','12'),('S0004','ABM B','C0001','R0004','ST001','12'),('S0005','GAS K','C0002','R0005','ST002',NULL),('S0006','GAS A','C0002','R0006','ST002',NULL),('S0007','GAS B','C0002','R0007','ST002',NULL),('S0008','HUMMS K','C0002','R0008','ST003',NULL),('S0009','STEM K','C0003','R0009','ST004',NULL),('S0010','STEM L','C0003','R0010','ST004',NULL),('S0011','STEM M','C0003','R0011','ST004',NULL),('S0012','STEM N','C0003','R0012','ST004',NULL),('S0013','STEM O','C0003','R0013','ST004',NULL),('S0014','STEM P','C0003','R0014','ST004',NULL),('S0015','STEM Q','C0003','R0015','ST004',NULL),('S0016','STEM E','C0004','R0016','ST004',NULL),('S0017','STEM F','C0004','R0017','ST004',NULL),('S0018','STEM A','C0004','R0018','ST004',NULL),('S0019','STEM B','C0004','R0019','ST004',NULL),('S0020','STEM C','C0004','R0020','ST004',NULL),('S0021','STEM D','C0004','R0021','ST004',NULL),('S0022','CP K','C0005','R0022','ST006',NULL),('S0023','FBS K','C0005','R0023','ST005',NULL),('S0024','CP A','C0005','R0024','ST006',NULL),('S0025','FBS A','C0005','R0025','ST005',NULL);
/*!40000 ALTER TABLE `section` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `section_room_assignment`
--

DROP TABLE IF EXISTS `section_room_assignment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `section_room_assignment` (
  `section_room_id` int NOT NULL,
  `section_id` char(5) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `room_id` char(5) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `school_year_started` year DEFAULT NULL,
  `school_year_end` year DEFAULT NULL,
  PRIMARY KEY (`section_room_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `section_room_assignment`
--

LOCK TABLES `section_room_assignment` WRITE;
/*!40000 ALTER TABLE `section_room_assignment` DISABLE KEYS */;
/*!40000 ALTER TABLE `section_room_assignment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `sectionlist`
--

DROP TABLE IF EXISTS `sectionlist`;
/*!50001 DROP VIEW IF EXISTS `sectionlist`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `sectionlist` AS SELECT 
 1 AS `section_name`,
 1 AS `strand_name`,
 1 AS `room_name`,
 1 AS `adviser`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `strand`
--

DROP TABLE IF EXISTS `strand`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `strand` (
  `strand_id` char(5) COLLATE utf8mb4_general_ci NOT NULL,
  `strand_name` varchar(45) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `description` varchar(45) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`strand_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `strand`
--

LOCK TABLES `strand` WRITE;
/*!40000 ALTER TABLE `strand` DISABLE KEYS */;
INSERT INTO `strand` VALUES ('ST001','ABM','DAE KA NA MAG APOT'),('ST002','GAS','DAE NA PLS'),('ST003','HUMMS','DAE NA PLS PLS'),('ST004','STEM','DAE NA PLS PLS'),('ST005','TVL-FBS','FOOD SERVICE'),('ST006','TVL-ICT','PILDOT PILDOT LANG KEYBOARD');
/*!40000 ALTER TABLE `strand` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student`
--

DROP TABLE IF EXISTS `student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `student` (
  `student_id` char(8) COLLATE utf8mb4_general_ci NOT NULL,
  `lrn` varchar(20) COLLATE utf8mb4_general_ci NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `gwa` decimal(10,2) NOT NULL,
  `gender` varchar(6) COLLATE utf8mb4_general_ci NOT NULL,
  `birthdate` date NOT NULL,
  `clsf` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `track` varchar(20) COLLATE utf8mb4_general_ci NOT NULL,
  `strand` varchar(20) COLLATE utf8mb4_general_ci NOT NULL,
  `grade_level` int NOT NULL,
  `shift` varchar(20) COLLATE utf8mb4_general_ci NOT NULL,
  `modality` varchar(20) COLLATE utf8mb4_general_ci NOT NULL,
  `date_enrolled` date NOT NULL,
  `email` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `mobile_num` char(11) COLLATE utf8mb4_general_ci NOT NULL,
  `home_address` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `school_last_attended` varchar(20) COLLATE utf8mb4_general_ci NOT NULL,
  `household_income` decimal(10,2) NOT NULL,
  `mother_name` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `mother_mobile_no` char(11) COLLATE utf8mb4_general_ci NOT NULL,
  `father_name` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `father_mobile_no` char(11) COLLATE utf8mb4_general_ci NOT NULL,
  `guardian` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `guardian_mobile_no` char(11) COLLATE utf8mb4_general_ci NOT NULL,
  `specialization` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `section_id` char(5) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`student_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student`
--

LOCK TABLES `student` WRITE;
/*!40000 ALTER TABLE `student` DISABLE KEYS */;
INSERT INTO `student` VALUES ('22-09443','112931909938','Pardinas, Joseph M.',90.33,'Male','1970-01-01','Non-transferee','Academic','ABM',12,'Morning','onsite','1970-01-01','seph@gmail.com','94535645681','naga','2022/2023',5000.00,'gdfgd','9344534570','TVL-FBSrTVL-FBSh','9443323458','vsdvsd','966345678','',''),('22-13135','112931090014','Lucman, Lei V.',95.30,'Female','1970-01-01','Transferee','Academic','ABM',12,'Afternoon','onsite','1970-01-01','lei@gmail.com','94535645679','tinambac','2023/2024',5000.00,'ffwefew','9344534568','gergre','9443323456','gerger','966345678','',''),('22-15345','112930435676','Pornillos, Kyle Josh B.',96.22,'Male','1970-01-01','Transferee','Academic','STEM',11,'Morning','onsite','1970-01-01','kyle@gmail.com','94535645680','ocampo','2023/2024',5000.00,'hfghfghf','9344534569','grtgfhth','9443323457','fdgbdfgbdr','966345678','',''),('22-32296','112932090015','Smith, John A.',92.50,'Male','1970-01-01','Non-Transferee','TVL','TVL-ICT',12,'Morning','online','1970-01-01','johnsmith@gmail.com','94535645678','Old Town, Naga City','2023/2024',4500.00,'Maria Smith','9344534567','James Smith','9443323455','Maria Smith','9344534567','',''),('22-32297','112932090016','Doe, Jane B.',93.70,'Female','1970-01-01','Non-Transferee','Academic','STEM',11,'Afternoon','online','1970-01-01','janedoe@gmail.com','94535645679','Central Ave, Naga City','2023/2024',6000.00,'Anna Doe','9344534568',' John Doe','9443323456',' John Doe','9443323456','',''),('22-32298','112932090017','Lee, Michael C.',90.40,'Male','1970-01-01','Transferee','Academic','ABM',11,'Afternoon','onsite','1970-01-01','michaellee@gmail.com','94535645680','East DistrTVL-ICT, Naga City','2023/2024',5500.00,'Lily Lee','9344534569','Robert Lee','9443323457','Robert Lee','9443323457','',''),('22-32299','112932090018','Brown, Emily D.',94.80,'Female','1970-01-01','Non-transferee','TVL','TVL-FBS',11,'Morning','onsite','1970-01-01','emilybrown@gmail.com','94535645681','West End, Naga City','2023/2024',5000.00,'Sarah Brown','9344534570','Michael Brown','9443323458','Michael Brown','9443323458','',''),('22-32300','112932090019','Wilson, David E.',95.30,'Male','1970-01-01','Transferee','Academic','ABM',12,'Afternoon','onsite','1970-01-01','davidwilson@gmail.com','94535645678','South Road, Naga City','2022/2023',5000.00,'Susan Wilson','9344534567','Peter Wilson','9344534571','Susan Wilson','9344534567','',''),('22-32301','112932090020','Garcia, Anna F.',96.22,'Female','1970-01-01','Transferee','Academic','STEM',11,'Morning','onsite','1970-01-01','annagarcia@gmail.com','94535645679','New Road, Naga City','2023/2024',5000.00,'Linda Garcia','9344534568','John Garcia','9443323455','John Garcia','9443323455','',''),('22-32302','112932090021','Martinez, Carlos G.',90.33,'Male','1970-01-01','Non-transferee','Academic','ABM',12,'Morning','onsite','1970-01-01','carlosmartinez@gmail.com','94535645680','Market Street, Naga City','2023/2024',5000.00,'Rosa Martinez','9344534569','Juan Martinez','9443323456','Rosa Martinez','9344534569','',''),('22-32303','112932090022','Johnson, Sarah H.',92.50,'Female','1970-01-01','Non-Transferee','TVL','TVL-FBS',12,'Morning','online','1970-01-01','sarahjohnson@gmail.com','94535645681','Riverside, Naga City','2023/2024',4500.00,'Laura Johnson','9344534570','Mark Johnson','9443323457','Laura Johnson','9344534570','',''),('22-32304','112932090023','Kim, Steven I.',93.70,'Male','1970-01-01','Non-Transferee','Academic','STEM',11,'Afternoon','online','1970-01-01','stevenkim@gmail.com','94535645680','North Street, Naga City','2022/2023',6000.00,'Grace Kim','9344534569','Paul Kim','9443323458','Paul Kim','9443323458','',''),('22-32305','112932090024','Davis, Laura J.',90.40,'Female','1970-01-01','Transferee','Academic','ABM',11,'Afternoon','onsite','1970-01-01','lauradavis@gmail.com','94535645681','Garden Ave, Naga City','2023/2024',5500.00,'Mary Davis','9344534570','Richard Davis','9443323455','Mary Davis','9344534570','',''),('22-32306','112932090025','Rodriguez, Daniel K',91.30,'Male','1970-01-01','Non-Transferee','Academic','ABM',11,'Morning','onsite','1970-01-01','danielrodriguez@gmail.com','94535645688','Main St, Naga City','2023/2024',4900.00,'Carla Rodriguez','9344534577','Manuel Rodriguez','9443323465','Carla Rodriguez','9344534577','',''),('22-32307','112932090026','Lopez, Jessica L.',92.80,'Female','1970-01-01','Transferee','TVL','TVL-FBS',12,'Morning','Onsite','1970-01-01','jessicalopez@gmail.com','94535645689','Lakeview, Naga City','2023/2024',4700.00,'Sandra Lopez','9344534578','David Lopez','9443323466','David Lopez','9443323466','',''),('22-32308','112932090027','Gonzales, Kevin M.',93.50,'Male','1970-01-01','Non-Transferee','Academic','STEM',11,'Afternoon','Blended','1970-01-01','kevingonzales@gmail.com','94535645690','Hilltop, Naga City','2023/2024',5100.00,'Gloria Gonzales','9344534579','Alex Gonzales','9443323467','Alex Gonzales','9443323467','',''),('22-32309','112932090028','TVL-FBSrnandez, Laura N.',95.00,'Female','1970-01-01','Transferee','Academic','HUMSS',12,'Morning','Online','1970-01-01','lauraTVL-FBSrnandez@gmail.com','94535645691','Park Lane, Naga City','2023/2024',6000.00,'Maria TVL-FBSrnandez','9344534580','Juan TVL-FBSrnandez','9443323468','Maria TVL-FBSrnandez','9344534580','',''),('22-32310','112932090029','Clark, Brian O.',90.20,'Male','1970-01-01','Non-Transferee','Academic','ABM',12,'Morning','Onsite','1970-01-01','brianclark@gmail.com','94535645692','North Hills, Naga City','2023/2024',4600.00,'Linda Clark','9344534581','Paul Clark','9443323469','Linda Clark','9344534581','',''),('22-32311','112932090030','Martinez, Olivia P.',93.40,'Female','1970-01-01','Non-Transferee','TVL','TVL-ICT',11,'Morning','Onsite','1970-01-01','oliviamartinez@gmail.com','94535645693','Southside, Naga City','2023/2024',4800.00,'Teresa Martinez','9344534582','Carlos Martinez','9443323470','Carlos Martinez','9443323470','',''),('22-32312','112932090031','Allen, Mark Q.',94.10,'Male','1970-01-01','Transferee','Academic','STEM',11,'Afternoon','Blended','1970-01-01','markallen@gmail.com','94535645694','City Center, Naga City','2023/2024',6200.00,'Patricia Allen','9344534583','George Allen','9443323471','George Allen','9443323471','',''),('22-32313','112932090032','Wilson, Emily R.',91.90,'Female','1970-01-01','Non-Transferee','Academic','HUMSS',11,'Morning','Online','1970-01-01','emilywilson@gmail.com','94535645695','Seaview, Naga City','2023/2024',5300.00,'Laura Wilson','9344534584','Peter Wilson','9443323472','Peter Wilson','9443323472','',''),('22-32314','112932090033','King, James S.',89.70,'Male','1970-01-01','Non-Transferee','Academic','ABM',12,'Morning','Onsite','1970-01-01','jamesking@gmail.com','94535645696','River Road, Naga City','2023/2024',4700.00,'TVL-FBSlen King','9344534585','Charles King','9443323473','Charles King','9443323473','',''),('22-32315','112932090034','Wright, Sarah T.',96.40,'Female','1970-01-01','Transferee','TVL','TVL-FBS',11,'Morning','Onsite','1970-01-01','sarahwright@gmail.com','94535645697','Forest Hill, Naga City','2023/2024',5000.00,'Lisa Wright','9344534586','Daniel Wright','9443323474','Daniel Wright','9443323474','',''),('22-32316','112932090035','Lopez, Michael U.',92.20,'Male','1970-01-01','Non-Transferee','Academic','STEM',12,'Afternoon','Blended','1970-01-01','michaellopez@gmail.com','94535645698','Highland, Naga City','2023/2024',5400.00,'Anna Lopez','9344534587','David Lopez','9443323475','Anna Lopez','9344534587','',''),('22-32317','112932090036','Gonzales, Emma V.',95.10,'Female','1970-01-01','Non-Transferee','Academic','HUMSS',12,'Morning','Online','1970-01-01','emmagonzales@gmail.com','94535645699','Lakeside, Naga City','2023/2024',5900.00,'Laura Gonzales','9344534588','Alex Gonzales','9443323476','Laura Gonzales','9344534588','',''),('22-32318','112932090037','Clark, Daniel W.',91.50,'Male','1970-01-01','Transferee','Academic','ABM',11,'Morning','Onsite','1970-01-01','danielclark@gmail.com','94535645700','Valley View, Naga City','2023/2024',4600.00,'Mary Clark','9344534589','Paul Clark','9443323477','Mary Clark','9344534589','',''),('22-32319','112932090038','Martinez, Isabella X.',94.80,'Female','1970-01-01','Non-Transferee','TVL','TVL-FBS',11,'Morning','Onsite','1970-01-01','isabellamartinez@gmail.com','94535645701','Sunshine St, Naga City','2023/2024',5200.00,'Carla Martinez','9344534590','Carlos Martinez','9443323478','Carla Martinez','9344534590','',''),('22-32320','112932090039','Johnson, Andrew Y.',93.20,'Male','1970-01-01','Transferee','Academic','STEM',11,'Afternoon','Blended','1970-01-01','andrewjohnson@gmail.com','94535645702','Greenfield, Naga City','2023/2024',5500.00,'Linda Johnson','9344534591','Mark Johnson','9443323479','Mark Johnson','9443323479','',''),('22-32321','112932090040','Martinez, Sophia Z.',92.70,'Female','1970-01-01','Non-Transferee','Academic','HUMSS',12,'Morning','Online','1970-01-01','sophiamartinez@gmail.com','94535645703','Blue Street, Naga City','2023/2024',4700.00,'Rosa Martinez','9344534592','Juan Martinez','9443323480','Juan Martinez','9443323480','',''),('22-32322','112932090041','Brown, Joshua A.',93.30,'Male','1970-01-01','Transferee','Academic','ABM',11,'Morning','Onsite','1970-01-01','joshuabrown@gmail.com','94535645704','Pine Avenue, Naga City','2023/2024',4900.00,'Sarah Brown','9344534593','Michael Brown','9443323481','Michael Brown','9443323481','',''),('22-32323','112932090042','Wilson, Grace B.',94.70,'Female','1970-01-01','Non-Transferee','TVL','TVL-ICT',12,'Morning','Onsite','1970-01-01','gracewilson@gmail.com','94535645705','Oak Lane, Naga City','2023/2024',5100.00,'Laura Wilson','9344534594','Peter Wilson','9443323482','Peter Wilson','9443323482','',''),('22-32324','112932090043','Smith, Luke C.',90.60,'Male','1970-01-01','Transferee','Academic','STEM',12,'Afternoon','Blended','1970-01-01','lukesmith@gmail.com','94535645706','Birch Street, Naga City','2023/2024',4800.00,'Maria Smith','9344534595','James Smith','9443323483','James Smith','9443323483','',''),('22-32325','112932090044','Davis, Hannah D.',96.10,'Female','1970-01-01','Non-Transferee','Academic','HUMSS',11,'Morning','Online','1970-01-01','hannahdavis@gmail.com','94535645707','CTVL-FBSrry Lane, Naga City','2023/2024',5000.00,'Mary Davis','9344534596','Richard Davis','9443323484','Richard Davis','9443323484','',''),('22-32326','112932090045','Martinez, Oliver E.',91.20,'Male','1970-01-01','Non-Transferee','Academic','ABM',11,'Morning','Onsite','1970-01-01','olivermartinez@gmail.com','94535645708','Plum Street, Naga City','2023/2024',4700.00,'Teresa Martinez','9344534597','Carlos Martinez','9443323485','Carlos Martinez','9443323485','',''),('22-32327','112932090046','Johnson, Ava F.',92.60,'Female','1970-01-01','Transferee','TVL','TVL-ICT',11,'Morning','Onsite','1970-01-01','avajohnson@gmail.com','94535645709','Maple Avenue, Naga City','2023/2024',4500.00,'Laura Johnson','9344534598','Mark Johnson','9443323486','Mark Johnson','9443323486','',''),('22-32328','112932090047','Brown, Ethan G.',94.90,'Male','1970-01-01','Non-Transferee','Academic','STEM',12,'Afternoon','Blended','1970-01-01','ethanbrown@gmail.com','94535645710','Willow Street, Naga City','2023/2024',5100.00,'Sarah Brown','9344534599','Michael Brown','9443323487','Michael Brown','9443323487','',''),('22-32329','112932090048','Wilson, Lily H.',95.50,'Female','1970-01-01','Non-Transferee','Academic','HUMSS',11,'Morning','Online','1970-01-01','lilywilson@gmail.com','94535645711','Palm Lane, Naga City','2023/2024',5200.00,'Laura Wilson','9344534600','Peter Wilson','9443323488','Peter Wilson','9443323488','',''),('22-32330','112932090049','Clark, Jacob I.',89.30,'Male','1970-01-01','Transferee','Academic','ABM',12,'Morning','Onsite','1970-01-01','jacobclark@gmail.com','94535645712','Cedar Road, Naga City','2023/2024',4600.00,'Linda Clark','9344534601','Paul Clark','9443323489','Linda Clark','9344534601','',''),('22-32331','112932090050','Martinez, Ella J.',92.40,'Female','1970-01-01','Non-Transferee','TVL','TVL-ICT',12,'Morning','Onsite','1970-01-01','ellamartinez@gmail.com','94535645713','Pine Street, Naga City','2023/2024',4800.00,'Carla Martinez','9344534602','Carlos Martinez','9443323490','Carla Martinez','9344534602','',''),('22-32332','112932090051','Johnson, Liam K.',90.90,'Male','1970-01-01','Transferee','Academic','STEM',11,'Afternoon','Blended','1970-01-01','liamjohnson@gmail.com','94535645714','Oak Avenue, Naga City','2023/2024',5500.00,'Linda Johnson','9344534603','Mark Johnson','9443323491','Linda Johnson','9344534603','',''),('22-32333','112932090052','Brown, Mia L.',95.40,'Female','1970-01-01','Non-Transferee','Academic','HUMSS',11,'Morning','Online','1970-01-01','miabrown@gmail.com','94535645715','Elm Street, Naga City','2023/2024',5900.00,'Sarah Brown','9344534604','Michael Brown','9443323492','Sarah Brown','9344534604','',''),('22-32334','112932090053','Wilson, N.',89.10,'Male','1970-01-01','Non-Transferee','Academic','ABM',12,'Morning','Onsite','1970-01-01','noahwilson@gmail.com','94535645716','Birch Lane, Naga City','2023/2024',4600.00,'Laura Wilson','9344534605','Peter Wilson','9443323493','Laura Wilson','9344534605','',''),('22-32335','112932090054','Clark, Olivia N.',93.20,'Female','1970-01-01','Transferee','TVL','TVL-ICT',12,'Morning','Onsite','1970-01-01','oliviaclark@gmail.com','94535645717','Cedar Avenue, Naga City','2023/2024',5100.00,'Linda Clark','9344534606','Paul Clark','9443323494','Linda Clark','9344534606','',''),('22-32336','112932090055','Martinez, Mason O.',95.90,'Male','1970-01-01','Non-Transferee','Academic','STEM',11,'Afternoon','Blended','1970-01-01','masonmartinez@gmail.com','94535645718','Maple Street, Naga City','2023/2024',5000.00,'Teresa Martinez','9344534607','Carlos Martinez','9443323501','Teresa Martinez','9344534607','',''),('22-32337','112932090056','Johnson, Ava P.',91.10,'Female','1970-01-01','Non-Transferee','Academic','HUMSS',11,'Morning','Online','1970-01-01','avajohnson@gmail.com','94535645719','CTVL-FBSrry Lane, Naga City','2023/2024',5300.00,'Laura Johnson','9344534608','Mark Johnson','9443323496','Laura Johnson','9344534608','',''),('22-32338','112932090057','Brown, Logan Q.',90.70,'Male','1970-01-01','Transferee','Academic','ABM',12,'Morning','Onsite','1970-01-01','loganbrown@gmail.com','94535645720','Plum Street, Naga City','2023/2024',4700.00,'Sarah Brown','9344534609','Michael Brown','9443323497','Sarah Brown','9344534609','',''),('22-32339','112932090058','Wilson, Emma R.',94.30,'Female','1970-01-01','Non-Transferee','TVL','TVL-ICT',11,'Morning','Onsite','1970-01-01','emmawilson@gmail.com','94535645721','Palm Avenue, Naga City','2023/2024',5000.00,'Laura Wilson','9344534610','Peter Wilson','9443323498','Laura Wilson','9344534610','',''),('22-32340','112932090059','Smith, Owen S.',89.80,'Male','1970-01-01','Non-Transferee','Academic','STEM',12,'Afternoon','Blended','1970-01-01','owensmith@gmail.com','94535645722','Pine Street, Naga City','2023/2024',5200.00,'Maria Smith','9344534611','James Smith','9443323499','Maria Smith','9344534611','',''),('22-32346','112932090065','Clark, Joel B.',90.10,'Male','1970-01-01','Non-Transferee','Academic','ABM',12,'Morning','Onsite','1970-01-01','loganclark@gmail.com','94535645728','Plum Lane, Naga City','2023/2024',4600.00,'Linda Clark','9344534705','Paul Clark','9443323505','Paul Clark','9443323505','',''),('22-32347','112932090066','Martinez, Kristina V.',92.10,'Female','1970-01-01','Transferee','TVL','TVL-ICT',11,'Morning','Onsite','1970-01-01','lilymartinez@gmail.com','94535645729','Palm Road, Naga City','2023/2024',4800.00,'Carla Martinez','9344534706','Carlos Martinez','9443323506','Carlos Martinez','9443323506','',''),('22-32348','112932090067','Johnson, Jeff Q.',95.60,'Male','1970-01-01','Non-Transferee','Academic','STEM',11,'Afternoon','Blended','1970-01-01','ethanjohnson@gmail.com','94535645730','Pine Avenue, Naga City','2023/2024',5500.00,'Laura Johnson','9344534707','Mark Johnson','9443323507','Mark Johnson','9443323507','',''),('22-32349','112932090068','Brown, TTVL-FBSa L.',96.70,'Female','1970-01-01','Non-Transferee','Academic','HUMSS',12,'Morning','Online','1970-01-01','avabrown@gmail.com','94535645731','Cedar Lane, Naga City','2023/2024',5900.00,'Sarah Brown','9344534708','Michael Brown','9443323508','Michael Brown','9443323508','',''),('22-32350','112932090069','Wilson, Thomas H.',91.30,'Male','1970-01-01','Transferee','Academic','ABM',12,'Morning','Onsite','1970-01-01','loganwilson@gmail.com','94535645732','Plum Avenue, Naga City','2023/2024',4700.00,'Laura Wilson','9344534709','Peter Wilson','9443323509','Laura Wilson','9344534709','',''),('22-32351','112932090070','Clark, Howard G.',94.50,'Male','1970-01-01','Non-Transferee','TVL','TVL-ICT',11,'Morning','Onsite','1970-01-01','noahclark@gmail.com','94535645733','Maple Road, Naga City','2023/2024',4800.00,'Linda Clark','9344534710','Paul Clark','9443323510','Linda Clark','9344534710','',''),('22-32352','112932090071','Martinez, Joana C.',89.50,'Female','1970-01-01','Non-Transferee','Academic','STEM',11,'Afternoon','Blended','1970-01-01','avamartinez@gmail.com','94535645734','Oak Avenue, Naga City','2023/2024',5000.00,'Teresa Martinez','9344534711','Carlos Martinez','9443323511','Teresa Martinez','9344534711','',''),('22-32353','112932090072','Johnson, Jak K.',92.30,'Male','1970-01-01','Transferee','Academic','HUMSS',12,'Morning','Online','1970-01-01','liamjohnson@gmail.com','94535645735','Birch Street, Naga City','2023/2024',4700.00,'Laura Johnson','9344534712','Mark Johnson','9443323512','Laura Johnson','9344534712','',''),('22-32354','112932090073','Brown, Jewel V.',94.20,'Female','1970-01-01','Non-Transferee','TVL','TVL-ICT',11,'Morning','Onsite','1970-01-01','miabrown@gmail.com','94535645736','CTVL-FBSrry Lane, Naga City','2023/2024',5100.00,'Sarah Brown','9344534713','Michael Brown','9443323513','Sarah Brown','9344534713','',''),('22-32355','112932090074','Wilson, Ethan H.',95.30,'Male','1970-01-01','Transferee','TVL','TVL-ICT',11,'Morning','Onsite','1970-01-01','ethanwilson@gmail.com','94535645737','Plum Avenue, Naga City','2023/2024',4800.00,'Laura Wilson','9344534714','Peter Wilson','9443323514','Laura Wilson','9344534714','',''),('22-33395','112932090014','Flojo, Pia A.',94.80,'Female','1970-01-01','Non-transferee','TVL','TVL-ICT',11,'Morning','onsite','1970-01-01','pia@gmail.com','94535645678','pili cam sur','2023/2024',5000.00,'mamamo','9344534567','geger','9443323455','grge','966345678','','');
/*!40000 ALTER TABLE `student` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `studentlist`
--

DROP TABLE IF EXISTS `studentlist`;
/*!50001 DROP VIEW IF EXISTS `studentlist`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `studentlist` AS SELECT 
 1 AS `student_id`,
 1 AS `lrn`,
 1 AS `name`,
 1 AS `gwa`,
 1 AS `gender`,
 1 AS `birthdate`,
 1 AS `clsf`,
 1 AS `track`,
 1 AS `strand`,
 1 AS `grade_level`,
 1 AS `shift`,
 1 AS `modality`,
 1 AS `date_enrolled`,
 1 AS `email`,
 1 AS `mobile_num`,
 1 AS `home_address`,
 1 AS `school_last_attended`,
 1 AS `household_income`,
 1 AS `mother_name`,
 1 AS `mother_mobile_no`,
 1 AS `father_name`,
 1 AS `father_mobile_no`,
 1 AS `guardian`,
 1 AS `guardian_mobile_no`,
 1 AS `specialization`,
 1 AS `section_id`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `subject`
--

DROP TABLE IF EXISTS `subject`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `subject` (
  `subject_id` char(5) COLLATE utf8mb4_general_ci NOT NULL,
  `subject_name` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `subject_type` enum('General','Specialized') COLLATE utf8mb4_general_ci NOT NULL,
  `subject_lvl` enum('11','12') COLLATE utf8mb4_general_ci NOT NULL,
  `semester` int NOT NULL,
  `unit` int NOT NULL,
  `domain_id` char(5) COLLATE utf8mb4_general_ci NOT NULL,
  `strand_id` char(5) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`subject_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subject`
--

LOCK TABLES `subject` WRITE;
/*!40000 ALTER TABLE `subject` DISABLE KEYS */;
INSERT INTO `subject` VALUES ('SBJ01','Oral Communication','General','11',1,3,'1',NULL),('SBJ02','Reading and Writing','General','11',2,3,'1',NULL),('SBJ03','21st Century Literature from the Philippines and the World','General','12',1,3,'1',NULL),('SBJ04','Research','General','12',2,3,'1',NULL),('SBJ05','Gen Math 1','General','11',1,3,'2',NULL),('SBJ06','Gen Math 2','General','11',2,3,'2',NULL),('SBJ07','Statistic and Probability','General','12',1,3,'2',NULL),('SBJ08','Calculus III','General','12',2,3,'2',NULL),('SBJ09','Earth and Life Science','General','11',1,3,'3',NULL),('SBJ10','Physical Science','General','11',2,3,'3',NULL),('SBJ11','Earth Science','General','12',1,3,'3',NULL),('SBJ12','Animation 1','Specialized','11',1,3,'4','ST006'),('SBJ13','Animation 2','Specialized','11',2,3,'4','ST006'),('SBJ14','Programming I','Specialized','12',1,3,'4','ST006'),('SBJ15','Programming II','Specialized','12',2,3,'4','ST006'),('SBJ16','Try lang','Specialized','12',2,3,'4','ST003'),('SBJ17','Research II','General','12',1,3,'1',NULL),('SBJ18','Fundamentals of Accountancy, Business and Management 1','Specialized','11',1,3,'4','ST001'),('SBJ19','Fundamentals of Accountancy, Business and Management 2','Specialized','11',2,3,'4','ST001'),('SBJ20','Business Ethics and Social Responsibility','Specialized','12',1,3,'4','ST001'),('SBJ21','Principles of Marketing','Specialized','12',2,3,'4','ST001');
/*!40000 ALTER TABLE `subject` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`admin`@`localhost`*/ /*!50003 TRIGGER `subject_insert_trigger` BEFORE INSERT ON `subject` FOR EACH ROW BEGIN
DECLARE lastSubjectID VARCHAR(10);

	SELECT subject_id INTO lastSubjectID
    FROM `classmaster`.subject
    ORDER BY subject_id DESC
    LIMIT 1;

    IF NEW.subject_id IS NULL THEN 
            SET NEW.subject_id = CONCAT(
                "SBJ",
                LPAD(CONVERT(SUBSTRING(lastSubjectID, 4, 5), UNSIGNED) + 1, 2, '0')
            );

	END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Temporary view structure for view `subjectlist`
--

DROP TABLE IF EXISTS `subjectlist`;
/*!50001 DROP VIEW IF EXISTS `subjectlist`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `subjectlist` AS SELECT 
 1 AS `subject_id`,
 1 AS `subject_name`,
 1 AS `subject_type`,
 1 AS `subject_lvl`,
 1 AS `semester`,
 1 AS `unit`,
 1 AS `domain_id`,
 1 AS `domain_name`,
 1 AS `strand_name`*/;
SET character_set_client = @saved_cs_client;

--
-- Dumping events for database 'classmaster'
--

--
-- Dumping routines for database 'classmaster'
--
/*!50003 DROP FUNCTION IF EXISTS `getCohort` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`admin`@`localhost` FUNCTION `getCohort`(p_employee_id CHAR(4)) RETURNS varchar(20) CHARSET utf8mb4 COLLATE utf8mb4_general_ci
    READS SQL DATA
BEGIN
DECLARE cohort VARCHAR(20);
SELECT ch.cohort_name INTO cohort
FROM faculty f
LEFT JOIN `cohortloading` `c` ON (`f`.`employee_id` = `c`.`employee_id`)
LEFT JOIN section s ON(c.section_id = s.section_id)
LEFT JOIN cohort ch ON(s.cohort_id = ch.cohort_id)
WHERE f.employee_id = p_employee_id 
LIMIT 1;
RETURN cohort;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `getCohortID` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`admin`@`localhost` FUNCTION `getCohortID`(p_cohort_name VARCHAR(20)) RETURNS varchar(20) CHARSET utf8mb4 COLLATE utf8mb4_general_ci
    READS SQL DATA
BEGIN
DECLARE cohortID VARCHAR(20);
SELECT cohort_id INTO cohortID
FROM cohort
WHERE cohort_name = p_cohort_name;
RETURN cohortID;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `getDomainID` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`admin`@`localhost` FUNCTION `getDomainID`(p_domain_name VARCHAR(20)) RETURNS varchar(20) CHARSET utf8mb4 COLLATE utf8mb4_general_ci
    READS SQL DATA
BEGIN
DECLARE domainID VARCHAR(20);
SELECT 
    domain_id
INTO domainID FROM
    domain
WHERE
    domain_name = p_domain_name;
RETURN domainID;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `getLearningFacilitator` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`admin`@`localhost` FUNCTION `getLearningFacilitator`(cohortName VARCHAR(45)) RETURNS text CHARSET utf8mb4 COLLATE utf8mb4_general_ci
    READS SQL DATA
BEGIN
    DECLARE facilitators TEXT;
    
    SELECT GROUP_CONCAT(CONCAT(f.fname, ' ', SUBSTRING(f.mname, 1, 1), '. ', f.lname)SEPARATOR ', ')
    INTO facilitators
    FROM cohort_assignment ca
    JOIN faculty f ON ca.employee_id = f.employee_id
    JOIN cohort c ON ca.cohort_id = c.cohort_id
    WHERE ca.designation = 'Learning Facilitator' AND c.cohort_name = cohortName AND ca.status="Active"; 
    
    RETURN facilitators;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `getNumberOfCohortsByFaculty` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`admin`@`localhost` FUNCTION `getNumberOfCohortsByFaculty`(employeeId CHAR(4)) RETURNS int
    DETERMINISTIC
BEGIN
    DECLARE cohortCount INT;
    
    SELECT COUNT(*) INTO cohortCount
    FROM cohort_assignment
    WHERE employee_id = employeeId
      AND status = 'Active';
    
    RETURN cohortCount;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `getSectionID` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`admin`@`localhost` FUNCTION `getSectionID`(p_employee_id CHAR(4)) RETURNS varchar(20) CHARSET utf8mb4 COLLATE utf8mb4_general_ci
    READS SQL DATA
BEGIN
DECLARE section VARCHAR(20);
SELECT s.section_id INTO section
FROM faculty f
LEFT JOIN `cohortloading` `c` ON (`f`.`employee_id` = `c`.`employee_id`)
LEFT JOIN section s ON(c.section_id = s.section_id)
LEFT JOIN cohort ch ON(s.cohort_id = ch.cohort_id)
WHERE f.employee_id = p_employee_id 
LIMIT 1;
RETURN section;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `getStrandID` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`admin`@`localhost` FUNCTION `getStrandID`(p_strand_name VARCHAR(20)) RETURNS varchar(20) CHARSET utf8mb4 COLLATE utf8mb4_general_ci
    READS SQL DATA
BEGIN
DECLARE strandID VARCHAR(20);
SELECT 
    strand_id
INTO strandID FROM
    strand
WHERE
    strand_name = p_strand_name;
RETURN strandID;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `getSubject` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`admin`@`localhost` FUNCTION `getSubject`(p_domain_id INT) RETURNS varchar(100) CHARSET utf8mb4 COLLATE utf8mb4_general_ci
    READS SQL DATA
BEGIN
DECLARE subject VARCHAR(100);
SELECT subject_name INTO subject 
FROM `subject` 
WHERE domain_id = p_domain_id 
AND (semester = 1)
LIMIT 1;
RETURN subject;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `getUnitLoad` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`admin`@`localhost` FUNCTION `getUnitLoad`(p_employee_id CHAR(4)) RETURNS int
    READS SQL DATA
BEGIN
DECLARE unit_load INT;
SELECT (COUNT(*) * 6) INTO unit_load 
FROM cohortloading 
WHERE employee_id = p_employee_id 
AND (domain_id <> '' OR domain_id IS NOT NULL);
RETURN unit_load;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `assignFacultyToCohort` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`admin`@`localhost` PROCEDURE `assignFacultyToCohort`(
    IN `p_employee_id` CHAR(4),
    IN `p_cohort_name` VARCHAR(20),
    IN `p_designation` VARCHAR(255)
)
BEGIN
    INSERT INTO `classmaster`.`cohort_assignment`
    (`cohort_assignment_id`, `employee_id`, `cohort_id`, `designation`)
    VALUES
    (NULL, p_employee_id, GETCOHORTID(p_cohort_name), p_designation);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `assign_cohort` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`admin`@`localhost` PROCEDURE `assign_cohort`(
    IN `p_employee_id` VARCHAR(20),
    IN `p_cohort_id` VARCHAR(20),
    IN `p_designation` ENUM('Learning Facilitator','Learning Supervisor')
)
BEGIN
    INSERT INTO `classmaster`.`cohort_assignment`
    VALUES
    (
        NULL,
        p_employee_id,
        p_cohort_id,
        p_designation
    );
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `assign_subject` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`admin`@`localhost` PROCEDURE `assign_subject`(
    IN `p_subject_name` VARCHAR(50),
    IN p_grade_lvl ENUM('11','12'),
    IN p_unit int,
    IN p_semester int,
    IN p_strand_id varchar(120),
    IN p_domain_id VARCHAR(20)
)
BEGIN
    INSERT INTO `classmaster`.`subject`
    VALUES
    (
        NULL,
        p_grade_lvl,
        p_unit,
        p_semester,
        p_strand_id,
        p_domain_id	
    );
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `create_cohort` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`admin`@`localhost` PROCEDURE `create_cohort`(
    IN `p_cohort_name` VARCHAR(20),
    IN `p_description` VARCHAR(200)
)
BEGIN
    INSERT INTO `classmaster`.`cohort`
    VALUES
    (
        NULL,
        p_cohort_name,
        p_description
    );
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `create_strand` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`admin`@`localhost` PROCEDURE `create_strand`(
    IN `p_strand_name` VARCHAR(20),
    IN `p_description` VARCHAR(200)
)
BEGIN
    INSERT INTO `classmaster`.`strand`
    VALUES
    (
        NULL,
        p_strand_name,
        p_description
    );
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `filterFacultyTable` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`admin`@`localhost` PROCEDURE `filterFacultyTable`(

IN p_gender VARCHAR(5), 
IN p_status VARCHAR(50), 
IN p_name VARCHAR(50))
BEGIN
DECLARE where_clause VARCHAR(100) DEFAULT '';

    IF p_gender IS NOT NULL AND p_gender <> '' AND p_gender <> 'ALL' THEN
        SET where_clause = CONCAT(where_clause, ' AND sex = "', p_gender, '"');
    END IF;

    IF p_status IS NOT NULL AND p_status <> '' AND p_status <> 'ALL' THEN
        SET where_clause = CONCAT(where_clause, ' AND status = "', p_status, '"');
    END IF;

    IF p_name IS NOT NULL AND p_name <> '' THEN
        SET where_clause = CONCAT(where_clause, ' AND name LIKE "', CONCAT(p_name, '%'), '"');
    END IF;
    
    SET @SQLquery = CONCAT('SELECT * FROM classmaster.facultylist WHERE 1=1', where_clause, " ORDER BY name");
    PREPARE statement FROM @SQLquery;
    EXECUTE statement;
    DEALLOCATE PREPARE statement;
    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `filterScheduleTable` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`admin`@`localhost` PROCEDURE `filterScheduleTable`(
    IN `p_var1` VARCHAR(50),
    IN `p_var2` VARCHAR(50),
    IN `p_search` VARCHAR(50),
    IN `p_filter` BOOLEAN
)
BEGIN
    SELECT *
    FROM `classmaster`.schedule_view_table
    WHERE
        (p_var1 IS NULL OR p_var1 = '' OR p_var1 = 'ALL' OR domain = p_var1)
        AND (p_var2 IS NULL OR p_var2 = '' OR p_var2 = 'ALL' OR section_name = p_var2)
        AND (p_search IS NULL OR p_search = '' OR faculty_name LIKE CONCAT(p_search, '%'))
        AND (p_filter = 0 OR (p_filter = 1 AND (schedule_id IS NULL))
        );
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `filterStudentTable` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`admin`@`localhost` PROCEDURE `filterStudentTable`(
    IN p_strand VARCHAR(50),
    IN p_grade_lvl VARCHAR(3),
    IN p_shift VARCHAR(10),
    IN p_name_search VARCHAR(50)
)
BEGIN
    SELECT *
    FROM classmaster.studentList
    WHERE
        (p_strand IS NULL OR p_strand = '' OR p_strand = 'ALL' OR strand = p_strand)
        AND (p_grade_lvl IS NULL OR grade_level = p_grade_lvl OR p_grade_lvl = 'ALL' OR p_grade_lvl = '')
        AND (p_shift IS NULL OR p_shift = ''  OR p_shift = 'ALL' OR shift = p_shift)
        AND (p_name_search IS NULL OR p_name_search = '' OR name LIKE CONCAT(p_name_search, '%'));
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `filterSubjectTable` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`admin`@`localhost` PROCEDURE `filterSubjectTable`(

IN p_domain VARCHAR(20), 
IN p_lvl VARCHAR(3), 
IN p_name VARCHAR(50))
BEGIN
DECLARE where_clause VARCHAR(100) DEFAULT '';

    IF p_domain IS NOT NULL AND p_domain <> '' AND p_domain <> 'ALL' THEN
        SET where_clause = CONCAT(where_clause, ' AND domain_name = "', p_domain, '"');
    END IF;

    IF p_lvl IS NOT NULL AND p_lvl <> '' AND p_lvl <> 'All' THEN
        SET where_clause = CONCAT(where_clause, ' AND subject_lvl = "', p_lvl, '"');
    END IF;

    IF p_name IS NOT NULL AND p_name <> '' THEN
        SET where_clause = CONCAT(where_clause, ' AND subject_name LIKE "', CONCAT('%', p_name, '%'), '"');
    END IF;
    
    SET @SQLquery = CONCAT('SELECT * FROM classmaster.subjectlist WHERE 1=1', where_clause);
    PREPARE statement FROM @SQLquery;
    EXECUTE statement;
    DEALLOCATE PREPARE statement;
    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `filterTable` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`admin`@`localhost` PROCEDURE `filterTable`(IN `p_var1` VARCHAR(50), IN `p_var2` VARCHAR(50), IN `p_search` VARCHAR(50), IN `p_filter` BOOLEAN)
BEGIN
    SELECT *
    FROM `classmasterdb`.schedule_view_table
    WHERE
        (p_var1 IS NULL OR p_var1 = '' OR domain = p_var1)
        AND (p_var2 IS NULL OR p_var2 = '' OR section = p_var2)
        AND (p_search IS NULL OR p_search = '' OR faculty_name LIKE CONCAT('%', p_search, '%'))
        AND (
			p_filter = FALSE OR
            (p_filter = TRUE AND (modality IS NULL OR modality = '' 
              OR day_of_week IS NULL OR day_of_week = '' 
              OR start_time IS NULL OR start_time = '' 
              OR end_time IS NULL OR end_time = ''))
        );
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getAssociatedStrand` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`admin`@`localhost` PROCEDURE `getAssociatedStrand`(IN p_cohort_name VARCHAR(50))
BEGIN
SELECT st.strand_name FROM strand st
JOIN section s ON st.strand_id = s.strand_id
JOIN cohort c ON s.cohort_id = c.cohort_id
WHERE c.cohort_name = p_cohort_name
GROUP BY st.strand_name;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getCohort` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`admin`@`localhost` PROCEDURE `getCohort`()
BEGIN
SELECT * FROM cohort;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getCohortFaculty` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`admin`@`localhost` PROCEDURE `getCohortFaculty`(IN p_cohort_name VARCHAR(50))
BEGIN
    SELECT 
		ca.cohort_assignment_id,
        f.employee_id as id,
        CONCAT(f.lname, ', ', f.fname, ' ', f.mname) AS `name`,
        getNumberOfCohortsByFaculty(f.`employee_id`) as no_of_cohort,
        f.specialization,
        ca.designation
    FROM 
        cohort_assignment ca
        JOIN faculty f ON ca.employee_id = f.employee_id
        JOIN cohort c ON ca.cohort_id = c.cohort_id
    WHERE 
        ca.status = 'Active' 
        AND c.cohort_name = p_cohort_name;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getCohortFacultyTableList` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`admin`@`localhost` PROCEDURE `getCohortFacultyTableList`(
    IN `cohort` VARCHAR(20),
    IN search VARCHAR(50)
)
BEGIN
    SELECT 
        `faculty`.`employee_id` AS `employee_id`,
        CONCAT(`faculty`.`lname`, ', ', `faculty`.`fname`, ' ', `faculty`.`mname`) AS `name`,
        getNumberOfCohortsByFaculty(`faculty`.`employee_id`) as no_of_cohort,
        `faculty`.`specialization` AS `specialization`,
        `faculty`.`status` AS `status`,
        ca.`cohort_assignment_id` AS `cohort_assignment_id`
    FROM
        `faculty`
    LEFT JOIN 
        cohort_assignment ca 
    ON 
        `faculty`.`employee_id` = ca.`employee_id`
        AND ca.`cohort_id` = GETCOHORTID(cohort)
    WHERE 
        `faculty`.`status` = 'Active'
        AND `faculty`.`employee_id` NOT IN (
            SELECT `employee_id`
            FROM `cohort_assignment`
            WHERE `cohort_id` != GETCOHORTID(cohort)
            AND `designation` = 'Learning Supervisor'
        )
        AND CONCAT(`faculty`.`lname`, ', ', `faculty`.`fname`, ' ', `faculty`.`mname`) LIKE CONCAT(search, '%')
    ORDER BY 
        CONCAT(`faculty`.`lname`, ', ', `faculty`.`fname`, ' ', `faculty`.`mname`);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getCohortInfo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`admin`@`localhost` PROCEDURE `getCohortInfo`(IN p_section_id CHAR(5))
BEGIN
SELECT r.room_name, r.building, st.strand_name FROM section s
LEFT JOIN room r ON (s.room_id = r.room_id)
LEFT JOIN strand st ON (s.strand_id = st.strand_id)
WHERE s.section_id = p_section_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getCohortLoadingStatistic` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`admin`@`localhost` PROCEDURE `getCohortLoadingStatistic`()
BEGIN
SELECT 
  SUM(CASE WHEN unit_load < 30 THEN 1 ELSE 0 END) AS statistic1,
  SUM(CASE WHEN unit_load >= 24 THEN 1 ELSE 0 END) AS statistic2,
  SUM(CASE WHEN unit_load < 24 THEN 1 ELSE 0 END) AS statistic3
FROM classmaster.cohortloadingview;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getCohortStatus` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`admin`@`localhost` PROCEDURE `getCohortStatus`()
BEGIN
SELECT 
    c.cohort_id,
    c.cohort_name,
    COUNT(CASE WHEN cl.adviser = 1 THEN 1 END) AS status
FROM cohort c
JOIN section s ON c.cohort_id = s.cohort_id
LEFT JOIN cohortloading cl ON s.section_id = cl.section_id
GROUP BY c.cohort_id, c.cohort_name;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getCohortTable` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`admin`@`localhost` PROCEDURE `getCohortTable`(
    IN cohort_name VARCHAR(20),
    IN availability TINYINT,
    IN name VARCHAR(50)
)
BEGIN
    SELECT DISTINCT
        `f`.`employee_id` AS `employee_id`,
        CONCAT(`f`.`lname`,
                ', ',
                `f`.`fname`,
                ' ',
                `f`.`mname`) AS `name`,
        ca.designation,
        `f`.`specialization` AS `specialization`,
        GETUNITLOAD(`f`.`employee_id`) AS `unit_load`,
        c.cohort_id,
        c.cohort_name
    FROM `faculty` `f`
        LEFT JOIN cohort_assignment ca ON f.employee_id = ca.employee_id
        LEFT JOIN `cohort` `c` ON `ca`.`cohort_id` = `c`.`cohort_id`
    WHERE c.cohort_name = cohort_name
        AND ca.status = 'Active'
        AND (availability != 1 OR GETUNITLOAD(`f`.`employee_id`) < 24)
        AND CONCAT(f.lname, ', ', f.fname, ' ', f.mname) LIKE CONCAT(name, '%')
    ORDER BY CONCAT(`f`.`lname`,
                    ', ',
                    `f`.`fname`,
                    ' ',
                    `f`.`mname`);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getDomain` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`admin`@`localhost` PROCEDURE `getDomain`()
BEGIN
SELECT * FROM domain;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getFacultyStatistic` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`admin`@`localhost` PROCEDURE `getFacultyStatistic`()
BEGIN
SELECT 
  COUNT(*) AS statistic1,
  0 AS statistic2,
  0 AS statistic3
FROM faculty;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getSectionList` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`admin`@`localhost` PROCEDURE `getSectionList`(
    IN p_cohort_name VARCHAR(20)
)
BEGIN
    SELECT
        s.section_name as title
    FROM `section` s
    INNER JOIN `cohort` c ON s.cohort_id = c.cohort_id
    WHERE c.cohort_name = p_cohort_name;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getSubjectList` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`admin`@`localhost` PROCEDURE `getSubjectList`()
BEGIN
SELECT 
s.subject_id,
s.subject_name,
s.subject_type,
s.subject_lvl,
s.semester,
s.unit,
d.domain_id,
d.domain_name,
st.strand_name
FROM subject s
JOIN domain d ON s.domain_id = d.domain_id
LEFT JOIN strand st ON s.strand_id = st.strand_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getUnitLoad` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`admin`@`localhost` PROCEDURE `getUnitLoad`(IN p_employee_id CHAR(4))
BEGIN
SELECT (COUNT(*) * 3) AS unit_load FROM cohortloading WHERE employee_id = p_employee_id AND domain_id <> '' OR domain_id IS NOT NULL;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insertDomain` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`admin`@`localhost` PROCEDURE `insertDomain`(
    IN `p_domain_name` VARCHAR(20),
    IN `p_description` VARCHAR(500)
)
BEGIN
    INSERT INTO `classmaster`.`domain`
    (`domain_name`, `description`)
    VALUES
    (p_domain_name, p_description);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insertFaculty` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`admin`@`localhost` PROCEDURE `insertFaculty`(
    IN `p_employee_id` CHAR(4),
    IN `p_lname` VARCHAR(45),
    IN `p_fname` VARCHAR(45),
    IN `p_mname` VARCHAR(45),
    IN `p_role` ENUM('Principal', 'Learning Facilitator', 'Learning Supervisor'),
    IN `p_degree` VARCHAR(55),
    IN `p_specialization` VARCHAR(55),
    IN `p_status` ENUM('Active', 'Deactivated'),
    IN `p_email` VARCHAR(50),
    IN `p_prc_license_num` VARCHAR(7),
    IN `p_mobile_num` VARCHAR(11),
    IN `p_birthdate` DATE,
    IN `p_sex` ENUM('M', 'F')
)
BEGIN
    INSERT INTO `classmaster`.`faculty`
    (
        `employee_id`,
        `lname`,
        `fname`,
        `mname`,
        `role`,
        `degree`,
        `specialization`,
        `status`,
        `email`,
        `prc_license_num`,
        `mobile_num`,
        `birthdate`,
        `sex`
    )
    VALUES
    (
        p_employee_id,
        p_lname,
        p_fname,
        p_mname,
        p_role,
        p_degree,
        p_specialization,
        p_status,
        p_email,
        p_prc_license_num,
        p_mobile_num,
        p_birthdate,
        p_sex
    );
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insertFacultyInformation` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`admin`@`localhost` PROCEDURE `insertFacultyInformation`(
    IN p_employee_id CHAR(4),
    IN p_lname VARCHAR(50),
    IN p_fname VARCHAR(50), 
    IN p_mname VARCHAR(50),
    IN p_degree VARCHAR(50),
    IN p_specialization VARCHAR(100),
    IN p_email VARCHAR(100),
    IN p_prc_license_num VARCHAR(20),
    IN p_mobile_num VARCHAR(20),
    IN p_birthdate DATE,
    IN p_sex ENUM('M', 'F')
)
BEGIN
    INSERT INTO `classmaster`.`faculty`
    (
        `employee_id`,
        `lname`,
        `fname`,
        `mname`,
        `degree`,
        `specialization`,
        `email`,
        `prc_license_num`,
        `mobile_num`,
        `birthdate`,
        `sex`
    )
    VALUES
    (
        p_employee_id,
        p_lname,
        p_fname,
        p_mname,
        p_degree,
        p_specialization,
        p_email,
        p_prc_license_num,
        p_mobile_num,
        p_birthdate,
        p_sex
    );
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insertSchedule` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`admin`@`localhost` PROCEDURE `insertSchedule`(
    IN `scheduleId` CHAR(5),
    IN `shift` VARCHAR(50),
    IN `modality` ENUM('Online','Onsite'),
    IN `day_of_week` VARCHAR(20),
    IN `startTime` TIME,
    IN `endTime` TIME,
	IN `cohortloading_id` CHAR(5)
)
BEGIN
    INSERT INTO classmaster.schedule
    VALUES (scheduleId, shift, modality, day_of_week, startTime, endTime, cohortloading_id);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insertSubject` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`admin`@`localhost` PROCEDURE `insertSubject`(
    IN p_subject_name VARCHAR(100),
    IN p_subject_type ENUM('General', 'Specialized'),
    IN p_subject_lvl ENUM('11', '12'),
    IN p_semester INT,
    IN p_unit INT,
    IN p_domain_name CHAR(20),
    IN p_strand_name CHAR(20)
)
BEGIN
    INSERT INTO `classmaster`.`subject` (
        `subject_name`,
        `subject_type`,
        `subject_lvl`,
        `semester`,
        `unit`,
        `domain_id`,
        `strand_id`
    ) VALUES (
        p_subject_name,
        p_subject_type,
        p_subject_lvl,
        p_semester,
        p_unit,
        GETDOMAINID(p_domain_name),
        GETSTRANDID(p_strand_name)
    );
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insert_cohortloading` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`admin`@`localhost` PROCEDURE `insert_cohortloading`(
    IN `p_domain_id` VARCHAR(20),
    IN `p_section_id` VARCHAR(20),
    IN `p_employee_id` VARCHAR(8),
    IN `p_adviser` TINYINT
)
BEGIN
    INSERT INTO `classmaster`.`cohortloading`
    (
        `cohortloading_id`,
        `domain_id`,
        `section_id`,
        `employee_id`,
        `adviser`,
        `status`
    )
    VALUES
    (
        NULL,
        p_domain_id,
        p_section_id,
        p_employee_id,
        p_adviser,
        'Active'
    );
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insert_student` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`admin`@`localhost` PROCEDURE `insert_student`(
  `student_id` CHAR(8),
  `lrn` VARCHAR(20),
  `name` VARCHAR(50),
  `gwa` DECIMAL(10,2),
  `gender` ENUM('Male', 'Female'),
  `birthdate` DATE,
  `clsf` VARCHAR(50),
  `track` VARCHAR(20),
  `strand` VARCHAR(20),
  `grade_level` INT(2),
  `shift` VARCHAR(50),
  `modality` VARCHAR(50),
  `date_enrolled` DATE,
  `email` VARCHAR(100),
  `mobile_num` VARCHAR(20),
  `home_address` VARCHAR(200),
  `school_last_attended` VARCHAR(100),
  `household_income` DECIMAL(10,2),
  `mother_name` VARCHAR(100),
  `mother_mobile_no` CHAR(11),
  `father_name` VARCHAR(100),
  `father_mobile_no` VARCHAR(20),
  `guardian` VARCHAR(100),
  `guardian_mobile_no` VARCHAR(20)
)
BEGIN
  INSERT INTO `classmaster`.`student`
  (
    `student_id`,
    `lrn`,
    `name`,
    `gwa`,
    `gender`,
    `birthdate`,
    `clsf`,
    `track`,
    `strand`,
    `grade_level`,
    `shift`,
    `modality`,
    `date_enrolled`,
    `email`,
    `mobile_num`,
    `home_address`,
    `school_last_attended`,
    `household_income`,
    `mother_name`,
    `mother_mobile_no`,
    `father_name`,
    `father_mobile_no`,
    `guardian`,
    `guardian_mobile_no`
  )
  VALUES
  (
    `student_id`,
    `lrn`,
    `name`,
    `gwa`,
    `gender`,
    `birthdate`,
    `clsf`,
    `track`,
    `strand`,
    `grade_level`,
    `shift`,
    `modality`,
    `date_enrolled`,
    `email`,
    `mobile_num`,
    `home_address`,
    `school_last_attended`,
    `household_income`,
    `mother_name`,
    `mother_mobile_no`,
    `father_name`,
    `father_mobile_no`,
    `guardian`,
    `guardian_mobile_no`
  );
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `updateDomainDescription` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`admin`@`localhost` PROCEDURE `updateDomainDescription`(
    IN `p_domain_id` INT,
    IN `p_description` VARCHAR(500)
)
BEGIN
	UPDATE `classmaster`.`domain`
	SET
		`description` = p_description
	WHERE `domain_id` = p_domain_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `updateFacultyCohortInformation` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`admin`@`localhost` PROCEDURE `updateFacultyCohortInformation`(
    IN `p_cohort_assignment_id` CHAR(5),
    IN `p_designation` VARCHAR(255)
)
BEGIN
    UPDATE `classmaster`.`cohort_assignment`
    SET
        `designation` = p_designation,
        `status` = "Active"
    WHERE `cohort_assignment_id` = p_cohort_assignment_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `updateFacultyInformation` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`admin`@`localhost` PROCEDURE `updateFacultyInformation`(
    IN p_employee_id CHAR(4),
    IN p_lname VARCHAR(50),
    IN p_fname VARCHAR(50), 
    IN p_mname VARCHAR(50),
    IN p_degree VARCHAR(50),
    IN p_specialization VARCHAR(100),
    IN p_email VARCHAR(100),
    IN p_prc_license_num VARCHAR(20),
    IN p_mobile_num VARCHAR(20),
    IN p_birthdate DATE,
    IN p_sex ENUM('M', 'F')
)
BEGIN
    UPDATE `classmaster`.`faculty`
    SET
        `lname` = p_lname,
        `fname` = p_fname,
        `mname` = p_mname,
        `degree` = p_degree,
        `specialization` = p_specialization,
        `email` = p_email,
        `prc_license_num` = p_prc_license_num,
        `mobile_num` = p_mobile_num,
        `birthdate` = p_birthdate,
        `sex` = p_sex,
		`status` = "Active"
    WHERE `employee_id` = p_employee_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `updateSchedule` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`admin`@`localhost` PROCEDURE `updateSchedule`(IN `scheduleId` VARCHAR(50), IN `shift` VARCHAR(10), IN `modality` VARCHAR(20), IN `dayOfWeek` VARCHAR(20), IN `startTime` TIME, IN `endTime` TIME)
BEGIN
    UPDATE classmaster.schedule
    SET shift = shift, 
        modality = modality, 
        day_of_week = dayOfWeek, 
        start_time = startTime, 
        end_time = endTime
    WHERE schedule_id = scheduleId;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `updateSection` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`admin`@`localhost` PROCEDURE `updateSection`(IN p_student_id CHAR(8), IN p_section_id CHAR(5))
BEGIN
UPDATE `classmaster`.`student`
SET
`section_id` = p_section_id
WHERE `student_id` = p_student_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `updateSubjectInfo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`admin`@`localhost` PROCEDURE `updateSubjectInfo`(
    IN p_subject_id CHAR(5),
    IN p_subject_name VARCHAR(100),
    IN p_subject_type ENUM('General', 'Specialized'),
    IN p_subject_lvl ENUM('11', '12'),
    IN p_semester INT,
    IN p_unit INT,
    IN p_domain_name CHAR(20),
    IN p_strand_name CHAR(20)
)
BEGIN
    UPDATE `classmaster`.`subject`
    SET 
        `subject_name` = p_subject_name,
        `subject_type` = p_subject_type,
        `subject_lvl` = p_subject_lvl,
        `semester` = p_semester,
        `unit` = p_unit,
        `domain_id` = GETDOMAINID(p_domain_name),
        `strand_id` = GETSTRANDID(p_strand_name)
    WHERE 
        `subject_id` = p_subject_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `cohortlist`
--

/*!50001 DROP VIEW IF EXISTS `cohortlist`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`admin`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `cohortlist` AS select `c`.`cohort_id` AS `cohort_id`,`c`.`cohort_name` AS `cohort_name`,`c`.`description` AS `description`,`f`.`employee_id` AS `employee_id`,concat(`f`.`lname`,', ',`f`.`fname`,' ',`f`.`mname`) AS `learning_supervisor`,`GETLEARNINGFACILITATOR`(`c`.`cohort_name`) AS `learning_facilitator`,group_concat(distinct `st`.`strand_name` order by `st`.`strand_name` ASC separator ', ') AS `associated_strands` from ((((`cohort` `c` left join `cohort_assignment` `ca` on(((`c`.`cohort_id` = `ca`.`cohort_id`) and (`ca`.`designation` = 'Learning Supervisor')))) left join `faculty` `f` on((`ca`.`employee_id` = `f`.`employee_id`))) left join `section` `s` on((`c`.`cohort_id` = `s`.`cohort_id`))) left join `strand` `st` on((`s`.`strand_id` = `st`.`strand_id`))) group by `c`.`cohort_id`,`c`.`cohort_name`,`c`.`description`,`f`.`employee_id`,`f`.`lname`,`f`.`fname`,`f`.`mname` order by `c`.`cohort_id` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `cohortloadingview`
--

/*!50001 DROP VIEW IF EXISTS `cohortloadingview`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`admin`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `cohortloadingview` AS select distinct `f`.`employee_id` AS `employee_id`,concat(`f`.`lname`,', ',`f`.`fname`,' ',`f`.`mname`) AS `name`,`f`.`specialization` AS `specialization`,`GETCOHORT`(`f`.`employee_id`) AS `cohort`,`GETUNITLOAD`(`f`.`employee_id`) AS `unit_load` from (((`faculty` `f` left join `cohortloading` `c` on((`f`.`employee_id` = `c`.`employee_id`))) left join `section` `s` on((`c`.`section_id` = `s`.`section_id`))) left join `cohort` `ch` on((`s`.`cohort_id` = `ch`.`cohort_id`))) order by concat(`f`.`lname`,', ',`f`.`fname`,' ',`f`.`mname`) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `facultylist`
--

/*!50001 DROP VIEW IF EXISTS `facultylist`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`admin`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `facultylist` AS select `faculty`.`employee_id` AS `employee_id`,concat(`faculty`.`lname`,', ',`faculty`.`fname`,' ',`faculty`.`mname`) AS `name`,`faculty`.`degree` AS `degree`,`faculty`.`specialization` AS `specialization`,`faculty`.`sex` AS `sex`,`faculty`.`status` AS `status` from `faculty` order by concat(`faculty`.`lname`,', ',`faculty`.`fname`,' ',`faculty`.`mname`) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `schedule_view_table`
--

/*!50001 DROP VIEW IF EXISTS `schedule_view_table`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`admin`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `schedule_view_table` AS select `f`.`employee_id` AS `employee_num`,concat(`f`.`lname`,', ',`f`.`fname`,' ',`f`.`mname`) AS `faculty_name`,`f`.`specialization` AS `specialization`,`s`.`schedule_id` AS `schedule_id`,`s`.`shift` AS `shift`,`s`.`modality` AS `modality`,`s`.`day_of_week` AS `day_of_week`,replace(`s`.`start_time`,'00:00:00','') AS `start_time`,replace(`s`.`end_time`,'00:00:00','') AS `end_time`,`c`.`cohortloading_id` AS `cohortloading_id`,`d`.`domain_name` AS `domain`,`d`.`domain_id` AS `domain_id`,`sc`.`section_name` AS `section_name`,`sc`.`section_id` AS `section_id`,`c`.`status` AS `status` from ((((`cohortloading` `c` left join `faculty` `f` on((`c`.`employee_id` = `f`.`employee_id`))) left join `schedule` `s` on((`c`.`cohortloading_id` = `s`.`cohortloading_id`))) left join `domain` `d` on((`c`.`domain_id` = `d`.`domain_id`))) left join `section` `sc` on((`c`.`section_id` = `sc`.`section_id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `sectionlist`
--

/*!50001 DROP VIEW IF EXISTS `sectionlist`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`admin`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `sectionlist` AS select `s`.`section_name` AS `section_name`,`st`.`strand_name` AS `strand_name`,`r`.`room_name` AS `room_name`,concat(`f`.`lname`,', ',`f`.`fname`,' ',`f`.`mname`) AS `adviser` from ((((`section` `s` left join `cohortloading` `cl` on(((`s`.`section_id` = `cl`.`section_id`) and (`cl`.`adviser` = 1) and (`cl`.`status` = 'Active')))) left join `strand` `st` on((`s`.`strand_id` = `st`.`strand_id`))) left join `room` `r` on((`s`.`room_id` = `r`.`room_id`))) left join `faculty` `f` on((`cl`.`employee_id` = `f`.`employee_id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `studentlist`
--

/*!50001 DROP VIEW IF EXISTS `studentlist`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`admin`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `studentlist` AS select `student`.`student_id` AS `student_id`,`student`.`lrn` AS `lrn`,`student`.`name` AS `name`,`student`.`gwa` AS `gwa`,`student`.`gender` AS `gender`,`student`.`birthdate` AS `birthdate`,`student`.`clsf` AS `clsf`,`student`.`track` AS `track`,`student`.`strand` AS `strand`,`student`.`grade_level` AS `grade_level`,`student`.`shift` AS `shift`,`student`.`modality` AS `modality`,`student`.`date_enrolled` AS `date_enrolled`,`student`.`email` AS `email`,`student`.`mobile_num` AS `mobile_num`,`student`.`home_address` AS `home_address`,`student`.`school_last_attended` AS `school_last_attended`,`student`.`household_income` AS `household_income`,`student`.`mother_name` AS `mother_name`,`student`.`mother_mobile_no` AS `mother_mobile_no`,`student`.`father_name` AS `father_name`,`student`.`father_mobile_no` AS `father_mobile_no`,`student`.`guardian` AS `guardian`,`student`.`guardian_mobile_no` AS `guardian_mobile_no`,`student`.`specialization` AS `specialization`,`student`.`section_id` AS `section_id` from `student` where ((`student`.`section_id` is null) or (`student`.`section_id` = '')) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `subjectlist`
--

/*!50001 DROP VIEW IF EXISTS `subjectlist`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`admin`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `subjectlist` AS select `s`.`subject_id` AS `subject_id`,`s`.`subject_name` AS `subject_name`,`s`.`subject_type` AS `subject_type`,`s`.`subject_lvl` AS `subject_lvl`,`s`.`semester` AS `semester`,`s`.`unit` AS `unit`,`d`.`domain_id` AS `domain_id`,`d`.`domain_name` AS `domain_name`,`st`.`strand_name` AS `strand_name` from ((`subject` `s` join `domain` `d` on((`s`.`domain_id` = `d`.`domain_id`))) left join `strand` `st` on((`s`.`strand_id` = `st`.`strand_id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-12-11 12:13:25
