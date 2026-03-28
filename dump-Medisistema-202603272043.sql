-- MySQL dump 10.13  Distrib 8.0.45, for Linux (x86_64)
--
-- Host: mysql-106737df-shirlykleal-591e.b.aivencloud.com    Database: Medisistema
-- ------------------------------------------------------
-- Server version	8.0.45

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
SET @MYSQLDUMP_TEMP_LOG_BIN = @@SESSION.SQL_LOG_BIN;
SET @@SESSION.SQL_LOG_BIN= 0;

--
-- GTID state at the beginning of the backup 
--

SET @@GLOBAL.GTID_PURGED=/*!80000 '+'*/ '19c7d1fa-23ee-11f1-8af1-4e3292b2c9e9:1-54,
ca2beb79-24bb-11f1-a05e-369294997737:1-62';

--
-- Table structure for table `citas`
--

DROP TABLE IF EXISTS `citas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `citas` (
  `codigo` int NOT NULL AUTO_INCREMENT,
  `id_paciente` int NOT NULL,
  `fecha` datetime NOT NULL,
  `id_medico` int NOT NULL,
  `estado` enum('Programada','Completada','Cancelada') DEFAULT NULL,
  `tipo_especialidad` varchar(100) NOT NULL,
  PRIMARY KEY (`codigo`),
  KEY `id_paciente` (`id_paciente`),
  KEY `id_medico` (`id_medico`),
  CONSTRAINT `citas_ibfk_1` FOREIGN KEY (`id_paciente`) REFERENCES `paciente` (`id_paciente`) ON DELETE CASCADE,
  CONSTRAINT `citas_ibfk_2` FOREIGN KEY (`id_medico`) REFERENCES `medico` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `citas`
--

LOCK TABLES `citas` WRITE;
/*!40000 ALTER TABLE `citas` DISABLE KEYS */;
INSERT INTO `citas` VALUES (1,1,'2026-03-20 08:30:00',1,'Programada','Odontologia'),(2,2,'2026-03-20 09:00:00',2,'Completada','Medicina general'),(3,3,'2026-03-20 10:00:00',3,'Cancelada','Psicologia'),(4,4,'2026-03-21 08:00:00',4,'Programada','Odontologia'),(5,5,'2026-03-21 09:30:00',5,'Completada','Medicina general'),(6,6,'2026-03-21 11:00:00',6,'Programada','Odontologia'),(7,7,'2026-03-22 08:15:00',7,'Cancelada','Psicologia'),(8,8,'2026-03-22 09:45:00',8,'Programada','Odontologia'),(9,9,'2026-03-22 10:30:00',9,'Completada','Medicina general'),(10,10,'2026-03-22 11:15:00',10,'Programada','Odontologia');
/*!40000 ALTER TABLE `citas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `diagnosticos`
--

DROP TABLE IF EXISTS `diagnosticos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `diagnosticos` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_paciente` int NOT NULL,
  `id_medico` int NOT NULL,
  `fecha` date NOT NULL,
  `descripcion` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_paciente` (`id_paciente`),
  KEY `id_medico` (`id_medico`),
  CONSTRAINT `diagnosticos_ibfk_1` FOREIGN KEY (`id_paciente`) REFERENCES `paciente` (`id_paciente`),
  CONSTRAINT `diagnosticos_ibfk_2` FOREIGN KEY (`id_medico`) REFERENCES `medico` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `diagnosticos`
--

LOCK TABLES `diagnosticos` WRITE;
/*!40000 ALTER TABLE `diagnosticos` DISABLE KEYS */;
INSERT INTO `diagnosticos` VALUES (1,1,1,'2026-03-20','Paciente en buen estado general'),(2,2,2,'2026-03-20','Alergia leve estacional'),(3,3,3,'2026-03-20','Hipertensión controlada'),(4,4,4,'2026-03-21','Dermatitis leve'),(5,5,5,'2026-03-21','Dolor articular en rodilla'),(6,6,6,'2026-03-21','Control ginecológico sin novedades'),(7,7,7,'2026-03-22','Seguimiento oncológico estable'),(8,8,8,'2026-03-22','Problema visual leve'),(9,9,9,'2026-03-22','Ansiedad moderada'),(10,10,10,'2026-03-22','Chequeo general sin hallazgos');
/*!40000 ALTER TABLE `diagnosticos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `empleados`
--

