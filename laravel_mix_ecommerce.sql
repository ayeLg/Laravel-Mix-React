-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 08, 2022 at 09:35 AM
-- Server version: 10.4.21-MariaDB
-- PHP Version: 7.3.31

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `laravel_mix_ecommerce`
--

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
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
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Admin', 'admin@a.com', NULL, '$2y$10$T7M.thbgPLySkUcbibOyGeJYunH6ZUwODcO9zvCZv.FPjWef696b.', NULL, '2022-12-02 06:18:43', '2022-12-02 06:18:43');

-- --------------------------------------------------------

--
-- Table structure for table `brands`
--

CREATE TABLE `brands` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `brands`
--

INSERT INTO `brands` (`id`, `slug`, `name`, `created_at`, `updated_at`) VALUES
(1, 'samsung', 'Samsung', '2022-12-02 06:18:43', '2022-12-02 06:18:43'),
(2, 'huawei', 'Huawei', '2022-12-02 06:18:43', '2022-12-02 06:18:43'),
(3, 'apple', 'Apple', '2022-12-02 06:18:43', '2022-12-02 06:18:43'),
(5, 'nokia', 'Nokia', '2022-12-06 03:58:49', '2022-12-06 03:58:49'),
(6, 'bailey', 'Bailey', '2022-12-06 06:58:46', '2022-12-06 06:58:46'),
(7, 'goorin', 'Goorin', '2022-12-06 06:59:09', '2022-12-06 06:59:09'),
(8, 'christys’ of london', 'CHRISTYS’ OF LONDON', '2022-12-06 06:59:36', '2022-12-06 06:59:36'),
(9, 'new era', 'NEW ERA', '2022-12-06 06:59:50', '2022-12-06 06:59:50'),
(10, 'lock & co. hatters', 'LOCK & CO. HATTERS', '2022-12-06 07:00:04', '2022-12-06 07:00:04'),
(11, 'stetson', 'STETSON', '2022-12-06 07:01:05', '2022-12-06 07:01:05'),
(12, 'borsalino', 'BORSALINO', '2022-12-06 07:01:16', '2022-12-06 07:01:16'),
(13, 'barbour', 'BARBOUR', '2022-12-06 07:01:53', '2022-12-06 07:01:53'),
(14, 'brixton', 'BRIXTON', '2022-12-06 07:02:05', '2022-12-06 07:02:05'),
(15, 'filson', 'FILSON', '2022-12-06 07:02:16', '2022-12-06 07:02:16'),
(16, 'sony', 'Sony', '2022-12-06 07:05:20', '2022-12-06 07:05:20'),
(17, 'htc', 'HTC', '2022-12-06 07:05:44', '2022-12-06 07:05:44'),
(18, 'hisense', 'Hisense', '2022-12-06 07:07:32', '2022-12-06 07:07:32'),
(19, 'lg', 'LG', '2022-12-06 07:07:41', '2022-12-06 07:07:41'),
(20, 'adidas', 'Adidas', '2022-12-06 07:18:51', '2022-12-06 07:18:51'),
(21, 'arrow', 'Arrow', '2022-12-06 07:19:02', '2022-12-06 07:19:02'),
(22, 'gucci', 'Gucci', '2022-12-06 07:19:16', '2022-12-06 07:19:16');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mm_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `slug`, `name`, `mm_name`, `image`, `created_at`, `updated_at`) VALUES
(1, 't-shirt', 'T-Shirt', 'တီရှပ်', '638f501225cd7352-3528694_plain-blue-t-shirt-png-image-background-blue.png', '2022-12-02 06:18:43', '2022-12-06 07:52:10'),
(2, 'hat', 'Hat', 'ဉီးထုပ်', '638f502851bec107-1077262_define-hat-hd-png-download.png', '2022-12-02 06:18:43', '2022-12-06 07:52:32'),
(3, 'electornic', 'Electornic', 'အီလလ်ထရောနစ်', '638f504c731c2207-2077496_gadget-mobile-phone-watch-portable-communications-device-communication.png', '2022-12-02 06:18:43', '2022-12-06 07:53:08'),
(4, 'mobile', 'Mobile', 'ဖုန်း', '638f506904b89217-2178606_lg-tribute-dynasty-sprint-hd-png-download.png', '2022-12-02 06:18:43', '2022-12-06 07:53:37'),
(5, 'earphone', 'EarPhone', 'နားကြပ်', '638f5151dfe43194-1946458_e1-earphone-aorus-earbuds-hd-png-download.png', '2022-12-02 06:18:43', '2022-12-06 07:57:29');

