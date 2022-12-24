CREATE DATABASE  IF NOT EXISTS `events_schema` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `events_schema`;
-- MySQL dump 10.13  Distrib 8.0.31, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: events_schema
-- ------------------------------------------------------
-- Server version	8.0.31

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
-- Table structure for table `event_types`
--

DROP TABLE IF EXISTS `event_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `event_types` (
  `id_event_type` int NOT NULL AUTO_INCREMENT,
  `title` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_event_type`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `event_types`
--

LOCK TABLES `event_types` WRITE;
/*!40000 ALTER TABLE `event_types` DISABLE KEYS */;
INSERT INTO `event_types` VALUES (9,'battle'),(10,'meeting'),(11,'peace treaty'),(12,'city foundation');
/*!40000 ALTER TABLE `event_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `events`
--

DROP TABLE IF EXISTS `events`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `events` (
  `id_event` int NOT NULL AUTO_INCREMENT,
  `id_event_type` int DEFAULT NULL,
  `title` varchar(45) DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  PRIMARY KEY (`id_event`),
  KEY `event_type_idx` (`id_event_type`),
  CONSTRAINT `event_type` FOREIGN KEY (`id_event_type`) REFERENCES `event_types` (`id_event_type`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `events`
--

LOCK TABLES `events` WRITE;
/*!40000 ALTER TABLE `events` DISABLE KEYS */;
INSERT INTO `events` VALUES (4,9,'battle vs. virus','2020-02-01','2022-12-24'),(5,10,'meeting on river Zoom','1976-10-01','1976-10-01'),(6,10,'meeting on Swamp square','2011-12-20','2011-12-20'),(7,11,'foundation of Brazilia','1960-04-21','1960-04-21');
/*!40000 ALTER TABLE `events` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `events_participants`
--

DROP TABLE IF EXISTS `events_participants`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `events_participants` (
  `id_participant2id_event` int NOT NULL AUTO_INCREMENT,
  `id_participant` int NOT NULL,
  `id_event` int NOT NULL,
  `id_participant_type` int NOT NULL,
  PRIMARY KEY (`id_participant2id_event`),
  KEY `id_event` (`id_event`) /*!80000 INVISIBLE */,
  KEY `id_participant_idx` (`id_participant`),
  KEY `id_participant_type_idx` (`id_participant_type`),
  CONSTRAINT `id_event` FOREIGN KEY (`id_event`) REFERENCES `events` (`id_event`),
  CONSTRAINT `id_participant` FOREIGN KEY (`id_participant`) REFERENCES `participants` (`id_participant`),
  CONSTRAINT `id_participant_type` FOREIGN KEY (`id_participant_type`) REFERENCES `participant_types` (`id_participant_type`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `events_participants`
--

LOCK TABLES `events_participants` WRITE;
/*!40000 ALTER TABLE `events_participants` DISABLE KEYS */;
INSERT INTO `events_participants` VALUES (1,1,4,1),(2,2,4,1),(3,4,5,2),(4,5,6,2),(5,3,7,3);
/*!40000 ALTER TABLE `events_participants` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `participant_types`
--

DROP TABLE IF EXISTS `participant_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `participant_types` (
  `id_participant_type` int NOT NULL,
  `title` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_participant_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `participant_types`
--

LOCK TABLES `participant_types` WRITE;
/*!40000 ALTER TABLE `participant_types` DISABLE KEYS */;
INSERT INTO `participant_types` VALUES (1,'combatant'),(2,'meeting participant'),(3,'actor');
/*!40000 ALTER TABLE `participant_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `participants`
--

DROP TABLE IF EXISTS `participants`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `participants` (
  `id_participant` int NOT NULL AUTO_INCREMENT,
  `title` varchar(45) DEFAULT NULL,
  `description` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_participant`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `participants`
--

LOCK TABLES `participants` WRITE;
/*!40000 ALTER TABLE `participants` DISABLE KEYS */;
INSERT INTO `participants` VALUES (1,'COVID','the greatest virus'),(2,'humanity','primates'),(3,'Juscelino Kubitschek','21st president of Brazil'),(4,'Napoleon','the greatest commander'),(5,'Shrek','ogre!');
/*!40000 ALTER TABLE `participants` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-12-24 15:50:07
