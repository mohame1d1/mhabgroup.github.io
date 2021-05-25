-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- HÃ´te : 127.0.0.1:3306
-- GÃ©nÃ©rÃ© le :  mar. 09 juil. 2019 Ã 11:45
-- Version du serveur :  10.2.23-MariaDB
-- Version de PHP :  7.2.17

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de donnÃ©es :  `data`
--

-- --------------------------------------------------------

--
-- Structure de la table `mf_ads`
--

CREATE TABLE `mf_ads` (
  `id` int(10) NOT NULL,
  `name` varchar(150) COLLATE utf8_unicode_ci DEFAULT 'N/A',
  `size` enum('N/A','728x90','468x60','300x250','336x280','120x600','160x600') COLLATE utf8_unicode_ci DEFAULT NULL,
  `type` enum('banner','adcode') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'banner',
  `code` varchar(2000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` enum('1','2') COLLATE utf8_unicode_ci NOT NULL DEFAULT '1',
  `created` varchar(300) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- DÃ©chargement des donnÃ©es de la table `mf_ads`
--

INSERT INTO `mf_ads` (`id`, `name`, `size`, `type`, `code`, `status`, `created`) VALUES
(1, '728x90', '728x90', 'banner', 'PGltZyBzcmM9Imh0dHBzOi8vdmlhLnBsYWNlaG9sZGVyLmNvbS83Mjh4OTAiIGFsdD0iUGxhY2Vob2xkZXIgSW1hZ2UiPg==', '1', '08 Apr 2019'),
(2, '160x600', '160x600', 'banner', 'PGltZyBzcmM9Imh0dHBzOi8vdmlhLnBsYWNlaG9sZGVyLmNvbS8xNjB4NjAwIiBhbHQ9IlBsYWNlaG9sZGVyIEltYWdlIj4=', '1', '08 Apr 2019'),
(3, '468x60', '468x60', 'banner', 'PGltZyBzcmM9Imh0dHBzOi8vdmlhLnBsYWNlaG9sZGVyLmNvbS80Njh4NjAiIGFsdD0iUGxhY2Vob2xkZXIgSW1hZ2UiPg==', '1', '30 Apr 2019'),
(4, '300x250', '300x250', 'banner', 'PGltZyBzcmM9Imh0dHBzOi8vdmlhLnBsYWNlaG9sZGVyLmNvbS8zMDB4MjUwIiBhbHQ9IlBsYWNlaG9sZGVyIEltYWdlIj4=', '1', '30 Apr 2019');

-- --------------------------------------------------------

--
-- Structure de la table `mf_announcements`
--

CREATE TABLE `mf_announcements` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `content` text CHARACTER SET utf8 DEFAULT NULL,
  `status` enum('1','2') COLLATE utf8_persian_ci NOT NULL DEFAULT '1',
  `created` varchar(20) CHARACTER SET utf8 DEFAULT NULL,
  `ago` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_persian_ci;

-- --------------------------------------------------------

--
-- Structure de la table `mf_banlist`
--

CREATE TABLE `mf_banlist` (
  `id` int(10) NOT NULL,
  `ip_address` varchar(300) COLLATE utf8_unicode_ci DEFAULT NULL,
  `reason` varchar(300) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` enum('1','2') COLLATE utf8_unicode_ci NOT NULL DEFAULT '2',
  `created` varchar(300) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `mf_claims`
--

CREATE TABLE `mf_claims` (
  `id` int(10) NOT NULL,
  `user_id` int(10) NOT NULL DEFAULT 0,
  `verify_key` varchar(300) COLLATE utf8_unicode_ci DEFAULT NULL,
  `details` varchar(1500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `type` enum('faucet','shortlink','ptc','qa') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'faucet',
  `amount` varchar(300) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` enum('1','2') COLLATE utf8_unicode_ci NOT NULL DEFAULT '1',
  `created` varchar(300) COLLATE utf8_unicode_ci DEFAULT NULL,
  `time` varchar(300) COLLATE utf8_unicode_ci DEFAULT '00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `mf_config`
--

CREATE TABLE `mf_config` (
  `config_id` int(11) NOT NULL,
  `header` varchar(300) CHARACTER SET utf8 DEFAULT NULL,
  `value` text CHARACTER SET utf8 DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_persian_ci;

--
-- DÃ©chargement des donnÃ©es de la table `mf_config`
--

INSERT INTO `mf_config` (`config_id`, `header`, `value`) VALUES
(1, 'name', 'MidFaucet'),
(2, 'user_note', 'Claim from auto faucets, do shortlinks, qa, or ptc to earn cryptocurrency!'),
(3, 'min_withdraw', '0.00000100'),
(4, 'ref_percent', '20'),
(5, 'reCAPTCHA_site_key', '6Ld34asUAAAAAKlV4VRybLtJ5CSJJK9VQgMIJAdQ'),
(6, 'reCAPTCHA_secret_key', '6Ld34asUAAAAADkAfynszphMJGG7BJfYA3-kQkAV'),
(7, 'form_withdraw', 'fhb'),
(8, 'icon_url', 'https://codsem.com/midfaucet/template/uploads/images/favicon.png'),
(9, 'site_description', NULL),
(10, 'site_title', 'Crypto Earning PHP Script'),
(11, 'fhb_api', ''),
(12, 'language', 'en_US'),
(13, 'support_email', 'support@domain.com'),
(14, 'head_code', NULL),
(15, 'footer_code', ''),
(16, 'withdraw_fee', '0.00000005'),
(17, 'currency', 'BTC'),
(18, 'fb_link', 'https://www.facebook.com/'),
(19, 'go_link', 'https://plus.google.com/'),
(20, 'tweet_link', 'https://twitter.com/'),
(21, 'pin_link', ''),
(22, 'logo_url', 'http://pro1d2.esy.es/faucet/template/uploads/images/logo2.png'),
(23, 'logo_url_home', 'http://pro1d2.esy.es/faucet/template/uploads/images/logo.png'),
(24, 'account_activate_email', '2'),
(25, 'body_code', NULL),
(26, 'captcha_type', 'recaptcha'),
(27, 'captcha_signup', '2'),
(28, 'captcha_login', '2'),
(29, 'captcha_forgot', '2'),
(30, 'keywords', NULL),
(31, 'enable_home_testimonial', '1'),
(32, 'fc_earn', '0.00000010'),
(33, 'st_earn', '0.00000020'),
(34, 'ptc_earn', '0.00000007'),
(35, 'qa_earn', '0.00000010'),
(36, 'fc_timer', '5m'),
(37, 'ptc_min', '100'),
(38, 'ptc_price', '0.00000014'),
(39, 'enable_announcements', '1'),
(40, 'enable_ptc', '1'),
(41, 'enable_qa', '1'),
(42, 'enable_faucet', '1'),
(43, 'enable_shortlink', '1'),
(44, 'short_note', 'Solve these shortlinks and get 50 claims for every shortlinks passed. You can do more then one shortlinks at once.'),
(45, 'faucet_note', 'Get free auto claim at regular intervals without shortlinks!'),
(46, 'ptc_note', 'Complete these PTC links and get 50 claims for every PTC passed.'),
(47, 'qa_note', 'Answer questions correctly and get 50 claims for every questions answered.'),
(48, 'mailer_option', 'php_mail'),
(49, 'mailer_username', NULL),
(50, 'mailer_host', NULL),
(51, 'mailer_port', NULL),
(52, 'mailer_use', 'tls'),
(53, 'mailer_pass', NULL),
(54, 'countries', 'United States, United Kingdom, Germany, France, Italy, Turkey, India, Brazil, Spain, Canada, Australia, Netherlands, Andorra, United Arab Emirates, Afghanistan, Antigua and Barbuda, Albania, Algeria, Armenia, Angola, Argentina, Austria, Aruba, Azerbaijan, Bosnia and Herzegovina, Barbados, Bangladesh, Belgium, Burkina Faso, Bulgaria, Bahrain, Burundi, Benin, Brunei, Bolivia, Bahamas, Bhutan, Botswana, Belarus, Belize, Democratic Republic of the Congo, Central African Republic, Congo, Switzerland, Ivory Coast, Chile, Cameroon, China, Colombia, Costa Rica, Cuba, Cape Verde, Cyprus, Czech Republic, Djibouti, Denmark, Dominica, Dominican Republic, Ecuador, Estonia, Egypt, Western Sahara, Eritrea, Ethiopia, Finland, Fiji, Micronesia<, Gabon, Grenada, Georgia, Ghana, Gibraltar, Greenland, Gambia, Guinea, Guadeloupe, Equatorial Guinea, Greece, Guatemala, Guinea Bissau, Guyana, Hong Kong, Honduras, Croatia, Haiti, Hungary, Indonesia, Ireland, Israel, Isle of Man, Iraq, Iran, Iceland, Jamaica, Jordan, Japan, Kenya, Kyrgyzstan, Cambodia, Kiribati, Comoros, Saint Kitts and Nevis, North Korea, South Korea, Kuwait, Kazakhstan, Laos, Lebanon<, Saint Lucia, Liechtenstein, Sri Lanka, Liberia, Lesotho, Lithuania, Luxembourg, Latvia, Libya, Morocco, Monaco, Moldova, Montenegro, Madagascar, Macedonia, Mali, Myanmar, Mongolia, Martinique, Mauritania, Malta, Mauritius, Maldives, Malawi, Mexico, Malaysia, Mozambique, Namibia, Niger, Nigeria, Nicaragua, Norway, Nepal, New Zealand, Oman, Panama, Peru, French Polynesia, Papua New Guinea, Philippines<, Pakistan, Poland, Puerto Rico, Palestine, Portugal, Palau, Paraguay, Qatar, Romania, Serbia, Russia, Rwanda, Saudi Arabia, Solomon Islands, Seychelles, Sudan, Sweden, Singapore, Slovenia, Slovakia, Sierra Leone, San Marino, Senegal, Somalia, Suriname, Sao Tome and Principe, El Salvador, Syria<, Swaziland, Chad, Togo, Thailand, Tajikistan, Turkmenistan, Tunisia, Tonga<, East Timor, Trinidad and Tobago, Tuvalu, Taiwan, Tanzania, Ukraine, Uganda, Scotland, Uruguay, Uzbekistan, Saint Vincent and the Grenadines, Venezuela, Virgin Islands, Vietnam, Vanuatu, Samoa, Yemen, South Africa, Zambia, Zimbabwe		'),
(55, 'fc_points', '1'),
(56, 'st_points', '1'),
(57, 'ptc_points', '1'),
(58, 'qa_points', '1'),
(59, 'min_deposit', '0.00005000'),
(60, 'min_points', '20000'),
(61, 'enable_proxy', '2'),
(62, 'deposit_processor', 'coinbase');

-- --------------------------------------------------------

--
-- Structure de la table `mf_currencies`
--

CREATE TABLE `mf_currencies` (
  `id` int(10) NOT NULL,
  `name` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `symbol` varchar(150) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` enum('1','2') COLLATE utf8_unicode_ci NOT NULL DEFAULT '1',
  `created` varchar(300) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- DÃ©chargement des donnÃ©es de la table `mf_currencies`
--

INSERT INTO `mf_currencies` (`id`, `name`, `symbol`, `status`, `created`) VALUES
(1, 'Bitcoin', 'BTC', '1', '05 May 2019'),
(2, 'Litecoin', 'LTC', '1', '05 May 2019'),
(3, 'Ethereum', 'ETH', '1', '05 May 2019'),
(4, 'Monero', 'XMR', '1', '05 May 2019'),
(5, 'Dogecoin', 'DOGE', '1', '05 May 2019'),
(6, 'Bitcoin Cash', 'BCH', '1', '05 May 2019'),
(7, 'ZCash', 'ZEC', '1', '05 May 2019'),
(8, 'DigiByte', 'DGB', '1', '05 May 2019'),
(9, 'BitCore', 'BTX', '1', '05 May 2019'),
(10, 'Blackcoin', 'BLC ', '1', '05 May 2019'),
(11, 'Dash', 'DASH', '1', '05 May 2019'),
(12, 'Peercoin', 'PPC', '1', '05 May 2019'),
(13, 'Primecoin', 'XPM', '1', '05 May 2019'),
(14, 'Potcoin', 'POT', '1', '05 May 2019');

-- --------------------------------------------------------

--
-- Structure de la table `mf_dmethods`
--

CREATE TABLE `mf_dmethods` (
  `id` int(10) NOT NULL,
  `methods` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `account` varchar(300) CHARACTER SET utf8 DEFAULT NULL,
  `currencies` varchar(1000) DEFAULT NULL,
  `public_key` varchar(300) CHARACTER SET utf8 DEFAULT NULL,
  `secret_key` varchar(300) CHARACTER SET utf8 DEFAULT NULL,
  `ipn` varchar(300) CHARACTER SET utf8 DEFAULT NULL,
  `status` varchar(10) CHARACTER SET utf8 DEFAULT NULL COMMENT '1=active, 2=inactive',
  `created` varchar(20) CHARACTER SET utf8 DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- DÃ©chargement des donnÃ©es de la table `mf_dmethods`
--

INSERT INTO `mf_dmethods` (`id`, `methods`, `account`, `currencies`, `public_key`, `secret_key`, `ipn`, `status`, `created`) VALUES
(1, 'coinpayments', '', 'BTC', '', '', '', '2', ''),
(2, 'coinbase', '', 'BTC', '', '', '', '1', '');

-- --------------------------------------------------------

--
-- Structure de la table `mf_invoice`
--

CREATE TABLE `mf_invoice` (
  `id` int(10) NOT NULL,
  `user_id` int(10) NOT NULL DEFAULT 0,
  `amount` decimal(20,8) NOT NULL DEFAULT 0.00000000,
  `method` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `address` varchar(600) DEFAULT NULL,
  `qrcode` varchar(600) DEFAULT NULL,
  `status_text` varchar(300) NOT NULL DEFAULT 'Waiting...',
  `confirm_needed` int(10) NOT NULL DEFAULT 2,
  `total` decimal(20,8) NOT NULL DEFAULT 0.00000000,
  `status` enum('1','2') CHARACTER SET utf8 NOT NULL DEFAULT '2' COMMENT '1=paid,2=unpaid',
  `created` varchar(20) CHARACTER SET utf8 DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `mf_members`
--

CREATE TABLE `mf_members` (
  `id` int(10) UNSIGNED NOT NULL,
  `role` enum('user','admin') CHARACTER SET utf8 DEFAULT 'user',
  `status` enum('1','2','3') CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '1' COMMENT '1=active, 2=inactive, 3=pending',
  `username` varchar(200) COLLATE utf8_persian_ci DEFAULT NULL,
  `password` varchar(200) COLLATE utf8_persian_ci DEFAULT NULL,
  `email` varchar(300) COLLATE utf8_persian_ci DEFAULT NULL,
  `parent_id` int(11) UNSIGNED DEFAULT NULL,
  `balance` decimal(20,8) NOT NULL DEFAULT 0.00000000,
  `referral_earnings` decimal(20,8) NOT NULL DEFAULT 0.00000000,
  `advertising_balance` decimal(20,8) NOT NULL DEFAULT 0.00000000,
  `purchased` int(10) NOT NULL DEFAULT 0,
  `spent` decimal(20,8) NOT NULL DEFAULT 0.00000000,
  `points` int(10) NOT NULL DEFAULT 0,
  `converted_points` decimal(20,8) NOT NULL DEFAULT 0.00000000,
  `withdraw_address` varchar(300) COLLATE utf8_persian_ci DEFAULT NULL,
  `country` varchar(100) COLLATE utf8_persian_ci DEFAULT NULL,
  `recover` varchar(250) COLLATE utf8_persian_ci DEFAULT NULL,
  `login_ip` varchar(500) COLLATE utf8_persian_ci DEFAULT NULL,
  `register_ip` varchar(500) COLLATE utf8_persian_ci DEFAULT NULL,
  `created` varchar(50) COLLATE utf8_persian_ci DEFAULT NULL,
  `token` varchar(50) COLLATE utf8_persian_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_persian_ci;

-- --------------------------------------------------------

--
-- Structure de la table `mf_notifications`
--

CREATE TABLE `mf_notifications` (
  `id` int(10) NOT NULL,
  `user_id` int(10) NOT NULL DEFAULT 0,
  `title` varchar(300) COLLATE utf8_unicode_ci DEFAULT NULL,
  `type` enum('withdraw','support','referral','order') COLLATE utf8_unicode_ci DEFAULT NULL,
  `details` varchar(1200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` enum('1','2') COLLATE utf8_unicode_ci NOT NULL DEFAULT '1',
  `isread` enum('1','2') COLLATE utf8_unicode_ci NOT NULL DEFAULT '2',
  `created` varchar(300) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ago` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `mf_offers`
--

CREATE TABLE `mf_offers` (
  `id` int(10) NOT NULL,
  `user_id` int(10) NOT NULL DEFAULT 0,
  `name` varchar(300) COLLATE utf8_unicode_ci DEFAULT NULL,
  `category` varchar(300) COLLATE utf8_unicode_ci DEFAULT NULL,
  `timer` int(11) NOT NULL DEFAULT 5 COMMENT 'secondes',
  `details` varchar(1500) COLLATE utf8_unicode_ci NOT NULL,
  `type` varchar(300) COLLATE utf8_unicode_ci DEFAULT 'ptc',
  `url` varchar(300) COLLATE utf8_unicode_ci DEFAULT NULL,
  `method` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'BTC',
  `amount` decimal(20,8) NOT NULL DEFAULT 0.00000000,
  `amount_paid` decimal(20,8) NOT NULL DEFAULT 0.00000000,
  `clicks` int(11) NOT NULL DEFAULT 0,
  `current_clicks` int(10) NOT NULL DEFAULT 0,
  `status` enum('1','2','3') COLLATE utf8_unicode_ci NOT NULL DEFAULT '1',
  `created` varchar(300) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `mf_pages`
--

CREATE TABLE `mf_pages` (
  `id` int(10) NOT NULL,
  `title` varchar(300) COLLATE utf8_unicode_ci DEFAULT NULL,
  `content` mediumtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `short` varchar(300) COLLATE utf8_unicode_ci DEFAULT NULL,
  `protect` enum('1','2') COLLATE utf8_unicode_ci NOT NULL DEFAULT '2',
  `status` enum('1','2') COLLATE utf8_unicode_ci NOT NULL DEFAULT '1',
  `created` varchar(150) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- DÃ©chargement des donnÃ©es de la table `mf_pages`
--

INSERT INTO `mf_pages` (`id`, `title`, `content`, `short`, `protect`, `status`, `created`) VALUES
(1, 'Terms & Conditions', 'Terms & Conditions', NULL, '1', '1', '08 Apr 2019'),
(2, 'Privacy Policy\r\n', 'Privacy Policy', NULL, '1', '1', '08 Apr 2019');

-- --------------------------------------------------------

--
-- Structure de la table `mf_payments`
--

CREATE TABLE `mf_payments` (
  `id` int(10) NOT NULL,
  `user_id` int(10) NOT NULL DEFAULT 0,
  `txn_id` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `item_number` varchar(50) CHARACTER SET utf8 NOT NULL DEFAULT '0',
  `payment_gross` decimal(20,2) DEFAULT 0.00,
  `crypto_am` decimal(20,8) DEFAULT NULL,
  `currency_code` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `type` varchar(20) CHARACTER SET utf8 DEFAULT NULL,
  `payment_status` varchar(30) CHARACTER SET utf8 DEFAULT NULL,
  `created` varchar(20) CHARACTER SET utf8 DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `mf_shortlinks`
--

CREATE TABLE `mf_shortlinks` (
  `id` int(10) NOT NULL,
  `name` varchar(300) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `type` varchar(300) COLLATE utf8_unicode_ci DEFAULT 'adlinkfly',
  `api` varchar(300) COLLATE utf8_unicode_ci DEFAULT NULL,
  `url` varchar(300) COLLATE utf8_unicode_ci DEFAULT NULL,
  `credit` decimal(20,8) NOT NULL DEFAULT 0.00000000,
  `position` int(10) NOT NULL DEFAULT 0,
  `count_ip` int(10) NOT NULL DEFAULT 1,
  `status` enum('1','2') COLLATE utf8_unicode_ci NOT NULL DEFAULT '1',
  `created` varchar(300) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `mf_testimonials`
--

CREATE TABLE `mf_testimonials` (
  `id` int(10) NOT NULL,
  `name` varchar(250) DEFAULT NULL,
  `job` varchar(250) DEFAULT NULL,
  `content` varchar(1500) DEFAULT NULL,
  `image` varchar(250) DEFAULT NULL,
  `status` enum('1','2') DEFAULT '1',
  `created` varchar(150) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `mf_themes`
--

CREATE TABLE `mf_themes` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `version` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `status` enum('1','2') CHARACTER SET utf8 NOT NULL DEFAULT '2' COMMENT '1=active,2=inactive',
  `created` varchar(50) CHARACTER SET utf8 DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- DÃ©chargement des donnÃ©es de la table `mf_themes`
--

INSERT INTO `mf_themes` (`id`, `name`, `version`, `status`, `created`) VALUES
(1, 'main', '1.0.0', '1', '21/04/18 , 09:20 AM');

-- --------------------------------------------------------

--
-- Structure de la table `mf_withdraws`
--

CREATE TABLE `mf_withdraws` (
  `id` int(10) NOT NULL,
  `user_id` int(10) NOT NULL DEFAULT 0,
  `method` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `processor` varchar(300) COLLATE utf8_unicode_ci DEFAULT 'External',
  `address` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `fee` decimal(20,8) NOT NULL DEFAULT 0.00000000,
  `amount` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `claims` int(10) NOT NULL DEFAULT 0,
  `earning` decimal(20,8) NOT NULL DEFAULT 0.00000000,
  `status` enum('1','2','3','4') COLLATE utf8_unicode_ci NOT NULL DEFAULT '1',
  `created` varchar(300) COLLATE utf8_unicode_ci NOT NULL,
  `time` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
--
-- Index pour les tables déchargées
--

--
-- Index pour la table `mf_ads`
--
ALTER TABLE `mf_ads`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `mf_announcements`
--
ALTER TABLE `mf_announcements`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `mf_banlist`
--
ALTER TABLE `mf_banlist`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `mf_claims`
--
ALTER TABLE `mf_claims`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `mf_config`
--
ALTER TABLE `mf_config`
  ADD PRIMARY KEY (`config_id`);

--
-- Index pour la table `mf_currencies`
--
ALTER TABLE `mf_currencies`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `mf_dmethods`
--
ALTER TABLE `mf_dmethods`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `mf_invoice`
--
ALTER TABLE `mf_invoice`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `mf_members`
--
ALTER TABLE `mf_members`
  ADD PRIMARY KEY (`id`),
  ADD KEY `parent_id` (`parent_id`);

--
-- Index pour la table `mf_notifications`
--
ALTER TABLE `mf_notifications`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `mf_offers`
--
ALTER TABLE `mf_offers`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `mf_pages`
--
ALTER TABLE `mf_pages`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `mf_payments`
--
ALTER TABLE `mf_payments`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `mf_shortlinks`
--
ALTER TABLE `mf_shortlinks`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `mf_testimonials`
--
ALTER TABLE `mf_testimonials`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `mf_themes`
--
ALTER TABLE `mf_themes`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `mf_withdraws`
--
ALTER TABLE `mf_withdraws`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `mf_ads`
--
ALTER TABLE `mf_ads`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT pour la table `mf_announcements`
--
ALTER TABLE `mf_announcements`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `mf_banlist`
--
ALTER TABLE `mf_banlist`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `mf_claims`
--
ALTER TABLE `mf_claims`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `mf_config`
--
ALTER TABLE `mf_config`
  MODIFY `config_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=55;

--
-- AUTO_INCREMENT pour la table `mf_currencies`
--
ALTER TABLE `mf_currencies`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT pour la table `mf_dmethods`
--
ALTER TABLE `mf_dmethods`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `mf_invoice`
--
ALTER TABLE `mf_invoice`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `mf_members`
--
ALTER TABLE `mf_members`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `mf_notifications`
--
ALTER TABLE `mf_notifications`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `mf_offers`
--
ALTER TABLE `mf_offers`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `mf_pages`
--
ALTER TABLE `mf_pages`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `mf_payments`
--
ALTER TABLE `mf_payments`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `mf_shortlinks`
--
ALTER TABLE `mf_shortlinks`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `mf_testimonials`
--
ALTER TABLE `mf_testimonials`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `mf_themes`
--
ALTER TABLE `mf_themes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `mf_withdraws`
--
ALTER TABLE `mf_withdraws`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `mf_members`
--
ALTER TABLE `mf_members`
  ADD CONSTRAINT `mf_members_ibfk_1` FOREIGN KEY (`parent_id`) REFERENCES `mf_members` (`id`) ON DELETE SET NULL;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