-- --------------------------------------------------------

--
-- Table structure for table `colors`
--

CREATE TABLE `colors` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `colors`
--

INSERT INTO `colors` (`id`, `slug`, `name`, `created_at`, `updated_at`) VALUES
(1, 'red', 'Red', '2022-12-02 06:18:43', '2022-12-04 20:38:40'),
(2, 'green', 'green', '2022-12-02 06:18:43', '2022-12-02 06:18:43'),
(3, 'blue', 'blue', '2022-12-02 06:18:43', '2022-12-02 06:18:43'),
(4, 'black', 'black', '2022-12-02 06:18:43', '2022-12-02 06:18:43');

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
-- Table structure for table `incomes`
--

CREATE TABLE `incomes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount` int(11) NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `incomes`
--

INSERT INTO `incomes` (`id`, `title`, `amount`, `description`, `created_at`, `updated_at`) VALUES
(1, 'ပစည်းရောင်း', 1000, 'dafda', '2022-12-02 06:19:48', '2022-12-02 06:19:48'),
(2, 'Income', 4000, 'asdfadf', '2022-12-02 06:29:51', '2022-12-02 06:29:51'),
(3, 'daf', 13123, 'afadsf', '2022-12-06 04:07:31', '2022-12-06 04:07:31');

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
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2022_11_30_091912_create_admins_table', 1),
(6, '2022_11_30_092059_create_categories_table', 1),
(7, '2022_11_30_092145_create_colors_table', 1),
(8, '2022_11_30_092234_create_brands_table', 1),
(9, '2022_11_30_092255_create_suppliers_table', 1),
(10, '2022_11_30_092326_create_products_table', 1),
(11, '2022_11_30_092353_create_product_reviews_table', 1),
(12, '2022_11_30_092424_create_product_add_transactions_table', 1),
(13, '2022_11_30_092448_create_product_orders_table', 1),
(14, '2022_11_30_092510_create_product_carts_table', 1),
(15, '2022_11_30_092618_create_product_color_table', 1),
(16, '2022_11_30_171554_create_product_remove_transactions_table', 1),
(17, '2022_12_02_122116_create_incomes_table', 1),
(18, '2022_12_02_122637_create_outcomes_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `outcomes`
--

CREATE TABLE `outcomes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount` int(11) NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `outcomes`
--

INSERT INTO `outcomes` (`id`, `title`, `amount`, `description`, `created_at`, `updated_at`) VALUES
(1, 'adfdasf', 5000, 'adsfadf', NULL, NULL),
(2, 'adfadf', 200, 'safds', NULL, NULL),
(3, 'asdf', 124312, 'dsfadfa', '2022-12-06 04:08:33', '2022-12-06 04:08:33');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
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
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `category_id` bigint(20) UNSIGNED NOT NULL,
  `supplier_id` bigint(20) UNSIGNED NOT NULL,
  `brand_id` bigint(20) UNSIGNED NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `discount_price` int(11) NOT NULL,
  `buy_price` int(11) NOT NULL,
  `sale_price` int(11) NOT NULL,
  `total_quantity` int(11) NOT NULL,
  `view_count` int(11) NOT NULL DEFAULT 0,
  `like_count` int(11) NOT NULL DEFAULT 0,
  `description` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `category_id`, `supplier_id`, `brand_id`, `slug`, `name`, `image`, `discount_price`, `buy_price`, `sale_price`, `total_quantity`, `view_count`, `like_count`, `description`, `created_at`, `updated_at`) VALUES
