-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Jun 04, 2023 at 03:57 PM
-- Server version: 8.0.31
-- PHP Version: 7.4.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `fundpulse`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin_settings`
--

DROP TABLE IF EXISTS `admin_settings`;
CREATE TABLE IF NOT EXISTS `admin_settings` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `welcome_text` varchar(200) NOT NULL,
  `welcome_subtitle` text NOT NULL,
  `keywords` varchar(255) NOT NULL,
  `result_request` int UNSIGNED NOT NULL COMMENT 'The max number of shots per request',
  `status_page` enum('0','1') NOT NULL DEFAULT '1' COMMENT '0 Offline, 1 Online',
  `email_verification` enum('0','1') NOT NULL COMMENT '0 Off, 1 On',
  `email_no_reply` varchar(200) NOT NULL,
  `email_admin` varchar(200) NOT NULL,
  `captcha` enum('on','off') NOT NULL DEFAULT 'on',
  `file_size_allowed` int UNSIGNED NOT NULL COMMENT 'Size in Bytes',
  `google_analytics` text NOT NULL,
  `paypal_account` varchar(200) NOT NULL,
  `twitter` varchar(200) NOT NULL,
  `facebook` varchar(200) NOT NULL,
  `googleplus` varchar(200) NOT NULL,
  `instagram` varchar(200) NOT NULL,
  `google_adsense` text NOT NULL,
  `currency_symbol` char(10) NOT NULL,
  `currency_code` varchar(20) NOT NULL,
  `min_donation_amount` int UNSIGNED NOT NULL,
  `min_campaign_amount` int UNSIGNED NOT NULL,
  `max_campaign_amount` int UNSIGNED NOT NULL,
  `payment_gateway` enum('Paypal','Stripe') NOT NULL DEFAULT 'Paypal',
  `paypal_sandbox` enum('true','false') NOT NULL DEFAULT 'true',
  `min_width_height_image` varchar(100) NOT NULL,
  `fee_donation` int UNSIGNED NOT NULL,
  `auto_approve_campaigns` enum('0','1') NOT NULL DEFAULT '1',
  `stripe_secret_key` varchar(255) NOT NULL,
  `stripe_public_key` varchar(255) NOT NULL,
  `max_donation_amount` int UNSIGNED NOT NULL,
  `enable_paypal` enum('0','1') NOT NULL DEFAULT '0',
  `enable_stripe` enum('0','1') NOT NULL DEFAULT '0',
  `enable_bank_transfer` enum('0','1') NOT NULL DEFAULT '0',
  `bank_swift_code` varchar(250) NOT NULL,
  `account_number` varchar(250) NOT NULL,
  `branch_name` varchar(250) NOT NULL,
  `branch_address` varchar(250) NOT NULL,
  `account_name` varchar(250) NOT NULL,
  `iban` varchar(250) NOT NULL,
  `date_format` varchar(200) NOT NULL,
  `link_privacy` varchar(200) NOT NULL,
  `link_terms` varchar(200) NOT NULL,
  `currency_position` enum('left','right') NOT NULL DEFAULT 'left',
  `facebook_login` enum('on','off') NOT NULL DEFAULT 'off',
  `google_login` enum('on','off') NOT NULL DEFAULT 'off',
  `decimal_format` enum('comma','dot') NOT NULL DEFAULT 'dot',
  `registration_active` enum('on','off') NOT NULL DEFAULT 'on',
  `color_default` varchar(100) NOT NULL,
  `version` varchar(5) NOT NULL,
  `captcha_on_donations` enum('on','off') NOT NULL DEFAULT 'on',
  PRIMARY KEY (`id`),
  KEY `max_campaign_amount` (`max_campaign_amount`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `admin_settings`
--

INSERT INTO `admin_settings` (`id`, `title`, `description`, `welcome_text`, `welcome_subtitle`, `keywords`, `result_request`, `status_page`, `email_verification`, `email_no_reply`, `email_admin`, `captcha`, `file_size_allowed`, `google_analytics`, `paypal_account`, `twitter`, `facebook`, `googleplus`, `instagram`, `google_adsense`, `currency_symbol`, `currency_code`, `min_donation_amount`, `min_campaign_amount`, `max_campaign_amount`, `payment_gateway`, `paypal_sandbox`, `min_width_height_image`, `fee_donation`, `auto_approve_campaigns`, `stripe_secret_key`, `stripe_public_key`, `max_donation_amount`, `enable_paypal`, `enable_stripe`, `enable_bank_transfer`, `bank_swift_code`, `account_number`, `branch_name`, `branch_address`, `account_name`, `iban`, `date_format`, `link_privacy`, `link_terms`, `currency_position`, `facebook_login`, `google_login`, `decimal_format`, `registration_active`, `color_default`, `version`, `captcha_on_donations`) VALUES
(1, 'FundPulse', 'FundPulse, the Heartbeat of Crowdfunding, is a dynamic platform uniting ambitious individuals and organizations with global donors. We facilitate effective fundraising with our intuitive, secure platform, turning dreams into reality.', 'The Heartbeat of Crowdfunding', 'FundPulse: The Heartbeat of Crowdfunding', 'FundPulse: The Heartbeat of Crowdfunding', 3, '1', '0', 'admin@fundpulse.com', 'admin@fundpulse.com', 'off', 2048, '', 'paypal@fundpulse.com', 'https://www.twitter.com/', 'https://www.facebook.com/', '', 'https://www.instagram.com/', '', '₹', 'INR', 5, 100, 1000000, 'Paypal', 'true', '800x400', 5, '0', '', '', 10000, '0', '0', '0', '', '', '', '', '', '', 'M d, Y', 'http://localhost/fundpulse/page/privacy-policy', 'http://localhost/fundpulse/page/privacy-policy', 'left', 'off', 'off', 'dot', 'on', '#ee7a1c', '4.1', 'off');

-- --------------------------------------------------------

--
-- Table structure for table `blogs`
--

DROP TABLE IF EXISTS `blogs`;
CREATE TABLE IF NOT EXISTS `blogs` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `tags` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int UNSIGNED NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `blogs_slug_index` (`slug`(191)),
  KEY `blogs_tags_index` (`tags`(191))
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `campaigns`
--

DROP TABLE IF EXISTS `campaigns`;
CREATE TABLE IF NOT EXISTS `campaigns` (
  `id` int NOT NULL AUTO_INCREMENT,
  `small_image` varchar(255) NOT NULL,
  `large_image` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `user_id` int UNSIGNED NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `status` enum('active','pending') NOT NULL DEFAULT 'active',
  `token_id` varchar(255) NOT NULL,
  `goal` int UNSIGNED NOT NULL,
  `location` varchar(200) NOT NULL,
  `finalized` enum('0','1') NOT NULL DEFAULT '0' COMMENT '0 No 1 Yes',
  `categories_id` int UNSIGNED NOT NULL,
  `featured` enum('0','1') NOT NULL DEFAULT '0',
  `deadline` varchar(200) NOT NULL DEFAULT '',
  `video` varchar(200) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `token_id` (`token_id`),
  KEY `author_id` (`user_id`,`status`,`token_id`),
  KEY `image` (`small_image`),
  KEY `goal` (`goal`),
  KEY `categories_id` (`categories_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `campaigns_reported`
