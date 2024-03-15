-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 21, 2024 at 07:29 AM
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
-- Database: `lab5`
--

-- --------------------------------------------------------

--
-- Table structure for table `department`
--

CREATE TABLE `department` (
  `dno` int(11) NOT NULL,
  `dname` varchar(20) DEFAULT NULL,
  `mgrssn` int(11) DEFAULT NULL,
  `mgrstartdate` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `department`
--

INSERT INTO `department` (`dno`, `dname`, `mgrssn`, `mgrstartdate`) VALUES
(1, 'head quator', 103, '2018-05-15'),
(4, 'accounts', 104, '2019-01-01'),
(5, 'resarch', 105, '2021-07-22');

-- --------------------------------------------------------

--
-- Table structure for table `dlocation`
--

CREATE TABLE `dlocation` (
  `dno` int(11) NOT NULL,
  `dloc` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `dlocation`
--

INSERT INTO `dlocation` (`dno`, `dloc`) VALUES
(1, 'houston'),
(4, 'stafford'),
(5, 'bellaize'),
(5, 'houston'),
(5, 'swizerland');

-- --------------------------------------------------------

--
-- Table structure for table `employee`
--

CREATE TABLE `employee` (
  `ssn` int(11) NOT NULL,
  `fname` varchar(20) NOT NULL,
  `lname` varchar(20) NOT NULL,
  `address` varchar(30) DEFAULT NULL,
  `gender` char(1) DEFAULT NULL,
  `salary` double DEFAULT NULL,
  `superssn` int(11) DEFAULT NULL,
  `dno` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `employee`
--

INSERT INTO `employee` (`ssn`, `fname`, `lname`, `address`, `gender`, `salary`, `superssn`, `dno`) VALUES
(101, 'jhon', 'scott', 'mysore', 'm', 3000, NULL, NULL),
(102, 'franklin', 'wong', 'mandya', 'm', 4000, 104, 4),
(103, 'alicia', 'zelaya', 'spring', 'f', 6000, 105, 5),
(104, 'jenmfer', 'wallance', 'bellari', 'f', 50000, 104, 4),
(105, 'joyeeta', 'gupta', 'hubbali', 'm', 75000, 105, 5);

-- --------------------------------------------------------

--
-- Table structure for table `project`
--

CREATE TABLE `project` (
  `pno` int(11) NOT NULL,
  `pname` varchar(20) DEFAULT NULL,
  `plocation` varchar(20) DEFAULT NULL,
  `dno` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `project`
--

INSERT INTO `project` (`pno`, `pname`, `plocation`, `dno`) VALUES
(1, 'productx', 'bellari', 5),
(2, 'producty', 'swizerland', 5),
(3, 'iot', 'houston', 5),
(4, 'productz', 'stafford', 4),
(20, 'reorganization', 'houston', 1),
(30, 'new benefits', 'mysore', 4);

-- --------------------------------------------------------

--
-- Table structure for table `works_on`
--

CREATE TABLE `works_on` (
  `ssn` int(11) NOT NULL,
  `pno` int(11) NOT NULL,
  `hours` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `works_on`
--

INSERT INTO `works_on` (`ssn`, `pno`, `hours`) VALUES
(101, 1, 33),
(101, 2, 8),
(102, 1, 20),
(102, 2, 10),
(102, 3, 40),
(103, 3, 10),
(104, 2, 20),
(104, 3, 20),
(105, 1, 3),
(105, 2, 10),
(105, 3, 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `department`
--
ALTER TABLE `department`
  ADD PRIMARY KEY (`dno`),
  ADD KEY `mgrssn` (`mgrssn`);

--
-- Indexes for table `dlocation`
--
ALTER TABLE `dlocation`
  ADD PRIMARY KEY (`dno`,`dloc`);

--
-- Indexes for table `employee`
--
ALTER TABLE `employee`
  ADD PRIMARY KEY (`ssn`),
  ADD KEY `superssn` (`superssn`),
  ADD KEY `dno` (`dno`);

--
-- Indexes for table `project`
--
ALTER TABLE `project`
  ADD PRIMARY KEY (`pno`),
  ADD KEY `dno` (`dno`);

--
-- Indexes for table `works_on`
--
ALTER TABLE `works_on`
  ADD PRIMARY KEY (`ssn`,`pno`),
  ADD KEY `pno` (`pno`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `department`
--
ALTER TABLE `department`
  ADD CONSTRAINT `department_ibfk_1` FOREIGN KEY (`mgrssn`) REFERENCES `employee` (`ssn`);

--
-- Constraints for table `dlocation`
--
ALTER TABLE `dlocation`
  ADD CONSTRAINT `dlocation_ibfk_1` FOREIGN KEY (`dno`) REFERENCES `department` (`dno`);

--
-- Constraints for table `employee`
--
ALTER TABLE `employee`
  ADD CONSTRAINT `employee_ibfk_1` FOREIGN KEY (`superssn`) REFERENCES `employee` (`ssn`),
  ADD CONSTRAINT `employee_ibfk_2` FOREIGN KEY (`dno`) REFERENCES `department` (`dno`);

--
-- Constraints for table `project`
--
ALTER TABLE `project`
  ADD CONSTRAINT `project_ibfk_1` FOREIGN KEY (`dno`) REFERENCES `department` (`dno`);

--
-- Constraints for table `works_on`
--
ALTER TABLE `works_on`
  ADD CONSTRAINT `works_on_ibfk_1` FOREIGN KEY (`ssn`) REFERENCES `employee` (`ssn`),
  ADD CONSTRAINT `works_on_ibfk_2` FOREIGN KEY (`pno`) REFERENCES `project` (`pno`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
