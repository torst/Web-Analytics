-- phpMyAdmin SQL Dump
-- version 4.0.4
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Aug 20, 2014 at 04:25 PM
-- Server version: 5.6.12-log
-- PHP Version: 5.4.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `meditube`
--
CREATE DATABASE IF NOT EXISTS `meditube` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `meditube`;

-- --------------------------------------------------------

--
-- Table structure for table `bannerhistory`
--

CREATE TABLE IF NOT EXISTS `bannerhistory` (
  `srno` int(10) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `bannerId` int(11) NOT NULL,
  `clickedOn` datetime NOT NULL,
  PRIMARY KEY (`srno`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=18 ;

--
-- Dumping data for table `bannerhistory`
--

INSERT INTO `bannerhistory` (`srno`, `uid`, `bannerId`, `clickedOn`) VALUES
(1, 1, 1, '2014-08-18 11:54:46'),
(2, 1, 1, '2014-08-18 11:55:03'),
(3, 1, 1, '2014-08-19 15:52:24'),
(4, 1, 1, '2014-08-19 15:52:43'),
(5, 1, 1, '2014-08-19 18:22:52'),
(6, 1, 2, '2014-08-20 08:44:41'),
(7, 1, 1, '2014-08-20 08:44:47'),
(8, 1, 4, '2014-08-20 08:44:56'),
(9, 1, 1, '2014-08-20 09:10:40'),
(10, 1, 1, '2014-08-20 09:10:40'),
(11, 1, 1, '2014-08-20 09:10:40'),
(12, 1, 1, '2014-08-20 09:10:47'),
(13, 1, 1, '2014-08-20 09:11:29'),
(14, 1, 5, '2014-08-20 09:12:23'),
(15, 1, 5, '2014-08-20 09:12:33'),
(16, 1, 6, '2014-08-20 09:26:14'),
(17, 1, 7, '2014-08-20 09:26:26');

-- --------------------------------------------------------

--
-- Table structure for table `migration`
--

CREATE TABLE IF NOT EXISTS `migration` (
  `srno` int(11) NOT NULL AUTO_INCREMENT,
  `destination` int(11) NOT NULL,
  `source` int(11) NOT NULL,
  PRIMARY KEY (`srno`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=10 ;

--
-- Dumping data for table `migration`
--

INSERT INTO `migration` (`srno`, `destination`, `source`) VALUES
(1, 1, 0),
(2, 1, 0),
(3, 2, 1),
(4, 3, 2),
(5, 4, 3),
(6, 5, 4),
(7, 6, 5),
(8, 7, 6),
(9, 1, 7);

-- --------------------------------------------------------

--
-- Table structure for table `page`
--

CREATE TABLE IF NOT EXISTS `page` (
  `pageNo` int(10) NOT NULL AUTO_INCREMENT,
  `pageTitle` varchar(200) NOT NULL,
  `timeSpent` bigint(20) NOT NULL,
  `visits` int(10) NOT NULL,
  `uniqueVisits` int(10) NOT NULL,
  PRIMARY KEY (`pageNo`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=8 ;

--
-- Dumping data for table `page`
--

INSERT INTO `page` (`pageNo`, `pageTitle`, `timeSpent`, `visits`, `uniqueVisits`) VALUES
(1, 'Page One', 48487986, 140, 2),
(2, 'Page Two', 6828652, 42, 2),
(3, 'Page Three', 2191550, 26, 1),
(4, 'Page Four', 31619, 4, 1),
(5, 'Page Five', 2783469, 4, 1),
(6, 'Page Six', 2877, 3, 1),
(7, 'Page Seven', 94224, 3, 1);

-- --------------------------------------------------------

--
-- Table structure for table `tracker`
--

CREATE TABLE IF NOT EXISTS `tracker` (
  `bannerId` int(11) NOT NULL,
  `clicks` int(11) NOT NULL,
  PRIMARY KEY (`bannerId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tracker`
--

INSERT INTO `tracker` (`bannerId`, `clicks`) VALUES
(1, 17),
(2, 2),
(3, 0),
(4, 1),
(5, 2),
(6, 1),
(7, 1);

-- --------------------------------------------------------

--
-- Table structure for table `unique`
--

CREATE TABLE IF NOT EXISTS `unique` (
  `pageNo` int(11) NOT NULL,
  `uid` int(11) NOT NULL,
  `visitedOn` datetime DEFAULT NULL,
  PRIMARY KEY (`pageNo`,`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `unique`
--

INSERT INTO `unique` (`pageNo`, `uid`, `visitedOn`) VALUES
(1, 1, '2014-08-18 08:46:19'),
(1, 2, '2014-08-18 08:47:29'),
(2, 1, '2014-08-20 06:59:15'),
(3, 1, '2014-08-20 08:47:19'),
(4, 1, '2014-08-20 09:34:14'),
(5, 1, '2014-08-20 09:34:15'),
(6, 1, '2014-08-20 09:34:17'),
(7, 1, '2014-08-20 09:34:07');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE IF NOT EXISTS `user` (
  `uid` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(200) NOT NULL,
  `password` varchar(500) NOT NULL,
  `level` int(11) NOT NULL,
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`uid`, `username`, `password`, `level`) VALUES
(1, 'jaspreet', '11bce0192', 1),
(2, 'sasuke', 'naruto', 5);

-- --------------------------------------------------------

--
-- Table structure for table `userbehavior`
--

CREATE TABLE IF NOT EXISTS `userbehavior` (
  `srno` int(10) NOT NULL AUTO_INCREMENT,
  `uid` int(10) NOT NULL,
  `pageNo` int(11) NOT NULL,
  `enteredAt` datetime NOT NULL,
  `leftAt` datetime NOT NULL,
  `timeSpent` bigint(20) NOT NULL,
  PRIMARY KEY (`srno`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=121 ;

--
-- Dumping data for table `userbehavior`
--

INSERT INTO `userbehavior` (`srno`, `uid`, `pageNo`, `enteredAt`, `leftAt`, `timeSpent`) VALUES
(4, 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1397),
(5, 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 28822),
(6, 1, 1, '2014-08-18 11:32:49', '2014-08-18 11:47:15', 866513),
(7, 1, 1, '2014-08-18 11:47:15', '2014-08-18 11:54:35', 440208),
(8, 1, 1, '2014-08-19 18:22:10', '2014-08-19 18:22:24', 14259),
(9, 1, 1, '2014-08-19 18:22:24', '2014-08-19 18:29:39', 434551),
(10, 1, 1, '2014-08-19 18:29:39', '2014-08-19 18:32:54', 195278),
(11, 1, 1, '2014-08-19 18:32:55', '2014-08-19 18:33:06', 10788),
(12, 1, 1, '2014-08-19 18:33:06', '2014-08-19 18:33:22', 16449),
(13, 1, 1, '2014-08-19 18:33:23', '2014-08-19 18:34:17', 53136),
(14, 1, 1, '2014-08-19 18:34:17', '2014-08-19 18:34:39', 22119),
(15, 1, 1, '2014-08-19 18:34:39', '2014-08-19 18:34:46', 6972),
(16, 1, 1, '2014-08-19 18:34:46', '2014-08-19 19:04:56', 1809519),
(17, 1, 1, '2014-08-19 19:04:56', '2014-08-19 19:05:50', 53851),
(18, 1, 1, '2014-08-19 19:05:51', '2014-08-19 19:07:52', 121149),
(19, 1, 1, '2014-08-19 19:07:52', '2014-08-19 19:08:56', 64096),
(20, 1, 1, '2014-08-19 19:08:57', '2014-08-19 19:09:09', 11871),
(21, 1, 1, '2014-08-19 19:09:09', '2014-08-19 19:09:32', 22979),
(22, 1, 1, '2014-08-19 19:09:33', '2014-08-20 06:59:12', 42578263),
(23, 1, 1, '2014-08-20 06:59:12', '2014-08-20 06:59:15', 2970),
(24, 1, 2, '2014-08-20 06:59:15', '2014-08-20 06:59:53', 37832),
(25, 1, 2, '2014-08-20 06:59:53', '2014-08-20 07:00:39', 45810),
(26, 1, 2, '2014-08-20 07:00:49', '2014-08-20 07:04:03', 193924),
(27, 1, 2, '2014-08-20 07:04:08', '2014-08-20 07:04:53', 44428),
(28, 1, 2, '2014-08-20 07:04:53', '2014-08-20 07:05:42', 49442),
(29, 1, 2, '2014-08-20 07:05:42', '2014-08-20 07:07:31', 108817),
(30, 1, 2, '2014-08-20 07:07:33', '2014-08-20 07:07:59', 25904),
(31, 1, 2, '2014-08-20 07:07:59', '2014-08-20 07:11:52', 233457),
(32, 1, 2, '2014-08-20 07:11:52', '2014-08-20 07:13:34', 101145),
(33, 1, 2, '2014-08-20 07:13:34', '2014-08-20 07:13:37', 3035),
(34, 1, 2, '2014-08-20 07:13:37', '2014-08-20 07:20:19', 401766),
(35, 1, 2, '2014-08-20 07:20:19', '2014-08-20 07:20:21', 1803),
(36, 1, 2, '2014-08-20 07:20:21', '2014-08-20 07:21:32', 71358),
(37, 1, 2, '2014-08-20 07:21:32', '2014-08-20 07:24:36', 184009),
(38, 1, 2, '2014-08-20 07:24:36', '2014-08-20 07:26:11', 94237),
(39, 1, 2, '2014-08-20 07:26:11', '2014-08-20 08:38:26', 4334743),
(40, 1, 2, '2014-08-20 08:38:26', '2014-08-20 08:40:00', 94585),
(41, 1, 2, '2014-08-20 08:40:00', '2014-08-20 08:40:03', 2695),
(42, 1, 2, '2014-08-20 08:40:03', '2014-08-20 08:40:48', 44831),
(43, 1, 2, '2014-08-20 08:40:48', '2014-08-20 08:43:56', 187897),
(44, 1, 2, '2014-08-20 08:43:56', '2014-08-20 08:44:11', 14339),
(45, 1, 2, '2014-08-20 08:44:11', '2014-08-20 08:45:32', 81370),
(46, 1, 2, '2014-08-20 08:45:37', '2014-08-20 08:45:38', 1808),
(47, 1, 2, '2014-08-20 08:45:40', '2014-08-20 08:45:56', 15407),
(48, 1, 2, '2014-08-20 08:45:56', '2014-08-20 08:45:58', 1722),
(49, 1, 1, '2014-08-20 08:45:58', '2014-08-20 08:46:02', 4111),
(50, 1, 2, '2014-08-20 08:46:02', '2014-08-20 08:47:19', 77279),
(51, 1, 3, '2014-08-20 08:47:19', '2014-08-20 09:00:43', 803995),
(52, 1, 3, '2014-08-20 09:00:44', '2014-08-20 09:01:19', 35505),
(53, 1, 3, '2014-08-20 09:01:19', '2014-08-20 09:01:31', 11503),
(54, 1, 3, '2014-08-20 09:01:31', '2014-08-20 09:03:43', 132188),
(55, 1, 3, '2014-08-20 09:03:43', '2014-08-20 09:04:22', 38360),
(56, 1, 3, '2014-08-20 09:04:22', '2014-08-20 09:04:34', 11851),
(57, 1, 3, '2014-08-20 09:04:34', '2014-08-20 09:05:01', 26945),
(58, 1, 3, '2014-08-20 09:05:01', '2014-08-20 09:08:01', 180433),
(59, 1, 3, '2014-08-20 09:08:02', '2014-08-20 09:08:03', 1144),
(60, 1, 3, '2014-08-20 09:08:03', '2014-08-20 09:08:20', 17563),
(61, 1, 3, '2014-08-20 09:08:21', '2014-08-20 09:12:19', 238776),
(62, 1, 3, '2014-08-20 09:12:20', '2014-08-20 09:12:21', 1779),
(63, 1, 3, '2014-08-20 09:12:21', '2014-08-20 09:13:10', 48472),
(64, 1, 3, '2014-08-20 09:13:10', '2014-08-20 09:13:15', 5204),
(65, 1, 3, '2014-08-20 09:13:15', '2014-08-20 09:13:17', 1993),
(66, 1, 2, '2014-08-20 09:13:17', '2014-08-20 09:13:20', 2581),
(67, 1, 1, '2014-08-20 09:13:20', '2014-08-20 09:13:22', 1402),
(68, 1, 3, '2014-08-20 09:13:22', '2014-08-20 09:16:17', 175702),
(69, 1, 3, '2014-08-20 09:16:18', '2014-08-20 09:16:20', 1806),
(70, 1, 3, '2014-08-20 09:16:20', '2014-08-20 09:23:33', 433572),
(71, 1, 3, '2014-08-20 09:23:34', '2014-08-20 09:23:38', 4624),
(72, 1, 3, '2014-08-20 09:23:38', '2014-08-20 09:23:40', 1645),
(73, 1, 3, '2014-08-20 09:23:42', '2014-08-20 09:23:55', 13627),
(74, 1, 2, '2014-08-20 09:23:56', '2014-08-20 09:25:13', 77797),
(75, 1, 2, '2014-08-20 09:25:13', '2014-08-20 09:25:36', 22743),
(76, 1, 2, '2014-08-20 09:25:36', '2014-08-20 09:25:58', 21924),
(77, 1, 2, '2014-08-20 09:25:58', '2014-08-20 09:26:12', 13783),
(78, 1, 2, '2014-08-20 09:26:12', '2014-08-20 09:26:59', 46437),
(79, 1, 2, '2014-08-20 09:26:59', '2014-08-20 09:29:39', 160372),
(80, 1, 2, '2014-08-20 09:29:40', '2014-08-20 09:30:03', 23964),
(81, 1, 2, '2014-08-20 09:30:04', '2014-08-20 09:30:05', 1528),
(82, 1, 1, '2014-08-20 09:30:05', '2014-08-20 09:31:10', 64362),
(83, 1, 1, '2014-08-20 09:30:05', '2014-08-20 09:31:10', 64363),
(84, 1, 1, '2014-08-20 09:31:10', '2014-08-20 09:31:24', 14311),
(85, 1, 1, '2014-08-20 09:31:24', '2014-08-20 09:31:45', 20418),
(86, 1, 1, '2014-08-20 09:31:45', '2014-08-20 09:32:16', 30889),
(87, 1, 1, '2014-08-20 09:32:16', '2014-08-20 09:32:25', 8768),
(88, 1, 1, '2014-08-20 09:32:25', '2014-08-20 09:32:28', 2580),
(89, 1, 2, '2014-08-20 09:32:28', '2014-08-20 09:32:29', 887),
(90, 1, 3, '2014-08-20 09:32:29', '2014-08-20 09:32:30', 1123),
(91, 1, 3, '2014-08-20 09:32:30', '2014-08-20 09:32:31', 933),
(92, 1, 3, '2014-08-20 09:32:31', '2014-08-20 09:32:32', 904),
(93, 1, 2, '2014-08-20 09:32:32', '2014-08-20 09:32:33', 923),
(94, 1, 1, '2014-08-20 09:32:33', '2014-08-20 09:34:07', 93643),
(95, 1, 7, '2014-08-20 09:34:07', '2014-08-20 09:34:11', 4336),
(96, 1, 1, '2014-08-20 09:34:12', '2014-08-20 09:34:12', 931),
(97, 1, 2, '2014-08-20 09:34:13', '2014-08-20 09:34:13', 787),
(98, 1, 3, '2014-08-20 09:34:14', '2014-08-20 09:34:14', 881),
(99, 1, 4, '2014-08-20 09:34:15', '2014-08-20 09:34:15', 523),
(100, 1, 5, '2014-08-20 09:34:15', '2014-08-20 09:34:17', 1647),
(101, 1, 6, '2014-08-20 09:34:17', '2014-08-20 09:34:18', 589),
(102, 1, 7, '2014-08-20 09:34:18', '2014-08-20 09:34:29', 11724),
(103, 1, 5, '2014-08-20 09:34:30', '2014-08-20 09:34:32', 1942),
(104, 1, 6, '2014-08-20 09:34:32', '2014-08-20 09:34:33', 1370),
(105, 1, 4, '2014-08-20 09:34:33', '2014-08-20 09:35:01', 28217),
(106, 1, 4, '2014-08-20 09:35:01', '2014-08-20 09:35:03', 1875),
(107, 1, 5, '2014-08-20 09:35:03', '2014-08-20 10:21:22', 2779004),
(108, 1, 1, '2014-08-20 10:22:02', '2014-08-20 10:22:33', 30706),
(109, 1, 1, '2014-08-20 10:22:33', '2014-08-20 10:23:11', 37653),
(110, 1, 1, '2014-08-20 10:23:11', '2014-08-20 10:35:05', 713933),
(111, 1, 1, '2014-08-20 10:35:06', '2014-08-20 10:36:04', 58541),
(112, 1, 1, '2014-08-20 10:36:04', '2014-08-20 10:37:48', 103361),
(113, 1, 1, '2014-08-20 10:37:48', '2014-08-20 10:38:30', 41643),
(114, 1, 1, '2014-08-20 10:38:30', '2014-08-20 10:38:33', 2918),
(115, 1, 2, '2014-08-20 10:38:33', '2014-08-20 10:38:34', 1252),
(116, 1, 3, '2014-08-20 10:38:34', '2014-08-20 10:38:35', 994),
(117, 1, 4, '2014-08-20 10:38:35', '2014-08-20 10:38:36', 986),
(118, 1, 5, '2014-08-20 10:38:37', '2014-08-20 10:38:37', 876),
(119, 1, 6, '2014-08-20 10:38:37', '2014-08-20 10:38:38', 918),
(120, 1, 7, '2014-08-20 10:38:38', '2014-08-20 10:39:49', 70218);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
