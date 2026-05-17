-- MySQL dump 10.13  Distrib 8.0.45, for Win64 (x86_64)
--
-- Host: localhost    Database: project
-- ------------------------------------------------------
-- Server version	9.6.0

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
SET @MYSQLDUMP_TEMP_LOG_BIN = @@SESSION.SQL_LOG_BIN;
SET @@SESSION.SQL_LOG_BIN= 0;

--
-- GTID state at the beginning of the backup 
--

SET @@GLOBAL.GTID_PURGED=/*!80000 '+'*/ 'e0355b8c-32a9-11f1-89f6-a8595f8c6b25:1-31';

--
-- Table structure for table `booking_log`
--

DROP TABLE IF EXISTS `booking_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `booking_log` (
  `Log_ID` int NOT NULL AUTO_INCREMENT,
  `Ticket_ID` int DEFAULT NULL,
  `Passenger_ID` int DEFAULT NULL,
  `Booked_At` datetime DEFAULT NULL,
  `Action` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`Log_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `booking_log`
--

LOCK TABLES `booking_log` WRITE;
/*!40000 ALTER TABLE `booking_log` DISABLE KEYS */;
INSERT INTO `booking_log` VALUES (1,11,1,'2026-04-08 13:56:39','BOOKED'),(2,1,1,'2026-04-08 13:58:02','CANCELLED'),(3,12,1,'2026-04-08 15:52:30','BOOKED'),(4,3,3,'2026-04-08 15:54:56','CANCELLED');
/*!40000 ALTER TABLE `booking_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `coach`
--

DROP TABLE IF EXISTS `coach`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `coach` (
  `Coach_ID` int NOT NULL AUTO_INCREMENT,
  `Train_ID` int NOT NULL,
  `Coach_Number` varchar(5) NOT NULL,
  `Coach_Type` varchar(10) DEFAULT NULL,
  `Total_Seats` int NOT NULL,
  `Fare_Per_Seat` decimal(8,2) NOT NULL,
  PRIMARY KEY (`Coach_ID`),
  KEY `Train_ID` (`Train_ID`),
  CONSTRAINT `coach_ibfk_1` FOREIGN KEY (`Train_ID`) REFERENCES `train` (`Train_ID`),
  CONSTRAINT `coach_chk_1` CHECK ((`Coach_Type` in (_utf8mb4'SL',_utf8mb4'3A',_utf8mb4'2A',_utf8mb4'1A',_utf8mb4'CC',_utf8mb4'EC'))),
  CONSTRAINT `coach_chk_2` CHECK ((`Total_Seats` > 0)),
  CONSTRAINT `coach_chk_3` CHECK ((`Fare_Per_Seat` > 0))
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `coach`
--

LOCK TABLES `coach` WRITE;
/*!40000 ALTER TABLE `coach` DISABLE KEYS */;
INSERT INTO `coach` VALUES (1,1,'S1','SL',72,450.00),(2,1,'A1','3A',64,1200.00),(3,1,'B1','2A',46,1850.00),(4,2,'C1','CC',78,800.00),(5,2,'C2','CC',78,800.00),(6,3,'S1','SL',72,520.00),(7,3,'A1','3A',64,1350.00),(8,4,'S1','SL',72,380.00),(9,5,'C1','CC',78,750.00),(10,5,'C2','EC',56,1400.00);
/*!40000 ALTER TABLE `coach` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `passenger`
--

DROP TABLE IF EXISTS `passenger`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `passenger` (
  `Passenger_ID` int NOT NULL AUTO_INCREMENT,
  `Full_Name` varchar(100) NOT NULL,
  `DOB` date NOT NULL,
  `Gender` char(1) DEFAULT NULL,
  `Phone` varchar(15) NOT NULL,
  `Email` varchar(100) DEFAULT NULL,
  `Address` varchar(255) DEFAULT NULL,
  `Registered_On` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`Passenger_ID`),
  UNIQUE KEY `Phone` (`Phone`),
  UNIQUE KEY `Email` (`Email`),
  CONSTRAINT `passenger_chk_1` CHECK ((`Gender` in (_utf8mb4'M',_utf8mb4'F',_utf8mb4'O')))
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `passenger`
--

LOCK TABLES `passenger` WRITE;
/*!40000 ALTER TABLE `passenger` DISABLE KEYS */;
INSERT INTO `passenger` VALUES (1,'Arjun Sharma','1998-05-12','M','9876543210','arjun@gmail.com','Delhi','2026-04-07 23:50:18'),(2,'Priya Reddy','2000-08-25','F','9823456789','priya@yahoo.com','Hyderabad','2026-04-07 23:50:18'),(3,'Ravi Kumar','1995-11-03','M','9712345678','ravi@gmail.com','Mumbai','2026-04-07 23:50:18'),(4,'Anita Patel','1999-02-14','F','9634512378','anita@gmail.com','Ahmedabad','2026-04-07 23:50:18'),(5,'Suresh Nair','1992-07-19','M','9512378456','suresh@gmail.com','Kochi','2026-04-07 23:50:18'),(6,'Deepika Singh','2001-03-30','F','9456123789','deepika@gmail.com','Lucknow','2026-04-07 23:50:18'),(7,'Kiran Rao','1997-09-22','M','9345678912','kiran@gmail.com','Bangalore','2026-04-07 23:50:18'),(8,'Meena Iyer','1993-12-07','F','9234567890','meena@gmail.com','Chennai','2026-04-07 23:50:18'),(9,'Vikram Bose','1990-06-17','M','9123456789','vikram@gmail.com','Kolkata','2026-04-07 23:50:18'),(10,'Sonal Joshi','2002-01-28','F','9011234567','sonal@gmail.com','Pune','2026-04-07 23:50:18');
/*!40000 ALTER TABLE `passenger` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment`
--

DROP TABLE IF EXISTS `payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payment` (
  `Payment_ID` int NOT NULL AUTO_INCREMENT,
  `Ticket_ID` int NOT NULL,
  `Passenger_ID` int NOT NULL,
  `Amount` decimal(10,2) NOT NULL,
  `Payment_Mode` varchar(20) DEFAULT NULL,
  `Transaction_ID` varchar(50) DEFAULT NULL,
  `Payment_Date` datetime DEFAULT CURRENT_TIMESTAMP,
  `Pay_Status` varchar(10) DEFAULT 'Success',
  PRIMARY KEY (`Payment_ID`),
  UNIQUE KEY `Transaction_ID` (`Transaction_ID`),
  KEY `Ticket_ID` (`Ticket_ID`),
  KEY `Passenger_ID` (`Passenger_ID`),
  CONSTRAINT `payment_ibfk_1` FOREIGN KEY (`Ticket_ID`) REFERENCES `ticket` (`Ticket_ID`),
  CONSTRAINT `payment_ibfk_2` FOREIGN KEY (`Passenger_ID`) REFERENCES `passenger` (`Passenger_ID`),
  CONSTRAINT `payment_chk_1` CHECK ((`Amount` > 0)),
  CONSTRAINT `payment_chk_2` CHECK ((`Payment_Mode` in (_utf8mb4'UPI',_utf8mb4'Card',_utf8mb4'NetBanking',_utf8mb4'Cash',_utf8mb4'Wallet'))),
  CONSTRAINT `payment_chk_3` CHECK ((`Pay_Status` in (_utf8mb4'Success',_utf8mb4'Failed',_utf8mb4'Pending')))
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment`
--

LOCK TABLES `payment` WRITE;
/*!40000 ALTER TABLE `payment` DISABLE KEYS */;
INSERT INTO `payment` VALUES (1,1,1,1200.00,'UPI','TXN001','2026-04-08 13:40:03','Success'),(2,2,2,450.00,'Card','TXN002','2026-04-08 13:40:03','Success'),(3,3,3,800.00,'NetBanking','TXN003','2026-04-08 13:40:03','Success'),(4,4,4,520.00,'UPI','TXN004','2026-04-08 13:40:03','Success'),(5,5,5,1850.00,'Wallet','TXN005','2026-04-08 13:40:03','Pending'),(6,6,6,800.00,'Card','TXN006','2026-04-08 13:40:03','Success'),(7,7,7,380.00,'UPI','TXN007','2026-04-08 13:40:03','Success'),(8,8,8,1350.00,'NetBanking','TXN008','2026-04-08 13:40:03','Failed'),(9,9,9,750.00,'Cash','TXN009','2026-04-08 13:40:03','Success'),(10,10,10,800.00,'UPI','TXN010','2026-04-08 13:40:03','Success');
/*!40000 ALTER TABLE `payment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `route`
--

DROP TABLE IF EXISTS `route`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `route` (
  `Route_ID` int NOT NULL AUTO_INCREMENT,
  `Train_ID` int NOT NULL,
  `Station_ID` int NOT NULL,
  `Stop_Number` int NOT NULL,
  `Scheduled_Arr` time DEFAULT NULL,
  `Scheduled_Dep` time DEFAULT NULL,
  `Distance_Km` int DEFAULT NULL,
  PRIMARY KEY (`Route_ID`),
  UNIQUE KEY `Train_ID` (`Train_ID`,`Stop_Number`),
  KEY `Station_ID` (`Station_ID`),
  CONSTRAINT `route_ibfk_1` FOREIGN KEY (`Train_ID`) REFERENCES `train` (`Train_ID`),
  CONSTRAINT `route_ibfk_2` FOREIGN KEY (`Station_ID`) REFERENCES `station` (`Station_ID`),
  CONSTRAINT `route_chk_1` CHECK ((`Distance_Km` >= 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `route`
--

LOCK TABLES `route` WRITE;
/*!40000 ALTER TABLE `route` DISABLE KEYS */;
/*!40000 ALTER TABLE `route` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `schedule`
--

DROP TABLE IF EXISTS `schedule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `schedule` (
  `Schedule_ID` int NOT NULL AUTO_INCREMENT,
  `Train_ID` int NOT NULL,
  `Source_Station` int NOT NULL,
  `Dest_Station` int NOT NULL,
  `Departure_Time` datetime NOT NULL,
  `Arrival_Time` datetime NOT NULL,
  `Journey_Date` date NOT NULL,
  PRIMARY KEY (`Schedule_ID`),
  KEY `Train_ID` (`Train_ID`),
  KEY `Source_Station` (`Source_Station`),
  KEY `Dest_Station` (`Dest_Station`),
  CONSTRAINT `schedule_ibfk_1` FOREIGN KEY (`Train_ID`) REFERENCES `train` (`Train_ID`),
  CONSTRAINT `schedule_ibfk_2` FOREIGN KEY (`Source_Station`) REFERENCES `station` (`Station_ID`),
  CONSTRAINT `schedule_ibfk_3` FOREIGN KEY (`Dest_Station`) REFERENCES `station` (`Station_ID`),
  CONSTRAINT `schedule_chk_1` CHECK ((`Arrival_Time` > `Departure_Time`))
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schedule`
--

LOCK TABLES `schedule` WRITE;
/*!40000 ALTER TABLE `schedule` DISABLE KEYS */;
INSERT INTO `schedule` VALUES (1,1,1,2,'2025-06-10 08:00:00','2025-06-10 12:00:00','2025-06-10'),(2,1,1,3,'2025-06-10 09:00:00','2025-06-10 13:00:00','2025-06-10'),(3,2,2,3,'2025-06-11 07:00:00','2025-06-11 11:00:00','2025-06-11'),(4,3,3,4,'2025-06-12 10:00:00','2025-06-12 15:00:00','2025-06-12'),(5,4,4,5,'2025-06-13 06:00:00','2025-06-13 10:00:00','2025-06-13'),(6,5,5,6,'2025-06-14 14:00:00','2025-06-14 20:00:00','2025-06-14');
/*!40000 ALTER TABLE `schedule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `station`
--

DROP TABLE IF EXISTS `station`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `station` (
  `Station_ID` int NOT NULL AUTO_INCREMENT,
  `Station_Code` varchar(5) NOT NULL,
  `Station_Name` varchar(100) NOT NULL,
  `City` varchar(50) NOT NULL,
  `State` varchar(50) NOT NULL,
  `Platform_Count` int DEFAULT '1',
  PRIMARY KEY (`Station_ID`),
  UNIQUE KEY `Station_Code` (`Station_Code`),
  CONSTRAINT `station_chk_1` CHECK ((`Platform_Count` >= 1))
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `station`
--

LOCK TABLES `station` WRITE;
/*!40000 ALTER TABLE `station` DISABLE KEYS */;
INSERT INTO `station` VALUES (1,'NDLS','New Delhi','New Delhi','Delhi',16),(2,'BCT','Bandra Terminus','Mumbai','Maharashtra',7),(3,'MAS','Chennai Central','Chennai','Tamil Nadu',12),(4,'HYB','Hyderabad Deccan','Hyderabad','Telangana',10),(5,'SBC','KSR Bangalore','Bangalore','Karnataka',10),(6,'HWH','Howrah Junction','Kolkata','West Bengal',23);
/*!40000 ALTER TABLE `station` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ticket`
--

DROP TABLE IF EXISTS `ticket`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ticket` (
  `Ticket_ID` int NOT NULL AUTO_INCREMENT,
  `Passenger_ID` int NOT NULL,
  `Schedule_ID` int NOT NULL,
  `Coach_ID` int NOT NULL,
  `Seat_Number` varchar(5) NOT NULL,
  `Booking_Date` datetime DEFAULT CURRENT_TIMESTAMP,
  `Journey_Date` date NOT NULL,
  `Ticket_Status` varchar(15) DEFAULT 'Confirmed',
  `Total_Fare` decimal(10,2) NOT NULL,
  PRIMARY KEY (`Ticket_ID`),
  KEY `Passenger_ID` (`Passenger_ID`),
  KEY `Schedule_ID` (`Schedule_ID`),
  KEY `Coach_ID` (`Coach_ID`),
  CONSTRAINT `ticket_ibfk_1` FOREIGN KEY (`Passenger_ID`) REFERENCES `passenger` (`Passenger_ID`),
  CONSTRAINT `ticket_ibfk_2` FOREIGN KEY (`Schedule_ID`) REFERENCES `schedule` (`Schedule_ID`),
  CONSTRAINT `ticket_ibfk_3` FOREIGN KEY (`Coach_ID`) REFERENCES `coach` (`Coach_ID`),
  CONSTRAINT `ticket_chk_1` CHECK ((`Ticket_Status` in (_utf8mb4'Confirmed',_utf8mb4'Waitlist',_utf8mb4'Cancelled')))
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ticket`
--

LOCK TABLES `ticket` WRITE;
/*!40000 ALTER TABLE `ticket` DISABLE KEYS */;
INSERT INTO `ticket` VALUES (1,1,1,2,'A1-12','2026-04-08 12:59:51','2025-06-10','Cancelled',1200.00),(2,2,1,1,'S1-34','2026-04-08 12:59:51','2025-06-10','Confirmed',450.00),(3,3,2,4,'C1-05','2026-04-08 12:59:51','2025-06-11','Cancelled',800.00),(4,4,3,6,'S1-22','2026-04-08 12:59:51','2025-06-12','Confirmed',520.00),(5,5,1,3,'B1-08','2026-04-08 12:59:51','2025-06-10','Waitlist',1850.00),(6,6,2,5,'C2-15','2026-04-08 12:59:51','2025-06-11','Confirmed',800.00),(7,7,4,8,'S1-44','2026-04-08 12:59:51','2025-06-13','Confirmed',380.00),(8,8,3,7,'A1-30','2026-04-08 12:59:51','2025-06-12','Cancelled',1350.00),(9,9,5,9,'C1-01','2026-04-08 12:59:51','2025-06-14','Confirmed',750.00),(10,10,2,4,'C1-50','2026-04-08 12:59:51','2025-06-11','Confirmed',800.00),(11,1,1,2,'A1-55','2026-04-08 13:56:39','2025-06-10','Confirmed',1200.00),(12,1,1,2,'B1-12','2026-04-08 15:52:30','2025-06-15','Confirmed',850.00);
/*!40000 ALTER TABLE `ticket` ENABLE KEYS */;
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `trg_After_Ticket_Insert` AFTER INSERT ON `ticket` FOR EACH ROW BEGIN
    IF NEW.Ticket_Status = 'Confirmed' THEN
        INSERT INTO BOOKING_LOG
        (Ticket_ID, Passenger_ID, Booked_At, Action)
        VALUES
        (NEW.Ticket_ID, NEW.Passenger_ID, NOW(), 'BOOKED');
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `trg_Before_Cancel` BEFORE UPDATE ON `ticket` FOR EACH ROW BEGIN
    IF NEW.Ticket_Status = 'Cancelled' AND OLD.Ticket_Status = 'Confirmed' THEN
        INSERT INTO BOOKING_LOG
        (Ticket_ID, Passenger_ID, Booked_At, Action)
        VALUES
        (OLD.Ticket_ID, OLD.Passenger_ID, NOW(), 'CANCELLED');
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `train`
--

