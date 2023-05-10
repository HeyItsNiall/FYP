-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 05, 2023 at 05:05 AM
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
-- Database: `test`
--

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

--
-- Dumping data for table `carts`
--

INSERT INTO `carts` (`id`, `name`, `email`, `phone`, `address`, `product_title`, `quantity`, `price`, `image`, `product_id`, `user_id`, `created_at`, `updated_at`) VALUES
(31, 'test', 'test@mail.com', '123456789', 'testtesttest', 'shirt', '10', '1800', '1679741573.jpeg', '2', '1', '2023-04-02 11:32:03', '2023-04-02 14:09:32'),
(32, 'test', 'test@mail.com', '123456789', 'testtesttest', 'testupdatednew', '10', '1100', '1679763828.jpeg', '3', '1', '2023-04-02 11:32:23', '2023-04-02 14:07:50'),
(37, 'test', 'test@mail.com', '123456789', 'testtesttest', 'mainan budak', '5', '50', '1679953626.jpeg', '11', '1', '2023-04-02 14:01:32', '2023-04-02 14:02:11');

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
(13, '2023_04_02_162128_create_replies_table', 7);

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
(8, 'test', 'test@mail.com', '123456789', 'testtesttest', '1', 'syafiq', '1', '1123231', '1679764614.jpeg', '9', 'paid', 'delivered', '2023-03-26 22:59:15', '2023-03-28 07:56:33'),
(9, 'test', 'test@mail.com', '123456789', 'testtesttest', '1', 'testupdatednew', '1', '110', '1679763828.jpeg', '3', 'paid', 'delivered', '2023-03-27 00:16:16', '2023-03-28 13:21:27'),
(10, 'test', 'test@mail.com', '123456789', 'testtesttest', '1', 'shirt', '1', '180', '1679741573.jpeg', '2', 'paid', 'delivered', '2023-03-27 00:16:16', '2023-03-30 10:18:50'),
(11, 'test', 'test@mail.com', '123456789', 'testtesttest', '1', 'syafiq', '1', '1123231', '1679764614.jpeg', '9', 'cash on delivery', 'processing', '2023-03-27 00:17:11', '2023-03-27 00:17:11'),
(12, 'test', 'test@mail.com', '123456789', 'testtesttest', '1', 'shirt', '1', '180', '1679741573.jpeg', '2', 'Paid', 'processing', '2023-03-27 10:41:30', '2023-03-27 10:41:30'),
(13, 'test', 'test@mail.com', '123456789', 'testtesttest', '1', 'shirt', '3', '540', '1679741573.jpeg', '2', 'Paid', 'processing', '2023-03-27 10:41:30', '2023-03-27 10:41:30'),
(14, 'dannial', 'dannial@mail.com', '01128829143', 'pokdin', '3', 'shirt', '1', '180', '1679741573.jpeg', '2', 'paid', 'delivered', '2023-03-27 13:38:03', '2023-03-28 07:57:42'),
(15, 'dannial', 'dannial@mail.com', '01128829143', 'pokdin', '3', 'testupdatednew', '4', '440', '1679763828.jpeg', '3', 'Paid', 'processing', '2023-03-27 13:38:03', '2023-03-27 13:38:03'),
(16, 'Dannial', 'dannialahmad6@gmail.com', '123456789', 'pokdin', '4', 'mainan budak', '5', '50', '1679953626.jpeg', '11', 'paid', 'delivered', '2023-03-28 10:47:57', '2023-03-29 03:28:32'),
(17, 'man', 'varenig813@cyclesat.com', '1234567890', 'pokdin', '5', 'shirt', '10', '1800', '1679741573.jpeg', '2', 'paid', 'delivered', '2023-03-29 13:25:46', '2023-03-29 13:26:52'),
(18, 'test', 'test@mail.com', '123456789', 'testtesttest', '1', 'shirt', '1', '180', '1679741573.jpeg', '2', 'paid', 'delivered', '2023-03-30 10:15:17', '2023-03-30 18:53:52'),
(19, 'Dannial', 'dannialahmad6@gmail.com', '123456789', 'pokdin', '4', 'aris', '1', '32434234', '1679764628.jpeg', '10', 'cash on delivery', 'You cancelled the order', '2023-03-30 18:52:28', '2023-04-02 07:49:49'),
(20, 'Dannial', 'dannialahmad6@gmail.com', '123456789', 'pokdin', '4', 'syafiq', '1', '1123231', '1679764614.jpeg', '9', 'cash on delivery', 'processing', '2023-03-30 18:52:29', '2023-03-30 18:52:29');

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
(2, 'shirt', 'this is a unique shirt', '1679741573.jpeg', 'test', '10', '200', '180', '2023-03-25 02:52:53', '2023-03-25 02:52:53'),
(3, 'testupdatednew', 'testupdatednew', '1679763828.jpeg', 'test', '20', '260', '110', '2023-03-25 02:54:59', '2023-03-25 09:07:05'),
(7, 'dannial', 'test3', '1679764564.jpeg', 'test', '3424234234', '123424', '', '2023-03-25 09:16:04', '2023-03-25 09:16:04'),
(8, 'nadia', 'nadia', '1679764581.jpeg', 'new test', '123123', '12312313', '31231313', '2023-03-25 09:16:21', '2023-03-25 09:16:21'),
(9, 'syafiq', 'syafiq', '1679764614.jpeg', 'test', '123112313123', '1123231', '', '2023-03-25 09:16:54', '2023-03-25 09:16:54'),
(10, 'aris', 'aris', '1679764628.jpeg', 'new test', '2342342', '1234234', '32434234', '2023-03-25 09:17:08', '2023-03-25 09:17:08'),
(11, 'mainan budak', 'mainan budak', '1679953626.jpeg', 'mainan', '15', '20', '10', '2023-03-27 13:47:06', '2023-03-27 13:47:06');

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
('1s1B6j94dmNBcZIkwQpOemAbP647JQ4anMLbjuSp', 4, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/111.0.0.0 Safari/537.36', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiTjViRjRMYTUwVnRMVmdJWjhsWEFWcmFldUl2MGM3MjNUMWJ6YThGWSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzI6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9zaG93X29yZGVyIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo1MDoibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiO2k6NDt9', 1680497466),
('6qZip9W4E5gTpbj8AxchpmWHCJRJ38M65rQJOqCa', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/111.0.0.0 Safari/537.36', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiZTM4RGJlalNYcGtsRGh2a0JkMDJHdWFSQWhOd2o5ellVUUtwZnE3diI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1680576806),
('aGkAXpTX3QY9V7hTNRm64n3XQFDgqHzQEFYEbswS', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/111.0.0.0 Safari/537.36', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiWldmSHZzR3F3ZVRRREtwZUQyaDhYbFZQUVVMV2pBY0k4YWFsZUFyQiI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1680556585),
('DL0HlQhRJbjWOR3zTjqmLaWpzt58hF3CoFaw0A7B', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/111.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiOHBnRllVY2JmbmtwenF6VDdpU0JjWE0xTmVwSjU4Sno0T1FrYlpsTyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1680663921),
('eBxKzkbdANpgIag5z0VU6qRUOuOH9NOWabosHFZz', 6, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/111.0.0.0 Safari/537.36', 'YTo1OntzOjY6Il90b2tlbiI7czo0MDoicjU1azBJMWtGU3QwVjZsTWFIM3RjOERMSXVRNmZaU29ob2R4eWNOayI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzQ6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9lbWFpbC92ZXJpZnkiO31zOjUwOiJsb2dpbl93ZWJfNTliYTM2YWRkYzJiMmY5NDAxNTgwZjAxNGM3ZjU4ZWE0ZTMwOTg5ZCI7aTo2O3M6MzoidXJsIjthOjE6e3M6ODoiaW50ZW5kZWQiO3M6MzA6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9yZWRpcmVjdCI7fX0=', 1680533017),
('L83PMc1BPmR16Y67leCw0Ui4SwZe9SJrcFQw1mt5', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/111.0.0.0 Safari/537.36', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiUTdyYVZWZ2JQZ3p6Vm85V25DUVMxcGVOcHJKMnoxTlpzUFVYNEVodCI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1680547676),
('xoLnRUHUoSerOFN2RQDiyT7KzZ1LwAoSqiGc4XBH', 4, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/111.0.0.0 Safari/537.36', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiT003MHJiS2lXeVA0WEp2enQzRlo3QlQ4ckJhb2Nxakc5dVJQcFlWQiI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7fXM6NTA6ImxvZ2luX3dlYl81OWJhMzZhZGRjMmIyZjk0MDE1ODBmMDE0YzdmNThlYTRlMzA5ODlkIjtpOjQ7fQ==', 1680586991);

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
(1, 'test', 'test@mail.com', '0', '123456789', 'testtesttest', '2023-03-28 18:40:27', '$2y$10$za7PrwJbNWx70MvAyuRLnu6aAghkMKgY6PtID4JZ9W3riUpsEUdOK', NULL, NULL, NULL, NULL, NULL, NULL, '2023-03-23 10:17:06', '2023-03-26 20:33:58'),
(2, 'admin', 'admin@mail.com', '1', '123456789', 'testtesttesttest', '2023-03-28 16:00:00', '$2y$10$QB3o10SPoPHANQjLSeY6uuGNBnLgwrFzxaXZZTKaL1iSM46JTIDfS', NULL, NULL, NULL, NULL, NULL, NULL, '2023-03-23 10:18:14', '2023-03-23 10:18:14'),
(3, 'dannial', 'dannial@mail.com', '0', '01128829143', 'pokdin', '2023-12-28 18:41:34', '$2y$10$DBwFhp4.jgcfpXjxmyUG4.FqYQwaxW.7tX7/KVkhihPv73QPwZzkG', NULL, NULL, NULL, NULL, NULL, NULL, '2023-03-26 19:55:07', '2023-03-26 19:55:07'),
(4, 'Dannial', 'dannialahmad6@gmail.com', '0', '123456789', 'pokdin', '2023-03-28 10:37:42', '$2y$10$sqFwk3e64PQO9Ks0q3U.e.8yTH1kGlUStcCxRZKZS1IzrPOkw/eim', NULL, NULL, NULL, '4ue2h7dx4eGIqvKzob7ZpW75MPMqEwcMHmhpSKrerk91OSGsZHoRgnAV5VqA', NULL, NULL, '2023-03-28 10:37:19', '2023-03-28 10:43:43'),
(5, 'man', 'varenig813@cyclesat.com', '0', '1234567890', 'pokdin', '2023-03-29 13:25:31', '$2y$10$mhy1DB2QZS6p4i8tSIPhWe1V0yMmHbjnN6okGPeu/Dm2RVVD4fTrW', NULL, NULL, NULL, NULL, NULL, NULL, '2023-03-29 13:25:16', '2023-03-29 13:25:31');

--
-- Indexes for dumped tables
--

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
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `carts`
--
ALTER TABLE `carts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

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
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `replies`
--
ALTER TABLE `replies`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
