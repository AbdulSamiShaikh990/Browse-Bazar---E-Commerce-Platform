-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: localhost    Database: e-commerce
-- ------------------------------------------------------
-- Server version	8.0.35

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
-- Table structure for table `cart`
--

DROP TABLE IF EXISTS `cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cart` (
  `CartID` int NOT NULL AUTO_INCREMENT,
  `UserID` int NOT NULL,
  PRIMARY KEY (`CartID`),
  KEY `cart_ibfk_1` (`UserID`),
  CONSTRAINT `cart_ibfk_1` FOREIGN KEY (`UserID`) REFERENCES `user` (`UserID`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart`
--

LOCK TABLES `cart` WRITE;
/*!40000 ALTER TABLE `cart` DISABLE KEYS */;
INSERT INTO `cart` VALUES (18,5);
/*!40000 ALTER TABLE `cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cartitems`
--

DROP TABLE IF EXISTS `cartitems`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cartitems` (
  `CartItemID` int NOT NULL AUTO_INCREMENT,
  `CartID` int NOT NULL,
  `ProductID` int NOT NULL,
  `Quantity` int NOT NULL,
  PRIMARY KEY (`CartItemID`),
  KEY `cartitems_ibfk_1` (`CartID`),
  KEY `cartitems_ibfk_2` (`ProductID`),
  CONSTRAINT `cartitems_ibfk_1` FOREIGN KEY (`CartID`) REFERENCES `cart` (`CartID`),
  CONSTRAINT `cartitems_ibfk_2` FOREIGN KEY (`ProductID`) REFERENCES `product` (`ProductID`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cartitems`
--

LOCK TABLES `cartitems` WRITE;
/*!40000 ALTER TABLE `cartitems` DISABLE KEYS */;
INSERT INTO `cartitems` VALUES (34,18,2,2);
/*!40000 ALTER TABLE `cartitems` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `category` (
  `CategoryID` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(50) NOT NULL,
  PRIMARY KEY (`CategoryID`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (2,'Men\'s Fashion'),(5,'Shoes'),(6,'Women\'s Fashion');
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notifications`
--

DROP TABLE IF EXISTS `notifications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `notifications` (
  `notificationID` int NOT NULL AUTO_INCREMENT,
  `userID` int DEFAULT NULL,
  `orderID` int DEFAULT NULL,
  `notificationSent` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`notificationID`),
  UNIQUE KEY `orderID_UNIQUE` (`orderID`),
  KEY `userID` (`userID`),
  CONSTRAINT `notifications_ibfk_1` FOREIGN KEY (`userID`) REFERENCES `user` (`UserID`),
  CONSTRAINT `notifications_ibfk_2` FOREIGN KEY (`orderID`) REFERENCES `orders` (`OrderID`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notifications`
--

LOCK TABLES `notifications` WRITE;
/*!40000 ALTER TABLE `notifications` DISABLE KEYS */;
INSERT INTO `notifications` VALUES (17,5,1,1),(18,5,2,1),(19,5,4,1),(20,5,5,1),(21,5,6,1),(22,5,7,1),(23,5,8,1),(25,5,9,1),(27,5,10,1);
/*!40000 ALTER TABLE `notifications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orderdetails`
--

DROP TABLE IF EXISTS `orderdetails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orderdetails` (
  `OrderDetailID` int NOT NULL AUTO_INCREMENT,
  `OrderID` int NOT NULL,
  `ProductID` int NOT NULL,
  `Quantity` int NOT NULL,
  `UnitPrice` decimal(10,2) NOT NULL,
  PRIMARY KEY (`OrderDetailID`),
  KEY `orderdetails_ibfk_1` (`OrderID`),
  KEY `orderdetails_ibfk_2` (`ProductID`),
  CONSTRAINT `orderdetails_ibfk_1` FOREIGN KEY (`OrderID`) REFERENCES `orders` (`OrderID`),
  CONSTRAINT `orderdetails_ibfk_2` FOREIGN KEY (`ProductID`) REFERENCES `product` (`ProductID`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orderdetails`
--

LOCK TABLES `orderdetails` WRITE;
/*!40000 ALTER TABLE `orderdetails` DISABLE KEYS */;
INSERT INTO `orderdetails` VALUES (1,1,2,1,1400.00),(2,2,2,2,1410.00),(3,4,4,2,1000.00),(4,5,2,10,1410.00),(5,6,3,5,1000.00),(6,7,5,1,500.00),(7,8,5,1,500.00),(8,9,5,2,500.00),(9,10,5,0,500.00);
/*!40000 ALTER TABLE `orderdetails` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `OrderID` int NOT NULL AUTO_INCREMENT,
  `UserID` int NOT NULL,
  `OrderDate` date NOT NULL,
  `TotalAmount` decimal(10,2) NOT NULL,
  `ShippingAddress` varchar(255) NOT NULL,
  `ExpectedShippingDate` date NOT NULL,
  `Status` varchar(45) NOT NULL,
  PRIMARY KEY (`OrderID`),
  KEY `orders_ibfk_1` (`UserID`),
  CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`UserID`) REFERENCES `user` (`UserID`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (1,5,'2024-05-27',1000.00,'F17, Islamabad','2024-05-28','Completed'),(2,5,'2024-05-30',2820.00,'House1024,Street 41,MPCHS, F17,Islamabad','2024-06-02','Completed'),(4,5,'2024-05-30',2000.00,'House 1024,F17,Islamabad','2024-06-02','Completed'),(5,5,'2024-05-30',14100.00,'House 1024,F17,Islamabad','2024-06-02','Completed'),(6,5,'2024-05-30',5000.00,'House 1024,F17,Islamabad','2024-06-02','Completed'),(7,5,'2024-05-30',500.00,'House 1024,F17,Islamabad','2024-06-02','Completed'),(8,5,'2024-06-01',500.00,'House 1024,F17,Islamabad','2024-06-03','Completed'),(9,5,'2024-06-01',1000.00,'House 1024,F17,Islamabad','2024-06-04','Completed'),(10,5,'2024-06-03',1910.00,'House 1024,F17,Islamabad','2024-06-04','Completed');
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product` (
  `ProductID` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(100) NOT NULL,
  `Description` varchar(255) DEFAULT NULL,
  `Price` decimal(10,2) NOT NULL,
  `Stock` int NOT NULL,
  `CategoryID` int NOT NULL,
  `Picture` blob NOT NULL,
  PRIMARY KEY (`ProductID`),
  KEY `product_ibfk_1` (`CategoryID`),
  CONSTRAINT `product_ibfk_1` FOREIGN KEY (`CategoryID`) REFERENCES `category` (`CategoryID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (2,'Purse','It\'s a Louis Vuiton Premium Purse',1410.00,80,6,_binary 'ÿ\Øÿ\à\0JFIF\0\0\0\0\0\0ÿ\Û\0„\0	\" *#\Z$1!1-%-,./0385-;*.0+\n\n\n\r\Z\Z5% %+7515--5.-5-5-7--7---7---7//--5-5-5--55-+---55///-ÿÀ\0\0\á\0\á\"\0ÿ\Ä\0\0\0\0\0\0\0\0\0\0\0\0\0\0ÿ\Ä\0A\0	\0\0\0\0\0!1A\"#Qa2q‘¡B‚±ÁRb\Ñ\áƒ’¢²³\Â\âğ$3Drÿ\Ä\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0ÿ\Ä\0$\0\0\0\0\0\0\0\0\0\0!12AQaqBRbÿ\Ú\0\0\0?\0œ@\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0(«UQ†j­$¹½\0¬_Lú{÷(Ó”ªYMI\ÅövS´\Öe÷¬Ÿ¹\ï\äù¬G[’§VJ\ß\Ë2j<\×y-]Œ\ï‰˜Z–A\Ò\ë†j«up\ÏI\ë~\\‹õú\áT§—\ì—kš«§Á\å&g*‚(]r%+TÁ\ÉX¿UN¸-|˜6\í»U4ùØq2J ‰£\×+o½‚\î\í~\×ı¥S\ë•FVX+òº¬¾\Ñ\Î*WXú},~\ZxÊ”kR§G*Ê­<\ÍI¹8\ÛU£³v²R½ôvµ>¹¼\r\í»u¬¯\ïPe1ñe¶-|:–P\ë•Iø\Ø&µµ\Õd\×\Ö\n\Æ\çõ§„\â\\IP\Å\ÆT%\'–2›‹ƒ\í—2\Ù\İ\é}ò•¸\Ø\ï\0•\0\0\0\0\0\0\0\0\0\0\0\0\0\0\r\'«K”_y­#³«®órW\×Eù­Ù´Æ»aeòù»\Z¾‡Ô#‚F®)§*’œ“JË³\í$©s)‰.w‹LzNH¯­Jt\á^”0ó\ÑSË‘\ë-%K6\Ï5¥Xú\é\Ãaj¹>\ì–Wù\ß\ákü\É7¬Lx—Ä¨IT«F\ÜiB—\Î.MK\ï\Ç-Ex«\İ\É=\ZW1sTñ2û=\â\Şñ[+òO¡”¿\Â÷k>Vñ’rª\î­g·“|¾K\è\Ëtf£>÷\Î×·\á\æV¤¥/û—&½¿Qq\íM\ï«û·ı\Òÿ\0\äûS]­­ªúzzû\Æ9Vµ]¥\î\ßôúRqŒüT\Úò½Šñ’R¬ò\êùË“~irù‹ıO·¸©JR½O=ù6õ\Óòø\"\Õ:ª”¯/Ÿ5\îOC\È5	ø±ºò¾_©µ\á\Øqc#3¥NT\Ô\Ü\"\ç*¬ò\Â1Šöoik\Ê\Ïwd\â\İM^\É\ïÕ°\â3şŒ\è¤cV\İv\å‡mM·B \ç–qı¶»Eè¢®ô³\æğù2\Ëg£ôK[ü-smÒ¾\"ñb­9B*œj\ÎMFë´©eM\ÎR\ÖşÅ•’Vø·¬\Å\Õ]¯„\İù\É;\'§%È®\ëôªq2\Ï7>[]ÿ\0$—À\È\à£P|Y^‡ij‹.{\ÆQ”}Ş­r1®\í]\Ê\ß7òfNWHpô›²jT\åk+)Õ¦W\îl\Ò]tE}\Ğ>).-Ñšs®Û©*2“M9:rqŒ¤šrŠŒšk\ï	\Çõe§­\íG\ã/ş•\Z7ıÀ\×¹g5•€\0² \0\0\0\0\0\0\0\0\0\0\0\rw­ö~)®I\Ë\åÿ\0Bÿ\0Ã¬\'¥JŸ³\np‚÷F)/È§‹aş\Õ\Ã\ç^\ëo\Ï\és£8ß·pJr›ñ\"»*‹kT§Ü•\Õ×šió)=u¥ôO\ÔCÓ¬b\Âô\Û±)ÊE\Ê©\Ù\Éå§‡·}kšõRk\Õsı\"Á\Æ\\F¦&Œ\á(\ÉR­:~Ì©ª\ê9]D®\ÛYœ[\Öqı¤Í·YT£O§Xİ¼¯,»¶rÖ•]=¶00<iQ¨ğ\Ø\ëO$\á(\Ê7ŒtngšÙ­}\ívâ®‘†{™n5Ç³A]¦“û\ß\Íû^¾V\åbŒ7¶ò\Û5´¿Ÿ§­®oñ\İ\Z”\Ü*pØ©BPŒ¥\nU;[I\æMQ«;*«»²nQzjµ48\ÇÙ¨\é$\í%²O\É-\×Ä™”½\"u\îò»ğ–o[_Ú¶¾\×\è[¢ÒŸ{\ëªø¤yª^5\íû¶O\êl	cjNt\Z:k5ZZqZl¢›o\Ñ]şd\ï]¶\Z¥\ÛWŒ#|òj+F\ßzVW¶²\İl¹­Î§ˆµ\Ñ\ì°øQ­*‹\Ä\Ï\ÚN­8BK<Şª•\å.\ê\ïy]\ÕU.Š(ÂYÎ¼<Jœi\Õ\í#\áÆ¤\ç\ŞÊ£+\ÙošöM\İr8ˆ\Æ2µ=ù¾OE²3õ]{\'·R¢Ë‡Kmt\í-ow\ê\ì[¥lıÿ\0®\ß·=…£/;y-»qvœÛ¤›¶\ímk.\\;tUn»ó\ßşnùü9=YºG„»ÿ\0Ù¡şl‹I+Şªn<\í§»SuÑº\ÓLhoöšSmmhIM\Ù{¢É.‹òŸ:\Ã?£8|Ô©äœª\ÎR»mÉ©[3o{\ÛGû9|‘¾\0\Û©§=»»\0 \0\0\0\0\0\0\0\0\0\0\0\048W‡ñbxWİ¶O,*YYJ³\ÉQ-/kI%kFQ\ß,LºA}h5_¤´¨Õ¤\êSŒ\\jC#\í!ºRM\Æk.]`ä®­s‹\Ã+\Ö\Ë\Ê]\×ñ\çğ\Ñü¤:Q\Ñ\Ú=&á‡O|Ñœ^YBKgkõM24¯\Õ*5\Û\Â\ã(Û•\á(»z\Ú\ë\äS,miq\ÂÃˆKVJŒ`\à\ä¥*s„g\â\ÖG(y÷Sº×‘·J)cf—¢\íŸ4´§ˆRM4\ãz\Ë5(\Ş\Ò\ÒM­v¹»—S\Ø\É{Xªükı\"·S¸ª“¼+Ğ§ˆ\×øLü­÷‹óŸ-$ø\æ„“–¹\ê\Û\ìi\'{µ\ï9(\ÙYé¾›X•\×\ÄÖ…<,\ç\Zq´o>Î¤\äÿ\0jO\"Š¶\É-µoKtË©¼[—‰‰¢ÿ\0·›EÚP\â\İL\Ôq\"ß–{h­§t\'\èó\":\Ç\Í\Õ\Ä\É\Ôm»İ¶\î\ß%w\Ï\Ïñ2\Å6”¼O\â¾+™$ÿ\0\Ñ\ìd´«Š¢×•\ê/\Î,÷\Ô\î*«¼+\ĞOo¿k-™K\Ìlš\Ò9\Äqˆkÿ\0ÏŸŸšôh£\ïY%Ïºı\Ï\âH±\êg¥\ß\Ä\Ğk\Ë\Ä_¡r·SØºñ\Ä\ĞOm;M–‹Kz!\Æö\Ñ\Î#¬d¯7m—?M£¯»_‹:\î§0?k\éœj\Ë\Ù\Ã\Âu\åšqt¢Ÿ¿<Ÿ\àf\Ò=K\â§S\Æ\Å\Ò\Ë\è¦\ß\Ô\íú;\Ğ\'Àğ\Ù(Wµ\İ\ä\Ô[”­yI¿-$[lW,ç³±ûD|\ÏUdù˜8:¥\íÔ“ù#60Z\Z2\\S¾\ÅW\n)lz— \0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0ÿ\Ù'),(3,'Polo Shirt','Premium Quality Blue Polo Shirt.',1000.00,0,2,_binary 'ÿ\Øÿ\à\0JFIF\0\0\0\0\0\0ÿ\Û\0„\0		\n\n	\r\r\r \"\" $(4,$&1\'-=-157:::#+?D?8C49:7\n\n\n\r\r\Z\Z7%%77777777777777777777777777777777777777777777777777ÿÀ\0\0”\0À\"\0ÿ\Ä\0\0\0\0\0\0\0\0\0\0\0\0\0ÿ\Ä\0F\0\r\0\0\0\0\0!1AQaq\"#2‘&¡±²4br‚Áğ3BCRcst’\Â\Ñ\Ó\á$%6Sÿ\Ä\0\0\0\0\0\0\0\0\0\0\0\0\0\0ÿ\Ä\0\0\0\0\0\0\0\0\0\0\0\01!ÿ\Ú\0\0\0?\0\İ *\Ä)1”’\Æ|±¬\éš%·\Ò5k\Ú6´º:’\ã/®o\É\\\é5¹9$’\Ëo‚K¿&‹\Şñõ\İ[\Ğ\ì\åõ[K;Iúµ¨¾Ì«\Éso¾=\Ë\ç\áúq½J7\Öuô­Ş§£¯\Å[«S‡^\Ä3Ÿ<WRj+‚É©\ÊWn²Ş†\×Û¬\ÏS§sÁ+‹Zo¤şÓ·Ãµ*?\Ä\éRñvµ?\Ü5\ëJ/Xk(ı\Û\rZ\ÚŞŒc\è\ç&\Ò\Ïjš’\àš\êüSø9\âu\ë:\ì’\ßÔ´Ò¥¥G\Å[Oö\Ô8{\Ğ\Û\nü!©S£¡kOø”¾óğõ]B\ŞöšT\è\ÊX\\\"£gÁ³ó#\ßğC®dğ\Ö\ì\İN\ÛT\Õ\ã=Z¹•MF.S¡Z¦3Z=cúK»©²_\Ã>g“¨\ÜÕ³¯«z²¥Z”»p©qk©¹6c{\Úu\ä)\Ğ\×\èNÊ¿e)\\\Ó\ÍJR|8´—j-ù5\âs¼µ­˜…\í­ı¼n,nh\ÜĞšõjQ¨¥\ä\Ñö\Ï\î\Ì#E#\n€\09\à \nB¢r\\üÎŸ´[\Ç\Ù\ís£ô‰^\İGƒ¡f”û/ºR\Ïe|ó\àu­ğí—¡„¶wK­(ÖšN\î¬#\Ò\ï}{—š4Ì£Œ$ğ—$º\Zœƒ´;\Ù\×u*Zb¥¦\Ñ|?iUş³X_ñ:\Õ\Å{Û‰\\\Ü×«Z¼ı\êµf\ç7ñ|O;óó)©Xö<dLz\ë¹``g£:5\ítªJ›}c\Ã\'\Å\ÖjN„§/‘\Í\Ñ+YQ\Ô#W\\¶Õ²Œ±F“\Ã\íp\ÇU\ã×†S\Ã\Æø8Òœ\ëNUkI¼ğmód“\Ï#)¨ET’r\Ç\ãCƒ\Â~lšşKø3$¹øŒ}lootÛŸ¤i÷Um«u©B£ƒ~x\çñ\É\ß4=\î\ë–.4õju*Kœ±\èª\ã\Íp%\æk\ä\Å×¡öwx›;¯N)\İ;;\Ér·»J\r¾\äı\Ù|\ÛO%a?{Š7v\êv\×øZ\Ú\Z.§Y}>„}„\åüüù—ü™¼«b²y˜³\n #\0§V\Ş\ÕS\Ù]uaÙõ|\ÂÖ•\ÖOÁs;¡{o§Y×¼¼©\ZVô \çRr|Hó>\×\í\Æ\Ó\ëUµ\Z\éÂŸ¹oIÿ\07O¢ó|Ù©\äÖ¯V½Z•«Õ•Jµ$\å9\É\åÉ¾lùK’2’Oƒ7&x# €!@†v6•\ïncoiFukUx…8¬·„\ßØ“~F\Î\Öæ½¥\Ì.mª:u¡\Ì\Ò\\2š~SkÉZs¥Vtª\ÆP©NNŒ—\É<4üLpe9J¤\å:’”\ç)9JRyrm\å¶ú¼õ1\nŒ\0Hù võ«[W§qmVT«R—nH>1—z>l‰ñ\nô^\ïö¶–\Ô\é]ª®0\Ôh%š+¿úKóY\Úz^\Ù\İjó@\Õ\è\ê6\ÚÁ\ât\Û\Äj\Åó‹ıø3\Ò:±i¯i4u+	v¨\Õ\\Ÿ8K¬_Š\äc¨ºı#$\àÔ·µ‹e´E*	Jş\íÊ²|¢ñ\ÆoÁ}\í :ùö·\éwô\í…_aA©]\Ê/ßŸ5%\Íüy«L\ç9T©9Ô“”\å\')Mó“o-¿‹0gH”##c>ªaú+ÀÉ³\ï°3L¦(\È\ÎNiFûT¡kusj5[\íV—(b-¯›I/qŸ#u:ñT«Õ§\n‘«Ô”cR\ì\Òmv—ƒ\ÆQŠ\'@¹–L{85Àr?K\\©mV\â\Şv˜^\Â*¤W%.<‰n,šü\â/wyF8\n²}¼&X¦ùŸ6óu\å“\ï\äO\íû¸\Ú\ÙlÎ«\è\î¦ÿ\0ƒ.¤•uÿ\0\Î\\•Oõğò:‚1Ü†+\Ö\nQœ#(´\ÓI¦º¢š\Ãs{S+«zš¡[µZ\İv¬\ÜùÊŸX\ç¯g\îk¸\ÙıL_9¦´Ş\Ã_\í\Ì5m>¼ªÕ¥K\Ñıo‚Ymö|[b6a	ä»‹zÖ•gouNt\ëCŞ„\Ö\Z>\'¤ö»c4Í¤·~š’§r½\Ê\ĞXk\ÏÀ\Ñ[U²š–\Í\Ü8\İSs ß³¯\ê¿>\æn]G\àaKŸ˜^÷HÁóf(²|\ÄH3E!@”€@\0\0\0V@şY/#\î‘=½\'¦”e\Ø|ñ\Ã=\Ù2\íc‚\\@­¥Áı‡\élş‡¨m\ê´\Óhö\çŸ^oÜ¦»\Ûı‡\è\ì^\Ç^\íE\ÖaÚ£e	{J\ísğ™¿4\ÇA±…¦ŸEB›\ë\'\Ş\ßS6´ümŠ\Ø}?e\éúd½=ü–\'q%\Åw¨®ˆ\ím\0drò2¡\ÅÔ¬-u;Y\Û^RZSXjK\'$¢v\ëv—Z;©}£\ÆWKÖ•³:~]\èù\ÚlEm/bõ] \ÕUş‰\'BŒ—\Z~/\Ä\ßM&°\ÖQÕ·›¨Z\Ê\\\Ñ\ßR5\É¡!\È\Û,Á2T!@”\0 \0\0!B¶¾\è4«-kfõ‹-F„jĞt°ù\Ç\Õ\\ŸC\åOtU\á´=‡p§£¯YTÏ´—\æ?.óŸ¸gÿ\0\Õ\Öy\\\Çğ#i·ê¸švŸm¦ZSµ²£\ZT`°£Œ#’ù‘‘22\0W0ƒ  \0§X\Ş_ş…­v‘Ù¯¼\çõX\Ç[v‹›*ó$9¯1GFT \n@ \0\0…‘\n\İ\Ü+ÿ\0¶\Öõğü(\ÚÆ¨\Ü?ñ\Z\Çö±ü(\Ú\ç;\ëC\äbù$dT\0\Ë \0\0ª\ïEıCÕ±Ö–Õ“©oU\ã`õ<uŠ_i`óNa|\Êtda€(\0\n@\0\0\0.`m\ÍÃ¿e¬kÂ®j]\Ã>\Zºüø?°\ÛG;\ëQ\ÊGÌŠ\09`™(@\0:†ö\Ô=Kõ~ó·?{|6Pó‡\ŞX<\é.e#\r €\0¤\0\0!@µ÷ñWW\è3n\Zƒq_–jß¡\Úmóõ¨2¨\0”@\0\0N\Ş\ëú‡úTÿ\0ƒ\Î\æ \0\0R\0\0\0\0\0\0«˜\0m]\ÄşS«?Í·€9\ßZˆ\ÈPE@\0ÿ\Ù'),(4,'Leather Shoes','Premium Calza Leather Shoes',1000.00,0,5,_binary 'ÿ\Øÿ\à\0JFIF\0\0\0\0\0\0ÿ\Û\0„\0	( \Z%!1!%)+...585-7(-.+\n\n\n\r\Z\Z-  %----/-----------+--+-+----------+---+----------+--ÿÀ\0\0·\"\0ÿ\Ä\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0ÿ\Ä\0F\0\0\0\0\0!1AQ\"aq2R‘¡#Bb±Áğ3r‚’\Ñ\á¢\ÂCSsñ4Edƒ“²³ÿ\Ä\0\0\0\0\0\0\0\0\0\0\0\0\0\0ÿ\Ä\0!\0\0\0\0\0\0\0\0\0\0\0!1AQ\"2ÿ\Ú\0\0\0?\0\ì\Ğ\ÉT\á/\Â€\á@!@\"´p„ DV“1B…¤¦‹\Ö\ÇK?Ã°…)Ÿ®¯tNj¼[õùÈ™\Ä\Äk\r\Ö/Z+ƒ-†Áz£Û©½S]T\'…\ç8§Ö\Õ\r˜\âXt\å·\È\Æiµj%‰¹&\äó2\äfû[s\Ó\Ó[t\ÏüN‘Z–\í’\ä\Ø™n.m\Ì]~>n“\Ì=\Úu0½¥jmf§R“üAÀò‹\èşØ§ •\éñ\Ñ\×\Üq½dV\İ\Ì&\Õ\ê,\É\ÅK¹”!	 Š8 \â0’”Á“L`IŒÀ¡‰„€c¼¦w\'†h^\ï…\áx¼/!x\ïW„\áxŠò7…\àJ7…\àQ\Æâ’7«P\Ùi‚\Ì|\ê\Ó\Ë];\ém]J\Ä÷ojc€Q ·\Ât^»ºcÿ\0—P}\Æõ\È;\Û\Üô¿\Ç\Êq²±\Üë§¨\ÄŒ«“„ƒK*\Ï\ìµo~ª\åF¿ÿ\0a7Ş¬:Eô\\I¤\íõu¬­®Š\×î¿¥şšÉ‡ 8·iXù\È?ü\å\\-R¬p7™frú\ßZDñc\Ô\Ñc\Ñü_o…\ÃÖ½ó\ÓRO24\'\â¿\"jy\Ó\Â;BHP„ (Œq…\á\0 IL\é\0\"h7•eª\ï•Á\Z\ÂLˆ \0\Æ$@“¼/\0#v,	+Gi0’´-1\ÇhZš¿X*M™…w\Ì;Z€­\ÄÆ§¥ô\æm\ã6 \'—z\Å\Û-\ÆÕ¨\ÕA\\\ÅiY[ E$(ğ·†òO\"¯\ëY\ÆbZµG¨\ä’\æú\ë¾l\0\å5\Ó\æ%q‚ªIU¦\ìF‡*–·™\Z\ê\ålÇ‡\ÆJ†ª2¢\ïcaıO€\ß.\élÊ—³eSÈ¸\'ùV\ç\å2t0¢9I»3A\Ê~\È\ã}O„¥¹\"!Öœ6´úZ\âjŒ\ÖS\İ@)§\î \Ê­¯\æL¸\Ù\İ\çAÌ-k\Ó\Öf¶51B“\ãiKöcßªtEø\Û\Ğ\Ï7¼¼w]›ª\ÌQj8\Ú9®0øI>\ï\ÔQÌ¾Ÿ\ã7kNsÔ½KQ’\Ïõ®Nò\ä\êO³¤Zhb”H‘\"T´V„)\Úvˆˆ´‰“29d„`IZ•¦`R2²\Ên²t\Ä	B+\Â`‘…“\ÈY(\á(\Ú;G\n\Ñ\Ú8@V…£„hZ8@\Çt‚»S\Â\â=¾Í–ŸıFSıDO3WÔ©6@22(¸<S[:wõ3½t\ëlª£\ĞCv¥jµw÷~­\İÏº\r¹\ç<ùŠr\ÊTŞ¨\ã¸\æ\×\Ó4\å\É\ÛG[-·ˆ h°®èª¢\ä•[›\r\ÈFc§†\í÷°Àa++ º\Äf»\äƒ\á\0\é`\ìıœ\Æ\ÄÀ:XJkL.‚gµ|k”Ÿ+\ê\â­^\Ã\ÈXKZ†NR¨g(hŸKŒµuP7™sR¢\âjª\'\ì0¦\ÔùU­¹ªø¸|x\ÌF;i\Ztò#^\áˆ\Ş\é`x^S\Ø\ÛyiY*\'th\nğóf\î(\ë^W=¿¶;\ÏU\Ô{•[€}N¿—\Îovœë£½>\Øx,=:?OR\Ö\ÏT®À\Ô#]E=\ÂÀ3=\ë|”\Åt\Å*oU)ª\Ôs|ª2¹d\Ím3…¹\Ğ\\\é:k„D¶\ËB\Ñ\ÂmIE6†Y(¯9b\Ë\'À¤V,’¬F§–;Fb’!’¥\ã&`Èˆ\àJG	8E8¡\Å@$+\ÖTVv6T˜òP.d¦¡Ö†\Õ\ì0L>$öK¨¾]\îE÷\Øp\åy9\Zµcg\Óhm–¯†\Æ\âOµŠ®\î»ô¦r*¨ğ¶ø\Ía\"\å‰$ı¢4±\03/\ÂlY²Ò¥Jö\Ò\í\ænOÌ´\ÆağW%EJ \ÙMóbs¡ğüÓ‡“_†}(.+/¡¸»1\Ôqµ\å\Ï	Y°iwš£0 p\0·3¦ùMVS—Ó·$\ÚQ\Şom§\Ê×•jˆñ‹“Ú¨\ÙF¬@3>›ˆı—\Ä\Î4—~I\Èkxê™œ/v>\Åj\Ì.\áFıG\ëğ2@5\ç¬\Ëlš™X_\çºi·&GLU\áò´Í•p›\Õ\Zƒº+·°\ë›%A\Ä(\à|\ï(\á;]^ş\İ;­÷ƒ\İe¨·åªƒ\éÀ‹LıdÙ±¨£!9{©\İ$XÙ·%\ÃQ­‰Q‡DW§\Ò*(3YŸ††öùÉ­µ[q\Åz—wØ›^–6…,Muª¹­qu?iOˆ2úyß¡\ÕWemJ-Œ§\İª8°4Y‘’\Ç.ô³±\Ğ\Ûq#»\è:t\í(U§U	#5:Š\ëq¼]M¯;D\ë5£%q!%Q#€¡B\n#%£\Ë\ïe„w„$„B8G	8B\"!N9\Ö\Ö\Ó/§D\îFœ\rF\Ô5ùğõoŠi½VÜ‚ö\æxSa<\åµñÍ‰¨ø†&õYª‹ùFŸ\ÃYÇš\Ù\Õñi¶\ßÅ†5«÷Z\Öğwı¥•*µAb®ƒS~\é\Ö\Ç/?».jšªn‹pFº\ê8Lu\Z\Æ\ÚRm{\ŞŞš±\×w;\Ît\Ùv\äÈœg©V\Ävvj•\ía\0–½\È;õ\å­)`±M#k\ÜxRõ—K\Êòö\éÁ±Zy\Ü(\âm(ô†§xS©¨¶º]ÀoC” #šÌ¦Í¢–oeA-û \Äx\åkø\êÆ£½F\Ğ\Ôb\çÀ±&Òœkò\Ê\Ñe\îIbt—T½\áÏÑ­£fTÍ¥\í\Êfhe\0‚H\ŞEµ\×úMOT3?‚Ä’,I#9Æ·šË·\'Z5\r£°ª\Zy\ë\âUš\Ú\"ªA=\âs2ı]t\á6rœtv¦Zô{4R\Ù\Ü\Ú\Ö\Ğ\Ç~òD©K¸ªn™\İ\r¬Œb¦\ã}\î8Zß„\ç\Ø\ì£QÔƒIö¯v>~3]oö\Ãn=\é\ê€À\ê7\Ô\ÄspŞ‡tóŒ´s†°\îö„\ä}\ßT\çì¾º8\å¨\"\Äunôš†<0L\ÉVŸ\íh½ƒ\Óû\Â\Ú:ra§–\é\Ú%šk0\ÎB(\ä¨!@\"„ Š;ÀqBğ€\ãŠ%£„œ!!FDÀ\Òú\Ñ\Úİ†i¯µT\éø_\á›\å8öZ¹)\ËUş³r\ë#hv\Ø\Ö[÷h\Ìx¿\Úù\Ş`6% õ@õ˜9¹&mW\ãñExöXZ®\á\éÖ¦x÷U:Di§\ÎZ\Ñ\ì\0 \âSÈ¥U°Eµ\íu¿»mœ	¸3ˆÀ*§\ĞH‹b\Ó]\ëHQ¾˜šg—´=5úKúµ)…¿h†\ÂıÚ”\ÛOF:øLb£²7²û¤»B’ºQ@\ík\Ø—)}‰…{‰Æ¥‰\Æ\İJ NŒ\Şğ¸`¨üy\Ì69¬&Oú\ÌN0\ŞOvG7T•*M›\Ù>’\ë\rˆ{\Ëğüm\Æc‚r\ĞËš5¯d©¿pn~sEª\ÃNLl4\Ñj)zl]ü\Ôsa\Ãğ\äL¹Á\Ô*F³_¥š›¤«\r\Ä’£ö€#{\Ê;\â\Ê=\ßgO3%øÿ\07]·=•‰(Á:ş¾2¯LöU:\ëN¨°a~-{o¶ù‡\ÙØ¤U\ÌÌ™o¿´[s\ß\ÃN\å\Ûb_İ¤XT7\ã¯\Û;ô[½¼§”t‹ø\ìKVP´H±\×x\0\\Ÿ._\Úe¶N\ßÄ¥dª*dd\Ü@·\0\Çuµ7´xİˆ\Ô	x¹\íğ\Ãp˜\æ\\¦#–bq\à‹F»wGºkJ¸U­ds¥Ç²O–ñólF \î \Ü\ç.8¯a©\ånff¶wO1Tû˜R¡}ú¡Š\r=\ç\Î\âi§.\Çl<¿\'ú»´&Ñ¾šS¨Š¸ª‰\Úqu¤ÈYs1wøMºUuŒ¬\â ú‰\Ú&\'\Ó-«5ö”#„•J(\ÌP#„	\âbG\Â€B€Œ§Uò‚Ç€$úk*­ôş³&–¡K€¥–ÙŠ’.‚\àFDÈ™\ÈLF\Î8¾Öª^£³36¤I:\èb\Ùx¤¤\àšˆ\ïmx\î\ãó\İ,)aT\Ş\ï|Ì¿\Â\á\àdAbT[\\zO2fº÷\"¶ñúmñÔª‹İ›Ö›Ÿ=Ã†’}š\Ìzo–xM‹!Cá©±\Ô\Ü.]<¶¸ó“\Çl8C\Ø\Õ\ÄR YGl\Õ\í\Ô$|-:F~³N\Äú](\ê‹\Ìy\Úbºw‹³„÷Dµ±xAÚî¤›sd&ş¡ô÷L×¶\Æ\Ó\í\ê5K\ê\æütğıZL\Ç]-_õ¬uw½\å¾\ZkZ?ù•)\Òşwù\Ê\Ån	\à5&l]Xl“‰\Ú\ê‘\Ü\ÂŞ³i½\ìVšüMÿ\0†w\á¯lÿ\0&ıb_¡5)Ü 3W\Ä\à\Ù.®¤OI\ÕÁ«\rD\×ö\ÇCib\î‹\Í,\Z\á\ØJÚŠnq¿\ÚeğKhf[¥­„¹ šgs{‡…ü&_ş]tRxø8r\Ó{k\à\å\É\É\\R¢ \ß*\ß\ÈL\Î\Î\ÚMM\Ö3(Hµ2&;D½\Z\Íqº61k¯µ©\á\Â`1\Ø7-l¿\0/o\Ç[Lm[&é’¥µ;R”	MûL\È?ga™A\æo—È´V¾S\Ú&|#¦}ş\Îğ=\îL¤ª•m6œFX—RP“r/q\é-kôpe,µú\ØÎ3*%~ı±ö^2û\ÓZøV\ÍJ£\Äp>cq˜\Ü^Ä¬7ùŠ¯³\ê®õ3¿1›—’\'ÓµôO­Z†Z8À(¹\Ñjõl~õı˜ò<õ#œò!»Á«±ŸÉ…\Å3>U&\å°\×\â9§5\áÃ‘\ì\É5üw¨DŒ@ ƒpA\ÔyG%Ì¡@”qG	8E¡h„f‡\Ö\Ö\'.\rş\İAş‘ı\æöÓ”uİŠÊ¸UñcúøJ^6²\é\Å1‰—>J“!ƒ©5\ÌVv\Ê8\î›\Ö\Ä\èûô\ã1\Ç½;üš\âógµ…Ì…Gj¯a¸|!ˆ\\\ï\ØRû:9\å-6\ÎÒ§…§Ø¥‹h\ŞE¸\æ¯$O¯j}!\ÛS°[i¡š=Z‰e\Z’\å\ã.{Fª\Äó\Úœƒ³Mÿ\0hòğ2üu9mX®-1U‹å¤šîµ¾\Ù;\ÌN\Õ\Õ\æ\Ä<(w\ê}eC\ãÀz	Ïº\Ñ\ãRª\Õuİ¨´a©eP&ÈŒy—´\ÚUKšt\ähS—©NYU¶#Nª”u0±otû«\Ö\Ã\æ­IY©oº‹µÉ‡ñ\áÇœ\í\ád­!/)§mKq¼/¨·\ßğ¼¹M >Ò°\çö‡\Ët\î}#\ê\ç‹-R•ğõ¥©€Q\Ï7¤tõ>3œm¾¯v–\Z\äQ\\B\rCQ³9ö/¨>W”8—ZóZ­\\Ö¦\Â\á”\ÛYJœ\Æú\ß.ûÜÿ\02G¤Uò#d«L«\r\ê\ê\È\ãÌ¸$zZ*h³R ô±±ó\'_„¤ñuÓ´|ûVª\r\Íó‰±U\ÔZò\Ø\Åª\Ç\ãe,\Õ-\í¡ô·\âD¬qL-?\"%ñš\êx\é\ç2˜›T§aRŠ8ÿ\0^\Ùø\äøÉ¥2\ÏıS¼C5¦%µ\â:S³±\n{\\.F#xñN\Ädg\"•È¾—\ÒU4ÿ\0\ËøÌˆ5\rÊ¦şJW_×ŒœDN;Tı05Š\ìÊƒ7cFôj¹lÔ›¯¡\ä\å:t\å=Rt]ğ\Ì\Ø\ÊË”²”¦³Y­so²4ó3ª)¼(”P„!(\â#Š8qB„QÀ‹\Î-×•\\\ÏD°rŸ2~\'iiÀz\ĞsS´ÿ\0±¯LÛ’¾\Z’ş4\Ï\ÆBc\ÛL\Ù²8<¦\íşhqHR\Ñ\Òü§?\Â\Õ\Êo+>4\æ-*\í0İ±½$§„¡’V³r&hÍŠz\ÎKnu”µF—²«\íq>\ïõ>|uX´\ÕyS).UöúG?9_`ì§¯Qt$“p?\Üe-²^µEUR\ÌOto\'\ï1§¢}\\*À\Z¼òğŠ\×½\æË\ìu\Ã\ÓKñó›\n•pøN&^¥;K9¡N•¥P²Vˆ\ÂB-6†Ì¡‰\\µ\èR¨9:+|/ºi›Wªm›X–¤µ(Ÿ¸\ä¯òµşFo\Ñ@\ãXş¦ñ~\Ãp\r™OÈ™€\Æõoµi_¸}\Öñ…„hó#£øú~\İ\nƒøü¥£a+j“ÿ\0ñÿ\0i\êw¤§zƒ\é-ªl\Ú-¾šü5\æ\Ã\Ö\'JoüŸ\Úm½\è\åv¨®\êT}E§kÿ\0£Áz	5\Ùê»¬ Õ†™U”\ÊaÉ´K†WT´ \áR„\Ö:y¶N•TV©j\ÄS\ßFU&¦\\\İ\ĞÇº ›û[¸`zY\Ñô\Ú+F@r‡gf¸ú·US\Ç),	·»n2¶\Ü\ézfö\Æ\Ó\éUZXJ5kR\ì\Ë2\äfBR¦\×.«\0‡}ÁIô7¤m\Ä\âT«\ÅrT¨ŸøVl\ä\Ó\ìrCšl3_\İ\Ô\r\Æ?\ä5@£V,\ÔÂ”j¤Ó¦\ÌÙª2¢Û¾A+š\çù‘\èwG©`)2\ÓL¹\Â¹k’™…\Íõ\âO¬¬Eµyšd\ç¶­Tb³¹™V§d×¦j\×P\ë—u3\Ù\0w¦\ÜÄ¹«Œ®)U©N«æ¥³©U*Hqo‘·h@¤\×ÿ\0©»t\ËW\ÙxUZ”ş†Ìµ˜Õ©•o™\Ô\æù®5b@Û™ŒÑ KŸ¢Vú\Ä4Ÿ¸À5:j\n©[\ÛP\0\Z_†š\É\Äl0\Õö\ã\ÓM*bÔ¯P\Z\êr\Ùó¥\Z¸p/ W\Ä\\r3m±Rˆ\Å­UÚ+lˆµ\èµ1ÆE5,\Ç\"µ&K\rI½\àNg±¢IC{–u¾K¬©N£°7\Ğ9\É\çLñµ\è\àp4V¥gGH¨˜†½0,\éj‹­øT\Îÿ\0¼\ìm©%’l~/:7ˆj¸,Wb\ÍSF£±,\íIY˜ù’g\"\ëse\Ô\Ãc[©š)\Ô}@_CeBœ\íXj)M5\n”\Õi¢ÊŠ\0U@,¶\îÇ¥¤\Ôj\â-u<Ä²“=¼®\ëL\îb<Å­ 9“\ä/:†\Ù\ê»I‹PJu×†VUb<UÈ·£ƒÿ\0#\íB\ÙWg¸\×ÿ\0O§›3ş‹yKUL9\"ú(:xüw:Ÿ	”\Ø{\rñ5*Xñ6²¨;\Øò37‹\ÕN&¡ª{ˆ\ÅØF¡Q\àó7bôv†˜§F˜UÍò|L•&X‰ôI0Š,39öÜ\ä&\İC\\*8BBBp€¡@!@P(P„„(B€\á@p„ „ Gt”!\0„!\0„!\0„!\0„!\0„!\0„!\0„!\0Š€B€E@! ŠB?ÿ\Ù'),(5,'Watch','Good Quality watch',500.00,0,2,_binary 'ÿ\Øÿ\à\0JFIF\0\0\0\0\0\0ÿ\Û\0„\0	 \Z! \Z( % \"1\"%)+...383.7(-.+\n\n\n\r\Z/&&.-71-7/-+-+75-.-+-+0/--2/++-/--0---+--0--+--------ÿÀ\0\0°\"\0ÿ\Ä\0\0\0\0\0\0\0\0\0\0\0\0\0ÿ\Ä\0K\0\0\0\0!1AQ\"a2q‘B¡±#Rbr‚Á\Ñ’¢²\Â\á$3CSc“ğ4Dsƒ\Ò\âT£\Ãÿ\Ä\0\Z\0\0\0\0\0\0\0\0\0\0\0\0\0ÿ\Ä\04\0\0\0\0\0\0\0\0\0!1AQa\"q¡ğ2‘±Á\Ñ#BR\áñb¢ÿ\Ú\0\0\0?\0\ÜjT©B©R¥R¥J”!J•+œó*)w!UA$€“B^/\ÅcÃ¦y	ıUóAüN•ñnk\ÇJO„\ÑB‡@o›5ø^8¯9\àä˜›¬ƒ£2\Æt\è\0}@\ßñ\ëU0a‰\Ò,?ü¿ş§HT\å\ã¸\äi°\Öi úk\ä\Õ\éx†\"HÀy\Ê¹ƒóx$‘©Ì’\ã\ç”6Š%4o«v:t\Ú\î(V^6»J~©ü«òxZ\à>jø\ÛZO\É5x\r.;\Z>¹‹\Zè«Š\İx–;şh#ûJiDñ.6¿¤~iü\ë\Ãq®0º˜ƒ~\âŸÀ\Öq\Şpxú«|?\Û\èS]¤± \ÒXO\ãs\Âs–>9iq3 o0dÂ¨a\éd\r‰\nÉœ|bİ“2Ê\êÆ‘+_P\Ç\Ïc~–¾Ÿƒ\áQ |W	El†7^\ëY\äsvhWS\ÚSø˜¯¤ÿ\0\è(\î™±,n0Î¨\Ò* @l\Äù%m=©o‡ğE8ˆ‘¤$9\'# V MŠ»–ùÖ\Ä\"_-\Â\r“°7~ûV‚«V\àŸ5Á#§ñ¨®\ÕC\ÅEÁ±¸\0\éÔ\×\ãWck‹\ÒBõR¥J¥J•(B•*T¡\nT©R„)@9‡‡şVH„{ö6\ÎFÿ\0¢:÷?\rNJ\Ö¦¹¢€,(B\ÏföS‚?e\ÇÁ\Ûù\×}”`ƒ\0\Ş!\Ú\ÙÎ½uô°5¤+:\æ.k1\Ò$fX›\í\æp:›.A~ùª¿#IRcs\ZN\íÁÓ°úW6\àqöŠ9\ã?ò¥¾(şñ®\ÉÏ˜¸7ù:ŸÀ\×.\ãşÕª¤\æ›Û—£\ì*—\à*±±@‘d¸½˜\ìm\Ô\r\í\èh\ç\éz\á%ùXş˜yoŠ¶0\Z7P\åÅ‰6›v\0€«T\â7º¨¤÷H\Ñd¬\Äû:\Ç\å\Ä=A®i\ìÿ\0ˆu–0>ş¸\Ås\ÅYQ›°\'\è+ª²,£†ò\ëa\à‡#ù\Äò#\È>\Ìo±‚5\Zx…t\îo_Ğ¸¦\"GXx:dUP{\Şşb{ş\É\Ï2¬XH $‚\Ç1·ê‹Ÿ\í0úRvQ2<\r¨ ”ô#_óùzĞ’+\Ê\Ü\ç#d\Â\â<Á„·³\Òã©½µ¸ÚµL0·—\Óğ¯œ<[Z\×§\èGù\Ö\ëËœdM…Šm\ÉÊ¤~±!\è)¦*•©I\nT©R„)R¥J¥CBùGƒ¦“3[DDyû¨Š7co¬›7\Ç1b‘\áĞ\ÎfQ\Ò\Ê.£\ç¯sBŸ´^3\áš9$  `[[Z\àûVhüùˆÍ \Æ*\ÛLÚ·÷mMÜµ\ÈsI¶/ò6r¨\n]A\×5\×÷}h‘övzb¥%şTĞ³\Ïû\ÂÄIšŞ¹øÖ\Ê\ÑBp‘4\ì¦iÄ›_4„¹İ³[\åBggo‘\å\Ì\Ñ+1a¾PHUö\Ô16;W§öy‹\ïùÿ\0*ÅŠ%\ŞùWECT\Óùş~D\áQõ¥È¼Dm\ÄTş\Ö?ğ‘^O)ñA¶.ñ\Ã\Ûğz\ÄY\å\ëúZºŸD\áıù¾úÎ¸oµ¸\Ò?*»X’|À± \èKQœ.ñ	cl\Ó@¤3)*¯•†\Û÷ÿ\0\Ñÿ\0v2³„ÿ\0”n\ÂÃ”f<VyŸz+\Ñ{[Œ\î‹ò\æ(ö‹%\ÖŒ\ZB©\Z\éŞ³~m\à\ã\ë@²;\ÄA\ÙW¡\'¥ÎŸ#A0œG¥\ã–R\ÎB¤ms\ÔÕ±R´/i|C>5m*z\\ù÷€ùR\ŞRD`/b\r¾\åW\ç‘f‘¦cq!/}Ó˜\ßOM{šñ&1¨}©¤«ñ\Ş\nL\Öwšú`ºk®¿\neö‰+\'\ä\é1\È\×+u\0‡*B‘©\ï©{Ç!”Œ©¹Ü¡·m\ê¯	\Æ6x\Ş\ãFC\ëB\Ñ1\Z÷U°’††\Ì=G\ãVj)©R¥J¥~1°¹\Ğ\nı®‹7\í»|:¾€÷¡\nŠ`Ä¯\ãH:Z5?aO]vf\ÜöGC~³ªÆ¬\Ùo`M†\æ\İ>{U~\'\Æ\Ò,\×\ÙE\É$N•Ÿñ¾na–H£r\rÀ–B\â2t\',d\Øúo¨³<¯\É³ôÌ¤÷66\æ\ĞõN</Á<;È¾fe!snN¶½\Ú\çNõJ~jU„¸ˆÑ¯a\à“!§B/~–¬¿\Åfœ\ŞYYı	òü”h>•]Mv\"\ì7»Y¤®ıŸ\Ò\ä\Ë\Û-\ZDÏ™ı\Ú\×`r\Ğ\0d•¯\æY¢Û¨#+mñŞ¤ˆYU/6e\ÔH$&»\îF‡· ¤NW\ã¦\'7a\àøö¿\İ{ˆ¿zj\ã¼T6>!©ÊŒ.¡E³N\ÆÀ\\ö®6+²f…\îm\Ş\äcª\é\áûF)X·:ôV¸¿H¼ Ø‰`a}[Ïœ~°õ\êt\ß\ågúfI\nşK42®[5\ØfS\Ş\Â\Ç[\ín›kYt±¼\Ë.!Üœ¥E\Ûv,t ²‚}-T§Ãº,r”=\Êë¡±:j5\ë]øe¡/c\Ê\ê\è|–ùwf¾\ï\Ã\ëWV~kb\Âñ\Øb•pd0p\0P ‹r@ò\ß]N\ät4E¸ªZ÷¬“ó&7Uÿ\0^	\n½ıN€6ÿ\0[\Ñ\Ì±°–I<@\r\àq”Å®§(÷\ì>\Õs\çŠ|!©Ec\ßŞ—F	¢\ÄŒ\ëÈ¢ü?‡O‹Šp=!\É~‘§‘>F\Å\Ç\í\×,w*«‚¬\Üq÷\Ó(q8\å‚5U(Td´-”•[k\Ô´x\Â)µ\á\ÂÂ‘º\Ë8O,‚h\Ô{¦U_L²>Qò°—\ÄqaPzŠ\Û8_ø…ıD‡\äÍ˜z±ş=\Ê\ï\ÎIQ\ŞÃ²‚m÷Z¤’\Å1L\Ü82^ñblmú.‡üB—p¸—&\ä1­N\á\á1*\ÄX\äac\Õ[ÿ\0µV\à\\7‡³G½\åf\ÍömZÀ\\=(MiÏ¸»b0\Øqœ¡\áÔ_O(\Ôm¹\Ó_(\ïOT\Ëx\\ª BW\Ò\Æ\×úHGÎœh(R¥J”¼M U,\ÆÀ“\è)™y\Å!PÀ°$“ap\\\é`·”\r\É\Ón¦½û@\æ±IB\0\×W6\ro@/©ôùV/‹\Ç<\Îdİ\Ğ€€Ö¤š»	„v-\ÄlÁ¹\âz\ÉUb1óq\Ø~J)\ÅxÌ¸–\Í#i{…\å\ÌúŸ¸iM\Ñ\ã#\Äp¢²:¬›.c©+ªÛ½\Ğ\åú\Ös& \"\æc§\ŞOaTq—,²–\Z/K\Ô\Ü|¯m:\×K\Z ‰¬=H\"¸yù®~M#œ÷\ê7øòEŸŠ-ò¥\änË·\×o¥\ê›qiX¹T›µ[¾›u‡›\æ\"‰Vr×±¿\\€t\êo\é­&ber\Ìœ\×7·\×ï¬¯\Æ\Ï)¬\Õ\Ğh´Ç‚†1ğß¨óqº\æ˜\Ø\Úû:-\Ó…«¶Š\'†o‰\"A{\r\Ôöû:_m\éP-n<\Ãn²¼p¸P}õbTƒqúJOÀ\Öy%s5.?U¡±5\Ú\0>‹?‡93S­®@\rkmµú^\ÛZ`¹‚9eI\×2¢…XÅ€9G•{e¾§½\Í!ñ\'W•\Ú5P·9r€»€6¾ÿ\0W„€µô\ìkC&˜\rMù\ï®ú\î\Ã\ÄN‚¼ºt\Ùmœ¸ñG¼K\êò’lªEÔ›\èGn—\çJoˆbe\Å>h\ÚO4die\Ã/ ûşt…q%:½\Z¨aul»\Ö·Êœ\\s3\âqr:…4/§”k$C\Ó_h\Ãd2:B,*¶´m\\\ÉùóTL×††\r\0\ã\Ìñ\'¯ p®`8¢\äğ\çKÙ€¾mµ]E˜[×®´ş[\æx\ç>$\Z.b/ ]Î€\Ú@\åóÌÈ$\Ê\Ê\Z\å\Z\Ä_-®Tõ±\"˜ğ\Ñ(\\Ñ²Fö³™\ï\ä,F¥Nöî¶®n?ü+û\Ø~u\ë\ìt[ğ¸ù¹$ø‡ª\Úp\\f%O#€US÷Ş€óv4oõ?…t\á<`\ÌğNÁVF$¡Xj¶ 	s¡\ÔZ\Çj\ï\ÇlÎ\èGı}j¶E…2+E\Ã\Ël‘\Î\ZRÁ¡uµ¡\éöiZ~\n\ÑB’©\r¨\Èl-Íˆ\ìW_•j\ï:w}Æ’qkş‚·û/¯õ‡ò©$´Vv-7¼\ĞknşB\np™\Ërƒù!R\r\â#OD¿ğ§4\ØR)¯\Ú\Í\ÜHÁ‡g‚56\Úşmı/F]€$\07\'j\Ãy÷‹,¸Ö†I€‚IT–RM¢\n¢\ÚmšEmF€Z æ—\Æ\î~µÄ©ˆğU0ø¶Ä‰ñ\â]X*\Âşl‘ZFKÜ–\Ú\ãmw„ó>\Ò£V‹\ÅR\í”\ÖË”\ïg±\"ı4\Í;\ÆG\È-y¿*‰\È\È\ÄQ£¥AS¡\ÌXuEˆÅˆšI1’!|·\Ó9¶¤Z\Ú\èÖ­qNcŸ\ën]n³¶¥Q$Aÿ\0¾ı#\è„\âVñUƒ\å·\Ùô±\İM÷ß®µJyÙ¬	$ağ\n;\'+\âšbvF[ªû\ÌR4[÷·`hŒY½P\í4N¾\È8¼P\âš,A´r)#¶e\èi~õ\èO´¡‡8\ç“|’\0J\é£\rƒ¡°?Ôº\Új+„M#	gNI\çğ\å_‚š¸o7<\\2l\ß4²\ß7E”gQ\Ö\ìV\ßj¹\Çy&8\×ó3\Ê\Ì\Äl\Ê2a†!\îcK£2… \æµ\î+Äœ’Y —3\Ç\àgY\0[\âi\0	¹\\¤Ş‘to\Z¢œ6JŠ(\Ï+ğo\Êñ1\Â\\\"\çsöToo\Ö;S\Úõ\â~_\ÈUr) °u° A\Ö\á¼\ÛZ÷7R<<¬‡2’¤u«na\ÈuP‰j¾\Õğ¸l<,!nú…\ŞÁt\Ì\à\r‡sûÕšğ\ÌnV¬lA\\\Â\ëpF„\Ô\Ú\ÄVÊœ‹./ı7ˆø¾€H\ÅÄ’\r”w=tØ›\ß@nV½ ağ\ë‰ğp\ÑÆ‹Ù²1o9&\ê\ÌI,\Ê,	\'rGJ¢80|[ôöê¬f‘\\›ye.Ú¨D\ëmƒ^\Ñ\Ã\Ş×¹°ªØ\\0BfY\ä\ÎøH\Í\n¦·>)°b¤\å\Z[Z\ã\Éô*\ÎG†\à£g?šk\Æ\î¤\åkmvŞ˜\Ïl1ü£‹lI*\Ñø-ğş`n¥\ì#\Ğ\ÚuÖ´M,®¸\Ç\ÂF­ÿ\0\ê4õÒ´*¸\ØÁ\â\ã\Îı}\Ú\åÁ1~ø¹¬·Q©òö@:iÓ¿˜÷§\âñ“«bE†¤‘½€\ÜJ\Í9n}P\ßS°µ¯}6\Z_\Ğ÷£\Ø,b‹ª›\æ:\\e\r\êÄ‹\î	\Ûkmz\à\Èù0\ît\\Šèµ­”óN¸`\î˜™‚\Ö»\è	¶ıi/l%A÷]\Ç\ãM\\‰\Ì\ã4Ø¨W—\ÂXüò„]€\\”k”\\\Ğ,dY?+‹qš\à÷.\Ì\ZÑ‡›9¢mS#2 ‹À\æ	DÒ¬`ş¾\ÊNVm˜\æ°#Q_Aa­‘m{XZûÛ¥\ï­\ë=\å¸@†,5[ü3‚\np\àü\Ã%™afl·»xn\Ø\Û\Ê\åB°¿c­j\ÒUj§<cp²F\Î\äB“~öc¸ø\×ÍœK\â\Êò_s§Àh>\áZï¶®-Q\ZŸ\ÎÆ­.\Ş(P,O\×NÃµbI-i\ì\Ò\Ñ+\î\Z¹ü*±@\ä\r¥nlc,E<F\Í`·9>óeB\é{_QTÁop°e_t‚×±\Ü\Õ\Ó^—¯8\é€e¹”.º‘«k¡\ï—.\àô\ígƒ\ëõ«$=\ì\äğ\n\r#AöqÏ‹„ü\Î(¶jW°a\Ô_\í\r{ƒ¸\Åğ\é\Ä1\äa\Äqx„ù\Äe¬O\ÙSmH\ZŸZ&©e#0™†Œ\Ä_FvôÅ‚Á•\ç\ÄOŠŠ,BA\n.,@>›U&œ¾.\åï¢Ÿziÿ\0\å\æL\Å`B´\è¦6\ÚH\Îh\ï\Ğ`T—ı/CR|6Uñ˜Hl[Mmqm{\Zúól8†ü‹“\Æ+b\nù$\ÓP~ù	$\ruÔŒ\ç\Úg³&\Ã\æ\Ä\àÔ¼¼cVŒw¥Ş½t\Ô&\ÊO…ú\Ëx·d!ğŒf ® ¡V3+[\ÎHg\'X\ì§MA+\ÛC!\"O{Ü‚|„\Êcrl¶l«å¹±µÀ\ËH=\ÒGÀı?õ¦¾S\àr\â|W3¼0\Ä<òyš\ì\ÇÊŠ¡†gbv¿©\Ü\\1± ¹\ÕI‡8š\n\Î6#o\rfr%tŒš\ë 3‚tÄ‡\ëz\Ğy#ÙŒxsùV9ƒ•\Õ#\"Ê½n\â\ç3\Û\r\ÍÏºG”ùj\0\Åc$/.P\Ã99c\ÒÀ*·ºlr\æ÷ò€/”¡s§<É\rIL6|¬‚\âF\Z\\°\Z\å\Ş\É\İ|Û…:_\èH7‹‘~~ö–\Ó\æ\Ã\à˜¬[4À\ê\İ\Äg·\ëÿ\0WôˆNA\ä•\Çša\Z/\ÙQ\æ?3¢ül~\'\Ã\Ô$~\"²–r\Z\ê\áV;%›\×RıO»ë­Œ,\ÒÀ¹ğò¼yÁ\Ò\ã9BA:\\X\èm{[”µ¡±šqÜ*	·m\Ñ\ç\Ş\\\Â`‚.Bf\'U:\í¨:\êMÀµ;R\ïñ\æˆKˆ\Æ\Ä\ŞP\É‹v\×kG\Ë±\ëkmCóÙ‰$“rI¹\'ÔI®œ\Z¡.%¥‡•£X\ïsmÔ±\Ò\×ù\Ö\ì<nŒ\0u7\Ê\Ï]Ê¦Gtù®|»>Y×³§\çşt\âpl\ÒSv[\ß0ò\æ6\ÒıF–&\Ö‹u¬ÿ\0\r&WF\ìÀı\rh\Ü>Bf\Ü\Ø\è†ªu;\ŞÀıu\×A\É\íxÀÅ´œ\élÁ8˜H\ä¯ğ\Ì*™2\ÈuĞ«¾\Åm\Ó\Ö\æ©\âd³\âA;|€\Óğ­7ú9\'‰s0Wòÿ\01\éH<ÁÀ$‰%\á‘\Ë+ª\Â\à‚:ƒkƒøT\"…‘\no‘\Ï\İrşø\\\Ëñ™|CÀ›§\ÌSÇ³<)‹	\n3¸o´\Î\Í&`Gê¨\ë\é¦\Ã!Á”R&A-\ÆTh\ß17³Z\×ù\×\Ñ\\/ú4\åa—fû\'>q`{Œ—?´µiPYWµ©\Î\'\"E*L‹›©\×]/e½»›}(4\Í\æX\İ\Úx€U,l\ì	\ën\ÕgÚ¶-›\Òe1°š\Ã]AU\Ê\r\Æ\Ä\ÚúR;\ãd:4²\Ôb\Ô\Ò\Ã6W2\Ø\ê\Ôğêœ¥ Ó‡\ÅY|1M8‘”	<2ƒ\İ`2 __Zd\ã<§6`S\æ“ª(\Ô±=uĞ\ÛRCH¾3-˜7ŠnCùOö+o\ãLX\Ù\ä”\"±g\ËeEµÎ¦À\057$Vˆ\Ã\è‘\Öşù*[VL%›\Ã\nÖB\Ú\ÎT»\0§c–;Ÿ€\î(\×(³bÁU%\ïc\ØkmOMiw˜ˆ%hƒ\Ô1U`\Ê\rˆ\ÔW0‚£c­2ò\Â>\Z\'tc\ãÍ³J*\Şòj.Y²©?®wZµ®•¬¨ø\è=ô\İVñ>>	kOšy\Ò$lJÈªA!O¿¡9Eõı•§{?ö \éş\Än,l%a”ƒ\ĞI{e?¯ =m\ï°£a²€n¥u¾€ö±\Z\é½9òGŸˆx¹š8`%LÍ‘¨U\\Ê¾õ÷$›\rX¡\ÅûóS„\é\Ù3ó_³¸qy±XB¸y<o¤Z\î\ë”hm­†\èo~¸-\ËeV\ÃÀ\n¡:–˜\î\àõ’“½´Q  @\Şm\æL<Ç„ƒË†ˆeŒ<’T¸½\ì‹s\æ ‚n-Wp|³…\ÆÀfËˆ·\æ%\ÌL¿ £\ì\Ú\Ö:g¸¹½ˆÁ#X×º›{\Ö\ë^P\ĞH\Zò\ä‘9Ã˜\ç\Ç3I8ü\Ğ6E<­‹\ï5»€¹m©4ø.0\Ş\ìw\'RO©\ë]ø\æpşIaUu.¬\È\âL\ÍfPr³\Ø\0\äé¶‚\ã@\\Buy‹a \Ó(°@HŞº¸zŒ\ÛB\Ç(\Î(”õÆ±\í22º€A7=\Åõ\Ş÷õ¥>\Å?:V\êùs|·Ü	\Zi¦º\ÑN}Ä‰¢\ÃL®Uã­P·So[P\Ùp\ØK)V\ÎF\Ä\é˜y¬@Ô¡\ÌFÀ©™œKÒ¹ù\ì}T[GmZ’\×9M\Åô¸±#\à	·\Â\æpŒx‹A\ÃL…\Ş\ÒH‘3›1\ß`l°Òºğ,‰§3b*A˜9R	`E–\×\í\ëjÃ¹\ÓøpÏ–0I’2bX\ê\ÊN\äõ¦×¾FS*\Å|W\\ykjTÖ›u\×EWŠğNCOF¤\ånlM®	\ÖÀÓ„U*\ÎE–ù†O&—¶f[i}\0\é}\ékŠóN#\Z#ŠfV\Ã(ûtô&ã˜¬f;\ém\ì@\ê¿\Ìv½s;RI‘÷•›¦Û­xF·+²\İuD¿¤q°Hb8‡b\06IX®§\ãW%\æ¶l$øY—{2µ¬nH>kü4#½y\á˜º\"\È\0º¨[8Üo2×½\ç¾‘Â¥@\Ì\ró}£s\Ôõ\Ü}+<x\Ì\Î\0ÔŸQ¡X\n[O\ê%Aı¡_ZrdÀ\áp\é2Áo\ŞKÀ\×\Ë#SŠ62«…\ïü+\ë[‹.\Zm¡Œ}V\ÕB\Ã=­³6\"Vh\Ê\Ö=T!\n\ß?:ÏkÙ¢\â%\r“\ÃF\Ç\Ú\ï_õ[±^õpn$\à¹++\ï\Ìú\"ú\Òo\Õ›U¸7\0\ÇÀŸT¦ErCq\r&g´‹\á\çW(Î \ë•î¡µ;ıš*\çK\Zó\Çyx¦!\"\Èó’£!‰‚g[gV•®\n’-ú‡])§y%ñÙšV1$M’Q `Àj<\Û|ljØ¥dy¯e[\Ø]T•ğa9v±P2-µv\'\è\0I?²:\Ü3pş;\ZÃ™¬‹skCP¶Øˆ\Ş\ç]\Í÷‰{N\å¼&#²Gº[4\êA$\Û\×j\Î\Ç.@[)!²\Ü\Ú\à\r»€HùšP\È^	fÀñüRR0‹~ˆ¿*ñø ‚™\nŸ{UÌ¦\İA³\İõEñx”\"`ø¦Œ«\æÿ\0e\Z‚\Âd˜\Ò\' !³\Z„A…	3‹\â‰ñ\'ûÖ¸>sş\Ìm\ïlµÁ%ˆMx\İ\ÙA¥Åœ¯š\ÄİûCr/Ö¢\à\é\ä¢o\ì›j&\ØTø~\r§³³j¬\Å\í¾Tf¶¹B\Ò\âÃ¥\á3\Ï\ZÈ˜w6e,\ék\Û(¹p~Ë¨ö7\ĞSV\Z«z\ßm­¦\ÆÖ¸MM*ñ®/\ç—\'”H|\Ê-ª\æ\Ì\à\ä*ù0´\Ú:-LÜª\á¢V£ÊªEİ˜\Üô\n©\Í\èM\í¨\0\Ñ.Â®\ê;\r¯C1¸{$nY	q{+ÀXe-mv&ıÀ\ëg\Å\Îl\ÒY¤\î§R£u ^ö\Ñ@µ©Dò\ß>\ÊOfm-\âX \Ğ\í\"¬‚\àùd_-¿z6\'÷z\\Á`|7ñ™71²‹ù\Ö\İn-®— ‘¦´Z\\˜©\Äp#y¯b2„¹9X^\Ù@±7¾ªŸ\ÂK¨c7,\\šõS³i˜_jƒ\Î@*õÿ\0A&´´Y+œ\Ó;µ³jNƒ\Ş:\r´Ü»Pj=	Ÿ\àF\\F\Ékh\rò\îu6¬5µ¨5`-º£VQNZ\Ãx“¯@ ±ù\çMœFr%»eñ÷µ\È\ŞÀƒ{(o)`\íJwf\ÓöG_Ap~\êy\á<!qorm\ÎRÍ›B.¬\nöº\é½pqÍˆ!¼4]¿—µ\ã30FwTrÈ’K…$A;\r\ï\Ò\Ôo\Ú1–7(»ÀP\\o³\ìL.dŠet\Ì\n!µõ:)Ì»kk\æø÷¥\î;\Ä1\Â\Ô\Æ!ò¬gu.~Ö›Ö¨E…{\\/`mJ\Ò4B¸²*G€y\ÚVıUPmõ­’yşi1«ƒ‘cğ\ÎdB2`M\ìtNÛš\Ïx\Ê\\`×©g6ø›\Z·\È_‹a\íşñ›\ätJÌ´\Ïk>GHeU’’ª{ş¢\êß¬=k.\áxx¥D\ÂL³I&\ZG\É_\íU\Èo3*jubF¡¯ ø\Î\0O\ÄM³\rıA|E\ÆÕ‚q\Ä\Ä`\å8”²J¥¢X—5”t#Aı\Õ\\d¶j\Zf\Ø\İxµ¯C_53E–x}½\ê¿y\Í<3†•$_\ÙcXÀğ\"ğO¹˜¹\ÅX›\\1\ĞmJ­Ì³ø®\âuGš\ÆE„H¶eóg\Ïm.¤\ìu\ïs‹ó<ø˜\ÄRøyCfc\nA±=\r	V(‘—kg\ã¦eb@R:“\Úı\ë¢\ì#\ÙsÀ5¿/N÷Y»\æ¹\ä4®r\ÈI,I$\êI7$ú“¹¦®O\ÆC€C\Ä\'\\òË„ˆı£³\È{(÷AõoCKXvñ\Ø2\Æ/’6¿Š\ÚY\×E\Zùšú\0\ÖÖŸı˜r\ÛñCc±‹H\ÆQ2û )\ĞEÀu=n\rS<¾\Z{\Ğ{\ÑJ6\ëªÏ¿.Ye’LGˆ^Cšñ²\ï\ëœ†–ÚºB˜_ùÏ‘‰¸B \å\ß\Ë{õ¹?.8ƒ\"FT(\"a(F—p0\">\Í`u½…Áº\Ş®\ä`I ^ö¯\Ö\İ\è€g 4Ú‘!Ë©\Õ2òö?\Æ\áøŒ;›Ky¡ jÁVî¾ £b üUøgñó’\år•\Ô!k\æ6:rG`\rı)\ÒñÆ“E—<G\ÄO[_2›ôeV\çÚ”¸\×\rŒMù³h˜‚¤‹•V±±\æPlGu5a\Ì.m\Ø\ßËŸ¯\İV×µ\Ôk]¿K÷\Ã\Ìq2\Äl\å2‡\'•ˆ¾N\Ú^÷;Š¯ƒÃ¼¬5\Ì\ßpõ\' £|•¿)\Ä610\0Š\Ä˜2\é\î(\0–\Ô][)\ZŞ`0qğ\ìs\à±*¯Ê†9eOz\ê]\rÿ\06YYomAª™(\ÑñoJ\Â\Î\'d»Áx¬\Ü?XfË•†…]	\Ê\ãİ¾[f‚\r­ZG1óf°ˆ™ÁUŠ+yÃ¶€6 \Ø\Û^ %ó\Æ>)\äÇ•\äG9\æF-A\åU@3¡sH@¹P\ÍØ‹\à|\\aq\Ë\á\çDZö`XX¸:Œö\Úútõ¦\è\ï@ñ^Hœ„\èSo–|ø81`2He”81\ÊîŒ‹v\Z([…\n{z@¸¯\0Á†Á¼qŒkHÍ™-q $5\ÈÌ»YE·½\Êò÷‡\0’tÆ‰°XÍ‡”+1÷Q£m33}m{T\å^R¡^@J¨>\âŸw]\ÇM{Xd—º×¯\ÌY\×{Ú¯]øl´µ™\è{\à`\âğ™U¼4PM»/½sb\Â\àün)«ñH\áB\ì17!v—\ÛM´¹©,ª\Z±¹¶q\ÕmbrlH\"\Ú4£|¼í£‘\"e,¾\Zß¨÷\ï·K\ZÉ†{X\ï\å]3\\Fˆûs\ÒJ\ê­h\ÑX1ò›€X\ÛK€vR§>ñ¨ñx¯-QP k{\Ö$“ğ»[\åC¸\Ã+D$\n4–òß½\ÍS]%Hei±¸Xr\Û)P§¾f?\"mM>\Åğa¸„\ä\ê\Øu+§»r\Ùn_u©V9-0lù\nF2°÷”´–\Ì-­ÆŸun\\‡\Â0øxB@¨$F!€ó´…s¹6”\Ø54\ÓY\ç=rşg2‚2´¨N\á\ÖÀü\\ğ­‡cTx\È’«!«/GõD†ª’0öÒ“”\Úù“ğ“‡®\èI\È\İ\í¸?¬6?^µR=\î+d\çZH’Etf…\Ş\ê\×\ÕK±¶\à“k\î;\ëY—\à2\áœ+«#\ì­ñ\'E>†»›\Ú_\äÍ£\Çş¿\ÊÅ‹\Ã2?‡\ì¸`x\0™se\Ã\â,\ë	r¦\×\Ş{[~º\n=\';\Í\Ãğ\ïÃ¢hde\Õq0›ùNƒ2\ê—\é|»\êY§™x$\Âò0\ê¾~|£õA\íYûÇlICbV\ä¶=*\r\Â\Ó#6\ÍcŸK\ä¢üPÁ:Ö§’Mv¾¤’N¤\Í\ÃñvX\Äb\Ë\æ\Î\Ì=\ç6²\æ¿E¬f&úX®#—‘ˆ\Ê|1kbÄ‘\×\ÌÛŸKÂ¸Q\Å-Ÿ\Â%Eš\åX)\îVÖ¨\Ë\Ûñ4|Ô£7ü.\n\Ìü\Ìşj³]\Îa(7\Ğ)1®š;ô¡\\C‰,‹‡:©W:eo1*jÍ”÷\Ê=ißœ¸¦/††#„\ìL™ó°\"÷\È2ƒ{\îiFZo¶\ê?døÚ£SJ59%†>!x\å>8px\Èq ›#yıQ…›ã¡¸À­+\Ûø|W\ä\ÒG*™\0%²›•S¸6\Ø\æQkş±\ëª<*8õ1\î\Úı\Û}\Ô\ç\Ë~øy0\Ì\0m\ïmMöoR§\îµK…t\0O \Ğ`n?—ç‚Œ8¦\ÌLL\Ü\İöH\0TX~>§¹ª\î(†7\È\ìŒ,\ÊlG­\á²\Íù\É\ØjÚŸ\Ú\ì=+¥‰\ÅA…ˆt\à9û\æ³Á“>‡Ï¢Àx(c\ãJ†§Ak–\Ö×¶ùG^ôû\rñ‡\åEğ\Ğ.¨Ú±¾Š\rÂ\×]µ?\n<29\'É’\ÎO‘”¹C\r_[\Æ\Â\çPv\Zµ£p¾ˆ¦$\Õ\"6,·\\òdm\rÅ–\×\Ó]M\É>E\Ùñ//vƒ‡//\Ú\î±7(Y÷	‹:\æR\\“\Ó\ßöP7°#¦¨oĞšk\àœ\Ş&ƒ1K¬‹ˆŒ\æ\ÅÀ\Ñ\ì\n8¸-­‰\Zl+™xDXO#27Ø°W+)\êFšeß­õµv“J\ár_n·\"Ê£¡õ:\Ş\İ\ê\á\Ş	n\ÔÌ E/ó¼QF\é:\"\ßK“®€\ê}T\Òğ«\Üzù\Ğ\ÂüO›üUF\Õ\Ôcr´›6‡ˆ1)\"—e1N\åE­®O0\Z‹‹i·­}E„Ãª_*€M‹7 *\Ü÷9T€óôùC`K\èŠÄ“m³1ÿ\05»òô.°(—ß»_[\îÄz\èw¦P‰Ğh“$>\Ş¬¤öE?ÿ\0õ¢õ\Ï\nº20º°*GpE\İIó‡Y£€\Ê\Â\Ä\ZHãœºQ™Ÿó¸fK\"\ä\éq·\ÏO–”Á\ÉØ¦l*$„™!-„\îZ([÷‚‡Œ+\×8 l%N \ÄÀüª¤ˆ?Ïš›Z²Lw(4€É†bê„§„\í\æL½‰¶]n¶û\Òô˜f²È¬Ù\ïŞµV\à™–\ÊHÜ¯\Ù\'¹ª|cò…F\Øuš%\ÒFep\Ø\ë¨\ØnI­x~\Ô\Åa¼2\í\ç\Ç\ëû5“\ÙğÏ«S\é\ï\Ég@Sş77ŠB\Ï\á#\Zä¿„»tÜŸ¾©\ã°\\<\â—¢HË­ó«ùAº‹epF\î/\Û\äjò`®øHøŒ„ \Ê\È\Ë}-µÁ\\\Ú4\ì{\Z¿\Ú\Ø|FSU@\î.¬E^¢º,\Ğöl\Ğ\æ{lz\r\×5ËŒ\â\æV³“\r_\"®Ar\rÀ&‘H­\Ã^TxÓ‰gDº8Ø€4:–½½v¡\Ü;`]$“ÇšAb\ë¢%\ïal\İ;õ^\âµ°\Øfu\Ûa©\ß{\Ë\ïrR\Åvtø‡‚4ó:-ığ	&QD8G\Ä+x\Éh”\rd“Ê¶:lwü=iƒ–ø®hel6,\é˜şq³\r¬\Ì/µ›P\ãpEW’LTøG‡.\r³X BB\è.7\ê¸¸6b»nI&P\ãzŸ¦\ßu~²Y{\ìô\Ó\×²\á\Äğ\ë„\"y±\Ç\Î÷€¶¬‚\Äƒ[u\éDø*ÉŒ&…Œq€?:E®7+cş°\İ-¸4\Ã\ìÛ—\"“‡šPÏ˜U†\n.B\ëa›\Êı,\r\ì+@U\0\0€\Ø\n\å¶9Ù¤6}út¢d\rÀ—ğü6…sİ¬<Í«\È\çE\Ìw¶c°\Ğ\éWøfÃ‰\ê@ó¹c©$õ7;\Õ^\"ş..:F¾3ı\ëßš\ã\ĞW>sã«ƒÂ¼­¹²-·%»|\0\'\åZÀ­%g\Ü\İ¸ŒSº\0Q|©¯A\×\æI?1@%\áS\0Ç¿fnrƒo0ùUş\Ì0K \ìN¢\Ús÷T’I\Ã\Æ\âü¦K–X­òy|º[q¥R^5‡\'ıhş«\ÅkA\áQx’-ÆŠ?´\Şfş\Ó\Z5\Ä02ğ£.\ÖU9\à±\0kn\æ„.Ü‡YpÏ’\Íp‹°³\0`3w7­\0\0\0°\nÀæ…—;ı\Ä¸Q*ŠjT©R„%9&ü—ˆH§Hñˆ%^\Ş,ARAû\Ñød~Ãš·\Æ1Š\Øy…÷¿S8c0\Åbx\ØIŸ¢\à¯ue%H:X\Ö?/8bp\ìa\Æ\á\İXhÌ€•øu\ëzh[zaÅ«–>!á·¢“ôÖø>–Š2›¨\Öşšıõ\ëÎ¬\Ê\Ê`‚\Ò\İE¨¤\'·\áP\È™\ìEÀ6ø^¨ÿ\0\Ù/‰\âˆÂ¾—e,/k\Ûco´~¦³\á\í:x¼’`g6\Ó4c0 lzZ\ã¡Úº\Å\í~?·†\Å\'©ˆ[\îkı\Õ\Ë-£YVkt\ï†\ä¼4n\îˆA{\æóµ\Ô)\Òû\0[\Ğv®srœ•c™µ&ö°\êO\ÙPp-J\Ñ{bÀı©O¬oü«’{PÀ\É‰K•;\Ütõ•»J~.a6/Œ•o\ØøW_¤zW.\ÌøwU\"T¹\0\Û0¾İ¨¼<B6Ùø\Z\ê\r6YU>FP¼?\n;B¿…\ÍIü¿\Æ<2¡6\È\Ò\'õ%uÿ\0\r\n\ç.ta¤·\çdBú\ç*‘ğ½şT\é\ß)\â|_\Ê1gı¼Í“ÿ\0J/\Í\ÆG£e/û\Õ\ã™\ÌÁT\èv¹ÿ\0/\ãT¸^!a†(Sh\ÑP~\èøWT¹7;MBq½‡#X“\é@ø¯‚(epK!Oø–[|\ïNÒ§<áŒ°,A²–pn?Tƒı\ë}ô\Ò_œ\Zˆ·m‰4o†\â’LD>a”8$út|\ß(ù\Ò:r4\0c\Æ!ôb\ãñ½1û9\àx\ÈñE¥h\äAdpº\Û0,­\î\î­\Zô„-[‡C’$^\Ê/ñ\ë÷Õš•*)©R¥J¥\ã\\#2<jB‚s¨s…¯G™Jˆ#\ëB\ÍüL…–CMLIŒxw\Òúj\Û\éÛ¥µ&¸¦&^˜–µ\ÄVñ\'+\á$ó¯•ş\éN~EÂŸ÷£ÿ\0q\Ï÷‰§hJ\ÍxyÄŒ@–_)B2\Ü›5ÿ\0º)ÁùEzôSøŠü\á¼>.\ç)6•Móe\İ¶ }ş·¢ƒ\Ç\ÜW6qs{­1™2\é²7&©\ì~*¿À\n? \Ä\Şô7\Æ=~·§Æ£\î+\Ğ\â\É\ÜU5)ÜœBÄ¹\Ï.>\ÄiFe\ÉkØ±U]uf¾ºU¸¶hÏ¦qo˜§Oiœ¹\'\Æa›k\Å–7\0\è\é–\×\ëv½“q£\ì9ø\Ïø\Åu!6Á­¬¯Ü¥¹ñ8‰$eƒ–3¨\Ì5\ÎúµúşõyÁ@‘N²Jó\Ï*0ûÁu\Ô\Û`]\èôœ›‹Aş©\É\ì\Ğ\ß\ï¨\×.òY\\,øŒB…˜²ªŒ¹JÙ-®· €=/úUbŠ\ïÀ±À’\ìt\é\ë\Ü\Ó\nc“¸¥”\à@®E¾–ƒ\È6’ô\ÒLrb”õ qóbcNŠ>ı\Ï\ÜV«`ğø©™†@n\Ç\Ğj\n¯œ\Í0”‚¨mwµ\0ú… |¨BjY¬§Zf\äˆ-~²H\ÍòAı\ÚNÅ¸	\ë¿Ò´n\r†ğ\á?\ÑE\ãm~úE5z¥J”¥J•(B•*T¡\nœ\rb\ËÙ¿G\ã]XĞ;H’1²¸*O@WQõı*¢óN\í*}EUù\ãZ\á\Ñdh\Ê\Ê|\Ë\Ø\Æún4¸¬şÏ±@ù1\Ì=Iø\Úôõ†\âĞ»(ñœ\Ã/˜jI¶÷£vx³:\í\\\É2ŠY$œ\ÄW\İ\Ä\Âß´®ömUß—øºı¬3|3ƒ÷·ğ­‹ ¯&!Tw.\éôS\ï‚\ÌyC\âP*dt%\\K\0F›î•§-p\Å\Ä\0±y·ñ¯\È\æ³mT„aY4¿k\áñş/\àP\n4\ÒR\æ#‰v\ØL÷ÿ\0˜h\n´	Nÿ\0Jó+\Õxx¬\íW–\Å\Æ\Æ\Ê\à“M%ÇŒ\âXY\\±R¨;“Iñ\Æ\r˜\Å*›\Ú\Äh-Òs¶.\Ù\"E?şWúŠ\Ãq%W[[\ÔP„w—x \Ä\â\"‹Ï«†R4¸¸¹\×jÛ°\ÌJ‚\ÂÄGc\ÔVw\ì\ë…0³Kr­1´l«”‹?h^´…¤S_µ*T¤…*T©B©R¥AyÃ„®\'\nñ»dµ˜7b?˜$|\ë\ç¼^\Ø~OŠ`	\Ô]Z\İA°|\ë\éœT!Ñ\ìÀ¨¬§6!‡„•!‹Dª\×\ZV\×ø\ÓY¤\è\"–9Ä£\Å\"È¡\ÑlJÀ5À6¶\İkdÀsşe\r¨A\é˜f„n\r/Í˜üDş¬ò ûÂ²®)\ÊJÀM…‰$\Ã$\à<w\×-\ÛF\"\Í}Ef\ÄDDšVD\ê\ák\èhù¡_¾º¯2/zùº>MÆcTX\çˆşz\ì\Ü‹G²b´ıcı\Òk/ğü¤÷õW÷œÚ¾„\âü\Æ”`Q™Kmuô¸¤yû`NŸ…ÿ\0•fr§q\á2b\Èm(\â÷\îH\Û\ãMœ’eu\Ìx‚‡ıœK\\YƒÈ¶:V¬;,j™H;\nMXin4–QŞ`8ºK\Â\æb@ñ§pŠw>|\Ûz(\'\åJk\Éğ<˜™X~¶G\Ùwü(\×%r\Æ/<«ˆ\ÈLi•‹‘ÀÊ¾l°\Ø|MiT¡r`’\ÛWN€Ec3{±‹ü\í§\Ó¥\\\0—!½\íkõª|\Ó.HD\ÙK{\Äko\çşBšœV=\åh\çŞ²’\Øi§aeùUf\á\ÒhH$¨\î@üMZÀó62\äœjnAQ©;\Óo*ñ^1Ä’EH\Øy½ÛµˆAµˆ\Î@\éß¥Z?À,\Ç@¢\â m®ık\İE5*T©B©R¥R¥J”!JA\ç\Ì9†eœ{’ù_\ÑÀ\Ğşò‹~\ï­?U.3\Ã#\Ä\ÂğJ.,m¸\ê==À¡,lp\ïUÓ—$\Å\Îe\ÃMRøvq$+\"H\Ò\á¶\"\ãP/J\É\ËØ»¶Q*¤€\â0Ë¦„\Üô\éWywˆÍ‚\ÅG4³\Ê#Cù\Ä|<ƒ2A\×/Mş Rfi	ƒE\År;\ÇÂ¥ı¨YOöU?ûŒô\í\àb&û\Íj\Ó0ü\í‡quu#¸5e9¦ö…s;\Æm~‹NWòõY \áxô:\à8‚ø\\H7öH \Õ\Ì\n¼v\ÅA$rfb<VV”©bAfPÔš[\æuU\æ\Úµ\íÃ‰\Ó\Ìc:…\ß+­º\Øş&®‚V\ç\Ük\çù*5Õ¨Jg\ÃöK/ÀšjötR\Ë$\çP\×&\ç\Ê‘¬\Ş>n‹ô­ñ\ÃÊœ\Ã\å1º¸\"ömz+ ³£¼\Ëx9g•›\Ş9”mlıú–$\nÏ±ó´X‚\rö;J|ö‘\Â\å\ÄL&ˆ	\r`É©`şşl½W+¨¸\Ôk\Òô™„\ÅX…üŸ\Ä,t\ÊÚ“ğ*\ZHTpørî¨¢\ä›\n\ŞxX0\é\ÜY‰õ7ğ¥\Ë_“\Ë\"u\r€K\æevtE\Â\Æ\å\Æ\ÛV‹5\î¥J”¥J•(B•*T¡\nT©R„)R¥J–y›’\á\Å /ÿ\0\ïbvFkm›/½ó½%c¹C‰C\îq,FQ\Õ\ì\ã\çp~ú\Ö\êP…óŒü’\ês´G\åg\Ã\ÈK±Ü©òOOº¼?.H‡ı_ÿ\0lH£ú…}6\ßEo\ÚP\Z\äxt{û: Ò¨–\"uj±¯­\×\Î3a]?ó¸˜ÿ\0õ°rõ\Ë^c™‡ô®¯P@\\Ã¨9¶½}\ZxZôg?\æ*®\'€#‹6Vı´Vük?rñı?oÒ·¼o?¿\í`¸\\P\Æ\0\Ç8Söf„ H¬ıo\Ø÷¿&Ho™1\\9\Èı(\æŠO•…¯ô­¹9>#H“1¹Èn{ºA¤\äbKgò5·[†ú\Z\ÚÇ’5³¸\n\ï³\ÕVÂ¬ùƒI%\Ã0bn\ß.ş‡ş­V°8l0\ÆJÊ€MğĞ€±–am³(=I¡\Ü€\â0Œ|!ù²ncòe¸9\î>4w…DX\ÈÁ@b\ä³|”w¾Ê£·–¤’´\è\Í,d`\Z\çK\ÚŞ¦ş¨y,,+\ÕR¥J”!J•*P…ÿ\Ù');
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reviews`
--

DROP TABLE IF EXISTS `reviews`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reviews` (
  `ReviewID` int NOT NULL AUTO_INCREMENT,
  `ProductID` int NOT NULL,
  `UserID` int NOT NULL,
  `Rating` int NOT NULL,
  `Comment` text,
  `ReviewDate` date NOT NULL,
  `OrderDetailsID` int NOT NULL,
  PRIMARY KEY (`ReviewID`),
  KEY `reviews_ibfk_3_idx` (`OrderDetailsID`),
  KEY `reviews_ibfk_1` (`ProductID`),
  KEY `reviews_ibfk_2` (`UserID`),
  CONSTRAINT `reviews_ibfk_1` FOREIGN KEY (`ProductID`) REFERENCES `product` (`ProductID`),
  CONSTRAINT `reviews_ibfk_2` FOREIGN KEY (`UserID`) REFERENCES `user` (`UserID`),
  CONSTRAINT `reviews_ibfk_3` FOREIGN KEY (`OrderDetailsID`) REFERENCES `orderdetails` (`OrderDetailID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reviews`
--

LOCK TABLES `reviews` WRITE;
/*!40000 ALTER TABLE `reviews` DISABLE KEYS */;
INSERT INTO `reviews` VALUES (1,2,5,5,'Good Quality','2024-06-01',1),(2,2,5,5,'good','2024-05-30',2);
/*!40000 ALTER TABLE `reviews` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `UserID` int NOT NULL AUTO_INCREMENT,
  `FirstName` varchar(50) NOT NULL,
  `LastName` varchar(50) NOT NULL,
  `Username` varchar(50) NOT NULL,
  `Email` varchar(100) NOT NULL,
  `Password` varchar(100) NOT NULL,
  `Address` varchar(255) DEFAULT NULL,
  `Phone` varchar(20) DEFAULT NULL,
  `UserType` varchar(20) NOT NULL,
  `SecurityQuestion` varchar(255) NOT NULL,
  `SecurityAnswer` varchar(255) NOT NULL,
  PRIMARY KEY (`UserID`),
  UNIQUE KEY `Username_UNIQUE` (`Username`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (3,'Abdur','Rafay','AbdurRafay','AbdurRafay@gmail.com','Rafay999+','Rawalpindi,Punjab','05643728123','Admin','Your Favorite Sports Team?','Islamabad United'),(4,'Huzaifa','Ahmed','HuzaifaAhmed','huzaifaahmed5549@gmail.com','H1u2Z3a4I5.','F17,Islamabad','03302130954','Admin','Your Childhood Friend\'s Name?','Ali'),(5,'Huzaifa','Ahmed','huzaifaa','huzaifaahmed5549@gmail.com','H1u2Z3a4I5.','House 1024,F17,Islamabad','03302130954','Customer','Your Childhood Friend\'s Name?','Ali'),(6,'Abdul Sami','Shaikh','abdulsamishaikh9','abdulsamishaikh9@gmail.com','Sami1234!','G-15','03348935483','Customer','Your First School\'s Name?	','R'),(7,'Abdur','Rafay','rafay','rafay@gmail.com','Rafay12345@','islamabad','12345678910','Customer','Your Childhood Friend\'s Name?','Hamza'),(8,'Ali','Samoo','alihonyar','ali@gmail.com','Ali123!.','Naval colony, Karachi','02341030403','Customer','Your Childhood Friend\'s Name?','Huzaifa');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wishlist`
--

DROP TABLE IF EXISTS `wishlist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wishlist` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `product_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `product_id` (`product_id`),
  CONSTRAINT `wishlist_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`UserID`) ON DELETE CASCADE,
  CONSTRAINT `wishlist_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `product` (`ProductID`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wishlist`
--

LOCK TABLES `wishlist` WRITE;
/*!40000 ALTER TABLE `wishlist` DISABLE KEYS */;
INSERT INTO `wishlist` VALUES (1,5,3),(6,8,5),(7,5,5),(9,5,4);
/*!40000 ALTER TABLE `wishlist` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-06-05 12:01:42
