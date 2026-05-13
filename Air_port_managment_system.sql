-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 22, 2023 at 09:09 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `final`
--

-- --------------------------------------------------------

--
-- Stand-in structure for view `advertisment`
-- (See below for the actual view)
--
CREATE TABLE `advertisment` (
`nationality` varchar(25)
,`Fname` varchar(15)
,`phoneNumber` char(10)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `big_plane`
-- (See below for the actual view)
--
CREATE TABLE `big_plane` (
`plane_name` varchar(25)
,`seat_capicity` int(11)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `cheap_flights`
-- (See below for the actual view)
--
CREATE TABLE `cheap_flights` (
`airline` varchar(20)
,`ticket_price` decimal(7,4)
);

-- --------------------------------------------------------

--
-- Table structure for table `department`
--

CREATE TABLE `department` (
  `department_num` int(11) NOT NULL,
  `location` varchar(25) NOT NULL,
  `manager_id` int(11) NOT NULL,
  `budget` decimal(10,5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `department`
--

INSERT INTO `department` (`department_num`, `location`, `manager_id`, `budget`) VALUES
(1, 'Terminal', 2110194, 50000.75000),
(2, 'check in counter', 2110194, 40000.75000),
(3, 'security points', 2110194, 65000.75000),
(4, 'baggage claim', 2110194, 80000.75000),
(5, 'resturents', 2110194, 12000.75000);

-- --------------------------------------------------------

--
-- Stand-in structure for view `department_salary`
-- (See below for the actual view)
--
CREATE TABLE `department_salary` (
`fname` varchar(15)
,`mname` varchar(15)
,`lname` varchar(15)
,`salary` decimal(6,2)
,`department_num` int(11)
);

-- --------------------------------------------------------

--
-- Table structure for table `employee`
--

CREATE TABLE `employee` (
  `id` int(11) NOT NULL,
  `fname` varchar(15) NOT NULL,
  `mname` varchar(15) NOT NULL,
  `lname` varchar(15) NOT NULL,
  `salary` decimal(6,2) NOT NULL,
  `gender` char(1) NOT NULL CHECK (`gender` in ('M','F')),
  `department_num` int(11) NOT NULL,
  `manager_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `employee`
--

INSERT INTO `employee` (`id`, `fname`, `mname`, `lname`, `salary`, `gender`, `department_num`, `manager_id`) VALUES
(1432633, 'shahed', 'moatez', 'moati', 9999.99, 'F', 3, 2110194),
(2110194, 'baha', 'mohammad', 'rawashdeh', 6000.00, 'M', 1, NULL),
(2334587, 'saleh', 'sameeh', 'rawashdeh', 4500.00, 'M', 2, 2110194),
(5127652, 'raghad', 'rbhi', 'alomari', 3500.00, 'F', 4, 2110194),
(5214256, 'zaid', 'hussein', 'kurdi', 7500.00, 'M', 4, 2110194),
(7473214, 'yazan', 'khldoun', 'battah', 8500.00, 'M', 2, 2110194),
(8974326, 'hussam', 'mohammad', 'almuani', 4800.00, 'M', 5, 2110194);

-- --------------------------------------------------------

--
-- Table structure for table `flight`
--

CREATE TABLE `flight` (
  `flight_num` int(11) NOT NULL,
  `airline` varchar(20) NOT NULL,
  `gate` int(11) NOT NULL,
  `ticket_price` decimal(7,4) NOT NULL,
  `plane_ID` int(11) NOT NULL,
  `employee_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `flight`
--

INSERT INTO `flight` (`flight_num`, `airline`, `gate`, `ticket_price`, `plane_ID`, `employee_ID`) VALUES
(1, 'royal jordanian', 6, 250.7500, 101, 1432633),
(2, 'etihad airways', 9, 199.9999, 102, 5127652),
(3, 'jordan aviation', 2, 220.9999, 103, 8974326),
(4, 'wizz air', 12, 150.7900, 105, 1432633),
(5, 'fly emirats', 7, 299.9999, 104, 2334587),
(6, 'fly dubai', 16, 200.0000, 103, 1432633),
(7, 'pegusess', 18, 232.0000, 104, 5127652);

-- --------------------------------------------------------

--
-- Table structure for table `passenger`
--

CREATE TABLE `passenger` (
  `passport_ID` int(11) NOT NULL,
  `Fname` varchar(15) NOT NULL,
  `Mname` varchar(15) NOT NULL,
  `Lname` varchar(15) NOT NULL,
  `nationality` varchar(25) NOT NULL,
  `date_of_birth` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `passenger`
--

INSERT INTO `passenger` (`passport_ID`, `Fname`, `Mname`, `Lname`, `nationality`, `date_of_birth`) VALUES
(123456789, 'mohammad', 'baha', 'rawashdeh', 'jordan', '2003-07-19'),
(234567890, 'hamed', 'issam', 'aldaheri', 'UAE', '2002-11-18'),
(456789123, 'jamil', 'hitham', 'shqirat', 'jordan', '2004-01-05'),
(789123456, 'leo', 'andres', 'messi', 'argentina', '1987-06-24'),
(987654321, 'aon', 'maan', 'harasis', 'jordan', '2003-02-22');

-- --------------------------------------------------------

--
-- Table structure for table `passenger_flight`
--

CREATE TABLE `passenger_flight` (
  `passenger_passportID` int(11) NOT NULL,
  `flight_flightNum` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `passenger_flight`
--

INSERT INTO `passenger_flight` (`passenger_passportID`, `flight_flightNum`) VALUES
(123456789, 1),
(123456789, 2),
(123456789, 5),
(456789123, 2),
(456789123, 4),
(789123456, 5),
(987654321, 1),
(987654321, 3);

-- --------------------------------------------------------

--
-- Table structure for table `passenger_phonenumber`
--

CREATE TABLE `passenger_phonenumber` (
  `passenger_passportID` int(11) NOT NULL,
  `phoneNumber` char(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `passenger_phonenumber`
--

INSERT INTO `passenger_phonenumber` (`passenger_passportID`, `phoneNumber`) VALUES
(123456789, '0772502937'),
(123456789, '0790190922'),
(234567890, '0501681633'),
(456789123, '0775985538'),
(789123456, '0795545541'),
(987654321, '0561246430'),
(987654321, '0772964336');

-- --------------------------------------------------------

--
-- Table structure for table `plane`
--

CREATE TABLE `plane` (
  `plane_ID` int(11) NOT NULL,
  `plane_name` varchar(25) NOT NULL,
  `seat_capicity` int(11) NOT NULL,
  `fuel_capicity` decimal(6,4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `plane`
--

INSERT INTO `plane` (`plane_ID`, `plane_name`, `seat_capicity`, `fuel_capicity`) VALUES
(101, 'Boeing 737', 180, 25.0000),
(102, 'Airbus A320', 200, 30.5000),
(103, 'Embraer E175', 80, 12.2500),
(104, 'Boeing 777', 350, 60.7500),
(105, 'Airbus A350', 400, 70.0000);

-- --------------------------------------------------------

--
-- Structure for view `advertisment`
--
DROP TABLE IF EXISTS `advertisment`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `advertisment`  AS SELECT `passenger`.`nationality` AS `nationality`, `passenger`.`Fname` AS `Fname`, `passenger_phonenumber`.`phoneNumber` AS `phoneNumber` FROM (`passenger` join `passenger_phonenumber` on(`passenger`.`passport_ID` = `passenger_phonenumber`.`passenger_passportID`)) WHERE `passenger`.`nationality` = 'jordan' ;

-- --------------------------------------------------------

--
-- Structure for view `big_plane`
--
DROP TABLE IF EXISTS `big_plane`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `big_plane`  AS SELECT `plane`.`plane_name` AS `plane_name`, `plane`.`seat_capicity` AS `seat_capicity` FROM `plane` WHERE `plane`.`seat_capicity` >= 130 ;

-- --------------------------------------------------------

--
-- Structure for view `cheap_flights`
--
DROP TABLE IF EXISTS `cheap_flights`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `cheap_flights`  AS SELECT `flight`.`airline` AS `airline`, `flight`.`ticket_price` AS `ticket_price` FROM `flight` WHERE `flight`.`ticket_price` <= 200 ;

-- --------------------------------------------------------

--
-- Structure for view `department_salary`
--
DROP TABLE IF EXISTS `department_salary`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `department_salary`  AS SELECT `employee`.`fname` AS `fname`, `employee`.`mname` AS `mname`, `employee`.`lname` AS `lname`, `employee`.`salary` AS `salary`, `department`.`department_num` AS `department_num` FROM (`employee` join `department` on(`employee`.`department_num` = `department`.`department_num`)) ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `department`
--
ALTER TABLE `department`
  ADD PRIMARY KEY (`department_num`);

--
-- Indexes for table `employee`
--
ALTER TABLE `employee`
  ADD PRIMARY KEY (`id`),
  ADD KEY `employee_FK1` (`department_num`),
  ADD KEY `employee_FK2` (`manager_id`);

--
-- Indexes for table `flight`
--
ALTER TABLE `flight`
  ADD PRIMARY KEY (`flight_num`),
  ADD KEY `‘flight_FK1’` (`plane_ID`),
  ADD KEY `‘flight_FK2’` (`employee_ID`);

--
-- Indexes for table `passenger`
--
ALTER TABLE `passenger`
  ADD PRIMARY KEY (`passport_ID`);

--
-- Indexes for table `passenger_flight`
--
ALTER TABLE `passenger_flight`
  ADD PRIMARY KEY (`passenger_passportID`,`flight_flightNum`),
  ADD KEY `‘passenger_flight_FK2’` (`flight_flightNum`);

--
-- Indexes for table `passenger_phonenumber`
--
ALTER TABLE `passenger_phonenumber`
  ADD PRIMARY KEY (`passenger_passportID`,`phoneNumber`);

--
-- Indexes for table `plane`
--
ALTER TABLE `plane`
  ADD PRIMARY KEY (`plane_ID`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `employee`
--
ALTER TABLE `employee`
  ADD CONSTRAINT `employee_FK1` FOREIGN KEY (`department_num`) REFERENCES `department` (`department_num`),
  ADD CONSTRAINT `employee_FK2` FOREIGN KEY (`manager_id`) REFERENCES `employee` (`id`);

--
-- Constraints for table `flight`
--
ALTER TABLE `flight`
  ADD CONSTRAINT `‘flight_FK1’` FOREIGN KEY (`plane_ID`) REFERENCES `plane` (`plane_ID`),
  ADD CONSTRAINT `‘flight_FK2’` FOREIGN KEY (`employee_ID`) REFERENCES `employee` (`id`);

--
-- Constraints for table `passenger_flight`
--
ALTER TABLE `passenger_flight`
  ADD CONSTRAINT `passenger_flight_fk02` FOREIGN KEY (`passenger_passportID`) REFERENCES `passenger` (`passport_ID`),
  ADD CONSTRAINT `‘passenger_flight_FK1’` FOREIGN KEY (`passenger_passportID`) REFERENCES `passenger` (`passport_ID`),
  ADD CONSTRAINT `‘passenger_flight_FK2’` FOREIGN KEY (`flight_flightNum`) REFERENCES `flight` (`flight_num`);

--
-- Constraints for table `passenger_phonenumber`
--
ALTER TABLE `passenger_phonenumber`
  ADD CONSTRAINT `passenger_phonenumberFk1` FOREIGN KEY (`passenger_passportID`) REFERENCES `passenger` (`passport_ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
