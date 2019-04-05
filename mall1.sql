-- MySQL dump 10.13  Distrib 5.7.17, for macos10.12 (x86_64)
--
-- Host: localhost    Database: mall
-- ------------------------------------------------------
-- Server version	5.7.17

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Current Database: `mall`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `mall` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `mall`;

--
-- Table structure for table `admins`
--

DROP TABLE IF EXISTS `admins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admins` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '����ID',
  `account` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '�˻�',
  `name` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '�û���',
  `pwd` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '����',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=100002 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='admin';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admins`
--

LOCK TABLES `admins` WRITE;
/*!40000 ALTER TABLE `admins` DISABLE KEYS */;
INSERT INTO `admins` VALUES (100001,'admin','wwy','123456');
/*!40000 ALTER TABLE `admins` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comments`
--

DROP TABLE IF EXISTS `comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comments` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '����ID',
  `userId` bigint(20) NOT NULL DEFAULT '0',
  `goodsId` bigint(20) NOT NULL DEFAULT '0',
  `goodsDetailId` bigint(20) NOT NULL DEFAULT '0',
  `orderId` bigint(20) NOT NULL DEFAULT '0',
  `content` varchar(500) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `score` int(11) NOT NULL DEFAULT '0',
  `createtime` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=100001 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='comments';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comments`
--

LOCK TABLES `comments` WRITE;
/*!40000 ALTER TABLE `comments` DISABLE KEYS */;
/*!40000 ALTER TABLE `comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `goods`
--

DROP TABLE IF EXISTS `goods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `goods` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '����ID',
  `name` varchar(500) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `typeId` bigint(20) NOT NULL DEFAULT '0',
  `img` varchar(500) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `desc` varchar(500) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `updatetime` date NOT NULL,
  `createtime` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=100013 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='goods';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `goods`
--

LOCK TABLES `goods` WRITE;
/*!40000 ALTER TABLE `goods` DISABLE KEYS */;
INSERT INTO `goods` VALUES (100003,'����',100001,'https://img10.360buyimg.com/imgzone/jfs/t18619/177/998713603/696344/476f75fe/5ab320f5N81dc58c5.jpg','�����','2018-03-23','2018-03-23'),(100005,'��ݮ',100001,'http://oss.bater.top/moremall/caomei.png','','2018-03-23','2018-03-23'),(100006,'��ݮ',100001,'http://oss.bater.top/moremall/lanmei.png','','2018-03-23','2018-03-23'),(100007,'����',100001,'http://oss.bater.top/moremall/boluo.png','','2018-03-23','2018-03-23'),(100008,'iPhoneX',100002,'http://oss.bater.top/moremall/iphonex.png','','2018-03-23','2018-03-23'),(100009,'â��',100001,'http://oss.bater.top/moremall/manguo.png','','2018-03-23','2018-03-23'),(100010,'ţ�͹�',100001,'http://oss.bater.top/moremall/niuyou.png','','2018-03-23','2018-03-23'),(100011,'������',100001,'http://oss.bater.top/moremall/chelizi.png','','2018-03-23','2018-03-23'),(100012,'�����',100001,'http://oss.bater.top/moremall/qiyi.png','','2018-03-23','2018-03-23');
/*!40000 ALTER TABLE `goods` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `goodsDetails`
--

DROP TABLE IF EXISTS `goodsDetails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `goodsDetails` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '����ID',
  `goodsId` bigint(20) NOT NULL DEFAULT '0',
  `specName` varchar(500) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `stockNum` int(11) NOT NULL DEFAULT '0',
  `unitPrice` double NOT NULL DEFAULT '0',
  `updatetime` date NOT NULL,
  `createtime` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=100012 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='goodsDetails';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `goodsDetails`
--

LOCK TABLES `goodsDetails` WRITE;
/*!40000 ALTER TABLE `goodsDetails` DISABLE KEYS */;
INSERT INTO `goodsDetails` VALUES (100002,100003,'��',999,10,'2018-03-23','2018-03-23'),(100004,100005,'��',999,121,'2018-03-23','2018-03-23'),(100005,100006,'��',999,12,'2018-03-23','2018-03-23'),(100006,100007,'��',999,12,'2018-03-23','2018-03-23'),(100007,100008,'��',999,5999,'2018-03-23','2018-03-23'),(100008,100009,'��',999,12,'2018-03-23','2018-03-23'),(100009,100010,'��',999,12,'2018-03-23','2018-03-23'),(100010,100011,'��',999,12,'2018-03-23','2018-03-23'),(100011,100012,'��',999,20,'2018-03-23','2018-03-23');
/*!40000 ALTER TABLE `goodsDetails` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `messages`
--

DROP TABLE IF EXISTS `messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `messages` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '����ID',
  `userId` bigint(20) NOT NULL DEFAULT '0',
  `goodsId` bigint(20) NOT NULL DEFAULT '0',
  `content` varchar(500) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `state` tinyint(4) NOT NULL DEFAULT '0',
  `createtime` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=100001 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='messages';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `messages`
--

LOCK TABLES `messages` WRITE;
/*!40000 ALTER TABLE `messages` DISABLE KEYS */;
/*!40000 ALTER TABLE `messages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orders` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '����ID',
  `userId` bigint(20) NOT NULL DEFAULT '0',
  `goodsDetailId` bigint(20) NOT NULL DEFAULT '0',
  `goodsNum` int(11) NOT NULL DEFAULT '0',
  `amount` double NOT NULL DEFAULT '0',
  `state` tinyint(4) NOT NULL DEFAULT '0',
  `createtime` date NOT NULL,
  `updatetime` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=100001 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='orders';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `replys`
--

DROP TABLE IF EXISTS `replys`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `replys` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '����ID',
  `messageId` bigint(20) NOT NULL DEFAULT '0',
  `content` varchar(500) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `createtime` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=100001 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='replys';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `replys`
--

LOCK TABLES `replys` WRITE;
/*!40000 ALTER TABLE `replys` DISABLE KEYS */;
/*!40000 ALTER TABLE `replys` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `types`
--

DROP TABLE IF EXISTS `types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=100003 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='types';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `types`
--

LOCK TABLES `types` WRITE;
/*!40000 ALTER TABLE `types` DISABLE KEYS */;
INSERT INTO `types` VALUES (100001,'ʳƷ��'),(100002,'������');
/*!40000 ALTER TABLE `types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '����ID',
  `email` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `nickname` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '�û���',
  `pwd` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '����',
  `sex` tinyint(4) NOT NULL DEFAULT '0',
  `recipient` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `address` varchar(500) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `phone` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `headimg` varchar(500) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'http://tvax4.sinaimg.cn/crop.0.0.480.480.180/768c39d5ly8fjje1d0teej20dc0dcq35.jpg',
  `updatetime` date NOT NULL,
  `createtime` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=100002 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='users';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (100001,'wwyknight@163.com','','',0,'','','','http://tvax4.sinaimg.cn/crop.0.0.480.480.180/768c39d5ly8fjje1d0teej20dc0dcq35.jpg','2018-09-12','2018-09-12');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-03-23  9:34:07