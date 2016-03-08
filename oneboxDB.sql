-- phpMyAdmin SQL Dump
-- version 4.5.5.1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Mar 03, 2016 at 03:35 PM
-- Server version: 5.7.9
-- PHP Version: 5.5.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `oneboxDB`
--

-- --------------------------------------------------------

--
-- Table structure for table `userList`
--

CREATE TABLE `userList` (
  `display` varchar(140) NOT NULL,
  `firstname` varchar(80) NOT NULL,
  `lastname` varchar(80) NOT NULL,
  `phone` varchar(80) NOT NULL,
  `email` varchar(80) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `userList`
--

INSERT INTO `userList` (`display`, `firstname`, `lastname`, `phone`, `email`) VALUES
('Juan Diego Antezana Bellot', 'Juan Diego', 'Antezana Bellot', '0536938485', 'jd.antezana@my-g.fr'),
('Thomas Laporte', 'Thomas', 'Laporte', '03524632', 'tlaporte@gpartner.eu'),
('James Cohen', 'James', 'Cohen', '408-393-2092', 'james.cohen@corp.acme.com'),
('Jeff Halloway', 'Jeff', 'Halloway', '408-393-2093', 'jeff.halloway@corp.acme.com'),
('Lawrence, Abraham', 'Lawrence', 'Abraham', '408-393-2094', 'lawrence.abraham@corp.acme.com'),
('Amy, Agrawal', 'Amy', 'Agrawal', '408-393-2095', 'amy.agrawal@corp.acme.com'),
('Aaron Nathan', 'Aaron', 'Nathan', '408-393-2096', 'aaron.nathan@corp.acme.com'),
('Abe, Andrews', 'Abe', 'Andrews', '408-393-2097', 'abe.Andrews@corp.acme.com');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