(3, 1, 1, 22, '638f4a122015agucci-tshirt', 'Gucci Tshirt', '638f4a1219c6f3-33753_t-shirt-printing-designs-samples-hd-png-download.png', 30000, 20000, 25000, 4, 0, 0, '<p>Good</p>', '2022-12-06 07:26:34', '2022-12-07 19:52:34'),
(4, 1, 1, 21, '638f4a6600749arrow-t-shirt', 'Arrow T-shirt', '638f4a65f20ce9-94061_brown-t-shirt-png-image-brown-t-shirt.png', 20000, 10000, 15000, 5, 0, 0, '<p>Nice</p>', '2022-12-06 07:27:58', '2022-12-06 07:27:58'),
(5, 1, 1, 20, '638f4ab7e9d97addidas-tshirt', 'Addidas Tshirt', '638f4ab7e71ba9-94692_peach-colour-t-shirt-png-png-download-peach.png', 15000, 10000, 12000, 10, 0, 0, '<p>Excellent</p>', '2022-12-06 07:29:19', '2022-12-06 07:29:19'),
(6, 3, 1, 19, '638f4aed3098clg-tv', 'LG TV', '638f4aed2c43b117-1172596_plasma-tv-png-flat-screen-tv-png-transparent.png', 3200000, 2000000, 3000000, 10, 0, 0, '<p>Good</p>', '2022-12-06 07:30:13', '2022-12-06 07:30:13'),
(7, 3, 1, 18, '638f4b2614622hisense-tv', 'Hisense TV', '638f4b2610a1f175-1755353_samsung-tv-png-samsung-qled-tv-55-inch.png', 2500000, 1000000, 2000000, 2, 0, 0, '<p>Nice</p>', '2022-12-06 07:31:10', '2022-12-06 07:31:10'),
(8, 4, 1, 1, '638f4b5edb431htc-phone', 'HTC Phone', '638f4b5ed801f217-2178606_lg-tribute-dynasty-sprint-hd-png-download.png', 64000, 50000, 60000, 20, 0, 0, '<p>Good</p>', '2022-12-06 07:32:06', '2022-12-06 07:32:06'),
(9, 3, 1, 1, '638f4ba8a5243sony-tv', 'Sony TV', '638f4ba8a17cb479-4793345_tv-samsung-46-smart-tv-hd-png-download.png', 275000, 233330, 250000, 4, 0, 0, '<p>Excellent</p><p><br></p>', '2022-12-06 07:33:20', '2022-12-06 07:33:20'),
(10, 4, 1, 1, '638f4bdec911esony-phone', 'Sony Phone', '638f4bdec6725722-7228125_android-10-nokia-6-1-phone-hd-png-download.png', 55000, 49000, 52000, 6, 0, 0, '<p>Nice</p>', '2022-12-06 07:34:14', '2022-12-06 07:34:14'),
(11, 2, 1, 15, '638f4c3126049filson-hat', 'FILSON Hat', '638f4c3122c039-92842_sheriffs-hat-png-clip-art-transparent-background-cowboy.png', 12000, 8000, 10000, 10, 0, 0, '<p>Good</p>', '2022-12-06 07:35:37', '2022-12-06 07:35:37'),
(12, 2, 1, 14, '638f4c72729bfbrixton-hat', 'BRIXTON Hat', '638f4c726d80e13-139251_clip-art-pharrell-hat-on-the-voice-pharrell.png', 10000, 7000, 8000, 10, 0, 0, '<p>Good</p>', '2022-12-06 07:36:42', '2022-12-06 07:36:42'),
(13, 2, 1, 13, '638f4cabdfc37barbour-hat', 'BARBOUR Hat', '638f4cabdcee713-139604_hat-cowboy-hat-fashion-accessory-clothing-sun-accessory.png', 8000, 5000, 7000, 15, 0, 0, '<p>Nice</p>', '2022-12-06 07:37:39', '2022-12-06 07:37:39'),
(14, 2, 1, 12, '638f4d4ef1127borsalino-hat', 'BORSALINO Hat', '638f4d4eed22c45-450973_transparent-fishing-hat-png-cowboy-hat-png-download.png', 2200, 1000, 2000, 4, 0, 0, '<p>Normal</p>', '2022-12-06 07:40:22', '2022-12-07 19:53:08'),
(15, 4, 1, 5, '638f4d91ba511nokia-phone', 'Nokia Phone', '638f4d91b787f356-3568858_one-plus-5ta5010-full-screen-phone-oneplus5t-full.png', 55000, 40000, 50000, 10, 0, 0, '<p>Good</p>', '2022-12-06 07:41:29', '2022-12-06 07:41:29'),
(16, 3, 1, 3, '638f4df90990dapple-watch', 'Apple Watch', '638f4df905aeb241-2410365_watch-product-analog-watch-digital-device-material-amazfit.png', 150000, 100000, 120000, 7, 0, 0, '<p>Excellent</p>', '2022-12-06 07:43:13', '2022-12-06 07:43:13'),
(17, 4, 1, 2, '638f4e58e764dhuawei-phone', 'Huawei Phone', '638f4e58e38ca175-1754613_xcover-fieldpro-front-galaxy-tab-active-2-hd.png', 700000, 500000, 600000, 19, 0, 0, '<p>Good</p>', '2022-12-06 07:44:48', '2022-12-07 19:52:54'),
(18, 5, 1, 16, '638f4eb06c44esony-earphone', 'Sony Earphone', '638f4eb069e83194-1946432_headphones-hd-png-download.png', 9000, 5000, 7000, 10, 0, 0, '<p>Good</p>', '2022-12-06 07:46:16', '2022-12-06 07:46:16'),
(19, 5, 1, 3, '638f4ef6f2d18apple-earphone', 'Apple Earphone', '638f4ef6eea1d491-4914605_audeze-mobius-headphones-class-hd-png-download.png', 15000, 10000, 12000, 1, 0, 0, '<p>Nice</p>', '2022-12-06 07:47:26', '2022-12-07 19:53:14'),
(20, 5, 1, 1, '638f4f8e2ed50samsung-earphone', 'Samsung Earphone', '638f4f8e2b2c2491-4914572_earphone-png-image-ferrari-s-p-a-transparent-png.png', 15000, 10000, 12000, 20, 0, 0, '<p>Normal&nbsp;</p>', '2022-12-06 07:49:58', '2022-12-06 07:49:58'),
(21, 5, 1, 2, '638f4fe9068edhuawei-earphone', 'Huawei Earphone', '638f4fe900d68194-1946440_mode-eq-black-data-srcset-https-hd-png.png', 7000, 3000, 5000, 10, 0, 0, '<p>Excellent</p>', '2022-12-06 07:51:29', '2022-12-06 07:51:29');

