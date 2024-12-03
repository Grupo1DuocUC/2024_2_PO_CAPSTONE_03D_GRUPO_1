-- MySQL dump 10.13  Distrib 8.0.38, for Win64 (x86_64)
--
-- Host: localhost    Database: bd_delicias_caseras
-- ------------------------------------------------------
-- Server version	8.0.39

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
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add user',4,'add_user'),(14,'Can change user',4,'change_user'),(15,'Can delete user',4,'delete_user'),(16,'Can view user',4,'view_user'),(17,'Can add content type',5,'add_contenttype'),(18,'Can change content type',5,'change_contenttype'),(19,'Can delete content type',5,'delete_contenttype'),(20,'Can view content type',5,'view_contenttype'),(21,'Can add session',6,'add_session'),(22,'Can change session',6,'change_session'),(23,'Can delete session',6,'delete_session'),(24,'Can view session',6,'view_session'),(25,'Can add plato',7,'add_plato'),(26,'Can change plato',7,'change_plato'),(27,'Can delete plato',7,'delete_plato'),(28,'Can view plato',7,'view_plato'),(29,'Can add encuesta',8,'add_encuesta'),(30,'Can change encuesta',8,'change_encuesta'),(31,'Can delete encuesta',8,'delete_encuesta'),(32,'Can view encuesta',8,'view_encuesta'),(33,'Can add carrito',9,'add_carrito'),(34,'Can change carrito',9,'change_carrito'),(35,'Can delete carrito',9,'delete_carrito'),(36,'Can view carrito',9,'view_carrito'),(37,'Can add item carrito',10,'add_itemcarrito'),(38,'Can change item carrito',10,'change_itemcarrito'),(39,'Can delete item carrito',10,'delete_itemcarrito'),(40,'Can view item carrito',10,'view_itemcarrito'),(41,'Can add plato semanal',11,'add_platosemanal'),(42,'Can change plato semanal',11,'change_platosemanal'),(43,'Can delete plato semanal',11,'delete_platosemanal'),(44,'Can view plato semanal',11,'view_platosemanal'),(45,'Can add voto',12,'add_voto'),(46,'Can change voto',12,'change_voto'),(47,'Can delete voto',12,'delete_voto'),(48,'Can view voto',12,'view_voto'),(49,'Can add pedido',13,'add_pedido'),(50,'Can change pedido',13,'change_pedido'),(51,'Can delete pedido',13,'delete_pedido'),(52,'Can view pedido',13,'view_pedido'),(53,'Can add detalle pedido',14,'add_detallepedido'),(54,'Can change detalle pedido',14,'change_detallepedido'),(55,'Can delete detalle pedido',14,'delete_detallepedido'),(56,'Can view detalle pedido',14,'view_detallepedido');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$870000$LreMcRmE0KIjr4nr1hUiYa$BAWqA/XRHPG1iDkqzMBV6VZ0OtMWtmqMmMgYdupIkFg=','2024-11-11 22:51:55.528522',1,'admin','','','admin@admin.com',1,1,'2024-11-11 22:49:52.875615'),(2,'pbkdf2_sha256$870000$a9FGFuko1yGFctMthgH0DN$dG+MtHGYN4Jqv8uf0UCU9EpPlae/5xXe+sXlkMcm7+A=','2024-11-11 23:33:17.567937',0,'Juan','','','juan@juan.com',0,1,'2024-11-11 22:51:00.539340'),(3,'pbkdf2_sha256$870000$Kmg7p41VCgCBBowezHiqYJ$lu8d+rqwJIud/9LyNhiHbID7Igc4nhVyTO3mdnPq9iQ=','2024-11-11 23:27:44.340609',0,'Pedro','','','pedro@pedro.com',0,1,'2024-11-11 22:51:32.484374'),(4,'pbkdf2_sha256$870000$VYoicW2WGA5Jce0auKu9kc$rzHqL0tk3lcy6/YE2uQmb4JuON6JdPs2c3UWlQMO5jQ=','2024-11-11 23:34:13.532765',0,'Sofia','','','Sofia@sofia.com',0,1,'2024-11-11 23:34:12.914599');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_groups` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comercio_carrito`
--

