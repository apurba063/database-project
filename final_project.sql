-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 09, 2022 at 01:05 PM
-- Server version: 10.4.21-MariaDB
-- PHP Version: 8.0.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `final project`
--

-- --------------------------------------------------------

--
-- Table structure for table `bill`
--

CREATE TABLE `bill` (
  `no_of_days` int(11) NOT NULL,
  `doc_charge` int(11) NOT NULL,
  `lab_charge` int(11) NOT NULL,
  `room_charge` int(11) NOT NULL,
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `bill`
--

INSERT INTO `bill` (`no_of_days`, `doc_charge`, `lab_charge`, `room_charge`, `id`) VALUES
(6, 2000, 2000, 500, 14),
(23, 3000, 10000, 1200, 11),
(27, 5000, 10000, 1500, 12),
(33, 5500, 8000, 2000, 13),
(35, 5500, 12000, 2000, 15);

-- --------------------------------------------------------

--
-- Table structure for table `doctor`
--

CREATE TABLE `doctor` (
  `id` int(11) NOT NULL,
  `name` varchar(32) NOT NULL,
  `Department` varchar(32) NOT NULL,
  `schedule` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `doctor`
--

INSERT INTO `doctor` (`id`, `name`, `Department`, `schedule`) VALUES
(1, 'Mr Shafiq', 'Cardiologists', '2020-12-19'),
(2, 'Mr Shazed', 'Eye Specialists', '2020-05-06'),
(3, 'Mrs Chandra', 'Gynecologists', '2020-08-09'),
(4, 'Mr Naimur', 'Medicine', '2020-11-11'),
(5, 'Mr Ibrahim', 'Neurologist', '2020-10-18');

-- --------------------------------------------------------

--
-- Table structure for table `labratory`
--

CREATE TABLE `labratory` (
  `lab_no` int(11) NOT NULL,
  `report` varchar(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `labratory`
--

INSERT INTO `labratory` (`lab_no`, `report`) VALUES
(101, 'good'),
(102, 'not so good'),
(103, 'Bad'),
(104, 'average'),
(105, 'good');

-- --------------------------------------------------------

--
-- Table structure for table `nurse`
--

CREATE TABLE `nurse` (
  `id` int(11) NOT NULL,
  `name` varchar(32) NOT NULL,
  `schedule` date NOT NULL,
  `doctor_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `nurse`
--

INSERT INTO `nurse` (`id`, `name`, `schedule`, `doctor_id`) VALUES
(111, 'mazeda', '2022-01-12', 3),
(112, 'khaleda', '2022-01-14', 1),
(113, 'hasina', '2022-01-21', 5),
(114, 'rehana', '2022-01-19', 3),
(115, 'dipumoni', '2019-03-20', 2);

-- --------------------------------------------------------

--
-- Table structure for table `patient`
--

CREATE TABLE `patient` (
  `id` int(11) NOT NULL,
  `name` varchar(32) NOT NULL,
  `gender` varchar(16) NOT NULL,
  `disease` varchar(32) NOT NULL,
  `doctor_id` int(11) NOT NULL,
  `room_no` int(11) NOT NULL,
  `lab_no` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `patient`
--

INSERT INTO `patient` (`id`, `name`, `gender`, `disease`, `doctor_id`, `room_no`, `lab_no`) VALUES
(11, 'Rahima', 'F', 'gynae', 3, 1001, 101),
(12, 'Sazzad', 'M', 'Cardio', 1, 1001, 101),
(13, 'Rabi', 'M', 'Neuro', 5, 1001, NULL),
(14, 'Sadia', 'F', 'Cardio', 1, 1005, 104),
(15, 'Abir', 'M', 'Eye', 2, 1005, 105);

-- --------------------------------------------------------

--
-- Table structure for table `patient_phone_number`
--

CREATE TABLE `patient_phone_number` (
  `phone_number` int(11) NOT NULL,
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `patient_phone_number`
--

INSERT INTO `patient_phone_number` (`phone_number`, `id`) VALUES
(1511234576, 12),
(1611234576, 15),
(1711234576, 11),
(1811234576, 13),
(1911234576, 14);

-- --------------------------------------------------------

--
-- Table structure for table `room`
--

CREATE TABLE `room` (
  `room_no` int(11) NOT NULL,
  `ward` varchar(32) NOT NULL,
  `operation_theater` varchar(32) NOT NULL,
  `ICU` varchar(32) NOT NULL,
  `ward_boy_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `room`
--

INSERT INTO `room` (`room_no`, `ward`, `operation_theater`, `ICU`, `ward_boy_id`) VALUES
(1001, 'Eye', 'Eye', '1st floor', 1),
(1002, 'Gynae', 'Normal', '2nd floor', 2),
(1003, 'Child', 'VIP', '3rd floor', 3),
(1004, 'Cardio', 'Child', '4th floor', 4),
(1005, 'Emergency', 'Gynae', '5th floor', 5);

-- --------------------------------------------------------

--
-- Table structure for table `ward_boy`
--

CREATE TABLE `ward_boy` (
  `id` int(11) NOT NULL,
  `name` varchar(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `ward_boy`
--

INSERT INTO `ward_boy` (`id`, `name`) VALUES
(1, 'Rahim'),
(2, 'Kashem'),
(3, 'Hosen'),
(4, 'Abdul'),
(5, 'Razib');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bill`
--
ALTER TABLE `bill`
  ADD PRIMARY KEY (`no_of_days`,`doc_charge`,`lab_charge`,`room_charge`,`id`),
  ADD KEY `id` (`id`);

--
-- Indexes for table `doctor`
--
ALTER TABLE `doctor`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `labratory`
--
ALTER TABLE `labratory`
  ADD PRIMARY KEY (`lab_no`);

--
-- Indexes for table `nurse`
--
ALTER TABLE `nurse`
  ADD PRIMARY KEY (`id`),
  ADD KEY `doctor_id` (`doctor_id`);

--
-- Indexes for table `patient`
--
ALTER TABLE `patient`
  ADD PRIMARY KEY (`id`),
  ADD KEY `doctor_id` (`doctor_id`),
  ADD KEY `room_no` (`room_no`),
  ADD KEY `lab_no` (`lab_no`);

--
-- Indexes for table `patient_phone_number`
--
ALTER TABLE `patient_phone_number`
  ADD PRIMARY KEY (`phone_number`,`id`),
  ADD KEY `id` (`id`);

--
-- Indexes for table `room`
--
ALTER TABLE `room`
  ADD PRIMARY KEY (`room_no`),
  ADD KEY `ward_boy_id` (`ward_boy_id`);

--
-- Indexes for table `ward_boy`
--
ALTER TABLE `ward_boy`
  ADD PRIMARY KEY (`id`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `bill`
--
ALTER TABLE `bill`
  ADD CONSTRAINT `bill_ibfk_1` FOREIGN KEY (`id`) REFERENCES `patient` (`id`);

--
-- Constraints for table `nurse`
--
ALTER TABLE `nurse`
  ADD CONSTRAINT `nurse_ibfk_1` FOREIGN KEY (`doctor_id`) REFERENCES `doctor` (`id`);

--
-- Constraints for table `patient`
--
ALTER TABLE `patient`
  ADD CONSTRAINT `patient_ibfk_1` FOREIGN KEY (`doctor_id`) REFERENCES `doctor` (`id`),
  ADD CONSTRAINT `patient_ibfk_2` FOREIGN KEY (`room_no`) REFERENCES `room` (`room_no`),
  ADD CONSTRAINT `patient_ibfk_3` FOREIGN KEY (`lab_no`) REFERENCES `labratory` (`lab_no`);

--
-- Constraints for table `patient_phone_number`
--
ALTER TABLE `patient_phone_number`
  ADD CONSTRAINT `patient_phone_number_ibfk_1` FOREIGN KEY (`id`) REFERENCES `patient` (`id`);

--
-- Constraints for table `room`
--
ALTER TABLE `room`
  ADD CONSTRAINT `room_ibfk_1` FOREIGN KEY (`ward_boy_id`) REFERENCES `ward_boy` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
