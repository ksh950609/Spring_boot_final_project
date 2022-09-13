CREATE DATABASE  IF NOT EXISTS `finaldb` /*!40100 DEFAULT CHARACTER SET utf8mb3 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `finaldb`;
-- MySQL dump 10.13  Distrib 8.0.30, for Win64 (x86_64)
--
-- Host: localhost    Database: finaldb
-- ------------------------------------------------------
-- Server version	8.0.30

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
  `userId` varchar(20) NOT NULL,
  `userPw` varchar(100) NOT NULL,
   `userName` varchar(50),
  `userEmail` varchar(50) NOT NULL,
  `userNickname` varchar(50) DEFAULT NULL,
  `userGender` varchar(1) NOT NULL,
  `userBirth` date NOT NULL,
  `userRoll` varchar(10) DEFAULT 'USER',
  `createdAt` datetime DEFAULT CURRENT_TIMESTAMP,
  `updatedAt` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
`userState` varchar(50) NOT NULL DEFAULT 1, -- userState 1: 정상 2: 탈퇴 3:밴 
  PRIMARY KEY (`userId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES ('user','$2a$10$aDVD6uxBlmaY2g0TBTR0MORVNp4Rg5I9a0iDpAdLNij86wdABhdry', '테스트', 'user@gmail.com','테스트계정','M','2000-10-22','USER','2022-08-14 14:45:50','2022-08-14 14:45:50', 1);
INSERT INTO `user` VALUES ('user2','$2a$10$aDVD6uxBlmaY2g0TBTR0MORVNp4Rg5I9a0iDpAdLNij86wdABhdry', '테스트2', 'user@kakao.com','테스트계정2','F','1998-05-02','USER','2022-08-15 14:45:50','2022-08-16 14:45:50', 1);
INSERT INTO `user` VALUES ('sangjong','$2a$10$aDVD6uxBlmaY2g0TBTR0MORVNp4Rg5I9a0iDpAdLNij86wdABhdry', '최상종', 'user@enaver.com','csj1026','M','1996-10-26','USER','2022-08-18 14:45:50','2022-08-18 14:45:50', 1);


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

-- Dump completed on 2022-08-18 15:47:51



