-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 05, 2018 at 03:41 PM
-- Server version: 10.1.35-MariaDB
-- PHP Version: 7.2.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `osclass`
--
CREATE DATABASE IF NOT EXISTS `osclass` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `osclass`;

-- --------------------------------------------------------

--
-- Table structure for table `oc_t_admin`
--

CREATE TABLE `oc_t_admin` (
  `pk_i_id` int(10) UNSIGNED NOT NULL,
  `s_name` varchar(100) NOT NULL,
  `s_username` varchar(40) NOT NULL,
  `s_password` char(60) NOT NULL,
  `s_email` varchar(100) DEFAULT NULL,
  `s_secret` varchar(40) DEFAULT NULL,
  `b_moderator` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_t_admin`
--

INSERT INTO `oc_t_admin` (`pk_i_id`, `s_name`, `s_username`, `s_password`, `s_email`, `s_secret`, `b_moderator`) VALUES
(1, 'Administrator', 'admin', '$2y$15$Zcgws/uBDFRU.vsiUtpVAeOe0KziKArceHAflry9aSUyNxbniMU.y', 'nstanovi@gmail.com', 'j1jKi8aA', 0);

-- --------------------------------------------------------

--
-- Table structure for table `oc_t_alerts`
--

CREATE TABLE `oc_t_alerts` (
  `pk_i_id` int(10) UNSIGNED NOT NULL,
  `s_email` varchar(100) DEFAULT NULL,
  `fk_i_user_id` int(10) UNSIGNED DEFAULT NULL,
  `s_search` longtext,
  `s_secret` varchar(40) DEFAULT NULL,
  `b_active` tinyint(1) NOT NULL DEFAULT '0',
  `e_type` enum('INSTANT','HOURLY','DAILY','WEEKLY','CUSTOM') NOT NULL,
  `dt_date` datetime DEFAULT NULL,
  `dt_unsub_date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oc_t_alerts_sent`
--

CREATE TABLE `oc_t_alerts_sent` (
  `d_date` date NOT NULL,
  `i_num_alerts_sent` int(10) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oc_t_ban_rule`
--

CREATE TABLE `oc_t_ban_rule` (
  `pk_i_id` int(10) UNSIGNED NOT NULL,
  `s_name` varchar(250) NOT NULL DEFAULT '',
  `s_ip` varchar(50) NOT NULL DEFAULT '',
  `s_email` varchar(250) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oc_t_category`
--

CREATE TABLE `oc_t_category` (
  `pk_i_id` int(10) UNSIGNED NOT NULL,
  `fk_i_parent_id` int(10) UNSIGNED DEFAULT NULL,
  `i_expiration_days` int(3) UNSIGNED NOT NULL DEFAULT '0',
  `i_position` int(2) UNSIGNED NOT NULL DEFAULT '0',
  `b_enabled` tinyint(1) NOT NULL DEFAULT '1',
  `b_price_enabled` tinyint(1) NOT NULL DEFAULT '1',
  `s_icon` varchar(250) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_t_category`
--

INSERT INTO `oc_t_category` (`pk_i_id`, `fk_i_parent_id`, `i_expiration_days`, `i_position`, `b_enabled`, `b_price_enabled`, `s_icon`) VALUES
(1, 99, 30, 0, 1, 1, NULL),
(2, 99, 30, 1, 1, 1, NULL),
(3, 99, 30, 2, 1, 1, NULL),
(4, 99, 30, 3, 1, 1, NULL),
(96, 99, 30, 4, 1, 1, NULL),
(97, 99, 30, 5, 1, 1, NULL),
(98, 99, 30, 6, 1, 1, NULL),
(99, NULL, 30, 0, 1, 1, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `oc_t_category_description`
--

CREATE TABLE `oc_t_category_description` (
  `fk_i_category_id` int(10) UNSIGNED NOT NULL,
  `fk_c_locale_code` char(5) NOT NULL,
  `s_name` varchar(100) DEFAULT NULL,
  `s_description` text,
  `s_slug` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_t_category_description`
--

INSERT INTO `oc_t_category_description` (`fk_i_category_id`, `fk_c_locale_code`, `s_name`, `s_description`, `s_slug`) VALUES
(1, 'en_US', 'Garsonjere', '', 'garsonjere'),
(2, 'en_US', 'Jednosobni stanovi', '', 'jednosobni-stanovi'),
(3, 'en_US', 'Jednoiposobni stanovi', '', 'jednoiposobni-stanovi'),
(4, 'en_US', 'Dvosobni stanovi', '', 'dvosobni-stanovi'),
(96, 'en_US', 'Dvoiposobni stanovi', '', 'dvoiposobni-stanovi'),
(97, 'en_US', 'Trosobni stanovi', '', 'trosobni-stanovi'),
(98, 'en_US', 'Troiposobni stanovi', '', 'troiposobni-stanovi'),
(99, 'en_US', 'Stanovi', '', 'stanovi');

-- --------------------------------------------------------

--
-- Table structure for table `oc_t_category_stats`
--

CREATE TABLE `oc_t_category_stats` (
  `fk_i_category_id` int(10) UNSIGNED NOT NULL,
  `i_num_items` int(10) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_t_category_stats`
--

INSERT INTO `oc_t_category_stats` (`fk_i_category_id`, `i_num_items`) VALUES
(1, 1),
(2, 0),
(3, 0),
(4, 0),
(96, 0),
(97, 0),
(98, 0),
(99, 1);

-- --------------------------------------------------------

--
-- Table structure for table `oc_t_city`
--

CREATE TABLE `oc_t_city` (
  `pk_i_id` int(10) UNSIGNED NOT NULL,
  `fk_i_region_id` int(10) UNSIGNED NOT NULL,
  `s_name` varchar(60) NOT NULL,
  `s_slug` varchar(60) NOT NULL DEFAULT '',
  `fk_c_country_code` char(2) DEFAULT NULL,
  `b_active` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oc_t_city_area`
--

CREATE TABLE `oc_t_city_area` (
  `pk_i_id` int(10) UNSIGNED NOT NULL,
  `fk_i_city_id` int(10) UNSIGNED NOT NULL,
  `s_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oc_t_city_stats`
--

CREATE TABLE `oc_t_city_stats` (
  `fk_i_city_id` int(10) UNSIGNED NOT NULL,
  `i_num_items` int(10) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oc_t_country`
--

CREATE TABLE `oc_t_country` (
  `pk_c_code` char(2) NOT NULL,
  `s_name` varchar(80) NOT NULL,
  `s_slug` varchar(80) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_t_country`
--

INSERT INTO `oc_t_country` (`pk_c_code`, `s_name`, `s_slug`) VALUES
('CS', 'Serbia', 'serbia');

-- --------------------------------------------------------

--
-- Table structure for table `oc_t_country_stats`
--

CREATE TABLE `oc_t_country_stats` (
  `fk_c_country_code` char(2) NOT NULL,
  `i_num_items` int(10) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_t_country_stats`
--

INSERT INTO `oc_t_country_stats` (`fk_c_country_code`, `i_num_items`) VALUES
('CS', 0);

-- --------------------------------------------------------

--
-- Table structure for table `oc_t_cron`
--

CREATE TABLE `oc_t_cron` (
  `e_type` enum('INSTANT','HOURLY','DAILY','WEEKLY','CUSTOM') NOT NULL,
  `d_last_exec` datetime NOT NULL,
  `d_next_exec` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_t_cron`
--

INSERT INTO `oc_t_cron` (`e_type`, `d_last_exec`, `d_next_exec`) VALUES
('HOURLY', '2018-11-05 14:41:05', '2018-11-05 15:41:00'),
('DAILY', '2018-11-05 09:37:59', '2018-11-06 09:37:00'),
('WEEKLY', '2018-11-05 09:37:59', '2018-11-12 09:37:00');

-- --------------------------------------------------------

--
-- Table structure for table `oc_t_currency`
--

CREATE TABLE `oc_t_currency` (
  `pk_c_code` char(3) NOT NULL,
  `s_name` varchar(40) NOT NULL,
  `s_description` varchar(80) DEFAULT NULL,
  `b_enabled` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_t_currency`
--

INSERT INTO `oc_t_currency` (`pk_c_code`, `s_name`, `s_description`, `b_enabled`) VALUES
('EUR', 'European Union euro', 'Euro €', 1),
('GBP', 'United Kingdom pound', 'Pound £', 1),
('USD', 'United States dollar', 'Dollar US$', 1);

-- --------------------------------------------------------

--
-- Table structure for table `oc_t_item`
--

CREATE TABLE `oc_t_item` (
  `pk_i_id` int(10) UNSIGNED NOT NULL,
  `fk_i_user_id` int(10) UNSIGNED DEFAULT NULL,
  `fk_i_category_id` int(10) UNSIGNED NOT NULL,
  `dt_pub_date` datetime NOT NULL,
  `dt_mod_date` datetime DEFAULT NULL,
  `f_price` float DEFAULT NULL,
  `i_price` bigint(20) DEFAULT NULL,
  `fk_c_currency_code` char(3) DEFAULT NULL,
  `s_contact_name` varchar(100) DEFAULT NULL,
  `s_contact_email` varchar(140) NOT NULL,
  `s_ip` varchar(64) NOT NULL DEFAULT '',
  `b_premium` tinyint(1) NOT NULL DEFAULT '0',
  `b_enabled` tinyint(1) NOT NULL DEFAULT '1',
  `b_active` tinyint(1) NOT NULL DEFAULT '0',
  `b_spam` tinyint(1) NOT NULL DEFAULT '0',
  `s_secret` varchar(40) DEFAULT NULL,
  `b_show_email` tinyint(1) DEFAULT NULL,
  `dt_expiration` datetime NOT NULL DEFAULT '9999-12-31 23:59:59'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_t_item`
--

INSERT INTO `oc_t_item` (`pk_i_id`, `fk_i_user_id`, `fk_i_category_id`, `dt_pub_date`, `dt_mod_date`, `f_price`, `i_price`, `fk_c_currency_code`, `s_contact_name`, `s_contact_email`, `s_ip`, `b_premium`, `b_enabled`, `b_active`, `b_spam`, `s_secret`, `b_show_email`, `dt_expiration`) VALUES
(1, 2, 1, '2018-11-05 14:05:23', NULL, NULL, NULL, NULL, 'Tihomir Bogajcevic', 'tbogajce@yahoo.com', '::1', 0, 1, 1, 0, '8QOvnPbi', 0, '2018-12-05 14:05:23');

-- --------------------------------------------------------

--
-- Table structure for table `oc_t_item_comment`
--

CREATE TABLE `oc_t_item_comment` (
  `pk_i_id` int(10) UNSIGNED NOT NULL,
  `fk_i_item_id` int(10) UNSIGNED NOT NULL,
  `dt_pub_date` datetime NOT NULL,
  `s_title` varchar(200) NOT NULL,
  `s_author_name` varchar(100) NOT NULL,
  `s_author_email` varchar(100) NOT NULL,
  `s_body` text NOT NULL,
  `b_enabled` tinyint(1) NOT NULL DEFAULT '1',
  `b_active` tinyint(1) NOT NULL DEFAULT '0',
  `b_spam` tinyint(1) NOT NULL DEFAULT '0',
  `fk_i_user_id` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oc_t_item_description`
--

CREATE TABLE `oc_t_item_description` (
  `fk_i_item_id` int(10) UNSIGNED NOT NULL,
  `fk_c_locale_code` char(5) NOT NULL,
  `s_title` varchar(100) NOT NULL,
  `s_description` mediumtext NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_t_item_description`
--

INSERT INTO `oc_t_item_description` (`fk_i_item_id`, `fk_c_locale_code`, `s_title`, `s_description`) VALUES
(1, 'en_US', 'First', 'Lorem ipsum');

-- --------------------------------------------------------

--
-- Table structure for table `oc_t_item_location`
--

CREATE TABLE `oc_t_item_location` (
  `fk_i_item_id` int(10) UNSIGNED NOT NULL,
  `fk_c_country_code` char(2) DEFAULT NULL,
  `s_country` varchar(40) DEFAULT NULL,
  `s_address` varchar(100) DEFAULT NULL,
  `s_zip` varchar(15) DEFAULT NULL,
  `fk_i_region_id` int(10) UNSIGNED DEFAULT NULL,
  `s_region` varchar(100) DEFAULT NULL,
  `fk_i_city_id` int(10) UNSIGNED DEFAULT NULL,
  `s_city` varchar(100) DEFAULT NULL,
  `fk_i_city_area_id` int(10) UNSIGNED DEFAULT NULL,
  `s_city_area` varchar(200) DEFAULT NULL,
  `d_coord_lat` decimal(10,6) DEFAULT NULL,
  `d_coord_long` decimal(10,6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_t_item_location`
--

INSERT INTO `oc_t_item_location` (`fk_i_item_id`, `fk_c_country_code`, `s_country`, `s_address`, `s_zip`, `fk_i_region_id`, `s_region`, `fk_i_city_id`, `s_city`, `fk_i_city_area_id`, `s_city_area`, `d_coord_lat`, `d_coord_long`) VALUES
(1, NULL, '', '', NULL, NULL, '', NULL, '', NULL, '', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `oc_t_item_meta`
--

CREATE TABLE `oc_t_item_meta` (
  `fk_i_item_id` int(10) UNSIGNED NOT NULL,
  `fk_i_field_id` int(10) UNSIGNED NOT NULL,
  `s_value` text,
  `s_multi` varchar(20) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oc_t_item_resource`
--

CREATE TABLE `oc_t_item_resource` (
  `pk_i_id` int(10) UNSIGNED NOT NULL,
  `fk_i_item_id` int(10) UNSIGNED NOT NULL,
  `s_name` varchar(60) DEFAULT NULL,
  `s_extension` varchar(10) DEFAULT NULL,
  `s_content_type` varchar(40) DEFAULT NULL,
  `s_path` varchar(250) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_t_item_resource`
--

INSERT INTO `oc_t_item_resource` (`pk_i_id`, `fk_i_item_id`, `s_name`, `s_extension`, `s_content_type`, `s_path`) VALUES
(1, 1, 'd5AZWwqm', 'jpg', 'image/jpeg', 'oc-content/uploads/0/'),
(2, 1, 'yvDTMm6o', 'jpg', 'image/jpeg', 'oc-content/uploads/0/');

-- --------------------------------------------------------

--
-- Table structure for table `oc_t_item_stats`
--

CREATE TABLE `oc_t_item_stats` (
  `fk_i_item_id` int(10) UNSIGNED NOT NULL,
  `i_num_views` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `i_num_spam` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `i_num_repeated` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `i_num_bad_classified` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `i_num_offensive` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `i_num_expired` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `i_num_premium_views` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `dt_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_t_item_stats`
--

INSERT INTO `oc_t_item_stats` (`fk_i_item_id`, `i_num_views`, `i_num_spam`, `i_num_repeated`, `i_num_bad_classified`, `i_num_offensive`, `i_num_expired`, `i_num_premium_views`, `dt_date`) VALUES
(1, 0, 0, 0, 0, 0, 0, 0, '2018-11-05');

-- --------------------------------------------------------

--
-- Table structure for table `oc_t_keywords`
--

CREATE TABLE `oc_t_keywords` (
  `s_md5` varchar(32) NOT NULL,
  `fk_c_locale_code` char(5) NOT NULL,
  `s_original_text` varchar(255) NOT NULL,
  `s_anchor_text` varchar(255) NOT NULL,
  `s_normalized_text` varchar(255) NOT NULL,
  `fk_i_category_id` int(10) UNSIGNED DEFAULT NULL,
  `fk_i_city_id` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oc_t_latest_searches`
--

CREATE TABLE `oc_t_latest_searches` (
  `d_date` datetime NOT NULL,
  `s_search` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_t_latest_searches`
--

INSERT INTO `oc_t_latest_searches` (`d_date`, `s_search`) VALUES
('2018-11-05 14:40:56', 'fir'),
('2018-11-05 14:41:05', 'lorem'),
('2018-11-05 14:41:12', 'first');

-- --------------------------------------------------------

--
-- Table structure for table `oc_t_locale`
--

CREATE TABLE `oc_t_locale` (
  `pk_c_code` char(5) NOT NULL,
  `s_name` varchar(100) NOT NULL,
  `s_short_name` varchar(40) NOT NULL,
  `s_description` varchar(100) NOT NULL,
  `s_version` varchar(20) NOT NULL,
  `s_author_name` varchar(100) NOT NULL,
  `s_author_url` varchar(100) NOT NULL,
  `s_currency_format` varchar(50) NOT NULL,
  `s_dec_point` varchar(2) DEFAULT '.',
  `s_thousands_sep` varchar(2) DEFAULT '',
  `i_num_dec` tinyint(4) DEFAULT '2',
  `s_date_format` varchar(20) NOT NULL,
  `s_stop_words` text,
  `b_enabled` tinyint(1) NOT NULL DEFAULT '1',
  `b_enabled_bo` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_t_locale`
--

INSERT INTO `oc_t_locale` (`pk_c_code`, `s_name`, `s_short_name`, `s_description`, `s_version`, `s_author_name`, `s_author_url`, `s_currency_format`, `s_dec_point`, `s_thousands_sep`, `i_num_dec`, `s_date_format`, `s_stop_words`, `b_enabled`, `b_enabled_bo`) VALUES
('en_US', 'English (US)', 'English', 'American english translation', '2.3', 'Osclass', 'http://osclass.org/', '{NUMBER} {CURRENCY}', '.', '', 2, 'm/d/Y', 'i,a,about,an,are,as,at,be,by,com,for,from,how,in,is,it,of,on,or,that,the,this,to,was,what,when,where,who,will,with,the', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `oc_t_locations_tmp`
--

CREATE TABLE `oc_t_locations_tmp` (
  `id_location` varchar(10) NOT NULL,
  `e_type` enum('COUNTRY','REGION','CITY') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_t_locations_tmp`
--

INSERT INTO `oc_t_locations_tmp` (`id_location`, `e_type`) VALUES
('1', 'REGION'),
('10', 'REGION'),
('11', 'REGION'),
('12', 'REGION'),
('13', 'REGION'),
('14', 'REGION'),
('15', 'REGION'),
('16', 'REGION'),
('17', 'REGION'),
('18', 'REGION'),
('19', 'REGION'),
('2', 'REGION'),
('20', 'REGION'),
('21', 'REGION'),
('22', 'REGION'),
('3', 'REGION'),
('4', 'REGION'),
('5', 'REGION'),
('6', 'REGION'),
('7', 'REGION'),
('8', 'REGION'),
('9', 'REGION'),
('CS', 'COUNTRY');

-- --------------------------------------------------------

--
-- Table structure for table `oc_t_log`
--

CREATE TABLE `oc_t_log` (
  `dt_date` datetime NOT NULL,
  `s_section` varchar(50) NOT NULL,
  `s_action` varchar(50) NOT NULL,
  `fk_i_id` int(10) UNSIGNED NOT NULL,
  `s_data` varchar(250) NOT NULL,
  `s_ip` varchar(50) NOT NULL,
  `s_who` varchar(50) NOT NULL,
  `fk_i_who_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_t_log`
--

INSERT INTO `oc_t_log` (`dt_date`, `s_section`, `s_action`, `fk_i_id`, `s_data`, `s_ip`, `s_who`, `fk_i_who_id`) VALUES
('2018-11-05 09:25:38', 'item', 'add', 1, 'Example Ad', '::1', 'admin', 0),
('2018-11-05 10:42:46', 'user', 'register', 1, 'tihomirbogajcevic94@hotmail.com', '::1', 'user', 1),
('2018-11-05 10:46:03', 'user', 'register', 2, 'tbogajce@yahoo.com', '::1', 'user', 2),
('2018-11-05 10:47:11', 'user', 'activate', 2, 'tbogajce@yahoo.com', '::1', 'admin', 1),
('2018-11-05 10:52:28', 'itemActions', 'deleteResourcesFromHD', 1, '1', '::1', 'admin', 1),
('2018-11-05 10:52:28', 'itemActions', 'deleteResourcesFromHD', 1, '', '::1', 'admin', 1),
('2018-11-05 11:39:10', 'user', 'delete', 1, 'tihomirbogajcevic94@hotmail.com', '::1', 'admin', 1),
('2018-11-05 14:05:23', 'item', 'add', 1, 'First', '::1', 'user', 2),
('2018-11-05 14:48:51', 'user', 'register', 3, 'tihomirbogajcevic94@hotmail.com', '::1', 'user', 3),
('2018-11-05 14:50:11', 'user', 'delete', 3, 'tihomirbogajcevic94@hotmail.com', '::1', 'admin', 1),
('2018-11-05 14:50:19', 'user', 'register', 4, 'tihomirbogajcevic94@hotmail.com', '::1', 'user', 4),
('2018-11-05 14:50:53', 'user', 'register', 5, 'ravicb@ymail.com', '::1', 'user', 5),
('2018-11-05 14:52:06', 'user', 'delete', 5, 'ravicb@ymail.com', '::1', 'admin', 1),
('2018-11-05 14:52:08', 'user', 'delete', 4, 'tihomirbogajcevic94@hotmail.com', '::1', 'admin', 1),
('2018-11-05 14:52:28', 'user', 'register', 6, 'tihomirbogajcevic94@hotmail.com', '::1', 'user', 6),
('2018-11-05 14:56:37', 'user', 'delete', 6, 'tihomirbogajcevic94@hotmail.com', '::1', 'admin', 1),
('2018-11-05 14:56:51', 'user', 'register', 7, 'tihomirbogajcevic94@hotmail.com', '::1', 'user', 7),
('2018-11-05 15:01:05', 'user', 'delete', 7, 'tihomirbogajcevic94@hotmail.com', '::1', 'admin', 1),
('2018-11-05 15:01:22', 'user', 'register', 8, 'tihomirbogajcevic94@hotmail.com', '::1', 'user', 8),
('2018-11-05 15:09:16', 'user', 'register', 9, 'ravicbojan@ymail.com', '::1', 'user', 9);

-- --------------------------------------------------------

--
-- Table structure for table `oc_t_meta_categories`
--

CREATE TABLE `oc_t_meta_categories` (
  `fk_i_category_id` int(10) UNSIGNED NOT NULL,
  `fk_i_field_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oc_t_meta_fields`
--

CREATE TABLE `oc_t_meta_fields` (
  `pk_i_id` int(10) UNSIGNED NOT NULL,
  `s_name` varchar(255) NOT NULL,
  `s_slug` varchar(255) NOT NULL,
  `e_type` enum('TEXT','TEXTAREA','DROPDOWN','RADIO','CHECKBOX','URL','DATE','DATEINTERVAL') NOT NULL DEFAULT 'TEXT',
  `s_options` varchar(2048) DEFAULT NULL,
  `b_required` tinyint(1) NOT NULL DEFAULT '0',
  `b_searchable` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oc_t_pages`
--

CREATE TABLE `oc_t_pages` (
  `pk_i_id` int(10) UNSIGNED NOT NULL,
  `s_internal_name` varchar(50) DEFAULT NULL,
  `b_indelible` tinyint(1) NOT NULL DEFAULT '0',
  `b_link` tinyint(1) NOT NULL DEFAULT '1',
  `dt_pub_date` datetime NOT NULL,
  `dt_mod_date` datetime DEFAULT NULL,
  `i_order` int(3) NOT NULL DEFAULT '0',
  `s_meta` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_t_pages`
--

INSERT INTO `oc_t_pages` (`pk_i_id`, `s_internal_name`, `b_indelible`, `b_link`, `dt_pub_date`, `dt_mod_date`, `i_order`, `s_meta`) VALUES
(1, 'email_item_inquiry', 1, 1, '2018-11-05 09:25:36', NULL, 0, NULL),
(2, 'email_user_validation', 1, 1, '2018-11-05 09:25:36', NULL, 0, NULL),
(3, 'email_user_registration', 1, 1, '2018-11-05 09:25:36', NULL, 0, NULL),
(4, 'email_send_friend', 1, 1, '2018-11-05 09:25:36', NULL, 0, NULL),
(5, 'alert_email_hourly', 1, 1, '2018-11-05 09:25:36', NULL, 0, NULL),
(6, 'alert_email_daily', 1, 1, '2018-11-05 09:25:36', NULL, 0, NULL),
(7, 'alert_email_weekly', 1, 1, '2018-11-05 09:25:36', NULL, 0, NULL),
(8, 'alert_email_instant', 1, 1, '2018-11-05 09:25:36', NULL, 0, NULL),
(9, 'email_new_comment_admin', 1, 1, '2018-11-05 09:25:36', NULL, 0, NULL),
(10, 'email_new_item_non_register_user', 1, 1, '2018-11-05 09:25:36', NULL, 0, NULL),
(11, 'email_item_validation', 1, 1, '2018-11-05 09:25:36', NULL, 0, NULL),
(12, 'email_admin_new_item', 1, 1, '2018-11-05 09:25:36', NULL, 0, NULL),
(13, 'email_user_forgot_password', 1, 1, '2018-11-05 09:25:36', NULL, 0, NULL),
(14, 'email_new_email', 1, 1, '2018-11-05 09:25:36', NULL, 0, NULL),
(15, 'email_alert_validation', 1, 1, '2018-11-05 09:25:36', NULL, 0, NULL),
(16, 'email_comment_validated', 1, 1, '2018-11-05 09:25:36', NULL, 0, NULL),
(17, 'email_item_validation_non_register_user', 1, 1, '2018-11-05 09:25:36', NULL, 0, NULL),
(18, 'email_admin_new_user', 1, 1, '2018-11-05 09:25:36', NULL, 0, NULL),
(19, 'email_contact_user', 1, 1, '2018-11-05 09:25:36', NULL, 0, NULL),
(20, 'email_new_comment_user', 1, 1, '2018-11-05 09:25:36', NULL, 0, NULL),
(21, 'email_new_admin', 1, 1, '2018-11-05 09:25:36', NULL, 0, NULL),
(22, 'email_warn_expiration', 1, 1, '2018-11-05 09:25:36', NULL, 0, NULL),
(23, 'example_page', 0, 0, '2018-11-05 09:25:38', '2018-11-05 09:25:38', 1, '\"\"');

-- --------------------------------------------------------

--
-- Table structure for table `oc_t_pages_description`
--

CREATE TABLE `oc_t_pages_description` (
  `fk_i_pages_id` int(10) UNSIGNED NOT NULL,
  `fk_c_locale_code` char(5) NOT NULL,
  `s_title` varchar(255) NOT NULL,
  `s_text` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_t_pages_description`
--

INSERT INTO `oc_t_pages_description` (`fk_i_pages_id`, `fk_c_locale_code`, `s_title`, `s_text`) VALUES
(1, 'en_US', '{WEB_TITLE} - Someone has a question about your listing', '<p>Hi {CONTACT_NAME}!</p><p>{USER_NAME} ({USER_EMAIL}, {USER_PHONE}) left you a message about your listing <a href=\"{ITEM_URL}\">{ITEM_TITLE}</a>:</p><p>{COMMENT}</p><p>Regards,</p><p>{WEB_LINK}</p>'),
(2, 'en_US', 'Potvrda registracije {WEB_TITLE} naloga', '<p>Poštovani {USER_NAME},</p>\r\n<p>Molimo Vas da klikom na link potvrdite Vašu registraciju: {VALIDATION_LINK}</p>\r\n<p> </p>\r\n<p>Hvala,</p>\r\n<p>{WEB_LINK}</p>'),
(3, 'en_US', '{WEB_TITLE} - Registracija uspešna', '<p>Poštovani {USER_NAME},</p>\r\n<p>Uspešno ste se registrovali na {WEB_LINK}.</p>\r\n<p> </p>\r\n<p>Hvala,</p>\r\n<p>{WEB_LINK}</p>'),
(4, 'en_US', 'Look at what I discovered on {WEB_TITLE}', '<p>Hi {FRIEND_NAME},</p><p>Your friend {USER_NAME} wants to share this listing with you <a href=\"{ITEM_URL}\">{ITEM_TITLE}</a>.</p><p>Message:</p><p>{COMMENT}</p><p>Regards,</p><p>{WEB_TITLE}</p>'),
(5, 'en_US', '{WEB_TITLE} - New listings in the last hour', '<p>Hi {USER_NAME},</p><p>New listings have been published in the last hour. Take a look at them:</p><p>{ADS}</p><p>-------------</p><p>To unsubscribe from this alert, click on: {UNSUB_LINK}</p><p>{WEB_LINK}</p>'),
(6, 'en_US', '{WEB_TITLE} - New listings in the last day', '<p>Hi {USER_NAME},</p><p>New listings have been published in the last day. Take a look at them:</p><p>{ADS}</p><p>-------------</p><p>To unsubscribe from this alert, click on: {UNSUB_LINK}</p><p>{WEB_LINK}</p>'),
(7, 'en_US', '{WEB_TITLE} - New listings in the last week', '<p>Hi {USER_NAME},</p><p>New listings have been published in the last week. Take a look at them:</p><p>{ADS}</p><p>-------------</p><p>To unsubscribe from this alert, click on: {UNSUB_LINK}</p><p>{WEB_LINK}</p>'),
(8, 'en_US', '{WEB_TITLE} - New listings', '<p>Hi {USER_NAME},</p><p>A new listing has been published, check it out!</p><p>{ADS}</p><p>-------------</p><p>To unsubscribe from this alert, click on: {UNSUB_LINK}</p><p>{WEB_LINK}</p>'),
(9, 'en_US', '{WEB_TITLE} - New comment', '<p>Someone commented on the listing <a href=\"{ITEM_URL}\">{ITEM_TITLE}</a>.</p><p>Commenter: {COMMENT_AUTHOR}<br />Commenter\'s email: {COMMENT_EMAIL}<br />Title: {COMMENT_TITLE}<br />Comment: {COMMENT_TEXT}</p>'),
(10, 'en_US', '{WEB_TITLE} - Edit options for the listing {ITEM_TITLE}', '<p>Hi {USER_NAME},</p><p>You\'re not registered at {WEB_LINK}, but you can still edit or delete the listing <a href=\"{ITEM_URL}\">{ITEM_TITLE}</a> for a short period of time.</p><p>You can edit your listing by following this link: {EDIT_LINK}</p><p>You can delete your listing by following this link: {DELETE_LINK}</p><p>If you register as a user, you will have full access to editing options.</p><p>Regards,</p><p>{WEB_LINK}</p>'),
(11, 'en_US', '{WEB_TITLE} - Validate your listing', '<p>Hi {USER_NAME},</p><p>You\'re receiving this e-mail because a listing has been published at {WEB_LINK}. Please validate this listing by clicking on the following link: {VALIDATION_LINK}. If you didn\'t publish this listing, please ignore this email.</p><p>Listing details:</p><p>Contact name: {USER_NAME}<br />Contact e-mail: {USER_EMAIL}</p><p>{ITEM_DESCRIPTION}</p><p>Url: {ITEM_URL}</p><p>Regards,</p><p>{WEB_LINK}</p>'),
(12, 'en_US', '{WEB_TITLE} - A new listing has been published', '<p>Dear {WEB_TITLE} admin,</p><p>You\'re receiving this email because a listing has been published at {WEB_LINK}.</p><p>Listing details:</p><p>Contact name: {USER_NAME}<br />Contact email: {USER_EMAIL}</p><p>{ITEM_DESCRIPTION}</p><p>Url: {ITEM_URL}</p><p>You can edit this listing by clicking on the following link: {EDIT_LINK}</p><p>Regards,</p><p>{WEB_LINK}</p>'),
(13, 'en_US', '{WEB_TITLE} - Recover your password', '<p>Hi {USER_NAME},</p><p>We\'ve sent you this e-mail because you\'ve requested a password reminder. Follow this link to recover it: {PASSWORD_LINK}</p><p>The link will be deactivated in 24 hours.</p><p>If you didn\'t request a password reminder, please ignore this message. This request was made from IP {IP_ADDRESS} on {DATE_TIME}</p><p>Regards,</p><p>{WEB_LINK}</p>'),
(14, 'en_US', '{WEB_TITLE} - You requested an email change', '<p>Hi {USER_NAME}</p><p>You\'re receiving this e-mail because you requested an e-mail change. Please confirm this new e-mail address by clicking on the following validation link: {VALIDATION_LINK}</p><p>Regards,</p><p>{WEB_LINK}</p>'),
(15, 'en_US', '{WEB_TITLE} - Please validate your alert', '<p>Hi {USER_NAME},</p><p>Please validate your alert registration by clicking on the following link: {VALIDATION_LINK}</p><p>Thank you!</p><p>Regards,</p><p>{WEB_LINK}</p>'),
(16, 'en_US', '{WEB_TITLE} - Your comment has been approved', '<p>Hi {COMMENT_AUTHOR},</p><p>Your comment on <a href=\"{ITEM_URL}\">{ITEM_TITLE}</a> has been approved.</p><p>Regards,</p><p>{WEB_LINK}</p>'),
(17, 'en_US', '{WEB_TITLE} - Validate your listing', '<p>Hi {USER_NAME},</p><p>You\'re receiving this e-mail because you’ve published a listing at {WEB_LINK}. Please validate this listing by clicking on the following link: {VALIDATION_LINK}. If you didn\'t publish this listing, please ignore this e-mail.</p><p>Listing details:</p><p>Contact name: {USER_NAME}<br />Contact e-mail: {USER_EMAIL}</p><p>{ITEM_DESCRIPTION}</p><p>Url: {ITEM_URL}</p><p>Even if you\'re not registered at {WEB_LINK}, you can still edit or delete your listing:</p><p>You can edit your listing by following this link: {EDIT_LINK}</p><p>You can delete your listing by following this link: {DELETE_LINK}</p><p>Regards,</p><p>{WEB_LINK}</p>'),
(18, 'en_US', '{WEB_TITLE} - A new user has registered', '<p>Dear {WEB_TITLE} admin,</p><p>You\'re receiving this email because a new user has been created at {WEB_LINK}.</p><p>User details:</p><p>Name: {USER_NAME}<br />E-mail: {USER_EMAIL}</p><p>Regards,</p><p>{WEB_LINK}</p>'),
(19, 'en_US', '{WEB_TITLE} - Someone has a question for you', '<p>Hi {CONTACT_NAME}!</p><p>{USER_NAME} ({USER_EMAIL}, {USER_PHONE}) left you a message:</p><p>{COMMENT}</p><p>Regards,</p><p>{WEB_LINK}</p>'),
(20, 'en_US', '{WEB_TITLE} - Someone has commented on your listing', '<p>There\'s a new comment on the listing: <a href=\"{ITEM_URL}\">{ITEM_TITLE}</a>.</p><p>Author: {COMMENT_AUTHOR}<br />Author\'s email: {COMMENT_EMAIL}<br />Title: {COMMENT_TITLE}<br />Comment: {COMMENT_TEXT}</p><p>{WEB_LINK}</p>'),
(21, 'en_US', '{WEB_TITLE} - Success creating admin account!', '<p>Hi {ADMIN_NAME},</p><p>The admin of {WEB_LINK} has created an account for you,</p><ul><li>Username: {USERNAME}</li><li>Password: {PASSWORD}</li></ul><p>You can access the admin panel here {WEB_ADMIN_LINK}.</p><p>Thank you!</p><p>Regards,</p>'),
(22, 'en_US', '{WEB_TITLE} - Your ad is about to expire', '<p>Poštovani {USER_NAME},</p>\r\n<p>Vaš oglas <a href=\"{ITEM_URL}\">{ITEM_TITLE}</a> na {WEB_LINK} će uskoro isteći.</p>'),
(23, 'en_US', 'Example page title', 'This is an example page description. This is a good place to put your Terms of Service or any other help information.');

-- --------------------------------------------------------

--
-- Table structure for table `oc_t_plugin_category`
--

CREATE TABLE `oc_t_plugin_category` (
  `s_plugin_name` varchar(40) NOT NULL,
  `fk_i_category_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oc_t_preference`
--

CREATE TABLE `oc_t_preference` (
  `s_section` varchar(128) NOT NULL,
  `s_name` varchar(128) NOT NULL,
  `s_value` longtext NOT NULL,
  `e_type` enum('STRING','INTEGER','BOOLEAN') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_t_preference`
--

INSERT INTO `oc_t_preference` (`s_section`, `s_name`, `s_value`, `e_type`) VALUES
('bender', 'defaultLocationShowAs', 'dropdown', 'STRING'),
('bender', 'defaultShowAs@all', 'list', 'STRING'),
('bender', 'donation', '0', 'STRING'),
('bender', 'footer_link', '1', 'STRING'),
('bender', 'keyword_placeholder', 'ie. PHP Programmer', 'STRING'),
('bender', 'version', '315', 'STRING'),
('modern_admin_theme', 'compact_mode', '0', 'STRING'),
('osclass', 'active_plugins', 'a:2:{i:0;s:21:\"google_maps/index.php\";i:1;s:26:\"google_analytics/index.php\";}', 'STRING'),
('osclass', 'admin_language', 'en_US', 'STRING'),
('osclass', 'admin_theme', 'modern', 'STRING'),
('osclass', 'akismetKey', '', 'STRING'),
('osclass', 'allowedExt', 'png,gif,jpg,jpeg', 'STRING'),
('osclass', 'allow_report_osclass', '1', 'BOOLEAN'),
('osclass', 'auto_cron', '1', 'STRING'),
('osclass', 'auto_update', 'disabled', 'STRING'),
('osclass', 'comments_per_page', '10', 'INTEGER'),
('osclass', 'contactEmail', 'tihomirbogajcevic94@hotmail.com', 'STRING'),
('osclass', 'contact_attachment', '0', 'STRING'),
('osclass', 'csrf_name', 'CSRF1894797415', 'STRING'),
('osclass', 'currency', 'EUR', 'STRING'),
('osclass', 'dateFormat', 'm/d/Y', 'STRING'),
('osclass', 'defaultOrderField@search', 'dt_pub_date', 'STRING'),
('osclass', 'defaultOrderType@search', '1', 'BOOLEAN'),
('osclass', 'defaultResultsPerPage@search', '12', 'STRING'),
('osclass', 'defaultShowAs@search', 'gallery', 'STRING'),
('osclass', 'description_character_length', '5000', 'INTEGER'),
('osclass', 'dimNormal', '640x480', 'STRING'),
('osclass', 'dimPreview', '480x340', 'STRING'),
('osclass', 'dimThumbnail', '240x200', 'STRING'),
('osclass', 'enabled_comments', '1', 'BOOLEAN'),
('osclass', 'enabled_recaptcha_items', '0', 'BOOLEAN'),
('osclass', 'enabled_users', '1', 'BOOLEAN'),
('osclass', 'enabled_user_registration', '1', 'BOOLEAN'),
('osclass', 'enabled_user_validation', '1', 'BOOLEAN'),
('osclass', 'enableField#f_price@items', '1', 'BOOLEAN'),
('osclass', 'enableField#images@items', '1', 'BOOLEAN'),
('osclass', 'force_aspect_image', '1', 'STRING'),
('osclass', 'force_jpeg', '0', 'STRING'),
('osclass', 'installed_plugins', 'a:2:{i:0;s:21:\"google_maps/index.php\";i:1;s:26:\"google_analytics/index.php\";}', 'STRING'),
('osclass', 'items_wait_time', '0', 'INTEGER'),
('osclass', 'item_attachment', '0', 'BOOLEAN'),
('osclass', 'keep_original_image', '1', 'STRING'),
('osclass', 'language', 'en_US', 'STRING'),
('osclass', 'languages_downloaded', '[\"en_US\"]', 'STRING'),
('osclass', 'languages_last_version_check', '1541406395', 'STRING'),
('osclass', 'languages_to_update', '[]', 'STRING'),
('osclass', 'languages_update_count', '0', 'STRING'),
('osclass', 'last_version_check', '1541407079', 'STRING'),
('osclass', 'location_todo', '23', 'STRING'),
('osclass', 'logged_user_item_validation', '1', 'BOOLEAN'),
('osclass', 'mailserver_auth', '1', 'STRING'),
('osclass', 'mailserver_host', 'smtp.gmail.com', 'STRING'),
('osclass', 'mailserver_mail_from', 'nstanovi@gmail.com', 'STRING'),
('osclass', 'mailserver_name_from', 'stans', 'STRING'),
('osclass', 'mailserver_password', 'neznam123', 'STRING'),
('osclass', 'mailserver_pop', '0', 'STRING'),
('osclass', 'mailserver_port', '465', 'STRING'),
('osclass', 'mailserver_ssl', 'ssl', 'STRING'),
('osclass', 'mailserver_type', 'gmail', 'STRING'),
('osclass', 'mailserver_username', 'nstanovi@gmail.com', 'STRING'),
('osclass', 'marketAllowExternalSources', '0', 'STRING'),
('osclass', 'marketAPIConnect', '', 'STRING'),
('osclass', 'marketCategories', '{\"languages\":{\"value\":\"98\",\"label\":\"Languages\",\"categories\":[]},\"themes\":{\"value\":\"96\",\"label\":\"Themes\",\"categories\":[{\"value\":\"102\",\"label\":\"General\",\"categories\":[]},{\"value\":\"100\",\"label\":\"Jobs\",\"categories\":[]},{\"value\":\"101\",\"label\":\"Real estate\",\"categories\":[]},{\"value\":\"99\",\"label\":\"Automotive\",\"categories\":[]}]},\"plugins\":{\"value\":\"97\",\"label\":\"Plugins\",\"categories\":[{\"value\":\"103\",\"label\":\"Ad management\",\"categories\":[]},{\"value\":\"132\",\"label\":\"Appearance\",\"categories\":[]},{\"value\":\"105\",\"label\":\"Analytics\",\"categories\":[]},{\"value\":\"130\",\"label\":\"Attributes\",\"categories\":[]},{\"value\":\"106\",\"label\":\"Counters\",\"categories\":[]},{\"value\":\"107\",\"label\":\"Cloud tools\",\"categories\":[]},{\"value\":\"108\",\"label\":\"Calendars\",\"categories\":[]},{\"value\":\"109\",\"label\":\"Customer support\",\"categories\":[]},{\"value\":\"110\",\"label\":\"DB tools\",\"categories\":[]},{\"value\":\"111\",\"label\":\"Date \\/ Time\",\"categories\":[]},{\"value\":\"112\",\"label\":\"E-mail\",\"categories\":[]},{\"value\":\"114\",\"label\":\"Image galleries \\/ sliders\",\"categories\":[]},{\"value\":\"115\",\"label\":\"Maps\",\"categories\":[]},{\"value\":\"116\",\"label\":\"Mobile\",\"categories\":[]},{\"value\":\"117\",\"label\":\"Messaging\",\"categories\":[]},{\"value\":\"131\",\"label\":\"Monetize\",\"categories\":[]},{\"value\":\"119\",\"label\":\"Reviews &amp; Ratings\",\"categories\":[]},{\"value\":\"134\",\"label\":\"Search tools\",\"categories\":[]},{\"value\":\"120\",\"label\":\"Site recommendation\",\"categories\":[]},{\"value\":\"121\",\"label\":\"User Management\",\"categories\":[]},{\"value\":\"122\",\"label\":\"Payments\",\"categories\":[]},{\"value\":\"124\",\"label\":\"Text processing \\/ WYSIWYG Editors\",\"categories\":[]},{\"value\":\"125\",\"label\":\"Video \\/ Audio\",\"categories\":[]},{\"value\":\"126\",\"label\":\"Social Networks\",\"categories\":[]},{\"value\":\"127\",\"label\":\"SEO\",\"categories\":[]},{\"value\":\"133\",\"label\":\"Security\",\"categories\":[]},{\"value\":\"128\",\"label\":\"Miscellaneous\",\"categories\":[]}]}}', 'STRING'),
('osclass', 'marketDataUpdate', '1541407150', 'STRING'),
('osclass', 'marketURL', 'https://market.osclass.org/api/v3/', 'STRING'),
('osclass', 'maxLatestItems@home', '12', 'STRING'),
('osclass', 'maxResultsPerPage@search', '50', 'INTEGER'),
('osclass', 'maxSizeKb', '25600', 'STRING'),
('osclass', 'moderate_comments', '0', 'INTEGER'),
('osclass', 'moderate_items', '-1', 'INTEGER'),
('osclass', 'mod_rewrite_loaded', '0', 'BOOLEAN'),
('osclass', 'notify_contact_friends', '1', 'BOOLEAN'),
('osclass', 'notify_contact_item', '1', 'BOOLEAN'),
('osclass', 'notify_new_comment', '1', 'BOOLEAN'),
('osclass', 'notify_new_comment_user', '0', 'BOOLEAN'),
('osclass', 'notify_new_item', '1', 'BOOLEAN'),
('osclass', 'notify_new_user', '1', 'BOOLEAN'),
('osclass', 'numImages@items', '4', 'INTEGER'),
('osclass', 'num_rss_items', '50', 'STRING'),
('osclass', 'osclass_installed', '1', 'BOOLEAN'),
('osclass', 'pageDesc', '', 'STRING'),
('osclass', 'pageTitle', 'stans', 'STRING'),
('osclass', 'ping_search_engines', '0', 'BOOLEAN'),
('osclass', 'plugins_downloaded', '[\"http:\\/\\/www.osclass.org\\/files\\/plugins\\/google_analytics\\/update.php\",\"http:\\/\\/www.osclass.org\\/files\\/plugins\\/google_maps\\/update.php\"]', 'STRING'),
('osclass', 'plugins_last_version_check', '1541406394', 'STRING'),
('osclass', 'plugins_to_update', '[]', 'STRING'),
('osclass', 'plugins_update_count', '0', 'STRING'),
('osclass', 'purge_latest_searches', '1000', 'STRING'),
('osclass', 'recaptchaPrivKey', '', 'STRING'),
('osclass', 'recaptchaPubKey', '', 'STRING'),
('osclass', 'recaptcha_version', '2', 'STRING'),
('osclass', 'reg_user_can_contact', '0', 'BOOLEAN'),
('osclass', 'reg_user_post', '0', 'BOOLEAN'),
('osclass', 'reg_user_post_comments', '0', 'BOOLEAN'),
('osclass', 'rewriteEnabled', '0', 'BOOLEAN'),
('osclass', 'rewrite_cat_url', '{CATEGORIES}', 'STRING'),
('osclass', 'rewrite_contact', 'contact', 'STRING'),
('osclass', 'rewrite_feed', 'feed', 'STRING'),
('osclass', 'rewrite_item_activate', 'item/activate', 'STRING'),
('osclass', 'rewrite_item_contact', 'item/contact', 'STRING'),
('osclass', 'rewrite_item_delete', 'item/delete', 'STRING'),
('osclass', 'rewrite_item_edit', 'item/edit', 'STRING'),
('osclass', 'rewrite_item_mark', 'item/mark', 'STRING'),
('osclass', 'rewrite_item_new', 'item/new', 'STRING'),
('osclass', 'rewrite_item_resource_delete', 'resource/delete', 'STRING'),
('osclass', 'rewrite_item_send_friend', 'item/send-friend', 'STRING'),
('osclass', 'rewrite_item_url', '{CATEGORIES}/{ITEM_TITLE}_i{ITEM_ID}', 'STRING'),
('osclass', 'rewrite_language', 'language', 'STRING'),
('osclass', 'rewrite_page_url', '{PAGE_SLUG}-p{PAGE_ID}', 'STRING'),
('osclass', 'rewrite_rules', '', 'STRING'),
('osclass', 'rewrite_search_category', 'category', 'STRING'),
('osclass', 'rewrite_search_city', 'city', 'STRING'),
('osclass', 'rewrite_search_city_area', 'cityarea', 'STRING'),
('osclass', 'rewrite_search_country', 'country', 'STRING'),
('osclass', 'rewrite_search_pattern', 'pattern', 'STRING'),
('osclass', 'rewrite_search_region', 'region', 'STRING'),
('osclass', 'rewrite_search_url', 'search', 'STRING'),
('osclass', 'rewrite_search_user', 'user', 'STRING'),
('osclass', 'rewrite_user_activate', 'user/activate', 'STRING'),
('osclass', 'rewrite_user_activate_alert', 'alert/confirm', 'STRING'),
('osclass', 'rewrite_user_alerts', 'user/alerts', 'STRING'),
('osclass', 'rewrite_user_change_email', 'email/change', 'STRING'),
('osclass', 'rewrite_user_change_email_confirm', 'email/confirm', 'STRING'),
('osclass', 'rewrite_user_change_password', 'password/change', 'STRING'),
('osclass', 'rewrite_user_change_username', 'username/change', 'STRING'),
('osclass', 'rewrite_user_dashboard', 'user/dashboard', 'STRING'),
('osclass', 'rewrite_user_forgot', 'user/forgot', 'STRING'),
('osclass', 'rewrite_user_items', 'user/items', 'STRING'),
('osclass', 'rewrite_user_login', 'user/login', 'STRING'),
('osclass', 'rewrite_user_logout', 'user/logout', 'STRING'),
('osclass', 'rewrite_user_profile', 'user/profile', 'STRING'),
('osclass', 'rewrite_user_recover', 'user/recover', 'STRING'),
('osclass', 'rewrite_user_register', 'user/register', 'STRING'),
('osclass', 'save_latest_searches', '0', 'BOOLEAN'),
('osclass', 'selectable_parent_categories', '', 'STRING'),
('osclass', 'seo_url_search_prefix', '', 'STRING'),
('osclass', 'subdomain_host', '', 'STRING'),
('osclass', 'subdomain_type', '', 'STRING'),
('osclass', 'theme', 'osclasswizards', 'STRING'),
('osclass', 'themes_downloaded', '[\"bender\"]', 'STRING'),
('osclass', 'themes_last_version_check', '1541406396', 'STRING'),
('osclass', 'themes_to_update', '[\"bender\"]', 'STRING'),
('osclass', 'themes_update_count', '1', 'STRING'),
('osclass', 'timeFormat', 'g:i a', 'STRING'),
('osclass', 'timezone', 'Europe/Madrid', 'STRING'),
('osclass', 'title_character_length', '100', 'INTEGER'),
('osclass', 'update_core_json', '', 'STRING'),
('osclass', 'username_blacklist', 'admin,user', 'STRING'),
('osclass', 'use_imagick', '0', 'STRING'),
('osclass', 'version', '380', 'INTEGER'),
('osclass', 'warn_expiration', '0', 'INTEGER'),
('osclass', 'watermark_image', '', 'STRING'),
('osclass', 'watermark_place', 'centre', 'STRING'),
('osclass', 'watermark_text', '', 'STRING'),
('osclass', 'watermark_text_color', '', 'STRING'),
('osclass', 'weekStart', '0', 'STRING'),
('osclasswizards_theme', 'custom_css', '', 'STRING'),
('osclasswizards_theme', 'defaultShowAs@all', 'gallery', 'STRING'),
('osclasswizards_theme', 'description_minimum_length', '3', 'STRING'),
('osclasswizards_theme', 'facebook-height', '400', 'STRING'),
('osclasswizards_theme', 'facebook-hidecover', '', 'STRING'),
('osclasswizards_theme', 'facebook-showface', '', 'STRING'),
('osclasswizards_theme', 'facebook-showitem', '', 'STRING'),
('osclasswizards_theme', 'facebook-showpost', '', 'STRING'),
('osclasswizards_theme', 'facebook-showsearch', '', 'STRING'),
('osclasswizards_theme', 'facebook-url', 'https://www.facebook.com/osclasswizards', 'STRING'),
('osclasswizards_theme', 'facebook-width', '340', 'STRING'),
('osclasswizards_theme', 'google_fonts', 'Abel', 'STRING'),
('osclasswizards_theme', 'items_shown_map', '20', 'STRING'),
('osclasswizards_theme', 'keyword_placeholder', 'npr. Grbavica', 'STRING'),
('osclasswizards_theme', 'locations_input_as', 'text', 'STRING'),
('osclasswizards_theme', 'logo', 'logo.png', 'STRING'),
('osclasswizards_theme', 'popular_cities_limit', '10', 'STRING'),
('osclasswizards_theme', 'popular_regions_limit', '10', 'STRING'),
('osclasswizards_theme', 'popular_searches_limit', '10', 'STRING'),
('osclasswizards_theme', 'premium_listings_shown', '6', 'STRING'),
('osclasswizards_theme', 'premium_listings_shown_home', '6', 'STRING'),
('osclasswizards_theme', 'premium_listings_slider', '1', 'STRING'),
('osclasswizards_theme', 'rtl_view', '0', 'STRING'),
('osclasswizards_theme', 'show_banner', '1', 'STRING'),
('osclasswizards_theme', 'show_popular', '1', 'STRING'),
('osclasswizards_theme', 'show_popular_cities', '', 'STRING'),
('osclasswizards_theme', 'show_popular_regions', '', 'STRING'),
('osclasswizards_theme', 'show_popular_searches', '1', 'STRING'),
('osclasswizards_theme', 'show_search_country', '0', 'STRING'),
('osclasswizards_theme', 'show_sub_cat', '1', 'STRING'),
('osclasswizards_theme', 'sub_cat_limit', '5', 'STRING'),
('osclasswizards_theme', 'theme_color', '#77c04b', 'STRING'),
('osclasswizards_theme', 'theme_color_mode', 'green', 'STRING'),
('osclasswizards_theme', 'title_minimum_length', '1', 'STRING'),
('osclasswizards_theme', 'version', '1.0.2', 'STRING'),
('osclasswizards_theme', 'welcome_message', 'Dobrodošli na stans', 'STRING'),
('osclasswizards_theme_cat_icons', 'cat-icons-1', '', 'STRING'),
('osclasswizards_theme_cat_icons', 'cat-icons-2', '', 'STRING'),
('osclasswizards_theme_cat_icons', 'cat-icons-3', '', 'STRING'),
('osclasswizards_theme_cat_icons', 'cat-icons-4', '', 'STRING'),
('osclasswizards_theme_cat_icons', 'cat-icons-5', 'WRENCH', 'STRING'),
('osclasswizards_theme_cat_icons', 'cat-icons-6', 'USERS', 'STRING'),
('osclasswizards_theme_cat_icons', 'cat-icons-7', 'HEART', 'STRING'),
('osclasswizards_theme_cat_icons', 'cat-icons-8', 'SUITCASE', 'STRING'),
('osclasswizards_theme_cat_icons', 'cat-icons-96', '', 'STRING'),
('osclasswizards_theme_cat_icons', 'cat-icons-97', '', 'STRING'),
('osclasswizards_theme_cat_icons', 'cat-icons-98', '', 'STRING'),
('osclasswizards_theme_cat_icons', 'cat-icons-99', '', 'STRING'),
('osclasswizards_theme_cat_icons', 'first_load_cat_icons', 'loaded', 'STRING'),
('plugin-google_analytics', 'google_analytics_id', '', 'STRING');

-- --------------------------------------------------------

--
-- Table structure for table `oc_t_region`
--

CREATE TABLE `oc_t_region` (
  `pk_i_id` int(10) UNSIGNED NOT NULL,
  `fk_c_country_code` char(2) NOT NULL,
  `s_name` varchar(60) NOT NULL,
  `s_slug` varchar(60) NOT NULL DEFAULT '',
  `b_active` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_t_region`
--

INSERT INTO `oc_t_region` (`pk_i_id`, `fk_c_country_code`, `s_name`, `s_slug`, `b_active`) VALUES
(1, 'CS', 'Grbavica', 'grbavica', 1),
(2, 'CS', 'Liman I', 'liman-i', 1),
(3, 'CS', 'Liman II', 'liman-ii', 1),
(4, 'CS', 'Liman III', 'liman-iii', 1),
(5, 'CS', 'Liman IV', 'liman-iv', 1),
(6, 'CS', 'Adice', 'adice', 1),
(7, 'CS', 'Novo Naselje', 'novo-naselje', 1),
(8, 'CS', 'Telep', 'telep', 1),
(9, 'CS', 'Sajmiste', 'sajmiste', 1),
(10, 'CS', 'Betanija', 'betanija', 1),
(11, 'CS', 'Stari Grad', 'stari-grad', 1),
(12, 'CS', 'Avijaticarsko Naselje', 'avijaticarsko-naselje', 1),
(13, 'CS', 'Klisa', 'klisa', 1),
(14, 'CS', 'Slana Bara', 'slana-bara', 1),
(15, 'CS', 'Vidovdansko Naselje', 'vidovdansko-naselje', 1),
(16, 'CS', 'Salajka', 'salajka', 1),
(17, 'CS', 'Sajlovo', 'sajlovo', 1),
(18, 'CS', 'Jugovicevo', 'jugovicevo', 1),
(19, 'CS', 'Detelinara', 'detelinara', 1),
(20, 'CS', 'Adamovicevo Naselje', 'adamovicevo-naselje', 1),
(21, 'CS', 'Rotkvarija', 'rotkvarija', 1),
(22, 'CS', 'Banatic', 'banatic', 1);

-- --------------------------------------------------------

--
-- Table structure for table `oc_t_region_stats`
--

CREATE TABLE `oc_t_region_stats` (
  `fk_i_region_id` int(10) UNSIGNED NOT NULL,
  `i_num_items` int(10) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_t_region_stats`
--

INSERT INTO `oc_t_region_stats` (`fk_i_region_id`, `i_num_items`) VALUES
(1, 0),
(2, 0),
(3, 0),
(4, 0),
(5, 0),
(6, 0),
(7, 0),
(8, 0),
(9, 0),
(10, 0),
(11, 0),
(12, 0),
(13, 0),
(14, 0),
(15, 0),
(16, 0),
(17, 0),
(18, 0),
(19, 0),
(20, 0),
(21, 0),
(22, 0);

-- --------------------------------------------------------

--
-- Table structure for table `oc_t_user`
--

CREATE TABLE `oc_t_user` (
  `pk_i_id` int(10) UNSIGNED NOT NULL,
  `dt_reg_date` datetime NOT NULL,
  `dt_mod_date` datetime DEFAULT NULL,
  `s_name` varchar(100) NOT NULL,
  `s_username` varchar(100) NOT NULL,
  `s_password` char(60) NOT NULL,
  `s_secret` varchar(40) DEFAULT NULL,
  `s_email` varchar(100) NOT NULL,
  `s_website` varchar(100) DEFAULT NULL,
  `s_phone_land` varchar(45) DEFAULT NULL,
  `s_phone_mobile` varchar(45) DEFAULT NULL,
  `b_enabled` tinyint(1) NOT NULL DEFAULT '1',
  `b_active` tinyint(1) NOT NULL DEFAULT '0',
  `s_pass_code` varchar(100) DEFAULT NULL,
  `s_pass_date` datetime DEFAULT NULL,
  `s_pass_ip` varchar(15) DEFAULT NULL,
  `fk_c_country_code` char(2) DEFAULT NULL,
  `s_country` varchar(40) DEFAULT NULL,
  `s_address` varchar(100) DEFAULT NULL,
  `s_zip` varchar(15) DEFAULT NULL,
  `fk_i_region_id` int(10) UNSIGNED DEFAULT NULL,
  `s_region` varchar(100) DEFAULT NULL,
  `fk_i_city_id` int(10) UNSIGNED DEFAULT NULL,
  `s_city` varchar(100) DEFAULT NULL,
  `fk_i_city_area_id` int(10) UNSIGNED DEFAULT NULL,
  `s_city_area` varchar(200) DEFAULT NULL,
  `d_coord_lat` decimal(10,6) DEFAULT NULL,
  `d_coord_long` decimal(10,6) DEFAULT NULL,
  `b_company` tinyint(1) NOT NULL DEFAULT '0',
  `i_items` int(10) UNSIGNED DEFAULT '0',
  `i_comments` int(10) UNSIGNED DEFAULT '0',
  `dt_access_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `s_access_ip` varchar(15) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_t_user`
--

INSERT INTO `oc_t_user` (`pk_i_id`, `dt_reg_date`, `dt_mod_date`, `s_name`, `s_username`, `s_password`, `s_secret`, `s_email`, `s_website`, `s_phone_land`, `s_phone_mobile`, `b_enabled`, `b_active`, `s_pass_code`, `s_pass_date`, `s_pass_ip`, `fk_c_country_code`, `s_country`, `s_address`, `s_zip`, `fk_i_region_id`, `s_region`, `fk_i_city_id`, `s_city`, `fk_i_city_area_id`, `s_city_area`, `d_coord_lat`, `d_coord_long`, `b_company`, `i_items`, `i_comments`, `dt_access_date`, `s_access_ip`) VALUES
(2, '2018-11-05 10:46:01', '2018-11-05 10:46:01', 'Tihomir Bogajcevic', '2', '$2y$15$3gicTmaeESFeXL6qoga0Re/FgUA2q2dHETsdX.Z/mnWhG8y3o/zXW', 'ezVfoPdv', 'tbogajce@yahoo.com', '', '', '', 1, 1, NULL, NULL, NULL, NULL, '', '', '', NULL, '', NULL, '', NULL, '', NULL, NULL, 0, 1, 0, '2018-11-05 14:42:36', '::1'),
(8, '2018-11-05 15:01:20', '2018-11-05 15:01:20', 'Tihomir Bogajcevic', '8', '$2y$15$hl957sH1LZlJZSGrz2QRVe14nE1zq245zRlFOJht6Ff2n801ftIqu', 'ByOrEvEe', 'tihomirbogajcevic94@hotmail.com', '', '', '', 1, 1, NULL, NULL, NULL, NULL, '', '', '', NULL, '', NULL, '', NULL, '', NULL, NULL, 0, 0, 0, '2018-11-05 15:01:20', '::1'),
(9, '2018-11-05 15:09:14', '2018-11-05 15:09:14', 'Bojan Ravic', '9', '$2y$15$P8y8nMfiZ6n8EAii3cGN9eFMhnWkcRC8C/MJ58m3BsNMOdZzxtkRq', '0slsW4U2', 'ravicbojan@ymail.com', '', '', '', 1, 1, NULL, NULL, NULL, NULL, '', '', '', NULL, '', NULL, '', NULL, '', NULL, NULL, 0, 0, 0, '2018-11-05 15:09:14', '::1');

-- --------------------------------------------------------

--
-- Table structure for table `oc_t_user_description`
--

CREATE TABLE `oc_t_user_description` (
  `fk_i_user_id` int(10) UNSIGNED NOT NULL,
  `fk_c_locale_code` char(5) NOT NULL,
  `s_info` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oc_t_user_email_tmp`
--

CREATE TABLE `oc_t_user_email_tmp` (
  `fk_i_user_id` int(10) UNSIGNED NOT NULL,
  `s_new_email` varchar(100) NOT NULL,
  `dt_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oc_t_widget`
--

CREATE TABLE `oc_t_widget` (
  `pk_i_id` int(10) UNSIGNED NOT NULL,
  `s_description` varchar(40) NOT NULL,
  `s_location` varchar(40) NOT NULL,
  `e_kind` enum('TEXT','HTML') NOT NULL,
  `s_content` mediumtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `oc_t_admin`
--
ALTER TABLE `oc_t_admin`
  ADD PRIMARY KEY (`pk_i_id`),
  ADD UNIQUE KEY `s_username` (`s_username`),
  ADD UNIQUE KEY `s_email` (`s_email`);

--
-- Indexes for table `oc_t_alerts`
--
ALTER TABLE `oc_t_alerts`
  ADD PRIMARY KEY (`pk_i_id`);

--
-- Indexes for table `oc_t_alerts_sent`
--
ALTER TABLE `oc_t_alerts_sent`
  ADD PRIMARY KEY (`d_date`);

--
-- Indexes for table `oc_t_ban_rule`
--
ALTER TABLE `oc_t_ban_rule`
  ADD PRIMARY KEY (`pk_i_id`);

--
-- Indexes for table `oc_t_category`
--
ALTER TABLE `oc_t_category`
  ADD PRIMARY KEY (`pk_i_id`),
  ADD KEY `fk_i_parent_id` (`fk_i_parent_id`),
  ADD KEY `i_position` (`i_position`);

--
-- Indexes for table `oc_t_category_description`
--
ALTER TABLE `oc_t_category_description`
  ADD PRIMARY KEY (`fk_i_category_id`,`fk_c_locale_code`),
  ADD KEY `idx_s_slug` (`s_slug`),
  ADD KEY `fk_c_locale_code` (`fk_c_locale_code`);

--
-- Indexes for table `oc_t_category_stats`
--
ALTER TABLE `oc_t_category_stats`
  ADD PRIMARY KEY (`fk_i_category_id`);

--
-- Indexes for table `oc_t_city`
--
ALTER TABLE `oc_t_city`
  ADD PRIMARY KEY (`pk_i_id`),
  ADD KEY `fk_i_region_id` (`fk_i_region_id`),
  ADD KEY `idx_s_name` (`s_name`),
  ADD KEY `idx_s_slug` (`s_slug`),
  ADD KEY `fk_c_country_code` (`fk_c_country_code`);

--
-- Indexes for table `oc_t_city_area`
--
ALTER TABLE `oc_t_city_area`
  ADD PRIMARY KEY (`pk_i_id`),
  ADD KEY `fk_i_city_id` (`fk_i_city_id`),
  ADD KEY `idx_s_name` (`s_name`);

--
-- Indexes for table `oc_t_city_stats`
--
ALTER TABLE `oc_t_city_stats`
  ADD PRIMARY KEY (`fk_i_city_id`),
  ADD KEY `idx_num_items` (`i_num_items`);

--
-- Indexes for table `oc_t_country`
--
ALTER TABLE `oc_t_country`
  ADD PRIMARY KEY (`pk_c_code`),
  ADD KEY `idx_s_slug` (`s_slug`),
  ADD KEY `idx_s_name` (`s_name`);

--
-- Indexes for table `oc_t_country_stats`
--
ALTER TABLE `oc_t_country_stats`
  ADD PRIMARY KEY (`fk_c_country_code`),
  ADD KEY `idx_num_items` (`i_num_items`);

--
-- Indexes for table `oc_t_currency`
--
ALTER TABLE `oc_t_currency`
  ADD PRIMARY KEY (`pk_c_code`),
  ADD UNIQUE KEY `s_name` (`s_name`);

--
-- Indexes for table `oc_t_item`
--
ALTER TABLE `oc_t_item`
  ADD PRIMARY KEY (`pk_i_id`),
  ADD KEY `fk_i_user_id` (`fk_i_user_id`),
  ADD KEY `idx_b_premium` (`b_premium`),
  ADD KEY `idx_s_contact_email` (`s_contact_email`(10)),
  ADD KEY `fk_i_category_id` (`fk_i_category_id`),
  ADD KEY `fk_c_currency_code` (`fk_c_currency_code`),
  ADD KEY `idx_pub_date` (`dt_pub_date`),
  ADD KEY `idx_price` (`i_price`);

--
-- Indexes for table `oc_t_item_comment`
--
ALTER TABLE `oc_t_item_comment`
  ADD PRIMARY KEY (`pk_i_id`),
  ADD KEY `fk_i_item_id` (`fk_i_item_id`),
  ADD KEY `fk_i_user_id` (`fk_i_user_id`);

--
-- Indexes for table `oc_t_item_description`
--
ALTER TABLE `oc_t_item_description`
  ADD PRIMARY KEY (`fk_i_item_id`,`fk_c_locale_code`);
ALTER TABLE `oc_t_item_description` ADD FULLTEXT KEY `s_description` (`s_description`,`s_title`);

--
-- Indexes for table `oc_t_item_location`
--
ALTER TABLE `oc_t_item_location`
  ADD PRIMARY KEY (`fk_i_item_id`),
  ADD KEY `fk_c_country_code` (`fk_c_country_code`),
  ADD KEY `fk_i_region_id` (`fk_i_region_id`),
  ADD KEY `fk_i_city_id` (`fk_i_city_id`),
  ADD KEY `fk_i_city_area_id` (`fk_i_city_area_id`);

--
-- Indexes for table `oc_t_item_meta`
--
ALTER TABLE `oc_t_item_meta`
  ADD PRIMARY KEY (`fk_i_item_id`,`fk_i_field_id`,`s_multi`),
  ADD KEY `s_value` (`s_value`(255)),
  ADD KEY `fk_i_field_id` (`fk_i_field_id`);

--
-- Indexes for table `oc_t_item_resource`
--
ALTER TABLE `oc_t_item_resource`
  ADD PRIMARY KEY (`pk_i_id`),
  ADD KEY `fk_i_item_id` (`fk_i_item_id`),
  ADD KEY `idx_s_content_type` (`pk_i_id`,`s_content_type`(10));

--
-- Indexes for table `oc_t_item_stats`
--
ALTER TABLE `oc_t_item_stats`
  ADD PRIMARY KEY (`fk_i_item_id`,`dt_date`),
  ADD KEY `dt_date_fk_i_item_id` (`dt_date`,`fk_i_item_id`);

--
-- Indexes for table `oc_t_keywords`
--
ALTER TABLE `oc_t_keywords`
  ADD PRIMARY KEY (`s_md5`,`fk_c_locale_code`),
  ADD KEY `fk_i_category_id` (`fk_i_category_id`),
  ADD KEY `fk_i_city_id` (`fk_i_city_id`),
  ADD KEY `fk_c_locale_code` (`fk_c_locale_code`);

--
-- Indexes for table `oc_t_locale`
--
ALTER TABLE `oc_t_locale`
  ADD PRIMARY KEY (`pk_c_code`),
  ADD UNIQUE KEY `s_short_name` (`s_short_name`);

--
-- Indexes for table `oc_t_locations_tmp`
--
ALTER TABLE `oc_t_locations_tmp`
  ADD PRIMARY KEY (`id_location`,`e_type`);

--
-- Indexes for table `oc_t_meta_categories`
--
ALTER TABLE `oc_t_meta_categories`
  ADD PRIMARY KEY (`fk_i_category_id`,`fk_i_field_id`),
  ADD KEY `fk_i_field_id` (`fk_i_field_id`);

--
-- Indexes for table `oc_t_meta_fields`
--
ALTER TABLE `oc_t_meta_fields`
  ADD PRIMARY KEY (`pk_i_id`);

--
-- Indexes for table `oc_t_pages`
--
ALTER TABLE `oc_t_pages`
  ADD PRIMARY KEY (`pk_i_id`);

--
-- Indexes for table `oc_t_pages_description`
--
ALTER TABLE `oc_t_pages_description`
  ADD PRIMARY KEY (`fk_i_pages_id`,`fk_c_locale_code`),
  ADD KEY `fk_c_locale_code` (`fk_c_locale_code`);

--
-- Indexes for table `oc_t_plugin_category`
--
ALTER TABLE `oc_t_plugin_category`
  ADD KEY `fk_i_category_id` (`fk_i_category_id`);

--
-- Indexes for table `oc_t_preference`
--
ALTER TABLE `oc_t_preference`
  ADD UNIQUE KEY `s_section` (`s_section`,`s_name`);

--
-- Indexes for table `oc_t_region`
--
ALTER TABLE `oc_t_region`
  ADD PRIMARY KEY (`pk_i_id`),
  ADD KEY `fk_c_country_code` (`fk_c_country_code`),
  ADD KEY `idx_s_name` (`s_name`),
  ADD KEY `idx_s_slug` (`s_slug`);

--
-- Indexes for table `oc_t_region_stats`
--
ALTER TABLE `oc_t_region_stats`
  ADD PRIMARY KEY (`fk_i_region_id`),
  ADD KEY `idx_num_items` (`i_num_items`);

--
-- Indexes for table `oc_t_user`
--
ALTER TABLE `oc_t_user`
  ADD PRIMARY KEY (`pk_i_id`),
  ADD UNIQUE KEY `s_email` (`s_email`),
  ADD KEY `idx_s_name` (`s_name`(6)),
  ADD KEY `idx_s_username` (`s_username`),
  ADD KEY `fk_c_country_code` (`fk_c_country_code`),
  ADD KEY `fk_i_region_id` (`fk_i_region_id`),
  ADD KEY `fk_i_city_id` (`fk_i_city_id`),
  ADD KEY `fk_i_city_area_id` (`fk_i_city_area_id`);

--
-- Indexes for table `oc_t_user_description`
--
ALTER TABLE `oc_t_user_description`
  ADD PRIMARY KEY (`fk_i_user_id`,`fk_c_locale_code`),
  ADD KEY `fk_c_locale_code` (`fk_c_locale_code`);

--
-- Indexes for table `oc_t_user_email_tmp`
--
ALTER TABLE `oc_t_user_email_tmp`
  ADD PRIMARY KEY (`fk_i_user_id`);

--
-- Indexes for table `oc_t_widget`
--
ALTER TABLE `oc_t_widget`
  ADD PRIMARY KEY (`pk_i_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `oc_t_admin`
--
ALTER TABLE `oc_t_admin`
  MODIFY `pk_i_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `oc_t_alerts`
--
ALTER TABLE `oc_t_alerts`
  MODIFY `pk_i_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `oc_t_ban_rule`
--
ALTER TABLE `oc_t_ban_rule`
  MODIFY `pk_i_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `oc_t_category`
--
ALTER TABLE `oc_t_category`
  MODIFY `pk_i_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=100;

--
-- AUTO_INCREMENT for table `oc_t_city`
--
ALTER TABLE `oc_t_city`
  MODIFY `pk_i_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `oc_t_item`
--
ALTER TABLE `oc_t_item`
  MODIFY `pk_i_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `oc_t_item_comment`
--
ALTER TABLE `oc_t_item_comment`
  MODIFY `pk_i_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `oc_t_item_resource`
--
ALTER TABLE `oc_t_item_resource`
  MODIFY `pk_i_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `oc_t_meta_fields`
--
ALTER TABLE `oc_t_meta_fields`
  MODIFY `pk_i_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `oc_t_pages`
--
ALTER TABLE `oc_t_pages`
  MODIFY `pk_i_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `oc_t_region`
--
ALTER TABLE `oc_t_region`
  MODIFY `pk_i_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `oc_t_user`
--
ALTER TABLE `oc_t_user`
  MODIFY `pk_i_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `oc_t_widget`
--
ALTER TABLE `oc_t_widget`
  MODIFY `pk_i_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `oc_t_category`
--
ALTER TABLE `oc_t_category`
  ADD CONSTRAINT `oc_t_category_ibfk_1` FOREIGN KEY (`fk_i_parent_id`) REFERENCES `oc_t_category` (`pk_i_id`);

--
-- Constraints for table `oc_t_category_description`
--
ALTER TABLE `oc_t_category_description`
  ADD CONSTRAINT `oc_t_category_description_ibfk_1` FOREIGN KEY (`fk_i_category_id`) REFERENCES `oc_t_category` (`pk_i_id`),
  ADD CONSTRAINT `oc_t_category_description_ibfk_2` FOREIGN KEY (`fk_c_locale_code`) REFERENCES `oc_t_locale` (`pk_c_code`);

--
-- Constraints for table `oc_t_category_stats`
--
ALTER TABLE `oc_t_category_stats`
  ADD CONSTRAINT `oc_t_category_stats_ibfk_1` FOREIGN KEY (`fk_i_category_id`) REFERENCES `oc_t_category` (`pk_i_id`);

--
-- Constraints for table `oc_t_city`
--
ALTER TABLE `oc_t_city`
  ADD CONSTRAINT `oc_t_city_ibfk_1` FOREIGN KEY (`fk_i_region_id`) REFERENCES `oc_t_region` (`pk_i_id`),
  ADD CONSTRAINT `oc_t_city_ibfk_2` FOREIGN KEY (`fk_c_country_code`) REFERENCES `oc_t_country` (`pk_c_code`);

--
-- Constraints for table `oc_t_city_area`
--
ALTER TABLE `oc_t_city_area`
  ADD CONSTRAINT `oc_t_city_area_ibfk_1` FOREIGN KEY (`fk_i_city_id`) REFERENCES `oc_t_city` (`pk_i_id`);

--
-- Constraints for table `oc_t_city_stats`
--
ALTER TABLE `oc_t_city_stats`
  ADD CONSTRAINT `oc_t_city_stats_ibfk_1` FOREIGN KEY (`fk_i_city_id`) REFERENCES `oc_t_city` (`pk_i_id`);

--
-- Constraints for table `oc_t_country_stats`
--
ALTER TABLE `oc_t_country_stats`
  ADD CONSTRAINT `oc_t_country_stats_ibfk_1` FOREIGN KEY (`fk_c_country_code`) REFERENCES `oc_t_country` (`pk_c_code`);

--
-- Constraints for table `oc_t_item`
--
ALTER TABLE `oc_t_item`
  ADD CONSTRAINT `oc_t_item_ibfk_1` FOREIGN KEY (`fk_i_user_id`) REFERENCES `oc_t_user` (`pk_i_id`),
  ADD CONSTRAINT `oc_t_item_ibfk_2` FOREIGN KEY (`fk_i_category_id`) REFERENCES `oc_t_category` (`pk_i_id`),
  ADD CONSTRAINT `oc_t_item_ibfk_3` FOREIGN KEY (`fk_c_currency_code`) REFERENCES `oc_t_currency` (`pk_c_code`);

--
-- Constraints for table `oc_t_item_comment`
--
ALTER TABLE `oc_t_item_comment`
  ADD CONSTRAINT `oc_t_item_comment_ibfk_1` FOREIGN KEY (`fk_i_item_id`) REFERENCES `oc_t_item` (`pk_i_id`),
  ADD CONSTRAINT `oc_t_item_comment_ibfk_2` FOREIGN KEY (`fk_i_user_id`) REFERENCES `oc_t_user` (`pk_i_id`);

--
-- Constraints for table `oc_t_item_location`
--
ALTER TABLE `oc_t_item_location`
  ADD CONSTRAINT `oc_t_item_location_ibfk_1` FOREIGN KEY (`fk_i_item_id`) REFERENCES `oc_t_item` (`pk_i_id`),
  ADD CONSTRAINT `oc_t_item_location_ibfk_2` FOREIGN KEY (`fk_c_country_code`) REFERENCES `oc_t_country` (`pk_c_code`),
  ADD CONSTRAINT `oc_t_item_location_ibfk_3` FOREIGN KEY (`fk_i_region_id`) REFERENCES `oc_t_region` (`pk_i_id`),
  ADD CONSTRAINT `oc_t_item_location_ibfk_4` FOREIGN KEY (`fk_i_city_id`) REFERENCES `oc_t_city` (`pk_i_id`),
  ADD CONSTRAINT `oc_t_item_location_ibfk_5` FOREIGN KEY (`fk_i_city_area_id`) REFERENCES `oc_t_city_area` (`pk_i_id`);

--
-- Constraints for table `oc_t_item_meta`
--
ALTER TABLE `oc_t_item_meta`
  ADD CONSTRAINT `oc_t_item_meta_ibfk_1` FOREIGN KEY (`fk_i_item_id`) REFERENCES `oc_t_item` (`pk_i_id`),
  ADD CONSTRAINT `oc_t_item_meta_ibfk_2` FOREIGN KEY (`fk_i_field_id`) REFERENCES `oc_t_meta_fields` (`pk_i_id`);

--
-- Constraints for table `oc_t_item_resource`
--
ALTER TABLE `oc_t_item_resource`
  ADD CONSTRAINT `oc_t_item_resource_ibfk_1` FOREIGN KEY (`fk_i_item_id`) REFERENCES `oc_t_item` (`pk_i_id`);

--
-- Constraints for table `oc_t_item_stats`
--
ALTER TABLE `oc_t_item_stats`
  ADD CONSTRAINT `oc_t_item_stats_ibfk_1` FOREIGN KEY (`fk_i_item_id`) REFERENCES `oc_t_item` (`pk_i_id`);

--
-- Constraints for table `oc_t_keywords`
--
ALTER TABLE `oc_t_keywords`
  ADD CONSTRAINT `oc_t_keywords_ibfk_1` FOREIGN KEY (`fk_i_category_id`) REFERENCES `oc_t_category` (`pk_i_id`),
  ADD CONSTRAINT `oc_t_keywords_ibfk_2` FOREIGN KEY (`fk_i_city_id`) REFERENCES `oc_t_city` (`pk_i_id`),
  ADD CONSTRAINT `oc_t_keywords_ibfk_3` FOREIGN KEY (`fk_c_locale_code`) REFERENCES `oc_t_locale` (`pk_c_code`);

--
-- Constraints for table `oc_t_meta_categories`
--
ALTER TABLE `oc_t_meta_categories`
  ADD CONSTRAINT `oc_t_meta_categories_ibfk_1` FOREIGN KEY (`fk_i_category_id`) REFERENCES `oc_t_category` (`pk_i_id`),
  ADD CONSTRAINT `oc_t_meta_categories_ibfk_2` FOREIGN KEY (`fk_i_field_id`) REFERENCES `oc_t_meta_fields` (`pk_i_id`);

--
-- Constraints for table `oc_t_pages_description`
--
ALTER TABLE `oc_t_pages_description`
  ADD CONSTRAINT `oc_t_pages_description_ibfk_1` FOREIGN KEY (`fk_i_pages_id`) REFERENCES `oc_t_pages` (`pk_i_id`),
  ADD CONSTRAINT `oc_t_pages_description_ibfk_2` FOREIGN KEY (`fk_c_locale_code`) REFERENCES `oc_t_locale` (`pk_c_code`);

--
-- Constraints for table `oc_t_plugin_category`
--
ALTER TABLE `oc_t_plugin_category`
  ADD CONSTRAINT `oc_t_plugin_category_ibfk_1` FOREIGN KEY (`fk_i_category_id`) REFERENCES `oc_t_category` (`pk_i_id`);

--
-- Constraints for table `oc_t_region`
--
ALTER TABLE `oc_t_region`
  ADD CONSTRAINT `oc_t_region_ibfk_1` FOREIGN KEY (`fk_c_country_code`) REFERENCES `oc_t_country` (`pk_c_code`);

--
-- Constraints for table `oc_t_region_stats`
--
ALTER TABLE `oc_t_region_stats`
  ADD CONSTRAINT `oc_t_region_stats_ibfk_1` FOREIGN KEY (`fk_i_region_id`) REFERENCES `oc_t_region` (`pk_i_id`);

--
-- Constraints for table `oc_t_user`
--
ALTER TABLE `oc_t_user`
  ADD CONSTRAINT `oc_t_user_ibfk_1` FOREIGN KEY (`fk_c_country_code`) REFERENCES `oc_t_country` (`pk_c_code`),
  ADD CONSTRAINT `oc_t_user_ibfk_2` FOREIGN KEY (`fk_i_region_id`) REFERENCES `oc_t_region` (`pk_i_id`),
  ADD CONSTRAINT `oc_t_user_ibfk_3` FOREIGN KEY (`fk_i_city_id`) REFERENCES `oc_t_city` (`pk_i_id`),
  ADD CONSTRAINT `oc_t_user_ibfk_4` FOREIGN KEY (`fk_i_city_area_id`) REFERENCES `oc_t_city_area` (`pk_i_id`);

--
-- Constraints for table `oc_t_user_description`
--
ALTER TABLE `oc_t_user_description`
  ADD CONSTRAINT `oc_t_user_description_ibfk_1` FOREIGN KEY (`fk_i_user_id`) REFERENCES `oc_t_user` (`pk_i_id`),
  ADD CONSTRAINT `oc_t_user_description_ibfk_2` FOREIGN KEY (`fk_c_locale_code`) REFERENCES `oc_t_locale` (`pk_c_code`);

--
-- Constraints for table `oc_t_user_email_tmp`
--
ALTER TABLE `oc_t_user_email_tmp`
  ADD CONSTRAINT `oc_t_user_email_tmp_ibfk_1` FOREIGN KEY (`fk_i_user_id`) REFERENCES `oc_t_user` (`pk_i_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
