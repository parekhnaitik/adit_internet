-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Nov 19, 2017 at 12:31 PM
-- Server version: 10.1.19-MariaDB
-- PHP Version: 7.0.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `adit_internet`
--
CREATE DATABASE IF NOT EXISTS `adit_internet` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `adit_internet`;

-- --------------------------------------------------------

--
-- Table structure for table `internet_user`
--

CREATE TABLE `internet_user` (
  `pk` int(5) NOT NULL,
  `userId` varchar(15) NOT NULL,
  `firstName` varchar(15) NOT NULL,
  `lastName` varchar(15) NOT NULL,
  `enrollmentNumber` varchar(15) NOT NULL,
  `emailId` varchar(50) NOT NULL,
  `contactNumber` varchar(12) NOT NULL,
  `department` varchar(10) NOT NULL,
  `userType` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `internet_user`
--

INSERT INTO `internet_user` (`pk`, `userId`, `firstName`, `lastName`, `enrollmentNumber`, `emailId`, `contactNumber`, `department`, `userType`) VALUES
(1, '140010116019', 'Naitik', 'Parekh', '14', 'pn13@gmail.com', '1234567890', 'IT', 'Student'),
(2, '14', 'abc', 'xyz', '14', 'ddfs', '134', 'sd', 'as'),
(3, '14001011601', 'Naitik', 'Parekh', '14', 'pn13@gmail.com', '1234567890', 'IT', 'Student');

-- --------------------------------------------------------

--
-- Table structure for table `user_devices`
--

CREATE TABLE `user_devices` (
  `deviceId` int(5) NOT NULL,
  `userId` varchar(15) NOT NULL,
  `startDate` date NOT NULL,
  `validity` int(5) NOT NULL,
  `endDate` date NOT NULL,
  `deviceType` varchar(10) NOT NULL,
  `macAddress` varchar(20) NOT NULL,
  `ipAddress` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `internet_user`
--
ALTER TABLE `internet_user`
  ADD PRIMARY KEY (`pk`),
  ADD UNIQUE KEY `userId` (`userId`);

--
-- Indexes for table `user_devices`
--
ALTER TABLE `user_devices`
  ADD PRIMARY KEY (`deviceId`),
  ADD KEY `userId` (`userId`),
  ADD KEY `userId_2` (`userId`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `internet_user`
--
ALTER TABLE `internet_user`
  MODIFY `pk` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `user_devices`
--
ALTER TABLE `user_devices`
  MODIFY `deviceId` int(5) NOT NULL AUTO_INCREMENT;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `user_devices`
--
ALTER TABLE `user_devices`
  ADD CONSTRAINT `user_devices_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `internet_user` (`userId`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
