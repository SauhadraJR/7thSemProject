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

-- Dumping structure for table bidding_db.admins
CREATE TABLE IF NOT EXISTS `admins` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` text COLLATE utf8mb4_general_ci NOT NULL,
  `username` varchar(200) COLLATE utf8mb4_general_ci NOT NULL,
  `password` text COLLATE utf8mb4_general_ci NOT NULL,
  `email` varchar(200) COLLATE utf8mb4_general_ci NOT NULL,
  `contact` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `address` text COLLATE utf8mb4_general_ci NOT NULL,
  `type` tinyint(1) NOT NULL DEFAULT '2' COMMENT '1=Admin,2=Subscriber',
  `date_created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table bidding_db.admins: ~1 rows (approximately)
INSERT INTO `admins` (`id`, `name`, `username`, `password`, `email`, `contact`, `address`, `type`, `date_created`) VALUES
	(1, 'Administrator', 'admin', '5f4dcc3b5aa765d61d8327deb882cf99', 'admin@admin.com', '+123456789', '', 1, '2020-10-27 09:19:59');

-- Dumping structure for table bidding_db.bids
CREATE TABLE IF NOT EXISTS `bids` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `product_id` int NOT NULL,
  `bid_amount` float NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1=bid,2=confirmed,3=cancelled',
  `date_created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table bidding_db.bids: ~14 rows (approximately)
INSERT INTO `bids` (`id`, `user_id`, `product_id`, `bid_amount`, `status`, `date_created`) VALUES
	(2, 5, 1, 7500, 1, '2020-10-27 14:18:50'),
	(4, 5, 3, 155000, 1, '2020-10-27 16:37:29'),
	(5, 1, 4, 14600, 1, '2023-05-02 11:40:50'),
	(6, 11, 5, 500011, 1, '2023-06-15 15:30:56'),
	(7, 5, 5, 500011, 1, '2023-05-02 15:36:47'),
	(8, 5, 5, 500013, 1, '2023-05-02 15:37:04'),
	(9, 11, 5, 500014, 1, '2023-06-15 15:30:58'),
	(10, 8, 4, 14601, 1, '2023-05-02 16:03:21'),
	(11, 7, 7, 95001, 1, '2023-05-04 09:24:15'),
	(12, 7, 7, 95010, 1, '2023-06-15 21:42:44'),
	(13, 6, 4, 14602, 1, '2023-05-27 22:10:56'),
	(14, 7, 6, 500001, 1, '2023-06-15 21:43:11'),
	(15, 7, 4, 14603, 1, '2023-05-31 14:15:18'),
	(16, 6, 4, 15000, 1, '2023-06-16 12:09:51');

-- Dumping structure for table bidding_db.categories
CREATE TABLE IF NOT EXISTS `categories` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(200) COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table bidding_db.categories: ~6 rows (approximately)
INSERT INTO `categories` (`id`, `name`) VALUES
	(2, 'Appliances'),
	(3, 'Desktop Computers'),
	(4, 'Laptop'),
	(5, 'Mobile Phone'),
	(6, 'Other products'),
	(7, 'Vehicles');

-- Dumping structure for table bidding_db.messages
CREATE TABLE IF NOT EXISTS `messages` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int unsigned NOT NULL,
  `message` varchar(200) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table bidding_db.messages: ~2 rows (approximately)
INSERT INTO `messages` (`id`, `user_id`, `message`) VALUES
	(1, 6, 'Congratulations! You have won the bid.'),
	(2, 7, 'Congratulations! You have won the bid.');

-- Dumping structure for table bidding_db.products
CREATE TABLE IF NOT EXISTS `products` (
  `id` int NOT NULL AUTO_INCREMENT,
  `category_id` int NOT NULL,
  `name` varchar(200) COLLATE utf8mb4_general_ci NOT NULL,
  `description` text COLLATE utf8mb4_general_ci NOT NULL,
  `start_bid` float NOT NULL,
  `regular_price` float NOT NULL,
  `bid_end_datetime` datetime NOT NULL,
  `img_fname` text COLLATE utf8mb4_general_ci NOT NULL,
  `bid_active` tinyint NOT NULL DEFAULT '1',
  `date_created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table bidding_db.products: ~3 rows (approximately)
INSERT INTO `products` (`id`, `category_id`, `name`, `description`, `start_bid`, `regular_price`, `bid_end_datetime`, `img_fname`, `bid_active`, `date_created`) VALUES
	(4, 6, 'Amazon Kindle 2022 Model', 'The Amazon Kindle 2022 is a great choice for anyone who loves to read and wants a reliable, high-quality e-reader at an affordable price.', 14500, 14500, '2023-06-15 13:00:00', '4.jpg', 0, '2023-05-02 11:26:39'),
	(6, 7, 'Red Car', 'Good Conditioned', 500000, 500000, '2023-05-27 20:41:00', '6.jpg', 0, '2023-05-04 09:10:42'),
	(7, 4, 'Hp pavilion gaming 15', 'Laptop is in good condition.', 95000, 95000, '2023-07-27 20:40:00', '7.jpg', 1, '2023-05-04 09:22:58');

