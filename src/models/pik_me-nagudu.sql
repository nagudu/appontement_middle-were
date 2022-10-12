-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 12, 2022 at 05:45 PM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 7.4.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `pik_me`
--

-- --------------------------------------------------------

--
-- Table structure for table `manager`
--

CREATE TABLE `manager` (
  `id` int(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `phone_no` int(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `address` varchar(50) NOT NULL,
  `picture` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `manager`
--

INSERT INTO `manager` (`id`, `name`, `phone_no`, `email`, `address`, `picture`) VALUES
(1, 'nagud', 444, 'halifashuaibu12@gmail.com', 'No5/7G Road.Massakare', 'C:fakepathWhatsApp Video 2022-10-04 at 1.07.19 PM.'),
(2, 'Ahmad', 798798, 'nknknknkjnk', 'kano', 'C:fakepathspaceapps-9059bcce-df44-4b41-8b4e-a91d19'),
(3, 'nagud', 981234567, 'Yasir@mail.com', 'kano', 'C:fakepathWhatsApp Video 2022-10-04 at 1.07.19 PM.');

-- --------------------------------------------------------

--
-- Table structure for table `payment_report`
--

CREATE TABLE `payment_report` (
  `id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `name` varchar(30) DEFAULT NULL,
  `amount_paid` varchar(30) DEFAULT NULL,
  `shop_no` varchar(20) DEFAULT NULL,
  `year` date NOT NULL,
  `date` datetime NOT NULL DEFAULT current_timestamp(),
  `status` varchar(20) DEFAULT NULL,
  `discription` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `payment_report`
--

INSERT INTO `payment_report` (`id`, `customer_id`, `name`, `amount_paid`, `shop_no`, `year`, `date`, `status`, `discription`) VALUES
(19, 19, 'nagudu', '2121', '2221', '2022-10-11', '2022-10-11 15:08:05', NULL, '211'),
(20, 20, 'dady', '3443344', '9077', '2022-10-11', '2022-10-11 15:27:57', NULL, ''),
(21, 14, 'Umar sani baba', '10000', '0', '2022-10-11', '2022-10-11 16:40:19', NULL, ''),
(22, 16, 'nagud', '100000', '223', '2022-10-08', '2022-10-11 16:42:31', NULL, ''),
(23, 20, 'dady', '100', '9077', '2022-10-15', '2022-10-11 16:44:14', NULL, '');

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
  `no_of_shop` int(100) NOT NULL,
  `manager_id` int(100) NOT NULL
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
  `no_of_shops` int(2) NOT NULL DEFAULT 0,
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
-- Table structure for table `register_form`
--

CREATE TABLE `register_form` (
  `id` int(11) NOT NULL,
  `name` varchar(30) DEFAULT NULL,
  `quantity` varchar(20) DEFAULT NULL,
  `number_of_pillars` varchar(20) DEFAULT NULL,
  `date` datetime NOT NULL DEFAULT current_timestamp(),
  `phone` varchar(15) DEFAULT NULL,
  `address` varchar(40) DEFAULT NULL,
  `plot` varchar(20) DEFAULT NULL,
  `agent_name` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `report_history`
--

CREATE TABLE `report_history` (
  `id` int(100) NOT NULL,
  `date` datetime NOT NULL DEFAULT current_timestamp(),
  `custormer_id` int(100) NOT NULL,
  `month` date NOT NULL,
  `shop_no` varchar(100) NOT NULL,
  `description` varchar(100) NOT NULL,
  `amount_paid` int(100) NOT NULL,
  `withdrawn` int(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `report_history`
--

INSERT INTO `report_history` (`id`, `date`, `custormer_id`, `month`, `shop_no`, `description`, `amount_paid`, `withdrawn`) VALUES
(1, '2022-10-07 15:07:24', 77878, '2021-09-06', '77878', 'master', 879, 0),
(2, '2022-10-07 14:08:27', 7878, '2020-09-05', '7878', '89', 988989, 0),
(3, '2022-10-07 14:17:01', 788, '2022-09-30', '788', 'nagudu shege', 200, 0),
(4, '2022-10-07 14:17:04', 0, '0000-00-00', '', '', 0, 0),
(5, '2022-10-07 14:20:25', 67, '2021-09-06', '67', 'nagudu mm man', 200, 0),
(6, '2022-10-07 15:05:26', 1, '2022-10-12', '67', 'kaiiiiii', 200, 0),
(7, '2022-10-07 15:17:53', 23, '0000-00-00', '23', 'non', 5000, 0),
(8, '2022-10-07 15:21:59', 898, '0001-09-09', '898', 'njcjcsk', 9090, 0),
(9, '2022-10-07 15:25:21', 8778, '2022-10-03', '8778', 'musa', 889, 0),
(10, '2022-10-07 15:26:05', 0, '2022-10-22', '898', 'nonoooo', 90, 0),
(11, '2022-10-07 15:30:27', 12, '0000-00-00', '12', 'none', 10000, 0),
(12, '2022-10-07 15:31:03', 89, '0009-09-09', '89', 'nml', 90000, 0),
(13, '2022-10-07 15:31:35', 1, '2022-10-16', '12', 'nml', 5000, 0),
(14, '2022-10-07 15:57:21', 70, '2023-10-16', '70', 'First payment', 20000, 0),
(15, '2022-10-07 16:01:16', 3, '2023-10-16', '70', 'paid', 20000, 0),
(16, '2022-10-08 10:31:22', 21, '2023-10-08', '21', 'second', 90000, 0),
(17, '2022-10-08 10:31:59', 4, '2022-10-08', '21', 'second', 30000, 0),
(18, '2022-10-08 10:32:45', 2, '2022-10-29', '89', 'first', 5000, 0),
(19, '2022-10-08 13:59:01', 22, '0000-00-00', '22', 'secon', 4345, 0),
(20, '2022-10-08 13:59:01', 778, '8887-08-07', '778', 'hjhu', 7889, 0),
(21, '2022-10-08 16:57:51', 6, '2022-10-08', '778', 'secont', 11111, 0),
(22, '2022-10-08 16:58:57', 6, '2022-10-11', '778', 'one', 2222222, 0),
(23, '2022-10-08 16:59:41', 4, '2022-10-08', '21', 'turs', 444444, 0),
(24, '2022-10-08 17:01:56', 56, '2023-10-08', '56', 'indeber', 40000, 0),
(25, '2022-10-08 17:02:32', 7, '2022-10-08', '56', 'nomo', 20000, 0),
(26, '2022-10-08 17:14:44', 8, '2023-10-08', '8', 'first', 10006, 0),
(27, '2022-10-08 17:22:16', 2, '2023-10-10', '2', 'first payment', 500000, 0),
(28, '2022-10-08 17:25:25', 9, '2023-10-10', '2', 'deposit', 400000, 0),
(29, '2022-10-08 17:38:05', 0, '0000-00-00', '', '', 0, 0),
(30, '2022-10-08 17:49:28', 990, '0909-09-09', '990', 'njjkjjkj', 90, 0),
(31, '2022-10-08 17:53:09', 88989, '0000-00-00', '88989', 'kjhjkjhj', 989898, 0),
(32, '2022-10-08 17:55:49', 988989, '0000-00-00', '988989', 'kjj', 909, 0),
(33, '2022-10-09 10:37:38', 1, '2022-10-15', '12', 'err', 3432, 0),
(34, '2022-10-09 10:44:37', 90, '2023-10-09', '90', 'first', 10000, 0),
(35, '2022-10-09 10:50:51', 2, '2023-10-09', '2', 'thurs', 9000, 0),
(36, '2022-10-11 15:08:05', 19, '2022-10-11', '2221', '211', 2121, 0),
(37, '2022-10-11 15:27:57', 20, '2022-10-11', '9077', '', 3443344, 0),
(38, '2022-10-11 16:40:19', 14, '2022-10-11', '0', '', 10000, 0),
(39, '2022-10-11 16:42:31', 16, '2022-10-08', '223', '', 100000, 0),
(40, '2022-10-11 16:44:14', 20, '2022-10-15', '9077', '', 100, 0);

-- --------------------------------------------------------

--
-- Table structure for table `setting`
--

CREATE TABLE `setting` (
  `id` int(11) NOT NULL,
  `shop_name` varchar(100) NOT NULL,
  `shops_no` int(100) NOT NULL,
  `address` varchar(100) NOT NULL,
  `contact` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `setting`
--

INSERT INTO `setting` (`id`, `shop_name`, `shops_no`, `address`, `contact`) VALUES
(10, 'Amana Plaza', 123, 'kwankwasiya', '090223334333'),
(11, 'dan nagari Plaza', 34, 'lamido cristan', '0802323233344'),
(12, 'Ummi Plaza', 1, 'Kondila', '0702344553343'),
(13, 'comander sulen garo', 88, 'yan kaba', '0909090');

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
-- Table structure for table `shop_registration`
--

CREATE TABLE `shop_registration` (
  `id` int(11) NOT NULL,
  `name` varchar(30) DEFAULT NULL,
  `shop_no` int(100) NOT NULL,
  `shop_name` varchar(100) NOT NULL,
  `code` varchar(20) DEFAULT NULL,
  `quantity` varchar(20) DEFAULT NULL,
  `member_of_pillars` varchar(20) DEFAULT NULL,
  `rent_start_date` date NOT NULL DEFAULT current_timestamp(),
  `rent_end_date` date NOT NULL DEFAULT current_timestamp(),
  `rent_fee` varchar(20) DEFAULT NULL,
  `amount_paid` varchar(20) DEFAULT NULL,
  `phase_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `shop_registration`
--

INSERT INTO `shop_registration` (`id`, `name`, `shop_no`, `shop_name`, `code`, `quantity`, `member_of_pillars`, `rent_start_date`, `rent_end_date`, `rent_fee`, `amount_paid`, `phase_id`) VALUES
(15, 'sani baba', 0, 'Amana Plaza', '2', '1', '200', '2022-10-09', '2023-10-09', '32', '9000', NULL),
(16, 'nagud', 223, 'dan nagari Plaza', NULL, '323', '322', '0000-00-00', '0332-02-23', '23', '323223', NULL),
(17, 'nagud', 223, 'dan nagari Plaza', NULL, '323', '322', '0000-00-00', '0332-02-23', '23', '323223', NULL),
(18, 'ahmad', 9, 'dan nagari Plaza', NULL, '9', '000', '0090-09-09', '0999-09-09', '90', '100000', NULL),
(19, 'nagudu', 2221, 'dan nagari Plaza', NULL, '233', '223322', '0000-00-00', '0678-05-04', '324567', '111111', NULL),
(20, 'dady', 9077, 'Amana Plaza', NULL, '3', '80', '2022-10-11', '2023-10-11', '100', '50000', NULL),
(21, '', 0, 'ueww', NULL, '', '', '2022-10-29', '2022-10-11', '3234', '', NULL);

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
,`tenant_name` varchar(100)
,`tenant_phone` int(50)
);

-- --------------------------------------------------------

--
-- Table structure for table `tenant`
--

CREATE TABLE `tenant` (
  `id` int(200) NOT NULL,
  `name` varchar(100) NOT NULL,
  `phone_no` int(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `address` varchar(50) NOT NULL,
  `picture` varchar(50) NOT NULL,
  `balance` double NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tenant`
--

INSERT INTO `tenant` (`id`, `name`, `phone_no`, `email`, `address`, `picture`, `balance`) VALUES
(7, 'aliyu', 2147483647, 'Aaliyu@gmail.com', 'No5/7G Road.Massakare', 'C:fakepathspaceapps-9059bcce-df44-4b41-8b4e-a91d19', 0),
(8, 'isahh', 909909, 'halifashuaibu12@gmail.com', 'swsdw', 'C:fakepathWhatsApp Video 2022-10-04 at 1.07.19 PM.', 0),
(9, 'nagudu', 123444, 'adam@gmail.com', 'Kondila', 'C:fakepathWhatsApp Audio 2022-09-30 at 11.51.05 AM', 0),
(10, 'musa', 21, 'halifashuaibu12@gmail.com', 'Kondila', 'C:fakepathWhatsApp Video 2022-10-04 at 1.07.19 PM.', 0),
(11, '', 0, '', '', '', 0),
(12, 'murtala', 912398989, 'murtala@gmail.com', 'kogi', 'C:fakepathdr_abdurrahman.jpg', 0),
(13, 'Khalifa', 901234333, 'khalifa@gmail.com', 'Naibawa Gabas', 'C:fakepathspaceapps-9059bcce-df44-4b41-8b4e-a91d19', 0);

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
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure for view `shop_tenants`
--
DROP TABLE IF EXISTS `shop_tenants`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `shop_tenants`  AS SELECT `s`.`id` AS `id`, `s`.`name` AS `name`, `s`.`rent_fee` AS `rent_fee`, `s`.`code` AS `code`, `s`.`rent_start_date` AS `rent_start_date`, `s`.`rent_end_date` AS `rent_end_date`, `s`.`tenant_id` AS `tenant_id`, `s`.`status` AS `status`, `s`.`phase_id` AS `phase_id`, `t`.`name` AS `tenant_name`, `t`.`phone_no` AS `tenant_phone` FROM (`shops_list` `s` join `tenant` `t` on(`s`.`tenant_id` = `t`.`id`))  ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `manager`
--
ALTER TABLE `manager`
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
-- Indexes for table `register_form`
--
ALTER TABLE `register_form`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `report_history`
--
ALTER TABLE `report_history`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `setting`
--
ALTER TABLE `setting`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `shops_list`
--
ALTER TABLE `shops_list`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tenant_id` (`tenant_id`),
  ADD KEY `phase_id` (`phase_id`);

--
-- Indexes for table `shop_registration`
--
ALTER TABLE `shop_registration`
  ADD PRIMARY KEY (`id`),
  ADD KEY `phase_id` (`phase_id`);

--
-- Indexes for table `tenant`
--
ALTER TABLE `tenant`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `manager`
--
ALTER TABLE `manager`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

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
-- AUTO_INCREMENT for table `report_history`
--
ALTER TABLE `report_history`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT for table `setting`
--
ALTER TABLE `setting`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `shops_list`
--
ALTER TABLE `shops_list`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=68;

--
-- AUTO_INCREMENT for table `shop_registration`
--
ALTER TABLE `shop_registration`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `tenant`
--
ALTER TABLE `tenant`
  MODIFY `id` int(200) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

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

--
-- Constraints for table `shop_registration`
--
ALTER TABLE `shop_registration`
  ADD CONSTRAINT `shop_phase_fk` FOREIGN KEY (`phase_id`) REFERENCES `plaza_phases` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
