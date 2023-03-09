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
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-01-13  8:53:03
