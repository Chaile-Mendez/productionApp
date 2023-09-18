-- MySQL dump 10.13  Distrib 8.0.32, for Linux (x86_64)
--
-- Host: localhost    Database: lsg
-- ------------------------------------------------------
-- Server version	8.0.34-0ubuntu0.22.04.1

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
-- Table structure for table `clients`
--

DROP TABLE IF EXISTS `clients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clients` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `shortName` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clients`
--

LOCK TABLES `clients` WRITE;
/*!40000 ALTER TABLE `clients` DISABLE KEYS */;
INSERT INTO `clients` VALUES (1,'starbucks','STBK');
/*!40000 ALTER TABLE `clients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `process`
--

DROP TABLE IF EXISTS `process`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `process` (
  `processId` int unsigned NOT NULL AUTO_INCREMENT,
  `index` varchar(45) DEFAULT NULL,
  `name` varchar(45) DEFAULT NULL,
  `sector` varchar(45) DEFAULT NULL,
  `duration` int DEFAULT NULL,
  `productId` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`processId`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `process`
--

LOCK TABLES `process` WRITE;
/*!40000 ALTER TABLE `process` DISABLE KEYS */;
INSERT INTO `process` VALUES (1,'1','fraccionado','dep',1,'1'),(2,'2','coccion','cocina',1,'1'),(3,'3','encajado','celula',1,'1'),(4,'1','encajado','celula',1,'2'),(5,'1','encajado','celula',1,'3');
/*!40000 ALTER TABLE `process` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `productionOrders`
--

DROP TABLE IF EXISTS `productionOrders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `productionOrders` (
  `id` int NOT NULL AUTO_INCREMENT,
  `productId` varchar(45) DEFAULT NULL,
  `quantity` int DEFAULT NULL,
  `purchaseOrderItemId` varchar(45) DEFAULT NULL,
  `batch` varchar(45) DEFAULT NULL,
  `batchYear` int DEFAULT NULL,
  `batchDay` int DEFAULT NULL,
  `processId` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `productionOrderId_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productionOrders`
--

LOCK TABLES `productionOrders` WRITE;
/*!40000 ALTER TABLE `productionOrders` DISABLE KEYS */;
INSERT INTO `productionOrders` VALUES (1,'1',1000,'1','L23-250',23,250,NULL),(2,'1',1000,'2','L23-250',23,250,NULL),(3,'2',1440,'2','L23-250',23,250,NULL),(4,'1',1000,'2','L23-250',23,250,NULL),(5,'2',1000,'2','L23-250',23,250,NULL),(6,'1',1000,'2','L23-250',23,250,NULL),(7,'2',1440,'3','L23-251',23,251,NULL),(8,'2',1440,'3','L23-251',23,251,NULL),(9,'2',1000,'3','L23-251',23,251,NULL),(10,'1',1440,'1','L23-251',23,251,NULL),(11,'1',1440,'1','L23-251',23,251,NULL),(12,'2',1000,'3','L23-252',23,252,NULL),(13,'2',1,'1','L23-252',23,252,NULL);
/*!40000 ALTER TABLE `productionOrders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `shortName` varchar(45) DEFAULT NULL,
  `sku` varchar(45) DEFAULT NULL,
  `clientId` varchar(45) DEFAULT NULL,
  `processId` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (1,'Scon cuatro quesos','Scon',NULL,NULL,NULL),(2,'Bageluna','Bageluna',NULL,NULL,NULL),(3,'Croque Monsier','Croque',NULL,NULL,NULL);
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `purchaseOrderItems`
--

DROP TABLE IF EXISTS `purchaseOrderItems`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `purchaseOrderItems` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `purchaseOrderId` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `purchaseOrderItems`
--

LOCK TABLES `purchaseOrderItems` WRITE;
/*!40000 ALTER TABLE `purchaseOrderItems` DISABLE KEYS */;
INSERT INTO `purchaseOrderItems` VALUES (1,'1'),(2,'1'),(3,'2'),(4,'2'),(5,'2');
/*!40000 ALTER TABLE `purchaseOrderItems` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `purchaseOrders`
--

DROP TABLE IF EXISTS `purchaseOrders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `purchaseOrders` (
  `id` int NOT NULL AUTO_INCREMENT,
  `code` varchar(45) DEFAULT NULL,
  `purchaseDate` date DEFAULT NULL,
  `deliveryDate` date DEFAULT NULL,
  `clientId` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `purchaseOrders`
--

LOCK TABLES `purchaseOrders` WRITE;
/*!40000 ALTER TABLE `purchaseOrders` DISABLE KEYS */;
INSERT INTO `purchaseOrders` VALUES (1,'1','2023-08-15','2023-09-17','1'),(2,'2','2023-08-16','2023-09-18','1'),(3,'3','2023-08-17','2023-09-19','1'),(4,NULL,'2023-08-18','2023-09-19','1');
/*!40000 ALTER TABLE `purchaseOrders` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-09-18  0:07:01
