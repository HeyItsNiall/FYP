-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 15, 2023 at 10:57 PM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `pita1`
--

-- --------------------------------------------------------

--
-- Table structure for table `bookings`
--

CREATE TABLE `bookings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `cust_name` varchar(255) DEFAULT NULL,
  `cust_email` varchar(255) DEFAULT NULL,
  `cust_phone` varchar(255) DEFAULT NULL,
  `furniture_type` varchar(255) DEFAULT NULL,
  `repair_details` varchar(255) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `time_slot` time DEFAULT NULL,
  `images` varchar(255) DEFAULT NULL,
  `user_id` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `bookings`
--

INSERT INTO `bookings` (`id`, `cust_name`, `cust_email`, `cust_phone`, `furniture_type`, `repair_details`, `date`, `time_slot`, `images`, `user_id`, `created_at`, `updated_at`) VALUES
(1, 'dasdasdad', 'dannialahmad6@gmail.com', '213123123', 'asdasd', 'sdadad', '2023-05-11', '20:18:00', '1683807511.jpg', '4', '2023-05-11 04:18:31', '2023-05-11 04:18:31'),
(2, 'helmi', 'test@mail.com', '1234567890', 'meja', 'patah', '2023-05-11', '20:41:00', '1683808885.jpg', '1', '2023-05-11 04:41:25', '2023-05-11 04:41:25'),
(3, 'test', 'dannialahmad6@gmail.com', '123456789', 'sofa', 'patah', '2023-05-12', '21:23:00', '1683811403.jpg', '4', '2023-05-11 05:23:23', '2023-05-11 05:23:23'),
(4, 'acap', 'dannialahmad6@gmail.com', '12345678', 'sofa', 'patah', '2023-05-19', '12:41:00', '1684384927.png', '4', '2023-05-17 20:42:07', '2023-05-17 20:42:07'),
(5, 'test', 'dannialahmad6@gmail.com', '987654321', 'test', 'test', '2023-05-18', '12:56:00', '1684385845.png', '4', '2023-05-17 20:57:25', '2023-05-17 20:57:25'),
(6, 'acap', 'test@mail.com', '123456789', 'acap', 'acap', '2023-05-18', '13:00:00', '1684386041.png', '1', '2023-05-17 21:00:41', '2023-05-17 21:00:41'),
(7, 'hazman', 'man@gmail.copm', '013873872', 'sofa', 'kkoyak', '2023-05-31', '23:46:00', '1685458005.png', '4', '2023-05-30 06:46:45', '2023-05-30 06:46:45');

-- --------------------------------------------------------

--
-- Table structure for table `carts`
--

CREATE TABLE `carts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `product_title` varchar(255) DEFAULT NULL,
  `quantity` varchar(255) DEFAULT NULL,
  `price` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `product_id` varchar(255) DEFAULT NULL,
  `user_id` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `category_name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `category_name`, `created_at`, `updated_at`) VALUES
(1, 'test', '2023-03-24 07:31:22', '2023-03-24 07:31:22'),
(2, 'new test', '2023-03-24 07:35:20', '2023-03-24 07:35:20'),
(10, 'mainan', '2023-03-27 13:46:09', '2023-03-27 13:46:09');

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE `comments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `comment` varchar(255) DEFAULT NULL,
  `user_id` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `comments`
--

