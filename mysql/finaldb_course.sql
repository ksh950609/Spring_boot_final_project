-- MySQL dump 10.13  Distrib 8.0.29, for macos12 (x86_64)
--
-- Host: localhost    Database: finaldb
-- ------------------------------------------------------
-- Server version	8.0.29

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
-- Table structure for table `course`
--

DROP TABLE IF EXISTS `course`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `course` (
  `courseId` int NOT NULL AUTO_INCREMENT unique,
  `userId` varchar(20) NOT NULL,
  `exhbnId` int NOT NULL,
  `courseTitle` varchar(50) DEFAULT NULL,
  `courseTag` varchar(1000) DEFAULT NULL,
  `courseView` int DEFAULT '1',
  `courseLike` int DEFAULT '0',
  `courseComment` int DEFAULT '0',
  `courseState` varchar(50) DEFAULT 'POST',
  `createdAt` datetime DEFAULT CURRENT_TIMESTAMP,
  `updatedAt` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  -- courseListItem
  `placeNames` varchar(2000) DEFAULT NULL,
  `categoryNames` varchar(2000) DEFAULT NULL,
  `phones` varchar(2000) DEFAULT NULL,
  `addressNames` varchar(2000) DEFAULT NULL,
  `roadAddressNames` varchar(2000) DEFAULT NULL,
  `postionX` varchar(2000) DEFAULT NULL,
  `positionY` varchar(2000) DEFAULT NULL,
  `placeUrls` varchar(2000) DEFAULT NULL,
  `placeMemos` varchar(2000) DEFAULT NULL,
  PRIMARY KEY (`courseId`),
  KEY `FK_course_userId` (`userId`),
  KEY `FK_course_exhbnId` (`exhbnId`),
  CONSTRAINT `FK_course_exhbnId` FOREIGN KEY (`exhbnId`) REFERENCES `exhbn` (`exhbnId`),
  CONSTRAINT `FK_course_userId` FOREIGN KEY (`userId`) REFERENCES `user` (`userId`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course`
--

LOCK TABLES `course` WRITE;
/*!40000 ALTER TABLE `course` DISABLE KEYS */;
-- INSERT INTO `course` VALUES (1,'user',205263,'테스트 코스','테스트코스;;테스트태그;;',1,3,0,'POST','2022-08-29 13:32:24','2022-08-29 13:32:24','박물관;;카페;;식당','박물관주소;;카페주소;;식당주소','박물관 메모사항;;카페 메모사항;;식당 메모사항'),
-- 	(2,'user',185859,'오늘 아주 많이 걷는거야','운동화추천코스;;강력추천맛집;;',1,0,0,'POST','2022-08-29 13:32:24','2022-08-29 13:32:24','S프로젝트_Connected Tunnel;;거북이;;버뮤다 삼각지;;반포한강공원;;S프로젝트_Connected Tunnel;;거북이;;버뮤다 삼각지;;반포한강공원','서울특별시 종로구 인사동11길 8 KCDF갤러리;;방배천로 4안길 48 1층;;서울시 용산구 한강대로 52길 19;;서울시 서초구 신반포로 11길 40;;서울특별시 종로구 인사동11길 8 KCDF갤러리;;방배천로 4안길 48 1층;;서울시 용산구 한강대로 52길 19;;서울시 서초구 신반포로 11길 40','소요시간 60분;;케이크 3일 전에 예약할 것!!!;;폭립 유명;;따릉이 타기. 돗자리 가져올 사람??;;소요시간 60분;;케이크 3일 전에 예약할 것!!!;;폭립 유명;;따릉이 타기. 돗자리 가져올 사람??'),
--     (3,'user2',209448,'가족끼리 가서 좋았던 전시','자차이동;;어린이메뉴있는맛집;;',1,0,0,'POST','2022-08-29 13:32:24','2022-08-29 13:32:24','박물관;;카페;;식당','박물관주소;;카페주소;;식당주소','박물관 메모사항2;;카페 메모사항2;;식당 메모사항2'),
--     (4,'user2',166147,'비건 카페 투어까지 가보자고!','테스트코스;;테스트태그;;',5,3,0,'POST','2022-08-29 13:32:24','2022-08-29 13:32:24','박물관;;카페;;식당','박물관주소;;카페주소;;식당주소','박물관 메모사항2;;카페 메모사항2;;식당 메모사항2',""),
--     (5,'user',210404,'테스트 코스22','테스트코스;;테스트태그;;',5,3,0,'POST','2022-08-29 13:32:24','2022-08-29 13:32:24','박물관;;카페;;식당','박물관주소;;카페주소;;식당주소','박물관 메모사항2;;카페 메모사항2;;식당 메모사항2',""),
--     (6,'user2',212102,'테스트 코스22','테스트코스;;테스트태그;;',5,3,0,'POST','2022-08-29 13:32:24','2022-08-29 13:32:24','박물관;;카페;;식당','박물관주소;;카페주소;;식당주소','박물관 메모사항2;;카페 메모사항2;;식당 메모사항2',"");
/*!40000 ALTER TABLE `course` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-08-30 17:02:52

DROP TABLE IF EXISTS `courselike`;
CREATE TABLE `courselike` (
  `courseId` int NOT NULL,
  `userId` varchar(20) NOT NULL,
  CONSTRAINT `FK_courselike_courseId` FOREIGN KEY (`courseId`) REFERENCES `course` (`courseId`),
  CONSTRAINT `FK_courselike_userId` FOREIGN KEY (`userId`) REFERENCES `user` (`userId`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

DROP TABLE IF EXISTS `courseComment`;
CREATE TABLE `courseComment` (
  `commentId` int NOT NULL AUTO_INCREMENT,
  `courseId` int NOT NULL,
  `userId` varchar(50) NOT NULL,
  `pageViewState` varchar(50) DEFAULT 'POST',
  `comment` text,
  `commentLike` int DEFAULT '0',
  `commentCreatedDate` datetime DEFAULT CURRENT_TIMESTAMP,
  `commentUpdatedDate` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`commentId`),
  CONSTRAINT `FK_courseComment_corseId` FOREIGN KEY (`courseId`) REFERENCES `course` (`courseId`),
  CONSTRAINT `FK_courseComment_userId` FOREIGN KEY (`userId`) REFERENCES `user` (`userId`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;