DROP TABLE IF EXISTS `train`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `train` (
  `Train_ID` int NOT NULL AUTO_INCREMENT,
  `Train_Name` varchar(100) NOT NULL,
  `Train_Number` varchar(10) NOT NULL,
  `Train_Type` varchar(30) DEFAULT NULL,
  `Total_Coaches` int NOT NULL,
  `Status` varchar(10) DEFAULT 'Active',
  PRIMARY KEY (`Train_ID`),
  UNIQUE KEY `Train_Number` (`Train_Number`),
  CONSTRAINT `train_chk_1` CHECK ((`Train_Type` in (_utf8mb4'Express',_utf8mb4'Superfast',_utf8mb4'Local',_utf8mb4'Rajdhani',_utf8mb4'Shatabdi'))),
  CONSTRAINT `train_chk_2` CHECK ((`Total_Coaches` > 0)),
  CONSTRAINT `train_chk_3` CHECK ((`Status` in (_utf8mb4'Active',_utf8mb4'Inactive')))
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `train`
--

LOCK TABLES `train` WRITE;
/*!40000 ALTER TABLE `train` DISABLE KEYS */;
INSERT INTO `train` VALUES (1,'Rajdhani Express','12301','Rajdhani',20,'Active'),(2,'Shatabdi Express','12002','Shatabdi',16,'Active'),(3,'Duronto Express','12213','Superfast',22,'Active'),(4,'Garib Rath','12909','Express',18,'Active'),(5,'Jan Shatabdi','12051','Superfast',14,'Active');
/*!40000 ALTER TABLE `train` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `vw_confirmed_bookings`
--

DROP TABLE IF EXISTS `vw_confirmed_bookings`;
/*!50001 DROP VIEW IF EXISTS `vw_confirmed_bookings`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_confirmed_bookings` AS SELECT 
 1 AS `Ticket_ID`,
 1 AS `Passenger_Name`,
 1 AS `Phone`,
 1 AS `Train_Name`,
 1 AS `Train_Number`,
 1 AS `Coach_Type`,
 1 AS `Seat_Number`,
 1 AS `Journey_Date`,
 1 AS `Total_Fare`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_passenger_history`
--

DROP TABLE IF EXISTS `vw_passenger_history`;
/*!50001 DROP VIEW IF EXISTS `vw_passenger_history`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_passenger_history` AS SELECT 
 1 AS `Passenger_ID`,
 1 AS `Full_Name`,
 1 AS `Ticket_ID`,
 1 AS `Journey_Date`,
 1 AS `Ticket_Status`,
 1 AS `Total_Fare`,
 1 AS `Payment_Mode`,
 1 AS `Pay_Status`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_train_revenue`
--

DROP TABLE IF EXISTS `vw_train_revenue`;
/*!50001 DROP VIEW IF EXISTS `vw_train_revenue`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_train_revenue` AS SELECT 
 1 AS `Train_Name`,
 1 AS `Train_Number`,
 1 AS `Total_Tickets`,
 1 AS `Total_Revenue`,
 1 AS `Avg_Ticket_Fare`*/;
SET character_set_client = @saved_cs_client;

--
-- Dumping routines for database 'project'
--
/*!50003 DROP PROCEDURE IF EXISTS `sp_BookTicket` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_BookTicket`(
    IN p_Passenger_ID INT,
    IN p_Schedule_ID  INT,
    IN p_Coach_ID     INT,
    IN p_Seat_Number  VARCHAR(5),
    IN p_Journey_Date DATE,
    IN p_Total_Fare   DECIMAL(10,2)
)
BEGIN
    INSERT INTO TICKET (
        Passenger_ID, Schedule_ID, Coach_ID,
        Seat_Number, Journey_Date, Ticket_Status, Total_Fare
    )
    VALUES (
        p_Passenger_ID, p_Schedule_ID, p_Coach_ID,
        p_Seat_Number, p_Journey_Date, 'Confirmed', p_Total_Fare
    );

    SELECT LAST_INSERT_ID() AS New_Ticket_ID;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_CancelTicket` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_CancelTicket`(
    IN p_Ticket_ID INT
)
BEGIN
    DECLARE current_status VARCHAR(15);

    SELECT Ticket_Status INTO current_status
    FROM TICKET
    WHERE Ticket_ID = p_Ticket_ID;

    IF current_status = 'Confirmed' THEN
        UPDATE TICKET
        SET Ticket_Status = 'Cancelled'
        WHERE Ticket_ID = p_Ticket_ID;

        SELECT 'Ticket successfully cancelled.' AS Message;
    ELSE
        SELECT 'Cancellation not allowed: Ticket is not in Confirmed state.' AS Message;
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_PassengerHistory` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_PassengerHistory`(
    IN p_Passenger_ID INT
)
BEGIN
    SELECT
        T.Ticket_ID,
        TR.Train_Name,
        TR.Train_Number,
        T.Journey_Date,
        C.Coach_Type,
        T.Seat_Number,
        T.Ticket_Status,
        T.Total_Fare,
        PAY.Payment_Mode,
        PAY.Pay_Status
    FROM TICKET T
    JOIN SCHEDULE S   ON T.Schedule_ID  = S.Schedule_ID
    JOIN TRAIN TR     ON S.Train_ID     = TR.Train_ID
    JOIN COACH C      ON T.Coach_ID     = C.Coach_ID
    LEFT JOIN PAYMENT PAY ON T.Ticket_ID = PAY.Ticket_ID
    WHERE T.Passenger_ID = p_Passenger_ID
    ORDER BY T.Journey_Date DESC;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `vw_confirmed_bookings`
--

/*!50001 DROP VIEW IF EXISTS `vw_confirmed_bookings`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_confirmed_bookings` AS select `t`.`Ticket_ID` AS `Ticket_ID`,`p`.`Full_Name` AS `Passenger_Name`,`p`.`Phone` AS `Phone`,`tr`.`Train_Name` AS `Train_Name`,`tr`.`Train_Number` AS `Train_Number`,`c`.`Coach_Type` AS `Coach_Type`,`t`.`Seat_Number` AS `Seat_Number`,`t`.`Journey_Date` AS `Journey_Date`,`t`.`Total_Fare` AS `Total_Fare` from ((((`ticket` `t` join `passenger` `p` on((`t`.`Passenger_ID` = `p`.`Passenger_ID`))) join `schedule` `s` on((`t`.`Schedule_ID` = `s`.`Schedule_ID`))) join `train` `tr` on((`s`.`Train_ID` = `tr`.`Train_ID`))) join `coach` `c` on((`t`.`Coach_ID` = `c`.`Coach_ID`))) where (`t`.`Ticket_Status` = 'Confirmed') */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_passenger_history`
--

/*!50001 DROP VIEW IF EXISTS `vw_passenger_history`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_passenger_history` AS select `p`.`Passenger_ID` AS `Passenger_ID`,`p`.`Full_Name` AS `Full_Name`,`t`.`Ticket_ID` AS `Ticket_ID`,`t`.`Journey_Date` AS `Journey_Date`,`t`.`Ticket_Status` AS `Ticket_Status`,`t`.`Total_Fare` AS `Total_Fare`,`pay`.`Payment_Mode` AS `Payment_Mode`,`pay`.`Pay_Status` AS `Pay_Status` from ((`passenger` `p` left join `ticket` `t` on((`p`.`Passenger_ID` = `t`.`Passenger_ID`))) left join `payment` `pay` on((`t`.`Ticket_ID` = `pay`.`Ticket_ID`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_train_revenue`
--

/*!50001 DROP VIEW IF EXISTS `vw_train_revenue`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_train_revenue` AS select `tr`.`Train_Name` AS `Train_Name`,`tr`.`Train_Number` AS `Train_Number`,count(`t`.`Ticket_ID`) AS `Total_Tickets`,sum(`t`.`Total_Fare`) AS `Total_Revenue`,avg(`t`.`Total_Fare`) AS `Avg_Ticket_Fare` from ((`train` `tr` join `schedule` `s` on((`tr`.`Train_ID` = `s`.`Train_ID`))) join `ticket` `t` on((`s`.`Schedule_ID` = `t`.`Schedule_ID`))) where (`t`.`Ticket_Status` <> 'Cancelled') group by `tr`.`Train_ID`,`tr`.`Train_Name`,`tr`.`Train_Number` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
SET @@SESSION.SQL_LOG_BIN = @MYSQLDUMP_TEMP_LOG_BIN;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-05-17 20:34:24