DROP TABLE IF EXISTS `comercio_carrito`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comercio_carrito` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `comercio_carrito_user_id_b2b7c1c9_fk_auth_user_id` (`user_id`),
  CONSTRAINT `comercio_carrito_user_id_b2b7c1c9_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comercio_carrito`
--

LOCK TABLES `comercio_carrito` WRITE;
/*!40000 ALTER TABLE `comercio_carrito` DISABLE KEYS */;
INSERT INTO `comercio_carrito` VALUES (1,1),(2,2),(3,3),(4,4);
/*!40000 ALTER TABLE `comercio_carrito` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comercio_detallepedido`
--

DROP TABLE IF EXISTS `comercio_detallepedido`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comercio_detallepedido` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `cantidad` int unsigned NOT NULL,
  `precio_unitario` decimal(10,2) NOT NULL,
  `subtotal` decimal(10,2) NOT NULL,
  `pedido_id` bigint NOT NULL,
  `plato_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `comercio_detallepedido_pedido_id_a7c5b6c5_fk_comercio_pedido_id` (`pedido_id`),
  KEY `comercio_detallepedido_plato_id_ff6ed160_fk_comercio_plato_id` (`plato_id`),
  CONSTRAINT `comercio_detallepedido_pedido_id_a7c5b6c5_fk_comercio_pedido_id` FOREIGN KEY (`pedido_id`) REFERENCES `comercio_pedido` (`id`),
  CONSTRAINT `comercio_detallepedido_plato_id_ff6ed160_fk_comercio_plato_id` FOREIGN KEY (`plato_id`) REFERENCES `comercio_plato` (`id`),
  CONSTRAINT `comercio_detallepedido_chk_1` CHECK ((`cantidad` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comercio_detallepedido`
--

LOCK TABLES `comercio_detallepedido` WRITE;
/*!40000 ALTER TABLE `comercio_detallepedido` DISABLE KEYS */;
INSERT INTO `comercio_detallepedido` VALUES (1,2,7000.00,14000.00,1,1),(2,2,4000.00,8000.00,1,3),(3,4,4500.00,18000.00,2,2),(4,5,7000.00,35000.00,3,1),(5,1,4000.00,4000.00,3,3),(6,1,5000.00,5000.00,4,4),(7,4,4500.00,18000.00,5,2);
/*!40000 ALTER TABLE `comercio_detallepedido` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comercio_encuesta`
--

DROP TABLE IF EXISTS `comercio_encuesta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comercio_encuesta` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `rating` int NOT NULL,
  `comentario` longtext NOT NULL,
  `plato_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `comercio_encuesta_plato_id_662e85ef_fk_comercio_plato_id` (`plato_id`),
  CONSTRAINT `comercio_encuesta_plato_id_662e85ef_fk_comercio_plato_id` FOREIGN KEY (`plato_id`) REFERENCES `comercio_plato` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comercio_encuesta`
--

LOCK TABLES `comercio_encuesta` WRITE;
/*!40000 ALTER TABLE `comercio_encuesta` DISABLE KEYS */;
/*!40000 ALTER TABLE `comercio_encuesta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comercio_itemcarrito`
--

DROP TABLE IF EXISTS `comercio_itemcarrito`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comercio_itemcarrito` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `cantidad` int unsigned NOT NULL,
  `carrito_id` bigint NOT NULL,
  `plato_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `comercio_itemcarrito_carrito_id_plato_id_be819adf_uniq` (`carrito_id`,`plato_id`),
  KEY `comercio_itemcarrito_plato_id_5f7aad09_fk_comercio_plato_id` (`plato_id`),
  CONSTRAINT `comercio_itemcarrito_carrito_id_5ba76604_fk_comercio_carrito_id` FOREIGN KEY (`carrito_id`) REFERENCES `comercio_carrito` (`id`),
  CONSTRAINT `comercio_itemcarrito_plato_id_5f7aad09_fk_comercio_plato_id` FOREIGN KEY (`plato_id`) REFERENCES `comercio_plato` (`id`),
  CONSTRAINT `comercio_itemcarrito_chk_1` CHECK ((`cantidad` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comercio_itemcarrito`
--

LOCK TABLES `comercio_itemcarrito` WRITE;
/*!40000 ALTER TABLE `comercio_itemcarrito` DISABLE KEYS */;
/*!40000 ALTER TABLE `comercio_itemcarrito` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comercio_pedido`
--

DROP TABLE IF EXISTS `comercio_pedido`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comercio_pedido` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `direccion_envio` varchar(255) NOT NULL,
  `hora_entrega` varchar(20) NOT NULL,
  `pagado` tinyint(1) NOT NULL,
  `fecha_pedido` datetime(6) NOT NULL,
  `carrito_id` bigint NOT NULL,
  `estado` varchar(50) NOT NULL,
  `usuario_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `comercio_pedido_carrito_id_622f5270_fk_comercio_carrito_id` (`carrito_id`),
  KEY `comercio_pedido_usuario_id_8908f3df_fk_auth_user_id` (`usuario_id`),
  CONSTRAINT `comercio_pedido_carrito_id_622f5270_fk_comercio_carrito_id` FOREIGN KEY (`carrito_id`) REFERENCES `comercio_carrito` (`id`),
  CONSTRAINT `comercio_pedido_usuario_id_8908f3df_fk_auth_user_id` FOREIGN KEY (`usuario_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comercio_pedido`
--

LOCK TABLES `comercio_pedido` WRITE;
/*!40000 ALTER TABLE `comercio_pedido` DISABLE KEYS */;
INSERT INTO `comercio_pedido` VALUES (1,'Olimpo #481 Maipú','12:00-13:00',1,'2024-11-11 23:25:28.138499',2,'Preparando',2),(2,'Olimpo #481 Maipú','14:01-15:00',1,'2024-11-11 23:26:47.410666',2,'Preparando',2),(3,'El Samaritano #488','13:01-14:00',1,'2024-11-11 23:28:52.617676',3,'Preparando',3),(4,'El Samaritano #488','13:01-14:00',1,'2024-11-11 23:30:37.363936',3,'Preparando',3),(5,'Pasaje Ramses #111','13:01-14:00',1,'2024-11-11 23:35:07.563324',4,'Preparando',4);
/*!40000 ALTER TABLE `comercio_pedido` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comercio_plato`
--

DROP TABLE IF EXISTS `comercio_plato`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comercio_plato` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `descripcion` longtext NOT NULL,
  `precio` decimal(10,2) NOT NULL,
  `disponible` tinyint(1) NOT NULL,
  `imagen` varchar(100) DEFAULT NULL,
  `oculto` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comercio_plato`
--

LOCK TABLES `comercio_plato` WRITE;
/*!40000 ALTER TABLE `comercio_plato` DISABLE KEYS */;
INSERT INTO `comercio_plato` VALUES (1,'Pastel de choclo','El pastel de choclo combina una capa de carne de vacuno y pollo, sazonada con cebolla, aceitunas y huevo duro, cubierta con un puré de choclo cremoso. Se hornea hasta que la superficie esté dorada y crujiente.',7000.00,0,'platos/imagen_2024-09-20_234918704_m1ghk0c_OpDPqdY.png',0),(2,'Porotos','Los porotos se prepara con porotos, generalmente porotos negros o blancos, cocidos con cebolla, ajo, tallarines y a veces carne como cerdo o chorizo. Se sazona con especias y hierbas, ofreciendo un sabor casero y reconfortante.',4500.00,0,'platos/porotos-granados_mssQXUC.jpg',0),(3,'Charquicán','El charquicán es un plato chileno que consiste en un guiso de carne , papas, zapallo y verduras como zanahorias y cebollas, todo cocido junto y sazonado con especias.',4000.00,0,'platos/imagen_2024-10-07_173738543_rBDAIy5.png',0),(4,'Cazuela de vacuno','La cazuela de vacuno consiste en un caldo nutritivo preparado con trozos de carne de vacuno, papas, zapallo, y verduras como zanahorias y trozos de choclo.',5000.00,0,'platos/descarga_kRzMRyG.jpeg',0);
/*!40000 ALTER TABLE `comercio_plato` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comercio_platosemanal`
--

DROP TABLE IF EXISTS `comercio_platosemanal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comercio_platosemanal` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `dia` varchar(9) NOT NULL,
  `comentario` longtext NOT NULL,
  `plato_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `comercio_platosemanal_plato_id_3fc7e287_fk_comercio_plato_id` (`plato_id`),
  CONSTRAINT `comercio_platosemanal_plato_id_3fc7e287_fk_comercio_plato_id` FOREIGN KEY (`plato_id`) REFERENCES `comercio_plato` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comercio_platosemanal`
--

LOCK TABLES `comercio_platosemanal` WRITE;
/*!40000 ALTER TABLE `comercio_platosemanal` DISABLE KEYS */;
INSERT INTO `comercio_platosemanal` VALUES (1,'Lunes','El pastel de choclo combina una capa de carne de vacuno y pollo, sazonada con cebolla, aceitunas y huevo duro, cubierta con un puré de choclo cremoso. Se hornea hasta que la superficie esté dorada y crujiente.',1),(2,'Lunes','Los porotos se prepara con porotos, generalmente porotos negros o blancos, cocidos con cebolla, ajo, tallarines y a veces carne como cerdo o chorizo. Se sazona con especias y hierbas, ofreciendo un sabor casero y reconfortante.',2),(3,'Martes','El charquicán es un plato chileno que consiste en un guiso de carne , papas, zapallo y verduras como zanahorias y cebollas, todo cocido junto y sazonado con especias.',3),(4,'Martes','La cazuela de vacuno consiste en un caldo nutritivo preparado con trozos de carne de vacuno, papas, zapallo, y verduras como zanahorias y trozos de choclo.',4);
/*!40000 ALTER TABLE `comercio_platosemanal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comercio_voto`
--

DROP TABLE IF EXISTS `comercio_voto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comercio_voto` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `plato_semanal_id` bigint NOT NULL,
  `user_id` int NOT NULL,
  `fecha_voto` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `comercio_voto_plato_semanal_id_e169270a_fk_comercio_` (`plato_semanal_id`),
  KEY `comercio_voto_user_id_f4ef91de_fk_auth_user_id` (`user_id`),
  CONSTRAINT `comercio_voto_plato_semanal_id_e169270a_fk_comercio_` FOREIGN KEY (`plato_semanal_id`) REFERENCES `comercio_platosemanal` (`id`),
  CONSTRAINT `comercio_voto_user_id_f4ef91de_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comercio_voto`
--

LOCK TABLES `comercio_voto` WRITE;
/*!40000 ALTER TABLE `comercio_voto` DISABLE KEYS */;
INSERT INTO `comercio_voto` VALUES (1,1,3,'2024-11-11 23:32:53.905600'),(2,3,3,'2024-11-11 23:32:58.447076'),(3,1,2,'2024-11-11 23:33:21.676457'),(4,4,2,'2024-11-11 23:33:24.750665'),(5,2,4,'2024-11-11 23:35:21.182598'),(6,4,4,'2024-11-11 23:35:22.461576');
/*!40000 ALTER TABLE `comercio_voto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_admin_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `django_admin_log_chk_1` CHECK ((`action_flag` >= 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_content_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(9,'comercio','carrito'),(14,'comercio','detallepedido'),(8,'comercio','encuesta'),(10,'comercio','itemcarrito'),(13,'comercio','pedido'),(7,'comercio','plato'),(11,'comercio','platosemanal'),(12,'comercio','voto'),(5,'contenttypes','contenttype'),(6,'sessions','session');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_migrations` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2024-11-11 22:47:44.647120'),(2,'auth','0001_initial','2024-11-11 22:47:46.542932'),(3,'admin','0001_initial','2024-11-11 22:47:46.981602'),(4,'admin','0002_logentry_remove_auto_add','2024-11-11 22:47:47.000280'),(5,'admin','0003_logentry_add_action_flag_choices','2024-11-11 22:47:47.018886'),(6,'contenttypes','0002_remove_content_type_name','2024-11-11 22:47:47.212648'),(7,'auth','0002_alter_permission_name_max_length','2024-11-11 22:47:47.384195'),(8,'auth','0003_alter_user_email_max_length','2024-11-11 22:47:47.549786'),(9,'auth','0004_alter_user_username_opts','2024-11-11 22:47:47.565288'),(10,'auth','0005_alter_user_last_login_null','2024-11-11 22:47:47.698494'),(11,'auth','0006_require_contenttypes_0002','2024-11-11 22:47:47.714113'),(12,'auth','0007_alter_validators_add_error_messages','2024-11-11 22:47:47.740538'),(13,'auth','0008_alter_user_username_max_length','2024-11-11 22:47:47.908989'),(14,'auth','0009_alter_user_last_name_max_length','2024-11-11 22:47:48.096853'),(15,'auth','0010_alter_group_name_max_length','2024-11-11 22:47:48.264011'),(16,'auth','0011_update_proxy_permissions','2024-11-11 22:47:48.279192'),(17,'auth','0012_alter_user_first_name_max_length','2024-11-11 22:47:48.462380'),(18,'comercio','0001_initial','2024-11-11 22:47:48.532143'),(19,'comercio','0002_alter_plato_id','2024-11-11 22:47:48.657943'),(20,'comercio','0003_plato_imagen_alter_plato_nombre','2024-11-11 22:47:48.733543'),(21,'comercio','0004_alter_plato_precio','2024-11-11 22:47:48.912393'),(22,'comercio','0005_alter_plato_precio','2024-11-11 22:47:49.082158'),(23,'comercio','0006_encuesta_opcion','2024-11-11 22:47:49.326083'),(24,'comercio','0007_remove_opcion_encuesta_delete_encuesta_delete_opcion','2024-11-11 22:47:49.551315'),(25,'comercio','0008_encuesta','2024-11-11 22:47:49.776156'),(26,'comercio','0009_alter_encuesta_plato','2024-11-11 22:47:49.777486'),(27,'comercio','0010_producto','2024-11-11 22:47:49.864318'),(28,'comercio','0011_carrito_itemcarrito_delete_producto_carrito_platos','2024-11-11 22:47:50.464393'),(29,'comercio','0012_platosemanal','2024-11-11 22:47:50.679650'),(30,'comercio','0013_voto','2024-11-11 22:47:51.099563'),(31,'comercio','0014_pedido','2024-11-11 22:47:51.340712'),(32,'comercio','0015_detallepedido','2024-11-11 22:47:51.873166'),(33,'comercio','0016_pedido_estado','2024-11-11 22:47:51.976003'),(34,'comercio','0017_pedido_usuario','2024-11-11 22:47:52.224802'),(35,'comercio','0018_alter_pedido_usuario','2024-11-11 22:47:52.246930'),(36,'comercio','0019_plato_oculto','2024-11-11 22:47:52.362039'),(37,'comercio','0020_alter_plato_nombre','2024-11-11 22:47:52.456957'),(38,'comercio','0021_alter_pedido_estado','2024-11-11 22:47:52.479647'),(39,'comercio','0022_alter_pedido_estado','2024-11-11 22:47:52.533300'),(40,'comercio','0023_alter_pedido_estado','2024-11-11 22:47:52.552684'),(41,'comercio','0024_voto_fecha_voto','2024-11-11 22:47:52.648726'),(42,'sessions','0001_initial','2024-11-11 22:47:52.795795');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('5105plj0gyvweop2ho4y5rdsz2e21yt5','.eJxVjDsOwjAQBe_iGlnxL-ulpOcM1tpr4wBypDipEHeHSCmgfTPzXiLQttaw9byEicVZKHH63SKlR2474Du12yzT3NZlinJX5EG7vM6cn5fD_Tuo1Ou3djmOBMYqBKWZB0zGgAe0VMgl72C0gzYK0HPy0RX0mkAxFOBCBkm8P8OWN2M:1tAdGF:0UJvvNN7cGSQIPBxYP9-mfmOJXlt4lqzxqYgcjSp9JE','2024-11-25 22:51:55.545449'),('id7mkfkcipec46m66usls3ik0tldy5ib','.eJxVjEEOwiAQRe_C2pAyQGdw6d4zkAEmUjU0Ke3KeHdt0oVu_3vvv1Tkba1x67LEqaizcur0uyXOD2k7KHdut1nnua3LlPSu6IN2fZ2LPC-H-3dQuddvbQubgXwGTDZkK0KMAL4gFSIB44RhBB5GdD6HZDNhCg5FkmEQBPX-ANmQN6o:1tAdvB:5eFANH3Qu3ksx_e0WjrgF49ZRvNjEx2SfUjUeUHuzE0','2024-11-25 23:34:13.548584');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-11-11 20:37:06
