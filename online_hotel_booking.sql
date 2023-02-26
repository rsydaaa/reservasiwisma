-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 17 Okt 2022 pada 05.12
-- Versi server: 10.4.22-MariaDB
-- Versi PHP: 8.1.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `online_hotel_booking`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `admins`
--

CREATE TABLE `admins` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `photo` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `admins`
--

INSERT INTO `admins` (`id`, `name`, `email`, `password`, `photo`, `token`, `created_at`, `updated_at`) VALUES
(1, 'Nasrul Kurniawan', 'nasrulkurniawan@gmail.com', '$2y$10$.J.kESDW9OrlNgDMpseEoORyAb/5hS6sO3w7i8TFeqAaDPwYljPUu', 'admin.png', '', NULL, '2022-10-16 07:27:06');

-- --------------------------------------------------------

--
-- Struktur dari tabel `amenities`
--

CREATE TABLE `amenities` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `amenities`
--

INSERT INTO `amenities` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'Air Conditioner', '2022-07-01 05:32:35', '2022-07-01 05:32:35'),
(2, 'Hair Dryer', '2022-07-01 05:32:55', '2022-07-01 05:32:55'),
(3, 'Coffee Maker', '2022-07-01 05:33:07', '2022-07-01 05:33:07'),
(4, 'Toiletries', '2022-07-01 05:33:29', '2022-07-01 05:33:29'),
(5, 'Personal care', '2022-07-01 05:33:41', '2022-07-01 05:33:41'),
(6, 'Free Breakfast', '2022-07-01 05:33:52', '2022-07-01 05:33:52'),
(7, 'Free WiFi', '2022-07-01 05:34:00', '2022-07-01 05:34:00');

-- --------------------------------------------------------

--
-- Struktur dari tabel `booked_rooms`
--

CREATE TABLE `booked_rooms` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `booking_date` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `order_no` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `room_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `booked_rooms`
--

INSERT INTO `booked_rooms` (`id`, `booking_date`, `order_no`, `room_id`, `created_at`, `updated_at`) VALUES
(1, '08/08/2022', '1659579248', 1, NULL, NULL),
(2, '15/08/2022', '1659579248', 6, NULL, NULL),
(3, '16/08/2022', '1659579248', 6, NULL, NULL),
(4, '08/08/2022', '1659808495', 4, NULL, NULL),
(5, '09/08/2022', '1659808495', 4, NULL, NULL),
(6, '10/08/2022', '1659808495', 4, NULL, NULL),
(7, '04/09/2022', '1659923618', 4, '2022-08-07 19:53:38', '2022-08-07 19:53:38'),
(8, '12/09/2022', '1659923618', 5, '2022-08-07 19:53:38', '2022-08-07 19:53:38'),
(9, '13/09/2022', '1659923618', 5, '2022-08-07 19:53:38', '2022-08-07 19:53:38'),
(10, '14/09/2022', '1659923618', 5, '2022-08-07 19:53:39', '2022-08-07 19:53:39'),
(11, '15/09/2022', '1659923618', 5, '2022-08-07 19:53:39', '2022-08-07 19:53:39'),
(12, '10/09/2022', '1659954645', 5, '2022-08-08 04:30:45', '2022-08-08 04:30:45'),
(13, '11/09/2022', '1659954645', 5, '2022-08-08 04:30:45', '2022-08-08 04:30:45'),
(14, '12/09/2022', '1659954645', 5, '2022-08-08 04:30:45', '2022-08-08 04:30:45'),
(15, '18/10/2022', '1665914211', 6, '2022-10-16 02:56:52', '2022-10-16 02:56:52'),
(16, '18/10/2022', '1665914373', 6, '2022-10-16 02:59:34', '2022-10-16 02:59:34'),
(17, '18/10/2022', '1665914835', 6, '2022-10-16 03:07:17', '2022-10-16 03:07:17'),
(18, '18/10/2022', '1665916149', 1, '2022-10-16 03:29:09', '2022-10-16 03:29:09'),
(19, '24/10/2022', '1665916149', 4, '2022-10-16 03:29:09', '2022-10-16 03:29:09'),
(20, '18/10/2022', '1665916185', 1, '2022-10-16 03:29:46', '2022-10-16 03:29:46'),
(21, '24/10/2022', '1665916185', 4, '2022-10-16 03:29:46', '2022-10-16 03:29:46'),
(22, '17/10/2022', '1665919987', 6, '2022-10-16 04:33:08', '2022-10-16 04:33:08'),
(23, '16/10/2022', '1665923514', 6, '2022-10-16 05:31:54', '2022-10-16 05:31:54'),
(24, '16/10/2022', '1665925374', 6, '2022-10-16 06:02:54', '2022-10-16 06:02:54'),
(25, '16/10/2022', '1665925507', 6, '2022-10-16 06:05:07', '2022-10-16 06:05:07'),
(26, '16/10/2022', '1665925592', 6, '2022-10-16 06:06:32', '2022-10-16 06:06:32'),
(27, '16/10/2022', '1665926277', 6, '2022-10-16 06:17:58', '2022-10-16 06:17:58'),
(28, '16/10/2022', '1665926297', 6, '2022-10-16 06:18:17', '2022-10-16 06:18:17'),
(29, '16/10/2022', '1665926637', 6, '2022-10-16 06:23:57', '2022-10-16 06:23:57'),
(30, '17/10/2022', '1665936022', 6, '2022-10-16 09:00:23', '2022-10-16 09:00:23'),
(31, '17/10/2022', '1665936129', 6, '2022-10-16 09:02:10', '2022-10-16 09:02:10'),
(32, '17/10/2022', '1665936129', 4, '2022-10-16 09:02:10', '2022-10-16 09:02:10');

-- --------------------------------------------------------

--
-- Struktur dari tabel `customers`
--

CREATE TABLE `customers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `zip` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `photo` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `token` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `customers`
--

