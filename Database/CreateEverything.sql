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
-- Table structure for table `janta`
--

DROP TABLE IF EXISTS `janta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `janta` (
  `idjanta` int NOT NULL,
  `diametru` int NOT NULL DEFAULT '15',
  `pathPoza` varchar(100) NOT NULL DEFAULT 'empty.jpg',
  `nume` varchar(100) NOT NULL,
  `pret` int NOT NULL,
  PRIMARY KEY (`idjanta`),
  UNIQUE KEY `idjanta_UNIQUE` (`idjanta`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `janta`
--

LOCK TABLES `janta` WRITE;
/*!40000 ALTER TABLE `janta` DISABLE KEYS */;
INSERT INTO `janta` VALUES (1,16,'multispoke.png','multispoke',2000),(2,17,'diamond.png','Diamond',3000),(3,19,'luxury.png','Luxury',3200),(4,17,'jantaE36.png','OZ',3500);
/*!40000 ALTER TABLE `janta` ENABLE KEYS */;
UNLOCK TABLES;

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

--
-- Table structure for table `motor`
--

DROP TABLE IF EXISTS `motor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `motor` (
  `idmotor` int NOT NULL,
  `capacitate` int NOT NULL DEFAULT '0',
  `putere` int NOT NULL,
  `cuplu` int NOT NULL,
  `consum` double NOT NULL,
  `pret` int NOT NULL,
  `nume` varchar(45) NOT NULL,
  PRIMARY KEY (`idmotor`),
  UNIQUE KEY `idmotor_UNIQUE` (`idmotor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `motor`
--

LOCK TABLES `motor` WRITE;
/*!40000 ALTER TABLE `motor` DISABLE KEYS */;
INSERT INTO `motor` VALUES (1,1990,343,500,3.5,4980,'2.0 Hybrid'),(2,1598,150,200,5.5,0,'1.6 TCI'),(3,1898,105,300,4.7,2370,'1.9 TDI');
/*!40000 ALTER TABLE `motor` ENABLE KEYS */;
UNLOCK TABLES;

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

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `iduser` int NOT NULL AUTO_INCREMENT,
  `username` varchar(45) NOT NULL,
  `password` varchar(200) NOT NULL,
  PRIMARY KEY (`iduser`),
  UNIQUE KEY `iduser_UNIQUE` (`iduser`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'Andrei','$2a$10$yi84228rrH7n6AGyZl/i9ODqFqOd6GLBB1HUxLDzZwjC7NMhadQ52'),(2,'Vlad','$2a$10$KCGL1oJsbxousxOi1gUlu.mW8i4D2BVB3LQU85E6lo7UdMFkAlSyq'),(3,'Vlad2','$2a$10$S3WOclsRMSKNJ7GMbfv.j.f/t43vLgcYHgGxa0jhXlRcmlVDdZOQ2'),(4,'a','$2a$10$TNIaPfFtFRK2fzkmFWkyOuq7TtU3lEVkJMbfs3vT5jasuL/5CXjsC'),(5,'a2','$2a$10$JYEHAKi6/HnSa.Z9jWjxEO9IRT2DaRvW/KlWu81oL0rIPlRjsUmFG'),(6,'a22','$2a$10$bnGeLwLeXXIkaNhXLZA1eOjn5EULaWv1.3SY8QBpVu8soR3zgObim'),(7,'vdsv','$2a$10$eKkyKBbOuNdIty8uBI3dTOEprMb.w5IW5BqabrakHIMOdqVP9aIre'),(8,'asd','$2a$10$X1iUk45f7UpDp3hvs.2pa.kd6hLlavTOx.1l0.QYWGvbtgGxkVhhe'),(9,'asd2','$2a$10$pVmCGOz5JuepVYzoxRe8BeGXJt0XZm9Mx1peo3q3Av.1UIbb6hlO6'),(10,'fsb','$2a$10$wtEgFzFVfnI51ICmpXUFEefjPSFPwfcscsHFc6KpM8zKk1ERO89LS'),(11,'asd22222','$2a$10$N9fT0Li0VqaMXczeZXBhQOp041vAkeG/e2JGP0mlgenoOzMjdOtfO'),(12,'aadsvdasv','$2a$10$nnqEaUXnFZeCTJUdYWbR4.8.lbGsFWmxJHCtJY42sp5kkk6mxcc3a'),(13,'asd65675','$2a$10$0Hbo877EXzOJD2sxzNEBweEXHY/MY61hU.1PpoNoVpQ5.zRpt76ly'),(14,'','$2a$10$pEWAPKjEX9A6Y11MGMhSn.UShfDFpia2y.1yWbF6OD2W7gxKnitFS'),(15,'s','$2a$10$J5zzy4Wsg2icHUO3LceEwutZOHaHDLxoDdameofqp7Prv9hrVj0Aa'),(16,'ss','$2a$10$tsOzrhCw1uJaSP9.4lg30.FVzZsPpjyCZNZnG4gMGWZYLaaeA9huu'),(17,'aa','$2a$10$tgCLoJsl3jBEDrZOQXSvTutNKIjN0WXjYA76sZiGEFiU.gPJ0Owb6'),(18,'asdf','$2a$10$HwHBY.SZBj4wjnd7zqfm5OIZHVBQgN9/PoXNG4UPhfTX4IptIKx5.'),(19,'asadasdasd','$2a$10$m5A5/rmcBPfeZ10UFGyy4uT3PnSlD/sR9O2Q7gg5kj/gzRsDvOz3C'),(20,'asddsfadsfad','$2a$10$iRJ7EsgsyL7WKZJdgJDPbO097s8Rfxhs1gVJBoAviRVobgF17S7tG'),(21,'aaa','$2a$10$sfIrI6B4Z0aVUR7cmgK7YO.CAbbOKwPPfXo4ZwjGU6cPc8KVn51Tm'),(22,'abc123','$2a$10$9e3ybQS2UUmiheRGJOTD8enwTkyc0dcDMYmSiXpw8KYvypUYtvZ2y'),(23,'asdfdavdasvdasd','$2a$10$Gbq8p2U04kzKl1QtpPvJ8OOfkChZexzWxmwMtn/4/Wot5Yw5VlW3u'),(24,'username','$2a$10$eKsGWbfkkUh0io1SdFlITuZa3YU664DkWupSrdMEfaenxsTTKT1XS');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vopsea`
--

DROP TABLE IF EXISTS `vopsea`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vopsea` (
  `idvopsea` int NOT NULL,
  `nume` varchar(45) NOT NULL,
  `codVopsea` varchar(50) NOT NULL DEFAULT '#FFFFFF',
  `pret` int NOT NULL,
  PRIMARY KEY (`idvopsea`),
  UNIQUE KEY `idvopsea_UNIQUE` (`idvopsea`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vopsea`
--

LOCK TABLES `vopsea` WRITE;
/*!40000 ALTER TABLE `vopsea` DISABLE KEYS */;
INSERT INTO `vopsea` VALUES (1,'Alb perlat','masina_alb.png',2000),(2,'Albastru turcuaz','masina_albastru.png',3400),(3,'Mov','masina_violet.png',4750),(4,'Dunkelgrunn 2','E36.png',5000);
/*!40000 ALTER TABLE `vopsea` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-01-13  8:54:23
