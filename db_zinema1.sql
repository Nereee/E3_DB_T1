CREATE DATABASE  IF NOT EXISTS `db_zinema1` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_spanish2_ci */;
USE `db_zinema1`;
-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: db_zinema1
-- ------------------------------------------------------
-- Server version	5.5.5-10.4.32-MariaDB

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
-- Table structure for table `areto`
--

DROP TABLE IF EXISTS `areto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `areto` (
  `id_areto` int(11) NOT NULL,
  `izena` varchar(30) DEFAULT NULL,
  `id_zinema` int(11) NOT NULL,
  PRIMARY KEY (`id_areto`,`id_zinema`),
  KEY `id_zinema` (`id_zinema`),
  CONSTRAINT `areto_ibfk_1` FOREIGN KEY (`id_zinema`) REFERENCES `zinema` (`id_zinema`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `areto`
--

LOCK TABLES `areto` WRITE;
/*!40000 ALTER TABLE `areto` DISABLE KEYS */;
INSERT INTO `areto` VALUES (1,'Aretoa 1',1),(1,'Aretoa 1',2),(1,'Aretoa 1 Jumior',3),(1,'Aretoa 1 Jumior',4),(2,'Aretoa 2',1),(2,'Aretoa 2',2),(2,'Aretoa 2 Junior',3),(2,'Aretoa 2 Junior',4),(3,'Aretoa 3 Junior',1),(3,'Aretoa 3',2),(3,'Aretoa 3 Handia',3),(3,'Aretoa 3',4),(4,'Aretoa 4 Junior',1),(4,'Aretoa 4',2),(4,'Aretoa 4 Junior',3),(4,'Aretoa 4',4),(5,'Aretoa 5 Premium',1),(5,'Aretoa 5 Premium',2),(5,'Aretoa 5 Junior',3),(5,'Aretoa 5 Handia',4),(6,'Aretoa 6 Handia',1),(6,'Aretoa 6 Premium',2),(6,'Aretoa 6 Handia',4),(7,'Aretoa 7 Junior',2),(7,'Aretoa 7 Premium',4),(8,'Aretoa 8 Jumior',2),(8,'Aretoa 8 Premium',4),(9,'Aretoa 9 Junior',2),(10,'Aretoa 10 Handia',2),(11,'Aretoa 11 Handia',2),(12,'Aretoa 12 Handia',2);
/*!40000 ALTER TABLE `areto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `erabiltzaile`
--

DROP TABLE IF EXISTS `erabiltzaile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `erabiltzaile` (
  `id_erabiltzaile` int(11) NOT NULL AUTO_INCREMENT,
  `izena` varchar(8) DEFAULT NULL,
  `e_izena` varchar(20) NOT NULL,
  `abizena` varchar(20) DEFAULT NULL,
  `pasahitza` varchar(15) DEFAULT NULL,
  `nan` varchar(9) DEFAULT NULL,
  `jaiotze_data` date DEFAULT NULL,
  `generoa` char(1) DEFAULT NULL,
  PRIMARY KEY (`id_erabiltzaile`),
  UNIQUE KEY `e_izena` (`e_izena`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `erabiltzaile`
--

LOCK TABLES `erabiltzaile` WRITE;
/*!40000 ALTER TABLE `erabiltzaile` DISABLE KEYS */;
INSERT INTO `erabiltzaile` VALUES (1,'Aitzol','Aitzol434','Sagardui','abcd1234','33334444J','2002-01-01','M'),(2,'Uxue','Uxue34','Gonzalez','clave123','88889999E','2002-11-20','F'),(3,'Andoni','Andoni','Salsidua','p123','44445555A','2002-03-12','M'),(4,'Oier','Oier65','Garcia','password123','55556666B','2002-05-23','M'),(5,'Jon','Jon8','Martinez','secure123','66667777C','2002-07-07','M'),(6,'Miguel','Miguel90','Sanchez','pass1234','77778888D','2002-09-15','M'),(7,'Ane','Ane','Etxebarria','contraseña123','99990000F','2002-12-31','F'),(8,'Maite','Maite','Zubizarreta','p@ssw0rd','11112222G','2003-02-14','F');
/*!40000 ALTER TABLE `erabiltzaile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `erosketa`
--

