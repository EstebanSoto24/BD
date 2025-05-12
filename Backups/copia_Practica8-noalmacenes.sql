-- MariaDB dump 10.19  Distrib 10.4.28-MariaDB, for Linux (x86_64)
--
-- Host: localhost    Database: Practica8
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
-- Table structure for table `Cuentas_mes`
--

DROP TABLE IF EXISTS `Cuentas_mes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Cuentas_mes` (
  `mes` int(11) DEFAULT NULL,
  `total_cuentas` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Cuentas_mes`
--

LOCK TABLES `Cuentas_mes` WRITE;
/*!40000 ALTER TABLE `Cuentas_mes` DISABLE KEYS */;
INSERT INTO `Cuentas_mes` VALUES (11,10);
/*!40000 ALTER TABLE `Cuentas_mes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PELICULAS`
--

DROP TABLE IF EXISTS `PELICULAS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PELICULAS` (
  `codigo` int(11) NOT NULL,
  `titulo` varchar(100) DEFAULT NULL,
  `genero` varchar(50) DEFAULT NULL,
  `duracion` int(11) DEFAULT NULL,
  `nacionalidad` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PELICULAS`
--

LOCK TABLES `PELICULAS` WRITE;
/*!40000 ALTER TABLE `PELICULAS` DISABLE KEYS */;
INSERT INTO `PELICULAS` VALUES (1,'Avatar','Ciencia Ficción',162,'Estados Unidos'),(2,'El Rey León','Animación',88,'Estados Unidos'),(3,'Parásitos','Drama',132,'Corea del Sur'),(4,'Cortometraje Experimental','Experimental',12,'España'),(5,'El Padrino','Crimen',175,'Estados Unidos'),(6,'Toy Story','Animación',81,'Estados Unidos'),(7,'Documental Breve','Documental',48,'Reino Unido');
/*!40000 ALTER TABLE `PELICULAS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cajas`
--

DROP TABLE IF EXISTS `cajas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cajas` (
  `numreferencia` char(5) NOT NULL,
  `contenido` varchar(100) DEFAULT NULL,
  `valor` int(11) DEFAULT NULL,
  `almacen` int(11) DEFAULT NULL,
  PRIMARY KEY (`numreferencia`),
  KEY `almacen` (`almacen`),
  CONSTRAINT `cajas_ibfk_1` FOREIGN KEY (`almacen`) REFERENCES `almacenes` (`codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cajas`
--

LOCK TABLES `cajas` WRITE;
/*!40000 ALTER TABLE `cajas` DISABLE KEYS */;
INSERT INTO `cajas` VALUES ('123',NULL,120,3),('12345',NULL,320,4),('A1001','Electrodomésticos',1360,1),('A1002','Muebles',1020,2),('A1003','Ropa',544,3),('A1004','Juguetes',510,4),('A1005','Herramientas',816,5),('H5RT','Papel',170,2);
/*!40000 ALTER TABLE `cajas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cuentas`
--

DROP TABLE IF EXISTS `cuentas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cuentas` (
  `codigo` int(11) NOT NULL AUTO_INCREMENT,
  `titular` varchar(100) NOT NULL,
  `fecha_creacion` date NOT NULL,
  `saldo` decimal(10,2) NOT NULL,
  PRIMARY KEY (`codigo`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cuentas`
--

LOCK TABLES `cuentas` WRITE;
/*!40000 ALTER TABLE `cuentas` DISABLE KEYS */;
INSERT INTO `cuentas` VALUES (1,'Carlos Ramírez','2024-11-05',12500.00),(2,'Laura Gómez','2024-11-12',-150.75),(3,'José Martínez','2024-10-20',3050.50),(4,'Ana Torres','2024-11-25',500.00),(5,'Lucía Fernández','2024-08-14',-50.00),(6,'Miguel Herrera','2024-07-01',7600.00),(7,'Andrea López','2024-11-02',9800.00),(8,'Pedro Sánchez','2024-09-17',0.00),(9,'Sofía Pérez','2024-11-30',-320.90),(10,'Juan Domínguez','2024-12-01',100.00),(11,'Natalia Ríos','2024-11-10',12200.00),(12,'Diego Vargas','2024-06-22',50.00),(13,'Isabel Castillo','2024-11-08',13000.00),(14,'Emilio Suárez','2024-04-15',-10.00),(15,'Renata Medina','2024-11-18',15000.00),(16,'Marcos Aguilar','2024-03-10',2000.00),(17,'Valeria Cruz','2024-11-22',15800.00),(18,'Luis Moreno','2024-01-05',-200.00),(19,'Claudia Reyes','2024-11-07',450.00),(20,'Roberto Paredes','2024-02-28',750.00);
/*!40000 ALTER TABLE `cuentas` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-05-12 20:51:51