INSERT INTO `comments` (`id`, `name`, `comment`, `user_id`, `created_at`, `updated_at`) VALUES
(1, 'Dannial', 'test test test ', '4', '2023-04-02 08:33:21', '2023-04-02 08:33:21'),
(3, 'Dannial', 'test saya hensem', '4', '2023-04-02 08:43:11', '2023-04-02 08:43:11'),
(4, 'test', 'tapi saya lagi hensem', '1', '2023-04-02 10:51:36', '2023-04-02 10:51:36');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2014_10_12_200000_add_two_factor_columns_to_users_table', 1),
(4, '2019_08_19_000000_create_failed_jobs_table', 1),
(5, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(6, '2023_03_23_180424_create_sessions_table', 1),
(7, '2023_03_24_152503_create_categories_table', 2),
(8, '2023_03_24_165014_create_products_table', 3),
(9, '2023_03_26_150019_create_carts_table', 4),
(10, '2023_03_27_042434_create_orders_table', 5),
(11, '2023_03_28_191105_create_notifications_table', 6),
(12, '2023_04_02_162058_create_comments_table', 7),
(13, '2023_04_02_162128_create_replies_table', 7),
(15, '2014_10_12_000000_create_users_table', 1),
(16, '2014_10_12_100000_create_password_resets_table', 1),
(17, '2014_10_12_200000_add_two_factor_columns_to_users_table', 1),
(18, '2019_08_19_000000_create_failed_jobs_table', 1),
(19, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(20, '2023_03_23_180424_create_sessions_table', 1),
(21, '2023_03_24_152503_create_categories_table', 1),
(22, '2023_03_24_165014_create_products_table', 1),
(23, '2023_03_26_150019_create_carts_table', 1),
(24, '2023_03_27_042434_create_orders_table', 1),
(25, '2023_03_28_191105_create_notifications_table', 1),
(26, '2023_04_02_162058_create_comments_table', 1),
(27, '2023_04_02_162128_create_replies_table', 1),
(28, '2023_05_10_094034_create_bookings_table', 1),
(29, '2023_06_13_191813_create_stocks_table', 8),
(30, '2023_06_13_200710_create_stocks_table', 9);

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` char(36) NOT NULL,
  `type` varchar(255) NOT NULL,
  `notifiable_type` varchar(255) NOT NULL,
  `notifiable_id` bigint(20) UNSIGNED NOT NULL,
  `data` text NOT NULL,
  `read_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `user_id` varchar(255) DEFAULT NULL,
  `product_title` varchar(255) DEFAULT NULL,
  `quantity` varchar(255) DEFAULT NULL,
  `price` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `product_id` varchar(255) DEFAULT NULL,
  `payment_status` varchar(255) DEFAULT NULL,
  `delivery_status` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `name`, `email`, `phone`, `address`, `user_id`, `product_title`, `quantity`, `price`, `image`, `product_id`, `payment_status`, `delivery_status`, `created_at`, `updated_at`) VALUES
(21, 'Dannial', 'dannialahmad6@gmail.com', '123456789', 'pokdin', '4', 'sofa', '1', '180', '1683809950.jpg', '2', 'cash on delivery', 'You cancelled the order', '2023-05-11 05:25:24', '2023-05-11 05:29:37'),
(22, 'Dannial', 'dannialahmad6@gmail.com', '123456789', 'pokdin', '4', 'sofa', '1', '10', '1683810007.jpeg', '8', 'paid', 'delivered', '2023-05-11 05:25:24', '2023-05-11 05:32:43'),
(23, 'Dannial', 'dannialahmad6@gmail.com', '123456789', 'pokdin', '4', 'sofa', '1', '150', '1683810075.jpg', '12', 'cash on delivery', 'processing', '2023-05-30 06:44:48', '2023-05-30 06:44:48'),
(24, 'Dannial', 'dannialahmad6@gmail.com', '123456789', 'pokdin', '4', 'sofa', '1', '10', '1683810007.jpeg', '8', 'cash on delivery', 'processing', '2023-05-30 06:44:48', '2023-05-30 06:44:48'),
(25, 'Dannial', 'dannialahmad6@gmail.com', '123456789', 'pokdin', '4', 'sofa', '1', '350', '1683810042.jpeg', '9', 'cash on delivery', 'processing', '2023-05-30 06:44:48', '2023-05-30 06:44:48'),
(26, 'Dannial', 'dannialahmad6@gmail.com', '123456789', 'pokdin', '4', 'interim', '2', '20', '1683811893.jpg', '13', 'cash on delivery', 'processing', '2023-06-13 20:08:52', '2023-06-13 20:08:52'),
(27, 'Dannial', 'dannialahmad6@gmail.com', '123456789', 'pokdin', '4', 'sofa', '5', '900', '1683809950.jpg', '2', 'cash on delivery', 'processing', '2023-06-13 20:08:52', '2023-06-13 20:08:52'),
(28, 'Dannial', 'dannialahmad6@gmail.com', '123456789', 'pokdin', '4', 'sofa', '1', '350', '1683810042.jpeg', '9', 'paid', 'delivered', '2023-06-13 20:08:52', '2023-06-13 20:09:49'),
(29, 'Dannial', 'dannialahmad6@gmail.com', '123456789', 'pokdin', '4', 'sofa', '1', '180', '1683809950.jpg', '2', 'cash on delivery', 'processing', '2023-06-15 06:58:17', '2023-06-15 06:58:17'),
(30, 'Dannial', 'dannialahmad6@gmail.com', '123456789', 'pokdin', '4', 'sofa', '1', '10', '1683810007.jpeg', '8', 'Paid', 'processing', '2023-06-15 07:04:58', '2023-06-15 07:04:58');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `category` varchar(255) DEFAULT NULL,
  `quantity` varchar(255) DEFAULT NULL,
  `price` varchar(255) DEFAULT NULL,
  `discount_price` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `title`, `description`, `image`, `category`, `quantity`, `price`, `discount_price`, `created_at`, `updated_at`) VALUES
