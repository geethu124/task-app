-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Jun 19, 2025 at 07:12 PM
-- Server version: 11.5.2-MariaDB
-- PHP Version: 8.1.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `task_app`
--

-- --------------------------------------------------------

--
-- Table structure for table `cache`
--

DROP TABLE IF EXISTS `cache`;
CREATE TABLE IF NOT EXISTS `cache` (
  `key` varchar(255) NOT NULL,
  `value` mediumtext NOT NULL,
  `expiration` int(11) NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cache_locks`
--

DROP TABLE IF EXISTS `cache_locks`;
CREATE TABLE IF NOT EXISTS `cache_locks` (
  `key` varchar(255) NOT NULL,
  `owner` varchar(255) NOT NULL,
  `expiration` int(11) NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
CREATE TABLE IF NOT EXISTS `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

DROP TABLE IF EXISTS `jobs`;
CREATE TABLE IF NOT EXISTS `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `queue` varchar(255) NOT NULL,
  `payload` longtext NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL,
  PRIMARY KEY (`id`),
  KEY `jobs_queue_index` (`queue`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `job_batches`
--

DROP TABLE IF EXISTS `job_batches`;
CREATE TABLE IF NOT EXISTS `job_batches` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `total_jobs` int(11) NOT NULL,
  `pending_jobs` int(11) NOT NULL,
  `failed_jobs` int(11) NOT NULL,
  `failed_job_ids` longtext NOT NULL,
  `options` mediumtext DEFAULT NULL,
  `cancelled_at` int(11) DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `finished_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '0001_01_01_000000_create_users_table', 1),
(2, '0001_01_01_000001_create_cache_table', 1),
(3, '0001_01_01_000002_create_jobs_table', 1),
(4, '2025_06_16_192718_create_personal_access_tokens_table', 1),
(5, '2025_06_17_183502_create_tasks_table', 2),
(6, '2025_06_18_163047_add_is_admin_to_users_table', 3);

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

DROP TABLE IF EXISTS `password_reset_tokens`;
CREATE TABLE IF NOT EXISTS `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

DROP TABLE IF EXISTS `personal_access_tokens`;
CREATE TABLE IF NOT EXISTS `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `personal_access_tokens`
--

INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES
(1, 'App\\Models\\User', 1, 'api_token', '9d73279383f0fb2b4009fe64ca13ac79567928fdcec866280af8bb56f655f4bf', '[\"*\"]', NULL, NULL, '2025-06-17 14:13:22', '2025-06-17 14:13:22'),
(2, 'App\\Models\\User', 1, 'api_token', '1158e2d02f1a720b5925676926a03629a247b0c8b779c572dd517d12e394f26e', '[\"*\"]', NULL, NULL, '2025-06-17 14:13:42', '2025-06-17 14:13:42'),
(3, 'App\\Models\\User', 2, 'api_token', '80b9f9ee6e5f0c169e26a250e504d81e15dfaa6039a90ca17e347909867714ee', '[\"*\"]', NULL, NULL, '2025-06-17 14:25:57', '2025-06-17 14:25:57'),
(4, 'App\\Models\\User', 2, 'api_token', '7bddc864c6919cef8d179f6f88d35ae989a80bad60fe00feec66b0274c350bb2', '[\"*\"]', '2025-06-17 14:46:24', NULL, '2025-06-17 14:26:23', '2025-06-17 14:46:24'),
(5, 'App\\Models\\User', 3, 'api_token', '46b3b910840b38bbf837db1994fe3085df6a9b344ec37d4b342535957af0dbdf', '[\"*\"]', NULL, NULL, '2025-06-18 13:15:40', '2025-06-18 13:15:40'),
(6, 'App\\Models\\User', 4, 'api_token', 'af7b8843d8dfbe042b0c4603d0e42e96dec6058cc0b6ac328110c9a36589182f', '[\"*\"]', NULL, NULL, '2025-06-18 13:19:52', '2025-06-18 13:19:52'),
(7, 'App\\Models\\User', 5, 'api_token', '2718a64b4c190178a2a1ddb5917c82505c57bf4218cfcee3b87a87ccbbcaab1c', '[\"*\"]', NULL, NULL, '2025-06-18 13:20:40', '2025-06-18 13:20:40'),
(8, 'App\\Models\\User', 5, 'api_token', 'a541bc319e6a89f883d3763b2761c966deae076c7ac6802ccd505ed218b4005a', '[\"*\"]', '2025-06-18 13:24:10', NULL, '2025-06-18 13:21:21', '2025-06-18 13:24:10'),
(9, 'App\\Models\\User', 4, 'api_token', 'f9ab5889cb53f91f1edb7a0e22f0671e54bc0364a3ccd9cf2e298ee179d55322', '[\"*\"]', '2025-06-19 08:59:42', NULL, '2025-06-18 13:24:04', '2025-06-19 08:59:42'),
(10, 'App\\Models\\User', 6, 'api_token', '02aa2ea13ea8e02d3b96a8b37dbae9e1f7d268422af76a87021f02abb411629a', '[\"*\"]', NULL, NULL, '2025-06-18 14:47:08', '2025-06-18 14:47:08'),
(11, 'App\\Models\\User', 4, 'api_token', '312c21b63c148fa5620f9e51e6567b96df9beec6fbfc831831fbe7eafb06dabf', '[\"*\"]', '2025-06-18 15:14:52', NULL, '2025-06-18 15:06:56', '2025-06-18 15:14:52'),
(12, 'App\\Models\\User', 7, 'api_token', '65c2260a9941ba1dc433b22e221579ffe4852a741ee8b75064ede856ab40151e', '[\"*\"]', NULL, NULL, '2025-06-19 12:39:15', '2025-06-19 12:39:15'),
(13, 'App\\Models\\User', 4, 'api_token', '5148da13b89eef9941e991106b6d8d5383ef65e5f77486038b8a31e51975e563', '[\"*\"]', '2025-06-19 14:56:09', NULL, '2025-06-19 12:39:39', '2025-06-19 14:56:09'),
(14, 'App\\Models\\User', 8, 'api_token', '2548da535cd647a13b2283c77ddd0aaaf615cea0a90f39c36fafbb4e48d20daf', '[\"*\"]', NULL, NULL, '2025-06-19 14:51:10', '2025-06-19 14:51:10');

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