-- --------------------------------------------------------

--
-- Table structure for table `product_add_transactions`
--

CREATE TABLE `product_add_transactions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `supplier_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `total_quantity` int(11) NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_add_transactions`
--

INSERT INTO `product_add_transactions` (`id`, `supplier_id`, `product_id`, `total_quantity`, `description`, `created_at`, `updated_at`) VALUES
(3, 1, 3, 5, NULL, '2022-12-06 07:26:34', '2022-12-06 07:26:34'),
(4, 1, 4, 5, NULL, '2022-12-06 07:27:58', '2022-12-06 07:27:58'),
(5, 1, 5, 10, NULL, '2022-12-06 07:29:20', '2022-12-06 07:29:20'),
(6, 1, 6, 10, NULL, '2022-12-06 07:30:13', '2022-12-06 07:30:13'),
(7, 1, 7, 2, NULL, '2022-12-06 07:31:10', '2022-12-06 07:31:10'),
(8, 1, 8, 20, NULL, '2022-12-06 07:32:06', '2022-12-06 07:32:06'),
(9, 1, 9, 4, NULL, '2022-12-06 07:33:20', '2022-12-06 07:33:20'),
(10, 1, 10, 6, NULL, '2022-12-06 07:34:14', '2022-12-06 07:34:14'),
(11, 1, 11, 10, NULL, '2022-12-06 07:35:37', '2022-12-06 07:35:37'),
(12, 1, 12, 10, NULL, '2022-12-06 07:36:42', '2022-12-06 07:36:42'),
(13, 1, 13, 15, NULL, '2022-12-06 07:37:39', '2022-12-06 07:37:39'),
(14, 1, 14, 5, NULL, '2022-12-06 07:40:22', '2022-12-06 07:40:22'),
(15, 1, 15, 10, NULL, '2022-12-06 07:41:29', '2022-12-06 07:41:29'),
(16, 1, 16, 7, NULL, '2022-12-06 07:43:13', '2022-12-06 07:43:13'),
(17, 1, 17, 20, NULL, '2022-12-06 07:44:48', '2022-12-06 07:44:48'),
(18, 1, 18, 10, NULL, '2022-12-06 07:46:16', '2022-12-06 07:46:16'),
(19, 1, 19, 2, NULL, '2022-12-06 07:47:27', '2022-12-06 07:47:27'),
(20, 1, 20, 20, NULL, '2022-12-06 07:49:58', '2022-12-06 07:49:58'),
(21, 1, 21, 10, NULL, '2022-12-06 07:51:29', '2022-12-06 07:51:29');

-- --------------------------------------------------------

--
-- Table structure for table `product_carts`
--

CREATE TABLE `product_carts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `total_quantity` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `product_color`
--

