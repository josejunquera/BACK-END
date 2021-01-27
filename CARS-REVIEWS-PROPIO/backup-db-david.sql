-- MySQL dump 10.13  Distrib 8.0.22, for macos10.15 (x86_64)
--
-- Host: 127.0.0.1    Database: cars_reviews
-- ------------------------------------------------------
-- Server version	8.0.22

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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cars`
--

LOCK TABLES `cars` WRITE;
/*!40000 ALTER TABLE `cars` DISABLE KEYS */;
INSERT INTO `cars` VALUES (1,'Seat','Ibiza',2018),(2,'Opel','Astra',2011),(3,'Audi','A3',2016),(4,'Dacia','Sandero',2016),(5,'Ford','Fiesta',2019),(6,'Audi','Q2',2019);
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
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reviews`
--

LOCK TABLES `reviews` WRITE;
/*!40000 ALTER TABLE `reviews` DISABLE KEYS */;
INSERT INTO `reviews` VALUES (1,13,2,'Esto es un comentario',8),(2,16,2,'coche muy bonito',7),(3,4,2,'El interior se hace muy pequeño. Es casi un 4 plazas',3),(4,8,2,'Me gusta mucho. Lo veo un coche muy estable',8),(5,6,5,'Muy buen coche',9),(6,8,5,'Lamentable',2),(7,12,5,'Mi primer coche, estuvo bien!',7),(8,2,5,'Lo use para una mudanza. Ahora con tiempo una divertida aventura. ',5),(11,14,3,'Se paga la marca',4),(12,14,3,'Me duro 12 años, después lo cambié',9),(13,2,3,'Lo que esperaba',8),(14,3,3,'Buen carro! A tope por la autopista!',7),(15,4,3,'Nada especial',6),(16,5,3,'Lo cogí de segunda mano. Ni fu ni fa',5),(17,7,3,'Cumplio su función',6),(18,8,3,'Todo correcto. El interior no envejeció bien.',6),(19,10,3,'A fuego!',9),(20,11,3,'Audi Forever!',8),(21,14,1,'Mi primer coche',9),(22,2,1,'Es lo que es... para ir la fiesta es suficiente!',8),(23,3,1,'Pequeño pero perfecto para ciudad',7),(24,4,1,'Ya es un clásico, mi padre también tuvo uno!',6),(25,8,1,'Tráfico me para siempre, rojo y 3 puertas!!!',5),(26,7,1,'Buscaba un coche pequeño con servicio y es perfecto',6),(27,2,1,'Correcto.',6),(28,9,1,'Solo por los recuerdos le doy buena nota!',9),(29,14,1,'En mi familia siempre con Seat y siempre nos salen buenos.',8),(30,11,6,'Pequeño pero matón!',9),(31,5,6,'Fue un capricho y no me arrepiento!',8),(32,9,6,'SUV perfecto para ciudad',7),(33,3,6,'Audi nunca defrauda',8),(34,16,6,'Lo estuve viendo y no lo compré. Caja de cerillas',1),(35,17,6,'Caro para lo que ofrece',3);
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
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'David Souto','davidsoutoc@gmail.com','$2a$12$eW.bNGW8sqCfcoMVytzh9uTaXXUzQC9vc6cjXxcdlLYS5ELto8Uxi','admin'),(2,'Juan López','user2@email.com','$2a$12$IgZh.Lsui0TCk3nDOFYq0OHA8rtZX/2.uXJ10qS6qG2I0tdd8FNNe','reader'),(3,'Carlos Otero','user3@email.com','$2a$12$4UI2w0nbTasXPzMd5KDJ5.pgbFgxsmH.yM7O6V.MQgXCkYW96Cpja','reader'),(4,'Jaime Gutierrez','user4@email.com','$2a$12$81vD7X2Vet/tKNmWaLIi8ONnWs4nFWNukyqWcfow29sLMlc22OFxy','reader'),(5,'Luisa Fernández','user5@email.com','$2a$10$a1OqMA0bktnTkPi.ujuoiOy50bJC7EpBZy6CztXyQ8/wu/Arffi0q','reader'),(6,'Marisol Súarez','user6@email.com','$2a$10$c2f/SRJgHqyLCZacPBQAZu17oMnFTSn1w9XoXzlux6WVUVjZfP3Ty','reader'),(7,'Pedro Castaño','user7@email.com','$2a$10$l9o5cc9uMp84hoK3eLIIF.V3pC4UoSmwZrzHr9FRYCv/CKxJq3EaO','reader'),(8,'Luis Cebreiro','user8@email.com','$2a$10$xUrKKVVhlw8mPjR7tFq7juMAuvDk3lXXQ99KHTW4bG8tpKeyDZxvq','reader'),(9,'José Luis Xabaris','user9@email.com','$2a$10$DnE.nzEPf6MmXPBYwwfyb.oEaP.XBoclqQD1EulYKDk1BEPmIinpq','reader'),(10,'Daniel Giraldez','user10@email.com','$2a$10$0OqW2J.giy.WlWYHRO2K0Oqd99uaPPMFjQLAHTBqiW4Oocnp8Fm4e','reader'),(11,'Borja Salas','user11@email.com','$2a$10$QRGdq.sG8ZZtLVUVDAzDzO5IjRuAqweXSHeYlaf3rYbPwZM4rXgx2','reader'),(12,'Mario Mallo','user12@email.com','$2a$10$IjauEtpa8UKDX6quHZziFuMPS5CPBnQ96sQAFUIjDo9sIMo88TbXW','reader'),(13,'María Fernández','user13@email.com','$2a$10$jhy28csG6miWVQvaHpwaxu8BJWPOzNRpjuP0ctVbE3gNQORrSd1/a','reader'),(14,'Marta Liñares','user14@email.com','$2a$10$v1LZZoQP8kF/hcLMHxfAlu7.EjkTY9yZB77QXyvDZoxm03DN2XpZa','reader'),(15,'Luis Quiroga','user15@email.com','$2a$10$sTsMMyucoVsVCkYnpxNhmeB8gnk03aLOYMzx7jWoMGWgDI3aZexhO','reader'),(16,'Antonio Serrano','user16@email.com','$2a$12$Sd4w.smHd.kuxd4GpYi/DO9fR.DjUgCSqFGnefLWKCFYtRgp01y32','reader'),(17,'Roi Sil','user17@email.com','$2a$12$9gLN/WT58jbHGQBZAXCOP.YMlcLzSjQBO6sAt7scTUvuB47tIE1XW','reader'),(18,'Lola Castro','user18@email.com','$2a$12$htMiVsPPGSLRXrY/FPJIlOptb.bA7Gg4H90WYUpISMScEo5bkwaXe','reader'),(32,'Perico Palotes','user19@email.com','$2a$10$jS9hKrtHAXbgI.OQnL4G9eNecjBmHBehX7r7nZTY8/dm92E6gsBbu','reader'),(33,'Yago Miranda','user20@email.com','$2a$10$J2FoyspOilR/Q5gSibFZGukFB0WtF1m/GY668Vzlof.EzI2N/Fvmm','reader');
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
  `user_id` char(36) NOT NULL,
  `verification_code` char(64) NOT NULL,
  `created_at` datetime NOT NULL,
  `verified_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_activation`
