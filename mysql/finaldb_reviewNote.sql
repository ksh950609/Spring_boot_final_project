-- MySQL dump 10.13  Distrib 8.0.29, for Win64 (x86_64)
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
-- Table structure for table `reviewnote`
--

DROP TABLE IF EXISTS `reviewnote`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reviewnote` (
  `reviewNoteId` int NOT NULL AUTO_INCREMENT,
  `reviewNoteTitle` varchar(150) DEFAULT NULL,
  `reviewNote` longtext,
  `reviewNoteLike` int DEFAULT '0',
  `reviewNoteCommentNum` int DEFAULT '0',
  `reviewNoteCreatedDate` datetime DEFAULT CURRENT_TIMESTAMP,
  `reviewPageViewState` varchar(50) DEFAULT 'POST',
  `courseId` int DEFAULT NULL,
  `userId` varchar(20) NOT NULL,
  `exhbnId` int DEFAULT NULL,
  PRIMARY KEY (`reviewNoteId`),
  KEY `courseId` (`courseId`),
  KEY `userId` (`userId`),
  KEY `exhbnId` (`exhbnId`),
  CONSTRAINT `FK_reviewNote_course` FOREIGN KEY (`courseId`) REFERENCES `course` (`courseId`),
  CONSTRAINT `FK_reviewNote_exhbn` FOREIGN KEY (`exhbnId`) REFERENCES `exhbn` (`exhbnId`),
  CONSTRAINT `FK_reviewNote_user` FOREIGN KEY (`userId`) REFERENCES `user` (`userId`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reviewnote`
--

