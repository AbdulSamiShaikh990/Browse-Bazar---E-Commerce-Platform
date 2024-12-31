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
INSERT INTO `product` VALUES (6,'Red Nike Shoes','High quality	',5000.00,50,1,_binary '�\��\�\0JFIF\0\0\0\0\0\0�\�\0�\0		\n\n	\r\r\r \"\" $(4,$&1\'-=-157:::#+?D?8C49:7\n\n\n\r\r\Z\Z7%%77777777777777777777777777777777777777777777777777��\0\0�\0\�\0�\�\0\0\0\0\0\0\0\0\0\0\0\0\0\0�\�\0;\0	\0\0\0\0\0\0!1AQ\"2aq#B��3R���\��b\�CDc����\�\0\0\0\0\0\0\0\0\0\0\0\0�\�\02\0\0\0\0\0\0!1A\"Qa�2q��B�\��3�\��#�\�\0\0\0?\0\�ך~�	�Q��C��h\0��@Fʔ�P�<�2J#m�ԡrZ5P�N\�QYB�C\"*�EQA( \Z�P\r �d�P��A��@\0Y\0�bJ\�\0$�\r�\Zy�9\�G�c�\05����<�\\(X���\�z̔�i��|6i&��\�}�m\�\�ex\�Ǝ�YT\\�e\�ZN\�E��P�J��P��H�@4 �@0�� T1\Z\0@; \�\�\�wP���\�hj�SᲺ�s�A����\�h\��+��4�Ϗ�ƌ�Ų\�>1%\�\�h,\�Ycݵ\�=�	�cG8��$v��rd�b\�T\��)�\\L�U(�\r\0\�@\r\0!tt&Չ ����.�����\ZZfg�w�\�o��_\�,����9�����V?³�q�lύ��w�Gg-��w�?��\�tp|\�}Y7����ts\�T\��RRֶ\�G��H\'\�4Z\'J�z4z�|�Q�\�\Z�WF&�.�\�YS\�\��}C�GgK�\�\�\�E\�x��u�#����^\�\�n\�[�nP�#��w���\��\�m���cٝ\�\�H\�\�6�6[\nP�\\\�)!d��d(\� A$ ��6�FH!�(B�|jl/dԯdR\�Hl�38\�r���BWf��6|�\0�\�\�^\�ܤ��ٴ�\�\�NJY#|0\�(k�\n�we1\0	\�\�A���$.�\0nx{p���4\�^\�\�ѯ�G�9�\��仜\�N�j�\�\�\�Q���GOQn��B���Wk\\�\0S�eU\�k\Z\�\�\�54rK\�\�|������ؘ\�f\�.{_\�Ϣ\�-�1}�; �(\�\�\"9�1���l\�\�\�\�\�F\�\�N)\�g�\�ω��/-G\�4nL\�\�S�y\�\�GP�E\������;�2\"U(��.�e\0�a\0�H\0\�\�\�1cBjOp�7<\�%��]�P��9jʪ��������YwF*\�\�u\�-\�~F�\�K�\�qo�Y\�t��8��to��l���\�\�5���Z��L�#\���ּ\�\�R�\�ə\�\�ŮVc���\��n8{\n��Ţ��m\�\�Z\�h\�\�\�\�,[v5t�-,em�#�\�z�]����ޗ`�������.�\�cs[�F~�	{\��\0\�\���\�Ka\�$�m�+g��f..C�\0.럒\�R\�\�\r��Md�tN-x-p\�\�f\�O\'����I+#\"\0 @1�\�\0 \0�acvX����`P�\��L�1�}�nrX��΋~�<�/��(��\�x�\��F,� y��]]��Wĳ��66��M��lwU�\��[��\�L\�\�`,rOm�n]�ٲ_�A\�\�\�-s#����f@M��\�㫮l�3��c�\�x\Z6\��1�q\rCLu)p��\��u��V\�\"\�Xqz��\0���,z��}\�6�HCKݝ۸����s\�u�ٔ\�Hdi-vSo\�^M\���̘[-v)$7/�\�mr�|/��\�\�S\�߹�v�7\�\��\�\r6ERց,dF\�9��kతxޗ����\�\�\�\�$6\�GТ���\0�@$\0*�cV$,\�Y�e\�-\�\�\�k�c&h�\�\�\��\0\�\�\����W\�$y<�>�K�=�>M\�9[)\�Y�\��(|��\� ,�i\�e٢sQ{$�E\�\0���o\'��$\�\��ˣ�>O��\�b\�tB�˳/�x�\\��5+S�\�\�Pk�\�\�f\�qH0\�Yr9\�6w��#\�c�Kɶ\�Dh�ͼ�\�\�zҍe=�p�7�lc;�5\�F����T\�b��7\�\�����\�?�\�\��\0\'�\�8l���\�\�@�=W2YG�;�\�e���˘\�u�0j#����j�:+��\�J�=\�\�QE�\��\�^./\�z�Ԫ�\��=S^�U@_IU\�4�\�4\���\�\�qk\'�\�\�\�T�\�ϒ���ʸ�)*P@\0\� \Z�B�	��&\�X9(Fs��5VNգ.�\�\�y\0�(X�O��i{�l\��\��K��A���\�G;u���daI1�\�l��H�\�G\�`Ԛ�^~�\�\�\�\�2\�A��O�{��o8o\rm~%I�N\�֥l\�_);i��\�\�_�u�L�(\��-�æñ7\�\�D\�fc��E\��.�Z��\�\�S�Ҳ??\�\�\�b\�f�>��EWP\�\�\\\��\Z�zu?\�wi�u\�\��|\�\�V�\�\n\��\��\�,\�b|_���:ҟcȵ�\�/\��\�p\�=�\�}��\�\�M\�_	|\r�g74\���_-�\�\�+��7�K�\�p�s�#�]\�q\�gu=|שE\n/�\�\���Ų��1�R\�8s\�\�\0(o2�[8\�;�G���\�]؏,�\\N�lB�J�ɻ�\r���m�\�e��\�\�OZ�~�\03]!\�b���\0��APA���6�@�?\���e��R\�atO�M:�%\\������\0lo{�6w��s�]��\�*�iI\�R\�0嗳�$�<_G\�Bع8\�\�\�ȥ�1�i\�<\rP�ܺ_�l�\�Kn\�|\�\n>��f/�\r\�3\����\�e#deυ\�7�\�okϓԄ\�\�\�Ea���\�.&!�\�\�? .��\�j�Xm�RG\�\�]�NUK+�\��4?I�\�\��yԭ��\�5\�7\�?���z�6C\�v�^�ݿ>#�O\�v	&h\"�c-\�?�^r�\\�\�3���\�\�s�1OW;P6�^����]�V�]�l�\�⸥6Mw>\�Ѭ��]Y\Z\�G��\�]��lO9ű9�\Z�M;��X�ľ�],�\�Z\Z��\�~_\�ֽ\�JGiIT	\0 \0��  @H$�\n_�5��s�\�\�c\�n�+�\��(\�XM�)�V?\�9\�\�\�g\�ڧ|$D���i�\�o�\�x1\�(>aɓ���\���V\�t\�7?\�����qe�\�ܢ\��|�Br�H\�}�XO\�\��7�b8�0���~���\�;r*B\�\��E�J58\�\���x�}V9�:z�\��\�^M�\Z<�\�]Ҝ�&e\n+�{pXF��p#�U��XE,ZB\�t�IN^��\�J���\�\�1�^�\n�i͙\�G\�]\�F��x�M�\�p��\�>����wM;\�s�_@:\�[l��\�q�\�צ�ek���nuּ$	T@\0 �(!\0 \Z�\nXбd+��6\�\�\��[!^yg.�R�X]��\�縒���ĶR�\�)\�\�45(\��Aͨ\�K!��2r9[��ֶ��r\�였\�\Z��E��\0\�e�Q|Q���C�\�.��O���\�\����׶\\�]0�G\'����a�bU̡�w\�\�;��\\\�\�k�\�\\�=2����pv\�Ɓ#FV0s6^��F�=UVz�����<ʶ�Z�\�4\�\��w\�\�/ssy��zjaL �.�:�P(�\0�J�\0B\���O8�7[a,\�\�jv��{�\�E��=́������\�c�\�tS8*�.dw\��\�\�\\�n�2���4\�V	��\�\�f\r��7�\Z\�7m&�I\�\�\�ڨ��2��\�Q;6Y^\�\�}����\�\�\�����\�!�ŀ\�.��!��������\�U{}�/�j]�*�\�\�8��ğR\�D[Dލ^]�{�σ\��?K5J+�&��\�I衂��]\n��@�\0PJ��$5�\�$.Jr�R�(�h\�\�H$�_\���\�	C�8nvy|e�\�G8\�p�)fO��\Zs\�\��lς\�G\�|����ַK\�.�\�ko&ԋ\�[^\�DhV�dd�\�S\� \�j\�)#	85�\�\�|�\�}ǐ\Z��M��Y\�\�c�fҝ�a�����ؗ�Tc&��;�\�w��b�\rc�\�\�\�i�\���\�ɭ\�*\�\�\�x\�\�]���n�8{ǢӬ\�n�\"g\�Z\'��w\�\�A�\\\�E�\r\�d\��Q��!A\0 \0 \Z\�\�h�pm\�����޺6\�=ѷrј�\�fO���\�?�n)��\�\�n/���-r�Z18dպ�j\�\�k𛖲\r|��dNl�ܯuv�!j �\"�\�Y�6��l�Ql\�Z�G�LF+�\�a\�UY�Z\�\'��\�6��������\Z�\0���Ha�&}ȅ\�\�o\�e�1)�7^	�V�)\�4��w�\�~\'�\0\�蝏\�\�]+�v8V�`\�dk\�\Z��\�軫��W=�j\�\�\��\�V\�K@rFGy㟢\�\�j��`n\�袞�9g+�\�@�0{jm�2\�o�Kڡ\�L6�Hh�C\n2�B�\0P�( ���U\�95U1d�%-\'be�/��\�%ɋ;)&A�\��\�g�pN�ȥ����<��\�\�\�\�Iu\"\�Q9\�\�y��\�\�=��2\��\�ࡑ\��\�\�ʪ\��Cۊ\��\�m?W	d0��[�\�7S&\�.\Z�gz���@\�lZh�\03#\�Et�fE>�6�1�p���4ꯤa+/�\\#\�S�)\Z\Z9Yc=K�k�����\n�F��ךRGݺ\�\�.\�\�Lc���q��+Vpz�L\�dEFθR\�\��:�^T6���B\�v@%\0(\0*Q�\Z�V��,Ī�mF��>J�\���\�F�[��p�\�}�\�z���=�=��Y�\�+�{�\�}AY)\�\�k~��_\�_X�6�?�+/w�\0KԾ��\��XNϙW��?\�./�1G�h�c\�d�ߚ�6T\�\Z�5}c�\r�\��_\�ؽ\Z~g�r#i�J��c3^�\�e�©YȻԬ\\\�\�I\�G\�K\�K<,�\�\'\\t�C�K��ha�f�H2�\�\0B�HB\r\0*PB\r\0*P@\0�\�.U\�\0S i�F\�d\0@P(�\0\�	A\0 ���\0�,�\ZER����jN\� !\�\n2��b\�@���\0\�\0P	B����P\0T\r�\�'),(7,'Lipstick','Red color Lipstick	',400.00,100,2,_binary '�\��\�\0JFIF\0\0\0\0\0\0�\�\0�\0	( %!1!%)+..2?83,8(-0+\n\n\n\r\Z-%%-+--6------7-7---.---.--+.5+1--.5+--+-.-----+----0��\0\0\�\0\�\"\0�\�\0\0\0\0\0\0\0\0\0\0\0\0\0\0�\�\0O\0\n	\n\0\0\0\0!1Aq\"2Qars������#35Bb��\�\�%4CRct�\�\��$���DSd����\�\0\Z\0\0\0\0\0\0\0\0\0\0\0\0�\�\0+\0\0\0\0\0\0\0\0!1Aq23Q�\�\��\"a���\�\0\0\0?\0�Qx\�UM���\�H�d^=�οA\\\Z�\r��~=\�c\Z��\0[\�\��z\�;\\.	#�A\�\�\�\�ؐn\���\'D]\�\�L�\�\�ط���@ő\�z�2;��\�A��8\�\'i��+e�6�Z\��?\'m>E#-Խ�`i\Z�xk��\�ӿ�rӂ\�g ����;���\�]� 숈��������������������8vŁY\�\�\���ʰ+vα�4@\�-g�i,�`u�\�_{}V��O�mt���)\�m62\�\�wy�uW]s�\�:44�z\�9��\��xpmS\ZZH�Aoin\��#%J\�s�C�\�\\1AP*\�\�>T.\�)\�o�5\��I��\�$�TR�3���\�V+\�HK��sa���֜�G\0���>\r\����\�ٚ�DDX�C(C9I\�dLk=��c��>[\��ԌMS�.�\0\�w�A>Ad^��nа�adl�ژ#���\�\�\� �����QY��i\"\"\" \"\"\" \"\"\" \"\"��Vs��\�ڳ���*�\�\�`�\"@8o���\�5^�@mŚ\�6\�<\�\�\n5Y�-dQ�h\�7�\�ٽ-[��Zf�]\��x\���\�\�nGoa\�U�n�c\�\�#h��\07\�dҵ�\\4�\r���\��\�E�)\�Vdn�ֽ�@Z$ߥ�U��nh`3�zIc�DR�w@�I\�	��qw=S1\�:mh\�\�\�2��\�\�Æ*\"�\�\�\�\�I���\0���\�O��w���\��n��?��\0�u������zG\�\'��\�Y�\Z\\��X۬5���͈\�\��c\�l�\�X\�j�\�{ccE\��\Z\�\�I�*\�9��\ZY�\�jd7���{E\�^|ô��93�j�\�\�\�_\�n#o����ե5ov���\�\�Уv�-+�\'y�Co�Yz�����\�kZ\Zִ�\0o\�m0Z\�h���6\�\�\��A\�AD6��\�ݞ@�L�`\��\�\r\nc��~��K٤l�\0�;7�Qs�S��sl�9���W���t�K�,�;\�\�\'Tn\�Ω��n�M\�\�m\�\��\r-Tr�:\'�F�\�E�h^ʐ\�%uCj�8Y$��\�Zll\��:��\'w�D�58=��w\�DE.\" \"\"\" \"\"\" \"\"�\�xQi\�\�\�\�\�*ݓa\�UE��������b\�8��\�:wL�IS<�\�\��,na-ݬ��\"\�.�\�\�Դ�*E�Oo�I#\��F)d��\�\0�\���H\�^�A�\�9\�S46�Q;���\��m�\�\�1s\�l0[uf�:|�7\�/�Ug�TRw���\ZH\�42x�M<׵�\�x������\�\�s�>\�_�Q(O�F�)O\�\��\0�lt�9J[��\��\�_\����v�>S�\�\�\�[]&��u �x������m\�g�\�d\r��.L�`\�\�\�N\�ơ=#�ꍞS�wh\0,[q.����\��wk@�.WD\�\�{\�d��w\'RL��ƒ@\�OP\�=��kC��<E�r\�&H\�H\� �8kr����\�rp\��\�\��6�\�\�>@���N���>G\�UΌ\���E\�\�\'�\�:DW|\�L��\�i�\"\"(\"\"\" \"\"\" \"\"\�\�vtCA	{\�t�|7\Z\�;/m��{��U�\��\�&����Dű�\�\�Y\�\�ਪ\�&s�+��;�$�qq\���&^�.�o�\�\���%pg�mMd\r���\�QN1�\�\�f�N�.6\��\�y���{ʭ�o�Ի\\\�QKm\���U���������]���Dz+z#��-m\�<u�}3at\�t�h��\�\�\Z\�\��!\rh\�\�n7[\�z-\�=KC��5�5���ڎ?P�?R�\�L;�\�^\�\'`\��7�\�QI+yC3���rR\�=6��\0��\Z\�\�k�\�\�h�9����ﲍT�!\�\�\� eK�\�7�i��H\�\�p\�m��f����pح�\�3�����Q�Z{!\Z<�V(:\�i/\��{i�\�Y��=��\�o\��p{*%\�\�\�\��E�����q\�.Q)>��pWUK��hq�͸m\�\�c���\�1���(\�Z\Z\�`\�\0@Mh���\�B\�!l�%\�,���l�yr�\�ճN��\r��\�\�-iɴ\�A�\" \"\"\" \"\".�H\Z�CZ1.$\0Y\'b��\�Kpǭ	?g8����k\�i�⎘�[$\�T\�<3\��ƺ[�\�6lM-\�#q����\�S���[9\"7�X\�l#\�ۛkH\�okb\�(EvT�g�Gk=\�<\�e8��v��\�i	\�/$\�\��Wv�6<{t\�N���Y��$��\�&\�q\�$���\�Oj\�\�W$�\�g��\�H\�c��m��׿�(z-[߼\�hd\�+\�\�<�1��Vv��*>��85Ԣ6\�r��\�;-\�7gZ�4��Q���he\�Z\�EU��o�E!�|�x��-Hv26�\�7?E�*��\�\r�,<̯�eD���zxu*���s�ɲ\'��8%�i;	r���Q�+*i�\��; \�- i�0�ֶC\�sI�\�$��p�9�eQ\��튴\�]y���\��[��\�S;�o\'Un:�k���EÆ\�\�]\��Tx��mP��Cs\�y\�~�m4�(�V�1�X��G\�\�J?��\0��\�/g��DT\�\�й��r%\�+ڊ��D\������\�q\���q��?��cf.cL�\�\�TF\�\�E\�\�m��Ru���u��ܛ9\�\�\�\�)ncf/z���y|\�q{bkɆ7k�\�k:\�\�\�\��\�8DW|\�L�\�nk��b\" \"\"\" /\ZʖE����c\\\�\�\rh�+\�Uzb\�G�(c 1\�d�ny\�V>�\�=wT�`\�9o�/<��|�\��EM~e86!\'o\��\�e�\0Y���ڽ_a��/31=��Q�5�)Dl\�Ɂ\�&��w\�\�	\��#��+���!\�\�B\�u�\�\����3#�\0ٷ��{�\��q�\�\���Ƚc`h���9w\�\�f��\0J-�h}���y���{ʄf�\���:/h)����G\�\�T\�+�{��V��o�h2s`�=\�k*�\�\�^\�4�Ѽ�\�\�{9���qO\�o���6����}3!|�t�kf\�<\Z\�\��!\rh\�\�[mՙ�>xGP\�A<M�/0�\�u�Cb8D��%\�\rh�\�.f�o���9�gQ\�\�ٵV�\�SK+yGN\�k\�\�\�\�L�\�N5�\�\0\�=��Y]\��\�����P�~e�\�q\�?x�\�S?\�ǉ����3O\�|<�=2-Δ\Z\rsO\� ��%\�\��\0膋��\�0\r�\�z1��ֵ\�s�kX\�K�\�4IV\�c\�ٱj\�W�$\�9��Fw\�{ǘn�\�^\�l٩�7�v�G�\�ڪ�2\"\�\�>�\�~oP;w\�\�k@�l��Wك�=�[�\�\"#����������M1R\�\�\�\�־Hå�\�v�k\\G]�o\"�\�=�\�@��~tOi�\�c�?\\��\�o��G��1b\�1\�J�\�v\�6_�*\�a\�\�q;\�S�\�\�1\'y��ꭩ\�\�hu�/��w\rÂ�%\n\�\�S�tB�A�\���B�\�E\�R\�>3��\r��m�\'���e|�K\�cR\�=d|=\�L28���\�(��\�p�uupQ9\�<\�q=}|T\��xR�\�\�<O�K9η\�o�~*\�\�9�:��\����\�\'�\\\�N�Щƫ��ǣY\�S��Q�\�ȾJ<��F\\\Zڊ�\�w#N�\�||\�{��\�F\�\�t�u=8\r\0��\�\0\0o\'�-�^��\0\�\��e�+\�$\�\nY����TFƱ�%\�4\0~e\�~{�#zK��7��7�\�\�\�1H;\�T\�f3 �\�v�\�F��\�{\rK�L����\"\"(\"\"\" \"\"\" \"\"�\�[7\�E��&h{H�1\��\�/\�Se\�<-{\\ǀ\���ai �\n:b\�8\���\\�\�n\�:��$`V�>3bL�3��\�k:\�\�\�m�..<�4\�\�o�\�eV�rD\�1,\�.\�\r\�\��͗\\J�6٥(eu16�+�\0\�\�I\nw�\�j�\"7|#I枱��\�=��ɱ�Z+�\0ԋ\�\nx̤\�\�^\�\�,�_eC\�\�\0\�\�m�\�a�\�\�kV�t!s,ׂ\�\0�\�7H�>�ig,��\�61\�U�-�\�;J�k����ǣY\�S��T�fݪ\�ж^���$��\��p\�\�$\�5�N\��D/n\�*�1e}MEMㇾk\�{L\�荤�wl\�B��F�KL׆\�_�f\�\�\Z�-a\�-6\�u\� ��j�\�˖\�`\\\����{Y��KF\��\��X\�;&\�#\�s\�tҽ\�is\�?\��\0�D��/\�Hk!t\r\�i\�E��\�\�i\�U�Z:��{\�/��D����\�\�p m\�ݫ\��G|:�c\�\��]=C-��\��\�S\r�[��8s\n��\���\�Y�\�m���*��7(���9�o\�e��Y��-~9�\�\�[�u��I��:8\�NO�]��E�c�\�\�X[/ط4\��u��T\�\�\�\�\�k}j6v�f(�CX\Z�og0�\0Y�\�!eP\�$s��%m\�\rPAgNW\'[\�\��ci���K�Fڬxm���z\�Df�\�\�+�#k٩]	�h\�+5yQ�p�v�t\�+%T:\�1�{^\�Yo#�n~�\�Q��\��\�R�72d`�+Ç\�É�\0\�)��i)%�#\'\�\�lf��ط\\83�i��:��@�I֮�殕w\nO\\\�\"V�k�\�]/�gJ\�Eq=�\�\Z$~���6�\0.nF=j\�\�sm�i{XO�\�TΛ1\��vEO\�\�Wn�٫�\�\�|�>�*�h�����������������������oҬz��\��e��\�L̵a?J������T�*X��_\�\�z�v�����]�\0��ʗj�{�\�5\��O�Q۳A�W_+\�\�\�q�\0ɧޯ�͏V��~\�/d/�4�I\�5}�\�?\�D}\�\�܁�,\r\��J��D@DDD@DDD@DDD@DDD@DDD@T��U~�@W��t�\�N\�\�kH\�k{�R�埏\��B�Bn\�z�>�\�c\�\��}���\�\�lWq��\�J5]�\�\����9\�\�H\�D/nȮ���\�X�P�Ѕ��mSX<�/����L�P��\�4[�M��\�|\�@)Q\�\" \"\"\" \"\"\" \"\"\" \"\"\" \"\"\" ,������SO\��k�\�\�\"\�Dڍd�\�ޅ�\�,f�\�	\�\�$\�\�1=�J}eO\�	� \�\�\�?\�L=D/xtM���\0$\�KR\�[\�\�irFiPR�>���\'��66\�8�V\��\�');
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
