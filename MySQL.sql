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
INSERT INTO `product` VALUES (2,'Purse','It\'s a Louis Vuiton Premium Purse',1410.00,80,6,_binary '�\��\�\0JFIF\0\0\0\0\0\0�\�\0�\0	\" *#\Z$1!1-%-,./0385-;*.0+\n\n\n\r\Z\Z5% %+7515--5.-5-5-7--7---7---7//--5-5-5--55-+---55///-��\0\0\�\0\�\"\0�\�\0\0\0\0\0\0\0\0\0\0\0\0\0\0�\�\0A\0	\0\0\0\0\0!1A\"#Qa2q���B���Rb\�\������\�\��$3Dr�\�\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0�\�\0$\0\0\0\0\0\0\0\0\0\0!12AQaqBRb�\�\0\0\0?\0�@\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0(�UQ�j�$��\0�_L�{��(Ӕ�YMI\��vS�\�e����\�\���G[��VJ�\�\�2j<\�y-]�\��Z�A\�\�j�up�\�I\�~\\���\�T��\�k����\�&g*�(]r%+T�\�X��UN�-|�6\�U4�؞q2J���\�+o��\�\�~\���S\�FVX+򺬾�\�\�*WX�},~\ZxʔkR�G*ʭ<\�I�8\�U��v�R��v�>��\r\�u��\�Pe1�e�-|:�P\�I�\�&��\�d\�\�\n\�\����\�\\IP\�\�T%\'�2����\�2\�\�\�}򝕸\�\�\0�\0\0\0\0\0\0\0\0\0\0\0\0\0\0\r\'�K�_y�#����rW\�E��ٴƻae���\Z��Ԟ#�F�)�*���J˳\�$�s)��.w�LzNH��Jt\�^�0�\�Sˑ\�-%K6\�5�X�\�\�aj�>\�W�\�\�k�\�7�Lx�ĨIT�F\�iB��\�.MK\�\�-Ex�\�\�=\ZW�1sT�2�=\�\��[+�O���\��k>V�r�\�g��|�K\�\�tf�>�\�׷\�\�V��/��&��Q�q\�M\����\��\0\��S]����zz�\�9V��]�\�\���Rq��T\���R��\��˓~ir���O���JR�O=�6�\���\"\�:���/�5\�OC\�5	����_��\�\�qc�#3�NT\�\�\"\�*���\�1��oik\�\�wd\�\�M^\�\�հ\�3��\�cV\�v\�mM�B�\�q���E袮��\���2\�g��K[�-smҾ\"�b�9B*�j\�MF봩eM\�R\��ŕ�V���\�\�]��\��\�;\'�%Ȯ\���q2\�7>[]�\0$��\�\���P|Y^�ij�.{\�Q�}�ޭr1�\�]\�\�7�fNWHp����jT\�k+)զ�W\�l\�]tE}\�>).-њs�۩*2�M9:rq����r���k\�	\��e��\�G\�/��\Z7��\��g5��\0��\0\0\0\0\0\0\0\0\0\0\0\rw��~)�I\�\��\0B�\0ì\'�J��\np��F)/ȧ�a�\�\�\�^\�o\�\�s�8߷pJr��\"�*�kT�ܞ��\�ךi�)=u��O\�CӬb\��\��)ʍE\��\�\�姇�}k��Rk\�s�\"�\�\\F�&�\�(\�R�:~̩�\�9]D��\�Y�[\�q��ͷYT�O�X�ݼ�,��r֕]=�00<iQ��\�\�O$\�(\�7�tng�٭}\�v⮑�{�n5ǳA]���\�\��^�V\�b�7��\�5������o�\�\Z�\�*pةBP��\nU;[I\�MQ�;*���nQzj�48\�٨\�$\�%�O\�-\�ę��\"u\���o[_ڶ�\�\�[�ҟ{\���y�^5\���O\�l	cjNt\Z�:k5Z�ZqZl��o\�]�d\�]�\Z�\�W�#|�j+F\�zVW��\�l��Χ��\�\���Q�*�\�\�\�N�8BK<ު�\�.\�\�y]\�U.�(Yμ<J��i\�\�#\�Ƥ\�\�ʣ+\�o��M\�r8�\�2�=��OE�3�]{\'�R�ˇKmt�\�-ow\�\�[�l��\0�\��=��/;y-�qv�ۤ��\�mk.\\�;tUn��\��n��9=Y�G���\0١�l�I+ުn<\�SuѺ\�Lho��SmmhIM\�{�ɝ.��:\�?�8|ԩ䜪\�R�mɩ[3o{\�G�9|��\0\���=��\0�\0\0\0\0\0\0\0\0\0\0\0\048�W��bxW�ݶO,*YYJ�\�Q-/kI%kFQ\�,L�A}h5_���դ\�S�\\jC#\�!�RM\�k.]`䮭s�\�+\�\�\�]\��\��\���:Q\�\�=&ᎇO|ќ^YBKgk�M24�\�*5\�\�\�(ە\�(�z\�\�\�S,mi�q\�ÈKVJ�`\�\�*s�g\�\�G(y�S�ב��J)cf��\�4���RM4\�z\�5(\�\�\�M�v���S\�\�{X��k�\"�S����+Џ��\��L�����-$�\�����\�\�\�i\'{�\�9(\�Y龛X��\�\�օ<,\�\Zq�o>Τ\��\0jO\"���\�-�oKt˩�[�����\0��EڝP\�\�L\�q\"ߖ{h��t�\'\��\":\�\�\�\�\�\�m�ݶ\�\�%w\�\��2\�6��O\�+�$�\0\�\�d����ו\�/\�,�\�\�*��+\�Oo�k-�K\�l�\�9\�q�k��\0ϟ���h�\�Y%Ϻ�\�\�H�\�g�\�\�\�k\�\�_�r�Sغ��\�\�Om;M��Kz!\��\�\�#�d�7m�?M���_�:\�0?k\�j\�\�\�\�u\�qt���<�\�f\�=K\�S\�\�\�\�\�\�\�\��;\�\'��\�(W�\�\�\�[���yI�-$[lW,糱�D|\�Ud��8:�\�ԓ�#6�0Z\Z2\\S�\�W\n)lz��\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0�\�'),(3,'Polo Shirt','Premium Quality Blue Polo Shirt.',1000.00,0,2,_binary '�\��\�\0JFIF\0\0\0\0\0\0�\�\0�\0		\n\n	\r\r\r \"\" $(4,$&1\'-=-157:::#+?D?8C49:7\n\n\n\r\r\Z\Z7%%77777777777777777777777777777777777777777777777777��\0\0�\0�\"\0�\�\0\0\0\0\0\0\0\0\0\0\0\0\0�\�\0F\0\r\0\0\0\0\0!1AQaq\"#2��&���4br���3BCRcst�\�\�\�\�$%6S�\�\0\0\0\0\0\0\0\0\0\0\0\0\0\0�\�\0\0\0\0\0\0\0\0\0\0\0\01!�\�\0\0\0?\0\� *\�)1��\�|���\�%�\�5k\�6��:�\�/�o\�\\\�5�9$�\�o�K�&�\���\�[\�\�\��[K;I����̫\�so�=\�\�\��q�J7\�u��ާ��\�[��S�^\�3��<�WRj+�ɩ\�Wn�ކ\�۬\�S�s�+�Zo��Ӟ�õ*?\�\�R�v�?\�5\�J/Xk(�\�\rZ\�ތc\�\�&\�\�j��\��\��S�9\�u\�:\�\�Դҥ�G\�[O�\�8{\�\�\n�!�S���kO�������]B\���T\�\�X\\\"�g���#\��C�d�\�\�\�N\�T\�\�=Z��MF.S�Z�3Z=c�K���_\�>g��\�ճ��z��Z��p�qk��6c{\�u\�)\�\�\�Nʿe)\\\�\�JR|8��j-�5\�s������\���n,nh\�К�jQ��\�\��\�\�\�#E#\n�\09\�\nB�r\\�Ο�[\�\�\�s��^\�G��f��/�R\�e|�\�u��헡��wK�(֚N\�#\�\�}{��4̣�$�$�\Z����;\�\�u*Zb��\�|�?iU��X_�:\�\�{ۉ\\\�׫Z��\�f\�7�|O�;��)�X�<dLz\�``g�:5\�t�J�}c\�\'\�\�jN��/�\�\�+YQ\�#W\\��ղ��F�\�\�p\�U\�׆S\�\��8Ҝ\�NUkI��m�d�\�#)�ET�r\�\�C�\�~l���K�3$���}loot۟�i�Um�u�B��~x\��\�\�4=\�\�.4�ju*K��\�\�\�p%\�k\�\�ס�wx�;�N)\�;;\�r��J\r�\��\�|\�O%a?{�7v\�v\��Z\�\Z.�Y}>�}�\���������b�y��\n�#�\0�V\�\�S\�]uaٝ�|\�֞�\�O�s;�{o�Y׼��\ZV� \�Rr|H�>\�\�\�\�\�U�\Z\��oI�\07O��|٩\�֯V�Z��ՕJ�$\�9\�\�ɾl�K�2�O�7&x# �!@�v6�\�ncoiFukUx�8���\�ؓ~F\�\�潥\�.m�:u��\�\�\\2�~SkɁ�Zs�Vt�\�P�NN��\�<4�Lpe9J�\�:��\�)9JRyrm\����1\n�\0�H� v��[W�qmVT�R�n�H>1�z>l��\n�^\����\�\�]��0\�h%�+��K�Y\�z�^\�\�j�@\�\�\�6\��\�t\�\�j\����3\�:�i�i4u+	v�\�\\�8K�_�\�c���#$\��Է���e�E*	J�\�ʝ�|��\�o�}\� :���\�w�\�_aA�]\�/ߟ5%\��y�L\�9T�9ԓ�\�\')M�o-��0gH�##c>�a�+�ɳ\��3L�(\�\�N�iF�T�kusj5[\�V�(b-��I/q�#u:�T�է\n��ԔcR\�\�mv��\�Q�\'@��L{�85�r?K\\�mV\�\�v�^\�*�W%.<�n,��\�/w�yF8\n�}�&X���6�u�\�\�\�O\���\�\�lΫ\�\��\0�.��u�\0\�\\�O���:�1܆+\�\nQ�#(�\�I����\�s{S+�z��[�Z\�v�\��ʟX\�g\�k�\��L_�9��ޞ\�_\�\�5m>��եK\��o�Ym�|[b6a	介z֕gouNt\�Cބ\�\Z>\'���c4ͤ�~���r�\�\�Xk\��\�[U���\�\�8\�Ss�߳�\�>\�n]G\�aK��^�H��f(�|\�H3E!@��@\0\0\0V@�Y/#\�=�\'��e\�|�\�=\�2\�c�\\@�����\�l���m\�\�h�\�^oܦ�\���\�\�^\�^\�E\�aڣe	{J\�s����4\�A����EB�\�\'\�\�S6��m�\�}?e\��d�=��\'q%\�w���\�m\0dr�2�\�Ԭ-u;Y\�^R�ZSXjK\'$�v\�v�Z;�}�\�WK֕�:~]\��\�lEm/b�]�\�U��\'B��\Z~/\�\�M&�\�Qշ��Z\�\\\�\�R�5\��!\�\�,�2T!@�\0 \0\0!B��\�4�-kf��-F�jНt��\�\�\\�C\�OtU\�=�p���YTϴ�\�?.�g�\0�\�\�y\\\��#i�긚v�m�ZS���\ZT`���#�����22\0W0�  \0�X\�_���v�َ��\��X\�[v��*�$9�1GFT�\n@ \0\0��\n\�\�+�\0�\����(\�ƨ\�?�\Z\����(\�\�;\�C\�b�$dT\0\� \0\0�\�E�Cձ֖Փ�oU\�`�<u�_i`�Na|\�tda�(\0\n@\0\0\0.`m\�ÿe�k�j]\�>\Z���?�\�G;\�Q\�G̊\09`�(@\0:��\�=K�~�?{|6P�\�X<\�.e#\r� �\0�\0\0!@���WW�\�3n\Z�q_�jߡ\�m���2�\0�@\0\0N\�\����T�\0�\�\� \0\0R\0\0\0\0\0\0��\0m]\��S�?́��9\�Z�\�PE@\0�\�'),(4,'Leather Shoes','Premium Calza Leather Shoes',1000.00,0,5,_binary '�\��\�\0JFIF\0\0\0\0\0\0�\�\0�\0	( \Z%!1!%)+...585-7(-.+\n\n\n\r\Z\Z-  %----/-----------+--+-+----------+---+----------+--��\0\0�\"\0�\�\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0�\�\0F\0\0\0\0\0!1AQ\"aq�2R��#Bb���3r��\�\��\�CSs�4Ed�����\�\0\0\0\0\0\0\0\0\0\0\0\0\0\0�\�\0!\0\0\0\0\0\0\0\0\0\0\0!1AQ\"2�\�\0\0\0?\0\�\�\�T\�/\��\�@!@\"�p��DV�1B����\�\�K?ð�)���tNj�[��ș\�\�k\r\�/Z+�-��z�۩�S]T\'�\�8�֎\�\r�\�X�t\�\�\�i�j%��&\��2�\�f�[s\�\�[t\��N�Z�\�\�\��n.m\�]~>n�\�=\�u0��jmf�R��A��\��ا���\��\�\�\�q�dV\�\�&\�\�,\�\�K��!	 �8�\�0����L`I�������c��w�\'�h^\��\�x�/!x\�W��\�x��7�\�J7�\�Q\�⒍7�P\�i�\�|\�\�\�];\�m]J\��ojc�Q��\�t^��c�\0�P}\��\�;\�\���\�\�q���\�맨\������K*\�\��o~��\�F��\0a7ެ:E�\\I�\��u����\���ɇ�8�iX�\�?�\�\\-R�p7�fr�\�ZD�c\�\�c\��_o�\�ֽ�\�RO24\'\��\"jy\�\�;BHP� (�q�\�\0 IL\�\0\"h7�e�\���\Z\�L��\0\�$@��/\0#v�,	+Gi0��-1\�hZ��X*M��w\�;Z��\�Ƨ��\�m\�6�\'�z\�\�-�\�ը\�A\\\�iY[ E$(��O\"�\�Y\�bZ�G�\�\��\�l\0\�5\�\�%q��IU�\�F�*���\Z\�\�lǇ\�J��2�\�ca�O�\�.\�lʗ�eSȸ\'�V\�\�2t0��9I�3A\�~\�\�}O���\"!֜6��Z\�j�\�S\�@)�\� \���\�L�\�\�\�Á-k\�\�f�51B�\�iK�cߪtE�\�\�\�7��w]��\�Qj8\�9�0��I>\�\�Q̾��\�7kNsԽKQ�\���N�\�\�O���Zhb�H�\"T�V�)\�v�����29d�`IZ���`R2�\�n�t\�	B+\�`���\�Y(\�(\�;G\n\�\�8@V���hZ8@\�t��S\�\�=�͖��FS�DO3Wԩ6@22(�<S[�:w�3�t\�l��\�Cv�j�w�~�\�Ϻ\r�\�<��r\�Tި\�\�\�\�4\�\�\�G[-���h��誢\�[�\r\�Fc��\����a++ �\�f�\��\�\0�\�`\���\�\���:XJkL.�g�|k���+\�\�^\�\�XKZ�NR�g(h�K��uP7�sR�\�j�\'\�0�\��U������|x\�F;i\Zt�#^\�\�\�`x^S\�\�yiY*\'th\n��f\�(\�^W=��;\�U\�{�[�}N��\�ov�룽>\�x,=:?OR\�\�T��\�#]E=\��3=\��|�\�t\�*oU)�\�s|�2�d\�m3��\�\\\�:k�D�\�B\�\�mIE6�Y(�9b\�\'��V,��F��;Fb�!��\�&`Ȉ\�JG	8E8�\�@$+\�TVv6T��P.d��ֆ\�\�0L>$�K��]\�E�\�p\�y9\Z�cg\�hm���\�\�O���\���r*����\�a�\"\�$��4�\03/\�lY�ҥJ�\�\�\�nO̴\�a�W%EJ�\�M�bs���Ӈ�_�}(.+/���1\�q�\�\�	Y�iw��0 �p\0�3��MVS�ӷ$\�Q\�om�\�וj��ڨ\�F�@3>����\�\�4��~I\�kxꙜ�/v>\�j\�.\�F�G\��2�@5\�\�l��X_\�i�&GLU\��͕p�\�\Z��+��\�%A\�(\�|\�(\�;]�^�\�;���\�e��媃\���L�dٱ��!9{�\�$Xٷ�%\�Q��Q�DW�\�*�(3Y�����ɭ�[q\�z�w؛^�6�,Mu���qu?iO�2�yߡ\�WemJ-��\��8�4Y��\�.���\�\�q#�\�:�t\�(U�U	#5:�\�q�]M�;D\�5�%q!%Q#��B\n#%�\�\�e�w�$�B8G	8B\"�!N9\�\�\�/��D\�F�\rF\�5�����o�i�V܂�\�xSa<\��͉���&�Y���F�\�Yǚ\�\��i�\�ņ5���Z\��w���*�Ab��S~\�\�\�/?�.j��n�pF�\�8Lu\Z\�\�Rm{\�ޚ�\�w;\�t\�v\�Ȝ�g�V\�vvj��\�a�\0��\�;�\��)`�M�#k\�xR��K\���\���Zy\�(\�m(�xS����]�oC��#�̦͢�oeA-��\�x\�k�\�ƣ�F\�\�b\���&Ҝk�\�\�e\�Ibt�T�\�ώѭ�fTͥ\�\�fhe\0�H\�E�\��MOT�3?�Ē,I#�9Ʒ�˷\'Z5\r���\Zy\�\�U�\�\"�A=\�s2�]t\�6r�tv�Z�{4R\�\�\�\�\�\�~�D�K��n�\�\r���b�\�}\�8Z߄\�\�\��Qԃ�I��v>~3]o�\�n=\�\��\�7\�\�s�pއt���s��\���\�}\�T\�쾺8\�\"\�un����<0L\�V�\�h��\��\�\�:ra��\�\�%�k0\�B(\�!@\"� �;�qB��\�%���!!FD�\��\�\�݆i��T\��_\�\�8�Z��)\�U��r\�#hv\�\�[�h\�x�\��\�`6% �@��9�&m�W\��Ex�XZ�\�\�֦x�U:�Di�\�Z\�\�\0 \�SȥU�E��\�u��m�	�3��*�\�H�b\�]\�HQ���g��=5�K��)��h�\��ڔ\�OF:�L�b��7�����B��Q@\�k\��)}��{�ƥ�\�\�J N�\��`��y\�69�&O�\�N0\�OvG7T�*M�\�>�\�\r�{\���m\�c�r\�˚5�d��pn~sE�\�NLl4\�j)zl]�\�sa\��\�L��\�*F�_�����\r\������#{\�;�\�\�=�\�gO3%��\0�7]�=��(��:��2�L�U:\�N��a~-{o���\�ؤU\�̙o��[s\�\�N\�\�b_ݞ�XT7\�\�;�[����t��\�KVP�H�\�x\0\\�._\�e�N\�ĥd�*dd\�@�\0\�u�7�x݈\�	x�\��\�p�\�\\�#�bq\��F�wG�kJ�U�ds�ǲO���lF \� \�\�.8�a�\�nff�wO1T��R�}���\r=\�\�\�i�.\�l<�\'���&�Ѿ�S�����\�qu�ȞYs1w�M��Uu��\� ��\�&\'\�-�5��#��J(\�P#�	\�bG\��B���U�ǀ$�k*����&��K���ي�.�\��F�Dș\�LF\�8�֪^��36�I:\�b\�x��\���\�mx\�\��\�,)a�T\�\�|̿\�\�\�dAbT[\\zO2f��\"���m�Ԫ�ݎ�֛�=Æ�}��\�zo�xM��!Cᩱ\�\�.]<���\�l8C\�\�\�R YGl\�\�\�$|-:F~�N\��](\�\�y\�b�w����D��xAڐ�sd&����L׶\�\�\�\�5K\�\��t��ZL\�]-_��uw�\�\Z�kZ�?��)\��w�\�\�n	\�5&l]Xl��\�\�\�\�޳i�\�V��M�\0�w\�l�\0&�b_�5)ܠ3W\�\�\�.��OI\���\rD\��\�Cib\�\�,\Z\�\�Jڊnq�\�e�Khf[���� �gs{���&_�]tRx�8r\�{k\�\�\�\�\\R��\�*\�\�L\�\�\�MM�\�3(H�2&;D�\Z\�q�61k���\�\�`1\�7-l�\0/o\�[Lm[&钥�;R�	M�L\�?ga�A\�o�ȴV�S\�&|#��}�\��=\�L���m6�FX�RP�r/q\�-k�pe,��\�Ξ3*%~����^2�\�Z�V\�J�\�p>cq�\�^Ĭ7����\��3�1���\'ӵ�O�Z�Z8�(�\�j�l~�����<�#��!�������Ʌ\�3>�U&\�\�\�9�5\�Ñ\�\�5�w�D�@ �pA\�yG%̡@�qG	8E�h�f�\�\�\'.\r�\�A���\��Ӕu݊ʸU�c��J^6�\�\�1��>J�!��5\�Vv\�8\�\�\�\����\�1\��;��\��g��̅Gj�a�|!�\\\�\�R�:9\�-6\�ҧ��إ�h\�E�\��$O�j}!\�S�[i��=Z�e\Z�\�\�.{F�\��\����M�\0h��2�u�9mX�-1U�多\�;�\�N\�\�\�\�<(w\�}eC\��z	Ϻ\�\�R�\�uݨ�a�eP&Ȍy��\�U�K�t\�hS��NYU�#N��u0�o�t��\�\�\�IY�o���ɇ�\�ǜ\�\�d�!/)�mKq�/���\��M�>Ұ\���\�t\�}#\�\��-R������Q\�7�t�>3�m��v�\Z\�Q\\B\rCQ�9�/�>W��8�Z�Z�\\֦\�\�\�YJ��\��\�.�܍�\02G�U�#d�L�\r\�\�\�\�̸$zZ*h�R�����\'_���uӴ|��V�\r\��U\�Z�\�\��\�\�e,\�-\���\�D�qL-?\"%�\�x\�\�2��T�aR�8�\0^\��\���ɥ2\��S�C5�%�\�:S��\n{\\.F#x�N\�dg\"�Ⱦ�\�U4�\0\��̈5\rʦ�JW_׌�DN;T�05�\�ʃ7cF�j�lԛ���\�\�:t\�=Rt]�\�\�\�˔����Y�so�4�3�)�(�P�!(\�#�8qB�Q��\�-ו\\\�D�r�2~\'ii�z\�sS��\0��Lے�\Z��4\�\�Bc\�L\��8<�\��hqHR\�\���?\�\�\�o+>4\�-*\�0ݱ�$������V�r&h͊z\�Knu��F���\�q>\��>|uX�\�yS).U���G?9_`짯Qt$�p?\�e-��^�EUR\�Oto\'\�1���}\\*�\Z�����\��\�ˎ�\�u\�\�K��\n�p�N&^�;K9�N��P�V��\�B-6�̡�\\�\�R�9:+|/�i�W�m�X���(��\���Fo\�@\�X���~\�p\r�Oș�\��o�i_�}\�񞅄h�#���~\�\n�����a+�j��\0��\0i\�w��z�\�-�l\�-����5\�\�\�\'Jo��\�m�\�\�v��\�T}E�k�\0��z	5\�껬 Ն�U�\�aɴK�WT� \�R�\�:y�N�TV�j\�S\�FU&�\\\�\�Ǻ���[���`zY\��\�+F�@r�gf���US\�),	��n2�\�\�zf�\�\�\�UZXJ5kR\�\�2\�fBR�\�.�\0�}�I�7�m�\�\�T��\�rT���Vl\�\�\�rC�l3_\�\�\r\�?\�5@�V,\�j�Ӧ\�٪2�۾A+�\���\�wG�`)2\�L�\��k���\��\�O��E�y�d\���Tb���V�dצj\�P\�u3\�\0w��\�Ĺ���)U�N�楳�U*Hqo��h@�\��\0��t\�W\�xUZ���̵�թ�o�\�\���5b@ۙ�ѠK��V�\�4���5:j\n�[\�P\0\Z_��\�\�l0\��\�\�M�*bԯP\Z\�r\��\Z�p/�W\�\\r3m�R�\��Uڞ+l��\�1ƐE5,\�\"�&K\rI�\�Ng��IC{�u�K��N��7\�9\�\�L�\�\�p4V�gGH����0,\�j���T\��\0�\�m�%�l~/:7�j�,Wb\�SF��,\�IY���g\"\�se\�\�c[���)\�}@_CeB�\�Xj)M�5\n�\�i��ʊ\0U@,�\�ǥ��\�j�\�-u<Ĳ�=��\�L\�b<ŭ 9�\�/:�\�\�I�PJu׆VUb<Uȷ���\0#\�B\�Wg�\��\0O��3��yKUL9\"�(:x�w:�	�\�{\r�5*X�6��;\��37��\�N&���{�\�؎F�Q\��7b�v���F�U͎�|L�&X��I0�,39�܏�\�&\�C\\*8BBBp��@!@P�(P��(B��\�@p� � Gt�!\0�!\0�!\0�!\0�!\0�!\0�!\0�!\0��B�E@! �B?�\�'),(5,'Watch','Good Quality watch',500.00,0,2,_binary '�\��\�\0JFIF\0\0\0\0\0\0�\�\0�\0	 \Z! \Z( % \"1\"%)+...383.7(-.+\n\n\n\r\Z/&&.-71-7/-+-+75-.-+-+0/--2/++-/--0---+--0--+--------��\0\0�\"\0�\�\0\0\0\0\0\0\0\0\0\0\0\0\0�\�\0K\0\0\0\0!1AQ\"a2q��B��#Rbr��\����\�\�$3CSc��4Ds�\�\�T�\��\�\0\Z\0\0\0\0\0\0\0\0\0\0\0\0\0�\�\04\0\0\0\0\0\0\0\0\0!1AQa\"q��2����\�#BR\��b��\�\0\0\0?\0\�jT�B�R�R�J�!J�+��*)w!UA$���B^/\�cæy	�U�A�N���nk\�JO�\�B�@o�5�^8�9\�䘛���2\�t\�\0}@\��\�U0a�\�,?����HT\�\�\�i�\�i��k�\�\�\�x�\"H�y\����x$���̒\�\�6�%4o�v:t\�\�(V^6�J~����xZ\�>j�\�Z�O\�5x\r.;\Z>��\Z諊\�x�;�h#�JiD�.6��~i�\�\�q�0���~\��\�q\�px��|?\�\�S�]�� \�XO\�s\�s�>9iq3�o0d¨a\�d\r�\nɜ|bݓ2ʞ\�Ƒ+_P\�\�c~�����\�Q�� |W	El�7�^\�Y\�svhWS\�S�����\0\�(\���,n0Ψ\�* @l\��%m=�o��E8���$9\'#�V M����ց\�\"_-\�\r��7~�V��V\��5�#����\�C\�E���\0\�ԁ\�\�Wck�\�B�R�J�J�(B�*T�\nT�R�)@9���VH�{�6\�F�\0�:�?\rNJ\�����,(B\�f�S�?e\��\��\�}�`�\0\�!\�\�νu��5�+:\�.k�1\�$f�X�\�\�p:�.A~���#IRcs\ZN\��Ӱ�W6\�q��9\�?�(��\�Ϙ��7�:��\�.\��ժ�\�ۗ�\�*�\�*��@�d���\�m\�\r\�\�h\�\�z\�%�X��yo��0\Z7�P\�ŉ6�v\0��T\�7����H\�d�\��:\�\�\�=A�i\��\0�u�0>��\�s\�YQ��\'\�+��,���\�a\��#�\��#\�>\�o��5\Zx�t\�o_�и�\"GXx:dUP{\��b{�\�\�2�XH $�\�1�ꋟ\�0�RvQ2<\r� ��#_��zВ+\�\�\�#d\�\�<�����\�㩽��ڵL0��\��<[Z\��\�G�\�\�˜dM��m\�ʤ~�!�\�)�*��I\nT�R�)R�J�CB���G����3[DDy���7co����7\�1b�\�Н\�fQ\�\�.�\�sB��^3\��9$  `[[Z\��Vh���͠\�*\�Lڷ�mMܵ\�sI�/�6r�\n]A\�5\��}h��vzb�%�Tг\��\�čI�޹�֝\�\�Bp�4\�iĐ�_4��ݳ[\�B�ggo�\�\�\�+1a�PHU�\�16;W��y�\���\0*Ŋ%\��WECT\����~D\�Q��ȼDm\�T�\�?�^O)�A�.�\�\��z\�Y\�\��Z��D\�����θo���\�?*�X�|�� \�KQ�.�	cl\�@�3)*���\���\0\��\0v2����\0�n\�Ôf<Vy�z+\�{[�\��\�(���%\��\ZB�\Z\�޳~m\�\�\�@�;\�A\�W�\'�Ο#A0�G��\�R\�B�ms\�ձR�/i|C>5�m*z\\�����R\�RD`/b\r�\�W\�f��cq!/�}Ә\�OM{��&1�}����\�\nL\�w��`�k��\ne��+\'\�\�1\�\�+u\0�*B��\���{�ǝ!����ܡ�m\�	\�6x\�\�FC\�B\�1\Z�U����\�=G\�Vj)�R�J�~1��\�\n���7�\�|:�����\n�`į\�H:Z5?aO]vf\��GC~��Ƭ\�o`M�\�\�>{U~\'\�\�,\�\�E\�$N���na�H�r\r��B\�2t\',d\��o���<�\���̤�66\�\��N</�<;Ⱦfe!snN��\�\�N�J~j�U���ѯa\��!�B/~���\�f�\�YY�	���h>�]Mv\"\�7�Y�����\�\�\�\�-\ZDϙ�\�\�`r\�\0d��\�Y�ۨ#+m�ޤ�YU/6e\�H$&�\�F����NW\�\'�7a\������\�{��zj\�T6>!�ʌ.�E�N\��\\��6+�f�\�m\�\�c�\�\��F)X�:�V��H� ؉`a}[Ϝ~��\�t\�\�g�fI\n�K42�[5\�fS\�\�\�[\�n�kYt��\�.!ܜ�E\�v,t���}-T�ú,r�=\�롱:j5\�]�e�/�c\�\�\�|��wf�\�\�\�WV~kb\��\�b�pd0p\0P �r@�\�]N\�t4E��Z�����&7U�\0^	\n��N�6�\0[\�\�����I<@\r\�q�Ů�(�\�>\�s\�|!�E�c\�ޗF	�\��\�Ȣ�?�O��p=!\�~���>F\�\�\�\�,w*�����\�q�\�(q8\�5U(Td�-��[k\��x\�)�\�\��\�8O,��h\�{�U_L�>Q��\�qaPz�\�8_���D�\�͘z��=\�\�\�IQ\�ò�m�Z��\�1L\�82^�blm�.��B�p��&\�1�N\�\�1*\�X\�ac\�[�\0�V\�\\7��G�\�f�\��mZ�\\�=(Mi�ϸ�b0\�q���\�ԍ_O(\�m�\�_(\�OT�\�x�\\��BW\�\�\��HGΜh(R�J���M U,\���\�)�y\�!P��$�ap\\\�`��\r\�\�n���@\�IB\0\�W6\ro@/���V/�\�<\�d�ݏ\���֤��	�v-\�l��\�z\�Ub1�q\�~J)\�x̸�\�#i{�\�\����iM\�\�#\�p��:���.c�+�۽\�\��\�s& \"\�c�\�OaTq�,��\Z/K��\�\�|�m:\�K\Z ���=H\"�y��~M#��\�7��E��-�\�n˷\�o�\�qiX�T���[���u��\�\"�Vrױ�\\�t\�o\�&ber\��\�7�\�אָ\�\�)�\�\�h�ǂ�1�ߞ��q�\�\�\��:-\�����\'�o�\"A{\r\���:_m\�P-n<�\�n��p�P}�bT�q�JO�\�y%s5.?U��5\�\0>�?��93S��@\rkm��^\�Z�`��9e�I\�2��Xŀ9G�{e���\�!�\'W�\�5P�9r���6��\0W�����\�kC&�\rM�\��\�\�\�N���t\�m���G�K\��l�Eԛ\�Gn��\�Jo�be\�>h\�O4die\�/���t�q%:��\Z�aul��\��ʏ�\\s3\�qr:�4/��k$C\�_�h\�d2:B,�*��m\\\���TL׆�\r\0\�\��\'� �p�`8��\��\�Kـ�m�]E�[׮���[\�x\�>$\Z.b/ ]΀\�@\��̐ȁ$\�\�\Z\�\Z\�_-�T��\"��\�(\\ѲF���\�\�,F�N�n?�+�\�~u�\�\�t[���$���\�p\\f%O#��US�ހ�v4��o�?�t\�<`\��N�VF�$�Xj� �	s�\�Z\�j\�\�l΍\�G�}j��E�2+E�\�\�l�\�\ZR��u���\��iZ~\n\�B��\r�\�l-͈\�W_�j\�:w}ƒqk����/����$��Vv-7�\�kn�B\np�\�r��!R\r\�#OD��4\�R)�\�\�\�H��g�56\��m�/F]�$\07\'j\�y��,�ֆI��IT�RM�\n�\�m�EmF�Z�旐\�\�~�ĩ��U0��ĉ�\�]X*\��l��ZFKܖ\�\�mw��>\��V�\�R\��\�˔\�g�\"�4\�;\�G\�-y�*�\�\�\�Q��AS�\�X�uE��ň�I1�!|�\�9��Z\�\��֭qNc�\�n]n����Q$A�\0���#\�\�V�U�\�\���\�M�߮�Jy٬	$a�\n;\'+\��bvF[��\�R4[��`�h�Y�P\�4N�\�8�P\�,A�r)#�e\�i~�\�O���8\�|�\0J\�\r���?Ժ\�j+��M#	gNI\��\�_���o7<\\2l\�4�\�7E��gQ\�\�V\�j�\�y&8\��3\�\�\�l\�2a�!\�cK�2� \�\�+Ĝ�Y� �3\�\�gY\0[\�i\0	�\\��ޑto\Z��6J�(\�+�o\��1\�\\\"\�s�Too\�;S\��\�~_�\�Ur) �u� A\�\�\�Z�7R<<��2��u��na\�uP�j�\��l<,!n��\��t\�\�\r�s�՚�\�nV�lA\\\�\�pF�\�\�\�V�ʜ�./�7����H\�Ē\r�w�=t؛\�@nV��a�\��p\�Ƌٲ1o9&\�\�I,\�,	\'rGJ�80|[��꬐f��\\��ye.ڨD\�m�^\�\�\�׹��؎\\0BfY\�\��H\�\n��>)�b�\�\Z[Z\�\��*\�G�\�g?�k\�\�\�kmvޘ\�l1���lI*\��-��`n�\�#\�\�uִM,��\�\�F���\0\�4�Ҵ*�\��\�\�\��}\�\��1~����Q���@:iӿ���\��bE�����\�J\�9n}P\�S���}6\Z_\���\�,b���\�:\\e\r\�ċ\�	\�kmz\�\��0\�t\\�赭��N�`\����\��\�	��i/l%A�]\�\�M\\�\�\�4بW�\�X���]���\\��k�\\\�,dY?+�q�\��.\�\Zч�9�mS#2���\�	DҬ`��\�NVm�\�#Q_Aa��m{XZ�ۥ\�\�=\�@�,5[�3�\np\��\�%�afl��xn\�\�\�\�B��c��j\�Uj�<cp�F\�\�B�~�c��\�͜K\�\��_s��h>\�Zﶮ-Q\Z�\�ƭ.\�(P,O\�NõbI-i\�\�\�+�\�\Z��*�@\�\r�nlc,E<F\�`�9>�eB\�{_QT�op�e_t�ױ\�\�\�^��8\�e��.���k�\�.\���\�g�\���$=\�\��\n\r#A�qϋ��\�(���jW�a\�_\�\r{��\��\�\�1\�a\�qx���\�e�O\�SmH\Z�Z&��e#0���\�_Fv�ł��\�\�O��,B�A\n.,@>�U&��.\�zi�\0\�\�L\�`B�\�6\�H\�h\�\�`T���/CR|6U���Hl[Mmqm{\Z���l8����\�+b\n�$\�P~�	$\ruԌ\�\�g�&\�\�\�\�Լ�cV�w�޽t\�&\�O��\�x�d!��f � �V3+[\�Hg\'X\�MA+\�C!\"O{܂|�\�crl�l�幱��\�H�=\�G��?���S\�r\�|W3�0\�<�y�\�\�ʊ��gbv��\�\\1���\�I�8�\n\�6#o\rfr%t���\�3�tć\�z\�y#ٌxs�V9��\�#\"ʽn\�\�3\�\r\�ϺG��j\0\�c$/.P\�99c\��*��lr\����/��s�<ɏ\rIL6|��\�F\Z\\�\Z\�\�\�\�|ۅ:_\�H7��~~��\�\�\�\���[4�\�\�\�g�\��\0W�NA\�\��a\Z/\�Q\�?3��l~\'\�\�$~\"��r\Z\�\�V;%�\�R�O�뭌,\�����y�\�\�9BA:\\X\�m{[�����qܞ*	�m\�\�\�\\\�`�.Bf\'U:\�:\�M��;R\��\�K�\�\�\�P\��v\�kG\��\�kmC�ى$�rI�\'ԝI���\Z�.%����X\�smԱ\�\��\�\�<n�\0u7\�\�]ʦGt��|�>Y׳�\��t\�pl\�Sv[\�0�\�6\��F�&\��u��\0\r&WF\���\rh\�>Bf\�\�\���u;\���u\�A\�\�x�Ŵ��\�l�8�H\��\�*�2\�uЫ�\�m\�\�\�\�d�\�A;|�\��7�9\'�s0W��\01\�H<��$�%�\�\�+�\�\��:�k��T\"��\no�\�\�r����\\\��|C����\�Sǳ<)�	\n3�o�\�\�&`Gꨏ\�\�\�!��R&A-\�Th\�17�Z\��\�\�\\�/�4\�a�f�\'>q`{��?��iPYW��\�\'\"E*L���\�]/e���}(4�\�\�X\�\�x�U,l\�	\�n\�gڶ-�\�e1��\�]AU\�\r\�\�\��R;\�d:4�\�b\�\�\�6W2\�\�\��ꜥ�Ӈ\�Y|1M8��	<2�\�`2�__Zd\�<�6`S\��(\��=uО\�RCH�3-�7�nC�O��+o\�LX\�\�\"�g\�eE�Φ�\057$V�\�\�\����*�[VL%�\�\n֎B�\�\�T�\0�c�;��\�(\�(�b�U%\�c\�kmOMiw��%h�\�1U`\�\r�\�W0��c�2�\�>\Z\'tc\�ͳJ*\��j.Y��?�wZ������\�=�\�V�>>	k�O�y\�$lJȪA!O��9E�����{?��\���\�n,l%a��\�I{e?��=m\���a���n�u����\Z\�9�G��x��8`%L͑�U\\ʾ��$��\rX�\���S��\�\�3�_��qy�XB�y<o�Z\�\�hm���\�o~�-\�eV\��\n�:��\�\������Q� @\�m\�L<Ǆ�ˆ�e�<�T��\�s\� �n�-Wp|��\���fˈ�\�%\�L���\�\�\�:g�����#�X׺�{\�\�^P\�H\Z�\�9Ø\�\�3I8�\�6E<���\�5���m�4�.0\�\�w\'RO�\�]�\�p�IaUu.�\�\�L\�fPr�\�\0\�鶂\�@\\Buy�a��\�(�@H޺�z�\�B\�(\�(��Ʊ\�22��A7=\��\����>\�?:V\��s|�܍	\Zi��\�N}ĉ�\�L��U㐞�P�So[P\�p\�K)�V\�F\�\�y�@ԡ\�F����Kҹ�\�}T[GmZ�\�9M\����#\�	�\�\�p��x�A�\�L�\�\�H�3�1\�`l�Һ�,��3b*A�9R	`E�\�\�\�jù\��pϖ0I�2bX\�\�N\���׾FS*\�|W\\ykjT֛u\�EW��NCOF�\��nlM�	\��ӄU*\�E���O&��f[i}\0\�}\�k��N#\Z#�fV\�(�t�&�㘬f;\�m\�@\��\�v�s;RI�����ۭxF�+�\�uD��q�Hb8�b\06IX���\�W%\�l$�Y��{2��nH>k�4#�y\��\"\�\0��[8܁o2׽\��¥@\�\r�}�s\��\�}+<x\�\�\0�ԟQ�X\n[O\�%A��_Zrd�\�p\�2�o\�K��\�\�#S�62��\��+\�[�.\Zm��}V\�B\�=��6\"Vh\��\�=T!\n\�?:ύk٢�\�%\r�\�F�\�\�\�_��[�^��pn$\�++\�\��\"�\�o\��U�7\0\���T�ErCq\r&g��\�\�W(Π\�;��*\�K\Z�\�yx�!\"\��!��g[gV��\n�-��])��y%�ٚV1$M�Q�`�j<\�|ljإdy�e[\�]T��a9v�P2-�v\'\�\0I?�:\�3p�;\ZÙ����skCP�؈\�\�]\���{N\�&#�G�[4�\�A$\�\�j\�\�.@[)!�\�\�\�\r��H��P\�^	f���RR0�~��*�����\n�{U̦\�A�\��E�x�\"`����\��\0e\Z�\��d��\�\' !�\Z�A�	3�\���\'�ָ>s�\�m\�l��%�Mx\�\�A�Ŝ��\�݁�Cr/֢\�\�\�o\�j&\�T�~\r����j�\�\�Tf��B�\�\�å\�3\�\ZȘw6e,\�k\�(�p~˨��7\�SV\Z�z\�m��\�ָMM*�/\�\'�H|\�-�\�\�\�\�*�0�\�:�-L�ܪ\�V��ʪEݝ�\��\n�\�\�M\�\0\�.®\�;�\r�C1�{$nY	q{+�Xe-m�v&��\�g\�\�l\�Y�\�R�u�^�\�@��D�\�>\�Ofm-\�X \�\�\"��\��d_-�z6\'�z\\�`|7��71���\�\�n-�� ���Z\\��\�p#y�b2��9X^\�@�7����\�K��c7,\\��S�i�_j�\�@*��\0A&��Y+�\�;��jN�\�:\r�܍�Pj=	��\�F\\F\�kh\r�\�u6�5��5`-��VQNZ\�x��@���\�M�Fr%�e���\�\���{(o)`\�Jwf\��G_Ap~\�y\�<!qorm\�R͛B.�\n���\�pq͈!�4]���\�30FwTrȒK�$A;\r\�\�\�o\�1�7(��P\\o�\�L.d�et\�\n!��:)̻kk\����\�;\�1\�\�\�!�gu.~֛֨E�{\\/`mJ\�4B��*G�y\�V�UPm���y�i1���c�\�dB2`M\�tNۚ\�x\�\\`שg6��\Z�\�_�a\���\��tJ̴\�k>GHeU���{��\�߬=k.\�xx�D\�L�I&\ZG\�_\�U\�o3*jubF�����\�\0O\�M�\r�A|E\�Ղq\�\�`\�8��J���X�5��t#A��\�\\d�j\Zf\�\�x��C_53E�x}�\�y\�<3��$_\�cX��\"�O���\�X�\\1\�mJ�̳��\�uG�\�E�H�e�g\�m.�\�u\�s��<��\�R�yCfc\nA�=\r�	V(��kg\�eb@R:�\��\�\�#\�s�5�/N�Y�\�\�4�r\�I,I$\�I7$�����O\�C�C\�\'\\�˄����\�{(�A�oCKXv�\�2\�/�6��\�Y\�E\Z���\0\�֟��r\��Cc��H\�Q�2��)\�E�u=n\rS<�\Z{\�{\�J6\�Ͽ.Ye�LG�^C��\�\����ںB�_�ύ���B�\�\�\�{��?.8�\"FT(\"a(F�p0\">\�`u����\��\�`I ^��\�\�\�g�4ڑ!˩\�2��?\�\���;�Ky� j�V��b��U�g��\�r�\�!k\�6:rG`\r�)\��ƓE�<G\�O[_2��eV\�ڔ�\�\r�M��h�����V��\�PlGu5a�\�.m\�\�˟�\�V׵\�k]�K�\�\�q2\�l\�2�\'���N\�^�;���ü�5\�\�p�\'��|��)\�610\0�\��2\�\�(\0�\�][)\Zޏ`0q�\�s\�*�ʆ9e�Oz\�]\r�\06YYomA��(\��oJ\�\�\'d��x�\�?Xf˕��]	\�\�ݾ[f�\r�ZG1�f�����U�+yö�6�\�\�^�%�\�>)\�Ǖ\�G9\�F-A\�U@3�sH@�P\�؋\�|\\aq\�\�\�DZ�`XX�:��\��t��\��\�@�^H��\�So�|�81`2He�81\�v\Z([�\n{z@��\0����q�kH͙-q�$5\�̻YE��\����\0�tƉ�X͇�+1�Q�m33}m{�T\�^R�^@J�>\�w]\�M{Xd��ׯ\�Y\�{گ]�l���\�{\��`\��U�4PM�/�sb\�\��n)���H\�B\�17!v�\�M���,��\Z���q\�mb�rlH\"\��4�|�퐣�\"e,�\Zߨ��\�K\ZɆ{X\�\�]3\\F��s\�J\�h\�X1�X\�K�vR�>��x�-QP k{\�$��[\�C�\�+D$\n4��߽\�S]%�Hei��Xr\�)P��f?\"mM>\��a��\�\�\�u+��r\�n_u�V9-0l�\nF2�����\�-�Ɵun\\�\�0�xB@�$F!���s�6�\�54\�Y\�=r�g2�2��N\�\���\\��cTx\���!�/�G�D���0�ғ�\����𓇐�\�I\�\�\�?�6?^�R=\�+d\�ZH�Etf�\�\�\�\�K��\��k\�;\�Y�\�2\�+�#\��\'E>���\�_\�ͣ\���\�ŋ\�2?�\�`x\0�se\�\�,\�	r�\�\�{[~�\n=\';\�\��\�âhde\�q0��N�2\��\�|�\�Y���x�$\��0\��~|��A\�Y�ǝlICbV\���=*\r\�\�#6\�c�K\��P���:֧�Mv���N��\�\��vX\�b\�\�\�\�=\�6�\�E��f&�X�#���\�|1kbđ\�\�۟K¸�Q\�-�\�%E�\�X)\�V֨\�\��4�|ԣ�7�.\n\��\��j�]\�a(7\�)1���;��\\C�,��:�W:eo1*j͔�\�=iߜ��/��#�\�L���\"�\�2�{\�iFZo�\�?d�ڣSJ59%�>!x\�>8px\�q �#y�Q��㡸��+\��|W\�\�G*�\0%���S�6\�\�Qk��\�<*8�1\�\��\�}\�\�\�~�y0\�\0m\�mM�oR�\�K�t\0O \�`n?�炌8�\�LL\�\��H\0TX~>���\�(�7\�\�,\�lG�\��\��\�\�jڟ\�\�=+��\�A��t\�9�\���>�Ϣ�x(c\�J��Ak�\�׶�G^��\r�\�E�\�.�ڱ��\r\�]�?\n<29\'ɒ\�O����C\r_[\�\�\�Pv\Z���p���$\�\"6,�\\�dm\rŏ�\�\�]M\�>E\��//v��//\�\��7(Y�	�:\�R\\�\�\��P7�#��oКk\��\�&�1K����\�\��\�\�\n8�-��\Zl+�xDXO#27ذW+)\�F�e߭��v��J\�r_n�\"ʣ��:\�\�\�\�\�	n\�̠�E/�QF\�:\"\�K���\�}T\��\�z�\�\��O��UF\�\�cr���6��1)\"�e1N\�E��O0\Z��i��}E�ê_*�M�7 *\��9T����C`K\�ēm�1�\05���.�(�߻_[\�čz\�w�P�Ўh�$>\����E?��\0���\�\n�20��*GpE�\�I��Y��\�\�\�\ZH㜺Q���fK\"\�\�q�\�O���\�ئl*$��!-�\�Z([����+\�8�l%N�\������?Ϛ�Z�Lw(4�Ɇbꄧ�\�\�L���]n��\���f��Ȭ�ف\�޵V\���\�Hܯ\�\'��|c�F\�u�%\�Fep\�\�\��nI�x~\�\�a�2\�\�\�\��5�\��ϫS\�\�\�g@S�77��B\�\�#\Z俄�tܟ��\�\\<\��H˭��A��epF\�/\�\�j�`��H����\�\�\�}-��\\\�4\�{\Z�\�\�|FSU@\�.��E^��,\��l\�\�{lz\r\�5ˌ\�\�V��\r_\"�Ar\r�&�H�\�^TxӉgD�8؀4:���v�\�;�`]$�ǚAb\�%\�al\�;�^\���\�fu\�a�\�{\�\�rR\�vt���4�:-��	&QD8G\�+x\�h�\rd�ʶ:lw�=i����hel6,\��q�\r�\�/��P\�pEW�LT�G�.\r�X BB\�.7\���6b�nI��&P\�z��\�u~�Y{\��\�\��\�\��\�\"y�\�\������\��[u\�D�*Ɍ�&��q�?:E�7+c��\�-�4\�\�ۗ\"���PϘU��\n.B\�a�\��,\r\�+@U\0\0�\�\n\�9٤6}�t�d\r����6�sݬ<ͫ\�\�E\�w�c�\�\�W�fÉ\�@��c�$�7;\�^\"�..:F�3�\�ߚ\�\�W>s㫃¼���-�%�|\0\'\�Z��%g\�\���S�\0Q|��A\�\�I?1@%\�S\0ǿfnr�o0�U�\�0K �\�N�\�s�T�I\�\�\���K�X��y|�[q�R^5�\'�h���\�kA\�Qx�-Ɗ?�\�f�\�\Z5\�02�.\�U9\�\0kn\�.܍�Ypϒ\�p���\0`3w7�\0\0\0�\n�捅�;��\��Q*�jT�R�%9&���H�H�%^\�,ARA�\��d~Ú�\�1�\�y����S�8c0\�bx\�I��\��ue%H:X\�?/8bp\�a\�\�\�Xh̀���u\�zh[zaū�>!ᷢ��֐�>��2��\�����\�ά\�\�`��\�\�E��\'�\�P\��\�E�6�^��\0\�/�\�¾�e,/k\�co�~��\�\�:x��`g6\�4c0 lzZ\�ں\�\�~?��\�\'��[\�k�\�\�-�YV�kt\�\�4n\�A{\��\�)\��\0[\�v�sr��c���&��\�O\�Pp-J\�{b���O�o���{P�\���K�;\�t���J~.a6/��o\��W_�zW.\��wU\"T�\0\�0�ݨ�<B6ف�\Z\�\r6YU>FP�?\n;B��\�I��\�<2�6\�\�\'�%u�\0\r\n\�.ta��\�dB�\�*���T\�\�)\�|_\�1g��͓�\0J/\�\�G�e/�\�\�\��T\�v��\0/\�T�^!a�(Sh\�P~\��WT�7;�MBq��#X�\�@���(ep�K!�O��[|\�Nҧ<ጰ,A��pn?T��\�}�\�_�\Z��m�4o�\�LD>a�8$��t|\�(�\�:r4\0c\�!�b\��1�9\�x\��E�h\�Adp�\�0,�\�\�\Z���-[�C�$^\�/�\��՚�*)�R�J�\�\\#2<jB�s�s��G�J��#\�B\��L��CMLI�xw\��j\�\�ۥ�&��&^���\�V�\'+\�$�����\�N~E���\0q\����hJ\�xyČ@�_)B2\��5�\0�)��Ez�S���\�>.\�)6�M�e\���}�����\�\�W6qs{�1�2\�7&�\�~*��\n? \�\��7\�=~��ƣ\�+\�\�\�\�U5)ܜBĹ\�.�>\�iFe\�kرU]uf���U��hϦqo��Oi��\'\�a�k\��7\0\�\�\�\�v���q�\�9�\��\�u!6����ܥ��8�$e��3�\�5\�������y�@�N�J�\�*0��u\�\�`]\�����A��\�\�\�\�\��\�.�Y\\,��B������Jف-�� �=/�Ub�\�����\�t\�\�\�\�\nc����\�@�E���\�6��\�Lrb���q�bcN�>�\�\�V�`�����@n\�\�j\n���\�0���mw�\0�� |�BjY��Zf\�-~�H\��A�\�NŸ	\�Ҵn\r��\�?\�E\�m~�E5z�J���J�(B�*T�\n�\rb\�ٿG\�]XО;�H�1��*O@WQ��*��N\�*}EU�\�Z\�\�dh\�\�|\�\�\��n4���ϱ@�1\�=I�\����\�л(��\�/�jI����v�x�:\�\\\�2�Y$��\�W\�\�\�ߴ��mUߗ����3|3���� �&!Tw.\��S\�\�yC��\�P*dt%\\K\0F�-p\�\�\0�y��\�\��mT�aY4��k\���/\�P\n4\�R\�#�v\�L��\0�h\n�	N�\0J�+\�xx�\�W�\�\�\�\�\��M%ǌ\�XY\\�R�;�I��\�\r�\�*�\�\�h-ҏs�.\�\"E?�W��\�q%W[[\�P�w�x�\�\�\"�ϫ�R4���\�j۰\�J�\�čGc\�Vw\�\�0�Kr�1�l���?h^���S_�*T��*T�B�R�AyÄ�\'\n�d��7b?�$|\�\�^\�~O�`	\�]Z\�A�|\�\�T!ѐ\������6!�����!�D�\�\ZV\��\�Y�\�\"�9ģ\�\"ȡ\�lJ�5�6�\�kd�s�e\r�A\�f�n\r/͎���D�����²�)\�J�M���$\�$\�<w\�-\�F\"\�}E�f\�DD�VD\�\�k\�h��_���2/z��>MƍcTX\��z\�\��G�b��c�\�k/�����W��ھ�\��\��`Q�Kmu���y�`N���\0�fr�q\�2b\�m(\��\�H\�\�M��eu\�x����K\\Y�ȶ:V�;,j�H;\nMXin4�Qލ`8�K\�\�b@�p�w>|\�z(\'\�Jk\��<��X~�G\�w�(\�%r\�/<��\�Li�����ʾl�\�|MiT�r`�\�WN�Ec3{���\�\��\\\0�!�\�k��|\�.HD\�K{\�ko\��B��V=\�h�\�޲�\�i�ae�Uf\�\�h�H$��\�@�MZ��62\�jnAQ�;\�o*�^1ĒEH\�y�۵�A��\�@\�ߥZ?�,\��@�\� m��k\�E5*T�B�R�R�J�!JA\�\�9�e�{��_\��\���~\�?U.3\�#\�\��J.�,m�\�==��,lp\�Uӗ$\�\�e\�MR�vq$+\"H\�\�\"\�P/J\�\�ػ�Q�*��\�0˦�\��\�Wyw�͂\�G4�\�#C�\�|<�2�A\�/M� R�fi	�E\�r;\�¥��YO�U?����\�\�b&��\�j\�0�\�quu#�5e9���s;\�m~�NW��Y \�x�:\�8��\\H7�H \�\�\n�v\�A$rfb<VV��bAfPԞ�[\�uU\�\��\�É\�\�c:�\�+��\��&��V\�\�k\��*5ըJg�\��K/��j�tR\�$\�P\�&\�\���\�>n����\�ʜ\�\�1��\"�mz+����\�x9g��\�9�ml���$\nϱ�X�\r�;�J|��\�\�\�L&�	\r`ɩ`��l�W+��\�k\����\�X���\�,t\�ړ�*\ZHTp�r\�\n\�xX0\�\�Y��7�\�_�\�\"u\r�K\�evtE\�\�\�\�\�V�5\�J���J�(B�*T�\nT�R�)R�J�y��\�\� /�\0\�bvFkm�/��%c�C�C\�q,FQ\�\�\�\�p~�\�\�P����\�s�G\�g\�\�K�ܩ�OO��?.H��_��\0lH����}6\�Eo\�P\Z\�xt{�:�Ҩ�\"uj���\�\�3a]?��\0��r�\�^c������P@\\è9��}\ZxZ�g?\�*�\'�#�6V��V�k?r��?oҷ�o?�\�`�\\P\�\0\�8S��f���H��o\���&Ho�1\\9\��(\�O������9>#H�1�ȁn{��A�\�bKg��5�[��\Z\�ǒ5��\n\�\�V¬��I%\�0bn\�.����V�8l0\�JʀM�Ѐ��am�(=I�\��\�0�|!��nc�e�9\�>4w�DX\��@b\�|�w�ʣ�����\�\�,d`\Z\�K\�ަ����y�,,+\�R�J�!J�*P��\�');
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