--

DROP TABLE IF EXISTS `campaigns_reported`;
CREATE TABLE IF NOT EXISTS `campaigns_reported` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` int UNSIGNED NOT NULL,
  `campaigns_id` int UNSIGNED NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
CREATE TABLE IF NOT EXISTS `categories` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `slug` varchar(200) NOT NULL,
  `mode` enum('on','off') NOT NULL DEFAULT 'on',
  `image` varchar(200) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `slug` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `slug`, `mode`, `image`) VALUES
(1, 'Business', 'Business', 'on', 'Business-vypS4VvzGoonuMFMGdVtFeCdn3JdPTN6.jpg'),
(2, 'Charity', 'Charity', 'on', 'Charity-rJdlNd1LoOxkj4IwYBrUtvsy7rEIOfkT.jpg'),
(3, 'Community', 'Community', 'on', 'Community-qVRF7EraDXfdEmIDzPtZrXRG3zSaCTbE.png'),
(4, 'Competitions', 'Competitions', 'on', ''),
(5, 'Creative', 'Creative', 'on', 'Creative-d1QrtJoHcH8iSF2lV1S1QWM6Mx4nqQRL.jpg'),
(6, 'Events', 'Events', 'on', 'Events-IfUI94HmUaLLx6R90ILBS6NEn8zmhlOr.jpg'),
(7, 'Faith', 'Faith', 'on', ''),
(8, 'Family', 'Family', 'on', ''),
(9, 'Other', 'Other', 'on', ''),
(10, 'Travel', 'Travel', 'on', ''),
(11, 'Wishes', 'Wishes', 'on', ''),
(12, 'Medical', 'Medical', 'on', ''),
(13, 'Emergencies', 'Emergencies', 'on', ''),
(14, 'Education', 'Education', 'on', 'Education-gjBAJK02XVsxiGMDKaoICPo618ioQmTz.jpg'),
(15, 'Memorials', 'Memorials', 'on', ''),
(16, 'Sports', 'Sports', 'on', ''),
(17, 'Animals', 'Animals', 'on', 'Animals-wT4I39Im8p343QvfbS5JBg2ztCzD4gJ8.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `countries`
--

DROP TABLE IF EXISTS `countries`;
CREATE TABLE IF NOT EXISTS `countries` (
  `id` int NOT NULL AUTO_INCREMENT,
  `country_code` varchar(2) NOT NULL DEFAULT '',
  `country_name` varchar(100) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=243 DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `countries`
--

INSERT INTO `countries` (`id`, `country_code`, `country_name`) VALUES
(1, 'US', 'United States'),
(2, 'CA', 'Canada'),
(3, 'AF', 'Afghanistan'),
(4, 'AL', 'Albania'),
(5, 'DZ', 'Algeria'),
(6, 'DS', 'American Samoa'),
(7, 'AD', 'Andorra'),
(8, 'AO', 'Angola'),
(9, 'AI', 'Anguilla'),
(10, 'AQ', 'Antarctica'),
(11, 'AG', 'Antigua and/or Barbuda'),
(12, 'AR', 'Argentina'),
(13, 'AM', 'Armenia'),
(14, 'AW', 'Aruba'),
(15, 'AU', 'Australia'),
(16, 'AT', 'Austria'),
(17, 'AZ', 'Azerbaijan'),
(18, 'BS', 'Bahamas'),
(19, 'BH', 'Bahrain'),
(20, 'BD', 'Bangladesh'),
(21, 'BB', 'Barbados'),
(22, 'BY', 'Belarus'),
(23, 'BE', 'Belgium'),
(24, 'BZ', 'Belize'),
(25, 'BJ', 'Benin'),
(26, 'BM', 'Bermuda'),
(27, 'BT', 'Bhutan'),
(28, 'BO', 'Bolivia'),
(29, 'BA', 'Bosnia and Herzegovina'),
(30, 'BW', 'Botswana'),
(31, 'BV', 'Bouvet Island'),
(32, 'BR', 'Brazil'),
(33, 'IO', 'British lndian Ocean Territory'),
(34, 'BN', 'Brunei Darussalam'),
(35, 'BG', 'Bulgaria'),
(36, 'BF', 'Burkina Faso'),
(37, 'BI', 'Burundi'),
(38, 'KH', 'Cambodia'),
(39, 'CM', 'Cameroon'),
(40, 'CV', 'Cape Verde'),
(41, 'KY', 'Cayman Islands'),
(42, 'CF', 'Central African Republic'),
(43, 'TD', 'Chad'),
(44, 'CL', 'Chile'),
(45, 'CN', 'China'),
(46, 'CX', 'Christmas Island'),
(47, 'CC', 'Cocos (Keeling) Islands'),
(48, 'CO', 'Colombia'),
(49, 'KM', 'Comoros'),
(50, 'CG', 'Congo'),
(51, 'CK', 'Cook Islands'),
(52, 'CR', 'Costa Rica'),
(53, 'HR', 'Croatia (Hrvatska)'),
(54, 'CU', 'Cuba'),
(55, 'CY', 'Cyprus'),
(56, 'CZ', 'Czech Republic'),
(57, 'DK', 'Denmark'),
(58, 'DJ', 'Djibouti'),
(59, 'DM', 'Dominica'),
(60, 'DO', 'Dominican Republic'),
(61, 'TP', 'East Timor'),
(62, 'EC', 'Ecuador'),
(63, 'EG', 'Egypt'),
(64, 'SV', 'El Salvador'),
(65, 'GQ', 'Equatorial Guinea'),
(66, 'ER', 'Eritrea'),
(67, 'EE', 'Estonia'),
(68, 'ET', 'Ethiopia'),
(69, 'FK', 'Falkland Islands (Malvinas)'),
(70, 'FO', 'Faroe Islands'),
(71, 'FJ', 'Fiji'),
(72, 'FI', 'Finland'),
(73, 'FR', 'France'),
(74, 'FX', 'France, Metropolitan'),
(75, 'GF', 'French Guiana'),
(76, 'PF', 'French Polynesia'),
(77, 'TF', 'French Southern Territories'),
(78, 'GA', 'Gabon'),
(79, 'GM', 'Gambia'),
(80, 'GE', 'Georgia'),
(81, 'DE', 'Germany'),
(82, 'GH', 'Ghana'),
(83, 'GI', 'Gibraltar'),
(84, 'GR', 'Greece'),
(85, 'GL', 'Greenland'),
(86, 'GD', 'Grenada'),
(87, 'GP', 'Guadeloupe'),
(88, 'GU', 'Guam'),
(89, 'GT', 'Guatemala'),
(90, 'GN', 'Guinea'),
(91, 'GW', 'Guinea-Bissau'),
(92, 'GY', 'Guyana'),
(93, 'HT', 'Haiti'),
(94, 'HM', 'Heard and Mc Donald Islands'),
(95, 'HN', 'Honduras'),
(96, 'HK', 'Hong Kong'),
(97, 'HU', 'Hungary'),
(98, 'IS', 'Iceland'),
(99, 'IN', 'India'),
(100, 'ID', 'Indonesia'),
(101, 'IR', 'Iran (Islamic Republic of)'),
(102, 'IQ', 'Iraq'),
(103, 'IE', 'Ireland'),
(104, 'IL', 'Israel'),
(105, 'IT', 'Italy'),
(106, 'CI', 'Ivory Coast'),
(107, 'JM', 'Jamaica'),
(108, 'JP', 'Japan'),
(109, 'JO', 'Jordan'),
(110, 'KZ', 'Kazakhstan'),
(111, 'KE', 'Kenya'),
(112, 'KI', 'Kiribati'),
(113, 'KP', 'Korea, Democratic People\'s Republic of'),
(114, 'KR', 'Korea, Republic of'),
(115, 'XK', 'Kosovo'),
(116, 'KW', 'Kuwait'),
(117, 'KG', 'Kyrgyzstan'),
(118, 'LA', 'Lao People\'s Democratic Republic'),
(119, 'LV', 'Latvia'),
(120, 'LB', 'Lebanon'),
(121, 'LS', 'Lesotho'),
(122, 'LR', 'Liberia'),
(123, 'LY', 'Libyan Arab Jamahiriya'),
(124, 'LI', 'Liechtenstein'),
(125, 'LT', 'Lithuania'),
(126, 'LU', 'Luxembourg'),
(127, 'MO', 'Macau'),
(128, 'MK', 'Macedonia'),
(129, 'MG', 'Madagascar'),
(130, 'MW', 'Malawi'),
(131, 'MY', 'Malaysia'),
(132, 'MV', 'Maldives'),
(133, 'ML', 'Mali'),
(134, 'MT', 'Malta'),
(135, 'MH', 'Marshall Islands'),
(136, 'MQ', 'Martinique'),
(137, 'MR', 'Mauritania'),
(138, 'MU', 'Mauritius'),
(139, 'TY', 'Mayotte'),
(140, 'MX', 'Mexico'),
(141, 'FM', 'Micronesia, Federated States of'),
(142, 'MD', 'Moldova, Republic of'),
(143, 'MC', 'Monaco'),
(144, 'MN', 'Mongolia'),
(145, 'ME', 'Montenegro'),
(146, 'MS', 'Montserrat'),
(147, 'MA', 'Morocco'),
(148, 'MZ', 'Mozambique'),
(149, 'MM', 'Myanmar'),
(150, 'NA', 'Namibia'),
(151, 'NR', 'Nauru'),
(152, 'NP', 'Nepal'),
(153, 'NL', 'Netherlands'),
(154, 'AN', 'Netherlands Antilles'),
(155, 'NC', 'New Caledonia'),
(156, 'NZ', 'New Zealand'),
(157, 'NI', 'Nicaragua'),
(158, 'NE', 'Niger'),
(159, 'NG', 'Nigeria'),
(160, 'NU', 'Niue'),
(161, 'NF', 'Norfork Island'),
(162, 'MP', 'Northern Mariana Islands'),
(163, 'NO', 'Norway'),
(164, 'OM', 'Oman'),
(165, 'PK', 'Pakistan'),
(166, 'PW', 'Palau'),
(167, 'PA', 'Panama'),
(168, 'PG', 'Papua New Guinea'),
(169, 'PY', 'Paraguay'),
(170, 'PE', 'Peru'),
(171, 'PH', 'Philippines'),
(172, 'PN', 'Pitcairn'),
(173, 'PL', 'Poland'),
(174, 'PT', 'Portugal'),
(175, 'PR', 'Puerto Rico'),
(176, 'QA', 'Qatar'),
(177, 'RE', 'Reunion'),
(178, 'RO', 'Romania'),
(179, 'RU', 'Russian Federation'),
(180, 'RW', 'Rwanda'),
(181, 'KN', 'Saint Kitts and Nevis'),
(182, 'LC', 'Saint Lucia'),
(183, 'VC', 'Saint Vincent and the Grenadines'),
(184, 'WS', 'Samoa'),
(185, 'SM', 'San Marino'),
(186, 'ST', 'Sao Tome and Principe'),
(187, 'SA', 'Saudi Arabia'),
(188, 'SN', 'Senegal'),
(189, 'RS', 'Serbia'),
(190, 'SC', 'Seychelles'),
(191, 'SL', 'Sierra Leone'),
(192, 'SG', 'Singapore'),
(193, 'SK', 'Slovakia'),
(194, 'SI', 'Slovenia'),
(195, 'SB', 'Solomon Islands'),
(196, 'SO', 'Somalia'),
(197, 'ZA', 'South Africa'),
(198, 'GS', 'South Georgia South Sandwich Islands'),
(199, 'ES', 'Spain'),
(200, 'LK', 'Sri Lanka'),
(201, 'SH', 'St. Helena'),
(202, 'PM', 'St. Pierre and Miquelon'),
(203, 'SD', 'Sudan'),
(204, 'SR', 'Suriname'),
(205, 'SJ', 'Svalbarn and Jan Mayen Islands'),
(206, 'SZ', 'Swaziland'),
(207, 'SE', 'Sweden'),
(208, 'CH', 'Switzerland'),
(209, 'SY', 'Syrian Arab Republic'),
(210, 'TW', 'Taiwan'),
(211, 'TJ', 'Tajikistan'),
(212, 'TZ', 'Tanzania, United Republic of'),
(213, 'TH', 'Thailand'),
(214, 'TG', 'Togo'),
(215, 'TK', 'Tokelau'),
(216, 'TO', 'Tonga'),
(217, 'TT', 'Trinidad and Tobago'),
(218, 'TN', 'Tunisia'),
(219, 'TR', 'Turkey'),
(220, 'TM', 'Turkmenistan'),
(221, 'TC', 'Turks and Caicos Islands'),
(222, 'TV', 'Tuvalu'),
(223, 'UG', 'Uganda'),
(224, 'UA', 'Ukraine'),
(225, 'AE', 'United Arab Emirates'),
(226, 'GB', 'United Kingdom'),
(227, 'UM', 'United States minor outlying islands'),
(228, 'UY', 'Uruguay'),
(229, 'UZ', 'Uzbekistan'),
(230, 'VU', 'Vanuatu'),
(231, 'VA', 'Vatican City State'),
(232, 'VE', 'Venezuela'),
(233, 'VN', 'Vietnam'),
(234, 'VG', 'Virgin Islands (British)'),
(235, 'VI', 'Virgin Islands (U.S.)'),
(236, 'WF', 'Wallis and Futuna Islands'),
(237, 'EH', 'Western Sahara'),
(238, 'YE', 'Yemen'),
(239, 'YU', 'Yugoslavia'),
(240, 'ZR', 'Zaire'),
(241, 'ZM', 'Zambia'),
(242, 'ZW', 'Zimbabwe');

-- --------------------------------------------------------

--
-- Table structure for table `donations`
--

DROP TABLE IF EXISTS `donations`;
CREATE TABLE IF NOT EXISTS `donations` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `campaigns_id` int UNSIGNED NOT NULL,
  `txn_id` varchar(255) NOT NULL,
  `fullname` varchar(200) NOT NULL,
  `email` varchar(200) NOT NULL,
  `country` varchar(100) NOT NULL,
  `postal_code` varchar(100) NOT NULL,
  `donation` int UNSIGNED NOT NULL,
  `payment_gateway` varchar(100) NOT NULL,
  `oauth_uid` varchar(200) NOT NULL,
  `comment` varchar(200) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `anonymous` enum('0','1') NOT NULL DEFAULT '0' COMMENT '0 No, 1 Yes',
  `rewards_id` int UNSIGNED NOT NULL,
  `bank_swift_code` varchar(250) NOT NULL,
  `account_number` varchar(250) NOT NULL,
  `branch_name` varchar(250) NOT NULL,
  `branch_address` varchar(250) NOT NULL,
  `account_name` varchar(250) NOT NULL,
  `iban` varchar(250) NOT NULL,
  `approved` enum('0','1') NOT NULL DEFAULT '1',
  `bank_transfer` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `campaigns_id` (`campaigns_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `gallery`
