-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               10.5.9-MariaDB - mariadb.org binary distribution
-- Server OS:                    Win64
-- HeidiSQL Version:             11.1.0.6116
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Dumping database structure for thai_railway
CREATE DATABASE IF NOT EXISTS `thai_railway` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;
USE `thai_railway`;

-- Dumping structure for table thai_railway.mas_station
CREATE TABLE IF NOT EXISTS `mas_station` (
  `mas_station_id` int(11) NOT NULL,
  `mas_station_name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`mas_station_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumping data for table thai_railway.mas_station: ~6 rows (approximately)
/*!40000 ALTER TABLE `mas_station` DISABLE KEYS */;
REPLACE INTO `mas_station` (`mas_station_id`, `mas_station_name`) VALUES
	(1, 'กรุงเทพฯ'),
	(2, 'ราชบุรี'),
	(3, 'เพชรบุรี'),
	(4, 'กาณจนบุรี'),
	(5, 'ประจวบคีรีขันธ์'),
	(6, 'ตาก');
/*!40000 ALTER TABLE `mas_station` ENABLE KEYS */;

-- Dumping structure for table thai_railway.station
CREATE TABLE IF NOT EXISTS `station` (
  `station_id` int(11) NOT NULL AUTO_INCREMENT,
  `start_station` int(11) DEFAULT NULL,
  `end_station` int(11) DEFAULT NULL,
  `start` varchar(50) DEFAULT NULL,
  `arrive` varchar(50) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  PRIMARY KEY (`station_id`) USING BTREE,
  KEY `start_station` (`start_station`),
  KEY `end_station` (`end_station`),
  CONSTRAINT `FK_station_mas_station` FOREIGN KEY (`start_station`) REFERENCES `mas_station` (`mas_station_id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `FK_station_mas_station_2` FOREIGN KEY (`end_station`) REFERENCES `mas_station` (`mas_station_id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table thai_railway.station: ~30 rows (approximately)
/*!40000 ALTER TABLE `station` DISABLE KEYS */;
REPLACE INTO `station` (`station_id`, `start_station`, `end_station`, `start`, `arrive`, `price`) VALUES
	(1, 1, 2, '09:00', '10:00', 40),
	(2, 1, 3, '10:00', '11:30', 80),
	(3, 1, 4, '09:00', '10:30', 80),
	(4, 1, 5, '08:00', '10:00', 120),
	(5, 1, 6, '08:30', '10:30', 160),
	(6, 2, 1, '09:00', '10:00', 40),
	(7, 2, 3, '11:00', '12:00', 40),
	(8, 2, 4, '13:00', '14:00', 40),
	(9, 2, 5, '10:00', '11:30', 80),
	(10, 2, 6, '09:00', '11:00', 160),
	(11, 3, 1, '09:00', '10:00', 80),
	(12, 3, 2, '09:00', '10:00', 40),
	(13, 3, 4, '10:00', '11:00', 40),
	(14, 3, 5, '10:00', '11:30', 80),
	(15, 3, 6, '10:00', '12:00', 200),
	(16, 4, 1, '10:00', '11:30', 80),
	(17, 4, 2, '10:00', '11:00', 40),
	(18, 4, 3, '11:00', '12:30', 80),
	(19, 4, 5, '11:00', '13:00', 120),
	(20, 4, 6, '11:00', '13:30', 160),
	(21, 5, 1, '08:00', '10:00', 120),
	(22, 5, 2, '09:00', '10:30', 80),
	(23, 5, 3, '09:30', '11:00', 80),
	(24, 5, 4, '09:00', '11:00', 120),
	(25, 5, 6, '09:00', '12:30', 300),
	(26, 6, 1, '09:00', '11:30', 160),
	(27, 6, 2, '10:00', '12:30', 160),
	(28, 6, 3, '10:30', '13:30', 200),
	(29, 6, 4, '11:30', '14:00', 160),
	(30, 6, 5, '11:30', '15:00', 300);
/*!40000 ALTER TABLE `station` ENABLE KEYS */;

-- Dumping structure for table thai_railway.ticket
CREATE TABLE IF NOT EXISTS `ticket` (
  `ticket_id` int(11) NOT NULL AUTO_INCREMENT,
  `date_buy` date DEFAULT NULL,
  `station_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`ticket_id`) USING BTREE,
  KEY `FK_ticket_station` (`station_id`) USING BTREE,
  KEY `FK_ticket_users` (`user_id`),
  CONSTRAINT `FK_ticket_station` FOREIGN KEY (`station_id`) REFERENCES `station` (`station_id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `FK_ticket_users` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table thai_railway.ticket: ~0 rows (approximately)
/*!40000 ALTER TABLE `ticket` DISABLE KEYS */;
REPLACE INTO `ticket` (`ticket_id`, `date_buy`, `station_id`, `user_id`) VALUES
	(1, '2021-03-13', 1, 1),
	(2, '2021-03-13', 22, 1);
/*!40000 ALTER TABLE `ticket` ENABLE KEYS */;

-- Dumping structure for table thai_railway.users
CREATE TABLE IF NOT EXISTS `users` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `fname` varchar(50) DEFAULT NULL,
  `lname` varchar(50) DEFAULT NULL,
  `phone` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table thai_railway.users: ~1 rows (approximately)
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
REPLACE INTO `users` (`user_id`, `fname`, `lname`, `phone`) VALUES
	(1, 'Mr.test', 'test', '087564315');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