-- Dumping structure for table bidding_db.system_settings
CREATE TABLE IF NOT EXISTS `system_settings` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` text COLLATE utf8mb4_general_ci NOT NULL,
  `email` varchar(200) COLLATE utf8mb4_general_ci NOT NULL,
  `contact` varchar(20) COLLATE utf8mb4_general_ci NOT NULL,
  `cover_img` text COLLATE utf8mb4_general_ci NOT NULL,
  `about_content` text COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table bidding_db.system_settings: ~1 rows (approximately)
INSERT INTO `system_settings` (`id`, `name`, `email`, `contact`, `cover_img`, `about_content`) VALUES
	(1, 'The Auction House', 'info@sample.comm', '+6948 8542 623', '1683020820_hp-pavilion-power-15.jpg', '&lt;p style=&quot;text-align: justify; background: transparent; position: relative;&quot;&gt;&lt;/p&gt;&lt;span style=&quot;font-size: 16px;&quot;&gt;&lt;font color=&quot;#000000&quot; face=&quot;Open Sans, Arial, sans-serif&quot; style=&quot;font-size: 16px;&quot;&gt;&lt;span style=&quot;font-size: 16px;&quot;&gt;Our website is designed to make the bidding process easy and user-friendly. Users can create an account and browse through the various auctions available, with detailed descriptions and high-quality images provided for each item. Bidding can be done in real-time during the auction, ensuring a fair and transparent process.&amp;nbsp;&lt;/span&gt;&lt;/font&gt;&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;text-align: justify; background: transparent; position: relative; font-size: 16px;&quot;&gt;&lt;/p&gt;&lt;p style=&quot;text-align: justify; background: transparent; position: relative; font-size: 16px;&quot;&gt;&lt;span style=&quot;font-size: 16px;&quot;&gt;&lt;span style=&quot;font-size: 16px;&quot;&gt;&lt;font color=&quot;#000000&quot; face=&quot;Open Sans, Arial, sans-serif&quot; style=&quot;font-size: 16px;&quot;&gt;&lt;span style=&quot;font-size: 16px;&quot;&gt;The Auction House also provides a safe and secure payment system, with various payment methods available for winning bidders. We pride ourselves on offering a trusted and reliable platform for buyers and sellers alike.&amp;nbsp;&lt;/span&gt;&lt;/font&gt;&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;text-align: justify; background: transparent; position: relative; font-size: 16px;&quot;&gt;&lt;/p&gt;&lt;p style=&quot;text-align: justify; background: transparent; position: relative; font-size: 16px;&quot;&gt;&lt;span style=&quot;font-size: 16px;&quot;&gt;&lt;span style=&quot;font-size: 16px;&quot;&gt;&lt;font color=&quot;#000000&quot; face=&quot;Open Sans, Arial, sans-serif&quot; style=&quot;font-size: 16px;&quot;&gt;&lt;span style=&quot;font-size: 16px;&quot;&gt;Whether you&rsquo;re a collector looking for that special item or simply enjoy the excitement of bidding, The Auction House is the perfect place for you. Join our community today and discover the thrill of online auctions.&lt;/span&gt;&lt;/font&gt;&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;text-align: center; background: transparent; position: relative; font-size: 16px;&quot;&gt;&lt;/p&gt;&lt;/span&gt;&lt;p style=&quot;text-align: center; background: transparent; position: relative;&quot;&gt;&lt;b style=&quot;font-size: 16px;&quot;&gt;&lt;/p&gt;&lt;p&gt;&lt;/p&gt;');

-- Dumping structure for table bidding_db.users
CREATE TABLE IF NOT EXISTS `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` text COLLATE utf8mb4_general_ci NOT NULL,
  `username` varchar(200) COLLATE utf8mb4_general_ci NOT NULL,
  `password` text COLLATE utf8mb4_general_ci NOT NULL,
  `email` varchar(200) COLLATE utf8mb4_general_ci NOT NULL,
  `contact` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `address` text COLLATE utf8mb4_general_ci NOT NULL,
  `type` tinyint(1) NOT NULL DEFAULT '2' COMMENT '1=Admin,2=Subscriber',
  `date_created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table bidding_db.users: ~6 rows (approximately)
INSERT INTO `users` (`id`, `name`, `username`, `password`, `email`, `contact`, `address`, `type`, `date_created`) VALUES
	(6, 'Raj', 'raj', '5f4dcc3b5aa765d61d8327deb882cf99', 'raj@test.com', '98322547851', 'Sanepa, Lalitpur', 2, '2023-05-02 15:34:33'),
	(7, 'Nabin', 'nabin', '30d523b9e145b2cb3b061ac33254b4f4', 'nabin@test.com', '9815524555', 'Kirtipur', 2, '2023-05-02 15:56:33'),
	(8, 'Anish', 'anish', '87757270c86d517698777aeba4273838', 'anish@test.com', '98514451687', 'Satungal, Kathmandu', 2, '2023-05-02 16:02:25'),
	(9, 'sauhadra', 'sau', '05542a89eb01a37c4ec6d96da24ce4d6', 'sauhadra@gmail.com', '9852245154', 'Kalanki', 2, '2023-05-30 19:24:22'),
	(10, 'sadsa ', 'username', '5f4dcc3b5aa765d61d8327deb882cf99', 'email@email.com', '9814017911', ' dasdsad sa', 2, '2023-06-15 20:53:55'),
	(11, 'naya', 'naya', '5f4dcc3b5aa765d61d8327deb882cf99', 'naya@gmail.com', '9855555555', 'akdnaskdnk', 2, '2023-06-15 21:15:30');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
