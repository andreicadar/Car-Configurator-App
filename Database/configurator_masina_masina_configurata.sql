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
-- Table structure for table `masina_configurata`
--

DROP TABLE IF EXISTS `masina_configurata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `masina_configurata` (
  `idmasina_configurata` int NOT NULL AUTO_INCREMENT,
  `jantaID` int NOT NULL,
  `vopseaID` int NOT NULL,
  `motorID` int NOT NULL,
  PRIMARY KEY (`idmasina_configurata`),
  UNIQUE KEY `idmasina_configurata_UNIQUE` (`idmasina_configurata`),
  KEY `jantaID_idx` (`jantaID`),
  KEY `vopseaID_idx` (`vopseaID`),
  KEY `motorID_idx` (`motorID`),
  CONSTRAINT `jantaID` FOREIGN KEY (`jantaID`) REFERENCES `janta` (`idjanta`),
  CONSTRAINT `motorID` FOREIGN KEY (`motorID`) REFERENCES `motor` (`idmotor`),
  CONSTRAINT `vopseaID` FOREIGN KEY (`vopseaID`) REFERENCES `vopsea` (`idvopsea`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `masina_configurata`
--

LOCK TABLES `masina_configurata` WRITE;
/*!40000 ALTER TABLE `masina_configurata` DISABLE KEYS */;
INSERT INTO `masina_configurata` VALUES (1,3,2,1),(2,3,2,1),(3,3,2,1),(4,3,2,1),(5,3,2,1),(6,3,2,1),(7,3,2,1),(8,3,2,1),(9,3,2,1),(10,3,2,1),(11,3,2,1),(12,3,2,1),(13,2,2,1),(14,1,1,1),(15,1,1,1),(16,1,1,1),(17,1,1,1),(18,1,1,1),(19,1,1,1),(20,3,1,1),(21,4,4,1),(22,2,2,1),(23,4,2,2),(24,2,2,2),(25,2,2,2),(26,2,2,2),(27,3,2,2),(28,2,2,1),(29,2,3,1),(30,4,4,3),(31,4,2,3),(32,4,4,3);
/*!40000 ALTER TABLE `masina_configurata` ENABLE KEYS */;
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
