-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Aug 23, 2020 at 11:21 AM
-- Server version: 5.7.24
-- PHP Version: 5.6.40

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `eoffice`
--

-- --------------------------------------------------------

--
-- Table structure for table `account`
--

DROP TABLE IF EXISTS `account`;
CREATE TABLE IF NOT EXISTS `account` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `account` varchar(100) CHARACTER SET latin1 NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `account`
--

INSERT INTO `account` (`id`, `account`) VALUES
(1, 'Asset'),
(2, 'Liability'),
(3, 'Equity'),
(4, 'Revenue'),
(5, 'Expense');

-- --------------------------------------------------------

--
-- Table structure for table `account_head`
--

DROP TABLE IF EXISTS `account_head`;
CREATE TABLE IF NOT EXISTS `account_head` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `account_title` varchar(100) NOT NULL,
  `account_number` varchar(100) NOT NULL,
  `description` varchar(100) NOT NULL,
  `phone` varchar(100) NOT NULL,
  `address` text NOT NULL,
  `account_type_id` int(5) NOT NULL,
  `balance` decimal(13,2) NOT NULL DEFAULT '0.00',
  `sys` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `account_head`
--

INSERT INTO `account_head` (`id`, `account_title`, `account_number`, `description`, `phone`, `address`, `account_type_id`, `balance`, `sys`) VALUES
(1, 'Pety Cash', '', 'Cash and cash equivalents', '', '', 1, '-250.00', 0),
(2, 'Accounts Receivable (A/R)', '', 'Accounts Receivable (A/R)', '', '', 2, '0.00', 0),
(4, 'Accounts Payable (A/P)', '', 'Accounts Payable (A/P)', '', '', 5, '0.00', 0);

-- --------------------------------------------------------

--
-- Table structure for table `account_type`
--

DROP TABLE IF EXISTS `account_type`;
CREATE TABLE IF NOT EXISTS `account_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `account_type` varchar(100) NOT NULL,
  `account_id` int(5) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `account_type`
--

INSERT INTO `account_type` (`id`, `account_type`, `account_id`) VALUES
(1, 'Cash and cash equivalents', 1),
(2, 'Accounts receivable (A/R)', 1),
(3, 'Current assets', 1),
(4, 'Fixed assets', 1),
(5, 'Accounts payable (A/P)', 2),
(6, 'Current liabilities', 2),
(7, 'Owner\'s equity', 3),
(8, 'Income', 4),
(9, 'Cost of sales', 5),
(10, 'Expenses', 5);

-- --------------------------------------------------------

--
-- Table structure for table `admin_groups`
--

DROP TABLE IF EXISTS `admin_groups`;
CREATE TABLE IF NOT EXISTS `admin_groups` (
  `id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `description` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `admin_groups`
--

INSERT INTO `admin_groups` (`id`, `name`, `description`) VALUES
(1, 'admin', 'Administrator'),
(2, 'hr', 'HR Manager'),
(3, 'accounts', 'Accounts Manager'),
(4, 'staff', 'HR Staff'),
(5, 'sales', 'Sales Staff');

-- --------------------------------------------------------

--
-- Table structure for table `admin_login_attempts`
--

