-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Waktu pembuatan: 20 Jan 2023 pada 03.40
-- Versi server: 8.0.31
-- Versi PHP: 8.1.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `admin-ci4`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `auth_activation_attempts`
--

DROP TABLE IF EXISTS `auth_activation_attempts`;
CREATE TABLE IF NOT EXISTS `auth_activation_attempts` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `ip_address` varchar(255) NOT NULL,
  `user_agent` varchar(255) NOT NULL,
  `token` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;

--
-- Dumping data untuk tabel `auth_activation_attempts`
--

INSERT INTO `auth_activation_attempts` (`id`, `ip_address`, `user_agent`, `token`, `created_at`) VALUES
(1, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', '6a16ea4e74d9e1193adc3fdc172c1605', '2022-12-13 04:22:56');

-- --------------------------------------------------------

--
-- Struktur dari tabel `auth_groups`
--

DROP TABLE IF EXISTS `auth_groups`;
CREATE TABLE IF NOT EXISTS `auth_groups` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;

--
-- Dumping data untuk tabel `auth_groups`
--

INSERT INTO `auth_groups` (`id`, `name`, `description`) VALUES
(1, 'administrator', 'Administrator'),
(2, 'user', 'User');

-- --------------------------------------------------------

--
-- Struktur dari tabel `auth_groups_permissions`
--

DROP TABLE IF EXISTS `auth_groups_permissions`;
CREATE TABLE IF NOT EXISTS `auth_groups_permissions` (
  `group_id` int UNSIGNED NOT NULL DEFAULT '0',
  `permission_id` int UNSIGNED NOT NULL DEFAULT '0',
  KEY `auth_groups_permissions_permission_id_foreign` (`permission_id`),
  KEY `group_id_permission_id` (`group_id`,`permission_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Struktur dari tabel `auth_groups_users`
--

DROP TABLE IF EXISTS `auth_groups_users`;
CREATE TABLE IF NOT EXISTS `auth_groups_users` (
  `group_id` int UNSIGNED NOT NULL DEFAULT '0',
  `user_id` int UNSIGNED NOT NULL DEFAULT '0',
  KEY `auth_groups_users_user_id_foreign` (`user_id`),
  KEY `group_id_user_id` (`group_id`,`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

--
-- Dumping data untuk tabel `auth_groups_users`
--

INSERT INTO `auth_groups_users` (`group_id`, `user_id`) VALUES
(1, 3),
(2, 4),
(2, 5);

-- --------------------------------------------------------

--
-- Struktur dari tabel `auth_logins`
--

DROP TABLE IF EXISTS `auth_logins`;
CREATE TABLE IF NOT EXISTS `auth_logins` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `ip_address` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `user_id` int UNSIGNED DEFAULT NULL,
  `date` datetime NOT NULL,
  `success` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `email` (`email`),
  KEY `user_id` (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=37 DEFAULT CHARSET=utf8mb3;

--
-- Dumping data untuk tabel `auth_logins`
--

INSERT INTO `auth_logins` (`id`, `ip_address`, `email`, `user_id`, `date`, `success`) VALUES
(1, '::1', 'isyaau@gmail.com', 3, '2022-12-13 04:23:15', 1),
(2, '::1', 'isak.akhsanil@gmail.com', NULL, '2023-01-06 01:44:58', 0),
(3, '::1', 'isak.akhsanil@gmail.com', NULL, '2023-01-06 01:45:31', 0),
(4, '::1', 'isyaau@gmail.com', NULL, '2023-01-06 01:46:22', 0),
(5, '::1', 'isyaau@gmail.com', 3, '2023-01-06 01:46:36', 1),
(6, '::1', 'isyaau@gmail.com', NULL, '2023-01-06 01:58:25', 0),
(7, '::1', 'isyaau@gmail.com', NULL, '2023-01-06 01:58:34', 0),
(8, '::1', 'isyaau@gmail.com', NULL, '2023-01-06 01:58:47', 0),
(9, '::1', 'isyaau@gmail.com', 3, '2023-01-06 01:58:55', 1),
(10, '::1', 'isyaau@gmail.com', NULL, '2023-01-06 07:13:15', 0),
(11, '::1', 'isyaau@gmail.com', NULL, '2023-01-06 07:14:48', 0),
(12, '::1', 'isyaau@gmail.com', NULL, '2023-01-06 07:14:56', 0),
(13, '::1', 'isyaau@gmail.com', NULL, '2023-01-06 07:15:06', 0),
(14, '::1', 'isyaau@gmail.com', NULL, '2023-01-06 07:15:17', 0),
(15, '::1', 'isyaau@gmail.com', NULL, '2023-01-06 07:15:29', 0),
(16, '::1', 'isyaau@gmail.com', NULL, '2023-01-06 07:15:38', 0),
(17, '::1', 'isyaau@gmail.com', NULL, '2023-01-06 07:17:35', 0),
(18, '::1', 'isyaau@gmail.com', NULL, '2023-01-06 07:17:44', 0),
(19, '::1', 'isyaau@gmail.com', NULL, '2023-01-06 07:19:28', 0),
(20, '::1', 'isyaau@gmail.com', NULL, '2023-01-06 07:19:42', 0),
(21, '::1', 'isyaau@gmail.com', NULL, '2023-01-06 07:19:52', 0),
(22, '::1', 'isyaau@gmail.com', NULL, '2023-01-06 07:20:55', 0),
(23, '::1', 'isyaau@gmail.com', 3, '2023-01-06 07:21:06', 1),
(24, '::1', 'isyaau@gmail.com', 3, '2023-01-06 07:22:12', 1),
(25, '::1', 'isyaau@gmail.com', 3, '2023-01-06 07:23:49', 1),
(26, '::1', 'isyaau@gmail.com', 3, '2023-01-06 07:25:09', 1),
(27, '::1', 'isyaau@gmail.com', 3, '2023-01-06 07:26:01', 1),
(28, '::1', 'isyaau@gmail.com', 3, '2023-01-06 07:27:48', 1),
(29, '::1', 'isyaau@gmail.com', 3, '2023-01-06 07:30:35', 1),
(30, '::1', 'isyaau@gmail.com', 3, '2023-01-06 07:32:24', 1),
(31, '::1', 'isyaau@gmail.com', 3, '2023-01-06 07:33:12', 1),
(32, '::1', 'isyaau@gmail.com', 3, '2023-01-06 07:34:17', 1),
(33, '::1', 'isyaau@gmail.com', NULL, '2023-01-07 06:32:50', 0),
(34, '::1', 'isyaau@gmail.com', NULL, '2023-01-07 06:33:03', 0),
(35, '::1', 'isyaau@gmail.com', 3, '2023-01-07 06:33:11', 1),
(36, '::1', 'isyaau@gmail.com', 3, '2023-01-08 00:26:31', 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `auth_permissions`
--

DROP TABLE IF EXISTS `auth_permissions`;
CREATE TABLE IF NOT EXISTS `auth_permissions` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Struktur dari tabel `auth_reset_attempts`
--

DROP TABLE IF EXISTS `auth_reset_attempts`;
CREATE TABLE IF NOT EXISTS `auth_reset_attempts` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `email` varchar(255) NOT NULL,
  `ip_address` varchar(255) NOT NULL,
  `user_agent` varchar(255) NOT NULL,
  `token` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Struktur dari tabel `auth_tokens`
--

DROP TABLE IF EXISTS `auth_tokens`;
CREATE TABLE IF NOT EXISTS `auth_tokens` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `selector` varchar(255) NOT NULL,
  `hashedValidator` varchar(255) NOT NULL,
  `user_id` int UNSIGNED NOT NULL,
  `expires` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `auth_tokens_user_id_foreign` (`user_id`),
  KEY `selector` (`selector`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Struktur dari tabel `auth_users_permissions`
--

DROP TABLE IF EXISTS `auth_users_permissions`;
CREATE TABLE IF NOT EXISTS `auth_users_permissions` (
  `user_id` int UNSIGNED NOT NULL DEFAULT '0',
  `permission_id` int UNSIGNED NOT NULL DEFAULT '0',
  KEY `auth_users_permissions_permission_id_foreign` (`permission_id`),
  KEY `user_id_permission_id` (`user_id`,`permission_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Struktur dari tabel `materi`
--

DROP TABLE IF EXISTS `materi`;
CREATE TABLE IF NOT EXISTS `materi` (
  `id` int NOT NULL AUTO_INCREMENT,
  `materi` varchar(255) NOT NULL,
  `activate_hash` varchar(255) DEFAULT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data untuk tabel `materi`
--

INSERT INTO `materi` (`id`, `materi`, `activate_hash`, `active`) VALUES
(1, 'Usaha', '0', 1),
(2, 'Gaya', '0', 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `migrations`
--

DROP TABLE IF EXISTS `migrations`;
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `version` varchar(255) NOT NULL,
  `class` varchar(255) NOT NULL,
  `group` varchar(255) NOT NULL,
  `namespace` varchar(255) NOT NULL,
  `time` int NOT NULL,
  `batch` int UNSIGNED NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;

--
-- Dumping data untuk tabel `migrations`
--

INSERT INTO `migrations` (`id`, `version`, `class`, `group`, `namespace`, `time`, `batch`) VALUES
(1, '2017-11-20-223112', 'Myth\\Auth\\Database\\Migrations\\CreateAuthTables', 'default', 'Myth\\Auth', 1670926148, 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `email` varchar(255) NOT NULL,
  `username` varchar(30) DEFAULT NULL,
  `password_hash` varchar(255) NOT NULL,
  `reset_hash` varchar(255) DEFAULT NULL,
  `reset_at` datetime DEFAULT NULL,
  `reset_expires` datetime DEFAULT NULL,
  `activate_hash` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `status_message` varchar(255) DEFAULT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '0',
  `force_pass_reset` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `username` (`username`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3;

--
-- Dumping data untuk tabel `users`
--

INSERT INTO `users` (`id`, `email`, `username`, `password_hash`, `reset_hash`, `reset_at`, `reset_expires`, `activate_hash`, `status`, `status_message`, `active`, `force_pass_reset`, `created_at`, `updated_at`, `deleted_at`) VALUES
(3, 'isyaau@gmail.com', 'isyaau23', '$2y$10$olgImBQHeQytyqhbNm2epuopBPAL6NQRpIp8pXs57dwVUcpJfF79O', 'ff377a462c9b2527d10d3206cacb2fd8', NULL, '2023-01-06 08:20:09', NULL, NULL, NULL, 1, 0, '2022-12-13 04:19:46', '2023-01-06 07:20:09', NULL),
(5, 'isak.akhsanil@gmail.com', 'alfia', '$2y$10$9s9508pp3W8zaWN8IspMDe9dNorNi7LmAUMvBrMkkOtjl12FmkDyK', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, '2023-01-06 08:14:59', '2023-01-07 07:51:45', NULL);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