INSERT INTO `customers` (`id`, `name`, `email`, `password`, `phone`, `country`, `address`, `state`, `city`, `zip`, `photo`, `token`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Jago Software', 'jagosoftware@shopee.co.id', '$2y$10$AGjg.0tJB9tO1dtyFTipvOXy1vH3K12w7gRRUTqQjksJYJLeB5FS.', '082228412275', 'INDONESIA', 'JL. GATOTKACA', 'JAWA TENGAH', 'SRAGEN', '57218', '1665930575.jpg', '', 1, '2022-07-04 20:42:25', '2022-10-16 07:29:35'),
(2, 'Brent Grundy', 'brent@gmail.com', '$2y$10$7Mew3yq0cW598mqdeqHZBeClUR1OoOYDhqmx3Rfr.ce54HyWgBwaO', '111-222-3312', 'Australia', 'ABC Street', 'AN', 'Melbourne', '12345', '1659808452.jpg', '', 1, '2022-08-06 11:51:44', '2022-08-06 11:54:12'),
(3, 'Ricky Manual', 'ricky@gmail.com', '$2y$10$lLLefy/TbXvx31gSPeS8Be2SnBVeX207RPXoEveNV3LvrbtEJmb1e', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'f5c8d022f6123ef8554dffeb70e63ea87aa2223dbe330099c99c5cc237f61513', 0, '2022-08-06 18:56:53', '2022-08-06 18:56:53');

-- --------------------------------------------------------

--
-- Struktur dari tabel `failed_jobs`
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
-- Struktur dari tabel `faqs`
--

CREATE TABLE `faqs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `question` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `answer` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `faqs`
--

INSERT INTO `faqs` (`id`, `question`, `answer`, `created_at`, `updated_at`) VALUES
(1, 'Website Question 1', '<p>Lorem ipsum dolor sit amet, ut has quidam prodesset, eos sumo ipsum civibus ea, vel quas nusquam ei. Et sea doming quodsi audire. No vim ornatus scaevola disputando, qui stet ceteros ad. Ad his choro appetere mnesarchum, no duo accusata incorrupte, vel essent fabulas ut.</p><p>Ne nam soluta libris. Cu sea utamur adipiscing, convenire patrioque dignissim et nec. Accusam incorrupte vituperatoribus vix ad, ei clita omnium mentitum pro. Est ad duis perpetua recteque, in autem posidonium qui. Illum nulla dolor mea an.<br></p><p>Officiis disputationi ne pri, libris malorum eam id. Molestie principes vix no. Ut velit iudicabit inciderint mea. Malorum mediocrem deseruisse nam ne, tale imperdiet vim ut. Aperiri splendide cu eos, vis in alia laoreet aliquando.<br></p>', '2022-06-26 23:48:59', '2022-06-26 23:48:59'),
(2, 'Website Question 2', '<p>Lorem ipsum dolor sit amet, ut has quidam prodesset, eos sumo ipsum civibus ea, vel quas nusquam ei. Et sea doming quodsi audire. No vim ornatus scaevola disputando, qui stet ceteros ad. Ad his choro appetere mnesarchum, no duo accusata incorrupte, vel essent fabulas ut.</p><p>Ne nam soluta libris. Cu sea utamur adipiscing, convenire patrioque dignissim et nec. Accusam incorrupte vituperatoribus vix ad, ei clita omnium mentitum pro. Est ad duis perpetua recteque, in autem posidonium qui. Illum nulla dolor mea an.<br></p><p>Officiis disputationi ne pri, libris malorum eam id. Molestie principes vix no. Ut velit iudicabit inciderint mea. Malorum mediocrem deseruisse nam ne, tale imperdiet vim ut. Aperiri splendide cu eos, vis in alia laoreet aliquando.</p>', '2022-06-26 23:50:18', '2022-06-26 23:50:18'),
(3, 'Website Question 3', '<p>Lorem ipsum dolor sit amet, ut has quidam prodesset, eos sumo ipsum civibus ea, vel quas nusquam ei. Et sea doming quodsi audire. No vim ornatus scaevola disputando, qui stet ceteros ad. Ad his choro appetere mnesarchum, no duo accusata incorrupte, vel essent fabulas ut.</p><p>Ne nam soluta libris. Cu sea utamur adipiscing, convenire patrioque dignissim et nec. Accusam incorrupte vituperatoribus vix ad, ei clita omnium mentitum pro. Est ad duis perpetua recteque, in autem posidonium qui. Illum nulla dolor mea an.<br></p><p>Officiis disputationi ne pri, libris malorum eam id. Molestie principes vix no. Ut velit iudicabit inciderint mea. Malorum mediocrem deseruisse nam ne, tale imperdiet vim ut. Aperiri splendide cu eos, vis in alia laoreet aliquando.</p>', '2022-06-26 23:50:33', '2022-06-26 23:50:33'),
(4, 'Website Question 4', '<p>Lorem ipsum dolor sit amet, ut has quidam prodesset, eos sumo ipsum civibus ea, vel quas nusquam ei. Et sea doming quodsi audire. No vim ornatus scaevola disputando, qui stet ceteros ad. Ad his choro appetere mnesarchum, no duo accusata incorrupte, vel essent fabulas ut.</p><p>Ne nam soluta libris. Cu sea utamur adipiscing, convenire patrioque dignissim et nec. Accusam incorrupte vituperatoribus vix ad, ei clita omnium mentitum pro. Est ad duis perpetua recteque, in autem posidonium qui. Illum nulla dolor mea an.<br></p><p>Officiis disputationi ne pri, libris malorum eam id. Molestie principes vix no. Ut velit iudicabit inciderint mea. Malorum mediocrem deseruisse nam ne, tale imperdiet vim ut. Aperiri splendide cu eos, vis in alia laoreet aliquando.</p>', '2022-06-26 23:50:48', '2022-06-26 23:50:48');

-- --------------------------------------------------------

--
-- Struktur dari tabel `features`
--

CREATE TABLE `features` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `icon` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `heading` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `text` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `features`
--

INSERT INTO `features` (`id`, `icon`, `heading`, `text`, `created_at`, `updated_at`) VALUES
(1, 'fa fa-clock-o', '24 hour Room service', 'If you find a lower online rate, we will match it and give you an additional 25% off on your stay.', '2022-06-25 20:46:45', '2022-06-25 20:46:45'),
(2, 'fa fa-wifi', 'Free Wifi', 'If you find a lower online rate, we will match it and give you an additional 25% off on your stay.', '2022-06-25 20:48:09', '2022-06-25 20:48:09'),
(3, 'fa fa-superpowers', 'Enjoy Free Nights', 'If you find a lower online rate, we will match it and give you an additional 25% off on your stay.', '2022-06-25 20:48:35', '2022-06-25 20:48:35'),
(4, 'fa fa-cubes', 'Swimming Pool', 'If you find a lower online rate, we will match it and give you an additional 25% off on your stay.', '2022-06-25 20:49:00', '2022-06-25 21:03:56');

-- --------------------------------------------------------

--
-- Struktur dari tabel `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2022_02_18_035205_create_admins_table', 1),
(6, '2022_06_24_093653_create_slides_table', 2),
(7, '2022_06_26_021258_create_features_table', 3),
(8, '2022_06_26_033305_create_testimonials_table', 4),
(9, '2022_06_26_051426_create_posts_table', 5),
(10, '2022_06_26_135533_create_photos_table', 6),
(11, '2022_06_27_021908_create_videos_table', 7),
(12, '2022_06_27_050408_create_faqs_table', 8),
(13, '2022_06_27_104626_create_pages_table', 9),
(14, '2022_06_29_115954_create_subscribers_table', 10),
(15, '2022_07_01_104958_create_amenities_table', 11),
(16, '2022_07_02_005301_create_rooms_table', 12),
(17, '2022_07_02_010035_create_room_photos_table', 13),
(18, '2022_07_04_065843_create_customers_table', 14),
(19, '2022_07_13_034131_create_orders_table', 15),
(20, '2022_07_13_034641_create_order_details_table', 16),
(21, '2022_08_07_135954_create_booked_rooms_table', 17),
(22, '2022_08_08_120610_create_settings_table', 18);

-- --------------------------------------------------------

--
-- Struktur dari tabel `orders`
--

CREATE TABLE `orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `customer_id` int(11) NOT NULL,
  `order_no` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `transaction_id` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payment_method` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `snap_token` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bukti_pembayaran` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `card_last_digit` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `paid_amount` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `booking_date` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `orders`
--

INSERT INTO `orders` (`id`, `customer_id`, `order_no`, `transaction_id`, `payment_method`, `snap_token`, `bukti_pembayaran`, `card_last_digit`, `paid_amount`, `booking_date`, `status`, `created_at`, `updated_at`) VALUES
(36, 1, '1665916185', '1665916185', 'Midtrans', '69a005d6-7109-4dc9-bd30-8cf3e8121807', NULL, '', '1200000', '16/10/2022', 'Completed', '2022-10-16 03:29:46', '2022-10-16 04:30:48'),
(37, 1, '1665919987', '1665919987', 'Midtrans', '9885c88f-15ba-4913-9546-dffe1624ee81', NULL, '', '1100000', '16/10/2022', 'Completed', '2022-10-16 04:33:07', '2022-10-16 04:34:44'),
(44, 1, '1665926637', '1665926637', 'Bank Transfer', '', 'bukti_pembayaran/UDQBy5Fns0gBskaaCRXqZlPd8Qcs5YoL6cw0jgQC.jpg', '', '1100000', '16/10/2022', 'Completed', '2022-10-16 06:23:57', '2022-10-16 20:07:53'),
(45, 1, '1665936022', '1665936022', 'Midtrans', '06624799-05a5-48d1-929b-a585671d7e49', NULL, '', '1850000', '16/10/2022', 'Completed', '2022-10-16 09:00:22', '2022-10-16 09:15:29'),
(46, 1, '1665936129', '1665936129', 'Midtrans', 'ba48258a-6f4b-47c7-9c2e-e3047078c843', NULL, '', '1850000', '16/10/2022', 'Completed', '2022-10-16 09:02:10', '2022-10-16 09:06:11');

-- --------------------------------------------------------

--
-- Struktur dari tabel `order_details`
--

CREATE TABLE `order_details` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_id` int(11) NOT NULL,
  `room_id` int(11) NOT NULL,
  `order_no` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `checkin_date` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `checkout_date` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `adult` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `children` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `subtotal` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `order_details`
--

INSERT INTO `order_details` (`id`, `order_id`, `room_id`, `order_no`, `checkin_date`, `checkout_date`, `adult`, `children`, `subtotal`, `created_at`, `updated_at`) VALUES
(14, 36, 1, '1665916185', '18/10/2022', '19/10/2022', '3', '2', '5', '2022-10-16 03:29:46', '2022-10-16 03:29:46'),
(15, 36, 4, '1665916185', '24/10/2022', '25/10/2022', '2', '1', '7', '2022-10-16 03:29:46', '2022-10-16 03:29:46'),
(23, 44, 6, '1665926637', '16/10/2022', '17/10/2022', '1', '1', '11', '2022-10-16 06:23:57', '2022-10-16 06:23:57'),
(24, 45, 6, '1665936022', '17/10/2022', '18/10/2022', '2', '2', '1100000', '2022-10-16 09:00:22', '2022-10-16 09:00:22'),
(25, 46, 6, '1665936129', '17/10/2022', '18/10/2022', '2', '2', '1100000', '2022-10-16 09:02:10', '2022-10-16 09:02:10'),
(26, 46, 4, '1665936129', '17/10/2022', '18/10/2022', '1', '0', '750000', '2022-10-16 09:02:10', '2022-10-16 09:02:10');

-- --------------------------------------------------------

--
-- Struktur dari tabel `pages`
--

CREATE TABLE `pages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `about_heading` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `about_content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `about_status` int(11) NOT NULL,
  `terms_heading` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `terms_content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `terms_status` int(11) NOT NULL,
  `privacy_heading` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `privacy_content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `privacy_status` int(11) NOT NULL,
  `contact_heading` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `contact_map` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `contact_status` int(11) NOT NULL,
  `photo_gallery_heading` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `photo_gallery_status` int(11) NOT NULL,
  `video_gallery_heading` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `video_gallery_status` int(11) NOT NULL,
  `faq_heading` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `faq_status` int(11) NOT NULL,
  `blog_heading` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `blog_status` int(11) NOT NULL,
  `room_heading` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `cart_heading` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `cart_status` int(11) NOT NULL,
  `checkout_heading` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `checkout_status` int(11) NOT NULL,
  `payment_heading` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `signup_heading` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `signup_status` int(11) NOT NULL,
  `signin_heading` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `signin_status` int(11) NOT NULL,
  `forget_password_heading` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `reset_password_heading` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `pages`
--

INSERT INTO `pages` (`id`, `about_heading`, `about_content`, `about_status`, `terms_heading`, `terms_content`, `terms_status`, `privacy_heading`, `privacy_content`, `privacy_status`, `contact_heading`, `contact_map`, `contact_status`, `photo_gallery_heading`, `photo_gallery_status`, `video_gallery_heading`, `video_gallery_status`, `faq_heading`, `faq_status`, `blog_heading`, `blog_status`, `room_heading`, `cart_heading`, `cart_status`, `checkout_heading`, `checkout_status`, `payment_heading`, `signup_heading`, `signup_status`, `signin_heading`, `signin_status`, `forget_password_heading`, `reset_password_heading`, `created_at`, `updated_at`) VALUES
(1, 'About Us', '<div>Lorem ipsum dolor sit amet consectetur adipisicing elit. Hic iure delectus, aperiam eius sed suscipit corporis quas, nisi dicta harum excepturi quis est id deserunt a, ipsa autem in distinctio. Lorem ipsum dolor sit amet consectetur adipisicing elit. Hic iure delectus, aperiam eius sed suscipit corporis quas, nisi dicta harum excepturi quis est id deserunt a, ipsa autem in distinctio.</div><div><br></div><div>Lorem ipsum dolor sit amet consectetur adipisicing elit. Hic iure delectus, aperiam eius sed suscipit corporis quas, nisi dicta harum excepturi quis est id deserunt a, ipsa autem in distinctio. Lorem ipsum dolor sit amet consectetur adipisicing elit. Hic iure delectus, aperiam eius sed suscipit corporis quas, nisi dicta harum excepturi quis est id deserunt a, ipsa autem in distinctio.</div><div><br></div><div>Lorem ipsum dolor sit amet consectetur adipisicing elit. Hic iure delectus, aperiam eius sed suscipit corporis quas, nisi dicta harum excepturi quis est id deserunt a, ipsa autem in distinctio. Lorem ipsum dolor sit amet consectetur adipisicing elit. Hic iure delectus, aperiam eius sed suscipit corporis quas, nisi dicta harum excepturi quis est id deserunt a, ipsa autem in distinctio.</div><div><br></div><div>Lorem ipsum dolor sit amet consectetur adipisicing elit. Hic iure delectus, aperiam eius sed suscipit corporis quas, nisi dicta harum excepturi quis est id deserunt a, ipsa autem in distinctio. Lorem ipsum dolor sit amet consectetur adipisicing elit. Hic iure delectus, aperiam eius sed suscipit corporis quas, nisi dicta harum excepturi quis est id deserunt a, ipsa autem in distinctio.</div>', 1, 'Terms and Conditions', '<div>Lorem ipsum dolor sit amet consectetur adipisicing elit. Hic iure delectus, aperiam eius sed suscipit corporis quas, nisi dicta harum excepturi quis est id deserunt a, ipsa autem in distinctio. Lorem ipsum dolor sit amet consectetur adipisicing elit. Hic iure delectus, aperiam eius sed suscipit corporis quas, nisi dicta harum excepturi quis est id deserunt a, ipsa autem in distinctio.</div><div><br></div><div>Lorem ipsum dolor sit amet consectetur adipisicing elit. Hic iure delectus, aperiam eius sed suscipit corporis quas, nisi dicta harum excepturi quis est id deserunt a, ipsa autem in distinctio. Lorem ipsum dolor sit amet consectetur adipisicing elit. Hic iure delectus, aperiam eius sed suscipit corporis quas, nisi dicta harum excepturi quis est id deserunt a, ipsa autem in distinctio.</div><div><br></div><div>Lorem ipsum dolor sit amet consectetur adipisicing elit. Hic iure delectus, aperiam eius sed suscipit corporis quas, nisi dicta harum excepturi quis est id deserunt a, ipsa autem in distinctio. Lorem ipsum dolor sit amet consectetur adipisicing elit. Hic iure delectus, aperiam eius sed suscipit corporis quas, nisi dicta harum excepturi quis est id deserunt a, ipsa autem in distinctio.</div><div><br></div><div>Lorem ipsum dolor sit amet consectetur adipisicing elit. Hic iure delectus, aperiam eius sed suscipit corporis quas, nisi dicta harum excepturi quis est id deserunt a, ipsa autem in distinctio. Lorem ipsum dolor sit amet consectetur adipisicing elit. Hic iure delectus, aperiam eius sed suscipit corporis quas, nisi dicta harum excepturi quis est id deserunt a, ipsa autem in distinctio.</div>', 1, 'Privacy Policy', '<div>Lorem ipsum dolor sit amet consectetur adipisicing elit. Hic iure delectus, aperiam eius sed suscipit corporis quas, nisi dicta harum excepturi quis est id deserunt a, ipsa autem in distinctio. Lorem ipsum dolor sit amet consectetur adipisicing elit. Hic iure delectus, aperiam eius sed suscipit corporis quas, nisi dicta harum excepturi quis est id deserunt a, ipsa autem in distinctio.</div><div><br></div><div>Lorem ipsum dolor sit amet consectetur adipisicing elit. Hic iure delectus, aperiam eius sed suscipit corporis quas, nisi dicta harum excepturi quis est id deserunt a, ipsa autem in distinctio. Lorem ipsum dolor sit amet consectetur adipisicing elit. Hic iure delectus, aperiam eius sed suscipit corporis quas, nisi dicta harum excepturi quis est id deserunt a, ipsa autem in distinctio.</div><div><br></div><div>Lorem ipsum dolor sit amet consectetur adipisicing elit. Hic iure delectus, aperiam eius sed suscipit corporis quas, nisi dicta harum excepturi quis est id deserunt a, ipsa autem in distinctio. Lorem ipsum dolor sit amet consectetur adipisicing elit. Hic iure delectus, aperiam eius sed suscipit corporis quas, nisi dicta harum excepturi quis est id deserunt a, ipsa autem in distinctio.</div><div><br></div><div>Lorem ipsum dolor sit amet consectetur adipisicing elit. Hic iure delectus, aperiam eius sed suscipit corporis quas, nisi dicta harum excepturi quis est id deserunt a, ipsa autem in distinctio. Lorem ipsum dolor sit amet consectetur adipisicing elit. Hic iure delectus, aperiam eius sed suscipit corporis quas, nisi dicta harum excepturi quis est id deserunt a, ipsa autem in distinctio.</div>', 1, 'Contact', '<iframe src=\"https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d26361688.302253906!2d-113.76378198869888!3d36.23999124494682!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x54eab584e432360b%3A0x1c3bb99243deb742!2sUnited%20States!5e0!3m2!1sen!2sbd!4v1656378870953!5m2!1sen!2sbd\" width=\"600\" height=\"450\" style=\"border:0;\" allowfullscreen=\"\" loading=\"lazy\" referrerpolicy=\"no-referrer-when-downgrade\"></iframe>', 1, 'Photo Gallery', 1, 'Video Gallery', 1, 'FAQ', 1, 'Blog', 1, 'Room', 'Cart', 1, 'Checkout', 1, 'Payment', 'Sign Up', 1, 'Sign In', 1, 'Forget Password', 'Reset Password', NULL, '2022-07-05 03:47:40');

-- --------------------------------------------------------

--
-- Struktur dari tabel `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `personal_access_tokens`
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
-- Struktur dari tabel `photos`
--

CREATE TABLE `photos` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `photo` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `caption` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `photos`
--

INSERT INTO `photos` (`id`, `photo`, `caption`, `created_at`, `updated_at`) VALUES
(1, '1656253670.jpg', 'Sample Photo Caption 1', '2022-06-26 08:17:41', '2022-06-26 08:27:50'),
(2, '1656253091.jpg', 'Sample Photo Caption 2', '2022-06-26 08:18:11', '2022-06-26 08:18:11'),
(3, '1656253123.jpg', 'Sample Photo Caption 3', '2022-06-26 08:18:43', '2022-06-26 08:18:43'),
(4, '1656253133.jpg', 'Sample Photo Caption 4', '2022-06-26 08:18:53', '2022-06-26 08:18:53');

-- --------------------------------------------------------

--
-- Struktur dari tabel `posts`
--

CREATE TABLE `posts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `photo` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `heading` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `short_content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_view` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `posts`
--

INSERT INTO `posts` (`id`, `photo`, `heading`, `short_content`, `content`, `total_view`, `created_at`, `updated_at`) VALUES
(1, '1656243079.jpg', 'Sample post title 1', 'If you want to get some good contents from the people of your country then just contribute into the main community of your people and I am sure you will be benfitted from that.', '<p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Hic iure delectus, aperiam eius sed suscipit corporis quas, nisi dicta harum excepturi quis est id deserunt a, ipsa autem in distinctio. Lorem ipsum dolor sit amet consectetur adipisicing elit. Hic iure delectus, aperiam eius sed suscipit corporis quas, nisi dicta harum excepturi quis est id deserunt a, ipsa autem in distinctio.</p><p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Hic iure delectus, aperiam eius sed suscipit corporis quas, nisi dicta harum excepturi quis est id deserunt a, ipsa autem in distinctio. Lorem ipsum dolor sit amet consectetur adipisicing elit. Hic iure delectus, aperiam eius sed suscipit corporis quas, nisi dicta harum excepturi quis est id deserunt a, ipsa autem in distinctio.<br></p><p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Hic iure delectus, aperiam eius sed suscipit corporis quas, nisi dicta harum excepturi quis est id deserunt a, ipsa autem in distinctio. Lorem ipsum dolor sit amet consectetur adipisicing elit. Hic iure delectus, aperiam eius sed suscipit corporis quas, nisi dicta harum excepturi quis est id deserunt a, ipsa autem in distinctio.<br></p><p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Hic iure delectus, aperiam eius sed suscipit corporis quas, nisi dicta harum excepturi quis est id deserunt a, ipsa autem in distinctio. Lorem ipsum dolor sit amet consectetur adipisicing elit. Hic iure delectus, aperiam eius sed suscipit corporis quas, nisi dicta harum excepturi quis est id deserunt a, ipsa autem in distinctio.<br></p>', 1, '2022-06-26 01:27:07', '2022-06-26 05:31:19'),
(2, '1656243178.jpg', 'Sample post title 2', 'If you want to get some good contents from the people of your country then just contribute into the main community of your people and I am sure you will be benfitted from that.', '<p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Hic iure delectus, aperiam eius sed suscipit corporis quas, nisi dicta harum excepturi quis est id deserunt a, ipsa autem in distinctio. Lorem ipsum dolor sit amet consectetur adipisicing elit. Hic iure delectus, aperiam eius sed suscipit corporis quas, nisi dicta harum excepturi quis est id deserunt a, ipsa autem in distinctio.</p><p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Hic iure delectus, aperiam eius sed suscipit corporis quas, nisi dicta harum excepturi quis est id deserunt a, ipsa autem in distinctio. Lorem ipsum dolor sit amet consectetur adipisicing elit. Hic iure delectus, aperiam eius sed suscipit corporis quas, nisi dicta harum excepturi quis est id deserunt a, ipsa autem in distinctio.<br></p><p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Hic iure delectus, aperiam eius sed suscipit corporis quas, nisi dicta harum excepturi quis est id deserunt a, ipsa autem in distinctio. Lorem ipsum dolor sit amet consectetur adipisicing elit. Hic iure delectus, aperiam eius sed suscipit corporis quas, nisi dicta harum excepturi quis est id deserunt a, ipsa autem in distinctio.<br></p><p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Hic iure delectus, aperiam eius sed suscipit corporis quas, nisi dicta harum excepturi quis est id deserunt a, ipsa autem in distinctio. Lorem ipsum dolor sit amet consectetur adipisicing elit. Hic iure delectus, aperiam eius sed suscipit corporis quas, nisi dicta harum excepturi quis est id deserunt a, ipsa autem in distinctio.</p>', 20, '2022-06-26 05:32:58', '2022-10-16 06:56:46'),
(4, '1656244014.jpg', 'Sample post title 3', 'If you want to get some good contents from the people of your country then just contribute into the main community of your people and I am sure you will be benfitted from that.', '<p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Hic iure delectus, aperiam eius sed suscipit corporis quas, nisi dicta harum excepturi quis est id deserunt a, ipsa autem in distinctio. Lorem ipsum dolor sit amet consectetur adipisicing elit. Hic iure delectus, aperiam eius sed suscipit corporis quas, nisi dicta harum excepturi quis est id deserunt a, ipsa autem in distinctio.</p><p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Hic iure delectus, aperiam eius sed suscipit corporis quas, nisi dicta harum excepturi quis est id deserunt a, ipsa autem in distinctio. Lorem ipsum dolor sit amet consectetur adipisicing elit. Hic iure delectus, aperiam eius sed suscipit corporis quas, nisi dicta harum excepturi quis est id deserunt a, ipsa autem in distinctio.<br></p><p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Hic iure delectus, aperiam eius sed suscipit corporis quas, nisi dicta harum excepturi quis est id deserunt a, ipsa autem in distinctio. Lorem ipsum dolor sit amet consectetur adipisicing elit. Hic iure delectus, aperiam eius sed suscipit corporis quas, nisi dicta harum excepturi quis est id deserunt a, ipsa autem in distinctio.<br></p><p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Hic iure delectus, aperiam eius sed suscipit corporis quas, nisi dicta harum excepturi quis est id deserunt a, ipsa autem in distinctio. Lorem ipsum dolor sit amet consectetur adipisicing elit. Hic iure delectus, aperiam eius sed suscipit corporis quas, nisi dicta harum excepturi quis est id deserunt a, ipsa autem in distinctio.</p>', 4, '2022-06-26 05:46:54', '2022-10-16 09:14:01');

-- --------------------------------------------------------

--
-- Struktur dari tabel `rekening`
--

CREATE TABLE `rekening` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `bank_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `atas_nama` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `no_rekening` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `rekening`
--

INSERT INTO `rekening` (`id`, `bank_name`, `atas_nama`, `no_rekening`, `created_at`, `updated_at`) VALUES
(1, 'BRIAJA', 'JAGO SOFTWARE', '36214579', NULL, '2022-06-09 02:29:48'),
(3, 'BRISYARIAH', 'JAGO SOFTWARE', '321546578', '2020-03-22 08:35:31', '2022-06-09 02:29:43'),
(4, 'BCA', 'JAGO SOFTWARE', '1234567899', '2020-03-24 17:22:37', '2022-06-09 02:29:57'),
(5, 'BNI', 'JAGO SOFTWARE', '12345679', '2020-03-24 17:23:12', '2022-06-09 02:29:52');

-- --------------------------------------------------------

--
-- Struktur dari tabel `rooms`
--

CREATE TABLE `rooms` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_rooms` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `amenities` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `size` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `total_beds` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `total_bathrooms` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `total_balconies` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `total_guests` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `featured_photo` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `video_id` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `rooms`
--

INSERT INTO `rooms` (`id`, `name`, `description`, `price`, `total_rooms`, `amenities`, `size`, `total_beds`, `total_bathrooms`, `total_balconies`, `total_guests`, `featured_photo`, `video_id`, `created_at`, `updated_at`) VALUES
(1, 'Standard Single Room', '<div>Lorem ipsum dolor sit amet, suscipit dissentiunt usu at, eu nam veri vidit signiferumque. Ad mea erat fabellas, et facete everti eum, tation consul ea ius. Autem feugiat maiorum id sea. Est omnis mediocrem assentior ea. Nam ubique possit verterem ea, cum facer scriptorem an.</div><div><br></div><div>Equidem legendos duo ei, et legimus offendit mei. Mea amet tibique explicari ne. Nam blandit patrioque comprehensam an, sed in errem omnes partem. No quo impedit percipit comprehensam, ei dolores intellegam pro, et sed quaeque temporibus referrentur. Quodsi causae dissentias in pri, idque ridens cum an. Vis in facilisi conclusionemque, eu est erant affert veritus. Id qui quodsi iriure quaestio, omittam praesent ne sea, postulant consetetur definitiones an nec.</div>', '500000', '5', '4,5,6,7', '100 sqm2', '1', '1', '1', '2', '1656742387.jpg', 'Z9qcPtIO5xc', '2022-07-01 21:12:23', '2022-07-12 21:05:14'),
(4, 'Standard Couple Room', '<div>Lorem ipsum dolor sit amet, suscipit dissentiunt usu at, eu nam veri vidit signiferumque. Ad mea erat fabellas, et facete everti eum, tation consul ea ius. Autem feugiat maiorum id sea. Est omnis mediocrem assentior ea. Nam ubique possit verterem ea, cum facer scriptorem an.</div><div><br></div><div>Equidem legendos duo ei, et legimus offendit mei. Mea amet tibique explicari ne. Nam blandit patrioque comprehensam an, sed in errem omnes partem. No quo impedit percipit comprehensam, ei dolores intellegam pro, et sed quaeque temporibus referrentur. Quodsi causae dissentias in pri, idque ridens cum an. Vis in facilisi conclusionemque, eu est erant affert veritus. Id qui quodsi iriure quaestio, omittam praesent ne sea, postulant consetetur definitiones an nec.</div>', '750000', '3', '1,2,6,7', '150 sqm2', '1', '1', '2', '2', '1656856962.jpg', 'NaiObfdiGAs', '2022-07-03 08:02:42', '2022-07-12 21:05:22'),
(5, 'Standard Double Room', '<div>Lorem ipsum dolor sit amet, suscipit dissentiunt usu at, eu nam veri vidit signiferumque. Ad mea erat fabellas, et facete everti eum, tation consul ea ius. Autem feugiat maiorum id sea. Est omnis mediocrem assentior ea. Nam ubique possit verterem ea, cum facer scriptorem an.</div><div><br></div><div>Equidem legendos duo ei, et legimus offendit mei. Mea amet tibique explicari ne. Nam blandit patrioque comprehensam an, sed in errem omnes partem. No quo impedit percipit comprehensam, ei dolores intellegam pro, et sed quaeque temporibus referrentur. Quodsi causae dissentias in pri, idque ridens cum an. Vis in facilisi conclusionemque, eu est erant affert veritus. Id qui quodsi iriure quaestio, omittam praesent ne sea, postulant consetetur definitiones an nec.</div>', '900000', '2', '1,2,3,4,6,7', '200 sqm2', '2', '2', '2', '4', '1656857161.jpg', 'Vn1HO-8tLHE', '2022-07-03 08:06:01', '2022-08-08 04:44:23'),
(6, 'VIP Room', '<div>Lorem ipsum dolor sit amet, suscipit dissentiunt usu at, eu nam veri vidit signiferumque. Ad mea erat fabellas, et facete everti eum, tation consul ea ius. Autem feugiat maiorum id sea. Est omnis mediocrem assentior ea. Nam ubique possit verterem ea, cum facer scriptorem an.</div><div><br></div><div>Equidem legendos duo ei, et legimus offendit mei. Mea amet tibique explicari ne. Nam blandit patrioque comprehensam an, sed in errem omnes partem. No quo impedit percipit comprehensam, ei dolores intellegam pro, et sed quaeque temporibus referrentur. Quodsi causae dissentias in pri, idque ridens cum an. Vis in facilisi conclusionemque, eu est erant affert veritus. Id qui quodsi iriure quaestio, omittam praesent ne sea, postulant consetetur definitiones an nec.</div>', '1100000', '3', '1,2,3,4,5,6,7', '300 sqm2', '3', '2', '2', '6', '1656857263.jpg', 'XwdICDkbuxk', '2022-07-03 08:07:43', '2022-07-12 21:05:40');

-- --------------------------------------------------------

--
-- Struktur dari tabel `room_photos`
--

CREATE TABLE `room_photos` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `room_id` int(11) NOT NULL,
  `photo` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `room_photos`
--

INSERT INTO `room_photos` (`id`, `room_id`, `photo`, `created_at`, `updated_at`) VALUES
(1, 1, '1656809278.jpg', '2022-07-02 18:47:58', '2022-07-02 18:47:58'),
(2, 1, '1656809295.jpg', '2022-07-02 18:48:15', '2022-07-02 18:48:15');

-- --------------------------------------------------------

--
-- Struktur dari tabel `settings`
--

CREATE TABLE `settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `logo` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `favicon` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `top_bar_phone` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `top_bar_email` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `home_feature_status` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `home_room_total` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `home_room_status` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `home_testimonial_status` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `home_latest_post_total` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `home_latest_post_status` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `footer_address` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `footer_phone` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `footer_email` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `copyright` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `facebook` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `twitter` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `linkedin` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pinterest` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `theme_color_1` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `theme_color_2` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `analytic_id` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `settings`
--

INSERT INTO `settings` (`id`, `logo`, `favicon`, `top_bar_phone`, `top_bar_email`, `home_feature_status`, `home_room_total`, `home_room_status`, `home_testimonial_status`, `home_latest_post_total`, `home_latest_post_status`, `footer_address`, `footer_phone`, `footer_email`, `copyright`, `facebook`, `twitter`, `linkedin`, `pinterest`, `theme_color_1`, `theme_color_2`, `analytic_id`, `created_at`, `updated_at`) VALUES
(1, '1665931829.png', '1659970382.png', '085800084682', 'nasrulkurniawan@gmail.com', 'Show', '4', 'Show', 'Show', '3', 'Show', 'Sidoharjo, Sragen, Jawa Tengah', '085800084682', 'nasrulkurniawan@gmail.com', 'Copyright 2022, Jago Hotel. All Rights Reserved.', 'https://www.facebook.com', 'https://www.twitter.com', 'https://www.linkedin.com', 'https://www.pinterest.com', '#00215B', '#ffd3ce', 'UA-84213520-6', NULL, '2022-10-16 07:50:29');

-- --------------------------------------------------------

--
-- Struktur dari tabel `slides`
--

CREATE TABLE `slides` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `photo` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `heading` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `text` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `button_text` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `button_url` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `slides`
--

INSERT INTO `slides` (`id`, `photo`, `heading`, `text`, `button_text`, `button_url`, `created_at`, `updated_at`) VALUES
(1, '1665933473.png', 'BEST HOTEL IN THE CITY', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Deserunt libero voluptate, veritatis esse dolorem soluta.', 'Read More', '#', '2022-06-25 02:04:35', '2022-10-16 08:17:53'),
(2, '1656153485.jpg', 'QUALITY ROOMS FOR THE GUESTS', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Deserunt libero voluptate, veritatis esse dolorem soluta.', 'Read More', '#', '2022-06-25 02:06:09', '2022-06-25 04:38:05'),
(4, '1665933609.jpg', 'BEST HOTEL IN THE CITY', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Deserunt libero voluptate, veritatis esse dolorem soluta', 'Read More', '#', '2022-10-16 08:20:09', '2022-10-16 08:20:09');

-- --------------------------------------------------------

--
-- Struktur dari tabel `subscribers`
--

CREATE TABLE `subscribers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `email` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `subscribers`
--

INSERT INTO `subscribers` (`id`, `email`, `token`, `status`, `created_at`, `updated_at`) VALUES
(1, 'aa@gmail.com', '', 1, '2022-06-29 06:12:46', '2022-06-29 08:14:51'),
(2, 'bb@gmail.com', '', 1, '2022-06-29 08:16:18', '2022-06-29 08:16:47'),
(3, 'cc@gmail.com', '89c61eac3132dbf53502d5e17d51bfb523eaa9dfe0a06c21a08f6ee6c185bfb6', 0, '2022-06-29 18:06:54', '2022-06-29 18:06:54');

-- --------------------------------------------------------

--
-- Struktur dari tabel `testimonials`
--

CREATE TABLE `testimonials` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `photo` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `designation` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `comment` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `testimonials`
--

INSERT INTO `testimonials` (`id`, `photo`, `name`, `designation`, `comment`, `created_at`, `updated_at`) VALUES
(1, '1656215578.jpg', 'Robert Peter', 'CEO, AA Company', 'Lorem ipsum dolor sit amet, an labores explicari qui, eu nostrum copiosae argumentum has. Latine propriae quo no, unum ridens. Lorem ipsum dolor sit amet, an labores explicari qui, eu nostrum copiosae argumentum has. Latine propriae quo no, unum ridens.', '2022-06-25 21:52:58', '2022-06-25 21:52:58'),
(2, '1665930645.jpg', 'Nasrul Kurniawan', 'Dinas Sosial', 'Lorem ipsum dolor sit amet, an labores explicari qui, eu nostrum copiosae argumentum has. Latine propriae quo no, unum ridens. Lorem ipsum dolor sit amet, an labores explicari qui, eu nostrum copiosae argumentum has. Latine propriae quo no, unum ridens.', '2022-06-25 21:54:48', '2022-10-16 07:30:45');

-- --------------------------------------------------------

--
-- Struktur dari tabel `users`
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
-- Dumping data untuk tabel `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Jago Software', 'jagosoftware@shopee.co.id', '2022-10-10 06:50:33', '$2y$10$4PribkSBygvCFsEu6nyZcex2XVsZYP6qlI/l3qzqaghvhqH.UNqJi', NULL, '2022-09-09 13:22:47', '2022-09-09 13:22:47');

-- --------------------------------------------------------

--
-- Struktur dari tabel `videos`
--

CREATE TABLE `videos` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `video_id` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `caption` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `videos`
--

INSERT INTO `videos` (`id`, `video_id`, `caption`, `created_at`, `updated_at`) VALUES
(1, 'xfvQN-T2OiY', 'The Gstaad Palace Hotel (Switzerland) | An ultra-luxe winter getaway', '2022-06-26 20:53:46', '2022-06-26 20:53:46'),
(2, '4K6Sh1tsAW4', 'Cinematic Promo Video | Lisbon City Hotel', '2022-06-26 20:56:19', '2022-06-26 20:56:19'),
(3, '5u1WISBbo5I', 'Malak Regency a Luxury Hotel', '2022-06-26 20:56:47', '2022-06-26 20:56:47'),
(4, '9I2xta0ahIs', 'Hilton Bali Resort', '2022-06-26 20:57:23', '2022-06-26 20:57:23');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `amenities`
--
ALTER TABLE `amenities`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `booked_rooms`
--
ALTER TABLE `booked_rooms`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indeks untuk tabel `faqs`
--
ALTER TABLE `faqs`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `features`
--
ALTER TABLE `features`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `order_details`
--
ALTER TABLE `order_details`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `pages`
--
ALTER TABLE `pages`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indeks untuk tabel `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indeks untuk tabel `photos`
--
ALTER TABLE `photos`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `rekening`
--
ALTER TABLE `rekening`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `rooms`
--
ALTER TABLE `rooms`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `room_photos`
--
ALTER TABLE `room_photos`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `slides`
--
ALTER TABLE `slides`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `subscribers`
--
ALTER TABLE `subscribers`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `testimonials`
--
ALTER TABLE `testimonials`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indeks untuk tabel `videos`
--
ALTER TABLE `videos`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `admins`
--
ALTER TABLE `admins`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `amenities`
--
ALTER TABLE `amenities`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT untuk tabel `booked_rooms`
--
ALTER TABLE `booked_rooms`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT untuk tabel `customers`
--
ALTER TABLE `customers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `faqs`
--
ALTER TABLE `faqs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT untuk tabel `features`
--
ALTER TABLE `features`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT untuk tabel `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT untuk tabel `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;

--
-- AUTO_INCREMENT untuk tabel `order_details`
--
ALTER TABLE `order_details`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT untuk tabel `pages`
--
ALTER TABLE `pages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `photos`
--
ALTER TABLE `photos`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT untuk tabel `posts`
--
ALTER TABLE `posts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `rekening`
--
ALTER TABLE `rekening`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT untuk tabel `rooms`
--
ALTER TABLE `rooms`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT untuk tabel `room_photos`
--
ALTER TABLE `room_photos`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT untuk tabel `settings`
--
ALTER TABLE `settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `slides`
--
ALTER TABLE `slides`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `subscribers`
--
ALTER TABLE `subscribers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `testimonials`
--
ALTER TABLE `testimonials`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `videos`
--
ALTER TABLE `videos`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