DROP TABLE IF EXISTS `admin_login_attempts`;
CREATE TABLE IF NOT EXISTS `admin_login_attempts` (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `ip_address` varchar(15) NOT NULL,
  `login` varchar(100) NOT NULL,
  `time` int(11) UNSIGNED DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `admin_users`
--

DROP TABLE IF EXISTS `admin_users`;
CREATE TABLE IF NOT EXISTS `admin_users` (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `ip_address` varchar(15) NOT NULL,
  `username` varchar(100) DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `salt` varchar(255) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `activation_code` varchar(40) DEFAULT NULL,
  `forgotten_password_code` varchar(40) DEFAULT NULL,
  `forgotten_password_time` int(11) UNSIGNED DEFAULT NULL,
  `remember_code` varchar(40) DEFAULT NULL,
  `created_on` int(11) UNSIGNED NOT NULL,
  `last_login` int(11) UNSIGNED DEFAULT NULL,
  `active` tinyint(1) UNSIGNED DEFAULT NULL,
  `first_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `type` varchar(10) NOT NULL DEFAULT 'admin',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `admin_users`
--

INSERT INTO `admin_users` (`id`, `ip_address`, `username`, `password`, `salt`, `email`, `activation_code`, `forgotten_password_code`, `forgotten_password_time`, `remember_code`, `created_on`, `last_login`, `active`, `first_name`, `last_name`, `type`) VALUES
(2, '127.0.0.1', 'admin', '$2y$08$cM1mOrdVoCs9Euvq7pkEUO27eItEiyVUiMDP2im9RlGrdKRWxnADK', NULL, 'admin@admin.com', NULL, NULL, NULL, 'LZPAsjX0iOrkpOh.itgKee', 1451900228, 1598181353, 1, 'Shawn', 'Wendt', 'admin'),
(4, '::1', 'daryabsb', '$2y$08$fzHj1Upq69QGnC67OBHlo.LbDs.H5oYVs2xi6yUxK3kwF5rqSVdl.', NULL, 'darya.ibrahim@imperialknight.com', NULL, NULL, NULL, NULL, 1594463855, NULL, 1, 'Darya', 'Ibrahim', 'admin');

-- --------------------------------------------------------

--
-- Table structure for table `admin_users_groups`
--

DROP TABLE IF EXISTS `admin_users_groups`;
CREATE TABLE IF NOT EXISTS `admin_users_groups` (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` int(11) UNSIGNED NOT NULL,
  `group_id` mediumint(8) UNSIGNED NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `admin_users_groups`
--

INSERT INTO `admin_users_groups` (`id`, `user_id`, `group_id`) VALUES
(2, 2, 1),
(3, 3, 4),
(4, 4, 5);

-- --------------------------------------------------------

--
-- Table structure for table `assets`
--

DROP TABLE IF EXISTS `assets`;
CREATE TABLE IF NOT EXISTS `assets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  `purchase_year` date NOT NULL,
  `cost` decimal(13,2) NOT NULL,
  `lifespan` int(3) NOT NULL,
  `salvage_value` decimal(13,2) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf32;

--
-- Dumping data for table `assets`
--

INSERT INTO `assets` (`id`, `name`, `purchase_year`, `cost`, `lifespan`, `salvage_value`) VALUES
(2, 'Truck 1', '2019-07-09', '52000.00', 5, '2000.00');

-- --------------------------------------------------------

--
-- Table structure for table `ci_sessions`
--

DROP TABLE IF EXISTS `ci_sessions`;
CREATE TABLE IF NOT EXISTS `ci_sessions` (
  `id` varchar(40) NOT NULL,
  `ip_address` varchar(45) NOT NULL,
  `timestamp` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `data` blob NOT NULL,
  KEY `ci_sessions_timestamp` (`timestamp`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ci_sessions`
--

INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES
('a2eb237979afc308a1f84b41ceedfba88778d254', '::1', 1591855554, 0x5f5f63695f6c6173745f726567656e65726174657c693a313539313835353236303b6964656e746974797c733a353a2261646d696e223b757365726e616d657c733a353a2261646d696e223b656d61696c7c733a31353a2261646d696e4061646d696e2e636f6d223b757365725f69647c733a313a2232223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353035383934303333223b),
('af0fe0e7f849f17d7385dbbba9788f6b1f719a04', '::1', 1591855831, 0x5f5f63695f6c6173745f726567656e65726174657c693a313539313835353735303b6964656e746974797c733a353a2261646d696e223b757365726e616d657c733a353a2261646d696e223b656d61696c7c733a31353a2261646d696e4061646d696e2e636f6d223b757365725f69647c733a313a2232223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353931383535323730223b),
('6fc37818ce35a525c312391bde7a6ca7abe157f7', '::1', 1591856243, 0x5f5f63695f6c6173745f726567656e65726174657c693a313539313835363132353b6964656e746974797c733a353a2261646d696e223b757365726e616d657c733a353a2261646d696e223b656d61696c7c733a31353a2261646d696e4061646d696e2e636f6d223b757365725f69647c733a313a2232223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353931383535323730223b737563636573737c733a34313a22596f7572207265636f726420686173206265656e2064656c657465207375636365737366756c6c7921223b5f5f63695f766172737c613a313a7b733a373a2273756363657373223b733a333a226f6c64223b7d),
('89eacc0f452bf88a3633a0ef3de8d47a0e9bbca9', '::1', 1591856796, 0x5f5f63695f6c6173745f726567656e65726174657c693a313539313835363436343b6964656e746974797c733a353a2261646d696e223b757365726e616d657c733a353a2261646d696e223b656d61696c7c733a31353a2261646d696e4061646d696e2e636f6d223b757365725f69647c733a313a2232223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353931383535323730223b),
('b1ee3f74ffb1276784ca639fc83a19f48d7566af', '::1', 1591857079, 0x5f5f63695f6c6173745f726567656e65726174657c693a313539313835363739393b6964656e746974797c733a353a2261646d696e223b757365726e616d657c733a353a2261646d696e223b656d61696c7c733a31353a2261646d696e4061646d696e2e636f6d223b757365725f69647c733a313a2232223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353931383535323730223b747970657c733a373a22696e766f696365223b646973636f756e747c693a303b),
('ee2c8e604a86c199364e6df94a00ffcf2c02f4bf', '::1', 1591857351, 0x5f5f63695f6c6173745f726567656e65726174657c693a313539313835373134353b6964656e746974797c733a353a2261646d696e223b757365726e616d657c733a353a2261646d696e223b656d61696c7c733a31353a2261646d696e4061646d696e2e636f6d223b757365725f69647c733a313a2232223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353931383535323730223b747970657c733a373a22696e766f696365223b646973636f756e747c693a303b),
('28c1202b11307a2d153a26349b84f4450ad27c61', '::1', 1591857789, 0x5f5f63695f6c6173745f726567656e65726174657c693a313539313835373635373b6964656e746974797c733a353a2261646d696e223b757365726e616d657c733a353a2261646d696e223b656d61696c7c733a31353a2261646d696e4061646d696e2e636f6d223b757365725f69647c733a313a2232223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353931383535323730223b747970657c733a373a22696e766f696365223b646973636f756e747c693a303b),
('1793d53836271ef801f0ebd49ec93625121bd7e9', '::1', 1591859394, 0x5f5f63695f6c6173745f726567656e65726174657c693a313539313835393134353b6964656e746974797c733a353a2261646d696e223b757365726e616d657c733a353a2261646d696e223b656d61696c7c733a31353a2261646d696e4061646d696e2e636f6d223b757365725f69647c733a313a2232223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353931383535323730223b747970657c733a373a22696e766f696365223b646973636f756e747c693a303b6c616e67756167657c733a373a22656e676c697368223b),
('1922e604c55656e43f0480946acbb5693cd12907', '::1', 1591867551, 0x5f5f63695f6c6173745f726567656e65726174657c693a313539313836373535313b),
('ed59c77a7417d34ab5f5fc33b7eec45d1f9fa694', '::1', 1593844069, 0x5f5f63695f6c6173745f726567656e65726174657c693a313539333834333836373b6964656e746974797c733a353a2261646d696e223b757365726e616d657c733a353a2261646d696e223b656d61696c7c733a31353a2261646d696e4061646d696e2e636f6d223b757365725f69647c733a313a2232223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353931383637333238223b),
('03c432eefb04b852a357f03c71ba603f718794cf', '::1', 1593845186, 0x5f5f63695f6c6173745f726567656e65726174657c693a313539333834353137393b6964656e746974797c733a353a2261646d696e223b757365726e616d657c733a353a2261646d696e223b656d61696c7c733a31353a2261646d696e4061646d696e2e636f6d223b757365725f69647c733a313a2232223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353931383637333238223b),
('3fd849b8b53f1f12d70f86988702a31fe3fe2e3a', '::1', 1594280771, 0x5f5f63695f6c6173745f726567656e65726174657c693a313539343238303438393b6964656e746974797c733a353a2261646d696e223b757365726e616d657c733a353a2261646d696e223b656d61696c7c733a31353a2261646d696e4061646d696e2e636f6d223b757365725f69647c733a313a2232223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353933383434303038223b747970657c733a393a2271756f746174696f6e223b646973636f756e747c693a303b),
('cbac29b626576af72028a7d06c03595fed7d6b59', '::1', 1594281192, 0x5f5f63695f6c6173745f726567656e65726174657c693a313539343238303930343b6964656e746974797c733a353a2261646d696e223b757365726e616d657c733a353a2261646d696e223b656d61696c7c733a31353a2261646d696e4061646d696e2e636f6d223b757365725f69647c733a313a2232223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353933383434303038223b747970657c733a393a2271756f746174696f6e223b646973636f756e747c693a303b),
('b9de0953a52908bcdefc378e4b5f6a87e2b35439', '::1', 1594281506, 0x5f5f63695f6c6173745f726567656e65726174657c693a313539343238313230373b6964656e746974797c733a353a2261646d696e223b757365726e616d657c733a353a2261646d696e223b656d61696c7c733a31353a2261646d696e4061646d696e2e636f6d223b757365725f69647c733a313a2232223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353933383434303038223b747970657c733a393a2271756f746174696f6e223b646973636f756e747c693a303b),
('3cec3872f0a024230cda46cfe195a2ac5bf9cef6', '::1', 1594281626, 0x5f5f63695f6c6173745f726567656e65726174657c693a313539343238313530393b6964656e746974797c733a353a2261646d696e223b757365726e616d657c733a353a2261646d696e223b656d61696c7c733a31353a2261646d696e4061646d696e2e636f6d223b757365725f69647c733a313a2232223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353933383434303038223b747970657c733a393a2271756f746174696f6e223b646973636f756e747c693a303b),
('c1618e63e37bc8eb87cc7f4c85a156b99df930a3', '::1', 1594281836, 0x5f5f63695f6c6173745f726567656e65726174657c693a313539343238313833363b6964656e746974797c733a353a2261646d696e223b757365726e616d657c733a353a2261646d696e223b656d61696c7c733a31353a2261646d696e4061646d696e2e636f6d223b757365725f69647c733a313a2232223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353933383434303038223b747970657c733a393a2271756f746174696f6e223b646973636f756e747c693a303b),
('444f12559946268f98b9ba007a6737e00c390dda', '::1', 1594282436, 0x5f5f63695f6c6173745f726567656e65726174657c693a313539343238323433363b6964656e746974797c733a353a2261646d696e223b757365726e616d657c733a353a2261646d696e223b656d61696c7c733a31353a2261646d696e4061646d696e2e636f6d223b757365725f69647c733a313a2232223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353933383434303038223b747970657c733a393a2271756f746174696f6e223b646973636f756e747c693a303b),
('96facf1626e2508761c1b3de3dc7bcef403d38ed', '::1', 1594289219, 0x5f5f63695f6c6173745f726567656e65726174657c693a313539343238393231343b6964656e746974797c733a353a2261646d696e223b757365726e616d657c733a353a2261646d696e223b656d61696c7c733a31353a2261646d696e4061646d696e2e636f6d223b757365725f69647c733a313a2232223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353933383434303038223b747970657c733a393a2271756f746174696f6e223b646973636f756e747c693a303b),
('bfc661027c5694ebaa8f2b353bad6ef3ddc661dd', '::1', 1594460339, 0x5f5f63695f6c6173745f726567656e65726174657c693a313539343436303330313b6964656e746974797c733a353a2261646d696e223b757365726e616d657c733a353a2261646d696e223b656d61696c7c733a31353a2261646d696e4061646d696e2e636f6d223b757365725f69647c733a313a2232223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353934323830353036223b),
('79b5d85c108fe33283b37ea166bc62e7f5b9e65b', '::1', 1594463888, 0x5f5f63695f6c6173745f726567656e65726174657c693a313539343436333835393b73797374656d5f6d657373616765737c613a323a7b733a373a2273756363657373223b613a303a7b7d733a353a226572726f72223b613a313a7b693a303b733a32323a223c703e496e636f7272656374204c6f67696e3c2f703e223b7d7d5f5f63695f766172737c613a313a7b733a31353a2273797374656d5f6d65737361676573223b733a333a226f6c64223b7d),
('7d6a3e0d3c955bdedcb6f4de5a9b37c1e40f0ff0', '::1', 1594464486, 0x5f5f63695f6c6173745f726567656e65726174657c693a313539343436343235303b6964656e746974797c733a353a2261646d696e223b757365726e616d657c733a353a2261646d696e223b656d61696c7c733a31353a2261646d696e4061646d696e2e636f6d223b757365725f69647c733a313a2232223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353934343633383139223b),
('1c83b9c590544fb068adc0e2cdd84efbd47498b6', '::1', 1594465081, 0x5f5f63695f6c6173745f726567656e65726174657c693a313539343436353038313b6964656e746974797c733a353a2261646d696e223b757365726e616d657c733a353a2261646d696e223b656d61696c7c733a31353a2261646d696e4061646d696e2e636f6d223b757365725f69647c733a313a2232223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353934343633383139223b),
('e7bc64f9e2191c58a7a32e138771f1d0ad47254f', '::1', 1594889649, 0x5f5f63695f6c6173745f726567656e65726174657c693a313539343838393634353b6964656e746974797c733a353a2261646d696e223b757365726e616d657c733a353a2261646d696e223b656d61696c7c733a31353a2261646d696e4061646d696e2e636f6d223b757365725f69647c733a313a2232223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353934343634343137223b),
('9219baad8384ff2a6fd23d95cd4c77657d166b37', '::1', 1595141778, 0x5f5f63695f6c6173745f726567656e65726174657c693a313539353134313734383b6964656e746974797c733a353a2261646d696e223b757365726e616d657c733a353a2261646d696e223b656d61696c7c733a31353a2261646d696e4061646d696e2e636f6d223b757365725f69647c733a313a2232223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353934383839363438223b),
('3179193ab325529dbe58308f68976599ec959f9c', '127.0.0.1', 1596545271, 0x5f5f63695f6c6173745f726567656e65726174657c693a313539363534343937373b6964656e746974797c733a353a2261646d696e223b757365726e616d657c733a353a2261646d696e223b656d61696c7c733a31353a2261646d696e4061646d696e2e636f6d223b757365725f69647c733a313a2232223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353935313431373530223b),
('35e98c6f3f6072cab52883fd8f06205a04442039', '::1', 1596545323, 0x5f5f63695f6c6173745f726567656e65726174657c693a313539363534353332323b6964656e746974797c733a353a2261646d696e223b757365726e616d657c733a353a2261646d696e223b656d61696c7c733a31353a2261646d696e4061646d696e2e636f6d223b757365725f69647c733a313a2232223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353935313431373530223b),
('da173d1dd9ed4d25755788d9e6d53d491184bc5b', '::1', 1598181354, 0x5f5f63695f6c6173745f726567656e65726174657c693a313539383138313333363b6964656e746974797c733a353a2261646d696e223b757365726e616d657c733a353a2261646d696e223b656d61696c7c733a31353a2261646d696e4061646d696e2e636f6d223b757365725f69647c733a313a2232223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353936353434393739223b);

-- --------------------------------------------------------

--
-- Table structure for table `component`
--

DROP TABLE IF EXISTS `component`;
CREATE TABLE IF NOT EXISTS `component` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `employee_id` int(11) NOT NULL,
  `component_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `countries`
--

DROP TABLE IF EXISTS `countries`;
CREATE TABLE IF NOT EXISTS `countries` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `country_code` char(2) NOT NULL DEFAULT '',
  `country` varchar(45) NOT NULL DEFAULT '',
  `currency_code` char(3) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=251 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `countries`
--

INSERT INTO `countries` (`id`, `country_code`, `country`, `currency_code`) VALUES
(1, 'AD', 'Andorra', 'EUR'),
(2, 'AE', 'United Arab Emirates', 'AED'),
(3, 'AF', 'Afghanistan', 'AFN'),
(4, 'AG', 'Antigua and Barbuda', 'XCD'),
(5, 'AI', 'Anguilla', 'XCD'),
(6, 'AL', 'Albania', 'ALL'),
(7, 'AM', 'Armenia', 'AMD'),
(8, 'AO', 'Angola', 'AOA'),
(9, 'AQ', 'Antarctica', ''),
(10, 'AR', 'Argentina', 'ARS'),
(11, 'AS', 'American Samoa', 'USD'),
(12, 'AT', 'Austria', 'EUR'),
(13, 'AU', 'Australia', 'AUD'),
(14, 'AW', 'Aruba', 'AWG'),
(15, 'AX', 'Åland', 'EUR'),
(16, 'AZ', 'Azerbaijan', 'AZN'),
(17, 'BA', 'Bosnia and Herzegovina', 'BAM'),
(18, 'BB', 'Barbados', 'BBD'),
(19, 'BD', 'Bangladesh', 'BDT'),
(20, 'BE', 'Belgium', 'EUR'),
(21, 'BF', 'Burkina Faso', 'XOF'),
(22, 'BG', 'Bulgaria', 'BGN'),
(23, 'BH', 'Bahrain', 'BHD'),
(24, 'BI', 'Burundi', 'BIF'),
(25, 'BJ', 'Benin', 'XOF'),
(26, 'BL', 'Saint Barthélemy', 'EUR'),
(27, 'BM', 'Bermuda', 'BMD'),
(28, 'BN', 'Brunei', 'BND'),
(29, 'BO', 'Bolivia', 'BOB'),
(30, 'BQ', 'Bonaire', 'USD'),
(31, 'BR', 'Brazil', 'BRL'),
(32, 'BS', 'Bahamas', 'BSD'),
(33, 'BT', 'Bhutan', 'BTN'),
(34, 'BV', 'Bouvet Island', 'NOK'),
(35, 'BW', 'Botswana', 'BWP'),
(36, 'BY', 'Belarus', 'BYR'),
(37, 'BZ', 'Belize', 'BZD'),
(38, 'CA', 'Canada', 'CAD'),
(39, 'CC', 'Cocos [Keeling] Islands', 'AUD'),
(40, 'CD', 'Democratic Republic of the Congo', 'CDF'),
(41, 'CF', 'Central African Republic', 'XAF'),
(42, 'CG', 'Republic of the Congo', 'XAF'),
(43, 'CH', 'Switzerland', 'CHF'),
(44, 'CI', 'Ivory Coast', 'XOF'),
(45, 'CK', 'Cook Islands', 'NZD'),
(46, 'CL', 'Chile', 'CLP'),
(47, 'CM', 'Cameroon', 'XAF'),
(48, 'CN', 'China', 'CNY'),
(49, 'CO', 'Colombia', 'COP'),
(50, 'CR', 'Costa Rica', 'CRC'),
(51, 'CU', 'Cuba', 'CUP'),
(52, 'CV', 'Cape Verde', 'CVE'),
(53, 'CW', 'Curacao', 'ANG'),
(54, 'CX', 'Christmas Island', 'AUD'),
(55, 'CY', 'Cyprus', 'EUR'),
(56, 'CZ', 'Czech Republic', 'CZK'),
(57, 'DE', 'Germany', 'EUR'),
(58, 'DJ', 'Djibouti', 'DJF'),
(59, 'DK', 'Denmark', 'DKK'),
(60, 'DM', 'Dominica', 'XCD'),
(61, 'DO', 'Dominican Republic', 'DOP'),
(62, 'DZ', 'Algeria', 'DZD'),
(63, 'EC', 'Ecuador', 'USD'),
(64, 'EE', 'Estonia', 'EUR'),
(65, 'EG', 'Egypt', 'EGP'),
(66, 'EH', 'Western Sahara', 'MAD'),
(67, 'ER', 'Eritrea', 'ERN'),
(68, 'ES', 'Spain', 'EUR'),
(69, 'ET', 'Ethiopia', 'ETB'),
(70, 'FI', 'Finland', 'EUR'),
(71, 'FJ', 'Fiji', 'FJD'),
(72, 'FK', 'Falkland Islands', 'FKP'),
(73, 'FM', 'Micronesia', 'USD'),
(74, 'FO', 'Faroe Islands', 'DKK'),
(75, 'FR', 'France', 'EUR'),
(76, 'GA', 'Gabon', 'XAF'),
(77, 'GB', 'United Kingdom', 'GBP'),
(78, 'GD', 'Grenada', 'XCD'),
(79, 'GE', 'Georgia', 'GEL'),
(80, 'GF', 'French Guiana', 'EUR'),
(81, 'GG', 'Guernsey', 'GBP'),
(82, 'GH', 'Ghana', 'GHS'),
(83, 'GI', 'Gibraltar', 'GIP'),
(84, 'GL', 'Greenland', 'DKK'),
(85, 'GM', 'Gambia', 'GMD'),
(86, 'GN', 'Guinea', 'GNF'),
(87, 'GP', 'Guadeloupe', 'EUR'),
(88, 'GQ', 'Equatorial Guinea', 'XAF'),
(89, 'GR', 'Greece', 'EUR'),
(90, 'GS', 'South Georgia and the South Sandwich Islands', 'GBP'),
(91, 'GT', 'Guatemala', 'GTQ'),
(92, 'GU', 'Guam', 'USD'),
(93, 'GW', 'Guinea-Bissau', 'XOF'),
(94, 'GY', 'Guyana', 'GYD'),
(95, 'HK', 'Hong Kong', 'HKD'),
(96, 'HM', 'Heard Island and McDonald Islands', 'AUD'),
(97, 'HN', 'Honduras', 'HNL'),
(98, 'HR', 'Croatia', 'HRK'),
(99, 'HT', 'Haiti', 'HTG'),
(100, 'HU', 'Hungary', 'HUF'),
(101, 'ID', 'Indonesia', 'IDR'),
(102, 'IE', 'Ireland', 'EUR'),
(103, 'IL', 'Israel', 'ILS'),
(104, 'IM', 'Isle of Man', 'GBP'),
(105, 'IN', 'India', 'INR'),
(106, 'IO', 'British Indian Ocean Territory', 'USD'),
(107, 'IQ', 'Iraq', 'IQD'),
(108, 'IR', 'Iran', 'IRR'),
(109, 'IS', 'Iceland', 'ISK'),
(110, 'IT', 'Italy', 'EUR'),
(111, 'JE', 'Jersey', 'GBP'),
(112, 'JM', 'Jamaica', 'JMD'),
(113, 'JO', 'Jordan', 'JOD'),
(114, 'JP', 'Japan', 'JPY'),
(115, 'KE', 'Kenya', 'KES'),
(116, 'KG', 'Kyrgyzstan', 'KGS'),
(117, 'KH', 'Cambodia', 'KHR'),
(118, 'KI', 'Kiribati', 'AUD'),
(119, 'KM', 'Comoros', 'KMF'),
(120, 'KN', 'Saint Kitts and Nevis', 'XCD'),
(121, 'KP', 'North Korea', 'KPW'),
(122, 'KR', 'South Korea', 'KRW'),
(123, 'KW', 'Kuwait', 'KWD'),
(124, 'KY', 'Cayman Islands', 'KYD'),
(125, 'KZ', 'Kazakhstan', 'KZT'),
(126, 'LA', 'Laos', 'LAK'),
(127, 'LB', 'Lebanon', 'LBP'),
(128, 'LC', 'Saint Lucia', 'XCD'),
(129, 'LI', 'Liechtenstein', 'CHF'),
(130, 'LK', 'Sri Lanka', 'LKR'),
(131, 'LR', 'Liberia', 'LRD'),
(132, 'LS', 'Lesotho', 'LSL'),
(133, 'LT', 'Lithuania', 'EUR'),
(134, 'LU', 'Luxembourg', 'EUR'),
(135, 'LV', 'Latvia', 'EUR'),
(136, 'LY', 'Libya', 'LYD'),
(137, 'MA', 'Morocco', 'MAD'),
(138, 'MC', 'Monaco', 'EUR'),
(139, 'MD', 'Moldova', 'MDL'),
(140, 'ME', 'Montenegro', 'EUR'),
(141, 'MF', 'Saint Martin', 'EUR'),
(142, 'MG', 'Madagascar', 'MGA'),
(143, 'MH', 'Marshall Islands', 'USD'),
(144, 'MK', 'Macedonia', 'MKD'),
(145, 'ML', 'Mali', 'XOF'),
(146, 'MM', 'Myanmar [Burma]', 'MMK'),
(147, 'MN', 'Mongolia', 'MNT'),
(148, 'MO', 'Macao', 'MOP'),
(149, 'MP', 'Northern Mariana Islands', 'USD'),
(150, 'MQ', 'Martinique', 'EUR'),
(151, 'MR', 'Mauritania', 'MRO'),
(152, 'MS', 'Montserrat', 'XCD'),
(153, 'MT', 'Malta', 'EUR'),
(154, 'MU', 'Mauritius', 'MUR'),
(155, 'MV', 'Maldives', 'MVR'),
(156, 'MW', 'Malawi', 'MWK'),
(157, 'MX', 'Mexico', 'MXN'),
(158, 'MY', 'Malaysia', 'MYR'),
(159, 'MZ', 'Mozambique', 'MZN'),
(160, 'NA', 'Namibia', 'NAD'),
(161, 'NC', 'New Caledonia', 'XPF'),
(162, 'NE', 'Niger', 'XOF'),
(163, 'NF', 'Norfolk Island', 'AUD'),
(164, 'NG', 'Nigeria', 'NGN'),
(165, 'NI', 'Nicaragua', 'NIO'),
(166, 'NL', 'Netherlands', 'EUR'),
(167, 'NO', 'Norway', 'NOK'),
(168, 'NP', 'Nepal', 'NPR'),
(169, 'NR', 'Nauru', 'AUD'),
(170, 'NU', 'Niue', 'NZD'),
(171, 'NZ', 'New Zealand', 'NZD'),
(172, 'OM', 'Oman', 'OMR'),
(173, 'PA', 'Panama', 'PAB'),
(174, 'PE', 'Peru', 'PEN'),
(175, 'PF', 'French Polynesia', 'XPF'),
(176, 'PG', 'Papua New Guinea', 'PGK'),
(177, 'PH', 'Philippines', 'PHP'),
(178, 'PK', 'Pakistan', 'PKR'),
(179, 'PL', 'Poland', 'PLN'),
(180, 'PM', 'Saint Pierre and Miquelon', 'EUR'),
(181, 'PN', 'Pitcairn Islands', 'NZD'),
(182, 'PR', 'Puerto Rico', 'USD'),
(183, 'PS', 'Palestine', 'ILS'),
(184, 'PT', 'Portugal', 'EUR'),
(185, 'PW', 'Palau', 'USD'),
(186, 'PY', 'Paraguay', 'PYG'),
(187, 'QA', 'Qatar', 'QAR'),
(188, 'RE', 'Réunion', 'EUR'),
(189, 'RO', 'Romania', 'RON'),
(190, 'RS', 'Serbia', 'RSD'),
(191, 'RU', 'Russia', 'RUB'),
(192, 'RW', 'Rwanda', 'RWF'),
(193, 'SA', 'Saudi Arabia', 'SAR'),
(194, 'SB', 'Solomon Islands', 'SBD'),
(195, 'SC', 'Seychelles', 'SCR'),
(196, 'SD', 'Sudan', 'SDG'),
(197, 'SE', 'Sweden', 'SEK'),
(198, 'SG', 'Singapore', 'SGD'),
(199, 'SH', 'Saint Helena', 'SHP'),
(200, 'SI', 'Slovenia', 'EUR'),
(201, 'SJ', 'Svalbard and Jan Mayen', 'NOK'),
(202, 'SK', 'Slovakia', 'EUR'),
(203, 'SL', 'Sierra Leone', 'SLL'),
(204, 'SM', 'San Marino', 'EUR'),
(205, 'SN', 'Senegal', 'XOF'),
(206, 'SO', 'Somalia', 'SOS'),
(207, 'SR', 'Suriname', 'SRD'),
(208, 'SS', 'South Sudan', 'SSP'),
(209, 'ST', 'São Tomé and Príncipe', 'STD'),
(210, 'SV', 'El Salvador', 'USD'),
(211, 'SX', 'Sint Maarten', 'ANG'),
(212, 'SY', 'Syria', 'SYP'),
(213, 'SZ', 'Swaziland', 'SZL'),
(214, 'TC', 'Turks and Caicos Islands', 'USD'),
(215, 'TD', 'Chad', 'XAF'),
(216, 'TF', 'French Southern Territories', 'EUR'),
(217, 'TG', 'Togo', 'XOF'),
(218, 'TH', 'Thailand', 'THB'),
(219, 'TJ', 'Tajikistan', 'TJS'),
(220, 'TK', 'Tokelau', 'NZD'),
(221, 'TL', 'East Timor', 'USD'),
(222, 'TM', 'Turkmenistan', 'TMT'),
(223, 'TN', 'Tunisia', 'TND'),
(224, 'TO', 'Tonga', 'TOP'),
(225, 'TR', 'Turkey', 'TRY'),
(226, 'TT', 'Trinidad and Tobago', 'TTD'),
(227, 'TV', 'Tuvalu', 'AUD'),
(228, 'TW', 'Taiwan', 'TWD'),
(229, 'TZ', 'Tanzania', 'TZS'),
(230, 'UA', 'Ukraine', 'UAH'),
(231, 'UG', 'Uganda', 'UGX'),
(232, 'UM', 'U.S. Minor Outlying Islands', 'USD'),
(233, 'US', 'United States', 'USD'),
(234, 'UY', 'Uruguay', 'UYU'),
(235, 'UZ', 'Uzbekistan', 'UZS'),
(236, 'VA', 'Vatican City', 'EUR'),
(237, 'VC', 'Saint Vincent and the Grenadines', 'XCD'),
(238, 'VE', 'Venezuela', 'VEF'),
(239, 'VG', 'British Virgin Islands', 'USD'),
(240, 'VI', 'U.S. Virgin Islands', 'USD'),
(241, 'VN', 'Vietnam', 'VND'),
(242, 'VU', 'Vanuatu', 'VUV'),
(243, 'WF', 'Wallis and Futuna', 'XPF'),
(244, 'WS', 'Samoa', 'WST'),
(245, 'XK', 'Kosovo', 'EUR'),
(246, 'YE', 'Yemen', 'YER'),
(247, 'YT', 'Mayotte', 'EUR'),
(248, 'ZA', 'South Africa', 'ZAR'),
(249, 'ZM', 'Zambia', 'ZMW'),
(250, 'ZW', 'Zimbabwe', 'ZWL');

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
CREATE TABLE IF NOT EXISTS `customer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_code` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `company_name` varchar(100) NOT NULL,
  `phone` varchar(100) NOT NULL,
  `fax` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `website` varchar(100) NOT NULL,
  `b_address` text NOT NULL,
  `s_address` text NOT NULL,
  `note` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`id`, `customer_code`, `name`, `company_name`, `phone`, `fax`, `email`, `website`, `b_address`, `s_address`, `note`) VALUES
(1, 1001, 'Aso Mohammed', 'Kogay Shar', '07701570615', '', 'darya.ibrahim@imperialknight.com', '', 'Ali Naji Street', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `department`
--

DROP TABLE IF EXISTS `department`;
CREATE TABLE IF NOT EXISTS `department` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `department` varchar(100) NOT NULL,
  `description` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `department`
--

INSERT INTO `department` (`id`, `department`, `description`) VALUES
(1, 'IT', 'This is the IT Dept');

-- --------------------------------------------------------

--
-- Table structure for table `depreciation`
--

DROP TABLE IF EXISTS `depreciation`;
CREATE TABLE IF NOT EXISTS `depreciation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `asset_id` int(11) NOT NULL,
  `year` varchar(10) NOT NULL,
  `beginning_value` decimal(13,2) NOT NULL,
  `depreciate_cost` decimal(13,2) NOT NULL,
  `depreciate_rate` decimal(13,2) NOT NULL,
  `depreciation_expense` decimal(13,2) NOT NULL,
  `accumulated` decimal(13,2) NOT NULL,
  `ending_value` decimal(13,2) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf32;

--
-- Dumping data for table `depreciation`
--

INSERT INTO `depreciation` (`id`, `asset_id`, `year`, `beginning_value`, `depreciate_cost`, `depreciate_rate`, `depreciation_expense`, `accumulated`, `ending_value`) VALUES
(6, 2, '2019', '52000.00', '50000.00', '33.33', '16665.00', '5554.44', '35335.00'),
(7, 2, '2020', '35335.00', '50000.00', '26.67', '13335.00', '3556.44', '22000.00'),
(8, 2, '2021', '22000.00', '50000.00', '20.00', '10000.00', '2000.00', '12000.00'),
(9, 2, '2022', '12000.00', '50000.00', '13.33', '6665.00', '888.44', '5335.00'),
(10, 2, '2023', '5335.00', '50000.00', '6.67', '3335.00', '222.44', '2000.00');

-- --------------------------------------------------------

--
-- Table structure for table `employee`
--

DROP TABLE IF EXISTS `employee`;
CREATE TABLE IF NOT EXISTS `employee` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `employee_id` int(11) NOT NULL,
  `first_name` varchar(100) NOT NULL,
  `last_name` varchar(100) NOT NULL,
  `marital_status` enum('Singel','Married','','') NOT NULL,
  `date_of_birth` varchar(100) NOT NULL,
  `country` varchar(100) NOT NULL,
  `blood_group` enum('None','A','B','AB','O') NOT NULL,
  `id_number` varchar(100) NOT NULL,
  `religious` enum('Christians','Muslims','Hindus','Buddhists','Jews') NOT NULL,
  `gender` enum('Male','Female') NOT NULL,
  `photo` varchar(100) NOT NULL,
  `joined_date` date NOT NULL,
  `probation_end_date` date NOT NULL,
  `date_of_permanency` date NOT NULL,
  `personal_attachment` longtext NOT NULL,
  `contact_details` longtext NOT NULL,
  `emergency_contact` longtext NOT NULL,
  `dependents` longtext NOT NULL,
  `department` int(11) DEFAULT NULL,
  `title` int(11) DEFAULT NULL,
  `category` int(11) DEFAULT NULL,
  `employment_status` int(11) DEFAULT NULL,
  `work_shift` int(11) DEFAULT NULL,
  `deposit` text NOT NULL,
  `date_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `termination` tinyint(2) NOT NULL DEFAULT '1',
  `termination_note` text NOT NULL,
  `soft_delete` tinyint(2) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `employee_award`
--

DROP TABLE IF EXISTS `employee_award`;
CREATE TABLE IF NOT EXISTS `employee_award` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `award_name` varchar(200) NOT NULL,
  `employee_id` int(11) NOT NULL,
  `department_id` int(11) NOT NULL,
  `gift_item` varchar(100) NOT NULL,
  `award_amount` decimal(13,2) NOT NULL,
  `award_month` varchar(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `emp_status`
--

DROP TABLE IF EXISTS `emp_status`;
CREATE TABLE IF NOT EXISTS `emp_status` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `status_name` varchar(128) CHARACTER SET latin1 NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `events`
--

DROP TABLE IF EXISTS `events`;
CREATE TABLE IF NOT EXISTS `events` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `color` varchar(7) DEFAULT NULL,
  `start` datetime NOT NULL,
  `end` datetime DEFAULT NULL,
  `employee_id` int(11) NOT NULL,
  `type` varchar(5) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `groups`
--

DROP TABLE IF EXISTS `groups`;
CREATE TABLE IF NOT EXISTS `groups` (
  `id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `description` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `groups`
--

INSERT INTO `groups` (`id`, `name`, `description`) VALUES
(1, 'members', 'General User');

-- --------------------------------------------------------

--
-- Table structure for table `holidays`
--

DROP TABLE IF EXISTS `holidays`;
CREATE TABLE IF NOT EXISTS `holidays` (
  `holiday_id` int(11) NOT NULL AUTO_INCREMENT,
  `event_name` varchar(128) NOT NULL,
  `description` text NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  PRIMARY KEY (`holiday_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `inbox`
--

DROP TABLE IF EXISTS `inbox`;
CREATE TABLE IF NOT EXISTS `inbox` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `to_emp_id` int(11) NOT NULL,
  `to_type` enum('admin','employee') NOT NULL,
  `from_emp_id` int(11) NOT NULL,
  `from_type` enum('admin','employee') NOT NULL,
  `cc` text NOT NULL,
  `sender_name` varchar(200) NOT NULL,
  `subject` varchar(200) NOT NULL,
  `msg` text NOT NULL,
  `attachment` text NOT NULL,
  `attachment_id` varchar(200) NOT NULL,
  `rating` tinyint(2) NOT NULL DEFAULT '0',
  `reading` tinyint(2) NOT NULL DEFAULT '0',
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `inbox`
--

INSERT INTO `inbox` (`id`, `to_emp_id`, `to_type`, `from_emp_id`, `from_type`, `cc`, `sender_name`, `subject`, `msg`, `attachment`, `attachment_id`, `rating`, `reading`, `date`) VALUES
(1, 2, 'admin', 3, 'admin', '[\"2*A\"]', 'Darya Ibrahim', 'Hello', '<p>This is a test email</p>', 'null', '1634771665-20200611-060901', 0, 1, '2020-06-11 06:09:01');

-- --------------------------------------------------------

--
-- Table structure for table `job_category`
--

DROP TABLE IF EXISTS `job_category`;
CREATE TABLE IF NOT EXISTS `job_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category_name` varchar(128) CHARACTER SET latin1 NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `job_category`
--

INSERT INTO `job_category` (`id`, `category_name`) VALUES
(1, 'CEO'),
(2, 'Head of Department'),
(3, 'Section Manager');

-- --------------------------------------------------------

--
-- Table structure for table `job_history`
--

DROP TABLE IF EXISTS `job_history`;
CREATE TABLE IF NOT EXISTS `job_history` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `employee_id` int(11) NOT NULL,
  `effective_from` date NOT NULL,
  `department` int(5) NOT NULL,
  `title` int(5) NOT NULL,
  `category` int(5) NOT NULL,
  `employment_status` int(5) NOT NULL,
  `work_shift` int(5) NOT NULL,
  `status` tinyint(2) NOT NULL DEFAULT '0',
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `job_title`
--

DROP TABLE IF EXISTS `job_title`;
CREATE TABLE IF NOT EXISTS `job_title` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `job_title` varchar(100) NOT NULL,
  `description` longtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `job_title`
--

INSERT INTO `job_title` (`id`, `job_title`, `description`) VALUES
(1, 'IT Manager', 'Manages the department');

-- --------------------------------------------------------

--
-- Table structure for table `language`
--

DROP TABLE IF EXISTS `language`;
CREATE TABLE IF NOT EXISTS `language` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `code` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `icon` varchar(255) NOT NULL,
  `active` tinyint(2) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `language`
--

INSERT INTO `language` (`id`, `code`, `name`, `icon`, `active`) VALUES
(1, 'en', 'english', 'us', 1),
(2, 'aa', 'afar', 'dj', 0);

-- --------------------------------------------------------

--
-- Table structure for table `leave_application`
--

DROP TABLE IF EXISTS `leave_application`;
CREATE TABLE IF NOT EXISTS `leave_application` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `employee_id` int(11) NOT NULL,
  `leave_ctegory_id` int(11) NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `reason` varchar(250) NOT NULL,
  `status` enum('Pending','Accepted','Rejected','') NOT NULL DEFAULT 'Pending',
  `application_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `leave_application_type`
--

DROP TABLE IF EXISTS `leave_application_type`;
CREATE TABLE IF NOT EXISTS `leave_application_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `leave_category` varchar(200) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `leave_category`
--

DROP TABLE IF EXISTS `leave_category`;
CREATE TABLE IF NOT EXISTS `leave_category` (
  `leave_category_id` int(2) NOT NULL AUTO_INCREMENT,
  `category` varchar(100) NOT NULL,
  PRIMARY KEY (`leave_category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `locales`
--

DROP TABLE IF EXISTS `locales`;
CREATE TABLE IF NOT EXISTS `locales` (
  `locale` varchar(10) NOT NULL,
  `code` varchar(10) DEFAULT NULL,
  `language` varchar(100) DEFAULT NULL,
  `name` varchar(250) NOT NULL DEFAULT '',
  PRIMARY KEY (`locale`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `locales`
--

INSERT INTO `locales` (`locale`, `code`, `language`, `name`) VALUES
('aa_DJ', 'aa', 'afar', 'Afar (Djibouti)'),
('aa_ER', 'aa', 'afar', 'Afar (Eritrea)'),
('aa_ET', 'aa', 'afar', 'Afar (Ethiopia)'),
('af_ZA', 'af', 'afrikaans', 'Afrikaans (South Africa)'),
('am_ET', 'am', 'amharic', 'Amharic (Ethiopia)'),
('an_ES', 'an', 'aragonese', 'Aragonese (Spain)'),
('ar_AE', 'ar', 'arabic', 'Arabic (United Arab Emirates)'),
('ar_BH', 'ar', 'arabic', 'Arabic (Bahrain)'),
('ar_DZ', 'ar', 'arabic', 'Arabic (Algeria)'),
('ar_EG', 'ar', 'arabic', 'Arabic (Egypt)'),
('ar_IN', 'ar', 'arabic', 'Arabic (India)'),
('ar_IQ', 'ar', 'arabic', 'Arabic (Iraq)'),
('ar_JO', 'ar', 'arabic', 'Arabic (Jordan)'),
('ar_KW', 'ar', 'arabic', 'Arabic (Kuwait)'),
('ar_LB', 'ar', 'arabic', 'Arabic (Lebanon)'),
('ar_LY', 'ar', 'arabic', 'Arabic (Libya)'),
('ar_MA', 'ar', 'arabic', 'Arabic (Morocco)'),
('ar_OM', 'ar', 'arabic', 'Arabic (Oman)'),
('ar_QA', 'ar', 'arabic', 'Arabic (Qatar)'),
('ar_SA', 'ar', 'arabic', 'Arabic (Saudi Arabia)'),
('ar_SD', 'ar', 'arabic', 'Arabic (Sudan)'),
('ar_SY', 'ar', 'arabic', 'Arabic (Syria)'),
('ar_TN', 'ar', 'arabic', 'Arabic (Tunisia)'),
('ar_YE', 'ar', 'arabic', 'Arabic (Yemen)'),
('ast_ES', 'ast', 'asturian', 'Asturian (Spain)'),
('as_IN', 'as', 'assamese', 'Assamese (India)'),
('az_AZ', 'az', 'azerbaijani', 'Azerbaijani (Azerbaijan)'),
('az_TR', 'az', 'azerbaijani', 'Azerbaijani (Turkey)'),
('bem_ZM', 'bem', 'bemba', 'Bemba (Zambia)'),
('ber_DZ', 'ber', 'berber', 'Berber (Algeria)'),
('ber_MA', 'ber', 'berber', 'Berber (Morocco)'),
('be_BY', 'be', 'belarusian', 'Belarusian (Belarus)'),
('bg_BG', 'bg', 'bulgarian', 'Bulgarian (Bulgaria)'),
('bn_BD', 'bn', 'bengali', 'Bengali (Bangladesh)'),
('bn_IN', 'bn', 'bengali', 'Bengali (India)'),
('bo_CN', 'bo', 'tibetan', 'Tibetan (China)'),
('bo_IN', 'bo', 'tibetan', 'Tibetan (India)'),
('br_FR', 'br', 'breton', 'Breton (France)'),
('bs_BA', 'bs', 'bosnian', 'Bosnian (Bosnia and Herzegovina)'),
('byn_ER', 'byn', 'blin', 'Blin (Eritrea)'),
('ca_AD', 'ca', 'catalan', 'Catalan (Andorra)'),
('ca_ES', 'ca', 'catalan', 'Catalan (Spain)'),
('ca_FR', 'ca', 'catalan', 'Catalan (France)'),
('ca_IT', 'ca', 'catalan', 'Catalan (Italy)'),
('crh_UA', 'crh', 'crimean turkish', 'Crimean Turkish (Ukraine)'),
('csb_PL', 'csb', 'kashubian', 'Kashubian (Poland)'),
('cs_CZ', 'cs', 'czech', 'Czech (Czech Republic)'),
('cv_RU', 'cv', 'chuvash', 'Chuvash (Russia)'),
('cy_GB', 'cy', 'welsh', 'Welsh (United Kingdom)'),
('da_DK', 'da', 'danish', 'Danish (Denmark)'),
('de_AT', 'de', 'german', 'German (Austria)'),
('de_BE', 'de', 'german', 'German (Belgium)'),
('de_CH', 'de', 'german', 'German (Switzerland)'),
('de_DE', 'de', 'german', 'German (Germany)'),
('de_LI', 'de', 'german', 'German (Liechtenstein)'),
('de_LU', 'de', 'german', 'German (Luxembourg)'),
('dv_MV', 'dv', 'divehi', 'Divehi (Maldives)'),
('dz_BT', 'dz', 'dzongkha', 'Dzongkha (Bhutan)'),
('ee_GH', 'ee', 'ewe', 'Ewe (Ghana)'),
('el_CY', 'el', 'greek', 'Greek (Cyprus)'),
('el_GR', 'el', 'greek', 'Greek (Greece)'),
('en_AG', 'en', 'english', 'English (Antigua and Barbuda)'),
('en_AS', 'en', 'english', 'English (American Samoa)'),
('en_AU', 'en', 'english', 'English (Australia)'),
('en_BW', 'en', 'english', 'English (Botswana)'),
('en_CA', 'en', 'english', 'English (Canada)'),
('en_DK', 'en', 'english', 'English (Denmark)'),
('en_GB', 'en', 'english', 'English (United Kingdom)'),
('en_GU', 'en', 'english', 'English (Guam)'),
('en_HK', 'en', 'english', 'English (Hong Kong SAR China)'),
('en_IE', 'en', 'english', 'English (Ireland)'),
('en_IN', 'en', 'english', 'English (India)'),
('en_JM', 'en', 'english', 'English (Jamaica)'),
('en_MH', 'en', 'english', 'English (Marshall Islands)'),
('en_MP', 'en', 'english', 'English (Northern Mariana Islands)'),
('en_MU', 'en', 'english', 'English (Mauritius)'),
('en_NG', 'en', 'english', 'English (Nigeria)'),
('en_NZ', 'en', 'english', 'English (New Zealand)'),
('en_PH', 'en', 'english', 'English (Philippines)'),
('en_SG', 'en', 'english', 'English (Singapore)'),
('en_TT', 'en', 'english', 'English (Trinidad and Tobago)'),
('en_US', 'en', 'english', 'English (United States)'),
('en_VI', 'en', 'english', 'English (Virgin Islands)'),
('en_ZA', 'en', 'english', 'English (South Africa)'),
('en_ZM', 'en', 'english', 'English (Zambia)'),
('en_ZW', 'en', 'english', 'English (Zimbabwe)'),
('eo', 'eo', 'esperanto', 'Esperanto'),
('es_AR', 'es', 'spanish', 'Spanish (Argentina)'),
('es_BO', 'es', 'spanish', 'Spanish (Bolivia)'),
('es_CL', 'es', 'spanish', 'Spanish (Chile)'),
('es_CO', 'es', 'spanish', 'Spanish (Colombia)'),
('es_CR', 'es', 'spanish', 'Spanish (Costa Rica)'),
('es_DO', 'es', 'spanish', 'Spanish (Dominican Republic)'),
('es_EC', 'es', 'spanish', 'Spanish (Ecuador)'),
('es_ES', 'es', 'spanish', 'Spanish (Spain)'),
('es_GT', 'es', 'spanish', 'Spanish (Guatemala)'),
('es_HN', 'es', 'spanish', 'Spanish (Honduras)'),
('es_MX', 'es', 'spanish', 'Spanish (Mexico)'),
('es_NI', 'es', 'spanish', 'Spanish (Nicaragua)'),
('es_PA', 'es', 'spanish', 'Spanish (Panama)'),
('es_PE', 'es', 'spanish', 'Spanish (Peru)'),
('es_PR', 'es', 'spanish', 'Spanish (Puerto Rico)'),
('es_PY', 'es', 'spanish', 'Spanish (Paraguay)'),
('es_SV', 'es', 'spanish', 'Spanish (El Salvador)'),
('es_US', 'es', 'spanish', 'Spanish (United States)'),
('es_UY', 'es', 'spanish', 'Spanish (Uruguay)'),
('es_VE', 'es', 'spanish', 'Spanish (Venezuela)'),
('et_EE', 'et', 'estonian', 'Estonian (Estonia)'),
('eu_ES', 'eu', 'basque', 'Basque (Spain)'),
('eu_FR', 'eu', 'basque', 'Basque (France)'),
('fa_AF', 'fa', 'persian', 'Persian (Afghanistan)'),
('fa_IR', 'fa', 'persian', 'Persian (Iran)'),
('ff_SN', 'ff', 'fulah', 'Fulah (Senegal)'),
('fil_PH', 'fil', 'filipino', 'Filipino (Philippines)'),
('fi_FI', 'fi', 'finnish', 'Finnish (Finland)'),
('fo_FO', 'fo', 'faroese', 'Faroese (Faroe Islands)'),
('fr_BE', 'fr', 'french', 'French (Belgium)'),
('fr_BF', 'fr', 'french', 'French (Burkina Faso)'),
('fr_BI', 'fr', 'french', 'French (Burundi)'),
('fr_BJ', 'fr', 'french', 'French (Benin)'),
('fr_CA', 'fr', 'french', 'French (Canada)'),
('fr_CF', 'fr', 'french', 'French (Central African Republic)'),
('fr_CG', 'fr', 'french', 'French (Congo)'),
('fr_CH', 'fr', 'french', 'French (Switzerland)'),
('fr_CM', 'fr', 'french', 'French (Cameroon)'),
('fr_FR', 'fr', 'french', 'French (France)'),
('fr_GA', 'fr', 'french', 'French (Gabon)'),
('fr_GN', 'fr', 'french', 'French (Guinea)'),
('fr_GP', 'fr', 'french', 'French (Guadeloupe)'),
('fr_GQ', 'fr', 'french', 'French (Equatorial Guinea)'),
('fr_KM', 'fr', 'french', 'French (Comoros)'),
('fr_LU', 'fr', 'french', 'French (Luxembourg)'),
('fr_MC', 'fr', 'french', 'French (Monaco)'),
('fr_MG', 'fr', 'french', 'French (Madagascar)'),
('fr_ML', 'fr', 'french', 'French (Mali)'),
('fr_MQ', 'fr', 'french', 'French (Martinique)'),
('fr_NE', 'fr', 'french', 'French (Niger)'),
('fr_SN', 'fr', 'french', 'French (Senegal)'),
('fr_TD', 'fr', 'french', 'French (Chad)'),
('fr_TG', 'fr', 'french', 'French (Togo)'),
('fur_IT', 'fur', 'friulian', 'Friulian (Italy)'),
('fy_DE', 'fy', 'western frisian', 'Western Frisian (Germany)'),
('fy_NL', 'fy', 'western frisian', 'Western Frisian (Netherlands)'),
('ga_IE', 'ga', 'irish', 'Irish (Ireland)'),
('gd_GB', 'gd', 'scottish gaelic', 'Scottish Gaelic (United Kingdom)'),
('gez_ER', 'gez', 'geez', 'Geez (Eritrea)'),
('gez_ET', 'gez', 'geez', 'Geez (Ethiopia)'),
('gl_ES', 'gl', 'galician', 'Galician (Spain)'),
('gu_IN', 'gu', 'gujarati', 'Gujarati (India)'),
('gv_GB', 'gv', 'manx', 'Manx (United Kingdom)'),
('ha_NG', 'ha', 'hausa', 'Hausa (Nigeria)'),
('he_IL', 'he', 'hebrew', 'Hebrew (Israel)'),
('hi_IN', 'hi', 'hindi', 'Hindi (India)'),
('hr_HR', 'hr', 'croatian', 'Croatian (Croatia)'),
('hsb_DE', 'hsb', 'upper sorbian', 'Upper Sorbian (Germany)'),
('ht_HT', 'ht', 'haitian', 'Haitian (Haiti)'),
('hu_HU', 'hu', 'hungarian', 'Hungarian (Hungary)'),
('hy_AM', 'hy', 'armenian', 'Armenian (Armenia)'),
('ia', 'ia', 'interlingua', 'Interlingua'),
('id_ID', 'id', 'indonesian', 'Indonesian (Indonesia)'),
('ig_NG', 'ig', 'igbo', 'Igbo (Nigeria)'),
('ik_CA', 'ik', 'inupiaq', 'Inupiaq (Canada)'),
('is_IS', 'is', 'icelandic', 'Icelandic (Iceland)'),
('it_CH', 'it', 'italian', 'Italian (Switzerland)'),
('it_IT', 'it', 'italian', 'Italian (Italy)'),
('iu_CA', 'iu', 'inuktitut', 'Inuktitut (Canada)'),
('ja_JP', 'ja', 'japanese', 'Japanese (Japan)'),
('ka_GE', 'ka', 'georgian', 'Georgian (Georgia)'),
('kk_KZ', 'kk', 'kazakh', 'Kazakh (Kazakhstan)'),
('kl_GL', 'kl', 'kalaallisut', 'Kalaallisut (Greenland)'),
('km_KH', 'km', 'khmer', 'Khmer (Cambodia)'),
('kn_IN', 'kn', 'kannada', 'Kannada (India)'),
('kok_IN', 'kok', 'konkani', 'Konkani (India)'),
('ko_KR', 'ko', 'korean', 'Korean (South Korea)'),
('ks_IN', 'ks', 'kashmiri', 'Kashmiri (India)'),
('ku_TR', 'ku', 'kurdish', 'Kurdish (Turkey)'),
('kw_GB', 'kw', 'cornish', 'Cornish (United Kingdom)'),
('ky_KG', 'ky', 'kirghiz', 'Kirghiz (Kyrgyzstan)'),
('lg_UG', 'lg', 'ganda', 'Ganda (Uganda)'),
('li_BE', 'li', 'limburgish', 'Limburgish (Belgium)'),
('li_NL', 'li', 'limburgish', 'Limburgish (Netherlands)'),
('lo_LA', 'lo', 'lao', 'Lao (Laos)'),
('lt_LT', 'lt', 'lithuanian', 'Lithuanian (Lithuania)'),
('lv_LV', 'lv', 'latvian', 'Latvian (Latvia)'),
('mai_IN', 'mai', 'maithili', 'Maithili (India)'),
('mg_MG', 'mg', 'malagasy', 'Malagasy (Madagascar)'),
('mi_NZ', 'mi', 'maori', 'Maori (New Zealand)'),
('mk_MK', 'mk', 'macedonian', 'Macedonian (Macedonia)'),
('ml_IN', 'ml', 'malayalam', 'Malayalam (India)'),
('mn_MN', 'mn', 'mongolian', 'Mongolian (Mongolia)'),
('mr_IN', 'mr', 'marathi', 'Marathi (India)'),
('ms_BN', 'ms', 'malay', 'Malay (Brunei)'),
('ms_MY', 'ms', 'malay', 'Malay (Malaysia)'),
('mt_MT', 'mt', 'maltese', 'Maltese (Malta)'),
('my_MM', 'my', 'burmese', 'Burmese (Myanmar)'),
('naq_NA', 'naq', 'namibia', 'Namibia'),
('nb_NO', 'nb', 'norwegian bokm?l', 'Norwegian Bokm?l (Norway)'),
('nds_DE', 'nds', 'low german', 'Low German (Germany)'),
('nds_NL', 'nds', 'low german', 'Low German (Netherlands)'),
('ne_NP', 'ne', 'nepali', 'Nepali (Nepal)'),
('nl_AW', 'nl', 'dutch', 'Dutch (Aruba)'),
('nl_BE', 'nl', 'dutch', 'Dutch (Belgium)'),
('nl_NL', 'nl', 'dutch', 'Dutch (Netherlands)'),
('nn_NO', 'nn', 'norwegian nynorsk', 'Norwegian Nynorsk (Norway)'),
('no_NO', 'no', 'norwegian', 'Norwegian (Norway)'),
('nr_ZA', 'nr', 'south ndebele', 'South Ndebele (South Africa)'),
('nso_ZA', 'nso', 'northern sotho', 'Northern Sotho (South Africa)'),
('oc_FR', 'oc', 'occitan', 'Occitan (France)'),
('om_ET', 'om', 'oromo', 'Oromo (Ethiopia)'),
('om_KE', 'om', 'oromo', 'Oromo (Kenya)'),
('or_IN', 'or', 'oriya', 'Oriya (India)'),
('os_RU', 'os', 'ossetic', 'Ossetic (Russia)'),
('pap_AN', 'pap', 'papiamento', 'Papiamento (Netherlands Antilles)'),
('pa_IN', 'pa', 'punjabi', 'Punjabi (India)'),
('pa_PK', 'pa', 'punjabi', 'Punjabi (Pakistan)'),
('pl_PL', 'pl', 'polish', 'Polish (Poland)'),
('ps_AF', 'ps', 'pashto', 'Pashto (Afghanistan)'),
('pt_BR', 'pt', 'portuguese', 'Portuguese (Brazil)'),
('pt_GW', 'pt', 'portuguese', 'Portuguese (Guinea-Bissau)'),
('pt_PT', 'pt', 'portuguese', 'Portuguese (Portugal)'),
('ro_MD', 'ro', 'romanian', 'Romanian (Moldova)'),
('ro_RO', 'ro', 'romanian', 'Romanian (Romania)'),
('ru_RU', 'ru', 'russian', 'Russian (Russia)'),
('ru_UA', 'ru', 'russian', 'Russian (Ukraine)'),
('rw_RW', 'rw', 'kinyarwanda', 'Kinyarwanda (Rwanda)'),
('sa_IN', 'sa', 'sanskrit', 'Sanskrit (India)'),
('sc_IT', 'sc', 'sardinian', 'Sardinian (Italy)'),
('sd_IN', 'sd', 'sindhi', 'Sindhi (India)'),
('seh_MZ', 'seh', 'sena', 'Sena (Mozambique)'),
('se_NO', 'se', 'northern sami', 'Northern Sami (Norway)'),
('sid_ET', 'sid', 'sidamo', 'Sidamo (Ethiopia)'),
('si_LK', 'si', 'sinhala', 'Sinhala (Sri Lanka)'),
('sk_SK', 'sk', 'slovak', 'Slovak (Slovakia)'),
('sl_SI', 'sl', 'slovenian', 'Slovenian (Slovenia)'),
('sn_ZW', 'sn', 'shona', 'Shona (Zimbabwe)'),
('so_DJ', 'so', 'somali', 'Somali (Djibouti)'),
('so_ET', 'so', 'somali', 'Somali (Ethiopia)'),
('so_KE', 'so', 'somali', 'Somali (Kenya)'),
('so_SO', 'so', 'somali', 'Somali (Somalia)'),
('sq_AL', 'sq', 'albanian', 'Albanian (Albania)'),
('sq_MK', 'sq', 'albanian', 'Albanian (Macedonia)'),
('sr_BA', 'sr', 'serbian', 'Serbian (Bosnia and Herzegovina)'),
('sr_ME', 'sr', 'serbian', 'Serbian (Montenegro)'),
('sr_RS', 'sr', 'serbian', 'Serbian (Serbia)'),
('ss_ZA', 'ss', 'swati', 'Swati (South Africa)'),
('st_ZA', 'st', 'southern sotho', 'Southern Sotho (South Africa)'),
('sv_FI', 'sv', 'swedish', 'Swedish (Finland)'),
('sv_SE', 'sv', 'swedish', 'Swedish (Sweden)'),
('sw_KE', 'sw', 'swahili', 'Swahili (Kenya)'),
('sw_TZ', 'sw', 'swahili', 'Swahili (Tanzania)'),
('ta_IN', 'ta', 'tamil', 'Tamil (India)'),
('teo_UG', 'teo', 'teso', 'Teso (Uganda)'),
('te_IN', 'te', 'telugu', 'Telugu (India)'),
('tg_TJ', 'tg', 'tajik', 'Tajik (Tajikistan)'),
('th_TH', 'th', 'thai', 'Thai (Thailand)'),
('tig_ER', 'tig', 'tigre', 'Tigre (Eritrea)'),
('ti_ER', 'ti', 'tigrinya', 'Tigrinya (Eritrea)'),
('ti_ET', 'ti', 'tigrinya', 'Tigrinya (Ethiopia)'),
('tk_TM', 'tk', 'turkmen', 'Turkmen (Turkmenistan)'),
('tl_PH', 'tl', 'tagalog', 'Tagalog (Philippines)'),
('tn_ZA', 'tn', 'tswana', 'Tswana (South Africa)'),
('to_TO', 'to', 'tongan', 'Tongan (Tonga)'),
('tr_CY', 'tr', 'turkish', 'Turkish (Cyprus)'),
('tr_TR', 'tr', 'turkish', 'Turkish (Turkey)'),
('ts_ZA', 'ts', 'tsonga', 'Tsonga (South Africa)'),
('tt_RU', 'tt', 'tatar', 'Tatar (Russia)'),
('ug_CN', 'ug', 'uighur', 'Uighur (China)'),
('uk_UA', 'uk', 'ukrainian', 'Ukrainian (Ukraine)'),
('ur_PK', 'ur', 'urdu', 'Urdu (Pakistan)'),
('uz_UZ', 'uz', 'uzbek', 'Uzbek (Uzbekistan)'),
('ve_ZA', 've', 'venda', 'Venda (South Africa)'),
('vi_VN', 'vi', 'vietnamese', 'Vietnamese (Vietnam)'),
('wa_BE', 'wa', 'walloon', 'Walloon (Belgium)'),
('wo_SN', 'wo', 'wolof', 'Wolof (Senegal)'),
('xh_ZA', 'xh', 'xhosa', 'Xhosa (South Africa)'),
('yi_US', 'yi', 'yiddish', 'Yiddish (United States)'),
('yo_NG', 'yo', 'yoruba', 'Yoruba (Nigeria)'),
('zh_CN', 'zh', 'chinese', 'Chinese (China)'),
('zh_HK', 'zh', 'chinese', 'Chinese (Hong Kong SAR China)'),
('zh_SG', 'zh', 'chinese', 'Chinese (Singapore)'),
('zh_TW', 'zh', 'chinese', 'Chinese (Taiwan)'),
('zu_ZA', 'zu', 'zulu', 'Zulu (South Africa)');

-- --------------------------------------------------------

--
-- Table structure for table `login_attempts`
--

DROP TABLE IF EXISTS `login_attempts`;
CREATE TABLE IF NOT EXISTS `login_attempts` (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `ip_address` varchar(15) NOT NULL,
  `login` varchar(100) NOT NULL,
  `time` int(11) UNSIGNED DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `notice`
--

DROP TABLE IF EXISTS `notice`;
CREATE TABLE IF NOT EXISTS `notice` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(150) NOT NULL,
  `short` varchar(300) NOT NULL,
  `description` text NOT NULL,
  `status` enum('Published','UnPublished') NOT NULL DEFAULT 'UnPublished',
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `options`
--

DROP TABLE IF EXISTS `options`;
CREATE TABLE IF NOT EXISTS `options` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `value` longtext,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `options`
--

INSERT INTO `options` (`id`, `name`, `value`) VALUES
(1, 'company_name', 'eOffice Manager'),
(2, 'address', '360 Edgefield Circle  Butte, MT 59701'),
(3, 'email', 'support@codeslab.net'),
(4, 'city', 'Stamford'),
(5, 'postal_code', '46556'),
(6, 'phone', '203-962-5164'),
(7, 'company_logo', 'fig-01.png'),
(8, 'icon', 'fig-02.png'),
(9, 'country', 'Iraq'),
(10, 'time_zone', 'Asia/Baghdad'),
(11, 'default_currency', 'USD'),
(12, 'currency_symbol', '$'),
(13, 'currency_format', '2'),
(14, 'date_format', 'Y-m-d'),
(15, 'invoice_prefix', 'Invoice #'),
(16, 'order_prefix', 'Purchase Ref#'),
(17, 'invoice_text', '<p>Thanks for Doing Business with us.<br></p>'),
(18, 'invoice_logo', 'fig-011.png'),
(19, 'smtp_host', 'SMTP Host'),
(20, 'smtp_username', 'company@email.com'),
(21, 'smtp_password', 'SMTP Password'),
(22, 'smtp_port', 'SMTP Port'),
(23, 'mail_sender', 'Codes Lab'),
(24, 'invoice_mail_from', 'sales@codeslab.net'),
(25, 'campaign_mail_from', 'no-replay@codeslab.net'),
(26, 'recovery_mail_from', 'no-replay@codeslab.net'),
(27, 'all_other_mails_from', 'no-replay@codeslab.net'),
(28, 'email_send_option', 'smtp'),
(29, 'login_logo', 'eoffice_logo.png'),
(30, 'login_title', 'Ultimate HRM & Accounts Features '),
(31, 'login_description', 'eOffice is an office management software where you can easily manage your Employee, Accounts, Business Transaction, Manage product, customer, Vendor, Sales and Purchase etc.'),
(32, 'brand', 'eOffice');

-- --------------------------------------------------------

--
-- Table structure for table `order_details`
--

DROP TABLE IF EXISTS `order_details`;
CREATE TABLE IF NOT EXISTS `order_details` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `product_name` varchar(100) NOT NULL,
  `description` text NOT NULL,
  `purchase_cost` decimal(13,2) NOT NULL,
  `sales_cost` decimal(13,2) NOT NULL,
  `tax_amount` decimal(13,2) NOT NULL,
  `qty` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `outbox`
--

DROP TABLE IF EXISTS `outbox`;
CREATE TABLE IF NOT EXISTS `outbox` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `from_emp_id` int(11) NOT NULL,
  `from_type` enum('admin','employee') NOT NULL,
  `cc` text NOT NULL,
  `subject` varchar(200) NOT NULL,
  `msg` text NOT NULL,
  `attachment` text NOT NULL,
  `attachment_id` varchar(200) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `outbox`
--

INSERT INTO `outbox` (`id`, `from_emp_id`, `from_type`, `cc`, `subject`, `msg`, `attachment`, `attachment_id`, `date`) VALUES
(1, 3, 'admin', '[\"2*A\"]', 'Hello', '<p>This is a test email</p>', 'null', '1634771665-20200611-060901', '2020-06-11 06:09:01');

-- --------------------------------------------------------

--
-- Table structure for table `payment`
--

DROP TABLE IF EXISTS `payment`;
CREATE TABLE IF NOT EXISTS `payment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `payment_date` varchar(100) NOT NULL,
  `order_id` int(11) NOT NULL,
  `order_ref` varchar(100) NOT NULL,
  `amount` decimal(13,2) NOT NULL,
  `method` varchar(11) NOT NULL,
  `payment_method` varchar(100) NOT NULL,
  `cc_name` varchar(100) DEFAULT NULL,
  `cc_number` varchar(100) DEFAULT NULL,
  `cc_type` varchar(100) DEFAULT NULL,
  `cc_month` varchar(100) DEFAULT NULL,
  `cc_year` varchar(100) DEFAULT NULL,
  `cvc` varchar(100) DEFAULT NULL,
  `payment_ref` varchar(100) DEFAULT NULL,
  `attachment` varchar(100) DEFAULT NULL,
  `received_by` varchar(11) NOT NULL,
  `type` enum('Sales','Purchase') NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `payroll`
--

DROP TABLE IF EXISTS `payroll`;
CREATE TABLE IF NOT EXISTS `payroll` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `month` varchar(50) NOT NULL,
  `employee_id` int(11) NOT NULL,
  `department_id` int(11) NOT NULL,
  `gross_salary` decimal(13,2) NOT NULL DEFAULT '0.00',
  `deduction` decimal(13,2) NOT NULL DEFAULT '0.00',
  `net_salary` decimal(13,2) NOT NULL DEFAULT '0.00',
  `award` longtext NOT NULL,
  `fine_deduction` decimal(13,2) NOT NULL DEFAULT '0.00',
  `bonus` decimal(13,2) NOT NULL DEFAULT '0.00',
  `payment_method` varchar(100) NOT NULL,
  `note` text NOT NULL,
  `net_payment` decimal(13,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `persons`
--

DROP TABLE IF EXISTS `persons`;
CREATE TABLE IF NOT EXISTS `persons` (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `firstName` varchar(100) DEFAULT NULL,
  `lastName` varchar(100) DEFAULT NULL,
  `gender` enum('male','female') DEFAULT NULL,
  `address` varchar(200) DEFAULT NULL,
  `dob` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
CREATE TABLE IF NOT EXISTS `product` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `sku` varchar(100) NOT NULL,
  `category_id` int(3) DEFAULT NULL,
  `sales_info` varchar(255) DEFAULT NULL,
  `sales_cost` decimal(13,2) NOT NULL DEFAULT '0.00',
  `buying_info` varchar(255) DEFAULT NULL,
  `buying_cost` decimal(13,2) NOT NULL DEFAULT '0.00',
  `tax_id` int(11) NOT NULL,
  `inventory` int(11) DEFAULT '0',
  `bundle` longtext,
  `p_image` varchar(150) DEFAULT NULL,
  `type` enum('Inventory','Non-Inventory','Service','Bundle') NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `product_category`
--

DROP TABLE IF EXISTS `product_category`;
CREATE TABLE IF NOT EXISTS `product_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `product_category`
--

INSERT INTO `product_category` (`id`, `category`) VALUES
(1, 'Medical');

-- --------------------------------------------------------

--
-- Table structure for table `purchase_details`
--

DROP TABLE IF EXISTS `purchase_details`;
CREATE TABLE IF NOT EXISTS `purchase_details` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `purchase_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `product_name` varchar(100) NOT NULL,
  `description` text NOT NULL,
  `qty` int(11) NOT NULL,
  `total_received` int(11) NOT NULL DEFAULT '0',
  `return_qty` int(11) NOT NULL,
  `unit_price` decimal(13,2) NOT NULL,
  `sub_total` decimal(13,2) NOT NULL,
  `ref` int(11) NOT NULL,
  `type` enum('Purchase','Return') NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `purchase_order`
--

DROP TABLE IF EXISTS `purchase_order`;
CREATE TABLE IF NOT EXISTS `purchase_order` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `vendor_id` int(11) NOT NULL,
  `vendor_name` varchar(100) NOT NULL,
  `email` varchar(100) CHARACTER SET utf8 NOT NULL,
  `b_address` text CHARACTER SET utf8 NOT NULL,
  `cart` longtext CHARACTER SET utf8 NOT NULL,
  `cart_total` decimal(13,2) NOT NULL,
  `discount` decimal(13,2) NOT NULL,
  `tax` decimal(13,2) NOT NULL,
  `shipping` decimal(13,2) NOT NULL,
  `grand_total` decimal(13,2) NOT NULL,
  `paid_amount` decimal(13,2) NOT NULL,
  `due_payment` decimal(13,2) NOT NULL,
  `order_note` text NOT NULL,
  `status` enum('Pending','Partial') CHARACTER SET utf8 NOT NULL,
  `sales_person` varchar(50) NOT NULL,
  `ref` varchar(100) NOT NULL,
  `type` enum('Purchase','Return') NOT NULL,
  `return_ref` int(11) DEFAULT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `received_product`
--

DROP TABLE IF EXISTS `received_product`;
CREATE TABLE IF NOT EXISTS `received_product` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `vendor_id` int(11) NOT NULL,
  `vendor_name` varchar(100) NOT NULL,
  `product_id` int(11) NOT NULL,
  `product_name` varchar(100) NOT NULL,
  `qty` int(11) NOT NULL,
  `receiver` varchar(100) NOT NULL,
  `date_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `salary`
--

DROP TABLE IF EXISTS `salary`;
CREATE TABLE IF NOT EXISTS `salary` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `employee_id` int(11) NOT NULL,
  `grade_id` int(11) NOT NULL,
  `comment` longtext NOT NULL,
  `total_payable` double NOT NULL,
  `total_cost_company` double NOT NULL,
  `total_deduction` double NOT NULL,
  `component` longtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `salary_component`
--

DROP TABLE IF EXISTS `salary_component`;
CREATE TABLE IF NOT EXISTS `salary_component` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `component_name` varchar(128) CHARACTER SET latin1 NOT NULL,
  `type` int(2) NOT NULL COMMENT '1= Earning; 2= Deduction ',
  `total_payable` int(1) DEFAULT '0',
  `cost_company` int(1) DEFAULT '0',
  `value_type` int(2) NOT NULL COMMENT '1= Amount ; 2= Percentage ',
  `flag` tinyint(2) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `salary_component`
--

INSERT INTO `salary_component` (`id`, `component_name`, `type`, `total_payable`, `cost_company`, `value_type`, `flag`) VALUES
(1, 'Basic Payment', 1, 1, 1, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `salary_grade`
--

DROP TABLE IF EXISTS `salary_grade`;
CREATE TABLE IF NOT EXISTS `salary_grade` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `grade_name` varchar(100) NOT NULL,
  `min_salary` float NOT NULL,
  `max_salary` float NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `sales_order`
--

DROP TABLE IF EXISTS `sales_order`;
CREATE TABLE IF NOT EXISTS `sales_order` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) NOT NULL,
  `customer_name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `b_address` text NOT NULL,
  `s_address` text NOT NULL,
  `invoice_date` varchar(20) NOT NULL,
  `due_date` varchar(20) NOT NULL,
  `cart` longtext NOT NULL,
  `cart_total` decimal(13,2) NOT NULL,
  `grand_total` decimal(13,2) NOT NULL,
  `tax` decimal(13,2) NOT NULL,
  `discount` decimal(13,2) NOT NULL,
  `amount_received` decimal(13,2) NOT NULL,
  `due_payment` decimal(13,2) NOT NULL,
  `payment_method` varchar(100) NOT NULL,
  `p_reference` varchar(100) NOT NULL,
  `order_note` text NOT NULL,
  `type` enum('Invoice','Quotation') NOT NULL,
  `status` enum('Close','Cancel','Open','Pending') NOT NULL,
  `history` text NOT NULL,
  `sales_person` varchar(50) NOT NULL,
  `cancel_note` text,
  `delivery_status` enum('Processing Order','Awaiting Delivery','Done','') NOT NULL,
  `tracking` varchar(100) DEFAULT NULL,
  `delivery_person` varchar(100) DEFAULT NULL,
  `delivery_date` varchar(100) DEFAULT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `subordinate`
--

DROP TABLE IF EXISTS `subordinate`;
CREATE TABLE IF NOT EXISTS `subordinate` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `employee_id` int(11) NOT NULL,
  `subordinate_id` int(11) NOT NULL,
  `department_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `supervisor`
--

DROP TABLE IF EXISTS `supervisor`;
CREATE TABLE IF NOT EXISTS `supervisor` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `employee_id` int(11) NOT NULL,
  `supervisor_id` int(11) NOT NULL,
  `department_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tax`
--

DROP TABLE IF EXISTS `tax`;
CREATE TABLE IF NOT EXISTS `tax` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `rate` decimal(13,2) NOT NULL,
  `type` tinyint(2) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tax`
--

INSERT INTO `tax` (`id`, `name`, `rate`, `type`) VALUES
(1, 'None', '0.00', 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_attendance`
--

DROP TABLE IF EXISTS `tbl_attendance`;
CREATE TABLE IF NOT EXISTS `tbl_attendance` (
  `attendance_id` int(11) NOT NULL AUTO_INCREMENT,
  `employee_id` int(11) NOT NULL,
  `leave_category_id` int(11) DEFAULT NULL,
  `date` date NOT NULL,
  `attendance_status` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'status 1=present 0=absen and 3= onleave',
  `in_time` time NOT NULL,
  `out_time` time NOT NULL,
  PRIMARY KEY (`attendance_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `transactions`
--

DROP TABLE IF EXISTS `transactions`;
CREATE TABLE IF NOT EXISTS `transactions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `transaction_id` int(11) NOT NULL,
  `transaction_type_id` tinyint(2) NOT NULL COMMENT '1=Deposit, 2=Expense, 3=AP, 4=AR, 5= Account Transfer',
  `transaction_type` varchar(100) NOT NULL,
  `account_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `amount` decimal(13,2) NOT NULL DEFAULT '0.00',
  `description` varchar(200) NOT NULL,
  `payment_method` varchar(100) NOT NULL,
  `ref` varchar(150) NOT NULL,
  `balance` decimal(13,2) NOT NULL DEFAULT '0.00',
  `date_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `transfer_ref` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `transactions`
--

INSERT INTO `transactions` (`id`, `transaction_id`, `transaction_type_id`, `transaction_type`, `account_id`, `category_id`, `amount`, `description`, `payment_method`, `ref`, `balance`, `date_time`, `transfer_ref`) VALUES
(1, 101, 2, 'Expense', 1, 1, '250.00', 'A laptop was bought for Hanaw', 'Cash', '', '-250.00', '2020-06-11 06:28:29', 0);

-- --------------------------------------------------------

--
-- Table structure for table `transaction_category`
--

DROP TABLE IF EXISTS `transaction_category`;
CREATE TABLE IF NOT EXISTS `transaction_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `description` varchar(100) NOT NULL,
  `type` tinyint(2) NOT NULL COMMENT '1=deposit; 2=expense',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `transaction_category`
--

INSERT INTO `transaction_category` (`id`, `name`, `description`, `type`) VALUES
(1, 'Electronics', 'This includes Computers and electronics', 2);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `employee_id` int(11) NOT NULL,
  `ip_address` varchar(15) NOT NULL,
  `username` varchar(100) DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `salt` varchar(255) DEFAULT NULL,
  `email` varchar(100) NOT NULL,
  `activation_code` varchar(40) DEFAULT NULL,
  `forgotten_password_code` varchar(40) DEFAULT NULL,
  `forgotten_password_time` int(11) UNSIGNED DEFAULT NULL,
  `remember_code` varchar(40) DEFAULT NULL,
  `created_on` int(11) UNSIGNED NOT NULL,
  `last_login` int(11) UNSIGNED DEFAULT NULL,
  `active` tinyint(1) UNSIGNED DEFAULT NULL,
  `first_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `company` varchar(100) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `type` varchar(10) NOT NULL DEFAULT 'user',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `users_groups`
--

DROP TABLE IF EXISTS `users_groups`;
CREATE TABLE IF NOT EXISTS `users_groups` (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` int(11) UNSIGNED NOT NULL,
  `group_id` mediumint(8) UNSIGNED NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `vendor`
--

DROP TABLE IF EXISTS `vendor`;
CREATE TABLE IF NOT EXISTS `vendor` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `vendor_code` int(11) NOT NULL,
  `name` varchar(100) CHARACTER SET utf8 NOT NULL,
  `company_name` varchar(100) CHARACTER SET utf8 NOT NULL,
  `phone` varchar(100) CHARACTER SET utf8 COLLATE utf8_estonian_ci NOT NULL,
  `fax` varchar(100) CHARACTER SET utf8 NOT NULL,
  `email` varchar(100) CHARACTER SET utf8 NOT NULL,
  `website` varchar(100) CHARACTER SET utf8 NOT NULL,
  `b_address` text CHARACTER SET utf8 NOT NULL,
  `note` text CHARACTER SET utf8 NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `working_days`
--

DROP TABLE IF EXISTS `working_days`;
CREATE TABLE IF NOT EXISTS `working_days` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `days` varchar(50) NOT NULL,
  `flag` tinyint(2) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `working_days`
--

INSERT INTO `working_days` (`id`, `days`, `flag`) VALUES
(1, 'Saturday', 1),
(2, 'Sunday', 1),
(3, 'Monday', 1),
(4, 'Tuesday', 1),
(5, 'Wednesday', 1),
(6, 'Thursday', 1),
(7, 'Friday', 0);

-- --------------------------------------------------------

--
-- Table structure for table `work_shift`
--

DROP TABLE IF EXISTS `work_shift`;
CREATE TABLE IF NOT EXISTS `work_shift` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `shift_name` varchar(100) CHARACTER SET latin1 NOT NULL,
  `shift_form` varchar(50) CHARACTER SET latin1 NOT NULL,
  `shift_to` varchar(50) CHARACTER SET latin1 NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `work_shift`
--

INSERT INTO `work_shift` (`id`, `shift_name`, `shift_form`, `shift_to`) VALUES
(1, 'IK-Normal', '09:00 AM', '04:25 PM');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
