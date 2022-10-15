-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Oct 16, 2022 at 12:46 AM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `properties`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `agent_request` (IN `query_type` VARCHAR(30), IN `_name` VARCHAR(30), IN `_phone_no` VARCHAR(15), IN `_email` VARCHAR(60), IN `_address` VARCHAR(100), IN `_picture` VARCHAR(200))   BEGIN
    
    IF query_type = 'create' THEN 
    	INSERT INTO agents(name,phone_no,email,address,picture)		
		VALUES (_name,_phone_no,_email,_address,_picture);
    ELSEIF query_type ='select-all' THEN
    	SELECT * FROM agents;
    
    ELSEIF query_type ='select-one' THEN
    	SELECT * FROM agents WHERE id = _id;
    END IF;
    
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `plaza_phases` (IN `query_type` VARCHAR(30), IN `_id` INT(8), IN `_name` VARCHAR(30), IN `_code` VARCHAR(8), IN `_no_of_shops` INT(4), IN `_rent_start_date` DATE, IN `_rent_end_date` DATE, IN `_plaza_id` INT(4))   BEGIN
    IF query_type = 'create' THEN
        INSERT INTO `plaza_phases`(`name`, `code`, `no_of_shops`, `rent_start_date`, `rent_end_date`, `plaza_id`) 
        VALUES (_name,_code,_no_of_shops,_rent_start_date,_rent_end_date,_plaza_id);
    ELSEIF query_type = 'update' THEN
    	UPDATE `shop_allocation` SET `customer_id`=_customer_id,`name`=_name,`amount_paid`=_amount_paid,`shop_id`=_shop_id,`year`=_year,`status`=_status,`description`=_description WHERE id=_id;
    ELSEIF query_type = 'select-all' THEN
        SELECT * FROM `shop_allocation`;
    ELSEIF query_type = 'select-one' THEN
        SELECT * FROM `shop_allocation` WHERE id=_id;
    END IF;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `shop_allocation` (IN `query_type` VARCHAR(30), IN `_id` INT(8), IN `_tenant_id` INT(8), IN `_name` VARCHAR(30), IN `_amount_paid` VARCHAR(30), IN `_shop_id` INT(8), IN `_year` VARCHAR(4), IN `_status` VARCHAR(60), IN `_description` VARCHAR(100), IN `_rent_start_date` DATE, IN `_rent_end_date` DATE)   BEGIN
	IF query_type = 'create' THEN
		INSERT INTO `shop_allocation`(`tenant_id`, `tenant_name`, `amount_paid`, `shop_id`, `year`, `status`, `description`,`rent_start_date`,`rent_end_date`) 
    	VALUES (_tenant_id, _name, _amount_paid, _shop_id, _year, _status, _description,_rent_start_date,_rent_end_date);
    ELSEIF query_type = 'update' THEN
        UPDATE `shop_allocation` SET `tenant_id`=_tenant_id,`name`=_name,`amount_paid`=_amount_paid,
        `shop_id`=_shop_id,`year`=_year, `status`=_status,`description`=_description,rent_start_date=_rent_start_date, rent_end_date=_rent_end_date WHERE id=_id;
    END IF;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `tenants` (IN `query_type` VARCHAR(30), IN `_id` INT(8), IN `_name` VARCHAR(30), IN `_phone_no` VARCHAR(15), IN `_email` VARCHAR(100), IN `_address` VARCHAR(100), IN `_picture` VARCHAR(100), IN `_balance` DOUBLE)   BEGIN

    IF query_type = 'create' THEN
        INSERT INTO `tenants`(`name`, `phone_no`, `email`, `address`, `picture`, `balance`) 
        VALUES (_name,_phone_no,_email,_address,_picture,_balance);
        SELECT LAST_INSERT_ID() AS tenant_id;
    ELSEIF  query_type = 'update' THEN
        UPDATE `tenants` SET `name`=_name,`phone_no`=_phone_no,`email`=_email,
        `address`=_address,`picture`=_picture,`balance`=_balance WHERE `id`=_id;

    ELSEIF  query_type = 'select-all' THEN
        SELECT * FROM `tenants`;
    ELSEIF  query_type = 'select' THEN
        SELECT * FROM `shop_tenants` WHERE `tenant_id`=_id;
    
    ELSEIF  query_type = 'allocate-shop' THEN
        SELECT * FROM `tenants` WHERE `id`=_id;
    ELSEIF  query_type = 'select-tenant-shops' THEN
        SELECT * FROM `shop_tenants` WHERE `tenant_id`=_id;
    END IF;
