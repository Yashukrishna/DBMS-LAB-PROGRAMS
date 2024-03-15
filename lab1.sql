-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 16, 2024 at 06:12 PM
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
-- Database: `lab1`
--

-- --------------------------------------------------------

--
-- Table structure for table `books`
--

CREATE TABLE `books` (
  `book_id` int(11) NOT NULL,
  `title` varchar(40) DEFAULT NULL,
  `publisher_name` varchar(20) DEFAULT NULL,
  `pub_year` int(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `books`
--

INSERT INTO `books` (`book_id`, `title`, `publisher_name`, `pub_year`) VALUES
(102, 'python', 'mcgraw_hills', 2000),
(103, 'unix', 'don', 1990),
(104, 'cns', 'san', 2001),
(105, 'manage', 'jhon', 2003),
(106, 'python', 'montee', 2020);

-- --------------------------------------------------------

--
-- Table structure for table `books_authors`
--

CREATE TABLE `books_authors` (
  `book_id` int(11) NOT NULL,
  `author_name` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `books_authors`
--

INSERT INTO `books_authors` (`book_id`, `author_name`) VALUES
(102, 'rajkumar'),
(103, 'darshan'),
(104, 'sudeep'),
(105, 'alex'),
(106, 'misc');

-- --------------------------------------------------------

--
-- Stand-in structure for view `books_copies`
-- (See below for the actual view)
--
CREATE TABLE `books_copies` (
`book_id` int(11)
,`title` varchar(40)
,`no_of_copies` int(11)
);

-- --------------------------------------------------------

--
-- Table structure for table `book_copies`
--

CREATE TABLE `book_copies` (
  `book_id` int(11) DEFAULT NULL,
  `programme_id` int(11) DEFAULT NULL,
  `no_of_copies` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `book_copies`
--

INSERT INTO `book_copies` (`book_id`, `programme_id`, `no_of_copies`) VALUES
(102, 4002, 91),
(102, 4005, 81),
(103, 4004, 98),
(104, 4003, 108);

-- --------------------------------------------------------

--
-- Table structure for table `book_lending`
--

CREATE TABLE `book_lending` (
  `book_id` int(11) NOT NULL,
  `programme_id` int(11) NOT NULL,
  `card_no` int(11) NOT NULL,
  `date_out` date DEFAULT NULL,
  `due_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `book_lending`
--

INSERT INTO `book_lending` (`book_id`, `programme_id`, `card_no`, `date_out`, `due_date`) VALUES
(102, 4001, 902, '2018-02-02', '2018-04-01'),
(102, 4005, 902, '2018-10-09', '2019-05-01'),
(103, 4003, 903, '2019-01-30', '0000-00-00'),
(103, 4004, 901, '2017-01-03', '2017-06-28'),
(105, 4003, 901, '2017-01-02', '2017-06-30');

-- --------------------------------------------------------

--
-- Stand-in structure for view `book_view`
-- (See below for the actual view)
--
CREATE TABLE `book_view` (
`pub_year` int(4)
);

-- --------------------------------------------------------

--
-- Table structure for table `library_programme`
--

CREATE TABLE `library_programme` (
  `programme_id` int(11) NOT NULL,
  `programme_name` varchar(40) DEFAULT NULL,
  `address` varchar(40) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `library_programme`
--

INSERT INTO `library_programme` (`programme_id`, `programme_name`, `address`) VALUES
(4001, 'computer', 'mysore'),
(4002, 'ise', 'mysore'),
(4003, 'mech', 'mysore'),
(4004, 'civil', 'mysore'),
(4005, 'ece', 'mysore');

-- --------------------------------------------------------

--
-- Table structure for table `publisher`
--

CREATE TABLE `publisher` (
  `name` varchar(20) NOT NULL,
  `address` varchar(20) DEFAULT NULL,
  `phone` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `publisher`
--

INSERT INTO `publisher` (`name`, `address`, `phone`) VALUES
('don', 'london', 258858),
('jhon', 'banglore', 254836),
('mcgraw_hills', 'mysore', 234568),
('montee', 'banglore', 234538),
('san', 'mandya', 283468);

-- --------------------------------------------------------

--
-- Structure for view `books_copies`
--
DROP TABLE IF EXISTS `books_copies`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `books_copies`  AS SELECT `b`.`book_id` AS `book_id`, `b`.`title` AS `title`, `bc`.`no_of_copies` AS `no_of_copies` FROM (`books` `b` join `book_copies` `bc`) WHERE `b`.`book_id` = `bc`.`book_id` ;

-- --------------------------------------------------------

--
-- Structure for view `book_view`
--
DROP TABLE IF EXISTS `book_view`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `book_view`  AS SELECT `books`.`pub_year` AS `pub_year` FROM `books` ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `books`
--
ALTER TABLE `books`
  ADD PRIMARY KEY (`book_id`),
  ADD KEY `publisher_name` (`publisher_name`);

--
-- Indexes for table `books_authors`
--
ALTER TABLE `books_authors`
  ADD PRIMARY KEY (`book_id`);

--
-- Indexes for table `book_copies`
--
ALTER TABLE `book_copies`
  ADD KEY `book_id` (`book_id`),
  ADD KEY `programme_id` (`programme_id`);

--
-- Indexes for table `book_lending`
--
ALTER TABLE `book_lending`
  ADD PRIMARY KEY (`book_id`,`programme_id`,`card_no`),
  ADD KEY `programme_id` (`programme_id`);

--
-- Indexes for table `library_programme`
--
ALTER TABLE `library_programme`
  ADD PRIMARY KEY (`programme_id`);

--
-- Indexes for table `publisher`
--
ALTER TABLE `publisher`
  ADD PRIMARY KEY (`name`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `books`
--
ALTER TABLE `books`
  ADD CONSTRAINT `books_ibfk_1` FOREIGN KEY (`publisher_name`) REFERENCES `publisher` (`name`) ON DELETE CASCADE;

--
-- Constraints for table `books_authors`
--
ALTER TABLE `books_authors`
  ADD CONSTRAINT `books_authors_ibfk_1` FOREIGN KEY (`book_id`) REFERENCES `books` (`book_id`) ON DELETE CASCADE;

--
-- Constraints for table `book_copies`
--
ALTER TABLE `book_copies`
  ADD CONSTRAINT `book_copies_ibfk_1` FOREIGN KEY (`book_id`) REFERENCES `books` (`book_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `book_copies_ibfk_2` FOREIGN KEY (`programme_id`) REFERENCES `library_programme` (`programme_id`) ON DELETE CASCADE;

--
-- Constraints for table `book_lending`
--
ALTER TABLE `book_lending`
  ADD CONSTRAINT `book_lending_ibfk_1` FOREIGN KEY (`book_id`) REFERENCES `books` (`book_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `book_lending_ibfk_2` FOREIGN KEY (`programme_id`) REFERENCES `library_programme` (`programme_id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
