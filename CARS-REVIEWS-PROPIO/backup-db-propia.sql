-- MySQL dump 10.13  Distrib 8.0.22, for Linux (x86_64)
--
-- Host: 127.0.0.1    Database: cars_reviews
-- ------------------------------------------------------
-- Server version	8.0.22-0ubuntu0.20.04.3

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
-- Table structure for table `cars`
--

DROP TABLE IF EXISTS `cars`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cars` (
  `id` int NOT NULL AUTO_INCREMENT,
  `brand` varchar(255) NOT NULL,
  `model` varchar(255) NOT NULL,
  `year` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cars`
--

LOCK TABLES `cars` WRITE;
/*!40000 ALTER TABLE `cars` DISABLE KEYS */;
INSERT INTO `cars` VALUES (15,'bmw','asdada',1990),(16,'bmw','asdada',1990),(18,'bmw','asdada',1990),(20,'bmw','asdada',1990),(21,'bmw','asdada',1990),(22,'bmw','asdada',1990),(23,'bmw','fghfgh',1990),(24,'fgfgh','fghfgh',1990),(25,'fgfgh','fgh',1990),(26,'fgssfgh','fssgh',1999),(27,'fgDFGDFGssfgh','fssDFGDFGgh',1998),(28,'fgDFGsDFGssfsdsdfsgh','fssDFsfsdfGDFGgh',1998),(29,'fgDFGadfsdsdfsgh','fssasdfGDFGgh',1998),(30,'asdasd','fssaasdasdh',1998),(31,'audi','a50',1998),(32,'audi','a60',1998),(33,'audi','a70',1998);
/*!40000 ALTER TABLE `cars` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reviews`
--

DROP TABLE IF EXISTS `reviews`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reviews` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `car_id` int NOT NULL,
  `comment` varchar(255) NOT NULL,
  `rating` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `car_id` (`car_id`),
  CONSTRAINT `reviews_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `reviews_ibfk_2` FOREIGN KEY (`car_id`) REFERENCES `cars` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reviews`
--

LOCK TABLES `reviews` WRITE;
/*!40000 ALTER TABLE `reviews` DISABLE KEYS */;
INSERT INTO `reviews` VALUES (1,19,25,'es una caca',1);
/*!40000 ALTER TABLE `reviews` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (13,'manuel','manuel@gmail.com','$2a$12$oLOAGv7HoCPLwO1XaBx6HO/wMzE2gSdrialdb8Y44t7mC00D/1jq2','admin'),(14,'manuel','jjunkera@gmail.com','$2a$12$.L1.icyaqTwtBj5whxz.eumqcIM1aczDJBe1CPkEn1DkvgNI0G.ym','reader'),(15,'manuel','jose.junquera@hotmail.com','$2a$12$VcsGVyk2hVu/eqm0OR2.R.oLsiCUs8AvLQcjb6g1.QJfh1hHTwEyO','reader'),(16,'manuel','1234@hotmail.com','$2a$12$cbl5Z42TEjEj06bkwljeoe7/YIEkgmBmBXTiJ/fmjIRo96X2jQnVe','reader'),(17,'manuel','12345@hotmail.com','$2a$12$nluTeubnFa9EnAj2RJ1.0uA8MoVtdMKhcsH4ZthI2sWenwaPKHZwW','reader'),(18,'manuel','xijuxewe-1809@yopmail.com','$2a$12$aR6uk6izTXLVpo5N0MUDcuuO9spQxD.9lcB8sJDaM3a2jETsideCC','reader'),(19,'pedro','pedro@gmail.com','$2a$12$ut4vJlyteGzXrM1iQu3EFu71ofQMm9qOfbgT4/ER2w1N.q23jboKS','reader');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_activation`
--

DROP TABLE IF EXISTS `users_activation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users_activation` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `verification_code` char(64) NOT NULL,
  `created_at` datetime NOT NULL,
  `verified_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_activation`
--

LOCK TABLES `users_activation` WRITE;
/*!40000 ALTER TABLE `users_activation` DISABLE KEYS */;
INSERT INTO `users_activation` VALUES (1,17,'55c30a2161543436f21086c96ff9e1362f79174a79855d49fc915730b3c58e98','2021-01-22 18:02:02',NULL),(2,18,'4b3548aac3c5ca30e6d8d668b04127e727946e76a08f92d657dc0dd901f0d5a9','2021-01-22 18:05:04','2021-01-22 19:33:16'),(3,19,'57fe1e32470fad938a710afddfbed4c3737efa4df241c6656bda510c09834292','2021-01-23 09:57:33',NULL);
/*!40000 ALTER TABLE `users_activation` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-01-23 13:04:19