--

LOCK TABLES `users_activation` WRITE;
/*!40000 ALTER TABLE `users_activation` DISABLE KEYS */;
INSERT INTO `users_activation` VALUES (1,'9','cd6099e5458388da1add717c6b421bf1a9b4f788a922d8f90a35bed99a404d46','2021-01-21 00:41:21','2021-01-22 19:07:04'),(2,'10','805cb482dd12b3f96a0a706ae7d23cb49e4502b2e97b7218f83fea736634a262','2021-01-21 00:46:44','2021-01-22 19:07:04'),(3,'11','160a744c7ccab331ad13216b36877515e260f9f4b79a8c1da7883ac016cc78ff','2021-01-21 00:47:19','2021-01-22 19:07:04'),(4,'12','1725eaa89d13dd9b70b67c769d7943109860adaf6d74ed3e353b8cf84131ceb3','2021-01-21 00:53:09','2021-01-22 19:07:04'),(5,'13','2eb4e08dfd4869e918f9c11faf54cb9eb054378f7742a64cc94974dc9e15c1ea','2021-01-21 00:53:53','2021-01-22 19:07:04'),(6,'14','c3c236a1ddd8096269b6d5eba92300114bba9105afc4c49528a47b64372330f8','2021-01-21 00:57:16','2021-01-22 19:07:04'),(7,'15','2d728b3c5e61ff0b07cab9d86c265bad09614d302529d203a7714974de95eff2','2021-01-21 08:24:20','2021-01-22 19:07:04'),(8,'16','f18ccdfbe37d8470cdc0a1555ba800ea974d6e4b22126dc03b4e82cbd1dfff46','2021-01-21 21:42:20','2021-01-22 19:07:04'),(9,'17','e4350aceb6e7ff7e25bcba626370fde85c2c225ed318f54e5b71cfb274b8fc22','2021-01-21 21:42:56','2021-01-22 19:07:04'),(10,'18','45306247dcc93c81cb26ffe72c3154614eaccc77b74d15b198ecfa5c8890b2ce','2021-01-21 21:43:42','2021-01-22 19:07:04'),(11,'24','8215e4131538bd3ad238aedab43f51d1ca15515710fac68296e376eb0488c064','2021-01-21 22:03:50','2021-01-22 19:07:04'),(12,'25','d347608d252498b020dedd9a9757aed8bb23cb8cc5d0ebb55736dfcdd945cfa9','2021-01-21 22:29:27','2021-01-22 19:07:04'),(13,'26','e3827928daf637bcc09cb178371b56f417571f8067c52225d07c5ccfbda93631','2021-01-21 23:12:11','2021-01-22 19:07:04'),(14,'27','cfcc729d930221fb2659b3ac88f5b80c10a9dae898b19b2d71522f69d5793a78','2021-01-21 23:14:20','2021-01-22 19:07:04'),(15,'28','7c2ae49c7b2c71dafb3b9442568ee0e3b7c51516c800ff359027ab0f324c2efd','2021-01-21 23:18:10','2021-01-22 19:07:04'),(16,'29','ee4c17d4839e5610f1fc31f430af6d22aeff6b7d84de886bbc27946c81920adb','2021-01-22 18:00:12','2021-01-22 19:07:04'),(17,'30','cda27307d5f93614194c495fc76f2024ccd5b9470b7186620c31917c58536b50','2021-01-22 18:11:42',NULL),(18,'31','c76173880fc5a25e5518955c936a2911be27ff00210643bc1c38512d122f928b','2021-01-22 19:15:49',NULL),(19,'32','58ea1b79d2679989b739f0dc95f85925ee08aed4f6b54df5f9085673148bb17a','2021-01-23 01:35:01',NULL),(20,'33','a25af7364760f6329ebacb665826e81ed2e873e08e0a82df7127573c389c3705','2021-01-23 01:35:07',NULL);
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

-- Dump completed on 2021-01-23  2:56:28
