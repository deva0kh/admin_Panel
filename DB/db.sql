-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Feb 01, 2021 at 11:22 PM
-- Server version: 5.7.26
-- PHP Version: 7.3.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

--
-- Database: `dourayBD`
--

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
(2, '2016_06_01_000001_create_oauth_auth_codes_table', 2),
(3, '2016_06_01_000002_create_oauth_access_tokens_table', 2),
(4, '2016_06_01_000003_create_oauth_refresh_tokens_table', 2),
(5, '2016_06_01_000004_create_oauth_clients_table', 2),
(6, '2016_06_01_000005_create_oauth_personal_access_clients_table', 2),
(7, '2020_07_23_144305_create_sales_table', 3),
(8, '2020_07_23_144203_create_users_table', 4);

-- --------------------------------------------------------

--
-- Table structure for table `oauth_access_tokens`
--

CREATE TABLE `oauth_access_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `client_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_auth_codes`
--

CREATE TABLE `oauth_auth_codes` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `client_id` int(10) UNSIGNED NOT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_clients`
--

CREATE TABLE `oauth_clients` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `secret` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `redirect` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `personal_access_client` tinyint(1) NOT NULL,
  `password_client` tinyint(1) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_clients`
--

INSERT INTO `oauth_clients` (`id`, `user_id`, `name`, `secret`, `redirect`, `personal_access_client`, `password_client`, `revoked`, `created_at`, `updated_at`) VALUES
(1, NULL, 'Laravel Personal Access Client', 'ICkDvA99NrcTBKncYcsWWOKqAOnmMHEsvuTFKIjh', 'http://localhost', 1, 0, 0, '2020-06-02 20:46:55', '2020-06-02 20:46:55'),
(2, NULL, 'Laravel Password Grant Client', '9aG8uWOa11iIUiPgzJOsJLEr1GeGIVDKCxFA9uyq', 'http://localhost', 0, 1, 0, '2020-06-02 20:46:55', '2020-06-02 20:46:55');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_personal_access_clients`
--

