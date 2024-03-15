-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 18, 2024 at 06:08 PM
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
-- Database: `lab_4`
--

-- --------------------------------------------------------

--
-- Stand-in structure for view `4mh19cs02`
-- (See below for the actual view)
--
CREATE TABLE `4mh19cs02` (
`subcode` varchar(7)
,`test1` int(11)
);

-- --------------------------------------------------------

--
-- Table structure for table `class`
--

CREATE TABLE `class` (
  `usn` varchar(10) NOT NULL,
  `ssid` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `class`
--

INSERT INTO `class` (`usn`, `ssid`) VALUES
('4MH19CS01', 101),
('4MH19CS02', 101),
('4MH19CS03', 101),
('4MH19CS04', 102),
('4MH19CS05', 103),
('4MH19CS06', 103),
('4MH19CS08', 104),
('4MH19CS07', 107);

-- --------------------------------------------------------

--
-- Table structure for table `course`
--

CREATE TABLE `course` (
  `subcode` varchar(7) NOT NULL,
  `title` varchar(20) DEFAULT NULL,
  `sem` int(11) DEFAULT NULL,
  `credits` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `course`
--

INSERT INTO `course` (`subcode`, `title`, `sem`, `credits`) VALUES
('18CS32', 'ADE', 3, 3),
('18CS33', 'DS', 3, 4),
('18CS51', 'AIML', 5, 4),
('18CS52', 'CNS', 5, 4),
('18CS53', 'DBMS', 5, 4),
('18CS54', 'ATC', 5, 3),
('18CS55', 'ADP', 5, 3),
('18CS56', 'VP', 5, 3);

-- --------------------------------------------------------

--
-- Table structure for table `iamarks`
--

CREATE TABLE `iamarks` (
  `usn` varchar(10) NOT NULL,
  `subcode` varchar(7) NOT NULL,
  `ssid` int(11) NOT NULL,
  `test1` int(11) NOT NULL,
  `test2` int(11) NOT NULL,
  `test3` int(11) NOT NULL,
  `finalia` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `iamarks`
--

INSERT INTO `iamarks` (`usn`, `subcode`, `ssid`, `test1`, `test2`, `test3`, `finalia`) VALUES
('4MH19CS01', '18CS53', 101, 21, 25, 27, 26),
('4MH19CS02', '18CS52', 102, 27, 23, 28, 27.5),
('4MH19CS03', '18CS54', 103, 20, 17, 18, 19),
('4MH19CS04', '18CS53', 104, 22, 25, 25, 25),
('4MH19CS05', '18CS51', 107, 22, 27, 25, 26),
('4MH19CS06', '18CS56', 105, 22, 25, 24, 24.5),
('4MH19CS07', '18CS54', 109, 20, 25, 29, 27),
('4MH19CS08', '18CS32', 109, 20, 17, 16, 18.5);

-- --------------------------------------------------------

--
-- Table structure for table `semsec`
--

CREATE TABLE `semsec` (
  `ssid` int(11) NOT NULL,
  `sem` int(11) NOT NULL,
  `sec` char(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `semsec`
--

INSERT INTO `semsec` (`ssid`, `sem`, `sec`) VALUES
(101, 5, 'a'),
(102, 5, 'b'),
(103, 6, 'b'),
(104, 4, 'a'),
(105, 4, 'c'),
(106, 4, 'c'),
(107, 4, 'b'),
(108, 8, 'a'),
(109, 8, 'b'),
(110, 8, 'b'),
(111, 8, 'c'),
(112, 4, 'a');

-- --------------------------------------------------------

--
-- Table structure for table `student`
--

CREATE TABLE `student` (
  `usn` varchar(10) NOT NULL,
  `sname` varchar(45) NOT NULL,
  `address` varchar(30) NOT NULL,
  `phone` varchar(10) DEFAULT NULL,
  `gender` char(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `student`
--

INSERT INTO `student` (`usn`, `sname`, `address`, `phone`, `gender`) VALUES
('4MH19CS01', 'yash', 'mysore', '9902345674', 'm'),
('4MH19CS02', 'ajay', 'mysore', '9834567483', 'm'),
('4MH19CS03', 'akhila', 'mysore', '8765987645', 'f'),
('4MH19CS04', 'akash', 'mysore', '8765997645', 'f'),
('4MH19CS05', 'ajay', 'mandya', '9834567286', 'm'),
('4MH19CS06', 'bhumika', 'mysore', '9835567286', 'f'),
('4MH19CS07', 'chandan', 'mysore', '8967453767', 'm'),
('4MH19CS08', 'chandana', 'mysore', '7867564576', 'f');

-- --------------------------------------------------------

--
-- Structure for view `4mh19cs02`
--
DROP TABLE IF EXISTS `4mh19cs02`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `4mh19cs02`  AS SELECT `iamarks`.`subcode` AS `subcode`, `iamarks`.`test1` AS `test1` FROM `iamarks` WHERE `iamarks`.`usn` = '4MH19CS02' ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `class`
--
ALTER TABLE `class`
  ADD PRIMARY KEY (`usn`),
  ADD KEY `ssid` (`ssid`);

--
-- Indexes for table `course`
--
ALTER TABLE `course`
  ADD PRIMARY KEY (`subcode`);

--
-- Indexes for table `iamarks`
--
ALTER TABLE `iamarks`
  ADD PRIMARY KEY (`usn`,`subcode`,`ssid`),
  ADD KEY `ssid` (`ssid`),
  ADD KEY `subcode` (`subcode`);

--
-- Indexes for table `semsec`
--
ALTER TABLE `semsec`
  ADD PRIMARY KEY (`ssid`);

--
-- Indexes for table `student`
--
ALTER TABLE `student`
  ADD PRIMARY KEY (`usn`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `class`
--
ALTER TABLE `class`
  ADD CONSTRAINT `class_ibfk_1` FOREIGN KEY (`usn`) REFERENCES `student` (`usn`),
  ADD CONSTRAINT `class_ibfk_2` FOREIGN KEY (`ssid`) REFERENCES `semsec` (`ssid`);

--
-- Constraints for table `iamarks`
--
ALTER TABLE `iamarks`
  ADD CONSTRAINT `iamarks_ibfk_1` FOREIGN KEY (`usn`) REFERENCES `student` (`usn`),
  ADD CONSTRAINT `iamarks_ibfk_2` FOREIGN KEY (`ssid`) REFERENCES `semsec` (`ssid`),
  ADD CONSTRAINT `iamarks_ibfk_3` FOREIGN KEY (`subcode`) REFERENCES `course` (`subcode`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
