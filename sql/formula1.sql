-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 16, 2023 at 11:54 AM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.0.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `formula1`
--

-- --------------------------------------------------------

--
-- Table structure for table `driver`
--

CREATE TABLE `driver` (
  `id` int(11) NOT NULL,
  `country` varchar(255) NOT NULL,
  `point` float NOT NULL,
  `champion` int(11) NOT NULL,
  `fullname` varchar(255) NOT NULL,
  `number` int(11) NOT NULL,
  `avt` varchar(255) NOT NULL,
  `teamId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `driver`
--

INSERT INTO `driver` (`id`, `country`, `point`, `champion`, `fullname`, `number`, `avt`, `teamId`) VALUES
(1, '', 0, 0, '', 0, '', NULL),
(2, '', 0, 0, '', 0, '', NULL),
(3, '', 0, 0, '', 0, '', NULL),
(4, 'Netherlands', 2181.5, 2, 'Max Verstappen', 1, 'https://media.formula1.com/content/dam/fom-website/drivers/2023Drivers/verstappen.jpg.img.320.medium.jpg/1677069646195.jpg', 2),
(5, 'Mexico', 1318, 0, 'Sergio Perez', 11, 'https://media.formula1.com/content/dam/fom-website/drivers/2023Drivers/perez.jpg.img.320.medium.jpg/1677069773437.jpg', 2),
(6, 'Spain', 2160, 2, 'Fernando Alonso', 14, 'https://media.formula1.com/content/dam/fom-website/drivers/2023Drivers/alonso.jpg.img.320.medium.jpg/1677244577162.jpg', 4),
(7, 'United Kingdom', 4492.5, 7, 'Lewis Hamilton', 44, 'https://media.formula1.com/content/dam/fom-website/drivers/2023Drivers/hamilton.jpg.img.320.medium.jpg/1677069594164.jpg', 3),
(8, 'United Kingdom', 359, 0, 'George Russell', 63, 'https://media.formula1.com/content/dam/fom-website/drivers/2023Drivers/russell.jpg.img.320.medium.jpg/1677069334466.jpg', 3),
(9, 'Spain', 840.5, 0, 'Carlos Sainz', 55, 'https://media.formula1.com/content/dam/fom-website/drivers/2023Drivers/sainz.jpg.img.320.medium.jpg/1677069189406.jpg', 5),
(10, 'Monaco', 910, 0, 'Charles Leclerc', 16, 'https://media.formula1.com/content/dam/fom-website/drivers/2023Drivers/leclerc.jpg.img.320.medium.jpg/1677069223130.jpg', 5),
(11, 'Canada', 229, 0, 'Lance Stroll', 18, 'https://media.formula1.com/content/dam/fom-website/drivers/2023Drivers/stroll.jpg.img.320.medium.jpg/1677069453013.jpg', 4),
(12, 'France', 389, 0, 'Esteban Ocon', 31, 'https://media.formula1.com/content/dam/fom-website/drivers/2023Drivers/ocon.jpg.img.320.medium.jpg/1677069269007.jpg', 6),
(13, 'France', 347, 0, 'Pierre Gasly', 10, 'https://media.formula1.com/content/dam/fom-website/drivers/2023Drivers/gasly.jpg.img.320.medium.jpg/1676983081984.jpg', 6),
(14, 'United Kingdom', 440, 0, 'Lando Norris', 4, 'https://media.formula1.com/content/dam/fom-website/drivers/2023Drivers/norris.jpg.img.320.medium.jpg/1677069505471.jpg', 7),
(15, 'Germany', 527, 0, 'Nico Hulkenberg', 27, 'https://media.formula1.com/content/dam/fom-website/drivers/2023Drivers/hulkenberg.jpg.img.320.medium.jpg/1676983071882.jpg', 8),
(16, 'Australia', 5, 0, 'Oscar Piastri', 81, 'https://media.formula1.com/content/dam/fom-website/drivers/2023Drivers/piastri.jpg.img.320.medium.jpg/1676983075734.jpg', 7),
(17, 'Finland', 1791, 0, 'Valtteri Bottas', 77, 'https://media.formula1.com/content/dam/fom-website/drivers/2023Drivers/bottas.jpg.img.320.medium.jpg/1677069810695.jpg', 9),
(18, 'China', 10, 0, 'Zhou Guanyu', 24, 'https://media.formula1.com/content/dam/fom-website/drivers/2023Drivers/zhou.jpg.img.320.medium.jpg/1677069909295.jpg', 9),
(19, 'Japan', 46, 0, 'Yuki Tsunoda', 22, 'https://media.formula1.com/content/dam/fom-website/drivers/2023Drivers/tsunoda.jpg.img.320.medium.jpg/1677069846213.jpg', 10),
(20, 'Denmark', 185, 0, 'Kevin Magnussen', 20, 'https://media.formula1.com/content/dam/fom-website/drivers/2023Drivers/magnussen.jpg.img.320.medium.jpg/1677069387823.jpg', 8),
(21, 'Thailand', 202, 0, 'Alexander Albon', 23, 'https://media.formula1.com/content/dam/fom-website/drivers/2023Drivers/albon.jpg.img.320.medium.jpg/1677068770293.jpg', 11),
(22, 'Netherlands', 2, 0, 'Nyck De Vries', 21, 'https://media.formula1.com/content/dam/fom-website/drivers/2023Drivers/devries.jpg.img.320.medium.jpg/1676983081637.jpg', 10),
(23, 'United States', 0, 0, 'Logan Sargeant', 2, 'https://media.formula1.com/content/dam/fom-website/drivers/2023Drivers/sargeant.jpg.img.320.medium.jpg/1676983079144.jpg', 11);

-- --------------------------------------------------------

--
-- Table structure for table `driver_schedules_schedule`
--

CREATE TABLE `driver_schedules_schedule` (
  `driverId` int(11) NOT NULL,
  `scheduleId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `result_dhl`
--

CREATE TABLE `result_dhl` (
  `id` int(11) NOT NULL,
  `timeComplete` varchar(255) NOT NULL,
  `country` varchar(255) NOT NULL,
  `car` varchar(255) NOT NULL,
  `year` int(11) NOT NULL,
  `driverId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `result_dhl`
--

INSERT INTO `result_dhl` (`id`, `timeComplete`, `country`, `car`, `year`, `driverId`) VALUES
(1, '1:33.996', 'Bahrain', 'Alfa Romeo Ferrari', 2023, 18),
(2, '1:31.906', 'Saudi Arabia', 'Red Bull Racing Honda RBPT', 2023, 4),
(3, '1:20.235', 'Australia', 'Red Bull Racing Honda RBPT', 2023, 5),
(4, '1:43.370', 'Azerbaijan', 'Mercedes', 2023, 8),
(5, '1:29.708', 'Miami ', 'Red Bull Racing Honda RBPT', 2023, 4),
(6, '1:15.650', 'Monaco', 'Mercedes', 2023, 7),
(7, '1:16.330', 'Spain', 'Red Bull Racing Honda RBPT', 2023, 4),
(8, '1:34.570', 'Bahrain', 'Ferrari', 2022, 10),
(9, '1:31.634', 'Saudi Arabia', 'Ferrari', 2022, 10),
(10, '1:20.260', 'Australia', 'Ferrari', 2022, 10),
(11, '1:18.446', 'Emilia Romagna', 'Red Bull Racing RBPT', 2022, 4),
(12, '1:31.361', 'Miami ', 'Red Bull Racing RBPT', 2022, 4),
(13, '1:24.108', 'Spain', 'Red Bull Racing RBPT', 2022, 5),
(14, '1:14.693', 'Monaco', 'McLaren Mercedes', 2022, 14),
(15, '1:46.046', 'Azerbaijan', 'Red Bull Racing RBPT', 2022, 5),
(16, '1:15.749', 'Canada', 'Ferrari', 2022, 9),
(17, '1:30.510', 'Great Britain', 'Mercedes', 2022, 7),
(18, '1:07.275', 'Austria', 'Red Bull Racing RBPT', 2022, 4),
(19, '1:35.781', 'France', 'Ferrari', 2022, 9),
(20, '1:21.386', 'Hungary', 'Mercedes', 2022, 7),
(21, '1:49.354', 'Belgium', 'Red Bull Racing RBPT', 2022, 4),
(22, '1:13.652', 'Netherlands', 'Red Bull Racing RBPT', 2022, 4),
(23, '1:24.030', 'Italy', 'Red Bull Racing RBPT', 2022, 5),
(24, '1:46.458', 'Singapore', 'Mercedes', 2022, 8),
(25, '1:44.411', 'Japan', 'Alfa Romeo Ferrari', 2022, 18),
(26, '1:38.788', 'United States ', 'Mercedes', 2022, 8),
(27, '1:20.153', 'Mexico', 'Mercedes', 2022, 8),
(28, '1:13.785', 'Brazil', 'Mercedes', 2022, 8),
(29, '1:28.391', 'Abu Dhabi', 'McLaren Mercedes', 2022, 14),
(30, '1:32.090', 'Bahrain', 'Mercedes', 2021, 17),
(31, '1:16.702', 'Emilia Romagna', 'Mercedes', 2021, 7),
(32, '1:19.865', 'Portugal', 'Mercedes', 2021, 17),
(33, '1:18.149', 'Spain', 'Red Bull Racing Honda', 2021, 4),
(34, '1:12.909', 'Monaco', 'Mercedes', 2021, 7),
(35, '1:44.481', 'Azerbaijan', 'Red Bull Racing Honda', 2021, 4),
(36, '1:36.404', 'France', 'Red Bull Racing Honda', 2021, 4),
(37, '1:07.058', 'Styria', 'Mercedes', 2021, 7),
(38, '1:06.200', 'Austria', 'Red Bull Racing Honda', 2021, 4),
(39, '1:28.617', 'Great Britain', 'Red Bull Racing Honda', 2021, 5),
(40, '1:18.394', 'Hungary', 'AlphaTauri Honda', 2021, 13),
(41, '1:11.097', 'Netherlands', 'Mercedes', 2021, 7),
(42, '1:37.423', 'Russia', 'McLaren Mercedes', 2021, 14),
(43, '1:30.432', 'Turkey', 'Mercedes', 2021, 17),
(44, '1:38.485', 'United States ', 'Mercedes', 2021, 7),
(45, '1:17.774', 'Mexico', 'Mercedes', 2021, 17),
(46, '1:11.010', 'Brazil', 'Red Bull Racing Honda', 2021, 5),
(47, '1:23.196', 'Qatar', 'Red Bull Racing Honda', 2021, 4),
(48, '1:30.734', 'Saudi Arabia', 'Mercedes', 2021, 7),
(49, '1:26.103', 'Abu Dhabi', 'Red Bull Racing Honda', 2021, 4),
(50, '1:07.475', 'Austria', 'McLaren Renault', 2020, 14),
(51, '1:05.619', 'Styria', 'McLaren Renault', 2020, 9),
(52, '1:16.627', 'Hungary', 'Mercedes', 2020, 7),
(53, '1:27.097', 'Great Britain', 'Red Bull Racing Honda', 2020, 4),
(54, '1:28.451', '70th Anniversary', 'Mercedes', 2020, 7),
(55, '1:18.183', 'Spain', 'Mercedes', 2020, 17),
(56, '1:22.746', 'Italy', 'Mercedes', 2020, 7),
(57, '1:18.833', 'Tuscany', 'Mercedes', 2020, 7),
(58, '1:37.030', 'Russia', 'Mercedes', 2020, 17),
(59, '1:28.139', 'Eifel', 'Red Bull Racing Honda', 2020, 4),
(60, '1:18.750', 'Portugal', 'Mercedes', 2020, 7),
(61, '1:15.484', 'Emilia Romagna', 'Mercedes', 2020, 7),
(62, '1:36.806', 'Turkey', 'McLaren Renault', 2020, 14),
(63, '1:32.014', 'Bahrain', 'Red Bull Racing Honda', 2020, 4),
(64, '55.404', 'Sakhir', 'Mercedes', 2020, 8),
(65, '1:25.580', 'Australia', 'Mercedes', 2019, 17),
(66, '1:33.411', 'Bahrain', 'Ferrari', 2019, 10),
(67, '1:34.742', 'China', 'Red Bull Racing Honda', 2019, 13),
(68, '1:43.009', 'Azerbaijan', 'Ferrari', 2019, 10),
(69, '1:18.492', 'Spain', 'Mercedes', 2019, 7),
(70, '1:14.279', 'Monaco', 'Red Bull Racing Honda', 2019, 13),
(71, '1:13.078', 'Canada', 'Mercedes', 2019, 17),
(72, '1:32.740', 'France', 'Ferrari', 2019, NULL),
(73, '1:07.475', 'Austria', 'Red Bull Racing Honda', 2019, 4),
(74, '1:27.369', 'Great Britain', 'Mercedes', 2019, 7),
(75, '1:16.645', 'Germany', 'Red Bull Racing Honda', 2019, 4),
(76, '1:17.103', 'Hungary', 'Red Bull Racing Honda', 2019, 4),
(77, '1:46.409', 'Belgium', 'Ferrari', 2019, NULL),
(78, '1:21.779', 'Italy', 'Mercedes', 2019, 7),
(79, '1:42.301', 'Singapore', 'Haas Ferrari', 2019, 20),
(80, '1:35.761', 'Russia', 'Mercedes', 2019, 7),
(81, '1:30.983', 'Japan', 'Mercedes', 2019, 7),
(82, '1:19.232', 'Mexico', 'Ferrari', 2019, 10),
(83, '1:36.169', 'United States ', 'Ferrari', 2019, 10),
(84, '1:10.698', 'Brazil', 'Mercedes', 2019, 17),
(85, '1:39.283', 'Abu Dhabi', 'Mercedes', 2019, 7),
(86, '1:33.740', 'Bahrain', 'Mercedes', 2018, 17),
(87, '1:45.149', 'Azerbaijan', 'Mercedes', 2018, 17),
(88, '1:14.260', 'Monaco', 'Red Bull Racing TAG Heuer', 2018, 4),
(89, '1:13.864', 'Canada', 'Red Bull Racing TAG Heuer', 2018, 4),
(90, '1:34.225', 'France', 'Mercedes', 2018, 17),
(91, '1:06.957', 'Austria', 'Ferrari', 2018, NULL),
(92, '1:30.696', 'Great Britain', 'Ferrari', 2018, NULL),
(93, '1:15.545', 'Germany', 'Mercedes', 2018, 7),
(94, '1:46.286', 'Belgium', 'Mercedes', 2018, 17),
(95, '1:22.497', 'Italy', 'Mercedes', 2018, 7),
(96, '1:41.905', 'Singapore', 'Haas Ferrari', 2018, 20),
(97, '1:35.861', 'Russia', 'Mercedes', 2018, 17),
(98, '1:32.318', 'Japan', 'Ferrari', 2018, NULL),
(99, '1:37.392', 'United States ', 'Mercedes', 2018, 7),
(100, '1:18.741', 'Mexico', 'Mercedes', 2018, 17),
(101, '1:10.540', 'Brazil', 'Mercedes', 2018, 17),
(102, '1:40.867', 'Abu Dhabi', 'Ferrari', 2018, NULL),
(103, '1:26.538', 'Australia', 'Ferrari', 2017, NULL),
(104, '1:35.378', 'China', 'Mercedes', 2017, 7),
(105, '1:32.798', 'Bahrain', 'Mercedes', 2017, 7),
(106, '1:36.844', 'Russia', 'Ferrari', 2017, NULL),
(107, '1:23.593', 'Spain', 'Mercedes', 2017, 7),
(108, '1:14.820', 'Monaco', 'Force India Mercedes', 2017, 5),
(109, '1:14.551', 'Canada', 'Mercedes', 2017, 7),
(110, '1:43.441', 'Azerbaijan', 'Ferrari', 2017, NULL),
(111, '1:07.411', 'Austria', 'Mercedes', 2017, 7),
(112, '1:30.621', 'Great Britain', 'Mercedes', 2017, 7),
(113, '1:20.182', 'Hungary', 'McLaren Honda', 2017, 6),
(114, '1:46.577', 'Belgium', 'Ferrari', 2017, NULL),
(115, '1:45.008', 'Singapore', 'Mercedes', 2017, 7),
(116, '1:34.080', 'Malaysia', 'Ferrari', 2017, NULL),
(117, '1:33.144', 'Japan', 'Mercedes', 2017, 17),
(118, '1:37.766', 'United States ', 'Ferrari', 2017, NULL),
(119, '1:18.785', 'Mexico', 'Ferrari', 2017, NULL),
(120, '1:11.044', 'Brazil', 'Red Bull Racing TAG Heuer', 2017, 4),
(121, '1:40.650', 'Abu Dhabi', 'Mercedes', 2017, 17);

-- --------------------------------------------------------

--
-- Table structure for table `result_driver`
--

CREATE TABLE `result_driver` (
  `id` int(11) NOT NULL,
  `driver` varchar(255) NOT NULL,
  `pos` int(11) NOT NULL,
  `point` int(11) NOT NULL,
  `car` varchar(255) NOT NULL,
  `year` int(11) NOT NULL,
  `driverDataId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `result_driver`
--

INSERT INTO `result_driver` (`id`, `driver`, `pos`, `point`, `car`, `year`, `driverDataId`) VALUES
(1, '', 0, 2181, '', 0, NULL),
(2, '', 0, 1318, '', 0, NULL),
(3, '', 0, 2160, '', 0, NULL),
(4, '', 0, 4492, '', 0, NULL),
(5, '', 0, 359, '', 0, NULL),
(6, '', 0, 840, '', 0, NULL),
(7, '', 0, 910, '', 0, NULL),
(8, '', 0, 229, '', 0, NULL),
(9, '', 0, 389, '', 0, NULL),
(10, '', 0, 347, '', 0, NULL),
(11, '', 0, 440, '', 0, NULL),
(12, '', 0, 527, '', 0, NULL),
(13, '', 0, 5, '', 0, NULL),
(14, '', 0, 1791, '', 0, NULL),
(15, '', 0, 10, '', 0, NULL),
(16, '', 0, 46, '', 0, NULL),
(17, '', 0, 185, '', 0, NULL),
(18, '', 0, 202, '', 0, NULL),
(19, '', 0, 2, '', 0, NULL),
(20, '', 0, 0, '', 0, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `result_race`
--

CREATE TABLE `result_race` (
  `id` int(11) NOT NULL,
  `date` varchar(255) NOT NULL,
  `car` varchar(255) NOT NULL,
  `timeComplete` varchar(255) NOT NULL,
  `country` varchar(255) NOT NULL,
  `driver` varchar(255) NOT NULL,
  `year` int(11) NOT NULL,
  `driverDataId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `result_race`
--

INSERT INTO `result_race` (`id`, `date`, `car`, `timeComplete`, `country`, `driver`, `year`, `driverDataId`) VALUES
(1, '05 Mar 2023', 'Red Bull Racing Honda RBPT', '1:33:56.736', 'Bahrain', '', 2023, 4),
(2, '19 Mar 2023', 'Red Bull Racing Honda RBPT', '1:21:14.894', 'Saudi Arabia', '', 2023, 5),
(3, '02 Apr 2023', 'Red Bull Racing Honda RBPT', '2:32:38.371', 'Australia', '', 2023, 4),
(4, '30 Apr 2023', 'Red Bull Racing Honda RBPT', '1:32:42.436', 'Azerbaijan', '', 2023, 5),
(5, '07 May 2023', 'Red Bull Racing Honda RBPT', '1:27:38.241', 'Miami', '', 2023, 4),
(6, '28 May 2023', 'Red Bull Racing Honda RBPT', '1:48:51.980', 'Monaco', '', 2023, 4),
(7, '04 Jun 2023', 'Red Bull Racing Honda RBPT', '1:27:57.940', 'Spain', '', 2023, 4),
(8, '20 Mar 2022', 'Ferrari', '1:37:33.584', 'Bahrain', '', 2022, 10),
(9, '27 Mar 2022', 'Red Bull Racing RBPT', '1:24:19.293', 'Saudi Arabia', '', 2022, 4),
(10, '10 Apr 2022', 'Ferrari', '1:27:46.548', 'Australia', '', 2022, 10),
(11, '24 Apr 2022', 'Red Bull Racing RBPT', '1:32:07.986', 'Emilia Romagna', '', 2022, 4),
(12, '08 May 2022', 'Red Bull Racing RBPT', '1:34:24.258', 'Miami', '', 2022, 4),
(13, '22 May 2022', 'Red Bull Racing RBPT', '1:37:20.475', 'Spain', '', 2022, 4),
(14, '29 May 2022', 'Red Bull Racing RBPT', '1:56:30.265', 'Monaco', '', 2022, 5),
(15, '12 Jun 2022', 'Red Bull Racing RBPT', '1:34:05.941', 'Azerbaijan', '', 2022, 4),
(16, '19 Jun 2022', 'Red Bull Racing RBPT', '1:36:21.757', 'Canada', '', 2022, 4),
(17, '03 Jul 2022', 'Ferrari', '2:17:50.311', 'Great Britain', '', 2022, 9),
(18, '10 Jul 2022', 'Ferrari', '1:24:24.312', 'Austria', '', 2022, 10),
(19, '24 Jul 2022', 'Red Bull Racing RBPT', '1:30:02.112', 'France', '', 2022, 4),
(20, '31 Jul 2022', 'Red Bull Racing RBPT', '1:39:35.912', 'Hungary', '', 2022, 4),
(21, '28 Aug 2022', 'Red Bull Racing RBPT', '1:25:52.894', 'Belgium', '', 2022, 4),
(22, '04 Sep 2022', 'Red Bull Racing RBPT', '1:36:42.773', 'Netherlands', '', 2022, 4),
(23, '11 Sep 2022', 'Red Bull Racing RBPT', '1:20:27.511', 'Italy', '', 2022, 4),
(24, '02 Oct 2022', 'Red Bull Racing RBPT', '2:02:20.238', 'Singapore', '', 2022, 5),
(25, '09 Oct 2022', 'Red Bull Racing RBPT', '3:01:44.004', 'Japan', '', 2022, 4),
(26, '23 Oct 2022', 'Red Bull Racing RBPT', '1:42:11.687', 'United States', '', 2022, 4),
(27, '30 Oct 2022', 'Red Bull Racing RBPT', '1:38:36.729', 'Mexico', '', 2022, 4),
(28, '13 Nov 2022', 'Mercedes', '1:38:34.044', 'Brazil', '', 2022, 8),
(29, '20 Nov 2022', 'Red Bull Racing RBPT', '1:27:45.914', 'Abu Dhabi', '', 2022, 4),
(30, '28 Mar 2021', 'Mercedes', '1:32:03.897', 'Bahrain', '', 2021, 7),
(31, '18 Apr 2021', 'Red Bull Racing Honda', '2:02:34.598', 'Emilia Romagna', '', 2021, 4),
(32, '02 May 2021', 'Mercedes', '1:34:31.421', 'Portugal', '', 2021, 7),
(33, '09 May 2021', 'Mercedes', '1:33:07.680', 'Spain', '', 2021, 7),
(34, '23 May 2021', 'Red Bull Racing Honda', '1:38:56.820', 'Monaco', '', 2021, 4),
(35, '06 Jun 2021', 'Red Bull Racing Honda', '2:13:36.410', 'Azerbaijan', '', 2021, 5),
(36, '20 Jun 2021', 'Red Bull Racing Honda', '1:27:25.770', 'France', '', 2021, 4),
(37, '27 Jun 2021', 'Red Bull Racing Honda', '1:22:18.925', 'Styria', '', 2021, 4),
(38, '04 Jul 2021', 'Red Bull Racing Honda', '1:23:54.543', 'Austria', '', 2021, 4),
(39, '18 Jul 2021', 'Mercedes', '1:58:23.284', 'Great Britain', '', 2021, 7),
(40, '01 Aug 2021', 'Alpine Renault', '2:04:43.199', 'Hungary', '', 2021, 12),
(41, '29 Aug 2021', 'Red Bull Racing Honda', '0:03:27.071', 'Belgium', '', 2021, 4),
(42, '05 Sep 2021', 'Red Bull Racing Honda', '1:30:05.395', 'Netherlands', '', 2021, 4),
(43, '12 Sep 2021', 'McLaren Mercedes', '1:21:54.365', 'Italy', '', 2021, NULL),
(44, '26 Sep 2021', 'Mercedes', '1:30:41.001', 'Russia', '', 2021, 7),
(45, '10 Oct 2021', 'Mercedes', '1:31:04.103', 'Turkey', '', 2021, 17),
(46, '24 Oct 2021', 'Red Bull Racing Honda', '1:34:36.552', 'United States', '', 2021, 4),
(47, '07 Nov 2021', 'Red Bull Racing Honda', '1:38:39.086', 'Mexico', '', 2021, 4),
(48, '14 Nov 2021', 'Mercedes', '1:32:22.851', 'Brazil', '', 2021, 7),
(49, '21 Nov 2021', 'Mercedes', '1:24:28.471', 'Qatar', '', 2021, 7),
(50, '05 Dec 2021', 'Mercedes', '2:06:15.118', 'Saudi Arabia', '', 2021, 7),
(51, '12 Dec 2021', 'Red Bull Racing Honda', '1:30:17.345', 'Abu Dhabi', '', 2021, 4),
(52, '05 Jul 2020', 'Mercedes', '1:30:55.739', 'Austria', '', 2020, 17),
(53, '12 Jul 2020', 'Mercedes', '1:22:50.683', 'Styria', '', 2020, 7),
(54, '19 Jul 2020', 'Mercedes', '1:36:12.473', 'Hungary', '', 2020, 7),
(55, '02 Aug 2020', 'Mercedes', '1:28:01.283', 'Great Britain', '', 2020, 7),
(56, '09 Aug 2020', 'Red Bull Racing Honda', '1:19:41.993', '70th Anniversary', '', 2020, 4),
(57, '16 Aug 2020', 'Mercedes', '1:31:45.279', 'Spain', '', 2020, 7),
(58, '30 Aug 2020', 'Mercedes', '1:24:08.761', 'Belgium', '', 2020, 7),
(59, '06 Sep 2020', 'AlphaTauri Honda', '1:47:06.056', 'Italy', '', 2020, 13),
(60, '13 Sep 2020', 'Mercedes', '2:19:35.060', 'Tuscany', '', 2020, 7),
(61, '27 Sep 2020', 'Mercedes', '1:34:00.364', 'Russia', '', 2020, 17),
(62, '11 Oct 2020', 'Mercedes', '1:35:49.641', 'Eifel', '', 2020, 7),
(63, '25 Oct 2020', 'Mercedes', '1:29:56.828', 'Portugal', '', 2020, 7),
(64, '01 Nov 2020', 'Mercedes', '1:28:32.430', 'Emilia Romagna', '', 2020, 7),
(65, '15 Nov 2020', 'Mercedes', '1:42:19.313', 'Turkey', '', 2020, 7),
(66, '29 Nov 2020', 'Mercedes', '2:59:47.515', 'Bahrain', '', 2020, 7),
(67, '06 Dec 2020', 'Racing Point BWT Mercedes', '1:31:15.114', 'Sakhir', '', 2020, 5),
(68, '13 Dec 2020', 'Red Bull Racing Honda', '1:36:28.645', 'Abu Dhabi', '', 2020, 4),
(69, '17 Mar 2019', 'Mercedes', '1:25:27.325', 'Australia', '', 2019, 17),
(70, '31 Mar 2019', 'Mercedes', '1:34:21.295', 'Bahrain', '', 2019, 7),
(71, '14 Apr 2019', 'Mercedes', '1:32:06.350', 'China', '', 2019, 7),
(72, '28 Apr 2019', 'Mercedes', '1:31:52.942', 'Azerbaijan', '', 2019, 17),
(73, '12 May 2019', 'Mercedes', '1:35:50.443', 'Spain', '', 2019, 7),
(74, '26 May 2019', 'Mercedes', '1:43:28.437', 'Monaco', '', 2019, 7),
(75, '09 Jun 2019', 'Mercedes', '1:29:07.084', 'Canada', '', 2019, 7),
(76, '23 Jun 2019', 'Mercedes', '1:24:31.198', 'France', '', 2019, 7),
(77, '30 Jun 2019', 'Red Bull Racing Honda', '1:22:01.822', 'Austria', '', 2019, 4),
(78, '14 Jul 2019', 'Mercedes', '1:21:08.452', 'Great Britain', '', 2019, 7),
(79, '28 Jul 2019', 'Red Bull Racing Honda', '1:44:31.275', 'Germany', '', 2019, 4),
(80, '04 Aug 2019', 'Mercedes', '1:35:03.796', 'Hungary', '', 2019, 7),
(81, '01 Sep 2019', 'Ferrari', '1:23:45.710', 'Belgium', '', 2019, 10),
(82, '08 Sep 2019', 'Ferrari', '1:15:26.665', 'Italy', '', 2019, 10),
(83, '22 Sep 2019', 'Ferrari', '1:58:33.667', 'Singapore', '', 2019, NULL),
(84, '29 Sep 2019', 'Mercedes', '1:33:38.992', 'Russia', '', 2019, 7),
(85, '13 Oct 2019', 'Mercedes', '1:21:46.755', 'Japan', '', 2019, 17),
(86, '27 Oct 2019', 'Mercedes', '1:36:48.904', 'Mexico', '', 2019, 7),
(87, '03 Nov 2019', 'Mercedes', '1:33:55.653', 'United States', '', 2019, 17),
(88, '17 Nov 2019', 'Red Bull Racing Honda', '1:33:14.678', 'Brazil', '', 2019, 4),
(89, '01 Dec 2019', 'Mercedes', '1:34:05.715', 'Abu Dhabi', '', 2019, 7),
(90, '25 Mar 2018', 'Ferrari', '1:29:33.283', 'Australia', '', 2018, NULL),
(91, '08 Apr 2018', 'Ferrari', '1:32:01.940', 'Bahrain', '', 2018, NULL),
(92, '15 Apr 2018', 'Red Bull Racing TAG Heuer', '1:35:36.380', 'China', '', 2018, NULL),
(93, '29 Apr 2018', 'Mercedes', '1:43:44.291', 'Azerbaijan', '', 2018, 7),
(94, '13 May 2018', 'Mercedes', '1:35:29.972', 'Spain', '', 2018, 7),
(95, '27 May 2018', 'Red Bull Racing TAG Heuer', '1:42:54.807', 'Monaco', '', 2018, NULL),
(96, '10 Jun 2018', 'Ferrari', '1:28:31.377', 'Canada', '', 2018, NULL),
(97, '24 Jun 2018', 'Mercedes', '1:30:11.385', 'France', '', 2018, 7),
(98, '01 Jul 2018', 'Red Bull Racing TAG Heuer', '1:21:56.024', 'Austria', '', 2018, 4),
(99, '08 Jul 2018', 'Ferrari', '1:27:29.784', 'Great Britain', '', 2018, NULL),
(100, '22 Jul 2018', 'Mercedes', '1:32:29.845', 'Germany', '', 2018, 7),
(101, '29 Jul 2018', 'Mercedes', '1:37:16.427', 'Hungary', '', 2018, 7),
(102, '26 Aug 2018', 'Ferrari', '1:23:34.476', 'Belgium', '', 2018, NULL),
(103, '02 Sep 2018', 'Mercedes', '1:16:54.484', 'Italy', '', 2018, 7),
(104, '16 Sep 2018', 'Mercedes', '1:51:11.611', 'Singapore', '', 2018, 7),
(105, '30 Sep 2018', 'Mercedes', '1:27:25.181', 'Russia', '', 2018, 7),
(106, '07 Oct 2018', 'Mercedes', '1:27:17.062', 'Japan', '', 2018, 7),
(107, '21 Oct 2018', 'Ferrari', '1:34:18.643', 'United States', '', 2018, NULL),
(108, '28 Oct 2018', 'Red Bull Racing TAG Heuer', '1:38:28.851', 'Mexico', '', 2018, 4),
(109, '11 Nov 2018', 'Mercedes', '1:27:09.066', 'Brazil', '', 2018, 7),
(110, '25 Nov 2018', 'Mercedes', '1:39:40.382', 'Abu Dhabi', '', 2018, 7),
(111, '26 Mar 2017', 'Ferrari', '1:24:11.672', 'Australia', '', 2017, NULL),
(112, '09 Apr 2017', 'Mercedes', '1:37:36.158', 'China', '', 2017, 7),
(113, '16 Apr 2017', 'Ferrari', '1:33:53.374', 'Bahrain', '', 2017, NULL),
(114, '30 Apr 2017', 'Mercedes', '1:28:08.743', 'Russia', '', 2017, NULL),
(115, '14 May 2017', 'Mercedes', '1:35:56.497', 'Spain', '', 2017, 7),
(116, '28 May 2017', 'Ferrari', '1:44:44.340', 'Monaco', '', 2017, NULL),
(117, '11 Jun 2017', 'Mercedes', '1:33:05.154', 'Canada', '', 2017, 7),
(118, '25 Jun 2017', 'Red Bull Racing TAG Heuer', '2:03:55.573', 'Azerbaijan', '', 2017, NULL),
(119, '09 Jul 2017', 'Mercedes', '1:21:48.523', 'Austria', '', 2017, NULL),
(120, '16 Jul 2017', 'Mercedes', '1:21:27.430', 'Great Britain', '', 2017, 7),
(121, '30 Jul 2017', 'Ferrari', '1:39:46.713', 'Hungary', '', 2017, NULL),
(122, '27 Aug 2017', 'Mercedes', '1:24:42.820', 'Belgium', '', 2017, 7),
(123, '03 Sep 2017', 'Mercedes', '1:15:32.312', 'Italy', '', 2017, 7),
(124, '17 Sep 2017', 'Mercedes', '2:03:23.544', 'Singapore', '', 2017, 7),
(125, '01 Oct 2017', 'Red Bull Racing TAG Heuer', '1:30:01.290', 'Malaysia', '', 2017, 4),
(126, '08 Oct 2017', 'Mercedes', '1:27:31.194', 'Japan', '', 2017, 7),
(127, '22 Oct 2017', 'Mercedes', '1:33:50.991', 'United States', '', 2017, 7),
(128, '29 Oct 2017', 'Red Bull Racing TAG Heuer', '1:36:26.552', 'Mexico', '', 2017, 4),
(129, '12 Nov 2017', 'Ferrari', '1:31:26.262', 'Brazil', '', 2017, NULL),
(130, '26 Nov 2017', 'Mercedes', '1:34:14.062', 'Abu Dhabi', '', 2017, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `result_team`
--

CREATE TABLE `result_team` (
  `id` int(11) NOT NULL,
  `pos` int(11) NOT NULL,
  `point` int(11) NOT NULL,
  `year` int(11) NOT NULL,
  `teamId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `result_team`
--

INSERT INTO `result_team` (`id`, `pos`, `point`, `year`, `teamId`) VALUES
(1, 1, 287, 2023, 2),
(2, 2, 152, 2023, 3),
(3, 3, 134, 2023, 4),
(4, 4, 100, 2023, 5),
(5, 5, 40, 2023, 6),
(6, 6, 17, 2023, 7),
(7, 7, 8, 2023, 8),
(8, 8, 8, 2023, 9),
(9, 9, 2, 2023, 6),
(10, 10, 1, 2023, 11),
(11, 1, 759, 2022, 2),
(12, 2, 554, 2022, 5),
(13, 3, 515, 2022, 3),
(14, 4, 173, 2022, 6),
(15, 5, 159, 2022, 7),
(16, 6, 55, 2022, 9),
(17, 7, 55, 2022, 4),
(18, 8, 37, 2022, 8),
(19, 9, 35, 2022, 6),
(20, 10, 8, 2022, 11),
(21, 1, 613, 2021, 3),
(22, 2, 585, 2021, 2),
(23, 3, 323, 2021, 5),
(24, 4, 275, 2021, 7),
(25, 5, 155, 2021, 6),
(26, 6, 142, 2021, 6),
(27, 7, 77, 2021, 4),
(28, 8, 23, 2021, 11),
(29, 9, 13, 2021, 9),
(30, 10, 0, 2021, 8),
(31, 1, 573, 2020, 3),
(32, 2, 319, 2020, 2),
(33, 3, 202, 2020, 7),
(34, 4, 195, 2020, NULL),
(35, 5, 181, 2020, NULL),
(36, 6, 131, 2020, 5),
(37, 7, 107, 2020, 6),
(38, 8, 8, 2020, 9),
(39, 9, 3, 2020, 8),
(40, 10, 0, 2020, 11),
(41, 1, 739, 2019, 3),
(42, 2, 504, 2019, 5),
(43, 3, 417, 2019, 2),
(44, 4, 145, 2019, 7),
(45, 5, 91, 2019, NULL),
(46, 6, 85, 2019, NULL),
(47, 7, 73, 2019, NULL),
(48, 8, 57, 2019, 9),
(49, 9, 28, 2019, 8),
(50, 10, 1, 2019, 11),
(51, 1, 655, 2018, 3),
(52, 2, 571, 2018, 5),
(53, 3, 419, 2018, 2),
(54, 4, 122, 2018, NULL),
(55, 5, 93, 2018, 8),
(56, 6, 62, 2018, 7),
(57, 7, 52, 2018, NULL),
(58, 8, 48, 2018, NULL),
(59, 9, 33, 2018, NULL),
(60, 10, 7, 2018, 11),
(61, 0, 0, 2018, NULL),
(62, 1, 668, 2017, 3),
(63, 2, 522, 2017, 5),
(64, 3, 368, 2017, 2),
(65, 4, 187, 2017, NULL),
(66, 5, 83, 2017, 11),
(67, 6, 57, 2017, NULL),
(68, 7, 53, 2017, NULL),
(69, 8, 47, 2017, 8),
(70, 9, 30, 2017, 7),
(71, 10, 5, 2017, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `schedule`
--

CREATE TABLE `schedule` (
  `id` int(11) NOT NULL,
  `startdate` varchar(255) NOT NULL,
  `enddate` varchar(255) NOT NULL,
  `place` varchar(255) NOT NULL,
  `year` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `schedule`
--

INSERT INTO `schedule` (`id`, `startdate`, `enddate`, `place`, `year`) VALUES
(1, '24 Mar', '26 Mar', 'Australia ', 2017),
(2, '07 Apr', '09 Apr', 'China ', 2017),
(3, '14 Apr', '16 Apr', 'Bahrain ', 2017),
(4, '28 Apr', '30 Apr', 'Russia ', 2017),
(5, '12 May', '14 May', 'Spain ', 2017),
(6, '25 May', '28 May', 'Monaco ', 2017),
(7, '09 Jun', '11 Jun', 'Canada ', 2017),
(8, '23 Jun', '25 Jun', 'Azerbaijan ', 2017),
(9, '07 Jul', '09 Jul', 'Austria ', 2017),
(10, '14 Jul', '16 Jul', 'Great Britain ', 2017),
(11, '28 Jul', '30 Jul', 'Hungary ', 2017),
(12, '25 Aug', '27 Aug', 'Belgium ', 2017),
(13, '01 Sep', '03 Sep', 'Italy ', 2017),
(14, '15 Sep', '17 Sep', 'Singapore ', 2017),
(15, '29 Sep', '01 Oct', 'Malaysia ', 2017),
(16, '06 Oct', '08 Oct', 'Japan ', 2017),
(17, '20 Oct', '22 Oct', 'United States ', 2017),
(18, '27 Oct', '29 Oct', 'Mexico ', 2017),
(19, '10 Nov', '12 Nov', 'Brazil ', 2017),
(20, '24 Nov', '26 Nov', 'United Arab Emirates ', 2017),
(21, '23 Mar', '25 Mar', 'Australia ', 2018),
(22, '06 Apr', '08 Apr', 'Bahrain ', 2018),
(23, '13 Apr', '15 Apr', 'China ', 2018),
(24, '27 Apr', '29 Apr', 'Azerbaijan ', 2018),
(25, '11 May', '13 May', 'Spain ', 2018),
(26, '24 May', '27 May', 'Monaco ', 2018),
(27, '08 Jun', '10 Jun', 'Canada ', 2018),
(28, '22 Jun', '24 Jun', 'France ', 2018),
(29, '29 Jun', '01 Jul', 'Austria ', 2018),
(30, '06 Jul', '08 Jul', 'Great Britain ', 2018),
(31, '20 Jul', '22 Jul', 'Germany ', 2018),
(32, '27 Jul', '29 Jul', 'Hungary ', 2018),
(33, '24 Aug', '26 Aug', 'Belgium ', 2018),
(34, '31 Aug', '02 Sep', 'Italy ', 2018),
(35, '14 Sep', '16 Sep', 'Singapore ', 2018),
(36, '28 Sep', '30 Sep', 'Russia ', 2018),
(37, '05 Oct', '07 Oct', 'Japan ', 2018),
(38, '19 Oct', '21 Oct', 'United States ', 2018),
(39, '26 Oct', '28 Oct', 'Mexico ', 2018),
(40, '09 Nov', '11 Nov', 'Brazil ', 2018),
(41, '23 Nov', '25 Nov', 'United Arab Emirates ', 2018),
(42, '15 Mar', '17 Mar', 'Australia ', 2019),
(43, '29 Mar', '31 Mar', 'Bahrain ', 2019),
(44, '12 Apr', '14 Apr', 'China ', 2019),
(45, '26 Apr', '28 Apr', 'Azerbaijan ', 2019),
(46, '10 May', '12 May', 'Spain ', 2019),
(47, '23 May', '26 May', 'Monaco ', 2019),
(48, '07 Jun', '09 Jun', 'Canada ', 2019),
(49, '21 Jun', '23 Jun', 'France ', 2019),
(50, '28 Jun', '30 Jun', 'Austria ', 2019),
(51, '12 Jul', '14 Jul', 'Great Britain ', 2019),
(52, '26 Jul', '28 Jul', 'Germany ', 2019),
(53, '02 Aug', '04 Aug', 'Hungary ', 2019),
(54, '30 Aug', '01 Sep', 'Belgium ', 2019),
(55, '06 Sep', '08 Sep', 'Italy ', 2019),
(56, '20 Sep', '22 Sep', 'Singapore ', 2019),
(57, '27 Sep', '29 Sep', 'Russia ', 2019),
(58, '11 Oct', '13 Oct', 'Japan ', 2019),
(59, '25 Oct', '27 Oct', 'Mexico ', 2019),
(60, '01 Nov', '03 Nov', 'United States ', 2019),
(61, '15 Nov', '17 Nov', 'Brazil ', 2019),
(62, '29 Nov', '01 Dec', 'Abu Dhabi ', 2019),
(63, '03 Jul', '05 Jul', 'Austria ', 2020),
(64, '10 Jul', '12 Jul', 'Austria ', 2020),
(65, '17 Jul', '19 Jul', 'Hungary ', 2020),
(66, '31 Jul', '02 Aug', 'Great Britain ', 2020),
(67, '07 Aug', '09 Aug', 'Great Britain ', 2020),
(68, '14 Aug', '16 Aug', 'Spain ', 2020),
(69, '28 Aug', '30 Aug', 'Belgium ', 2020),
(70, '04 Sep', '06 Sep', 'Italy ', 2020),
(71, '11 Sep', '13 Sep', 'Italy ', 2020),
(72, '25 Sep', '27 Sep', 'Russia ', 2020),
(73, '09 Oct', '11 Oct', 'Germany ', 2020),
(74, '23 Oct', '25 Oct', 'Portugal ', 2020),
(75, '31 Oct', '01 Nov', 'Italy ', 2020),
(76, '13 Nov', '15 Nov', 'Turkey ', 2020),
(77, '27 Nov', '29 Nov', 'Bahrain ', 2020),
(78, '04 Dec', '06 Dec', 'Bahrain ', 2020),
(79, '11 Dec', '13 Dec', 'Abu Dhabi ', 2020),
(80, '26 Mar', '28 Mar', 'Bahrain ', 2021),
(81, '16 Apr', '18 Apr', 'Italy ', 2021),
(82, '30 Apr', '02 May', 'Portugal ', 2021),
(83, '07 May', '09 May', 'Spain ', 2021),
(84, '20 May', '23 May', 'Monaco ', 2021),
(85, '04 Jun', '06 Jun', 'Azerbaijan ', 2021),
(86, '18 Jun', '20 Jun', 'France ', 2021),
(87, '25 Jun', '27 Jun', 'Austria ', 2021),
(88, '02 Jul', '04 Jul', 'Austria ', 2021),
(89, '16 Jul', '18 Jul', 'Great Britain ', 2021),
(90, '30 Jul', '01 Aug', 'Hungary ', 2021),
(91, '27 Aug', '29 Aug', 'Belgium ', 2021),
(92, '03 Sep', '05 Sep', 'Netherlands ', 2021),
(93, '10 Sep', '12 Sep', 'Italy ', 2021),
(94, '24 Sep', '26 Sep', 'Russia ', 2021),
(95, '08 Oct', '10 Oct', 'Turkey ', 2021),
(96, '22 Oct', '24 Oct', 'United States ', 2021),
(97, '05 Nov', '07 Nov', 'Mexico ', 2021),
(98, '12 Nov', '14 Nov', 'Brazil ', 2021),
(99, '19 Nov', '21 Nov', 'Qatar ', 2021),
(100, '03 Dec', '05 Dec', 'Saudi Arabia ', 2021),
(101, '10 Dec', '12 Dec', 'Abu Dhabi ', 2021),
(102, '18 Mar', '20 Mar', 'Bahrain ', 2022),
(103, '25 Mar', '27 Mar', 'Saudi Arabia ', 2022),
(104, '08 Apr', '10 Apr', 'Australia ', 2022),
(105, '22 Apr', '24 Apr', 'Italy ', 2022),
(106, '06 May', '08 May', 'United States ', 2022),
(107, '20 May', '22 May', 'Spain ', 2022),
(108, '27 May', '29 May', 'Monaco ', 2022),
(109, '10 Jun', '12 Jun', 'Azerbaijan ', 2022),
(110, '17 Jun', '19 Jun', 'Canada ', 2022),
(111, '01 Jul', '03 Jul', 'Great Britain ', 2022),
(112, '08 Jul', '10 Jul', 'Austria ', 2022),
(113, '22 Jul', '24 Jul', 'France ', 2022),
(114, '29 Jul', '31 Jul', 'Hungary ', 2022),
(115, '26 Aug', '28 Aug', 'Belgium ', 2022),
(116, '02 Sep', '04 Sep', 'Netherlands ', 2022),
(117, '09 Sep', '11 Sep', 'Italy ', 2022),
(118, '30 Sep', '02 Oct', 'Singapore ', 2022),
(119, '07 Oct', '09 Oct', 'Japan ', 2022),
(120, '21 Oct', '23 Oct', 'United States ', 2022),
(121, '28 Oct', '30 Oct', 'Mexico ', 2022),
(122, '11 Nov', '13 Nov', 'Brazil ', 2022),
(123, '18 Nov', '20 Nov', 'Abu Dhabi ', 2022),
(124, '03 Mar', '05 Mar', 'Bahrain ', 2023),
(125, '17 Mar', '19 Mar', 'Saudi Arabia ', 2023),
(126, '31 Mar', '02 Apr', 'Australia ', 2023),
(127, '28 Apr', '30 Apr', 'Azerbaijan ', 2023),
(128, '05 May', '07 May', 'United States ', 2023),
(129, '19 May', '21 May', 'Italy ', 2023),
(130, '26 May', '28 May', 'Monaco ', 2023),
(131, '02 Jun', '04 Jun', 'Spain ', 2023),
(132, '16 Jun', '18 Jun', 'Canada ', 2023),
(133, '30 Jun', '02 Jul', 'Austria ', 2023),
(134, '07 Jul', '09 Jul', 'Great Britain ', 2023),
(135, '21 Jul', '23 Jul', 'Hungary ', 2023),
(136, '28 Jul', '30 Jul', 'Belgium ', 2023),
(137, '25 Aug', '27 Aug', 'Netherlands ', 2023),
(138, '01 Sep', '03 Sep', 'Italy ', 2023),
(139, '15 Sep', '17 Sep', 'Singapore ', 2023),
(140, '22 Sep', '24 Sep', 'Japan ', 2023),
(141, '06 Oct', '08 Oct', 'Qatar ', 2023),
(142, '20 Oct', '22 Oct', 'United States ', 2023),
(143, '27 Oct', '29 Oct', 'Mexico ', 2023),
(144, '03 Nov', '05 Nov', 'Brazil ', 2023),
(145, '16 Nov', '18 Nov', 'United States ', 2023),
(146, '24 Nov', '26 Nov', 'Abu Dhabi ', 2023);

-- --------------------------------------------------------

--
-- Table structure for table `schedule_drivers_driver`
--

CREATE TABLE `schedule_drivers_driver` (
  `scheduleId` int(11) NOT NULL,
  `driverId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `schedule_drivers_driver`
--

INSERT INTO `schedule_drivers_driver` (`scheduleId`, `driverId`) VALUES
(1, 7),
(1, 17),
(2, 4),
(2, 7),
(3, 7),
(3, 17),
(4, 17),
(5, 7),
(7, 7),
(7, 17),
(8, 11),
(8, 17),
(9, 17),
(10, 7),
(10, 17),
(11, 17),
(12, 7),
(13, 7),
(13, 17),
(14, 7),
(14, 17),
(15, 4),
(15, 7),
(16, 4),
(16, 7),
(17, 7),
(18, 4),
(18, 17),
(19, 17),
(20, 7),
(20, 17),
(21, 7),
(22, 7),
(22, 17),
(23, 17),
(24, 5),
(24, 7),
(25, 4),
(25, 7),
(25, 17),
(26, 7),
(27, 4),
(27, 17),
(28, 4),
(28, 7),
(29, 4),
(30, 7),
(31, 7),
(31, 17),
(32, 7),
(33, 4),
(33, 7),
(34, 7),
(34, 17),
(35, 4),
(35, 7),
(36, 7),
(36, 17),
(37, 4),
(37, 7),
(37, 17),
(38, 4),
(38, 7),
(39, 4),
(40, 4),
(40, 7),
(41, 4),
(41, 7),
(42, 4),
(42, 7),
(42, 17),
(43, 7),
(43, 10),
(43, 17),
(44, 7),
(44, 17),
(45, 7),
(45, 17),
(46, 4),
(46, 7),
(46, 17),
(47, 7),
(47, 17),
(48, 7),
(48, 10),
(49, 7),
(49, 10),
(49, 17),
(50, 4),
(50, 10),
(50, 17),
(51, 7),
(51, 10),
(51, 17),
(52, 4),
(53, 4),
(53, 7),
(54, 7),
(54, 10),
(54, 17),
(55, 7),
(55, 10),
(55, 17),
(56, 4),
(56, 10),
(57, 7),
(57, 10),
(57, 17),
(58, 7),
(58, 17),
(59, 7),
(59, 17),
(60, 4),
(60, 7),
(60, 17),
(61, 4),
(61, 9),
(61, 13),
(62, 4),
(62, 7),
(62, 10),
(63, 10),
(63, 14),
(63, 17),
(64, 4),
(64, 7),
(64, 17),
(65, 4),
(65, 7),
(65, 17),
(66, 4),
(66, 7),
(66, 10),
(67, 4),
(67, 7),
(67, 17),
(68, 4),
(68, 7),
(68, 17),
(69, 4),
(69, 7),
(69, 17),
(70, 9),
(70, 11),
(70, 13),
(71, 7),
(71, 17),
(71, 21),
(72, 4),
(72, 7),
(72, 17),
(73, 4),
(73, 7),
(74, 4),
(74, 7),
(74, 17),
(75, 7),
(75, 17),
(76, 5),
(76, 7),
(77, 4),
(77, 7),
(77, 21),
(78, 5),
(78, 11),
(78, 12),
(79, 4),
(79, 7),
(79, 17),
(80, 4),
(80, 7),
(80, 17),
(81, 4),
(81, 7),
(81, 14),
(82, 4),
(82, 7),
(82, 17),
(83, 4),
(83, 7),
(83, 17),
(84, 4),
(84, 9),
(84, 14),
(85, 5),
(85, 13),
(86, 4),
(86, 5),
(86, 7),
(87, 4),
(87, 7),
(87, 17),
(88, 4),
(88, 14),
(88, 17),
(89, 7),
(89, 10),
(89, 17),
(90, 7),
(90, 9),
(90, 12),
(91, 4),
(91, 7),
(91, 8),
(92, 4),
(92, 7),
(92, 17),
(93, 14),
(93, 17),
(94, 4),
(94, 7),
(94, 9),
(95, 4),
(95, 5),
(95, 17),
(96, 4),
(96, 5),
(96, 7),
(97, 4),
(97, 5),
(97, 7),
(98, 4),
(98, 7),
(98, 17),
(99, 4),
(99, 6),
(99, 7),
(100, 4),
(100, 7),
(100, 17),
(101, 4),
(101, 7),
(101, 9),
(102, 7),
(102, 9),
(102, 10),
(103, 4),
(103, 9),
(103, 10),
(104, 5),
(104, 8),
(104, 10),
(105, 4),
(105, 5),
(105, 14),
(106, 4),
(106, 9),
(106, 10),
(107, 4),
(107, 5),
(107, 8),
(108, 4),
(108, 5),
(108, 9),
(109, 4),
(109, 5),
(109, 8),
(110, 4),
(110, 7),
(110, 9),
(111, 5),
(111, 7),
(111, 9),
(112, 4),
(112, 7),
(112, 10),
(113, 4),
(113, 7),
(113, 8),
(114, 4),
(114, 7),
(114, 8),
(115, 4),
(115, 5),
(115, 9),
(116, 4),
(116, 8),
(116, 10),
(117, 4),
(117, 8),
(117, 10),
(118, 5),
(118, 9),
(118, 10),
(119, 4),
(119, 5),
(119, 10),
(120, 4),
(120, 7),
(120, 10),
(121, 4),
(121, 5),
(121, 7),
(122, 7),
(122, 8),
(122, 9),
(123, 4),
(123, 5),
(123, 10),
(124, 4),
(124, 5),
(124, 6),
(125, 4),
(125, 5),
(125, 6),
(126, 4),
(126, 6),
(126, 7),
(127, 4),
(127, 5),
(127, 10),
(128, 4),
(128, 5),
(128, 6),
(130, 4),
(130, 6),
(130, 12),
(131, 4),
(131, 7),
(131, 8);

-- --------------------------------------------------------

--
-- Table structure for table `team`
--

CREATE TABLE `team` (
  `id` int(11) NOT NULL,
  `fullname` varchar(255) NOT NULL,
  `team_chief` varchar(255) NOT NULL,
  `champion` int(11) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `team`
--

INSERT INTO `team` (`id`, `fullname`, `team_chief`, `champion`, `name`) VALUES
(1, '', '', 0, 'N/A'),
(2, 'Oracle Red Bull Racing', 'Christian Horner', 5, 'Red Bull Racing'),
(3, 'Mercedes-AMG PETRONAS F1 Team', 'Toto Wolff', 8, 'Mercedes'),
(4, 'Aston Martin Aramco Cognizant F1 Team', 'Mike Krack', 0, 'Aston Martin'),
(5, 'Scuderia Ferrari', 'Frédéric Vasseur', 16, 'Ferrari'),
(6, 'BWT Alpine F1 Team', 'Otmar Szafnauer', 2, 'Alpine'),
(7, 'McLaren F1 Team', 'Andrea Stella', 8, 'McLaren'),
(8, 'MoneyGram Haas F1 Team', 'Guenther Steiner', 0, 'Haas F1 Team'),
(9, 'Alfa Romeo F1 Team Stake', 'Alessandro Alunni Bravi', 0, 'Alfa Romeo'),
(10, 'Scuderia AlphaTauri', 'Franz Tost', 0, 'AlphaTauri'),
(11, 'Williams Racing', 'James Vowles', 9, 'Williams');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `driver`
--
ALTER TABLE `driver`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_8c925de44f98a5e89c2f5727947` (`teamId`);

--
-- Indexes for table `driver_schedules_schedule`
--
ALTER TABLE `driver_schedules_schedule`
  ADD PRIMARY KEY (`driverId`,`scheduleId`),
  ADD KEY `IDX_d35bd3fc0ddd2ff47ea2855f05` (`driverId`),
  ADD KEY `IDX_35e90fd411a26b52ea26df6fea` (`scheduleId`);

--
-- Indexes for table `result_dhl`
--
ALTER TABLE `result_dhl`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_d236aa3d9d183104695be0fa592` (`driverId`);

--
-- Indexes for table `result_driver`
--
ALTER TABLE `result_driver`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_507db3539a38c6de2b3d7d551bb` (`driverDataId`);

--
-- Indexes for table `result_race`
--
ALTER TABLE `result_race`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_f473718cbaa7dd127fe348dee76` (`driverDataId`);

--
-- Indexes for table `result_team`
--
ALTER TABLE `result_team`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_8fae455608a728c59b15021a6b7` (`teamId`);

--
-- Indexes for table `schedule`
--
ALTER TABLE `schedule`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `schedule_drivers_driver`
--
ALTER TABLE `schedule_drivers_driver`
  ADD PRIMARY KEY (`scheduleId`,`driverId`),
  ADD KEY `IDX_2ab409facac33f4fced32b57bf` (`scheduleId`),
  ADD KEY `IDX_0a3c8c75aa565571144ec8b84a` (`driverId`);

--
-- Indexes for table `team`
--
ALTER TABLE `team`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `driver`
--
ALTER TABLE `driver`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `result_dhl`
--
ALTER TABLE `result_dhl`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=122;

--
-- AUTO_INCREMENT for table `result_driver`
--
ALTER TABLE `result_driver`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `result_race`
--
ALTER TABLE `result_race`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=131;

--
-- AUTO_INCREMENT for table `result_team`
--
ALTER TABLE `result_team`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=72;

--
-- AUTO_INCREMENT for table `schedule`
--
ALTER TABLE `schedule`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=147;

--
-- AUTO_INCREMENT for table `team`
--
ALTER TABLE `team`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `driver`
--
ALTER TABLE `driver`
  ADD CONSTRAINT `FK_8c925de44f98a5e89c2f5727947` FOREIGN KEY (`teamId`) REFERENCES `team` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `driver_schedules_schedule`
--
ALTER TABLE `driver_schedules_schedule`
  ADD CONSTRAINT `FK_35e90fd411a26b52ea26df6fea8` FOREIGN KEY (`scheduleId`) REFERENCES `schedule` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_d35bd3fc0ddd2ff47ea2855f05f` FOREIGN KEY (`driverId`) REFERENCES `driver` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `result_dhl`
--
ALTER TABLE `result_dhl`
  ADD CONSTRAINT `FK_d236aa3d9d183104695be0fa592` FOREIGN KEY (`driverId`) REFERENCES `driver` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `result_driver`
--
ALTER TABLE `result_driver`
  ADD CONSTRAINT `FK_507db3539a38c6de2b3d7d551bb` FOREIGN KEY (`driverDataId`) REFERENCES `driver` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `result_race`
--
ALTER TABLE `result_race`
  ADD CONSTRAINT `FK_f473718cbaa7dd127fe348dee76` FOREIGN KEY (`driverDataId`) REFERENCES `driver` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `result_team`
--
ALTER TABLE `result_team`
  ADD CONSTRAINT `FK_8fae455608a728c59b15021a6b7` FOREIGN KEY (`teamId`) REFERENCES `team` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `schedule_drivers_driver`
--
ALTER TABLE `schedule_drivers_driver`
  ADD CONSTRAINT `FK_0a3c8c75aa565571144ec8b84af` FOREIGN KEY (`driverId`) REFERENCES `driver` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_2ab409facac33f4fced32b57bfc` FOREIGN KEY (`scheduleId`) REFERENCES `schedule` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
