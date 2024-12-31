CREATE DATABASE  IF NOT EXISTS `e-commerce` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `e-commerce`;
-- MySQL dump 10.13  Distrib 8.0.38, for Win64 (x86_64)
--
-- Host: localhost    Database: e-commerce
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
INSERT INTO `category` VALUES (2,'Men\'s Fashion'),(6,'Women\'s Fashion');
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
  KEY `product_ibfk_1_idx` (`CategoryID`),
  CONSTRAINT `categoryId` FOREIGN KEY (`CategoryID`) REFERENCES `sub_category` (`sub_categoryID`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (6,'Red Nike Shoes','High quality	',5000.00,50,1,_binary 'ÿ\Øÿ\à\0JFIF\0\0\0\0\0\0ÿ\Û\0„\0		\n\n	\r\r\r \"\" $(4,$&1\'-=-157:::#+?D?8C49:7\n\n\n\r\r\Z\Z7%%77777777777777777777777777777777777777777777777777ÿÀ\0\0”\0\Í\0ÿ\Ä\0\0\0\0\0\0\0\0\0\0\0\0\0\0ÿ\Ä\0;\0	\0\0\0\0\0\0!1AQ\"2aq#B‘3R¡±Á\Ñğb\áCDc‚’ñÿ\Ä\0\0\0\0\0\0\0\0\0\0\0\0ÿ\Ä\02\0\0\0\0\0\0!1A\"Qa‘2q¡B±\Ñğ3Á\áñ#ÿ\Ú\0\0\0?\0\á×š~	Q‘“C²€h\0¬€@FÊ”Pƒ<¨2J#mÁÔ¡rZ5PÀN\ê©QYB‘C\"*”EQA( \Z„P\r „dÁP˜¨A€@\0Y\0ôbJ\á\0Â„$„\rµ\Zy 9\ÜGˆc¢\05»¼ı<—\\(Xø›\ÖzÌ”œiû›|6i&¤\Ó}¡m\Ê\×ex\åÆùYT\\ûe\îZN\äEˆªP¤J¨¤P €H @4 Á@0 Á T1\Z\0@; \È\Ú\İwPŒ˜²\ähj Sá²ºös†Añş²˜\æh\àõ+½4ŸÏ¹ÆŒ§Å²\ï>1%\ä\íh,\éYcİµ\×=	ŸcG8Á›$v½µrdôb\ÊT\Í„)¤\\L¤U(\r\0\Ğ@\r\0!tt&Õ‰ „€„.¥§š®¦\ZZfgwˆ\ão™ş_\Ğ,«‹”’9µš…§¦V?Â³qºlÏôówƒGg-úw¬?‡š\îtp|\Ä}Y7Ÿùşts\ÖT\áõRRÖ¶\ÒG£šH\'\æ4Z\'Jğz4z£|¾Q¬\â\Z£WF&‘.¿\ŞYS\ä\ãõ}C½GgK¿\Ì\Ñ\ßE\Ğxğuø#‹¢€»^\ï\è¹n\éŸ[¡nPƒ#¢Œwµü—\èõ\ä…m½¬cÙ\Å\ï•H\Ï\Ã6˜6[\nP¤\\\Ä)!dŒ…d(\Ğ A$ …6¨FH!„(Bº|jl/dÔ¯dR\ÂHl’38\Ôr´¸¿BWf–ñ6|ÿ\0«\Ü\ì^\ÎÜ¤òñÙ´©\ã\ÜNJY#|0\É(k»\nŠwe1\0	\Ê\àA½µò$.ÿ\0nx{pş©Ÿ4\á^\ä°\×Ñ¯ùGŸ9•\Ê÷ä»œ\âN€j¸\ß\Ô\íQ±¯…GOQnğ§B‚øWk\\ÿ\0SøeU\Ék\Z\á\Ê\Î54rK\Ó\ï|¥û££Á›Ø˜\ëf\Ä.{_\ÂÏ¢\Ñ-Š1}; –(\á\ì\"91“³¬l\Ê\Ó\Û\É\éF\È\ÊN)\å¬gõ\èÏ‰¬’/-G\î´4nL\Ñ\ÖSšy\Ü\ŞGP·E\å”¬¦;•2\"U(®€.€e\0‚a\0€H\0\Â\Æ\ì±1cBjOpŠ7<\ì%—ƒ]“P‹“9jÊªš·ö® ¹YwF*\É\êu\ß-\í~Fµ\ÓKš\Îqo Y\át®³8“Áto‘lŒ–ú\ê\ê5ÁºœZ’–L±#\ÜüÖ¼\à\íR“\ëÉ™\ë\âÅ®Vc£ªª\Ûòn8{\n©¯Å¢¢§m\ä™\ÙZ\ëh\Ñ\Í\Ç\Ğ,[v5t¹-,em#«\âzˆ]‹º†Ş—`¥‹òø™.¿\Écs[ğºF~›	{\äÿ\0\Ş\çú”\ÒKa\Ş$·m—+g¦“f..C²\0.ëŸ’\ÙR\Ü\Ş\r‹®Md¬tN-x-p\Ö\Åf\ÓO\'’—•‘I+#\"\0 @1¢\İ\0 \0€acvX‘’²“`PŒ\ÕñL‘1­}ƒnrX¸òÎ‹~</«§(¨§\Öxò\ÍÀF,ñ y®¸]]‰WÄ³ù•66“œM€lwUš\ãü[ø‰\æL\Í\ï`,rOm¹n]´Ù²_¸A\Ö\×\Ô-s#¾„öòf@M‰µ\Úã«®l¹3²¼cƒ\Ôx\Z6\àü1Šq\rCLu)p¶œ\Èõu‡üV\Ú\"\áXqz”ÿ\0‰º½,zóş}\Ã6ªHCKİÛ¸«“s\ÜuñÙ”\ÜHdi-vSo\ë^M\êõ„Ì˜[-v)$7/¸\Ïmrù|/¯š\ì\ÓS\Îß¹¶v¥7\Ñ\Õñ\î\r6ERÖ,dF\â9‚·kà°¤xŞ—«•º‰\Ç\Ã\ä\à$6\ÏGĞ¢ƒª¥\0€@$\0*€cV$,\ÂY›e\Î-\İ\Ğ\ãk•c&h¾\Ø\Õ\Éÿ\0\Ù\Ê\Ë¨’W\Ê$y<ö>Kµ=«>M\Ó9[)\ÊY·\éô(|®\É ,ói\ÑeÙ¢sQ{$°E\Í\0µ¯°o\'º$\Û\áıË£Œ>O®\Ñb\å„tB¼Ë³/³xû\\¢û5+S—\È\ëPkñ›\Î\Âf\ÇqH0\ÚYr9\ç6w†¹#\Éc¹KÉ¶\İDh©Í¼¥\×\æzÒe=†põ7²lc;š5\î·Fƒñ¹õ£T\Ôb 7\Ñ\ë÷­¢\Î?»\ï\íÿ\0\'—\Ë8l¡¤´\ß\Â@ü=W2YG¯;–\Öeµ¡Ë˜\æ­u²0j#™ş®jğ¹:+‹ò\ÏJú=\á\×QEõ\êÁ\í^./\Éz´Ôª\Ôò=S^šU@_IU\Í4°\Ò4\êùˆ\è\Íqk\'ğ\à\Û\èT½\îÏ’ş§›Ê¸õ)*P@\0\Ê \Z¥B¨	€ &\ÕX9(Fs˜ó›5VNÕ£.…\Å\Ûy\0»(XO“õi{—l\İú\çöKú˜A‰—\íG;u·“daI1Á\Îl±¸Hº\á¨G\Ñ`Ôš”^~„\Î\Ğ\æ\Ì2\ßAµ”O{¹ğo8o\rm~%I‡N\áÖ¥l\Ä_);i¥õ\Ó\â°_ğu±L¥(\å¯ú-ªÃ¦Ã±7\Ñ\ÔD\èfc²E\î¿.·Z¥¾\Ù\ÛS„Ò²??\ß\ä\Ïb\àf„>«ŒEWP\Ğ\é\\\ïò£\Z€zu?\Ùwi«u\Å\Éö|\ï¨\êV¦\Õ\n\×\Íü\Ï,\âb|_® :ÒŸcÈµƒ\Â/\éø\İp\Û=ò\Ş}¯\á\éM\ï“_	|\rŠg74\î‰„_-ı\ï\Ø+óõ7ÁK¹\çp©s†#‰]\Ïq\Ígu=|×©E\n/³\Î\×ú†Å²¾1‹R\á8s\Ü\â\0(o2¶[8\Â;ŸG‰¥¢\Í]Ø,ò\\N¾lB®J‰É»´\r¾‡m\ÉeŸ¥\Ó\ÃOZ„~ÿ\03]!\Õb’´\0€¡APA ‚Œ6¨@œ?\êòöe¡ùR\ãatOM:‡%\\¶÷‡ƒ™ÿ\0lo{6w‡˜só]›ø\á*´iI\ÊR\Ë0å—³“$€<_G\ìBØ¹8\ì\Ù\í’È¥º1·i\Ô<\rP’Üº_©lš\àKn\Î|\É\n>µf/®\r\Æ3\à©\ïe#deÏ…\Í7’\æokÏ“Ô„\à\á\áŸEa•”˜\Í.&!\Å\ì? .Œó\Üj½XmšRG\È\Û]”NUK+ü\ïõ4?I˜\È\ÂøyÔ­«\ï5\Ô7\Ş?ø­z›6C\êvú^Ÿİ¿>#ıO\Ív	&h\"öc-\â?°^rŠ\\£\ë3¿³µ\à\Şs1OW;P6ó^¦š…º]V»]±l‰\×â¸¥6Mw>\ÖÑ¬¸ô]Y\Z\ãºG§\Ó]¬·lO9Å±9±\Z‡M;´÷XÄ¾ù],³\î´Z\Zô•\í~_\ÌÖ½\ËJGiIT	\0 \0€’  @H$\n_Œ5’Ásš\æ\ïc\Én§+“\Èõ(\ÆXMš)»V?\Ø9\Ï\îº\Ïg\ÏÚ§|$D®Œi®\ço¥\Õx1\ß(>aÉ“”\Òµ½V\èt\×7?\Å¥„˜µqeƒ\äÜ¢\ãø|–Br’H\î}¶XO\ë\áò¸7øb8œ0ª¬Œ~¯…ı\æ;r*B\É\×øEúJ58\ß\Úû˜x¥}V9ˆ:zù\Üù\İ^Mƒ\Z<º\Õ]Òœ³&e\n+©{pXFûƒp#ŠUŠ¹XE,ZB\Çt¿IN^ùú\íJ¢½±\ì\ì1Œ^—\n§iÍ™\ÛG\×]\×F¥–xúMš\Ûpºò\Ï>®¯š¶wM;\És¹_@:\â[l­–\éq¥\Ò×¦¯ekóú˜nuÖ¼$	T@\0 •(!\0 \Z…\nXĞ±d+¨¨6\Í\Õ\çğ[!^yg.£R«X]š¹\Üç¸’·¥ƒÄ¶R›\Ë)\Ê\ß45(\à“AÍ¨\×K!š‹2r9[œÖ¶—ƒr\Ëì˜€\î\Z§óE†ÿ\0\Ïe¾Q|Q†´‚C‰\Ü.°“O—Á¶\Û\Ö½‘±×¶\\»]0ğG\'•Á›…a³bUÌ¡‡w\Ù\Ó;î‹ªš\\\å·\îk²\Å\\’=2º²“†pv\ÆÆ#FV0s6^µ¶F˜=UVz†£¿¢<Ê¶ªZ¹\ß4\ï\Ì÷w\Û\È/ssy‘özjaL Š.±:²P(€\0€J™\0B\Ê ˆO8Œ7[a,\á\Ôjvğ{¤\ÌE°ò¥=Ì»š‚©\è“cû\ÚtS8*Š.dw\éñ\Ú\ë\\¤nŒ2‰–´4\ìV	¼™\í\ã¡f\rµ³7¡\Z\É7m&ùI\Õ\Ä\ÖÚ¨£ò2•\ìQ;6Y^\Ü\à}“ñ¿öü\Ö\È\ÇœûŸ‘\ê!„Å€\á.®¯!²¿¾÷¿—’õ\é­U{}/¨j]ö*«\è\á8ƒ“ÄŸR\âD[DŞ^]÷{²Ïƒ\èı?K5J+¿&´º\ëIè¡‚¡]\n††@€\0PJ™ $5ƒ\Ş$.JrR¶(¦h\ä\ÈH$°_\Ãüº\Ù	Cõ8nvy|e¥\î¾G8\ì·p)fO¢˜\Zs\Ò\ë¢lÏ‚\ÆG\î›|™š‡‚Ö·K\ß.¢\áko&Ô‹\Æ[^\ŞDhV·dd±\ÉS\İ \êj\É)#	85Ÿ\Ü\Æ| \é}Ç\Z­‘Mœ¶Y\Ğ\ÙcƒfÒ a¿ıˆü‚Ø—ƒTc&òø;¾\áw™‰bÀ\rcŒ\ì\Õ\èiô\Øø¥\ÙÉ­\×*\Ö\Ê\Êx\ï‰\Û]—¡°n²8{Ç¢Ó¬\Ônø\"g\éZ\'şöw\à\ãAó\\\ĞE“\r\Ñd\Â’Q…!A\0 \0 \Z\È\Èhpm\Ñ³µšşŞº6\Ù=Ñ·rÑ˜’\ÏfOœ–¦\È?‰n)”Œ\Í\æn/²²-rğZ18dÕºõj\Ã\Ûkğ›–²\r|°dNl‚Ü¯uv¿!j ú\"ú\ØY©6¾ºl²Ql\ÂZˆG³LF+÷\éa\ÑUY¢Z\Ø\'Á®\Í6ŒŒú¿²ª¼\Zÿ\0‹”øHa­&ïœ—}È…\Ï\Ïo\ÍeÁ1)ù7^	ˆV)\á4°»w¸\ê~\'ÿ\0\êè\äŠ\ç]+–v8V„`\íªdk\æ\Z—¼\íè»«¦ºW=œj\ì·\á¬\Òñ\ÉV\ÃK@rFGyãŸ¢\ç\Ôj›ø`n\Òè¢û9g+\ç@¸0{jm–2\ëo†KÚ¡\ÑL6¤Hh†C\n2 B‚\0P•( ¾šóU\Ö95U1d»%-\'be±/‘óºš\Ü%É‹;)&A™\ßŸ\Íg–pN˜È¥´úø<²„\Ï\Ğ\×\ìIu\"\ÖQ9\Ş\æyô²\Ë\ä=Ÿ›2\áÁ\ëà¡‘\Ãı\Ç\ÒÊª\æúCÛŠ\íş\æm?W	d0ùó[\Æ7S&\Æ.\Z¥gz¾ºş@\ÙlZhÿ\03#\ÔEt²fE>…6ñ1¯p÷«4ê¯¤a+/Ÿ\\#\ãS«)\Z\Z9Yc=Kğkö£Ÿ‰š\nœFª½×šRGİº\ãœ\å.\Ù\ÛLcü¨Œq¸ò+VpzªL\ÈdEFÎ¸R\Ë\Ù”:£^T6¨“ğB\àv@%\0(\0*Q \Z Vº¦,Äª mF¹ˆ>J¦\ÑÁ©\ĞFş[Áˆp™\Ú}œ\äz¬÷ı=ú=«ğY÷\Ô+š{²\Æ}AY)\Ç\äk~™¬_\Í_X“6’?+/wÿ\0KÔ¾ö—\âÀXNÏ™Wø†?\Ò./»1G«hôc\ï¶d½ßšû6T\ê\Z¹5}c¾\rı\Ô÷_\ÈØ½\Z~gûr#iûJ‰ñc3^‰\æ›e¬Â©YÈ»Ô¬\\\Ù\ÓI\ÓG\ÆK\ÛK<,²\Ã\'\\tµC¤K³ûhaˆf H2À\ì…\0B€HB\r\0*PB\r\0*P@\0 \Ê.U\È\0S iF\êd\0@P(€\0\Ğ	A\0 €€ \0€,¨\ZER ƒjN\Ø !\Í\n2„˜b\Æ@² ¬î¡\0\Ô\0P	B‚¤…„P\0T\rÿ\Ù'),(7,'Lipstick','Red color Lipstick	',400.00,100,2,_binary 'ÿ\Øÿ\à\0JFIF\0\0\0\0\0\0ÿ\Û\0„\0	( %!1!%)+..2?83,8(-0+\n\n\n\r\Z-%%-+--6------7-7---.---.--+.5+1--.5+--+-.-----+----0ÿÀ\0\0\á\0\á\"\0ÿ\Ä\0\0\0\0\0\0\0\0\0\0\0\0\0\0ÿ\Ä\0O\0\n	\n\0\0\0\0!1Aq\"2Qars‘¡±²Á#35Bb‚³\Ã\Ñ%4CRct¢\Â\áğ$ƒ…¤DSd„’£ÿ\Ä\0\Z\0\0\0\0\0\0\0\0\0\0\0\0ÿ\Ä\0+\0\0\0\0\0\0\0\0!1Aq23Q\Ñ\áğ\"a±¡ÿ\Ú\0\0\0?\0¼Qx\ËUMœöƒ\ÔHºd^=ôÎ¿A\\\Z¶\rş‡~=\Ñc\Zøÿ\0[\Ğ\ïÁz\Ç;\\.	#A\è‹\Ì\Ì\ÛØn\Ñ«\'D]\Ë\ŞLµ\İ\êØ·¨ó‘@Å‘\îzñ2;õ½\ÒA‚ó8\Õ\'iõş+e“6¸Z\Ë«?\'m>E#-Ô½`i\Z®xk…†\ÂÓ¿ˆrÓ‚\Òg Á§©ñ;€÷­\Ô]À ìˆˆˆ€ˆˆˆ€ˆˆˆ€ˆˆˆ€ˆˆˆ€ˆˆ8vÅY\Ñ\Ş\åı‡Ê°+vÎ±€4@\Ô-gÀi,¥`u°\å_{}V¼O™mt—”‹)\Äm62\Ó\àwyğuW]s½\æ:44šz\Ş9¬š\äŒüxpmS\ZZHÀAoin\Çò«#%J\×sšCš\à\\1AP*\É\Ñ>T.\å)\Üoª5\ãğI³›\ä$¬TRó3´­ª\ÓV+\ÏHK³ˆsaŒùÖœóG\0µ¹À>\r\Üó±¦\èÙšõDDX¹C(C9I\ådLk=Àõc´¨>[\ÒõÔŒMS†.Œ\0\Ğw®A>Ad^¸¯nĞ°‘adl¢Ú˜#€†\È\Ğ\à ‹˜€³QY§i\"\"\" \"\"\" \"\"\" \"\"°ùVs……\ÈÚ³Ÿ°ğ*Ÿ\Ó\Ü`²\"@8oõŠ€\Ò5^µ@mÅš\Ğ6\ï<\ã\ë\n5Y¶-dQ‹h\Ø7©\ÈÙ½-[ˆ†Zf»]\Í¾x\Ø÷\Ú\ÂnGoa\êUšnõc\Ô\Í#h„ÿ\07\âdÒµ²\\4\rˆ’¦\Ôñ\ÅE•)\ÄVdn³Ö½ù@Z$ß¥ªU”³nh`3ºzIc“DRw@³I\Ü	ò¥qw=S1\Ù:mh\Ø\ã\ß2–´\á\ÈÃ†*\"\×\Ö\ï\ïI‰ÿ\0…“—\ŞO±šw…±¤\èónŒ˜?ı¬\0´u»ºµ•¥zG\ï\'÷´\ÆYš\Z\\÷XÛ¬5…­‹Íˆ\ê\â®ñc\Çl“\ËX\ê°jª\ä{ccE\Ü÷\Z\Ñ\ÖIÀ*\ã9ô±\ZY“\Újd7«ƒ›{E\ì^|Ã´ª¿93j§\ë\Õ\Î_\Õn#oƒõ›Õ¥5ov°ú\Î\ÃĞ£v–-+ñ\'yùCoœYz¦±Áõµ\ÕkZ\ZÖ´¶\0o\Şm0Z\Êh€³™6\Ş\ï\ÆüA\ãŠAD6¿\îİ@²Lƒ`\Äõ\ï\r\ncˆñ´~şôKÙ¤l¢\0š;7öQs‡S°òsl§9»¤úW±­«t‘Kó¤,™;\È\Ô\'Tn\ÇÎ©”ºn¦M\Æ\Ûm\é\Ñõ\r-Tr´:\'²F›\æEh^Ê\Ñ%uCjù8Y$¿\ãZll\Ùğ¯:§€\'w«D±58=ùw\ÜDE.\" \"\"\" \"\"\" \"\"¯\ØxQi\ã\â\â\á\ï*İ“a\àUE§Ÿ‹‹‡¼ ¬b\Ø8‰™\Ù:wLùIS<ò¾\Ë\ÜÁ,na-İ¬Á±\"\ã.²\â\èÔ´¹*E OoˆI#\ÜşF)d¹\Ì\0µ\ä°ªH\Ä^÷A¿\Ë9\ÔS46ªQ; •ô\ÒÁm\Å\Ã1s\Ül0[uf÷:|7\ï/ûUgTRw ¨\ZH\ç42x©M<×µÀ\Õxƒ¼°½½ª\Ë\îsù>\Ş_öQ(O„FŸ)O\â\ëÿ\0™lt›9J[¸†\êÁ\Í_\à›´­v>SŸ\Å\å\æ[]&¿òŒƒu Àx±´¨—»‡m\íg—\Ùd\rÀ.L£`\ç\Í\ÜN\åÆ¡=#‡êS½wh\0,[q.„ô\Õó½wk@À.WD\ì\å{\Ñdù§w\'RLûªÆ’@\ŞOP\í=‹«kCù¹<Eõr\Ş&H\ÍH\â ‡8kr†ı…€\ßrp\Âó\ã¨\Í©6ó\á´\Ñ>@’Nøñ>G\ßUÎŒ\à³E\Û\å\'€\ß:DW|\îL“’\Óiò\"\"(\"\"\" \"\"\" \"\"\Ğ\çvtCA	{\Èt¤|7\Z\Ï;/m¡£{½öUŸ\Ùò\Ê&˜¡´•DÅ±´\Ş\ÎY\Ã\ïà¨ª\ê™&sŸ+œ÷;¥$qq\ãüŠ&^ı.oü\ï\Ûıü%pg½mMd\r–¨ˆ\ßQN1€\Æ\êºfóN®.6\ç·\Úyø¨¸{Ê­³o’Ô»\\\ãQKm\Âü³U“§¯Š‹‡¼¨ƒ]‰ˆ¬Dz+z#€õ-m\Ï<u¬}3at\Íth—’\ä\ì\Z\â\âó!\rh\æ\ä‹n7[\Èz-\à=KC›ù5µ5Œ…úÚ?P°?Rü\îL;¤\ë^\Í\'`\à¬ğ7¹\éQI+yC3¥¯¸rR\Ï=6®ÿ\0„¨\Z\à\ã€k\Ş\Õh÷9Ÿğşğï²T™!\Ò\Ó\Ç eKû\æ7€i¥ŠH\æ\Ôp\Øm­­fö¿œpØ­\ç3ş£÷ƒöQ¨Z{!\Z<ùV(:\Üi/\åø{ió\åY¼¢=µ·\Òo\Êñp{*%\í\á\ß\éöE®‹„º«q\Ê.Q)>ópWUK®§hq•Í¸m\í\ÍcŸº÷\Ø1ô«ş(\ÃZ\Z\Ñ`\Ğ\0@Mhº¦²\á°B\é!lŒ%\×,‰š÷l¯yr®\ÔÕ³Nµ¬\r‚º\á…\Ä-iÉ´\ÏA¼\" \"\"\" \"\".²H\ZœCZ1.$\0Y\'b«ó\ÇKpÇ­	?g8±½±·k\Ïi°â˜ñ[$\íT\Ã<3\ÂœÆº[½\î6lM-\Ö#q¹Á»¯\ÚS–´›[9\"7ŠX\îl#\âÛ›kH\ìokb\Û(EvTgºGk=\î<\ée8“°võˆ\Úi	\Ö/$\î\Ü‘Wv¶6<{t\æŸNŸõ•Y”À$¸¹\î&\îq\Ö$“¼¸\âOj\Õ\ÍW$†\Íg²“\çH\ícºşîµmœÁ×¿ú(z-[ß¼\íhd\â+\é\Î<½1„­Vv¾*>ò ©85Ô¢6\Ürôú\Ï;-\Ê7gZ°4óñQğ÷•he\ë«Z\ÌEU„ğo©E!£|¯x·-Hv26¹\î7?E§*ƒ¢\Ş\rõ,<Ì¯¨eDŠªzxu*¤Ÿ“s¯É²\'—°8%°i;	r—…Q”+*iŸ\Ëü; \ä‡- iš0÷Ö¶C\ÏsI¸\Õ$¸p÷9şeQ\ãşíŠ´\Î]y¡”Š\Êù[¢˜\ÃS;¥o\'Un:ÀkµòôEÃ†\Ë\Ù]\Î™TxñömP´öCs\åy\Ô~ñm4(²V¯1şX›ıG\ï\ÓJ?Ÿÿ\0•©\É/gø¿DT\Ê\êĞ¹º«r%\É+ÚŠ•ò½±D\Ò÷¼†±¢\×q\ê÷¬qò?¾µcf.cLø\â\ÊTF\Ç\ëE\â\ÖmšıRu¯°u©Ü›9\å\Ë\ë\Í)ncf/z±ªy|\Íq{bkÉ†7k†\Øk:\Ö\Ä\Ş\Ö¶\Õ8DW|\îL–\Énkˆb\" \"\"\" /\ZÊ–E¤‘Á¬c\\\ç¸\ì\rh¹+\ÙUzb\ÎG‚(c 1\Íd“ny\ÇV>Á\Í=wT»`\Ã9o„/<³º|¢\â÷EM~e86!\'o\êº\Ôe\0Y·ûÚ½_a‰À/31=“ôQô5¥)Dl\íÉ\Î&ı§w\à¸\å	\èı#³ñ+££!\Ö\ãƒB\êuŸ\Ö\Öù‰ü3#¦\0Ù·‘ı{‡\à‚q\ë\Õù£È½c`h°›¢9w\î\Ûf˜ÿ\0J-úh}°¦úyø¨ø{Ê„f‡\çô¾:/h)¶ÁG\Ã\ŞT\Ã+‰{õôVığo©h2s`ª=\Ïk*ª\È\ä»^\×4µÑ¼†\È\Ó{9¤‹‚qO\Ñoú–“6¦™•¬}3!|­tkf\ä¹<\Z\â\âó!\rh\æ\ä‹[mÕ™©>xGP\êA<M¥/0´\Éu¾Cb8D¨%\Î\rh°\Ô.fòoŠŸ÷9şgQ\ã\ÇÙµV™\íSK+yGN\ék\î\Û\Ó\ÏL¾\ÒN5\Ç\0\×=½¡Y]\Î™\Ôøöı˜PŸ~e\Ëq\Ê?x¶\ÚS?\ãÇ‰ƒù–§3O\å™|<¢=2-Î”\Z\rsO\ì õ½%\í\áÿ\0è†‹‹\Ğ0\r¿\Ñz1„Öµ\ÎsˆkX\ĞKœ\ã°4IV\îc\èÙ±j\ÔW$\Ø9”øFw\î{Ç˜n¾\Õ^\ílÙ©†7·v§G…\ÊÚª¶2\"\Û\å>›\Ú~oP;w\á¶\İk@Àl‹”WÙƒŸ=³[š\Â\"#ˆˆˆˆ€ˆˆˆ€©M1R\Ä\Ê\Ö\ÚÖ¾HÃ¥·\Îv±k\\G]›o\"º\Õ=¦\è@©§~tOi¶\ŞcÁ?\\¨\Ïo³G¤«1b\â1\ÜJó¬\Îv\à6_µ*\Ùa\Í\Ãq;\ì»SÀ\Ö\â1\'yµüê­©\æ\ßhuŠ/œòw\rÃ‚ö%\n\â\ÊS±tB¸A¹\ÌÁùB—\ÇE\ëR\İ>3\rµ®m‰\'°¨¦e|£K\ãcR\İ=d|=\åL28¿Š\Î(¹¢\ÎpÀuupQ9\Î<\Ğq=}|T\Â‹xR†\Í\Ò<O­K9Î·\Ñoñ~*\ã\Ğ9š:¦ò\Õµ®„\Ú\'†\\\×NüĞ©Æ«¯¹Ç£Y\áSú¤Q´\ÆÈ¾J<¸öF\\\ZÚŠ¶\ãw#N±\ß||\ë{¥¼\×F\È\ãtu=8\r\0›’\é\0\0o\'¨-¶^”ÿ\0\İ\Öúe”+\Ï$\ä\nY¤†¹ñ—TFÆ±%\à4\0~e\í~{±#zK®Ÿ7²·7ô\Ñ\è\Ç1H;\ê°T\áf3 Œ\ív¹\ŞFÁ€\ß{\rKL–½¹¬\"\"(\"\"\" \"\"\" \"\"„\é[7\ÅE™­&h{H¾1\Ü·\à/\äSe\ç<-{\\Ç€\æ¸¹§ai ù\n:b\É8\ï”\\ò\án\ß:ô§$`Vó>3bLŸ3ƒš\Çk:\Ş\á\Ìmœ..<ª4\É\îo¿\ÑeVırD\í1,\×.\ì\r\Â\à…î‹•Í—\\J”6Ù¥(eu16·+ÿ\0\Ø\êI\nw¤\ì”j¢\"7|#Iæ±µ®\ê=ª¹É±Z+ÿ\0Ô‹\Û\nxÌ¤\é\è^\á\ß,À_eC\Ã\ã\0\Û\×mø\Úa‘\Ä\ãkV¥t!s,×‚\×\0®\Ê7Hñ>µig,­œ\Ò61\ÑUõ-³\Ü;J–k†«¯¹Ç£Y\áSú¤T¬fİª\ÎĞ¶^Š›¾$¬ˆ\Êúp\Û\í$\ë‹5»N\ÑÁD/n\Î*ò1e}MEMã‡¾k\ë{L\Ïè¤wl\ŞB½³F¬KL×†\ê_ôf\Ú\Í\Z­-a\Õ-6\İu\Ï ‚–j·\ÅË–\ê`\\\âö†ƒ{Y€KF\Ğø\ìôX\ç;&\Ç#\És\åtÒ½\Çis\ä?\Ğ¸\0¥D¹·/\äHk!t\r\Öi\ØEµš\í\Îi\ÜUZ:­£{\İ/œDŒ³¦\â\æp m\Âİ«\èôG|:‹c\é\áò]=C-¿†\Ûù\ÖS\r÷[Šú8s\n‚²\î’‡ô\ÑY\âmƒ¾°*•´7(£­ª9›o\ãeı•Y†-~9\å\Ñ[–u›®I¨¿:8\ËNO]£•E©c¾\ä\ëX[/Ø·4\Ú¬uŒµT\Ì\ë\Õ\å\ëk}j6vf(òƒCX\Zöog0ÿ\0Yù\é!eP\Õ$sÀş%m\ä\rPAgNW\'[\î\Öôciö‹•K¤FÚ¬xmö•¢z\ÍDf˜\Û\Ã+ş#kÙ©]	©h\Ù+5yQ»p‡v­t\Ù+%T:\ì«1»{^\ÙYo#˜n~º\ÄQ¡„\Ïğ\ëRñ¦§72d`™+Ã‡\ìÃ‰ò\0\×)‹i)%©#\'\Ó\ëˆlf©”Ø·\\83“i»‰:§õ@·IÖ®æ®•w\nO\\\Ê\"V˜k´\İ]/ŠgJ\çEq=±\à\Z$~¶³¬6›\0.nF=j\İ\Ñsm’i{XO\îTÎ›1\ÊòvEO\ì“\ïWnÙ«’\é\ìš|÷>õ*¤hˆ€ˆˆˆ€ˆˆˆ€ˆˆˆ€ˆˆˆ€ˆˆˆ€¾oÒ¬zµ‡\Ãşeô‚ù\ãLÌµa?Jş› ¨Tş*X¢™_\ãŸ\Äz‚v«£¹¯¥]ÿ\0‰÷Ê—jº{š\Æ5\Ç÷O¾QÛ³A¦W_+\Ï\Ø\Êqÿ\0É§Ş¯¼ÍV‚”~\Æ/d/Ÿ4¼I\Ë5}\î?\ÛD}\ë\èÜ­,\r\êŠüJŒôD@DDD@DDD@DDD@DDD@DDD@T«U~»@Wú¢tø\ËN\Û\ïkH\ák{ŠRŠåŸ\ÕöB”Bn\ĞzÀ>…\Ëc\á\İõ}ƒª\ë\îlWq¥û\åJ5]\Í\î•¤9\Ô\ÛH\ê•D/nÈ®•ò\ÍXúPöĞ…ôµmSX<À/š³ı¢L¹P¾´\Ğ4[“M°¶\Ó|\Ó@)Q\Ê\" \"\"\" \"\"\" \"\"\" \"\"\" \"\"\" ,«‘©ª›«SO\íŒk­\Â\ã\"\ÏDÚd—\ãŞ…\Õ,f¾\Ë	\Ú\É$\Ü\Ã1=³J}eO\Ñ	º \É\é\ä?\çL=D/xtM‘›ÿ\0$\áKR\ï[\Ô\ÙirFiPR¸>šŠ\'’66\ë8úV\éÿ\Ù');
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
/*!40000 ALTER TABLE `reviews` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sub_category`
--

DROP TABLE IF EXISTS `sub_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sub_category` (
  `sub_categoryID` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `parent_categoryID` int DEFAULT NULL,
  PRIMARY KEY (`sub_categoryID`),
  UNIQUE KEY `sub-categoryID_UNIQUE` (`sub_categoryID`),
  KEY `parent_idx` (`parent_categoryID`),
  CONSTRAINT `parent` FOREIGN KEY (`parent_categoryID`) REFERENCES `category` (`CategoryID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sub_category`
--

LOCK TABLES `sub_category` WRITE;
/*!40000 ALTER TABLE `sub_category` DISABLE KEYS */;
INSERT INTO `sub_category` VALUES (1,'Shoes',2),(2,'Make Up',6);
/*!40000 ALTER TABLE `sub_category` ENABLE KEYS */;
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

-- Dump completed on 2024-12-19 22:33:43
