-- MariaDB dump 10.19  Distrib 10.4.28-MariaDB, for Linux (x86_64)
--
-- Host: localhost    Database: Practica6
-- ------------------------------------------------------
-- Server version	10.4.28-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Current Database: `Practica6`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `Practica6` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */;

USE `Practica6`;

--
-- Table structure for table `Cliente`
--

DROP TABLE IF EXISTS `Cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Cliente` (
  `DNI` int(11) NOT NULL,
  `Nombre` varchar(50) DEFAULT NULL,
  `Edad` int(11) DEFAULT NULL,
  PRIMARY KEY (`DNI`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Cliente`
--

LOCK TABLES `Cliente` WRITE;
/*!40000 ALTER TABLE `Cliente` DISABLE KEYS */;
INSERT INTO `Cliente` VALUES (1,'Pepe Perez',45),(2,'Juan Gonzalez',45),(3,'Maria Gomez',33),(4,'Javier Casado',18),(5,'Nuria Sanchez',29),(6,'Antonio Navarro',58);
/*!40000 ALTER TABLE `Cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Comercio`
--

DROP TABLE IF EXISTS `Comercio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Comercio` (
  `CIF` int(11) NOT NULL,
  `Nombre` varchar(50) DEFAULT NULL,
  `Ciudad` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`CIF`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Comercio`
--

LOCK TABLES `Comercio` WRITE;
/*!40000 ALTER TABLE `Comercio` DISABLE KEYS */;
INSERT INTO `Comercio` VALUES (1,'El Corte Ingles','Sevilla'),(2,'El Corte Ingles','Madrid'),(3,'Jump','Valencia'),(4,'Centro Mail','Sevilla'),(5,'FNAC','Barcelona');
/*!40000 ALTER TABLE `Comercio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Desarrolla`
--

DROP TABLE IF EXISTS `Desarrolla`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Desarrolla` (
  `ID_Fab` int(11) DEFAULT NULL,
  `Codigo` int(11) DEFAULT NULL,
  KEY `ID_Fab` (`ID_Fab`),
  KEY `Codigo` (`Codigo`),
  CONSTRAINT `Desarrolla_ibfk_1` FOREIGN KEY (`ID_Fab`) REFERENCES `Fabricante` (`ID_Fab`),
  CONSTRAINT `Desarrolla_ibfk_2` FOREIGN KEY (`Codigo`) REFERENCES `Programa` (`Codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Desarrolla`
--

LOCK TABLES `Desarrolla` WRITE;
/*!40000 ALTER TABLE `Desarrolla` DISABLE KEYS */;
INSERT INTO `Desarrolla` VALUES (1,1),(1,2),(1,3),(1,4),(1,5),(2,6),(2,7),(2,8),(2,9),(2,10),(2,11),(2,12),(6,13),(4,14),(5,15),(5,16),(3,17),(3,18),(5,19),(4,20);
/*!40000 ALTER TABLE `Desarrolla` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Distribuye`
--

DROP TABLE IF EXISTS `Distribuye`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Distribuye` (
  `CIF` int(11) DEFAULT NULL,
  `Codigo` int(11) DEFAULT NULL,
  `Cantidad` int(11) DEFAULT NULL,
  KEY `CIF` (`CIF`),
  KEY `Codigo` (`Codigo`),
  CONSTRAINT `Distribuye_ibfk_1` FOREIGN KEY (`CIF`) REFERENCES `Comercio` (`CIF`),
  CONSTRAINT `Distribuye_ibfk_2` FOREIGN KEY (`Codigo`) REFERENCES `Programa` (`Codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Distribuye`
--

LOCK TABLES `Distribuye` WRITE;
/*!40000 ALTER TABLE `Distribuye` DISABLE KEYS */;
INSERT INTO `Distribuye` VALUES (1,1,10),(1,2,11),(1,6,5),(1,7,3),(1,10,5),(1,13,7),(2,1,6),(2,2,6),(2,6,4),(2,7,7),(3,10,8),(3,13,5),(4,14,3),(4,20,6),(5,15,8),(5,16,2),(5,17,3),(5,19,6),(5,8,8);
/*!40000 ALTER TABLE `Distribuye` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Fabricante`
--

DROP TABLE IF EXISTS `Fabricante`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Fabricante` (
  `ID_Fab` int(11) NOT NULL,
  `Nombre` varchar(50) DEFAULT NULL,
  `Pais` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`ID_Fab`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Fabricante`
--

LOCK TABLES `Fabricante` WRITE;
/*!40000 ALTER TABLE `Fabricante` DISABLE KEYS */;
INSERT INTO `Fabricante` VALUES (1,'Oracle','Estados Unidos'),(2,'Microsoft','Estados Unidos'),(3,'IBM','Estados Unidos'),(4,'Dinamic','España'),(5,'Borland','Estados Unidos'),(6,'Symantec','Estados Unidos');
/*!40000 ALTER TABLE `Fabricante` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Programa`
--

DROP TABLE IF EXISTS `Programa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Programa` (
  `Codigo` int(11) NOT NULL,
  `Nombre` varchar(50) DEFAULT NULL,
  `Version` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`Codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Programa`
--

LOCK TABLES `Programa` WRITE;
/*!40000 ALTER TABLE `Programa` DISABLE KEYS */;
INSERT INTO `Programa` VALUES (1,'Application Server','9i'),(2,'Database','8i'),(3,'Database','9i'),(4,'Database','10g'),(5,'Developer','6i'),(6,'Access','97'),(7,'Access','2000'),(8,'Access','XP'),(9,'Windows','98'),(10,'Windows','XP Professional'),(11,'Windows','XP Home Edition'),(12,'Windows','2003 Server'),(13,'Norton Internet Security','2004'),(14,'Freddy Hardest','-'),(15,'Paradox','2'),(16,'C++ Builder','55'),(17,'DB/2','20'),(18,'OS/2','10'),(19,'JBuilder','X'),(20,'La Prision','10');
/*!40000 ALTER TABLE `Programa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Registra`
--

DROP TABLE IF EXISTS `Registra`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Registra` (
  `CIF` int(11) DEFAULT NULL,
  `DNI` int(11) DEFAULT NULL,
  `Codigo` int(11) DEFAULT NULL,
  `Medio` varchar(50) DEFAULT NULL,
  KEY `CIF` (`CIF`),
  KEY `DNI` (`DNI`),
  KEY `Codigo` (`Codigo`),
  CONSTRAINT `Registra_ibfk_1` FOREIGN KEY (`CIF`) REFERENCES `Comercio` (`CIF`),
  CONSTRAINT `Registra_ibfk_2` FOREIGN KEY (`DNI`) REFERENCES `Cliente` (`DNI`),
  CONSTRAINT `Registra_ibfk_3` FOREIGN KEY (`Codigo`) REFERENCES `Programa` (`Codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Registra`
--

LOCK TABLES `Registra` WRITE;
/*!40000 ALTER TABLE `Registra` DISABLE KEYS */;
INSERT INTO `Registra` VALUES (1,1,1,'Internet'),(1,3,4,'Tarjeta Postal'),(4,2,10,'Telefono'),(4,1,10,'Tarjeta Postal'),(5,2,12,'Internet'),(2,4,15,'Internet');
/*!40000 ALTER TABLE `Registra` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Current Database: `Practica7`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `Practica7` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */;

USE `Practica7`;

--
-- Table structure for table `Fabricante`
--

DROP TABLE IF EXISTS `Fabricante`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Fabricante` (
  `codigo` int(11) NOT NULL,
  `nombre` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Fabricante`
--

LOCK TABLES `Fabricante` WRITE;
/*!40000 ALTER TABLE `Fabricante` DISABLE KEYS */;
INSERT INTO `Fabricante` VALUES (1,'Asus'),(2,'Lenovo'),(3,'Hewlett-Packard'),(4,'Samsung'),(5,'Seagate'),(6,'Crucial'),(7,'Gigabyte'),(8,'Huawei'),(9,'Xiaomi');
/*!40000 ALTER TABLE `Fabricante` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Producto`
--

DROP TABLE IF EXISTS `Producto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Producto` (
  `codigo` int(11) NOT NULL,
  `nombre` varchar(100) DEFAULT NULL,
  `precio` double DEFAULT NULL,
  `codigo_fabricante` int(11) DEFAULT NULL,
  PRIMARY KEY (`codigo`),
  KEY `codigo_fabricante` (`codigo_fabricante`),
  CONSTRAINT `Producto_ibfk_1` FOREIGN KEY (`codigo_fabricante`) REFERENCES `Fabricante` (`codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Producto`
--

LOCK TABLES `Producto` WRITE;
/*!40000 ALTER TABLE `Producto` DISABLE KEYS */;
INSERT INTO `Producto` VALUES (1,'Disco duro SATA3 1TB',86.99,5),(2,'Memoria RAM DDR4 8GB',120,6),(3,'Disco SSD 1TB',150.99,4),(4,'GeForce GTX 1050Ti',185,7),(5,'GeForce GTX 1080 Xtreme',755,6),(6,'Monitor 24 LED Full HD',202,1),(7,'Monitor 27 LED Full HD',245.99,1),(8,'Portátil Yoga 520',559,2),(9,'Portátil Ideapd 320',444,2),(10,'Impresora HP Deskjet 3720',59.99,3),(11,'Impresora HP Laserjet Pro M26nw',180,3);
/*!40000 ALTER TABLE `Producto` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-05-12 19:09:05