LOCK TABLES `reviewnote` WRITE;
/*!40000 ALTER TABLE `reviewnote` DISABLE KEYS */;
INSERT INTO `reviewnote` VALUES (1,'이 전시를 가신다면 제 코스 추천해요','오늘 소개해드릴 곳은, 아산에서 제일 좋았던 공간 카페 온양이에요. 온양민속박물관 안에 있는 카페인데, 또 하나의 전시를 보는 것 같은 정말 예쁜 카페였답니다. 온양민속박물관 티켓을 끊지 않아도 카페만 이용 가능해요.일반 시민은 박물관 이용료가 5천원이지만아산 시민은 1천원이라서 아산 시민이시면 박물관 들렀다가 카페 이용하면 딱 좋을 것 같아요~',0,0,'2022-09-02 04:49:38','POST',1,'user',217842),(2,'바다와 미술관 전시회 후기','<p>광주광역시 남구 이강하미술관은 매년 여름 ‘환경과 예술’을 주제로 기획 전시회를 추진한다. </p><p>코로나가 시작 된 2020년 160일간 미술관 문을 닫으며 기획했던 &lt;2020 Earth&amp;Museum 지구와 미술관&gt;을 시작으로 &lt;2021 Space &amp;Museum 우주와 미술관&gt;, 올해 &lt;2022 Sea&amp;Museum 바다와 미술관&gt;까지 3년간 진행되어 온 ‘예술 프로젝트’이다.&nbsp;</p><p><br></p><p>‘바다’ 즉, ‘물’이라는 물질이 창조 된 환경을 살펴보면 우주적 장소들에 근거 한 과거와 현재가 연결 된 물의 존재를 인지하고 그 안에서 생명이 탄생했다는 것을 알 수 있다.</p><p> 바다는 현재의 우리와 미래까지 이어지는 역사적 진화와 상상 속 메타 근원까지 긴밀하게 연결되어 있는지 모른다.</p><p> ‘바다’는 인류 문화의 중요한 배경, 중심의 원천, 문화적 초시가 되기도 한다. </p><p>나아가 자유라는 이데올로기의 상징적 근원이자 이동의 수단, 폭풍, 쓰나미, 전쟁, 용기, 모험 등 선택과 의식의 장소가 되기도 하다. 지구 중심을 향한 거대한 힘을 우리는 중력이라 부르고, 바다가 중력에 의한 힘으로 지구 중심의 방향으로 끌어당겨질 때 성난 파도, 밀물과 썰물이 일게 되는 것이다. </p><p>이 모든 것은 순환의 상호작용을 하며 우리와 긴밀하게 연결되어 있다. </p><p>자신의 바다를 통해 자아 또는 타인의 모습으로 발견하게도 하고, 단정 지을 수 없는 이유들에서 인류의 존엄과 창의성을 증명하며 스스로의 삶을 이어가고 있는 것이다.&nbsp;</p><p><br></p><p>이번 전시는 바다를 주제로 미지의 세계를 향한 각각 다른 나라의 도시에 살고 있는 6명의 예술가들이 보여주는 시도와 창의적 진동(creative vibration)이라 하겠다.</p>',0,0,'2022-09-01 04:49:38','POST',2,'user2',217601),(3,'전시회부터 예쁜 카페까지','<p style=\"text-align: center; font-size: 16px;\">1층은 전시를 2층은 카페를 운영하여 눈과 입이 즐길 수 있는 것들이 많았어요!</p><ul style=\"font-size: 16px;\"><li style=\"text-align: center; font-size: 16px;\"><br></li><li style=\"font-size: 16px;\"></li><li style=\"text-align: center; font-size: 16px;\">제가 방문 했을 땐 1층 전시가 끝나 카페만 볼 수 있었지만 카페 내부 또한 다양한 찻잔과 차 등이 전시 되어 있어 많이 아쉽지 않았어요..</li><li style=\"text-align: center; font-size: 16px;\"><br></li><li style=\"text-align: center; font-size: 16px;\">이곳은 커피가 아닌차를 즐기는 곳으로 차를 좋아 하시는 분들이라면 정말 적극 추천!</li><li style=\"text-align: center; font-size: 16px;\"><br></li></ul><p style=\"font-size: 16px;\"></p><ul style=\"font-size: 16px;\"><li style=\"text-align: center; font-size: 16px;\">3층은 루프탑이 있었는데 날이 추워 사용은 못 했으나 두 눈 가득 한옥이 보여 날이 좋으면 올라가서 한옥 멍을 때리기 너무 좋을 것 같아요~ 사진만 봐도 힐링 그 자체인 곳~ 다들 다녀오세용!</li></ul>',0,0,'2022-08-30 04:49:38','POST',3,'user',217300),(4,'( )t part2 전시 꼭 가보세요','<p>오늘 소개해드릴 곳은, 아산에서 제일 좋았던 공간 카페 온양이에요.<img style=\"width: 25%; float: right;\" src=\"https://mblogthumb-phinf.pstatic.net/MjAyMDA4MThfMjc4/MDAxNTk3Njc3Mzk3NjY3.nHP2nBRKCgy0Rgdh4cme179H55NF8i9-LRc_GJ6u69Ug.HKXR1Wx_qWC4VcgpMMGOihLo0TH2IpKNuHYqzV2TU2Ig.JPEG.inowey/IMG_7811.JPG?type=w800\" class=\"note-float-right\"></p><p> 온양민속박물관 안에 있는 카페인데, 또 하나의 전시를 보는 것 같은</p><p> 정말 예쁜 카페였답니다.</p><p><br></p><p> </p><p>온양민속박물관 티켓을 끊지 않아도 카페만 이용 가능해요.</p><p><br></p><p>일반 시민은 박물관 이용료가 5천원이지만아산 시민은 1천원이라서 아산 시민이시면</p><p><br></p><p> </p><p>박물관 들렀다가 카페 이용하면 딱 좋을 것 같아요~</p>',0,0,'2022-08-31 04:49:38','POST',5,'user',217035),(5,'완벽한 코스 강추!','<p>오늘 소개해드릴 곳은, 아산에서 제일 좋았던 공간 카페 온양이에요.<img style=\"width: 25%; float: right;\" src=\"https://mblogthumb-phinf.pstatic.net/MjAyMDA4MThfMjc4/MDAxNTk3Njc3Mzk3NjY3.nHP2nBRKCgy0Rgdh4cme179H55NF8i9-LRc_GJ6u69Ug.HKXR1Wx_qWC4VcgpMMGOihLo0TH2IpKNuHYqzV2TU2Ig.JPEG.inowey/IMG_7811.JPG?type=w800\" class=\"note-float-right\"></p><p> 온양민속박물관 안에 있는 카페인데, 또 하나의 전시를 보는 것 같은</p><p> 정말 예쁜 카페였답니다.</p><p><br></p><p> </p><p>온양민속박물관 티켓을 끊지 않아도 카페만 이용 가능해요.</p><p><br></p><p>일반 시민은 박물관 이용료가 5천원이지만아산 시민은 1천원이라서 아산 시민이시면</p><p><br></p><p> </p><p>박물관 들렀다가 카페 이용하면 딱 좋을 것 같아요~</p>',0,0,'2022-09-02 04:49:38','POST',4,'user',216490),(6,'MBTI J의 코스','<p>오늘 소개해드릴 곳은, 아산에서 제일 좋았던 공간 카페 온양이에요.<img style=\"width: 25%; float: right;\" src=\"https://mblogthumb-phinf.pstatic.net/MjAyMDA4MThfMjc4/MDAxNTk3Njc3Mzk3NjY3.nHP2nBRKCgy0Rgdh4cme179H55NF8i9-LRc_GJ6u69Ug.HKXR1Wx_qWC4VcgpMMGOihLo0TH2IpKNuHYqzV2TU2Ig.JPEG.inowey/IMG_7811.JPG?type=w800\" class=\"note-float-right\"></p><p> 온양민속박물관 안에 있는 카페인데, 또 하나의 전시를 보는 것 같은</p><p> 정말 예쁜 카페였답니다.</p><p><br></p><p> </p><p>온양민속박물관 티켓을 끊지 않아도 카페만 이용 가능해요.</p><p><br></p><p>일반 시민은 박물관 이용료가 5천원이지만아산 시민은 1천원이라서 아산 시민이시면</p><p><br></p><p> </p><p>박물관 들렀다가 카페 이용하면 딱 좋을 것 같아요~</p>',0,0,'2022-08-29 04:49:38','POST',6,'user',217842);
/*!40000 ALTER TABLE `reviewnote` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-09-03  2:25:01
