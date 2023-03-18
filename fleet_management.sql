-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 18, 2023 at 09:55 PM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `fleet_management`
--

-- --------------------------------------------------------

--
-- Table structure for table `booked_trip_seats`
--

CREATE TABLE `booked_trip_seats` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `seat_number` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `trip_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `start_station_id` bigint(20) UNSIGNED NOT NULL,
  `end_station_id` bigint(20) UNSIGNED NOT NULL,
  `trip_seat_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `booked_trip_seats`
--

INSERT INTO `booked_trip_seats` (`id`, `seat_number`, `trip_id`, `user_id`, `start_station_id`, `end_station_id`, `trip_seat_id`, `created_at`, `updated_at`) VALUES
(1, 'ABC10-1', 1, 1, 1, 5, 1, '2023-03-18 14:55:07', '2023-03-18 14:55:07'),
(4, 'ABC10-2', 1, 1, 1, 5, 2, '2023-03-18 15:03:43', '2023-03-18 15:03:43'),
(5, 'ABC10-2', 1, 1, 5, 9, 2, '2023-03-18 15:07:59', '2023-03-18 15:07:59'),
(13, 'ABC30-1', 3, 2, 9, 7, 25, '2023-03-18 17:40:21', '2023-03-18 17:40:21'),
(14, 'ABC30-1', 3, 2, 7, 5, 25, '2023-03-18 17:40:35', '2023-03-18 17:40:35');

-- --------------------------------------------------------

--
-- Table structure for table `buses`
--

CREATE TABLE `buses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `bus_number` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `number_of_seats` tinyint(3) UNSIGNED NOT NULL DEFAULT 12,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `buses`
--

INSERT INTO `buses` (`id`, `bus_number`, `number_of_seats`, `created_at`, `updated_at`) VALUES
(1, 'ABC10', 12, NULL, NULL),
(2, 'ABC20', 12, NULL, NULL),
(3, 'ABC30', 12, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_reset_tokens_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2023_03_18_105350_create_buses_table', 1),
(6, '2023_03_18_105359_create_stations_table', 1),
(7, '2023_03_18_105501_create_trips_table', 1),
(8, '2023_03_18_105550_create_trip_seats_table', 1),
(9, '2023_03_18_112343_create_booked_trip_seats_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `personal_access_tokens`
--

INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES
(1, 'App\\Models\\User', 2, '', '15e8c471ee9e40de8039eedd2f299477841a05ddf8fbf055a5ec3e0563e6d55f', '[]', NULL, NULL, '2023-03-18 18:08:53', '2023-03-18 18:08:53'),
(2, 'App\\Models\\User', 2, '', '2f71bf21a93bc7b7c7a04fa4e3b284200958a9b8110344d792eb173a315b04a2', '[]', NULL, NULL, '2023-03-18 18:11:38', '2023-03-18 18:11:38'),
(3, 'App\\Models\\User', 2, '', '2bd5196a759f899f656aa60ef87d864d3a58a4d3b91f127f0dafdce2dcef39fc', '[]', NULL, NULL, '2023-03-18 18:19:34', '2023-03-18 18:19:34'),
(4, 'App\\Models\\User', 2, '', '38f64316370d939ba699e0d4a05760c80685bea9153bda5ee250874e5019e136', '[]', '2023-03-18 18:27:53', NULL, '2023-03-18 18:25:21', '2023-03-18 18:27:53'),
(5, 'App\\Models\\User', 2, '', 'ea1fb69694679927e03f5244678195ba5ad77117e96d3ecd6a20d43c0633a8b0', '[]', NULL, NULL, '2023-03-18 18:27:35', '2023-03-18 18:27:35'),
(6, 'App\\Models\\User', 2, '', 'a4fb6485db144366202784781cfa0090d15b4a1f90f31e61e2b6caa346aa765e', '[]', NULL, NULL, '2023-03-18 18:28:07', '2023-03-18 18:28:07'),
(7, 'App\\Models\\User', 2, '', 'd25a23bad2918ce87381f8a7620b722322367f5be4f41478c0a61fccee5f7fca', '[]', NULL, NULL, '2023-03-18 18:28:27', '2023-03-18 18:28:27'),
(8, 'App\\Models\\User', 2, '', 'fd2d9321cca48ef44d2081312fd433b0a005adc894dddbb25037064a14f22d8a', '[]', NULL, NULL, '2023-03-18 18:35:24', '2023-03-18 18:35:24');

-- --------------------------------------------------------

--
-- Table structure for table `stations`
--

CREATE TABLE `stations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `stations`
--

