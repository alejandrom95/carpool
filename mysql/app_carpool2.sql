-- phpMyAdmin SQL Dump
-- version 4.4.6
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: May 10, 2017 at 07:59 AM
-- Server version: 5.6.24
-- PHP Version: 5.5.24

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `app_carpool`
--

-- --------------------------------------------------------

--
-- Table structure for table `messages`
--

DROP TABLE IF EXISTS `messages`;
CREATE TABLE IF NOT EXISTS `messages` (
  `message_id` int(11) NOT NULL,
  `route_id` int(11) NOT NULL,
  `thread_name` varchar(25) NOT NULL,
  `username` varchar(25) NOT NULL,
  `message_text` varchar(1000) NOT NULL,
  `create_date` datetime NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `messages`
--

INSERT INTO `messages` (`message_id`, `route_id`, `thread_name`, `username`, `message_text`, `create_date`) VALUES
(1, 1, 'user1@gmail.com', 'user1@gmail.com', 'Hi.  I would like to join your ride.  Let me know', '0000-00-00 00:00:00'),
(2, 1, 'user1@gmail.com', 'fernie255@yahoo.com', 'How flexible are you in he departure time?', '0000-00-00 00:00:00'),
(3, 1, 'user1@gmail.com', 'user1@gmail.com', 'I can leave whenever you want to.', '0000-00-00 00:00:00'),
(4, 1, 'user1@gmail.com', 'fernie255@yahoo.com', 'Ok.  I''ll let you know.', '0000-00-00 00:00:00'),
(5, 2, 'user1@gmail.com', 'user1@gmail.com', 'Hi.  I would like to join your 2nd ride.  Let me know', '0000-00-00 00:00:00'),
(6, 2, 'user1@gmail.com', 'fernie255@yahoo.com', 'How flexible are you in he 2nd departure time?', '0000-00-00 00:00:00'),
(7, 2, 'user1@gmail.com', 'user1@gmail.com', 'I can leave whenever you want to go on 2nd ride.', '0000-00-00 00:00:00'),
(8, 2, 'user1@gmail.com', 'fernie255@yahoo.com', 'Ok.  I''ll let you know about the 2nd ride.', '0000-00-00 00:00:00'),
(9, 2, 'user1@gmail.com', 'fernie255@yahoo.com', 'I''m going to leave 1 hour later on the 2nd ride.', '0000-00-00 00:00:00'),
(10, 3, 'fernie255@yahoo.com', 'fernie255@yahoo.com', 'How flexible are you in he 3nd departure time?', '0000-00-00 00:00:00'),
(11, 3, 'fernie255@yahoo.com', 'user1@gmail.com', 'I can leave whenever you want to go on 3nd ride.', '0000-00-00 00:00:00'),
(12, 1, 'user2@gmail.com', 'user2@gmail.com', 'Are you still doing this ride?', '0000-00-00 00:00:00'),
(13, 1, 'user2@gmail.com', 'fernie255@yahon.com', 'Yes.', '0000-00-00 00:00:00'),
(14, 4, 'user2@gmail.com', 'user2@gmail.com', 'Yes.', '0000-00-00 00:00:00'),
(15, 4, 'fernie255@yahoo.com', 'fernie255@yahoo.com', 'Yes no.', '0000-00-00 00:00:00'),
(16, 7, 'user2@gmail.com', 'user1@gmail.com', 'a', '0000-00-00 00:00:00'),
(17, 7, 'user2@gmail.com', 'user1@gmail.com', 'You are now the driver for route_id=7', '0000-00-00 00:00:00'),
(18, 7, 'user2@gmail.com', 'user2@gmail.com', 'You have been added to route_id=7', '0000-00-00 00:00:00'),
(19, 4, 'fernie255@yahoo.com', 'user1@gmail.com', 'testtest', '2017-04-27 00:20:20'),
(20, 3, 'fernie255@yahoo.com', 'user1@gmail.com', 'a', '2017-05-09 22:09:04'),
(21, 3, 'fernie255@yahoo.com', 'user1@gmail.com', 'b', '2017-05-09 22:14:32'),
(22, 3, 'fernie255@yahoo.com', 'user1@gmail.com', 'c', '2017-05-09 22:16:04'),
(23, 4, 'user2@gmail.com', 'user1@gmail.com', 'a', '2017-05-09 22:16:29'),
(24, 4, 'user2@gmail.com', 'user1@gmail.com', 'b\n', '2017-05-09 22:19:10'),
(25, 1, 'user1@gmail.com', 'user1@gmail.com', 'a', '2017-05-09 22:19:18'),
(26, 2, 'user1@gmail.com', 'user1@gmail.com', 'a', '2017-05-09 22:19:28');

-- --------------------------------------------------------

--
-- Table structure for table `passenger_list`
--

DROP TABLE IF EXISTS `passenger_list`;
CREATE TABLE IF NOT EXISTS `passenger_list` (
  `route_id` int(11) NOT NULL,
  `username` varchar(100) NOT NULL,
  `driver_needs_rating` tinyint(1) NOT NULL,
  `passenger_needs_rating` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `passenger_list`
--

INSERT INTO `passenger_list` (`route_id`, `username`, `driver_needs_rating`, `passenger_needs_rating`) VALUES
(7, 'user2@gmail.com', 0, 0),
(7, 'user3@gmail.com', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `ratings`
--

DROP TABLE IF EXISTS `ratings`;
CREATE TABLE IF NOT EXISTS `ratings` (
  `route_id` int(11) NOT NULL,
  `rating_type` varchar(10) NOT NULL,
  `username` varchar(100) NOT NULL,
  `username_rated` varchar(100) NOT NULL,
  `rating` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ratings`
--

INSERT INTO `ratings` (`route_id`, `rating_type`, `username`, `username_rated`, `rating`) VALUES
(7, 'DRIVER', 'user2@gmail.com', 'user1@gmail.com', 4),
(7, 'DRIVER', 'user3@gmail.com', 'user1@gmail.com', 2),
(7, 'PASSENGER', 'user1@gmail.com', 'user2@gmail.com', 1),
(7, 'PASSENGER', 'user1@gmail.com', 'user3@gmail.com', 5);

-- --------------------------------------------------------

--
-- Table structure for table `reset_requests`
--

DROP TABLE IF EXISTS `reset_requests`;
CREATE TABLE IF NOT EXISTS `reset_requests` (
  `email` varchar(100) NOT NULL,
  `code` varchar(8) NOT NULL,
  `create_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `reset_requests`
--

INSERT INTO `reset_requests` (`email`, `code`, `create_date`, `update_date`) VALUES
('alejandrom060595@gmail.com', 'h9V+qf-i', '2017-05-09 22:46:51', '2017-05-09 22:46:51'),
('alejandrom060595@live.com', 'nWq-_NAY', '2017-02-27 20:23:14', '2017-02-27 20:23:14');

-- --------------------------------------------------------

--
-- Table structure for table `routes`
--

DROP TABLE IF EXISTS `routes`;
CREATE TABLE IF NOT EXISTS `routes` (
  `route_id` int(11) NOT NULL,
  `email` varchar(25) NOT NULL,
  `start_address` varchar(200) NOT NULL,
  `start_lat` double NOT NULL,
  `start_lng` double NOT NULL,
  `start_google_place_id` varchar(200) NOT NULL,
  `end_address` varchar(200) NOT NULL,
  `end_lat` double NOT NULL,
  `end_lng` double NOT NULL,
  `end_google_place_id` varchar(200) NOT NULL,
  `time_window_start` datetime NOT NULL,
  `time_window_end` datetime NOT NULL,
  `create_date` datetime NOT NULL,
  `status` varchar(25) NOT NULL,
  `type` varchar(10) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `routes`
--

INSERT INTO `routes` (`route_id`, `email`, `start_address`, `start_lat`, `start_lng`, `start_google_place_id`, `end_address`, `end_lat`, `end_lng`, `end_google_place_id`, `time_window_start`, `time_window_end`, `create_date`, `status`, `type`) VALUES
(1, 'fernie255@yahoo.com', 'California State University Long Beach, Long Beach, CA, United States', 33.783782, -118.114082, 'ChIJQ_aCKdgx3YARqy3HziZ_3B8', 'STAPLES Center, South Figueroa Street, Los Angeles, CA', 34.04295, -118.267123, 'ChIJWXNsX7jHwoARaduMfEQ0HuU', '2016-10-07 10:00:00', '2016-10-07 12:00:00', '2017-01-23 00:29:02', 'VISIBLE', 'REQUEST'),
(2, 'fernie255@yahoo.com', 'California State University Long Beach, Long Beach, CA, United States', 33.783782, -118.114082, 'ChIJQ_aCKdgx3YARqy3HziZ_3B8', 'STAPLES Center, South Figueroa Street, Los Angeles, CA', 34.04295, -118.267123, 'ChIJWXNsX7jHwoARaduMfEQ0HuU', '2016-10-07 10:00:00', '2016-10-07 12:00:00', '2017-01-23 00:29:02', 'VISIBLE', 'REQUEST'),
(3, 'user1@gmail.com', 'California State University Long Beach, Long Beach, CA, United States', 33.783782, -118.114082, 'ChIJQ_aCKdgx3YARqy3HziZ_3B8', 'STAPLES Center, South Figueroa Street, Los Angeles, CA', 34.04295, -118.267123, 'ChIJWXNsX7jHwoARaduMfEQ0HuU', '2016-10-07 10:00:00', '2016-10-07 12:00:00', '2017-01-23 00:29:02', 'VISIBLE', 'REQUEST'),
(4, 'user1@gmail.com', 'California State University Long Beach, Long Beach, CA, United States', 33.783782, -118.114082, 'ChIJQ_aCKdgx3YARqy3HziZ_3B8', 'STAPLES Center, South Figueroa Street, Los Angeles, CA', 34.04295, -118.267123, 'ChIJWXNsX7jHwoARaduMfEQ0HuU', '2016-10-07 10:00:00', '2016-10-07 12:00:00', '2017-01-23 00:29:02', 'VISIBLE', 'OFFER'),
(5, 'user1@gmail.com', 'California State University Long Beach, Long Beach, CA, United States', 33.783782, -118.114082, 'ChIJQ_aCKdgx3YARqy3HziZ_3B8', 'STAPLES Center, South Figueroa Street, Los Angeles, CA', 34.04295, -118.267123, 'ChIJWXNsX7jHwoARaduMfEQ0HuU', '2016-10-07 10:00:00', '2016-10-07 12:00:00', '2017-03-06 19:55:42', 'COMPLETED', 'REQUEST'),
(6, 'user1@gmail.com', 'Long Beach, CA, United States', 33.7700504, -118.19373949999999, 'ChIJWdeZQOjKwoARqo8qxPo6AKE', 'California State University Long Beach, Long Beach, CA, United States', 33.7838235, -118.11409040000001, 'ChIJQ_aCKdgx3YARqy3HziZ_3B8', '2017-03-08 20:34:00', '2017-03-08 23:34:00', '2017-03-08 20:34:38', 'VISIBLE', 'REQUEST'),
(7, 'user1@gmail.com', 'Long Beach, CA, United States', 33.7700504, -118.19373949999999, 'ChIJWdeZQOjKwoARqo8qxPo6AKE', 'Long Beach Airport, Donald Douglas Drive, Long Beach, CA, United States', 33.8182652, -118.14454160000003, 'ChIJhQxDwTYy3YAR_ydWCFAr1wM', '2017-03-16 15:37:00', '2017-03-16 20:37:00', '2017-03-16 15:37:40', 'CLOSED', 'OFFER'),
(8, 'user1@gmail.com', 'Long Beach, CA, United States', 33.7700504, -118.19373949999999, 'ChIJWdeZQOjKwoARqo8qxPo6AKE', 'Long Beach Airport, Long Beach, CA, United States', 33.8162213, -118.1506099, 'ChIJhQxDwTYy3YAR_ydWCFAr1wM', '0000-00-00 00:00:00', '2017-04-13 23:59:00', '2017-04-13 12:59:49', 'VISIBLE', 'REQUEST'),
(9, 'user6@gmail.com', 'Torrance, CA, United States', 33.83584920000001, -118.34062879999999, 'ChIJ096zWNFK3YARHmYKTm7TS60', 'Long Beach Airport, Long Beach, CA, United States', 33.8162213, -118.1506099, 'ChIJhQxDwTYy3YAR_ydWCFAr1wM', '2017-05-06 14:50:00', '2017-05-06 23:50:00', '2017-05-06 14:50:44', 'VISIBLE', 'REQUEST'),
(10, 'user6@gmail.com', 'Long Beach, CA, United States', 33.7700504, -118.19373949999999, 'ChIJWdeZQOjKwoARqo8qxPo6AKE', 'Long Beach Airport, Long Beach, CA, United States', 33.8162213, -118.1506099, 'ChIJhQxDwTYy3YAR_ydWCFAr1wM', '2017-05-06 14:53:00', '2017-05-06 22:53:00', '2017-05-06 14:53:22', 'VISIBLE', 'REQUEST'),
(11, 'user6@gmail.com', 'Long Beach, CA, United States', 33.7700504, -118.19373949999999, 'ChIJWdeZQOjKwoARqo8qxPo6AKE', 'Torrance, CA, United States', 33.83584920000001, -118.34062879999999, 'ChIJ096zWNFK3YARHmYKTm7TS60', '2017-05-06 14:53:00', '2017-05-06 23:53:00', '2017-05-06 14:53:53', 'VISIBLE', 'REQUEST');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `email` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `first_name` varchar(100) DEFAULT NULL,
  `last_name` varchar(100) DEFAULT NULL,
  `bday` date DEFAULT NULL,
  `drivers_license_number` varchar(100) DEFAULT NULL,
  `connected_facebook_email` varchar(100) NOT NULL,
  `is_facebook_user` varchar(1) NOT NULL,
  `create_date` datetime NOT NULL,
  `update_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`email`, `password`, `first_name`, `last_name`, `bday`, `drivers_license_number`, `connected_facebook_email`, `is_facebook_user`, `create_date`, `update_date`) VALUES
('', '', '', '', '1998-01-01', '', '', 'Y', '2017-02-22 00:54:43', '2017-02-22 00:54:43'),
('alejandro491b@gmail.com', '', 'Alejandro', 'Morales', '1998-01-01', '', 'alejandro491b@gmail.com', 'Y', '2017-02-25 01:44:51', '2017-02-25 01:44:51'),
('alejandrom060595@gmail.com', '', 'Alejandro', 'Morales', '1998-01-01', '', 'alejandrom060595@gmail.com', 'Y', '2017-02-23 17:09:47', '2017-02-23 17:09:47'),
('alejandrom060595@live.com', 'a', 'Alejandro', 'Morales', '2000-01-01', '', '', 'N', '2017-02-27 20:14:46', '2017-02-27 20:14:46'),
('alejandrom060595@yahoo.com', '', 'Alejandro', 'Morales', '1998-01-01', '', 'alejandrom060595@yahoo.com', 'Y', '2017-02-21 01:48:44', '2017-02-21 01:48:44'),
('fernie255@yahoo.com', 'password', 'Fernando', 'Fajardo', '2000-01-01', '7ABCDEF', 'fernie255@yahoo.com', 'N', '2017-01-23 00:29:02', '2017-01-23 00:29:02'),
('test@test.com', 'a', 'a', 'a', '0001-01-01', '1', '', 'N', '2017-02-21 01:37:36', '2017-02-21 01:37:36'),
('user1@gmail.com', '$2y$10$QV0CbHOQMG/duOV/xZnvfevon9h5ZdAcKoAFdAvP6Cedtja9qAuxC', 'first1', 'last1', '2017-01-23', '$2y$10$MEqUmpCtRjStbaWa61QhN.RqDJgzWCdga', 'user1@gmail.com', 'N', '2017-01-23 00:29:02', '2017-04-13 17:26:08'),
('user2@gmail.com', 'password', 'first2', 'last2', '1996-01-01', '5ABC002', 'user2@gmail.com', 'N', '2017-01-23 00:29:02', '2017-01-23 00:29:02'),
('user3@gmail.com', 'password', 'first2', 'last2', '1996-01-01', '5ABC002', 'user3@gmail.com', 'N', '2017-01-23 00:29:02', '2017-01-23 00:29:02'),
('user4@gmail.com', '$2y$10$czAo73afBgdjLR25.imjgOdrGzh0DLBBHUPbJYcuFHs/8i/mtOGLa', 'a', 'a', '1111-01-01', '', '', 'N', '2017-04-13 03:46:19', '2017-04-13 03:46:19'),
('user5@gmail.com', '$2y$10$bZ0/n.vlGLW1/U.kbdunNuDOq1eZchQU8ITL2AsLGetdSczDw0XGS', 'a', 'a', '1111-11-11', '', '', 'N', '2017-04-13 04:28:14', '2017-04-13 04:28:47'),
('user6@gmail.com', '$2y$10$SbOAkBUmgMkgnUWekYKdJOFQJ7XNd3.0yR5RHi5j4ZH8Qbfj5pi/W', 'a', 'a', '1111-01-01', '', '', 'N', '2017-05-04 17:25:39', '2017-05-04 17:25:39');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`message_id`);

--
-- Indexes for table `ratings`
--
ALTER TABLE `ratings`
  ADD PRIMARY KEY (`route_id`,`rating_type`,`username`,`username_rated`);

--
-- Indexes for table `reset_requests`
--
ALTER TABLE `reset_requests`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `routes`
--
ALTER TABLE `routes`
  ADD PRIMARY KEY (`route_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `messages`
--
ALTER TABLE `messages`
  MODIFY `message_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=27;
--
-- AUTO_INCREMENT for table `routes`
--
ALTER TABLE `routes`
  MODIFY `route_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=12;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
