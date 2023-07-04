-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 04, 2023 at 04:23 AM
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
  `address` varchar(255) DEFAULT NULL,
  `furniture_type` varchar(255) DEFAULT NULL,
  `repair_details` varchar(255) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `time_slot` time DEFAULT NULL,
  `images` varchar(255) DEFAULT NULL,
  `user_id` varchar(255) DEFAULT NULL,
  `price` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `action` varchar(255) DEFAULT NULL,
  `amount` varchar(255) DEFAULT NULL,
  `payment_method` varchar(255) DEFAULT NULL,
  `transporter_status` varchar(255) DEFAULT NULL,
  `reservations_status` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `bookings`
--

INSERT INTO `bookings` (`id`, `cust_name`, `cust_email`, `cust_phone`, `address`, `furniture_type`, `repair_details`, `date`, `time_slot`, `images`, `user_id`, `price`, `status`, `action`, `amount`, `payment_method`, `transporter_status`, `reservations_status`, `created_at`, `updated_at`) VALUES
(34, 'dannial', 'dannial@mail.com', '12345', 'rumah pokdin', 'home living', 'patah', '2023-07-03', '13:33:00', '1688362428.png', '4', '100', 'accepted', 'accepted', '25555', 'full_payment', 'picked_up', 'in progress', '2023-07-02 05:33:48', '2023-07-03 00:58:16'),
(35, 'test', 'test@mail.com', '12345', 'No. 895, Jalan Jasmin 17, Taman Jasmin, Senawang 70450 Seremban, Negeri Sembilan', 'home living', 'patah', '2023-07-03', '16:29:00', '1688372992.png', '4', '250', 'accepted', 'accepted', '500', 'deposit', 'picked_up', 'in progress', '2023-07-02 16:29:52', '2023-07-03 00:58:47'),
(37, 'farhani', 'farhani@mail.com', '123456789', 'petak kelabu', 'home living', 'patah kaki', '2023-07-04', '02:54:00', '1688410480.png', '4', '5000', 'accepted', 'accepted', '2500', 'deposit', 'picked_up', 'in progress', '2023-07-03 02:54:40', '2023-07-03 03:01:50'),
(40, 'capik', 'capik@mail.com', '60582', 'pokdin', 'home living', 'patah', '2023-07-04', '05:26:00', '1688415940.png', '2', '6000', 'accepted', 'accepted', '3000', 'deposit', 'delivered', 'Complete', '2023-07-03 12:25:40', '2023-07-03 13:55:29'),
(41, 'aizat', 'aizat@gmail.com', '12345', 'pokdin', 'home living', 'patah kaki kerusi', '2023-07-04', '07:12:00', '1688422932.png', '2', '5000', 'accepted', 'accepted', '2500', 'deposit', 'delivered', 'Complete', '2023-07-03 14:22:12', '2023-07-03 14:25:23');

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
(51, 'transporter', 'transporter@mail.com', '123456789', 'Taman Jasmin', 'sofa', '1', '180', '1683809950.jpg', '2', '6', '2023-06-17 08:55:38', '2023-06-17 08:55:38');

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
(10, 'mainan', '2023-03-27 13:46:09', '2023-03-27 13:46:09'),
(11, 'sofa', '2023-07-03 16:58:19', '2023-07-03 16:58:19');

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
(15, '2014_10_12_000000_create_users_table', 1),
(16, '2014_10_12_100000_create_password_resets_table', 1),
(29, '2023_06_13_191813_create_stocks_table', 8),
(31, '2023_06_15_211004_create_stocklist_table', 10),
(32, '2023_06_15_213920_create_stocklists_table', 11),
(33, '2023_06_16_045649_create_stocklists_table', 12),
(36, '2023_07_01_153150_add_action_to_bookings', 15),
(37, '2014_10_12_200000_add_two_factor_columns_to_users_table', 16),
(38, '2019_08_19_000000_create_failed_jobs_table', 16),
(39, '2019_12_14_000001_create_personal_access_tokens_table', 16),
(40, '2023_03_23_180424_create_sessions_table', 16),
(41, '2023_03_24_152503_create_categories_table', 16),
(42, '2023_03_24_165014_create_products_table', 16),
(43, '2023_03_26_150019_create_carts_table', 16),
(44, '2023_03_27_042434_create_orders_table', 16),
(45, '2023_03_28_191105_create_notifications_table', 16),
(46, '2023_04_02_162058_create_comments_table', 16),
(47, '2023_04_02_162128_create_replies_table', 16),
(49, '2023_06_13_200710_create_stocks_table', 16),
(50, '2023_06_16_050301_create_stocklists_table', 16),
(54, '2023_07_03_075703_create_bookings_table', 17);

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
(23, 'Dannial', 'dannialahmad6@gmail.com', '123456789', 'pokdin', '4', 'sofa', '1', '150', '1683810075.jpg', '12', 'paid', 'delivered', '2023-05-30 06:44:48', '2023-06-28 07:01:32'),
(24, 'Dannial', 'dannialahmad6@gmail.com', '123456789', 'pokdin', '4', 'sofa', '1', '10', '1683810007.jpeg', '8', 'paid', 'delivered', '2023-05-30 06:44:48', '2023-06-29 00:05:35'),
(25, 'Dannial', 'dannialahmad6@gmail.com', '123456789', 'pokdin', '4', 'sofa', '1', '350', '1683810042.jpeg', '9', 'paid', 'delivered', '2023-05-30 06:44:48', '2023-07-03 10:01:48'),
(26, 'Dannial', 'dannialahmad6@gmail.com', '123456789', 'pokdin', '4', 'interim', '2', '20', '1683811893.jpg', '13', 'cash on delivery', 'delivered', '2023-06-13 20:08:52', '2023-07-03 10:28:47'),
(27, 'Dannial', 'dannialahmad6@gmail.com', '123456789', 'pokdin', '4', 'sofa', '5', '900', '1683809950.jpg', '2', 'cash on delivery', 'delivered', '2023-06-13 20:08:52', '2023-07-03 10:50:10'),
(28, 'Dannial', 'dannialahmad6@gmail.com', '123456789', 'pokdin', '4', 'sofa', '1', '350', '1683810042.jpeg', '9', 'paid', 'delivered', '2023-06-13 20:08:52', '2023-06-13 20:09:49'),
(29, 'Dannial', 'dannialahmad6@gmail.com', '123456789', 'pokdin', '4', 'sofa', '1', '180', '1683809950.jpg', '2', 'cash on delivery', 'processing', '2023-06-15 06:58:17', '2023-06-15 06:58:17'),
(30, 'Dannial', 'dannialahmad6@gmail.com', '123456789', 'pokdin', '4', 'sofa', '1', '10', '1683810007.jpeg', '8', 'Paid', 'processing', '2023-06-15 07:04:58', '2023-06-15 07:04:58'),
(37, 'Dannial', 'dannialahmad6@gmail.com', '123456789', 'pokdin', '4', 'interim', '1', '10', '1683811893.jpg', '13', 'cash on delivery', 'processing', '2023-06-20 19:18:50', '2023-06-20 19:18:50'),
(39, 'Dannial', 'dannialahmad6@gmail.com', '123456789', 'pokdin', '4', 'sofa', '1', '180', '1683809950.jpg', '2', 'cash on delivery', 'delivered', '2023-07-03 08:45:47', '2023-07-03 10:49:38'),
(40, 'Dannial', 'dannialahmad6@gmail.com', '123456789', 'pokdin', '4', 'sofa', '1', '10', '1683810007.jpeg', '8', 'cash on delivery', 'delivered', '2023-07-03 08:45:47', '2023-07-03 10:36:20'),
(41, 'Dannial', 'dannialahmad6@gmail.com', '123456789', 'pokdin', '4', 'interim', '1', '10', '1683811893.jpg', '13', 'paid', 'delivered', '2023-07-03 08:46:59', '2023-07-03 10:01:55');

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
(14, 'Sofa 1 Seater', 'Sofa', '1688432372.jpg', 'sofa', '1', '150', NULL, '2023-07-03 16:59:32', '2023-07-03 16:59:32'),
(15, 'Sofa 3 Seater', 'Sofa', '1688432423.jpg', 'sofa', '1', '250', NULL, '2023-07-03 17:00:23', '2023-07-03 17:00:23'),
(16, 'Sofa 2 Seater', 'Sofa', '1688432457.jpg', 'sofa', '1', '200', NULL, '2023-07-03 17:00:57', '2023-07-03 17:00:57');

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
('2hFwZDooxo1hdxDSGCC1WfHcuITUlPsVQDSocBXE', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiaXpnUmJZQ1RmQmFBbko5NHpMa1FkVGc4TFdBRGdjOWNlQXpRUTFOYyI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7fX0=', 1688437419),
('MfgAQrMIKxxQHOqTcULusPY1iHyD68kXa4Q178uS', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/114.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiWWNOVnpBVmJIWWphUDN2TnlMQW1QZklvTlRaSExnQ1Z1Z3l6ODlYbCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjc6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9sb2dpbiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1688432258),
('tniM9dDi37SF2i8LJkwPIPgw2JeBAi3EjPCjTmmv', 3, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36 Edg/114.0.1823.67', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiWFpLUUxyaVhYSTFwakVDV1Z6R0FJM1pTTHo4UWlKZEd3N3dERlhpQSI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzA6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9yZWRpcmVjdCI7fXM6NTA6ImxvZ2luX3dlYl81OWJhMzZhZGRjMmIyZjk0MDE1ODBmMDE0YzdmNThlYTRlMzA5ODlkIjtpOjM7fQ==', 1688433515),
('w2PXMAFLv4bV5O2Tr8mtBfaeDICt4JBZ4QBUuKkh', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/114.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiUkR0RTVqTEhQVEJuU0k1N3JsMEhDS3RndDl6bXBxYktVS3gzYXBhSyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mzk6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC92aWV3X3Jlc2VydmF0aW9ucyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1688432258),
('y7LYFhIKA5JAOepfocP5Tg4xKhH4YDJQ2zSH1YRh', 2, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/114.0', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiY3RmMVM2UUxZTTB5Q21qYWxXMXpGYUxkSFkyaTVET2c1VVA1bHU5eCI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzQ6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9yZXNlcnZhdGlvbnMiO31zOjUwOiJsb2dpbl93ZWJfNTliYTM2YWRkYzJiMmY5NDAxNTgwZjAxNGM3ZjU4ZWE0ZTMwOTg5ZCI7aToyO30=', 1688436808);

-- --------------------------------------------------------

--
-- Table structure for table `stocklists`
--

CREATE TABLE `stocklists` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `stock_name` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `quantity` varchar(255) NOT NULL DEFAULT '0',
  `price` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `stocklists`
--

INSERT INTO `stocklists` (`id`, `stock_name`, `description`, `quantity`, `price`, `created_at`, `updated_at`) VALUES
(6, 'Span', 'Span Kuning', '1', '15', '2023-06-20 19:34:22', '2023-07-03 17:15:17'),
(7, 'Getah', 'Untuk Wabbing', '5', '10', '2023-07-03 17:16:09', '2023-07-03 17:16:09'),
(8, 'Spring', 'Untuk Wabbing', '10', '20', '2023-07-03 17:16:48', '2023-07-03 17:16:48'),
(9, 'Paku', 'Paku', '5', '2.50', '2023-07-03 17:17:23', '2023-07-03 17:17:23'),
(10, 'Tali Paiping', 'tali paiping', '5', '4.50', '2023-07-03 17:17:56', '2023-07-03 17:17:56');

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
(1, 'paku', '10', '2023-06-13 12:29:26', '2023-06-13 12:29:26'),
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
(4, 'Dannial', 'dannialahmad6@gmail.com', '0', '123456789', 'pokdin', '2023-03-28 10:37:42', '$2y$10$sqFwk3e64PQO9Ks0q3U.e.8yTH1kGlUStcCxRZKZS1IzrPOkw/eim', NULL, NULL, NULL, 'L1XLFlhGgJX6wlWwjjrx266EAD7JtfgAECjZ3Jpqua6FaHladNjsdqUMArmd', NULL, NULL, '2023-03-28 10:37:19', '2023-03-28 10:43:43'),
(5, 'man', 'varenig813@cyclesat.com', '0', '1234567890', 'pokdin', '2023-03-29 13:25:31', '$2y$10$mhy1DB2QZS6p4i8tSIPhWe1V0yMmHbjnN6okGPeu/Dm2RVVD4fTrW', NULL, NULL, NULL, NULL, NULL, NULL, '2023-03-29 13:25:16', '2023-03-29 13:25:31'),
(6, 'transporter', 'transporter@mail.com', '2', '123456789', 'Taman Jasmin', '2023-06-11 06:56:54', '$2y$10$2j.az4P6wYNdI3uT2gcLkeBj73d5P/x0kzIqkCLN7hO8XzcoYc8Im', NULL, NULL, NULL, NULL, NULL, NULL, '2023-06-11 06:56:28', '2023-06-11 06:56:54');

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
-- Indexes for table `stocklists`
--
ALTER TABLE `stocklists`
  ADD PRIMARY KEY (`id`);

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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT for table `carts`
--
ALTER TABLE `carts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=55;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

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
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=55;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `replies`
--
ALTER TABLE `replies`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `stocklists`
--
ALTER TABLE `stocklists`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

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