DROP TABLE IF EXISTS `erosketa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `erosketa` (
  `id_erosketa` int(11) NOT NULL AUTO_INCREMENT,
  `prezioa` decimal(30,2) DEFAULT NULL,
  `erosketa_data` date DEFAULT NULL,
  `descuento` decimal(5,2) DEFAULT 0.30,
  `id_erabiltzaile` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_erosketa`),
  KEY `id_erabiltzaile` (`id_erabiltzaile`),
  CONSTRAINT `erosketa_ibfk_1` FOREIGN KEY (`id_erabiltzaile`) REFERENCES `erabiltzaile` (`id_erabiltzaile`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `erosketa`
--

LOCK TABLES `erosketa` WRITE;
/*!40000 ALTER TABLE `erosketa` DISABLE KEYS */;
INSERT INTO `erosketa` VALUES (1,15.00,'2023-02-10',0.00,1),(2,24.00,'2023-02-11',0.20,1),(3,26.00,'2023-02-12',0.30,1),(4,15.00,'2023-02-13',0.00,1),(5,15.00,'2023-04-10',0.00,2),(6,15.00,'2023-07-15',0.00,2),(7,13.00,'2023-07-17',0.00,3),(8,17.00,'2023-07-19',0.00,3),(9,10.00,'2023-08-10',0.00,4),(10,10.00,'2023-08-10',0.00,4),(11,10.00,'2023-08-10',0.00,5),(12,18.50,'2023-09-12',0.10,5),(13,25.00,'2023-09-18',0.15,5),(14,14.00,'2023-09-20',0.00,6),(15,21.00,'2023-09-25',0.20,6),(16,19.50,'2023-09-30',0.00,6),(17,23.00,'2023-10-05',0.10,6),(18,12.00,'2023-10-10',0.00,7),(19,27.50,'2023-10-15',0.25,7),(20,16.00,'2023-10-20',0.00,8),(21,22.00,'2023-10-25',0.30,8);
/*!40000 ALTER TABLE `erosketa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `filma`
--

DROP TABLE IF EXISTS `filma`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `filma` (
  `id_filma` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `izena` varchar(40) DEFAULT NULL,
  `generoa` varchar(20) DEFAULT NULL,
  `iraupena` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_filma`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `filma`
--

LOCK TABLES `filma` WRITE;
/*!40000 ALTER TABLE `filma` DISABLE KEYS */;
INSERT INTO `filma` VALUES (1,'Handia','Drama',116),(2,'La lista de Schindler','Drama',197),(3,'Cadena Perpetua','Drama',142),(4,'Million Dollar Baby','Drama',133),(5,'2001: Odisea en el espacio','Sci-Fi',142),(6,'La novia de Frankenstein','Sci-Fi',75),(7,'El planeta de los simios','Sci-Fi',115),(8,'Alien, el octavo pasajero','Sci-Fi',117),(9,'Scary movie','Komedia',90),(10,'El gran Lebowsky','Komedia',119),(11,'La vida de Brian','Komedia',94),(12,'Aterriza como puedas','Komedia',88),(13,'Psicosis','Terror',109),(14,'El resplandor','Terror',146),(15,'Dracula','Terror',155),(16,'Cisne negro','Terror',110);
/*!40000 ALTER TABLE `filma` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `saioa`
--

DROP TABLE IF EXISTS `saioa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `saioa` (
  `id_saioa` int(11) NOT NULL AUTO_INCREMENT,
  `prezioa` decimal(10,2) DEFAULT NULL,
  `id_zinema` int(11) DEFAULT NULL,
  `id_areto` int(11) DEFAULT NULL,
  `id_filma` int(10) unsigned DEFAULT NULL,
  `saioa_data` date DEFAULT NULL,
  `hasiera_ordua` time DEFAULT NULL,
  PRIMARY KEY (`id_saioa`),
  UNIQUE KEY `id_zinema` (`id_zinema`,`id_areto`,`saioa_data`,`hasiera_ordua`),
  KEY `id_areto` (`id_areto`,`id_zinema`),
  KEY `id_filma` (`id_filma`),
  CONSTRAINT `saioa_ibfk_1` FOREIGN KEY (`id_areto`, `id_zinema`) REFERENCES `areto` (`id_areto`, `id_zinema`),
  CONSTRAINT `saioa_ibfk_2` FOREIGN KEY (`id_filma`) REFERENCES `filma` (`id_filma`)
) ENGINE=InnoDB AUTO_INCREMENT=65 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `saioa`
--

LOCK TABLES `saioa` WRITE;
/*!40000 ALTER TABLE `saioa` DISABLE KEYS */;
INSERT INTO `saioa` VALUES (1,15.00,1,2,1,'2024-02-01','15:00:00'),(2,15.00,1,2,2,'2024-02-02','16:00:00'),(3,15.00,1,2,3,'2024-02-03','17:00:00'),(4,15.00,1,2,4,'2024-02-04','18:00:00'),(5,15.00,1,2,5,'2024-02-05','19:00:00'),(6,15.00,1,2,6,'2024-02-06','20:00:00'),(7,15.00,1,2,7,'2024-02-07','21:00:00'),(8,15.00,1,2,8,'2024-02-08','22:00:00'),(9,15.00,1,2,9,'2024-02-09','15:00:00'),(10,15.00,1,2,10,'2024-02-10','16:00:00'),(11,15.00,1,2,11,'2024-02-11','17:00:00'),(12,15.00,1,2,12,'2024-02-12','18:00:00'),(13,15.00,1,2,13,'2024-02-13','19:00:00'),(14,15.00,1,2,14,'2024-02-14','20:00:00'),(15,15.00,1,2,15,'2024-02-15','21:00:00'),(16,15.00,1,2,16,'2024-02-01','22:00:00'),(17,14.00,2,1,1,'2024-02-01','15:30:00'),(18,14.00,2,1,2,'2024-02-01','16:00:00'),(19,14.00,2,1,3,'2024-02-02','17:00:00'),(20,14.00,2,1,4,'2024-02-03','18:00:00'),(21,14.00,2,1,5,'2024-02-04','19:00:00'),(22,14.00,2,1,6,'2024-02-05','20:00:00'),(23,14.00,2,1,7,'2024-02-06','21:00:00'),(24,14.00,2,1,8,'2024-02-07','22:00:00'),(25,14.00,2,1,9,'2024-02-08','15:00:00'),(26,14.00,2,1,10,'2024-02-09','16:00:00'),(27,14.00,2,1,11,'2024-02-10','17:00:00'),(28,14.00,2,1,12,'2024-02-11','18:00:00'),(29,14.00,2,1,13,'2024-02-12','19:00:00'),(30,14.00,2,1,14,'2024-02-13','20:00:00'),(31,14.00,2,1,15,'2024-02-14','21:00:00'),(32,14.00,2,1,16,'2024-02-15','22:00:00'),(33,15.00,3,1,1,'2024-02-01','15:30:00'),(34,15.00,3,1,2,'2024-02-01','16:00:00'),(35,15.00,3,1,3,'2024-02-02','17:00:00'),(36,15.00,3,1,4,'2024-02-03','18:00:00'),(37,15.00,3,1,5,'2024-02-04','19:00:00'),(38,15.00,3,1,6,'2024-02-05','20:00:00'),(39,15.00,3,1,7,'2024-02-06','21:00:00'),(40,15.00,3,1,8,'2024-02-07','22:00:00'),(41,15.00,3,1,9,'2024-02-08','15:00:00'),(42,15.00,3,1,10,'2024-02-09','16:00:00'),(43,15.00,3,1,11,'2024-02-10','17:00:00'),(44,15.00,3,1,12,'2024-02-11','18:00:00'),(45,15.00,3,1,13,'2024-02-12','19:00:00'),(46,15.00,3,1,14,'2024-02-13','20:00:00'),(47,15.00,3,1,15,'2024-02-14','21:00:00'),(48,15.00,3,1,16,'2024-02-15','22:00:00'),(49,16.00,4,1,1,'2024-02-01','15:30:00'),(50,16.00,4,1,2,'2024-02-01','16:00:00'),(51,16.00,4,1,3,'2024-02-02','17:00:00'),(52,16.00,4,1,4,'2024-02-03','18:00:00'),(53,16.00,4,1,5,'2024-02-04','19:00:00'),(54,16.00,4,1,6,'2024-02-05','20:00:00'),(55,16.00,4,1,7,'2024-02-06','21:00:00'),(56,16.00,4,1,8,'2024-02-07','22:00:00'),(57,16.00,4,1,9,'2024-02-08','15:00:00'),(58,16.00,4,1,10,'2024-02-09','16:00:00'),(59,16.00,4,1,11,'2024-02-10','17:00:00'),(60,16.00,4,1,12,'2024-02-11','18:00:00'),(61,16.00,4,1,13,'2024-02-12','19:00:00'),(62,16.00,4,1,14,'2024-02-13','20:00:00'),(63,16.00,4,1,15,'2024-02-14','21:00:00'),(64,16.00,4,1,16,'2024-02-15','22:00:00');
/*!40000 ALTER TABLE `saioa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sarrera`
--

DROP TABLE IF EXISTS `sarrera`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sarrera` (
  `id_sarrera` int(11) NOT NULL AUTO_INCREMENT,
  `id_erosketa` int(11) DEFAULT NULL,
  `prezioa` decimal(10,2) DEFAULT NULL,
  `id_saioa` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_sarrera`),
  KEY `id_erosketa` (`id_erosketa`),
  KEY `id_saioa` (`id_saioa`),
  CONSTRAINT `sarrera_ibfk_1` FOREIGN KEY (`id_erosketa`) REFERENCES `erosketa` (`id_erosketa`),
  CONSTRAINT `sarrera_ibfk_2` FOREIGN KEY (`id_saioa`) REFERENCES `saioa` (`id_saioa`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sarrera`
--

LOCK TABLES `sarrera` WRITE;
/*!40000 ALTER TABLE `sarrera` DISABLE KEYS */;
INSERT INTO `sarrera` VALUES (1,1,15.00,1),(2,2,10.00,2),(3,3,10.00,3),(4,4,10.00,4),(5,5,10.00,5),(6,6,10.00,6),(7,7,10.00,7),(8,8,10.00,8),(9,9,10.00,9),(10,10,10.00,10),(11,11,15.00,11),(12,12,15.00,12),(13,13,15.00,13),(14,14,15.00,14),(15,15,15.00,15),(16,16,15.00,16),(17,17,15.00,17),(18,18,20.00,18),(19,19,15.00,19),(20,20,20.00,20);
/*!40000 ALTER TABLE `sarrera` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zinema`
--

DROP TABLE IF EXISTS `zinema`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `zinema` (
  `id_zinema` int(11) NOT NULL AUTO_INCREMENT,
  `izena` varchar(50) DEFAULT NULL,
  `Ordutegia` varchar(60) DEFAULT NULL,
  `Kokapena` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`id_zinema`),
  UNIQUE KEY `izena` (`izena`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zinema`
--

LOCK TABLES `zinema` WRITE;
/*!40000 ALTER TABLE `zinema` DISABLE KEYS */;
INSERT INTO `zinema` VALUES (1,'Cinesa Zubiarte','Astelehenetik igandera 15:00 - 23:00','Leizaola Lehendakariaren Kalea, 2, 48009 Bilbao'),(2,'Cinesa Max Ocio','Astelehenetik igandera 15:00 - 23:00','Max Ocio, Kareaga K., S/N, 48903 Barakaldo'),(3,'Golem Alhondiga','Astelehenetik igandera 15:00 - 23:00','Arriquíbar Plaza, 4, 48001 Bilbo'),(4,'Cine Yelmo Premium Artea','Astelehenetik igandera 15:00 - 23:00','Peruri Auzoa, 33, 48940 Leioa');
/*!40000 ALTER TABLE `zinema` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-02-23  9:56:02
