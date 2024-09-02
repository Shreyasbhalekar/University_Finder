-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3307
-- Generation Time: Sep 02, 2024 at 06:26 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `university_finder`
--

-- --------------------------------------------------------

--
-- Table structure for table `certificates`
--

CREATE TABLE `certificates` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `certificate_path` varchar(255) NOT NULL,
  `uploaded_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `certificate` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `certificates`
--

INSERT INTO `certificates` (`id`, `user_id`, `certificate_path`, `uploaded_at`, `certificate`) VALUES
(1, 3, '', '2024-09-02 14:42:05', 'uploads/certificates/Picture1.jpg'),
(2, 3, '', '2024-09-02 14:52:39', 'uploads/certificates/Picture1.jpg'),
(3, 3, '', '2024-09-02 14:52:45', 'uploads/certificates/Picture1.jpg'),
(4, 3, '', '2024-09-02 14:52:49', 'uploads/certificates/Picture1.jpg'),
(5, 3, '', '2024-09-02 15:11:39', 'uploads/certificates/Picture1.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `contact`
--

CREATE TABLE `contact` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `message` text DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `contact`
--

INSERT INTO `contact` (`id`, `user_id`, `name`, `email`, `message`, `created_at`) VALUES
(1, 1, 'goldy', 'goldy@gmail.com', 'vdbdb', '2024-09-01 12:32:24'),
(2, 1, 'goldy', 'goldy@gmail.com', 'vdbdb', '2024-09-01 12:32:40'),
(3, 1, 'goldy', 'goldy@gmail.com', 'vdbdb', '2024-09-01 12:35:45'),
(4, 1, 'goldy', 'goldy@gmail.com', 'website lags so much', '2024-09-01 12:35:58'),
(5, 1, 'goldy', 'goldy@gmail.com', 'bgfbgfnf', '2024-09-02 13:42:05');

-- --------------------------------------------------------

--
-- Table structure for table `reviews`
--

CREATE TABLE `reviews` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `review` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `reviews`
--

INSERT INTO `reviews` (`id`, `user_id`, `name`, `email`, `review`, `created_at`) VALUES
(1, 1, 'goldy', 'goldy@gmail.com', 'this is a good website', '2024-09-01 07:17:02'),
(2, 1, 'goldy', 'goldy@gmail.com', 'Needs improvement ', '2024-09-01 07:17:57'),
(3, 1, 'goldy', 'goldy@gmail.com', 'vsfgdfhdf', '2024-09-02 09:15:00');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `phonenumber` bigint(20) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `cet_marks` int(11) DEFAULT NULL,
  `tenth_marks` int(11) DEFAULT NULL,
  `twelfth_marks` int(11) DEFAULT NULL,
  `profile_picture` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `email`, `password`, `phonenumber`, `address`, `cet_marks`, `tenth_marks`, `twelfth_marks`, `profile_picture`) VALUES
(1, 'goldy', 'goldy@gmail.com', '$2y$10$Ln7LpgnbJkvImU5anMJTjOrqHTY1pT1RfPZnyP8TEh7cJkQZq6/2G', 2910392840, 'Mumbai', NULL, NULL, NULL, NULL),
(2, 'Aatif', 'aatif@gmail.com', '$2y$10$U5iLFwMVR84FHLB6KGIPw.0P3g4ugl8izLFlpfS/eUEC5cPXNS5iW', 2041837410, 'Mumbra', NULL, NULL, NULL, NULL),
(3, 'Sam', 'sam@gmail.com', '$2y$10$xPrVJ44JRTpTS4hZC1aBnOzemqYXNach.aLssCJ5LZF4Z0exJM/fm', 4204819482, 'bhiwandi', 86, 80, 77, 'uploads/person.jpg'),
(4, 'Max', 'max@gmail.com', '$2y$10$HhcalWtY8pK/0byKF3DZkuGGERmUdRKdgBbB3M/X1JJX3Jizmoy.e', 3492848218, 'Mumbai', NULL, NULL, NULL, NULL),
(5, 'Jack', 'jack@gmail.com', '$2y$10$GiqCd2ZFplmnGnl7nOhx0etGO4CHn.A9HWmu5Uypltwind73eSeA2', 0, 'jhjk', NULL, NULL, NULL, NULL),
(8, 'hardy', 'hardy@gmail.com', '$2y$10$l48lijh0UtQlowJgfs1RruBEDaUvdXEAWk3vQ7JBaQD3iLdnAVTby', 2892744022, 'thane', NULL, NULL, NULL, NULL),
(9, 'garry', 'garry@gmail.com', '$2y$10$PN.vsaYphpm9b8U7715QvO2xdfLF2Q89cceFCedr2CS04ig7fsn2C', 4920462946, 'Ambernath', NULL, NULL, NULL, NULL),
(10, 'harry', 'harry@gmail.com', '$2y$10$h2i9T7X.EG0U21LqbxBdO.Hrj5PuIaDH.NV4Pg/ZXOWjNCY20H2rm', 5027304028, 'thane', NULL, NULL, NULL, NULL),
(11, 'william', 'william@gmail.com', '$2y$10$16I86cl7mWQCQvO59CYFke7MAyA5aRbpcTJtvqN88FsVZTGVq2XyG', 1937402749, 'Goregaon', NULL, NULL, NULL, NULL),
(13, 'Johnson', 'js@gmail.com', '$2y$10$hLxEQwgWdG2tPeYghKMM7eDVgk8Sd//AEY3l4HgjJN0sdhnGKgegy', 5839204853, 'Churchgate', NULL, NULL, NULL, NULL),
(17, 'billy', 'billy@gmail.com', '$2y$10$SxNvFxAdKzJ7PMuc7kbFhOmjRmbVJpPZchWErRC9gYMkqWaRrS3yi', 4534323142, 'haryana', NULL, NULL, NULL, NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `certificates`
--
ALTER TABLE `certificates`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `contact`
--
ALTER TABLE `contact`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `reviews`
--
ALTER TABLE `reviews`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `phonenumber` (`phonenumber`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `certificates`
--
ALTER TABLE `certificates`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `contact`
--
ALTER TABLE `contact`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `reviews`
--
ALTER TABLE `reviews`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `certificates`
--
ALTER TABLE `certificates`
  ADD CONSTRAINT `certificates_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `contact`
--
ALTER TABLE `contact`
  ADD CONSTRAINT `contact_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `reviews`
--
ALTER TABLE `reviews`
  ADD CONSTRAINT `reviews_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