INSERT INTO `stations` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'Cairo', NULL, NULL),
(2, 'Giza', NULL, NULL),
(3, 'AlFayyum', NULL, NULL),
(4, 'AlMinya', NULL, NULL),
(5, 'Asyut', NULL, NULL),
(6, 'Suhag', NULL, NULL),
(7, 'Qena', NULL, NULL),
(8, 'Luxor', NULL, NULL),
(9, 'Aswan', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `trips`
--

CREATE TABLE `trips` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `bus_id` bigint(20) UNSIGNED NOT NULL,
  `start_station_id` bigint(20) UNSIGNED NOT NULL,
  `end_station_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `trips`
--

INSERT INTO `trips` (`id`, `bus_id`, `start_station_id`, `end_station_id`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 8, '2023-03-18 10:45:48', '2023-03-18 10:45:48'),
(2, 2, 3, 6, '2023-03-18 10:45:48', '2023-03-18 10:45:48'),
(3, 3, 9, 5, '2023-03-18 10:45:48', '2023-03-18 10:45:48');

-- --------------------------------------------------------

--
-- Table structure for table `trip_seats`
--

CREATE TABLE `trip_seats` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `trip_id` bigint(20) UNSIGNED NOT NULL,
  `seat_number` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `trip_seats`
--

INSERT INTO `trip_seats` (`id`, `trip_id`, `seat_number`, `created_at`, `updated_at`) VALUES
(1, 1, 'ABC10-1', '2023-03-18 10:45:48', '2023-03-18 10:45:48'),
(2, 1, 'ABC10-2', '2023-03-18 10:45:48', '2023-03-18 10:45:48'),
(3, 1, 'ABC10-3', '2023-03-18 10:45:48', '2023-03-18 10:45:48'),
(4, 1, 'ABC10-4', '2023-03-18 10:45:48', '2023-03-18 10:45:48'),
(5, 1, 'ABC10-5', '2023-03-18 10:45:48', '2023-03-18 10:45:48'),
(6, 1, 'ABC10-6', '2023-03-18 10:45:48', '2023-03-18 10:45:48'),
(7, 1, 'ABC10-7', '2023-03-18 10:45:48', '2023-03-18 10:45:48'),
(8, 1, 'ABC10-8', '2023-03-18 10:45:48', '2023-03-18 10:45:48'),
(9, 1, 'ABC10-9', '2023-03-18 10:45:48', '2023-03-18 10:45:48'),
(10, 1, 'ABC10-10', '2023-03-18 10:45:48', '2023-03-18 10:45:48'),
(11, 1, 'ABC10-11', '2023-03-18 10:45:48', '2023-03-18 10:45:48'),
(12, 1, 'ABC10-12', '2023-03-18 10:45:48', '2023-03-18 10:45:48'),
(13, 2, 'ABC20-1', '2023-03-18 10:45:48', '2023-03-18 10:45:48'),
(14, 2, 'ABC20-2', '2023-03-18 10:45:48', '2023-03-18 10:45:48'),
(15, 2, 'ABC20-3', '2023-03-18 10:45:48', '2023-03-18 10:45:48'),
(16, 2, 'ABC20-4', '2023-03-18 10:45:48', '2023-03-18 10:45:48'),
(17, 2, 'ABC20-5', '2023-03-18 10:45:48', '2023-03-18 10:45:48'),
(18, 2, 'ABC20-6', '2023-03-18 10:45:48', '2023-03-18 10:45:48'),
(19, 2, 'ABC20-7', '2023-03-18 10:45:48', '2023-03-18 10:45:48'),
(20, 2, 'ABC20-8', '2023-03-18 10:45:48', '2023-03-18 10:45:48'),
(21, 2, 'ABC20-9', '2023-03-18 10:45:48', '2023-03-18 10:45:48'),
(22, 2, 'ABC20-10', '2023-03-18 10:45:48', '2023-03-18 10:45:48'),
(23, 2, 'ABC20-11', '2023-03-18 10:45:48', '2023-03-18 10:45:48'),
(24, 2, 'ABC20-12', '2023-03-18 10:45:48', '2023-03-18 10:45:48'),
(25, 3, 'ABC30-1', '2023-03-18 10:45:48', '2023-03-18 10:45:48'),
(26, 3, 'ABC30-2', '2023-03-18 10:45:48', '2023-03-18 10:45:48'),
(27, 3, 'ABC30-3', '2023-03-18 10:45:48', '2023-03-18 10:45:48'),
(28, 3, 'ABC30-4', '2023-03-18 10:45:48', '2023-03-18 10:45:48'),
(29, 3, 'ABC30-5', '2023-03-18 10:45:48', '2023-03-18 10:45:48'),
(30, 3, 'ABC30-6', '2023-03-18 10:45:48', '2023-03-18 10:45:48'),
(31, 3, 'ABC30-7', '2023-03-18 10:45:48', '2023-03-18 10:45:48'),
(32, 3, 'ABC30-8', '2023-03-18 10:45:48', '2023-03-18 10:45:48'),
(33, 3, 'ABC30-9', '2023-03-18 10:45:48', '2023-03-18 10:45:48'),
(34, 3, 'ABC30-10', '2023-03-18 10:45:48', '2023-03-18 10:45:48'),
(35, 3, 'ABC30-11', '2023-03-18 10:45:48', '2023-03-18 10:45:48'),
(36, 3, 'ABC30-12', '2023-03-18 10:45:48', '2023-03-18 10:45:48');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Abdullah', 'abdullah@test.com', NULL, '$2y$10$4Vhq/umMRe2vnrSwRBaENehdOywKHwy.qnHCGKS74IOR5a3vA8KWy', NULL, '2023-03-18 11:00:50', '2023-03-18 11:00:50'),
(2, 'Test User', 'test_user@test.com', NULL, '$2y$10$URJT7WBc.1lBJeN0Le/gvO.FO0tYYFHo624JbYkPFNod3QguGEYBi', NULL, '2023-03-18 11:00:50', '2023-03-18 11:00:50');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `booked_trip_seats`
--
ALTER TABLE `booked_trip_seats`
  ADD PRIMARY KEY (`id`),
  ADD KEY `booked_trip_seats_trip_id_foreign` (`trip_id`),
  ADD KEY `booked_trip_seats_user_id_foreign` (`user_id`),
  ADD KEY `booked_trip_seats_start_station_id_foreign` (`start_station_id`),
  ADD KEY `booked_trip_seats_end_station_id_foreign` (`end_station_id`),
  ADD KEY `booked_trip_seats_trip_seat_id_foreign` (`trip_seat_id`);

--
-- Indexes for table `buses`
--
ALTER TABLE `buses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `stations`
--
ALTER TABLE `stations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `trips`
--
ALTER TABLE `trips`
  ADD PRIMARY KEY (`id`),
  ADD KEY `trips_bus_id_foreign` (`bus_id`),
  ADD KEY `trips_start_station_id_foreign` (`start_station_id`),
  ADD KEY `trips_end_station_id_foreign` (`end_station_id`);

--
-- Indexes for table `trip_seats`
--
ALTER TABLE `trip_seats`
  ADD PRIMARY KEY (`id`),
  ADD KEY `trip_seats_trip_id_foreign` (`trip_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `booked_trip_seats`
--
ALTER TABLE `booked_trip_seats`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `buses`
--
ALTER TABLE `buses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `stations`
--
ALTER TABLE `stations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `trips`
--
ALTER TABLE `trips`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `trip_seats`
--
ALTER TABLE `trip_seats`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `booked_trip_seats`
--
ALTER TABLE `booked_trip_seats`
  ADD CONSTRAINT `booked_trip_seats_end_station_id_foreign` FOREIGN KEY (`end_station_id`) REFERENCES `stations` (`id`),
  ADD CONSTRAINT `booked_trip_seats_start_station_id_foreign` FOREIGN KEY (`start_station_id`) REFERENCES `stations` (`id`),
  ADD CONSTRAINT `booked_trip_seats_trip_id_foreign` FOREIGN KEY (`trip_id`) REFERENCES `trips` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `booked_trip_seats_trip_seat_id_foreign` FOREIGN KEY (`trip_seat_id`) REFERENCES `trip_seats` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `booked_trip_seats_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `trips`
--
ALTER TABLE `trips`
  ADD CONSTRAINT `trips_bus_id_foreign` FOREIGN KEY (`bus_id`) REFERENCES `buses` (`id`),
  ADD CONSTRAINT `trips_end_station_id_foreign` FOREIGN KEY (`end_station_id`) REFERENCES `stations` (`id`),
  ADD CONSTRAINT `trips_start_station_id_foreign` FOREIGN KEY (`start_station_id`) REFERENCES `stations` (`id`);

--
-- Constraints for table `trip_seats`
--
ALTER TABLE `trip_seats`
  ADD CONSTRAINT `trip_seats_trip_id_foreign` FOREIGN KEY (`trip_id`) REFERENCES `trips` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