DROP TABLE IF EXISTS `sessions`;
CREATE TABLE IF NOT EXISTS `sessions` (
  `id` varchar(255) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `payload` longtext NOT NULL,
  `last_activity` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sessions_user_id_index` (`user_id`),
  KEY `sessions_last_activity_index` (`last_activity`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('CdnTCwkU1zmKMzqp6lXCd7dsB04hbZRbMuGPJCob', NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiV0dFNEhYWUhKbDJWT1FzU3p1bTg2ak5jbWdmVmxEYzhUMU40dktmaCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzI6Imh0dHA6Ly9sb2NhbGhvc3Q6ODE4NC90ZXN0LWVtYWlsIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1750334918),
('nUfoS4zz4PMY1yN7B6flbru4LoCyWTUVI247Lq33', NULL, '::1', 'PostmanRuntime/7.44.1', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiQ1NBb3luc2VHYWxuRmhMa3daZUU1TFlYallNNk41bGxZVGpIRjNMUyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly9sb2NhbGhvc3Q6ODE4NCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1750270039);

-- --------------------------------------------------------

--
-- Table structure for table `tasks`
--

DROP TABLE IF EXISTS `tasks`;
CREATE TABLE IF NOT EXISTS `tasks` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `due_date` timestamp NULL DEFAULT NULL,
  `status` enum('pending','expired','completed') NOT NULL DEFAULT 'pending',
  `assigned_to` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `tasks_assigned_to_foreign` (`assigned_to`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tasks`
--

INSERT INTO `tasks` (`id`, `title`, `description`, `due_date`, `status`, `assigned_to`, `created_at`, `updated_at`) VALUES
(1, 'tesk', 'test', '2025-06-18 11:00:00', 'expired', 7, '2025-06-19 12:40:17', '2025-06-19 13:24:24'),
(2, 'tesk2', 'test', '2025-06-20 11:00:00', 'pending', 5, '2025-06-19 13:01:17', '2025-06-19 13:01:38'),
(3, 'tesk3', 'test', '2025-06-20 11:00:00', 'pending', 6, '2025-06-19 13:06:00', '2025-06-19 13:07:10'),
(4, 'tesk4', 'test', '2025-06-20 11:00:00', 'completed', 2, '2025-06-19 13:17:43', '2025-06-19 14:17:15'),
(5, 'tesk5', 'test', '2025-06-20 11:00:00', 'pending', 1, '2025-06-19 13:22:17', '2025-06-19 13:22:38'),
(6, 'tesk6', 'test', '2025-06-20 11:00:00', 'pending', 5, '2025-06-19 13:38:20', '2025-06-19 13:38:43'),
(7, 'tesk7', 'test', '2025-06-20 11:00:00', 'pending', 5, '2025-06-19 13:40:00', '2025-06-19 13:40:17'),
(8, 'tesk8', 'test', '2025-06-04 11:00:00', 'expired', 5, '2025-06-19 14:05:56', '2025-06-19 14:15:41'),
(9, 'tesk9', 'test', '2025-06-20 11:00:00', 'pending', 1, '2025-06-19 14:07:40', '2025-06-19 14:07:54'),
(10, 'tesk10', 'test', '2025-06-20 11:00:00', 'pending', 2, '2025-06-19 14:10:23', '2025-06-19 14:10:32'),
(11, 'tesk11', 'test', '2025-06-20 11:00:00', 'pending', 6, '2025-06-19 14:12:54', '2025-06-19 14:13:15'),
(12, 'tesk12', 'test', '2025-06-20 11:00:00', 'pending', 5, '2025-06-19 14:14:11', '2025-06-19 14:14:21'),
(13, 'tesk13', 'test', '2025-06-20 11:00:00', 'pending', 6, '2025-06-19 14:33:05', '2025-06-19 14:33:22'),
(14, 'tesk15', 'test', '2025-06-20 11:00:00', 'pending', 1, '2025-06-19 14:46:58', '2025-06-19 14:47:22'),
(15, 'tesk3', 'test', '2025-06-20 11:00:00', 'pending', 8, '2025-06-19 14:51:26', '2025-06-19 14:51:58');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `is_admin` tinyint(1) NOT NULL DEFAULT 0,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `is_admin`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'John', 'geethuaravind5@gmail.com', NULL, '$2y$12$lqbY0jMkUEVn2c636dHzl.6fmWy/CWLJhxavkPMHmupKxWrzUa1Ea', 0, NULL, '2025-06-17 14:13:22', '2025-06-17 14:13:22'),
(2, 'John', 'joh@exple1.com', NULL, '$2y$12$Y5vPOU8T56SlHppC5hxFGevuQP6rIHJ.jU6YXPvdw7MtcnU9xFrZG', 0, NULL, '2025-06-17 14:25:56', '2025-06-17 14:25:56'),
(4, 'admin', 'admin@task.com', NULL, '$2y$12$wG5lcQ5119PXECyoH1cKiuWn.rhwc/XgqMVVjF3FwP1YDtIXI8K9C', 1, NULL, '2025-06-18 13:19:52', '2025-06-18 13:19:52'),
(5, 'admin', 'test@task.com', NULL, '$2y$12$qBHiwB/6HmNzSwZy60lfa.dEwdoyEu/Eof4kkUOkxQVwPWEbGka.C', 0, NULL, '2025-06-18 13:20:40', '2025-06-18 13:20:40'),
(6, 'admin', 'test@rtc.com', NULL, '$2y$12$oOCWGAQVGL95Mre6EfeOHe34XcwmacowHlFg7ixA6G.v0AJ9W1E4y', 0, NULL, '2025-06-18 14:47:08', '2025-06-18 14:47:08'),
(7, 'Geethu', 'pageethu@gmail.com', NULL, '$2y$12$iGBP9yajyZ6n1Jw311kphuA7Z1IGq0eug6.EMXCLr0gAWu2coo2zy', 0, NULL, '2025-06-19 12:39:15', '2025-06-19 12:39:15'),
(8, 'Geethu', 'yolamol309@hosliy.com', NULL, '$2y$12$MjoTgyJXg8E0xmFTdDpALO0nm5S2UMOcgVIH8/CcysvrfNqmzUb/i', 0, NULL, '2025-06-19 14:51:10', '2025-06-19 14:51:10');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `tasks`
--
ALTER TABLE `tasks`
  ADD CONSTRAINT `tasks_assigned_to_foreign` FOREIGN KEY (`assigned_to`) REFERENCES `users` (`id`) ON DELETE SET NULL;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
