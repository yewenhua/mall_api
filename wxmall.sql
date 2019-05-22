-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- 主机： 127.0.0.1
-- 生成日期： 2019-05-22 10:47:50
-- 服务器版本： 10.1.36-MariaDB
-- PHP 版本： 5.6.38

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- 数据库： `wxmall`
--

-- --------------------------------------------------------

--
-- 表的结构 `address`
--

CREATE TABLE `address` (
  `id` int(10) UNSIGNED NOT NULL,
  `mini_id` int(11) NOT NULL,
  `userName` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `postalCode` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `provinceName` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cityName` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `countyName` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `detailInfo` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nationalCode` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `telNumber` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- 转存表中的数据 `address`
--

INSERT INTO `address` (`id`, `mini_id`, `userName`, `postalCode`, `provinceName`, `cityName`, `countyName`, `detailInfo`, `nationalCode`, `telNumber`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, '张三', '510000', '广东省', '广州市', '海珠区', '新港中路397号', '510000', '020-81167888', '2019-05-07 01:02:37', '2019-05-07 01:02:37', NULL);

-- --------------------------------------------------------

--
-- 表的结构 `banner`
--

CREATE TABLE `banner` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sort` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `url` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `img` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `isopen` int(11) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- 表的结构 `cases`
--

CREATE TABLE `cases` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `img` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- 表的结构 `cash`
--

CREATE TABLE `cash` (
  `id` int(10) UNSIGNED NOT NULL,
  `money` decimal(8,2) NOT NULL,
  `uid` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- 表的结构 `discount`
--

CREATE TABLE `discount` (
  `id` int(10) UNSIGNED NOT NULL,
  `uid` int(11) NOT NULL,
  `value` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- 表的结构 `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- 表的结构 `goods`
--

CREATE TABLE `goods` (
  `id` int(11) NOT NULL,
  `category` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sale_price` decimal(8,2) NOT NULL,
  `market_price` decimal(8,2) NOT NULL,
  `discount` decimal(8,2) NOT NULL,
  `remain_num` int(11) NOT NULL COMMENT '剩余库存',
  `sale_num` int(11) NOT NULL COMMENT '销量',
  `is_release` int(11) NOT NULL COMMENT '是否上架',
  `is_recommend` int(11) NOT NULL COMMENT '是否推荐',
  `is_time_buy` int(11) NOT NULL COMMENT '是否限时购',
  `time_buy_time` datetime DEFAULT NULL,
  `weight` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `limit_buy_num` int(11) NOT NULL,
  `send_method` int(11) DEFAULT NULL,
  `sort_id` int(11) NOT NULL,
  `merchant_id` int(11) NOT NULL,
  `is_pintuan` int(11) NOT NULL COMMENT '是否拼团',
  `pintuan_num` int(11) NOT NULL COMMENT '达到拼团数量',
  `pintuan_time` datetime DEFAULT NULL,
  `is_sku` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- 转存表中的数据 `goods`
--

INSERT INTO `goods` (`id`, `category`, `name`, `sale_price`, `market_price`, `discount`, `remain_num`, `sale_num`, `is_release`, `is_recommend`, `is_time_buy`, `time_buy_time`, `weight`, `limit_buy_num`, `send_method`, `sort_id`, `merchant_id`, `is_pintuan`, `pintuan_num`, `pintuan_time`, `is_sku`, `created_at`, `updated_at`, `deleted_at`) VALUES
(4, '1/75/94', '国酒茅台', '90.90', '80.80', '9.50', 450, 50, 1, 1, 0, NULL, NULL, 10, 2, 10, 2, 0, 2, NULL, 1, '2019-04-23 06:30:32', '2019-04-30 08:49:12', NULL),
(9, '1/75/95', 'X8', '90.90', '80.80', '9.50', 100, 50, 1, 1, 0, NULL, NULL, 10, 1, 10, 2, 0, 2, NULL, 1, '2019-04-29 05:37:49', '2019-04-29 05:38:52', NULL),
(10, '1/75/96', 'V77', '98.90', '80.80', '9.50', 38, 50, 1, 1, 0, NULL, NULL, 10, 2, 10, 2, 0, 2, NULL, 0, '2019-04-29 05:39:51', '2019-05-04 01:59:59', NULL),
(11, '1/75/97', 'V77', '90.90', '80.80', '9.50', 76, 50, 1, 1, 0, NULL, NULL, 10, 1, 10, 2, 0, 2, NULL, 1, '2019-04-29 05:40:57', '2019-05-06 02:14:56', NULL),
(12, '1/75/98', 'k8', '90.90', '80.80', '9.50', 100, 50, 1, 1, 0, NULL, NULL, 10, 2, 10, 2, 0, 2, NULL, 1, '2019-04-29 05:41:38', '2019-04-29 05:41:38', NULL),
(13, '1/86/99', 'B6', '90.90', '80.80', '9.50', 100, 50, 1, 1, 0, NULL, NULL, 10, 2, 10, 2, 0, 2, NULL, 1, '2019-04-29 05:42:38', '2019-04-29 05:42:38', NULL),
(14, '1/86/100', 'H6', '90.90', '80.80', '9.50', 100, 50, 1, 1, 0, NULL, NULL, 10, 1, 10, 2, 0, 2, NULL, 1, '2019-04-29 05:43:21', '2019-04-29 05:43:21', NULL),
(15, '1/86/101', 'G5', '90.90', '80.80', '9.50', 100, 50, 1, 1, 0, NULL, NULL, 10, 1, 10, 2, 0, 2, NULL, 1, '2019-04-29 05:44:01', '2019-04-29 05:44:01', NULL),
(16, '1/86/102', 'K99', '90.90', '80.80', '9.50', 100, 50, 1, 1, 0, NULL, NULL, 10, 2, 10, 2, 0, 2, NULL, 1, '2019-04-29 05:44:42', '2019-04-29 05:44:42', NULL),
(17, '1/86/103', 'J8', '90.90', '80.80', '9.50', 100, 50, 1, 1, 0, NULL, NULL, 10, 1, 10, 2, 0, 2, NULL, 1, '2019-04-29 05:45:51', '2019-04-29 05:45:51', NULL);

-- --------------------------------------------------------

--
-- 表的结构 `goods_images`
--

CREATE TABLE `goods_images` (
  `id` int(10) UNSIGNED NOT NULL,
  `goods_id` int(11) NOT NULL,
  `type` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '商品图片类型，main为主题，detail为详情图',
  `url` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '商品图片路径',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- 转存表中的数据 `goods_images`
--

INSERT INTO `goods_images` (`id`, `goods_id`, `type`, `url`, `created_at`, `updated_at`, `deleted_at`) VALUES
(9, 4, 'main', '/uploads/goods/20190429/meFpZSvcZ30KI1wDZzCo1lNBxG4mGtq5b1BGOgrg.jpeg', '2019-04-29 05:03:30', '2019-04-29 05:03:30', NULL),
(10, 4, 'main', '/uploads/goods/20190429/zS22EOXOA3w8zrwC5t95Hlbo9sH3CRgs58EPnuMg.jpeg', '2019-04-29 05:03:30', '2019-04-29 05:03:30', NULL),
(11, 4, 'detail', '/uploads/goods/20190429/vn4RU4lvcPFkxgoD2nrugPmMhaIrF1vKZ23WTuLQ.jpeg', '2019-04-29 05:03:30', '2019-04-29 05:03:30', NULL),
(12, 4, 'detail', '/uploads/goods/20190429/3NJdiCGYR0oBpy24GO70v8kFLj9I2yfxZHypsTpr.jpeg', '2019-04-29 05:03:30', '2019-04-29 05:03:30', NULL),
(13, 4, 'detail', '/uploads/goods/20190429/j0NgadGBPMljvLHu7CgvLz5cG0TR4t5tL4hBCJXV.jpeg', '2019-04-29 05:03:30', '2019-04-29 05:03:30', NULL),
(14, 4, 'detail', '/uploads/goods/20190429/MReTNYeR9KNbPlZOzI0Oah9egOJG0lv94MivV6sv.jpeg', '2019-04-29 05:03:30', '2019-04-29 05:03:30', NULL),
(15, 4, 'detail', '/uploads/goods/20190429/MjSNqbPowiaiR5l9jTdcB2RmK4iFGL15V4VOx9BM.jpeg', '2019-04-29 05:03:30', '2019-04-29 05:03:30', NULL),
(16, 4, 'detail', '/uploads/goods/20190429/D60p1D58y5rRNu8Y0AlsH2b5GfgYQmG6SGdeT641.jpeg', '2019-04-29 05:03:30', '2019-04-29 05:03:30', NULL),
(17, 4, 'detail', '/uploads/goods/20190429/gCYSVZLjqIIHE1S9E35XsyuFBUECg0xaKz09fzwe.jpeg', '2019-04-29 05:03:30', '2019-04-29 05:03:30', NULL),
(18, 4, 'detail', '/uploads/goods/20190429/wPwlUWL4vTEJqxkeulNj9WcaJYzoacv1fs6YfW00.jpeg', '2019-04-29 05:03:30', '2019-04-29 05:03:30', NULL),
(19, 4, 'detail', '/uploads/goods/20190429/XAF7wy1GYQ7LOvWtIXL4tLH6rWh1GiAlIesDY2bg.jpeg', '2019-04-29 05:03:30', '2019-04-29 05:03:30', NULL),
(20, 4, 'detail', '/uploads/goods/20190429/wBNC6Qvy8Rfvd53jUcn4mJSBJmqanrwpXmSyycXg.jpeg', '2019-04-29 05:03:30', '2019-04-29 05:03:30', NULL),
(21, 4, 'detail', '/uploads/goods/20190429/iD7socW0iAXI2eey1ZkvOgMqVs0IVQaMzFMEaUlk.jpeg', '2019-04-29 05:03:30', '2019-04-29 05:03:30', NULL),
(22, 4, 'detail', '/uploads/goods/20190429/jIQrSftwVAe02QxNMgwKq80Xad9hwd4spkNqjw4c.jpeg', '2019-04-29 05:03:30', '2019-04-29 05:03:30', NULL),
(23, 4, 'detail', '/uploads/goods/20190429/7Tx5hpEqs6wUrgcSzocVoRgkcgbwszkhskoZ7HVR.jpeg', '2019-04-29 05:03:30', '2019-04-29 05:03:30', NULL),
(24, 9, 'main', '/uploads/goods/20190429/A2a1fUk7hGW3Oza9Mgz79Ym7fOOpvUNkGNkjnHeZ.jpeg', '2019-04-29 05:37:49', '2019-04-29 05:37:49', NULL),
(25, 9, 'detail', '/uploads/goods/20190429/LEQmrw2I4urv162HlTZZovCzhieHgM3NZEVVTFZU.jpeg', '2019-04-29 05:37:49', '2019-04-29 05:37:49', NULL),
(26, 9, 'detail', '/uploads/goods/20190429/jxz38GAw8lbBce4LdOdQpJzfQH1DN992d5tzLt90.jpeg', '2019-04-29 05:37:49', '2019-04-29 05:37:49', NULL),
(27, 10, 'main', '/uploads/goods/20190429/z2FMnHNvmnmHEYsFmnC1VBHz9KTW9wW3CCFKgIjt.jpeg', '2019-04-29 05:39:51', '2019-04-29 05:39:51', NULL),
(28, 10, 'detail', '/uploads/goods/20190429/z8Goi9S7MfFfVzTnrBdwWiIJtZigObpqV1W0aLqa.jpeg', '2019-04-29 05:39:51', '2019-04-29 05:39:51', NULL),
(29, 10, 'detail', '/uploads/goods/20190429/CE9AHzecziUbbDbXjdueSuNlKwjOm836mBtHabEB.jpeg', '2019-04-29 05:39:51', '2019-04-29 05:39:51', NULL),
(30, 11, 'main', '/uploads/goods/20190429/uW3xkUGYl0rX3t6YMo44yhFHbLWOfeaqhMtd42ve.jpeg', '2019-04-29 05:40:57', '2019-05-06 02:09:54', '2019-05-06 02:09:54'),
(31, 11, 'detail', '/uploads/goods/20190429/tOhKcxoCsw99C8HOXejW8dehbFVmY9qqc8wQN4kb.jpeg', '2019-04-29 05:40:57', '2019-05-06 02:09:54', '2019-05-06 02:09:54'),
(32, 11, 'detail', '/uploads/goods/20190429/8q3vKiwEGZNnMEClzbMNGiXn4ymgOwFQRogfHX8x.jpeg', '2019-04-29 05:40:57', '2019-04-29 05:40:57', NULL),
(33, 12, 'main', '/uploads/goods/20190429/UjDlttekrSH7MCV7jA6cKIWNkjBydyl0WKtBJfVi.jpeg', '2019-04-29 05:41:38', '2019-04-29 05:41:38', NULL),
(34, 12, 'detail', '/uploads/goods/20190429/EBNiOC0b2ZyHM06b5AcjndkpuPxDT0dHd72KZcZw.jpeg', '2019-04-29 05:41:38', '2019-04-29 05:41:38', NULL),
(35, 12, 'detail', '/uploads/goods/20190429/nNTvpY9dNMIuBUFKTpEf4Udi3tRhYs2VcdQ3GpsC.jpeg', '2019-04-29 05:41:38', '2019-04-29 05:41:38', NULL),
(36, 13, 'main', '/uploads/goods/20190429/MLXDSwzCRDZDZUIzKTx5qaNWEWT6NrfW4EMIIHtZ.jpeg', '2019-04-29 05:42:38', '2019-04-29 05:42:38', NULL),
(37, 13, 'detail', '/uploads/goods/20190429/YR9cuWMd3YyFY5AN1YtUOCqrP7Q5P7yymK0gmacY.jpeg', '2019-04-29 05:42:38', '2019-04-29 05:42:38', NULL),
(38, 13, 'detail', '/uploads/goods/20190429/0aurUvh6iWhJGMquSt6LRCwgIeupc4md7pOeGJFT.jpeg', '2019-04-29 05:42:38', '2019-04-29 05:42:38', NULL),
(39, 14, 'main', '/uploads/goods/20190429/rfVHjTrJF1WQLhpnRIJTas320JiGUG19cu6svAYC.jpeg', '2019-04-29 05:43:21', '2019-04-29 05:43:21', NULL),
(40, 14, 'detail', '/uploads/goods/20190429/3UJXOqNN5DvfvrH9HgeIA9SQejDWHDaHv5pEUqyr.jpeg', '2019-04-29 05:43:21', '2019-04-29 05:43:21', NULL),
(41, 14, 'detail', '/uploads/goods/20190429/hjjnKQr8xQ2GleVdSyAl0GXQAHAAgzPeIuMuadPS.jpeg', '2019-04-29 05:43:21', '2019-04-29 05:43:21', NULL),
(42, 14, 'detail', '/uploads/goods/20190429/kojANQ1Fc3DhnJAKRv4GVz8Kfm9BJOIYevotUriG.jpeg', '2019-04-29 05:43:21', '2019-04-29 05:43:21', NULL),
(43, 15, 'main', '/uploads/goods/20190429/z8VBCL43rHdGSEis0F97iKIy0TT0QW4likuUmKgD.jpeg', '2019-04-29 05:44:01', '2019-04-29 05:44:01', NULL),
(44, 15, 'detail', '/uploads/goods/20190429/TfdKNMBfE9Zl5Ju4Ks2oIAuGCUwzxMHBUIOXtuOc.jpeg', '2019-04-29 05:44:01', '2019-04-29 05:44:01', NULL),
(45, 15, 'detail', '/uploads/goods/20190429/IOp7nE70oyFsfOen4lS1INM123glXezw1nNCMjr2.jpeg', '2019-04-29 05:44:01', '2019-04-29 05:44:01', NULL),
(46, 16, 'main', '/uploads/goods/20190429/QxbqfTyazY9NzMeOuePRLTJP1lfZJqYyo0FxVp6J.jpeg', '2019-04-29 05:44:42', '2019-04-29 05:44:42', NULL),
(47, 16, 'detail', '/uploads/goods/20190429/OSoiqkpjV7UbAnZyAWCIHvhLllgoECMyKBKsC5I9.jpeg', '2019-04-29 05:44:42', '2019-04-29 05:44:42', NULL),
(48, 16, 'detail', '/uploads/goods/20190429/MHDn0EWIKl4ZV8Zzdgi48496riNkOYtciAqYGFok.jpeg', '2019-04-29 05:44:42', '2019-04-29 05:44:42', NULL),
(49, 17, 'main', '/uploads/goods/20190429/GiQpHdMHsURGecgHO1ekiyNQ2DiM8MGuBiJP7voA.jpeg', '2019-04-29 05:45:51', '2019-04-29 05:45:51', NULL),
(50, 17, 'detail', '/uploads/goods/20190429/l1y6QGHuq4sEnOsDJqiVmBhZ9buHvYMIFvY0RH5k.jpeg', '2019-04-29 05:45:51', '2019-04-29 05:45:51', NULL),
(51, 17, 'detail', '/uploads/goods/20190429/QMVGY08oF8BUJnVSr8foHWgb26pBV6wqhjuaV5kL.jpeg', '2019-04-29 05:45:51', '2019-04-29 05:45:51', NULL),
(52, 17, 'detail', '/uploads/goods/20190429/fB5STN7k5pWzylK5NyFXZBPrrdfGHVxhcumvsGJd.jpeg', '2019-04-29 05:45:51', '2019-04-29 05:45:51', NULL),
(53, 17, 'detail', '/uploads/goods/20190429/QWMWDD1CV7CyaxIzrdYuUUgKSF8OWld30SAPJBgd.jpeg', '2019-04-29 05:45:51', '2019-04-29 05:45:51', NULL),
(54, 17, 'detail', '/uploads/goods/20190429/sCfmAVUo4x1jTxFRd023ML3MGPmrsShGHfOZEKEM.jpeg', '2019-04-29 05:45:51', '2019-04-29 05:45:51', NULL),
(55, 17, 'detail', '/uploads/goods/20190429/7IGNevTY49ZEgLkQwZ2ClSfzXmJS1shNpYLwCBUs.jpeg', '2019-04-29 05:45:51', '2019-04-29 05:45:51', NULL),
(56, 17, 'detail', '/uploads/goods/20190429/a3Y0SpmNMFKq1fugp9oDf3pUPL0IDxywuW7geriP.jpeg', '2019-04-29 05:45:51', '2019-04-29 05:45:51', NULL),
(57, 17, 'detail', '/uploads/goods/20190429/4SIcM15ihfnlZAXwFcaNuV7OauRawCgMbAuFtGek.jpeg', '2019-04-29 05:45:51', '2019-04-29 05:45:51', NULL),
(58, 11, 'main', '/uploads/goods/20190505/kT26NE5Q9jYOhMzE7Kb98702mewqLv2dw6pHLMnz.jpeg', '2019-05-05 09:02:59', '2019-05-05 09:29:22', '2019-05-05 09:29:22'),
(59, 11, 'detail', '/uploads/goods/20190505/j7HpWvTU1UkbekiKo81fhgR0qvAWFHhtOU1V41k0.jpeg', '2019-05-05 09:02:59', '2019-05-05 09:02:59', NULL),
(60, 11, 'detail', '/uploads/goods/20190505/jmH1gQyE7fLndi59pWsoDRNBgIWKgD5ktYqtWiRk.jpeg', '2019-05-05 09:02:59', '2019-05-05 09:29:22', '2019-05-05 09:29:22'),
(61, 11, 'main', '/uploads/goods/20190505/3j1aWpCfnTgzCrDC7g9NwBMpC1gKH9idx51ZHKie.jpeg', '2019-05-05 09:32:43', '2019-05-05 09:32:43', NULL),
(62, 11, 'detail', '/uploads/goods/20190505/97i0E5bqwpS218c1OY91cX4d6dR8sEV3OpuqG6CD.jpeg', '2019-05-05 09:32:43', '2019-05-05 09:32:43', NULL),
(63, 11, 'detail', '/uploads/goods/20190506/LfqeEy98PlJlvWltwiyrcSAOma19e9SNEEaukOmy.jpeg', '2019-05-06 01:56:32', '2019-05-06 01:56:32', NULL),
(64, 11, 'detail', '/uploads/goods/20190506/Vo6pYISUSWChJKXlvsUvtBjkRsTKOQjsFj8rBjbi.jpeg', '2019-05-06 02:01:52', '2019-05-06 02:01:52', NULL),
(65, 11, 'detail', '/uploads/goods/20190506/wQC0bSzgp7S0CBEl1k6nLDaVtBkGYSbIPd2OkAmE.jpeg', '2019-05-06 02:03:27', '2019-05-06 02:03:27', NULL),
(66, 11, 'main', '/uploads/goods/20190506/6QXt9DM4N3DwRfwqMG5ZB413kqnhzAamQl3CHrM7.jpeg', '2019-05-06 02:09:54', '2019-05-06 02:09:54', NULL),
(67, 11, 'detail', '/uploads/goods/20190506/BoC7ajMCPPvgXGptvfTXoxQQpnt6l1fFzTJQDJeB.jpeg', '2019-05-06 02:09:54', '2019-05-06 02:09:54', NULL);

-- --------------------------------------------------------

--
-- 表的结构 `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- 转存表中的数据 `jobs`
--

INSERT INTO `jobs` (`id`, `queue`, `payload`, `attempts`, `reserved_at`, `available_at`, `created_at`) VALUES
(1, 'default', '{\"displayName\":\"miaosha\",\"job\":\"miaosha\",\"maxTries\":null,\"timeout\":null,\"data\":14899}', 0, NULL, 1500626053, 1500626053),
(2, 'default', '{\"displayName\":\"miaosha\",\"job\":\"miaosha\",\"maxTries\":null,\"timeout\":null,\"data\":49245}', 0, NULL, 1500626054, 1500626054),
(3, 'default', '{\"displayName\":\"miaosha\",\"job\":\"miaosha\",\"maxTries\":null,\"timeout\":null,\"data\":34054}', 0, NULL, 1500626055, 1500626055),
(4, 'default', '{\"displayName\":\"miaosha\",\"job\":\"miaosha\",\"maxTries\":null,\"timeout\":null,\"data\":47416}', 0, NULL, 1500626056, 1500626056),
(5, 'default', '{\"displayName\":\"miaosha\",\"job\":\"miaosha\",\"maxTries\":null,\"timeout\":null,\"data\":14836}', 0, NULL, 1500626109, 1500626109);

-- --------------------------------------------------------

--
-- 表的结构 `logistics`
--

CREATE TABLE `logistics` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `send_list` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '配送区域',
  `isopen` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- 转存表中的数据 `logistics`
--

INSERT INTO `logistics` (`id`, `name`, `send_list`, `isopen`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, '全国默认', '[{\"isDefault\":true,\"select_all\":true,\"first_weight\":1000,\"first_fee\":10,\"other_weight\":1000,\"other_fee\":8,\"addr_list\":[\"北京市\",\"天津市\",\"上海市\",\"重庆市\",\"河北省\",\"河南省\",\"云南省\",\"辽宁省\",\"黑龙江省\",\"湖南省\",\"安徽省\",\"山东省\",\"新疆\",\"江苏省\",\"浙江省\",\"江西省\",\"湖北省\",\"广西\",\"甘肃省\",\"山西省\",\"内蒙古\",\"陕西省\",\"吉林省\",\"福建省\",\"贵州省\",\"广东省\",\"青海省\",\"西藏\",\"四川省\",\"宁夏\",\"海南省\",\"台湾省\",\"香港\",\"澳门\"]}]', 1, '2019-04-24 07:44:24', '2019-04-24 07:44:24', NULL),
(2, '江浙沪包邮，其他10元', '[{\"isDefault\":false,\"select_all\":false,\"first_weight\":1000,\"first_fee\":\"0\",\"other_weight\":\"1000\",\"other_fee\":\"6\",\"addr_list\":[\"浙江省\",\"江苏省\",\"上海市\"]},{\"isDefault\":false,\"select_all\":false,\"first_weight\":1000,\"first_fee\":10,\"other_weight\":1000,\"other_fee\":8,\"addr_list\":[\"北京市\",\"天津市\",\"重庆市\",\"河北省\",\"河南省\",\"云南省\",\"辽宁省\",\"黑龙江省\",\"湖南省\",\"安徽省\",\"山东省\",\"新疆\",\"江西省\",\"湖北省\",\"广西\",\"甘肃省\",\"山西省\",\"内蒙古\",\"陕西省\",\"吉林省\",\"福建省\",\"贵州省\",\"广东省\",\"青海省\",\"西藏\",\"四川省\",\"宁夏\",\"海南省\",\"台湾省\",\"香港\",\"澳门\"]}]', 1, '2019-04-24 08:06:26', '2019-04-24 08:14:19', NULL);

-- --------------------------------------------------------

--
-- 表的结构 `maintenance`
--

CREATE TABLE `maintenance` (
  `id` int(10) UNSIGNED NOT NULL,
  `openid` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `username` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- 表的结构 `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- 转存表中的数据 `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(28, '2017_07_12_005242_create_userinfos_table', 4),
(29, '2017_07_12_062828_create_jobs_table', 5),
(30, '2017_07_12_065844_create_failed_jobs_table', 5),
(31, '2017_07_14_033437_create_orders_table', 5),
(32, '2017_07_14_063041_create_notifications_table', 6),
(33, '2017_07_21_151025_create_miaosha_table', 7),
(34, '2017_10_05_111131_create_news_table', 8),
(35, '2017_11_17_110031_create_permission_and_roles', 9),
(41, '2018_07_20_133437_create_case_table', 13),
(42, '2018_07_20_161740_create_banner_table', 14),
(43, '2018_08_08_154701_create_cash_table', 15),
(44, '2018_08_08_154730_create_discount_table', 16),
(45, '2018_08_14_092512_create_maintenance_table', 16),
(46, '2017_07_12_005308_create_groups_table', 17),
(47, '2017_07_12_005321_create_posts_table', 17),
(48, '2017_07_12_005451_create_countries_table', 17),
(49, '2017_07_12_005712_create_table_group_user', 17),
(50, '2017_12_08_163029_create_document_table', 17),
(51, '2018_03_19_154057_create_msg_table', 17),
(52, '2019_04_20_155246_create_goods_table', 18),
(53, '2019_04_22_094842_create_properties_table', 19),
(54, '2019_04_22_094934_create_sku_table', 19),
(55, '2019_04_23_135601_create_goods_images_table', 20),
(56, '2019_04_24_152606_create_logistics_table', 21),
(57, '2019_05_05_150650_create_address_table', 22),
(58, '2019_05_05_150757_create_ordergoods_table', 22);

-- --------------------------------------------------------

--
-- 表的结构 `miniuser`
--

CREATE TABLE `miniuser` (
  `id` int(11) NOT NULL,
  `openid` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `nickname` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `avatarurl` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `gender` int(11) NOT NULL DEFAULT '0',
  `city` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `province` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `country` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `code` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `parent_key` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `router` text COLLATE utf8_unicode_ci,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;

--
-- 转存表中的数据 `miniuser`
--

INSERT INTO `miniuser` (`id`, `openid`, `nickname`, `avatarurl`, `gender`, `city`, `province`, `country`, `code`, `parent_key`, `router`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'oXwK-4saIp98Lc0Jg-wOO7xfWGdI', '', '', 0, '', '', '', 'meYmvz', '1', '1,1', '2019-05-06 07:38:54', '2019-05-06 15:38:54', NULL);

-- --------------------------------------------------------

--
-- 表的结构 `news`
--

CREATE TABLE `news` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` text COLLATE utf8mb4_unicode_ci,
  `img` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- 表的结构 `notifications`
--

CREATE TABLE `notifications` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `notifiable_id` int(10) UNSIGNED NOT NULL,
  `notifiable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `data` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `read_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- 表的结构 `orders`
--

CREATE TABLE `orders` (
  `id` int(10) UNSIGNED NOT NULL,
  `orderid` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address_id` int(11) DEFAULT NULL,
  `mini_id` int(11) NOT NULL,
  `money` decimal(10,2) DEFAULT NULL,
  `pay_no` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pay_time` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- 转存表中的数据 `orders`
--

INSERT INTO `orders` (`id`, `orderid`, `address_id`, `mini_id`, `money`, `pay_no`, `pay_time`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, '20190522155039379595', 1, 1, '90.90', '', NULL, '2019-05-22 07:50:39', '2019-05-22 07:50:39', NULL),
(2, '20190522155140167758', 1, 1, '181.80', '', NULL, '2019-05-22 07:51:40', '2019-05-22 07:51:40', NULL);

-- --------------------------------------------------------

--
-- 表的结构 `order_goods`
--

CREATE TABLE `order_goods` (
  `id` int(10) UNSIGNED NOT NULL,
  `order_id` int(11) NOT NULL,
  `goods_id` int(11) NOT NULL,
  `num` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `goods_price` decimal(8,2) NOT NULL,
  `goods_img` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `goods_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `goods_sku` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` int(11) NOT NULL COMMENT '0初始未支付 1已支付 2已发货 3已完成 97已取消 98退款中 99已退款',
  `cash_status` int(11) NOT NULL COMMENT '0初始 1通过2不通过',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- 转存表中的数据 `order_goods`
--

INSERT INTO `order_goods` (`id`, `order_id`, `goods_id`, `num`, `goods_price`, `goods_img`, `goods_name`, `goods_sku`, `status`, `cash_status`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 4, '1', '90.90', '/uploads/goods/20190429/meFpZSvcZ30KI1wDZzCo1lNBxG4mGtq5b1BGOgrg.jpeg', '国酒茅台', '2:4', 0, 0, '2019-05-22 07:50:39', '2019-05-22 07:50:39', NULL),
(2, 2, 9, '1', '90.90', '/uploads/goods/20190429/A2a1fUk7hGW3Oza9Mgz79Ym7fOOpvUNkGNkjnHeZ.jpeg', 'X8', '16:', 0, 0, '2019-05-22 07:51:40', '2019-05-22 07:51:40', NULL),
(3, 2, 15, '1', '90.90', '/uploads/goods/20190429/z8VBCL43rHdGSEis0F97iKIy0TT0QW4likuUmKgD.jpeg', 'G5', '15:', 0, 0, '2019-05-22 07:51:40', '2019-05-22 07:51:40', NULL);

-- --------------------------------------------------------

--
-- 表的结构 `order_process`
--

CREATE TABLE `order_process` (
  `id` int(11) NOT NULL,
  `order_goods_id` int(11) NOT NULL,
  `status` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- 转存表中的数据 `order_process`
--

INSERT INTO `order_process` (`id`, `order_goods_id`, `status`, `created_at`, `updated_at`) VALUES
(1, 1, 'CREATE', '2019-05-22 07:50:39', '2019-05-22 15:50:39'),
(2, 2, 'CREATE', '2019-05-22 07:51:40', '2019-05-22 15:51:40'),
(3, 3, 'CREATE', '2019-05-22 07:51:40', '2019-05-22 15:51:40');

-- --------------------------------------------------------

--
-- 表的结构 `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- 表的结构 `permissions`
--

CREATE TABLE `permissions` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `desc` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- 转存表中的数据 `permissions`
--

INSERT INTO `permissions` (`id`, `name`, `desc`, `created_at`, `updated_at`, `deleted_at`) VALUES
(14, '用户管理', 'admin/user', '2018-03-08 02:38:00', '2018-03-08 02:38:00', NULL),
(15, '角色管理', 'admin/role', '2018-03-08 02:38:17', '2018-03-08 02:38:17', NULL),
(16, '权限管理', 'admin/privilege', '2018-03-08 02:38:34', '2018-03-08 02:38:34', NULL),
(17, '个人信息', 'admin/info', '2018-03-09 02:47:38', '2018-03-09 02:47:38', NULL),
(18, '修改密码', 'admin/chgpwd', '2018-03-09 02:48:37', '2018-03-09 05:26:19', NULL),
(26, '欢迎页面', 'admin/welcome', '2018-08-01 07:29:11', '2018-08-01 07:29:11', NULL),
(27, '密码支付设备', 'admin/pwddevice', '2018-08-01 08:32:51', '2019-04-19 02:00:33', '2019-04-19 02:00:33'),
(28, '设备消费', 'admin/deviceconsume', '2018-08-02 05:25:02', '2019-04-19 02:00:28', '2019-04-19 02:00:28'),
(29, '价格模板', 'admin/pricetpl', '2018-08-02 08:09:40', '2019-04-19 02:00:36', '2019-04-19 02:00:36'),
(30, '设备品牌', 'admin/probrand', '2018-08-10 01:56:30', '2019-04-19 02:00:24', '2019-04-19 02:00:24'),
(31, '设备消费统计', 'admin/devicestatistic', '2018-08-10 01:56:46', '2019-04-19 02:00:40', '2019-04-19 02:00:40'),
(32, '分成比列', 'admin/discount', '2018-08-10 01:57:00', '2018-09-10 02:44:39', NULL),
(33, '提现审核', 'admin/checkcash', '2018-08-10 01:57:12', '2018-08-10 01:57:12', NULL),
(34, '提现记录', 'admin/cashlog', '2018-08-10 01:57:23', '2018-08-10 01:57:23', NULL),
(35, '产品类型', 'admin/protype', '2018-08-11 07:34:16', '2019-04-19 02:01:02', '2019-04-19 02:01:02'),
(37, '维护人员', 'admin/maintenance', '2018-08-14 02:25:15', '2018-08-14 02:25:15', NULL),
(38, '我的子商家', 'admin/myagents', '2018-09-03 07:49:26', '2019-04-19 01:58:03', NULL),
(39, '商品列表', 'admin/goodslist', '2019-04-19 07:01:55', '2019-04-19 07:01:55', NULL),
(40, '商品类目', 'admin/category', '2019-04-22 05:11:45', '2019-04-22 05:11:45', NULL),
(41, '邮费设置', 'admin/logistics', '2019-04-24 02:28:21', '2019-04-24 02:28:21', NULL),
(42, '订单列表', 'admin/orderlist', '2019-05-08 09:20:50', '2019-05-08 09:20:50', NULL);

-- --------------------------------------------------------

--
-- 表的结构 `permission_role`
--

CREATE TABLE `permission_role` (
  `id` int(10) UNSIGNED NOT NULL,
  `permission_id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  `add_permission` int(11) NOT NULL DEFAULT '0',
  `delete_permission` int(11) NOT NULL DEFAULT '0',
  `update_permission` int(11) NOT NULL DEFAULT '0',
  `read_permission` int(11) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- 转存表中的数据 `permission_role`
--

INSERT INTO `permission_role` (`id`, `permission_id`, `role_id`, `add_permission`, `delete_permission`, `update_permission`, `read_permission`, `created_at`, `updated_at`) VALUES
(3, 1, 3, 1, 0, 0, 1, NULL, NULL),
(4, 2, 3, 0, 1, 0, 1, NULL, NULL),
(5, 4, 3, 0, 0, 1, 1, NULL, NULL),
(6, 2, 2, 0, 0, 1, 1, NULL, NULL),
(7, 7, 2, 1, 0, 0, 1, NULL, NULL),
(8, 10, 2, 0, 1, 0, 1, NULL, NULL),
(9, 13, 2, 0, 0, 0, 1, NULL, NULL),
(10, 4, 1, 1, 1, 1, 1, NULL, NULL),
(11, 7, 1, 1, 1, 1, 1, NULL, NULL),
(12, 9, 1, 1, 1, 1, 1, NULL, NULL),
(13, 13, 1, 1, 1, 1, 1, NULL, NULL),
(14, 1, 1, 1, 1, 1, 1, NULL, NULL),
(15, 2, 1, 1, 1, 1, 1, NULL, NULL),
(16, 5, 1, 1, 1, 1, 1, NULL, NULL),
(17, 8, 1, 1, 1, 1, 1, NULL, NULL),
(18, 10, 1, 1, 1, 1, 1, NULL, NULL),
(19, 11, 1, 1, 1, 1, 1, NULL, NULL),
(20, 12, 1, 1, 1, 1, 1, NULL, NULL),
(21, 14, 1, 1, 1, 1, 1, NULL, NULL),
(22, 15, 1, 1, 1, 1, 1, NULL, NULL),
(23, 16, 1, 1, 1, 1, 1, NULL, NULL),
(24, 12, 3, 1, 1, 1, 1, NULL, NULL),
(25, 1, 2, 1, 1, 1, 1, NULL, NULL),
(26, 4, 2, 1, 1, 1, 1, NULL, NULL),
(27, 17, 1, 1, 1, 1, 1, NULL, NULL),
(28, 18, 1, 1, 1, 1, 1, NULL, NULL),
(29, 19, 1, 1, 1, 1, 1, NULL, NULL),
(30, 20, 1, 1, 1, 1, 1, NULL, NULL),
(31, 21, 1, 1, 1, 1, 1, NULL, NULL),
(32, 22, 1, 1, 1, 1, 1, NULL, NULL),
(33, 23, 1, 1, 1, 1, 1, NULL, NULL),
(34, 24, 1, 1, 1, 1, 1, NULL, NULL),
(35, 25, 1, 1, 1, 1, 1, NULL, NULL),
(36, 26, 1, 1, 1, 1, 1, NULL, NULL),
(37, 27, 1, 1, 1, 1, 1, NULL, NULL),
(38, 28, 1, 1, 1, 1, 1, NULL, NULL),
(39, 29, 1, 1, 1, 1, 1, NULL, NULL),
(40, 30, 1, 1, 1, 1, 1, NULL, NULL),
(41, 31, 1, 1, 1, 1, 1, NULL, NULL),
(42, 32, 1, 1, 1, 1, 1, NULL, NULL),
(43, 33, 1, 1, 1, 1, 1, NULL, NULL),
(44, 34, 1, 1, 1, 1, 1, NULL, NULL),
(45, 17, 4, 1, 1, 1, 1, NULL, NULL),
(46, 18, 4, 1, 1, 1, 1, NULL, NULL),
(47, 26, 4, 1, 1, 1, 1, NULL, NULL),
(48, 28, 4, 1, 1, 1, 1, NULL, NULL),
(51, 31, 4, 1, 1, 1, 1, NULL, NULL),
(52, 34, 4, 1, 1, 1, 1, NULL, NULL),
(53, 35, 1, 1, 1, 1, 1, '2018-08-11 07:34:23', '2018-08-11 07:34:23'),
(54, 36, 1, 1, 1, 1, 1, '2018-08-11 07:34:43', '2018-08-11 07:34:43'),
(55, 37, 1, 1, 1, 1, 1, '2018-08-14 02:25:22', '2018-08-14 02:25:22'),
(56, 27, 4, 1, 0, 1, 1, '2018-08-17 01:05:02', '2018-08-17 01:05:02'),
(57, 17, 5, 0, 0, 1, 1, '2018-08-17 01:06:03', '2018-08-17 01:06:03'),
(58, 18, 5, 0, 0, 1, 1, '2018-08-17 01:06:03', '2018-08-17 01:06:03'),
(59, 26, 5, 0, 0, 0, 1, '2018-08-17 01:06:03', '2018-08-17 01:06:03'),
(62, 31, 5, 0, 0, 0, 1, '2018-08-17 01:06:03', '2018-08-17 01:06:03'),
(63, 34, 5, 0, 0, 1, 1, '2018-08-17 01:06:03', '2018-08-17 01:06:03'),
(65, 17, 3, 1, 1, 1, 1, '2018-08-28 06:50:30', '2018-08-28 06:50:30'),
(66, 18, 3, 1, 1, 1, 1, '2018-08-28 06:50:30', '2018-08-28 06:50:30'),
(67, 28, 3, 1, 1, 1, 1, '2018-08-28 06:50:31', '2018-08-28 06:50:31'),
(68, 31, 3, 0, 1, 1, 1, '2018-08-28 06:50:31', '2018-08-28 06:50:31'),
(69, 32, 3, 1, 1, 1, 1, '2018-08-28 06:50:31', '2018-08-28 06:50:31'),
(70, 33, 3, 1, 1, 1, 1, '2018-08-28 06:50:31', '2018-08-28 06:50:31'),
(71, 34, 3, 1, 1, 1, 1, '2018-08-28 06:50:31', '2018-08-28 06:50:31'),
(83, 35, 4, 0, 0, 0, 1, '2018-08-29 07:51:20', '2018-08-29 07:51:20'),
(85, 17, 6, 1, 1, 1, 1, '2018-08-30 06:50:17', '2018-08-30 06:50:17'),
(86, 18, 6, 1, 1, 1, 1, '2018-08-30 06:50:17', '2018-08-30 06:50:17'),
(87, 27, 6, 0, 0, 0, 1, '2018-08-30 06:50:17', '2018-08-30 06:50:17'),
(88, 28, 6, 0, 0, 0, 1, '2018-08-30 06:50:17', '2018-08-30 06:50:17'),
(89, 31, 6, 0, 0, 0, 1, '2018-08-30 06:50:17', '2018-08-30 06:50:17'),
(90, 26, 6, 0, 0, 0, 1, '2018-08-30 07:08:23', '2018-08-30 07:08:23'),
(92, 17, 2, 1, 1, 1, 1, '2018-09-03 02:45:00', '2018-09-03 02:45:00'),
(93, 18, 2, 1, 1, 1, 1, '2018-09-03 02:45:00', '2018-09-03 02:45:00'),
(94, 26, 2, 1, 1, 1, 1, '2018-09-03 02:45:00', '2018-09-03 02:45:00'),
(95, 27, 2, 1, 0, 1, 1, '2018-09-03 02:45:00', '2018-09-03 02:45:00'),
(96, 28, 2, 1, 1, 1, 1, '2018-09-03 02:45:00', '2018-09-03 02:45:00'),
(97, 29, 2, 1, 1, 1, 1, '2018-09-03 02:45:00', '2018-09-03 02:45:00'),
(98, 31, 2, 1, 0, 1, 1, '2018-09-03 02:45:00', '2018-09-03 02:45:00'),
(100, 38, 4, 1, 0, 1, 1, '2018-09-03 07:51:24', '2018-09-03 07:51:24'),
(101, 27, 3, 1, 0, 0, 1, '2018-09-07 08:13:17', '2018-09-07 08:13:17'),
(102, 29, 3, 1, 1, 1, 1, '2018-09-07 08:13:17', '2018-09-07 08:13:17'),
(103, 14, 2, 1, 0, 0, 1, '2018-09-07 08:16:40', '2018-09-07 08:16:40'),
(104, 15, 2, 1, 0, 1, 1, '2018-09-07 08:16:40', '2018-09-07 08:16:40'),
(105, 16, 2, 0, 0, 0, 1, '2018-09-07 08:16:40', '2018-09-07 08:16:40'),
(106, 32, 2, 1, 0, 1, 1, '2018-09-07 08:16:40', '2018-09-07 08:16:40'),
(107, 37, 2, 1, 0, 1, 1, '2018-09-07 08:16:40', '2018-09-07 08:16:40'),
(108, 38, 2, 1, 0, 1, 1, '2018-09-07 08:16:40', '2018-09-07 08:16:40'),
(109, 30, 2, 1, 0, 1, 1, '2018-09-08 06:27:24', '2018-09-08 06:27:24'),
(110, 35, 2, 1, 1, 1, 1, '2018-09-08 06:27:24', '2018-09-08 06:27:24'),
(113, 17, 7, 1, 0, 0, 1, '2018-09-19 08:38:29', '2018-09-19 08:38:29'),
(114, 18, 7, 1, 0, 0, 1, '2018-09-19 08:38:29', '2018-09-19 08:38:29'),
(115, 27, 7, 0, 0, 1, 1, '2018-09-19 08:38:29', '2018-09-19 08:38:29'),
(116, 28, 7, 1, 0, 1, 1, '2018-09-19 08:38:29', '2018-09-19 08:38:29'),
(117, 29, 7, 1, 1, 1, 1, '2018-09-19 08:38:29', '2018-09-19 08:38:29'),
(118, 30, 7, 1, 0, 1, 1, '2018-09-19 08:38:29', '2018-09-19 08:38:29'),
(119, 31, 7, 1, 0, 1, 1, '2018-09-19 08:38:29', '2018-09-19 08:38:29'),
(120, 32, 7, 1, 0, 1, 1, '2018-09-19 08:38:29', '2018-09-19 08:38:29'),
(122, 26, 7, 1, 1, 1, 1, '2018-09-19 08:42:33', '2018-09-19 08:42:33'),
(123, 35, 7, 1, 0, 1, 1, '2018-09-19 08:42:33', '2018-09-19 08:42:33'),
(124, 28, 5, 0, 0, 0, 1, '2018-09-19 10:59:57', '2018-09-19 10:59:57'),
(125, 27, 5, 0, 0, 0, 1, '2018-09-19 11:02:08', '2018-09-19 11:02:08'),
(126, 29, 4, 0, 0, 0, 1, '2018-10-09 07:16:23', '2018-10-09 07:16:23'),
(127, 37, 7, 1, 0, 0, 1, '2018-10-09 23:16:13', '2018-10-09 23:16:13'),
(128, 38, 7, 1, 0, 1, 1, '2018-10-09 23:16:13', '2018-10-09 23:16:13'),
(129, 37, 4, 1, 1, 1, 1, '2019-04-19 06:45:05', '2019-04-19 06:45:05'),
(130, 39, 1, 1, 1, 1, 1, '2019-04-19 07:03:22', '2019-04-19 07:03:22'),
(131, 40, 1, 1, 1, 1, 1, '2019-04-22 05:11:53', '2019-04-22 05:11:53'),
(132, 41, 1, 1, 1, 1, 1, '2019-04-24 02:28:32', '2019-04-24 02:28:32'),
(133, 42, 1, 1, 1, 1, 1, '2019-05-08 09:21:05', '2019-05-08 09:21:05');

-- --------------------------------------------------------

--
-- 表的结构 `properties`
--

CREATE TABLE `properties` (
  `id` int(11) NOT NULL,
  `title` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '商品属性标题',
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '商品属性选项',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- 转存表中的数据 `properties`
--

INSERT INTO `properties` (`id`, `title`, `name`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, '颜色', '红色', '2019-04-23 02:05:47', '2019-04-23 02:05:47', NULL),
(2, '颜色', '黄色', '2019-04-23 02:05:47', '2019-04-23 02:05:47', NULL),
(3, '尺寸', '35', '2019-04-23 02:05:47', '2019-04-23 02:05:47', NULL),
(4, '尺寸', '36', '2019-04-23 02:05:47', '2019-04-23 02:05:47', NULL),
(5, '尺寸', '37', '2019-04-23 02:05:47', '2019-04-23 02:05:47', NULL),
(6, '尺寸', '38', '2019-04-24 00:53:50', '2019-04-24 00:53:50', NULL),
(15, '颜色', '黄古铜', '2019-04-29 05:37:49', '2019-04-29 05:37:49', NULL),
(16, '颜色', '青古铜', '2019-04-29 05:37:49', '2019-04-29 05:37:49', NULL),
(17, '颜色', '黑色', '2019-04-29 05:39:51', '2019-04-29 05:39:51', NULL);

-- --------------------------------------------------------

--
-- 表的结构 `roles`
--

CREATE TABLE `roles` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `desc` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- 转存表中的数据 `roles`
--

INSERT INTO `roles` (`id`, `name`, `desc`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, '管理员', '系统管理员，最高权限', '2018-02-28 03:10:30', '2018-08-17 01:01:27', NULL),
(2, '运营', '运营', '2018-02-28 03:58:50', '2019-04-19 01:36:13', NULL),
(3, '财务', '公司财务组', '2018-02-28 03:59:11', '2018-08-17 01:01:08', NULL),
(4, '入住商家', '入住商家', '2018-08-10 05:22:02', '2019-04-19 01:31:46', NULL),
(5, '直营商家', '直营商家', '2018-08-17 01:05:30', '2019-04-19 01:31:32', NULL),
(6, '入住商家子商家', '入住商家子商家', '2018-08-30 04:53:47', '2019-04-19 01:31:54', NULL),
(7, '市场维护', '市场维护', '2018-09-08 08:53:56', '2018-09-28 06:46:21', NULL);

-- --------------------------------------------------------

--
-- 表的结构 `role_user`
--

CREATE TABLE `role_user` (
  `id` int(10) UNSIGNED NOT NULL,
  `role_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- 转存表中的数据 `role_user`
--

INSERT INTO `role_user` (`id`, `role_id`, `user_id`, `created_at`, `updated_at`) VALUES
(2, 2, 3, NULL, NULL),
(6, 3, 1, NULL, NULL),
(9, 1, 4, NULL, NULL),
(10, 4, 8, '2018-08-15 02:26:20', '2018-08-15 02:26:20'),
(11, 4, 9, '2018-08-15 02:40:27', '2018-08-15 02:40:27'),
(12, 1, 2, '2018-08-17 07:26:24', '2018-08-17 07:26:24'),
(13, 5, 12, '2018-08-17 07:53:03', '2018-08-17 07:53:03'),
(14, 4, 14, '2018-08-27 14:15:02', '2018-08-27 14:15:02'),
(15, 4, 15, '2018-08-27 14:21:11', '2018-08-27 14:21:11'),
(16, 6, 16, '2018-08-30 06:43:38', '2018-08-30 06:43:38'),
(19, 4, 17, '2018-08-30 06:58:42', '2018-08-30 06:58:42'),
(20, 6, 18, '2018-08-30 07:04:37', '2018-08-30 07:04:37'),
(21, 1, 19, '2018-08-30 18:54:27', '2018-08-30 18:54:27'),
(22, 4, 20, '2018-08-31 06:02:56', '2018-08-31 06:02:56'),
(23, 4, 21, '2018-09-02 16:35:54', '2018-09-02 16:35:54'),
(24, 3, 22, '2018-09-03 02:42:27', '2018-09-03 02:42:27'),
(26, 4, 24, '2018-09-05 03:51:33', '2018-09-05 03:51:33'),
(28, 6, 26, '2018-09-08 13:01:31', '2018-09-08 13:01:31'),
(29, 5, 27, '2018-09-09 08:57:18', '2018-09-09 08:57:18'),
(30, 5, 28, '2018-09-09 09:06:18', '2018-09-09 09:06:18'),
(31, 5, 29, '2018-09-09 09:19:57', '2018-09-09 09:19:57'),
(32, 5, 30, '2018-09-09 09:46:14', '2018-09-09 09:46:14'),
(33, 5, 31, '2018-09-09 18:35:27', '2018-09-09 18:35:27'),
(34, 5, 32, '2018-09-11 05:31:18', '2018-09-11 05:31:18'),
(36, 6, 34, '2018-09-13 02:33:09', '2018-09-13 02:33:09'),
(37, 6, 35, '2018-09-13 03:01:11', '2018-09-13 03:01:11'),
(38, 6, 36, '2018-09-13 03:03:03', '2018-09-13 03:03:03'),
(39, 6, 37, '2018-09-13 03:04:18', '2018-09-13 03:04:18'),
(40, 6, 38, '2018-09-13 03:17:10', '2018-09-13 03:17:10'),
(41, 6, 39, '2018-09-13 07:11:17', '2018-09-13 07:11:17'),
(42, 6, 40, '2018-09-13 07:16:11', '2018-09-13 07:16:11'),
(43, 6, 41, '2018-09-13 07:19:04', '2018-09-13 07:19:04'),
(44, 6, 42, '2018-09-13 07:20:30', '2018-09-13 07:20:30'),
(45, 4, 43, '2018-09-13 10:58:03', '2018-09-13 10:58:03'),
(46, 6, 44, '2018-09-13 14:54:23', '2018-09-13 14:54:23'),
(47, 6, 45, '2018-09-14 03:22:51', '2018-09-14 03:22:51'),
(48, 4, 49, '2018-09-14 05:27:32', '2018-09-14 05:27:32'),
(49, 6, 50, '2018-09-14 05:55:29', '2018-09-14 05:55:29'),
(50, 6, 51, '2018-09-14 06:04:30', '2018-09-14 06:04:30'),
(51, 6, 52, '2018-09-14 06:34:35', '2018-09-14 06:34:35'),
(52, 6, 53, '2018-09-15 10:32:28', '2018-09-15 10:32:28'),
(53, 6, 54, '2018-09-15 11:38:41', '2018-09-15 11:38:41'),
(54, 6, 55, '2018-09-15 12:45:28', '2018-09-15 12:45:28'),
(55, 5, 56, '2018-09-16 04:36:08', '2018-09-16 04:36:08'),
(56, 5, 57, '2018-09-16 04:37:33', '2018-09-16 04:37:33'),
(57, 5, 58, '2018-09-16 04:39:21', '2018-09-16 04:39:21'),
(58, 5, 59, '2018-09-16 04:40:50', '2018-09-16 04:40:50'),
(59, 5, 60, '2018-09-16 04:44:46', '2018-09-16 04:44:46'),
(60, 4, 61, '2018-09-16 08:04:17', '2018-09-16 08:04:17'),
(61, 6, 62, '2018-09-16 09:15:31', '2018-09-16 09:15:31'),
(62, 5, 63, '2018-09-16 10:08:15', '2018-09-16 10:08:15'),
(63, 5, 64, '2018-09-16 10:09:51', '2018-09-16 10:09:51'),
(64, 5, 65, '2018-09-16 10:14:19', '2018-09-16 10:14:19'),
(65, 5, 66, '2018-09-16 10:16:10', '2018-09-16 10:16:10'),
(66, 5, 67, '2018-09-16 10:18:57', '2018-09-16 10:18:57'),
(67, 5, 68, '2018-09-16 10:27:01', '2018-09-16 10:27:01'),
(68, 5, 69, '2018-09-16 10:29:13', '2018-09-16 10:29:13'),
(69, 5, 70, '2018-09-16 10:30:59', '2018-09-16 10:30:59'),
(70, 6, 71, '2018-09-16 14:02:26', '2018-09-16 14:02:26'),
(71, 6, 72, '2018-09-16 15:51:55', '2018-09-16 15:51:55'),
(72, 6, 73, '2018-09-17 04:11:38', '2018-09-17 04:11:38'),
(73, 6, 74, '2018-09-17 05:05:06', '2018-09-17 05:05:06'),
(74, 4, 75, '2018-09-17 10:35:25', '2018-09-17 10:35:25'),
(75, 6, 76, '2018-09-17 12:17:58', '2018-09-17 12:17:58'),
(76, 6, 77, '2018-09-17 13:54:12', '2018-09-17 13:54:12'),
(77, 5, 78, '2018-09-18 00:50:29', '2018-09-18 00:50:29'),
(78, 5, 79, '2018-09-18 00:59:00', '2018-09-18 00:59:00'),
(79, 5, 80, '2018-09-18 01:01:39', '2018-09-18 01:01:39'),
(80, 5, 81, '2018-09-18 01:11:48', '2018-09-18 01:11:48'),
(81, 5, 82, '2018-09-18 01:13:14', '2018-09-18 01:13:14'),
(82, 5, 83, '2018-09-18 01:15:00', '2018-09-18 01:15:00'),
(83, 5, 84, '2018-09-18 01:16:20', '2018-09-18 01:16:20'),
(84, 5, 85, '2018-09-18 01:17:32', '2018-09-18 01:17:32'),
(85, 5, 86, '2018-09-18 01:19:01', '2018-09-18 01:19:01'),
(86, 5, 87, '2018-09-18 01:20:23', '2018-09-18 01:20:23'),
(87, 5, 88, '2018-09-18 01:21:25', '2018-09-18 01:21:25'),
(88, 5, 89, '2018-09-18 01:22:56', '2018-09-18 01:22:56'),
(89, 6, 90, '2018-09-18 02:06:56', '2018-09-18 02:06:56'),
(90, 5, 91, '2018-09-19 01:44:37', '2018-09-19 01:44:37'),
(91, 5, 92, '2018-09-19 01:46:09', '2018-09-19 01:46:09'),
(92, 5, 93, '2018-09-19 01:47:48', '2018-09-19 01:47:48'),
(93, 5, 94, '2018-09-19 01:49:15', '2018-09-19 01:49:15'),
(94, 5, 95, '2018-09-19 01:53:14', '2018-09-19 01:53:14'),
(95, 6, 96, '2018-09-19 02:49:56', '2018-09-19 02:49:56'),
(96, 6, 97, '2018-09-19 02:51:37', '2018-09-19 02:51:37'),
(97, 6, 98, '2018-09-19 05:19:15', '2018-09-19 05:19:15'),
(98, 5, 99, '2018-09-19 06:51:45', '2018-09-19 06:51:45'),
(99, 5, 100, '2018-09-19 06:53:16', '2018-09-19 06:53:16'),
(100, 5, 101, '2018-09-19 06:54:47', '2018-09-19 06:54:47'),
(101, 5, 102, '2018-09-19 06:55:54', '2018-09-19 06:55:54'),
(102, 5, 103, '2018-09-19 06:56:50', '2018-09-19 06:56:50'),
(103, 5, 104, '2018-09-19 06:57:54', '2018-09-19 06:57:54'),
(104, 5, 105, '2018-09-19 07:02:42', '2018-09-19 07:02:42'),
(105, 5, 106, '2018-09-19 07:03:45', '2018-09-19 07:03:45'),
(106, 5, 107, '2018-09-19 07:04:50', '2018-09-19 07:04:50'),
(107, 5, 108, '2018-09-19 07:05:50', '2018-09-19 07:05:50'),
(108, 5, 109, '2018-09-19 07:07:07', '2018-09-19 07:07:07'),
(109, 5, 110, '2018-09-19 07:09:38', '2018-09-19 07:09:38'),
(110, 5, 111, '2018-09-19 07:11:01', '2018-09-19 07:11:01'),
(111, 5, 112, '2018-09-19 07:13:52', '2018-09-19 07:13:52'),
(112, 5, 113, '2018-09-19 07:15:33', '2018-09-19 07:15:33'),
(113, 5, 114, '2018-09-19 07:16:52', '2018-09-19 07:16:52'),
(114, 5, 115, '2018-09-19 07:17:58', '2018-09-19 07:17:58'),
(115, 5, 116, '2018-09-19 07:19:08', '2018-09-19 07:19:08'),
(116, 7, 25, '2018-09-19 08:39:05', '2018-09-19 08:39:05'),
(117, 7, 23, '2018-09-19 08:39:14', '2018-09-19 08:39:14'),
(118, 6, 117, '2018-09-19 09:51:51', '2018-09-19 09:51:51'),
(119, 6, 118, '2018-09-19 09:54:04', '2018-09-19 09:54:04'),
(120, 6, 119, '2018-09-20 09:02:23', '2018-09-20 09:02:23'),
(121, 6, 120, '2018-09-21 03:18:21', '2018-09-21 03:18:21'),
(122, 6, 121, '2018-09-23 02:00:49', '2018-09-23 02:00:49'),
(123, 6, 122, '2018-09-25 09:46:43', '2018-09-25 09:46:43'),
(125, 6, 124, '2018-09-26 04:03:49', '2018-09-26 04:03:49'),
(126, 6, 125, '2018-09-26 04:25:38', '2018-09-26 04:25:38'),
(128, 6, 127, '2018-09-28 07:00:46', '2018-09-28 07:00:46'),
(129, 7, 128, '2018-09-28 07:02:17', '2018-09-28 07:02:17'),
(130, 7, 129, '2018-09-28 07:03:49', '2018-09-28 07:03:49'),
(131, 6, 131, '2018-09-28 07:24:10', '2018-09-28 07:24:10'),
(132, 6, 132, '2018-09-28 07:36:20', '2018-09-28 07:36:20'),
(133, 6, 133, '2018-09-28 07:41:47', '2018-09-28 07:41:47'),
(134, 5, 134, '2018-09-28 08:55:30', '2018-09-28 08:55:30'),
(135, 5, 135, '2018-09-28 08:57:19', '2018-09-28 08:57:19'),
(136, 5, 136, '2018-09-28 08:58:49', '2018-09-28 08:58:49'),
(137, 5, 137, '2018-09-28 09:00:12', '2018-09-28 09:00:12'),
(138, 5, 138, '2018-09-28 09:01:32', '2018-09-28 09:01:32'),
(139, 5, 139, '2018-09-28 09:03:03', '2018-09-28 09:03:03'),
(140, 5, 140, '2018-09-28 09:04:48', '2018-09-28 09:04:48'),
(141, 5, 141, '2018-09-28 09:16:20', '2018-09-28 09:16:20'),
(142, 5, 142, '2018-09-28 09:16:27', '2018-09-28 09:16:27'),
(143, 5, 143, '2018-09-28 09:18:00', '2018-09-28 09:18:00'),
(144, 5, 144, '2018-09-28 09:19:52', '2018-09-28 09:19:52'),
(146, 7, 146, '2018-09-28 10:06:30', '2018-09-28 10:06:30'),
(149, 2, 147, '2018-09-28 13:50:18', '2018-09-28 13:50:18'),
(150, 3, 148, '2018-09-28 14:07:22', '2018-09-28 14:07:22'),
(151, 2, 149, '2018-09-28 14:11:46', '2018-09-28 14:11:46'),
(152, 7, 150, '2018-09-28 14:12:32', '2018-09-28 14:12:32'),
(153, 2, 151, '2018-09-28 15:14:54', '2018-09-28 15:14:54'),
(154, 6, 152, '2018-09-28 15:23:08', '2018-09-28 15:23:08'),
(156, 5, 145, '2018-09-29 01:32:53', '2018-09-29 01:32:53'),
(157, 6, 153, '2018-09-29 12:12:26', '2018-09-29 12:12:26'),
(158, 6, 154, '2018-09-29 12:34:47', '2018-09-29 12:34:47'),
(159, 6, 155, '2018-09-29 12:54:15', '2018-09-29 12:54:15'),
(160, 6, 156, '2018-09-30 09:34:13', '2018-09-30 09:34:13'),
(161, 5, 157, '2018-09-30 15:41:35', '2018-09-30 15:41:35'),
(162, 5, 158, '2018-09-30 15:49:49', '2018-09-30 15:49:49'),
(163, 6, 159, '2018-10-01 06:31:59', '2018-10-01 06:31:59'),
(164, 6, 160, '2018-10-01 06:34:17', '2018-10-01 06:34:17'),
(165, 2, 161, '2018-10-01 08:06:37', '2018-10-01 08:06:37'),
(166, 2, 162, '2018-10-01 12:41:36', '2018-10-01 12:41:36'),
(167, 6, 163, '2018-10-01 13:10:24', '2018-10-01 13:10:24'),
(168, 6, 164, '2018-10-01 14:26:31', '2018-10-01 14:26:31'),
(169, 6, 165, '2018-10-02 09:52:19', '2018-10-02 09:52:19'),
(170, 6, 166, '2018-10-02 10:02:14', '2018-10-02 10:02:14'),
(171, 6, 167, '2018-10-03 14:46:21', '2018-10-03 14:46:21'),
(172, 6, 168, '2018-10-03 14:52:29', '2018-10-03 14:52:29'),
(173, 6, 169, '2018-10-03 15:08:23', '2018-10-03 15:08:23'),
(174, 6, 170, '2018-10-03 15:32:37', '2018-10-03 15:32:37'),
(175, 6, 171, '2018-10-03 15:34:40', '2018-10-03 15:34:40'),
(176, 6, 172, '2018-10-03 15:37:24', '2018-10-03 15:37:24'),
(177, 6, 173, '2018-10-04 06:53:27', '2018-10-04 06:53:27'),
(178, 6, 174, '2018-10-04 11:55:56', '2018-10-04 11:55:56'),
(179, 4, 175, '2018-10-05 01:39:41', '2018-10-05 01:39:41'),
(180, 6, 176, '2018-10-05 01:41:51', '2018-10-05 01:41:51'),
(181, 6, 177, '2018-10-05 01:42:35', '2018-10-05 01:42:35'),
(182, 6, 178, '2018-10-05 02:11:00', '2018-10-05 02:11:00'),
(183, 6, 179, '2018-10-05 11:29:08', '2018-10-05 11:29:08'),
(184, 6, 180, '2018-10-05 11:46:25', '2018-10-05 11:46:25'),
(185, 6, 181, '2018-10-05 12:55:49', '2018-10-05 12:55:49'),
(186, 6, 182, '2018-10-06 08:46:26', '2018-10-06 08:46:26'),
(187, 6, 183, '2018-10-06 08:56:16', '2018-10-06 08:56:16'),
(188, 7, 184, '2018-10-06 09:04:12', '2018-10-06 09:04:12'),
(189, 6, 185, '2018-10-06 10:31:09', '2018-10-06 10:31:09'),
(190, 2, 186, '2018-10-06 12:05:37', '2018-10-06 12:05:37'),
(191, 4, 187, '2018-10-07 12:53:13', '2018-10-07 12:53:13'),
(192, 5, 188, '2018-10-07 12:55:28', '2018-10-07 12:55:28'),
(193, 6, 189, '2018-10-08 01:01:21', '2018-10-08 01:01:21'),
(194, 4, 190, '2018-10-08 01:24:39', '2018-10-08 01:24:39'),
(195, 6, 191, '2018-10-08 01:26:39', '2018-10-08 01:26:39'),
(197, 6, 192, '2018-10-08 13:49:55', '2018-10-08 13:49:55'),
(198, 6, 193, '2018-10-08 13:51:51', '2018-10-08 13:51:51'),
(199, 6, 194, '2018-10-08 15:55:23', '2018-10-08 15:55:23'),
(200, 5, 195, '2018-10-09 00:59:36', '2018-10-09 00:59:36'),
(201, 6, 196, '2018-10-09 04:06:23', '2018-10-09 04:06:23'),
(203, 2, 197, '2018-10-09 07:30:51', '2018-10-09 07:30:51'),
(204, 4, 123, '2018-10-09 07:32:06', '2018-10-09 07:32:06'),
(205, 5, 33, '2018-10-09 23:12:15', '2018-10-09 23:12:15'),
(206, 6, 198, '2018-10-10 03:55:11', '2018-10-10 03:55:11'),
(207, 6, 199, '2018-10-10 05:29:37', '2018-10-10 05:29:37'),
(208, 6, 200, '2018-10-10 06:07:35', '2018-10-10 06:07:35'),
(209, 3, 201, '2019-04-19 02:23:22', '2019-04-19 02:23:22'),
(210, 2, 202, '2019-04-19 02:23:34', '2019-04-19 02:23:34'),
(211, 7, 203, '2019-04-19 02:23:40', '2019-04-19 02:23:40'),
(212, 5, 204, '2019-04-19 02:23:46', '2019-04-19 02:23:46'),
(213, 4, 205, '2019-04-19 02:23:51', '2019-04-19 02:23:51'),
(214, 4, 206, '2019-04-19 02:23:58', '2019-04-19 02:23:58'),
(215, 6, 207, '2019-04-19 02:24:02', '2019-04-19 02:24:02'),
(216, 6, 208, '2019-04-19 02:24:07', '2019-04-19 02:24:07'),
(217, 6, 209, '2019-04-19 02:24:10', '2019-04-19 02:24:10'),
(218, 6, 210, '2019-04-19 02:24:13', '2019-04-19 02:24:13'),
(219, 6, 211, '2019-04-19 05:36:51', '2019-04-19 05:36:51'),
(220, 6, 212, '2019-04-19 05:37:36', '2019-04-19 05:37:36'),
(221, 7, 213, '2019-04-19 06:26:25', '2019-04-19 06:26:25'),
(222, 2, 214, '2019-04-19 06:27:16', '2019-04-19 06:27:16');

-- --------------------------------------------------------

--
-- 表的结构 `sku`
--

CREATE TABLE `sku` (
  `id` int(11) NOT NULL,
  `goods_id` int(11) NOT NULL,
  `first_properties_id` int(11) NOT NULL,
  `second_properties_id` int(11) DEFAULT NULL,
  `num` int(11) NOT NULL COMMENT '库存',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- 转存表中的数据 `sku`
--

INSERT INTO `sku` (`id`, `goods_id`, `first_properties_id`, `second_properties_id`, `num`, `created_at`, `updated_at`, `deleted_at`) VALUES
(25, 4, 1, 3, 100, '2019-04-24 00:53:50', '2019-04-24 01:35:29', NULL),
(26, 4, 1, 4, 20, '2019-04-24 00:53:50', '2019-04-24 00:53:50', NULL),
(27, 4, 1, 5, 30, '2019-04-24 00:53:50', '2019-04-24 00:53:50', NULL),
(28, 4, 1, 6, 80, '2019-04-24 00:53:50', '2019-04-24 00:53:50', NULL),
(29, 4, 2, 3, 40, '2019-04-24 00:53:50', '2019-04-24 00:53:50', NULL),
(30, 4, 2, 4, 50, '2019-04-24 00:53:50', '2019-04-24 00:53:50', NULL),
(31, 4, 2, 5, 60, '2019-04-24 00:53:50', '2019-04-24 00:53:50', NULL),
(32, 4, 2, 6, 70, '2019-04-24 00:53:50', '2019-04-24 00:53:50', NULL),
(33, 9, 15, NULL, 10, '2019-04-29 05:37:49', '2019-04-29 05:37:49', NULL),
(34, 9, 16, NULL, 20, '2019-04-29 05:37:49', '2019-04-29 05:37:49', NULL),
(35, 9, 15, NULL, 20, '2019-04-29 05:38:53', '2019-04-29 05:38:53', NULL),
(36, 9, 16, NULL, 20, '2019-04-29 05:38:53', '2019-04-29 05:38:53', NULL),
(37, 10, 17, NULL, 10, '2019-04-29 05:39:51', '2019-04-29 05:39:51', NULL),
(38, 11, 15, NULL, 56, '2019-04-29 05:40:57', '2019-05-05 09:29:22', '2019-05-05 09:29:22'),
(39, 12, 17, NULL, 40, '2019-04-29 05:41:38', '2019-04-29 05:41:38', NULL),
(40, 13, 15, NULL, 0, '2019-04-29 05:42:38', '2019-04-29 05:42:38', NULL),
(41, 14, 15, NULL, 30, '2019-04-29 05:43:21', '2019-04-29 05:43:21', NULL),
(42, 15, 15, NULL, 30, '2019-04-29 05:44:01', '2019-04-29 05:44:01', NULL),
(43, 16, 17, NULL, 89, '2019-04-29 05:44:42', '2019-04-29 05:44:42', NULL),
(44, 17, 15, NULL, 0, '2019-04-29 05:45:51', '2019-04-29 05:45:51', NULL),
(45, 10, 17, NULL, 10, '2019-05-04 01:58:14', '2019-05-04 01:58:14', NULL),
(46, 10, 17, NULL, 10, '2019-05-04 01:59:59', '2019-05-04 01:59:59', NULL),
(47, 11, 15, NULL, 56, '2019-05-05 09:02:59', '2019-05-05 09:29:22', '2019-05-05 09:29:22'),
(48, 11, 15, NULL, 56, '2019-05-05 09:06:20', '2019-05-05 09:29:22', '2019-05-05 09:29:22'),
(49, 11, 15, NULL, 56, '2019-05-05 09:08:38', '2019-05-05 09:29:22', '2019-05-05 09:29:22'),
(50, 11, 15, NULL, 56, '2019-05-05 09:09:58', '2019-05-05 09:29:22', '2019-05-05 09:29:22'),
(53, 11, 15, NULL, 56, '2019-05-05 09:13:52', '2019-05-05 09:29:22', '2019-05-05 09:29:22'),
(54, 11, 15, NULL, 56, '2019-05-05 09:17:15', '2019-05-05 09:29:22', '2019-05-05 09:29:22'),
(55, 11, 15, NULL, 56, '2019-05-05 09:17:54', '2019-05-05 09:29:22', '2019-05-05 09:29:22'),
(58, 11, 15, NULL, 56, '2019-05-05 09:20:11', '2019-05-05 09:29:22', '2019-05-05 09:29:22'),
(59, 11, 15, NULL, 56, '2019-05-05 09:22:34', '2019-05-05 09:29:22', '2019-05-05 09:29:22'),
(61, 11, 15, NULL, 56, '2019-05-05 09:29:22', '2019-05-05 09:32:43', '2019-05-05 09:32:43'),
(62, 11, 15, NULL, 56, '2019-05-05 09:32:43', '2019-05-05 09:32:43', NULL),
(63, 11, 15, NULL, 56, '2019-05-06 01:56:32', '2019-05-06 02:09:54', '2019-05-06 02:09:54'),
(64, 11, 15, NULL, 56, '2019-05-06 02:01:52', '2019-05-06 02:09:54', '2019-05-06 02:09:54'),
(65, 11, 15, NULL, 56, '2019-05-06 02:03:27', '2019-05-06 02:09:54', '2019-05-06 02:09:54'),
(66, 11, 16, NULL, 20, '2019-05-06 02:14:56', '2019-05-06 02:14:56', NULL);

-- --------------------------------------------------------

--
-- 表的结构 `tree`
--

CREATE TABLE `tree` (
  `id` int(11) NOT NULL,
  `path` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `label` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `level` int(11) NOT NULL DEFAULT '0' COMMENT '层级',
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_root` int(11) NOT NULL DEFAULT '0',
  `sort` int(11) NOT NULL DEFAULT '0',
  `is_open` int(11) NOT NULL DEFAULT '0' COMMENT '首页是否显示 1时候  0否',
  `img_url` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `content` text COLLATE utf8_unicode_ci,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- 转存表中的数据 `tree`
--

INSERT INTO `tree` (`id`, `path`, `label`, `level`, `description`, `is_root`, `sort`, `is_open`, `img_url`, `content`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, '1', '全部', 1, '感悟人生真谛,让设计与生活互动', 1, 1, 1, '/uploads/20180725/jR3FzTC6cObhgQ8LBqj5qsLgLySwnLM9ILT5lnFx.jpeg', NULL, '2018-07-19 07:47:20', NULL, NULL),
(66, '1/66', '家居家装', 2, NULL, 0, 3, 1, '/uploads/20180725/jR3FzTC6cObhgQ8LBqj5qsLgLySwnLM9ILT5lnFx.jpeg', NULL, '2017-03-10 02:15:59', '2019-04-23 11:31:03', NULL),
(69, '1/69', '汽车精密检具', 2, '感悟人生真谛,让设计与生活互动', 0, 4, 1, '/uploads/20180725/XNJx7EvxgSmFoaG4Pj3EnPd2k699qj0rnL1CUitr.jpeg', NULL, '2017-03-10 02:17:16', '2019-04-22 13:19:14', '2019-04-22 13:19:14'),
(75, '1/75', '运动专区', 2, NULL, 0, 1, 1, '/uploads/20190429/ti6YLAgmW6VBZ8gCFKTsARnrRSGpg62vnMYkPRRt.jpeg', NULL, '2017-03-10 05:50:08', '2019-04-29 16:28:44', NULL),
(86, '1/86', '母婴用品', 2, NULL, 0, 2, 1, '/uploads/20190429/OHA4JtOQBoqXv782tATUtue5NqnV8yuJo7J5OdnP.jpeg', NULL, '2017-04-21 02:36:20', '2019-04-29 16:28:57', NULL),
(92, '1/92', '大型综合机加工', 2, '感悟人生真谛,让设计与生活互动', 0, 5, 1, '/uploads/20180725/XNJx7EvxgSmFoaG4Pj3EnPd2k699qj0rnL1CUitr.jpeg', '<p>world</p>', '2018-07-19 06:52:23', '2019-04-22 13:19:09', '2019-04-22 13:19:09'),
(94, '1/75/94', '耐克', 3, NULL, 0, 1, 1, '/uploads/20180725/jR3FzTC6cObhgQ8LBqj5qsLgLySwnLM9ILT5lnFx.jpeg', NULL, '2018-07-19 07:54:23', '2019-04-23 11:31:10', NULL),
(95, '1/75/95', '阿迪达斯', 3, NULL, 0, 2, 1, '/uploads/20180725/efXaqXmcWMTUqU3hyXc3OiPZctjnj3ZfHBpbmQel.jpeg', NULL, '2018-07-19 07:55:13', '2019-04-23 11:31:17', NULL),
(96, '1/75/96', '李宁', 3, NULL, 0, 3, 1, '/uploads/20180725/XNJx7EvxgSmFoaG4Pj3EnPd2k699qj0rnL1CUitr.jpeg', NULL, '2018-07-19 07:55:29', '2019-04-23 11:31:22', NULL),
(97, '1/75/97', '安踏', 3, NULL, 0, 4, 1, '/uploads/20180725/jR3FzTC6cObhgQ8LBqj5qsLgLySwnLM9ILT5lnFx.jpeg', NULL, '2018-07-19 07:55:49', '2019-04-23 11:31:28', NULL),
(98, '1/75/98', '匡威', 3, NULL, 0, 5, 1, '/uploads/20180725/XNJx7EvxgSmFoaG4Pj3EnPd2k699qj0rnL1CUitr.jpeg', NULL, '2018-07-19 07:56:13', '2019-04-23 11:31:55', NULL),
(99, '1/86/99', '国产奶粉', 3, NULL, 0, 1, 1, '/uploads/20180725/efXaqXmcWMTUqU3hyXc3OiPZctjnj3ZfHBpbmQel.jpeg', NULL, '2018-07-19 07:56:50', '2019-04-23 11:32:17', NULL),
(100, '1/86/100', '进口奶粉', 3, NULL, 0, 2, 1, '/uploads/20180725/jR3FzTC6cObhgQ8LBqj5qsLgLySwnLM9ILT5lnFx.jpeg', NULL, '2018-07-19 07:57:05', '2019-04-23 11:32:23', NULL),
(101, '1/86/101', '尿不湿', 3, NULL, 0, 3, 1, '/uploads/20180725/efXaqXmcWMTUqU3hyXc3OiPZctjnj3ZfHBpbmQel.jpeg', NULL, '2018-07-19 07:57:35', '2019-04-23 11:32:32', NULL),
(102, '1/86/102', '婴儿床', 3, NULL, 0, 4, 1, '/uploads/20180725/XNJx7EvxgSmFoaG4Pj3EnPd2k699qj0rnL1CUitr.jpeg', NULL, '2018-07-19 07:57:46', '2019-04-23 11:32:48', NULL),
(103, '1/86/103', '婴儿车', 3, NULL, 0, 5, 1, '/uploads/20180725/jR3FzTC6cObhgQ8LBqj5qsLgLySwnLM9ILT5lnFx.jpeg', NULL, '2018-07-19 07:57:58', '2019-04-23 11:32:57', NULL),
(104, '1/66/104', '床垫', 3, NULL, 0, 1, 1, '/uploads/20180725/efXaqXmcWMTUqU3hyXc3OiPZctjnj3ZfHBpbmQel.jpeg', NULL, '2018-07-19 07:58:13', '2019-04-23 11:33:04', NULL),
(105, '1/66/105', '实木床', 3, NULL, 0, 2, 1, '/uploads/20180725/XNJx7EvxgSmFoaG4Pj3EnPd2k699qj0rnL1CUitr.jpeg', NULL, '2018-07-19 07:58:26', '2019-04-23 11:33:14', NULL),
(106, '1/66/106', '床上用品', 3, NULL, 0, 3, 1, '/uploads/20180725/jR3FzTC6cObhgQ8LBqj5qsLgLySwnLM9ILT5lnFx.jpeg', NULL, '2018-07-19 07:58:36', '2019-04-23 11:33:20', NULL),
(107, '1/66/107', '木门', 3, NULL, 0, 4, 1, '/uploads/20180725/efXaqXmcWMTUqU3hyXc3OiPZctjnj3ZfHBpbmQel.jpeg', NULL, '2018-07-19 07:58:47', '2019-04-23 11:33:29', NULL),
(108, '1/66/108', '卫浴用品', 3, NULL, 0, 5, 1, '/uploads/20180725/jR3FzTC6cObhgQ8LBqj5qsLgLySwnLM9ILT5lnFx.jpeg', NULL, '2018-07-19 07:59:00', '2019-04-23 11:33:40', NULL),
(109, '1/69/109', '汽车顶灯装配项目方案', 3, '感悟人生真谛,让设计与生活互动', 0, 1, 1, '/uploads/20180725/efXaqXmcWMTUqU3hyXc3OiPZctjnj3ZfHBpbmQel.jpeg', NULL, '2018-07-19 07:59:15', '2018-07-19 15:59:15', NULL),
(110, '1/69/110', '单（双）刀整流子精车机', 3, '感悟人生真谛,让设计与生活互动', 0, 2, 1, '/uploads/20180725/jR3FzTC6cObhgQ8LBqj5qsLgLySwnLM9ILT5lnFx.jpeg', NULL, '2018-07-19 07:59:27', '2018-07-19 15:59:27', NULL),
(111, '1/69/111', '自动直流逆变整流子焊接机', 3, '感悟人生真谛,让设计与生活互动', 0, 3, 1, '/uploads/20180725/efXaqXmcWMTUqU3hyXc3OiPZctjnj3ZfHBpbmQel.jpeg', NULL, '2018-07-19 07:59:43', '2018-07-19 15:59:43', NULL),
(112, '1/69/112', '自动压轴承设备', 3, '感悟人生真谛,让设计与生活互动', 0, 4, 1, '/uploads/20180725/jR3FzTC6cObhgQ8LBqj5qsLgLySwnLM9ILT5lnFx.jpeg', NULL, '2018-07-19 07:59:54', '2018-07-19 16:00:43', NULL),
(113, '1/69/113', '焊接装备流水线', 3, '感悟人生真谛,让设计与生活互动', 0, 5, 1, '/uploads/20180725/jR3FzTC6cObhgQ8LBqj5qsLgLySwnLM9ILT5lnFx.jpeg', NULL, '2018-07-19 08:00:09', '2018-07-19 16:00:09', NULL),
(114, '1/92/114', '汽车顶灯装配项目方案', 3, '感悟人生真谛,让设计与生活互动', 0, 1, 1, '/uploads/20180725/XNJx7EvxgSmFoaG4Pj3EnPd2k699qj0rnL1CUitr.jpeg', '<p>world</p>', '2018-07-19 08:01:03', '2018-07-19 16:01:03', NULL),
(115, '1/92/115', '单（双）刀整流子精车机', 3, '感悟人生真谛,让设计与生活互动', 0, 2, 1, '/uploads/20180725/efXaqXmcWMTUqU3hyXc3OiPZctjnj3ZfHBpbmQel.jpeg', '<p>world</p>', '2018-07-19 08:01:42', '2018-07-19 16:01:42', NULL),
(116, '1/92/116', '自动直流逆变整流子焊接机', 3, '感悟人生真谛,让设计与生活互动', 0, 3, 1, '/uploads/20180725/jR3FzTC6cObhgQ8LBqj5qsLgLySwnLM9ILT5lnFx.jpeg', '<p>world</p>', '2018-07-19 08:01:53', '2018-07-19 16:01:53', NULL),
(117, '1/92/117', '自动压轴承设备', 3, '感悟人生真谛,让设计与生活互动', 0, 4, 1, '/uploads/20180725/XNJx7EvxgSmFoaG4Pj3EnPd2k699qj0rnL1CUitr.jpeg', '<p>world</p>', '2018-07-19 08:02:06', '2018-07-19 16:02:07', NULL),
(118, '1/92/118', '焊接装备流水线', 3, '感悟人生真谛,让设计与生活互动', 0, 5, 1, '/uploads/20180725/efXaqXmcWMTUqU3hyXc3OiPZctjnj3ZfHBpbmQel.jpeg', '<p>world</p>', '2018-07-19 08:02:18', '2018-07-19 16:02:18', NULL),
(119, '1/75/98/119', '帆布鞋', 4, NULL, 0, 1, 1, NULL, NULL, '2019-04-22 05:20:41', '2019-04-23 11:32:05', NULL);

-- --------------------------------------------------------

--
-- 表的结构 `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `desc` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `contact` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `area` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `isopen` int(11) NOT NULL DEFAULT '0',
  `password` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parent_id` int(11) NOT NULL DEFAULT '0',
  `router` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `level` int(11) DEFAULT '0',
  `owner_id` int(11) NOT NULL DEFAULT '0',
  `openid` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` int(11) DEFAULT '0',
  `type` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `preferences` text COLLATE utf8mb4_unicode_ci,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPACT;

--
-- 转存表中的数据 `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `desc`, `contact`, `phone`, `area`, `address`, `isopen`, `password`, `parent_id`, `router`, `level`, `owner_id`, `openid`, `status`, `type`, `preferences`, `remember_token`, `created_at`, `updated_at`, `deleted_at`) VALUES
(2, '管理员', '9527@qq.com', 'icat', '管理员', '17091952061', '[\"辽宁省\",\"大连市\",\"甘井子区\"]', '凌海路1号', 1, '$2y$10$ct3dpPrwNJ89ySGsMwAnOOCxCDKq35alKsyqNLjy7GQ.B8xuReHOq', 2, '2', 2, 2, NULL, 1, 'admin', NULL, NULL, '2017-06-17 01:07:35', '2019-04-18 07:18:06', NULL),
(201, '系统财务', '1@qq.com', '系统财务', '张三', '17091952062', '[\"北京市\",\"东城区\"]', '天安门', 1, '$2y$10$ph.i/NDgt4tePjahHqaktOM6sYBOfCWJFisOMC7L8HIKfWCDWwz0G', 2, '2,201', 2, 2, NULL, 1, 'finance', NULL, NULL, '2019-04-19 02:10:46', '2019-04-19 02:23:22', NULL),
(202, '系统运营', '2@qq.com', '系统运营', '系统运营', '17091952063', '[\"北京市\",\"东城区\"]', '天安门', 1, '$2y$10$XFfR/g7kXkhA9n90o8WWD.BlZDVcID5XMgFUzgUDtwo6Oxjf3c29m', 2, '2,202', 2, 2, NULL, 1, 'operate', NULL, NULL, '2019-04-19 02:11:47', '2019-04-19 02:23:34', NULL),
(203, '系统维护人员', '3@qq.com', '系统维护人员', '系统维护人员', '17091952064', '[\"北京市\",\"东城区\"]', '天安门', 1, '$2y$10$aMmR3hd17NS33ldxGNxQLuTKv1/DnJxD8hPKJ5KWEZ/BsyekEqD/.', 2, '2,203', 2, 2, NULL, 1, 'maintenance', NULL, NULL, '2019-04-19 02:12:23', '2019-04-19 02:23:40', NULL),
(204, '直营商家', '5@qq.com', '直营商家', '直营商家', '17091952065', '[\"北京市\",\"东城区\"]', '长城', 1, '$2y$10$BvUwXWSf2ow.o3nhrWxYFuXBHo4KsEYeGgIAP9hSfO6Yz.ImF5CGi', 2, '2,204', 2, 2, NULL, 1, 'straight', NULL, NULL, '2019-04-19 02:18:35', '2019-04-19 05:19:11', NULL),
(205, '入住商家A', '6@qq.com', '入住商家A', '入住商家A', '17091952066', '[\"北京市\",\"东城区\"]', '故宫', 1, '$2y$10$iW8i21jqessHsmangCVTy.uyUXMKq4.TsEfMHZNEaMWiRJzOUscky', 2, '2,205', 2, 2, NULL, 1, 'agent', NULL, NULL, '2019-04-19 02:19:07', '2019-04-19 05:19:08', NULL),
(206, '入住商家B', '7@qq.com', '入住商家B', '入住商家B', '17091952067', '[\"北京市\",\"东城区\"]', '颐和园', 1, '$2y$10$WUmfN7mnwRbm01Gv2nt6oOUMxwu1oe9tcQigMzcNGL3C7ze6c/5iG', 2, '2,206', 2, 2, NULL, 1, 'agent', NULL, NULL, '2019-04-19 02:19:36', '2019-04-19 05:18:33', NULL),
(211, '入住商家A分店1', '33@qq.com', '入住商家A分店1', '李四', '15201820343', '[\"北京市\",\"东城区\"]', '中南海', 1, '$2y$10$BxsiUDW/OMcvoMMgNU2dFe09hZ2fShvFb1uY7mRgruP8gxHCnKZOG', 205, '2,205,211', 3, 205, NULL, 1, 'agent', NULL, NULL, '2019-04-19 05:36:51', '2019-04-19 05:36:51', NULL),
(212, '入住商家A分店2', '44@qq.com', '入住商家A分店2', '王二', '15201820344', '[\"北京市\",\"西城区\"]', '北京南站', 1, '$2y$10$jkzmxpdnaNjsHAgaUSMYYu8yYTSvw9EogOrNqeNM70swJuanTJ6q6', 205, '2,205,212', 3, 205, NULL, 1, 'agent', NULL, NULL, '2019-04-19 05:37:36', '2019-04-19 05:37:36', NULL),
(213, '入住商家A_市场维护', '55@qq.com', '入住商家A_市场维护', '冲虚道长', '15201820345', '[\"北京市\",\"东城区\"]', '皇宫', 1, '$2y$10$KyNkp9l1ue7i.kjPtEhrs.Vn.7DAki/6DkG56ZU/Wlm4BHST75NyG', 205, '2,205,213', 3, 205, NULL, 1, 'maintenance', NULL, NULL, '2019-04-19 06:26:25', '2019-04-19 06:26:25', NULL),
(214, '入住商家A_运营', '66@qq.com', '入住商家A_运营', '清虚道长', '15201820346', '[\"北京市\",\"东城区\"]', '丰台大营', 1, '$2y$10$UFAOWG0OLJ0dSwjSkvfFZ.P0h7XRkDTU4CWh8bcynUdTyApjBMFq6', 205, '2,205,214', 3, 205, NULL, 1, 'operate', NULL, NULL, '2019-04-19 06:27:16', '2019-04-19 06:27:16', NULL);

--
-- 转储表的索引
--

--
-- 表的索引 `address`
--
ALTER TABLE `address`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `banner`
--
ALTER TABLE `banner`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `cases`
--
ALTER TABLE `cases`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `cash`
--
ALTER TABLE `cash`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `discount`
--
ALTER TABLE `discount`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `goods`
--
ALTER TABLE `goods`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `goods_images`
--
ALTER TABLE `goods_images`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_reserved_at_index` (`queue`,`reserved_at`);

--
-- 表的索引 `logistics`
--
ALTER TABLE `logistics`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `maintenance`
--
ALTER TABLE `maintenance`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `miniuser`
--
ALTER TABLE `miniuser`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `news`
--
ALTER TABLE `news`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `notifications_notifiable_id_notifiable_type_index` (`notifiable_id`,`notifiable_type`);

--
-- 表的索引 `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `order_id` (`orderid`);

--
-- 表的索引 `order_goods`
--
ALTER TABLE `order_goods`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `order_process`
--
ALTER TABLE `order_process`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`),
  ADD KEY `password_resets_token_index` (`token`);

--
-- 表的索引 `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `desc` (`desc`);

--
-- 表的索引 `permission_role`
--
ALTER TABLE `permission_role`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `properties`
--
ALTER TABLE `properties`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `role_user`
--
ALTER TABLE `role_user`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `sku`
--
ALTER TABLE `sku`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `tree`
--
ALTER TABLE `tree`
  ADD PRIMARY KEY (`id`),
  ADD KEY `path` (`path`);

--
-- 表的索引 `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `phone` (`phone`);

--
-- 在导出的表使用AUTO_INCREMENT
--

--
-- 使用表AUTO_INCREMENT `address`
--
ALTER TABLE `address`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- 使用表AUTO_INCREMENT `banner`
--
ALTER TABLE `banner`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `cases`
--
ALTER TABLE `cases`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `cash`
--
ALTER TABLE `cash`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `discount`
--
ALTER TABLE `discount`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `goods`
--
ALTER TABLE `goods`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- 使用表AUTO_INCREMENT `goods_images`
--
ALTER TABLE `goods_images`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=68;

--
-- 使用表AUTO_INCREMENT `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- 使用表AUTO_INCREMENT `logistics`
--
ALTER TABLE `logistics`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- 使用表AUTO_INCREMENT `maintenance`
--
ALTER TABLE `maintenance`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=59;

--
-- 使用表AUTO_INCREMENT `miniuser`
--
ALTER TABLE `miniuser`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- 使用表AUTO_INCREMENT `news`
--
ALTER TABLE `news`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- 使用表AUTO_INCREMENT `order_goods`
--
ALTER TABLE `order_goods`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- 使用表AUTO_INCREMENT `order_process`
--
ALTER TABLE `order_process`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- 使用表AUTO_INCREMENT `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- 使用表AUTO_INCREMENT `permission_role`
--
ALTER TABLE `permission_role`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=134;

--
-- 使用表AUTO_INCREMENT `properties`
--
ALTER TABLE `properties`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- 使用表AUTO_INCREMENT `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- 使用表AUTO_INCREMENT `role_user`
--
ALTER TABLE `role_user`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=223;

--
-- 使用表AUTO_INCREMENT `sku`
--
ALTER TABLE `sku`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=67;

--
-- 使用表AUTO_INCREMENT `tree`
--
ALTER TABLE `tree`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=120;

--
-- 使用表AUTO_INCREMENT `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=215;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
