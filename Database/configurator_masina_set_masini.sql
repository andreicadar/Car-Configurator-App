CREATE DATABASE  IF NOT EXISTS `configurator_masina` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `configurator_masina`;
-- MySQL dump 10.13  Distrib 8.0.31, for Win64 (x86_64)
--
-- Host: localhost    Database: configurator_masina
-- ------------------------------------------------------
-- Server version	8.0.28

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
-- Table structure for table `set_masini`
--

DROP TABLE IF EXISTS `set_masini`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `set_masini` (
  `id_set_masini` int NOT NULL AUTO_INCREMENT,
  `userID` int NOT NULL,
  `masina_configurataID` int NOT NULL,
  PRIMARY KEY (`id_set_masini`),
  UNIQUE KEY `id_UNIQUE` (`id_set_masini`),
  KEY `userID_idx` (`userID`),
  KEY `masin_configurataID_idx` (`masina_configurataID`),
  CONSTRAINT `masin_configurataID` FOREIGN KEY (`masina_configurataID`) REFERENCES `masina_configurata` (`idmasina_configurata`),
  CONSTRAINT `userID` FOREIGN KEY (`userID`) REFERENCES `user` (`iduser`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `set_masini`
--

LOCK TABLES `set_masini` WRITE;
/*!40000 ALTER TABLE `set_masini` DISABLE KEYS */;
INSERT INTO `set_masini` VALUES (1,18,18),(2,18,19),(3,18,20),(4,18,21),(5,18,22),(6,18,23),(7,18,24),(8,18,25),(9,18,26),(10,20,27),(11,21,28),(12,21,29),(13,22,30),(14,22,31),(15,24,32);
/*!40000 ALTER TABLE `set_masini` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-01-13  8:53:03
