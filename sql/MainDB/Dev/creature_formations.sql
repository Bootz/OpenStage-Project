-- MySQL dump 10.11
--
-- Host: localhost    Database: world
-- ------------------------------------------------------
-- Server version	5.5.9

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
-- Table structure for table `creature_formations`
--

DROP TABLE IF EXISTS `creature_formations`;
CREATE TABLE `creature_formations` (
  `leaderGUID` int(11) unsigned NOT NULL,
  `memberGUID` int(11) unsigned NOT NULL,
  `dist` float unsigned NOT NULL,
  `angle` float unsigned NOT NULL,
  `groupAI` int(11) unsigned NOT NULL,
  PRIMARY KEY (`memberGUID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `creature_formations`
--

LOCK TABLES `creature_formations` WRITE;
/*!40000 ALTER TABLE `creature_formations` DISABLE KEYS */;
INSERT INTO `creature_formations` VALUES 
(138237,138237,0,0,0),
(138237,138238,3,90,2),
(138288,138288,0,0,0),
(138288,138289,3,90,2),
(138291,138291,0,0,0),
(138291,138292,3,90,2),
(138291,138293,3,180,2),
(92107,92107,0,0,2),
(92107,92105,0,0,2),
(92107,92106,0,0,2),
(92109,92109,0,0,2),
(92109,76069,0,0,2),
(92109,76071,0,0,2),
(92109,76070,0,0,2),
(92109,76068,0,0,2),
(76074,76074,0,0,2),
(76074,76075,0,0,2),
(76074,76076,0,0,2),
(76078,76078,0,0,2),
(76078,82734,0,0,2),
(76078,82733,0,0,2),
(76078,82743,0,0,2),
(76078,82732,0,0,2),
(82735,82735,0,0,2),
(82735,82737,0,0,2),
(82735,82736,0,0,2),
(82735,82716,0,0,2),
(79234,79234,0,0,0),
(79234,79235,3,90,2),
(79246,79246,0,0,0),
(79246,79240,3,90,2),
(79222,79222,0,0,0),
(79222,79276,0,0,2),
(79222,79275,0,0,2),
(79222,79274,0,0,2),
(79222,79273,0,0,2),
(79222,79272,0,0,2),
(79222,79271,0,0,2),
(79222,79270,0,0,2),
(79226,79226,0,0,0),
(79226,79213,3,90,2),
(79226,79214,3,180,2),
(79227,79227,0,0,0),
(79227,79228,3,90,2),
(79381,79381,0,0,1),
(79381,79374,0,0,1),
(79381,79373,0,0,1),
(79381,79369,0,0,1),
(79381,79354,0,0,1),
(79381,79356,0,0,1),
(79381,79358,0,0,1),
(79381,79355,0,0,1),
(79381,79357,0,0,1),
(79381,79366,0,0,1),
(79381,79364,0,0,1),
(79381,79363,0,0,1),
(79381,79365,0,0,1),
(79381,79372,0,0,1),
(79381,79370,0,0,1),
(79381,79377,0,0,1),
(79381,79378,0,0,1),
(79375,79375,0,0,2),
(79375,79376,7,90,2);

/*!40000 ALTER TABLE `creature_formations` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2011-04-05 13:03:00
