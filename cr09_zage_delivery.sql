-- phpMyAdmin SQL Dump
-- version 5.0.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 07, 2020 at 03:40 PM
-- Server version: 10.4.14-MariaDB
-- PHP Version: 7.4.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `cr09_zage_delivery`
--
CREATE DATABASE IF NOT EXISTS `cr09_zage_delivery` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `cr09_zage_delivery`;

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `customer_id` int(11) NOT NULL,
  `first_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(55) DEFAULT NULL,
  `street` varchar(255) DEFAULT NULL,
  `street_nr` int(11) DEFAULT NULL,
  `zip-code` int(11) NOT NULL,
  `city` varchar(55) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`customer_id`, `first_name`, `last_name`, `street`, `street_nr`, `zip-code`, `city`) VALUES
(1, 'Cheech', 'Marlin', 'Weedfield', 420, 1337, 'Funkytown'),
(2, 'Tommy', 'Chong', 'Pipestreet', 69, 1312, 'Cali'),
(3, 'Daniel', 'Codegod', 'Code Avenue 12', 12, 7890, 'Matrix'),
(4, 'Ace', 'Ventura', 'Animalstreet', 48, 9780, 'Safari'),
(5, 'Rip', 'Harambe', 'Heaven 69', 69, 1, 'Jesusfield');

-- --------------------------------------------------------

--
-- Table structure for table `employee`
--

CREATE TABLE `employee` (
  `employee_id` int(11) NOT NULL,
  `first_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(55) DEFAULT NULL,
  `location_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `employee`
--

INSERT INTO `employee` (`employee_id`, `first_name`, `last_name`, `location_id`) VALUES
(1, 'Towelie', 'Drymaker', 1),
(2, 'Randy', 'Marsh', 2),
(3, 'Brian', 'Badluck', 3),
(4, 'Popeye', 'The Sailor', 4),
(5, 'Oliver', 'Kahn', 5);

-- --------------------------------------------------------

--
-- Table structure for table `employee_info`
--

CREATE TABLE `employee_info` (
  `employee_info_id` int(11) NOT NULL,
  `employee_id` int(11) DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `salary` int(11) DEFAULT NULL,
  `birthdate` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `employee_info`
--

INSERT INTO `employee_info` (`employee_info_id`, `employee_id`, `start_date`, `end_date`, `salary`, `birthdate`) VALUES
(1, 1, '2018-11-01', '9999-01-01', 4123, '1988-06-13'),
(2, 2, '2011-03-01', '9999-01-01', 2155, '1976-02-15'),
(3, 3, '2020-11-02', '9999-01-01', 999, '1992-02-17'),
(4, 4, '2001-06-15', '9999-01-01', 3685, '1977-08-21'),
(5, 5, '1999-12-01', '9999-01-01', 1500, '1985-09-11');

-- --------------------------------------------------------

--
-- Table structure for table `location`
--

CREATE TABLE `location` (
  `l_id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `street` varchar(255) DEFAULT NULL,
  `street_nr` int(11) DEFAULT NULL,
  `zip_code` int(11) DEFAULT NULL,
  `city` varchar(55) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `location`
--

INSERT INTO `location` (`l_id`, `name`, `street`, `street_nr`, `zip_code`, `city`) VALUES
(1, 'PickUpStore Vienna', 'Funkystreet', 42, 1337, 'Funkytown'),
(2, 'PickUpStore BrownTown', 'Main Avenue', 69, 5062, 'Wakanda'),
(3, 'PickUpStore TrumpTower', 'Makemystreetgreatagain', 88, 2520, 'Trumptown'),
(4, 'PicUpStore Graz', 'Bodnergasse', 15, 8010, 'Graz'),
(5, 'PickUpStore Munich', 'Weisswurstgasse', 31, 5689, 'Sauerkraut');

-- --------------------------------------------------------

--
-- Table structure for table `package`
--