--

DROP TABLE IF EXISTS `gallery`;
CREATE TABLE IF NOT EXISTS `gallery` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `image` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `likes`
--

DROP TABLE IF EXISTS `likes`;
CREATE TABLE IF NOT EXISTS `likes` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` int UNSIGNED NOT NULL,
  `campaigns_id` int UNSIGNED NOT NULL,
  `status` enum('0','1') COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '1',
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
CREATE TABLE IF NOT EXISTS `migrations` (
  `migration` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `batch` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pages`
--

DROP TABLE IF EXISTS `pages`;
CREATE TABLE IF NOT EXISTS `pages` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` varchar(150) NOT NULL,
  `content` text NOT NULL,
  `slug` varchar(100) NOT NULL,
  `show_navbar` enum('0','1') NOT NULL DEFAULT '0' COMMENT '0 No, 1 Yes',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `pages`
--

INSERT INTO `pages` (`id`, `title`, `content`, `slug`, `show_navbar`) VALUES
(5, 'About us', '<p><strong>ABOUT FUND PULSE</strong></p>\r\n\r\n<p>FundPulse is a pioneering platform in the crowdfunding landscape, committed to connecting dreams with resources. We stand as a robust bridge between innovative ideas and the funding they need to flourish. Our platform enables individuals, organizations, and businesses to fundraise effectively for their projects, causes, or ambitions.</p>\r\n\r\n<p>At FundPulse, we believe that great ideas should never be hindered by a lack of funding. Our mission is to democratize fundraising, making it accessible to anyone, anywhere. With our easy-to-use interface, comprehensive features, and secure transaction system, we provide our users with the tools they need to turn their dreams into reality.</p>\r\n\r\n<p>Our team is composed of dedicated professionals passionate about innovation and community growth. We are driven by the success stories that our platform helps create, and we are always striving to improve and expand our services to better serve our users.</p>\r\n\r\n<p>Join us at FundPulse, where your passion meets our platform, and together, we bring dreams to life.</p>', 'about', '1'),
(7, 'Support', '<p><strong>FUND PULSE SUPPORT</strong></p>\r\n\r\n<p>At FundPulse, your experience on our platform is our top priority. We understand that you might encounter issues or have questions while using our services. That&#39;s why our dedicated support team is here to provide the assistance you need.</p>\r\n\r\n<p><strong>CONTACT US</strong></p>\r\n\r\n<p>If you&#39;re facing any difficulties or need help with our platform, our customer support team is ready to assist you. Here&#39;s how you can reach us:</p>\r\n\r\n<p><strong>Email:</strong> For any queries or concerns, feel free to email us at noreplay@squbegroups.com We strive to respond to all inquiries within 24 hours.</p>', 'support', '0'),
(9, 'privacy-policy', '<p><strong>PRIVACY POLICY</strong></p>\r\n\r\n<p>Last Updated: Today</p>\r\n\r\n<p>This Privacy Policy describes how FundPulse (&quot;we,&quot; &quot;us,&quot; or &quot;our&quot;) collects, uses, and discloses your personal information in connection with the use of our services (&quot;Services&quot;).</p>\r\n\r\n<ol>\r\n	<li><strong>INFORMATION WE COLLECT</strong></li>\r\n</ol>\r\n\r\n<p>We collect personal information that you voluntarily provide to us when you register on our platform, express an interest in obtaining information about us or our products and Services, or otherwise contact us.</p>\r\n\r\n<ol>\r\n	<li><strong>HOW WE USE YOUR INFORMATION</strong></li>\r\n</ol>\r\n\r\n<p>We use personal information for a variety of business purposes, including to provide the Services, personalize your experience, and communicate with you about promotions and other relevant information.</p>\r\n\r\n<ol>\r\n	<li><strong>SHARING YOUR INFORMATION</strong></li>\r\n</ol>\r\n\r\n<p>We may share your information with third parties in certain circumstances, including when complying with legal process, preventing fraud or imminent harm, and ensuring the security of our network and services.</p>\r\n\r\n<ol>\r\n	<li><strong>YOUR RIGHTS</strong></li>\r\n</ol>\r\n\r\n<p>Depending on your location, you may have certain rights under local laws regarding your personal information, such as the right to review, correct, and delete your personal information.</p>\r\n\r\n<ol>\r\n	<li><strong>CHANGES TO THIS POLICY</strong></li>\r\n</ol>\r\n\r\n<p>We may update this Privacy Policy to reflect changes to our practices. We encourage you to review this page periodically.</p>\r\n\r\n<ol>\r\n	<li><strong>CONTACT US</strong></li>\r\n</ol>\r\n\r\n<p>If you have any questions about this Privacy Policy, please contact us at admin@squbegroups.com.</p>', 'privacy-policy', '0');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
CREATE TABLE IF NOT EXISTS `password_resets` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `token` varchar(150) NOT NULL,
  `email` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `id_hash` (`token`),
  KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `payment_gateways`
--

DROP TABLE IF EXISTS `payment_gateways`;
CREATE TABLE IF NOT EXISTS `payment_gateways` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `enabled` enum('1','0') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1',
  `sandbox` enum('true','false') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'true',
  `fee` decimal(3,1) NOT NULL,
  `fee_cents` decimal(2,2) NOT NULL,
  `email` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `key_secret` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `bank_info` text COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `payment_gateways`
--

INSERT INTO `payment_gateways` (`id`, `name`, `type`, `enabled`, `sandbox`, `fee`, `fee_cents`, `email`, `token`, `key`, `key_secret`, `bank_info`) VALUES
(1, 'PayPal', 'normal', '0', 'false', '5.4', '0.30', 'admin@squbegroups.com', '12bGGfD9bHevK3eJN06CdDvFSTXsTrTG44yGdAONeN1R37jqnLY1PuNF0mJRoFnsEygyf28yePSCA1eR0alQk4BX89kGG9Rlha2D2KX55TpDFNR5o774OshrkHSZLOFo2fAhHzcWKnwsYDFKgwuaRg', '', '', ''),
(2, 'Stripe', 'card', '0', 'true', '2.9', '0.30', '', 'asfQSGRvYzS1P0X745krAAyHeU7ZbTpHbYKnxI2abQsBUi48EpeAu5lFAU2iBmsUWO5tpgAn9zzussI4Cce5ZcANIAmfBz0bNR9g3UfR4cserhkJwZwPsETiXiZuCixXVDHhCItuXTPXXSA6KITEoT', 'pk_test_51BTUDGJAJfZb9HEBwDg86TN1KNprHjkfipXmEDMb0gSCassK5T3ZfxsAbcgKVmAIXF7oZ6ItlZZbXO6idTHE67IM007EwQ4uN3', 'sk_test_tR3PYbcVNZZ796tH88S4VQ2u', ''),
(3, 'Bank Transfer', 'bank', '1', 'true', '0.0', '0.00', '', 'zzzdH5811lZSjioHrg3zLD69DAAMvPLiwdzTouAdc7HbtaqgujPEZjH3i7RGeRtFKrY2baT7rXd6CaBtsRpo4XtgHvqCyCWiW5BlCrg1uSMCOSdi1tzPjCPx8px280YEyLvNtiRzWHJJk8WRegfTms', '', '', 'abc bank');

-- --------------------------------------------------------

--
-- Table structure for table `reserved`
--

DROP TABLE IF EXISTS `reserved`;
CREATE TABLE IF NOT EXISTS `reserved` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `reserved`
--

INSERT INTO `reserved` (`id`, `name`) VALUES
(14, 'account'),
(31, 'api'),
(2, 'app'),
(46, 'blog'),
(30, 'bootstrap'),
(37, 'campaigns'),
(34, 'categories'),
(36, 'collections'),
(29, 'comment'),
(42, 'config'),
(25, 'contact'),
(41, 'database'),
(35, 'featured'),
(32, 'freebies'),
(45, 'gallery'),
(9, 'goods'),
(1, 'gostock1'),
(11, 'jobs'),
(21, 'join'),
(16, 'latest'),
(20, 'login'),
(33, 'logout'),
(27, 'members'),
(13, 'messages'),
(19, 'notifications'),
(15, 'popular'),
(6, 'porn'),
(26, 'programs'),
(12, 'projects'),
(3, 'public'),
(23, 'register'),
(40, 'resources'),
(39, 'routes'),
(17, 'search'),
(7, 'sex'),
(44, 'storage'),
(8, 'tags'),
(38, 'tests'),
(24, 'upgrade'),
(28, 'upload'),
(4, 'vendor'),
(5, 'xxx');

-- --------------------------------------------------------

--
-- Table structure for table `rewards`
--

DROP TABLE IF EXISTS `rewards`;
CREATE TABLE IF NOT EXISTS `rewards` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `campaigns_id` int UNSIGNED NOT NULL,
  `title` varchar(250) COLLATE utf8mb3_unicode_ci NOT NULL,
  `amount` int UNSIGNED NOT NULL,
  `description` text COLLATE utf8mb3_unicode_ci NOT NULL,
  `quantity` int UNSIGNED NOT NULL,
  `delivery` varchar(200) COLLATE utf8mb3_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `updates`
--

DROP TABLE IF EXISTS `updates`;
CREATE TABLE IF NOT EXISTS `updates` (
  `id` int NOT NULL AUTO_INCREMENT,
  `image` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `campaigns_id` int UNSIGNED NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `token_id` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `token_id` (`token_id`),
  KEY `author_id` (`token_id`),
  KEY `image` (`image`),
  KEY `category_id` (`campaigns_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `countries_id` char(25) NOT NULL,
  `password` char(60) NOT NULL,
  `email` varchar(255) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `avatar` varchar(70) NOT NULL,
  `status` enum('pending','active','suspended','delete') NOT NULL DEFAULT 'active',
  `role` enum('normal','admin') NOT NULL DEFAULT 'normal',
  `remember_token` varchar(100) NOT NULL,
  `token` varchar(80) NOT NULL,
  `confirmation_code` varchar(125) NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `paypal_account` varchar(200) NOT NULL,
  `payment_gateway` varchar(50) NOT NULL,
  `bank` text NOT NULL,
  `oauth_uid` varchar(200) NOT NULL,
  `oauth_provider` varchar(200) NOT NULL,
  `username` varchar(50) NOT NULL,
  `phone` int UNSIGNED NOT NULL,
  `street` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`),
  KEY `username` (`status`),
  KEY `role` (`role`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `countries_id`, `password`, `email`, `date`, `avatar`, `status`, `role`, `remember_token`, `token`, `confirmation_code`, `updated_at`, `created_at`, `paypal_account`, `payment_gateway`, `bank`, `oauth_uid`, `oauth_provider`, `username`, `phone`, `street`) VALUES
(1, 'admin', '99', '$2y$10$XzUZMAN.KUwPkpg0xSIDi.GOvyF1JDeciikz.lZJvwgMVzQqKP6uu', 'admin@fundpulse.com', '2021-01-08 11:04:42', '11684823845uxvcm6u7z8iyh1w.jpg', 'active', 'admin', 'vER2ZJTd67lkGxBWIOLPtuq3dTiYc1JmDvqWHN2CucD8JP3ZnSY27DluIYxW', 'Wy4VkAl2dxHb9WHoXjTowSGPXFPnEQHca6RBe2yeqqmRafs0hSbCEobhNkZZAbCDIru60ceLzAAOI3fj', '', '2023-05-23 10:37:25', '2016-09-09 15:34:42', '', '', '', '', '', '', 0, ''),
(11, 'Kkk', '99', '$2y$10$FZoOnfeLCSHu43Nmnbems.FyOb9is60N1HUTWxXFPuoZtVBzHt1Ii', 'kbsubrhamanyasharma9632@gmail.com', '2023-06-02 09:22:28', 'default.jpg', 'active', 'normal', '', 'rvGqWtWJDeeM15z7f2cSxJ27qUwIr2FUgw4bNvUXcXrWDqe0ZERkY4Y7xcDeOgTMQHg5ZPTmSax', '', '2023-06-04 09:22:44', '2023-06-02 03:52:28', '', 'Bank', 'djfukljkjbjkfhsfhhidhvhihhhshhfdhovdohihio', '', '', '', 0, '');

-- --------------------------------------------------------

--
-- Table structure for table `withdrawals`
--

DROP TABLE IF EXISTS `withdrawals`;
CREATE TABLE IF NOT EXISTS `withdrawals` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `campaigns_id` int UNSIGNED NOT NULL,
  `status` enum('pending','paid') NOT NULL DEFAULT 'pending',
  `amount` varchar(50) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `gateway` varchar(100) NOT NULL,
  `account` text NOT NULL,
  `date_paid` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `txn_id` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `campaings_id` (`campaigns_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
