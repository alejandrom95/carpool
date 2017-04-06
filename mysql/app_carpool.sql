-- phpMyAdmin SQL Dump
-- version 4.4.6
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Apr 07, 2017 at 01:43 AM
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
  `message_text` varchar(1000) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `messages`
--

INSERT INTO `messages` (`message_id`, `route_id`, `thread_name`, `username`, `message_text`) VALUES
(1, 1, 'user1@gmail.com', 'user1@gmail.com', 'Hi.  I would like to join your ride.  Let me know'),
(2, 1, 'user1@gmail.com', 'fernie255@yahoo.com', 'How flexible are you in he departure time?'),
(3, 1, 'user1@gmail.com', 'user1@gmail.com', 'I can leave whenever you want to.'),
(4, 1, 'user1@gmail.com', 'fernie255@yahoo.com', 'Ok.  I''ll let you know.'),
(5, 2, 'user1@gmail.com', 'user1@gmail.com', 'Hi.  I would like to join your 2nd ride.  Let me know'),
(6, 2, 'user1@gmail.com', 'fernie255@yahoo.com', 'How flexible are you in he 2nd departure time?'),
(7, 2, 'user1@gmail.com', 'user1@gmail.com', 'I can leave whenever you want to go on 2nd ride.'),
(8, 2, 'user1@gmail.com', 'fernie255@yahoo.com', 'Ok.  I''ll let you know about the 2nd ride.'),
(9, 2, 'user1@gmail.com', 'fernie255@yahoo.com', 'I''m going to leave 1 hour later on the 2nd ride.'),
(10, 3, 'fernie255@yahoo.com', 'fernie255@yahoo.com', 'How flexible are you in he 3nd departure time?'),
(11, 3, 'fernie255@yahoo.com', 'user1@gmail.com', 'I can leave whenever you want to go on 3nd ride.'),
(12, 1, 'user2@gmail.com', 'user2@gmail.com', 'Are you still doing this ride?'),
(13, 1, 'user2@gmail.com', 'fernie255@yahon.com', 'Yes.'),
(14, 4, 'user2@gmail.com', 'user2@gmail.com', 'Yes.'),
(15, 4, 'fernie255@yahoo.com', 'fernie255@yahoo.com', 'Yes no.'),
(16, 7, 'user2@gmail.com', 'user1@gmail.com', 'a'),
(17, 7, 'user2@gmail.com', 'user1@gmail.com', 'You are now the driver for route_id=7'),
(18, 7, 'user2@gmail.com', 'user2@gmail.com', 'You have been added to route_id=7');

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
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

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
(7, 'user1@gmail.com', 'Long Beach, CA, United States', 33.7700504, -118.19373949999999, 'ChIJWdeZQOjKwoARqo8qxPo6AKE', 'Long Beach Airport, Donald Douglas Drive, Long Beach, CA, United States', 33.8182652, -118.14454160000003, 'ChIJhQxDwTYy3YAR_ydWCFAr1wM', '2017-03-16 15:37:00', '2017-03-16 20:37:00', '2017-03-16 15:37:40', 'CLOSED', 'OFFER');

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
  `drivers_license_number` varchar(40) DEFAULT NULL,
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
('user1@gmail.com', 'password', 'first1', 'last1', '2017-01-23', '5ABC001', 'user1@gmail.com', 'N', '2017-01-23 00:29:02', '2017-03-15 18:08:13'),
('user2@gmail.com', 'password', 'first2', 'last2', '1996-01-01', '5ABC002', 'user2@gmail.com', 'N', '2017-01-23 00:29:02', '2017-01-23 00:29:02'),
('user3@gmail.com', 'password', 'first2', 'last2', '1996-01-01', '5ABC002', 'user3@gmail.com', 'N', '2017-01-23 00:29:02', '2017-01-23 00:29:02');

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
  MODIFY `message_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=19;
--
-- AUTO_INCREMENT for table `routes`
--
ALTER TABLE `routes`
  MODIFY `route_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=8;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