CREATE TABLE `package` (
  `package_id` int(11) NOT NULL,
  `package_type` enum('letter','parcel') DEFAULT NULL,
  `delivery_type` enum('Standard','Express') DEFAULT NULL,
  `sender_id` int(11) DEFAULT NULL,
  `recipient_id` int(11) DEFAULT NULL,
  `weight` int(11) DEFAULT NULL,
  `unit` enum('G','KG') DEFAULT NULL,
  `size` enum('CATEGORY A','CATEGORY B','CATEGORY C','CATEGORY D','CATEGORY E') DEFAULT NULL,
  `tracking_number` int(11) DEFAULT NULL,
  `deposit_time` datetime DEFAULT NULL,
  `delivery_time` datetime DEFAULT NULL,
  `price` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `package`
--

INSERT INTO `package` (`package_id`, `package_type`, `delivery_type`, `sender_id`, `recipient_id`, `weight`, `unit`, `size`, `tracking_number`, `deposit_time`, `delivery_time`, `price`) VALUES
(1, 'parcel', 'Express', 1, 2, 2, 'KG', 'CATEGORY C', 10111213, '2020-11-02 08:41:48', '2020-11-03 08:15:44', 34.9),
(2, 'parcel', 'Express', 3, 2, 250, 'G', 'CATEGORY B', 10141516, '2020-11-09 13:21:17', NULL, 12.5),
(3, 'letter', 'Standard', 4, 5, 55, 'G', 'CATEGORY A', 10131618, '2020-11-10 13:23:28', '2020-11-11 13:25:37', 4.9),
(4, 'letter', 'Express', 3, 4, 15, 'G', 'CATEGORY A', 10191714, '2020-11-08 15:18:23', '2020-11-09 15:18:23', 2.5),
(5, 'parcel', 'Standard', 5, 1, 500, 'G', 'CATEGORY B', 10191514, '2020-11-09 13:37:40', NULL, 25),
(6, 'parcel', 'Express', 2, 5, 25, 'KG', 'CATEGORY E', 10111516, '2020-11-12 13:49:34', '2020-11-13 13:51:13', 312),
(7, 'parcel', 'Standard', 4, 1, 120, 'G', 'CATEGORY B', 10111518, '2020-11-16 13:52:04', '2020-11-16 17:52:04', 15.9),
(8, 'parcel', 'Standard', 1, 5, 35, 'KG', 'CATEGORY D', 10111215, '2020-11-19 09:53:45', NULL, 419.9),
(9, 'letter', 'Standard', 2, 4, 25, 'G', 'CATEGORY D', 10111528, '2020-11-10 06:55:35', NULL, 3.5),
(10, 'letter', 'Express', 3, 1, 50, 'G', 'CATEGORY B', 10151718, '2020-11-11 19:56:57', NULL, 2.5);

-- --------------------------------------------------------

--
-- Table structure for table `processing`
--

CREATE TABLE `processing` (
  `id` int(11) NOT NULL,
  `p_id` int(11) DEFAULT NULL,
  `type` enum('PICKUP_AT_STORE','PICKUP_AT_SENDER_LOCATION','HANDOVER_AT_STORE','HANDOVER_AT_RECIPIENT_LOCATION','DELIVERY_START','DELIVERY_END') DEFAULT NULL,
  `time` timestamp NULL DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `location_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `processing`
--

INSERT INTO `processing` (`id`, `p_id`, `type`, `time`, `created_by`, `location_id`) VALUES
(10, 1, 'PICKUP_AT_STORE', '2020-11-02 07:41:48', 1, 1),
(11, 1, 'DELIVERY_START', '2020-11-02 12:42:19', 1, 1),
(12, 1, 'DELIVERY_END', '2020-11-02 17:42:19', 1, 2),
(13, 1, 'HANDOVER_AT_STORE', '2020-11-03 07:15:44', 2, 2),
(14, 2, 'PICKUP_AT_SENDER_LOCATION', '2020-11-09 12:21:17', 3, NULL),
(15, 2, 'DELIVERY_START', '2020-11-09 12:21:17', 3, NULL),
(16, 2, 'DELIVERY_END', '2020-11-09 17:21:17', 3, 5),
(17, 3, 'PICKUP_AT_STORE', '2020-11-10 12:23:28', 4, 1),
(18, 3, 'DELIVERY_START', '2020-11-10 18:25:28', 4, 1),
(19, 3, 'DELIVERY_END', '2020-11-11 06:00:36', 4, 3),
(20, 3, 'HANDOVER_AT_STORE', '2020-11-11 12:25:37', 5, 3),
(21, 4, 'PICKUP_AT_SENDER_LOCATION', '2020-11-08 14:18:23', 2, NULL),
(22, 4, 'DELIVERY_START', '2020-11-08 14:18:23', 2, NULL),
(23, 4, 'HANDOVER_AT_RECIPIENT_LOCATION', '2020-11-09 14:18:23', 2, NULL),
(50, 5, 'PICKUP_AT_SENDER_LOCATION', '2020-11-09 12:37:40', 4, NULL),
(51, 5, 'DELIVERY_START', '2020-11-09 12:37:40', 4, NULL),
(52, 5, 'DELIVERY_END', '2020-11-09 14:37:40', 4, 2),
(53, 6, 'PICKUP_AT_STORE', '2020-11-12 12:49:34', 3, 3),
(54, 6, 'DELIVERY_START', '2020-11-12 15:49:34', 3, 3),
(55, 6, 'DELIVERY_END', '2020-11-12 19:21:34', 3, 4),
(56, 6, 'HANDOVER_AT_STORE', '2020-11-13 12:51:13', 5, 4),
(57, 7, 'PICKUP_AT_STORE', '2020-11-16 12:52:04', 2, 5),
(58, 7, 'HANDOVER_AT_STORE', '2020-11-16 16:52:04', 2, 5),
(59, 8, 'PICKUP_AT_STORE', '2020-11-19 08:53:45', 5, 2),
(60, 8, 'DELIVERY_START', '2020-11-19 14:53:45', 4, 2),
(61, 8, 'DELIVERY_END', '2020-11-20 08:53:45', 4, 3),
(62, 9, 'PICKUP_AT_STORE', '2020-11-10 05:55:35', 1, 1),
(63, 9, 'DELIVERY_START', '2020-11-10 11:55:35', 1, 1),
(64, 9, 'DELIVERY_END', '2020-11-10 16:03:35', 1, 3),
(65, 10, 'PICKUP_AT_SENDER_LOCATION', '2020-11-11 18:56:57', 3, NULL),
(66, 10, 'DELIVERY_START', '2020-11-11 18:56:57', 3, NULL),
(67, 10, 'DELIVERY_END', '2020-11-11 21:56:57', 3, 5);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`customer_id`);

--
-- Indexes for table `employee`
--
ALTER TABLE `employee`
  ADD PRIMARY KEY (`employee_id`),
  ADD KEY `location_id` (`location_id`);

--
-- Indexes for table `employee_info`
--
ALTER TABLE `employee_info`
  ADD PRIMARY KEY (`employee_info_id`),
  ADD KEY `employee_id` (`employee_id`);

--
-- Indexes for table `location`
--
ALTER TABLE `location`
  ADD PRIMARY KEY (`l_id`);

--
-- Indexes for table `package`
--
ALTER TABLE `package`
  ADD PRIMARY KEY (`package_id`),
  ADD KEY `sender_id` (`sender_id`),
  ADD KEY `recipient_id` (`recipient_id`);

--
-- Indexes for table `processing`
--
ALTER TABLE `processing`
  ADD PRIMARY KEY (`id`),
  ADD KEY `created_by` (`created_by`),
  ADD KEY `p_id` (`p_id`),
  ADD KEY `location_id` (`location_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `customer`
--
ALTER TABLE `customer`
  MODIFY `customer_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `employee`
--
ALTER TABLE `employee`
  MODIFY `employee_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `employee_info`
--
ALTER TABLE `employee_info`
  MODIFY `employee_info_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `location`
--
ALTER TABLE `location`
  MODIFY `l_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `package`
--
ALTER TABLE `package`
  MODIFY `package_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `processing`
--
ALTER TABLE `processing`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=68;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `employee`
--
ALTER TABLE `employee`
  ADD CONSTRAINT `employee_ibfk_1` FOREIGN KEY (`location_id`) REFERENCES `location` (`l_id`);

--
-- Constraints for table `employee_info`
--
ALTER TABLE `employee_info`
  ADD CONSTRAINT `employee_info_ibfk_1` FOREIGN KEY (`employee_id`) REFERENCES `employee` (`employee_id`);

--
-- Constraints for table `package`
--
ALTER TABLE `package`
  ADD CONSTRAINT `package_ibfk_1` FOREIGN KEY (`sender_id`) REFERENCES `customer` (`customer_id`),
  ADD CONSTRAINT `package_ibfk_2` FOREIGN KEY (`recipient_id`) REFERENCES `customer` (`customer_id`);

--
-- Constraints for table `processing`
--
ALTER TABLE `processing`
  ADD CONSTRAINT `processing_ibfk_1` FOREIGN KEY (`created_by`) REFERENCES `employee` (`employee_id`),
  ADD CONSTRAINT `processing_ibfk_2` FOREIGN KEY (`p_id`) REFERENCES `package` (`package_id`),
  ADD CONSTRAINT `processing_ibfk_3` FOREIGN KEY (`location_id`) REFERENCES `location` (`l_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
