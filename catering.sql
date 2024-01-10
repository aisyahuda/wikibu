-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               8.0.30 - MySQL Community Server - GPL
-- Server OS:                    Win64
-- HeidiSQL Version:             12.1.0.6537
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Dumping database structure for catering
CREATE DATABASE IF NOT EXISTS `catering` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `catering`;

-- Dumping structure for table catering.customer
CREATE TABLE IF NOT EXISTS `customer` (
  `custID` varchar(4) NOT NULL,
  `email` varchar(30) DEFAULT NULL,
  `password` varchar(30) DEFAULT NULL,
  `name` varchar(40) DEFAULT NULL,
  `address` varchar(60) DEFAULT NULL,
  `phoneNumber` int DEFAULT NULL,
  PRIMARY KEY (`custID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Data exporting was unselected.

-- Dumping structure for table catering.order_info
CREATE TABLE IF NOT EXISTS `order_info` (
  `orderID` varchar(4) NOT NULL,
  `deliveryAddress` varchar(60) DEFAULT NULL,
  `deliveryDate` date DEFAULT NULL,
  `totalAmount` float(5,2) DEFAULT NULL,
  `deliveryTime` time DEFAULT NULL,
  `custID` varchar(4) DEFAULT NULL,
  PRIMARY KEY (`orderID`),
  KEY `custID` (`custID`),
  CONSTRAINT `order_info_ibfk_1` FOREIGN KEY (`custID`) REFERENCES `customer` (`custID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Data exporting was unselected.

-- Dumping structure for table catering.order_item
CREATE TABLE IF NOT EXISTS `order_item` (
  `orderItemID` varchar(4) NOT NULL,
  `menuDescription` varchar(50) DEFAULT NULL,
  `optionSelect` varchar(20) DEFAULT NULL,
  `package` varchar(20) DEFAULT NULL,
  `price` float(5,2) DEFAULT NULL,
  `quantity` int DEFAULT NULL,
  `orderID` varchar(4) DEFAULT NULL,
  PRIMARY KEY (`orderItemID`),
  KEY `orderID` (`orderID`),
  CONSTRAINT `order_item_ibfk_1` FOREIGN KEY (`orderID`) REFERENCES `order_info` (`orderID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Data exporting was unselected.

-- Dumping structure for table catering.review
CREATE TABLE IF NOT EXISTS `review` (
  `reviewID` varchar(4) NOT NULL,
  `review` varchar(50) DEFAULT NULL,
  `rating` int DEFAULT NULL,
  `custID` varchar(4) DEFAULT NULL,
  PRIMARY KEY (`reviewID`),
  KEY `custID` (`custID`),
  CONSTRAINT `review_ibfk_1` FOREIGN KEY (`custID`) REFERENCES `customer` (`custID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Data exporting was unselected.

-- Dumping structure for table catering.staff
CREATE TABLE IF NOT EXISTS `staff` (
  `staffID` varchar(4) NOT NULL,
  `email` varchar(30) DEFAULT NULL,
  `password` varchar(30) DEFAULT NULL,
  `name` varchar(40) DEFAULT NULL,
  `phoneNumber` int DEFAULT NULL,
  PRIMARY KEY (`staffID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Data exporting was unselected.

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