DROP TABLE IF EXISTS `empleados`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `empleados` (
  `n_cod` int NOT NULL AUTO_INCREMENT,
  `titular_id` int NOT NULL,
  `internos_id` int NOT NULL,
  `sustitutos_id` int NOT NULL,
  `horario` enum('Lunes','Martes','Miercoles','Jueves','Viernes','Sabado','Domingo') NOT NULL,
  `periodo_desc` enum('Enero','Febrero','Marzo','Abril','Mayo','Junio','Julio','Agosto','Septiembre','Octubre','Noviembre','Diciembre') NOT NULL,
  PRIMARY KEY (`n_cod`),
  KEY `titular_id` (`titular_id`),
  KEY `internos_id` (`internos_id`),
  KEY `sustitutos_id` (`sustitutos_id`),
  CONSTRAINT `empleados_ibfk_1` FOREIGN KEY (`titular_id`) REFERENCES `medico` (`id`),
  CONSTRAINT `empleados_ibfk_2` FOREIGN KEY (`internos_id`) REFERENCES `medico` (`id`),
  CONSTRAINT `empleados_ibfk_3` FOREIGN KEY (`sustitutos_id`) REFERENCES `medico` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empleados`
--

LOCK TABLES `empleados` WRITE;
/*!40000 ALTER TABLE `empleados` DISABLE KEYS */;
INSERT INTO `empleados` VALUES (1,1,2,3,'Lunes','Marzo'),(2,4,5,6,'Martes','Junio'),(3,7,8,9,'Miercoles','Agosto');
/*!40000 ALTER TABLE `empleados` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `especialidades_medicas`
--

DROP TABLE IF EXISTS `especialidades_medicas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `especialidades_medicas` (
  `codigo` int NOT NULL AUTO_INCREMENT,
  `especialidad` varchar(100) NOT NULL,
  `id_medico` int NOT NULL,
  PRIMARY KEY (`codigo`),
  KEY `id_medico` (`id_medico`),
  CONSTRAINT `especialidades_medicas_ibfk_1` FOREIGN KEY (`id_medico`) REFERENCES `medico` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `especialidades_medicas`
--

LOCK TABLES `especialidades_medicas` WRITE;
/*!40000 ALTER TABLE `especialidades_medicas` DISABLE KEYS */;
INSERT INTO `especialidades_medicas` VALUES (1,'Cardiología',1),(2,'Pediatría',2),(3,'Neurología',3),(4,'Dermatología',4),(5,'Ortopedia',5),(6,'Ginecología',6),(7,'Oncología',7),(8,'Oftalmología',8),(9,'Psiquiatría',9),(10,'Medicina General',10);
/*!40000 ALTER TABLE `especialidades_medicas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gestion_personal`
--

DROP TABLE IF EXISTS `gestion_personal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gestion_personal` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_m` int NOT NULL,
  `cargo` varchar(60) NOT NULL,
  `fecha_ingreso` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_m` (`id_m`),
  CONSTRAINT `gestion_personal_ibfk_1` FOREIGN KEY (`id_m`) REFERENCES `medico` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gestion_personal`
--

LOCK TABLES `gestion_personal` WRITE;
/*!40000 ALTER TABLE `gestion_personal` DISABLE KEYS */;
INSERT INTO `gestion_personal` VALUES (1,1,'cirujano plastico','2017-05-22'),(2,2,'Pediatra','2018-07-22'),(3,3,'Neurólogo','2012-01-15'),(4,4,'Dermatólogo','2016-09-30'),(5,5,'Ortopedista','2019-05-18'),(6,6,'Ginecólogo','2021-11-05'),(7,7,'Oncólogo','2010-02-25'),(8,8,'Oftalmólogo','2020-08-14'),(9,9,'Psiquiatra','2017-12-01'),(10,10,'Médico Internista','2014-06-27');
/*!40000 ALTER TABLE `gestion_personal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `medico`
--

DROP TABLE IF EXISTS `medico`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `medico` (
  `id` int NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `edad` int NOT NULL,
  `años_experiencia` int NOT NULL,
  `id_paciente` int NOT NULL,
  `horas` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_paciente` (`id_paciente`),
  CONSTRAINT `medico_ibfk_1` FOREIGN KEY (`id_paciente`) REFERENCES `paciente` (`id_paciente`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `medico`
--

LOCK TABLES `medico` WRITE;
/*!40000 ALTER TABLE `medico` DISABLE KEYS */;
INSERT INTO `medico` VALUES (1,'Carlos Pérez',45,20,1,8),(2,'Ana Gómez',38,12,2,8),(3,'Luis Martínez',50,25,3,5),(4,'María López',42,18,4,8),(5,'Jorge Ramírez',35,10,5,18),(6,'Lucía Torres',29,5,6,5),(7,'Andrés Castro',55,30,7,18),(8,'Sofía Herrera',33,8,8,18),(9,'Pedro Vargas',47,22,9,5),(10,'Camila Rojas',40,15,10,12);
/*!40000 ALTER TABLE `medico` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `paciente`
--

DROP TABLE IF EXISTS `paciente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `paciente` (
  `id_paciente` int NOT NULL,
  `nombre` varchar(60) NOT NULL,
  `apellido` varchar(60) NOT NULL,
  `edad` int NOT NULL,
  `historial` varchar(150) DEFAULT NULL,
  PRIMARY KEY (`id_paciente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `paciente`
--

LOCK TABLES `paciente` WRITE;
/*!40000 ALTER TABLE `paciente` DISABLE KEYS */;
INSERT INTO `paciente` VALUES (1,'Juan','Pérez',30,'Sin antecedentes'),(2,'María','Gómez',25,'Alergia al polen'),(3,'Carlos','Ramírez',40,'Hipertensión'),(4,'Laura','Martínez',35,'Diabetes tipo 2'),(5,'Pedro','López',28,'Asma'),(6,'Sofía','Hernández',50,'Colesterol alto'),(7,'Andrés','Torres',60,'Problemas cardíacos'),(8,'Camila','Vargas',45,'Migraña crónica'),(9,'Luis','Castro',38,'Lesión de rodilla'),(10,'Valentina','Rojas',29,'Sin antecedentes');
/*!40000 ALTER TABLE `paciente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `registro_vac`
--

DROP TABLE IF EXISTS `registro_vac`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `registro_vac` (
  `cod` int NOT NULL AUTO_INCREMENT,
  `id_medico` int NOT NULL,
  `fecha` date DEFAULT NULL,
  `dias` int NOT NULL,
  PRIMARY KEY (`cod`),
  KEY `id_medico` (`id_medico`),
  CONSTRAINT `registro_vac_ibfk_1` FOREIGN KEY (`id_medico`) REFERENCES `medico` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `registro_vac`
--

LOCK TABLES `registro_vac` WRITE;
/*!40000 ALTER TABLE `registro_vac` DISABLE KEYS */;
INSERT INTO `registro_vac` VALUES (1,1,'2025-06-02',10),(2,2,'2026-01-22',20),(3,3,'2025-12-10',8),(4,4,'2026-03-01',15),(5,5,'2025-08-11',30),(6,6,'2025-10-18',12),(7,7,'2026-01-28',10),(8,8,'2026-02-05',5),(9,9,'2026-03-02',14),(10,10,'2025-07-21',22);
/*!40000 ALTER TABLE `registro_vac` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'Medisistema'
--
SET @@SESSION.SQL_LOG_BIN = @MYSQLDUMP_TEMP_LOG_BIN;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-03-27 20:44:17
