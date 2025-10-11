-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 11, 2025 at 10:09 AM
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
-- Database: `ecommerce_nextjs_laravel_12_db_01`
--

-- --------------------------------------------------------

--
-- Table structure for table `brands`
--

CREATE TABLE `brands` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `brands`
--

INSERT INTO `brands` (`id`, `name`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Apple', 1, '2025-10-04 07:32:56', '2025-10-04 07:32:56'),
(2, 'SoftNova', 1, '2025-10-04 07:33:35', '2025-10-04 07:33:35'),
(3, 'SoftNova-02', 1, '2025-10-04 07:50:33', '2025-10-04 08:03:38'),
(4, 'NovaElectronics', 1, '2025-10-04 07:50:46', '2025-10-04 07:50:46'),
(5, 'MegaMart', 1, '2025-10-04 07:50:56', '2025-10-04 07:50:56'),
(6, 'UrbanStyle', 1, '2025-10-04 07:51:06', '2025-10-04 07:51:06'),
(7, 'SmartHub', 1, '2025-10-04 07:51:16', '2025-10-04 07:51:16');

-- --------------------------------------------------------

--
-- Table structure for table `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) NOT NULL,
  `value` mediumtext NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) NOT NULL,
  `owner` varchar(255) NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  `description` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `status`, `description`, `created_at`, `updated_at`) VALUES
(1, 'Electronics', 1, 'Lorem isnkdfjkdfl kjdkfjd', '2025-10-05 06:26:20', '2025-10-05 06:26:20'),
(2, 'SoftNova-02', 1, 'habijabi updated', '2025-10-05 06:28:21', '2025-10-05 06:35:58');

-- --------------------------------------------------------

--
-- Table structure for table `coupons`
--

CREATE TABLE `coupons` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `code` varchar(50) NOT NULL,
  `description` text DEFAULT NULL,
  `discount_type` enum('percentage','fixed') NOT NULL,
  `discount_value` decimal(10,2) NOT NULL,
  `min_purchase_amount` decimal(10,2) NOT NULL DEFAULT 0.00,
  `max_discount_amount` decimal(10,2) DEFAULT NULL,
  `valid_from` date DEFAULT NULL,
  `valid_to` date DEFAULT NULL,
  `usage_limit` int(11) NOT NULL DEFAULT 0,
  `status` enum('active','inactive') NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `coupons`
--

INSERT INTO `coupons` (`id`, `code`, `description`, `discount_type`, `discount_value`, `min_purchase_amount`, `max_discount_amount`, `valid_from`, `valid_to`, `usage_limit`, `status`, `created_at`, `updated_at`) VALUES
(1, 'WELCOME10', 'Get 10% off on your first purchase.', 'percentage', 10.00, 500.00, 200.00, '2025-10-04', '2025-11-08', 100, 'active', '2025-10-09 04:32:51', '2025-10-09 04:32:51'),
(2, 'FLAT50', 'Flat 50 BDT off on any order.', 'fixed', 50.00, 0.00, NULL, '2025-10-09', '2025-11-23', 0, 'active', '2025-10-09 04:32:51', '2025-10-09 04:32:51'),
(3, 'SUMMER25', '25% discount for summer sale.', 'percentage', 25.00, 1000.00, 400.00, '2025-09-29', '2025-10-29', 50, 'active', '2025-10-09 04:32:51', '2025-10-09 04:32:51'),
(4, 'FREESHIP', 'Free shipping on orders over 1500 BDT.', 'fixed', 100.00, 1500.00, 100.00, '2025-10-09', '2025-12-08', 0, 'active', '2025-10-09 04:32:51', '2025-10-09 04:32:51'),
(5, 'NEWYEAR2025', 'Celebrate New Year with 20% off.', 'percentage', 20.00, 800.00, 300.00, '2025-01-01', '2025-01-31', 200, 'inactive', '2025-10-09 04:32:51', '2025-10-09 04:32:51'),
(6, 'BUYMORE5', '5% off on purchases above 2000 BDT.', 'percentage', 5.00, 2000.00, 150.00, '2025-10-09', '2025-11-18', 500, 'active', '2025-10-09 04:32:51', '2025-10-09 04:32:51'),
(7, 'FLASHSALE', '50 BDT off during flash sale hours.', 'fixed', 50.00, 300.00, NULL, '2025-10-09', '2025-10-16', 100, 'active', '2025-10-09 04:32:51', '2025-10-09 04:32:51'),
(8, 'STUDENT15', 'Exclusive 15% off for students.', 'percentage', 15.00, 700.00, 250.00, '2025-10-07', '2025-11-03', 300, 'active', '2025-10-09 04:32:51', '2025-10-09 04:32:51'),
(9, 'BIRTHDAY100', 'Get 100 BDT off on your birthday!', 'fixed', 100.00, 500.00, 100.00, '2025-10-09', '2026-10-09', 1, 'active', '2025-10-09 04:32:51', '2025-10-09 04:32:51'),
(10, 'APPONLY10', '10% off for mobile app users only.', 'percentage', 10.00, 1000.00, 300.00, '2025-10-08', '2026-01-07', 1000, 'active', '2025-10-09 04:32:51', '2025-10-09 04:32:51');

-- --------------------------------------------------------

--
-- Table structure for table `coupon_usages`
--

CREATE TABLE `coupon_usages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `coupon_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `coupon_usages`
--

INSERT INTO `coupon_usages` (`id`, `coupon_id`, `user_id`, `order_id`, `used_at`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 4, 5, 1, '2025-09-15 04:51:54', '2025-10-09 04:51:54', '2025-10-09 04:51:54', NULL),
(3, 4, 5, 3, '2025-09-13 04:52:51', '2025-10-09 04:52:51', '2025-10-09 04:52:51', NULL),
(4, 4, 1, 3, '2025-09-12 04:52:51', '2025-10-09 04:52:51', '2025-10-09 04:52:51', NULL),
(5, 4, 2, 2, '2025-09-16 04:52:51', '2025-10-09 04:52:51', '2025-10-09 04:52:51', NULL),
(6, 3, 2, 2, '2025-09-21 04:52:51', '2025-10-09 04:52:51', '2025-10-09 04:52:51', NULL),
(7, 1, 5, 4, '2025-09-25 04:52:51', '2025-10-09 04:52:51', '2025-10-09 04:52:51', NULL),
(8, 1, 3, 4, '2025-09-13 04:52:51', '2025-10-09 04:52:51', '2025-10-09 04:52:51', NULL),
(9, 3, 5, 2, '2025-09-26 04:52:51', '2025-10-09 04:52:51', '2025-10-09 04:52:51', NULL),
(10, 5, 5, 1, '2025-09-13 04:52:51', '2025-10-09 04:52:51', '2025-10-09 04:52:51', NULL),
(11, 4, 2, 1, '2025-10-04 04:52:51', '2025-10-09 04:52:51', '2025-10-09 04:52:51', NULL),
(12, 5, 2, 5, '2025-10-03 04:52:51', '2025-10-09 04:52:51', '2025-10-09 04:52:51', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `discounts`
--

CREATE TABLE `discounts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED DEFAULT NULL,
  `category_id` bigint(20) UNSIGNED DEFAULT NULL,
  `discount_type` enum('percentage','fixed') NOT NULL,
  `discount_value` decimal(10,2) NOT NULL,
  `valid_from` date NOT NULL,
  `valid_to` date NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `discounts`
--

INSERT INTO `discounts` (`id`, `product_id`, `category_id`, `discount_type`, `discount_value`, `valid_from`, `valid_to`, `created_at`, `updated_at`) VALUES
(2, 2, 2, 'fixed', 8.00, '2025-10-03', '2025-10-21', '2025-10-09 02:18:34', '2025-10-09 02:18:34'),
(3, 1, 1, 'fixed', 8.00, '2025-10-09', '2025-11-07', '2025-10-09 02:18:34', '2025-10-09 02:18:34'),
(4, 3, 1, 'percentage', 39.00, '2025-10-05', '2025-10-20', '2025-10-09 02:18:34', '2025-10-09 02:18:34'),
(5, 5, 2, 'fixed', 28.00, '2025-10-02', '2025-11-04', '2025-10-09 02:18:34', '2025-10-09 02:18:34'),
(6, 3, 2, 'fixed', 25.00, '2025-10-05', '2025-10-20', '2025-10-09 02:18:34', '2025-10-09 02:18:34'),
(7, 4, 1, 'fixed', 33.00, '2025-10-04', '2025-10-22', '2025-10-09 02:18:34', '2025-10-09 02:18:34'),
(8, 5, 2, 'percentage', 19.00, '2025-10-07', '2025-10-28', '2025-10-09 02:18:34', '2025-10-09 02:18:34'),
(9, 4, 1, 'percentage', 39.00, '2025-10-02', '2025-11-05', '2025-10-09 02:18:34', '2025-10-09 02:18:34'),
(10, 1, 2, 'fixed', 32.00, '2025-09-30', '2025-11-06', '2025-10-09 02:18:34', '2025-10-09 02:18:34'),
(11, 4, 1, 'percentage', 7.00, '2025-10-05', '2025-11-02', '2025-10-09 02:18:34', '2025-10-09 02:18:34');

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
-- Table structure for table `inventory_logs`
--

CREATE TABLE `inventory_logs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `variant_id` bigint(20) UNSIGNED DEFAULT NULL,
  `change_type` enum('in','out') NOT NULL,
  `quantity_changed` int(11) NOT NULL,
  `note` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `inventory_logs`
--

INSERT INTO `inventory_logs` (`id`, `product_id`, `variant_id`, `change_type`, `quantity_changed`, `note`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 3, NULL, 'out', 22, 'Sample note for inventory log #1', '2025-10-09 00:23:28', '2025-10-09 00:23:28', NULL),
(2, 4, NULL, 'out', 32, 'Sample note for inventory log #2', '2025-10-09 00:23:28', '2025-10-09 00:23:28', NULL),
(3, 5, 1, 'in', 14, 'Sample note for inventory log #3', '2025-10-09 00:23:28', '2025-10-09 00:23:28', NULL),
(4, 4, NULL, 'out', 41, 'Sample note for inventory log #4', '2025-10-09 00:23:28', '2025-10-09 00:23:28', NULL),
(5, 1, 1, 'in', 38, 'Sample note for inventory log #5', '2025-10-09 00:23:28', '2025-10-09 00:23:28', NULL),
(6, 1, NULL, 'in', 4, 'Sample note for inventory log #6', '2025-10-09 00:23:28', '2025-10-09 00:23:28', NULL),
(7, 5, 3, 'in', 7, 'Sample note for inventory log #7', '2025-10-09 00:23:28', '2025-10-09 00:23:28', NULL),
(8, 1, NULL, 'in', 4, 'Sample note for inventory log #8', '2025-10-09 00:23:28', '2025-10-09 00:23:28', NULL),
(9, 4, 1, 'in', 34, 'Sample note for inventory log #9', '2025-10-09 00:23:28', '2025-10-09 00:23:28', NULL),
(10, 2, NULL, 'out', 22, 'Sample note for inventory log #10', '2025-10-09 00:23:28', '2025-10-09 00:23:28', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(255) NOT NULL,
  `payload` longtext NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `job_batches`
--

CREATE TABLE `job_batches` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `total_jobs` int(11) NOT NULL,
  `pending_jobs` int(11) NOT NULL,
  `failed_jobs` int(11) NOT NULL,
  `failed_job_ids` longtext NOT NULL,
  `options` mediumtext DEFAULT NULL,
  `cancelled_at` int(11) DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `finished_at` int(11) DEFAULT NULL
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
(1, '0001_01_01_000000_create_users_table', 1),
(2, '0001_01_01_000001_create_cache_table', 1),
(3, '0001_01_01_000002_create_jobs_table', 1),
(4, '2025_10_04_095633_create_personal_access_tokens_table', 2),
(5, '2025_10_04_104815_add_role_to_users_table', 3),
(6, '2025_10_04_130511_create_brands_table', 4),
(7, '2025_10_05_120444_create_categories_table', 5),
(8, '2025_10_05_134913_create_sizes_table', 6),
(9, '2025_10_06_021259_create_products_table', 7),
(10, '2025_10_06_010808_create_shippings_table', 8),
(11, '2025_10_06_043128_create_product_images_table', 8),
(12, '2025_10_06_103138_create_coupons_table', 9),
(13, '2025_10_06_130916_create_orders_table', 10),
(14, '2025_10_08_080120_create_product_variants_table', 11),
(15, '2025_10_08_090130_create_wishlists_table', 12),
(16, '2025_10_09_042242_create_order_items_table', 13),
(17, '2025_10_09_052116_create_reviews_table', 14),
(18, '2025_10_09_061315_create_inventory_log_table', 15),
(19, '2025_10_09_061456_create_inventory_logs_table', 16),
(20, '2025_10_09_072251_create_discounts_table', 17),
(21, '2025_10_09_083520_create_notifications_table', 18),
(22, '2025_10_09_085528_create_shipping_methods_table', 19),
(23, '2025_10_09_104434_create_coupon_usages_table', 20),
(24, '2025_10_09_111940_create_order_shippings_table', 21),
(25, '2025_10_09_153109_create_payments_table', 22);

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `message` text NOT NULL,
  `status` enum('unread','read') NOT NULL DEFAULT 'unread',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `notifications`
--

INSERT INTO `notifications` (`id`, `user_id`, `message`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES
(2, 1, 'This is a sample notification message number 1.', 'read', '2025-10-09 02:44:21', '2025-10-09 02:44:21', NULL),
(3, 1, 'This is a sample notification message number 2.', 'unread', '2025-10-09 02:44:21', '2025-10-09 02:44:21', NULL),
(4, 1, 'This is a sample notification message number 3.', 'unread', '2025-10-09 02:44:21', '2025-10-09 02:44:21', NULL),
(5, 1, 'This is a sample notification message number 4.', 'unread', '2025-10-09 02:44:21', '2025-10-09 02:44:21', NULL),
(6, 1, 'This is a sample notification message number 5.', 'unread', '2025-10-09 02:44:21', '2025-10-09 02:44:21', NULL),
(7, 1, 'This is a sample notification message number 6.', 'unread', '2025-10-09 02:44:21', '2025-10-09 02:44:21', NULL),
(8, 1, 'This is a sample notification message number 7.', 'read', '2025-10-09 02:44:21', '2025-10-09 02:44:21', NULL),
(9, 1, 'This is a sample notification message number 8.', 'unread', '2025-10-09 02:44:21', '2025-10-09 02:44:21', NULL),
(10, 1, 'This is a sample notification message number 9.', 'unread', '2025-10-09 02:44:21', '2025-10-09 02:44:21', NULL),
(11, 1, 'This is a sample notification message number 10.', 'read', '2025-10-09 02:44:21', '2025-10-09 02:44:21', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `total_amount` decimal(10,2) NOT NULL DEFAULT 0.00,
  `discount_amount` decimal(10,2) NOT NULL DEFAULT 0.00,
  `shipping_fee` decimal(10,2) NOT NULL DEFAULT 0.00,
  `final_amount` decimal(10,2) NOT NULL DEFAULT 0.00,
  `status` enum('pending','paid','shipped','delivered','cancelled') NOT NULL DEFAULT 'pending',
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `user_id`, `total_amount`, `discount_amount`, `shipping_fee`, `final_amount`, `status`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 1, 1000.00, 100.00, 50.00, 950.00, 'pending', NULL, '2025-10-06 07:38:43', '2025-10-06 07:38:43'),
(2, 1, 1000.00, 100.00, 50.00, 950.00, 'pending', NULL, '2025-10-06 07:39:13', '2025-10-06 07:39:13'),
(3, 1, 1000.00, 100.00, 50.00, 950.00, 'pending', NULL, '2025-10-06 07:39:15', '2025-10-06 07:39:15'),
(4, 1, 1000.00, 100.00, 50.00, 950.00, 'pending', NULL, '2025-10-06 07:39:16', '2025-10-06 07:39:16'),
(5, 1, 1000.00, 100.00, 50.00, 950.00, 'pending', NULL, '2025-10-06 07:39:18', '2025-10-06 07:39:18'),
(6, 1, 1000.00, 100.00, 50.00, 950.00, 'pending', NULL, '2025-10-06 07:39:20', '2025-10-06 07:39:20'),
(7, 1, 1000.00, 100.00, 50.00, 950.00, 'pending', NULL, '2025-10-06 07:39:20', '2025-10-06 07:39:20'),
(8, 1, 1000.00, 100.00, 50.00, 950.00, 'pending', NULL, '2025-10-06 07:39:21', '2025-10-06 07:39:21');

-- --------------------------------------------------------

--
-- Table structure for table `order_items`
--

CREATE TABLE `order_items` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `variant_id` bigint(20) UNSIGNED DEFAULT NULL,
  `quantity` int(11) NOT NULL,
  `price_at_purchase` decimal(10,2) NOT NULL,
  `discount_applied` decimal(10,2) NOT NULL DEFAULT 0.00,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `order_items`
--

INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `variant_id`, `quantity`, `price_at_purchase`, `discount_applied`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 2, 2, 3, 170.00, 61.00, '2025-10-08 22:46:09', '2025-10-08 22:46:09', NULL),
(2, 2, 2, 2, 5, 975.00, 25.00, '2025-10-08 22:46:09', '2025-10-08 22:46:09', NULL),
(3, 1, 2, 2, 5, 287.00, 45.00, '2025-10-08 22:46:09', '2025-10-08 22:46:09', NULL),
(4, 2, 1, 2, 1, 778.00, 46.00, '2025-10-08 22:46:09', '2025-10-08 22:46:09', NULL),
(5, 2, 1, 2, 1, 250.00, 58.00, '2025-10-08 22:46:09', '2025-10-08 22:46:09', NULL),
(6, 2, 1, 1, 4, 265.00, 29.00, '2025-10-08 22:46:09', '2025-10-08 22:46:09', NULL),
(7, 2, 1, 1, 4, 464.00, 76.00, '2025-10-08 22:46:09', '2025-10-08 22:46:09', NULL),
(8, 2, 1, 1, 4, 905.00, 29.00, '2025-10-08 22:46:09', '2025-10-08 22:46:09', NULL),
(9, 1, 1, 2, 4, 680.00, 61.00, '2025-10-08 22:46:09', '2025-10-08 22:46:09', NULL),
(10, 2, 2, 2, 5, 304.00, 19.00, '2025-10-08 22:46:09', '2025-10-08 22:46:09', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `order_shippings`
--

CREATE TABLE `order_shippings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `shipping_method_id` bigint(20) UNSIGNED NOT NULL,
  `address` text NOT NULL,
  `tracking_number` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `order_shippings`
--

INSERT INTO `order_shippings` (`id`, `order_id`, `shipping_method_id`, `address`, `tracking_number`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 4, 3, 'House 1, Road 17, Dhaka, Bangladesh', 'TRK-68E79C70BEA98', '2025-10-09 05:28:48', '2025-10-09 05:28:48', NULL),
(2, 1, 1, 'House 2, Road 13, Dhaka, Bangladesh', 'TRK-68E79C70CA080', '2025-10-09 05:28:48', '2025-10-09 05:28:48', NULL),
(3, 2, 1, 'House 3, Road 16, Dhaka, Bangladesh', 'TRK-68E79C70CB43F', '2025-10-09 05:28:48', '2025-10-09 05:28:48', NULL),
(4, 2, 1, 'House 4, Road 2, Dhaka, Bangladesh', 'TRK-68E79C70CDA5A', '2025-10-09 05:28:48', '2025-10-09 05:28:48', NULL),
(5, 3, 5, 'House 5, Road 13, Dhaka, Bangladesh', 'TRK-68E79C70CE856', '2025-10-09 05:28:48', '2025-10-09 05:28:48', NULL),
(6, 4, 3, 'House 6, Road 15, Dhaka, Bangladesh', 'TRK-68E79C70CF67C', '2025-10-09 05:28:48', '2025-10-09 05:28:48', NULL),
(7, 5, 5, 'House 7, Road 6, Dhaka, Bangladesh', 'TRK-68E79C70D095C', '2025-10-09 05:28:48', '2025-10-09 05:28:48', NULL),
(8, 4, 2, 'House 8, Road 16, Dhaka, Bangladesh', 'TRK-68E79C70D1B1B', '2025-10-09 05:28:48', '2025-10-09 05:28:48', NULL),
(9, 3, 2, 'House 9, Road 6, Dhaka, Bangladesh', 'TRK-68E79C70D294F', '2025-10-09 05:28:48', '2025-10-09 05:28:48', NULL),
(10, 2, 4, 'House 10, Road 7, Dhaka, Bangladesh', 'TRK-68E79C70D3B4A', '2025-10-09 05:28:48', '2025-10-09 05:28:48', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

CREATE TABLE `payments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `payment_method` enum('card','mobile_banking','COD') NOT NULL,
  `transaction_id` varchar(150) NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `status` enum('pending','success','failed') NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `payments`
--

INSERT INTO `payments` (`id`, `order_id`, `payment_method`, `transaction_id`, `amount`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 6, 'mobile_banking', 'PAYGUWCOMB1OH', 167.30, 'success', '2025-10-09 09:43:56', '2025-10-09 09:43:56', NULL),
(2, 4, 'COD', 'PAYUQUQJWN1BN', 324.30, 'success', '2025-10-09 09:43:56', '2025-10-09 09:43:56', NULL),
(3, 7, 'COD', 'PAYBGQBX7F1ND', 56.30, 'pending', '2025-10-09 09:43:56', '2025-10-09 09:43:56', NULL),
(4, 8, 'card', 'PAYOPL5AQSWKR', 213.70, 'failed', '2025-10-09 09:43:56', '2025-10-09 09:43:56', NULL),
(5, 7, 'COD', 'PAYFOO7G9C1PD', 489.00, 'pending', '2025-10-09 09:43:56', '2025-10-09 09:43:56', NULL),
(6, 4, 'card', 'PAYUPZQ31BDW2', 137.80, 'success', '2025-10-09 09:43:56', '2025-10-09 09:43:56', NULL),
(7, 2, 'mobile_banking', 'PAYR54DCXYK5D', 80.30, 'success', '2025-10-09 09:43:56', '2025-10-09 09:43:56', NULL),
(8, 4, 'COD', 'PAYYU3RAX0H3A', 123.50, 'failed', '2025-10-09 09:43:56', '2025-10-09 09:43:56', NULL),
(9, 2, 'card', 'PAY59ORRK3VPG', 108.40, 'success', '2025-10-09 09:43:56', '2025-10-09 09:43:56', NULL),
(10, 7, 'mobile_banking', 'PAYFW4HJ4BTDY', 245.90, 'success', '2025-10-09 09:43:56', '2025-10-09 09:43:56', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` text NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `personal_access_tokens`
--

INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES
(1, 'App\\Models\\User', 1, 'token', 'e3bdf2f27580d2e54e0a9edb250747fa3e16131d161bf8966e1895f365a31ad1', '[\"*\"]', NULL, NULL, '2025-10-04 04:58:06', '2025-10-04 04:58:06'),
(2, 'App\\Models\\User', 1, 'token', 'd3ef6af973578a71a3329fd607f084e2382780b0a4ef9c91f5dfa8036ae76978', '[\"*\"]', '2025-10-11 02:08:27', NULL, '2025-10-04 06:59:19', '2025-10-11 02:08:27'),
(3, 'App\\Models\\User', 1, 'token', '2e6466a82532ab0843f97d07f40858e5541835ba88b97597291cbcdc8e79eb9d', '[\"*\"]', NULL, NULL, '2025-10-04 07:25:41', '2025-10-04 07:25:41'),
(4, 'App\\Models\\User', 1, 'token', '310593fdcf298f242f6e2f63a8f946e374cebcae483714da1bfe07ec8264cec1', '[\"*\"]', NULL, NULL, '2025-10-05 01:19:37', '2025-10-05 01:19:37'),
(5, 'App\\Models\\User', 1, 'token', 'a307b5902a0fab7481b2b4ca8207b9cf9d976588902d2b255b401dfbd693505d', '[\"*\"]', NULL, NULL, '2025-10-05 01:31:01', '2025-10-05 01:31:01'),
(6, 'App\\Models\\User', 1, 'token', '6e6d0707650da742faf6af5be3da9e0c575df420e8fcf845b4c412aa31861304', '[\"*\"]', NULL, NULL, '2025-10-05 01:32:19', '2025-10-05 01:32:19'),
(7, 'App\\Models\\User', 1, 'token', '98bcf37bb6b7c3b604f133803df8523deed1bf110ed7230c84d718dc4792f523', '[\"*\"]', NULL, NULL, '2025-10-05 01:33:18', '2025-10-05 01:33:18'),
(8, 'App\\Models\\User', 1, 'token', 'c124e8af7fe7d2068863d40694c958653c5b8d5a5cecd4ba61e91d42e00e2323', '[\"*\"]', NULL, NULL, '2025-10-05 02:11:09', '2025-10-05 02:11:09'),
(9, 'App\\Models\\User', 1, 'token', '0ab960bb0966a2a84f63777b96d4816c9a6e67968239c264a055a0a9328bbf90', '[\"*\"]', NULL, NULL, '2025-10-05 02:12:32', '2025-10-05 02:12:32'),
(10, 'App\\Models\\User', 1, 'token', '3197a90bbbb1fa39b2f464374a0dc11a58d2af298191fcdc74446bc981b0b67c', '[\"*\"]', NULL, NULL, '2025-10-05 02:41:45', '2025-10-05 02:41:45'),
(11, 'App\\Models\\User', 1, 'token', 'c3021456165867b82ea99d82454206f9570a74fd1884584e123299cc1dbe018d', '[\"*\"]', NULL, NULL, '2025-10-05 02:42:00', '2025-10-05 02:42:00'),
(12, 'App\\Models\\User', 1, 'token', '5afda29a9c9a641b30e708c1cef12163528435c68a0bb85b121a55b55fc8ef70', '[\"*\"]', NULL, NULL, '2025-10-05 02:43:41', '2025-10-05 02:43:41'),
(13, 'App\\Models\\User', 1, 'token', '4eb88335621b15536fb290ed4fc0af92abd3cf6767203cc0ccde0c314bda0f51', '[\"*\"]', NULL, NULL, '2025-10-05 02:44:41', '2025-10-05 02:44:41'),
(14, 'App\\Models\\User', 1, 'token', 'd4e665ba9542bcf49d75091170904a502e82e251d25c75a9fc7065f694241295', '[\"*\"]', NULL, NULL, '2025-10-05 02:51:12', '2025-10-05 02:51:12'),
(15, 'App\\Models\\User', 1, 'token', '22453ee7238c2ef7c84ead86d3f59f460c292c2906a38b83b038d543a7deb530', '[\"*\"]', NULL, NULL, '2025-10-05 03:25:37', '2025-10-05 03:25:37'),
(16, 'App\\Models\\User', 1, 'token', 'a8c9d643c641a9b2da4a5399968bb9f4f0f9d61f92b40995f06b2b3cf0ba8a57', '[\"*\"]', NULL, NULL, '2025-10-05 03:27:39', '2025-10-05 03:27:39'),
(17, 'App\\Models\\User', 1, 'token', 'f56487354e14d4e8c519d8067d495416b592bf3277760449f1f531cf0f59206d', '[\"*\"]', NULL, NULL, '2025-10-05 03:47:59', '2025-10-05 03:47:59'),
(18, 'App\\Models\\User', 1, 'token', '807daa9e3ad76ac202e2c1d2edc2cf60487380cbed60d697f01db6e8b03a8b74', '[\"*\"]', NULL, NULL, '2025-10-05 04:28:04', '2025-10-05 04:28:04'),
(19, 'App\\Models\\User', 1, 'token', 'e5385ec53266c2542a00f602a9bf56db0656b152901cbeaab24d51701f35424b', '[\"*\"]', NULL, NULL, '2025-10-05 04:47:04', '2025-10-05 04:47:04'),
(20, 'App\\Models\\User', 1, 'token', '1661289d6d1d8b9312c8ceb77943ac6b8b7ed6ea14296695ec37099b387b61b6', '[\"*\"]', NULL, NULL, '2025-10-05 05:26:41', '2025-10-05 05:26:41'),
(21, 'App\\Models\\User', 1, 'token', '1155404ba8e0e14272ef4b2b88f815a0de6801641d48a1e9414ab30bf856f879', '[\"*\"]', NULL, NULL, '2025-10-05 19:50:44', '2025-10-05 19:50:44'),
(22, 'App\\Models\\User', 1, 'token', '67a64452c59410ebc7dfcb3a802bb3c3b6baa3bbb7edb50e8f46575f584953f4', '[\"*\"]', NULL, NULL, '2025-10-06 05:03:13', '2025-10-06 05:03:13'),
(23, 'App\\Models\\User', 1, 'token', '9562e2a6221e3fc34e58e0a4a9a14ccd52f88973061ffbfd80b2aa16c3e59748', '[\"*\"]', NULL, NULL, '2025-10-07 05:16:03', '2025-10-07 05:16:03'),
(24, 'App\\Models\\User', 1, 'token', '7f980c0a5883690391ddf34964327cb0b5f74b431554e04dae26a3726b995d3e', '[\"*\"]', NULL, NULL, '2025-10-07 06:13:56', '2025-10-07 06:13:56'),
(25, 'App\\Models\\User', 1, 'token', 'e74728b6e9171a63a3acf08f502bc7a9a4ab0137e2948dc50e5dcd7517c7d6a7', '[\"*\"]', NULL, NULL, '2025-10-07 19:32:41', '2025-10-07 19:32:41'),
(26, 'App\\Models\\User', 1, 'token', 'e3f7fec4fc6f55afb10fc796b1028c39593cfe1bc588443852fb065d526dcf8c', '[\"*\"]', NULL, NULL, '2025-10-07 21:18:18', '2025-10-07 21:18:18'),
(27, 'App\\Models\\User', 1, 'token', '0d87f4146c14e808db66ef39b3f37f77de97a31edc234283add0ebe46efa8def', '[\"*\"]', NULL, NULL, '2025-10-07 23:32:13', '2025-10-07 23:32:13'),
(28, 'App\\Models\\User', 1, 'token', '8df9c59b38ea7d2eaa240c6c9b0bdd02342f1597a1c0dc00a41197b0a66ecf74', '[\"*\"]', NULL, NULL, '2025-10-08 01:22:58', '2025-10-08 01:22:58'),
(29, 'App\\Models\\User', 1, 'token', '377d59c86be5906a357c30914f836c43e0bb54a8cd8fc4fc1da65ce761003e01', '[\"*\"]', NULL, NULL, '2025-10-08 08:24:44', '2025-10-08 08:24:44'),
(30, 'App\\Models\\User', 1, 'token', 'ef8131cfe7f4968d506a80dbb3869cbb4f80293a50e60efa9d8b79501fcca09c', '[\"*\"]', NULL, NULL, '2025-10-08 20:04:44', '2025-10-08 20:04:44'),
(31, 'App\\Models\\User', 1, 'token', '47def934ef34a5902ce5365b3f52aa2a6855e6fd164be95865671a1960986a7b', '[\"*\"]', NULL, NULL, '2025-10-09 10:18:06', '2025-10-09 10:18:06'),
(32, 'App\\Models\\User', 1, 'token', 'deef8bfceff7cd7595c11390f5523d47477d6343a2f17af8ef011486b34ab680', '[\"*\"]', NULL, NULL, '2025-10-09 11:25:09', '2025-10-09 11:25:09'),
(33, 'App\\Models\\User', 1, 'token', 'fb9b66c268315a436bce77029a8900221fe7f16a20bde242af163c6ecbdbd8e8', '[\"*\"]', NULL, NULL, '2025-10-09 11:32:35', '2025-10-09 11:32:35'),
(34, 'App\\Models\\User', 1, 'token', '916a659a912cdd1e04be40eddd9fb7f707f1bd5346ffa2b5e9b4fb527a91d789', '[\"*\"]', NULL, NULL, '2025-10-09 11:42:19', '2025-10-09 11:42:19'),
(35, 'App\\Models\\User', 1, 'token', 'c16b5c1b556d5a7bf8c47fe3741a93c8a0da2d71981e158177887a18b409cb76', '[\"*\"]', NULL, NULL, '2025-10-09 11:46:48', '2025-10-09 11:46:48'),
(36, 'App\\Models\\User', 1, 'token', '11aca4c930d2a1810ad4008a273f4282c535dc096a87ca50998bab3ec65ff8e6', '[\"*\"]', NULL, NULL, '2025-10-10 08:59:11', '2025-10-10 08:59:11'),
(37, 'App\\Models\\User', 1, 'token', '3ee33233bde6814190328d2d1b84848fec4342fdbea221072681c2995e1d2323', '[\"*\"]', NULL, NULL, '2025-10-10 20:37:23', '2025-10-10 20:37:23'),
(38, 'App\\Models\\User', 1, 'token', 'da9aced3d769f031b154b869af7cb09bdb802df29580dfb129a5e4b6e9e84054', '[\"*\"]', NULL, NULL, '2025-10-11 00:25:37', '2025-10-11 00:25:37'),
(39, 'App\\Models\\User', 1, 'token', 'fcbf7ad7c3809a82dd9e321871d774d72de5bb63baf29b28c58117c61e1fa1f5', '[\"*\"]', NULL, NULL, '2025-10-11 02:03:22', '2025-10-11 02:03:22');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `category_id` bigint(20) UNSIGNED NOT NULL,
  `brand_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `sku` varchar(100) NOT NULL,
  `description` text DEFAULT NULL,
  `base_price` decimal(10,2) NOT NULL,
  `stock_quantity` int(11) NOT NULL DEFAULT 0,
  `weight` decimal(8,2) DEFAULT NULL,
  `is_seasonal` tinyint(1) DEFAULT 0,
  `seasonal_start_date` date DEFAULT NULL,
  `seasonal_end_date` date DEFAULT NULL,
  `status` enum('active','inactive') DEFAULT 'active',
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `category_id`, `brand_id`, `name`, `sku`, `description`, `base_price`, `stock_quantity`, `weight`, `is_seasonal`, `seasonal_start_date`, `seasonal_end_date`, `status`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 'Mominul', 'mominul', 'development skill', 90000.00, 10, 60.00, 1, '2025-01-01', '2025-12-31', 'active', '2025-10-07 08:20:51', '2025-10-05 21:18:32', '2025-10-07 08:20:51'),
(2, 1, 1, 'Mominul Product 1', 'mominul-1', 'Development skill product number 1', 91000.00, 11, 60.00, 1, '2025-01-01', '2025-12-31', 'active', '2025-10-08 20:28:07', '2025-10-05 22:23:34', '2025-10-08 20:28:07'),
(3, 1, 1, 'Mominul Product 2', 'mominul-2', 'Development skill product number 2', 92000.00, 12, 60.00, 1, '2025-01-01', '2025-12-31', 'active', NULL, '2025-10-05 22:23:34', '2025-10-05 22:23:34'),
(4, 1, 1, 'Mominul Product 3', 'mominul-3', 'Development skill product number 3', 93000.00, 13, 60.00, 1, '2025-01-01', '2025-12-31', 'active', NULL, '2025-10-05 22:23:34', '2025-10-05 22:23:34'),
(5, 1, 1, 'Mominul Product 4', 'mominul-4', 'Development skill product number 4', 94000.00, 14, 60.00, 1, '2025-01-01', '2025-12-31', 'active', NULL, '2025-10-05 22:23:34', '2025-10-05 22:23:34'),
(6, 1, 1, 'Mominul Product 5', 'mominul-5', 'Development skill product number 5', 95000.00, 15, 60.00, 1, '2025-01-01', '2025-12-31', 'active', NULL, '2025-10-05 22:23:34', '2025-10-05 22:23:34'),
(7, 1, 1, 'Mominul Product 6', 'mominul-6', 'Development skill product number 6', 96000.00, 16, 60.00, 1, '2025-01-01', '2025-12-31', 'active', NULL, '2025-10-05 22:23:34', '2025-10-05 22:23:34'),
(8, 1, 1, 'Mominul Product 7', 'mominul-7', 'Development skill product number 7', 97000.00, 17, 60.00, 1, '2025-01-01', '2025-12-31', 'active', NULL, '2025-10-05 22:23:34', '2025-10-05 22:23:34'),
(9, 1, 1, 'Mominul Product 8', 'mominul-8', 'Development skill product number 8', 98000.00, 18, 60.00, 1, '2025-01-01', '2025-12-31', 'active', NULL, '2025-10-05 22:23:34', '2025-10-05 22:23:34'),
(10, 1, 1, 'Mominul Product 9', 'mominul-9', 'Development skill product number 9', 99000.00, 19, 60.00, 1, '2025-01-01', '2025-12-31', 'active', NULL, '2025-10-05 22:23:34', '2025-10-05 22:23:34'),
(11, 1, 1, 'Mominul Product 10', 'mominul-10', 'Development skill product number 10', 100000.00, 20, 60.00, 1, '2025-01-01', '2025-12-31', 'active', NULL, '2025-10-05 22:23:34', '2025-10-05 22:23:34'),
(12, 1, 1, 'Mominul Product 11', 'mominul-11', 'Development skill product number 11', 101000.00, 21, 60.00, 1, '2025-01-01', '2025-12-31', 'active', NULL, '2025-10-05 22:23:34', '2025-10-05 22:23:34'),
(13, 1, 1, 'Mominul Product 12', 'mominul-12', 'Development skill product number 12', 102000.00, 22, 60.00, 1, '2025-01-01', '2025-12-31', 'active', NULL, '2025-10-05 22:23:34', '2025-10-05 22:23:34'),
(14, 1, 1, 'Mominul Product 13', 'mominul-13', 'Development skill product number 13', 103000.00, 23, 60.00, 1, '2025-01-01', '2025-12-31', 'active', NULL, '2025-10-05 22:23:34', '2025-10-05 22:23:34'),
(15, 1, 1, 'Mominul Product 14', 'mominul-14', 'Development skill product number 14', 104000.00, 24, 60.00, 1, '2025-01-01', '2025-12-31', 'active', NULL, '2025-10-05 22:23:34', '2025-10-05 22:23:34'),
(16, 1, 1, 'Mominul Product 15', 'mominul-15', 'Development skill product number 15', 105000.00, 25, 60.00, 1, '2025-01-01', '2025-12-31', 'active', NULL, '2025-10-05 22:23:34', '2025-10-05 22:23:34'),
(17, 1, 1, 'Mominul Product 16', 'mominul-16', 'Development skill product number 16', 106000.00, 26, 60.00, 1, '2025-01-01', '2025-12-31', 'active', NULL, '2025-10-05 22:23:34', '2025-10-05 22:23:34'),
(18, 1, 1, 'Mominul Product 17', 'mominul-17', 'Development skill product number 17', 107000.00, 27, 60.00, 1, '2025-01-01', '2025-12-31', 'active', NULL, '2025-10-05 22:23:34', '2025-10-05 22:23:34'),
(19, 1, 1, 'Mominul Product 18', 'mominul-18', 'Development skill product number 18', 108000.00, 28, 60.00, 1, '2025-01-01', '2025-12-31', 'active', NULL, '2025-10-05 22:23:34', '2025-10-05 22:23:34'),
(20, 1, 1, 'Mominul Product 19', 'mominul-19', 'Development skill product number 19', 109000.00, 29, 60.00, 1, '2025-01-01', '2025-12-31', 'active', '2025-10-07 08:21:01', '2025-10-05 22:23:34', '2025-10-07 08:21:01'),
(21, 1, 1, 'Mominul Product 20', 'mominul-20', 'Development skill product number 20', 110000.00, 30, 60.00, 1, '2025-01-01', '2025-12-31', 'active', '2025-10-06 01:17:38', '2025-10-05 22:23:34', '2025-10-06 01:17:38'),
(22, 1, 4, 'SoftNovaIT', 'dsfdsdsf', 'dfdsfd', 45464.00, 54, 60.00, 1, '2025-10-24', '2025-10-16', 'active', '2025-10-08 20:28:11', '2025-10-06 04:14:36', '2025-10-08 20:28:11'),
(23, 1, 5, 'hghg', 'JHDGD', 'ghghg', 454.00, 54, 60.00, 1, '2025-10-23', '2025-10-15', 'active', '2025-10-08 20:28:16', '2025-10-06 04:47:05', '2025-10-08 20:28:16'),
(24, 1, 1, 'iPhone 15', 'iphone', 'sdkfdj', 1245667.00, 10, 0.60, 0, NULL, NULL, 'active', '2025-10-08 20:28:33', '2025-10-06 09:39:11', '2025-10-08 20:28:33'),
(25, 1, 1, 'iPhone 15', 'car0', 'sdkfdj', 1245667.00, 10, 0.60, 0, NULL, NULL, 'active', '2025-10-08 20:28:37', '2025-10-06 09:41:47', '2025-10-08 20:28:37'),
(26, 1, 5, 'SoftNovaIT', 'dsfdsdsf12', 'fdfsds', 56575.00, 30, 60.00, 0, NULL, NULL, 'active', '2025-10-08 20:28:42', '2025-10-06 20:43:38', '2025-10-08 20:28:42'),
(27, 2, 2, 'jkdjfkd', 'ldfkldkf', 'dfdsfdgd', 45464.00, 54, 60.00, 0, NULL, NULL, 'active', '2025-10-08 20:28:46', '2025-10-06 21:54:49', '2025-10-08 20:28:46'),
(28, 1, 5, 'Dummy', 'dsfdsdsf879', 'ddgfgf', 565.00, 5656, 656.00, 1, '2025-10-22', '2025-10-16', 'active', '2025-10-08 20:29:11', '2025-10-06 22:39:47', '2025-10-08 20:29:11'),
(29, 2, 3, 'Dummy2', 'ghgjysere2', 'fgdfgdfhg2', 500.00, 70, 0.80, 1, '2025-10-07', '2025-10-30', 'active', '2025-10-07 05:43:41', '2025-10-07 00:33:38', '2025-10-07 05:43:41'),
(30, 2, 4, 'dfdffd', 'fdsfdsgfgg', 'sdfdsfds', 596.00, 987, 60.00, 0, NULL, NULL, 'active', NULL, '2025-10-08 20:27:10', '2025-10-08 20:27:10'),
(31, 1, 2, 'BrandTest-02', 'kjdkfjcv', 'sdsada', 4343.00, 4343, 43.00, 0, NULL, NULL, 'active', NULL, '2025-10-08 20:27:43', '2025-10-08 20:27:43');

-- --------------------------------------------------------

--
-- Table structure for table `product_images`
--

CREATE TABLE `product_images` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `image_url` varchar(255) NOT NULL,
  `is_primary` tinyint(1) NOT NULL DEFAULT 0,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_images`
--

INSERT INTO `product_images` (`id`, `product_id`, `image_url`, `is_primary`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 1, 'kjdkfjdk.jpg', 1, NULL, '2025-10-05 23:16:49', '2025-10-05 23:16:49'),
(2, 24, '/storage/uploads/products/pyHjdZ49VehTwqBpGS8vWewrmbriANlUnav0na0p.jpg', 1, NULL, '2025-10-06 09:39:11', '2025-10-06 09:39:11'),
(3, 25, '/storage/uploads/products/SsvUFRoROawvc5kBr7YFK61sdR0ucx9PG1SjRSEU.jpg', 1, NULL, '2025-10-06 09:41:47', '2025-10-06 09:41:47'),
(4, 25, '/storage/uploads/products/jW14oitor32OPWq8p6EsZfEzbLWH6D6cGMhXRKG9.jpg', 0, NULL, '2025-10-06 09:41:47', '2025-10-06 09:41:47'),
(5, 25, '/storage/uploads/products/fweWiy7bPGSSGWMBgFT3vohXDQ9oGvNIay3WP3by.jpg', 0, NULL, '2025-10-06 09:41:47', '2025-10-06 09:41:47'),
(6, 28, '/storage/uploads/products/uDypwrmiIK9YgTSh74ytS11BBcND4JFjJT58B71N.jpg', 1, NULL, '2025-10-06 22:39:48', '2025-10-06 22:39:48'),
(7, 28, '/storage/uploads/products/PFWoaCIQ6RLgocGgkGusdFsZchSbBaGsfVYRnFVh.jpg', 0, NULL, '2025-10-06 22:39:48', '2025-10-06 22:39:48'),
(8, 28, '/storage/uploads/products/I7v012uWN5y6zmnX0ADjBgJSL1lX6HbUhtKvILZJ.jpg', 0, NULL, '2025-10-06 22:39:48', '2025-10-06 22:39:48'),
(9, 29, '/storage/uploads/products/5Ow8dC2wibdFztH8nx7OYKUT303ErDdK5sIp3WBW.jpg', 1, NULL, '2025-10-07 00:33:38', '2025-10-07 00:33:38'),
(10, 29, '/storage/uploads/products/x3HvUqU6GYsJyblUkGruJnYB8SZrbutnBKcMMA3v.jpg', 0, NULL, '2025-10-07 00:33:38', '2025-10-07 00:33:38'),
(11, 29, '/storage/uploads/products/JGxJQ25oSlhmORoHYVaGR4jY9bSpXoKKiodmphX7.jpg', 0, NULL, '2025-10-07 00:33:38', '2025-10-07 00:33:38'),
(12, 27, '/storage/uploads/products/uesNpdh0pSxuSQvbeRu9ByDQHJtc9f79ldJ5mAOs.jpg', 1, NULL, '2025-10-07 05:02:42', '2025-10-07 05:02:42'),
(13, 27, '/storage/uploads/products/VJetsm2ZeqNABaosKIoxHYzlmua6GrIJNJMOiB0v.jpg', 0, NULL, '2025-10-07 05:02:42', '2025-10-07 05:02:42'),
(14, 27, '/storage/uploads/products/vLDPiVxJcvp3c1pXtnESFnttdVsv2r8nEMg6pSYA.jpg', 0, NULL, '2025-10-07 05:02:42', '2025-10-07 05:02:42'),
(15, 26, '/storage/uploads/products/Ymd83tgxNSgohf5enzyBjB9BkuANLiM97aaMUeQ1.jpg', 1, NULL, '2025-10-07 05:03:13', '2025-10-07 05:03:13'),
(16, 26, '/storage/uploads/products/O0GKyCFIRSfwrANdwpPYaa1KgKjXIrjE9fqRbTH8.jpg', 0, NULL, '2025-10-07 05:03:13', '2025-10-07 05:03:13'),
(17, 29, '/storage/uploads/products/5lFKGQpxZBtmdYu4V7mimEQ6xNVEUOeRYRslKu6l.jpg', 1, NULL, '2025-10-07 05:18:06', '2025-10-07 05:18:06'),
(18, 23, '/storage/uploads/products/YpLLgwWgPB1YCmThnmddbTzHp3HjOFBWjNTh8bji.jpg', 1, NULL, '2025-10-07 05:22:32', '2025-10-07 05:22:32'),
(19, 23, '/storage/uploads/products/epCNiYsKn5t2B4vTYnXFU9Uf0Q7FIowv7UPJ1vl2.jpg', 0, NULL, '2025-10-07 05:22:32', '2025-10-07 05:22:32'),
(20, 23, '/storage/uploads/products/FM16Jo3Z0Pf6kKpB3VEGcwlmd7tau26AwXgyBe4b.jpg', 0, NULL, '2025-10-07 05:22:32', '2025-10-07 05:22:32'),
(21, 23, '/storage/uploads/products/LDM4AspJMdokYnlUg62JoMN89hWU68RLzLcZMdqM.jpg', 1, NULL, '2025-10-07 05:23:02', '2025-10-07 05:23:02'),
(22, 22, '/storage/uploads/products/HpYQNK5YyMFBj5SyUiT5AZuZzoQGMhDuqIYj3Mk9.jpg', 1, NULL, '2025-10-07 05:42:33', '2025-10-07 05:42:33'),
(23, 22, '/storage/uploads/products/dJ7QBQzfJkSHCW7x2bWaq4jDzzvRIQdOuu1dwyWJ.jpg', 0, NULL, '2025-10-07 05:42:33', '2025-10-07 05:42:33'),
(24, 2, '/storage/uploads/products/k0TEf26QMbDW4Ez0oNVt9SxmAnYYCZl7BiQQHeFn.jpg', 1, NULL, '2025-10-07 05:42:56', '2025-10-07 05:42:56'),
(25, 28, '/storage/uploads/products/Wjtl56FJ02MHzANvuUoaLv9ScqAYpsX7Ir1FnXEa.jpg', 1, NULL, '2025-10-08 20:25:36', '2025-10-08 20:25:36'),
(26, 30, '/storage/uploads/products/2NM6MjmyfOFCHbvhfYkiGoe5TDlXmspYyWLUOOSY.jpg', 1, NULL, '2025-10-08 20:27:10', '2025-10-08 20:27:10'),
(27, 30, '/storage/uploads/products/Zwfw4kpK3bDxCCRCHvcTMzr2pfhyOy7VJZUUucsx.jpg', 0, NULL, '2025-10-08 20:27:10', '2025-10-08 20:27:10'),
(28, 30, '/storage/uploads/products/t4oaN6NzRKcFkMezZjLM0y1j6JSbeBdHV97OkZH8.jpg', 0, NULL, '2025-10-08 20:27:10', '2025-10-08 20:27:10'),
(29, 31, '/storage/uploads/products/NQYKRom6RMu2Kgv91uNxGvF9d9rOCdRD9N9cKD7w.jpg', 1, NULL, '2025-10-08 20:27:43', '2025-10-08 20:27:43'),
(30, 31, '/storage/uploads/products/1WfOYhl2EZYkkNweZsXj3tufFBJKXpXKJFbGa6wJ.jpg', 0, NULL, '2025-10-08 20:27:43', '2025-10-08 20:27:43'),
(31, 31, '/storage/uploads/products/BbFhXeWxTmfAfoUR9af11pmxZhMOjetAvj9hMc93.jpg', 0, NULL, '2025-10-08 20:27:43', '2025-10-08 20:27:43'),
(32, 3, '/storage/uploads/products/Skb0ENC9w7FfrwWBcgRgV7bqRmhc9PtigJedCOSS.webp', 1, NULL, '2025-10-11 00:27:08', '2025-10-11 00:27:08'),
(33, 4, '/storage/uploads/products/3BjCf64TNpoyykzS4mOM86UJ4oYvDKewcKq3b47Y.webp', 1, NULL, '2025-10-11 00:27:29', '2025-10-11 00:27:29'),
(34, 5, '/storage/uploads/products/BPsaaURaMvCoq6pEcvfOT3emwjlt7R2uoLOwQEXB.jpg', 1, NULL, '2025-10-11 00:27:50', '2025-10-11 00:27:50'),
(35, 6, '/storage/uploads/products/oN4kkA1eZPMZDKJy79jyJRUXgIQWNccwQNgEe8wB.jpg', 1, NULL, '2025-10-11 00:28:14', '2025-10-11 00:28:14'),
(36, 7, '/storage/uploads/products/ZBgT76tehWP4rtpBF5UQOqAZaEt20XbOvNVEp0L9.jpg', 1, NULL, '2025-10-11 00:28:34', '2025-10-11 00:28:34'),
(37, 8, '/storage/uploads/products/zHkIKU7eDOGieeJB1sIbk0MnfjULT5iNboWtR1hn.webp', 1, NULL, '2025-10-11 00:28:53', '2025-10-11 00:28:53'),
(38, 9, '/storage/uploads/products/mTUgYNHgnruU6pHsoT9X83msp2plzT0TYvvykFPU.jpg', 1, NULL, '2025-10-11 00:29:13', '2025-10-11 00:29:13'),
(39, 10, '/storage/uploads/products/jJ7Cjv2y3ZRB0de27HAr0gOnqGmOAfSbuoJ6NvZH.jpg', 1, NULL, '2025-10-11 00:29:33', '2025-10-11 00:29:33');

-- --------------------------------------------------------

--
-- Table structure for table `product_variants`
--

CREATE TABLE `product_variants` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `size_id` bigint(20) UNSIGNED DEFAULT NULL,
  `color` varchar(50) DEFAULT NULL,
  `additional_price` decimal(10,2) NOT NULL DEFAULT 0.00,
  `stock_quantity` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_variants`
--

INSERT INTO `product_variants` (`id`, `product_id`, `size_id`, `color`, `additional_price`, `stock_quantity`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 5, 2, 'Blue', 139.00, 24, '2025-10-08 02:07:37', '2025-10-08 02:07:37', NULL),
(2, 5, 3, 'White', 57.00, 90, '2025-10-08 02:07:37', '2025-10-08 02:07:37', NULL),
(3, 5, 1, 'Red', 50.00, 26, '2025-10-08 02:07:37', '2025-10-08 02:07:37', NULL),
(4, 3, 1, 'Black', 148.00, 89, '2025-10-08 02:07:37', '2025-10-08 02:07:37', NULL),
(5, 3, 3, 'Red', 124.00, 87, '2025-10-08 02:07:37', '2025-10-08 02:07:37', NULL),
(6, 5, 3, 'Blue', 191.00, 56, '2025-10-08 02:07:37', '2025-10-08 02:07:37', NULL),
(7, 1, 2, 'Red', 151.00, 28, '2025-10-08 02:07:37', '2025-10-08 02:07:37', NULL),
(8, 4, 1, 'Blue', 69.00, 68, '2025-10-08 02:07:37', '2025-10-08 02:07:37', NULL),
(9, 2, 1, 'Red', 82.00, 84, '2025-10-08 02:07:37', '2025-10-08 02:07:37', NULL),
(10, 4, 1, 'Black', 169.00, 62, '2025-10-08 02:07:37', '2025-10-08 02:07:37', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `reviews`
--

CREATE TABLE `reviews` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `rating` int(11) NOT NULL,
  `comment` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `reviews`
--

INSERT INTO `reviews` (`id`, `user_id`, `product_id`, `rating`, `comment`, `created_at`, `updated_at`, `deleted_at`) VALUES
(2, 1, 2, 1, 'This is a sample review number 1', '2025-10-08 23:42:43', '2025-10-08 23:42:43', NULL),
(3, 1, 1, 1, 'This is a sample review number 2', '2025-10-08 23:42:43', '2025-10-08 23:42:43', NULL),
(4, 1, 2, 3, 'This is a sample review number 3', '2025-10-08 23:42:43', '2025-10-08 23:42:43', NULL),
(5, 1, 2, 5, 'This is a sample review number 4', '2025-10-08 23:42:43', '2025-10-08 23:42:43', NULL),
(6, 1, 2, 2, 'This is a sample review number 5', '2025-10-08 23:42:43', '2025-10-08 23:42:43', NULL),
(7, 1, 1, 3, 'This is a sample review number 6', '2025-10-08 23:42:43', '2025-10-08 23:42:43', NULL),
(8, 1, 2, 3, 'This is a sample review number 7', '2025-10-08 23:42:43', '2025-10-08 23:42:43', NULL),
(9, 1, 1, 3, 'This is a sample review number 8', '2025-10-08 23:42:43', '2025-10-08 23:42:43', NULL),
(10, 1, 2, 2, 'This is a sample review number 9', '2025-10-08 23:42:43', '2025-10-08 23:42:43', NULL),
(11, 1, 1, 5, 'This is a sample review number 10', '2025-10-08 23:42:43', '2025-10-08 23:42:43', NULL);

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
('1JgrLLSpF8Ykm0O4JUl0f9Yt0OZwlh8jhq0E4Ggk', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiOFBFNmdxTjE1ZHM4RGVTZlZqZG15d1Zib0J6eWRVSFlmMEN5cElrcyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1759907601),
('2ryBVCBdk28sNWg8U43U5pjQEzeZralneVi20AmO', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoidXdFSndWZlpxSXl6V2g4YVNBMTZPV3NtVm9HVGp2S3BZVmdkb3p4RCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1759933466),
('3LuVudKOPymxOwN6p7LxAYKT7HA2nBiZwW581yOH', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoic05BZG5TRlJFTHZNZ0xENlVOb1B3UmtCYU1LSWpmV3hldXVuakdzaiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1759885613),
('8XijJtjlsHekWLzeuS7gvNZVif5MEfDDzEeZFCUr', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiY0VwS0VaOEZOdGE2azIzcVR6b2NaUjRSVHROTFlMTWM2eW1JOWp0ciI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1759804921),
('bSX7Uxxoq2kKBO9cfjzXzHm1dA27KXvo5WpvqmZ3', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoibWZLMzJzTTRUM1dSVmJuT0QwcFladUFGSTlGRk9nZHNXc0hncU5NYyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6OTI6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC8vc3RvcmFnZS91cGxvYWRzL3Byb2R1Y3RzL3B5SGpkWjQ5VmVoVHdxQnBHUzh2V2V3cm1icmlBTmxVbmF2MG5hMHAuanBnIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1759765194),
('HgviEW8QxhXRVjGqMLqqoX4ApcWeCfBHmlpFdkAj', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoib044Q2xsRlJYWmxqM05Kb09kR2d4cHVKd2RKVVhaVmYwNWhZaG5sbyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1760104719),
('J1h8nkK7S7NUHuSDD7cnG17Ap9eqcgH0oEhyTaLn', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiM0J3d3RGM1poRnk5NDNTbGFZZ2tDdzJqVG13TVhhUWFSTURLWHhxUyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1759715429),
('kbvzbMSLaGkAUiw0x33KQirwN1tad50UVaGXaHAi', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:143.0) Gecko/20100101 Firefox/143.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiZ0tGS2tHU2R4SDJmeTZCdDZ2OWt2V3NSdG1RMm13emNxT2ZPZjROUiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1759887140),
('o85bM27BCqoNCmZyYRozuDumn1XclGBUSfd3SoGs', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiZ2tIQ2R5WHR6b2dYM2p6WkRYNndFSjhXWEtMeWVRRnJQR3RDbTdZQiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1759629181),
('qIvTUsqh5pwt1M79gMM36023dQNgkgj9AEX81ngH', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiWGdwMUxwRTQwWURSVzNwTUFrM3VsMzl5Z3oyREc0REFvVTA2TllXOCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1759975305),
('qz5qfuRjtV9lBFBxSLZQAmbtJgNZ7SubzArzR4sb', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiQ0xDcDZzRzZPT2RMRWN0Vnl0bWlBUmN1WU4xTTR5WjJrRDR6akJySiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1760143209),
('rs0yd2Kh6d3FlE5rT7TlhPFqihtHql0sdU1eOoZQ', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiZ0ZyV0o5MHB5ZlBmU1JpSW05NXVnYm9nWFM5dmdWcExQazZISUpzNSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1759582728),
('stRWRAWrFZqwoKAxC6p6dTxlosVfCJvgrqDpTqao', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiUkh5WkhjUWNjeEZ3Y2RBVXZqSmtPQ0h3RWRkb0tJb0w5c2h2cEFodSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1759734372),
('yMpSZAYklTNgc9M7Pe9WCk8xddVxQyZXrVpnnTse', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiN1FONUlTYkFzWjBLTEdua05DNDd0OTlkSjV4UGZXZkE4QUJvUExXRiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1759571538);

-- --------------------------------------------------------

--
-- Table structure for table `shippings`
--

CREATE TABLE `shippings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `fee` decimal(10,2) NOT NULL,
  `is_free_shipping` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `shipping_methods`
--

CREATE TABLE `shipping_methods` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(150) NOT NULL,
  `description` text DEFAULT NULL,
  `fee` decimal(10,2) NOT NULL DEFAULT 0.00,
  `is_free_shipping` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `shipping_methods`
--

INSERT INTO `shipping_methods` (`id`, `name`, `description`, `fee`, `is_free_shipping`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Standard Shipping', 'Delivers in 5–7 business days.', 100.00, 0, '2025-10-09 02:59:15', '2025-10-09 02:59:15', NULL),
(2, 'Express Shipping', 'Delivers in 2–3 business days.', 200.00, 0, '2025-10-09 02:59:15', '2025-10-09 02:59:15', NULL),
(3, 'Overnight Shipping', 'Delivers by next business day.', 350.00, 0, '2025-10-09 02:59:15', '2025-10-09 02:59:15', NULL),
(4, 'Free Standard Shipping', 'Free delivery in 7–10 business days.', 0.00, 1, '2025-10-09 02:59:15', '2025-10-09 02:59:15', NULL),
(5, 'Local Pickup', 'Pick up from our local store.', 0.00, 1, '2025-10-09 02:59:15', '2025-10-09 02:59:15', NULL),
(6, 'Same Day Delivery', 'Delivery within 24 hours.', 250.00, 0, '2025-10-09 02:59:15', '2025-10-09 02:59:15', NULL),
(7, 'International Shipping', 'Delivery within 10–15 business days.', 500.00, 0, '2025-10-09 02:59:15', '2025-10-09 02:59:15', NULL),
(8, 'Economy Shipping', 'Cheapest shipping option.', 80.00, 0, '2025-10-09 02:59:15', '2025-10-09 02:59:15', NULL),
(9, 'Weekend Delivery', 'Delivery available on weekends.', 150.00, 0, '2025-10-09 02:59:15', '2025-10-09 02:59:15', NULL),
(10, 'Drone Delivery', 'Fast drone-based delivery.', 400.00, 0, '2025-10-09 02:59:15', '2025-10-09 02:59:15', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `sizes`
--

CREATE TABLE `sizes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sizes`
--

INSERT INTO `sizes` (`id`, `name`, `status`, `created_at`, `updated_at`) VALUES
(1, 'XS', 1, '2025-10-05 08:46:58', '2025-10-05 08:46:58'),
(2, 'S', 1, '2025-10-05 08:46:58', '2025-10-05 08:46:58'),
(3, 'M', 1, '2025-10-05 08:46:58', '2025-10-05 08:46:58'),
(4, 'L', 1, '2025-10-05 08:46:58', '2025-10-05 08:46:58'),
(5, 'XL', 1, '2025-10-05 08:46:58', '2025-10-05 08:46:58'),
(6, 'XXL', 1, '2025-10-05 08:46:58', '2025-10-05 08:46:58'),
(7, '3XL', 1, '2025-10-05 08:46:58', '2025-10-05 08:46:58'),
(8, '4XL', 1, '2025-10-05 08:46:58', '2025-10-05 08:46:58'),
(9, '28', 1, '2025-10-05 08:46:58', '2025-10-05 08:46:58'),
(10, '30', 1, '2025-10-05 08:46:58', '2025-10-05 08:46:58');

-- --------------------------------------------------------

--
-- Table structure for table `transactions`
--

CREATE TABLE `transactions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED DEFAULT NULL,
  `transaction_type` enum('debit','credit','refund','chargeback') NOT NULL,
  `method` enum('card','mobile_banking','COD','wallet') NOT NULL,
  `transaction_reference` varchar(150) NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `currency` varchar(10) NOT NULL,
  `status` enum('pending','success','failed','refunded') NOT NULL,
  `remarks` text DEFAULT NULL,
  `processed_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `transactions`
--

INSERT INTO `transactions` (`id`, `user_id`, `order_id`, `transaction_type`, `method`, `transaction_reference`, `amount`, `currency`, `status`, `remarks`, `processed_at`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 3, 3, 'debit', 'mobile_banking', 'TXNZHQREGCMHZ', 908.60, 'BDT', 'pending', 'Dummy transaction record 1', '2025-09-20 08:43:28', '2025-10-09 08:43:28', '2025-10-09 08:43:28', NULL),
(2, 11, 4, 'debit', 'wallet', 'TXN8WPWL24BZW', 443.00, 'BDT', 'failed', 'Dummy transaction record 2', '2025-09-09 08:43:28', '2025-10-09 08:43:28', '2025-10-09 08:43:28', NULL),
(3, 9, 1, 'refund', 'COD', 'TXN4ALYERZJOV', 832.50, 'BDT', 'failed', 'Dummy transaction record 3', '2025-09-27 08:43:28', '2025-10-09 08:43:28', '2025-10-09 08:43:28', NULL),
(4, 8, 4, 'chargeback', 'wallet', 'TXNTAI2KEZY2U', 869.80, 'BDT', 'refunded', 'Dummy transaction record 4', '2025-09-30 08:43:28', '2025-10-09 08:43:28', '2025-10-09 08:43:28', NULL),
(5, 4, 8, 'chargeback', 'wallet', 'TXN4MF3SIIRYM', 412.90, 'BDT', 'pending', 'Dummy transaction record 5', '2025-09-11 08:43:28', '2025-10-09 08:43:28', '2025-10-09 08:43:28', NULL),
(6, 7, 6, 'debit', 'COD', 'TXNSPDZQTY1B9', 402.10, 'BDT', 'pending', 'Dummy transaction record 6', '2025-10-06 08:43:28', '2025-10-09 08:43:28', '2025-10-09 08:43:28', NULL),
(7, 1, 7, 'debit', 'mobile_banking', 'TXNFXALJOLDA5', 24.50, 'BDT', 'refunded', 'Dummy transaction record 7', '2025-10-02 08:43:28', '2025-10-09 08:43:28', '2025-10-09 08:43:28', NULL),
(8, 7, 5, 'refund', 'card', 'TXN2QJ8RMSCHN', 985.20, 'BDT', 'success', 'Dummy transaction record 8', '2025-09-10 08:43:28', '2025-10-09 08:43:28', '2025-10-09 08:43:28', NULL),
(9, 2, 2, 'debit', 'COD', 'TXNN36KQJQERP', 161.50, 'BDT', 'failed', 'Dummy transaction record 9', '2025-09-09 08:43:28', '2025-10-09 08:43:28', '2025-10-09 08:43:28', NULL),
(10, 11, 7, 'debit', 'card', 'TXNSTOTFB8GTZ', 901.70, 'BDT', 'failed', 'Dummy transaction record 10', '2025-10-09 08:43:28', '2025-10-09 08:43:28', '2025-10-09 08:43:28', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `role` varchar(255) NOT NULL DEFAULT 'customer',
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `role`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Nasir Uddin', 'nasir93cse@gmail.com', 'admin', NULL, '$2y$12$RkAe5mv53GjJVaNOQWVz0.nvcN7ngWOXu73I/xHHHFh4EjxqtDvey', NULL, '2025-10-04 04:56:21', '2025-10-04 04:56:21'),
(2, 'Mominul Islam', 'mominul@gmail.com', 'admin', NULL, '$2y$12$uT0UYHhsSEhN35OFNntQQ.Z5GltH3qN4W.K6F1hAhQIayO593FpQi', NULL, '2025-10-09 04:39:06', '2025-10-09 04:39:06'),
(3, 'Nasir Uddin', 'nasir@gmail.com', 'customer', NULL, '$2y$12$hpBjNqK7XexBG/qSgHssZ.l2sV/GbsuUU4AdS0gRfysK2gum1JgDC', NULL, '2025-10-09 04:39:06', '2025-10-09 04:39:06'),
(4, 'Shaimum Hasan', 'shaimum@gmail.com', 'customer', NULL, '$2y$12$XdpXLxMh1P33Urd1/NxzEurWUVyqG.kpVlp03m14GsPYbbJRKboQG', NULL, '2025-10-09 04:39:06', '2025-10-09 04:39:06'),
(5, 'Rasel Ahmed', 'rasel@gmail.com', 'customer', NULL, '$2y$12$Wck/vBCm6PwMGjlNWtkydu07Hzy23mPhm2PI.87QNDOuxDC9x06FO', NULL, '2025-10-09 04:39:06', '2025-10-09 04:39:06'),
(6, 'Samiul Islam', 'samiul@gmail.com', 'customer', NULL, '$2y$12$Xb2cLReWfsmJHUonFuShOenGd6I2msorGjh7YLS6uR4RIVB2RN6ZO', NULL, '2025-10-09 04:39:06', '2025-10-09 04:39:06'),
(7, 'Farhana Akter', 'farhana@gmail.com', 'customer', NULL, '$2y$12$WKuU87XmfP3.cEVQ6P.y/ea2oiHQP1XMlDivJaDZWrfDtVetX9Tba', NULL, '2025-10-09 04:39:06', '2025-10-09 04:39:06'),
(8, 'Rafi Khan', 'rafi@gmail.com', 'customer', NULL, '$2y$12$dUNJFO2Xi0wcuHedzp9N7uqMEzDjN4uVrRqtk6.QvLP9R/txyUPEi', NULL, '2025-10-09 04:39:06', '2025-10-09 04:39:06'),
(9, 'Tania Sultana', 'tania@gmail.com', 'customer', NULL, '$2y$12$iV1VczyueqhgkgEONLL8cutSausgSrPknAqaRru9EKlmdvcZy6w.2', NULL, '2025-10-09 04:39:06', '2025-10-09 04:39:06'),
(10, 'Sabbir Hossain', 'sabbir@gmail.com', 'customer', NULL, '$2y$12$UJcZED.Ixi2j6mzM67ytzuDkW0GRK83E.oXjAmGD3m/TGc1FuBUuu', NULL, '2025-10-09 04:39:06', '2025-10-09 04:39:06'),
(11, 'Ruhul Amin', 'ruhul@gmail.com', 'customer', NULL, '$2y$12$Iz3UPG1gPIjgvfAoznauK.iRRvCezyc8DrkBXZjIT1paDE36xIuIW', NULL, '2025-10-09 04:39:06', '2025-10-09 04:39:06');

-- --------------------------------------------------------

--
-- Table structure for table `wishlists`
--

CREATE TABLE `wishlists` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `wishlists`
--

INSERT INTO `wishlists` (`id`, `user_id`, `product_id`, `deleted_at`, `created_at`, `updated_at`) VALUES
(21, 1, 9, NULL, '2025-10-08 03:15:37', '2025-10-08 03:15:37'),
(22, 1, 6, NULL, '2025-10-08 03:15:37', '2025-10-08 03:15:37'),
(23, 1, 4, NULL, '2025-10-08 03:15:37', '2025-10-08 03:15:37'),
(24, 1, 6, NULL, '2025-10-08 03:15:37', '2025-10-08 03:15:37'),
(25, 1, 8, NULL, '2025-10-08 03:15:37', '2025-10-08 03:15:37'),
(26, 1, 9, NULL, '2025-10-08 03:15:37', '2025-10-08 03:15:37'),
(27, 1, 4, NULL, '2025-10-08 03:15:37', '2025-10-08 03:15:37'),
(28, 1, 3, NULL, '2025-10-08 03:15:37', '2025-10-08 03:15:37'),
(29, 1, 5, NULL, '2025-10-08 03:15:37', '2025-10-08 03:15:37'),
(30, 1, 5, NULL, '2025-10-08 03:15:37', '2025-10-08 03:15:37');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `brands`
--
ALTER TABLE `brands`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `coupons`
--
ALTER TABLE `coupons`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `coupons_code_unique` (`code`);

--
-- Indexes for table `coupon_usages`
--
ALTER TABLE `coupon_usages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `coupon_usages_coupon_id_foreign` (`coupon_id`),
  ADD KEY `coupon_usages_user_id_foreign` (`user_id`),
  ADD KEY `coupon_usages_order_id_foreign` (`order_id`);

--
-- Indexes for table `discounts`
--
ALTER TABLE `discounts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `discounts_product_id_foreign` (`product_id`),
  ADD KEY `discounts_category_id_foreign` (`category_id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `inventory_logs`
--
ALTER TABLE `inventory_logs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `inventory_logs_product_id_foreign` (`product_id`),
  ADD KEY `inventory_logs_variant_id_foreign` (`variant_id`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indexes for table `job_batches`
--
ALTER TABLE `job_batches`
  ADD PRIMARY KEY (`id`);

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
  ADD KEY `notifications_user_id_foreign` (`user_id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `orders_user_id_foreign` (`user_id`);

--
-- Indexes for table `order_items`
--
ALTER TABLE `order_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_items_order_id_foreign` (`order_id`),
  ADD KEY `order_items_product_id_foreign` (`product_id`),
  ADD KEY `order_items_variant_id_foreign` (`variant_id`);

--
-- Indexes for table `order_shippings`
--
ALTER TABLE `order_shippings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_shippings_order_id_foreign` (`order_id`),
  ADD KEY `order_shippings_shipping_method_id_foreign` (`shipping_method_id`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `payments_order_id_foreign` (`order_id`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`),
  ADD KEY `personal_access_tokens_expires_at_index` (`expires_at`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `products_sku_unique` (`sku`),
  ADD KEY `products_category_id_foreign` (`category_id`),
  ADD KEY `products_brand_id_foreign` (`brand_id`);

--
-- Indexes for table `product_images`
--
ALTER TABLE `product_images`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_images_product_id_foreign` (`product_id`);

--
-- Indexes for table `product_variants`
--
ALTER TABLE `product_variants`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_variants_product_id_foreign` (`product_id`),
  ADD KEY `product_variants_size_id_foreign` (`size_id`);

--
-- Indexes for table `reviews`
--
ALTER TABLE `reviews`
  ADD PRIMARY KEY (`id`),
  ADD KEY `reviews_user_id_foreign` (`user_id`),
  ADD KEY `reviews_product_id_foreign` (`product_id`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indexes for table `shippings`
--
ALTER TABLE `shippings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `shipping_methods`
--
ALTER TABLE `shipping_methods`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sizes`
--
ALTER TABLE `sizes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `transactions`
--
ALTER TABLE `transactions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `transactions_user_id_foreign` (`user_id`),
  ADD KEY `transactions_order_id_foreign` (`order_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indexes for table `wishlists`
--
ALTER TABLE `wishlists`
  ADD PRIMARY KEY (`id`),
  ADD KEY `wishlists_user_id_foreign` (`user_id`),
  ADD KEY `wishlists_product_id_foreign` (`product_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `brands`
--
ALTER TABLE `brands`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `coupons`
--
ALTER TABLE `coupons`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `coupon_usages`
--
ALTER TABLE `coupon_usages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `discounts`
--
ALTER TABLE `discounts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `inventory_logs`
--
ALTER TABLE `inventory_logs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `notifications`
--
ALTER TABLE `notifications`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `order_items`
--
ALTER TABLE `order_items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `order_shippings`
--
ALTER TABLE `order_shippings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `payments`
--
ALTER TABLE `payments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `product_images`
--
ALTER TABLE `product_images`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT for table `product_variants`
--
ALTER TABLE `product_variants`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `reviews`
--
ALTER TABLE `reviews`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `shippings`
--
ALTER TABLE `shippings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `shipping_methods`
--
ALTER TABLE `shipping_methods`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `sizes`
--
ALTER TABLE `sizes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `transactions`
--
ALTER TABLE `transactions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `wishlists`
--
ALTER TABLE `wishlists`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `coupon_usages`
--
ALTER TABLE `coupon_usages`
  ADD CONSTRAINT `coupon_usages_coupon_id_foreign` FOREIGN KEY (`coupon_id`) REFERENCES `coupons` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `coupon_usages_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `coupon_usages_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `discounts`
--
ALTER TABLE `discounts`
  ADD CONSTRAINT `discounts_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `discounts_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `inventory_logs`
--
ALTER TABLE `inventory_logs`
  ADD CONSTRAINT `inventory_logs_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `inventory_logs_variant_id_foreign` FOREIGN KEY (`variant_id`) REFERENCES `product_variants` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `notifications`
--
ALTER TABLE `notifications`
  ADD CONSTRAINT `notifications_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `order_items`
--
ALTER TABLE `order_items`
  ADD CONSTRAINT `order_items_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `order_items_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `order_items_variant_id_foreign` FOREIGN KEY (`variant_id`) REFERENCES `product_variants` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `order_shippings`
--
ALTER TABLE `order_shippings`
  ADD CONSTRAINT `order_shippings_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `order_shippings_shipping_method_id_foreign` FOREIGN KEY (`shipping_method_id`) REFERENCES `shipping_methods` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `payments`
--
ALTER TABLE `payments`
  ADD CONSTRAINT `payments_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_brand_id_foreign` FOREIGN KEY (`brand_id`) REFERENCES `brands` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `products_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `product_images`
--
ALTER TABLE `product_images`
  ADD CONSTRAINT `product_images_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `product_variants`
--
ALTER TABLE `product_variants`
  ADD CONSTRAINT `product_variants_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `product_variants_size_id_foreign` FOREIGN KEY (`size_id`) REFERENCES `sizes` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `reviews`
--
ALTER TABLE `reviews`
  ADD CONSTRAINT `reviews_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `reviews_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `transactions`
--
ALTER TABLE `transactions`
  ADD CONSTRAINT `transactions_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `transactions_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `wishlists`
--
ALTER TABLE `wishlists`
  ADD CONSTRAINT `wishlists_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `wishlists_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
