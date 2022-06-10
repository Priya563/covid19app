-- phpMyAdmin SQL Dump
-- version 4.2.11
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Jun 04, 2022 at 06:09 PM
-- Server version: 5.6.21
-- PHP Version: 5.5.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `core`
--

-- --------------------------------------------------------

--
-- Table structure for table `auth_group`
--

CREATE TABLE IF NOT EXISTS `auth_group` (
`id` int(11) NOT NULL,
  `name` varchar(150) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Table structure for table `auth_group_permissions`
--

CREATE TABLE IF NOT EXISTS `auth_group_permissions` (
`id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Table structure for table `auth_permission`
--

CREATE TABLE IF NOT EXISTS `auth_permission` (
`id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_bin NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can view log entry', 1, 'view_logentry'),
(5, 'Can add permission', 2, 'add_permission'),
(6, 'Can change permission', 2, 'change_permission'),
(7, 'Can delete permission', 2, 'delete_permission'),
(8, 'Can view permission', 2, 'view_permission'),
(9, 'Can add group', 3, 'add_group'),
(10, 'Can change group', 3, 'change_group'),
(11, 'Can delete group', 3, 'delete_group'),
(12, 'Can view group', 3, 'view_group'),
(13, 'Can add user', 4, 'add_user'),
(14, 'Can change user', 4, 'change_user'),
(15, 'Can delete user', 4, 'delete_user'),
(16, 'Can view user', 4, 'view_user'),
(17, 'Can add content type', 5, 'add_contenttype'),
(18, 'Can change content type', 5, 'change_contenttype'),
(19, 'Can delete content type', 5, 'delete_contenttype'),
(20, 'Can view content type', 5, 'view_contenttype'),
(21, 'Can add session', 6, 'add_session'),
(22, 'Can change session', 6, 'change_session'),
(23, 'Can delete session', 6, 'delete_session'),
(24, 'Can view session', 6, 'view_session'),
(25, 'Can add bed', 7, 'add_bed'),
(26, 'Can change bed', 7, 'change_bed'),
(27, 'Can delete bed', 7, 'delete_bed'),
(28, 'Can view bed', 7, 'view_bed'),
(29, 'Can add doctor', 8, 'add_doctor'),
(30, 'Can change doctor', 8, 'change_doctor'),
(31, 'Can delete doctor', 8, 'delete_doctor'),
(32, 'Can view doctor', 8, 'view_doctor'),
(33, 'Can add patient', 9, 'add_patient'),
(34, 'Can change patient', 9, 'change_patient'),
(35, 'Can delete patient', 9, 'delete_patient'),
(36, 'Can view patient', 9, 'view_patient'),
(37, 'Can add contacts', 10, 'add_contacts'),
(38, 'Can change contacts', 10, 'change_contacts'),
(39, 'Can delete contacts', 10, 'delete_contacts'),
(40, 'Can view contacts', 10, 'view_contacts'),
(41, 'Can add profile', 11, 'add_profile'),
(42, 'Can change profile', 11, 'change_profile'),
(43, 'Can delete profile', 11, 'delete_profile'),
(44, 'Can view profile', 11, 'view_profile'),
(45, 'Can add appointment', 12, 'add_appointment'),
(46, 'Can change appointment', 12, 'change_appointment'),
(47, 'Can delete appointment', 12, 'delete_appointment'),
(48, 'Can view appointment', 12, 'view_appointment');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user`
--

CREATE TABLE IF NOT EXISTS `auth_user` (
`id` int(11) NOT NULL,
  `password` varchar(128) COLLATE utf8_bin NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) COLLATE utf8_bin NOT NULL,
  `first_name` varchar(150) COLLATE utf8_bin NOT NULL,
  `last_name` varchar(150) COLLATE utf8_bin NOT NULL,
  `email` varchar(254) COLLATE utf8_bin NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `auth_user`
--

INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`) VALUES
(1, 'pbkdf2_sha256$216000$XWTxrQM3qiYx$RVz7vp5TpVqa/vvgyJx6ngDmhQzv1irzFqLPk1cupL4=', '2022-06-04 14:14:35.945887', 1, 'admin', '', '', 'admin@gmail.com', 1, 1, '2022-06-03 12:20:21.768171'),
(2, 'pbkdf2_sha256$216000$mfBmnbWMihfL$N3irv4CbEziSzblFUqI9bJhyS8BldV+RJ1QVxoaFGA4=', '2022-06-04 11:38:16.504775', 0, 'user1', '', '', '', 0, 1, '2022-06-03 12:29:37.732682'),
(3, 'pbkdf2_sha256$216000$7an77ASSO7CS$7LXrwLbPB77SPYJDKqywKgnYPKweDa0+wzaXlQ+WPx8=', '2022-06-04 11:00:26.179618', 0, 'user2', 'ameer', 'khan', 'user2@gmail.com', 0, 1, '2022-06-04 10:46:27.314553'),
(4, 'pbkdf2_sha256$216000$FqLcszIbRZRv$Mb9C/qb4iT/1XwCO+oIjQ45oYztHnXKLYKb8LQjp0vk=', '2022-06-04 16:07:00.850849', 0, 'user3', 'roja', 'gani', 'user3@gmail.com', 0, 1, '2022-06-04 11:02:19.605520'),
(5, 'pbkdf2_sha256$216000$5hXKL3FaG87I$mm8OajgGF+DLKWv1ND0kGe7aM3U67VsWQzgHRTsOj1k=', '2022-06-04 14:14:53.735464', 1, 'admin1', '', '', 'admin@gmail.com', 1, 1, '2022-06-04 11:43:18.231404'),
(6, 'pbkdf2_sha256$216000$LFnMYG92xnCL$A4WZYIdtex9XHuI3Wo+ArKD5JvAUoXDgCEgIoTXvYK8=', '2022-06-04 14:30:30.252984', 0, 'covid123', '', '', '', 1, 1, '2022-06-04 14:18:29.000000');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_groups`
--

CREATE TABLE IF NOT EXISTS `auth_user_groups` (
`id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_user_permissions`
--

CREATE TABLE IF NOT EXISTS `auth_user_user_permissions` (
`id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Table structure for table `django_admin_log`
--

CREATE TABLE IF NOT EXISTS `django_admin_log` (
`id` int(11) NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext COLLATE utf8_bin,
  `object_repr` varchar(200) COLLATE utf8_bin NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext COLLATE utf8_bin NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `django_admin_log`
--

INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES
(1, '2022-06-03 12:29:37.961357', '2', 'user1', 1, '[{"added": {}}]', 4, 1),
(2, '2022-06-03 12:41:05.688544', '1', 'B1', 1, '[{"added": {}}]', 7, 1),
(3, '2022-06-03 12:41:19.276310', '2', 'B2', 1, '[{"added": {}}]', 7, 1),
(4, '2022-06-03 12:41:34.990856', '3', 'B3', 1, '[{"added": {}}]', 7, 1),
(5, '2022-06-03 12:41:44.127412', '4', 'B4', 1, '[{"added": {}}]', 7, 1),
(6, '2022-06-03 12:41:51.287452', '5', 'B5', 1, '[{"added": {}}]', 7, 1),
(7, '2022-06-03 12:41:58.159021', '6', 'B6', 1, '[{"added": {}}]', 7, 1),
(8, '2022-06-03 12:42:03.241379', '7', 'B7', 1, '[{"added": {}}]', 7, 1),
(9, '2022-06-03 12:42:09.097353', '8', 'B8', 1, '[{"added": {}}]', 7, 1),
(10, '2022-06-03 12:42:14.212228', '9', 'B9', 1, '[{"added": {}}]', 7, 1),
(11, '2022-06-03 12:42:19.856783', '10', 'B10', 1, '[{"added": {}}]', 7, 1),
(12, '2022-06-04 11:44:02.105110', '1', 'Appointment object (1)', 2, '[{"changed": {"fields": ["Status", "Notes"]}}]', 12, 5),
(13, '2022-06-04 14:18:29.630484', '6', 'covid123', 1, '[{"added": {}}]', 4, 5),
(14, '2022-06-04 14:18:41.051033', '6', 'covid123', 2, '[{"changed": {"fields": ["Staff status"]}}]', 4, 5);

-- --------------------------------------------------------

--
-- Table structure for table `django_content_type`
--

CREATE TABLE IF NOT EXISTS `django_content_type` (
`id` int(11) NOT NULL,
  `app_label` varchar(100) COLLATE utf8_bin NOT NULL,
  `model` varchar(100) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(4, 'auth', 'user'),
(5, 'contenttypes', 'contenttype'),
(12, 'main', 'appointment'),
(7, 'main', 'bed'),
(10, 'main', 'contacts'),
(8, 'main', 'doctor'),
(9, 'main', 'patient'),
(11, 'main', 'profile'),
(6, 'sessions', 'session');

-- --------------------------------------------------------

--
-- Table structure for table `django_migrations`
--

CREATE TABLE IF NOT EXISTS `django_migrations` (
`id` int(11) NOT NULL,
  `app` varchar(255) COLLATE utf8_bin NOT NULL,
  `name` varchar(255) COLLATE utf8_bin NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2022-06-03 12:18:26.124556'),
(2, 'auth', '0001_initial', '2022-06-03 12:18:26.387611'),
(3, 'admin', '0001_initial', '2022-06-03 12:18:26.877767'),
(4, 'admin', '0002_logentry_remove_auto_add', '2022-06-03 12:18:26.984814'),
(5, 'admin', '0003_logentry_add_action_flag_choices', '2022-06-03 12:18:27.000821'),
(6, 'contenttypes', '0002_remove_content_type_name', '2022-06-03 12:18:27.103228'),
(7, 'auth', '0002_alter_permission_name_max_length', '2022-06-03 12:18:27.158425'),
(8, 'auth', '0003_alter_user_email_max_length', '2022-06-03 12:18:27.214262'),
(9, 'auth', '0004_alter_user_username_opts', '2022-06-03 12:18:27.234351'),
(10, 'auth', '0005_alter_user_last_login_null', '2022-06-03 12:18:27.289093'),
(11, 'auth', '0006_require_contenttypes_0002', '2022-06-03 12:18:27.300060'),
(12, 'auth', '0007_alter_validators_add_error_messages', '2022-06-03 12:18:27.321867'),
(13, 'auth', '0008_alter_user_username_max_length', '2022-06-03 12:18:27.388846'),
(14, 'auth', '0009_alter_user_last_name_max_length', '2022-06-03 12:18:27.446095'),
(15, 'auth', '0010_alter_group_name_max_length', '2022-06-03 12:18:27.508874'),
(16, 'auth', '0011_update_proxy_permissions', '2022-06-03 12:18:27.526677'),
(17, 'auth', '0012_alter_user_first_name_max_length', '2022-06-03 12:18:27.591100'),
(18, 'main', '0001_initial', '2022-06-03 12:18:27.850616'),
(19, 'main', '0002_contacts', '2022-06-03 12:18:27.991453'),
(20, 'main', '0003_message', '2022-06-03 12:18:28.079788'),
(21, 'main', '0004_delete_message', '2022-06-03 12:18:28.096170'),
(22, 'main', '0005_auto_20220603_1742', '2022-06-03 12:18:28.232117'),
(23, 'sessions', '0001_initial', '2022-06-03 12:18:28.282451'),
(24, 'main', '0006_profile', '2022-06-04 10:46:52.134424'),
(25, 'main', '0007_appointment', '2022-06-04 11:09:35.061016'),
(26, 'main', '0008_remove_appointment_appointmentcreateuser', '2022-06-04 11:13:18.024202'),
(27, 'main', '0009_auto_20220604_1723', '2022-06-04 11:53:03.327332');

-- --------------------------------------------------------

--
-- Table structure for table `django_session`
--

CREATE TABLE IF NOT EXISTS `django_session` (
  `session_key` varchar(40) COLLATE utf8_bin NOT NULL,
  `session_data` longtext COLLATE utf8_bin NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('24j4z8rbg0mkymx7nru4cjvcvjvncehh', 'e30:1nxUXz:ZAa_Aw2Adk_ySToKxfgUSU7F7ldIiIgDhqTdk9qeksw', '2022-06-18 14:14:35.938193'),
('27x9bz3016w8z58xj8x4vwwe05sav2a4', 'e30:1nxS5R:fE07Zsq-RcKqg_RpQInJOzKzkBD_2o34qTIgQUMAtKk', '2022-06-18 11:36:57.706768'),
('3cbb253slplvm4hxjhg6l9zub53fs5vk', 'e30:1nxS6i:w13FkFobllpORlZCDNj9ovvLHHhuyfd26etVCo9_GyI', '2022-06-18 11:38:16.502606'),
('3egx7wvvdyw6stx8z2yfcrlr2ft73u7j', 'e30:1nxRW6:ePyp_ESyjLu9U1rkf_bqYA-CnmTPtVU9MFYP84DPtRo', '2022-06-18 11:00:26.176314'),
('4355pah2fkgyag4vr26o9mhxgv5vxc9d', '.eJxVjMsOwiAQRf-FtSGUx5S6dO83kIEZpGogKe3K-O_apAvd3nPOfYmA21rC1nkJM4mzcOL0u0VMD647oDvWW5Op1XWZo9wVedAur434eTncv4OCvXxrjzpq0qRyBG0TeYUGcEiZHGs_udGwJTcB5VFB9MgDeLbRGCBgnUG8P_azOD0:1nxSh7:rPFk9KNtm0LbKiKQ80bFkicdOIFgn7oMaAEJK4GLLRI', '2022-06-18 12:15:53.078636'),
('7ycetxippheq2cxy9gi05wqdw7ku57ab', 'e30:1nxS3A:CNToSl88wSMUZgfjJkH1sdimaUOmmGArwdwReNiQ4Mo', '2022-06-18 11:34:36.730950'),
('cdskae7kfi7pb4wwa4j6iamsa98lj711', 'e30:1nxS30:VINQQGr6AkgexbMPUzrny8HO2iYGm57OteSinrbpLFc', '2022-06-18 11:34:26.475008'),
('ietwgwblkpgvm22x7mqgw40fwm5c4ogg', 'e30:1nxS40:EM9F2Vsua5PRvWRhxo9GkaD8vgSB-jo3YhixNtggvIA', '2022-06-18 11:35:28.202490'),
('ikc6jaae6efnguwqqm59fwl4picdj3d7', '.eJxVjDEOwyAUQ-_CXKEAH0I6ds8Z0Ac-JW0FUkimqncvkTK0k2U_22_mcN-y2xutbonsygy7_GYew5PKAeIDy73yUMu2Lp4fFX7Sxuca6XU7u38HGVvuawVRoRoFwaiDtwOYKUggFAlMApG8BN1lioTdWgSyQoU0CLTCkJbs8wXZAzec:1nxUnO:dw_c6jUtbcVlHeT98mKJzlJ2KX75rQwtaoKIT5exGBM', '2022-06-18 14:30:30.261578'),
('nn38ntc8av27bg64va9ndulrxfctkayl', '.eJxVjEEOwiAQRe_C2hDAcQCX7nsGMsNQqZo2Ke3KeHfbpAvdvvf-f6tE61LT2sqcBlFXZdXplzHlZxl3IQ8a75PO07jMA-s90YdtupukvG5H-3dQqdVtbXoGKdE6ctFnz-DA9wEzgYiPYLKgBEaDl7ABAmDDEaycMSICBvX5AuiQN4g:1nx7Uq:iv4SvNdtyl6Ojzjs_noEQKNCW3ll8NLfGumQUC5Oyik', '2022-06-17 13:37:48.104536'),
('oilvfihxw2tejx2n8unvseh91v4xkfqt', 'e30:1nxS6F:mPE1U7lylo6x-n71TxBEgxLxvmKfQn0rF1Xzbr0CZCo', '2022-06-18 11:37:47.577597'),
('szog3oaapekkqqbdpsfb77mtjf1xolgx', 'e30:1nxSAL:TDCEFuf5LIRLeopyJukFPsmtEPMexfJxlTmqhoxzGRI', '2022-06-18 11:42:01.964860'),
('zmlemqvusia3dpnhhkdayhda75e7ov3b', '.eJxVjDEOwyAUQ-_CXKEAH0I6ds8Z0Ac-JW0FUkimqncvkTK0k2U_22_mcN-y2xutbonsygy7_GYew5PKAeIDy73yUMu2Lp4fFX7Sxuca6XU7u38HGVvuawVRoRoFwaiDtwOYKUggFAlMApG8BN1lioTdWgSyQoU0CLTCkJbs8wXZAzec:1nxUgu:qSkB0IRvq5votDmF8GRSrVvKcEU9kjohH9e-_wQJ1Zo', '2022-06-18 14:23:48.366439');

-- --------------------------------------------------------

--
-- Table structure for table `main_appointment`
--

CREATE TABLE IF NOT EXISTS `main_appointment` (
`id` int(11) NOT NULL,
  `Type` varchar(50) COLLATE utf8_bin NOT NULL,
  `Patientname` varchar(20) COLLATE utf8_bin NOT NULL,
  `Contactno` varchar(10) COLLATE utf8_bin NOT NULL,
  `Appointmentdate` date NOT NULL,
  `Time` time(6) NOT NULL,
  `Aadharno` varchar(12) COLLATE utf8_bin NOT NULL,
  `status` varchar(50) COLLATE utf8_bin NOT NULL,
  `notes` varchar(50) COLLATE utf8_bin NOT NULL,
  `loggeduser` varchar(50) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `main_appointment`
--

INSERT INTO `main_appointment` (`id`, `Type`, `Patientname`, `Contactno`, `Appointmentdate`, `Time`, `Aadharno`, `status`, `notes`, `loggeduser`) VALUES
(1, 'Covid-19 Test', 'raj', '9546464466', '2022-06-10', '12:00:00.000000', '857875878575', 'Booked', 'your appointment booked', 'user3');

-- --------------------------------------------------------

--
-- Table structure for table `main_bed`
--

CREATE TABLE IF NOT EXISTS `main_bed` (
`id` int(11) NOT NULL,
  `bed_number` varchar(50) COLLATE utf8_bin NOT NULL,
  `occupied` tinyint(1) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `main_bed`
--

INSERT INTO `main_bed` (`id`, `bed_number`, `occupied`) VALUES
(1, 'B1', 1),
(2, 'B2', 1),
(3, 'B3', 1),
(4, 'B4', 1),
(5, 'B5', 1),
(6, 'B6', 1),
(7, 'B7', 1),
(8, 'B8', 1),
(9, 'B9', 1),
(10, 'B10', 1);

-- --------------------------------------------------------

--
-- Table structure for table `main_contacts`
--

CREATE TABLE IF NOT EXISTS `main_contacts` (
`id` int(11) NOT NULL,
  `phone_number` varchar(10) COLLATE utf8_bin NOT NULL,
  `email_id` varchar(250) COLLATE utf8_bin NOT NULL,
  `p_id_id` int(11) NOT NULL,
  `contactcreateuser` varchar(50) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `main_contacts`
--

INSERT INTO `main_contacts` (`id`, `phone_number`, `email_id`, `p_id_id`, `contactcreateuser`) VALUES
(1, '9668698696', 'khanmohamedameer@gmail.com', 1, '1'),
(2, '7878678866', 'fowji@gmail.com', 1, '1'),
(4, '787868687', 'khanmohamedameer@gmail.com', 2, '1'),
(5, '898698686', 'anu@gmail.com', 2, 'user3'),
(6, '9868698666', 'ram@gmail.com', 4, 'user3'),
(7, '786868678', 'test@gmail.com', 4, 'user3');

-- --------------------------------------------------------

--
-- Table structure for table `main_doctor`
--

CREATE TABLE IF NOT EXISTS `main_doctor` (
`id` int(11) NOT NULL,
  `name` varchar(100) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `main_doctor`
--

INSERT INTO `main_doctor` (`id`, `name`) VALUES
(5, 'Dr. ARUN'),
(6, 'Dr. BALA VENKATESH'),
(7, 'Dr. MYTHILY'),
(8, 'Dr. VENKAT RAMAN'),
(9, 'Dr. SANGEETHA'),
(10, 'Dr. ABINAYA');

-- --------------------------------------------------------

--
-- Table structure for table `main_patient`
--

CREATE TABLE IF NOT EXISTS `main_patient` (
`id` int(11) NOT NULL,
  `name` varchar(50) COLLATE utf8_bin NOT NULL,
  `phone_num` varchar(15) COLLATE utf8_bin NOT NULL,
  `patient_relative_name` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `patient_relative_contact` varchar(15) COLLATE utf8_bin DEFAULT NULL,
  `address` longtext COLLATE utf8_bin NOT NULL,
  `symptoms` varchar(183) COLLATE utf8_bin DEFAULT NULL,
  `prior_ailments` longtext COLLATE utf8_bin NOT NULL,
  `dob` date DEFAULT NULL,
  `doctors_notes` longtext COLLATE utf8_bin,
  `doctors_visiting_time` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `status` varchar(50) COLLATE utf8_bin NOT NULL,
  `bed_num_id` int(11) NOT NULL,
  `doctor_id` int(11) DEFAULT NULL,
  `lantitude` varchar(20) COLLATE utf8_bin NOT NULL,
  `latitude` varchar(20) COLLATE utf8_bin NOT NULL,
  `loggeduser` varchar(50) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `main_patient`
--

INSERT INTO `main_patient` (`id`, `name`, `phone_num`, `patient_relative_name`, `patient_relative_contact`, `address`, `symptoms`, `prior_ailments`, `dob`, `doctors_notes`, `doctors_visiting_time`, `status`, `bed_num_id`, `doctor_id`, `lantitude`, `latitude`, `loggeduser`) VALUES
(1, 'anu', '8787575575', 'priya', '8577676553', '11,main road, chennai', 'Tiredness', 'thyroid', '2022-06-15', 'None', 'None', 'Deceased', 8, 7, '79.380898', '10.959815', '1'),
(2, 'swetha', '767545444', 'rekha', '867675555', '11, south street, theni', 'Tiredness', 'Diabetics', '2022-06-10', 'None', 'None', 'Recovering', 9, 8, '', '', '1'),
(3, 'ravi', '95654646445', 'ram', '7867575553', '11, main road, karaikal', 'Sore Throat', 'Thhyroid', '2022-06-16', 'None', 'None', 'Recovered', 7, 7, '80.27998811435556', '13.08728876703888', 'user3'),
(4, 'ragul', '9467647445', 'rosy', '8578577553', '8,south street, kumbakonam', 'Tiredness', 'Diabetics', '2022-06-22', 'None', 'None', 'Recovered', 10, 9, '', '', 'user3');

-- --------------------------------------------------------

--
-- Table structure for table `main_profile`
--

CREATE TABLE IF NOT EXISTS `main_profile` (
`id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `main_profile`
--

INSERT INTO `main_profile` (`id`, `user_id`) VALUES
(1, 4),
(2, 5),
(3, 6);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `auth_group`
--
ALTER TABLE `auth_group`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`), ADD KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `auth_permission`
--
ALTER TABLE `auth_permission`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`);

--
-- Indexes for table `auth_user`
--
ALTER TABLE `auth_user`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`), ADD KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`);

--
-- Indexes for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`), ADD KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
 ADD PRIMARY KEY (`id`), ADD KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`), ADD KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`);

--
-- Indexes for table `django_content_type`
--
ALTER TABLE `django_content_type`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`);

--
-- Indexes for table `django_migrations`
--
ALTER TABLE `django_migrations`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `django_session`
--
ALTER TABLE `django_session`
 ADD PRIMARY KEY (`session_key`), ADD KEY `django_session_expire_date_a5c62663` (`expire_date`);

--
-- Indexes for table `main_appointment`
--
ALTER TABLE `main_appointment`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `main_bed`
--
ALTER TABLE `main_bed`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `main_contacts`
--
ALTER TABLE `main_contacts`
 ADD PRIMARY KEY (`id`), ADD KEY `main_contacts_p_id_id_1f2c02dc_fk_main_patient_id` (`p_id_id`);

--
-- Indexes for table `main_doctor`
--
ALTER TABLE `main_doctor`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `main_patient`
--
ALTER TABLE `main_patient`
 ADD PRIMARY KEY (`id`), ADD KEY `main_patient_bed_num_id_2204c8f8_fk_main_bed_id` (`bed_num_id`), ADD KEY `main_patient_doctor_id_e0580a93_fk_main_doctor_id` (`doctor_id`);

--
-- Indexes for table `main_profile`
--
ALTER TABLE `main_profile`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `user_id` (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `auth_group`
--
ALTER TABLE `auth_group`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `auth_permission`
--
ALTER TABLE `auth_permission`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=49;
--
-- AUTO_INCREMENT for table `auth_user`
--
ALTER TABLE `auth_user`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=15;
--
-- AUTO_INCREMENT for table `django_content_type`
--
ALTER TABLE `django_content_type`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT for table `django_migrations`
--
ALTER TABLE `django_migrations`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=28;
--
-- AUTO_INCREMENT for table `main_appointment`
--
ALTER TABLE `main_appointment`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `main_bed`
--
ALTER TABLE `main_bed`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `main_contacts`
--
ALTER TABLE `main_contacts`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `main_doctor`
--
ALTER TABLE `main_doctor`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `main_patient`
--
ALTER TABLE `main_patient`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `main_profile`
--
ALTER TABLE `main_profile`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Constraints for table `auth_permission`
--
ALTER TABLE `auth_permission`
ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Constraints for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
ADD CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
ADD CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
ADD CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
ADD CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `main_contacts`
--
ALTER TABLE `main_contacts`
ADD CONSTRAINT `main_contacts_p_id_id_1f2c02dc_fk_main_patient_id` FOREIGN KEY (`p_id_id`) REFERENCES `main_patient` (`id`);

--
-- Constraints for table `main_patient`
--
ALTER TABLE `main_patient`
ADD CONSTRAINT `main_patient_bed_num_id_2204c8f8_fk_main_bed_id` FOREIGN KEY (`bed_num_id`) REFERENCES `main_bed` (`id`),
ADD CONSTRAINT `main_patient_doctor_id_e0580a93_fk_main_doctor_id` FOREIGN KEY (`doctor_id`) REFERENCES `main_doctor` (`id`);

--
-- Constraints for table `main_profile`
--
ALTER TABLE `main_profile`
ADD CONSTRAINT `main_profile_user_id_b40d720a_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
