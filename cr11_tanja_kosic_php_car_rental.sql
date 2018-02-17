-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 17, 2018 at 04:35 PM
-- Server version: 10.1.30-MariaDB
-- PHP Version: 7.2.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `cr11_tanja_kosic_php_car_rental`
--

-- --------------------------------------------------------

--
-- Table structure for table `cars`
--

CREATE TABLE `cars` (
  `car_id` int(11) NOT NULL,
  `image1` varchar(500) NOT NULL,
  `name` varchar(55) NOT NULL,
  `model` varchar(50) DEFAULT NULL,
  `type` varchar(55) NOT NULL,
  `details` varchar(500) DEFAULT NULL,
  `fk_offices_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `cars`
--

INSERT INTO `cars` (`car_id`, `image1`, `name`, `model`, `type`, `details`, `fk_offices_id`) VALUES
(1, 'http://uk.smart.com/content/dam/smart/UK/smart-fortwo/prime-sport-cutout.png', 'Smart forTwo', 'Coupe 2016', 'Small Car', 'Benzin | Automatic | Coupe', 1),
(2, 'http://st.motortrend.com/uploads/sites/10/2015/11/2013-audi-a8-l-42-fsi-quattro-sedan-angular-front.png', 'Audi', 'A8', 'Limousine', 'Diesel | Automatic | Limousine', 4),
(3, 'https://dealerimages.dealereprocess.com/image/upload/c_limit,f_auto,fl_lossy,w_700/v1/svp/Colors_PNG1280/2018/18bmw/18bmwx6m2a/bmw_18x6m2a_angularfront_blacksapphiremetallic', 'BMW', 'X6', 'SUV', 'Diesel | Automatic | SUV', 3),
(4, 'https://www.fiat.at/content/dam/fiat/cross/models/500_family/500/special/500s/500.png', 'Fiat', '500', 'Small Car', 'Benzin | Automatic | Coupe', 2),
(5, 'http://www.caractere.com/medias/upload/products/cars/volkswagen/passat/passat-cc/rims/passat-cc-rims-mat-01.png', 'VW', 'Passat', 'Limousine', 'Diesel | Automatic | Limousine', 3),
(6, 'https://www.volkswagen.com.au/content/dam/vw-ngw/vw_pkw/importers/au/showrooms/touareg/16x9/Touareg_Range_V8TDI-RLine.png/jcr:content/renditions/original.transform/min/img.png', 'VW', 'Touareg', 'SUV', 'Diesel | Automatic | SUV', 2),
(7, 'http://www.richardhardie.co.uk/images/new-vehicle-photos/peugeot-208-general.png', 'Peugeot', '208', 'Small Car', 'Benzin | Automatic ', 4),
(8, 'https://www.autoreduc.com/img/c/402-1_thumb.jpg', 'Citroen', 'C6', 'Limousine', 'Diesel | Automatic | Limousine', 1),
(9, 'https://executivorio.com.br/wp-content/uploads/2016/09/freemont.png', 'Fiat', 'Freemot', 'SUV', 'Diesel | Automatic | SUV', 3),
(10, 'https://i1.wp.com/www.fleetelite.co.uk/news/wp-content/uploads/2017/10/mini-cooper-hardtop-8077-0.png?fit=1200%2C797&ssl=1', 'Mini', 'Cooper', 'Small Car', 'Benzin | Automatic | Coupe', 2),
(11, 'https://www.amorprestigedriver.com/wp-content/uploads/2017/11/peugeot-berline-508.png', 'Peugeot', '508', 'Limousine', 'Diesel | Automatic | Limousine', 1),
(12, 'https://financialtribune.com/sites/default/files/field/image/17january/11_d_jlr_460.png', 'Range Rover', 'Evoque', 'SUV', 'Diesel | Automatic | SUV', 4);

-- --------------------------------------------------------

--
-- Table structure for table `cars_status`
--

CREATE TABLE `cars_status` (
  `cars_status_id` int(11) NOT NULL,
  `fk_current_location_id` int(11) NOT NULL,
  `fk_car_id` int(11) DEFAULT NULL,
  `fk_user_id` int(11) DEFAULT NULL,
  `status` enum('available','not available') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `cars_status`
--

INSERT INTO `cars_status` (`cars_status_id`, `fk_current_location_id`, `fk_car_id`, `fk_user_id`, `status`) VALUES
(13, 2, 1, NULL, 'available'),
(14, 1, 2, NULL, 'available'),
(15, 3, 4, NULL, 'available'),
(16, 4, 3, NULL, 'available'),
(17, 5, 6, NULL, 'available'),
(18, 6, 5, NULL, 'available'),
(19, 7, 8, NULL, 'not available'),
(20, 8, 7, NULL, 'available'),
(21, 10, 9, NULL, 'not available'),
(22, 9, 10, NULL, 'not available'),
(23, 12, 11, NULL, 'not available'),
(24, 11, 12, NULL, 'not available');

-- --------------------------------------------------------

--
-- Table structure for table `current_location`
--

CREATE TABLE `current_location` (
  `current_location_id` int(11) NOT NULL,
  `lat` double DEFAULT NULL,
  `lng` double NOT NULL,
  `cl_address` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `current_location`
--

INSERT INTO `current_location` (`current_location_id`, `lat`, `lng`, `cl_address`) VALUES
(1, 48.188176, 16.412918, '1030 Wien - Baumgasse 133'),
(2, 48.259089, 16.449781, '1220 Wien - Wagramer Strasse 177'),
(3, 48.174054, 16.365985, '1100 Wien - Davidgasse 50'),
(4, 48.257922, 16.411278, '1210 Wien - Leopoldauerstrasse 40'),
(5, 48.19712, 16.39572, '1030 Wien - Landstrasser Hauptstrasse 111 '),
(6, 48.259089, 16.449781, '1220 Wien - Wagramer Strasse 177'),
(7, 48.188176, 16.412918, '1030 Wien - Baumgasse 133'),
(8, 48.20426, 16.350805, '1070 Wien - Burggasse 34-36'),
(9, 48.229139, 16.322521, '1180 Wien - Czartoryskigasse 42-54'),
(10, 48.208605, 16.304838, '1160 Wien - Wernhardtstrasse 24'),
(11, 48.168345, 16.282807, '1130 Wien - Wolkersbergenstrasse 10'),
(12, 48.174653, 16.406173, '1110 Wien - Geiselbergstrasse 44-48');

-- --------------------------------------------------------

--
-- Table structure for table `offices`
--

CREATE TABLE `offices` (
  `offices_id` int(11) NOT NULL,
  `address` varchar(100) DEFAULT NULL,
  `phone` varchar(100) DEFAULT NULL,
  `lat` double NOT NULL,
  `lnt` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `offices`
--

INSERT INTO `offices` (`offices_id`, `address`, `phone`, `lat`, `lnt`) VALUES
(1, '1030 Wien - Baumgasse 133', '+43 1 798 55 42', 48.188176, 16.412918),
(2, '1220 Wien - Wagramer Strasse 177', '+43 1 3451220', 48.259089, 16.449781),
(3, '1100 Wien - Davidgasse 50', '+43 1 602 18 01', 48.174054, 16.365985),
(4, '1210 Wien - Leopoldauerstrasse 40', '+43 1 270 71 96', 48.257922, 16.411278);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `gender` varchar(30) NOT NULL,
  `birthdate` date DEFAULT NULL,
  `user_email` varchar(60) NOT NULL,
  `user_pass` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `first_name`, `last_name`, `gender`, `birthdate`, `user_email`, `user_pass`) VALUES
(1, 'Tanja', 'Kosic', '', NULL, 'kosic.tanja@hotmail.com', 'd145f0b346a8696fcc9b7da4c7db8a77116b1aacbc77a46df7e1efbd1193bfd9');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cars`
--
ALTER TABLE `cars`
  ADD PRIMARY KEY (`car_id`),
  ADD KEY `fk_offices_id` (`fk_offices_id`);

--
-- Indexes for table `cars_status`
--
ALTER TABLE `cars_status`
  ADD PRIMARY KEY (`cars_status_id`),
  ADD KEY `fk_current_location_id` (`fk_current_location_id`),
  ADD KEY `fk_car_id` (`fk_car_id`),
  ADD KEY `fk_user_id` (`fk_user_id`);

--
-- Indexes for table `current_location`
--
ALTER TABLE `current_location`
  ADD PRIMARY KEY (`current_location_id`);

--
-- Indexes for table `offices`
--
ALTER TABLE `offices`
  ADD PRIMARY KEY (`offices_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `user_email` (`user_email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cars`
--
ALTER TABLE `cars`
  MODIFY `car_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `cars_status`
--
ALTER TABLE `cars_status`
  MODIFY `cars_status_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `current_location`
--
ALTER TABLE `current_location`
  MODIFY `current_location_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `offices`
--
ALTER TABLE `offices`
  MODIFY `offices_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `cars`
--
ALTER TABLE `cars`
  ADD CONSTRAINT `cars_ibfk_1` FOREIGN KEY (`fk_offices_id`) REFERENCES `offices` (`offices_id`);

--
-- Constraints for table `cars_status`
--
ALTER TABLE `cars_status`
  ADD CONSTRAINT `cars_status_ibfk_2` FOREIGN KEY (`fk_car_id`) REFERENCES `cars` (`car_id`),
  ADD CONSTRAINT `cars_status_ibfk_3` FOREIGN KEY (`fk_user_id`) REFERENCES `users` (`user_id`),
  ADD CONSTRAINT `cars_status_ibfk_4` FOREIGN KEY (`fk_current_location_id`) REFERENCES `current_location` (`current_location_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