CREATE TABLE `oauth_personal_access_clients` (
  `id` int(10) UNSIGNED NOT NULL,
  `client_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_personal_access_clients`
--

INSERT INTO `oauth_personal_access_clients` (`id`, `client_id`, `created_at`, `updated_at`) VALUES
(1, 1, '2020-06-02 20:46:55', '2020-06-02 20:46:55');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_refresh_tokens`
--

CREATE TABLE `oauth_refresh_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `access_token_id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sales`
--

CREATE TABLE `sales` (
  `id` int(10) UNSIGNED NOT NULL,
  `service` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `client` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` int(11) NOT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `bio` mediumtext COLLATE utf8mb4_unicode_ci,
  `payement` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sales`
--

INSERT INTO `sales` (`id`, `service`, `client`, `price`, `address`, `bio`, `payement`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Formatage', 'Hassan', 2999, 'Tanger', 'Pending', '1000', NULL, '2020-07-23 15:02:41', '2020-07-23 15:02:41'),
(2, 'PC Build', 'Hajoori', 300, 'Hay salam', 'Done', '250', NULL, '2020-07-23 15:03:44', '2020-07-24 13:52:13'),
(3, 'Securite', 'Ayoni', 3999, 'Tanger', 'Pending', '2999', NULL, '2020-07-23 15:04:15', '2020-07-23 15:04:15'),
(4, 'Camera installation', 'FST TANGER', 2000, 'Boukhallef', 'Pending', '0', NULL, '2020-07-23 15:04:54', '2020-07-23 15:04:54'),
(5, 'Reseau inatallation', 'FST TANGER', 8000, 'Boukhallef', 'Pending', '0', NULL, '2020-07-23 15:05:30', '2020-07-23 15:05:30'),
(6, 'PC Build', 'Mohamed', 500, 'Tanger', 'Pending', '450', NULL, '2020-07-23 15:06:12', '2020-07-23 15:06:12'),
(7, 'Camera installation', 'Noura', 5000, 'Chefchaoun', 'Pending', '5000', NULL, '2020-07-23 15:07:02', '2020-07-23 15:07:02'),
(8, 'Formatage', 'Reda', 100, 'Local', 'Pending', '100', NULL, '2020-07-23 15:07:32', '2020-07-23 15:07:32'),
(9, 'Camera installation', 'REDA Marwani', 5000, 'Tanger', 'Pending', '4001', NULL, '2020-07-24 12:46:09', '2020-07-24 12:50:55');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cin` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'k00000',
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'user',
  `bio` mediumtext COLLATE utf8mb4_unicode_ci,
  `payment` double NOT NULL DEFAULT '4000',
  `photo` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'profile.png',
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `cin`, `password`, `type`, `bio`, `payment`, `photo`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'faf', 'sda@da.da', 'k00000', '$2y$10$sesJb1D4sRFFZye8KLNJcOXdUsuUbaPHP1FiuF9fMGRg9ZZSHZ0yy', 'user', 'yes', 4000, 'profile.png', NULL, '2020-06-01 11:41:41', '2020-06-01 11:41:41'),
(2, 'admin', 'admin@admin.com', 'k00000', '$2y$10$da7Gu5g39ADQXjg5H2xc5ebH0t/N.XwUHP.GOo9oRh73Xw8cJuJVC', 'user', NULL, 4000, 'profile.png', NULL, '2020-06-02 08:43:22', '2020-06-02 08:43:22'),
(4, 'lolof', 'ereaf@dg.cim', 'k00000', '$2y$10$N9Z/d4Xk3mv0pHFNijQ30e.Uj6kDWQF2ineodcSeAwvLqD2CFgt9.', 'user', 'Vaccance', 4000, 'photo.png', NULL, '2020-06-02 09:25:28', '2020-06-02 09:25:28'),
(5, 'admine', 'fsdfsd@dfa.df', 'k00000', '$2y$10$FLTCsX2MslB4ueccYnKEz.Ug1wQwkAFiTMFxo.wu1LTDyBLQhtduy', 'user', 'Active', 4000, 'photo.png', NULL, '2020-06-02 09:26:00', '2020-06-02 09:26:00'),
(6, 'sdassd', 'dsada@dsfad.com', 'k00000', '$2y$10$8IAtT6O.YkGf4bDvrZfG4eqtrKLEMn1J/94TlOl.7CDI6kgPswsQu', 'user', 'Active', 4000, 'photo.png', NULL, '2020-06-02 11:26:11', '2020-06-02 11:26:11'),
(7, 'sdassd', 'dsada@dsfadd.com', 'k00000', '$2y$10$DbCMlkkwVAhNIA63gf31NOjJxDwBVqM4abmQJrNwXQyR4A305Mm3m', 'user', 'Active', 4000, 'photo.png', NULL, '2020-06-02 11:26:25', '2020-06-02 11:26:25'),
(8, 'dasdas', 'dsa@adsda.com', 'k00000', '$2y$10$WYCDzVfPaT979nhcELeX0erI.MAxs10xUs1KD8TyLnuHc.ArUbSda', 'admin', 'Active', 4000, 'photo.png', NULL, '2020-06-02 11:28:10', '2020-06-02 11:28:10'),
(9, 'aaa', 'aa@aa.cs', 'k00000', '$2y$10$oDx2QFZnwhCNzvvArQwpjejgVyZ8cpvxUhCAAMFQwgyZZvdI2/gMC', 'admin', 'Active', 4000, 'photo.png', NULL, '2020-06-02 12:14:26', '2020-06-02 12:14:26'),
(10, 'dsadasw', 'dsawww@dad.a', 'k00000', '$2y$10$ozEoATGae0tguyzTo9VPEu8FdaMHUPQfG3zTndufAOM6E68q3GKjC', 'user', 'Inactive', 4000, 'photo.png', NULL, '2020-06-02 12:15:11', '2020-06-02 12:15:11'),
(11, 'dsadw', 'dw@das.com', 'k00000', '$2y$10$Cherq27s7FLN4enzFMjdJeX6gBkTvlBw0jm/MwIBLk/RqlNDNSqBC', 'user', 'Vaccance', 4000, 'photo.png', NULL, '2020-06-02 12:16:59', '2020-06-02 12:16:59'),
(12, 'dasd', 'da@da.ds', 'k00000', '$2y$10$DB1iqWZRwcNQ.5qgI3qn7erO0LkOX/Re5KifIwQBl5wVVkvKAYItG', 'admin', 'Inactive', 4000, 'photo.png', NULL, '2020-06-02 12:18:20', '2020-06-02 12:18:20'),
(13, 'dwdw', 'dwad@d.com', 'k00000', '$2y$10$Z.OFNL2uMIMKxY091plJ7e3ciy9hPXdKteZ8Urf4FOOLnaFQYh7B.', 'secretaire', 'Inactive', 4000, 'photo.png', NULL, '2020-06-02 12:19:51', '2020-06-02 12:19:51'),
(14, 'dfdsfsd', 'fsdfds@das.com', 'k00000', '$2y$10$QoWVAHHmFAhMITwLPjlqHeJ6GPU.BB9jrMuGHBrs/O7AqmfPlw/Ci', 'secretaire', 'no', 4000, 'photo.png', NULL, '2020-06-02 12:21:25', '2020-06-02 12:21:25'),
(15, 'dasdas', 'da@dsa.cs', 'k00000', '$2y$10$MBU.H9Hk7Dkq8vLQtw.CxeUPS/HuQshbPugYRUXQuY6OtkrijfNCe', 'user', 'Actice', 4000, 'photo.png', NULL, '2020-06-02 12:23:02', '2020-06-02 12:23:02'),
(16, 'sssss', 'dasdaw@s.ca', 'k00000', '$2y$10$OYh8OnjGxH59rWt7WiKn2exh3FQdtbtEf6Hgq5IsGibjF1hYEIfNq', 'admin', 'yes', 4000, 'photo.png', NULL, '2020-06-02 12:25:44', '2020-06-02 12:25:44'),
(17, 'sssss', 'dasdaww@s.ca', 'k00000', '$2y$10$bAG7.OZP0rLlyieynLDsSOZQ3U9ZpL0LW4QXeQXnpkFzws.KkpPqa', 'admin', 'Inactive', 4000, 'photo.png', NULL, '2020-06-02 12:26:57', '2020-06-02 12:26:57'),
(18, 'sdaW', 'wdasdaww@s.ca', 'k00000', '$2y$10$je7Stcblps7LnKs1CL4hpO6x789ytpHKcFD795ctqWTl8klEaZLBy', 'admin', 'Vaccance', 4000, 'photo.png', NULL, '2020-06-02 12:27:26', '2020-06-02 12:27:26'),
(19, 'das', 'wdasdawsw@s.ca', 'k00000', '$2y$10$45JjyzhB26cdwHDx4ZodX.tqQpilgjATpyylrdmqQQDZT9n8ZslJy', 'user', 'Active', 4000, 'photo.png', NULL, '2020-06-02 12:27:53', '2020-06-02 12:27:53'),
(20, 'saww', 'ssww@s.ca', 'k00000', '$2y$10$awvvJ0KJiamm9MGELFiBZOoyLyn/cXork11xxC8hpZa1GJO1lZAl.', 'admin', 'Inactive', 4000, 'photo.png', NULL, '2020-06-02 12:29:19', '2020-06-02 12:29:19'),
(21, 'dsd', 'wdaswdaww@s.ca', 'k00000', '$2y$10$tMl3lls2J3WEfxfgbzhVZ.dWnBCYD8KqxqxGjd20Fjv1U.wND81Fa', 'admin', 'Inactive', 4000, 'photo.png', NULL, '2020-06-02 12:29:53', '2020-06-02 12:29:53'),
(22, 'ala', 'ala@dd.c', 'k00000', '$2y$10$XsCbGH2ZPwy.Rqwv.wm8nOf0UJBpQcbK8werNzQgHY3OtgnKHSWS.', 'admin', 'Inactive', 4000, 'photo.png', NULL, '2020-06-02 12:32:40', '2020-06-02 12:32:40'),
(23, 'said marwani', 'said@tech.com', 'k00000', '$2y$10$sf30HtTdo2KNSAXGHhQXCODmw8jjCi6qiTBGZWsLNsBFtWCL3of1i', 'user', 'Active', 4000, 'photo.png', NULL, '2020-06-02 12:34:32', '2020-06-02 12:34:32'),
(24, 'sad', 'arbi@tech.cs', 'k00000', '$2y$10$IiY79qeiu5SeMl.A1sgNXeQvXfvRF2cefV88zkHRBn5a.ydO2u.Xq', 'user', 'Inactive', 4000, 'photo.png', NULL, '2020-06-02 12:35:59', '2020-06-02 12:35:59'),
(31, 'heloo', 'sd@w.dsa', 'k00000', 'sadl;askld2333', 'user', 'Active', 4000, 'photo.png', NULL, '2020-06-02 14:14:58', '2020-06-02 14:49:18'),
(32, 'asdaaaaaaaa', 'kdalkl@das.conm', 'k00000', 'dasdasdasdasda', 'secretaire', 'Vaccance', 4000, 'photo.png', NULL, '2020-06-02 14:23:10', '2020-06-02 14:46:54'),
(38, 'Rachid nouno', 'rachid@tech.com', 'k423432', 'admin1233', 'user', 'Active', 4000, 'profile.png', NULL, '2020-06-02 19:07:39', '2020-06-02 20:10:27'),
(39, 'med', 'med@admin.fst', 'k00000', '$2y$10$pggnNgjAONbHK6k/mOu0N.zjdPNUFoAAITyCM3CAmvWGIFh2/KVs2', 'admin', 'Inactive', 4000, '1595599261.jpeg', 'dTZG3qjxt6KiZhH8fppVIiMiJlBPHFoozz6bvqBZKKmeRioxrm96OzifwNXd', '2020-07-23 13:28:42', '2020-07-24 13:01:01'),
(40, 'Samira amamo', 'amamo@gmail.com', 'KB9329', '$2y$10$egHUBFCSl7XCfsm2MDSna.95/7xClZs1z816ngQ6aqSJjiUsmGdu.', 'secretaire', 'Inactive', 4000, 'photo.png', NULL, '2020-07-23 15:18:07', '2020-07-23 15:18:07'),
(41, 'userMohamed', 'userMohamed@tech.com', 'KB12333', '$2y$10$fOO0UX4gnMVeTDcXy4YBn.kRyD2iy9c1L4rLnbZyqcbnMgD948JsW', 'user', 'Inactive', 4000, 'photo.png', NULL, '2020-07-24 12:24:23', '2020-07-24 12:26:54'),
(42, 'dada', 'ad@ad.com', 'k00000', '$2y$10$tlI6HD5A2ozqiq0C4cbJruWZnXUDfKEC3eYRM42YaFqBOlHKp1Vgi', 'admin', NULL, 4000, 'profile.png', NULL, '2021-01-31 20:27:42', '2021-01-31 20:27:42');

-- --------------------------------------------------------

--
-- Table structure for table `users1`
--

CREATE TABLE `users1` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'user',
  `bio` mediumtext COLLATE utf8mb4_unicode_ci,
  `photo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT 'profile.png',
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users1`
--

INSERT INTO `users1` (`id`, `name`, `email`, `password`, `type`, `bio`, `photo`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'faf', 'sda@da.da', '$2y$10$sesJb1D4sRFFZye8KLNJcOXdUsuUbaPHP1FiuF9fMGRg9ZZSHZ0yy', 'user', 'yes', 'profile.png', NULL, '2020-06-01 12:41:41', '2020-06-01 12:41:41'),
(2, 'admin', 'admin@admin.com', '$2y$10$da7Gu5g39ADQXjg5H2xc5ebH0t/N.XwUHP.GOo9oRh73Xw8cJuJVC', 'user', NULL, 'profile.png', NULL, '2020-06-02 09:43:22', '2020-06-02 09:43:22'),
(4, 'lolof', 'ereaf@dg.cim', '$2y$10$N9Z/d4Xk3mv0pHFNijQ30e.Uj6kDWQF2ineodcSeAwvLqD2CFgt9.', 'user', 'no', 'photo.png', NULL, '2020-06-02 10:25:28', '2020-06-02 10:25:28'),
(5, 'admine', 'fsdfsd@dfa.df', '$2y$10$FLTCsX2MslB4ueccYnKEz.Ug1wQwkAFiTMFxo.wu1LTDyBLQhtduy', 'user', 'no', 'photo.png', NULL, '2020-06-02 10:26:00', '2020-06-02 10:26:00'),
(6, 'sdassd', 'dsada@dsfad.com', '$2y$10$8IAtT6O.YkGf4bDvrZfG4eqtrKLEMn1J/94TlOl.7CDI6kgPswsQu', 'user', 'Yes', 'photo.png', NULL, '2020-06-02 12:26:11', '2020-06-02 12:26:11'),
(7, 'sdassd', 'dsada@dsfadd.com', '$2y$10$DbCMlkkwVAhNIA63gf31NOjJxDwBVqM4abmQJrNwXQyR4A305Mm3m', 'user', 'Yes', 'photo.png', NULL, '2020-06-02 12:26:25', '2020-06-02 12:26:25'),
(8, 'dasdas', 'dsa@adsda.com', '$2y$10$WYCDzVfPaT979nhcELeX0erI.MAxs10xUs1KD8TyLnuHc.ArUbSda', 'admin', 'no', 'photo.png', NULL, '2020-06-02 12:28:10', '2020-06-02 12:28:10'),
(9, 'aaa', 'aa@aa.cs', '$2y$10$oDx2QFZnwhCNzvvArQwpjejgVyZ8cpvxUhCAAMFQwgyZZvdI2/gMC', 'admin', 'no', 'photo.png', NULL, '2020-06-02 13:14:26', '2020-06-02 13:14:26'),
(10, 'dsadasw', 'dsawww@dad.a', '$2y$10$ozEoATGae0tguyzTo9VPEu8FdaMHUPQfG3zTndufAOM6E68q3GKjC', 'user', 'yes', 'photo.png', NULL, '2020-06-02 13:15:11', '2020-06-02 13:15:11'),
(11, 'dsadw', 'dw@das.com', '$2y$10$Cherq27s7FLN4enzFMjdJeX6gBkTvlBw0jm/MwIBLk/RqlNDNSqBC', 'user', 'yes', 'photo.png', NULL, '2020-06-02 13:16:59', '2020-06-02 13:16:59'),
(12, 'dasd', 'da@da.ds', '$2y$10$DB1iqWZRwcNQ.5qgI3qn7erO0LkOX/Re5KifIwQBl5wVVkvKAYItG', 'admin', 'yes', 'photo.png', NULL, '2020-06-02 13:18:20', '2020-06-02 13:18:20'),
(13, 'dwdw', 'dwad@d.com', '$2y$10$Z.OFNL2uMIMKxY091plJ7e3ciy9hPXdKteZ8Urf4FOOLnaFQYh7B.', 'secretaire', 'no', 'photo.png', NULL, '2020-06-02 13:19:51', '2020-06-02 13:19:51'),
(14, 'dfdsfsd', 'fsdfds@das.com', '$2y$10$QoWVAHHmFAhMITwLPjlqHeJ6GPU.BB9jrMuGHBrs/O7AqmfPlw/Ci', 'secretaire', 'no', 'photo.png', NULL, '2020-06-02 13:21:25', '2020-06-02 13:21:25'),
(15, 'dasdas', 'da@dsa.cs', '$2y$10$MBU.H9Hk7Dkq8vLQtw.CxeUPS/HuQshbPugYRUXQuY6OtkrijfNCe', 'user', 'no', 'photo.png', NULL, '2020-06-02 13:23:02', '2020-06-02 13:23:02'),
(16, 'sssss', 'dasdaw@s.ca', '$2y$10$OYh8OnjGxH59rWt7WiKn2exh3FQdtbtEf6Hgq5IsGibjF1hYEIfNq', 'admin', 'yes', 'photo.png', NULL, '2020-06-02 13:25:44', '2020-06-02 13:25:44'),
(17, 'sssss', 'dasdaww@s.ca', '$2y$10$bAG7.OZP0rLlyieynLDsSOZQ3U9ZpL0LW4QXeQXnpkFzws.KkpPqa', 'admin', 'yes', 'photo.png', NULL, '2020-06-02 13:26:57', '2020-06-02 13:26:57'),
(18, 'sdaW', 'wdasdaww@s.ca', '$2y$10$je7Stcblps7LnKs1CL4hpO6x789ytpHKcFD795ctqWTl8klEaZLBy', 'admin', 'yes', 'photo.png', NULL, '2020-06-02 13:27:26', '2020-06-02 13:27:26'),
(19, 'das', 'wdasdawsw@s.ca', '$2y$10$45JjyzhB26cdwHDx4ZodX.tqQpilgjATpyylrdmqQQDZT9n8ZslJy', 'user', 'no', 'photo.png', NULL, '2020-06-02 13:27:53', '2020-06-02 13:27:53'),
(20, 'saww', 'ssww@s.ca', '$2y$10$awvvJ0KJiamm9MGELFiBZOoyLyn/cXork11xxC8hpZa1GJO1lZAl.', 'admin', 'no', 'photo.png', NULL, '2020-06-02 13:29:19', '2020-06-02 13:29:19'),
(21, 'dsd', 'wdaswdaww@s.ca', '$2y$10$tMl3lls2J3WEfxfgbzhVZ.dWnBCYD8KqxqxGjd20Fjv1U.wND81Fa', 'admin', 'yes', 'photo.png', NULL, '2020-06-02 13:29:53', '2020-06-02 13:29:53'),
(22, 'ala', 'ala@dd.c', '$2y$10$XsCbGH2ZPwy.Rqwv.wm8nOf0UJBpQcbK8werNzQgHY3OtgnKHSWS.', 'admin', 'no', 'photo.png', NULL, '2020-06-02 13:32:40', '2020-06-02 13:32:40'),
(23, 'dd', 'ss@ds.com', '$2y$10$sf30HtTdo2KNSAXGHhQXCODmw8jjCi6qiTBGZWsLNsBFtWCL3of1i', 'user', 'no', 'photo.png', NULL, '2020-06-02 13:34:32', '2020-06-02 13:34:32'),
(24, 'sad', 'das@klnas.cs', '$2y$10$IiY79qeiu5SeMl.A1sgNXeQvXfvRF2cefV88zkHRBn5a.ydO2u.Xq', 'secretaire', 'yes', 'photo.png', NULL, '2020-06-02 13:35:59', '2020-06-02 13:35:59'),
(31, 'heloo', 'sd@w.dsa', 'sadl;askld2333', 'user', 'no', 'photo.png', NULL, '2020-06-02 15:14:58', '2020-06-02 15:49:18'),
(32, 'asdaaaaaaaa', 'kdalkl@das.conm', 'dasdasdasdasda', 'secretaire', 'ddd', 'photo.png', NULL, '2020-06-02 15:23:10', '2020-06-02 15:46:54'),
(36, 'wa', 'sdadds@aiosijf.com', 'sadasdasdasdw', 'admin', 'Inactive', 'photo.png', NULL, '2020-06-02 15:57:17', '2020-06-02 16:00:08'),
(38, 'admin', 'admin@ksa.com', 'admin1233', 'user', NULL, 'profile.png', NULL, '2020-06-02 20:07:39', '2020-06-02 21:10:27'),
(39, 'med', 'med@admin.fst', '$2y$10$pggnNgjAONbHK6k/mOu0N.zjdPNUFoAAITyCM3CAmvWGIFh2/KVs2', 'admin', NULL, 'profile.png', NULL, '2020-07-23 14:28:42', '2020-07-23 14:28:42');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `oauth_access_tokens`
--
ALTER TABLE `oauth_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_access_tokens_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_auth_codes`
--
ALTER TABLE `oauth_auth_codes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_clients_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_personal_access_clients_client_id_index` (`client_id`);

--
-- Indexes for table `oauth_refresh_tokens`
--
ALTER TABLE `oauth_refresh_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_refresh_tokens_access_token_id_index` (`access_token_id`);

--
-- Indexes for table `sales`
--
ALTER TABLE `sales`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indexes for table `users1`
--
ALTER TABLE `users1`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `sales`
--
ALTER TABLE `sales`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT for table `users1`
--
ALTER TABLE `users1`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;