CREATE TABLE `product_color` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `color_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_color`
--

INSERT INTO `product_color` (`id`, `product_id`, `color_id`, `created_at`, `updated_at`) VALUES
(5, 3, 1, NULL, NULL),
(6, 3, 2, NULL, NULL),
(7, 4, 2, NULL, NULL),
(8, 5, 2, NULL, NULL),
(9, 5, 4, NULL, NULL),
(10, 6, 4, NULL, NULL),
(11, 7, 4, NULL, NULL),
(12, 8, 2, NULL, NULL),
(13, 9, 1, NULL, NULL),
(14, 10, 4, NULL, NULL),
(15, 11, 3, NULL, NULL),
(16, 12, 1, NULL, NULL),
(17, 12, 3, NULL, NULL),
(18, 13, 4, NULL, NULL),
(19, 14, 4, NULL, NULL),
(20, 15, 1, NULL, NULL),
(21, 16, 3, NULL, NULL),
(22, 17, 4, NULL, NULL),
(23, 18, 2, NULL, NULL),
(24, 19, 4, NULL, NULL),
(25, 20, 1, NULL, NULL),
(26, 21, 3, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `product_orders`
--

CREATE TABLE `product_orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `total_quantity` int(11) NOT NULL,
  `status` enum('pending','cancel','success') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_orders`
--

INSERT INTO `product_orders` (`id`, `user_id`, `product_id`, `total_quantity`, `status`, `created_at`, `updated_at`) VALUES
(4, 2, 3, 1, 'success', '2022-12-06 20:27:42', '2022-12-07 19:52:34'),
(5, 3, 21, 1, 'pending', '2022-12-07 19:29:12', '2022-12-07 19:29:12'),
(6, 3, 17, 1, 'success', '2022-12-07 19:29:12', '2022-12-07 19:52:54'),
(7, 4, 16, 1, 'pending', '2022-12-07 19:31:21', '2022-12-07 19:31:21'),
(8, 4, 14, 1, 'success', '2022-12-07 19:31:21', '2022-12-07 19:53:08'),
(9, 5, 5, 1, 'pending', '2022-12-07 19:37:16', '2022-12-07 19:37:16'),
(10, 5, 20, 1, 'pending', '2022-12-07 19:37:16', '2022-12-07 19:37:16'),
(11, 6, 6, 1, 'pending', '2022-12-07 19:41:02', '2022-12-07 19:41:02'),
(12, 6, 4, 2, 'pending', '2022-12-07 19:41:02', '2022-12-07 19:41:02'),
(13, 7, 10, 1, 'pending', '2022-12-07 19:44:27', '2022-12-07 19:44:27'),
(14, 7, 19, 1, 'success', '2022-12-07 19:44:27', '2022-12-07 19:53:14');

-- --------------------------------------------------------

--
-- Table structure for table `product_remove_transactions`
--

CREATE TABLE `product_remove_transactions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `total_quantity` int(11) NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `product_reviews`
--

CREATE TABLE `product_reviews` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `review` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `rating` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_reviews`
--

INSERT INTO `product_reviews` (`id`, `user_id`, `product_id`, `review`, `rating`, `created_at`, `updated_at`) VALUES
(3, 2, 5, 'Soonyang Group မှာ သူဌေးမိသားစုရဲ့ လူယုံအတွင်းရေးမှူးအဖြစ် ၁၀ နှစ်ကြာအလုပ်ကျွေးပြုခဲ့ပါတယ်\n\nဒီမိသားစုဆီမှာပဲ အစေခံတစ်ယောက်လို အလုပ်ကြိုးစားခဲ့ပေမဲ့ တစ်နေ့မှာတော့\n\nအလွဲသုံးစားမှုနဲ့စွပ်စွဲခံရပြီး အသတ်ခံခဲ့ရတယ် ..\nသေဆုံးသွားပေမဲ့ အံ့ဩဖို့ကောင်းစွာနဲ့ပဲ သူ့ဝိညာဥ်ဟာ\n\nSoonyang Group CEO Jin Yang Cheol (Lee Sung Min) ရဲ့အငယ်ဆုံးသားလေး\n\nJin Do Joon ခန္ဓာကိုယ်ထဲကနေ နောက်တစ်ကြိမ်ပြန်နိုးလာတဲ့အခါမှာတော့ ..\n\nအဖြစ်အပျက်တွေအားလုံးကို မှတ်မိနေတဲ့ Jin Do Joon တစ်ယောက် ..\n\nသူ့ကိုသတ်ခဲ့တဲ့ ဂျင်မိသားစုကို ဘယ်လိုလက်စားပြန်ချေမလဲ ..\n\n“Soonyang Group Grim Reaper”လို့ လူသိများတဲ့ အဂတိလိုက်စားမှုတိုက်ဖျက်ရေးအဖွဲ့က\n\nအမှုစစ် Seo Min Young (Shin Hyun Bin) နဲ့ လက်တွဲပြီး\n\nငွေကလွဲရင် ဘာမှမမြင်နိုင်တဲ့ CEO ကို ဘယ်လိုအစီအစဥ်တွေနဲ့ အကွက်စေ့စေ့ဖြုတ်ချနိုင်မလဲဆိုတာ ..\nရင်တမမနဲ့ တစ်ခန်းမှမလွတ်တမ်း စောင့်ကြည့်ရမယ့် series လေး ဖြစ်ပါတယ်', 3, '2022-12-08 01:44:42', '2022-12-08 01:44:42'),
(7, 2, 5, 'hjfghjg', 1, '2022-12-08 01:49:18', '2022-12-08 01:49:18');

-- --------------------------------------------------------

--
-- Table structure for table `suppliers`
--

CREATE TABLE `suppliers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `suppliers`
--

INSERT INTO `suppliers` (`id`, `name`, `image`, `description`, `created_at`, `updated_at`) VALUES
(1, 'Mg Mg', 'supplier.png', NULL, '2022-12-02 06:18:43', '2022-12-02 06:18:43');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `image`, `email`, `email_verified_at`, `password`, `phone`, `address`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'userone', 'user.jpg', 'userone@a.com', NULL, '$2y$10$mqEJLyPfRX62IDSJDmHKReR6De2.u9jz4ozlIjjqe3yFYDc9vo7re', '099999999', 'Address', NULL, '2022-12-02 06:18:43', '2022-12-02 06:18:43'),
(2, 'Aung', '63908cbbe41acmy_photo.jpg', 'user@gmail.com', NULL, '$2y$10$zuIy/27nFayG6EpTR85VN.73hp5zuMqnh8RiQ3azXYSsfOO1OwrqO', '0941231231', 'Yangon', NULL, '2022-12-02 21:11:38', '2022-12-07 06:23:15'),
(3, 'Arnt Zay', '639144c5eebbcavatar.png', 'arnt@gmail.com', NULL, '$2y$10$P1DsJoySKF1eC5N5ebtobuLbscQvTG./Gefhvqa7SmrU4UoigyWYG', '959231342123', 'Yangon', NULL, '2022-12-07 19:28:30', '2022-12-07 19:28:30'),
(4, 'Swan Yee Ling', '63914534883efavatar (3).png', 'swan@gmail.com', NULL, '$2y$10$BDbCz/7p5UU9zkxf0RlBYunegFPLklzwbO5.J9YpBvEinJ8lVa9AK', '95924523423', 'Yangon', NULL, '2022-12-07 19:30:20', '2022-12-07 19:30:20'),
(5, 'SKMB', '63914672d1861avatar (2).png', 'sai@gmail.com', NULL, '$2y$10$l/xigN29eJabdOxUGgmXOexbq/Xoqxv2Ab2PwMUXC84CgKcaymsAu', '9594351112', 'Mandalay', NULL, '2022-12-07 19:35:39', '2022-12-07 19:35:39'),
(6, 'Ma Poe', '63914704d9162avatar (6).png', 'mapoe@gmail.com', NULL, '$2y$10$kSzJw8T65QNDgo0aiIV0SecTXmUKyr3iLDFykLeIZiP5oHKMEMnrq', '959653451', 'Yangon', NULL, '2022-12-07 19:38:05', '2022-12-07 19:38:05'),
(7, 'TDSS', '63914859b35f2avatar (4).png', 'thandar@gmail.com', NULL, '$2y$10$3HCs3LT2q61RjcnlOX/eD.cr1.p2Wx2oyxpgJ9bFz2ptMi31thh6e', '9594634322', 'Yangon', NULL, '2022-12-07 19:43:45', '2022-12-07 19:43:45');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `admins_email_unique` (`email`);

--
-- Indexes for table `brands`
--
ALTER TABLE `brands`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `brands_slug_unique` (`slug`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `categories_slug_unique` (`slug`);

--
-- Indexes for table `colors`
--
ALTER TABLE `colors`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `colors_slug_unique` (`slug`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `incomes`
--
ALTER TABLE `incomes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `outcomes`
--
ALTER TABLE `outcomes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

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
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `products_slug_unique` (`slug`);

--
-- Indexes for table `product_add_transactions`
--
ALTER TABLE `product_add_transactions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_carts`
--
ALTER TABLE `product_carts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_color`
--
ALTER TABLE `product_color`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_orders`
--
ALTER TABLE `product_orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_remove_transactions`
--
ALTER TABLE `product_remove_transactions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_reviews`
--
ALTER TABLE `product_reviews`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `suppliers`
--
ALTER TABLE `suppliers`
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
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `brands`
--
ALTER TABLE `brands`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `colors`
--
ALTER TABLE `colors`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `incomes`
--
ALTER TABLE `incomes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `outcomes`
--
ALTER TABLE `outcomes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `product_add_transactions`
--
ALTER TABLE `product_add_transactions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `product_carts`
--
ALTER TABLE `product_carts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `product_color`
--
ALTER TABLE `product_color`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `product_orders`
--
ALTER TABLE `product_orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `product_remove_transactions`
--
ALTER TABLE `product_remove_transactions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `product_reviews`
--
ALTER TABLE `product_reviews`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `suppliers`
--
ALTER TABLE `suppliers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
