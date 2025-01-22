CREATE DATABASE  IF NOT EXISTS `music_database` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `music_database`;
-- MySQL dump 10.13  Distrib 5.7.17, for macos10.12 (x86_64)
--
-- Host: localhost    Database: music_database
-- ------------------------------------------------------
-- Server version	5.6.38

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
-- Table structure for table `album_genre`
--

DROP TABLE IF EXISTS `album_genre`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `album_genre` (
  `album_genre_style_id` int(11) NOT NULL AUTO_INCREMENT,
  `genres_id` int(11) NOT NULL,
  `albums_id` int(7) NOT NULL,
  PRIMARY KEY (`album_genre_style_id`,`genres_id`,`albums_id`),
  KEY `fk_album_genre_genres1_idx` (`genres_id`),
  KEY `fk_album_genre_albums1_idx` (`albums_id`),
  CONSTRAINT `fk_albums_albums_id` FOREIGN KEY (`albums_id`) REFERENCES `albums` (`albums_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_genres_id` FOREIGN KEY (`genres_id`) REFERENCES `genres` (`genres_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=75 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `album_genre`
--

LOCK TABLES `album_genre` WRITE;
/*!40000 ALTER TABLE `album_genre` DISABLE KEYS */;
INSERT INTO `album_genre` VALUES (63,2,33),(40,4,20),(43,4,22),(1,11,1),(3,11,2),(9,11,5),(16,11,8),(19,11,9),(28,11,13),(32,11,15),(42,11,21),(59,11,31),(64,11,33),(69,11,36),(73,12,19),(74,12,35),(57,13,29),(10,14,5),(52,15,27),(2,16,1),(4,16,2),(6,16,3),(8,16,4),(14,16,8),(21,16,10),(26,16,13),(31,16,15),(35,16,18),(38,16,19),(41,16,21),(44,16,22),(51,16,26),(55,16,28),(60,16,31),(61,16,32),(67,16,35),(68,16,36),(71,16,33),(11,17,5),(17,17,9),(23,17,11),(24,17,12),(29,17,14),(36,17,18),(47,17,23),(50,17,26),(5,18,3),(7,18,4),(12,18,6),(13,18,7),(15,18,8),(20,18,10),(22,18,11),(27,18,13),(33,18,16),(34,18,17),(39,18,20),(45,18,23),(48,18,24),(49,18,25),(53,18,27),(54,18,28),(56,18,29),(58,18,30),(62,18,32),(65,18,34),(66,18,35),(72,18,19),(18,20,9),(25,20,12),(30,20,14),(37,20,18),(46,20,23),(70,20,26);
/*!40000 ALTER TABLE `album_genre` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `album_styles`
--

DROP TABLE IF EXISTS `album_styles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `album_styles` (
  `album_styles_id` int(11) NOT NULL AUTO_INCREMENT,
  `albums_id` int(7) NOT NULL,
  `styles_id` int(11) NOT NULL,
  PRIMARY KEY (`album_styles_id`,`albums_id`,`styles_id`),
  KEY `fk_album_styles_albums1_idx` (`albums_id`),
  KEY `fk_album_styles_styles1_idx` (`styles_id`),
  CONSTRAINT `fk_album_styles_albums_id` FOREIGN KEY (`albums_id`) REFERENCES `albums` (`albums_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_album_styles_styles_id` FOREIGN KEY (`styles_id`) REFERENCES `styles` (`styles_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=257 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `album_styles`
--

LOCK TABLES `album_styles` WRITE;
/*!40000 ALTER TABLE `album_styles` DISABLE KEYS */;
INSERT INTO `album_styles` VALUES (179,1,249),(180,2,249),(181,3,239),(182,4,239),(183,4,307),(184,5,258),(185,5,75),(186,6,262),(187,7,75),(188,8,307),(189,8,239),(190,9,258),(191,9,75),(192,10,307),(193,10,239),(194,10,308),(195,11,257),(196,11,258),(197,12,258),(198,13,271),(199,13,249),(200,14,258),(201,15,249),(202,15,271),(203,16,307),(204,16,274),(205,17,239),(206,17,262),(207,18,258),(208,18,257),(242,19,98),(243,19,239),(209,20,307),(210,20,308),(211,20,269),(212,20,7),(213,21,249),(214,21,271),(234,22,249),(235,23,258),(236,23,239),(237,24,307),(238,24,239),(239,25,262),(240,26,258),(241,26,72),(244,27,307),(245,28,249),(246,29,309),(247,29,262),(248,30,307),(249,31,249),(250,32,271),(251,33,249),(252,34,274),(253,35,98),(254,35,239),(255,36,271),(256,36,249);
/*!40000 ALTER TABLE `album_styles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `albums`
--

DROP TABLE IF EXISTS `albums`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `albums` (
  `albums_id` int(7) NOT NULL AUTO_INCREMENT,
  `title` varchar(45) NOT NULL COMMENT 'This holds the album title.',
  `num_of_tracks` int(3) NOT NULL COMMENT 'This field holds total number of tracks.',
  `released` year(4) NOT NULL COMMENT 'This holds the year the album was released.',
  `cat_num` varchar(255) NOT NULL COMMENT 'This holds catalogue no. on the album as listed on the product itself.',
  PRIMARY KEY (`albums_id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `albums`
--

LOCK TABLES `albums` WRITE;
/*!40000 ALTER TABLE `albums` DISABLE KEYS */;
INSERT INTO `albums` VALUES (1,'Hunting High And Low',10,1985,'9 25300-2'),(2,'Scoundrel Days',10,1986,'9 25501-2'),(3,'With The Beatles',14,1963,'CDP 7 46436 2'),(4,'Tango In The Night',12,1987,'W2-25471'),(5,'Future Shock',6,1983,'CK 38814'),(6,'Nevermind',12,1991,'DGCD 24425'),(7,'Stratagem',11,1994,'9 24580-2'),(8,'Black Tie White Noise',14,1993,'74785-50212-2'),(9,'Word Up!',7,1986,'830 265-2'),(10,'Chicago 19',10,1988,'25714-2'),(11,'Call Up, The/The Magnificent Dance',4,1981,'48-02036 '),(12,'Righteous',14,1994,'CK 57341'),(13,'Rio',9,1982,'CDP 546003'),(14,'Gratitude',17,1975,'CK 65737'),(15,'Sweet Dreams (Are Made Of This)',10,1983,'PCD14681'),(16,'Genesis',9,1983,'7 80116-2'),(17,'Kick',12,1987,'A2-81796'),(18,'Thriller',9,1982,'EK 38112'),(19,'Veering From The Wave',12,1998,'314 558 081-2'),(20,'Led Zeppelin IV',8,1971,'A2-19129'),(21,'Like A Virgin',9,1984,'9 25157-2'),(22,'Crush',10,1985,'CD 3336'),(23,'Riptide',9,1985,'A2-90471'),(24,'Works, The',12,1984,'HR-61233-2'),(25,'Document',11,1987,'IRSD-42059'),(26,'Diamond Life',9,1984,'RK 39581'),(27,'Abraxas',9,1974,'CK 30130'),(28,'Songs From The Big Chair',8,1985,'P2-24300'),(29,'Mental Floss For The Globe',13,1990,'ARCD-8640'),(30,'Van Halen II',10,1979,'3312-2'),(31,'Mosaic',8,1986,'9 24115'),(32,'Skylarking',14,1986,'9 24117-2'),(33,'Yellow Magic Orchestra',9,1979,'512445-2'),(34,'Shampoohorn',16,1994,'R2 71760'),(35,'10 Cent Wings',12,1997,'MCAD-11706'),(36,'Madonna',8,1983,'9 23867-2');
/*!40000 ALTER TABLE `albums` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `albums_tracks`
--

DROP TABLE IF EXISTS `albums_tracks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `albums_tracks` (
  `albums_tracks_id` int(11) NOT NULL AUTO_INCREMENT,
  `albums_id` int(7) NOT NULL,
  `tracks_id` int(11) NOT NULL,
  PRIMARY KEY (`albums_tracks_id`,`albums_id`,`tracks_id`),
  KEY `fk_albums_tracks_tracks1_idx` (`tracks_id`),
  KEY `fk_albums_tracks_albums1_idx` (`albums_id`),
  CONSTRAINT `fk_albums_tracks_albums1` FOREIGN KEY (`albums_id`) REFERENCES `albums` (`albums_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_albums_tracks_tracks1` FOREIGN KEY (`tracks_id`) REFERENCES `tracks` (`tracks_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1854 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `albums_tracks`
--

LOCK TABLES `albums_tracks` WRITE;
/*!40000 ALTER TABLE `albums_tracks` DISABLE KEYS */;
INSERT INTO `albums_tracks` VALUES (1477,1,1),(1478,1,2),(1479,1,3),(1480,1,4),(1481,1,5),(1482,1,6),(1483,1,7),(1484,1,8),(1485,1,9),(1486,1,10),(1487,2,11),(1488,2,12),(1489,2,13),(1490,2,14),(1491,2,15),(1492,2,16),(1493,2,17),(1494,2,18),(1495,2,19),(1496,2,20),(1497,3,21),(1498,3,22),(1499,3,23),(1500,3,24),(1501,3,25),(1502,3,26),(1503,3,27),(1504,3,28),(1505,3,29),(1506,3,30),(1507,3,31),(1508,3,32),(1509,3,33),(1510,3,34),(1511,4,35),(1512,4,36),(1513,4,37),(1514,4,38),(1515,4,39),(1516,4,40),(1517,4,41),(1518,4,42),(1519,4,43),(1520,4,44),(1521,4,45),(1522,4,46),(1523,5,47),(1524,5,48),(1525,5,49),(1526,5,50),(1527,5,51),(1528,5,52),(1529,6,53),(1530,6,54),(1531,6,55),(1532,6,56),(1533,6,57),(1534,6,58),(1535,6,59),(1536,6,60),(1537,6,61),(1538,6,62),(1539,6,63),(1540,6,64),(1541,7,65),(1542,7,66),(1543,7,67),(1544,7,68),(1545,7,69),(1546,7,70),(1547,7,71),(1548,7,72),(1549,7,73),(1550,7,74),(1551,7,75),(1552,8,76),(1553,8,77),(1554,8,78),(1555,8,79),(1556,8,80),(1557,8,81),(1558,8,82),(1559,8,83),(1560,8,84),(1561,8,85),(1562,8,86),(1563,8,87),(1564,8,88),(1565,8,89),(1566,9,90),(1567,9,91),(1568,9,92),(1569,9,93),(1570,9,94),(1571,9,95),(1572,9,96),(1573,10,97),(1574,10,98),(1575,10,99),(1576,10,100),(1577,10,101),(1578,10,102),(1579,10,103),(1580,10,104),(1581,10,105),(1582,10,106),(1583,11,107),(1584,11,108),(1585,11,109),(1586,11,110),(1587,12,111),(1588,12,112),(1589,12,113),(1590,12,114),(1591,12,115),(1592,12,116),(1593,12,117),(1594,12,118),(1595,12,119),(1596,12,120),(1597,12,121),(1598,12,122),(1599,12,123),(1600,12,124),(1601,13,125),(1602,13,126),(1603,13,127),(1604,13,128),(1605,13,129),(1606,13,130),(1607,13,131),(1608,13,132),(1609,13,133),(1610,14,134),(1611,14,135),(1612,14,136),(1613,14,137),(1614,14,138),(1615,14,139),(1616,14,140),(1617,14,141),(1618,14,142),(1619,14,143),(1620,14,144),(1621,14,145),(1622,14,146),(1623,14,147),(1624,14,148),(1625,14,149),(1626,14,150),(1627,15,151),(1628,15,152),(1629,15,153),(1630,15,154),(1631,15,155),(1632,15,156),(1633,15,157),(1634,15,158),(1635,15,159),(1636,15,160),(1637,16,161),(1638,16,162),(1639,16,163),(1640,16,164),(1641,16,165),(1642,16,166),(1643,16,167),(1644,16,168),(1645,16,169),(1646,17,170),(1647,17,171),(1648,17,172),(1649,17,173),(1650,17,174),(1651,17,175),(1652,17,176),(1653,17,177),(1654,17,178),(1655,17,179),(1656,17,180),(1657,17,181),(1658,18,182),(1659,18,183),(1660,18,184),(1661,18,185),(1662,18,186),(1663,18,187),(1664,18,188),(1665,18,189),(1666,18,190),(1667,19,191),(1668,19,192),(1669,19,193),(1670,19,194),(1671,19,195),(1672,19,196),(1673,19,197),(1674,19,198),(1675,19,199),(1676,19,200),(1677,19,201),(1678,19,202),(1679,20,203),(1680,20,204),(1681,20,205),(1682,20,206),(1683,20,207),(1684,20,208),(1685,20,209),(1686,20,210),(1687,21,211),(1688,21,212),(1689,21,213),(1690,21,214),(1691,21,215),(1692,21,216),(1693,21,217),(1694,21,218),(1695,21,219),(1696,22,220),(1697,22,221),(1698,22,222),(1699,22,223),(1700,22,224),(1701,22,225),(1702,22,226),(1703,22,227),(1704,22,228),(1705,22,229),(1706,23,230),(1707,23,231),(1708,23,232),(1709,23,233),(1710,23,234),(1711,23,235),(1712,23,236),(1713,23,237),(1714,23,238),(1715,24,239),(1716,24,240),(1717,24,241),(1718,24,242),(1719,24,243),(1720,24,244),(1721,24,245),(1722,24,246),(1723,24,247),(1724,24,248),(1725,24,249),(1726,24,250),(1727,25,251),(1728,25,252),(1729,25,253),(1730,25,254),(1731,25,255),(1732,25,256),(1733,25,257),(1734,25,259),(1744,26,259),(1735,25,260),(1736,25,261),(1737,26,262),(1738,26,263),(1739,26,264),(1740,26,265),(1741,26,266),(1742,26,267),(1743,26,268),(1745,26,270),(1746,27,271),(1747,27,272),(1748,27,273),(1749,27,274),(1750,27,275),(1751,27,276),(1752,27,277),(1753,27,278),(1754,27,279),(1755,28,280),(1756,28,281),(1757,28,282),(1758,28,283),(1759,28,284),(1760,28,285),(1761,28,286),(1762,28,287),(1763,29,288),(1764,29,289),(1765,29,290),(1766,29,291),(1767,29,292),(1768,29,293),(1769,29,294),(1770,29,295),(1771,29,295),(1772,29,296),(1773,29,297),(1774,29,298),(1775,29,299),(1776,29,300),(1777,30,301),(1778,30,302),(1779,30,303),(1780,30,304),(1781,30,305),(1782,30,306),(1783,30,307),(1784,30,308),(1785,30,309),(1786,30,310),(1787,31,311),(1788,31,312),(1789,31,313),(1790,31,314),(1791,31,316),(1792,31,316),(1793,31,317),(1794,31,318),(1795,32,319),(1796,32,320),(1797,32,321),(1798,32,322),(1799,32,323),(1800,32,324),(1801,32,325),(1802,32,326),(1803,32,327),(1804,32,328),(1805,32,329),(1806,32,330),(1807,32,331),(1808,32,332),(1809,33,333),(1810,33,334),(1811,33,335),(1812,33,336),(1813,33,337),(1814,33,338),(1815,33,339),(1816,33,340),(1817,33,341),(1818,34,342),(1819,34,343),(1820,34,344),(1821,34,345),(1822,34,346),(1823,34,347),(1824,34,348),(1825,34,349),(1826,34,350),(1827,34,351),(1828,34,352),(1829,34,353),(1830,34,354),(1831,34,355),(1832,34,356),(1833,34,357),(1834,35,358),(1835,35,359),(1836,35,360),(1837,35,361),(1838,35,362),(1839,35,363),(1840,35,364),(1841,35,365),(1842,35,366),(1843,35,367),(1844,35,368),(1845,35,369),(1846,36,370),(1847,36,371),(1848,36,372),(1849,36,373),(1850,36,374),(1851,36,375),(1852,36,376),(1853,36,377);
/*!40000 ALTER TABLE `albums_tracks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `artists`
--

DROP TABLE IF EXISTS `artists`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `artists` (
  `artist_id` int(7) NOT NULL AUTO_INCREMENT,
  `artist` varchar(255) NOT NULL COMMENT 'Name of the artist or band.',
  `country_of_origin` varchar(255) NOT NULL COMMENT 'Country in which the artist or band began their career and/or were born.\n',
  `city_of_origin` varchar(255) NOT NULL COMMENT 'City inside of the country in which the artist or band began their career and/or were born.',
  `form_year` year(4) NOT NULL COMMENT 'Year in which the band debut or got together or when artist debuted and or started their career.',
  `tot_albums` int(3) NOT NULL COMMENT 'Total count of albums recorded and released as noted by the Discogs database and Wikipedia, data between both sites is inconsistent.',
  `tot_singles_eps` int(3) DEFAULT NULL COMMENT 'Total count of singles and EPs recorded an released as noted by the Discogs database and Wikipedia, data between both sites is inconsistent.',
  `tot_compilations` varchar(255) DEFAULT NULL COMMENT 'Total count of compilation albums recorded and release as noted by the Discogs database and Wikipedia, data between both sites is inconsistent.',
  `fast_facts` varchar(255) DEFAULT NULL COMMENT 'Quick facts about the artist or band, as noted from Wikipedia and other sources.',
  PRIMARY KEY (`artist_id`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `artists`
--

LOCK TABLES `artists` WRITE;
/*!40000 ALTER TABLE `artists` DISABLE KEYS */;
INSERT INTO `artists` VALUES (1,'a-ha','Norway','Oslo',1982,14,72,'24','The band were listed in the Guinness World Records book for having the biggest rock concert attendance; they drew an audience of 198,000 at Maracanã Stadium during Rock in Rio festival. '),(2,'Beatles, The','England','Liverpool',1960,156,700,'336','The first band to start the British Invasion of America, starting with their first appearance on the Ed Sullvan Show on Feb. 9, 1964.'),(3,'Fleetwood Mac','England','London',1967,63,126,'104','Lindsay Buckingham and Stevie Nicks joined Fleetwood Mac in 1974. '),(4,'Hancock, Herbie','USA','Chicago, Ill',1952,88,76,'89','Considered a child prodigy, he played the first movement of Mozart\'s Piano Concerto No. 26 in D Major, K. 537 (Coronation) at a young people\'s concert on February 5, 1952, with the Chicago Symphony Orchestra.'),(5,'Nirvana','USA','Aberdeen, WA',1987,9,27,'18','In September 1990, Buzz Osborne of the Melvins introduced the band to Dave Grohl, who was looking for a new band following the sudden break-up of Washington, D.C., hardcore punks Scream.'),(6,'Big Head Todd And The Monsters','USA','Boulder, CO',1984,18,15,'1','The trio had attended Columbine High School together.  They toured extensively throughout the Mountain States and West Coast of the United States in their van dubbed \'The Colonel\', which was driven over 400,000 miles.'),(7,'Bowie, David','England','Brixton, London',1963,81,215,'116','He received a serious injury at school in 1962 when his friend George Underwood punched him in the left eye during a fight over a girl.'),(8,'Cameo','USA','New York, NY',1974,20,80,'20','Cameo was initially a 14-member group known as the New York City Players; this name was later changed to Cameo to avoid being confused with Ohio Players another funk group in the 1970s.'),(9,'Chicago','USA','Chicago, ILL',1967,38,151,'82','Their first record (April 1969), the eponymous Chicago Transit Authority, is a double album, which is rare for a band\'s first release.  After the release of their first album, the band\'s name was shortened to Chicago to avoid legal action.'),(10,'Clash, The','England','London',1976,15,55,'32','The Clash were an English rock band formed in London in 1976 as a key player in the original wave of British punk rock. They have also contributed to the post-punk and new wave movements that emerged in the wake of punk. '),(11,'Dag','USA','Raleigh, NC',1989,3,6,'2','Formed in 1989 and disbanded in 1999, due to change in musical preferemces.'),(12,'Duran Duran','England','Birmingham',1978,33,98,'42','The group were a leading band in the MTV-driven \"Second British Invasion\" or British RE-Invasion of the US in the 1980\'s. In 1984, the band were early innovators with video technology in their live stadium shows.'),(13,'Earth Wind And Fire','USA','Chicago, Ill',1969,30,177,'130','The band was founded in Chicago by Maurice White in 1970, having grown out of a previous band known as the Salty Peppers.  The band is known for the dynamic sound of their horn section.'),(14,'Eurythmics','England','London',1980,19,62,'15','Lennox and Stewart met in 1975 in a restaurant in London, where Lennox worked at that time. They first played together in 1976 in the punk rock band The Catch. After releasing one single as The Catch in 1977, the band evolved into The Tourists.'),(15,'Genesis','England','Godalming, Surrey',1967,81,107,'56','Phil Collins joined Genesis in 1971 at age 15.  Peter Gabriel left the band in 1974.  They placed an anonymous advertisement in Melody Maker  to replace Gabriel for \"a singer for a Genesis-type group\" which received around 400 replies.'),(16,'INXS','Australis','Sydney, New South Wales',1977,19,109,'38','INXS were an Australian rock band, formed as The Farriss Brothers in 1977 in Sydney, New South Wales.  Michael Hutchence was found dead in his hotel suite in Sydney in November 1997; he had hung himself.'),(17,'Jackson, Michael','USA','Gary, IN',1964,18,234,'178','Dubbed the \"King of Pop\".  The eighth child of the Jackson family, Michael made his professional debut in 1964 with his elder brothers Jackie, Tito, Jermaine, and Marlon as a member of the Jackson 5. He began his solo career in 1971 while at Motown.'),(18,'Kimball, Jennifer','USA','Boston, MA',1989,3,NULL,NULL,'Jennifer Kimball is a singer and songwriter who formed the folk duo The Story with Jonatha Brooke.'),(19,'Brooke, Jonatha','USA','Cambridge, MA',1989,10,11,NULL,'Jonatha Brooke and fellow Bostonian Jennifer Kimball began playing music together in the 1980s after having met at Amherst College. '),(20,'Led Zeppelin','England','London',1968,48,95,'33','The band\'s heavy, guitar-driven sound has led them to be cited as one of the progenitors of heavy metal. Their style drew from a wide variety of influences, including blues, psychedelia, and folk music.'),(21,'Madonna','USA','Bay City, MI',1979,24,208,'80','In 1978, she dropped out of college and relocated to New York City, she began taking classes at the Alvin Ailey American Dance Theater and eventually performing with Pear Lang Dance Theatre.'),(22,'Orchestral Manœuvres In The Dark','England','Wirral, Merseyside',1978,22,74,'13','Spawned by earlier group The Id, the outfit is composed of co-founders Andy McCluskey (vocals, bass guitar) and Paul Humphreys (keyboards, vocals), along with Martin Cooper (various instruments) and Stuart Kershaw (drums).'),(23,'Palmer, Robert','England','Batley, Yorkshire',1964,26,76,'44','Influenced as a child by blues, soul and jazz music on American Forces Radio, Robert Palmer joined his first band, The Mandrakes, at the age of 15 while still at Scarborough Boys\' High School.'),(24,'Queen','England','London',1970,55,147,'100','Before forming Queen, Brian May and Roger Taylor had played together in Smile. Mercury, then known by his birth name, Farrokh \"Freddie\" Bulsara, was a fan of Smile and encouraged them to experiment with more elaborate stage and recording techniques.'),(25,'R.E.M.','USA','Athens, GA',1980,30,132,'40','R.E.M is known as one of the first alternative rock bands.   After considering names like \"Twisted Kites\", \"Cans of Piss\", and \"Negro Wives\", the band settled on \"R.E.M.\" (which is an acronym for rapid eye movement, the dream stage of sleep).'),(26,'Sade','England','London',1982,10,36,'13','Sade are an English band, formed in London.   Sade Adu is the lead singer of the eponymous band. '),(27,'Santana','USA','San Francisco, CA',1966,41,192,'294','The band came to public attention with their performance of \"Soul Sacrifice\" at Woodstock in 1969. This exposure helped propel their first album, also named Santana, into a hit, followed in the next two years by Abraxas and Santana III.'),(28,'Tears For Fears','England','Bath',1981,19,59,'39','Tears for Fears was founded after the dissolution of their first band, the mod-influenced Graduate, they were initially associated with the new wave synthesiser bands of the early 1980s but later branched out into mainstream rock and pop.'),(29,'Urban Dance Squad','Netherlands','Utrecht',1986,8,15,'2','Urban Dance Squad was a Dutch rap rock band formed after what was originally intended as a one-time jam-session at a festival in Utrecht on December 20, 1986.'),(30,'Van Halen','USA','Pasadena, CA',1974,17,69,'14','Young Edward first began studying classical piano, and became quite proficient (although he never fully mastered the art of reading sheet music). Eventually the brothers started playing music together in the 1960s—Eddie on drums and Alex on guitar. '),(31,'Wang Chung','England','London',1980,10,34,'2','The first incarnation of the band was called Huang Chung.  At the beginning of Huang Chung\'s career, all the members performed under pseudonyms.'),(32,'XTC','England','Swindon, Wiltshire',1972,23,53,'19','The band\'s name and line-up changed frequently, and it was not until 1975 that they were known as XTC.  XTC\'s best-known album, Skylarking, is generally regarded as their finest.  They aspired to be \"completely original\".'),(33,'Yellow Magic Orchestra','Japan','Tokyo',1978,32,46,'33','They were pioneers in their use of synthesizers, samplers, sequencers, drum machines, computers, and digital recording technology in popular music, and effectively anticipated the \"electropop boom\" of the 1980s.'),(34,'Z','USA','Los Angeles, CA',1993,2,2,NULL,'A band comprised of the 2 sons of Frank Zappa, Ahmet and Dweezil Zappa. ');
/*!40000 ALTER TABLE `artists` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `artists_albums`
--

DROP TABLE IF EXISTS `artists_albums`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `artists_albums` (
  `artist_album_id` int(11) NOT NULL AUTO_INCREMENT,
  `artist_id` int(7) NOT NULL,
  `albums_id` int(7) NOT NULL,
  `riaa_certification_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`artist_album_id`,`artist_id`,`albums_id`,`riaa_certification_id`),
  KEY `fk_artist_id_idx` (`artist_id`),
  KEY `fk_albums_id_idx` (`albums_id`),
  KEY `fk_artists_albums_riaa_certification1_idx` (`riaa_certification_id`),
  CONSTRAINT `fk_albums_id` FOREIGN KEY (`albums_id`) REFERENCES `albums` (`albums_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_artists_albums_riaa_certification1` FOREIGN KEY (`riaa_certification_id`) REFERENCES `riaa_certification` (`riaa_certification_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_artists_id` FOREIGN KEY (`artist_id`) REFERENCES `artists` (`artist_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `artists_albums`
--

LOCK TABLES `artists_albums` WRITE;
/*!40000 ALTER TABLE `artists_albums` DISABLE KEYS */;
INSERT INTO `artists_albums` VALUES (1,1,1,2),(2,1,2,0),(3,2,3,1),(4,3,4,4),(5,4,5,2),(6,5,6,11),(7,6,7,0),(8,7,8,0),(9,8,9,2),(10,9,10,2),(11,10,11,0),(12,11,12,0),(13,12,13,3),(14,13,14,3),(15,14,15,1),(16,15,16,5),(18,16,17,7),(19,17,18,34),(20,18,19,0),(21,19,35,0),(22,20,20,24),(23,21,21,11),(42,21,36,6),(24,22,22,0),(25,23,23,3),(26,24,24,1),(27,25,25,2),(28,26,26,5),(29,27,27,6),(30,28,28,6),(31,29,29,0),(32,30,30,6),(33,31,31,1),(34,32,32,0),(35,33,33,0),(37,34,34,0);
/*!40000 ALTER TABLE `artists_albums` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `artists_labels`
--

DROP TABLE IF EXISTS `artists_labels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `artists_labels` (
  `artists_labels_id` int(11) NOT NULL AUTO_INCREMENT,
  `labels_id` int(11) NOT NULL,
  `artist_id` int(7) NOT NULL,
  PRIMARY KEY (`artists_labels_id`,`labels_id`,`artist_id`),
  KEY `fk_artists_labels_labels1_idx` (`labels_id`),
  KEY `fk_artists_labels_artists1_idx` (`artist_id`),
  CONSTRAINT `fk_artists_labels_artists1` FOREIGN KEY (`artist_id`) REFERENCES `artists` (`artist_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_artists_labels_labels1` FOREIGN KEY (`labels_id`) REFERENCES `labels` (`labels_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=231 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `artists_labels`
--

LOCK TABLES `artists_labels` WRITE;
/*!40000 ALTER TABLE `artists_labels` DISABLE KEYS */;
INSERT INTO `artists_labels` VALUES (186,1,2),(185,2,1),(189,2,3),(225,2,30),(187,3,2),(188,4,2),(193,5,6),(194,6,7),(195,7,7),(196,8,8),(197,9,8),(221,9,28),(198,10,9),(199,11,10),(206,11,17),(229,11,33),(190,12,4),(200,12,11),(202,12,13),(201,13,12),(203,14,14),(204,15,15),(205,15,16),(212,15,20),(207,16,18),(211,17,20),(213,18,21),(191,19,5),(192,20,5),(226,20,31),(227,20,32),(214,21,22),(215,22,23),(216,23,24),(217,24,24),(218,25,25),(219,26,26),(220,27,27),(222,28,28),(223,29,28),(224,30,29),(228,31,33),(230,32,34),(208,33,19),(209,34,19);
/*!40000 ALTER TABLE `artists_labels` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `distribution`
--

DROP TABLE IF EXISTS `distribution`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `distribution` (
  `distributor_id` int(11) NOT NULL AUTO_INCREMENT,
  `distributor` varchar(255) DEFAULT NULL COMMENT 'holds the name of the distribution company that distributes and album from a record label to the public.',
  PRIMARY KEY (`distributor_id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `distribution`
--

LOCK TABLES `distribution` WRITE;
/*!40000 ALTER TABLE `distribution` DISABLE KEYS */;
INSERT INTO `distribution` VALUES (1,'WEA'),(2,'CAPITOL'),(3,'BMG'),(4,'PGD'),(5,'CBS'),(6,'SMD'),(7,'SME'),(8,'RCA'),(9,'IMAGINARY ROAD'),(10,'UNI DISTIRBUTION'),(11,'A&M'),(12,'MCA'),(13,'RHINO'),(14,'UNIVERSAL MUSIC & VIDEO DISTRIBUTION');
/*!40000 ALTER TABLE `distribution` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `genre_styles`
--

DROP TABLE IF EXISTS `genre_styles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `genre_styles` (
  `genre_styles_id` int(11) NOT NULL AUTO_INCREMENT,
  `styles_id` int(11) NOT NULL,
  `genres_id` int(11) NOT NULL,
  PRIMARY KEY (`genre_styles_id`,`styles_id`,`genres_id`),
  KEY `fk_genre_styles_styles1_idx` (`styles_id`),
  KEY `fk_genre_styles_genres1_idx` (`genres_id`),
  CONSTRAINT `fk_genres_genres_id` FOREIGN KEY (`genres_id`) REFERENCES `genres` (`genres_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_styles_id` FOREIGN KEY (`styles_id`) REFERENCES `styles` (`styles_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=312 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `genre_styles`
--

LOCK TABLES `genre_styles` WRITE;
/*!40000 ALTER TABLE `genre_styles` DISABLE KEYS */;
INSERT INTO `genre_styles` VALUES (1,1,3),(2,2,3),(3,3,3),(4,4,3),(5,5,3),(6,5,4),(7,6,4),(8,7,4),(9,8,4),(10,9,4),(11,10,4),(12,11,4),(13,12,4),(14,13,4),(15,14,4),(16,15,4),(17,16,4),(18,17,4),(19,18,4),(20,19,4),(21,20,4),(22,21,4),(23,22,4),(24,23,4),(25,24,4),(26,25,4),(27,26,4),(28,27,4),(29,28,4),(30,29,4),(31,30,4),(32,31,4),(33,32,9),(34,33,9),(35,34,9),(36,35,9),(37,36,9),(38,37,9),(39,38,9),(40,39,9),(41,40,9),(42,41,9),(43,42,9),(44,43,9),(45,44,9),(46,45,9),(47,46,9),(48,47,9),(49,48,9),(50,49,9),(51,50,9),(52,51,9),(53,52,9),(54,53,9),(55,54,9),(56,55,9),(57,56,9),(58,57,9),(59,58,9),(60,59,9),(61,60,9),(62,61,10),(63,62,10),(64,63,10),(65,64,10),(66,65,10),(67,66,10),(68,67,10),(69,68,10),(70,69,11),(71,70,11),(72,71,11),(73,72,11),(74,73,11),(75,74,11),(76,75,11),(77,76,11),(78,77,11),(79,78,11),(80,79,11),(81,80,11),(82,81,11),(83,82,11),(84,83,11),(85,84,11),(86,85,11),(87,86,11),(88,87,11),(89,88,11),(90,89,11),(91,90,11),(92,91,12),(93,92,12),(94,93,12),(95,94,12),(96,95,12),(97,96,12),(98,97,12),(99,98,12),(100,99,12),(101,100,12),(102,101,12),(103,102,12),(104,103,12),(105,104,12),(106,105,12),(107,106,12),(108,107,12),(109,108,12),(110,109,12),(111,110,12),(112,111,13),(113,112,13),(114,113,13),(115,114,13),(116,115,13),(117,116,13),(118,117,13),(119,118,13),(120,119,13),(121,120,13),(122,121,13),(123,122,13),(125,124,13),(126,125,13),(127,126,13),(128,127,13),(129,128,13),(130,129,13),(131,130,13),(132,131,13),(133,132,13),(134,133,13),(135,134,13),(136,135,13),(137,136,13),(138,137,13),(139,138,13),(140,139,13),(141,140,13),(142,141,13),(143,142,13),(144,143,13),(145,144,13),(146,145,13),(147,146,13),(148,147,13),(149,148,13),(150,149,13),(151,150,13),(152,151,13),(153,152,13),(154,153,13),(155,154,14),(156,155,14),(157,156,14),(158,157,14),(159,158,14),(160,159,14),(161,160,14),(162,161,14),(163,162,14),(164,163,14),(165,164,14),(166,165,14),(167,166,14),(168,167,14),(169,168,14),(170,169,14),(171,170,14),(172,171,14),(173,172,14),(174,173,14),(175,174,14),(176,175,14),(177,176,14),(178,177,14),(179,178,14),(180,179,14),(181,180,14),(182,181,14),(183,182,14),(184,183,14),(185,184,14),(186,185,14),(187,186,14),(188,187,14),(189,188,14),(190,189,14),(191,190,14),(192,191,14),(193,192,14),(194,193,14),(195,194,14),(196,195,14),(197,196,14),(198,197,14),(199,198,14),(200,199,14),(201,200,14),(202,201,14),(203,202,14),(204,203,15),(205,204,15),(206,205,15),(207,206,15),(208,207,15),(209,208,15),(210,209,15),(211,210,15),(212,211,16),(213,212,16),(214,213,16),(215,214,16),(216,215,16),(217,216,16),(218,217,16),(219,218,16),(220,219,16),(221,220,16),(222,221,16),(223,222,16),(224,223,16),(225,224,16),(226,225,16),(227,226,16),(228,227,16),(229,228,16),(230,229,16),(231,230,16),(232,231,16),(233,232,16),(234,233,16),(235,234,16),(236,235,16),(237,236,16),(238,237,16),(239,238,16),(240,239,16),(241,240,16),(242,241,16),(243,242,16),(244,243,16),(245,244,16),(246,245,16),(247,246,16),(248,247,16),(249,248,16),(250,249,16),(251,250,16),(252,251,16),(253,252,16),(254,253,16),(255,254,16),(256,255,16),(257,256,17),(258,257,17),(259,258,17),(260,259,17),(261,260,17),(262,261,17),(263,262,18),(264,263,18),(265,264,18),(266,265,18),(267,266,18),(268,267,18),(269,268,18),(270,269,18),(271,270,18),(272,271,18),(273,272,18),(274,273,18),(275,274,18),(276,275,18),(277,276,18),(278,277,18),(279,278,18),(280,279,18),(281,280,18),(282,281,18),(283,282,6),(284,283,6),(285,284,6),(286,285,6),(287,286,6),(288,287,6),(289,288,6),(290,289,6),(291,290,6),(292,291,6),(293,292,6),(294,293,6),(295,294,6),(296,295,6),(297,296,6),(298,297,6),(299,298,6),(300,299,6),(301,300,6),(302,301,6),(303,302,6),(304,303,6),(305,304,6),(306,305,6),(307,306,6),(311,307,18);
/*!40000 ALTER TABLE `genre_styles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `genres`
--

DROP TABLE IF EXISTS `genres`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `genres` (
  `genres_id` int(11) NOT NULL AUTO_INCREMENT,
  `genre` varchar(255) NOT NULL COMMENT 'A list of all music genres.  There are only a few, and many styles which are not listed.  \n',
  PRIMARY KEY (`genres_id`),
  UNIQUE KEY `genre_UNIQUE` (`genre`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `genres`
--

LOCK TABLES `genres` WRITE;
/*!40000 ALTER TABLE `genres` DISABLE KEYS */;
INSERT INTO `genres` VALUES (1,'African'),(2,'Asian'),(3,'Avante-garde'),(4,'Blues'),(5,'Brass & Military'),(6,'Caribbean/Caribbean-Influenced'),(7,'Children’s'),(8,'Comedy'),(9,'Country'),(10,'Easy listening'),(11,'Electronic'),(12,'Folk'),(13,'Hip hop'),(14,'Jazz		'),(15,'Latin'),(16,'Pop'),(17,'R&B'),(18,'Rock'),(19,'Soca'),(20,'Soul'),(21,'Stage & Screen');
/*!40000 ALTER TABLE `genres` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `labels`
--

DROP TABLE IF EXISTS `labels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `labels` (
  `labels_id` int(11) NOT NULL AUTO_INCREMENT,
  `label` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`labels_id`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `labels`
--

LOCK TABLES `labels` WRITE;
/*!40000 ALTER TABLE `labels` DISABLE KEYS */;
INSERT INTO `labels` VALUES (1,'APPLE'),(2,'WARNER BROS.'),(3,'EMI'),(4,'PARLOPHONE'),(5,'GIANT'),(6,'SAVAGE RECORDS'),(7,'ISO'),(8,'ATLANTA ARTISTS'),(9,'MERCURY'),(10,'REPRISE'),(11,'EPIC'),(12,'COLUMBIA'),(13,'CAPITOL RECORDS'),(14,'RCA RECORDS'),(15,'ATLANTIC'),(16,'IMAGINARY ROAD'),(17,'SWAN SONG'),(18,'SIRE'),(19,'SUB POP'),(20,'GEFFEN'),(21,'VIRGIN'),(22,'ISLAND RECORDS'),(23,'HOLLYWOOD RECORDS'),(24,'ELEKTRA'),(25,'I.R.S RECORDS'),(26,'PORTRAIT'),(27,'CBS RECORDS'),(28,'POLYGRAM'),(29,'PHONOGRAM'),(30,'ARISTA RECORDS'),(31,'ALFA MUSIC'),(32,'BARKING PUMPKIN RECORDS'),(33,'MCA'),(34,'REFUGE'),(35,'UNIVERSAL');
/*!40000 ALTER TABLE `labels` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `labels_albums`
--

DROP TABLE IF EXISTS `labels_albums`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `labels_albums` (
  `labels_albums_id` int(11) NOT NULL,
  `labels_id` int(11) NOT NULL,
  `albums_id` int(7) NOT NULL,
  `distributor_id` int(11) NOT NULL,
  PRIMARY KEY (`labels_albums_id`,`labels_id`,`albums_id`,`distributor_id`),
  KEY `fk_labels_albums_labels1_idx` (`labels_id`),
  KEY `fk_labels_albums_distribution1_idx` (`distributor_id`),
  KEY `fk_labels_albums_albums1_idx` (`albums_id`),
  CONSTRAINT `fk_labels_albums_albums1` FOREIGN KEY (`albums_id`) REFERENCES `albums` (`albums_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_labels_albums_distribution1` FOREIGN KEY (`distributor_id`) REFERENCES `distribution` (`distributor_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_labels_albums_labels1` FOREIGN KEY (`labels_id`) REFERENCES `labels` (`labels_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `labels_albums`
--

LOCK TABLES `labels_albums` WRITE;
/*!40000 ALTER TABLE `labels_albums` DISABLE KEYS */;
INSERT INTO `labels_albums` VALUES (1,1,3,2),(2,2,1,1),(3,2,2,1),(4,2,4,1),(5,2,30,1),(6,3,3,2),(7,4,3,2),(8,5,7,1),(9,6,8,3),(10,7,8,3),(11,8,9,4),(12,9,9,4),(13,9,28,4),(14,10,10,1),(15,11,11,5),(16,11,18,5),(17,11,33,7),(18,12,5,5),(19,12,12,6),(20,12,14,7),(21,13,13,2),(22,14,15,8),(23,15,16,1),(24,15,17,1),(25,15,20,1),(26,16,19,9),(27,17,20,1),(28,18,21,1),(48,18,36,1),(29,19,6,10),(30,20,6,10),(31,20,31,1),(32,20,32,1),(33,21,22,11),(34,22,23,1),(35,23,24,1),(36,24,24,1),(37,25,25,12),(38,26,26,5),(39,27,27,5),(40,28,28,4),(41,29,28,4),(42,30,29,3),(43,31,33,7),(44,32,34,13),(45,33,35,14),(46,34,35,14),(47,35,35,14);
/*!40000 ALTER TABLE `labels_albums` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `riaa_certification`
--

DROP TABLE IF EXISTS `riaa_certification`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `riaa_certification` (
  `riaa_certification_id` int(11) NOT NULL AUTO_INCREMENT,
  `riaa_cert` varchar(255) NOT NULL,
  `num_sold` int(15) NOT NULL,
  PRIMARY KEY (`riaa_certification_id`)
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `riaa_certification`
--

LOCK TABLES `riaa_certification` WRITE;
/*!40000 ALTER TABLE `riaa_certification` DISABLE KEYS */;
INSERT INTO `riaa_certification` VALUES (1,'Gold',500000),(2,'Platinum',1000000),(3,'2x Multi-Platinum',2000000),(4,'3x Multi-Platinum',3000000),(5,'4x Multi-Platinum',4000000),(6,'5x Multi-Platinum',5000000),(7,'6x Multi-Platinum',6000000),(8,'7x Multi-Platinum',7000000),(9,'8x Multi-Platinum',8000000),(10,'9x Multi-Platinum',9000000),(11,'10x Multi-Platinum',10000000),(12,'11x Multi-Platinum',11000000),(13,'12x Multi-Platinum',12000000),(14,'13x Multi-Platinum',13000000),(15,'14x Multi-Platinum',14000000),(16,'15x Multi-Platinum',15000000),(17,'16x Multi-Platinum',16000000),(18,'17x Multi-Platinum',17000000),(19,'18x Multi-Platinum',18000000),(20,'19x Multi-Platinum',19000000),(21,'20x Multi-Platinum',20000000),(22,'21x Multi-Platinum',21000000),(23,'22x Multi-Platinum',22000000),(24,'23x Multi-Platinum',23000000),(25,'24x Multi-Platinum',24000000),(26,'25x Multi-Platinum',25000000),(27,'26x Multi-Platinum',26000000),(28,'27x Multi-Platinum',27000000),(29,'28x Multi-Platinum',28000000),(30,'29x Multi-Platinum',29000000),(31,'30x Multi-Platinum',30000000),(32,'31x Multi-Platinum',31000000),(33,'32x Multi-Platinum',32000000),(34,'33x Multi-Platinum',33000000),(35,'34x Multi-Platinum',34000000),(36,'35x Multi-Platinum',35000000),(37,'36x Multi-Platinum',36000000),(38,'37x Multi-Platinum',37000000),(39,'38x Multi-Platinum',38000000),(40,'39x Multi-Platinum',39000000),(41,'40x Multi-Platinum',40000000),(42,'41x Multi-Platinum',41000000),(43,'42x Multi-Platinum',42000000),(44,'43x Multi-Platinum',43000000),(45,'44x Multi-Platinum',44000000),(46,'45x Multi-Platinum',45000000);
/*!40000 ALTER TABLE `riaa_certification` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `styles`
--

DROP TABLE IF EXISTS `styles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `styles` (
  `styles_id` int(11) NOT NULL AUTO_INCREMENT,
  `style` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`styles_id`)
) ENGINE=InnoDB AUTO_INCREMENT=310 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `styles`
--

LOCK TABLES `styles` WRITE;
/*!40000 ALTER TABLE `styles` DISABLE KEYS */;
INSERT INTO `styles` VALUES (1,'Experimental '),(2,'Noise\n'),(3,'Lo-Fi'),(4,'Musique concrète\n'),(5,'Electroacoustic\n'),(6,'African Blues '),(7,'Blues Rock '),(8,'Blues Shouter '),(9,'British Blues '),(10,'Canadian Blues '),(11,'Chicago Blues'),(12,'Classic Female Blues '),(13,'Contemporary R&B\n'),(14,'Country Blues '),(15,'Delta Blues'),(16,'Detroit Blues '),(17,'Electric Blues '),(18,'Gospel Blues '),(19,'Hill Country Blues'),(20,'Hokum Blues '),(21,'Jump Blues '),(22,'Kansas City Blues '),(23,'Louisiana Blues '),(24,'Memphis Blues '),(25,'Piedmont Blues '),(26,'Punk Blues'),(27,'Soul Blues '),(28,'St. Louis Blues '),(29,'Swamp Blues '),(30,'Texas Blues '),(31,'West Coast Blues'),(32,'Alternative Country '),(33,'Blues Country '),(34,'Outlaw Country'),(35,'Progressive Country'),(36,'Zydeco'),(37,'Country Rap'),(38,'Red Dirt'),(39,'Rockabilly'),(40,'Country Rock '),(41,'Texas Country'),(42,'Americana'),(43,'Australian Country'),(44,'Bakersfield Sound '),(45,'Bluegrass'),(46,'Cajun'),(47,'Christian Country'),(48,'Classic Country'),(49,'Close Harmony'),(50,'Dansband Music'),(51,'Franco-Country'),(52,'Honky Tonk '),(53,'Instrumental Country'),(54,'Nashville Sound'),(55,'Neotraditional Country '),(56,'Country Pop'),(57,'Sertanejo'),(58,'Traditional Country'),(59,'Truck-Driving Country'),(60,'Western Swing'),(61,'Backgorund Music'),(62,'Beautiful Music'),(63,'Elevator Music '),(64,'Furniture Music '),(65,'Lounge Music '),(66,'MOR'),(67,'New-Age Music'),(68,'Ambient'),(69,'Asian Underground\n'),(70,'Breakbeat\n'),(71,'Disco'),(72,'Downtempo'),(73,'Drum & Bass'),(74,'Dub'),(75,'Electro'),(76,'Electronic Rock '),(77,'Electronica'),(78,'Hardcore'),(79,'Hardstyle'),(80,'Hi-NRG'),(81,'House'),(82,'Industrial '),(83,'IDM'),(84,'Jungle'),(85,'Post-Disco'),(86,'Techno'),(87,'Trance'),(88,'UK Garage'),(89,'Vapourwave'),(90,'Videogame Music'),(91,'American Folk Revival '),(92,'Anti-Folk'),(93,'British Folk Revival '),(94,'Celtic'),(95,'Chalga'),(96,'Contemprary Folk '),(97,'Filk'),(98,'Folk Rock '),(99,'Folktronica\n'),(100,'Freak Folk '),(101,'Indie Folk '),(102,'Industrial Folk'),(103,'Neo-Folk '),(104,'Progressive Folk '),(105,'Protest Song'),(106,'Psychedelic Folk'),(107,'Singer-Songwriter Movement '),(108,'Skiffle'),(109,'Sung Poetry'),(110,'Cowboy/Western '),(111,'Alternative Hip Hop '),(112,'Australian Hip Hop'),(113,'Bongo Flava'),(114,'Boom Bap'),(115,'British Hip Hop'),(116,'Chap Hop'),(117,'Christian Hip Hop '),(118,'Cloud Rap'),(119,'Conscious Hip Hop'),(120,'Crunk'),(121,'Crunkcore'),(122,'Drill'),(124,'Emo hip Hop'),(125,'Experimental Hip Hop'),(126,'G-Funk'),(127,'Ghetto House'),(128,'Ghettotech'),(129,'Golden Age Hip Hop'),(130,'Grime '),(131,'Hardcore Hip Hop'),(132,'Hip House'),(133,'Hyphy'),(134,'Industrial Hip Hop'),(135,'Instrumental Hip Hop'),(136,'Jazz Rap '),(137,'Jersey Club '),(138,'Kwaito'),(139,'Lyrical Hip Hop '),(140,'Low Bap'),(141,'Merenrap'),(142,'Motswako\n'),(143,'Mumble Rap '),(144,'Nerdcore'),(145,'New Jack Swing '),(146,'New School Hip Hop'),(147,'Old School Hip Hop'),(148,'Political Hip Hop'),(149,'Ragga'),(150,'Raggaeton'),(151,'Snap'),(152,'Trap'),(153,'Urban Pasifika'),(154,'Acid Jazz'),(155,'Afro-Cuban Jazz'),(156,'Asian-American Jazz'),(157,'Avante-Garde Jazz'),(158,'Bebop'),(159,'Boogie-Woogie'),(160,'Bossa Nova'),(161,'British Dance Band '),(162,'Cape Jazz'),(163,'Continental Jazz'),(164,'Cool Jazz'),(165,'Corssover Jazz'),(166,'Dixieland'),(167,'Ethno Jazz'),(168,'European Free Jazz'),(169,'Free Funk'),(170,'Free Improvisation'),(171,'Free Jazz'),(172,'Gypsy Jazz'),(173,'Hard Bop'),(174,'Jazz Blues'),(175,'Jazz-Funk'),(176,'Fusion'),(177,'Jazz Rap'),(178,'Jazz Rock '),(179,'Kansas City Jazz'),(180,'Latin Jazz'),(181,'Livetronica'),(182,'M-Base'),(183,'Mainstream Jazz'),(184,'Modal Jazz'),(185,'Neo-Bop Jazz'),(186,'Neo-Swing'),(187,'Novelty Ragtime'),(188,'Nu-Jazz'),(189,'Orchestral Jazz'),(190,'Post-Bop'),(191,'Punk Jazz '),(192,'Ragtime'),(193,'Shibuya-Kei '),(194,'Ska Jazz'),(195,'Smooth Jazz'),(196,'Soul Jazz'),(197,'Stride Jazz'),(198,'Straight-Ahead Jazz'),(199,'Swing '),(200,'Third Stream'),(201,'Vocal Jazz'),(202,'West Coast jazz'),(203,'Brazilian'),(204,'Latin Christian\n'),(205,'Latin Pop'),(206,'Latin Swing '),(207,'Latin Rock'),(208,'Regional Mexican\n'),(209,'Traditional; Latin Music'),(210,'Tropical'),(211,'Adult Contemporary '),(212,'Arab Pop'),(213,'Baroque Pop '),(214,'Brill Building\n'),(215,'Britpop\n'),(216,'Bubblegum Pop'),(217,'Canción\n'),(218,'Canzone'),(219,'Chanson'),(220,'Christian Pop'),(221,'Classical Crossover'),(222,'C-Pop'),(223,'Dance-Pop'),(224,'Disco Polo'),(225,'Euro-Pop'),(226,'Fado'),(227,'Folk Pop'),(228,'Iranian Pop '),(229,'Indie Pop '),(230,'J-Pop'),(231,'Jangle Pop'),(232,'K-Pop'),(233,'Latin Ballard'),(234,'Louisiana Swing'),(235,'Mexican Pop'),(236,'New Romantic Pop'),(237,'Operatic Pop'),(238,'Pop Rap'),(239,'Pop Rock'),(240,'Pop Soul '),(241,'Progressive Pop'),(242,'Psychedelic Pop '),(243,'Rebetiko\n'),(244,'Schlager'),(245,'Sophisti-Pop '),(246,'Space-Age Pop'),(247,'Sunshine Pop'),(248,'Surf Pop'),(249,'Synth-Pop'),(250,'Teen Pop'),(251,'Traditional Pop'),(252,'Turkish Pop'),(253,'Vispop'),(254,'Wonky Pop'),(255,'Worldbeat'),(256,'Contemporary R&B'),(257,'Disco'),(258,'Funk '),(259,'Freestyle'),(260,'Hip Hop Soul '),(261,'Alternative R&B'),(262,'Alternative Rock '),(263,'Beat Music '),(264,'Christian Rock '),(265,'Dark Cabaret '),(266,'Experimental Rock '),(267,'Garage Rock '),(268,'Glam Rock '),(269,'Hard Rock '),(270,'Heavy Metal '),(271,'New Wave'),(272,'Paisley Underground'),(273,'Desert Rock'),(274,'Progressive Rock'),(275,'Psychedelic Rock'),(276,'Punk Rock'),(277,'Rap Rock '),(278,'Southern Rock'),(279,'Stoner Rock '),(280,'Sufi Rock'),(281,'Visual Kei'),(282,'Baithak Gana\n'),(283,'Dancehall'),(284,'Bouyon\n'),(285,'Cadence-lypso\n'),(286,'Calypso\n'),(287,'Cha-cha-chá\n'),(288,'Chutney'),(289,'Compas\n'),(290,'Mambo'),(291,'Merengue'),(292,'Méringue'),(293,'Mozambique'),(294,'Pichakaree\n'),(295,'Punta\n'),(296,'Punta Rock'),(297,'Rasin\n'),(298,'Reggae\n'),(299,'Rocksteady\n'),(300,'Rumba\n'),(301,'Ska'),(302,'Salsa'),(303,'Son Cubano'),(304,'Timba'),(305,'Twoubadou'),(306,'Zouk'),(307,'AOR'),(308,'Classic Rock'),(309,'Rap');
/*!40000 ALTER TABLE `styles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tracks`
--

DROP TABLE IF EXISTS `tracks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tracks` (
  `tracks_id` int(11) NOT NULL AUTO_INCREMENT,
  `number` int(2) NOT NULL,
  `title_of_track` varchar(255) NOT NULL,
  `composer` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`tracks_id`)
) ENGINE=InnoDB AUTO_INCREMENT=378 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tracks`
--

LOCK TABLES `tracks` WRITE;
/*!40000 ALTER TABLE `tracks` DISABLE KEYS */;
INSERT INTO `tracks` VALUES (1,1,'Take On Me','Waaktaar/Furuholmen/Harke'),(2,2,'Train Of Thought','Waaktaar'),(3,3,'Hunting High And Low','Waaktaar'),(4,4,'The Blue Sky','Waaktaar'),(5,5,'Living A Boy\'s Adventure Tale','Waaktaar/Harke'),(6,6,'The Sun Always Shines On T.V.','Waaktaar'),(7,7,'And You Tell Me','Waaktaar'),(8,8,'Love Is Reason','Waaktaar/Furuholmen'),(9,9,'I Dream Myself Alive','Waaktaar/Furuholmen'),(10,10,'Here I Stand And Face The Rain','Waaktaar'),(11,1,'Scoundrel Days','Furuholmen/Waaktaar'),(12,2,'The Swing Of Things','Waaktaar'),(13,3,'I\'ve Been Losing You','Waaktaar'),(14,4,'October','Waaktaar'),(15,5,'Manhattan Skyline','Furuholmen/Waaktaar'),(16,6,'Cry Wolf','Furuholmen/Waaktaar'),(17,7,'We\'re Looking For The Whales','Furuholmen/Waaktaar'),(18,8,'The Weight Of The Wind','Waaktaar'),(19,9,'Maybe, Maybe','Furuholmen'),(20,10,'Soft Rains Of April','Furuholmen/Waaktaar'),(21,1,'It Won\'t Be Long','Lennon/McCartney'),(22,2,'All I\'ve Got To Do','Lennon/McCartney'),(23,3,'All My Loving','Lennon/McCartney'),(24,4,'Don\'t Bother Me','Harrison'),(25,5,'Little Child','Lennon/McCartney'),(26,6,'Till There Was You','Willson'),(27,7,'Please Mister Postman','Dobbin-Garrett-Garman-Brianbert'),(28,8,'Roll Over Beethoven','Berry'),(29,9,'Hold Me Tight','Lennon/McCartney'),(30,10,'You Really Got A Hold On Me','Robinson'),(31,11,'I Wanna Be Your Man','Lennon/McCartney'),(32,12,'Devil In Her Heart','Drapkin'),(33,13,'Not A Second Time','Lennon/McCartney'),(34,14,'Money','Bradford/Gordy'),(35,1,'Big Love','Lindsay Buckingham'),(36,2,'Seven Wonders','Sandy Stewart/Stevie Nicks'),(37,3,'Everywhere','Christine McVie'),(38,4,'Caroline','Lindsay Buckingham'),(39,5,'Tango In The Night','Lindsay Buckingham'),(40,6,'Mystified','Lindsay Buckingham/Christine McVie'),(41,7,'Little Lies','Christine McVie/Eddy Quintela'),(42,8,'Family Man','Lindsay Buckingham/Richard Dashut'),(43,9,'Welcome To The Room...Sara','Stevie Nicks'),(44,10,'Isn\'t It Midnight','Christine McVie/Eddy Quintela/Lindsay Buckingham'),(45,11,'When I See You Again','Stevie Nicks'),(46,12,'You And I, Part II','Lindsay Buckingham/Christine McVie'),(47,1,'Rockit','H.Hancock-B.Laswell-M.Beinhorn'),(48,2,'Future Shock','Curtis Mayfield'),(49,3,'T.F.S.','H.Hancock-B.Laswell-M.Beinhorn'),(50,4,'Earth Beat','H.Hancock-B.Laswell-M.Beinhorn'),(51,5,'Autodrive','H.Hancock-B.Laswell-M.Beinhorn'),(52,6,'Rough','H.Hancock-B.Laswell-M.Beinhorn'),(53,1,'Smells Like Teen Spirit','Nirvana'),(54,2,'In Bloom','Nirvana'),(55,3,'Come As You Are','Nirvana'),(56,4,'Breed','Nirvana'),(57,5,'Lithium','Nirvana'),(58,6,'Polly','Nirvana'),(59,7,'Territorial Pissings','Nirvana'),(60,8,'Drain You','Nirvana'),(61,9,'Lounge Act','Nirvana'),(62,10,'Stay Away','Nirvana'),(63,11,'On A Plain','Nirvana'),(64,12,'Something In The Way / Endless, Nameless','Nirvana'),(65,1,'Kensington Line','Todd Park Mohr'),(66,2,'Strategem','Todd Park Mohr'),(67,3,'Wearing Only Flowers','Todd Park Mohr'),(68,4,'Neckbreaker','Todd Park Mohr'),(69,5,'Magdelina','Todd Park Mohr'),(70,6,'Angel Leads Me On','Todd Park Mohr'),(71,7,'In The Morning','Todd Park Mohr'),(72,8,'Candle 99','Todd Park Mohr'),(73,9,'Greyhound','Todd Park Mohr'),(74,10,'Poor Miss','Todd Park Mohr'),(75,11,'Shadowlands','Todd Park Mohr'),(76,1,'The Wedding','David Bowie'),(77,2,'You\'ve Been Around','David Bowie/Reeves Gabrels'),(78,3,'I Feel Free','Jack Bruce/Pete Brown'),(79,4,'Black Tie White Noise feat. Al B. Sure','David Bowie'),(80,5,'Jump They Say','David Bowie'),(81,6,'Nite Flights','Scott Engel'),(82,7,'Pallas Athena','David Bowie'),(83,8,'Miracle Goodnight','David Bowie'),(84,9,'Don\'t Let Me Down & Down','Tarha/Martine Valmont'),(85,10,'Looking For Lester','David Bowie'),(86,11,'I Know It\'s Gonna Happen Someday','Morrissey'),(87,12,'The Wedding Song','David Bowie'),(88,13,'Jump They Say (Alternate Mix)','David Bowie'),(89,14,'Lucy Can\'t Dance','David Bowie'),(90,1,'Word Up!','Thomas Michael Jenkins/Larry Blackmon'),(91,2,'Candy','Thomas Michael Jenkins/Larry Blackmon'),(92,3,'Back And Forth','Nathan Leftenant/Thomas Michael Jenkins/Kevin Kendrick/Larry Blackmon'),(93,4,'Don\'t Be Lonely','Thomas Michael Jenkins/Willie George Jr Morris/Nathan David Leftenant/Kevin Lloyd \"King\" Kendrick'),(94,5,'She\'s Mine','Larry Blackmon/Nathan David Leftenant/Artie Matthews'),(95,6,'Fast, Fierce & Funny','Nathan David Leftenant/Thomas Michael Jenkins/Larry Blackmon'),(96,7,'You Can Have The World','Thomas Michael Jenkins/Larry Blackmon/Nathan David Leftenant'),(97,1,'Heart In Pieces','Chicago'),(98,2,'I Don\'t Wanna Live Without Your Love','Chicago'),(99,3,'I Stand Up','Chicago'),(100,4,'We Can Last Forever','Chicago'),(101,5,'Come In From The Night','Chicago'),(102,6,'Look Away','Chicago'),(103,7,'What Kind Of Man Would I Be','Chicago'),(104,8,'Runaround','Chicago'),(105,9,'You\'re Not Alone','Chicago'),(106,10,'Victorious','Chicago'),(107,1,'The Call Up','The Clash'),(108,2,'The Cool Out','The Clash'),(109,3,'The Magnificent Dance','The Clash'),(110,4,'The Magnificent Seven','The Clash'),(111,1,'[Intro]','DAG'),(112,2,'Sweet Little Lass','Custer'),(113,3,'Righteous (City Pain)','Custer/Soule'),(114,4,'Your Mama\'s Eyes','Patterson/Custer'),(115,5,'Home','Custer/Dennis'),(116,6,'Lovely Jane','Custer'),(117,7,'You Can Lick It (If You Try)','Custer'),(118,8,'Even So','Custer/Dennis'),(119,9,'Plow','Custer/Dennis'),(120,10,'Candy','Custer/Dennis/Patterson'),(121,11,'Sat. Morning','Custer/Dennis'),(122,12,'As','Custer/Dennis'),(123,13,'Do Me Good','Custer'),(124,14,'Untitled [Instrumental]','DAG'),(125,1,'Rio','Duran Duran'),(126,2,'My Own Way','Duran Duran'),(127,3,'Lonely In Your Nightmare','Duran Duran'),(128,4,'Hungry Like The Wolf','Duran Duran'),(129,5,'Hold Back The Rain','Duran Duran'),(130,6,'New Religion','Duran Duran'),(131,7,'Last Chance On The Stairway','Duran Duran'),(132,8,'Save A Prayer','Duran Duran'),(133,9,'The Chauffeur','Duran Duran'),(134,1,'Introduction By MC Perry Jones',NULL),(135,2,'Africano/Power','Maurice White/L. Dunn'),(136,3,'Yearnin\' Learnin\'','Charles Stepney/Philip Bailey/Maurice White'),(137,4,'Devotion','Maurice White/Philip Bailey'),(138,5,'Sun Goddess','J. Lind/Maurice White'),(139,6,'Reasons','Philip Bailey/Charles Stepney/Maurice White'),(140,7,'Sing A Message To You','Maurice White'),(141,8,'Shining Star','Maurice White/Philip Bailey/Lorenzo Dunn'),(142,9,'New World Symphony','Maurice White/Verdine White'),(143,10,'Interlude # 1',NULL),(144,11,'Sunshine','Maurice White/Philip Bailey/L. Dunn/Al Mckay'),(145,12,'Sing A Song','Al Mckay/Maurice White'),(146,13,'Gratitude','L. Dunn/Maurice White/Verdine White'),(147,14,'Celebrate','Maurice White/Charles Stepney/Philip Bailey'),(148,15,'Interlude # 2',NULL),(149,16,'Can\'t Hide Love','Skip Scarborough'),(150,17,'Serpentine Fire/Saturday Nite/Can\'t Hide Love/Reasons','Skip Scarborough/Sonny Burke/Al Mckay/Philip Bailey/Charles Stepney/Verdine White/Maurice White'),(151,1,'Love Is A Stranger','Annie Lennox/David A. Stewart'),(152,2,'I\'ve Got An Angel','David A. Stewart/Annie Lennox'),(153,3,'Wrap It Up','David Porter/Isaac Hayes'),(154,4,'I Could Give You (A Mirror)','Annie Lennox/David A. Stewart'),(155,5,'The Walk','Annie Lennox/David A. Stewart'),(156,6,'Sweet Dreams (Are Made Of This)','David A. Stewart/Annie Lennox'),(157,7,'Jennifer','David A. Stewart/Annie Lennox'),(158,8,'This Is The House','Annie Lennox/David A. Stewart'),(159,9,'Somebody Told Me','Annie Lennox/David A. Stewart'),(160,10,'This City Never Sleeps','Annie Lennox'),(161,1,'Mama','Genesis'),(162,2,'That\'s All','Genesis'),(163,3,'Home By The Sea','Genesis'),(164,4,'Second Home By The Sea','Genesis'),(165,5,'Illegal Alien','Genesis'),(166,6,'Taking It All Too Hard','Genesis'),(167,7,'Just A Job To Do','Genesis'),(168,8,'Silver Rainbow','Genesis'),(169,9,'It\'s Gonna Get Better','Genesis'),(170,1,'Guns In The Sky','Michael Hutchence'),(171,2,'New Sensation','A. Farriss/M. Hutchence'),(172,3,'Devil Inside','A. Farriss/M. Hutchence'),(173,4,'Need You Tonight','A. Farriss/M. Hutchence'),(174,5,'Mediate','Andrew Farriss'),(175,6,'The Loved One','Lovett, Humphries, Clyne'),(176,7,'Wild Life','A. Farriss/M. Hutchence'),(177,8,'Never Tear Us Apart','A. Farriss/M. Hutchence'),(178,9,'Mystify','A. Farriss/M. Hutchence'),(179,10,'Kick','A. Farriss/M. Hutchence'),(180,11,'Calling All Nations','A. Farriss/M. Hutchence'),(181,12,'Tiny Daggers','A. Farriss/M. Hutchence'),(182,1,'Wanna Be Startin\' Somethin\'','M. Jackson'),(183,2,'Baby Be Mine','R. Temperton'),(184,3,'The Girl Is Mine','M. Jackson'),(185,4,'Thriller','R. Temperton'),(186,5,'Beat It','M. Jackson'),(187,6,'Billie Jean','M. Jackson'),(188,7,'Human Nature','S. Porcaro/J. Bettis'),(189,8,'P.Y.T. (Pretty Young Thing)','J. Ingram/Q. Jones'),(190,9,'The Lady In My Life','R. Temperton'),(191,1,'Meet Me In The Twilight','Jennifer Kimball'),(192,2,'Kissing In The Car','Jennifer Kimball'),(193,3,'Fall At Your Feet','Neil Finn'),(194,4,'Gagna\'s Song','Jennifer Kimball'),(195,5,'It\'s A Long Way Home','Jennifer Kimball'),(196,6,'An Ordinary Soldier','Jennifer Kimball'),(197,7,'Take One Step','Jennifer Kimball'),(198,8,'The Revelations','Jennifer Kimball'),(199,9,'(This Is) My New Vow','Jennifer Kimball'),(200,10,'World Without End','Jennifer Kimball'),(201,11,'Veering From The Wave','Jennifer Kimball'),(202,12,'Lullaby','Jennifer Kimball'),(203,1,'Black Dog','Jimmy Page/Robert Plant/John Paul Jones'),(204,2,'Rock And Roll','Jimmy Page/Robert Plant/John Paul Jones/John Bonham'),(205,3,'The Battle Of Evermore','Jimmy Page/Robert Plant'),(206,4,'Stairway To Heaven','Jimmy Page/Robert Plant'),(207,5,'Misty Mountain Hop','Jimmy Page/Robert Plant/John Paul Jones'),(208,6,'Four Sticks','Jimmy Page/Robert Plant/John Paul Jones'),(209,7,'Going To California','Jimmy Page/Robert Plant'),(210,8,'When The Levee Breaks','Jimmy Page/Robert Plant/John Paul Jones/John Bonham/Memphis Minnie'),(211,1,'Material Girl','Peter Brown/Robert Rans'),(212,2,'Angel','Madonna/Bray'),(213,3,'Like A Virgin','Tom Kelly/Billy Steinberg'),(214,4,'Over And Over','Madonna/Bray'),(215,5,'Love Don\'t Live Here Anymore','Miles Gregory'),(216,6,'Dress You Up','Andrea LaRusso/Peggy Stanziale'),(217,7,'Shoo-Bee-Doo','Madonna'),(218,8,'Pretender','Madonna/Bray'),(219,9,'Stay','Madonna/Bray'),(220,1,'So In Love','Stephen Hague/Paul Humphreys/Andy McCluskey'),(221,2,'Secret','Paul Humphreys'),(222,3,'Bloc Bloc Bloc','Paul Humphreys/Andy McCluskey'),(223,4,'Women III','Andy McCluskey'),(224,5,'Crush','Paul Humphreys/Andy McCluskey'),(225,6,'88 Seconds In Greensboro','Andy McCluskey'),(226,7,'The Native Daughters Of The Golden West','Paul Humphreys/Andy McCluskey'),(227,8,'La Femme Accident','Andy McCluskey'),(228,9,'Hold On','Malcolm Holmes/Andy McCluskey'),(229,10,'The Lights Are Going Out','Paul Humphreys/Andy McCluskey'),(230,1,'Riptide','Gus Kahn/Walter Donaldson'),(231,2,'Hyperactive','Dennis Nelson/Robert Palmer/Tony Ray Haynes'),(232,3,'Addicted To Love','Robert Palmer'),(233,4,'Trick Bag','Earl King'),(234,5,'Get It Through Your Heart','Robert Palmer'),(235,6,'I Didn\'t Mean To Turn You On','James Harris III/Terry Lewis'),(236,7,'Flesh Wound','Frank Blair/Robert Palmer'),(237,8,'Discipline Of Love','David Batteau/Don Freeman'),(238,9,'Riptide (Reprise)','Walter Donaldson/Gus Kahn'),(239,1,'Radio Ga Ga','Roger Taylor'),(240,2,'Tear It Up','Brian May'),(241,3,'It\'s A Hard Life','Freddie Mercury'),(242,4,'Man On The Prowl','Freddie Mercury'),(243,5,'Machines (Back To Humans)','May/Taylor'),(244,6,'I Want To Break Free','John Richard Deacon'),(245,7,'Keep Passing The Open Windows','Freddie Mercury'),(246,8,'Hammer To Fall','Brian May'),(247,9,'Is This The World We Created... ?','Mercury/May'),(248,10,'I Go Crazy','Brian May'),(249,11,'Radio Ga Ga [Extended Version]','Roger Taylor'),(250,12,'I Want To Break Free [Extended Version]','John Richard Deacon'),(251,1,'Finest Worksong','Peter L. Buck/William T. Berry/J. Michael Stipe/Mike Mills'),(252,2,'Welcome To The Occupation','Mike Mills/William T. Berry/J. Michael Stipe/Peter L. Buck'),(253,3,'Exhuming McCarthy','William T. Berry/Mike Mills/J. Michael Stipe/Peter L. Buck'),(254,4,'Disturbance At The Heron House','William T. Berry/Mike Mills/J. Michael Stipe/Peter L. Buck'),(255,5,'Strange','Colin Newman/Graham Lewis/Bruce Gilbert/Robert Gotobed'),(256,6,'It\'s The End Of The World As We Know It (And I Feel Fine)','William T. Berry/Peter L. Buck/Mike Mills/J. Michael Stipe'),(257,7,'The One I Love','William T. Berry/Mike Mills/J. Michael Stipe/Peter L. Buck'),(258,8,'Fireplace','Peter L. Buck/J. Michael Stipe/Mike Mills/William T. Berry'),(259,9,'Lightnin\' Hopkins','Mike Mills/J. Michael Stipe/William T. Berry/Peter L. Buck'),(260,10,'King Of Birds','J. Michael Stipe/Mike Mills/William T. Berry/Peter L. Buck'),(261,11,'Oddfellows Local 151','J. Michael Stipe/Mike Mills/Peter L. Buck/William T. Berry'),(262,1,'Smooth Operator','Adu And Matthewman'),(263,2,'Your Love Is King','Adu And Matthewman'),(264,3,'Hang On To Your Love','Adu And Matthewman'),(265,4,'Frankie\'s First Affair','Adu And Matthewman'),(266,5,'When Am I Going To Make A Living','Adu And Matthewman'),(267,6,'Cherry Pie','Adu And Matthewman'),(268,7,'Sally','Adu And Matthewman'),(269,8,'I Will Be Your Friend','Adu And Matthewman'),(270,9,'Why Can\'t We Live Together','Adu And Matthewman'),(271,1,'Singing Winds, Crying Beasts','M. Carabello'),(272,2,'Black Magic Woman / Gypsy Queen','P. Green/G. Szabo'),(273,3,'Oye Como Va','T. Puente'),(274,4,'Incident At Neshabur','Alberto Gianquinto/Carlos Santana'),(275,5,'Se A Cabo','J. Areas'),(276,6,'Mother\'s Daughter','G. Rolie'),(277,7,'Samba Pa Ti','Carlos Santana'),(278,8,'Hope You\'re Feeling Better','G. Rolie'),(279,9,'El Nicoya','J. Areas'),(280,1,'Shout','Roland Orzabal/Ian Stanley'),(281,2,'The Working Hour','Roland Orzabal/Ian Stanley/Manny Elias'),(282,3,'Everybody Wants To Rule The World','Roland Orzabal/Ian Stanley/Chris Hughes'),(283,4,'Mothers Talk','Roland Orzabal/Ian Stanley'),(284,5,'I Believe','Roland Orzabal'),(285,6,'Broken','Roland Orzabal'),(286,7,'Head Over Heels','Roland Orzabal/Curt Smith'),(287,8,'Listen','Ian Stanley/Roland Orzabal'),(288,1,'Fast Lane','Patrick Tilon, Arjen de Vreede, Silvano Matadin, Michel Schoots, René Van Barneveld'),(289,2,'No Kid','Patrick Tilon, Arjen de Vreede, Silvano Matadin, Michel Schoots, René Van Barneveld'),(290,3,'Deeper Shade Of Soul','U.D.S. and Raymond Barretto'),(291,4,'Prayer For My Demo','Patrick Tilon, Arjen de Vreede, Silvano Matadin, Michel Schoots, René Van Barneveld'),(292,5,'Big Apple','Patrick Tilon, Arjen de Vreede, Silvano Matadin, Michel Schoots, René Van Barneveld'),(293,6,'Piece Of Rock','Patrick Tilon, Arjen de Vreede, Silvano Matadin, Michel Schoots, René Van Barneveld'),(294,7,'Brainstorm On The Uds','Patrick Tilon, Arjen de Vreede, Silvano Matadin, Michel Schoots, René Van Barneveld'),(295,8,'The Devil','Patrick Tilon, Arjen de Vreede, Silvano Matadin, Michel Schoots, René Van Barneveld'),(296,9,'Famous When You\'re Dead','Patrick Tilon, Arjen de Vreede, Silvano Matadin, Michel Schoots, René Van Barneveld'),(297,10,'Mental Floss For The Globe','Patrick Tilon, Arjen de Vreede, Silvano Matadin, Michel Schoots, René Van Barneveld'),(298,11,'Struggle For Jive','Patrick Tilon, Arjen de Vreede, Silvano Matadin, Michel Schoots, René Van Barneveld'),(299,12,'Man On The Corner','Patrick Tilon, Arjen de Vreede, Silvano Matadin, Michel Schoots, René Van Barneveld'),(300,13,'God Blast The Queen','Patrick Tilon, Arjen de Vreede, Silvano Matadin, Michel Schoots, René Van Barneveld'),(301,1,'You\'re No Good','Clint Ballard Jr.'),(302,2,'Dance the Night Away','Edward Van Halen, Alex Van Halen, Michael Anthony, David Lee Roth'),(303,3,'Somebody Get Me a Doctor','Edward Van Halen, Alex Van Halen, Michael Anthony, David Lee Roth'),(304,4,'Bottoms Up!','Edward Van Halen, Alex Van Halen, Michael Anthony, David Lee Roth'),(305,5,'Outta Love Again','Edward Van Halen, Alex Van Halen, Michael Anthony, David Lee Roth'),(306,6,'Light Up The Sky','Edward Van Halen, Alex Van Halen, Michael Anthony, David Lee Roth'),(307,7,'Spanish Fly','Edward Van Halen, Alex Van Halen, Michael Anthony, David Lee Roth'),(308,8,'D.O.A.','Edward Van Halen, Alex Van Halen, Michael Anthony, David Lee Roth'),(309,9,'Women In Love','Edward Van Halen, Alex Van Halen, Michael Anthony, David Lee Roth'),(310,10,'Beautiful Girls','Edward Van Halen, Alex Van Halen, Michael Anthony, David Lee Roth'),(311,1,'Everybody Have Fun Tonight','Wang Chung/Peter Wolf'),(312,2,'Hypnotize Me','Wang Chung'),(313,3,'The Flat Horizon','Wang Chung'),(314,4,'Betrayal','Wang Chung/Peter Wolf'),(315,5,'Let\'s Go','Wang Chung'),(316,6,'Eyes Of The Girl','Wang Chung'),(317,7,'A Fool And His Money','Michael Leeson/Peter Vale/Jack Hues/Peter Wolf '),(318,8,'The World In Which We Live','Wang Chung'),(319,1,'Summer\'s Cauldron','Andy Partridge'),(320,2,'Grass','Colin Moulding'),(321,3,'The Meeting Place','Colin Moulding'),(322,4,'That\'s Really Super, Supergirl','Andy Partridge'),(323,5,'Ballet For A Rainy Day','Andy Partridge'),(324,6,'1000 Umbrellas','Andy Partridge'),(325,7,'Season Cycle','Andy Partridge'),(326,8,'Earn Enough For Us','Andy Partridge'),(327,9,'Big Day','Colin Moulding'),(328,10,'Another Satellite','Andy Partridge'),(329,11,'The Man Who Sailed Around His Soul','Andy Partridge'),(330,12,'Dear God','Andy Partridge'),(331,13,'Dying','Colin Moulding'),(332,14,'Sacrificial Bonfire','Colin Moulding'),(333,1,'Computer Game Theme from \"The Circus\"','Yellow Magic Orchestra'),(334,2,'Firecracker','Martin Denny'),(335,3,'Simoon','Words: Chris Mosdell/Music: Haruomi Hosono'),(336,4,'Cosmic Surfin\'','Haruomi Hosono'),(337,5,'Computer Game Theme from \"The Invader\"','Yellow Magic Orchestra'),(338,6,'Yellow Magic (Tong Poo)','Ryuichi Sakamoto'),(339,7,'La Femme Chinoise','Words: Chris Mosdell/Music: Yukihiro Takahashi'),(340,8,'Bridge Over Troubled Music','Yellow Magic Orchestra'),(341,9,'Mad Pierrot','Haruomi Hosono'),(342,1,'Singer In The Woods','D. Zappa'),(343,2,'In My Mind','D. Zappa'),(344,3,'Did I Mention It Was Huge','D. Zappa'),(345,4,'Jesus Clone','D. Zappa'),(346,5,'Loser','D. Zappa'),(347,6,'Kidz Cereal','D. Zappa'),(348,7,'Mommy','D. Zappa'),(349,8,'Dreaming','D. Zappa'),(350,9,'Rubberband','D. Zappa'),(351,10,'Mountains On The Moon','D. Zappa'),(352,11,'Lucky Jones','D. Zappa'),(353,12,'Leviathan','D. Zappa'),(354,13,'Doomed To Be Together','D. Zappa'),(355,14,'My Beef Mailbox','D. Zappa'),(356,15,'Them','D. Zappa'),(357,16,'Shampoohorn','D. Zappa'),(358,1,'Secrets And Lies','Jonatha Brooke'),(359,2,'Crumbs','Jonatha Brooke'),(360,3,'Because I Told You So','Jonatha Brooke'),(361,4,'Blood From A Stone','Jonatha Brooke'),(362,5,'Glass Half Empty','Jonatha Brooke'),(363,6,'The Choice','Jonatha Brooke'),(364,7,'Last Innocent Year','Jonatha Brooke'),(365,8,'Shame On Us','Jonatha Brooke'),(366,9,'Genius Or A Fool','Jonatha Brooke'),(367,10,'Ten Cent Wings','Jonatha Brooke'),(368,11,'Landmine','Jonatha Brooke'),(369,12,'Annie','Jonatha Brooke'),(370,1,'Lucky Star','Madonna'),(371,2,'Borderline','Madonna'),(372,3,'Burning Up','Madonna'),(373,4,'I Know It','Madonna'),(374,5,'Hoilday','Madonna'),(375,6,'Think Of Me','Madonna'),(376,7,'Physical Attraction','Madonna'),(377,8,'Everybody','Madonna');
/*!40000 ALTER TABLE `tracks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'music_database'
--

--
-- Dumping routines for database 'music_database'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-04-27 16:02:49
