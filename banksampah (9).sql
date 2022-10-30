-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 14, 2022 at 01:24 AM
-- Server version: 10.4.22-MariaDB
-- PHP Version: 8.0.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `banksampah`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `findbank` (IN `area` VARCHAR(50))  BEGIN
	SELECT WasteBankName, WasteBankLocation, WasteBankContact
    FROM wastebank
    WHERE WasteBankArea = area;
END$$

--
-- Functions
--
CREATE DEFINER=`root`@`localhost` FUNCTION `cekusername` (`input` VARCHAR(20)) RETURNS VARCHAR(20) CHARSET utf8mb4 BEGIN
	DECLARE found VARCHAR(20) DEFAULT "";
    SELECT Username INTO found FROM customer WHERE Username = input;
    RETURN found;
    
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `AdminId` varchar(10) NOT NULL,
  `AdminPassword` varchar(20) NOT NULL,
  `AdminName` varchar(50) NOT NULL,
  `AdminGender` enum('Laki-laki','Perempuan') NOT NULL,
  `AdminPhone` bigint(12) NOT NULL,
  `AdminEmail` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`AdminId`, `AdminPassword`, `AdminName`, `AdminGender`, `AdminPhone`, `AdminEmail`) VALUES
('ADM01', '12345', 'Admin 1', 'Perempuan', 6281234567890, 'adm1@hotmail.com'),
('ADM02', '12345', 'Admin 2', 'Laki-laki', 6281234567890, 'adm2@hotmail.com'),
('ADM03', '12345', 'Admin 3', 'Perempuan', 6281234567890, 'adm3@hotmail.com'),
('ADM04', '12345', 'Admin 4', 'Laki-laki', 6281334500187, 'adm44@hotmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `courier`
--

CREATE TABLE `courier` (
  `LicensePlate` varchar(8) NOT NULL,
  `CourierPassword` varchar(20) NOT NULL,
  `CourierName` varchar(50) NOT NULL,
  `CourierGender` enum('Laki-laki','Perempuan') NOT NULL,
  `CourierPhone` bigint(12) NOT NULL,
  `CourierEmail` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `courier`
--

INSERT INTO `courier` (`LicensePlate`, `CourierPassword`, `CourierName`, `CourierGender`, `CourierPhone`, `CourierEmail`) VALUES
('N123AL', 'santoso15', 'Achmad Santoso', 'Laki-laki', 6282333438865, 'Santosa10@gmail.com'),
('N1312BW', 'pardin10', 'Hardi Pardiyana', 'Laki-laki', 6288112338989, 'Hpardiyana@gmail.com'),
('N1581DH', 'amel2001', 'Priska Amelia', 'Perempuan', 6281244758204, 'priskaamel15@gmail.com'),
('N5678EG', 'NawirNawir1234', 'Moch. Nawir', 'Laki-laki', 6281765894654, 'nawirefendy@gmail.com'),
('N9797AL', 'Bahagiaselau', 'Bagas Bintara', 'Laki-laki', 6285788223344, 'bagasbagas02@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `Username` varchar(20) NOT NULL,
  `CustomerPassword` varchar(20) NOT NULL,
  `CustomerName` varchar(50) NOT NULL,
  `CustomerGender` enum('Laki-laki','Perempuan') NOT NULL,
  `CustomerPhone` bigint(12) NOT NULL,
  `CustomerEmail` varchar(50) NOT NULL,
  `CustomerAddress` varchar(50) NOT NULL,
  `CustomerArea` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`Username`, `CustomerPassword`, `CustomerName`, `CustomerGender`, `CustomerPhone`, `CustomerEmail`, `CustomerAddress`, `CustomerArea`) VALUES
('dewikus', 'dewi76', 'Dewi Kuswandari', 'Perempuan', 6284311951877, 'kuswandari@gmail.com', 'Jln. Aries Munandar Gg.3', 'Klojen'),
('marjan_', 'itsmarjan', 'Maras Januar', 'Laki-laki', 6288343597266, 'marjanmarjan@gmail.com', 'Jln. Plaosan Timur Gg.7', 'Blimbing'),
('rendyy99', 'rendyy99', 'Rendy Nugroho', 'Laki-laki', 6281844725660, 'rendynugroho99@gmail.com', 'Jln. Parangtritis Gg.16', 'Lowokwaru'),
('wulan31', 'wulanwulan31', 'Puput Wulandari', 'Perempuan', 6285639958202, 'puput31wulan@gmail.com', 'Jln. Tebo Selatan Gg. 5', 'Sukun'),
('yuliaina', 'yul141na', 'Ina Yulia', 'Perempuan', 6285723251098, 'inayulia141@gmail.com', 'Jln. Tenaga Utara Gg. Lori', 'Blimbing');

-- --------------------------------------------------------

--
-- Table structure for table `detailtransaction`
--

CREATE TABLE `detailtransaction` (
  `TransactionId` varchar(10) NOT NULL,
  `WasteId` varchar(10) NOT NULL,
  `WasteWeight` double NOT NULL,
  `TotalPrice` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `detailtransaction`
--

INSERT INTO `detailtransaction` (`TransactionId`, `WasteId`, `WasteWeight`, `TotalPrice`) VALUES
('TB001', 'KLNG02', 2, 17000),
('TB001', 'KRTS01', 3, 6000),
('TB001', 'PLST04', 3, 10500),
('TB001', 'PLST05', 2, 1000),
('TB002', 'KLNG02', 2, 17000),
('TB002', 'KRTS01', 3, 6000),
('TB002', 'KRTS02', 2, 1000),
('TB002', 'KRTS03', 3, 4500),
('TB002', 'PLST01', 2, 8000),
('TB003', 'KKCC01', 3, 3750),
('TB003', 'KKCC02', 2, 2000),
('TB003', 'KKCC03', 2, 1000),
('TB003', 'KLNG02', 2, 17000),
('TB003', 'KRTS03', 3, 4500),
('TB004', 'KKCC03', 1, 500),
('TB004', 'KLNG01', 2, 2400),
('TB004', 'KLNG03', 1, 39000),
('TB005', 'KLNG03', 1, 39000),
('TB005', 'PLST02', 1, 3500),
('TB005', 'PLST03', 2, 500),
('TB006', 'KLNG02', 4, 34000),
('TB006', 'PLST02', 1, 3500),
('TB006', 'PLST03', 1, 3500),
('TB006', 'PLST05', 2, 2000),
('TB007', 'KKCC01', 5, 6250),
('TB007', 'PLST01', 1, 4000),
('TB008', 'KLNG03', 2, 78000),
('TB009', 'KRTS02', 6, 3000),
('TB010', 'KRTS02', 2, 1000),
('TB010', 'KRTS03', 1, 1500),
('TB010', 'PLST02', 1, 3500);

-- --------------------------------------------------------

--
-- Table structure for table `route`
--

CREATE TABLE `route` (
  `RouteId` varchar(10) NOT NULL,
  `PickUpArea` varchar(50) NOT NULL,
  `DestinationArea` varchar(50) NOT NULL,
  `Distance` decimal(5,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `route`
--

INSERT INTO `route` (`RouteId`, `PickUpArea`, `DestinationArea`, `Distance`) VALUES
('RT01', 'Blimbing', 'Blimbing', '0.00'),
('RT02', 'Blimbing', 'Kedungkandang', '9.30'),
('RT03', 'Blimbing', 'Klojen', '4.90'),
('RT04', 'Blimbing', 'Lowokwaru', '6.60'),
('RT05', 'Blimbing', 'Sukun', '9.50'),
('RT06', 'Kedungkandang', 'Blimbing', '9.40'),
('RT07', 'Kedungkandang', 'Kedungkandang', '0.00'),
('RT08', 'Kedungkandang', 'Klojen', '7.40'),
('RT09', 'Kedungkandang', 'Lowokwaru', '13.00'),
('RT10', 'Kedungkandang', 'Sukun', '9.30'),
('RT11', 'Klojen', 'Blimbing', '4.90'),
('RT12', 'Klojen', 'Kedungkandang', '6.90'),
('RT13', 'Klojen', 'Klojen', '0.00'),
('RT14', 'Klojen', 'Lowokwaru', '7.20'),
('RT15', 'Klojen', 'Sukun', '5.90'),
('RT16', 'Lowokwaru', 'Blimbing', '6.10'),
('RT17', 'Lowokwaru', 'Kedungkandang', '13.00'),
('RT18', 'Lowokwaru', 'Klojen', '6.60'),
('RT19', 'Lowokwaru', 'Lowokwaru', '0.00'),
('RT20', 'Lowokwaru', 'Sukun', '12.00'),
('RT21', 'Sukun', 'Blimbing', '8.00'),
('RT22', 'Sukun', 'Kedungkandang', '8.50'),
('RT23', 'Sukun', 'Klojen', '3.50'),
('RT24', 'Sukun', 'Lowokwaru', '8.70'),
('RT25', 'Sukun', 'Sukun', '0.00');

-- --------------------------------------------------------

--
-- Stand-in structure for view `topcustomer`
-- (See below for the actual view)
--
CREATE TABLE `topcustomer` (
`Username` varchar(20)
,`CustomerName` varchar(50)
,`CountTransaction` bigint(21)
);

-- --------------------------------------------------------

--
-- Table structure for table `transaction`
--

CREATE TABLE `transaction` (
  `TransactionId` varchar(10) NOT NULL,
  `TransactionDate` timestamp NOT NULL DEFAULT current_timestamp(),
  `AdminId` varchar(10) NOT NULL,
  `Username` varchar(20) NOT NULL,
  `LicensePlate` varchar(8) NOT NULL,
  `RouteId` varchar(10) NOT NULL,
  `WasteBankId` varchar(10) NOT NULL,
  `TransactionStatus` enum('Dalam antrian','Dikonfirmasi','Dijemput','Diantar','Selesai') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `transaction`
--

INSERT INTO `transaction` (`TransactionId`, `TransactionDate`, `AdminId`, `Username`, `LicensePlate`, `RouteId`, `WasteBankId`, `TransactionStatus`) VALUES
('TB001', '2021-03-11 23:08:47', 'ADM02', 'dewikus', 'N1581DH', 'RT13', 'MLG01', 'Dalam antrian'),
('TB002', '2021-04-19 18:25:55', 'ADM03', 'rendyy99', 'N123AL', 'RT19', 'MLG05', 'Dikonfirmasi'),
('TB003', '2021-07-05 03:30:18', 'ADM02', 'marjan_', 'N123AL', 'RT03', 'MLG02', 'Dikonfirmasi'),
('TB004', '2021-09-01 04:34:10', 'ADM01', 'yuliaina', 'N5678EG', 'RT02', 'MLG04', 'Diantar'),
('TB005', '2021-12-09 21:21:14', 'ADM04', 'wulan31', 'N1312BW', 'RT25', 'MLG03', 'Selesai'),
('TB006', '2021-07-17 17:45:51', 'ADM01', 'rendyy99', 'N5678EG', 'RT18', 'MLG01', 'Selesai'),
('TB007', '2021-12-01 01:37:23', 'ADM03', 'rendyy99', 'N123AL', 'RT18', 'MLG02', 'Diantar'),
('TB008', '2021-03-26 19:59:38', 'ADM01', 'wulan31', 'N1581DH', 'RT04', 'MLG05', 'Selesai'),
('TB009', '2021-03-29 19:50:53', 'ADM02', 'wulan31', 'N5678EG', 'RT02', 'MLG04', 'Dijemput'),
('TB010', '2021-09-11 20:34:01', 'ADM01', 'wulan31', 'N5678EG', 'RT02', 'MLG04', 'Diantar');

-- --------------------------------------------------------

--
-- Table structure for table `waste`
--

CREATE TABLE `waste` (
  `WasteId` varchar(10) NOT NULL,
  `WasteName` varchar(20) NOT NULL,
  `WasteTypeId` varchar(10) NOT NULL,
  `WastePrice` double NOT NULL,
  `WasteDesc` text NOT NULL,
  `WastePict` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `waste`
--

INSERT INTO `waste` (`WasteId`, `WasteName`, `WasteTypeId`, `WastePrice`, `WasteDesc`, `WastePict`) VALUES
('KKCC01', 'Botol Sirup', 'WST04', 1250, 'Botol sirup kaca segala ukuran keadaan baik', ''),
('KKCC02', 'Botol Minuman', 'WST04', 1000, 'Botol minuman segala ukuran keadaan baik', ''),
('KKCC03', 'Beling', 'WST04', 500, 'Pecahan kaca jenis apapun', ''),
('KLNG01', 'Seng', 'WST03', 1200, 'Seng segala ukuran keadaan baik maupun rusak', ''),
('KLNG02', 'Kaleng', 'WST03', 8500, 'Segala jenis kaleng keadaan baik maupun rusak', ''),
('KLNG03', 'Tembaga', 'WST03', 39000, 'Segala jenis tembaga keadaan baik maupun rusak', ''),
('KRTS01', 'HVS', 'WST02', 2000, 'Kertas berukuran HVS', ''),
('KRTS02', 'Kertas Majalah', 'WST02', 500, 'Kertas majalah mengkilat segala ukuran', ''),
('KRTS03', 'Kardus', 'WST02', 1500, 'Kardus keadaan baik maupun rusak', ''),
('PLST01', 'Gelas Plastik', 'WST01', 4000, 'Gelas plastik segala ukuran keadaan baik maupun rusak', ''),
('PLST02', 'PET Botol', 'WST01', 3500, 'Botol PET segala ukuran keadaan baik maupun rusak', ''),
('PLST03', 'Paralon', 'WST01', 500, 'Pipa paralon plastik segala ukuran keadaan baik maupun rusak', ''),
('PLST04', 'Galon', 'WST01', 3500, 'Galon plastik segala ukuran keadaan baik maupun rusak', ''),
('PLST05', 'Kemasan Plastik', 'WST01', 500, 'Segala jenis kemasan plastik keadaan baik maupun rusak', '');

-- --------------------------------------------------------

--
-- Table structure for table `wastebank`
--

CREATE TABLE `wastebank` (
  `WasteBankId` varchar(10) NOT NULL,
  `WasteBankName` varchar(50) NOT NULL,
  `WasteBankLocation` varchar(100) NOT NULL,
  `WasteBankArea` varchar(50) NOT NULL,
  `WasteBankContact` bigint(12) NOT NULL,
  `WasteBankDesc` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `wastebank`
--

INSERT INTO `wastebank` (`WasteBankId`, `WasteBankName`, `WasteBankLocation`, `WasteBankArea`, `WasteBankContact`, `WasteBankDesc`) VALUES
('MLG01', 'Harapan Sejahtera', 'Jln. ARIES MUNANDAR GG.VIA, RT03 RW04, Kel.KIDUL DALEM', 'Klojen', 6282139254212, ''),
('MLG02', 'Gadang Indah', 'Jln. Gadang Pesantren, RT02 RW01 Kel.Gading Kasri', 'Klojen', 623417031891, ''),
('MLG03', 'Sumber Sareh', 'Jl. PISANG CANDI 1/ 7RT.02 RW.05 Kel. PISANG CANDI', 'Sukun', 628990370602, ''),
('MLG04', 'Guyup Rukun Sejahtera', ' Jln. KOLONEL SUGIONO 3-ART.05 RW.04 Kel. MERGOSONO ', 'Kedungkandang', 6281233774737, ''),
('MLG05', 'Lesung', 'Jln. Bantara II/3, RT.02 RW.04 Kel. Tulus Rejo', 'Lowokwaru', 623417618737, '');

-- --------------------------------------------------------

--
-- Table structure for table `wastetype`
--

CREATE TABLE `wastetype` (
  `WasteTypeId` varchar(10) NOT NULL,
  `WasteTypeName` varchar(20) NOT NULL,
  `WasteTypeDesc` text NOT NULL,
  `WasteTypePict` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `wastetype`
--

INSERT INTO `wastetype` (`WasteTypeId`, `WasteTypeName`, `WasteTypeDesc`, `WasteTypePict`) VALUES
('WST01', 'Plastik', '\r\n\r\n', ''),
('WST02', 'Kertas', '\r\n\r\n', ''),
('WST03', 'Logam', '\r\n\r\n', ''),
('WST04', 'Kaca', '\r\n\r\n', '');

-- --------------------------------------------------------

--
-- Structure for view `topcustomer`
--
DROP TABLE IF EXISTS `topcustomer`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `topcustomer`  AS SELECT `customer`.`Username` AS `Username`, `customer`.`CustomerName` AS `CustomerName`, count(`transaction`.`TransactionId`) AS `CountTransaction` FROM (`customer` join `transaction` on(`customer`.`Username` = `transaction`.`Username`)) ORDER BY count(`transaction`.`TransactionId`) ASC ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`AdminId`);

--
-- Indexes for table `courier`
--
ALTER TABLE `courier`
  ADD PRIMARY KEY (`LicensePlate`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`Username`);

--
-- Indexes for table `detailtransaction`
--
ALTER TABLE `detailtransaction`
  ADD PRIMARY KEY (`TransactionId`,`WasteId`),
  ADD KEY `TransactionId` (`TransactionId`,`WasteId`),
  ADD KEY `WasteId` (`WasteId`);

--
-- Indexes for table `route`
--
ALTER TABLE `route`
  ADD PRIMARY KEY (`RouteId`);

--
-- Indexes for table `transaction`
--
ALTER TABLE `transaction`
  ADD PRIMARY KEY (`TransactionId`),
  ADD KEY `Username` (`Username`),
  ADD KEY `LicensePlate` (`LicensePlate`),
  ADD KEY `ItemTransactionId` (`WasteBankId`),
  ADD KEY `RouteId` (`RouteId`),
  ADD KEY `WasteBankId` (`WasteBankId`),
  ADD KEY `AdminId` (`AdminId`);

--
-- Indexes for table `waste`
--
ALTER TABLE `waste`
  ADD PRIMARY KEY (`WasteId`),
  ADD KEY `WasteTypeId` (`WasteTypeId`);

--
-- Indexes for table `wastebank`
--
ALTER TABLE `wastebank`
  ADD PRIMARY KEY (`WasteBankId`);

--
-- Indexes for table `wastetype`
--
ALTER TABLE `wastetype`
  ADD PRIMARY KEY (`WasteTypeId`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `detailtransaction`
--
ALTER TABLE `detailtransaction`
  ADD CONSTRAINT `detailtransaction_ibfk_1` FOREIGN KEY (`TransactionId`) REFERENCES `transaction` (`TransactionId`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `detailtransaction_ibfk_2` FOREIGN KEY (`WasteId`) REFERENCES `waste` (`WasteId`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `transaction`
--
ALTER TABLE `transaction`
  ADD CONSTRAINT `transaction_ibfk_2` FOREIGN KEY (`Username`) REFERENCES `customer` (`Username`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `transaction_ibfk_3` FOREIGN KEY (`LicensePlate`) REFERENCES `courier` (`LicensePlate`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `transaction_ibfk_4` FOREIGN KEY (`RouteId`) REFERENCES `route` (`RouteId`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `transaction_ibfk_5` FOREIGN KEY (`WasteBankId`) REFERENCES `wastebank` (`WasteBankId`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `transaction_ibfk_6` FOREIGN KEY (`AdminId`) REFERENCES `admin` (`AdminId`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `waste`
--
ALTER TABLE `waste`
  ADD CONSTRAINT `waste_ibfk_1` FOREIGN KEY (`WasteTypeId`) REFERENCES `wastetype` (`WasteTypeId`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