(2, 'sofa', 'sofa', '1683809950.jpg', 'test', '10', '198', '180', '2023-03-25 02:52:53', '2023-05-11 04:59:10'),
(8, 'sofa', 'sofa', '1683810007.jpeg', 'new test', '1', '200', '10', '2023-03-25 09:16:21', '2023-05-11 05:00:07'),
(9, 'sofa', 'sofa', '1683810042.jpeg', 'test', '1', '350', NULL, '2023-03-25 09:16:54', '2023-05-11 05:00:42'),
(13, 'interim', 'interim', '1683811893.jpg', 'test', '1', '250', '10', '2023-05-11 05:31:09', '2023-05-11 05:31:33');

-- --------------------------------------------------------

--
-- Table structure for table `replies`
--

CREATE TABLE `replies` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `comment_id` varchar(255) DEFAULT NULL,
  `reply` varchar(255) DEFAULT NULL,
  `user_id` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `replies`
--

INSERT INTO `replies` (`id`, `name`, `comment_id`, `reply`, `user_id`, `created_at`, `updated_at`) VALUES
(1, 'test', '1', 'reply test test test', '1', '2023-04-02 10:41:50', '2023-04-02 10:41:50'),
(2, 'test', '1', 'hahahahaha', '1', '2023-04-02 10:49:07', '2023-04-02 10:49:07'),
(3, 'test', '3', 'saya hensem', '1', '2023-04-02 10:51:18', '2023-04-02 10:51:18'),
(4, 'test', '1', 'new test test test', '1', '2023-04-02 10:52:43', '2023-04-02 10:52:43'),
(5, 'test', '1', 'saya lagi hensem', '1', '2023-04-02 10:55:30', '2023-04-02 10:55:30'),
(6, 'test', '3', 'awak memang hensem', '1', '2023-04-02 13:51:17', '2023-04-02 13:51:17');

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `payload` longtext NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('8MG4RrQsoguBLQF3AVQY5UIaEHPxDfCS5Zw95SA8', 3, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiMTNWMXJpWng0MFBnV2poR2JQdndCdVVUWHVpVlJQUlg1dGx6TzBrTyI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzA6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9yZWRpcmVjdCI7fXM6NTA6ImxvZ2luX3dlYl81OWJhMzZhZGRjMmIyZjk0MDE1ODBmMDE0YzdmNThlYTRlMzA5ODlkIjtpOjM7fQ==', 1686763603),
('kqDijcXqf5Mownnm6RvWyHAxkgd9gaXrZQ8g4g5d', 2, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiSklmQXlLbjdvMXRxTFRBVjFXNzNGRVREbUVrcVFhcENuWTMxeFNoeiI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzA6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9yZWRpcmVjdCI7fXM6NTA6ImxvZ2luX3dlYl81OWJhMzZhZGRjMmIyZjk0MDE1ODBmMDE0YzdmNThlYTRlMzA5ODlkIjtpOjI7fQ==', 1686735945),
('xoWhbWJKUEL48Dz75E58h6tWizeWv40wFqFNepKi', 4, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiZXhvbzhvalVmTUhpTkRmYm5GbVNsSloxSnlXdEQ5TmVVTkF5ektWdyI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzI6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9zaG93X29yZGVyIjt9czo1MDoibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiO2k6NDt9', 1686841511);

-- --------------------------------------------------------

--
-- Table structure for table `stocks`
--

CREATE TABLE `stocks` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `materials_name` varchar(255) DEFAULT NULL,
  `quantity` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `stocks`
--

INSERT INTO `stocks` (`id`, `materials_name`, `quantity`, `created_at`, `updated_at`) VALUES
(1, 'dannial', '10', '2023-06-13 12:29:26', '2023-06-13 12:29:26'),
(2, 'nizar', '12', '2023-06-13 12:30:44', '2023-06-13 12:30:44'),
(3, 'progress', '2', '2023-06-13 20:03:11', '2023-06-13 20:03:11'),
(4, 'syafiq', '1', '2023-06-13 23:40:23', '2023-06-13 23:40:23');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `usertype` varchar(255) NOT NULL DEFAULT '0',
  `phone` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `two_factor_secret` text DEFAULT NULL,
  `two_factor_recovery_codes` text DEFAULT NULL,
  `two_factor_confirmed_at` timestamp NULL DEFAULT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `current_team_id` bigint(20) UNSIGNED DEFAULT NULL,
  `profile_photo_path` varchar(2048) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `usertype`, `phone`, `address`, `email_verified_at`, `password`, `two_factor_secret`, `two_factor_recovery_codes`, `two_factor_confirmed_at`, `remember_token`, `current_team_id`, `profile_photo_path`, `created_at`, `updated_at`) VALUES
(1, 'test', 'test@mail.com', '0', '123456789', 'testtesttest', '2023-03-28 18:40:27', '$2y$10$snXcN8hj/CrJlU2bTHJOheASAP7dy6iDmlAjfgHMburxj4s0M12Gu', NULL, NULL, NULL, NULL, NULL, NULL, '2023-03-23 10:17:06', '2023-05-11 05:08:34'),
(2, 'admin', 'admin@mail.com', '1', '123456789', 'testtesttesttest', '2023-03-28 16:00:00', '$2y$10$QB3o10SPoPHANQjLSeY6uuGNBnLgwrFzxaXZZTKaL1iSM46JTIDfS', NULL, NULL, NULL, NULL, NULL, NULL, '2023-03-23 10:18:14', '2023-03-23 10:18:14'),
(3, 'supplier', 'supplier@mail.com', '3', '01128829143', 'pokdin', '2023-12-28 18:41:34', '$2y$10$j4tpoB5i0xPUW659cQybA.T/Qs4qM0AQKpj0.C455DaeqjHeaggOu', NULL, NULL, NULL, NULL, NULL, NULL, '2023-03-26 19:55:07', '2023-06-13 06:19:04'),
(4, 'Dannial', 'dannialahmad6@gmail.com', '0', '123456789', 'pokdin', '2023-03-28 10:37:42', '$2y$10$sqFwk3e64PQO9Ks0q3U.e.8yTH1kGlUStcCxRZKZS1IzrPOkw/eim', NULL, NULL, NULL, 'f5SPqCdVDG9MceYpyrript40QVhow3lSGABLZKilg5YUC6oq8Dry0TItwEMw', NULL, NULL, '2023-03-28 10:37:19', '2023-03-28 10:43:43'),
(5, 'man', 'varenig813@cyclesat.com', '0', '1234567890', 'pokdin', '2023-03-29 13:25:31', '$2y$10$mhy1DB2QZS6p4i8tSIPhWe1V0yMmHbjnN6okGPeu/Dm2RVVD4fTrW', NULL, NULL, NULL, NULL, NULL, NULL, '2023-03-29 13:25:16', '2023-03-29 13:25:31'),
(6, 'transporter', 'dannialdzulkarnain9@gmail.com', '2', '123456789', 'Taman Jasmin', '2023-06-11 06:56:54', '$2y$10$2j.az4P6wYNdI3uT2gcLkeBj73d5P/x0kzIqkCLN7hO8XzcoYc8Im', NULL, NULL, NULL, NULL, NULL, NULL, '2023-06-11 06:56:28', '2023-06-11 06:56:54');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bookings`
--
ALTER TABLE `bookings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `carts`
--
ALTER TABLE `carts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
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
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `notifications_notifiable_type_notifiable_id_index` (`notifiable_type`,`notifiable_id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `replies`
--
ALTER TABLE `replies`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indexes for table `stocks`
--
ALTER TABLE `stocks`
  ADD PRIMARY KEY (`id`);

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
-- AUTO_INCREMENT for table `bookings`
--
ALTER TABLE `bookings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `carts`
--
ALTER TABLE `carts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `replies`
--
ALTER TABLE `replies`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `stocks`
--
ALTER TABLE `stocks`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
