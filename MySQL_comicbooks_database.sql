-- MySQL dump 10.13  Distrib 8.0.42, for Win64 (x86_64)
--
-- Host: localhost    Database: comic books
-- ------------------------------------------------------
-- Server version	8.0.42

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
-- Table structure for table `collections`
--

DROP TABLE IF EXISTS `collections`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `collections` (
  `CollectionID` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`CollectionID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `collections`
--

LOCK TABLES `collections` WRITE;
/*!40000 ALTER TABLE `collections` DISABLE KEYS */;
INSERT INTO `collections` VALUES (1,'DC Comics'),(2,'Marvel Comics');
/*!40000 ALTER TABLE `collections` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `marveldccomics`
--

DROP TABLE IF EXISTS `marveldccomics`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `marveldccomics` (
  `ComicID` int NOT NULL AUTO_INCREMENT,
  `Title` varchar(100) DEFAULT NULL,
  `Publisher` varchar(30) DEFAULT NULL,
  `IssueNum` int DEFAULT NULL,
  `CharacterName` varchar(50) DEFAULT NULL,
  `VolumeNum` int DEFAULT NULL,
  `Author` varchar(50) DEFAULT NULL,
  `Illustrator` varchar(50) DEFAULT NULL,
  `CollectionID` int DEFAULT NULL,
  `YearID` int DEFAULT NULL,
  PRIMARY KEY (`ComicID`),
  KEY `CollectionID` (`CollectionID`),
  CONSTRAINT `marveldccomics_ibfk_1` FOREIGN KEY (`CollectionID`) REFERENCES `collections` (`CollectionID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `marveldccomics`
--

LOCK TABLES `marveldccomics` WRITE;
/*!40000 ALTER TABLE `marveldccomics` DISABLE KEYS */;
INSERT INTO `marveldccomics` VALUES (1,'Batman','DC Comics',1,NULL,1,'Bob Kane','Bill Finger',1,NULL),(2,'Spider-Man','Marvel Comics',1,NULL,1,'Stan Lee','Steve Ditko',2,NULL),(3,'Superman','DC Comics',1,NULL,1,'Jerry Siegel','Joe Shuster',1,NULL),(4,'Daredevil','Marvel Comics',1,NULL,1,'Stan Lee','Bill Everett',2,NULL),(5,'Wonder Woman','DC Comics',1,NULL,1,'William Moulton Marston','Harry G. Peter',1,NULL);
/*!40000 ALTER TABLE `marveldccomics` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sales`
--

DROP TABLE IF EXISTS `sales`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sales` (
  `SaleID` int NOT NULL AUTO_INCREMENT,
  `ComicID` int DEFAULT NULL,
  `Country` varchar(50) DEFAULT NULL,
  `Gross` decimal(10,2) DEFAULT NULL,
  `CopiesSold` int DEFAULT NULL,
  `DigitalCopies` int DEFAULT NULL,
  `PaperCopies` int DEFAULT NULL,
  PRIMARY KEY (`SaleID`),
  KEY `ComicID` (`ComicID`),
  CONSTRAINT `sales_ibfk_1` FOREIGN KEY (`ComicID`) REFERENCES `marveldccomics` (`ComicID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sales`
--

LOCK TABLES `sales` WRITE;
/*!40000 ALTER TABLE `sales` DISABLE KEYS */;
/*!40000 ALTER TABLE `sales` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-04-30 11:03:19
