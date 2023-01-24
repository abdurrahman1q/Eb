-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jan 24, 2023 at 12:40 PM
-- Server version: 5.7.33
-- PHP Version: 8.2.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `e-bitan`
--

-- --------------------------------------------------------

--
-- Table structure for table `attributes`
--

CREATE TABLE `attributes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `value` text COLLATE utf8mb4_unicode_ci,
  `product_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `brands`
--

CREATE TABLE `brands` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `brand_product`
--

CREATE TABLE `brand_product` (
  `id` int(10) UNSIGNED NOT NULL,
  `product_id` int(11) DEFAULT NULL,
  `brand_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `brand_product`
--

INSERT INTO `brand_product` (`id`, `product_id`, `brand_id`, `created_at`, `updated_at`) VALUES
(1, 1, 1, NULL, NULL),
(2, 1, 2, NULL, NULL),
(3, 1, 3, NULL, NULL),
(4, 2, 1, NULL, NULL),
(5, 2, 4, NULL, NULL),
(6, 2, 5, NULL, NULL),
(7, 3, 5, NULL, NULL),
(8, 4, 1, NULL, NULL),
(9, 4, 2, NULL, NULL),
(10, 4, 4, NULL, NULL),
(11, 5, 9, NULL, NULL),
(12, 5, 10, NULL, NULL),
(13, 5, 11, NULL, NULL),
(14, 6, 1, NULL, NULL),
(15, 6, 2, NULL, NULL),
(16, 6, 3, NULL, NULL),
(17, 6, 4, NULL, NULL),
(18, 7, 1, NULL, NULL),
(19, 7, 2, NULL, NULL),
(20, 7, 10, NULL, NULL),
(21, 7, 11, NULL, NULL),
(22, 8, 5, NULL, NULL),
(23, 8, 11, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(10) UNSIGNED NOT NULL,
  `parent_id` int(10) UNSIGNED DEFAULT NULL,
  `order` int(11) NOT NULL DEFAULT '1',
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `parent_id`, `order`, `name`, `slug`, `created_at`, `updated_at`) VALUES
(1, NULL, 1, 'Category 1', 'category-1', '2021-06-15 20:25:59', '2021-06-15 20:25:59'),
(2, NULL, 1, 'Category 2', 'category-2', '2021-06-15 20:25:59', '2021-06-15 20:25:59');

-- --------------------------------------------------------

--
-- Table structure for table `contacts`
--

CREATE TABLE `contacts` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subject` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `message` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `contacts`
--

INSERT INTO `contacts` (`id`, `name`, `email`, `subject`, `message`, `created_at`, `updated_at`) VALUES
(1, 'khaled', 'aboufares2013@gmail.com', 'Re: Fwd: RE: رعاية اجهزة وعربات نظافه', 'ييييييييي', '2021-04-22 20:44:45', '2021-04-22 20:44:45');

-- --------------------------------------------------------

--
-- Table structure for table `coupons`
--

CREATE TABLE `coupons` (
  `id` int(10) UNSIGNED NOT NULL,
  `code` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `discount` int(11) DEFAULT NULL,
  `expire_at` date DEFAULT NULL,
  `limit` int(11) DEFAULT NULL,
  `minimum_cart` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `used` tinyint(4) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `coupons`
--

INSERT INTO `coupons` (`id`, `code`, `discount`, `expire_at`, `limit`, `minimum_cart`, `created_at`, `updated_at`, `used`) VALUES
(1, 'TG2019', 1, '2021-07-30', 50, 10, '2020-04-19 13:46:00', '2021-04-11 09:34:57', 8),
(3, 'test', 10, '2021-04-26', 12, 12, '2021-04-11 09:26:37', '2021-04-22 19:54:53', 4);

-- --------------------------------------------------------

--
-- Table structure for table `data_rows`
--

CREATE TABLE `data_rows` (
  `id` int(10) UNSIGNED NOT NULL,
  `data_type_id` int(10) UNSIGNED NOT NULL,
  `field` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `required` tinyint(1) NOT NULL DEFAULT '0',
  `browse` tinyint(1) NOT NULL DEFAULT '1',
  `read` tinyint(1) NOT NULL DEFAULT '1',
  `edit` tinyint(1) NOT NULL DEFAULT '1',
  `add` tinyint(1) NOT NULL DEFAULT '1',
  `delete` tinyint(1) NOT NULL DEFAULT '1',
  `details` text COLLATE utf8mb4_unicode_ci,
  `order` int(11) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `data_rows`
--

INSERT INTO `data_rows` (`id`, `data_type_id`, `field`, `type`, `display_name`, `required`, `browse`, `read`, `edit`, `add`, `delete`, `details`, `order`) VALUES
(1, 1, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1),
(2, 1, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, NULL, 2),
(3, 1, 'email', 'text', 'Email', 1, 1, 1, 1, 1, 1, NULL, 3),
(4, 1, 'password', 'password', 'Password', 1, 0, 0, 1, 1, 0, NULL, 4),
(5, 1, 'remember_token', 'text', 'Remember Token', 0, 0, 0, 0, 0, 0, NULL, 5),
(6, 1, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 0, 0, 0, NULL, 6),
(7, 1, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 7),
(8, 1, 'avatar', 'image', 'Avatar', 0, 1, 1, 1, 1, 1, NULL, 8),
(9, 1, 'user_belongsto_role_relationship', 'relationship', 'Role', 0, 1, 1, 1, 1, 0, '{\"model\":\"TCG\\\\Voyager\\\\Models\\\\Role\",\"table\":\"roles\",\"type\":\"belongsTo\",\"column\":\"role_id\",\"key\":\"id\",\"label\":\"display_name\",\"pivot_table\":\"roles\",\"pivot\":0}', 10),
(10, 1, 'user_belongstomany_role_relationship', 'relationship', 'Roles', 0, 1, 1, 1, 1, 0, '{\"model\":\"TCG\\\\Voyager\\\\Models\\\\Role\",\"table\":\"roles\",\"type\":\"belongsToMany\",\"column\":\"id\",\"key\":\"id\",\"label\":\"display_name\",\"pivot_table\":\"user_roles\",\"pivot\":\"1\",\"taggable\":\"0\"}', 11),
(11, 1, 'settings', 'hidden', 'Settings', 0, 0, 0, 0, 0, 0, NULL, 12),
(12, 2, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1),
(13, 2, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, NULL, 2),
(14, 2, 'created_at', 'timestamp', 'Created At', 0, 0, 0, 0, 0, 0, NULL, 3),
(15, 2, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 4),
(16, 3, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1),
(17, 3, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, NULL, 2),
(18, 3, 'created_at', 'timestamp', 'Created At', 0, 0, 0, 0, 0, 0, NULL, 3),
(19, 3, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 4),
(20, 3, 'display_name', 'text', 'Display Name', 1, 1, 1, 1, 1, 1, NULL, 5),
(21, 1, 'role_id', 'text', 'Role', 1, 1, 1, 1, 1, 1, NULL, 9),
(22, 4, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1),
(23, 4, 'parent_id', 'select_dropdown', 'Parent', 0, 0, 1, 1, 1, 1, '{\"default\":\"\",\"null\":\"\",\"options\":{\"\":\"-- None --\"},\"relationship\":{\"key\":\"id\",\"label\":\"name\"}}', 2),
(24, 4, 'order', 'text', 'Order', 1, 1, 1, 1, 1, 1, '{\"default\":1}', 3),
(25, 4, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, NULL, 4),
(26, 4, 'slug', 'text', 'Slug', 1, 1, 1, 1, 1, 1, '{\"slugify\":{\"origin\":\"name\"}}', 5),
(27, 4, 'created_at', 'timestamp', 'Created At', 0, 0, 1, 0, 0, 0, NULL, 6),
(28, 4, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 7),
(29, 5, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1),
(30, 5, 'author_id', 'text', 'Author', 1, 0, 1, 1, 0, 1, NULL, 2),
(31, 5, 'category_id', 'text', 'Category', 1, 0, 1, 1, 1, 0, NULL, 3),
(32, 5, 'title', 'text', 'Title', 1, 1, 1, 1, 1, 1, NULL, 4),
(33, 5, 'excerpt', 'text_area', 'Excerpt', 1, 0, 1, 1, 1, 1, NULL, 5),
(34, 5, 'body', 'rich_text_box', 'Body', 1, 0, 1, 1, 1, 1, NULL, 6),
(35, 5, 'image', 'image', 'Post Image', 0, 1, 1, 1, 1, 1, '{\"resize\":{\"width\":\"1000\",\"height\":\"null\"},\"quality\":\"70%\",\"upsize\":true,\"thumbnails\":[{\"name\":\"medium\",\"scale\":\"50%\"},{\"name\":\"small\",\"scale\":\"25%\"},{\"name\":\"cropped\",\"crop\":{\"width\":\"300\",\"height\":\"250\"}}]}', 7),
(36, 5, 'slug', 'text', 'Slug', 1, 0, 1, 1, 1, 1, '{\"slugify\":{\"origin\":\"title\",\"forceUpdate\":true},\"validation\":{\"rule\":\"unique:posts,slug\"}}', 8),
(37, 5, 'meta_description', 'text_area', 'Meta Description', 1, 0, 1, 1, 1, 1, NULL, 9),
(38, 5, 'meta_keywords', 'text_area', 'Meta Keywords', 1, 0, 1, 1, 1, 1, NULL, 10),
(39, 5, 'status', 'select_dropdown', 'Status', 1, 1, 1, 1, 1, 1, '{\"default\":\"DRAFT\",\"options\":{\"PUBLISHED\":\"published\",\"DRAFT\":\"draft\",\"PENDING\":\"pending\"}}', 11),
(40, 5, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 0, 0, 0, NULL, 12),
(41, 5, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 13),
(42, 5, 'seo_title', 'text', 'SEO Title', 0, 1, 1, 1, 1, 1, NULL, 14),
(43, 5, 'featured', 'checkbox', 'Featured', 1, 1, 1, 1, 1, 1, NULL, 15),
(44, 6, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, '{}', 1),
(45, 6, 'author_id', 'text', 'Author', 1, 0, 0, 0, 0, 0, '{}', 2),
(46, 6, 'title', 'text', 'Title', 1, 1, 1, 1, 1, 1, '{\"display\":{\"width\":6}}', 3),
(47, 6, 'excerpt', 'text_area', 'Excerpt', 0, 0, 0, 0, 0, 0, '{}', 5),
(48, 6, 'body', 'rich_text_box', 'Body', 0, 0, 1, 1, 1, 1, '{}', 6),
(49, 6, 'slug', 'text', 'Slug', 1, 0, 1, 1, 1, 1, '{\"slugify\":{\"origin\":\"title\"},\"validation\":{\"rule\":\"unique:pages,slug\"},\"display\":{\"width\":6}}', 4),
(50, 6, 'meta_description', 'text', 'Meta Description', 0, 0, 0, 0, 0, 0, '{}', 7),
(51, 6, 'meta_keywords', 'text', 'Meta Keywords', 0, 0, 0, 0, 0, 0, '{}', 8),
(52, 6, 'status', 'select_dropdown', 'Status', 1, 1, 1, 1, 1, 1, '{\"default\":\"INACTIVE\",\"options\":{\"INACTIVE\":\"INACTIVE\",\"ACTIVE\":\"ACTIVE\"}}', 9),
(53, 6, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 0, 0, 0, '{}', 10),
(54, 6, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 11),
(55, 6, 'image', 'image', 'Page Image', 0, 0, 0, 0, 0, 0, '{}', 12),
(56, 7, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(57, 7, 'image', 'image', 'Image', 0, 0, 1, 1, 1, 1, '{\"resize\":{\"width\":\"1500\",\"height\":null},\"quality\":\"70%\",\"upsize\":false}', 2),
(58, 7, 'heading', 'text', 'Heading', 0, 1, 1, 1, 1, 1, '{}', 3),
(59, 7, 'paragraph', 'text', 'Paragraph', 0, 0, 1, 1, 1, 1, '{}', 4),
(60, 7, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 0, 0, 1, '{}', 5),
(61, 7, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 6),
(62, 8, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(63, 8, 'parent_id', 'text', 'Parent Id', 0, 0, 0, 0, 0, 0, '{}', 2),
(64, 8, 'name', 'text', 'Book Name', 0, 1, 1, 1, 1, 1, '{\"validation\":{\"rule\":\"required|max:200\"},\"display\":{\"width\":6}}', 3),
(65, 8, 'slug', 'text', 'Slug', 0, 0, 1, 1, 1, 1, '{\"validation\":{\"rule\":\"required|max:200|unique:products,slug\"},\"slugify\":{\"origin\":\"name\",\"forceUpdate\":true},\"display\":{\"width\":6}}', 4),
(66, 8, 'price', 'text', 'Price', 0, 1, 1, 1, 1, 1, '{\"validation\":{\"rule\":\"required|max:8|regex:\\/^\\\\d*(\\\\.\\\\d{1,2})?$\\/\"},\"display\":{\"width\":6}}', 5),
(67, 8, 'saleprice', 'text', 'Saleprice', 0, 0, 1, 1, 1, 1, '{\"validation\":{\"rule\":\"nullable|max:8|regex:\\/^\\\\d*(\\\\.\\\\d{1,2})?$\\/\"},\"display\":{\"width\":6}}', 6),
(68, 8, 'details', 'text_area', 'Author Name', 0, 0, 1, 1, 1, 1, '{}', 7),
(69, 8, 'sku', 'date', 'sku', 0, 1, 1, 1, 1, 1, '{\"display\":{\"width\":6}}', 8),
(70, 8, 'quantity', 'number', 'Quantity', 0, 1, 1, 1, 1, 1, '{\"display\":{\"width\":6}}', 9),
(71, 8, 'description', 'rich_text_box', 'Description', 0, 0, 1, 1, 1, 1, '{}', 10),
(72, 8, 'image', 'image', 'Image', 0, 0, 1, 1, 1, 1, '{\"resize\":{\"width\":\"1000\",\"height\":null},\"quality\":\"70%\",\"upsize\":false,\"display\":{\"width\":6}}', 11),
(73, 8, 'images', 'multiple_images', 'Images', 0, 0, 1, 1, 1, 1, '{\"resize\":{\"width\":\"1000\",\"height\":null},\"quality\":\"70%\",\"upsize\":false,\"display\":{\"width\":6}}', 12),
(74, 8, 'view', 'text', 'View', 0, 0, 0, 0, 0, 0, '{}', 13),
(75, 8, 'sale_count', 'text', 'Sale Count', 1, 0, 0, 0, 0, 0, '{}', 14),
(76, 8, 'status', 'checkbox', 'Status', 0, 1, 1, 1, 1, 1, '{\"on\":\"Yes\",\"off\":\"No\",\"checked\":false,\"display\":{\"width\":6}}', 15),
(77, 8, 'is_variable', 'checkbox', 'Is Variable', 0, 0, 0, 0, 0, 0, '{\"on\":\"Yes\",\"off\":\"No\",\"checked\":false}', 16),
(78, 8, 'variation', 'text', 'Variation', 0, 0, 0, 0, 0, 0, '{}', 17),
(79, 8, 'length', 'text', 'Length', 0, 0, 0, 0, 0, 0, '{}', 18),
(80, 8, 'width', 'text', 'Width', 0, 0, 0, 0, 0, 0, '{}', 19),
(81, 8, 'height', 'text', 'Height', 0, 0, 0, 0, 0, 0, '{}', 20),
(82, 8, 'weight', 'text', 'Weight', 0, 0, 0, 0, 0, 0, '{}', 21),
(83, 8, 'featured', 'checkbox', 'Featured', 0, 1, 1, 1, 1, 1, '{\"on\":\"Yes\",\"off\":\"No\",\"checked\":false,\"display\":{\"width\":6}}', 22),
(84, 8, 'discount', 'text', 'Discount', 0, 0, 1, 0, 0, 1, '{}', 23),
(85, 8, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 0, 0, 1, '{}', 24),
(86, 8, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 25),
(87, 9, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(88, 9, 'name', 'text', 'Name', 0, 1, 1, 1, 1, 1, '{\"validation\":{\"rule\":\"required|max:50\"},\"display\":{\"width\":6}}', 2),
(89, 9, 'slug', 'text', 'Slug', 0, 1, 1, 1, 1, 1, '{\"validation\":{\"rule\":\"required|max:50|unique:prodcats,slug\"},\"slugify\":{\"origin\":\"name\",\"forceUpdate\":true},\"display\":{\"width\":6}}', 3),
(90, 9, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 0, 0, 1, '{}', 5),
(91, 9, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 6),
(92, 9, 'parent_id', 'text', 'Parent', 0, 1, 1, 1, 1, 1, '{}', 7),
(93, 9, 'prodcat_belongsto_prodcat_relationship', 'relationship', 'Parent', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Prodcat\",\"table\":\"prodcats\",\"type\":\"belongsTo\",\"column\":\"parent_id\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"attributes\",\"pivot\":\"0\",\"taggable\":\"0\"}', 4),
(94, 10, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(95, 10, 'Shipping_method', 'text', 'Shipping Method', 0, 1, 1, 1, 1, 1, '{\"validation\":{\"rule\":\"required|max:100\"}}', 2),
(96, 10, 'shipping_cost', 'text', 'Shipping Cost', 0, 1, 1, 1, 1, 1, '{\"validation\":{\"rule\":\"required\"}}', 3),
(97, 10, 'created_at', 'timestamp', 'Created At', 0, 1, 0, 0, 0, 1, '{}', 4),
(98, 10, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 5),
(99, 11, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(100, 11, 'user_id', 'text', 'User Id', 0, 0, 0, 0, 0, 0, '{}', 2),
(101, 11, 'first_name', 'text', 'First Name', 0, 1, 1, 1, 1, 1, '{}', 3),
(102, 11, 'last_name', 'text', 'Last Name', 0, 1, 1, 1, 1, 1, '{}', 4),
(103, 11, 'email', 'text', 'Email', 0, 0, 1, 1, 1, 1, '{}', 5),
(104, 11, 'address', 'text', 'Address', 0, 1, 1, 1, 1, 1, '{}', 6),
(105, 11, 'city', 'text', 'City', 0, 1, 1, 1, 1, 1, '{}', 7),
(106, 11, 'post_code', 'text', 'Post Code', 0, 1, 1, 1, 1, 1, '{}', 8),
(107, 11, 'phone', 'text', 'Phone', 0, 1, 1, 1, 1, 1, '{}', 9),
(108, 11, 'state', 'text', 'State', 0, 0, 1, 1, 1, 1, '{}', 10),
(109, 11, 'discount', 'text', 'Discount', 0, 1, 1, 0, 1, 1, '{}', 11),
(110, 11, 'discount_code', 'text', 'Discount Code', 0, 0, 1, 0, 1, 1, '{}', 12),
(111, 11, 'subtotal', 'text', 'Subtotal', 0, 1, 1, 0, 1, 1, '{}', 13),
(112, 11, 'tax', 'text', 'Tax', 0, 1, 1, 0, 1, 1, '{}', 14),
(113, 11, 'shipping_cost', 'text', 'Shipping Cost', 0, 1, 1, 0, 1, 1, '{}', 15),
(114, 11, 'shipping_method', 'text', 'Shipping Method', 0, 0, 1, 0, 1, 1, '{}', 16),
(115, 11, 'total', 'text', 'Total', 0, 1, 1, 0, 1, 1, '{}', 17),
(116, 11, 'payment_gateway', 'text', 'Payment Gateway', 0, 0, 1, 0, 1, 1, '{}', 18),
(117, 11, 'shipped', 'checkbox', 'Shipped', 0, 0, 1, 1, 1, 1, '{\"on\":\"Yes\",\"off\":\"No\",\"checked\":false}', 19),
(118, 11, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 0, 0, 1, '{}', 20),
(119, 11, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 21),
(120, 13, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(121, 13, 'name', 'text', 'Name', 0, 1, 1, 1, 1, 1, '{}', 2),
(122, 13, 'email', 'text', 'Email', 0, 1, 1, 1, 1, 1, '{}', 3),
(123, 13, 'subject', 'text', 'Subject', 0, 1, 1, 1, 1, 1, '{}', 4),
(124, 13, 'message', 'text', 'Message', 0, 0, 1, 1, 1, 1, '{}', 5),
(125, 13, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 0, 0, 1, '{}', 6),
(126, 13, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 7),
(127, 14, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(128, 14, 'code', 'text', 'Code', 0, 1, 1, 1, 1, 1, '{\"validation\":{\"rule\":\"required|max:50\"}}', 2),
(129, 14, 'discount', 'text', 'Discount', 0, 1, 1, 1, 1, 1, '{\"validation\":{\"rule\":\"required|max:5\"}}', 3),
(130, 14, 'expire_at', 'timestamp', 'Expire At', 0, 1, 1, 1, 1, 1, '{}', 4),
(131, 14, 'limit', 'number', 'Limit', 0, 1, 1, 1, 1, 1, '{\"validation\":{\"rule\":\"required|max:5\"}}', 5),
(132, 14, 'minimum_cart', 'number', 'Minimum Cart', 0, 1, 1, 1, 1, 1, '{\"validation\":{\"rule\":\"required|max:5\"}}', 6),
(133, 14, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 0, 0, 1, '{}', 7),
(134, 14, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 8),
(135, 14, 'used', 'number', 'Used', 0, 1, 0, 0, 0, 0, '{}', 9);

-- --------------------------------------------------------

--
-- Table structure for table `data_types`
--

CREATE TABLE `data_types` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name_singular` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name_plural` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `model_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `policy_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `controller` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `generate_permissions` tinyint(1) NOT NULL DEFAULT '0',
  `server_side` tinyint(4) NOT NULL DEFAULT '0',
  `details` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `data_types`
--

INSERT INTO `data_types` (`id`, `name`, `slug`, `display_name_singular`, `display_name_plural`, `icon`, `model_name`, `policy_name`, `controller`, `description`, `generate_permissions`, `server_side`, `details`, `created_at`, `updated_at`) VALUES
(1, 'users', 'users', 'User', 'Users', 'voyager-person', 'TCG\\Voyager\\Models\\User', 'TCG\\Voyager\\Policies\\UserPolicy', 'TCG\\Voyager\\Http\\Controllers\\VoyagerUserController', '', 1, 0, NULL, '2021-06-15 20:25:59', '2021-06-15 20:25:59'),
(2, 'menus', 'menus', 'Menu', 'Menus', 'voyager-list', 'TCG\\Voyager\\Models\\Menu', NULL, '', '', 1, 0, NULL, '2021-06-15 20:25:59', '2021-06-15 20:25:59'),
(3, 'roles', 'roles', 'Role', 'Roles', 'voyager-lock', 'TCG\\Voyager\\Models\\Role', NULL, 'TCG\\Voyager\\Http\\Controllers\\VoyagerRoleController', '', 1, 0, NULL, '2021-06-15 20:25:59', '2021-06-15 20:25:59'),
(4, 'categories', 'categories', 'Category', 'Categories', 'voyager-categories', 'TCG\\Voyager\\Models\\Category', NULL, '', '', 1, 0, NULL, '2021-06-15 20:25:59', '2021-06-15 20:25:59'),
(5, 'posts', 'posts', 'Post', 'Posts', 'voyager-news', 'TCG\\Voyager\\Models\\Post', 'TCG\\Voyager\\Policies\\PostPolicy', '', '', 1, 0, NULL, '2021-06-15 20:25:59', '2021-06-15 20:25:59'),
(6, 'pages', 'pages', 'Page', 'Pages', 'voyager-file-text', 'TCG\\Voyager\\Models\\Page', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"desc\",\"default_search_key\":null,\"scope\":null}', '2021-06-15 20:25:59', '2021-06-15 23:59:40'),
(7, 'sliders', 'sliders', 'Slider', 'Sliders', 'voyager-images', 'App\\Slider', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2021-06-15 21:10:26', '2021-06-15 23:29:39'),
(8, 'products', 'products', 'Product', 'Products', 'voyager-bag', 'App\\Product', NULL, '\\App\\Http\\Controllers\\Voyager\\ProductsController', NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2021-06-15 22:05:16', '2023-01-19 02:40:12'),
(9, 'prodcats', 'prodcats', 'Prodcat', 'Prodcats', 'voyager-categories', 'App\\Prodcat', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2021-06-15 22:34:02', '2021-06-15 22:35:58'),
(10, 'shippings', 'shippings', 'Shipping', 'Shippings', 'voyager-rocket', 'App\\Shipping', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null}', '2021-06-15 22:44:31', '2021-06-15 22:44:31'),
(11, 'orders', 'orders', 'Order', 'Orders', 'voyager-dollar', 'App\\Order', NULL, '\\App\\Http\\Controllers\\Voyager\\OrdersController', NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2021-06-15 22:47:26', '2021-06-15 22:52:48'),
(13, 'contacts', 'contacts', 'Contact', 'Contacts', 'voyager-mail', 'App\\Contact', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null}', '2021-06-15 23:14:45', '2021-06-15 23:14:45'),
(14, 'coupons', 'coupons', 'Coupon', 'Coupons', 'voyager-dollar', 'App\\Coupon', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null}', '2021-06-16 01:05:32', '2021-06-16 01:05:32');

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
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `menus`
--

CREATE TABLE `menus` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `menus`
--

INSERT INTO `menus` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'admin', '2021-06-15 20:25:59', '2021-06-15 20:25:59'),
(2, 'main', '2021-06-15 23:31:45', '2021-06-15 23:31:45');

-- --------------------------------------------------------

--
-- Table structure for table `menu_items`
--

CREATE TABLE `menu_items` (
  `id` int(10) UNSIGNED NOT NULL,
  `menu_id` int(10) UNSIGNED DEFAULT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `target` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '_self',
  `icon_class` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `color` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `order` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `route` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parameters` text COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `menu_items`
--

INSERT INTO `menu_items` (`id`, `menu_id`, `title`, `url`, `target`, `icon_class`, `color`, `parent_id`, `order`, `created_at`, `updated_at`, `route`, `parameters`) VALUES
(1, 1, 'Dashboard', '', '_self', 'voyager-boat', NULL, NULL, 1, '2021-06-15 20:25:59', '2021-06-15 20:25:59', 'voyager.dashboard', NULL),
(3, 1, 'Users', '', '_self', 'voyager-person', NULL, NULL, 5, '2021-06-15 20:25:59', '2021-06-15 23:15:14', 'voyager.users.index', NULL),
(6, 1, 'Menus', '', '_self', 'voyager-list', '#000000', NULL, 8, '2021-06-15 20:25:59', '2021-06-15 23:15:10', 'voyager.menus.index', 'null'),
(10, 1, 'Settings', '', '_self', 'voyager-settings', NULL, NULL, 9, '2021-06-15 20:25:59', '2021-06-15 23:15:10', 'voyager.settings.index', NULL),
(13, 1, 'Pages', '', '_self', 'voyager-file-text', NULL, NULL, 6, '2021-06-15 20:25:59', '2021-06-15 23:15:10', 'voyager.pages.index', NULL),
(15, 1, 'Sliders', '', '_self', 'voyager-images', NULL, NULL, 4, '2021-06-15 21:10:26', '2021-06-15 23:15:14', 'voyager.sliders.index', NULL),
(16, 1, 'Product List', '', '_self', 'voyager-list', '#000000', 18, 1, '2021-06-15 22:05:16', '2021-06-15 22:42:45', 'voyager.products.index', 'null'),
(17, 1, 'Product Category', '', '_self', 'voyager-categories', '#000000', 18, 2, '2021-06-15 22:34:02', '2021-06-15 22:42:46', 'voyager.prodcats.index', 'null'),
(18, 1, 'Products', '', '_self', 'voyager-bag', '#000000', NULL, 3, '2021-06-15 22:42:39', '2021-06-15 23:15:14', NULL, ''),
(19, 1, 'Shippings', '', '_self', 'voyager-rocket', NULL, 18, 4, '2021-06-15 22:44:31', '2021-06-16 01:05:49', 'voyager.shippings.index', NULL),
(20, 1, 'Orders', '', '_self', 'voyager-dollar', NULL, NULL, 2, '2021-06-15 22:47:26', '2021-06-15 23:15:12', 'voyager.orders.index', NULL),
(21, 1, 'Contacts', '', '_self', 'voyager-mail', NULL, NULL, 7, '2021-06-15 23:14:46', '2021-06-15 23:15:10', 'voyager.contacts.index', NULL),
(22, 2, 'Home', '', '_self', NULL, '#000000', NULL, 1, '2021-06-15 23:31:58', '2023-01-19 02:26:34', 'home', NULL),
(23, 1, 'Coupons', '', '_self', 'voyager-dollar', NULL, 18, 3, '2021-06-16 01:05:32', '2021-06-16 01:05:49', 'voyager.coupons.index', NULL),
(24, 2, 'Shop', '', '_self', NULL, '#000000', NULL, 10, '2023-01-19 02:27:36', '2023-01-19 02:27:36', 'shop', NULL);

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
(3, '2014_10_12_200000_add_two_factor_columns_to_users_table', 1),
(4, '2019_08_19_000000_create_failed_jobs_table', 1),
(5, '2016_01_01_000000_add_voyager_user_fields', 2),
(6, '2016_01_01_000000_create_data_types_table', 2),
(7, '2016_05_19_173453_create_menu_table', 2),
(8, '2016_10_21_190000_create_roles_table', 2),
(9, '2016_10_21_190000_create_settings_table', 2),
(10, '2016_11_30_135954_create_permission_table', 2),
(11, '2016_11_30_141208_create_permission_role_table', 2),
(12, '2016_12_26_201236_data_types__add__server_side', 2),
(13, '2017_01_13_000000_add_route_to_menu_items_table', 2),
(14, '2017_01_14_005015_create_translations_table', 2),
(15, '2017_01_15_000000_make_table_name_nullable_in_permissions_table', 2),
(16, '2017_03_06_000000_add_controller_to_data_types_table', 2),
(17, '2017_04_21_000000_add_order_to_data_rows_table', 2),
(18, '2017_07_05_210000_add_policyname_to_data_types_table', 2),
(19, '2017_08_05_000000_add_group_to_settings_table', 2),
(20, '2017_11_26_013050_add_user_role_relationship', 2),
(21, '2017_11_26_015000_create_user_roles_table', 2),
(22, '2018_03_11_000000_add_user_settings', 2),
(23, '2018_03_14_000000_add_details_to_data_types_table', 2),
(24, '2018_03_16_000000_make_settings_value_nullable', 2),
(25, '2016_01_01_000000_create_pages_table', 3),
(26, '2016_01_01_000000_create_posts_table', 3),
(27, '2016_02_15_204651_create_categories_table', 3),
(28, '2017_04_11_000000_alter_post_nullable_fields_table', 3);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `first_name` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_name` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `post_code` int(5) DEFAULT NULL,
  `phone` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `discount` decimal(8,2) DEFAULT NULL,
  `discount_code` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subtotal` decimal(8,2) DEFAULT NULL,
  `tax` decimal(8,2) DEFAULT NULL,
  `shipping_cost` decimal(8,2) DEFAULT NULL,
  `shipping_method` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `total` decimal(8,2) DEFAULT NULL,
  `payment_gateway` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shipped` int(2) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `user_id`, `first_name`, `last_name`, `email`, `address`, `city`, `post_code`, `phone`, `state`, `discount`, `discount_code`, `subtotal`, `tax`, `shipping_cost`, `shipping_method`, `total`, `payment_gateway`, `shipped`, `created_at`, `updated_at`) VALUES
(38, 1, 'sayed', 'k', 'gojayed@gmail.com', 'flat 1b ,jui villa', 'savar', 1340, '01926184022', 'Dhaka zila', '0.00', NULL, '30.00', '0.00', '0.00', 'Free Shipping', '30.00', NULL, NULL, '2021-06-16 00:26:56', '2021-06-16 00:26:56'),
(39, 2, 'Keelie', 'Richards', 'wykija@mailinator.com', 'Quibusdam omnis et a', 'Repellendus In et e', 18, '56', 'Beatae exercitatione', '0.00', NULL, '30.00', '0.00', '0.00', 'Free Shipping', '30.00', NULL, NULL, '2022-06-17 23:22:25', '2022-06-17 23:22:25'),
(40, 1, 'Yvonne', 'Freeman', 'mymip@mailinator.com', 'Ab natus impedit ip', 'Ut quo fuga Sit nis', 60, '33', 'Deleniti non minus v', '0.00', NULL, '254.00', '0.00', '0.00', 'Free Shipping', '254.00', NULL, NULL, '2023-01-19 05:39:09', '2023-01-19 05:39:09'),
(41, 1, 'Abdur', 'Rahman', 'admin@admin.com', 'Ab natus impedit ip', 'Ut quo fuga Sit nis', 122312, '33', 'Deleniti non minus v', '0.00', NULL, '11.00', '0.00', '0.00', 'Free Shipping', '11.00', NULL, NULL, '2023-01-19 08:50:27', '2023-01-19 08:50:27'),
(42, 1, 'Camilla', 'Walton', 'qymepunyv@mailinator.com', 'Sit asperiores aliq', 'Adipisicing optio d', 89, '88', 'Maiores minima occae', '0.00', NULL, '652.00', '0.00', '0.00', 'Free Shipping', '652.00', NULL, NULL, '2023-01-21 07:09:16', '2023-01-21 07:09:16');

-- --------------------------------------------------------

--
-- Table structure for table `order_product`
--

CREATE TABLE `order_product` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED DEFAULT NULL,
  `product_id` bigint(20) UNSIGNED DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `price` decimal(8,2) DEFAULT NULL,
  `variation` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `order_product`
--

INSERT INTO `order_product` (`id`, `order_id`, `product_id`, `quantity`, `price`, `variation`, `created_at`, `updated_at`) VALUES
(1, 40, 45, 1, '11.00', 'null', '2023-01-19 05:39:09', '2023-01-19 05:39:09'),
(2, 40, 49, 1, '243.00', 'null', '2023-01-19 05:39:09', '2023-01-19 05:39:09'),
(3, 41, 45, 1, '11.00', 'null', '2023-01-19 08:50:27', '2023-01-19 08:50:27'),
(4, 42, 50, 1, '652.00', 'null', '2023-01-21 07:09:16', '2023-01-21 07:09:16');

-- --------------------------------------------------------

--
-- Table structure for table `pages`
--

CREATE TABLE `pages` (
  `id` int(10) UNSIGNED NOT NULL,
  `author_id` int(11) NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `excerpt` text COLLATE utf8mb4_unicode_ci,
  `body` text COLLATE utf8mb4_unicode_ci,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta_description` text COLLATE utf8mb4_unicode_ci,
  `meta_keywords` text COLLATE utf8mb4_unicode_ci,
  `status` enum('ACTIVE','INACTIVE') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'INACTIVE',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `table_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `key`, `table_name`, `created_at`, `updated_at`) VALUES
(1, 'browse_admin', NULL, '2021-06-15 20:25:59', '2021-06-15 20:25:59'),
(2, 'browse_bread', NULL, '2021-06-15 20:25:59', '2021-06-15 20:25:59'),
(3, 'browse_database', NULL, '2021-06-15 20:25:59', '2021-06-15 20:25:59'),
(4, 'browse_media', NULL, '2021-06-15 20:25:59', '2021-06-15 20:25:59'),
(5, 'browse_compass', NULL, '2021-06-15 20:25:59', '2021-06-15 20:25:59'),
(6, 'browse_menus', 'menus', '2021-06-15 20:25:59', '2021-06-15 20:25:59'),
(7, 'read_menus', 'menus', '2021-06-15 20:25:59', '2021-06-15 20:25:59'),
(8, 'edit_menus', 'menus', '2021-06-15 20:25:59', '2021-06-15 20:25:59'),
(9, 'add_menus', 'menus', '2021-06-15 20:25:59', '2021-06-15 20:25:59'),
(10, 'delete_menus', 'menus', '2021-06-15 20:25:59', '2021-06-15 20:25:59'),
(11, 'browse_roles', 'roles', '2021-06-15 20:25:59', '2021-06-15 20:25:59'),
(12, 'read_roles', 'roles', '2021-06-15 20:25:59', '2021-06-15 20:25:59'),
(13, 'edit_roles', 'roles', '2021-06-15 20:25:59', '2021-06-15 20:25:59'),
(14, 'add_roles', 'roles', '2021-06-15 20:25:59', '2021-06-15 20:25:59'),
(15, 'delete_roles', 'roles', '2021-06-15 20:25:59', '2021-06-15 20:25:59'),
(16, 'browse_users', 'users', '2021-06-15 20:25:59', '2021-06-15 20:25:59'),
(17, 'read_users', 'users', '2021-06-15 20:25:59', '2021-06-15 20:25:59'),
(18, 'edit_users', 'users', '2021-06-15 20:25:59', '2021-06-15 20:25:59'),
(19, 'add_users', 'users', '2021-06-15 20:25:59', '2021-06-15 20:25:59'),
(20, 'delete_users', 'users', '2021-06-15 20:25:59', '2021-06-15 20:25:59'),
(21, 'browse_settings', 'settings', '2021-06-15 20:25:59', '2021-06-15 20:25:59'),
(22, 'read_settings', 'settings', '2021-06-15 20:25:59', '2021-06-15 20:25:59'),
(23, 'edit_settings', 'settings', '2021-06-15 20:25:59', '2021-06-15 20:25:59'),
(24, 'add_settings', 'settings', '2021-06-15 20:25:59', '2021-06-15 20:25:59'),
(25, 'delete_settings', 'settings', '2021-06-15 20:25:59', '2021-06-15 20:25:59'),
(26, 'browse_categories', 'categories', '2021-06-15 20:25:59', '2021-06-15 20:25:59'),
(27, 'read_categories', 'categories', '2021-06-15 20:25:59', '2021-06-15 20:25:59'),
(28, 'edit_categories', 'categories', '2021-06-15 20:25:59', '2021-06-15 20:25:59'),
(29, 'add_categories', 'categories', '2021-06-15 20:25:59', '2021-06-15 20:25:59'),
(30, 'delete_categories', 'categories', '2021-06-15 20:25:59', '2021-06-15 20:25:59'),
(31, 'browse_posts', 'posts', '2021-06-15 20:25:59', '2021-06-15 20:25:59'),
(32, 'read_posts', 'posts', '2021-06-15 20:25:59', '2021-06-15 20:25:59'),
(33, 'edit_posts', 'posts', '2021-06-15 20:25:59', '2021-06-15 20:25:59'),
(34, 'add_posts', 'posts', '2021-06-15 20:25:59', '2021-06-15 20:25:59'),
(35, 'delete_posts', 'posts', '2021-06-15 20:25:59', '2021-06-15 20:25:59'),
(36, 'browse_pages', 'pages', '2021-06-15 20:25:59', '2021-06-15 20:25:59'),
(37, 'read_pages', 'pages', '2021-06-15 20:25:59', '2021-06-15 20:25:59'),
(38, 'edit_pages', 'pages', '2021-06-15 20:25:59', '2021-06-15 20:25:59'),
(39, 'add_pages', 'pages', '2021-06-15 20:25:59', '2021-06-15 20:25:59'),
(40, 'delete_pages', 'pages', '2021-06-15 20:25:59', '2021-06-15 20:25:59'),
(41, 'browse_hooks', NULL, '2021-06-15 20:25:59', '2021-06-15 20:25:59'),
(42, 'browse_sliders', 'sliders', '2021-06-15 21:10:26', '2021-06-15 21:10:26'),
(43, 'read_sliders', 'sliders', '2021-06-15 21:10:26', '2021-06-15 21:10:26'),
(44, 'edit_sliders', 'sliders', '2021-06-15 21:10:26', '2021-06-15 21:10:26'),
(45, 'add_sliders', 'sliders', '2021-06-15 21:10:26', '2021-06-15 21:10:26'),
(46, 'delete_sliders', 'sliders', '2021-06-15 21:10:26', '2021-06-15 21:10:26'),
(47, 'browse_products', 'products', '2021-06-15 22:05:16', '2021-06-15 22:05:16'),
(48, 'read_products', 'products', '2021-06-15 22:05:16', '2021-06-15 22:05:16'),
(49, 'edit_products', 'products', '2021-06-15 22:05:16', '2021-06-15 22:05:16'),
(50, 'add_products', 'products', '2021-06-15 22:05:16', '2021-06-15 22:05:16'),
(51, 'delete_products', 'products', '2021-06-15 22:05:16', '2021-06-15 22:05:16'),
(52, 'browse_prodcats', 'prodcats', '2021-06-15 22:34:02', '2021-06-15 22:34:02'),
(53, 'read_prodcats', 'prodcats', '2021-06-15 22:34:02', '2021-06-15 22:34:02'),
(54, 'edit_prodcats', 'prodcats', '2021-06-15 22:34:02', '2021-06-15 22:34:02'),
(55, 'add_prodcats', 'prodcats', '2021-06-15 22:34:02', '2021-06-15 22:34:02'),
(56, 'delete_prodcats', 'prodcats', '2021-06-15 22:34:02', '2021-06-15 22:34:02'),
(57, 'browse_shippings', 'shippings', '2021-06-15 22:44:31', '2021-06-15 22:44:31'),
(58, 'read_shippings', 'shippings', '2021-06-15 22:44:31', '2021-06-15 22:44:31'),
(59, 'edit_shippings', 'shippings', '2021-06-15 22:44:31', '2021-06-15 22:44:31'),
(60, 'add_shippings', 'shippings', '2021-06-15 22:44:31', '2021-06-15 22:44:31'),
(61, 'delete_shippings', 'shippings', '2021-06-15 22:44:31', '2021-06-15 22:44:31'),
(62, 'browse_orders', 'orders', '2021-06-15 22:47:26', '2021-06-15 22:47:26'),
(63, 'read_orders', 'orders', '2021-06-15 22:47:26', '2021-06-15 22:47:26'),
(64, 'edit_orders', 'orders', '2021-06-15 22:47:26', '2021-06-15 22:47:26'),
(65, 'add_orders', 'orders', '2021-06-15 22:47:26', '2021-06-15 22:47:26'),
(66, 'delete_orders', 'orders', '2021-06-15 22:47:26', '2021-06-15 22:47:26'),
(67, 'browse_contacts', 'contacts', '2021-06-15 23:14:46', '2021-06-15 23:14:46'),
(68, 'read_contacts', 'contacts', '2021-06-15 23:14:46', '2021-06-15 23:14:46'),
(69, 'edit_contacts', 'contacts', '2021-06-15 23:14:46', '2021-06-15 23:14:46'),
(70, 'add_contacts', 'contacts', '2021-06-15 23:14:46', '2021-06-15 23:14:46'),
(71, 'delete_contacts', 'contacts', '2021-06-15 23:14:46', '2021-06-15 23:14:46'),
(72, 'browse_coupons', 'coupons', '2021-06-16 01:05:32', '2021-06-16 01:05:32'),
(73, 'read_coupons', 'coupons', '2021-06-16 01:05:32', '2021-06-16 01:05:32'),
(74, 'edit_coupons', 'coupons', '2021-06-16 01:05:32', '2021-06-16 01:05:32'),
(75, 'add_coupons', 'coupons', '2021-06-16 01:05:32', '2021-06-16 01:05:32'),
(76, 'delete_coupons', 'coupons', '2021-06-16 01:05:32', '2021-06-16 01:05:32');

-- --------------------------------------------------------

--
-- Table structure for table `permission_role`
--

CREATE TABLE `permission_role` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permission_role`
--

INSERT INTO `permission_role` (`permission_id`, `role_id`) VALUES
(1, 1),
(2, 1),
(3, 1),
(4, 1),
(5, 1),
(6, 1),
(7, 1),
(8, 1),
(9, 1),
(10, 1),
(11, 1),
(12, 1),
(13, 1),
(14, 1),
(15, 1),
(16, 1),
(17, 1),
(18, 1),
(19, 1),
(20, 1),
(21, 1),
(22, 1),
(23, 1),
(24, 1),
(25, 1),
(26, 1),
(27, 1),
(28, 1),
(29, 1),
(30, 1),
(31, 1),
(32, 1),
(33, 1),
(34, 1),
(35, 1),
(36, 1),
(37, 1),
(38, 1),
(39, 1),
(40, 1),
(42, 1),
(43, 1),
(44, 1),
(45, 1),
(46, 1),
(47, 1),
(48, 1),
(49, 1),
(50, 1),
(51, 1),
(52, 1),
(53, 1),
(54, 1),
(55, 1),
(56, 1),
(57, 1),
(58, 1),
(59, 1),
(60, 1),
(61, 1),
(62, 1),
(63, 1),
(64, 1),
(65, 1),
(66, 1),
(67, 1),
(68, 1),
(69, 1),
(70, 1),
(71, 1),
(72, 1),
(73, 1),
(74, 1),
(75, 1),
(76, 1);

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `id` int(10) UNSIGNED NOT NULL,
  `author_id` int(11) NOT NULL,
  `category_id` int(11) DEFAULT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `seo_title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `excerpt` text COLLATE utf8mb4_unicode_ci,
  `body` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta_description` text COLLATE utf8mb4_unicode_ci,
  `meta_keywords` text COLLATE utf8mb4_unicode_ci,
  `status` enum('PUBLISHED','DRAFT','PENDING') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'DRAFT',
  `featured` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `prodcats`
--

CREATE TABLE `prodcats` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `prodcat_product`
--

CREATE TABLE `prodcat_product` (
  `id` int(10) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED DEFAULT NULL,
  `prodcat_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `parent_id` int(10) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price` int(9) DEFAULT NULL,
  `saleprice` int(11) DEFAULT NULL,
  `details` text COLLATE utf8mb4_unicode_ci,
  `sku` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci,
  `image` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `images` text COLLATE utf8mb4_unicode_ci,
  `view` int(11) DEFAULT '0',
  `sale_count` int(11) NOT NULL DEFAULT '1',
  `status` tinyint(4) DEFAULT NULL,
  `is_variable` tinyint(3) DEFAULT NULL,
  `variation` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `length` decimal(8,2) DEFAULT NULL,
  `width` decimal(8,2) DEFAULT NULL,
  `height` decimal(8,2) DEFAULT NULL,
  `weight` decimal(8,2) DEFAULT NULL,
  `featured` tinyint(4) DEFAULT NULL,
  `discount` int(5) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `parent_id`, `name`, `slug`, `price`, `saleprice`, `details`, `sku`, `quantity`, `description`, `image`, `images`, `view`, `sale_count`, `status`, `is_variable`, `variation`, `length`, `width`, `height`, `weight`, `featured`, `discount`, `created_at`, `updated_at`) VALUES
(45, NULL, 'Nine Liars', 'nine-liars', 1299, 1100, 'Maureen Johnson', '2022-12-12 00:00:00', 9, '<p><span class=\"Formatted\">Senior year at Ellingham Academy for Stevie Bell isn&rsquo;t going well. Her boyfriend, David, is studying in London. Her friends are obsessed with college applications. With the cold case of the century solved, Stevie is adrift. There is nothing to distract her from the questions pinging around her brain&mdash;questions about college, love, and life in general.<br><br>Relief comes when David invites Stevie and her friends to join him for study abroad, and his new friend Izzy introduces her to a double-murder cold case. In 1995, nine friends from Cambridge University went to a country house and played a drunken game of hide-and-seek. Two were found in the woodshed the next day, murdered with an ax.<br><br>The case was assumed to be a burglary gone wrong, but one of the remaining seven saw something she can&rsquo;t explain. This was no break-in. Someone&rsquo;s lying about what happened in the woodshed.<br><br>Seven suspects. Two murders. One killer still playing a deadly game.</span></p>', 'products/January2023/crfRBhvMTWAZVSKmTBbE.jpg', NULL, 0, 3, 1, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, '2023-01-19 02:39:09', '2023-01-19 08:50:27'),
(46, NULL, 'Mara Hardy', 'Repellendus Placeat', 81100, 55700, 'Fugiat sed voluptate', '2019-11-18 00:00:00', 384, '<p>Doloribus exercitati.</p>', 'products/January2023/C3AgGaAHN1B8cNsHBNpE.jpg', '[\"products\\\\January2023\\\\3JPGqM5ySv8ZydepzrCt.jpg\"]', 0, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, '2023-01-19 02:47:21', '2023-01-19 02:47:47'),
(47, NULL, 'Linda Pacheco', 'Et laborum Cum dolo', 17400, 36400, 'Soluta non magni lab', '2009-07-17 00:00:00', 294, '<p>Totam adipisci dolor.</p>', 'products\\January2023\\bnTLDPM6khnfjSrQ6VvY.jpg', '[\"products\\\\January2023\\\\UvHxUw97kMAfHYPu4Hdc.jpg\"]', 0, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, '2023-01-19 02:48:53', '2023-01-19 02:48:53'),
(48, NULL, 'Kelly Robinson', 'Consectetur labore', 43500, 51900, 'Non consectetur blan', '1970-10-22 00:00:00', 335, '<p>Itaque iste pariatur.</p>', 'products\\January2023\\lQEeRDRpFCv02X9kc0Ng.jpg', '[\"products\\\\January2023\\\\wuZnnD5lCKlGaP9l2hJ6.jpg\"]', 0, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, '2023-01-19 02:49:23', '2023-01-19 02:49:23'),
(49, NULL, 'Shelby Fuentes', 'Iste non exercitatio', 66900, 24300, 'Ut autem impedit qu', '2004-09-01 00:00:00', 375, '<p>Enim ducimus, libero.</p>', 'products\\January2023\\eG2zPk5wa5JOAwVyi407.jpg', '[\"products\\\\January2023\\\\J7UmPiLzodTsSsR9JEJ8.jpg\"]', 0, 2, 1, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, '2023-01-19 02:50:21', '2023-01-19 05:39:09'),
(50, NULL, 'Damon Mclean', 'Pariatur Quae velit', 69200, 65200, 'Quia sed sit nulla e', '2011-08-10 00:00:00', 721, '<p>Porro soluta fuga. N.</p>', 'products\\January2023\\G908LA2Zz1ybyUiUcwfC.png', '[\"products\\\\January2023\\\\iLOtYo9z0RU1hwaUidJR.jpg\"]', 0, 2, 1, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, '2023-01-19 02:51:09', '2023-01-21 07:09:16'),
(51, NULL, 'Hiroko Velazquez', 'Quae cupiditate nisi', 72800, 66000, 'Doloribus nihil qui', '1993-02-15 00:00:00', 797, NULL, 'products\\January2023\\yGF9jtYlaTW7KMiTOVAo.jpg', '[\"products\\\\January2023\\\\3fx4qHQ4BHWtWGgD7jvF.jpg\"]', 0, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, '2023-01-19 08:47:44', '2023-01-19 08:47:44'),
(52, NULL, 'Rachel Goodman', 'Nihil dolor est et', 53000, 12300, 'Minim dolorem porro', '1986-11-04 00:00:00', 993, '<p>Voluptate voluptatem.</p>', 'products\\January2023\\TvXgODzwDSWz0ofUvKnD.jpg', NULL, 0, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, '2023-01-21 07:07:48', '2023-01-21 07:07:48');

-- --------------------------------------------------------

--
-- Table structure for table `product_tag`
--

CREATE TABLE `product_tag` (
  `id` int(10) UNSIGNED NOT NULL,
  `tag_id` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_tag`
--

INSERT INTO `product_tag` (`id`, `tag_id`, `product_id`, `created_at`, `updated_at`) VALUES
(1, 2, 1, NULL, NULL),
(2, 1, 3, NULL, NULL),
(3, 1, 4, NULL, NULL),
(4, 2, 4, NULL, NULL),
(5, 1, 5, NULL, NULL),
(6, 2, 5, NULL, NULL),
(7, 1, 6, NULL, NULL),
(8, 2, 6, NULL, NULL),
(9, 1, 7, NULL, NULL),
(10, 2, 7, NULL, NULL),
(11, 1, 8, NULL, NULL),
(12, 2, 8, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `ratings`
--

CREATE TABLE `ratings` (
  `id` int(11) NOT NULL,
  `status` int(11) NOT NULL DEFAULT '0',
  `product_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `rating` varchar(255) DEFAULT NULL,
  `review` text,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ratings`
--

INSERT INTO `ratings` (`id`, `status`, `product_id`, `created_at`, `name`, `email`, `rating`, `review`, `updated_at`) VALUES
(1, 0, 19, '2021-04-07 03:19:04', 'sayed k', 'reovilsayed@gmail.com', '1.5', 'sadas', '2021-04-07 03:19:04'),
(2, 1, 3, '2021-04-07 19:48:06', 'sayed k', 'reovilsayed@gmail.com', '4.5', 'vcbb', '2021-04-07 19:48:06'),
(3, 0, 3, '2021-04-17 16:46:05', 'khaled', 'aboufares2013@gmail.com', '1', 'tyest', '2021-04-17 16:46:05'),
(4, 0, 3, '2021-04-17 16:46:49', 'khaled', 'aboufares2013@gmail.com', '5', 'eee', '2021-04-17 16:46:49'),
(5, 0, 19, '2021-04-18 18:38:55', 'Alfardan trading', 'aboufares2013@gmail.com', '5', '222', '2021-04-18 18:38:55'),
(6, 0, 19, '2021-04-18 19:07:20', 'sayed k', 'sumiakterliza4@gmail.com', '5', 'test', '2021-04-18 19:07:20'),
(7, 0, 19, '2021-04-22 19:58:16', 'khaled', 'aboufares2013@gmail.com', '1', 'test', '2021-04-22 19:58:16'),
(8, 0, 19, '2023-01-18 11:20:57', 'Hedda Jordan', 'nysy@mailinator.com', '2', 'Cillum atque est ut', '2023-01-18 11:20:57'),
(9, 0, 45, '2023-01-19 03:02:49', 'Ulysses Greer', 'cone@mailinator.com', '3', 'Impedit et itaque f', '2023-01-19 03:02:49');

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `display_name`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'Administrator', '2021-06-15 20:25:59', '2021-06-15 20:25:59'),
(2, 'user', 'Normal User', '2021-06-15 20:25:59', '2021-06-15 20:25:59');

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` int(10) UNSIGNED NOT NULL,
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci,
  `details` text COLLATE utf8mb4_unicode_ci,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `order` int(11) NOT NULL DEFAULT '1',
  `group` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `key`, `display_name`, `value`, `details`, `type`, `order`, `group`) VALUES
(1, 'site.title', 'Site Title', 'E-Boi Bitan', '', 'text', 1, 'Site'),
(2, 'site.description', 'Site Description', 'Best place to buy books', '', 'text', 2, 'Site'),
(3, 'site.logo', 'Site Logo', 'settings\\January2023\\fHb5m3XaKv902WeCgZ2R.png', '', 'image', 3, 'Site'),
(5, 'admin.bg_image', 'Admin Background Image', '', '', 'image', 5, 'Admin'),
(6, 'admin.title', 'Admin Title', 'ecommerce', '', 'text', 1, 'Admin'),
(7, 'admin.description', 'Admin Description', 'Welcome to ecommerce', '', 'text', 2, 'Admin'),
(8, 'admin.loader', 'Admin Loader', '', '', 'image', 3, 'Admin'),
(9, 'admin.icon_image', 'Admin Icon Image', '', '', 'image', 4, 'Admin'),
(10, 'admin.google_analytics_client_id', 'Google Analytics Client ID (used for admin dashboard)', NULL, '', 'text', 1, 'Admin'),
(103, 'site.facebook_image', 'Facebook Image', '', NULL, 'image', 8, 'Site'),
(104, 'site.phone', 'Phone', '800-408-1332', NULL, 'text', 9, 'Site'),
(105, 'site.email', 'Email', 'info@company.com', NULL, 'text', 10, 'Site'),
(106, 'site.address', 'Address', '1615 Yeager Ave  <br>La Verne, CA 91750', NULL, 'text', 11, 'Site'),
(107, 'site.map', 'Map', '<iframe src=\"https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3654.3406974350205!2d90.48469931445422!3d23.663771197998262!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3755b0d5983f048d%3A0x754f30c82bcad3cd!2sJalkuri%20Bus%20Stop!5e0!3m2!1sen!2sbd!4v1605354966349!5m2!1sen!2sbd\" width=\"100%\" height=\"100%\" frameborder=\"0\" style=\"border:0;\" allowfullscreen=\"100%\" aria-hidden=\"false\" tabindex=\"0\"></iframe>', NULL, 'text', 12, 'Site'),
(108, 'site.copyright', 'Copyright', 'All Right reserve ecommerce.com', NULL, 'text', 13, 'Site'),
(109, 'site.about', 'About', 'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).', NULL, 'text_area', 14, 'Site'),
(110, 'code.style', 'Style', '.navbar-nav .dropdown-menu{\r\n		    position: absolute;\r\n		}\r\n		.product-btn button {\r\n			width: 100%;\r\n			height: 40px;\r\n			font-size: 14px;\r\n			font-weight: 500;\r\n			padding: 12px 0px;\r\n			border-radius: 3px;\r\n			display: -webkit-box;\r\n			display: -ms-flexbox;\r\n			display: flex;\r\n			-webkit-box-align: center;\r\n			-ms-flex-align: center;\r\n			align-items: center;\r\n			-webkit-box-pack: center;\r\n			-ms-flex-pack: center;\r\n			justify-content: center;\r\n			color: var(--brandcolor);\r\n			border: 1px solid var(--brandcolor);\r\n			text-shadow: var(--tshadow);\r\n			transition: all linear .3s;\r\n			-webkit-transition: all linear .3s;\r\n			-moz-transition: all linear .3s;\r\n			-ms-transition: all linear .3s;\r\n			-o-transition: all linear .3s;\r\n			}\r\n		.carousel-caption{\r\n			z-index:1\r\n		}', NULL, 'code_editor', 15, 'code');

-- --------------------------------------------------------

--
-- Table structure for table `shippings`
--

CREATE TABLE `shippings` (
  `id` int(10) UNSIGNED NOT NULL,
  `Shipping_method` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shipping_cost` decimal(8,2) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `shippings`
--

INSERT INTO `shippings` (`id`, `Shipping_method`, `shipping_cost`, `created_at`, `updated_at`) VALUES
(1, 'Free Shipping', '0.00', '2020-04-28 13:39:43', '2020-04-28 13:39:43'),
(2, 'By Road', '50.00', '2020-04-28 13:39:57', '2020-04-28 13:39:57'),
(3, 'By Air', '100.00', '2020-04-28 14:28:03', '2020-04-28 14:28:03');

-- --------------------------------------------------------

--
-- Table structure for table `sliders`
--

CREATE TABLE `sliders` (
  `id` int(10) UNSIGNED NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `heading` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `paragraph` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sliders`
--

INSERT INTO `sliders` (`id`, `image`, `heading`, `paragraph`, `created_at`, `updated_at`) VALUES
(12, 'sliders\\January2023\\G7oUXP58gdRfERcQmYoT.jpg', NULL, NULL, '2023-01-19 06:07:11', '2023-01-19 06:07:11'),
(13, 'sliders\\January2023\\g74ktJCMeXBMwRcEUcYS.png', NULL, NULL, '2023-01-19 06:08:16', '2023-01-19 06:08:16'),
(14, 'sliders\\January2023\\dnwunkAHxPJ3RZZqwkKm.gif', NULL, NULL, '2023-01-19 06:19:59', '2023-01-19 06:19:59');

-- --------------------------------------------------------

--
-- Table structure for table `tags`
--

CREATE TABLE `tags` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tags`
--

INSERT INTO `tags` (`id`, `name`, `slug`, `created_at`, `updated_at`) VALUES
(1, 'Tatron', 'tatron', '2020-04-19 12:53:49', '2020-04-24 08:41:49'),
(2, 'Cotton', 'cotton', '2020-04-19 12:54:03', '2020-04-24 08:41:37');

-- --------------------------------------------------------

--
-- Table structure for table `translations`
--

CREATE TABLE `translations` (
  `id` int(10) UNSIGNED NOT NULL,
  `table_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `column_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `foreign_key` int(10) UNSIGNED NOT NULL,
  `locale` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `translations`
--

INSERT INTO `translations` (`id`, `table_name`, `column_name`, `foreign_key`, `locale`, `value`, `created_at`, `updated_at`) VALUES
(1, 'data_types', 'display_name_singular', 5, 'pt', 'Post', '2021-06-15 20:25:59', '2021-06-15 20:25:59'),
(2, 'data_types', 'display_name_singular', 6, 'pt', 'Página', '2021-06-15 20:25:59', '2021-06-15 20:25:59'),
(3, 'data_types', 'display_name_singular', 1, 'pt', 'Utilizador', '2021-06-15 20:25:59', '2021-06-15 20:25:59'),
(4, 'data_types', 'display_name_singular', 4, 'pt', 'Categoria', '2021-06-15 20:25:59', '2021-06-15 20:25:59'),
(5, 'data_types', 'display_name_singular', 2, 'pt', 'Menu', '2021-06-15 20:25:59', '2021-06-15 20:25:59'),
(6, 'data_types', 'display_name_singular', 3, 'pt', 'Função', '2021-06-15 20:25:59', '2021-06-15 20:25:59'),
(7, 'data_types', 'display_name_plural', 5, 'pt', 'Posts', '2021-06-15 20:25:59', '2021-06-15 20:25:59'),
(8, 'data_types', 'display_name_plural', 6, 'pt', 'Páginas', '2021-06-15 20:25:59', '2021-06-15 20:25:59'),
(9, 'data_types', 'display_name_plural', 1, 'pt', 'Utilizadores', '2021-06-15 20:25:59', '2021-06-15 20:25:59'),
(10, 'data_types', 'display_name_plural', 4, 'pt', 'Categorias', '2021-06-15 20:25:59', '2021-06-15 20:25:59'),
(11, 'data_types', 'display_name_plural', 2, 'pt', 'Menus', '2021-06-15 20:25:59', '2021-06-15 20:25:59'),
(12, 'data_types', 'display_name_plural', 3, 'pt', 'Funções', '2021-06-15 20:25:59', '2021-06-15 20:25:59'),
(13, 'categories', 'slug', 1, 'pt', 'categoria-1', '2021-06-15 20:25:59', '2021-06-15 20:25:59'),
(14, 'categories', 'name', 1, 'pt', 'Categoria 1', '2021-06-15 20:25:59', '2021-06-15 20:25:59'),
(15, 'categories', 'slug', 2, 'pt', 'categoria-2', '2021-06-15 20:25:59', '2021-06-15 20:25:59'),
(16, 'categories', 'name', 2, 'pt', 'Categoria 2', '2021-06-15 20:25:59', '2021-06-15 20:25:59'),
(17, 'pages', 'title', 1, 'pt', 'Olá Mundo', '2021-06-15 20:25:59', '2021-06-15 20:25:59'),
(18, 'pages', 'slug', 1, 'pt', 'ola-mundo', '2021-06-15 20:25:59', '2021-06-15 20:25:59'),
(19, 'pages', 'body', 1, 'pt', '<p>Olá Mundo. Scallywag grog swab Cat o\'nine tails scuttle rigging hardtack cable nipper Yellow Jack. Handsomely spirits knave lad killick landlubber or just lubber deadlights chantey pinnace crack Jennys tea cup. Provost long clothes black spot Yellow Jack bilged on her anchor league lateen sail case shot lee tackle.</p>\r\n<p>Ballast spirits fluke topmast me quarterdeck schooner landlubber or just lubber gabion belaying pin. Pinnace stern galleon starboard warp carouser to go on account dance the hempen jig jolly boat measured fer yer chains. Man-of-war fire in the hole nipperkin handsomely doubloon barkadeer Brethren of the Coast gibbet driver squiffy.</p>', '2021-06-15 20:25:59', '2021-06-15 20:25:59'),
(20, 'menu_items', 'title', 1, 'pt', 'Painel de Controle', '2021-06-15 20:25:59', '2021-06-15 20:25:59'),
(21, 'menu_items', 'title', 2, 'pt', 'Media', '2021-06-15 20:25:59', '2021-06-15 20:25:59'),
(22, 'menu_items', 'title', 12, 'pt', 'Publicações', '2021-06-15 20:25:59', '2021-06-15 20:25:59'),
(23, 'menu_items', 'title', 3, 'pt', 'Utilizadores', '2021-06-15 20:25:59', '2021-06-15 20:25:59'),
(24, 'menu_items', 'title', 11, 'pt', 'Categorias', '2021-06-15 20:25:59', '2021-06-15 20:25:59'),
(25, 'menu_items', 'title', 13, 'pt', 'Páginas', '2021-06-15 20:25:59', '2021-06-15 20:25:59'),
(26, 'menu_items', 'title', 4, 'pt', 'Funções', '2021-06-15 20:25:59', '2021-06-15 20:25:59'),
(27, 'menu_items', 'title', 5, 'pt', 'Ferramentas', '2021-06-15 20:25:59', '2021-06-15 20:25:59'),
(28, 'menu_items', 'title', 6, 'pt', 'Menus', '2021-06-15 20:25:59', '2021-06-15 20:25:59'),
(29, 'menu_items', 'title', 7, 'pt', 'Base de dados', '2021-06-15 20:25:59', '2021-06-15 20:25:59'),
(30, 'menu_items', 'title', 10, 'pt', 'Configurações', '2021-06-15 20:25:59', '2021-06-15 20:25:59');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `post_code` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `avatar` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT 'users/default.png',
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `two_factor_secret` text COLLATE utf8mb4_unicode_ci,
  `two_factor_recovery_codes` text COLLATE utf8mb4_unicode_ci,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `settings` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `role_id`, `name`, `last_name`, `address`, `city`, `post_code`, `state`, `phone`, `email`, `avatar`, `email_verified_at`, `password`, `two_factor_secret`, `two_factor_recovery_codes`, `remember_token`, `settings`, `created_at`, `updated_at`) VALUES
(1, 1, 'Camilla', 'Walton', 'Sit asperiores aliq', 'Adipisicing optio d', '89', 'Maiores minima occae', '88', 'admin@admin.com', 'users\\January2023\\WuQ3V2hIUxqIevc8IECc.png', NULL, '$2y$10$2ptqxZDaf85xRlZOEwJfIOT2DhOmP2ZlJFTLwKwa80ltuSl7gVPi2', NULL, NULL, 'vVgaD6St8HfKw3zY2qJV7ErZp91mI0YqRZJc2pQs7Fe0mmHEaT7Y1S8XaXaB', '{\"locale\":\"en\"}', '2021-06-15 20:25:59', '2023-01-21 07:09:16'),
(2, 2, 'Keelie', 'Richards', 'Quibusdam omnis et a', 'Repellendus In et e', '18', 'Beatae exercitatione', '56', 'sukysegiw@mailinator.com', 'users/default.png', NULL, '$2y$10$zrPKMndFlXLMmzeaa2BG8uFuOk8d/vjvl13d/CJUafXXTwS1TkIJW', NULL, NULL, NULL, NULL, '2022-06-17 23:21:46', '2022-06-17 23:22:25');

-- --------------------------------------------------------

--
-- Table structure for table `user_roles`
--

CREATE TABLE `user_roles` (
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `attributes`
--
ALTER TABLE `attributes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `brands`
--
ALTER TABLE `brands`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `brand_product`
--
ALTER TABLE `brand_product`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `categories_slug_unique` (`slug`),
  ADD KEY `categories_parent_id_foreign` (`parent_id`);

--
-- Indexes for table `contacts`
--
ALTER TABLE `contacts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `coupons`
--
ALTER TABLE `coupons`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `data_rows`
--
ALTER TABLE `data_rows`
  ADD PRIMARY KEY (`id`),
  ADD KEY `data_rows_data_type_id_foreign` (`data_type_id`);

--
-- Indexes for table `data_types`
--
ALTER TABLE `data_types`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `data_types_name_unique` (`name`),
  ADD UNIQUE KEY `data_types_slug_unique` (`slug`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `menus`
--
ALTER TABLE `menus`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `menus_name_unique` (`name`);

--
-- Indexes for table `menu_items`
--
ALTER TABLE `menu_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `menu_items_menu_id_foreign` (`menu_id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_user_relationship` (`user_id`);

--
-- Indexes for table `order_product`
--
ALTER TABLE `order_product`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_order_relationship` (`product_id`),
  ADD KEY `order_product_relationship` (`order_id`);

--
-- Indexes for table `pages`
--
ALTER TABLE `pages`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `pages_slug_unique` (`slug`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `permissions_key_index` (`key`);

--
-- Indexes for table `permission_role`
--
ALTER TABLE `permission_role`
  ADD PRIMARY KEY (`permission_id`,`role_id`),
  ADD KEY `permission_role_permission_id_index` (`permission_id`),
  ADD KEY `permission_role_role_id_index` (`role_id`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `posts_slug_unique` (`slug`);

--
-- Indexes for table `prodcats`
--
ALTER TABLE `prodcats`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `prodcat_product`
--
ALTER TABLE `prodcat_product`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_category_relationship` (`product_id`),
  ADD KEY `category_product_relation` (`prodcat_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_tag`
--
ALTER TABLE `product_tag`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ratings`
--
ALTER TABLE `ratings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `roles_name_unique` (`name`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `settings_key_unique` (`key`);

--
-- Indexes for table `shippings`
--
ALTER TABLE `shippings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sliders`
--
ALTER TABLE `sliders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tags`
--
ALTER TABLE `tags`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `translations`
--
ALTER TABLE `translations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `translations_table_name_column_name_foreign_key_locale_unique` (`table_name`,`column_name`,`foreign_key`,`locale`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD KEY `users_role_id_foreign` (`role_id`);

--
-- Indexes for table `user_roles`
--
ALTER TABLE `user_roles`
  ADD PRIMARY KEY (`user_id`,`role_id`),
  ADD KEY `user_roles_user_id_index` (`user_id`),
  ADD KEY `user_roles_role_id_index` (`role_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `attributes`
--
ALTER TABLE `attributes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `brands`
--
ALTER TABLE `brands`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `brand_product`
--
ALTER TABLE `brand_product`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `contacts`
--
ALTER TABLE `contacts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `coupons`
--
ALTER TABLE `coupons`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `data_rows`
--
ALTER TABLE `data_rows`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=136;

--
-- AUTO_INCREMENT for table `data_types`
--
ALTER TABLE `data_types`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `menus`
--
ALTER TABLE `menus`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `menu_items`
--
ALTER TABLE `menu_items`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT for table `order_product`
--
ALTER TABLE `order_product`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `pages`
--
ALTER TABLE `pages`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=77;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `prodcats`
--
ALTER TABLE `prodcats`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `prodcat_product`
--
ALTER TABLE `prodcat_product`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;

--
-- AUTO_INCREMENT for table `product_tag`
--
ALTER TABLE `product_tag`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `ratings`
--
ALTER TABLE `ratings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=111;

--
-- AUTO_INCREMENT for table `shippings`
--
ALTER TABLE `shippings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `sliders`
--
ALTER TABLE `sliders`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `tags`
--
ALTER TABLE `tags`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `translations`
--
ALTER TABLE `translations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `categories`
--
ALTER TABLE `categories`
  ADD CONSTRAINT `categories_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `categories` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `data_rows`
--
ALTER TABLE `data_rows`
  ADD CONSTRAINT `data_rows_data_type_id_foreign` FOREIGN KEY (`data_type_id`) REFERENCES `data_types` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `menu_items`
--
ALTER TABLE `menu_items`
  ADD CONSTRAINT `menu_items_menu_id_foreign` FOREIGN KEY (`menu_id`) REFERENCES `menus` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `order_user_relationship` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `order_product`
--
ALTER TABLE `order_product`
  ADD CONSTRAINT `order_product_relationship` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `product_order_relationship` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `permission_role`
--
ALTER TABLE `permission_role`
  ADD CONSTRAINT `permission_role_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `permission_role_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `prodcat_product`
--
ALTER TABLE `prodcat_product`
  ADD CONSTRAINT `category_product_relation` FOREIGN KEY (`prodcat_id`) REFERENCES `prodcats` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `product_category_relationship` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`);

--
-- Constraints for table `user_roles`
--
ALTER TABLE `user_roles`
  ADD CONSTRAINT `user_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `user_roles_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
