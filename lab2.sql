-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 17, 2024 at 02:57 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `lab2`
--

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `customer_id` int(11) NOT NULL,
  `cust_name` varchar(25) NOT NULL,
  `city` varchar(25) NOT NULL,
  `grade` int(11) NOT NULL,
  `salesman_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`customer_id`, `cust_name`, `city`, `grade`, `salesman_id`) VALUES
(20, 'partha', 'mandya', 100, NULL),
(21, 'bharath', 'banglore', 300, NULL),
(22, 'gagana', 'hydrabad', 400, 2000),
(23, 'deeksha', 'mysore', 200, 2100),
(24, 'santhu', 'banglore', 400, 3000);

-- --------------------------------------------------------

--
-- Stand-in structure for view `high_order`
-- (See below for the actual view)
--
CREATE TABLE `high_order` (
`salesman_id` int(11)
,`customer_id` int(11)
,`purchase_amt` int(11)
,`ord_date` date
);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `order_no` int(11) NOT NULL,
  `purchase_amt` int(11) NOT NULL,
  `ord_date` date NOT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `salesman_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`order_no`, `purchase_amt`, `ord_date`, `customer_id`, `salesman_id`) VALUES
(1, 550, '2018-02-11', 21, 2000),
(3, 2200, '2019-12-30', 22, 2000),
(4, 2350, '2009-11-20', 23, 3000),
(5, 3000, '2008-01-14', 20, 2000),
(6, 5000, '2009-11-20', 23, 3000);

-- --------------------------------------------------------

--
-- Table structure for table `salesman`
--

CREATE TABLE `salesman` (
  `salesman_id` int(11) NOT NULL,
  `name` varchar(20) DEFAULT NULL,
  `city` varchar(20) DEFAULT NULL,
  `commission` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `salesman`
--

INSERT INTO `salesman` (`salesman_id`, `name`, `city`, `commission`) VALUES
(2000, 'sahana', 'mandya', '20%'),
(2100, 'manasa', 'mysore', '25%'),
(3000, 'smitha', 'mysore', '15%'),
(7000, 'anil', 'hydrabad', '35%');

-- --------------------------------------------------------

--
-- Structure for view `high_order`
--
DROP TABLE IF EXISTS `high_order`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `high_order`  AS SELECT `x`.`salesman_id` AS `salesman_id`, `x`.`customer_id` AS `customer_id`, `x`.`purchase_amt` AS `purchase_amt`, `x`.`ord_date` AS `ord_date` FROM `orders` AS `x` WHERE `x`.`purchase_amt` = (select max(`y`.`purchase_amt`) from `orders` `y` where `x`.`ord_date` = `y`.`ord_date`) ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`customer_id`),
  ADD KEY `salesman_id` (`salesman_id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`order_no`),
  ADD KEY `salesman_id` (`salesman_id`),
  ADD KEY `customer_id` (`customer_id`);

--
-- Indexes for table `salesman`
--
ALTER TABLE `salesman`
  ADD PRIMARY KEY (`salesman_id`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `customer`
--
ALTER TABLE `customer`
  ADD CONSTRAINT `customer_ibfk_1` FOREIGN KEY (`salesman_id`) REFERENCES `salesman` (`salesman_id`) ON DELETE SET NULL;

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`salesman_id`) REFERENCES `salesman` (`salesman_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`customer_id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