END$$


CREATE DEFINER=`root`@`localhost` PROCEDURE `agent_request`(IN `query_type` VARCHAR(30), IN `_name` VARCHAR(30), IN `_phone_no` VARCHAR(15), IN `_email` VARCHAR(60), IN `_address` VARCHAR(100), IN `_picture` VARCHAR(200), IN `_user_id` INT(5)) NOT DETERMINISTIC CONTAINS SQL SQL SECURITY DEFINER BEGIN
    
    IF query_type = 'create' THEN 
    	INSERT INTO agents(name,phone_no,email,address,picture, user_id)		
		VALUES (_name,_phone_no,_email,_address,_picture, _user_id);
        
    ELSEIF query_type ='select-all' THEN
    	SELECT * FROM agents;
    
    ELSEIF query_type ='select-one' THEN
    	SELECT * FROM agents WHERE id = _id;
    END IF;
    
END $$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `agents`
--
CREATE TABLE `agents` (
 `id` int(100) NOT NULL AUTO_INCREMENT,
 `name` varchar(100) NOT NULL,
 `phone_no` varchar(15) DEFAULT NULL,
 `email` varchar(100) NOT NULL,
 `address` varchar(200) NOT NULL,
 `picture` varchar(100) NOT NULL,
 `user_id` int(4) DEFAULT NULL,
 PRIMARY KEY (`id`),
 KEY `user_id` (`user_id`),
 CONSTRAINT `agent_user_fk` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4
-- --------------------------------------------------------

--
-- Table structure for table `payment_report`
--

CREATE TABLE `payment_report` (
  `id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `name` varchar(30) DEFAULT NULL,
  `amount_paid` double DEFAULT 0,
  `shop_id` int(8) DEFAULT NULL,
  `year` varchar(4) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `status` varchar(20) DEFAULT NULL,
  `discription` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `pay_rent`
--

CREATE TABLE `pay_rent` (
  `id` int(11) NOT NULL,
  `year` datetime NOT NULL DEFAULT current_timestamp(),
  `amount_paid` varchar(30) DEFAULT NULL,
  `discription` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `pay_rent`
--

INSERT INTO `pay_rent` (`id`, `year`, `amount_paid`, `discription`) VALUES
(1, '0000-00-00 00:00:00', '76767', 'jghjhg'),
(2, '0000-00-00 00:00:00', '10000', 'banason ki '),
(3, '0000-00-00 00:00:00', '19839', 'i need ');

-- --------------------------------------------------------

--
-- Table structure for table `plaza`
--

CREATE TABLE `plaza` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `address` varchar(100) NOT NULL,
  `code` varchar(100) DEFAULT NULL,
  `no_of_shop` int(8) NOT NULL,
  `manager_id` int(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `plaza`
--

INSERT INTO `plaza` (`id`, `name`, `address`, `code`, `no_of_shop`, `manager_id`) VALUES
(3, 'DSN Nagari Plaza', 'Lamido crescent ', 'EM44', 0, 0),
(4, 'dan iska', 'kano', 'ds a', 0, 0),
(5, 'danladi', 'idi', 'np a', 0, 0),
(6, 'dogon malam', 'kano', '5050', 100, 0),
(7, 'fahat', 'Plot C23 MCC road Owerri', '5050', 20, 0),
(8, 'Sakarai', 'Naibawa Gabas', 'SK', 50, 0),
(9, 'Yasir Ado Muammad', 'Kondila', 'KND', 50, 0);

-- --------------------------------------------------------

--
-- Table structure for table `plaza_phases`
--

CREATE TABLE `plaza_phases` (
  `id` int(11) NOT NULL,
  `name` varchar(30) DEFAULT NULL,
  `code` varchar(10) DEFAULT NULL,
  `no_of_shops` int(5) NOT NULL DEFAULT 0,
  `rent_start_date` date NOT NULL DEFAULT current_timestamp(),
  `rent_end_date` date NOT NULL DEFAULT current_timestamp(),
  `plaza_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `plaza_phases`
--

INSERT INTO `plaza_phases` (`id`, `name`, `code`, `no_of_shops`, `rent_start_date`, `rent_end_date`, `plaza_id`) VALUES
(1, 'Nagudu Phase A', 'NGDA', 10, '2022-10-11', '2023-10-11', 4),
(2, 'Murtala', 'MTL', 20, '2022-10-12', '2023-10-12', 5),
(3, 'Musa', 'NGD', 10, '2022-10-12', '2023-10-12', 9),
(4, 'Brainstorm', 'BS', 10, '2022-10-12', '2023-10-12', 9),
(5, 'kmnklmk', 'kmlk', 10, '2022-10-13', '2023-10-19', 9),
(6, 'kmnklmk', 'kmlk', 10, '2022-10-13', '2023-10-19', 9),
(7, 'Di-Hub Plaza', 'DiP', 10, '2022-10-12', '2023-10-12', 9),
(8, 'BiHub Plaza', 'BiP', 10, '2022-10-13', '2023-10-06', 9),
(9, 'FRANK NAIBAWA', 'FNB', 10, '2022-10-12', '2023-10-12', 9),
(10, 'BANZA', 'BZ', 10, '2022-10-12', '2023-10-13', 9),
(11, 'JAKIN KANO', 'JKN', 10, '2022-10-12', '2023-10-01', 9),
(12, 'IDIOT', 'IDT', 10, '2022-10-19', '2022-10-01', 9);

-- --------------------------------------------------------

--
-- Table structure for table `shops_list`
--

CREATE TABLE `shops_list` (
  `id` int(11) NOT NULL,
  `name` varchar(30) DEFAULT NULL,
  `rent_fee` double DEFAULT NULL,
  `code` varchar(20) DEFAULT NULL,
  `rent_start_date` datetime NOT NULL DEFAULT current_timestamp(),
  `rent_end_date` datetime NOT NULL DEFAULT current_timestamp(),
  `status` varchar(20) DEFAULT NULL,
  `tenant_id` int(8) DEFAULT NULL,
  `phase_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `shops_list`
--

INSERT INTO `shops_list` (`id`, `name`, `rent_fee`, `code`, `rent_start_date`, `rent_end_date`, `status`, `tenant_id`, `phase_id`) VALUES
(1, 'Nagudu Phase A', 20000, 'NGDA - 1', '2022-10-11 00:00:00', '2023-10-11 00:00:00', NULL, 7, 1),
(2, 'Nagudu Phase A', 20000, 'NGDA - 2', '2022-10-11 00:00:00', '2023-10-11 00:00:00', NULL, NULL, 1),
(3, 'Nagudu Phase A', 20000, 'NGDA - 3', '2022-10-11 00:00:00', '2023-10-11 00:00:00', NULL, NULL, 1),
(4, 'Nagudu Phase A', 20000, 'NGDA - 4', '2022-10-11 00:00:00', '2023-10-11 00:00:00', NULL, NULL, 1),
(5, 'Nagudu Phase A', 20000, 'NGDA - 5', '2022-10-11 00:00:00', '2023-10-11 00:00:00', NULL, NULL, 1),
(6, 'Nagudu Phase A', 20000, 'NGDA - 6', '2022-10-11 00:00:00', '2023-10-11 00:00:00', NULL, NULL, 1),
(7, 'Nagudu Phase A', 20000, 'NGDA - 7', '2022-10-11 00:00:00', '2023-10-11 00:00:00', NULL, NULL, 1),
(8, 'Nagudu Phase A', 20000, 'NGDA - 8', '2022-10-11 00:00:00', '2023-10-11 00:00:00', NULL, NULL, 1),
(9, 'Nagudu Phase A', 20000, 'NGDA - 9', '2022-10-11 00:00:00', '2023-10-11 00:00:00', NULL, NULL, 1),
(10, 'nagudu', 30000, 'NGDA - 11', '2022-10-12 00:00:00', '2023-10-12 00:00:00', NULL, 10, 1),
(11, 'Gidaje Plaza', 15000, 'GDJ', '2022-10-12 00:00:00', '2023-10-12 00:00:00', NULL, 12, 1),
(12, 'Murtala', 100000, 'MTL - 1', '2022-10-12 00:00:00', '2023-10-12 00:00:00', NULL, NULL, NULL),
(13, 'Murtala', 100000, 'MTL - 6', '2022-10-12 00:00:00', '2023-10-12 00:00:00', NULL, NULL, NULL),
(14, 'Murtala', 100000, 'MTL - 2', '2022-10-12 00:00:00', '2023-10-12 00:00:00', NULL, NULL, NULL),
(15, 'Murtala', 100000, 'MTL - 5', '2022-10-12 00:00:00', '2023-10-12 00:00:00', NULL, NULL, NULL),
(16, 'Murtala', 100000, 'MTL - 3', '2022-10-12 00:00:00', '2023-10-12 00:00:00', NULL, NULL, NULL),
(17, 'Murtala', 100000, 'MTL - 4', '2022-10-12 00:00:00', '2023-10-12 00:00:00', NULL, NULL, NULL),
(18, 'Murtala', 100000, 'MTL - 7', '2022-10-12 00:00:00', '2023-10-12 00:00:00', NULL, NULL, NULL),
(19, 'Murtala', 100000, 'MTL - 8', '2022-10-12 00:00:00', '2023-10-12 00:00:00', NULL, NULL, NULL),
(20, 'Murtala', 100000, 'MTL - 9', '2022-10-12 00:00:00', '2023-10-12 00:00:00', NULL, NULL, NULL),
(21, 'Murtala', 100000, 'MTL - 10', '2022-10-12 00:00:00', '2023-10-12 00:00:00', NULL, NULL, NULL),
(22, 'Murtala', 100000, 'MTL - 11', '2022-10-12 00:00:00', '2023-10-12 00:00:00', NULL, NULL, NULL),
(23, 'Murtala', 100000, 'MTL - 12', '2022-10-12 00:00:00', '2023-10-12 00:00:00', NULL, NULL, NULL),
(24, 'Murtala', 100000, 'MTL - 13', '2022-10-12 00:00:00', '2023-10-12 00:00:00', NULL, NULL, NULL),
(25, 'Murtala', 100000, 'MTL - 14', '2022-10-12 00:00:00', '2023-10-12 00:00:00', NULL, NULL, NULL),
(26, 'Murtala', 100000, 'MTL - 15', '2022-10-12 00:00:00', '2023-10-12 00:00:00', NULL, NULL, NULL),
(27, 'Murtala', 100000, 'MTL - 16', '2022-10-12 00:00:00', '2023-10-12 00:00:00', NULL, NULL, NULL),
(28, 'Murtala', 100000, 'MTL - 17', '2022-10-12 00:00:00', '2023-10-12 00:00:00', NULL, NULL, NULL),
(29, 'Murtala', 100000, 'MTL - 18', '2022-10-12 00:00:00', '2023-10-12 00:00:00', NULL, NULL, NULL),
(30, 'Murtala', 100000, 'MTL - 19', '2022-10-12 00:00:00', '2023-10-12 00:00:00', NULL, NULL, NULL),
(31, 'AA Zaura Plaza', 50000, 'MTL', '2022-10-12 00:00:00', '2023-10-12 00:00:00', NULL, 13, 2),
(32, 'Musa', 15000, 'NGD - 1', '2022-10-12 00:00:00', '2023-10-12 00:00:00', NULL, NULL, NULL),
(33, 'Musa', 15000, 'NGD - 2', '2022-10-12 00:00:00', '2023-10-12 00:00:00', NULL, NULL, NULL),
(34, 'Musa', 15000, 'NGD - 3', '2022-10-12 00:00:00', '2023-10-12 00:00:00', NULL, NULL, NULL),
(35, 'Musa', 15000, 'NGD - 4', '2022-10-12 00:00:00', '2023-10-12 00:00:00', NULL, NULL, NULL),
(36, 'Musa', 15000, 'NGD - 5', '2022-10-12 00:00:00', '2023-10-12 00:00:00', NULL, NULL, NULL),
(37, 'Musa', 15000, 'NGD - 6', '2022-10-12 00:00:00', '2023-10-12 00:00:00', NULL, NULL, NULL),
(38, 'Musa', 15000, 'NGD - 7', '2022-10-12 00:00:00', '2023-10-12 00:00:00', NULL, NULL, NULL),
(39, 'Musa', 15000, 'NGD - 8', '2022-10-12 00:00:00', '2023-10-12 00:00:00', NULL, NULL, NULL),
(40, 'Musa', 15000, 'NGD - 9', '2022-10-12 00:00:00', '2023-10-12 00:00:00', NULL, NULL, NULL),
(41, 'Brainstorm', 40000, 'BS - 1', '2022-10-12 00:00:00', '2023-10-12 00:00:00', NULL, NULL, NULL),
(42, 'Brainstorm', 40000, 'BS - 2', '2022-10-12 00:00:00', '2023-10-12 00:00:00', NULL, NULL, NULL),
(43, 'Brainstorm', 40000, 'BS - 3', '2022-10-12 00:00:00', '2023-10-12 00:00:00', NULL, NULL, NULL),
(44, 'Brainstorm', 40000, 'BS - 4', '2022-10-12 00:00:00', '2023-10-12 00:00:00', NULL, NULL, NULL),
(45, 'Brainstorm', 40000, 'BS - 5', '2022-10-12 00:00:00', '2023-10-12 00:00:00', NULL, NULL, NULL),
(46, 'Brainstorm', 40000, 'BS - 6', '2022-10-12 00:00:00', '2023-10-12 00:00:00', NULL, NULL, NULL),
(47, 'Brainstorm', 40000, 'BS - 7', '2022-10-12 00:00:00', '2023-10-12 00:00:00', NULL, NULL, NULL),
(48, 'Brainstorm', 40000, 'BS - 8', '2022-10-12 00:00:00', '2023-10-12 00:00:00', NULL, NULL, NULL),
(49, 'Brainstorm', 40000, 'BS - 9', '2022-10-12 00:00:00', '2023-10-12 00:00:00', NULL, NULL, NULL),
(50, 'kmnklmk', 100000, 'kmlk - 1', '2022-10-13 00:00:00', '2023-10-19 00:00:00', NULL, NULL, NULL),
(51, 'kmnklmk', 100000, 'kmlk - 2', '2022-10-13 00:00:00', '2023-10-19 00:00:00', NULL, NULL, NULL),
(52, 'kmnklmk', 100000, 'kmlk - 3', '2022-10-13 00:00:00', '2023-10-19 00:00:00', NULL, NULL, NULL),
(53, 'kmnklmk', 100000, 'kmlk - 4', '2022-10-13 00:00:00', '2023-10-19 00:00:00', NULL, NULL, NULL),
(54, 'kmnklmk', 100000, 'kmlk - 5', '2022-10-13 00:00:00', '2023-10-19 00:00:00', NULL, NULL, NULL),
(55, 'kmnklmk', 100000, 'kmlk - 6', '2022-10-13 00:00:00', '2023-10-19 00:00:00', NULL, NULL, NULL),
(56, 'kmnklmk', 100000, 'kmlk - 7', '2022-10-13 00:00:00', '2023-10-19 00:00:00', NULL, NULL, NULL),
(57, 'kmnklmk', 100000, 'kmlk - 8', '2022-10-13 00:00:00', '2023-10-19 00:00:00', NULL, NULL, NULL),
(58, 'kmnklmk', 100000, 'kmlk - 9', '2022-10-13 00:00:00', '2023-10-19 00:00:00', NULL, NULL, NULL),
(59, 'IDIOT', 10, 'IDT - 1', '2022-10-19 00:00:00', '2022-10-01 00:00:00', NULL, NULL, 12),
(60, 'IDIOT', 10, 'IDT - 2', '2022-10-19 00:00:00', '2022-10-01 00:00:00', NULL, NULL, 12),
(61, 'IDIOT', 10, 'IDT - 3', '2022-10-19 00:00:00', '2022-10-01 00:00:00', NULL, NULL, 12),
(62, 'IDIOT', 10, 'IDT - 4', '2022-10-19 00:00:00', '2022-10-01 00:00:00', NULL, NULL, 12),
(63, 'IDIOT', 10, 'IDT - 5', '2022-10-19 00:00:00', '2022-10-01 00:00:00', NULL, NULL, 12),
(64, 'IDIOT', 10, 'IDT - 6', '2022-10-19 00:00:00', '2022-10-01 00:00:00', NULL, NULL, 12),
(65, 'IDIOT', 10, 'IDT - 7', '2022-10-19 00:00:00', '2022-10-01 00:00:00', NULL, NULL, 12),
(66, 'IDIOT', 10, 'IDT - 8', '2022-10-19 00:00:00', '2022-10-01 00:00:00', NULL, NULL, 12),
(67, 'IDIOT', 10, 'IDT - 9', '2022-10-19 00:00:00', '2022-10-01 00:00:00', NULL, 9, 12);

-- --------------------------------------------------------

--
-- Table structure for table `shop_allocation`
--

CREATE TABLE `shop_allocation` (
  `id` int(11) NOT NULL,
  `tenant_id` int(11) NOT NULL,
  `tenant_name` varchar(30) DEFAULT NULL,
  `amount_paid` double DEFAULT 0,
  `shop_id` int(8) DEFAULT NULL,
  `year` varchar(4) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `status` varchar(20) DEFAULT NULL,
  `description` varchar(200) NOT NULL,
  `rent_start_date` date NOT NULL,
  `rent_end_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `shop_allocation`
--

INSERT INTO `shop_allocation` (`id`, `tenant_id`, `tenant_name`, `amount_paid`, `shop_id`, `year`, `created_at`, `updated_at`, `status`, `description`, `rent_start_date`, `rent_end_date`) VALUES
(24, 23, 'Tenant', 0, NULL, '2022', '2022-10-13 15:00:57', '2022-10-13 15:00:57', 'allocated', 'allocated by Tenant on 13-10-2022', '0000-00-00', '0000-00-00'),
(25, 24, 'Nagudu', 0, 63, '2022', '2022-10-13 15:08:33', '2022-10-13 15:08:33', 'allocated', 'allocated by Nagudu on 13-10-2022', '0000-00-00', '0000-00-00'),
(26, 24, 'Nagudu', 0, 66, '2022', '2022-10-13 15:08:33', '2022-10-13 15:08:33', 'allocated', 'allocated by Nagudu on 13-10-2022', '0000-00-00', '0000-00-00'),
(27, 1, 'Nagudu', 0, 65, '2022', '2022-10-13 15:19:49', '2022-10-13 15:19:49', 'allocated', 'allocated by Nagudu on 13-10-2022', '0000-00-00', '0000-00-00'),
(28, 1, 'Nagudu', 0, 63, '2022', '2022-10-13 15:19:49', '2022-10-13 15:19:49', 'allocated', 'allocated by Nagudu on 13-10-2022', '0000-00-00', '0000-00-00'),
(29, 2, 'ishjaq', 0, 67, '2022', '2022-10-13 15:21:43', '2022-10-13 15:21:43', 'allocated', 'allocated by ishjaq on 13-10-2022', '0000-00-00', '0000-00-00'),
(30, 3, 'ahmad', 0, 64, '2022', '2022-10-13 15:23:22', '2022-10-13 15:23:22', 'allocated', 'allocated by ahmad on 13-10-2022', '0000-00-00', '0000-00-00'),
(31, 4, 'isah musa maina', 0, 60, '2022', '2022-10-13 15:25:38', '2022-10-13 15:25:38', 'allocated', 'allocated by isah musa maina on 13-10-2022', '0000-00-00', '0000-00-00'),
(32, 5, 'Mustapha Isah', 0, 60, '2022', '2022-10-13 15:27:50', '2022-10-13 15:27:50', 'allocated', 'allocated by Mustapha Isah on 13-10-2022', '0000-00-00', '0000-00-00'),
(33, 6, 'bdullahi Byero', 0, 61, '2022', '2022-10-13 22:36:14', '2022-10-13 22:36:14', 'allocated', 'allocated by bdullahi Byero on 13-10-2022', '0000-00-00', '0000-00-00'),
(34, 6, '', 0, 67, '2022', '2022-10-13 23:18:25', '2022-10-13 23:18:25', 'allocated', 'allocated by  on 14-10-2022', '2022-10-14', '2023-10-14'),
(35, 6, '', 0, 66, '2022', '2022-10-13 23:33:33', '2022-10-13 23:33:33', 'allocated', 'allocated by  on 14-10-2022', '2022-10-14', '2023-10-14');

-- --------------------------------------------------------

--
-- Stand-in structure for view `shop_tenants`
-- (See below for the actual view)
--
CREATE TABLE `shop_tenants` (
`id` int(11)
,`name` varchar(30)
,`rent_fee` double
,`code` varchar(20)
,`rent_start_date` datetime
,`rent_end_date` datetime
,`tenant_id` int(8)
,`status` varchar(20)
,`phase_id` int(11)
,`tenant_picture` varchar(50)
,`tenant_name` varchar(100)
,`tenant_phone` varchar(15)
);

-- --------------------------------------------------------

--
-- Table structure for table `tenants`
--

CREATE TABLE `tenants` (
  `id` int(200) NOT NULL,
  `name` varchar(100) NOT NULL,
  `phone_no` varchar(15) NOT NULL,
  `email` varchar(100) NOT NULL,
  `address` varchar(50) NOT NULL,
  `picture` varchar(50) NOT NULL,
  `balance` double NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tenants`
--

INSERT INTO `tenants` (`id`, `name`, `phone_no`, `email`, `address`, `picture`, `balance`) VALUES
(1, 'Nagudu', '090898098', 'nagudu@gmail.com', 'Kano', '', 20000),
(2, 'ishjaq', '09234456', 'ishaq@gamil.com', 'bagwai', '', 900000),
(3, 'ahmad', '0909899900', 'ahamda@gamil.com', 'nasarawa', '', 100000),
(4, 'isah musa maina', '091336557', 'isah@gamil.com', 'naibawa', '', 12000),
(5, '', '', '', '', '', 0),
(6, 'bdullahi Byero', '09098789787', 'abdubb@gmail.com', 'Kano', '', 30000);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `firstname` varchar(255) DEFAULT NULL,
  `lastname` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `role` varchar(255) DEFAULT NULL,
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp(),
  `updatedAt` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure for view `shop_tenants`
--
DROP TABLE IF EXISTS `shop_tenants`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `shop_tenants`  AS SELECT `s`.`id` AS `id`, `s`.`name` AS `name`, `s`.`rent_fee` AS `rent_fee`, `s`.`code` AS `code`, `s`.`rent_start_date` AS `rent_start_date`, `s`.`rent_end_date` AS `rent_end_date`, `s`.`tenant_id` AS `tenant_id`, `s`.`status` AS `status`, `s`.`phase_id` AS `phase_id`, `t`.`picture` AS `tenant_picture`, `t`.`name` AS `tenant_name`, `t`.`phone_no` AS `tenant_phone` FROM (`shops_list` `s` left join `tenants` `t` on(`s`.`tenant_id` = `t`.`id`))  ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `agents`
--
ALTER TABLE `agents`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `payment_report`
--
ALTER TABLE `payment_report`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pay_rent`
--
ALTER TABLE `pay_rent`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `plaza`
--
ALTER TABLE `plaza`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `plaza_phases`
--
ALTER TABLE `plaza_phases`
  ADD PRIMARY KEY (`id`),
  ADD KEY `plaza_id` (`plaza_id`);

--
-- Indexes for table `shops_list`
--
ALTER TABLE `shops_list`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tenant_id` (`tenant_id`),
  ADD KEY `phase_id` (`phase_id`);

--
-- Indexes for table `shop_allocation`
--
ALTER TABLE `shop_allocation`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tenants`
--
ALTER TABLE `tenants`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `phone_no` (`phone_no`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `agents`
--
ALTER TABLE `agents`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `payment_report`
--
ALTER TABLE `payment_report`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `plaza`
--
ALTER TABLE `plaza`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `plaza_phases`
--
ALTER TABLE `plaza_phases`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `shops_list`
--
ALTER TABLE `shops_list`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=72;

--
-- AUTO_INCREMENT for table `shop_allocation`
--
ALTER TABLE `shop_allocation`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT for table `tenants`
--
ALTER TABLE `tenants`
  MODIFY `id` int(200) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `plaza_phases`
--
ALTER TABLE `plaza_phases`
  ADD CONSTRAINT `plaza_phase_fk` FOREIGN KEY (`plaza_id`) REFERENCES `plaza` (`id`);

--
-- Constraints for table `shops_list`
--
ALTER TABLE `shops_list`
  ADD CONSTRAINT `shop_plaza_phase_fk` FOREIGN KEY (`phase_id`) REFERENCES `plaza_phases` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `shop_tenant_fk` FOREIGN KEY (`tenant_id`) REFERENCES `tenant` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
