-- phpMyAdmin SQL Dump
-- version 5.0.3
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th1 05, 2021 lúc 09:42 AM
-- Phiên bản máy phục vụ: 10.4.14-MariaDB
-- Phiên bản PHP: 7.2.34

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `wafen`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `oc_address`
--

DROP TABLE IF EXISTS `oc_address`;
CREATE TABLE `oc_address` (
  `address_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `firstname` varchar(32) NOT NULL,
  `lastname` varchar(32) NOT NULL,
  `company` varchar(40) NOT NULL,
  `address_1` varchar(128) NOT NULL,
  `address_2` varchar(128) NOT NULL,
  `city` varchar(128) NOT NULL,
  `postcode` varchar(10) NOT NULL,
  `country_id` int(11) NOT NULL DEFAULT 0,
  `zone_id` int(11) NOT NULL DEFAULT 0,
  `custom_field` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `oc_affiliate`
--

DROP TABLE IF EXISTS `oc_affiliate`;
CREATE TABLE `oc_affiliate` (
  `affiliate_id` int(11) NOT NULL,
  `firstname` varchar(32) NOT NULL,
  `lastname` varchar(32) NOT NULL,
  `email` varchar(96) NOT NULL,
  `telephone` varchar(32) NOT NULL,
  `fax` varchar(32) NOT NULL,
  `password` varchar(40) NOT NULL,
  `salt` varchar(9) NOT NULL,
  `company` varchar(40) NOT NULL,
  `website` varchar(255) NOT NULL,
  `address_1` varchar(128) NOT NULL,
  `address_2` varchar(128) NOT NULL,
  `city` varchar(128) NOT NULL,
  `postcode` varchar(10) NOT NULL,
  `country_id` int(11) NOT NULL,
  `zone_id` int(11) NOT NULL,
  `code` varchar(64) NOT NULL,
  `commission` decimal(4,2) NOT NULL DEFAULT 0.00,
  `tax` varchar(64) NOT NULL,
  `payment` varchar(6) NOT NULL,
  `cheque` varchar(100) NOT NULL,
  `paypal` varchar(64) NOT NULL,
  `bank_name` varchar(64) NOT NULL,
  `bank_branch_number` varchar(64) NOT NULL,
  `bank_swift_code` varchar(64) NOT NULL,
  `bank_account_name` varchar(64) NOT NULL,
  `bank_account_number` varchar(64) NOT NULL,
  `ip` varchar(40) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `approved` tinyint(1) NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `oc_affiliate`
--

INSERT INTO `oc_affiliate` (`affiliate_id`, `firstname`, `lastname`, `email`, `telephone`, `fax`, `password`, `salt`, `company`, `website`, `address_1`, `address_2`, `city`, `postcode`, `country_id`, `zone_id`, `code`, `commission`, `tax`, `payment`, `cheque`, `paypal`, `bank_name`, `bank_branch_number`, `bank_swift_code`, `bank_account_name`, `bank_account_number`, `ip`, `status`, `approved`, `date_added`) VALUES
(1, 'Stacy', 'Keibler', 'stacykeibler001@gmail.com', '0983189078', '84983189078', '5e61a7211b6da6a58af58a3ed0c65ea80cf12ba9', 'Atu685mgR', 'Victory', 'https://couponupto.com/', 'Union Street, union street', '', 'Eureka', '90001', 81, 1265, '5e392e583c231', '5.00', '', 'paypal', '', 'dangconghoang@gmail.com', '', '', '', '', '', '183.80.228.19', 1, 1, '2020-02-04 09:42:00'),
(2, 'Christian', 'Twent', 'christiantwent@googlemail.com', '017667277122', '', '7892417841c14b8e8ce96e41be67c3e162db2335', 'GFFWzXaZJ', '', '', 'Alte Werner Str. 17', '', 'Bochum', '44805', 81, 1263, '5f02129e69d34', '5.00', '', 'paypal', '', 'budizzle13@gmail.com', '', '', '', '', '', '89.204.153.93', 1, 1, '2020-07-05 19:49:18');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `oc_affiliate_activity`
--

DROP TABLE IF EXISTS `oc_affiliate_activity`;
CREATE TABLE `oc_affiliate_activity` (
  `affiliate_activity_id` int(11) NOT NULL,
  `affiliate_id` int(11) NOT NULL,
  `key` varchar(64) NOT NULL,
  `data` text NOT NULL,
  `ip` varchar(40) NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `oc_affiliate_login`
--

DROP TABLE IF EXISTS `oc_affiliate_login`;
CREATE TABLE `oc_affiliate_login` (
  `affiliate_login_id` int(11) NOT NULL,
  `email` varchar(96) NOT NULL,
  `ip` varchar(40) NOT NULL,
  `total` int(4) NOT NULL,
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `oc_affiliate_transaction`
--

DROP TABLE IF EXISTS `oc_affiliate_transaction`;
CREATE TABLE `oc_affiliate_transaction` (
  `affiliate_transaction_id` int(11) NOT NULL,
  `affiliate_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `description` text NOT NULL,
  `amount` decimal(15,4) NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `oc_api`
--

DROP TABLE IF EXISTS `oc_api`;
CREATE TABLE `oc_api` (
  `api_id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  `key` text NOT NULL,
  `status` tinyint(1) NOT NULL,
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `oc_api`
--

INSERT INTO `oc_api` (`api_id`, `name`, `key`, `status`, `date_added`, `date_modified`) VALUES
(1, 'Default', 'YeiZHdy18ccz8cdn9qr2SNp5vBtwEstPaij9OeQjQeNPRGftdO3FaUYZnDvlJEz733O8xVp2MAs9RA6P6pzPGrh2OMVhQ7RS0jEEHpskVEoezGzOO0TV3O9ljYIyGlTL2zl6tk5lAKA2IOHlcCdShXdxZmA28PBSxt86T9NP1lblWzrazrgfm5v94pl8Rqqonaue2szYfmousEnef6KzrIdCmF2KFeIwrJl69J20D0fMCcETaWjTpjXZJPRNVfSF', 1, '2017-09-03 08:36:17', '2017-09-03 08:36:17');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `oc_api_ip`
--

DROP TABLE IF EXISTS `oc_api_ip`;
CREATE TABLE `oc_api_ip` (
  `api_ip_id` int(11) NOT NULL,
  `api_id` int(11) NOT NULL,
  `ip` varchar(40) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `oc_api_ip`
--

INSERT INTO `oc_api_ip` (`api_ip_id`, `api_id`, `ip`) VALUES
(1, 1, '130.180.25.195'),
(2, 1, '2003:c9:ebd0:7800:24a3:83a6:44e6:5649'),
(3, 1, '2003:c9:ebd0:7800:892:daae:93e4:dc8e'),
(4, 1, '1.53.215.195'),
(5, 1, '93.197.54.1'),
(6, 1, '93.197.62.7'),
(7, 1, '217.231.32.50'),
(8, 1, '2003:c9:ef16:f800:710d:a98b:6301:a185'),
(9, 1, '2003:c9:ef16:f800:795a:d7c1:f4a6:347b'),
(10, 1, '2003:c9:ef35:2b00:936:9b27:dae1:3011'),
(11, 1, '2003:c9:ef35:2b00:710d:a98b:6301:a185'),
(12, 1, '2003:c9:ef35:2b00:7913:bf5d:851f:196d'),
(13, 1, '93.197.48.204'),
(14, 1, '2003:c9:ef35:2b00:dd3e:f3cb:d59f:5afc'),
(15, 1, '2003:c9:ef35:2b00:7564:fb1d:c92b:e430'),
(16, 1, '2003:c9:ef35:2b00:a8fe:dc8d:f625:1580'),
(17, 1, '2003:c9:ef35:2b00:cd6:378f:5492:d770'),
(18, 1, '2003:c9:ef35:2b00:712b:c085:6049:7e42'),
(19, 1, '2003:c9:ef35:2b00:2507:4d01:a8ea:99b'),
(20, 1, '2003:c9:ef35:2b00:8126:3f0:2a95:4cc2'),
(21, 1, '2003:c9:ef35:2b00:8945:d0c0:618e:5bed'),
(22, 1, '2003:c9:ef35:2b00:bc26:215d:c0d9:3cf5'),
(23, 1, '2003:c9:ef35:2b00:5c56:c753:39d5:4a78'),
(24, 1, '2003:c9:ef24:8c00:b94c:4c2b:b1cb:d6d9'),
(25, 1, '91.2.255.19'),
(26, 1, '2003:c9:ef11:5200:3d6e:da31:6de2:4f5b'),
(27, 1, '2003:c9:ef14:5600:fdf4:6898:5b3a:471'),
(28, 1, '2003:c9:ef14:5600:755a:c77c:49af:7579'),
(29, 1, '2003:c9:ef10:af00:8534:2674:8ca7:81cb'),
(30, 1, '2003:c9:ef10:af00:11e3:c8d:1600:5f19'),
(31, 1, '2003:c9:ef0d:d600:30ca:d51a:da93:ac5f'),
(32, 1, '2003:c9:ef0d:d600:b1d9:86dc:217:31e3'),
(33, 1, '2003:c9:ef0d:d600:ec87:90e5:4c9d:7431'),
(34, 1, '2003:c9:ef13:c300:38f1:b86d:434f:bff8'),
(35, 1, '2003:c9:ef13:c300:81d2:3d5b:53c5:3c'),
(36, 1, '2003:c9:ef13:c300:f4b3:c01f:8ce6:17ee'),
(37, 1, '2003:c9:ef13:c300:a528:b83a:203:d352'),
(38, 1, '2003:c9:ef42:b300:cc31:9aae:78b2:c130'),
(39, 1, '2003:c9:ef28:9b00:6da8:253c:3874:ab5b'),
(40, 1, '2003:c9:ef28:9b00:61b0:7fb1:46cd:eaf9'),
(41, 1, '2003:c9:ef28:9b00:4410:cd47:a57a:696c'),
(42, 1, '2003:c9:ef30:a900:6c6e:7fd7:6ffe:adbc'),
(43, 1, '2003:c9:ef28:7100:6e:d987:46d8:ac80'),
(44, 1, '84.191.27.168'),
(45, 1, '2003:c9:ef24:9c00:68bd:3d22:7d5a:5fc7'),
(46, 1, '2003:c9:ef24:9c00:b890:a1b3:8272:8882'),
(47, 1, '2003:c9:ef24:9c00:9d38:5f94:393c:e8b4'),
(48, 1, '2003:c9:ef24:9c00:5df9:3599:7343:d844'),
(49, 1, '2003:c9:ef24:9c00:5857:a354:8039:7308'),
(50, 1, '2003:c9:ef24:9c00:9ce8:4d37:ec21:804c'),
(51, 1, '2003:c9:ef24:9c00:3050:d6c:3752:6fba'),
(52, 1, '2003:c9:ef15:c100:c:31e0:ef51:8edd'),
(53, 1, '2003:c9:ef0e:4d00:8c31:fef8:536c:6890'),
(54, 1, '2003:c9:ef3a:fa00:d5ea:fb34:370d:1e90'),
(55, 1, '91.2.248.173'),
(56, 1, '2003:c9:ef3a:fa00:7934:a05a:c246:4e24'),
(57, 1, '91.2.245.188'),
(58, 1, '2003:c9:ef1d:5f00:b94c:e0bd:2f94:9268'),
(59, 1, '84.191.22.30'),
(60, 1, '2003:c9:ef0c:2000:70b1:2c4f:a945:e6e8'),
(61, 1, '2003:c9:ef16:9b00:2c27:a35f:40e9:2ca9'),
(62, 1, '2003:c9:ef29:f900:7841:79:c5ef:9aad'),
(63, 1, '2003:c9:ef06:8f00:d182:2876:75cf:50d'),
(64, 1, '2003:c9:ef34:3600:14f1:8c0:3224:376'),
(65, 1, '2003:c9:ef0b:a00:847:403c:8568:ee89'),
(66, 1, '2003:c9:ef16:7400:d8f3:67f6:c7c3:9096'),
(67, 1, '2003:c9:ef1e:7e00:e1df:2da2:e715:c422'),
(68, 1, '2003:c9:ef1e:7e00:b4e2:911d:7aad:f5d6'),
(69, 1, '84.191.21.145'),
(70, 1, '84.191.20.233'),
(71, 1, '2003:c9:ef06:7500:2197:c45f:27c6:5655'),
(72, 1, '2003:c9:ef06:7500:2133:64a0:d25a:f6df'),
(73, 1, '2003:c9:ef06:7500:38b5:d320:f8cc:b463'),
(74, 1, '2003:c9:ef06:7500:e13f:9351:88cd:9c82'),
(75, 1, '2003:c9:ef06:7500:d425:6e2d:47b1:bbee'),
(76, 1, '2003:c9:ef0b:d600:996e:8aa1:78cf:28bf'),
(77, 1, '2003:c9:ef0b:d600:10c0:6993:cdaf:5b9b'),
(78, 1, '2003:c9:ef0b:d600:9d9b:4cfc:bf8:babb'),
(79, 1, '2003:c9:ef41:b500:21ef:7e48:3002:41c1'),
(80, 1, '42.114.19.162'),
(81, 1, '2003:c9:ef2e:b200:7c23:b086:e3a1:3d9'),
(82, 1, '2003:c9:ef13:7200:80cb:4c42:8ee2:757b'),
(83, 1, '2003:c9:ef13:7200:f8ba:7a7d:30f0:13d9'),
(84, 1, '2003:c9:ef13:7200:ac48:d73b:f3e1:3f0e'),
(85, 1, '2003:c9:ef13:7200:d057:307:f986:ad3d'),
(86, 1, '2003:c9:ef13:7200:1947:24d4:86e4:747'),
(87, 1, '2003:c9:ef13:7200:19f:4e63:fdc1:8a8f'),
(88, 1, '2003:c9:ef13:7200:5164:d98c:ac96:d642'),
(89, 1, '2003:c9:ef13:7200:6de1:6dfd:f6ad:1c65'),
(90, 1, '2003:c9:ef13:7200:dd86:f2fe:d47c:a330'),
(91, 1, '92.216.145.66'),
(92, 1, '2003:c9:ef13:7200:ccb3:3dad:6bec:b819'),
(93, 1, '2003:c9:ef13:7200:1126:48b8:d463:1ada'),
(94, 1, '2003:c9:ef13:7200:8907:c70e:b780:ca9c'),
(95, 1, '2003:c9:ef13:7200:418d:ba06:9fe:5db5'),
(96, 1, '2003:c9:ef13:7200:ccb9:a393:3bc0:cf80'),
(97, 1, '2003:c9:ef13:7200:5ded:c2e4:93e0:bd98'),
(98, 1, '2003:c9:ef13:7200:d528:986d:9126:9e70'),
(99, 1, '2003:c9:ef13:7200:b82e:cdd9:2a8b:a140'),
(100, 1, '2003:c9:ef21:9000:810e:2c56:c429:d01d'),
(101, 1, '2003:c9:ef21:9000:2958:6d44:976a:c54f'),
(102, 1, '2003:c9:ef1b:5700:a4e4:f743:13c8:b2df'),
(103, 1, '2003:c9:ef1b:5700:5506:1b82:9550:8397'),
(104, 1, '2003:c9:ef1b:5700:3901:1f5c:f22:d9d8'),
(105, 1, '2003:c9:ef1b:5700:b96a:2f84:6cb5:6413'),
(106, 1, '2003:c9:ef32:8a00:cc10:1081:60b:e75a'),
(107, 1, '2003:c9:ef32:8a00:ede8:2040:9415:5767'),
(108, 1, '2003:c9:ef32:8a00:19bf:350a:3bdd:af7e'),
(109, 1, '2003:c9:ef39:5d00:8c4b:fb9d:1379:f1c4'),
(110, 1, '2003:c9:ef22:7400:3c5c:a34b:4870:f8ee'),
(111, 1, '2003:c9:ef30:6e00:71ef:2887:549d:2f'),
(112, 1, '2003:c9:ef30:6e00:88cc:941f:5686:108'),
(113, 1, '2003:c9:ef3f:af00:3903:efb6:f91:4a82'),
(114, 1, '2003:c9:ef3f:af00:5c5c:3f02:c7c2:ef9a'),
(115, 1, '2003:c9:ef3f:af00:8d0a:cb20:c503:c4c1'),
(116, 1, '2003:c9:ef0d:ec00:addb:2698:64aa:6484'),
(117, 1, '2003:c9:ef0d:ec00:6c5b:98eb:631d:70d0'),
(118, 1, '2003:c9:ef0d:ec00:2897:7f9a:879b:8e15'),
(119, 1, '2003:c9:ef0d:ec00:74f8:6d3e:91e2:5a4e'),
(120, 1, '2003:c9:ef0d:ec00:e537:a25e:b407:59f7'),
(121, 1, '2003:c9:ef0d:ec00:8cf7:8765:a743:b467'),
(122, 1, '2003:c9:ef2b:8c00:6000:fecc:80ed:162a'),
(123, 1, '2003:c9:ef2b:8c00:547e:58c3:4b:ba63'),
(124, 1, '2003:c9:ef2b:8c00:4121:de94:73b5:f58b'),
(125, 1, '2003:c9:ef2b:8c00:ac74:6c5d:2a2d:2ec7'),
(126, 1, '2003:c9:ef2b:8c00:5416:6de8:ba17:8598'),
(127, 1, '2003:c9:ef2b:8c00:f42b:d000:3758:1271'),
(128, 1, '2003:c9:ef2b:8c00:2819:7646:1a0e:353d'),
(129, 1, '2003:c9:ef0d:f000:cc26:6f17:d0d:5c7'),
(130, 1, '2003:c9:ef0d:f000:b058:b2:69b2:c183'),
(131, 1, '2003:c9:ef17:f800:25d7:65ba:b79a:ddd2'),
(132, 1, '2003:c9:ef17:f800:bc87:cd2f:43ba:2120'),
(133, 1, '2003:c9:ef23:f900:f169:188e:8a07:eb46'),
(134, 1, '2003:c9:ef23:f900:8c3e:3f7d:f1de:46b2'),
(135, 1, '2003:c9:ef15:5100:a1c8:1b19:acd4:f8c0'),
(136, 1, '2003:c9:ef27:fe00:858b:737c:d18e:a278'),
(137, 1, '2003:c9:ef32:7200:599d:8487:4d71:8a27'),
(138, 1, '2003:c9:ef32:7200:2557:5082:7e4c:ebb2'),
(139, 1, '93.197.57.173'),
(140, 1, '2003:c9:ef1f:c100:8a1:7bf9:a607:f1aa'),
(141, 1, '2003:c9:ef33:1200:5ec:34aa:9dd9:aa40'),
(142, 1, '2003:c9:ef33:1200:f438:d4fb:bfbb:9764'),
(143, 1, '2003:c9:ef11:f600:1f2:305a:b105:2974'),
(144, 1, '2003:c9:ef18:5200:4415:d435:55e6:bfb4'),
(145, 1, '2003:c9:ef18:5200:c50e:dc85:14bb:c438'),
(146, 1, '2003:c9:ef18:5200:5d3e:ff0f:5ea1:ecfc'),
(147, 1, '2003:c9:ef18:5200:d9f1:542b:91ca:1a1f'),
(148, 1, '2003:c9:ef18:5200:dd42:c5c3:6778:4a4f'),
(149, 1, '2003:c9:ef3f:4000:1c7:5bc7:ebb9:f902'),
(150, 1, '2003:c9:ef3f:4000:99bf:d65b:9bc3:240a'),
(151, 1, '2003:c9:ef2d:5700:8f4:720b:81dc:b617'),
(152, 1, '2003:c9:ef1c:eb00:50d5:a53e:4eb0:b02d'),
(153, 1, '2003:c9:ef25:1c00:d9a0:38fc:603f:ec0f'),
(154, 1, '2003:c9:ef25:1c00:e87c:a6e8:658c:4c02'),
(155, 1, '2003:c9:ef34:5300:5d8:aec0:ad63:7a77'),
(156, 1, '2003:c9:ef34:5300:2d34:3a0e:196a:3f51'),
(157, 1, '2003:c9:ef34:5300:a8c3:9131:f492:f261'),
(158, 1, '2003:c9:ef34:5300:e9e7:6f58:4213:52df'),
(159, 1, '2003:c9:ef34:5300:21e6:af99:585f:6279'),
(160, 1, '2003:c9:ef34:5300:31a7:3a08:4a67:547f'),
(161, 1, '2003:c9:ef34:5300:29ee:452a:6d96:d71e'),
(162, 1, '2003:c9:ef34:5300:ec21:4afb:855:1119'),
(163, 1, '2003:c9:ef34:5300:9894:f349:1d21:2dad'),
(164, 1, '2003:c9:ef38:1e00:b9ce:af64:2a57:7f1b'),
(165, 1, '2003:c9:ef38:1e00:e4a2:e2bf:92f3:a438'),
(166, 1, '2003:c9:ef20:ca00:c47a:7918:4f41:8d93'),
(167, 1, '2003:c9:ef20:ca00:8c51:56fa:a409:bbd2'),
(168, 1, '2003:c9:ef20:ca00:192:32e1:4f94:1578'),
(169, 1, '2003:c9:ef20:ca00:8c72:8744:e7c0:cb7f'),
(170, 1, '2003:c9:ef20:ca00:e0c3:b1ed:a142:62a7'),
(171, 1, '2003:c9:ef20:ca00:18b:f83d:35dc:e7d'),
(172, 1, '2003:c9:ef12:1300:1450:e6f1:a3b9:4e5d'),
(173, 1, '2003:c9:ef12:1300:49d7:4505:454c:88a3'),
(174, 1, '2003:c9:ef12:1300:904c:1354:56a4:70cc'),
(175, 1, '2003:c9:ef12:1300:74:f24e:b81:c91f'),
(176, 1, '2003:c9:ef12:1300:2975:6424:a270:bd56'),
(177, 1, '2003:c9:ef12:1300:59f9:a3fc:ccf3:3886'),
(178, 1, '2003:c9:ef12:1300:517a:2504:3f8c:2551'),
(179, 1, '2003:c9:ef12:1300:211c:165a:661e:b984'),
(180, 1, '2003:c9:ef12:1300:7de6:afc2:cb8e:c699'),
(181, 1, '2003:c9:ef3d:fa00:1d40:29b2:85f3:9937'),
(182, 1, '2003:c9:ef26:f500:99cb:9412:3b5c:9f3f'),
(183, 1, '2003:c9:ef1d:1a00:99cb:9412:3b5c:9f3f'),
(184, 1, '2003:c9:ef0e:de00:186c:9e48:8ec7:f289'),
(185, 1, '2003:c9:ef0e:de00:d1d3:ca65:6608:134e'),
(186, 1, '2003:c9:ef0e:de00:1dbd:72a4:f37e:7923'),
(187, 1, '2003:c9:ef32:100:402b:917c:3d7:296b'),
(188, 1, '2003:c9:ef32:100:b81e:76fb:51ae:e441'),
(189, 1, '2003:c9:ef14:c800:6169:18b0:e05:9da1'),
(190, 1, '2003:c9:ef25:ce00:1160:7d71:2e65:3cc7'),
(191, 1, '2003:c9:ef0f:5100:3c0a:8877:e49c:b3e3'),
(192, 1, '2003:c9:ef23:6500:9c24:e2b6:b360:d6d2'),
(193, 1, '2003:c9:ef4d:300:5dfc:26c3:ae6c:fb6d'),
(194, 1, '2003:c9:ef4d:300:394f:2f7e:71d7:8674'),
(195, 1, '2003:c9:ef4d:300:95be:4609:db74:362e'),
(196, 1, '2003:c9:ef05:b100:5dd:5ccf:ac75:d6b0'),
(197, 1, '2003:c9:ef05:b100:b8fd:f420:df38:ce84'),
(198, 1, '2003:c9:ef05:b100:d9c1:4684:d283:78ce'),
(199, 1, '2003:c9:ef05:b100:3c:6fc3:54f7:935c'),
(200, 1, '2003:c9:ef31:1b00:923:b874:6160:36c2'),
(201, 1, '2003:c9:ef31:1b00:8550:492:81a5:7c69'),
(202, 1, '2003:c9:ef31:1b00:b42d:c9b7:f830:d485'),
(203, 1, '82.82.222.73'),
(204, 1, '2003:c9:ef14:4000:6109:869b:a338:57aa'),
(205, 1, '2003:c9:ef14:4000:3cf5:d14c:8ed5:ffb4'),
(206, 1, '2003:c9:ef14:4000:b1ca:70e9:5311:2bbe'),
(207, 1, '2003:c9:ef14:4000:1cd0:64d3:b779:bf4a'),
(208, 1, '2003:c9:ef14:4000:f5c7:4936:1ebf:f238'),
(209, 1, '84.191.27.99'),
(210, 1, '2003:c9:ef14:4000:a133:51f9:8a14:4fd5'),
(211, 1, '2003:c9:ef14:4000:c183:1305:f062:2d2e'),
(212, 1, '2003:c9:ef14:4000:4dcd:655:868d:eb48'),
(213, 1, '2003:c9:ef14:4000:3cf1:e67d:db5b:3898'),
(214, 1, '2003:c9:ef14:4000:64e2:1ca:278e:a3c2'),
(215, 1, '2003:c9:ef14:4000:59c:24e1:85be:af1c'),
(216, 1, '2003:c9:ef14:4000:7117:4fd1:d43d:3d54'),
(217, 1, '2003:c9:ef14:4000:7404:8c86:4210:f70c'),
(218, 1, '2003:c9:ef14:4000:2866:f71e:e462:6579'),
(219, 1, '2003:c9:ef3f:1100:a1c3:7de1:f242:f816'),
(220, 1, '2003:c9:ef14:b200:3d55:6ea1:b91a:465b'),
(221, 1, '2003:c9:ef14:b200:70d8:252d:a169:2cc6'),
(222, 1, '2003:c9:ef14:b200:127:5141:5680:6b83'),
(223, 1, '2003:c9:ef14:b200:b42b:794:b7a2:a97'),
(224, 1, '2003:c9:ef23:c100:61df:9e59:c19a:815f'),
(225, 1, '2003:c9:ef3e:ff00:d066:79eb:57ae:55ab'),
(226, 1, '2003:c9:ef3e:ff00:7974:f416:6ad9:54b2'),
(227, 1, '2003:c9:ef3e:ff00:943f:717b:2c50:73fb'),
(228, 1, '2003:c9:ef3e:ff00:2cc1:2efe:3e0a:1a27'),
(229, 1, '2003:c9:ef3e:ff00:c0b7:4545:47c:1ced'),
(230, 1, '2003:c9:ef14:3500:1436:cda2:6e95:7da5'),
(231, 1, '2003:c9:ef14:3500:9d46:ce16:d1fa:49c'),
(232, 1, '2003:c9:ef1b:ef00:f034:fc5a:c472:2a4'),
(233, 1, '2003:c9:ef1b:ef00:39fe:8c7b:fbf0:a0f4'),
(234, 1, '93.197.56.82'),
(235, 1, '2001:16b8:202c:5900:e40f:476b:339a:82c6'),
(236, 1, '2003:c9:ef1f:3b00:d501:e80d:5b7b:bf3a'),
(237, 1, '84.156.180.130'),
(238, 1, '2003:c9:5709:6100:ed5e:9956:4377:8bd8'),
(239, 1, '2003:c9:570a:1200:7853:7ce9:1b86:5fca'),
(240, 1, '2003:c9:ef1f:3b00:242c:dd62:1ea4:f362'),
(241, 1, '2003:c9:ef1f:3b00:315b:e4de:9205:338d'),
(242, 1, '2001:16b8:20dd:be00:44a8:3425:8811:ac0b'),
(243, 1, '2003:c9:5709:6700:8f:fcfc:b0a0:6eb4'),
(244, 1, '2003:c9:ef1f:3b00:6d61:df0e:4432:af02'),
(245, 1, '2003:c9:5709:6700:c078:4c00:2b97:e0c6'),
(246, 1, '91.2.253.227'),
(247, 1, '2003:c9:5734:a200:312a:e30f:129f:4539'),
(248, 1, '2003:c9:5734:a200:9dcc:9388:84b6:a07'),
(249, 1, '2003:c9:ef0b:2600:3038:ded6:b77f:7e85'),
(250, 1, '2003:c9:5737:ee00:3022:53ba:25ab:6e5c'),
(251, 1, '2003:c9:5708:9b00:24ec:9b63:2f20:90e6'),
(252, 1, '2003:c9:ef0b:2600:bc2e:4843:5562:dfa9'),
(253, 1, '2003:c9:ef0b:2600:f828:1df9:a12b:42aa'),
(254, 1, '2003:c9:570a:fa00:f534:a99e:558e:1fa7'),
(255, 1, '2003:c9:ef0b:2600:95a4:2255:3474:cc4f'),
(256, 1, '2003:c9:ef0b:2600:f51b:a48d:2d3c:4d2d'),
(257, 1, '2003:c9:ef0b:2600:d865:bb84:dd75:b400'),
(258, 1, '2003:c9:ef0b:2600:d197:9f5c:8c3:933c'),
(259, 1, '2003:c9:ef0b:2600:8963:a9f8:105e:55eb'),
(260, 1, '2003:c9:ef0b:2600:dd27:9799:bc18:40cf'),
(261, 1, '2003:c9:ef0b:2600:6d9f:e2dc:bd17:aa7'),
(262, 1, '93.197.49.80'),
(263, 1, '2003:c9:ef24:2b00:99e:fe70:8474:ea0e'),
(264, 1, '2003:c9:ef24:2b00:9cb3:ba3d:8437:eb8d'),
(265, 1, '2003:c9:ef24:2b00:75fd:86cd:333:c8e'),
(266, 1, '2003:c9:ef24:2b00:69bc:bca2:f20b:3d6e'),
(267, 1, '2003:c9:ef24:2b00:75cb:47f6:6f40:7dd4'),
(268, 1, '2003:c9:ef24:2b00:5d8c:dd70:da36:4d18'),
(269, 1, '2003:c9:ef24:2b00:b4cc:a7c7:64c0:a99b'),
(270, 1, '2003:c9:ef24:2b00:c47f:fb2a:1f83:98b5'),
(271, 1, '2003:c9:ef24:2b00:6534:334f:67cf:d457'),
(272, 1, '2003:c9:ef24:2b00:5985:5e25:c0ab:fc38'),
(273, 1, '2003:c9:ef24:2b00:bc14:d09c:1e33:c0e2'),
(274, 1, '2003:c9:ef24:2b00:959d:2aad:30e5:8ff1'),
(275, 1, '2003:c9:ef46:9600:89e:6e63:c13e:ae2a'),
(276, 1, '2003:c9:ef46:9600:54eb:1e52:bc41:a41b'),
(277, 1, '2001:16b8:2a12:b800:ec02:78e6:ece4:73c5'),
(278, 1, '2003:c9:ef1d:bd00:b421:e593:47d0:28b3'),
(279, 1, '93.197.63.131'),
(280, 1, '2003:c9:ef18:c300:ad7e:ecd5:d254:a226'),
(281, 1, '2003:c9:ef18:c300:ad61:325d:25db:b4ad'),
(282, 1, '2003:c9:ef18:c300:b80e:8b7f:8b70:3260'),
(283, 1, '2003:c9:ef18:c300:1590:b2cb:6a71:830b'),
(284, 1, '2003:c9:ef18:c300:14cf:3d67:849a:5c99'),
(285, 1, '2003:c9:ef18:c300:2035:a7b9:fe9d:6f5e'),
(286, 1, '2003:c9:ef18:c300:21e6:5d1e:174b:17e4'),
(287, 1, '2003:c9:ef18:c300:c5ca:6b21:9f57:361c'),
(288, 1, '2003:c9:ef18:c300:39c7:537a:ebe0:d9c1'),
(289, 1, '84.191.17.79'),
(290, 1, '2003:c9:ef18:c300:5049:ee56:755c:3414'),
(291, 1, '2003:c9:ef18:c300:6cd8:a7a7:3678:1634'),
(292, 1, '2003:c9:ef18:c300:bd3a:35e7:33d6:946e'),
(293, 1, '2003:c9:ef18:c300:e8ee:ea75:ad4f:1062'),
(294, 1, '2003:c9:ef18:c300:2419:6d1e:432b:4879'),
(295, 1, '2003:c9:ef18:c300:ddd0:2017:969d:f624'),
(296, 1, '2003:c9:ef18:c300:f08a:156e:5682:3893'),
(297, 1, '2003:c9:ef18:c300:cc21:20cc:68eb:84de'),
(298, 1, '2003:c9:ef18:c300:4106:9991:6774:4c2d'),
(299, 1, '2003:c9:ef18:c300:e9ae:3e3a:47c2:b49d'),
(300, 1, '2003:c9:ef18:c300:f9f1:d166:dc24:b5e1'),
(301, 1, '2003:c9:ef18:c300:e134:e35c:893e:7f28'),
(302, 1, '2003:c9:ef18:c300:e405:fd92:3d4f:aa26'),
(303, 1, '2003:c9:ef18:c300:19aa:9a89:2bbc:a813'),
(304, 1, '2003:c9:ef18:c300:6d73:2ce2:693c:19f0'),
(305, 1, '2003:c9:ef18:c300:696d:8c9d:3179:917f'),
(306, 1, '2003:c9:ef18:c300:193f:7100:8877:b278'),
(307, 1, '2003:c9:ef1d:1100:25f9:e5f2:802a:144d'),
(308, 1, '2003:c9:ef1d:1100:ccc1:f07c:e337:914'),
(309, 1, '2003:c9:ef1d:1100:9993:ee69:8f1d:6060'),
(310, 1, '2003:c9:ef38:4400:78a0:4f7d:8882:560a'),
(311, 1, '2003:c9:ef38:4400:688d:a203:73c:e75f'),
(312, 1, '2003:c9:ef38:4400:35a6:9231:1683:80e8'),
(313, 1, '2003:c9:ef38:4400:2c86:f182:62fb:97ed'),
(314, 1, '2003:c9:ef38:4400:799d:6c3d:f3ef:4cb'),
(315, 1, '2003:c9:ef38:4400:4dfe:34d1:bf8f:7bfa'),
(316, 1, '2001:16b8:2a02:6100:b4fa:822d:aeb8:adf1'),
(317, 1, '2003:c9:ef11:100:e4b3:638a:9a6:1209'),
(318, 1, '2003:c9:ef11:100:8493:44aa:6f5e:22c5'),
(319, 1, '2003:c9:ef11:100:bd71:674a:f55c:1bb3'),
(320, 1, '2003:c9:ef11:100:b99c:46e6:9da5:8fc1'),
(321, 1, '2003:c9:ef11:100:1cf0:771f:af8:4f45'),
(322, 1, '2003:c9:ef11:100:3c80:4ca5:5f9a:5725'),
(323, 1, '2003:c9:ef11:100:413c:2223:8e9a:21ef'),
(324, 1, '2003:c9:ef11:100:3021:3a60:1bbe:35ea'),
(325, 1, '2003:c9:ef11:100:5cd8:49bd:80e9:213'),
(326, 1, '2003:c9:ef11:100:d01b:69be:8945:9b82'),
(327, 1, '91.2.243.2'),
(328, 1, '2003:c9:ef11:100:8108:8b66:11b2:4ae'),
(329, 1, '2001:16b8:2a36:e900:7951:fcef:3c15:3a48'),
(330, 1, '2003:c9:ef11:100:a4b8:6f0:439e:23d5'),
(331, 1, '2003:c9:ef11:100:78b8:a2be:1b3e:ea0e'),
(332, 1, '2003:c9:ef11:100:adec:3188:c40c:b7d7'),
(333, 1, '2001:16b8:2a98:fb00:ccf1:27c2:7159:288b'),
(334, 1, '2003:c9:ef08:4a00:494d:225b:53ad:16ca'),
(335, 1, '2003:c9:ef08:4a00:1878:5b94:165f:6f81'),
(336, 1, '2003:c9:ef08:4a00:b53f:799:ea40:43c6'),
(337, 1, '93.197.50.13'),
(338, 1, '2003:c9:ef08:4a00:50b4:655e:cf31:6059'),
(339, 1, '2003:c9:ef08:4a00:cd4e:d59:e30b:4a59'),
(340, 1, '2003:c9:ef08:4a00:7908:b034:2158:e72f'),
(341, 1, '2003:c9:ef08:4a00:4894:fbc6:3d51:908d'),
(342, 1, '2003:c9:ef08:4a00:b4ff:ee30:26c6:dd37'),
(343, 1, '2003:c9:ef08:4a00:45a:7cc5:e67d:1070'),
(344, 1, '2003:c9:ef08:4a00:d006:e191:aab0:1cb1'),
(345, 1, '2003:c9:ef08:4a00:d846:2fca:adb7:5507'),
(346, 1, '2003:c9:ef08:4a00:f9fd:4841:3203:935f'),
(347, 1, '2003:c9:ef08:4a00:65ee:505d:d209:acbf'),
(348, 1, '2003:c9:ef08:4a00:85a1:3282:9867:30e6'),
(349, 1, '2001:16b8:2ae6:6b00:6ca7:e520:889e:d0ff'),
(350, 1, '2003:c9:ef08:4a00:4c09:391:472a:4382'),
(351, 1, '2003:c9:ef16:5300:7195:5727:ca42:ac17'),
(352, 1, '2003:c9:ef16:5300:4d76:97cb:942c:cec3'),
(353, 1, '2003:c9:ef16:5300:edb4:ea26:1334:e40d'),
(354, 1, '2003:c9:ef16:5300:5820:ba8b:940b:728'),
(355, 1, '2003:c9:ef16:5300:8434:10c0:71a:611f'),
(356, 1, '2003:c9:ef16:5300:21b0:b4a1:88f6:c4e1'),
(357, 1, '2003:c9:ef16:5300:91f8:3d8a:16ba:b322'),
(358, 1, '2003:c9:ef16:5300:859e:467f:f6a0:6ef7'),
(359, 1, '2003:c9:ef16:5300:f431:7ff2:b282:2e96'),
(360, 1, '2003:c9:ef16:5300:7d3a:f3ec:c21f:d831'),
(361, 1, '2003:c9:ef16:5300:75b6:e1e8:18ff:f877'),
(362, 1, '2003:c9:ef16:5300:f5c8:dfd6:739a:b926'),
(363, 1, '2003:c9:ef16:5300:75bb:dde6:397a:b9bc'),
(364, 1, '2003:c9:ef16:5300:a565:1a33:5f24:b709'),
(365, 1, '2003:c9:ef16:5300:4530:4567:3d8d:db14'),
(366, 1, '2003:c9:ef16:5300:8ac:a41d:7146:47cc'),
(367, 1, '2003:c9:ef16:5300:4818:9c1:b477:971'),
(368, 1, '2003:c9:ef16:5300:bc7a:c6b2:8a4:a5e0'),
(369, 1, '2003:c9:ef16:5300:5565:1091:afe:51d9'),
(370, 1, '2003:c9:ef16:5300:a111:174b:d799:5898'),
(371, 1, '2003:c9:ef16:5300:bcd8:f142:f250:b1be'),
(372, 1, '2003:c9:ef16:5300:e0c1:8758:17df:78df'),
(373, 1, '2003:c9:ef16:5300:e815:5ebb:977a:ca73'),
(374, 1, '2003:c9:ef16:5300:cc34:8df:2455:a685'),
(375, 1, '2003:c9:ef16:5300:f8f3:2fce:84:7b46'),
(376, 1, '2003:c9:ef16:5300:e410:d653:a7a6:1528'),
(377, 1, '2003:c9:ef16:5300:70a7:6ded:a8da:86cb'),
(378, 1, '2003:c9:ef16:5300:104d:f036:4ca2:bdfd'),
(379, 1, '2001:16b8:2a28:1600:5db:5bc:e91b:97f4'),
(380, 1, '2003:c9:ef16:5300:2d7d:38d6:35ac:5982'),
(381, 1, '2003:c9:ef16:5300:585d:1120:3773:7c16'),
(382, 1, '2003:c9:ef16:5300:9fc:6b85:b6dd:dfa6'),
(383, 1, '2003:c9:ef16:5300:583c:4ec9:11f4:f50f'),
(384, 1, '2003:c9:ef16:5300:d02:42e8:72ea:7137'),
(385, 1, '2003:c9:ef16:5300:19d5:1ac3:2f:afd6'),
(386, 1, '2003:c9:ef16:5300:a5b0:5f2c:54ea:d3db'),
(387, 1, '2003:c9:ef16:5300:d414:d325:95f4:80b3'),
(388, 1, '2003:c9:ef16:5300:303e:4b49:22f4:1454'),
(389, 1, '2003:c9:ef16:5300:b8ce:9c:b239:ac9e'),
(390, 1, '2003:c9:ef16:5300:9ced:9586:8c17:d2d8'),
(391, 1, '2003:c9:ef16:5300:f94a:dc1e:c2:3e23'),
(392, 1, '2003:c9:ef16:5300:9426:6f05:a923:1839'),
(393, 1, '2003:c9:ef16:5300:e021:2032:11a4:377'),
(394, 1, '::1');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `oc_api_session`
--

DROP TABLE IF EXISTS `oc_api_session`;
CREATE TABLE `oc_api_session` (
  `api_session_id` int(11) NOT NULL,
  `api_id` int(11) NOT NULL,
  `token` varchar(32) NOT NULL,
  `session_id` varchar(32) NOT NULL,
  `session_name` varchar(32) NOT NULL,
  `ip` varchar(40) NOT NULL,
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `oc_api_session`
--

INSERT INTO `oc_api_session` (`api_session_id`, `api_id`, `token`, `session_id`, `session_name`, `ip`, `date_added`, `date_modified`) VALUES
(836, 1, 'crDTf8goIXftWLN6Yq0kkooIqBv0qGri', '4f47d1ccaddac5d62e96c22a50ce01de', '', '2003:c9:ef16:5300:e021:2032:11a4:377', '2020-11-02 15:07:55', '2020-11-02 15:07:58'),
(835, 1, 'bClFAfmuG3jpW2pnrlpSozbw4cQdYeWl', '2b851bd7d4b518406d8faea84e194075', '', '2003:c9:ef16:5300:e021:2032:11a4:377', '2020-11-02 15:07:48', '2020-11-02 15:07:51'),
(834, 1, '2EmP9msx0jRIgRmdWc4N82EB25U9ySsX', 'b783def9568324acf6e7b54aa00bc8b2', '', '2003:c9:ef16:5300:e021:2032:11a4:377', '2020-11-02 15:07:41', '2020-11-02 15:07:44'),
(837, 1, 'cki36tpFFf74dsrUmxsGzjWJD7HGLini', '09a0d7938c8b1348380abe2a02f3d7f0', '', '2003:c9:ef16:5300:9426:6f05:a923:1839', '2020-11-02 15:45:50', '2020-11-02 15:45:50');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `oc_attribute`
--

DROP TABLE IF EXISTS `oc_attribute`;
CREATE TABLE `oc_attribute` (
  `attribute_id` int(11) NOT NULL,
  `attribute_group_id` int(11) NOT NULL,
  `sort_order` int(3) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `oc_attribute`
--

INSERT INTO `oc_attribute` (`attribute_id`, `attribute_group_id`, `sort_order`) VALUES
(50, 15, 0),
(56, 18, 0),
(54, 17, 0),
(51, 15, 0),
(53, 17, 0),
(49, 15, 0),
(47, 14, 0),
(48, 14, 0),
(42, 13, 0),
(46, 14, 0),
(52, 15, 0),
(44, 13, 0),
(55, 17, 0),
(43, 13, 0),
(45, 14, 0),
(57, 18, 0),
(58, 18, 0),
(59, 18, 0);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `oc_attribute_description`
--

DROP TABLE IF EXISTS `oc_attribute_description`;
CREATE TABLE `oc_attribute_description` (
  `attribute_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `oc_attribute_description`
--

INSERT INTO `oc_attribute_description` (`attribute_id`, `language_id`, `name`) VALUES
(54, 1, 'trigger release'),
(45, 2, 'Kaliber'),
(45, 1, 'calibre'),
(46, 2, 'Magazinkapazität'),
(46, 1, 'magazine volumne'),
(47, 2, 'Energie (Joule)'),
(47, 1, 'energy (joule)'),
(48, 2, 'Mündungsgeschwindigkeit'),
(48, 1, 'Muzzle Speed'),
(49, 2, 'elektrisch'),
(49, 1, 'electric'),
(50, 2, 'Green Gas'),
(50, 1, 'Green gas'),
(51, 2, 'CO2'),
(51, 1, 'co2'),
(52, 2, 'Federdruck/Luftdruck'),
(52, 1, 'feather / air'),
(53, 2, 'Sicherung'),
(53, 1, 'safety'),
(54, 2, 'Entspannfunktion'),
(42, 2, 'Gewicht (g)'),
(42, 1, 'weight'),
(43, 2, 'Länge (mm)'),
(43, 1, 'length (mm)'),
(44, 2, 'Lauflänge (mm)'),
(44, 1, 'barrell length (mm)'),
(55, 2, 'Sicherheitsrast'),
(55, 1, 'safety position'),
(56, 2, 'SA (Single Action)'),
(56, 1, 'Single Action'),
(57, 2, 'DA (Double Action)'),
(57, 1, 'Double Action'),
(58, 2, 'Schlittenfanghebel'),
(58, 1, 'slide'),
(59, 2, 'Mündungsgewinde'),
(59, 1, 'Muzzle');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `oc_attribute_group`
--

DROP TABLE IF EXISTS `oc_attribute_group`;
CREATE TABLE `oc_attribute_group` (
  `attribute_group_id` int(11) NOT NULL,
  `sort_order` int(3) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `oc_attribute_group`
--

INSERT INTO `oc_attribute_group` (`attribute_group_id`, `sort_order`) VALUES
(16, 3),
(13, 2),
(14, 1),
(15, 4),
(17, 5),
(18, 6);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `oc_attribute_group_description`
--

DROP TABLE IF EXISTS `oc_attribute_group_description`;
CREATE TABLE `oc_attribute_group_description` (
  `attribute_group_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `oc_attribute_group_description`
--

INSERT INTO `oc_attribute_group_description` (`attribute_group_id`, `language_id`, `name`) VALUES
(18, 1, 'function'),
(17, 1, 'safety function'),
(16, 2, 'Merkmale '),
(16, 1, 'markings'),
(15, 2, 'Antrieb'),
(15, 1, 'engine'),
(13, 2, 'Allgemeine Daten'),
(13, 1, 'general data'),
(14, 2, 'Technische Daten'),
(14, 1, 'technique data'),
(17, 2, 'Sicherheitsfunktionen'),
(18, 2, 'Funktion');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `oc_banner`
--

DROP TABLE IF EXISTS `oc_banner`;
CREATE TABLE `oc_banner` (
  `banner_id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  `status` tinyint(1) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `oc_banner`
--

INSERT INTO `oc_banner` (`banner_id`, `name`, `status`) VALUES
(6, 'Manufacturers Category', 1),
(7, 'Home Page Slideshow', 1),
(8, 'Manufacturers Footer', 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `oc_banner_image`
--

DROP TABLE IF EXISTS `oc_banner_image`;
CREATE TABLE `oc_banner_image` (
  `banner_image_id` int(11) NOT NULL,
  `banner_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `title` varchar(64) NOT NULL,
  `link` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  `sort_order` int(3) NOT NULL DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `oc_banner_image`
--

INSERT INTO `oc_banner_image` (`banner_image_id`, `banner_id`, `language_id`, `title`, `link`, `image`, `sort_order`) VALUES
(180, 6, 2, 'Dell', 'index.php?route=product/manufacturer/info&amp;manufacturer_id=7', 'catalog/demo/manufacturer/dell.png', 2),
(179, 6, 2, 'Apple', 'index.php?route=product/manufacturer/info&amp;manufacturer_id=7', 'catalog/demo/apple_logo.jpg', 1),
(866, 8, 1, 'Starbucks', 'index.php?route=product/manufacturer/info&amp;manufacturer_id=7', '', 0),
(867, 8, 1, 'Dell', 'index.php?route=product/manufacturer/info&amp;manufacturer_id=7', '', 0),
(178, 6, 2, 'Canon', 'index.php?route=product/manufacturer/info&amp;manufacturer_id=7', 'catalog/demo/manufacturer/canon.png', 0),
(177, 6, 1, 'Dell', 'index.php?route=product/manufacturer/info&amp;manufacturer_id=7', 'catalog/demo/manufacturer/dell.png', 2),
(176, 6, 1, 'Apple', 'index.php?route=product/manufacturer/info&amp;manufacturer_id=7', 'catalog/demo/apple_logo.jpg', 1),
(175, 6, 1, 'Canon', 'index.php?route=product/manufacturer/info&amp;manufacturer_id=7', 'catalog/demo/canon_logo.jpg', 0),
(865, 8, 1, 'NFL', 'index.php?route=product/manufacturer/info&amp;manufacturer_id=7', '', 0),
(864, 8, 1, 'RedBull', 'index.php?route=product/manufacturer/info&amp;manufacturer_id=7', '', 0),
(862, 8, 1, 'Harley Davidson', 'index.php?route=product/manufacturer/info&amp;manufacturer_id=7', '', 0),
(863, 8, 1, 'Burger King', 'index.php?route=product/manufacturer/info&amp;manufacturer_id=7', '', 0),
(861, 8, 1, 'Canon', 'index.php?route=product/manufacturer/info&amp;manufacturer_id=7', '', 0),
(860, 8, 1, 'Disney', 'index.php?route=product/manufacturer/info&amp;manufacturer_id=7', '', 0),
(859, 8, 1, 'Nintendo', 'index.php?route=product/manufacturer/info&amp;manufacturer_id=7', '', 0),
(858, 8, 1, 'Sony', 'index.php?route=product/manufacturer/info&amp;manufacturer_id=7', '', 0),
(857, 8, 1, 'Coca Cola', 'index.php?route=product/manufacturer/info&amp;manufacturer_id=7', '', 0),
(854, 8, 2, 'Lion Steel', '/Lion-Steel', 'catalog/Logos/112.jpg', 24),
(855, 8, 2, 'Santa Fe', '/Santa-Fe', 'catalog/Logos/Santa-Fe-Stoneworks-Logo.jpg', 25),
(856, 8, 2, 'Maniago Knife Maker', '/Maniago-Knife-Makers', 'catalog/Logo Hersteller/MKM.jpg', 26),
(853, 8, 2, 'Linder', '/Linder', 'catalog/Logos/53.jpg', 23),
(852, 8, 2, 'Kershaw', '/Kershaw', 'catalog/Logos/35.jpg', 22),
(851, 8, 2, 'Hartkopf', '/Hartkopf', 'catalog/Logos/22.jpg', 21),
(849, 8, 2, 'Ka-Bar', '/Ka-Bar', 'catalog/Logos/95.jpg', 19),
(850, 8, 2, 'Cold Steel', '/Cold-Steel', 'catalog/Logos/79.jpg', 20),
(847, 8, 2, 'Mikov', '/Mikov', 'catalog/Logos/MIKOV Logo.jpg', 17),
(848, 8, 2, 'Fox Knives', '/Fox-Knives', 'catalog/Logos/Fox Logo.jpg', 18),
(846, 8, 2, 'White River', '/White-River', 'catalog/Logos/White_River_Logo.jpg', 16),
(845, 8, 2, 'Cheburkov', 'HST-Cheburkov', 'catalog/Logos/cheburkov Logo.jpg', 15),
(843, 8, 2, 'Benchmade', '/HST-Benchmade', 'catalog/Logos/Benchmade-Knife-Company.jpg', 13),
(844, 8, 2, 'Schmiedeglut', '/Schmiedeglut', 'catalog/Logos/schmiedeglut_logo.jpg', 14),
(842, 8, 2, 'Kloetzli', '/Kloetzli', 'catalog/Logos/Kloetzli_Messerschmiede_vektor_m_Amboss.jpg', 12),
(841, 8, 2, 'Eickhorn', '/Eickhorn', 'catalog/Logos/69.jpg', 11),
(840, 8, 2, 'Spyderco', '/Spyderco', 'catalog/Logos/57.jpg', 10),
(839, 8, 2, 'FKMD', '/FKMD', 'catalog/Logos/13.jpg', 9),
(838, 8, 2, 'Forge de Laguiole', '/Forge-de-Laguiole', 'catalog/Logos/13 (2).jpg', 8),
(836, 8, 2, 'DNC', 'D-N-C', 'catalog/Logos/87.jpg', 6),
(837, 8, 2, 'Pohl Force', '/Pohl-Force', 'catalog/Logos/46.jpg', 7),
(835, 8, 2, 'Extrema Ratio', '/Extrema-Ratio', 'catalog/Logos/88.jpg', 5),
(834, 8, 2, 'Zero Tolerance', '/Zero-Tolerance', 'catalog/Logos/83.jpg', 4),
(833, 8, 2, 'Nesmuk', '/HST-Nesmuk', 'catalog/Logos/46 (2).jpg', 3),
(832, 8, 2, 'Laguiole en Aubrac', '/laguiole-en-aubrac', 'catalog/0 Logo Hersteller/laugoile logo.png', 2),
(831, 8, 2, 'Boeker', '/Boeker', 'catalog/0 Logo Hersteller/boeker logo.png', 1),
(891, 7, 1, 'image2', '#', '', 2),
(892, 7, 1, 'image3', '', '', 3),
(893, 7, 1, 'image4', '', '', 4),
(890, 7, 1, 'image1', '#', '', 1),
(889, 7, 2, 'Waffen Bock ', '', 'catalog/header/waffen-bock_header_4.jpg', 0),
(888, 7, 2, 'Waffen Bock ', '', 'catalog/header/waffen-bock_header_3.jpg', 0),
(887, 7, 2, 'Waffen Bock ', '', 'catalog/header/waffen-bock_header_2.jpg', 0);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `oc_cart`
--

DROP TABLE IF EXISTS `oc_cart`;
CREATE TABLE `oc_cart` (
  `cart_id` int(11) UNSIGNED NOT NULL,
  `api_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `session_id` varchar(32) NOT NULL,
  `product_id` int(11) NOT NULL,
  `recurring_id` int(11) NOT NULL,
  `option` text NOT NULL,
  `quantity` int(5) NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `oc_cart`
--

INSERT INTO `oc_cart` (`cart_id`, `api_id`, `customer_id`, `session_id`, `product_id`, `recurring_id`, `option`, `quantity`, `date_added`) VALUES
(6, 0, 2, 'c8b16e0c0190d243a394010c2c96d01c', 307, 0, '[]', 1, '2018-04-23 15:32:05'),
(10, 0, 17, '16b576ab7ddf8e2e8c6c59191221a1e2', 431, 0, '[]', 1, '2018-11-09 10:44:18'),
(13, 0, 18, '4a89255a745c8cfb973f0aac737dda00', 61, 0, '[]', 1, '2018-11-16 14:48:01'),
(16, 0, 21, '88f032741b1f972779d89271ae0926ed', 125, 0, '[]', 1, '2018-11-22 09:15:54'),
(19, 0, 27, 'e7916936dca8d56c2d5667b412921067', 125, 0, '[]', 1, '2018-12-17 16:00:28'),
(23, 0, 36, '3983780040278e578325cb51e1f1d05e', 220, 0, '[]', 1, '2019-04-17 00:48:39'),
(28, 0, 41, '640d5a7017cfa4e76457534faf29c770', 346, 0, '[]', 1, '2019-05-07 00:17:58'),
(30, 0, 42, 'edc947bda7c9b65a8ece062801dbf79a', 918, 0, '[]', 1, '2019-05-21 18:37:50'),
(32, 0, 5, 'ab0d20bf0db0c220174f3eeefb1de91b', 943, 0, '[]', 1, '2019-05-23 11:15:01'),
(34, 0, 43, '712bd15df004af3fdd58e4108d413dfd', 603, 0, '[]', 1, '2019-05-24 20:50:26'),
(39, 0, 45, '9bc59fa064efb38636aa6018b08724fb', 434, 0, '[]', 1, '2019-06-01 02:44:27'),
(42, 0, 51, '883b8c3979afcecafaaeafe2a4f7f10d', 924, 0, '[]', 1, '2019-07-01 22:11:45'),
(49, 0, 52, '4ad63f36e75e80754f77454d05f1048e', 176, 0, '[]', 1, '2019-07-22 18:03:47'),
(51, 0, 56, 'aaebdcb177253066b31acb12a010eee4', 649, 0, '[]', 1, '2019-08-20 19:42:35'),
(53, 0, 61, '18025e1f902e73ddacd50bad33e40795', 382, 0, '[]', 1, '2019-09-08 20:27:47'),
(54, 0, 62, '3de8a954cf8b769f4fa42803fb8c950b', 560, 0, '[]', 1, '2019-09-24 07:58:03'),
(56, 0, 63, 'df1679e6937aa4cf124f24b9d5e5f4a2', 975, 0, '[]', 1, '2019-09-29 03:51:50'),
(63, 0, 66, 'cf4f303e6cc5e2145b1deb7fbbdb61a9', 528, 0, '[]', 1, '2019-10-11 22:55:45'),
(73, 0, 76, 'c8923066e36a232b3dba312a0a2753a1', 568, 0, '[]', 1, '2019-12-09 21:19:07'),
(76, 0, 78, '6d054db8b55ed6b2c7f633339259b258', 150, 0, '[]', 1, '2019-12-14 17:36:30'),
(84, 0, 79, 'aceaf5b11fb6c84b83985238097df3ce', 125, 0, '[]', 1, '2020-01-17 22:43:16'),
(86, 0, 84, 'c6361d74c0caf1342905788e46c51bf8', 516, 0, '[]', 1, '2020-01-30 13:31:08'),
(89, 0, 92, 'bb72ce02ef40cf5a0ec4f5c28095370e', 220, 0, '[]', 1, '2020-03-14 13:23:18'),
(92, 0, 94, 'a5c638014ce0d9867eaa894fb509843b', 71, 0, '[]', 1, '2020-03-31 17:37:34'),
(96, 0, 96, '4558cfa760855d30eaacba7fd69aa90f', 219, 0, '[]', 1, '2020-04-14 14:26:15'),
(115, 0, 99, '3d6cb345020ae0ecb8a805ca4a01a2f2', 211, 0, '[]', 1, '2020-04-30 23:33:29'),
(116, 0, 99, '3d6cb345020ae0ecb8a805ca4a01a2f2', 978, 0, '[]', 1, '2020-04-30 23:33:29'),
(119, 0, 105, '7199f3f2325a7da03eec1799305529ff', 233, 0, '[]', 1, '2020-05-07 17:42:27'),
(122, 0, 108, '02c474f1b4caa84f0741b8e7435ea02c', 219, 0, '[]', 1, '2020-05-11 12:45:37'),
(124, 0, 110, '4804d8c540fb7bc7af57233e7e6bba20', 1096, 0, '[]', 1, '2020-05-15 01:33:05'),
(131, 0, 111, '8ec913a7250472baaeb9bd1bdf9eb96a', 1026, 0, '[]', 1, '2020-05-22 15:49:39'),
(139, 0, 114, '83160d2915e46e6b97afbaa1873a3022', 961, 0, '[]', 1, '2020-07-12 16:50:50'),
(154, 0, 121, '1a92b1693142639a6217b9d524453c68', 978, 0, '[]', 1, '2020-07-14 22:39:18'),
(155, 0, 121, '1a92b1693142639a6217b9d524453c68', 1148, 0, '[]', 1, '2020-07-14 22:39:18'),
(159, 0, 117, '52e77b11211af76ba111fcb267521720', 1096, 0, '[]', 2, '2020-08-01 10:25:54'),
(165, 0, 127, 'db41c2c24af2f138b68d947b9ef54d44', 1090, 0, '[]', 1, '2020-08-09 12:10:53'),
(171, 0, 130, 'db47153244d25801ec7e43ec1f0166ac', 1156, 0, '[]', 1, '2020-08-19 21:42:54'),
(179, 0, 141, '51a534f537870989a00574afa544372d', 1156, 0, '[]', 1, '2020-10-03 21:20:13'),
(185, 0, 144, '9a7530cba964a4041990aa65de5165b8', 1226, 0, '[]', 1, '2020-10-12 12:29:13'),
(190, 0, 145, '14aed63f4464318a1490f09c7ad5404b', 1204, 0, '[]', 1, '2020-10-17 14:34:45'),
(193, 0, 147, 'f4ade3d312216008c93748833aa6dc76', 958, 0, '[]', 1, '2020-10-20 20:47:11'),
(199, 0, 116, '7bcfac046c9dd89ff1fee8549dc7cf96', 1127, 0, '[]', 1, '2020-10-30 08:14:42'),
(200, 0, 116, '7bcfac046c9dd89ff1fee8549dc7cf96', 1245, 0, '[]', 1, '2020-10-30 08:14:42');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `oc_category`
--

DROP TABLE IF EXISTS `oc_category`;
CREATE TABLE `oc_category` (
  `category_id` int(11) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `parent_id` int(11) NOT NULL DEFAULT 0,
  `top` tinyint(1) NOT NULL,
  `column` int(3) NOT NULL,
  `sort_order` int(3) NOT NULL DEFAULT 0,
  `status` tinyint(1) NOT NULL,
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `oc_category`
--

INSERT INTO `oc_category` (`category_id`, `image`, `parent_id`, `top`, `column`, `sort_order`, `status`, `date_added`, `date_modified`) VALUES
(160, '', 0, 1, 1, 0, 1, '2020-12-08 14:03:45', '2020-12-09 12:24:44'),
(161, '', 0, 1, 1, 0, 1, '2020-12-08 16:57:19', '2020-12-09 12:36:06'),
(162, '', 0, 1, 1, 0, 1, '2020-12-08 16:57:40', '2020-12-09 12:36:48'),
(163, '', 0, 1, 1, 0, 1, '2020-12-08 16:58:05', '2020-12-14 14:44:48'),
(169, '', 160, 0, 1, 0, 1, '2020-12-08 17:09:24', '2020-12-08 17:09:24'),
(168, '', 160, 0, 1, 0, 1, '2020-12-08 17:06:34', '2020-12-08 17:06:34'),
(166, '', 160, 0, 1, 0, 1, '2020-12-08 17:01:00', '2020-12-08 17:46:55'),
(167, '', 160, 0, 1, 0, 1, '2020-12-08 17:05:53', '2020-12-08 17:05:53'),
(170, '', 0, 0, 1, 0, 1, '2020-12-08 17:09:57', '2020-12-14 14:45:21'),
(171, '', 161, 0, 1, 0, 1, '2020-12-08 17:10:45', '2020-12-08 17:10:45'),
(172, '', 162, 0, 1, 0, 1, '2020-12-08 17:11:28', '2020-12-08 17:11:28'),
(173, '', 162, 0, 1, 0, 1, '2020-12-08 17:12:00', '2020-12-08 17:12:00'),
(174, '', 162, 0, 1, 0, 1, '2020-12-08 17:12:24', '2020-12-08 17:12:24'),
(176, '', 163, 0, 1, 0, 1, '2020-12-08 17:14:18', '2020-12-08 17:14:18'),
(177, '', 163, 0, 1, 0, 1, '2020-12-08 17:14:59', '2020-12-08 17:14:59'),
(178, '', 176, 0, 1, 0, 1, '2020-12-08 17:16:08', '2020-12-08 17:16:08'),
(179, '', 176, 0, 1, 0, 1, '2020-12-08 17:17:25', '2020-12-08 17:17:25'),
(180, '', 176, 0, 1, 0, 1, '2020-12-08 17:17:59', '2020-12-08 17:17:59'),
(181, '', 177, 0, 1, 0, 1, '2020-12-08 17:18:37', '2020-12-08 17:18:37'),
(182, '', 176, 0, 1, 0, 1, '2020-12-08 17:23:26', '2020-12-08 17:23:26'),
(183, '', 168, 0, 1, 0, 1, '2020-12-08 17:24:40', '2020-12-08 17:24:40'),
(184, '', 166, 0, 1, 0, 1, '2020-12-08 17:47:25', '2020-12-08 17:47:25'),
(185, '', 169, 0, 1, 0, 1, '2020-12-08 17:47:49', '2020-12-08 17:47:49'),
(186, '', 171, 0, 1, 0, 1, '2020-12-08 17:48:34', '2020-12-08 17:48:34'),
(187, '', 170, 0, 1, 0, 1, '2020-12-08 17:48:55', '2020-12-08 17:48:55'),
(188, '', 170, 0, 1, 0, 1, '2020-12-08 17:49:16', '2020-12-08 17:49:16'),
(189, '', 170, 0, 1, 0, 1, '2020-12-08 17:49:44', '2020-12-08 17:49:44'),
(190, '', 187, 0, 1, 0, 1, '2020-12-08 17:50:15', '2020-12-08 17:50:15'),
(193, '', 188, 0, 1, 0, 1, '2020-12-08 17:51:55', '2020-12-08 17:51:55'),
(194, '', 189, 0, 1, 0, 1, '2020-12-08 17:52:21', '2020-12-08 17:52:21'),
(195, '', 172, 0, 1, 0, 1, '2020-12-08 17:53:12', '2020-12-08 17:53:12'),
(196, '', 173, 0, 1, 0, 1, '2020-12-08 17:53:29', '2020-12-09 16:53:26'),
(197, '', 174, 0, 1, 0, 1, '2020-12-08 17:53:47', '2020-12-08 17:53:47'),
(198, '', 180, 0, 1, 0, 1, '2020-12-08 17:54:36', '2020-12-08 17:54:36'),
(199, '', 182, 0, 1, 0, 1, '2020-12-08 17:54:57', '2020-12-08 17:54:57'),
(200, '', 179, 0, 1, 0, 1, '2020-12-08 17:55:27', '2020-12-08 17:55:27'),
(201, '', 178, 0, 1, 0, 1, '2020-12-08 17:56:15', '2020-12-08 17:56:15'),
(202, '', 181, 0, 1, 0, 1, '2020-12-08 17:56:52', '2020-12-08 17:56:52'),
(203, '', 168, 0, 1, 0, 1, '2020-12-08 17:58:29', '2020-12-08 17:58:29'),
(204, '', 167, 0, 1, 0, 1, '2020-12-08 17:58:45', '2020-12-08 17:58:45'),
(205, '', 167, 0, 1, 0, 1, '2020-12-08 17:59:19', '2020-12-08 17:59:19'),
(206, '', 166, 0, 1, 0, 1, '2020-12-08 17:59:41', '2020-12-08 17:59:41'),
(207, '', 169, 0, 1, 0, 1, '2020-12-08 18:00:03', '2020-12-08 18:00:03'),
(208, '', 187, 0, 1, 0, 1, '2020-12-08 18:00:25', '2020-12-08 18:00:25'),
(209, '', 188, 0, 1, 0, 1, '2020-12-08 18:00:40', '2020-12-08 18:00:40'),
(210, '', 189, 0, 1, 0, 1, '2020-12-08 18:00:56', '2020-12-08 18:00:56'),
(211, '', 171, 0, 1, 0, 1, '2020-12-08 18:01:20', '2020-12-08 18:01:20'),
(212, '', 172, 0, 1, 0, 1, '2020-12-08 18:01:46', '2020-12-08 18:01:46'),
(213, '', 173, 0, 1, 0, 1, '2020-12-08 18:07:51', '2020-12-08 18:07:51'),
(214, '', 174, 0, 1, 0, 1, '2020-12-08 18:08:06', '2020-12-08 18:08:06'),
(215, '', 180, 0, 1, 0, 1, '2020-12-08 18:08:32', '2020-12-08 18:08:32'),
(216, '', 178, 0, 1, 0, 1, '2020-12-08 18:08:51', '2020-12-08 18:08:51'),
(217, '', 179, 0, 1, 0, 1, '2020-12-08 18:09:06', '2020-12-08 18:09:06'),
(218, '', 182, 0, 1, 0, 1, '2020-12-08 18:09:21', '2020-12-08 18:09:21'),
(219, '', 0, 1, 1, 0, 1, '2020-12-08 18:09:53', '2020-12-09 12:36:33'),
(220, '', 168, 0, 1, 0, 1, '2020-12-08 18:10:17', '2020-12-08 18:10:17'),
(221, '', 167, 0, 1, 0, 1, '2020-12-08 18:10:43', '2020-12-08 18:10:43'),
(222, '', 166, 0, 1, 0, 1, '2020-12-08 18:10:58', '2020-12-08 18:10:58'),
(223, '', 169, 0, 1, 0, 1, '2020-12-08 18:11:19', '2020-12-08 18:11:19'),
(224, '', 187, 0, 1, 0, 1, '2020-12-08 18:12:03', '2020-12-08 18:12:03'),
(225, '', 188, 0, 1, 0, 1, '2020-12-08 18:12:20', '2020-12-08 18:12:20'),
(226, '', 189, 0, 1, 0, 1, '2020-12-08 18:12:44', '2020-12-08 18:12:44'),
(227, '', 171, 0, 1, 0, 1, '2020-12-08 18:13:12', '2020-12-08 18:13:49'),
(228, '', 172, 0, 1, 0, 1, '2020-12-08 18:14:10', '2020-12-08 18:14:10'),
(229, '', 173, 0, 1, 0, 1, '2020-12-08 18:14:25', '2020-12-08 18:14:25'),
(230, '', 174, 0, 1, 0, 1, '2020-12-08 18:14:41', '2020-12-08 18:14:41'),
(231, '', 177, 0, 1, 0, 1, '2020-12-08 18:15:26', '2020-12-08 18:17:00'),
(232, '', 163, 0, 1, 0, 1, '2020-12-08 18:15:46', '2020-12-08 18:15:46'),
(233, '', 178, 0, 1, 0, 1, '2020-12-08 18:16:07', '2020-12-08 18:16:07'),
(234, '', 176, 0, 1, 0, 1, '2020-12-08 18:18:27', '2020-12-08 18:19:17'),
(235, '', 178, 0, 1, 0, 1, '2020-12-08 18:18:46', '2020-12-08 18:18:46'),
(236, '', 0, 1, 1, 0, 1, '2020-12-09 10:14:25', '2020-12-09 12:37:27'),
(237, '', 168, 0, 1, 0, 1, '2020-12-09 10:14:40', '2020-12-09 10:14:40'),
(238, '', 167, 0, 1, 0, 1, '2020-12-09 10:14:55', '2020-12-09 10:14:55'),
(239, '', 166, 0, 1, 0, 1, '2020-12-09 10:15:09', '2020-12-09 10:15:09'),
(240, '', 169, 0, 1, 0, 1, '2020-12-09 10:15:26', '2020-12-09 10:15:26'),
(241, '', 187, 0, 1, 0, 1, '2020-12-09 10:15:56', '2020-12-09 10:15:56'),
(242, '', 188, 0, 1, 0, 1, '2020-12-09 10:16:09', '2020-12-09 10:16:09'),
(243, '', 189, 0, 1, 0, 1, '2020-12-09 10:16:21', '2020-12-09 10:16:21'),
(244, '', 171, 0, 1, 0, 1, '2020-12-09 10:16:43', '2020-12-09 10:16:43'),
(245, '', 172, 0, 1, 0, 1, '2020-12-09 10:16:58', '2020-12-09 10:16:58'),
(246, '', 173, 0, 1, 0, 1, '2020-12-09 10:17:12', '2020-12-09 10:17:12'),
(247, '', 174, 0, 1, 0, 1, '2020-12-09 10:17:28', '2020-12-09 10:17:28'),
(248, '', 177, 0, 1, 0, 1, '2020-12-09 10:18:31', '2020-12-09 10:18:31'),
(249, '', 176, 0, 1, 0, 1, '2020-12-09 10:18:43', '2020-12-09 10:18:43');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `oc_category_description`
--

DROP TABLE IF EXISTS `oc_category_description`;
CREATE TABLE `oc_category_description` (
  `category_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `meta_title` varchar(255) NOT NULL,
  `meta_description` varchar(255) NOT NULL,
  `meta_keyword` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `oc_category_description`
--

INSERT INTO `oc_category_description` (`category_id`, `language_id`, `name`, `description`, `meta_title`, `meta_description`, `meta_keyword`) VALUES
(160, 2, 'CO2 Waffen', '', 'CO2 Waffen', '', ''),
(161, 2, 'Luftdruckwaffen', '', 'Luftdruckwaffen', '', ''),
(161, 1, 'Luftdruckwaffen', '', 'Luftdruckwaffen', '', ''),
(162, 2, 'Schreckschusswaffen', '', 'Schreckschusswaffen', '', ''),
(162, 1, 'Schreckschusswaffen', '', 'Schreckschusswaffen', '', ''),
(163, 2, 'Soft Air Waffen ', '', 'Soft Air Waffen 6mm BB', '', ''),
(169, 2, '6mm Soft Air ', '', '6mm Soft Air ', '', ''),
(169, 1, '6mm Soft Air ', '', '6mm Soft Air ', '', ''),
(168, 2, '4,5mm Diabolo', '', '4,5mm Diabolo', '', ''),
(168, 1, '4,5mm Diabolo', '', '4,5mm Diabolo', '', ''),
(166, 2, '5,5mm Diabolo', '', '5,5mm ', '', ''),
(166, 1, '5,5mm', '', '5,5mm ', '', ''),
(167, 2, '4,5mm Stahl BB ', '', '4,5mm Stahl BB ', '', ''),
(167, 1, '4,5mm Stahl BB', '', '4,5mm Stahl BB ', '', ''),
(170, 2, 'T4E', '', 'T4E', '', ''),
(171, 2, '4,5mm Diabolo', '', '4,5mm Diabolo', '', ''),
(171, 1, '4,5mm Diabolo', '', '4,5mm Diabolo', '', ''),
(172, 2, '6mm Flobert', '', '6mm Flobert', '', ''),
(172, 1, '6mm Flobert', '', '6mm Flobert', '', ''),
(173, 2, '9mm P.A.K.', '', '9mm P.A.K.', '', ''),
(173, 1, '9mm P.A.K.', '', '9mm P.A.K.', '', ''),
(174, 2, '9mm R', '', '9mm R', '', ''),
(174, 1, '9mm R', '', '9mm R', '', ''),
(176, 2, '&gt; 0,5Joule ab 18 Jahren', '', '&gt; 0,5Joule ab 18 Jahren', '', ''),
(176, 1, '&gt; 0,5Joule ab 18 Jahren', '', '&gt; 0,5Joule ab 18 Jahren', '', ''),
(177, 2, 'bis 0,5 Joule ab 14 Jahren', '', 'bis 0,5 Joule ab 14 Jahren', '', ''),
(177, 1, 'bis 0,5 Joule ab 14 Jahren', '', 'bis 0,5 Joule ab 14 Jahren', '', ''),
(163, 1, 'Soft Air Waffen 6mm BB', '', 'Soft Air Waffen 6mm BB', '', ''),
(178, 2, 'Soft Air CO2', '', 'Soft Air CO2', '', ''),
(178, 1, 'Soft Air CO2', '', 'Soft Air CO2', '', ''),
(179, 2, 'Gas Blow Back (GBB)', '', 'Gas Blow Back (GBB)', '', ''),
(179, 1, 'Gas Blow Back (GBB)', '', 'Gas Blow Back (GBB)', '', ''),
(180, 2, 'Elektrisch (AEG)', '', 'Elektrisch (AEG)', '', ''),
(180, 1, 'Elektrisch (AEG)', '', 'Elektrisch (AEG)', '', ''),
(181, 2, 'Federdruck', '', 'Federdruck', '', ''),
(181, 1, 'Federdruck', '', 'Federdruck', '', ''),
(182, 2, 'Federdruck', '', 'Federdruck', '', ''),
(182, 1, 'Federdruck', '', 'Federdruck', '', ''),
(183, 2, 'Kurzwaffen', '', 'Kurzwaffen', '', ''),
(183, 1, 'Kurzwaffen', '', 'Kurzwaffen', '', ''),
(184, 2, 'Kurzwaffen', '', 'Kurzwaffen', '', ''),
(184, 1, 'Kurzwaffen', '', 'Kurzwaffen', '', ''),
(185, 2, 'Kurzwaffen', '', 'Kurzwaffen', '', ''),
(185, 1, 'Kurzwaffen', '', 'Kurzwaffen', '', ''),
(186, 2, 'Kurzwaffen', '', 'Kurzwaffen', '', ''),
(186, 1, 'Kurzwaffen', '', 'Kurzwaffen', '', ''),
(187, 2, 'Kal. 43', '', 'Kal. 43', '', ''),
(187, 1, 'Kal. 43', '', 'Kal. 43', '', ''),
(188, 2, 'Kal. 50', '', 'Kal. 50', '', ''),
(188, 1, 'Kal. 50', '', 'Kal. 50', '', ''),
(189, 2, 'Kal. 68', '', 'Kal. 68', '', ''),
(189, 1, 'Kal. 68', '', 'Kal. 68', '', ''),
(190, 2, 'Kurzwaffen', '', 'Kurzwaffen', '', ''),
(190, 1, 'Kurzwaffen', '', 'Kurzwaffen', '', ''),
(170, 1, 'T4E', '', 'T4E', '', ''),
(193, 2, 'Kurzwaffen', '', 'Kurzwaffen', '', ''),
(193, 1, 'Kurzwaffen', '', 'Kurzwaffen', '', ''),
(194, 2, 'Kurzwaffen', '', 'Kurzwaffen', '', ''),
(194, 1, 'Kurzwaffen', '', 'Kurzwaffen', '', ''),
(195, 2, 'Kurzwaffen', '', 'Kurzwaffen', '', ''),
(195, 1, 'Kurzwaffen', '', 'Kurzwaffen', '', ''),
(196, 2, 'Kurzwaffen', '', 'Kurzwaffen', '', ''),
(197, 2, 'Kurzwaffen', '', 'Kurzwaffen', '', ''),
(197, 1, 'Kurzwaffen', '', 'Kurzwaffen', '', ''),
(198, 2, 'Kurzwaffen', '', 'Kurzwaffen', '', ''),
(198, 1, 'Kurzwaffen', '', 'Kurzwaffen', '', ''),
(199, 2, 'Kurzwaffen', '', 'Kurzwaffen', '', ''),
(199, 1, 'Kurzwaffen', '', 'Kurzwaffen', '', ''),
(200, 2, 'Kurzwaffen', '', 'Kurzwaffen', '', ''),
(200, 1, 'Kurzwaffen', '', 'Kurzwaffen', '', ''),
(201, 2, 'Kurzwaffen', '', 'Kurzwaffen', '', ''),
(201, 1, 'Kurzwaffen', '', 'Kurzwaffen', '', ''),
(202, 2, 'Kurzwaffen', '', 'Kurzwaffen', '', ''),
(202, 1, 'Kurzwaffen', '', 'Kurzwaffen', '', ''),
(203, 2, 'Langwaffen', '', 'Langwaffen', '', ''),
(203, 1, 'Langwaffen', '', 'Langwaffen', '', ''),
(204, 2, 'Langwaffen', '', 'Langwaffen', '', ''),
(204, 1, 'Langwaffen', '', 'Langwaffen', '', ''),
(205, 2, 'Kurzwaffen', '', 'Kurzwaffen', '', ''),
(205, 1, 'Kurzwaffen', '', 'Kurzwaffen', '', ''),
(206, 2, 'Langwaffen', '', 'Langwaffen', '', ''),
(206, 1, 'Langwaffen', '', 'Langwaffen', '', ''),
(207, 2, 'Langwaffen', '', 'Langwaffen', '', ''),
(207, 1, 'Langwaffen', '', 'Langwaffen', '', ''),
(208, 2, 'Langwaffen', '', 'Langwaffen', '', ''),
(208, 1, 'Langwaffen', '', 'Langwaffen', '', ''),
(209, 2, 'Langwaffen', '', 'Langwaffen', '', ''),
(209, 1, 'Langwaffen', '', 'Langwaffen', '', ''),
(210, 2, 'Langwaffen', '', 'Langwaffen', '', ''),
(210, 1, 'Langwaffen', '', 'Langwaffen', '', ''),
(211, 2, 'Langwaffen', '', 'Langwaffen', '', ''),
(211, 1, 'Langwaffen', '', 'Langwaffen', '', ''),
(212, 2, 'Langwaffen', '', 'Langwaffen', '', ''),
(212, 1, 'Langwaffen', '', 'Langwaffen', '', ''),
(213, 2, 'Langwaffen', '', 'Langwaffen', '', ''),
(213, 1, 'Langwaffen', '', 'Langwaffen', '', ''),
(214, 2, 'Langwaffen', '', 'Langwaffen', '', ''),
(214, 1, 'Langwaffen', '', 'Langwaffen', '', ''),
(215, 2, 'Langwaffen', '', 'Langwaffen', '', ''),
(215, 1, 'Langwaffen', '', 'Langwaffen', '', ''),
(216, 2, 'Langwaffen', '', 'Langwaffen', '', ''),
(216, 1, 'Langwaffen', '', 'Langwaffen', '', ''),
(217, 2, 'Langwaffen', '', 'Langwaffen', '', ''),
(217, 1, 'Langwaffen', '', 'Langwaffen', '', ''),
(218, 2, 'Langwaffen', '', 'Langwaffen', '', ''),
(218, 1, 'Langwaffen', '', 'Langwaffen', '', ''),
(219, 2, 'Munition', '', 'Munition', '', ''),
(220, 2, 'Munition', '', 'Munition', '', ''),
(220, 1, 'Munition', '', 'Munition', '', ''),
(221, 2, 'Munition', '', 'Munition', '', ''),
(221, 1, 'Munition', '', 'Munition', '', ''),
(222, 2, 'Munition', '', 'Munition', '', ''),
(222, 1, 'Munition', '', 'Munition', '', ''),
(223, 2, 'Munition', '', 'Munition', '', ''),
(223, 1, 'Munition', '', 'Munition', '', ''),
(224, 2, 'Munition', '', 'Munition', '', ''),
(224, 1, 'Munition', '', 'Munition', '', ''),
(225, 2, 'Munition', '', 'Munition', '', ''),
(225, 1, 'Munition', '', 'Munition', '', ''),
(226, 2, 'Munition', '', 'Munition', '', ''),
(226, 1, 'Munition', '', 'Munition', '', ''),
(227, 2, 'Munition', '', 'Munition', '', ''),
(227, 1, 'Munition', '', 'Munition', '', ''),
(228, 2, 'Munition', '', 'Munition', '', ''),
(228, 1, 'Munition', '', 'Munition', '', ''),
(229, 2, 'Munition', '', 'Munition', '', ''),
(229, 1, 'Munition', '', 'Munition', '', ''),
(230, 2, 'Munition', '', 'Munition', '', ''),
(230, 1, 'Munition', '', 'Munition', '', ''),
(231, 2, 'Munition', '', 'Munition', '', ''),
(232, 2, 'Munition', '', 'Munition', '', ''),
(232, 1, 'Munition', '', 'Munition', '', ''),
(233, 2, 'Munition', '', 'Munition', '', ''),
(233, 1, 'Munition', '', 'Munition', '', ''),
(231, 1, 'Munition', '', 'Munition', '', ''),
(234, 2, 'Munition', '', 'Munition', '', ''),
(235, 2, 'Munition', '', 'Munition', '', ''),
(235, 1, 'Munition', '', 'Munition', '', ''),
(234, 1, 'Munition', '', 'Munition', '', ''),
(236, 2, 'Zubehör', '', 'Zubehör', '', ''),
(237, 2, 'Zubehör', '', 'Zubehör', '', ''),
(237, 1, 'Zubehör', '', 'Zubehör', '', ''),
(238, 2, 'Zubehör', '', 'Zubehör', '', ''),
(238, 1, 'Zubehör', '', 'Zubehör', '', ''),
(239, 2, 'Zubehör', '', 'Zubehör', '', ''),
(239, 1, 'Zubehör', '', 'Zubehör', '', ''),
(240, 2, 'Zubehör', '', 'Zubehör', '', ''),
(240, 1, 'Zubehör', '', 'Zubehör', '', ''),
(241, 2, 'Zubehör', '', 'Zubehör', '', ''),
(241, 1, 'Zubehör', '', 'Zubehör', '', ''),
(242, 2, 'Zubehör', '', 'Zubehör', '', ''),
(242, 1, 'Zubehör', '', 'Zubehör', '', ''),
(243, 2, 'Zubehör', '', 'Zubehör', '', ''),
(243, 1, 'Zubehör', '', 'Zubehör', '', ''),
(244, 2, 'Zubehör', '', 'Zubehör', '', ''),
(244, 1, 'Zubehör', '', 'Zubehör', '', ''),
(245, 2, 'Zubehör', '', 'Zubehör', '', ''),
(245, 1, 'Zubehör', '', 'Zubehör', '', ''),
(246, 2, 'Zubehör', '', 'Zubehör', '', ''),
(246, 1, 'Zubehör', '', 'Zubehör', '', ''),
(247, 2, 'Zubehör', '', 'Zubehör', '', ''),
(247, 1, 'Zubehör', '', 'Zubehör', '', ''),
(248, 2, 'Zubehör', '', 'Zubehör', '', ''),
(248, 1, 'Zubehör', '', 'Zubehör', '', ''),
(249, 2, 'Zubehör', '', 'Zubehör', '', ''),
(249, 1, 'Zubehör', '', 'Zubehör', '', ''),
(160, 1, 'CO2 Waffen', '', 'CO2 Waffen', '', ''),
(219, 1, 'Munition', '', 'Munition', '', ''),
(236, 1, 'Zubehör', '', 'Zubehör', '', ''),
(196, 1, 'Kurzwaffen', '', 'Kurzwaffen', '', '');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `oc_category_filter`
--

DROP TABLE IF EXISTS `oc_category_filter`;
CREATE TABLE `oc_category_filter` (
  `category_id` int(11) NOT NULL,
  `filter_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `oc_category_path`
--

DROP TABLE IF EXISTS `oc_category_path`;
CREATE TABLE `oc_category_path` (
  `category_id` int(11) NOT NULL,
  `path_id` int(11) NOT NULL,
  `level` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `oc_category_path`
--

INSERT INTO `oc_category_path` (`category_id`, `path_id`, `level`) VALUES
(160, 160, 0),
(161, 161, 0),
(162, 162, 0),
(163, 163, 0),
(169, 160, 0),
(169, 169, 1),
(168, 160, 0),
(168, 168, 1),
(166, 166, 1),
(166, 160, 0),
(167, 167, 1),
(167, 160, 0),
(170, 170, 0),
(171, 171, 1),
(171, 161, 0),
(172, 172, 1),
(172, 162, 0),
(173, 173, 1),
(173, 162, 0),
(174, 174, 1),
(174, 162, 0),
(176, 176, 1),
(176, 163, 0),
(177, 177, 1),
(177, 163, 0),
(178, 178, 2),
(178, 176, 1),
(178, 163, 0),
(179, 179, 2),
(179, 176, 1),
(179, 163, 0),
(180, 180, 2),
(180, 176, 1),
(180, 163, 0),
(181, 181, 2),
(181, 177, 1),
(181, 163, 0),
(182, 182, 2),
(182, 176, 1),
(182, 163, 0),
(183, 183, 2),
(183, 168, 1),
(183, 160, 0),
(184, 184, 2),
(184, 166, 1),
(184, 160, 0),
(185, 185, 2),
(185, 169, 1),
(185, 160, 0),
(186, 186, 2),
(186, 171, 1),
(186, 161, 0),
(187, 187, 1),
(187, 170, 0),
(188, 188, 1),
(188, 170, 0),
(189, 189, 1),
(189, 170, 0),
(190, 190, 2),
(190, 187, 1),
(190, 170, 0),
(193, 193, 2),
(193, 188, 1),
(193, 170, 0),
(194, 194, 2),
(194, 189, 1),
(194, 170, 0),
(195, 195, 2),
(195, 172, 1),
(195, 162, 0),
(196, 196, 2),
(196, 162, 0),
(196, 173, 1),
(197, 197, 2),
(197, 174, 1),
(197, 162, 0),
(198, 198, 3),
(198, 180, 2),
(198, 176, 1),
(198, 163, 0),
(199, 199, 3),
(199, 182, 2),
(199, 176, 1),
(199, 163, 0),
(200, 200, 3),
(200, 179, 2),
(200, 176, 1),
(200, 163, 0),
(201, 201, 3),
(201, 178, 2),
(201, 176, 1),
(201, 163, 0),
(202, 202, 3),
(202, 181, 2),
(202, 177, 1),
(202, 163, 0),
(203, 203, 2),
(203, 168, 1),
(203, 160, 0),
(204, 204, 2),
(204, 167, 1),
(204, 160, 0),
(205, 205, 2),
(205, 167, 1),
(205, 160, 0),
(206, 206, 2),
(206, 166, 1),
(206, 160, 0),
(207, 207, 2),
(207, 169, 1),
(207, 160, 0),
(208, 208, 2),
(208, 187, 1),
(208, 170, 0),
(209, 209, 2),
(209, 188, 1),
(209, 170, 0),
(210, 170, 0),
(210, 189, 1),
(210, 210, 2),
(211, 161, 0),
(211, 171, 1),
(211, 211, 2),
(212, 162, 0),
(212, 172, 1),
(212, 212, 2),
(213, 162, 0),
(213, 173, 1),
(213, 213, 2),
(214, 162, 0),
(214, 174, 1),
(214, 214, 2),
(215, 163, 0),
(215, 176, 1),
(215, 180, 2),
(215, 215, 3),
(216, 216, 3),
(216, 178, 2),
(216, 176, 1),
(216, 163, 0),
(217, 217, 3),
(217, 179, 2),
(217, 176, 1),
(217, 163, 0),
(218, 218, 3),
(218, 182, 2),
(218, 176, 1),
(218, 163, 0),
(219, 219, 0),
(220, 220, 2),
(220, 168, 1),
(220, 160, 0),
(221, 221, 2),
(221, 167, 1),
(221, 160, 0),
(222, 222, 2),
(222, 166, 1),
(222, 160, 0),
(223, 223, 2),
(223, 169, 1),
(223, 160, 0),
(224, 224, 2),
(224, 187, 1),
(224, 170, 0),
(225, 225, 2),
(225, 188, 1),
(225, 170, 0),
(226, 226, 2),
(226, 189, 1),
(226, 170, 0),
(227, 227, 2),
(227, 161, 0),
(227, 171, 1),
(228, 228, 2),
(228, 172, 1),
(228, 162, 0),
(229, 229, 2),
(229, 173, 1),
(229, 162, 0),
(230, 230, 2),
(230, 174, 1),
(230, 162, 0),
(234, 234, 2),
(231, 177, 1),
(231, 231, 2),
(231, 163, 0),
(232, 232, 1),
(232, 163, 0),
(233, 233, 3),
(233, 178, 2),
(233, 176, 1),
(233, 163, 0),
(234, 163, 0),
(235, 235, 3),
(235, 178, 2),
(235, 176, 1),
(235, 163, 0),
(234, 176, 1),
(236, 236, 0),
(237, 237, 2),
(237, 168, 1),
(237, 160, 0),
(238, 238, 2),
(238, 167, 1),
(238, 160, 0),
(239, 239, 2),
(239, 166, 1),
(239, 160, 0),
(240, 240, 2),
(240, 169, 1),
(240, 160, 0),
(241, 241, 2),
(241, 187, 1),
(241, 170, 0),
(242, 242, 2),
(242, 188, 1),
(242, 170, 0),
(243, 243, 2),
(243, 189, 1),
(243, 170, 0),
(244, 244, 2),
(244, 171, 1),
(244, 161, 0),
(245, 245, 2),
(245, 172, 1),
(245, 162, 0),
(246, 246, 2),
(246, 173, 1),
(246, 162, 0),
(247, 247, 2),
(247, 174, 1),
(247, 162, 0),
(248, 163, 0),
(248, 177, 1),
(248, 248, 2),
(249, 163, 0),
(249, 176, 1),
(249, 249, 2);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `oc_category_to_layout`
--

DROP TABLE IF EXISTS `oc_category_to_layout`;
CREATE TABLE `oc_category_to_layout` (
  `category_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  `layout_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `oc_category_to_layout`
--

INSERT INTO `oc_category_to_layout` (`category_id`, `store_id`, `layout_id`) VALUES
(160, 0, 0),
(161, 0, 0),
(162, 0, 0),
(163, 0, 0),
(169, 0, 0),
(168, 0, 0),
(166, 0, 0),
(167, 0, 0),
(170, 0, 0),
(171, 0, 0),
(172, 0, 0),
(173, 0, 0),
(174, 0, 0),
(176, 0, 0),
(177, 0, 0),
(178, 0, 0),
(179, 0, 0),
(180, 0, 0),
(181, 0, 0),
(182, 0, 0),
(183, 0, 0),
(184, 0, 0),
(185, 0, 0),
(186, 0, 0),
(187, 0, 0),
(188, 0, 0),
(189, 0, 0),
(190, 0, 0),
(193, 0, 0),
(194, 0, 0),
(195, 0, 0),
(196, 0, 0),
(197, 0, 0),
(198, 0, 0),
(199, 0, 0),
(200, 0, 0),
(201, 0, 0),
(202, 0, 0),
(203, 0, 0),
(204, 0, 0),
(205, 0, 0),
(206, 0, 0),
(207, 0, 0),
(208, 0, 0),
(209, 0, 0),
(210, 0, 0),
(211, 0, 0),
(212, 0, 0),
(213, 0, 0),
(214, 0, 0),
(215, 0, 0),
(216, 0, 0),
(217, 0, 0),
(218, 0, 0),
(219, 0, 0),
(220, 0, 0),
(221, 0, 0),
(222, 0, 0),
(223, 0, 0),
(224, 0, 0),
(225, 0, 0),
(226, 0, 0),
(227, 0, 0),
(228, 0, 0),
(229, 0, 0),
(230, 0, 0),
(231, 0, 0),
(232, 0, 0),
(233, 0, 0),
(234, 0, 0),
(235, 0, 0),
(236, 0, 0),
(237, 0, 0),
(238, 0, 0),
(239, 0, 0),
(240, 0, 0),
(241, 0, 0),
(242, 0, 0),
(243, 0, 0),
(244, 0, 0),
(245, 0, 0),
(246, 0, 0),
(247, 0, 0),
(248, 0, 0),
(249, 0, 0);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `oc_category_to_store`
--

DROP TABLE IF EXISTS `oc_category_to_store`;
CREATE TABLE `oc_category_to_store` (
  `category_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `oc_category_to_store`
--

INSERT INTO `oc_category_to_store` (`category_id`, `store_id`) VALUES
(160, 0),
(161, 0),
(162, 0),
(163, 0),
(166, 0),
(167, 0),
(168, 0),
(169, 0),
(170, 0),
(171, 0),
(172, 0),
(173, 0),
(174, 0),
(176, 0),
(177, 0),
(178, 0),
(179, 0),
(180, 0),
(181, 0),
(182, 0),
(183, 0),
(184, 0),
(185, 0),
(186, 0),
(187, 0),
(188, 0),
(189, 0),
(190, 0),
(193, 0),
(194, 0),
(195, 0),
(196, 0),
(197, 0),
(198, 0),
(199, 0),
(200, 0),
(201, 0),
(202, 0),
(203, 0),
(204, 0),
(205, 0),
(206, 0),
(207, 0),
(208, 0),
(209, 0),
(210, 0),
(211, 0),
(212, 0),
(213, 0),
(214, 0),
(215, 0),
(216, 0),
(217, 0),
(218, 0),
(219, 0),
(220, 0),
(221, 0),
(222, 0),
(223, 0),
(224, 0),
(225, 0),
(226, 0),
(227, 0),
(228, 0),
(229, 0),
(230, 0),
(231, 0),
(232, 0),
(233, 0),
(234, 0),
(235, 0),
(236, 0),
(237, 0),
(238, 0),
(239, 0),
(240, 0),
(241, 0),
(242, 0),
(243, 0),
(244, 0),
(245, 0),
(246, 0),
(247, 0),
(248, 0),
(249, 0);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `oc_country`
--

DROP TABLE IF EXISTS `oc_country`;
CREATE TABLE `oc_country` (
  `country_id` int(11) NOT NULL,
  `name` varchar(128) NOT NULL,
  `iso_code_2` varchar(2) NOT NULL,
  `iso_code_3` varchar(3) NOT NULL,
  `address_format` text NOT NULL,
  `postcode_required` tinyint(1) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `oc_country`
--

INSERT INTO `oc_country` (`country_id`, `name`, `iso_code_2`, `iso_code_3`, `address_format`, `postcode_required`, `status`) VALUES
(1, 'Afghanistan', 'AF', 'AFG', '', 0, 0),
(2, 'Albania', 'AL', 'ALB', '', 0, 0),
(3, 'Algeria', 'DZ', 'DZA', '', 0, 0),
(4, 'American Samoa', 'AS', 'ASM', '', 0, 0),
(5, 'Andorra', 'AD', 'AND', '', 0, 0),
(6, 'Angola', 'AO', 'AGO', '', 0, 0),
(7, 'Anguilla', 'AI', 'AIA', '', 0, 0),
(8, 'Antarctica', 'AQ', 'ATA', '', 0, 0),
(9, 'Antigua and Barbuda', 'AG', 'ATG', '', 0, 0),
(10, 'Argentina', 'AR', 'ARG', '', 0, 0),
(11, 'Armenia', 'AM', 'ARM', '', 0, 0),
(12, 'Aruba', 'AW', 'ABW', '', 0, 0),
(13, 'Australia', 'AU', 'AUS', '', 0, 0),
(14, 'Austria', 'AT', 'AUT', '', 0, 1),
(15, 'Azerbaijan', 'AZ', 'AZE', '', 0, 0),
(16, 'Bahamas', 'BS', 'BHS', '', 0, 0),
(17, 'Bahrain', 'BH', 'BHR', '', 0, 0),
(18, 'Bangladesh', 'BD', 'BGD', '', 0, 0),
(19, 'Barbados', 'BB', 'BRB', '', 0, 0),
(20, 'Belarus', 'BY', 'BLR', '', 0, 0),
(21, 'Belgium', 'BE', 'BEL', '{firstname} {lastname}\r\n{company}\r\n{address_1}\r\n{address_2}\r\n{postcode} {city}\r\n{country}', 0, 1),
(22, 'Belize', 'BZ', 'BLZ', '', 0, 0),
(23, 'Benin', 'BJ', 'BEN', '', 0, 0),
(24, 'Bermuda', 'BM', 'BMU', '', 0, 0),
(25, 'Bhutan', 'BT', 'BTN', '', 0, 0),
(26, 'Bolivia', 'BO', 'BOL', '', 0, 0),
(27, 'Bosnia and Herzegovina', 'BA', 'BIH', '', 0, 0),
(28, 'Botswana', 'BW', 'BWA', '', 0, 0),
(29, 'Bouvet Island', 'BV', 'BVT', '', 0, 0),
(30, 'Brazil', 'BR', 'BRA', '', 0, 0),
(31, 'British Indian Ocean Territory', 'IO', 'IOT', '', 0, 0),
(32, 'Brunei Darussalam', 'BN', 'BRN', '', 0, 0),
(33, 'Bulgaria', 'BG', 'BGR', '', 0, 1),
(34, 'Burkina Faso', 'BF', 'BFA', '', 0, 0),
(35, 'Burundi', 'BI', 'BDI', '', 0, 0),
(36, 'Cambodia', 'KH', 'KHM', '', 0, 0),
(37, 'Cameroon', 'CM', 'CMR', '', 0, 0),
(38, 'Canada', 'CA', 'CAN', '', 0, 0),
(39, 'Cape Verde', 'CV', 'CPV', '', 0, 0),
(40, 'Cayman Islands', 'KY', 'CYM', '', 0, 0),
(41, 'Central African Republic', 'CF', 'CAF', '', 0, 0),
(42, 'Chad', 'TD', 'TCD', '', 0, 0),
(43, 'Chile', 'CL', 'CHL', '', 0, 0),
(44, 'China', 'CN', 'CHN', '', 0, 0),
(45, 'Christmas Island', 'CX', 'CXR', '', 0, 0),
(46, 'Cocos (Keeling) Islands', 'CC', 'CCK', '', 0, 0),
(47, 'Colombia', 'CO', 'COL', '', 0, 0),
(48, 'Comoros', 'KM', 'COM', '', 0, 0),
(49, 'Congo', 'CG', 'COG', '', 0, 0),
(50, 'Cook Islands', 'CK', 'COK', '', 0, 0),
(51, 'Costa Rica', 'CR', 'CRI', '', 0, 0),
(52, 'Cote D\'Ivoire', 'CI', 'CIV', '', 0, 0),
(53, 'Croatia', 'HR', 'HRV', '', 0, 1),
(54, 'Cuba', 'CU', 'CUB', '', 0, 0),
(55, 'Cyprus', 'CY', 'CYP', '', 0, 0),
(56, 'Czech Republic', 'CZ', 'CZE', '', 0, 1),
(57, 'Denmark', 'DK', 'DNK', '', 0, 1),
(58, 'Djibouti', 'DJ', 'DJI', '', 0, 0),
(59, 'Dominica', 'DM', 'DMA', '', 0, 0),
(60, 'Dominican Republic', 'DO', 'DOM', '', 0, 0),
(61, 'East Timor', 'TL', 'TLS', '', 0, 0),
(62, 'Ecuador', 'EC', 'ECU', '', 0, 0),
(63, 'Egypt', 'EG', 'EGY', '', 0, 0),
(64, 'El Salvador', 'SV', 'SLV', '', 0, 0),
(65, 'Equatorial Guinea', 'GQ', 'GNQ', '', 0, 0),
(66, 'Eritrea', 'ER', 'ERI', '', 0, 0),
(67, 'Estonia', 'EE', 'EST', '', 0, 1),
(68, 'Ethiopia', 'ET', 'ETH', '', 0, 0),
(69, 'Falkland Islands (Malvinas)', 'FK', 'FLK', '', 0, 0),
(70, 'Faroe Islands', 'FO', 'FRO', '', 0, 0),
(71, 'Fiji', 'FJ', 'FJI', '', 0, 0),
(72, 'Finland', 'FI', 'FIN', '', 0, 1),
(74, 'France, Metropolitan', 'FR', 'FRA', '{firstname} {lastname}\r\n{company}\r\n{address_1}\r\n{address_2}\r\n{postcode} {city}\r\n{country}', 0, 1),
(75, 'French Guiana', 'GF', 'GUF', '', 1, 0),
(76, 'French Polynesia', 'PF', 'PYF', '', 0, 0),
(77, 'French Southern Territories', 'TF', 'ATF', '', 0, 0),
(78, 'Gabon', 'GA', 'GAB', '', 0, 0),
(79, 'Gambia', 'GM', 'GMB', '', 0, 0),
(80, 'Georgia', 'GE', 'GEO', '', 0, 0),
(81, 'Germany', 'DE', 'DEU', '{company}\r\n{firstname} {lastname}\r\n{address_1}\r\n{address_2}\r\n{postcode} {city}\r\n{country}', 0, 1),
(82, 'Ghana', 'GH', 'GHA', '', 0, 0),
(83, 'Gibraltar', 'GI', 'GIB', '', 0, 0),
(84, 'Greece', 'GR', 'GRC', '', 0, 1),
(85, 'Greenland', 'GL', 'GRL', '', 0, 0),
(86, 'Grenada', 'GD', 'GRD', '', 0, 0),
(87, 'Guadeloupe', 'GP', 'GLP', '', 0, 0),
(88, 'Guam', 'GU', 'GUM', '', 0, 0),
(89, 'Guatemala', 'GT', 'GTM', '', 0, 0),
(90, 'Guinea', 'GN', 'GIN', '', 0, 0),
(91, 'Guinea-Bissau', 'GW', 'GNB', '', 0, 0),
(92, 'Guyana', 'GY', 'GUY', '', 0, 0),
(93, 'Haiti', 'HT', 'HTI', '', 0, 0),
(94, 'Heard and Mc Donald Islands', 'HM', 'HMD', '', 0, 0),
(95, 'Honduras', 'HN', 'HND', '', 0, 0),
(96, 'Hong Kong', 'HK', 'HKG', '', 0, 0),
(97, 'Hungary', 'HU', 'HUN', '', 0, 1),
(98, 'Iceland', 'IS', 'ISL', '', 0, 0),
(99, 'India', 'IN', 'IND', '', 0, 0),
(100, 'Indonesia', 'ID', 'IDN', '', 0, 0),
(101, 'Iran (Islamic Republic of)', 'IR', 'IRN', '', 0, 0),
(102, 'Iraq', 'IQ', 'IRQ', '', 0, 0),
(103, 'Ireland', 'IE', 'IRL', '', 0, 1),
(104, 'Israel', 'IL', 'ISR', '', 0, 0),
(105, 'Italy', 'IT', 'ITA', '', 0, 1),
(106, 'Jamaica', 'JM', 'JAM', '', 0, 0),
(107, 'Japan', 'JP', 'JPN', '', 0, 0),
(108, 'Jordan', 'JO', 'JOR', '', 0, 0),
(109, 'Kazakhstan', 'KZ', 'KAZ', '', 0, 0),
(110, 'Kenya', 'KE', 'KEN', '', 0, 0),
(111, 'Kiribati', 'KI', 'KIR', '', 0, 0),
(112, 'North Korea', 'KP', 'PRK', '', 0, 0),
(113, 'South Korea', 'KR', 'KOR', '', 0, 0),
(114, 'Kuwait', 'KW', 'KWT', '', 0, 0),
(115, 'Kyrgyzstan', 'KG', 'KGZ', '', 0, 0),
(116, 'Lao People\'s Democratic Republic', 'LA', 'LAO', '', 0, 0),
(117, 'Latvia', 'LV', 'LVA', '', 0, 1),
(118, 'Lebanon', 'LB', 'LBN', '', 0, 0),
(119, 'Lesotho', 'LS', 'LSO', '', 0, 0),
(120, 'Liberia', 'LR', 'LBR', '', 0, 0),
(121, 'Libyan Arab Jamahiriya', 'LY', 'LBY', '', 0, 0),
(122, 'Liechtenstein', 'LI', 'LIE', '', 0, 0),
(123, 'Lithuania', 'LT', 'LTU', '', 0, 1),
(124, 'Luxembourg', 'LU', 'LUX', '', 0, 1),
(125, 'Macau', 'MO', 'MAC', '', 0, 0),
(126, 'FYROM', 'MK', 'MKD', '', 0, 0),
(127, 'Madagascar', 'MG', 'MDG', '', 0, 0),
(128, 'Malawi', 'MW', 'MWI', '', 0, 0),
(129, 'Malaysia', 'MY', 'MYS', '', 0, 0),
(130, 'Maldives', 'MV', 'MDV', '', 0, 0),
(131, 'Mali', 'ML', 'MLI', '', 0, 0),
(132, 'Malta', 'MT', 'MLT', '', 0, 1),
(133, 'Marshall Islands', 'MH', 'MHL', '', 0, 0),
(134, 'Martinique', 'MQ', 'MTQ', '', 0, 0),
(135, 'Mauritania', 'MR', 'MRT', '', 0, 0),
(136, 'Mauritius', 'MU', 'MUS', '', 0, 0),
(137, 'Mayotte', 'YT', 'MYT', '', 0, 0),
(138, 'Mexico', 'MX', 'MEX', '', 0, 0),
(139, 'Micronesia, Federated States of', 'FM', 'FSM', '', 0, 0),
(140, 'Moldova, Republic of', 'MD', 'MDA', '', 0, 0),
(141, 'Monaco', 'MC', 'MCO', '', 0, 0),
(142, 'Mongolia', 'MN', 'MNG', '', 0, 0),
(143, 'Montserrat', 'MS', 'MSR', '', 0, 0),
(144, 'Morocco', 'MA', 'MAR', '', 0, 0),
(145, 'Mozambique', 'MZ', 'MOZ', '', 0, 0),
(146, 'Myanmar', 'MM', 'MMR', '', 0, 0),
(147, 'Namibia', 'NA', 'NAM', '', 0, 0),
(148, 'Nauru', 'NR', 'NRU', '', 0, 0),
(149, 'Nepal', 'NP', 'NPL', '', 0, 0),
(150, 'Netherlands', 'NL', 'NLD', '', 0, 1),
(151, 'Netherlands Antilles', 'AN', 'ANT', '', 0, 0),
(152, 'New Caledonia', 'NC', 'NCL', '', 0, 0),
(153, 'New Zealand', 'NZ', 'NZL', '', 0, 0),
(154, 'Nicaragua', 'NI', 'NIC', '', 0, 0),
(155, 'Niger', 'NE', 'NER', '', 0, 0),
(156, 'Nigeria', 'NG', 'NGA', '', 0, 0),
(157, 'Niue', 'NU', 'NIU', '', 0, 0),
(158, 'Norfolk Island', 'NF', 'NFK', '', 0, 0),
(159, 'Northern Mariana Islands', 'MP', 'MNP', '', 0, 0),
(160, 'Norway', 'NO', 'NOR', '', 0, 1),
(161, 'Oman', 'OM', 'OMN', '', 0, 0),
(162, 'Pakistan', 'PK', 'PAK', '', 0, 0),
(163, 'Palau', 'PW', 'PLW', '', 0, 0),
(164, 'Panama', 'PA', 'PAN', '', 0, 0),
(165, 'Papua New Guinea', 'PG', 'PNG', '', 0, 0),
(166, 'Paraguay', 'PY', 'PRY', '', 0, 0),
(167, 'Peru', 'PE', 'PER', '', 0, 0),
(168, 'Philippines', 'PH', 'PHL', '', 0, 0),
(169, 'Pitcairn', 'PN', 'PCN', '', 0, 0),
(170, 'Poland', 'PL', 'POL', '', 0, 1),
(171, 'Portugal', 'PT', 'PRT', '', 0, 1),
(172, 'Puerto Rico', 'PR', 'PRI', '', 0, 0),
(173, 'Qatar', 'QA', 'QAT', '', 0, 0),
(174, 'Reunion', 'RE', 'REU', '', 0, 0),
(175, 'Romania', 'RO', 'ROM', '', 0, 1),
(176, 'Russian Federation', 'RU', 'RUS', '', 0, 0),
(177, 'Rwanda', 'RW', 'RWA', '', 0, 0),
(178, 'Saint Kitts and Nevis', 'KN', 'KNA', '', 0, 0),
(179, 'Saint Lucia', 'LC', 'LCA', '', 0, 0),
(180, 'Saint Vincent and the Grenadines', 'VC', 'VCT', '', 0, 0),
(181, 'Samoa', 'WS', 'WSM', '', 0, 0),
(182, 'San Marino', 'SM', 'SMR', '', 0, 0),
(183, 'Sao Tome and Principe', 'ST', 'STP', '', 0, 0),
(184, 'Saudi Arabia', 'SA', 'SAU', '', 0, 0),
(185, 'Senegal', 'SN', 'SEN', '', 0, 0),
(186, 'Seychelles', 'SC', 'SYC', '', 0, 0),
(187, 'Sierra Leone', 'SL', 'SLE', '', 0, 0),
(188, 'Singapore', 'SG', 'SGP', '', 0, 0),
(189, 'Slovak Republic', 'SK', 'SVK', '{firstname} {lastname}\r\n{company}\r\n{address_1}\r\n{address_2}\r\n{city} {postcode}\r\n{zone}\r\n{country}', 0, 1),
(190, 'Slovenia', 'SI', 'SVN', '', 0, 1),
(191, 'Solomon Islands', 'SB', 'SLB', '', 0, 0),
(192, 'Somalia', 'SO', 'SOM', '', 0, 0),
(193, 'South Africa', 'ZA', 'ZAF', '', 0, 0),
(194, 'South Georgia &amp; South Sandwich Islands', 'GS', 'SGS', '', 0, 0),
(195, 'Spain', 'ES', 'ESP', '', 1, 1),
(196, 'Sri Lanka', 'LK', 'LKA', '', 0, 0),
(197, 'St. Helena', 'SH', 'SHN', '', 0, 0),
(198, 'St. Pierre and Miquelon', 'PM', 'SPM', '', 0, 0),
(199, 'Sudan', 'SD', 'SDN', '', 0, 0),
(200, 'Suriname', 'SR', 'SUR', '', 0, 0),
(201, 'Svalbard and Jan Mayen Islands', 'SJ', 'SJM', '', 0, 0),
(202, 'Swaziland', 'SZ', 'SWZ', '', 0, 0),
(203, 'Sweden', 'SE', 'SWE', '{company}\r\n{firstname} {lastname}\r\n{address_1}\r\n{address_2}\r\n{postcode} {city}\r\n{country}', 1, 1),
(204, 'Switzerland', 'CH', 'CHE', '', 0, 1),
(205, 'Syrian Arab Republic', 'SY', 'SYR', '', 0, 0),
(206, 'Taiwan', 'TW', 'TWN', '', 0, 0),
(207, 'Tajikistan', 'TJ', 'TJK', '', 0, 0),
(208, 'Tanzania, United Republic of', 'TZ', 'TZA', '', 0, 0),
(209, 'Thailand', 'TH', 'THA', '', 0, 0),
(210, 'Togo', 'TG', 'TGO', '', 0, 0),
(211, 'Tokelau', 'TK', 'TKL', '', 0, 0),
(212, 'Tonga', 'TO', 'TON', '', 0, 0),
(213, 'Trinidad and Tobago', 'TT', 'TTO', '', 0, 0),
(214, 'Tunisia', 'TN', 'TUN', '', 0, 0),
(215, 'Turkey', 'TR', 'TUR', '', 0, 0),
(216, 'Turkmenistan', 'TM', 'TKM', '', 0, 0),
(217, 'Turks and Caicos Islands', 'TC', 'TCA', '', 0, 0),
(218, 'Tuvalu', 'TV', 'TUV', '', 0, 0),
(219, 'Uganda', 'UG', 'UGA', '', 0, 0),
(220, 'Ukraine', 'UA', 'UKR', '', 0, 0),
(221, 'United Arab Emirates', 'AE', 'ARE', '', 0, 0),
(222, 'United Kingdom', 'GB', 'GBR', '', 1, 1),
(223, 'United States', 'US', 'USA', '{firstname} {lastname}\r\n{company}\r\n{address_1}\r\n{address_2}\r\n{city}, {zone} {postcode}\r\n{country}', 0, 0),
(224, 'United States Minor Outlying Islands', 'UM', 'UMI', '', 0, 0),
(225, 'Uruguay', 'UY', 'URY', '', 0, 0),
(226, 'Uzbekistan', 'UZ', 'UZB', '', 0, 0),
(227, 'Vanuatu', 'VU', 'VUT', '', 0, 0),
(228, 'Vatican City State (Holy See)', 'VA', 'VAT', '', 0, 0),
(229, 'Venezuela', 'VE', 'VEN', '', 0, 0),
(230, 'Viet Nam', 'VN', 'VNM', '', 0, 0),
(231, 'Virgin Islands (British)', 'VG', 'VGB', '', 0, 0),
(232, 'Virgin Islands (U.S.)', 'VI', 'VIR', '', 0, 0),
(233, 'Wallis and Futuna Islands', 'WF', 'WLF', '', 0, 0),
(234, 'Western Sahara', 'EH', 'ESH', '', 0, 0),
(235, 'Yemen', 'YE', 'YEM', '', 0, 0),
(237, 'Democratic Republic of Congo', 'CD', 'COD', '', 0, 0),
(238, 'Zambia', 'ZM', 'ZMB', '', 0, 0),
(239, 'Zimbabwe', 'ZW', 'ZWE', '', 0, 0),
(242, 'Montenegro', 'ME', 'MNE', '', 0, 0),
(243, 'Serbia', 'RS', 'SRB', '', 0, 0),
(244, 'Aaland Islands', 'AX', 'ALA', '', 0, 0),
(245, 'Bonaire, Sint Eustatius and Saba', 'BQ', 'BES', '', 0, 0),
(246, 'Curacao', 'CW', 'CUW', '', 0, 0),
(247, 'Palestinian Territory, Occupied', 'PS', 'PSE', '', 0, 0),
(248, 'South Sudan', 'SS', 'SSD', '', 0, 0),
(249, 'St. Barthelemy', 'BL', 'BLM', '', 0, 0),
(250, 'St. Martin (French part)', 'MF', 'MAF', '', 0, 0),
(251, 'Canary Islands', 'IC', 'ICA', '', 0, 0),
(252, 'Ascension Island (British)', 'AC', 'ASC', '', 0, 0),
(253, 'Kosovo, Republic of', 'XK', 'UNK', '', 0, 0),
(254, 'Isle of Man', 'IM', 'IMN', '', 0, 0),
(255, 'Tristan da Cunha', 'TA', 'SHN', '', 0, 0),
(256, 'Guernsey', 'GG', 'GGY', '', 0, 0),
(257, 'Jersey', 'JE', 'JEY', '', 0, 0);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `oc_coupon`
--

DROP TABLE IF EXISTS `oc_coupon`;
CREATE TABLE `oc_coupon` (
  `coupon_id` int(11) NOT NULL,
  `name` varchar(128) NOT NULL,
  `code` varchar(20) NOT NULL,
  `type` char(1) NOT NULL,
  `discount` decimal(15,4) NOT NULL,
  `logged` tinyint(1) NOT NULL,
  `shipping` tinyint(1) NOT NULL,
  `total` decimal(15,4) NOT NULL,
  `date_start` date NOT NULL DEFAULT '0000-00-00',
  `date_end` date NOT NULL DEFAULT '0000-00-00',
  `uses_total` int(11) NOT NULL,
  `uses_customer` varchar(11) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `oc_coupon`
--

INSERT INTO `oc_coupon` (`coupon_id`, `name`, `code`, `type`, `discount`, `logged`, `shipping`, `total`, `date_start`, `date_end`, `uses_total`, `uses_customer`, `status`, `date_added`) VALUES
(4, '-10% Discount', '2222', 'P', '10.0000', 0, 0, '0.0000', '2014-01-01', '2020-01-01', 10, '10', 0, '2009-01-27 13:55:03'),
(5, 'Free Shipping', '3333', 'P', '0.0000', 0, 1, '100.0000', '2014-01-01', '2014-02-01', 10, '10', 0, '2009-03-14 21:13:53'),
(6, '-10.00 Discount', '1111', 'F', '10.0000', 0, 0, '10.0000', '2014-01-01', '2020-01-01', 100000, '10000', 0, '2009-03-14 21:15:18');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `oc_coupon_category`
--

DROP TABLE IF EXISTS `oc_coupon_category`;
CREATE TABLE `oc_coupon_category` (
  `coupon_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `oc_coupon_history`
--

DROP TABLE IF EXISTS `oc_coupon_history`;
CREATE TABLE `oc_coupon_history` (
  `coupon_history_id` int(11) NOT NULL,
  `coupon_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `amount` decimal(15,4) NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `oc_coupon_product`
--

DROP TABLE IF EXISTS `oc_coupon_product`;
CREATE TABLE `oc_coupon_product` (
  `coupon_product_id` int(11) NOT NULL,
  `coupon_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `oc_currency`
--

DROP TABLE IF EXISTS `oc_currency`;
CREATE TABLE `oc_currency` (
  `currency_id` int(11) NOT NULL,
  `title` varchar(32) NOT NULL,
  `code` varchar(3) NOT NULL,
  `symbol_left` varchar(12) NOT NULL,
  `symbol_right` varchar(12) NOT NULL,
  `decimal_place` char(1) NOT NULL,
  `value` float(15,8) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `date_modified` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `oc_currency`
--

INSERT INTO `oc_currency` (`currency_id`, `title`, `code`, `symbol_left`, `symbol_right`, `decimal_place`, `value`, `status`, `date_modified`) VALUES
(1, 'Pound Sterling', 'GBP', '£', '', '2', 0.89080000, 0, '2017-10-23 12:43:35'),
(2, 'US Dollar', 'USD', '$', '', '2', 1.17340004, 0, '2017-10-23 12:43:35'),
(3, 'Euro', 'EUR', '', '€', '2', 1.00000000, 1, '2020-12-23 04:15:36');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `oc_customer`
--

DROP TABLE IF EXISTS `oc_customer`;
CREATE TABLE `oc_customer` (
  `customer_id` int(11) NOT NULL,
  `customer_group_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL DEFAULT 0,
  `language_id` int(11) NOT NULL,
  `firstname` varchar(32) NOT NULL,
  `lastname` varchar(32) NOT NULL,
  `email` varchar(96) NOT NULL,
  `telephone` varchar(32) NOT NULL,
  `fax` varchar(32) NOT NULL,
  `password` varchar(40) NOT NULL,
  `salt` varchar(9) NOT NULL,
  `cart` text DEFAULT NULL,
  `wishlist` text DEFAULT NULL,
  `newsletter` tinyint(1) NOT NULL DEFAULT 0,
  `address_id` int(11) NOT NULL DEFAULT 0,
  `custom_field` text NOT NULL,
  `ip` varchar(40) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `approved` tinyint(1) NOT NULL,
  `safe` tinyint(1) NOT NULL,
  `token` text NOT NULL,
  `code` varchar(40) NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `oc_customer_activity`
--

DROP TABLE IF EXISTS `oc_customer_activity`;
CREATE TABLE `oc_customer_activity` (
  `customer_activity_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `key` varchar(64) NOT NULL,
  `data` text NOT NULL,
  `ip` varchar(40) NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `oc_customer_group`
--

DROP TABLE IF EXISTS `oc_customer_group`;
CREATE TABLE `oc_customer_group` (
  `customer_group_id` int(11) NOT NULL,
  `approval` int(1) NOT NULL,
  `sort_order` int(3) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `oc_customer_group`
--

INSERT INTO `oc_customer_group` (`customer_group_id`, `approval`, `sort_order`) VALUES
(1, 0, 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `oc_customer_group_description`
--

DROP TABLE IF EXISTS `oc_customer_group_description`;
CREATE TABLE `oc_customer_group_description` (
  `customer_group_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(32) NOT NULL,
  `description` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `oc_customer_group_description`
--

INSERT INTO `oc_customer_group_description` (`customer_group_id`, `language_id`, `name`, `description`) VALUES
(1, 1, 'Default', 'test'),
(1, 2, 'Default', 'test');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `oc_customer_history`
--

DROP TABLE IF EXISTS `oc_customer_history`;
CREATE TABLE `oc_customer_history` (
  `customer_history_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `comment` text NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `oc_customer_ip`
--

DROP TABLE IF EXISTS `oc_customer_ip`;
CREATE TABLE `oc_customer_ip` (
  `customer_ip_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `ip` varchar(40) NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `oc_customer_login`
--

DROP TABLE IF EXISTS `oc_customer_login`;
CREATE TABLE `oc_customer_login` (
  `customer_login_id` int(11) NOT NULL,
  `email` varchar(96) NOT NULL,
  `ip` varchar(40) NOT NULL,
  `total` int(4) NOT NULL,
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `oc_customer_login`
--

INSERT INTO `oc_customer_login` (`customer_login_id`, `email`, `ip`, `total`, `date_added`, `date_modified`) VALUES
(1, 'admin', '193.109.198.232', 1, '2018-05-30 03:59:09', '2018-05-30 03:59:09'),
(2, 'admin', '91.2.93.74', 1, '2018-06-15 11:16:32', '2018-06-15 11:16:32'),
(4, 'info@customweb.com', '212.90.201.186', 1, '2018-06-25 14:30:01', '2018-06-25 14:30:01'),
(5, 'xacffm@gmx.de', '95.222.212.188', 1, '2018-07-20 07:31:56', '2018-07-20 07:31:56'),
(7, '', '130.180.25.195', 1, '2018-07-23 07:57:02', '2018-07-23 07:57:02'),
(9, '', '188.96.94.48', 1, '2018-11-18 13:32:30', '2018-11-18 13:32:30'),
(11, 'ellitessy@zmail.website', '31.184.238.103', 1, '2018-12-05 00:25:39', '2018-12-05 00:25:39'),
(12, '', '2a02:8108:41c0:3118:8d54:9c67:fa1b:568a', 1, '2018-12-13 10:47:29', '2018-12-13 10:47:29'),
(13, 'springsiccc@gmail.com ', '77.118.0.28', 1, '2019-01-10 09:03:31', '2019-01-10 09:03:31'),
(15, 'bil.gersen@yandex.com', '213.166.71.35', 1, '2019-01-19 15:11:10', '2019-01-19 15:11:10'),
(16, 'jakhensel@yandex.com', '213.166.71.35', 1, '2019-01-23 11:54:49', '2019-01-23 11:54:49'),
(18, 'seba1978@gmx.net', '89.204.138.252', 2, '2019-02-08 02:28:38', '2019-02-08 02:28:49'),
(19, '', '2001:14bb:82:7bdb:b10d:5d6:8f8b:6314', 1, '2019-02-23 10:53:07', '2019-02-23 10:53:07'),
(20, 'bolersrik@yandex.com', '176.57.71.26', 1, '2019-02-24 15:11:40', '2019-02-24 15:11:40'),
(23, 'valerleohnard@yandex.com', '213.166.70.62', 1, '2019-04-16 02:31:37', '2019-04-16 02:31:37'),
(25, 'rafal.258@wp.pl', '77.207.51.161', 1, '2019-06-06 12:58:36', '2019-06-06 12:58:36'),
(26, 'friedrich.kipp@gmail.com', '2a02:810c:a40:22cc:d143:5eab:d00a:2578', 1, '2019-06-08 08:41:26', '2019-06-08 08:41:26'),
(27, 'heinrichsyannick0@gmail.com', '2003:d7:6bf5:e000:e19e:d087:f03b:a944', 1, '2019-06-11 20:36:14', '2019-06-11 20:36:14'),
(30, 'antonnaedler@gmx', '109.41.194.221', 1, '2019-06-25 15:42:11', '2019-06-25 15:42:11'),
(31, 'arne@aw-vlachtwerken.nl', '2a02:a454:9a7d:1:5d72:3b59:243f:2c30', 2, '2019-06-30 17:40:46', '2019-06-30 17:40:51'),
(33, 'm0rfaimmxgs@yandex.com', '85.209.90.108', 1, '2019-07-24 03:46:24', '2019-07-24 03:46:24'),
(35, 'noahschilling20@gmail.com', '194.166.85.26', 1, '2019-08-24 17:59:37', '2019-08-24 17:59:37'),
(36, 'thedarkclaw20029@gmail.com', '194.166.85.26', 2, '2019-08-24 18:00:57', '2019-08-24 18:01:02'),
(37, 'dmatheis@outlook.de', '84.241.65.219', 1, '2019-08-27 20:31:13', '2019-08-27 20:31:13'),
(38, 'ffdfgsjgieyriwffdf47895@gmail.com', '5.144.97.173', 1, '2019-09-12 22:35:57', '2019-09-12 22:35:57'),
(43, 'belyh75@thefmail.com', '5.144.97.173', 1, '2019-11-18 03:28:40', '2019-11-18 03:28:40'),
(44, 'aladyshkin70@thefmail.com', '5.144.97.173', 1, '2019-11-20 12:24:55', '2019-11-20 12:24:55'),
(45, 'zjablicev64@thefmail.com', '5.144.97.173', 1, '2019-11-22 01:32:41', '2019-11-22 01:32:41'),
(46, 'samoslavov60@thefmail.com', '5.144.97.173', 1, '2019-11-23 11:47:01', '2019-11-23 11:47:01'),
(47, 'lugovskij67@thefmail.com', '5.144.97.173', 1, '2019-11-25 10:28:17', '2019-11-25 10:28:17'),
(48, 'dutikova.sveta77@mail.ru', '45.82.152.249', 1, '2019-12-02 09:49:52', '2019-12-02 09:49:52'),
(50, 'falkensmoat@i-online.de', '2003:d8:f3d5:9295:c4a0:5bfa:88e2:a26a', 2, '2019-12-15 16:12:27', '2019-12-15 16:15:02'),
(51, 'yoga@emailblogtech.xyz', '209.107.214.102', 1, '2019-12-17 18:34:32', '2019-12-17 18:34:32'),
(52, 'welkonogov99@thefmail.com', '185.22.175.132', 1, '2019-12-23 05:54:27', '2019-12-23 05:54:27'),
(53, 'werbatyj77@thefmail.com', '5.144.97.173', 1, '2019-12-26 12:14:19', '2019-12-26 12:14:19'),
(55, 'davebutz00@gmail.com', '2a0a:a543:22e1:0:a93c:511c:9916:8c9a', 1, '2020-01-03 03:08:57', '2020-01-03 03:08:57'),
(56, 'joergplicht@arcor.de', '178.1.29.206', 3, '2020-01-17 21:42:28', '2020-01-17 21:43:08'),
(58, 'wanikov74@thefmail.com', '161.129.66.251', 1, '2020-01-30 11:26:30', '2020-01-30 11:26:30'),
(59, 's.z.y.m.anskiashley5@gmail.com', '51.15.15.164', 1, '2020-01-31 17:02:01', '2020-01-31 17:02:01'),
(60, 'rassohin86@thefmail.com', '161.129.66.251', 1, '2020-02-01 05:05:25', '2020-02-01 05:05:25'),
(61, '', '2a01:36d:112:4416:5d76:b5cf:2a2f:c51b', 1, '2020-02-18 09:31:59', '2020-02-18 09:31:59'),
(63, 'ivanov28@thefmail.com', '85.209.90.82', 1, '2020-03-02 05:51:44', '2020-03-02 05:51:44'),
(64, 'to.ch.schmidt@gmx.de', '89.15.238.251', 3, '2020-03-12 05:20:14', '2020-03-12 05:20:48'),
(65, 'vodolaga528@thefmail.com', '185.104.184.123', 1, '2020-03-16 23:22:20', '2020-03-16 23:22:20'),
(66, 'crazapilab@mail.ru', '79.173.83.153', 2, '2020-03-18 21:46:48', '2020-03-25 04:56:51'),
(68, 'riesenkamp@me.com', '2003:dd:f2b:c254:e5c6:604f:2160:e7e3', 5, '2020-03-27 16:12:38', '2020-03-27 16:13:01'),
(69, 'riesenkamp@me.com', '2003:dd:f30:4635:d1e7:bdbc:19fd:600c', 2, '2020-03-27 19:46:12', '2020-03-27 19:46:26'),
(71, '', '93.99.104.101', 5, '2020-04-08 08:58:01', '2020-04-08 08:58:12'),
(72, '', '80.155.3.201', 1, '2020-04-11 14:08:04', '2020-04-11 14:08:04'),
(73, 'plashkina.leonida@mail.ru', '37.120.192.24', 1, '2020-04-14 07:36:42', '2020-04-14 07:36:42'),
(74, 'martin.raudszus@web.de', '188.101.218.16', 5, '2020-04-22 16:31:45', '2020-04-22 16:37:05'),
(75, '4303', '89.187.165.60', 1, '2020-05-01 09:46:17', '2020-05-01 09:46:17'),
(76, 'yana_marshankina@mail.ru', '87.251.74.51', 1, '2020-05-06 01:57:10', '2020-05-06 01:57:10'),
(77, 'tobiaswilberg@googlemail.com', '2a02:8070:8895:d700:bc93:12c0:319c:8f63', 1, '2020-05-11 07:40:37', '2020-05-11 07:40:37'),
(78, 'pybyxyzele@gmx.com', '5.188.210.49', 1, '2020-05-20 17:19:14', '2020-05-20 17:19:14'),
(80, 't.wurziger@gmx.de', '2.207.25.82', 1, '2020-05-24 16:02:43', '2020-05-24 16:02:43'),
(91, 's.progu@mail.ru', '176.110.134.2', 1, '2020-06-16 16:32:59', '2020-06-16 16:32:59'),
(82, '12apr2020@mail.ru', '91.77.198.11', 1, '2020-05-28 20:12:45', '2020-05-28 20:12:45'),
(83, 'amenoomamenoom.6.6.9@gmail.com', '178.32.56.32', 1, '2020-06-01 03:11:34', '2020-06-01 03:11:34'),
(84, 'dolli97', '2003:d9:bf26:aa00:d36:cdf9:3e17:b772', 2, '2020-06-02 17:48:56', '2020-06-02 17:49:04'),
(85, 'dolli97@web. de', '2003:d9:bf26:aa00:d36:cdf9:3e17:b772', 2, '2020-06-02 17:49:22', '2020-06-02 17:49:45'),
(86, 'grechanovskij093@thefmail.com', '185.104.184.120', 1, '2020-06-03 15:52:00', '2020-06-03 15:52:00'),
(87, 'em7evg@gmail.com', '188.163.109.153', 23, '2020-06-05 01:22:44', '2020-11-03 18:47:11'),
(88, 'gerald19@nextfashion.ro', '86.105.25.78', 1, '2020-06-08 04:11:06', '2020-06-08 04:11:06'),
(89, 'gerald19@nextfashion.ro', '86.105.25.77', 1, '2020-06-13 00:15:04', '2020-06-13 00:15:04'),
(90, 'svidinfo1980@gmail.com', '188.172.220.69', 1, '2020-06-14 03:29:32', '2020-06-14 03:29:32'),
(92, 'bamboogroup.design@gmail.com', '194.34.133.179', 1, '2020-06-20 15:08:04', '2020-06-20 15:08:04'),
(93, 'z5451@thefmail.com', '195.181.170.83', 1, '2020-06-21 16:47:22', '2020-06-21 16:47:22'),
(94, 'lena.tikhonova.2020@bk.ru', '185.255.96.99', 5, '2020-06-21 23:58:04', '2020-07-20 06:28:58'),
(95, 'gerald19@nextfashion.ro', '86.105.25.76', 1, '2020-06-22 05:15:55', '2020-06-22 05:15:55'),
(96, 'r0sprod@yandex.com', '37.113.164.44', 1, '2020-06-23 09:51:36', '2020-06-23 09:51:36'),
(97, 'zigzag.wiki@catalog.tl', '91.92.128.171', 1, '2020-06-23 15:26:29', '2020-06-23 15:26:29'),
(98, 'vita.korotkina@mail.ru', '72.11.157.38', 1, '2020-06-24 08:20:47', '2020-06-24 08:20:47'),
(99, 'em7evg@gmail.com', '176.107.183.146', 2, '2020-06-24 19:28:08', '2020-09-08 06:28:48'),
(100, 'teddsmith1990@gmail.com', '89.238.177.174', 1, '2020-06-25 12:37:35', '2020-06-25 12:37:35'),
(101, 'zigzag.wiki@catalog.tm', '107.173.177.168', 1, '2020-06-26 03:11:06', '2020-06-26 03:11:06'),
(102, 'zigzag.wiki@catalog.gh', '185.177.59.202', 1, '2020-06-26 20:25:32', '2020-06-26 20:25:32'),
(103, 'zigzag.wiki@catalog.ul', '172.245.23.172', 1, '2020-06-27 13:31:53', '2020-06-27 13:31:53'),
(104, 'a.turca967@outlook.com', '194.99.106.9', 1, '2020-06-28 02:06:14', '2020-06-28 02:06:14'),
(105, 'zigzag.wiki@catalog.th', '172.245.23.160', 1, '2020-06-29 14:06:50', '2020-06-29 14:06:50'),
(106, 'oliver.s.oliver@outlook.com', '37.120.136.171', 1, '2020-06-29 14:32:04', '2020-06-29 14:32:04'),
(107, 'gordon72@nextfashion.ro', '185.216.34.229', 1, '2020-06-30 06:45:52', '2020-06-30 06:45:52'),
(108, 'y.stefanovskaya81@mail.ru', '213.167.139.228', 1, '2020-06-30 20:42:35', '2020-06-30 20:42:35'),
(109, 'zigzag.wiki@tas.tl', '91.92.128.171', 1, '2020-06-30 21:41:30', '2020-06-30 21:41:30'),
(110, 'catch@an.heartmantwo.com', '173.213.85.7', 1, '2020-07-01 15:16:17', '2020-07-01 15:16:17'),
(111, 'jochen.ritter@ritter-consulting.biz', '2402:4000:2081:459:94bb:415e:1e20:f93b', 1, '2020-07-05 16:21:21', '2020-07-05 16:21:21'),
(112, 'jochen.ritter@ritter-consulting.biz', '2402:4000:2081:459:790d:8096:b569:b4d4', 1, '2020-07-05 16:24:02', '2020-07-05 16:24:02'),
(113, 'gordon72@nextfashion.ro', '185.210.218.98', 1, '2020-07-05 20:24:55', '2020-07-05 20:24:55'),
(114, 'redoipole@mailinkis.com', '178.159.37.23', 1, '2020-07-06 08:00:32', '2020-07-06 08:00:32'),
(115, 'john.sach02@gmail.com', '45.12.223.138', 1, '2020-07-07 10:41:07', '2020-07-07 10:41:07'),
(116, 'em7evg@gmail.com', '176.107.182.236', 3, '2020-07-08 09:49:32', '2020-09-07 19:26:34'),
(117, '05johnsmith@mail.ru', '91.77.198.11', 2, '2020-07-08 12:00:36', '2020-08-04 00:09:32'),
(118, 'proectsxxx@gmail.com', '46.158.196.46', 1, '2020-07-09 08:26:42', '2020-07-09 08:26:42'),
(119, 'prorabnd@gmail.com', '37.147.173.248', 1, '2020-07-10 19:20:56', '2020-07-10 19:20:56'),
(120, '1xslots_africa@bk.ru', '109.227.249.98', 1, '2020-07-12 06:35:42', '2020-07-12 06:35:42'),
(121, 'vladislavpierrin@yandex.ru', '188.114.58.129', 1, '2020-07-13 02:57:07', '2020-07-13 02:57:07'),
(122, 'changa.onion@cgh.el', '91.92.128.171', 1, '2020-07-14 10:36:03', '2020-07-14 10:36:03'),
(123, 'john.sach02@gmail.com', '37.120.138.82', 1, '2020-07-18 09:15:45', '2020-07-18 09:15:45'),
(124, 'zhora.zhdanov.80@list.ru', '185.11.4.128', 1, '2020-07-20 05:15:53', '2020-07-20 05:15:53'),
(125, 'zasplav2015@mail.ru', '178.122.64.177', 1, '2020-07-20 06:36:58', '2020-07-20 06:36:58'),
(126, 'he.nt.aiw.o.rldpict.ur.e.s5@gdemoy.site', '95.143.29.26', 1, '2020-07-20 12:42:41', '2020-07-20 12:42:41'),
(127, 'catch@answers.dummyfox.com', '173.213.85.7', 1, '2020-07-22 09:22:40', '2020-07-22 09:22:40'),
(128, 'nastealitvina@yandex.ru', '176.58.61.49', 2, '2020-07-23 18:31:40', '2020-08-19 16:50:19'),
(129, '123teatr@gmail.com', '35.184.123.203', 1, '2020-07-24 16:35:15', '2020-07-24 16:35:15'),
(130, 'philipspask@24sm.tech', '45.87.2.128', 1, '2020-07-26 20:38:56', '2020-07-26 20:38:56'),
(131, 'alexsach91@gmail.com', '37.120.155.102', 1, '2020-07-27 19:09:40', '2020-07-27 19:09:40'),
(132, 'hotelukral@meta.ua', '193.19.75.186', 1, '2020-07-31 00:26:14', '2020-07-31 00:26:14'),
(133, 'sarinert@mail.ru', '78.138.157.42', 1, '2020-07-31 07:32:05', '2020-07-31 07:32:05'),
(134, 'gazari@sakhpubo.ru', '185.143.172.80', 2, '2020-07-31 08:53:08', '2020-08-11 10:08:18'),
(136, 'suniomo.demuin@interia.pl', '62.210.80.34', 1, '2020-08-02 12:58:47', '2020-08-02 12:58:47'),
(137, 'alexsach93@gmail.com', '37.120.194.70', 1, '2020-08-02 18:34:27', '2020-08-02 18:34:27'),
(138, '', '178.4.178.49', 1, '2020-08-03 09:27:43', '2020-08-03 09:27:43'),
(139, 'sergeikorkorshunov@yandex.com', '178.127.115.86', 1, '2020-08-06 13:04:22', '2020-08-06 13:04:22'),
(140, 'leonardchanister@gmail.com', '194.59.250.183', 1, '2020-08-06 17:10:05', '2020-08-06 17:10:05'),
(141, 'tchavots@mail.ru', '78.138.157.42', 1, '2020-08-07 16:28:28', '2020-08-07 16:28:28'),
(142, 'arthur.logan1826@bestmail.eu', '188.122.82.146', 1, '2020-08-08 15:38:30', '2020-08-08 15:38:30'),
(143, 'olhakoni@yandex.com', '109.252.138.104', 1, '2020-08-09 11:58:30', '2020-08-09 11:58:30'),
(144, '05johnsmith@mail.ru', '91.76.156.63', 1, '2020-08-12 05:07:16', '2020-08-12 05:07:16'),
(145, 'pochta@stduent-help.com', '46.4.157.125', 1, '2020-08-12 23:28:15', '2020-08-12 23:28:15'),
(146, 'marius.s.samuel@gmail.com', '89.238.177.168', 1, '2020-08-13 12:05:14', '2020-08-13 12:05:14'),
(147, 'alex2131@gmail.com', '95.65.81.152', 4, '2020-08-14 03:48:36', '2020-10-18 08:41:16'),
(148, 'sergeikorv@yandex.com', '93.85.136.6', 1, '2020-08-15 18:28:48', '2020-08-15 18:28:48'),
(149, 'kokoskaradojka@gmail.com', '62.210.80.66', 1, '2020-08-15 21:28:30', '2020-08-15 21:28:30'),
(150, 'sdgsgdh@yandex.com', '95.110.194.245', 1, '2020-08-17 14:15:37', '2020-08-17 14:15:37'),
(151, 'gotenberghat@gmail.com', '135.181.5.103', 1, '2020-08-21 00:55:58', '2020-08-21 00:55:58'),
(152, 'andrkur77@gmail.com', '46.8.139.202', 1, '2020-08-22 03:53:35', '2020-08-22 03:53:35'),
(153, 'batonikvilusan@gmail.com', '5.133.11.118', 1, '2020-08-22 18:50:06', '2020-08-22 18:50:06'),
(154, 'karli2020f@mail.ru', '2.92.250.167', 3, '2020-08-23 08:12:54', '2020-09-06 18:06:11'),
(155, 'profptb@meta.ua', '176.100.189.4', 1, '2020-08-24 14:16:05', '2020-08-24 14:16:05'),
(156, 'disartak@mail.ru', '78.138.157.42', 1, '2020-08-25 13:50:14', '2020-08-25 13:50:14'),
(157, 'sarika14@bk.ru', '78.138.157.42', 1, '2020-08-26 15:42:12', '2020-08-26 15:42:12'),
(158, 'catch@who.cowsnbullz.com', '104.151.246.108', 1, '2020-08-28 06:23:50', '2020-08-28 06:23:50'),
(159, 'gennick72@nextfashion.ro', '193.239.85.170', 1, '2020-08-29 00:28:16', '2020-08-29 00:28:16'),
(160, 'dianseregina@yandex.ru', '109.234.38.61', 1, '2020-08-31 05:51:01', '2020-08-31 05:51:01'),
(161, 'c1vf22da@gmail.com', '95.55.70.244', 1, '2020-08-31 14:27:52', '2020-08-31 14:27:52'),
(162, 'dar.frantz@yandex.com', '37.45.247.21', 1, '2020-09-01 16:44:47', '2020-09-01 16:44:47'),
(163, 'adam_harre@gmx.de', '46.187.25.61', 1, '2020-09-04 04:52:27', '2020-09-04 04:52:27'),
(164, 'micziwal@go2.pl', '213.217.225.176', 1, '2020-09-05 07:14:58', '2020-09-05 07:14:58'),
(165, 'alone-star@gmail.com', '79.173.90.153', 1, '2020-09-05 11:53:25', '2020-09-05 11:53:25'),
(166, 'luzget56@nextfashion.ro', '86.106.74.117', 1, '2020-09-07 01:56:28', '2020-09-07 01:56:28'),
(167, 'krolik55hil@gmail.com', '178.67.27.125', 1, '2020-09-07 05:28:58', '2020-09-07 05:28:58'),
(168, 'zoystufgesvay1972@mail.ru', '212.164.39.246', 1, '2020-09-08 12:26:46', '2020-09-08 12:26:46'),
(169, 'seriy.anthony@yandex.com', '37.44.68.230', 1, '2020-09-08 21:56:14', '2020-09-08 21:56:14'),
(170, 'karlgeorg.poch@gmx.de', '46.187.25.61', 1, '2020-09-09 09:49:47', '2020-09-09 09:49:47'),
(171, 'asfwe4fegrd3443@gmail.com', '46.33.33.65', 1, '2020-09-09 12:08:55', '2020-09-09 12:08:55'),
(172, 'ashby951@mix-mail.online\r\n', '5.188.210.18', 1, '2020-09-10 16:14:01', '2020-09-10 16:14:01'),
(173, 'millicente6768@mix-mail.online\r\n', '5.188.210.18', 1, '2020-09-10 21:46:54', '2020-09-10 21:46:54'),
(174, 'alenfastkovsky@maidservicenyc.pro', '2.95.144.249', 1, '2020-09-10 23:39:06', '2020-09-10 23:39:06'),
(175, 'gasinas@sakhpubo.ru', '185.143.172.80', 1, '2020-09-11 20:38:49', '2020-09-11 20:38:49'),
(176, 'zul.zackaryaeva@yandex.ru', '93.85.75.20', 1, '2020-09-14 00:43:11', '2020-09-14 00:43:11'),
(177, 'bwov@iroquzap.asia', '159.224.255.154', 1, '2020-09-14 02:13:04', '2020-09-14 02:13:04'),
(178, 'maids@labedroom.com', '193.106.241.37', 1, '2020-09-15 09:22:38', '2020-09-15 09:22:38'),
(179, 'garifas@sakhpubo.ru', '185.143.172.80', 1, '2020-09-16 19:10:21', '2020-09-16 19:10:21'),
(180, 'sofakiseleva1968@autorambler.ru', '85.206.163.236', 1, '2020-09-16 22:20:14', '2020-09-16 22:20:14'),
(181, 'proectsxxx@gmail.com', '46.158.223.27', 1, '2020-09-18 20:37:28', '2020-09-18 20:37:28'),
(182, 'utuberinov@gmail.com', '217.107.194.28', 1, '2020-09-19 00:07:46', '2020-09-19 00:07:46'),
(185, '0034629968485', '91.202.188.78', 1, '2020-09-19 12:01:52', '2020-09-19 12:01:52'),
(186, 'za-splav@mail.ru', '93.85.76.180', 1, '2020-09-20 13:08:11', '2020-09-20 13:08:11'),
(187, '', '5.188.62.25', 16, '2020-09-21 17:27:52', '2020-09-21 18:10:27'),
(188, 'catch@which.marksypark.com', '108.62.49.207', 1, '2020-09-23 16:03:14', '2020-09-23 16:03:14'),
(189, 'waffmorto1983@eml.ru', '195.2.79.29', 1, '2020-09-26 03:05:09', '2020-09-26 03:05:09'),
(190, 'za-splav@yandex.com', '178.127.195.68', 1, '2020-09-26 03:56:20', '2020-09-26 03:56:20'),
(191, 'arbelow78@gmail.com', '5.16.53.232', 1, '2020-09-27 15:04:11', '2020-09-27 15:04:11'),
(192, 'hent.a.i.w.o.rldpi.ctu.re.s5@gdemoy.site', '176.99.163.138', 1, '2020-09-30 08:47:18', '2020-09-30 08:47:18'),
(193, 'zasplav2015@mail.ru', '37.44.86.236', 1, '2020-09-30 10:12:03', '2020-09-30 10:12:03'),
(194, 'maximmad222@gmail.com', '178.184.125.252', 1, '2020-09-30 15:54:29', '2020-09-30 15:54:29'),
(195, 'se.r.ge.y.n.o.v.ik.ov.20...19.7.7.@gmail.com', '95.104.160.66', 1, '2020-09-30 20:14:23', '2020-09-30 20:14:23'),
(196, 'temptest428388116@gmail.com', '175.139.165.29', 1, '2020-10-01 00:11:42', '2020-10-01 00:11:42'),
(198, 'dgeni87s@nextfashion.ro', '185.123.143.252', 1, '2020-10-04 08:11:08', '2020-10-04 08:11:08'),
(199, 'vitya.kakoloak@mail.ru', '92.124.160.70', 1, '2020-10-05 15:54:44', '2020-10-05 15:54:44'),
(200, 'vitya.ananasenko.86@mail.ru', '92.124.160.70', 1, '2020-10-05 15:54:47', '2020-10-05 15:54:47'),
(201, 'tempoo626232418@gmail.com', '185.152.66.228', 1, '2020-10-06 02:05:03', '2020-10-06 02:05:03'),
(202, 'he.n.t.aiwor.l.dp.i.c.t.u.r.es5@gdemoy.site', '176.99.188.100', 1, '2020-10-06 04:55:01', '2020-10-06 04:55:01'),
(203, 'longostar0001@gmail.com', '176.114.153.66', 1, '2020-10-06 15:30:18', '2020-10-06 15:30:18'),
(204, 'je.n.taiw.or.l.dp.i.cture.t5@gdemoy.site', '85.236.14.54', 1, '2020-10-08 08:11:04', '2020-10-08 08:11:04'),
(205, 'evgeshavoli24@gmail.com', '213.59.158.2', 2, '2020-10-08 11:28:57', '2020-10-28 00:11:01'),
(206, 'zasplav2015@mail.ru', '178.121.206.181', 1, '2020-10-08 12:03:51', '2020-10-08 12:03:51'),
(207, 'marat.kahramov@gmail.com', '185.117.118.252', 1, '2020-10-10 06:31:39', '2020-10-10 06:31:39'),
(208, 'dgeni87s@nextfashion.ro', '193.239.85.134', 1, '2020-10-11 01:27:01', '2020-10-11 01:27:01'),
(209, 'sale@za-splav.by', '178.121.206.181', 1, '2020-10-12 05:18:57', '2020-10-12 05:18:57'),
(210, '1@sh1371291.a.had.su', '77.51.91.96', 1, '2020-10-12 22:43:59', '2020-10-12 22:43:59'),
(211, 'karinaavdeenko2@gmail.com', '77.243.191.39', 1, '2020-10-13 01:35:01', '2020-10-13 01:35:01'),
(212, 'gillespero@gmx.de', '46.187.38.244', 1, '2020-10-13 15:09:16', '2020-10-13 15:09:16'),
(213, 'catch@big.fanficforum.com', '173.234.158.164', 1, '2020-10-14 03:16:58', '2020-10-14 03:16:58'),
(214, 'ktpbnvcxxxdcv@gmail.com', '217.107.194.26', 1, '2020-10-14 12:08:47', '2020-10-14 12:08:47'),
(215, 'maximmad222@yandex.ru', '178.184.77.179', 1, '2020-10-14 14:44:18', '2020-10-14 14:44:18'),
(216, 'facheeva@mail.ru', '78.138.157.42', 1, '2020-10-15 14:53:14', '2020-10-15 14:53:14'),
(217, 'gedeonartilerija@qmail.cf', '91.121.145.70', 1, '2020-10-16 00:29:23', '2020-10-16 00:29:23'),
(218, 'catch@which.marksypark.com', '23.19.74.149', 1, '2020-10-16 06:38:26', '2020-10-16 06:38:26'),
(219, 'paolorins@yandex.ru', '81.177.174.59', 1, '2020-10-16 19:50:01', '2020-10-16 19:50:01'),
(220, 's_gorlin@list.ru', '93.124.57.13', 1, '2020-10-17 10:37:53', '2020-10-17 10:37:53'),
(221, 'tarikrin@mail.ru', '92.255.198.132', 1, '2020-10-18 16:45:02', '2020-10-18 16:45:02'),
(222, 'zul.zackaryaeva@yandex.ru', '37.45.193.60', 1, '2020-10-19 01:56:12', '2020-10-19 01:56:12'),
(223, 'dar.frantz@yandex.com', '93.84.158.75', 1, '2020-10-19 03:21:16', '2020-10-19 03:21:16'),
(224, 'gildas@sakhpubo.ru', '185.143.172.80', 1, '2020-10-20 01:26:38', '2020-10-20 01:26:38'),
(226, 'buchanan-1978@bk.ru', '95.65.81.152', 1, '2020-10-20 21:22:37', '2020-10-20 21:22:37'),
(227, 'manley300bgmai@mail.ru', '92.124.162.19', 1, '2020-10-21 08:14:57', '2020-10-21 08:14:57'),
(228, 'razuzleg1@nextfashion.ro', '143.244.54.103', 1, '2020-10-22 06:59:49', '2020-10-22 06:59:49'),
(229, 'csngnz@thefmail.com', '185.130.184.209', 1, '2020-10-24 06:30:55', '2020-10-24 06:30:55'),
(230, 'pozptq@thefmail.com', '185.130.184.209', 1, '2020-10-24 17:00:39', '2020-10-24 17:00:39'),
(231, 'znctmf@thefmail.com', '185.130.184.209', 1, '2020-10-25 03:05:34', '2020-10-25 03:05:34'),
(232, 'pxqegc@thefmail.com', '195.181.170.73', 1, '2020-10-25 16:28:50', '2020-10-25 16:28:50'),
(233, 'xcznrs@thefmail.com', '195.181.170.73', 1, '2020-10-26 04:43:09', '2020-10-26 04:43:09'),
(234, 'idellokastello@gmail.com', '84.17.52.166', 1, '2020-10-26 07:09:31', '2020-10-26 07:09:31'),
(235, '01052020@ro.ru', '47.110.49.177', 1, '2020-10-26 13:25:14', '2020-10-26 13:25:14'),
(236, 'splav0803@yandex.by', '178.121.238.63', 1, '2020-10-26 13:53:06', '2020-10-26 13:53:06'),
(237, 'judfaq@thefmail.com', '195.181.170.73', 1, '2020-10-26 16:52:57', '2020-10-26 16:52:57'),
(239, 'vxyqms@thefmail.com', '195.181.170.76', 1, '2020-10-27 16:14:25', '2020-10-27 16:14:25'),
(241, 'idellokastello@gmail.com', '89.187.165.177', 1, '2020-10-28 05:17:11', '2020-10-28 05:17:11'),
(242, 'hjeohz@thefmail.com', '195.181.170.76', 1, '2020-10-29 04:31:38', '2020-10-29 04:31:38'),
(243, 'rkjmlcuyrl@gmail.com', '95.73.40.214', 1, '2020-10-29 13:28:46', '2020-10-29 13:28:46'),
(244, 'olyabibykova@yandex.ru', '78.29.72.195', 1, '2020-10-30 03:07:29', '2020-10-30 03:07:29'),
(245, 'qnajas@thefmail.com', '195.181.170.76', 1, '2020-10-30 05:36:10', '2020-10-30 05:36:10'),
(246, 'lmdmnk@thefmail.com', '195.181.170.76', 1, '2020-10-31 09:35:04', '2020-10-31 09:35:04'),
(247, 'lidasrudova@yandex.ru', '78.29.72.195', 1, '2020-10-31 23:32:52', '2020-10-31 23:32:52'),
(248, 'splav0803@yandex.by', '178.121.236.129', 1, '2020-11-01 02:18:03', '2020-11-01 02:18:03'),
(249, 'je.n.ta.iw.o.rl.dp.ictur.et5@gdemoy.site', '176.99.147.238', 1, '2020-11-02 02:45:40', '2020-11-02 02:45:40'),
(250, 'krutovzhorik@yandex.ru', '88.147.153.82', 1, '2020-11-02 20:05:09', '2020-11-02 20:05:09'),
(251, '1@sh1371291.a.had.su', '95.73.211.34', 1, '2020-11-03 04:08:08', '2020-11-03 04:08:08'),
(252, 'riemtrundova@yandex.ru', '88.147.153.82', 1, '2020-11-03 06:40:55', '2020-11-03 06:40:55'),
(253, 'indiramihina@yandex.ru', '88.147.153.82', 1, '2020-11-03 14:15:09', '2020-11-03 14:15:09');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `oc_customer_online`
--

DROP TABLE IF EXISTS `oc_customer_online`;
CREATE TABLE `oc_customer_online` (
  `ip` varchar(40) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `url` text NOT NULL,
  `referer` text NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `oc_customer_reward`
--

DROP TABLE IF EXISTS `oc_customer_reward`;
CREATE TABLE `oc_customer_reward` (
  `customer_reward_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL DEFAULT 0,
  `order_id` int(11) NOT NULL DEFAULT 0,
  `description` text NOT NULL,
  `points` int(8) NOT NULL DEFAULT 0,
  `date_added` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `oc_customer_search`
--

DROP TABLE IF EXISTS `oc_customer_search`;
CREATE TABLE `oc_customer_search` (
  `customer_search_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `keyword` varchar(255) NOT NULL,
  `category_id` int(11) DEFAULT NULL,
  `sub_category` tinyint(1) NOT NULL,
  `description` tinyint(1) NOT NULL,
  `products` int(11) NOT NULL,
  `ip` varchar(40) NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `oc_customer_transaction`
--

DROP TABLE IF EXISTS `oc_customer_transaction`;
CREATE TABLE `oc_customer_transaction` (
  `customer_transaction_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `description` text NOT NULL,
  `amount` decimal(15,4) NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `oc_customer_wishlist`
--

DROP TABLE IF EXISTS `oc_customer_wishlist`;
CREATE TABLE `oc_customer_wishlist` (
  `customer_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `oc_customer_wishlist`
--

INSERT INTO `oc_customer_wishlist` (`customer_id`, `product_id`, `date_added`) VALUES
(2, 61, '2018-04-23 15:33:46'),
(2, 372, '2018-04-23 15:32:31'),
(2, 247, '2018-04-24 16:25:21'),
(3, 61, '2018-04-24 16:27:57'),
(3, 247, '2018-04-24 16:28:06'),
(3, 306, '2018-04-24 16:28:16'),
(4, 577, '2018-06-13 14:51:31'),
(4, 545, '2018-06-13 14:53:48'),
(8, 248, '2018-07-23 14:05:18'),
(8, 246, '2018-07-23 14:05:24'),
(14, 459, '2018-09-23 12:16:45'),
(14, 509, '2018-09-23 12:19:14'),
(31, 592, '2019-01-24 18:40:37'),
(53, 894, '2019-08-04 12:09:28'),
(53, 744, '2019-08-04 12:12:15'),
(54, 622, '2019-08-04 12:45:14'),
(54, 321, '2019-08-04 12:49:19'),
(60, 661, '2019-09-06 11:42:39'),
(60, 496, '2019-09-06 11:42:49'),
(60, 904, '2019-09-06 11:42:56'),
(60, 965, '2019-09-06 11:43:01'),
(60, 972, '2019-09-06 11:43:10'),
(62, 329, '2019-09-24 07:40:26'),
(62, 560, '2019-09-24 07:40:43'),
(62, 975, '2019-09-24 07:40:57'),
(62, 236, '2019-10-18 22:53:19'),
(62, 235, '2019-10-18 22:53:32'),
(62, 233, '2019-10-18 22:53:38'),
(80, 1048, '2019-12-20 21:26:33'),
(87, 496, '2020-02-08 21:47:01'),
(87, 764, '2020-02-08 21:55:21'),
(117, 979, '2020-07-05 10:04:53'),
(129, 211, '2020-08-17 11:14:38'),
(129, 206, '2020-08-17 11:14:50');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `oc_custom_field`
--

DROP TABLE IF EXISTS `oc_custom_field`;
CREATE TABLE `oc_custom_field` (
  `custom_field_id` int(11) NOT NULL,
  `type` varchar(32) NOT NULL,
  `value` text NOT NULL,
  `validation` varchar(255) NOT NULL,
  `location` varchar(7) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `sort_order` int(3) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `oc_custom_field_customer_group`
--

DROP TABLE IF EXISTS `oc_custom_field_customer_group`;
CREATE TABLE `oc_custom_field_customer_group` (
  `custom_field_id` int(11) NOT NULL,
  `customer_group_id` int(11) NOT NULL,
  `required` tinyint(1) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `oc_custom_field_description`
--

DROP TABLE IF EXISTS `oc_custom_field_description`;
CREATE TABLE `oc_custom_field_description` (
  `custom_field_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(128) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `oc_custom_field_value`
--

DROP TABLE IF EXISTS `oc_custom_field_value`;
CREATE TABLE `oc_custom_field_value` (
  `custom_field_value_id` int(11) NOT NULL,
  `custom_field_id` int(11) NOT NULL,
  `sort_order` int(3) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `oc_custom_field_value_description`
--

DROP TABLE IF EXISTS `oc_custom_field_value_description`;
CREATE TABLE `oc_custom_field_value_description` (
  `custom_field_value_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `custom_field_id` int(11) NOT NULL,
  `name` varchar(128) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `oc_download`
--

DROP TABLE IF EXISTS `oc_download`;
CREATE TABLE `oc_download` (
  `download_id` int(11) NOT NULL,
  `filename` varchar(160) NOT NULL,
  `mask` varchar(128) NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `oc_download_description`
--

DROP TABLE IF EXISTS `oc_download_description`;
CREATE TABLE `oc_download_description` (
  `download_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `oc_event`
--

DROP TABLE IF EXISTS `oc_event`;
CREATE TABLE `oc_event` (
  `event_id` int(11) NOT NULL,
  `code` varchar(32) NOT NULL,
  `trigger` text NOT NULL,
  `action` text NOT NULL,
  `status` tinyint(1) NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `oc_event`
--

INSERT INTO `oc_event` (`event_id`, `code`, `trigger`, `action`, `status`, `date_added`) VALUES
(1, 'voucher', 'catalog/model/checkout/order/addOrderHistory/after', 'extension/total/voucher/send', 0, '0000-00-00 00:00:00'),
(2, 'openbay_product_del_after', 'admin/model/catalog/product/deleteProduct/after', 'extension/openbay/eventDeleteProduct', 1, '2018-07-30 15:32:09'),
(3, 'openbay_product_edit_after', 'admin/model/catalog/product/editProduct/after', 'extension/openbay/eventEditProduct', 1, '2018-07-30 15:32:09'),
(4, 'openbay_menu', 'admin/view/common/column_left/before', 'extension/openbay/eventMenu', 1, '2018-07-30 15:32:09');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `oc_extension`
--

DROP TABLE IF EXISTS `oc_extension`;
CREATE TABLE `oc_extension` (
  `extension_id` int(11) NOT NULL,
  `type` varchar(32) NOT NULL,
  `code` varchar(64) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `oc_extension`
--

INSERT INTO `oc_extension` (`extension_id`, `type`, `code`) VALUES
(1, 'payment', 'cod'),
(2, 'total', 'shipping'),
(3, 'total', 'sub_total'),
(4, 'total', 'tax'),
(5, 'total', 'total'),
(6, 'module', 'banner'),
(7, 'module', 'carousel'),
(8, 'total', 'credit'),
(10, 'total', 'handling'),
(11, 'total', 'low_order_fee'),
(12, 'total', 'coupon'),
(13, 'module', 'category'),
(14, 'module', 'account'),
(15, 'total', 'reward'),
(16, 'total', 'voucher'),
(17, 'payment', 'free_checkout'),
(18, 'module', 'featured'),
(19, 'module', 'slideshow'),
(20, 'theme', 'theme_default'),
(21, 'dashboard', 'activity'),
(22, 'dashboard', 'sale'),
(23, 'dashboard', 'recent'),
(24, 'dashboard', 'order'),
(25, 'dashboard', 'online'),
(26, 'dashboard', 'map'),
(27, 'dashboard', 'customer'),
(28, 'dashboard', 'chart'),
(30, 'module', 'bestseller'),
(31, 'module', 'html'),
(32, 'module', 'latest'),
(33, 'module', 'newsletter'),
(34, 'shipping', 'free'),
(48, 'shipping', 'weight'),
(36, 'module', 'information'),
(37, 'payment', 'payengine3cw_creditcard'),
(38, 'payment', 'payengine3cw_paydirekt'),
(55, 'payment', 'payengine3cw_paypal'),
(40, 'payment', 'payengine3cw_ratepaydirectdebits'),
(41, 'payment', 'payengine3cw_ratepayopeninvoice'),
(42, 'payment', 'payengine3cw_sofortueberweisung'),
(43, 'module', 'affiliate'),
(44, 'module', 'laybuy_layout'),
(45, 'shipping', 'ups'),
(46, 'shipping', 'citylink'),
(47, 'module', 'payengine3cw'),
(50, 'feed', 'google_sitemap'),
(51, 'feed', 'openbaypro'),
(52, 'feed', 'google_base'),
(53, 'feed', 'gcrdev_sitemap'),
(54, 'analytics', 'google_analytics'),
(56, 'payment', 'dibseasy');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `oc_filter`
--

DROP TABLE IF EXISTS `oc_filter`;
CREATE TABLE `oc_filter` (
  `filter_id` int(11) NOT NULL,
  `filter_group_id` int(11) NOT NULL,
  `sort_order` int(3) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `oc_filter_description`
--

DROP TABLE IF EXISTS `oc_filter_description`;
CREATE TABLE `oc_filter_description` (
  `filter_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `filter_group_id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `oc_filter_group`
--

DROP TABLE IF EXISTS `oc_filter_group`;
CREATE TABLE `oc_filter_group` (
  `filter_group_id` int(11) NOT NULL,
  `sort_order` int(3) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `oc_filter_group_description`
--

DROP TABLE IF EXISTS `oc_filter_group_description`;
CREATE TABLE `oc_filter_group_description` (
  `filter_group_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `oc_gcrdev_sitemap`
--

DROP TABLE IF EXISTS `oc_gcrdev_sitemap`;
CREATE TABLE `oc_gcrdev_sitemap` (
  `id` int(11) NOT NULL,
  `groups` varchar(32) NOT NULL,
  `changefreq` varchar(64) NOT NULL,
  `prio` decimal(2,1) NOT NULL,
  `indlim` int(15) NOT NULL,
  `prodstyle` tinyint(1) NOT NULL,
  `lastid` int(126) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `last_update` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `oc_gcrdev_sitemap`
--

INSERT INTO `oc_gcrdev_sitemap` (`id`, `groups`, `changefreq`, `prio`, `indlim`, `prodstyle`, `lastid`, `status`, `last_update`) VALUES
(1, 'products', 'never', '1.0', 100, 0, 0, 1, '2018-07-30 14:16:26'),
(2, 'categories', 'never', '0.9', 1000, 1, 0, 1, '2018-07-30 13:54:09'),
(3, 'brands', 'never', '0.8', 1000, 1, 0, 1, '2018-07-30 13:54:21'),
(4, 'information', 'never', '0.7', 1000, 1, 0, 0, '2018-07-30 13:46:14'),
(5, 'pages', 'never', '0.6', 1000, 1, 0, 1, '2018-07-30 13:46:16');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `oc_geo_zone`
--

DROP TABLE IF EXISTS `oc_geo_zone`;
CREATE TABLE `oc_geo_zone` (
  `geo_zone_id` int(11) NOT NULL,
  `name` varchar(32) NOT NULL,
  `description` varchar(255) NOT NULL,
  `date_modified` datetime NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `oc_geo_zone`
--

INSERT INTO `oc_geo_zone` (`geo_zone_id`, `name`, `description`, `date_modified`, `date_added`) VALUES
(3, 'Versand Zone 1', 'Versand Zone 1', '2018-06-19 12:09:55', '2009-01-06 23:26:25'),
(4, 'Versand Zone 6', 'Versand Zone 6', '2018-06-19 12:21:15', '2009-06-23 01:14:53'),
(5, 'Versand Zone 2', 'Versand Zone 2', '2018-06-19 12:11:28', '2018-06-14 16:10:23'),
(6, 'Versand Zone 3', 'Versand Zone 3', '2018-06-19 12:13:15', '2018-06-14 16:10:43'),
(7, 'Versand Zone 5', 'Versand Zone 5', '2018-06-19 12:16:05', '2018-06-16 19:02:08'),
(8, 'Versand Zone 4', 'Versand Zone 4', '2018-06-19 12:15:06', '2018-06-16 19:02:45'),
(9, 'Versand Deutschland', 'Versand Deutschland', '0000-00-00 00:00:00', '2018-06-20 17:45:34');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `oc_google_base_category`
--

DROP TABLE IF EXISTS `oc_google_base_category`;
CREATE TABLE `oc_google_base_category` (
  `google_base_category_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `oc_google_base_category_to_category`
--

DROP TABLE IF EXISTS `oc_google_base_category_to_category`;
CREATE TABLE `oc_google_base_category_to_category` (
  `google_base_category_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `oc_information`
--

DROP TABLE IF EXISTS `oc_information`;
CREATE TABLE `oc_information` (
  `information_id` int(11) NOT NULL,
  `bottom` int(1) NOT NULL DEFAULT 0,
  `sort_order` int(3) NOT NULL DEFAULT 0,
  `status` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `oc_information`
--

INSERT INTO `oc_information` (`information_id`, `bottom`, `sort_order`, `status`) VALUES
(3, 1, 3, 1),
(4, 1, 1, 1),
(5, 1, 5, 1),
(6, 1, 4, 1),
(7, 1, 2, 1),
(8, 0, 0, 1),
(9, 1, 6, 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `oc_information_description`
--

DROP TABLE IF EXISTS `oc_information_description`;
CREATE TABLE `oc_information_description` (
  `information_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `title` varchar(64) NOT NULL,
  `description` text NOT NULL,
  `meta_title` varchar(255) NOT NULL,
  `meta_description` varchar(255) NOT NULL,
  `meta_keyword` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `oc_information_description`
--

INSERT INTO `oc_information_description` (`information_id`, `language_id`, `title`, `description`, `meta_title`, `meta_description`, `meta_keyword`) VALUES
(3, 2, 'Datenschutz', '&lt;h1&gt;Datenschutzerklärung&lt;/h1&gt;\r\n\r\n&lt;h2&gt;1) Information über die Erhebung personenbezogener Daten und Kontaktdaten des Verantwortlichen&lt;/h2&gt;\r\n\r\n&lt;p&gt;&lt;b&gt;1.1&lt;/b&gt; Wir freuen uns, dass Sie unsere Website besuchen und bedanken uns für Ihr Interesse. Im Folgenden informieren wir Sie über den Umgang mit Ihren personenbezogenen Daten bei Nutzung unserer Website. Personenbezogene Daten sind hierbei alle Daten, mit denen Sie persönlich identifiziert werden können.&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;b&gt;1.2&lt;/b&gt; Verantwortlicher für die Datenverarbeitung auf dieser Website im Sinne der Datenschutz-Grundverordnung (DSGVO) ist Waffen-Bock, Carl Bock KG, Berliner Str. 28, 60311 Frankfurt/M., Deutschland, Tel.: 069-285590, Fax: 069-289801, E-Mail: info@waffen-bock.de. Der für die Verarbeitung von personenbezogenen Daten Verantwortliche ist diejenige natürliche oder juristische Person, die allein oder gemeinsam mit anderen über die Zwecke und Mittel der Verarbeitung von personenbezogenen Daten entscheidet.&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;b&gt;1.3&lt;/b&gt; Diese Website nutzt aus Sicherheitsgründen und zum Schutz der Übertragung personenbezogener Daten und anderer vertraulicher Inhalte (z.B. Bestellungen oder Anfragen an den Verantwortlichen) eine SSL-bzw. TLS-Verschlüsselung. Sie können eine verschlüsselte Verbindung an der Zeichenfolge „https://“ und dem Schloss-Symbol in Ihrer Browserzeile erkennen.&lt;/p&gt;\r\n\r\n&lt;h2&gt;2) Datenerfassung beim Besuch unserer Website&lt;/h2&gt;\r\n\r\n&lt;p&gt;Bei der bloß informatorischen Nutzung unserer Website, also wenn Sie sich nicht registrieren oder uns anderweitig Informationen übermitteln, erheben wir nur solche Daten, die Ihr Browser an unseren Server übermittelt (sog. „Server-Logfiles“). Wenn Sie unsere Website aufrufen, erheben wir die folgenden Daten, die für uns technisch erforderlich sind, um Ihnen die Website anzuzeigen:&lt;/p&gt;\r\n\r\n&lt;ul&gt;\r\n&lt;li&gt;Unsere besuchte Website&lt;/li&gt;\r\n&lt;li&gt;Datum und Uhrzeit zum Zeitpunkt des Zugriffes&lt;/li&gt;\r\n&lt;li&gt;Menge der gesendeten Daten in Byte&lt;/li&gt;\r\n&lt;li&gt;Quelle/Verweis, von welchem Sie auf die Seite gelangten&lt;/li&gt;\r\n&lt;li&gt;Verwendeter Browser&lt;/li&gt;\r\n&lt;li&gt;Verwendetes Betriebssystem&lt;/li&gt;\r\n&lt;li&gt;Verwendete IP-Adresse (ggf.: in anonymisierter Form)&lt;/li&gt;\r\n&lt;/ul&gt;\r\n\r\n&lt;p&gt;Die Verarbeitung erfolgt gemäß Art. 6 Abs. 1 lit. f DSGVO auf Basis unseres berechtigten Interesses an der Verbesserung der Stabilität und Funktionalität unserer Website. Eine Weitergabe oder anderweitige Verwendung der Daten findet nicht statt. Wir behalten uns allerdings vor, die Server-Logfiles nachträglich zu überprüfen, sollten konkrete Anhaltspunkte auf eine rechtswidrige Nutzung hinweisen.&lt;/p&gt;\r\n\r\n&lt;h2&gt;3) Cookies&lt;/h2&gt;\r\n\r\n&lt;p&gt;Um den Besuch unserer Website attraktiv zu gestalten und die Nutzung bestimmter Funktionen zu ermöglichen, verwenden wir auf verschiedenen Seiten sogenannte Cookies. Hierbei handelt es sich um kleine Textdateien, die auf Ihrem Endgerät abgelegt werden. Einige der von uns verwendeten Cookies werden nach dem Ende der Browser-Sitzung, also nach Schließen Ihres Browsers, wieder gelöscht (sog. Sitzungs-Cookies). Andere Cookies verbleiben auf Ihrem Endgerät und ermöglichen uns oder unseren Partnerunternehmen (Cookies von Drittanbietern), Ihren Browser beim nächsten Besuch wiederzuerkennen (persistente Cookies). Werden Cookies gesetzt, erheben und verarbeiten diese im individuellen Umfang bestimmte Nutzerinformationen wie Browser- und Standortdaten sowie IP-Adresswerte. Persistente Cookies werden automatisiert nach einer vorgegebenen Dauer gelöscht, die sich je nach Cookie unterscheiden kann.&lt;/p&gt;\r\n\r\n&lt;p&gt;Teilweise dienen die Cookies dazu, durch Speicherung von Einstellungen den Bestellprozess zu vereinfachen (z.B. Merken des Inhalts eines virtuellen Warenkorbs für einen späteren Besuch auf der Website). Sofern durch einzelne von uns implementierte Cookies auch personenbezogene Daten verarbeitet werden, erfolgt die Verarbeitung gemäß Art. 6 Abs. 1 lit. b DSGVO entweder zur Durchführung des Vertrages oder gemäß Art. 6 Abs. 1 lit. f DSGVO zur Wahrung unserer berechtigten Interessen an der bestmöglichen Funktionalität der Website sowie einer kundenfreundlichen und effektiven Ausgestaltung des Seitenbesuchs.&lt;/p&gt;\r\n\r\n&lt;p&gt;Wir arbeiten unter Umständen mit Werbepartnern zusammen, die uns helfen, unser Internetangebot für Sie interessanter zu gestalten. Zu diesem Zweck werden für diesen Fall bei Ihrem Besuch unserer Website auch Cookies von Partnerunternehmen auf Ihrer Festplatte gespeichert (Cookies von Drittanbietern). Wenn wir mit vorbenannten Werbepartnern zusammenarbeiten, werden Sie über den Einsatz derartiger Cookies und den Umfang der jeweils erhobenen Informationen innerhalb der nachstehenden Absätze individuell und gesondert informiert.&lt;/p&gt;\r\n\r\n&lt;p&gt;Bitte beachten Sie, dass Sie Ihren Browser so einstellen können, dass Sie über das Setzen von Cookies informiert werden und einzeln über deren Annahme entscheiden oder die Annahme von Cookies für bestimmte Fälle oder generell ausschließen können. Jeder Browser unterscheidet sich in der Art, wie er die Cookie-Einstellungen verwaltet. Diese ist in dem Hilfemenü jedes Browsers beschrieben, welches Ihnen erläutert, wie Sie Ihre Cookie-Einstellungen ändern können. Diese finden Sie für die jeweiligen Browser unter den folgenden Links:&lt;/p&gt;\r\n\r\n&lt;p&gt;Internet Explorer: https://support.microsoft.com/de-de/help/17442/windows-internet-explorer-delete-manage-cookies&lt;br&gt;\r\nFirefox: https://support.mozilla.org/de/kb/cookies-erlauben-und-ablehnen&lt;br&gt;\r\nChrome: https://support.google.com/chrome/answer/95647?hl=de&amp;amp;hlrm=en&lt;br&gt;\r\nSafari: https://support.apple.com/kb/ph21411?locale=de_DE&lt;br&gt;\r\nOpera: https://help.opera.com/en/latest/web-preferences/#cookies&lt;/p&gt;\r\n\r\n&lt;p&gt;Bitte beachten Sie, dass bei Nichtannahme von Cookies die Funktionalität unserer Website eingeschränkt sein kann.&lt;/p&gt;\r\n\r\n&lt;h2&gt;4) Kontaktaufnahme&lt;/h2&gt;\r\n\r\n&lt;p&gt;Im Rahmen der Kontaktaufnahme mit uns (z.B. per Kontaktformular oder E-Mail) werden personenbezogene Daten erhoben. Welche Daten im Falle eines Kontaktformulars erhoben werden, ist aus dem jeweiligen Kontaktformular ersichtlich. Diese Daten werden ausschließlich zum Zweck der Beantwortung Ihres Anliegens bzw. für die Kontaktaufnahme und die damit verbundene technische Administration gespeichert und verwendet. Rechtsgrundlage für die Verarbeitung der Daten ist unser berechtigtes Interesse an der Beantwortung Ihres Anliegens gemäß Art. 6 Abs. 1 lit. f DSGVO. Zielt Ihre Kontaktierung auf den Abschluss eines Vertrages ab, so ist zusätzliche Rechtsgrundlage für die Verarbeitung Art. 6 Abs. 1 lit. b DSGVO. Ihre Daten werden nach abschließender Bearbeitung Ihrer Anfrage gelöscht, dies ist der Fall, wenn sich aus den Umständen entnehmen lässt, dass der betroffene Sachverhalt abschließend geklärt ist und sofern keine gesetzlichen Aufbewahrungspflichten entgegenstehen.&lt;/p&gt;\r\n\r\n&lt;h2&gt;5) Datenverarbeitung bei Eröffnung eines Kundenkontos und zur Vertragsabwicklung&lt;/h2&gt;\r\n\r\n&lt;p&gt;Gemäß Art. 6 Abs. 1 lit. b DSGVO werden personenbezogene Daten weiterhin erhoben und verarbeitet, wenn Sie uns diese zur Durchführung eines Vertrages oder bei der Eröffnung eines Kundenkontos mitteilen. Welche Daten erhoben werden, ist aus den jeweiligen Eingabeformularen ersichtlich. Eine Löschung Ihres Kundenkontos ist jederzeit möglich und kann durch eine Nachricht an die o.g. Adresse des Verantwortlichen erfolgen. Wir speichern und verwenden die von Ihnen mitgeteilten Daten zur Vertragsabwicklung. Nach vollständiger Abwicklung des Vertrages oder Löschung Ihres Kundenkontos werden Ihre Daten mit Rücksicht auf steuer- und handelsrechtliche Aufbewahrungsfristen gesperrt und nach Ablauf dieser Fristen gelöscht, sofern Sie nicht ausdrücklich in eine weitere Nutzung Ihrer Daten eingewilligt haben oder eine gesetzlich erlaubte weitere Datenverwendung von unserer Seite vorbehalten wurde, über die wir Sie nachstehend entsprechend informieren.&lt;/p&gt;\r\n\r\n&lt;h2&gt;6) Datenverarbeitung zur Bestellabwicklung&lt;/h2&gt;\r\n\r\n&lt;p&gt;&lt;b&gt;6.1&lt;/b&gt; Zur Abwicklung Ihrer Bestellung arbeiten wir mit dem / den nachstehenden Dienstleistern zusammen, die uns ganz oder teilweise bei der Durchführung geschlossener Verträge unterstützen. An diese Dienstleister werden nach Maßgabe der folgenden Informationen gewisse personenbezogene Daten übermittelt.&lt;/p&gt;\r\n\r\n&lt;p&gt;Die von uns erhobenen personenbezogenen Daten werden im Rahmen der Vertragsabwicklung an das mit der Lieferung beauftragte Transportunternehmen weitergegeben, soweit dies zur Lieferung der Ware erforderlich ist. Ihre Zahlungsdaten geben wir im Rahmen der Zahlungsabwicklung an das beauftragte Kreditinstitut weiter, sofern dies für die Zahlungsabwicklung erforderlich ist. Sofern Zahlungsdienstleister eingesetzt werden, informieren wir hierüber nachstehend explizit. Die Rechtsgrundlage für die Weitergabe der Daten ist hierbei Art. 6 Abs. 1 lit. b DSGVO.&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;b&gt;6.2&lt;/b&gt; Verwendung von Paymentdienstleistern (Zahlungsdienstleister)&lt;/p&gt;\r\n\r\n&lt;p&gt;- ConCardis&lt;br&gt;\r\nWenn Sie sich für die Kreditkartenzahlung des Paymentdienstleisters ConCardis entscheiden, erfolgt die Zahlungsabwicklung über den Paymentdienstleister ConCardis GmbH, Helfmann-Park 7, 65760 Eschborn, an den wir Ihre im Rahmen des Bestellvorgangs mitgeteilten Informationen nebst den Informationen über Ihre Bestellung gemäß Art. 6 Abs. 1 lit. b DSGVO weitergeben. Die Weitergabe Ihrer Daten erfolgt ausschließlich zum Zwecke der Zahlungsabwicklung mit dem Paymentdienstleister ConCardis und nur insoweit, als sie hierfür erforderlich ist. Unter der nachstehenden Internetadresse erhalten Sie weitere Informationen über die Datenschutzbestimmungen von ConCardis: https://www.concardis.com/datenschutzerklaerung&lt;/p&gt;\r\n\r\n&lt;h2&gt;7) Webanalysedienste&lt;/h2&gt;\r\n\r\n&lt;p&gt;Google (Universal) Analytics&lt;/p&gt;\r\n\r\n&lt;p&gt;- Google Analytics&lt;br&gt;\r\nDiese Website benutzt Google Analytics, einen Webanalysedienst der Google LLC, 1600 Amphitheatre Parkway, Mountain View, CA 94043, USA (&quot;Google&quot;). Google Analytics verwendet sog. &quot;Cookies&quot;, Textdateien, die auf Ihrem Computer gespeichert werden und die eine Analyse der Benutzung der Website durch Sie ermöglichen. Die durch das Cookie erzeugten Informationen über Ihre Benutzung dieser Website (einschließlich der gekürzten IP-Adresse) werden in der Regel an einen Server von Google in den USA übertragen und dort gespeichert.&lt;br&gt;\r\nDiese Website verwendet Google Analytics ausschließlich mit der Erweiterung &quot;_anonymizeIp()&quot;, die eine Anonymisierung der IP-Adresse durch Kürzung sicherstellt und eine direkte Personenbeziehbarkeit ausschließt. Durch die Erweiterung wird Ihre IP-Adresse von Google innerhalb von Mitgliedstaaten der Europäischen Union oder in anderen Vertragsstaaten des Abkommens über den Europäischen Wirtschaftsraum zuvor gekürzt. Nur in Ausnahmefällen wird die volle IP-Adresse an einen Server von Google in den USA übertragen und dort gekürzt. In diesen Ausnahmefällen erfolgt diese Verarbeitung gemäß Art. 6 Abs. 1 lit. f DSGVO auf Grundlage unseres berechtigten Interesses an der statistischen Analyse des Nutzerverhaltens zu Optimierungs- und Marketingzwecken.&lt;br&gt;\r\nIn unserem Auftrag wird Google diese Informationen benutzen, um Ihre Nutzung der Website auszuwerten, um Reports über die Websiteaktivitäten zusammenzustellen und um weitere mit der Websitenutzung und der Internetnutzung verbundene Dienstleistungen uns gegenüber zu erbringen. Die im Rahmen von Google Analytics von Ihrem Browser übermittelte IP-Adresse wird nicht mit anderen Daten von Google zusammengeführt.&lt;br&gt;\r\nSie können die Speicherung der Cookies durch eine entsprechende Einstellung Ihrer Browser-Software verhindern; wir weisen Sie jedoch darauf hin, dass Sie in diesem Fall gegebenenfalls nicht sämtliche Funktionen dieser Website vollumfänglich werden nutzen können. Sie können darüber hinaus die Erfassung der durch das Cookie erzeugten und auf Ihre Nutzung der Website bezogenen Daten (inkl. Ihrer IP-Adresse) an Google sowie die Verarbeitung dieser Daten durch Google verhindern, indem Sie das unter dem folgenden Link verfügbare Browser-Plugin herunterladen und installieren:&lt;br&gt;\r\nhttps://tools.google.com/dlpage/gaoptout?hl=de&lt;br&gt;\r\nAlternativ zum Browser-Plugin oder innerhalb von Browsern auf mobilen Geräten klicken Sie bitte auf den folgenden Link, um ein Opt-Out-Cookie zu setzen, der die Erfassung durch Google Analytics innerhalb dieser Website zukünftig verhindert (dieses Opt-Out-Cookie funktioniert nur in diesem Browser und nur für diese Domain, löschen Sie Ihre Cookies in diesem Browser, müssen Sie diesen Link erneut klicken): &lt;a onclick=&quot;alert(\'Google Analytics wurde deaktiviert\');&quot; href=&quot;javascript:gaOptout()&quot;&gt;Google Analytics deaktivieren&lt;/a&gt;&lt;br&gt;\r\nGoogle LLC mit Sitz in den USA ist für das us-europäische Datenschutzübereinkommen „Privacy Shield“ zertifiziert, welches die Einhaltung des in der EU geltenden Datenschutzniveaus gewährleistet.&lt;br&gt;\r\nMehr Informationen zum Umgang mit Nutzerdaten bei Google Analytics finden Sie in der Datenschutzerklärung von Google: https://support.google.com/analytics/answer/6004245?hl=de&lt;/p&gt;\r\n\r\n&lt;h2&gt;8) Tools und Sonstiges&lt;/h2&gt;\r\n\r\n&lt;p&gt;Google Web Fonts&lt;/p&gt;\r\n\r\n&lt;p&gt;Diese Seite nutzt zur einheitlichen Darstellung von Schriftarten so genannte Web Fonts die von der Google LLC., 1600 Amphitheatre Parkway, Mountain View, CA 94043, USA („Google“) bereitgestellt werden. Beim Aufruf einer Seite lädt Ihr Browser die benötigten Web Fonts in ihren Browser-Cache, um Texte und Schriftarten korrekt anzuzeigen.&lt;/p&gt;\r\n\r\n&lt;p&gt;Zu diesem Zweck muss der von Ihnen verwendete Browser Verbindung zu den Servern von Google aufnehmen. Hierdurch erlangt Google Kenntnis darüber, dass über Ihre IP-Adresse unsere Website aufgerufen wurde. Die Nutzung von Google Web Fonts erfolgt im Interesse einer einheitlichen und ansprechenden Darstellung unserer Online-Angebote. Dies stellt ein berechtigtes Interesse im Sinne von Art. 6 Abs. 1 lit. f DSGVO dar. Wenn Ihr Browser Web Fonts nicht unterstützt, wird eine Standardschrift von Ihrem Computer genutzt.&lt;/p&gt;\r\n\r\n&lt;p&gt;Google LLC mit Sitz in den USA ist für das us-europäische Datenschutzübereinkommen „Privacy Shield“ zertifiziert, welches die Einhaltung des in der EU geltenden Datenschutzniveaus gewährleistet.&lt;/p&gt;\r\n\r\n&lt;p&gt;Weitere Informationen zu Google Web Fonts finden Sie unter https://developers.google.com/fonts/faq und in der Datenschutzerklärung von Google: https://www.google.com/policies/privacy/&lt;/p&gt;\r\n\r\n&lt;h2&gt;9) Rechte des Betroffenen&lt;/h2&gt;\r\n\r\n&lt;p&gt;&lt;b&gt;9.1&lt;/b&gt; Das geltende Datenschutzrecht gewährt Ihnen gegenüber dem Verantwortlichen hinsichtlich der Verarbeitung Ihrer personenbezogenen Daten umfassende Betroffenenrechte (Auskunfts- und Interventionsrechte), über die wir Sie nachstehend informieren:&lt;/p&gt;\r\n\r\n&lt;ul&gt;\r\n&lt;li&gt;Auskunftsrecht gemäß Art. 15 DSGVO: Sie haben insbesondere ein Recht auf Auskunft über Ihre von uns verarbeiteten personenbezogenen Daten, die Verarbeitungszwecke, die Kategorien der verarbeiteten personenbezogenen Daten, die Empfänger oder Kategorien von Empfängern, gegenüber denen Ihre Daten offengelegt wurden oder werden, die geplante Speicherdauer bzw. die Kriterien für die Festlegung der Speicherdauer, das Bestehen eines Rechts auf Berichtigung, Löschung, Einschränkung der Verarbeitung, Widerspruch gegen die Verarbeitung, Beschwerde bei einer Aufsichtsbehörde, die Herkunft Ihrer Daten, wenn diese nicht durch uns bei Ihnen erhoben wurden, das Bestehen einer automatisierten Entscheidungsfindung einschließlich Profiling und ggf. aussagekräftige Informationen über die involvierte Logik und die Sie betreffende Tragweite und die angestrebten Auswirkungen einer solchen Verarbeitung, sowie Ihr Recht auf Unterrichtung, welche Garantien gemäß Art. 46 DSGVO bei Weiterleitung Ihrer Daten in Drittländer bestehen;&lt;/li&gt;\r\n&lt;li&gt;Recht auf Berichtigung gemäß Art. 16 DSGVO: Sie haben ein Recht auf unverzügliche Berichtigung Sie betreffender unrichtiger Daten und/oder Vervollständigung Ihrer bei uns gespeicherten unvollständigen Daten;&lt;/li&gt;\r\n&lt;li&gt;Recht auf Löschung gemäß Art. 17 DSGVO: Sie haben das Recht, die Löschung Ihrer personenbezogenen Daten bei Vorliegen der Voraussetzungen des Art. 17 Abs. 1 DSGVO zu verlangen. Dieses Recht besteht jedoch insbesondere dann nicht, wenn die Verarbeitung zur Ausübung des Rechts auf freie Meinungsäußerung und Information, zur Erfüllung einer rechtlichen Verpflichtung, aus Gründen des öffentlichen Interesses oder zur Geltendmachung, Ausübung oder Verteidigung von Rechtsansprüchen erforderlich ist;&lt;/li&gt;\r\n&lt;li&gt;Recht auf Einschränkung der Verarbeitung gemäß Art. 18 DSGVO: Sie haben das Recht, die Einschränkung der Verarbeitung Ihrer personenbezogenen Daten zu verlangen, solange die von Ihnen bestrittene Richtigkeit Ihrer Daten überprüft wird, wenn Sie eine Löschung Ihrer Daten wegen unzulässiger Datenverarbeitung ablehnen und stattdessen die Einschränkung der Verarbeitung Ihrer Daten verlangen, wenn Sie Ihre Daten zur Geltendmachung, Ausübung oder Verteidigung von Rechtsansprüchen benötigen, nachdem wir diese Daten nach Zweckerreichung nicht mehr benötigen oder wenn Sie Widerspruch aus Gründen Ihrer besonderen Situation eingelegt haben, solange noch nicht feststeht, ob unsere berechtigten Gründe überwiegen;&lt;/li&gt;\r\n&lt;li&gt;Recht auf Unterrichtung gemäß Art. 19 DSGVO: Haben Sie das Recht auf Berichtigung, Löschung oder Einschränkung der Verarbeitung gegenüber dem Verantwortlichen geltend gemacht, ist dieser verpflichtet, allen Empfängern, denen die Sie betreffenden personenbezogenen Daten offengelegt wurden, diese Berichtigung oder Löschung der Daten oder Einschränkung der Verarbeitung mitzuteilen, es sei denn, dies erweist sich als unmöglich oder ist mit einem unverhältnismäßigen Aufwand verbunden. Ihnen steht das Recht zu, über diese Empfänger unterrichtet zu werden.&lt;/li&gt;\r\n&lt;li&gt;Recht auf Datenübertragbarkeit gemäß Art. 20 DSGVO: Sie haben das Recht, Ihre personenbezogenen Daten, die Sie uns bereitgestellt haben, in einem strukturierten, gängigen und maschinenlesebaren Format zu erhalten oder die Übermittlung an einen anderen Verantwortlichen zu verlangen, soweit dies technisch machbar ist;&lt;/li&gt;\r\n&lt;li&gt;Recht auf Widerruf erteilter Einwilligungen gemäß Art. 7 Abs. 3 DSGVO: Sie haben das Recht, eine einmal erteilte Einwilligung in die Verarbeitung von Daten jederzeit mit Wirkung für die Zukunft zu widerrufen. Im Falle des Widerrufs werden wir die betroffenen Daten unverzüglich löschen, sofern eine weitere Verarbeitung nicht auf eine Rechtsgrundlage zur einwilligungslosen Verarbeitung gestützt werden kann. Durch den Widerruf der Einwilligung wird die Rechtmäßigkeit der aufgrund der Einwilligung bis zum Widerruf erfolgten Verarbeitung nicht berührt;&lt;/li&gt;\r\n&lt;li&gt;Recht auf Beschwerde gemäß Art. 77 DSGVO: Wenn Sie der Ansicht sind, dass die Verarbeitung der Sie betreffenden personenbezogenen Daten gegen die DSGVO verstößt, haben Sie - unbeschadet eines anderweitigen verwaltungsrechtlichen oder gerichtlichen Rechtsbehelfs - das Recht auf Beschwerde bei einer Aufsichtsbehörde, insbesondere in dem Mitgliedstaat Ihres Aufenthaltsortes, Ihres Arbeitsplatzes oder des Ortes des mutmaßlichen Verstoßes.&lt;/li&gt;\r\n&lt;/ul&gt;\r\n\r\n&lt;p&gt;&lt;b&gt;9.2&lt;/b&gt; WIDERSPRUCHSRECHT&lt;/p&gt;\r\n\r\n&lt;p&gt;WENN WIR IM RAHMEN EINER INTERESSENABWÄGUNG IHRE PERSONENBEZOGENEN DATEN AUFGRUND UNSERES ÜBERWIEGENDEN BERECHTIGTEN INTERESSES VERARBEITEN, HABEN SIE DAS JEDERZEITIGE RECHT, AUS GRÜNDEN, DIE SICH AUS IHRER BESONDEREN SITUATION ERGEBEN, GEGEN DIESE VERARBEITUNG WIDERSPRUCH MIT WIRKUNG FÜR DIE ZUKUNFT EINZULEGEN.&lt;br&gt;\r\nMACHEN SIE VON IHREM WIDERSPRUCHSRECHT GEBRAUCH, BEENDEN WIR DIE VERARBEITUNG DER BETROFFENEN DATEN. EINE WEITERVERARBEITUNG BLEIBT ABER VORBEHALTEN, WENN WIR ZWINGENDE SCHUTZWÜRDIGE GRÜNDE FÜR DIE VERARBEITUNG NACHWEISEN KÖNNEN, DIE IHRE INTERESSEN, GRUNDRECHTE UND GRUNDFREIHEITEN ÜBERWIEGEN, ODER WENN DIE VERARBEITUNG DER GELTENDMACHUNG, AUSÜBUNG ODER VERTEIDIGUNG VON RECHTSANSPRÜCHEN DIENT.&lt;/p&gt;\r\n\r\n&lt;p&gt;WERDEN IHRE PERSONENBEZOGENEN DATEN VON UNS VERARBEITET, UM DIREKTWERBUNG ZU BETREIBEN, HABEN SIE DAS RECHT, JEDERZEIT WIDERSPRUCH GEGEN DIE VERARBEITUNG SIE BETREFFENDER PERSONENBEZOGENER DATEN ZUM ZWECKE DERARTIGER WERBUNG EINZULEGEN. SIE KÖNNEN DEN WIDERSPRUCH WIE OBEN BESCHRIEBEN AUSÜBEN.&lt;/p&gt;\r\n\r\n&lt;p&gt;MACHEN SIE VON IHREM WIDERSPRUCHSRECHT GEBRAUCH, BEENDEN WIR DIE VERARBEITUNG DER BETROFFENEN DATEN ZU DIREKTWERBEZWECKEN.&lt;/p&gt;\r\n\r\n&lt;h2&gt;10) Dauer der Speicherung personenbezogener Daten&lt;/h2&gt;\r\n\r\n&lt;p&gt;Die Dauer der Speicherung von personenbezogenen Daten bemisst sich anhand der jeweiligen gesetzlichen Aufbewahrungsfrist (z.B. handels- und steuerrechtliche Aufbewahrungsfristen). Nach Ablauf der Frist werden die entsprechenden Daten routinemäßig gelöscht, sofern sie nicht mehr zur Vertragserfüllung oder Vertragsanbahnung erforderlich sind und/oder unsererseits kein berechtigtes Interesse an der Weiterspeicherung fortbesteht.&lt;/p&gt;', 'Datenschutz', '', ''),
(3, 1, 'Privacy Policy', '&lt;h1&gt;Datenschutzerklärung&lt;/h1&gt;\r\n&lt;h2&gt;1. Datenschutz auf einen Blick&lt;/h2&gt;\r\n&lt;h3&gt;Allgemeine Hinweise&lt;/h3&gt; &lt;p&gt;Die folgenden Hinweise geben einen einfachen Überblick darüber, was mit Ihren personenbezogenen Daten passiert, wenn Sie unsere Website besuchen. Personenbezogene Daten sind alle Daten, mit denen Sie persönlich identifiziert werden können. Ausführliche Informationen zum Thema Datenschutz entnehmen Sie unserer unter diesem Text aufgeführten Datenschutzerklärung.&lt;/p&gt;\r\n&lt;h3&gt;Datenerfassung auf unserer Website&lt;/h3&gt; &lt;p&gt;&lt;strong&gt;Wer ist verantwortlich für die Datenerfassung auf dieser Website?&lt;/strong&gt;&lt;/p&gt; &lt;p&gt;Die Datenverarbeitung auf dieser Website erfolgt durch den Websitebetreiber. Dessen Kontaktdaten können Sie dem Impressum dieser Website entnehmen.&lt;/p&gt; &lt;p&gt;&lt;strong&gt;Wie erfassen wir Ihre Daten?&lt;/strong&gt;&lt;/p&gt; &lt;p&gt;Ihre Daten werden zum einen dadurch erhoben, dass Sie uns diese mitteilen. Hierbei kann es sich z.B. um Daten handeln, die Sie in ein Kontaktformular eingeben.&lt;/p&gt; &lt;p&gt;Andere Daten werden automatisch beim Besuch der Website durch unsere IT-Systeme erfasst. Das sind vor allem technische Daten (z.B. Internetbrowser, Betriebssystem oder Uhrzeit des Seitenaufrufs). Die Erfassung dieser Daten erfolgt automatisch, sobald Sie unsere Website betreten.&lt;/p&gt; &lt;p&gt;&lt;strong&gt;Wofür nutzen wir Ihre Daten?&lt;/strong&gt;&lt;/p&gt; &lt;p&gt;Ein Teil der Daten wird erhoben, um eine fehlerfreie Bereitstellung der Website zu gewährleisten. Andere Daten können zur Analyse Ihres Nutzerverhaltens verwendet werden.&lt;/p&gt; &lt;p&gt;&lt;strong&gt;Welche Rechte haben Sie bezüglich Ihrer Daten?&lt;/strong&gt;&lt;/p&gt; &lt;p&gt;Sie haben jederzeit das Recht unentgeltlich Auskunft über Herkunft, Empfänger und Zweck Ihrer gespeicherten personenbezogenen Daten zu erhalten. Sie haben außerdem ein Recht, die Berichtigung, Sperrung oder Löschung dieser Daten zu verlangen. Hierzu sowie zu weiteren Fragen zum Thema Datenschutz können Sie sich jederzeit unter der im Impressum angegebenen Adresse an uns wenden. Des Weiteren steht Ihnen ein Beschwerderecht bei der zuständigen Aufsichtsbehörde zu.&lt;/p&gt;\r\n&lt;h3&gt;Analyse-Tools und Tools von Drittanbietern&lt;/h3&gt; &lt;p&gt;Beim Besuch unserer Website kann Ihr Surf-Verhalten statistisch ausgewertet werden. Das geschieht vor allem mit Cookies und mit sogenannten Analyseprogrammen. Die Analyse Ihres Surf-Verhaltens erfolgt in der Regel anonym; das Surf-Verhalten kann nicht zu Ihnen zurückverfolgt werden. Sie können dieser Analyse widersprechen oder sie durch die Nichtbenutzung bestimmter Tools verhindern. Detaillierte Informationen dazu finden Sie in der folgenden Datenschutzerklärung.&lt;/p&gt; &lt;p&gt;Sie können dieser Analyse widersprechen. Über die Widerspruchsmöglichkeiten werden wir Sie in dieser Datenschutzerklärung informieren.&lt;/p&gt;\r\n&lt;h2&gt;2. Allgemeine Hinweise und Pflichtinformationen&lt;/h2&gt;\r\n&lt;h3&gt;Hinweis zur verantwortlichen Stelle&lt;/h3&gt; &lt;p&gt;Die verantwortliche Stelle für die Datenverarbeitung auf dieser Website ist:&lt;/p&gt; &lt;p&gt;Waffen-Bock Carl Bock KG   &lt;br&gt;\r\nBerliner Str. 28&lt;br&gt;\r\n60311 Frankfurt am Main&lt;/p&gt;\r\n\r\n&lt;p&gt;Telefon: 069/285590&lt;br&gt;\r\nE-Mail: info@waffen-bock.de&lt;/p&gt;\r\n &lt;p&gt;Verantwortliche Stelle ist die natürliche oder juristische Person, die allein oder gemeinsam mit anderen über die Zwecke und Mittel der Verarbeitung von personenbezogenen Daten (z.B. Namen, E-Mail-Adressen o. Ä.) entscheidet.&lt;/p&gt;\r\n&lt;h3&gt;Widerruf Ihrer Einwilligung zur Datenverarbeitung&lt;/h3&gt; &lt;p&gt;Viele Datenverarbeitungsvorgänge sind nur mit Ihrer ausdrücklichen Einwilligung möglich. Sie können eine bereits erteilte Einwilligung jederzeit widerrufen. Dazu reicht eine formlose Mitteilung per E-Mail an uns. Die Rechtmäßigkeit der bis zum Widerruf erfolgten Datenverarbeitung bleibt vom Widerruf unberührt.&lt;/p&gt;\r\n&lt;h3&gt;Beschwerderecht bei der zuständigen Aufsichtsbehörde&lt;/h3&gt; &lt;p&gt;Im Falle datenschutzrechtlicher Verstöße steht dem Betroffenen ein Beschwerderecht bei der zuständigen Aufsichtsbehörde zu. Zuständige Aufsichtsbehörde in datenschutzrechtlichen Fragen ist der Landesdatenschutzbeauftragte des Bundeslandes, in dem unser Unternehmen seinen Sitz hat. Eine Liste der Datenschutzbeauftragten sowie deren Kontaktdaten können folgendem Link entnommen werden: &lt;a href=&quot;https://www.bfdi.bund.de/DE/Infothek/Anschriften_Links/anschriften_links-node.html&quot; target=&quot;_blank&quot;&gt;https://www.bfdi.bund.de/DE/Infothek/Anschriften_Links/anschriften_links-node.html&lt;/a&gt;.&lt;/p&gt;\r\n&lt;h3&gt;Recht auf Datenübertragbarkeit&lt;/h3&gt; &lt;p&gt;Sie haben das Recht, Daten, die wir auf Grundlage Ihrer Einwilligung oder in Erfüllung eines Vertrags automatisiert verarbeiten, an sich oder an einen Dritten in einem gängigen, maschinenlesbaren Format aushändigen zu lassen. Sofern Sie die direkte Übertragung der Daten an einen anderen Verantwortlichen verlangen, erfolgt dies nur, soweit es technisch machbar ist.&lt;/p&gt;\r\n&lt;h3&gt;SSL- bzw. TLS-Verschlüsselung&lt;/h3&gt; &lt;p&gt;Diese Seite nutzt aus Sicherheitsgründen und zum Schutz der Übertragung vertraulicher Inhalte, wie zum Beispiel Bestellungen oder Anfragen, die Sie an uns als Seitenbetreiber senden, eine SSL-bzw. TLS-Verschlüsselung. Eine verschlüsselte Verbindung erkennen Sie daran, dass die Adresszeile des Browsers von “http://” auf “https://” wechselt und an dem Schloss-Symbol in Ihrer Browserzeile.&lt;/p&gt; &lt;p&gt;Wenn die SSL- bzw. TLS-Verschlüsselung aktiviert ist, können die Daten, die Sie an uns übermitteln, nicht von Dritten mitgelesen werden.&lt;/p&gt;\r\n&lt;h3&gt;Verschlüsselter Zahlungsverkehr auf dieser Website&lt;/h3&gt; &lt;p&gt;Besteht nach dem Abschluss eines kostenpflichtigen Vertrags eine Verpflichtung, uns Ihre Zahlungsdaten (z.B. Kontonummer bei Einzugsermächtigung) zu übermitteln, werden diese Daten zur Zahlungsabwicklung benötigt.&lt;/p&gt; &lt;p&gt;Der Zahlungsverkehr über die gängigen Zahlungsmittel (Visa/MasterCard, Lastschriftverfahren) erfolgt ausschließlich über eine verschlüsselte SSL- bzw. TLS-Verbindung. Eine verschlüsselte Verbindung erkennen Sie daran, dass die Adresszeile des Browsers von &quot;http://&quot; auf &quot;https://&quot; wechselt und an dem Schloss-Symbol in Ihrer Browserzeile.&lt;/p&gt; &lt;p&gt;Bei verschlüsselter Kommunikation können Ihre Zahlungsdaten, die Sie an uns übermitteln, nicht von Dritten mitgelesen werden.&lt;/p&gt;\r\n&lt;h3&gt;Auskunft, Sperrung, Löschung&lt;/h3&gt; &lt;p&gt;Sie haben im Rahmen der geltenden gesetzlichen Bestimmungen jederzeit das Recht auf unentgeltliche Auskunft über Ihre gespeicherten personenbezogenen Daten, deren Herkunft und Empfänger und den Zweck der Datenverarbeitung und ggf. ein Recht auf Berichtigung, Sperrung oder Löschung dieser Daten. Hierzu sowie zu weiteren Fragen zum Thema personenbezogene Daten können Sie sich jederzeit unter der im Impressum angegebenen Adresse an uns wenden.&lt;/p&gt;\r\n&lt;h3&gt;Widerspruch gegen Werbe-Mails&lt;/h3&gt; &lt;p&gt;Der Nutzung von im Rahmen der Impressumspflicht veröffentlichten Kontaktdaten zur Übersendung von nicht ausdrücklich angeforderter Werbung und Informationsmaterialien wird hiermit widersprochen. Die Betreiber der Seiten behalten sich ausdrücklich rechtliche Schritte im Falle der unverlangten Zusendung von Werbeinformationen, etwa durch Spam-E-Mails, vor.&lt;/p&gt;\r\n&lt;h2&gt;3. Datenerfassung auf unserer Website&lt;/h2&gt;\r\n&lt;h3&gt;Cookies&lt;/h3&gt; &lt;p&gt;Die Internetseiten verwenden teilweise so genannte Cookies. Cookies richten auf Ihrem Rechner keinen Schaden an und enthalten keine Viren. Cookies dienen dazu, unser Angebot nutzerfreundlicher, effektiver und sicherer zu machen. Cookies sind kleine Textdateien, die auf Ihrem Rechner abgelegt werden und die Ihr Browser speichert.&lt;/p&gt; &lt;p&gt;Die meisten der von uns verwendeten Cookies sind so genannte “Session-Cookies”. Sie werden nach Ende Ihres Besuchs automatisch gelöscht. Andere Cookies bleiben auf Ihrem Endgerät gespeichert bis Sie diese löschen. Diese Cookies ermöglichen es uns, Ihren Browser beim nächsten Besuch wiederzuerkennen.&lt;/p&gt; &lt;p&gt;Sie können Ihren Browser so einstellen, dass Sie über das Setzen von Cookies informiert werden und Cookies nur im Einzelfall erlauben, die Annahme von Cookies für bestimmte Fälle oder generell ausschließen sowie das automatische Löschen der Cookies beim Schließen des Browser aktivieren. Bei der Deaktivierung von Cookies kann die Funktionalität dieser Website eingeschränkt sein.&lt;/p&gt; &lt;p&gt;Cookies, die zur Durchführung des elektronischen Kommunikationsvorgangs oder zur Bereitstellung bestimmter, von Ihnen erwünschter Funktionen (z.B. Warenkorbfunktion) erforderlich sind, werden auf Grundlage von Art. 6 Abs. 1 lit. f DSGVO gespeichert. Der Websitebetreiber hat ein berechtigtes Interesse an der Speicherung von Cookies zur technisch fehlerfreien und optimierten Bereitstellung seiner Dienste. Soweit andere Cookies (z.B. Cookies zur Analyse Ihres Surfverhaltens) gespeichert werden, werden diese in dieser Datenschutzerklärung gesondert behandelt.&lt;/p&gt;\r\n&lt;h3&gt;Server-Log-Dateien&lt;/h3&gt; &lt;p&gt;Der Provider der Seiten erhebt und speichert automatisch Informationen in so genannten Server-Log-Dateien, die Ihr Browser automatisch an uns übermittelt. Dies sind:&lt;/p&gt; &lt;ul&gt; &lt;li&gt;Browsertyp und Browserversion&lt;/li&gt; &lt;li&gt;verwendetes Betriebssystem&lt;/li&gt; &lt;li&gt;Referrer URL&lt;/li&gt; &lt;li&gt;Hostname des zugreifenden Rechners&lt;/li&gt; &lt;li&gt;Uhrzeit der Serveranfrage&lt;/li&gt; &lt;li&gt;IP-Adresse&lt;/li&gt; &lt;/ul&gt; &lt;p&gt;Eine Zusammenführung dieser Daten mit anderen Datenquellen wird nicht vorgenommen.&lt;/p&gt; &lt;p&gt;Grundlage für die Datenverarbeitung ist Art. 6 Abs. 1 lit. b DSGVO, der die Verarbeitung von Daten zur Erfüllung eines Vertrags oder vorvertraglicher Maßnahmen gestattet.&lt;/p&gt;\r\n&lt;h3&gt;Kontaktformular&lt;/h3&gt; &lt;p&gt;Wenn Sie uns per Kontaktformular Anfragen zukommen lassen, werden Ihre Angaben aus dem Anfrageformular inklusive der von Ihnen dort angegebenen Kontaktdaten zwecks Bearbeitung der Anfrage und für den Fall von Anschlussfragen bei uns gespeichert. Diese Daten geben wir nicht ohne Ihre Einwilligung weiter.&lt;/p&gt; &lt;p&gt;Die Verarbeitung der in das Kontaktformular eingegebenen Daten erfolgt somit ausschließlich auf Grundlage Ihrer Einwilligung (Art. 6 Abs. 1 lit. a DSGVO). Sie können diese Einwilligung jederzeit widerrufen. Dazu reicht eine formlose Mitteilung per E-Mail an uns. Die Rechtmäßigkeit der bis zum Widerruf erfolgten Datenverarbeitungsvorgänge bleibt vom Widerruf unberührt.&lt;/p&gt; &lt;p&gt;Die von Ihnen im Kontaktformular eingegebenen Daten verbleiben bei uns, bis Sie uns zur Löschung auffordern, Ihre Einwilligung zur Speicherung widerrufen oder der Zweck für die Datenspeicherung entfällt (z.B. nach abgeschlossener Bearbeitung Ihrer Anfrage). Zwingende gesetzliche Bestimmungen – insbesondere Aufbewahrungsfristen – bleiben unberührt.&lt;/p&gt;\r\n&lt;h3&gt;Registrierung auf dieser Website&lt;/h3&gt; &lt;p&gt;Sie können sich auf unserer Website registrieren, um zusätzliche Funktionen auf der Seite zu nutzen. Die dazu eingegebenen Daten verwenden wir nur zum Zwecke der Nutzung des jeweiligen Angebotes oder Dienstes, für den Sie sich registriert haben. Die bei der Registrierung abgefragten Pflichtangaben müssen vollständig angegeben werden. Anderenfalls werden wir die Registrierung ablehnen.&lt;/p&gt; &lt;p&gt;Für wichtige Änderungen etwa beim Angebotsumfang oder bei technisch notwendigen Änderungen nutzen wir die bei der Registrierung angegebene E-Mail-Adresse, um Sie auf diesem Wege zu informieren.&lt;/p&gt; &lt;p&gt;Die Verarbeitung der bei der Registrierung eingegebenen Daten erfolgt auf Grundlage Ihrer Einwilligung (Art. 6 Abs. 1 lit. a DSGVO). Sie können eine von Ihnen erteilte Einwilligung jederzeit widerrufen. Dazu reicht eine formlose Mitteilung per E-Mail an uns. Die Rechtmäßigkeit der bereits erfolgten Datenverarbeitung bleibt vom Widerruf unberührt.&lt;/p&gt; &lt;p&gt;Die bei der Registrierung erfassten Daten werden von uns gespeichert, solange Sie auf unserer Website registriert sind und werden anschließend gelöscht. Gesetzliche Aufbewahrungsfristen bleiben unberührt.&lt;/p&gt;\r\n&lt;h3&gt;Datenübermittlung bei Vertragsschluss für Online-Shops, Händler und Warenversand&lt;/h3&gt; &lt;p&gt;Wir übermitteln personenbezogene Daten an Dritte nur dann, wenn dies im Rahmen der Vertragsabwicklung notwendig ist, etwa an die mit der Lieferung der Ware betrauten Unternehmen oder das mit der Zahlungsabwicklung beauftragte Kreditinstitut. Eine weitergehende Übermittlung der Daten erfolgt nicht bzw. nur dann, wenn Sie der Übermittlung ausdrücklich zugestimmt haben. Eine Weitergabe Ihrer Daten an Dritte ohne ausdrückliche Einwilligung, etwa zu Zwecken der Werbung, erfolgt nicht.&lt;/p&gt; &lt;p&gt;Grundlage für die Datenverarbeitung ist Art. 6 Abs. 1 lit. b DSGVO, der die Verarbeitung von Daten zur Erfüllung eines Vertrags oder vorvertraglicher Maßnahmen gestattet.&lt;/p&gt;\r\n&lt;h2&gt;4. Analyse Tools und Werbung&lt;/h2&gt;\r\n&lt;h3&gt;Google Analytics&lt;/h3&gt; &lt;p&gt;Diese Website nutzt Funktionen des Webanalysedienstes Google Analytics. Anbieter ist die Google Inc., 1600 Amphitheatre Parkway, Mountain View, CA 94043, USA.&lt;/p&gt; &lt;p&gt;Google Analytics verwendet so genannte &quot;Cookies&quot;. Das sind Textdateien, die auf Ihrem Computer gespeichert werden und die eine Analyse der Benutzung der Website durch Sie ermöglichen. Die durch den Cookie erzeugten Informationen über Ihre Benutzung dieser Website werden in der Regel an einen Server von Google in den USA übertragen und dort gespeichert.&lt;/p&gt; &lt;p&gt;Die Speicherung von Google-Analytics-Cookies erfolgt auf Grundlage von Art. 6 Abs. 1 lit. f DSGVO. Der Websitebetreiber hat ein berechtigtes Interesse an der Analyse des Nutzerverhaltens, um sowohl sein Webangebot als auch seine Werbung zu optimieren.&lt;/p&gt; &lt;p&gt;&lt;strong&gt;IP Anonymisierung&lt;/strong&gt;&lt;/p&gt; &lt;p&gt;Wir haben auf dieser Website die Funktion IP-Anonymisierung aktiviert. Dadurch wird Ihre IP-Adresse von Google innerhalb von Mitgliedstaaten der Europäischen Union oder in anderen Vertragsstaaten des Abkommens über den Europäischen Wirtschaftsraum vor der Übermittlung in die USA gekürzt. Nur in Ausnahmefällen wird die volle IP-Adresse an einen Server von Google in den USA übertragen und dort gekürzt. Im Auftrag des Betreibers dieser Website wird Google diese Informationen benutzen, um Ihre Nutzung der Website auszuwerten, um Reports über die Websiteaktivitäten zusammenzustellen und um weitere mit der Websitenutzung und der Internetnutzung verbundene Dienstleistungen gegenüber dem Websitebetreiber zu erbringen. Die im Rahmen von Google Analytics von Ihrem Browser übermittelte IP-Adresse wird nicht mit anderen Daten von Google zusammengeführt.&lt;/p&gt;\r\n &lt;p&gt;&lt;strong&gt;Browser Plugin&lt;/strong&gt;&lt;/p&gt; &lt;p&gt;Sie können die Speicherung der Cookies durch eine entsprechende Einstellung Ihrer Browser-Software verhindern; wir weisen Sie jedoch darauf hin, dass Sie in diesem Fall gegebenenfalls nicht sämtliche Funktionen dieser Website vollumfänglich werden nutzen können. Sie können darüber hinaus die Erfassung der durch den Cookie erzeugten und auf Ihre Nutzung der Website bezogenen Daten (inkl. Ihrer IP-Adresse) an Google sowie die Verarbeitung dieser Daten durch Google verhindern, indem Sie das unter dem folgenden Link verfügbare Browser-Plugin herunterladen und installieren: &lt;a href=&quot;https://tools.google.com/dlpage/gaoptout?hl=de&quot; target=&quot;_blank&quot;&gt;https://tools.google.com/dlpage/gaoptout?hl=de&lt;/a&gt;.&lt;/p&gt; &lt;p&gt;&lt;strong&gt;Widerspruch gegen Datenerfassung&lt;/strong&gt;&lt;/p&gt; &lt;p&gt;Sie können die Erfassung Ihrer Daten durch Google Analytics verhindern, indem Sie auf folgenden Link klicken. Es wird ein Opt-Out-Cookie gesetzt, der die Erfassung Ihrer Daten bei zukünftigen Besuchen dieser Website verhindert: &lt;a href=&quot;javascript:gaOptout();&quot;&gt;Google Analytics deaktivieren&lt;/a&gt;.&lt;/p&gt; &lt;p&gt;Mehr Informationen zum Umgang mit Nutzerdaten bei Google Analytics finden Sie in der Datenschutzerklärung von Google: &lt;a href=&quot;https://support.google.com/analytics/answer/6004245?hl=de&quot; target=&quot;_blank&quot;&gt;https://support.google.com/analytics/answer/6004245?hl=de&lt;/a&gt;.&lt;/p&gt;&lt;p&gt;&lt;strong&gt;Demografische Merkmale bei Google Analytics&lt;/strong&gt;&lt;/p&gt; &lt;p&gt;Diese Website nutzt die Funktion “demografische Merkmale” von Google Analytics. Dadurch können Berichte erstellt werden, die Aussagen zu Alter, Geschlecht und Interessen der Seitenbesucher enthalten. Diese Daten stammen aus interessenbezogener Werbung von Google sowie aus Besucherdaten von Drittanbietern. Diese Daten können keiner bestimmten Person zugeordnet werden. Sie können diese Funktion jederzeit über die Anzeigeneinstellungen in Ihrem Google-Konto deaktivieren oder die Erfassung Ihrer Daten durch Google Analytics wie im Punkt “Widerspruch gegen Datenerfassung” dargestellt generell untersagen.&lt;/p&gt;\r\n\r\n&lt;h3&gt;Google AdWords und Google Conversion-Tracking&lt;/h3&gt; &lt;p&gt;Diese Website verwendet Google AdWords. AdWords ist ein Online-Werbeprogramm der Google Inc., 1600 Amphitheatre Parkway, Mountain View, CA 94043, United States (“Google”).&lt;/p&gt; &lt;p&gt;Im Rahmen von Google AdWords nutzen wir das so genannte Conversion-Tracking. Wenn Sie auf eine von Google geschaltete Anzeige klicken wird ein Cookie für das Conversion-Tracking gesetzt. Bei Cookies handelt es sich um kleine Textdateien, die der Internet-Browser auf dem Computer des Nutzers ablegt. Diese Cookies verlieren nach 30 Tagen ihre Gültigkeit und dienen nicht der persönlichen Identifizierung der Nutzer. Besucht der Nutzer bestimmte Seiten dieser Website und das Cookie ist noch nicht abgelaufen, können Google und wir erkennen, dass der Nutzer auf die Anzeige geklickt hat und zu dieser Seite weitergeleitet wurde.&lt;/p&gt; &lt;p&gt;Jeder Google AdWords-Kunde erhält ein anderes Cookie. Die Cookies können nicht über die Websites von AdWords-Kunden nachverfolgt werden. Die mithilfe des Conversion-Cookies eingeholten Informationen dienen dazu, Conversion-Statistiken für AdWords-Kunden zu erstellen, die sich für Conversion-Tracking entschieden haben. Die Kunden erfahren die Gesamtanzahl der Nutzer, die auf ihre Anzeige geklickt haben und zu einer mit einem Conversion-Tracking-Tag versehenen Seite weitergeleitet wurden. Sie erhalten jedoch keine Informationen, mit denen sich Nutzer persönlich identifizieren lassen. Wenn Sie nicht am Tracking teilnehmen möchten, können Sie dieser Nutzung widersprechen, indem Sie das Cookie des Google Conversion-Trackings über ihren Internet-Browser unter Nutzereinstellungen leicht deaktivieren. Sie werden sodann nicht in die Conversion-Tracking Statistiken aufgenommen.&lt;/p&gt; &lt;p&gt;Die Speicherung von “Conversion-Cookies” erfolgt auf Grundlage von Art. 6 Abs. 1 lit. f DSGVO. Der Websitebetreiber hat ein berechtigtes Interesse an der Analyse des Nutzerverhaltens, um sowohl sein Webangebot als auch seine Werbung zu optimieren.&lt;/p&gt; &lt;p&gt;Mehr Informationen zu Google AdWords und Google Conversion-Tracking finden Sie in den Datenschutzbestimmungen von Google: &lt;a href=&quot;https://www.google.de/policies/privacy/&quot; target=&quot;_blank&quot;&gt;https://www.google.de/policies/privacy/&lt;/a&gt;.&lt;/p&gt; &lt;p&gt;Sie können Ihren Browser so einstellen, dass Sie über das Setzen von Cookies informiert werden und Cookies nur im Einzelfall erlauben, die Annahme von Cookies für bestimmte Fälle oder generell ausschließen sowie das automatische Löschen der Cookies beim Schließen des Browser aktivieren. Bei der Deaktivierung von Cookies kann die Funktionalität dieser Website eingeschränkt sein.&lt;/p&gt;\r\n&lt;h2&gt;5. Plugins und Tools&lt;/h2&gt;\r\n&lt;h3&gt;YouTube&lt;/h3&gt; &lt;p&gt;Unsere Website nutzt Plugins der von Google betriebenen Seite YouTube. Betreiber der Seiten ist die YouTube, LLC, 901 Cherry Ave., San Bruno, CA 94066, USA.&lt;/p&gt; &lt;p&gt;Wenn Sie eine unserer mit einem YouTube-Plugin ausgestatteten Seiten besuchen, wird eine Verbindung zu den Servern von YouTube hergestellt. Dabei wird dem YouTube-Server mitgeteilt, welche unserer Seiten Sie besucht haben.&lt;/p&gt; &lt;p&gt;Wenn Sie in Ihrem YouTube-Account eingeloggt sind, ermöglichen Sie YouTube, Ihr Surfverhalten direkt Ihrem persönlichen Profil zuzuordnen. Dies können Sie verhindern, indem Sie sich aus Ihrem YouTube-Account ausloggen.&lt;/p&gt; &lt;p&gt;Die Nutzung von YouTube erfolgt im Interesse einer ansprechenden Darstellung unserer Online-Angebote. Dies stellt ein berechtigtes Interesse im Sinne von Art. 6 Abs. 1 lit. f DSGVO dar.&lt;/p&gt; &lt;p&gt;Weitere Informationen zum Umgang mit Nutzerdaten finden Sie in der Datenschutzerklärung von YouTube unter: &lt;a href=&quot;https://www.google.de/intl/de/policies/privacy&quot; target=&quot;_blank&quot;&gt;https://www.google.de/intl/de/policies/privacy&lt;/a&gt;.&lt;/p&gt;\r\n&lt;h3&gt;Google Web Fonts&lt;/h3&gt; &lt;p&gt;Diese Seite nutzt zur einheitlichen Darstellung von Schriftarten so genannte Web Fonts, die von Google bereitgestellt werden. Beim Aufruf einer Seite lädt Ihr Browser die benötigten Web Fonts in ihren Browsercache, um Texte und Schriftarten korrekt anzuzeigen.&lt;/p&gt; &lt;p&gt;Zu diesem Zweck muss der von Ihnen verwendete Browser Verbindung zu den Servern von Google aufnehmen. Hierdurch erlangt Google Kenntnis darüber, dass über Ihre IP-Adresse unsere Website aufgerufen wurde. Die Nutzung von Google Web Fonts erfolgt im Interesse einer einheitlichen und ansprechenden Darstellung unserer Online-Angebote. Dies stellt ein berechtigtes Interesse im Sinne von Art. 6 Abs. 1 lit. f DSGVO dar.&lt;/p&gt; &lt;p&gt;Wenn Ihr Browser Web Fonts nicht unterstützt, wird eine Standardschrift von Ihrem Computer genutzt.&lt;/p&gt; &lt;p&gt;Weitere Informationen zu Google Web Fonts finden Sie unter &lt;a href=&quot;https://developers.google.com/fonts/faq&quot; target=&quot;_blank&quot;&gt;https://developers.google.com/fonts/faq&lt;/a&gt; und in der Datenschutzerklärung von Google: &lt;a href=&quot;https://www.google.com/policies/privacy/&quot; target=&quot;_blank&quot;&gt;https://www.google.com/policies/privacy/&lt;/a&gt;.&lt;/p&gt;\r\n&lt;h3&gt;Google Maps&lt;/h3&gt; &lt;p&gt;Diese Seite nutzt über eine API den Kartendienst Google Maps. Anbieter ist die Google Inc., 1600 Amphitheatre Parkway, Mountain View, CA 94043, USA.&lt;/p&gt; &lt;p&gt;Zur Nutzung der Funktionen von Google Maps ist es notwendig, Ihre IP Adresse zu speichern. Diese Informationen werden in der Regel an einen Server von Google in den USA übertragen und dort gespeichert. Der Anbieter dieser Seite hat keinen Einfluss auf diese Datenübertragung.&lt;/p&gt; &lt;p&gt;Die Nutzung von Google Maps erfolgt im Interesse einer ansprechenden Darstellung unserer Online-Angebote und an einer leichten Auffindbarkeit der von uns auf der Website angegebenen Orte. Dies stellt ein berechtigtes Interesse im Sinne von Art. 6 Abs. 1 lit. f DSGVO dar.&lt;/p&gt; &lt;p&gt;Mehr Informationen zum Umgang mit Nutzerdaten finden Sie in der Datenschutzerklärung von Google: &lt;a href=&quot;https://www.google.de/intl/de/policies/privacy/&quot; target=&quot;_blank&quot;&gt;https://www.google.de/intl/de/policies/privacy/&lt;/a&gt;.&lt;/p&gt;\r\n&lt;h2&gt;6. Zahlungsanbieter&lt;/h2&gt;\r\n&lt;h3&gt;PayPal&lt;/h3&gt; &lt;p&gt;Auf unserer Website bieten wir u.a. die Bezahlung via PayPal an. Anbieter dieses Zahlungsdienstes ist die PayPal (Europe) S.à.r.l. et Cie, S.C.A., 22-24 Boulevard Royal, L-2449 Luxembourg (im Folgenden “PayPal”).&lt;/p&gt; &lt;p&gt;Wenn Sie die Bezahlung via PayPal auswählen, werden die von Ihnen eingegebenen Zahlungsdaten an PayPal übermittelt.&lt;/p&gt; &lt;p&gt;Die Übermittlung Ihrer Daten an PayPal erfolgt auf Grundlage von Art. 6 Abs. 1 lit. a DSGVO (Einwilligung) und Art. 6 Abs. 1 lit. b DSGVO (Verarbeitung zur Erfüllung eines Vertrags). Sie haben die Möglichkeit, Ihre Einwilligung zur Datenverarbeitung jederzeit zu widerrufen. Ein Widerruf wirkt sich auf die Wirksamkeit von in der Vergangenheit liegenden Datenverarbeitungsvorgängen nicht aus.&lt;/p&gt;\r\n', 'Privacy Policy', '', '');
INSERT INTO `oc_information_description` (`information_id`, `language_id`, `title`, `description`, `meta_title`, `meta_description`, `meta_keyword`) VALUES
(5, 2, 'AGB', '&lt;h1&gt;Allgemeine Geschäftsbedingungen mit Kundeninformationen&lt;/h1&gt;\r\n\r\n&lt;h2&gt;Inhaltsverzeichnis&lt;/h2&gt;\r\n&lt;ol&gt;\r\n&lt;li&gt;Geltungsbereich&lt;/li&gt;\r\n&lt;li&gt;Vertragsschluss&lt;/li&gt;\r\n&lt;li&gt;Widerrufsrecht&lt;/li&gt;\r\n&lt;li&gt;Preise und Zahlungsbedingungen&lt;/li&gt;\r\n&lt;li&gt;Liefer- und Versandbedingungen&lt;/li&gt;\r\n&lt;li&gt;Eigentumsvorbehalt&lt;/li&gt;\r\n&lt;li&gt;Mängelhaftung (Gewährleistung)&lt;/li&gt;\r\n&lt;li&gt;Anwendbares Recht&lt;/li&gt;\r\n&lt;li&gt;Gerichtsstand&lt;/li&gt;\r\n&lt;li&gt;Alternative Streitbeilegung&lt;/li&gt;&lt;li&gt;Umgang mit Gas. u. Schreckschusswaffen&lt;/li&gt;\r\n&lt;/ol&gt;\r\n\r\n&lt;h2&gt;1) Geltungsbereich&lt;/h2&gt;\r\n\r\n&lt;p&gt;&lt;b&gt;1.1&lt;/b&gt; Diese Allgemeinen Geschäftsbedingungen (nachfolgend &quot;AGB&quot;) der Waffen-Bock, Carl Bock KG (nachfolgend &quot;Verkäufer&quot;), gelten für alle Verträge über die Lieferung von Waren, die ein Verbraucher oder Unternehmer (nachfolgend „Kunde“) mit dem Verkäufer hinsichtlich der vom Verkäufer in seinem Online-Shop dargestellten Waren abschließt. Hiermit wird der Einbeziehung von eigenen Bedingungen des Kunden widersprochen, es sei denn, es ist etwas anderes vereinbart.&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;b&gt;1.2&lt;/b&gt; Verbraucher im Sinne dieser AGB ist jede natürliche Person, die ein Rechtsgeschäft zu Zwecken abschließt, die überwiegend weder ihrer gewerblichen noch ihrer selbständigen beruflichen Tätigkeit zugerechnet werden können. Unternehmer im Sinne dieser AGB ist eine natürliche oder juristische Person oder eine rechtsfähige Personengesellschaft, die bei Abschluss eines Rechtsgeschäfts in Ausübung ihrer gewerblichen oder selbständigen beruflichen Tätigkeit handelt.&lt;/p&gt;\r\n\r\n&lt;h2&gt;2) Vertragsschluss&lt;/h2&gt;\r\n\r\n&lt;p&gt;&lt;b&gt;2.1&lt;/b&gt; Die im Online-Shop des Verkäufers enthaltenen Produktbeschreibungen stellen keine verbindlichen Angebote seitens des Verkäufers dar, sondern dienen zur Abgabe eines verbindlichen Angebots durch den Kunden.&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;b&gt;2.2&lt;/b&gt; Der Kunde kann das Angebot über das in den Online-Shop des Verkäufers integrierte Online-Bestellformular abgeben. Dabei gibt der Kunde, nachdem er die ausgewählten Waren in den virtuellen Warenkorb gelegt und den elektronischen Bestellprozess durchlaufen hat, durch Klicken des den Bestellvorgang abschließenden Buttons ein rechtlich verbindliches Vertragsangebot in Bezug auf die im Warenkorb enthaltenen Waren ab. Ferner kann der Kunde das Angebot auch per E-Mail gegenüber dem Verkäufer abgeben.&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;b&gt;2.3&lt;/b&gt; Der Verkäufer kann das Angebot des Kunden innerhalb von fünf Tagen annehmen,&lt;/p&gt;\r\n\r\n&lt;ul&gt;\r\n&lt;li&gt;indem er dem Kunden eine schriftliche Auftragsbestätigung oder eine Auftragsbestätigung in Textform (Fax oder E-Mail) übermittelt, wobei insoweit der Zugang der Auftragsbestätigung beim Kunden maßgeblich ist, oder&lt;/li&gt;\r\n&lt;li&gt;indem er dem Kunden die bestellte Ware liefert, wobei insoweit der Zugang der Ware beim Kunden maßgeblich ist, oder&lt;/li&gt;\r\n&lt;li&gt;indem er den Kunden nach Abgabe von dessen Bestellung zur Zahlung auffordert.&lt;/li&gt;\r\n&lt;/ul&gt;\r\n\r\n&lt;p&gt;Liegen mehrere der vorgenannten Alternativen vor, kommt der Vertrag in dem Zeitpunkt zustande, in dem eine der vorgenannten Alternativen zuerst eintritt. Die Frist zur Annahme des Angebots beginnt am Tag nach der Absendung des Angebots durch den Kunden zu laufen und endet mit dem Ablauf des fünften Tages, welcher auf die Absendung des Angebots folgt. Nimmt der Verkäufer das Angebot des Kunden innerhalb vorgenannter Frist nicht an, so gilt dies als Ablehnung des Angebots mit der Folge, dass der Kunde nicht mehr an seine Willenserklärung gebunden ist.&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;b&gt;2.4&lt;/b&gt; Bei der Abgabe eines Angebots über das Online-Bestellformular des Verkäufers wird der Vertragstext vom Verkäufer gespeichert und dem Kunden nach Absendung seiner Bestellung nebst den vorliegenden AGB in Textform (z. B. E-Mail, Fax oder Brief) zugeschickt. Zusätzlich wird der Vertragstext auf der Internetseite des Verkäufers archiviert und kann vom Kunden über sein passwortgeschütztes Kundenkonto unter Angabe der entsprechenden Login-Daten kostenlos abgerufen werden, sofern der Kunde vor Absendung seiner Bestellung ein Kundenkonto im Online-Shop des Verkäufers angelegt hat.&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;b&gt;2.5&lt;/b&gt; Vor verbindlicher Abgabe der Bestellung über das Online-Bestellformular des Verkäufers kann der Kunde mögliche Eingabefehler durch aufmerksames Lesen der auf dem Bildschirm dargestellten Informationen erkennen. Ein wirksames technisches Mittel zur besseren Erkennung von Eingabefehlern kann dabei die Vergrößerungsfunktion des Browsers sein, mit deren Hilfe die Darstellung auf dem Bildschirm vergrößert wird. Seine Eingaben kann der Kunde im Rahmen des elektronischen Bestellprozesses so lange über die üblichen Tastatur- und Mausfunktionen korrigieren, bis er den den Bestellvorgang abschließenden Button anklickt.&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;b&gt;2.6&lt;/b&gt; Für den Vertragsschluss steht ausschließlich die deutsche Sprache zur Verfügung.&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;b&gt;2.7&lt;/b&gt; Die Bestellabwicklung und Kontaktaufnahme finden in der Regel per E-Mail und automatisierter Bestellabwicklung statt. Der Kunde hat sicherzustellen, dass die von ihm zur Bestellabwicklung angegebene E-Mail-Adresse zutreffend ist, so dass unter dieser Adresse die vom Verkäufer versandten E-Mails empfangen werden können. Insbesondere hat der Kunde bei dem Einsatz von SPAM-Filtern sicherzustellen, dass alle vom Verkäufer oder von diesem mit der Bestellabwicklung beauftragten Dritten versandten E-Mails zugestellt werden können.&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;b&gt;2.8&lt;/b&gt; Für Verträge über die Lieferung von Waffen gelten zusätzlich die nachfolgenden Bedingungen:&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;b&gt;2.8.1&lt;/b&gt; Bei einer Bestellung von Waren, die durch das Waffengesetz der Bundesrepublik Deutschland (WaffG) erfasst sind, muss der Kunde volljährig sein. Kunden, die Waffen und Munition erwerben wollen, die in Anlage 2 des WaffG als erlaubnispflichtige Waffen und Munition aufgeführt sind, müssen eine Erwerbserlaubnis besitzen. Der Verkäufer weist in der jeweiligen Artikelbeschreibung darauf hin, wenn es sich um eine Ware handelt, die vom WaffG erfasst wird bzw. die erlaubnispflichtig im Sinne der Anlage 2 des WaffG ist.&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;b&gt;2.8.2&lt;/b&gt; Bei einer Bestellung von Waren, die durch das Waffengesetz erfasst sind, versichert der Kunde mit Absendung seiner Bestellung, dass er mindestens 18 Jahre alt ist und dass seine Angaben zu seinem Namen und zu seiner Adresse richtig sind. Der Kunde verpflichtet sich weiterhin, dass nur er selbst oder eine von ihm zur Entgegennahme der Lieferung ermächtigte volljährige Person die Ware in Empfang nimmt. Der Verkäufer weist seinen mit der Lieferung beauftragten Beförderer an, die Lieferung nur an Personen zu übergeben, die das 18. Lebensjahr vollendet haben. Der Logistikdienstleister wird sich im Zweifel den Personalausweis der die Ware in Empfang nehmenden Person zur Alterskontrolle vorzeigen lassen.&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;b&gt;2.8.3&lt;/b&gt; Bei einer Bestellung von Waren, die nach dem Waffengesetz erlaubnispflichtig sind, ist zusätzlich der Nachweis der Erwerbserlaubnis zu erbringen. Erlaubnispflichtige Waren werden nur gegen Vorlage einer gültigen Erwerbserlaubnis im Original oder als öffentlich (amtlich oder notariell) beglaubigte Kopie aller beschrifteten Seiten verkauft und ausgeliefert. Der Verkäufer weist seinen mit der Lieferung beauftragten Beförderer an, eine Legitimationsprüfung des berechtigten Empfängers bei Aushändigung der erlaubnispflichtigen Ware vorzunehmen.&lt;/p&gt;\r\n\r\n&lt;h2&gt;3) Widerrufsrecht&lt;/h2&gt;\r\n\r\n&lt;p&gt;&lt;b&gt;3.1&lt;/b&gt; Verbrauchern steht grundsätzlich ein Widerrufsrecht zu.&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;b&gt;3.2&lt;/b&gt; Nähere Informationen zum Widerrufsrecht ergeben sich aus der Widerrufsbelehrung des Verkäufers.&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;b&gt;3.3&lt;/b&gt; Das Widerrufsrecht gilt nicht für Verbraucher, die zum Zeitpunkt des Vertragsschlusses keinem Mitgliedstaat der Europäischen Union angehören und deren alleiniger Wohnsitz und Lieferadresse zum Zeitpunkt des Vertragsschlusses außerhalb der Europäischen Union liegen.&lt;/p&gt;\r\n\r\n&lt;h2&gt;4) Preise und Zahlungsbedingungen&lt;/h2&gt;\r\n\r\n&lt;p&gt;&lt;b&gt;4.1&lt;/b&gt; Sofern sich aus der Produktbeschreibung des Verkäufers nichts anderes ergibt, handelt es sich bei den angegebenen Preisen um Gesamtpreise, die die gesetzliche Umsatzsteuer enthalten. Gegebenenfalls zusätzlich anfallende Liefer- und Versandkosten werden in der jeweiligen Produktbeschreibung gesondert angegeben.&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;b&gt;4.2&lt;/b&gt; Bei Lieferungen in Länder außerhalb der Europäischen Union können im Einzelfall weitere Kosten anfallen, die der Verkäufer nicht zu vertreten hat und die vom Kunden zu tragen sind. Hierzu zählen beispielsweise Kosten für die Geldübermittlung durch Kreditinstitute (z.B. Überweisungsgebühren, Wechselkursgebühren) oder einfuhrrechtliche Abgaben bzw. Steuern (z.B. Zölle). Solche Kosten können in Bezug auf die Geldübermittlung auch dann anfallen, wenn die Lieferung nicht in ein Land außerhalb der Europäischen Union erfolgt, der Kunde die Zahlung aber von einem Land außerhalb der Europäischen Union aus vornimmt.&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;b&gt;4.3&lt;/b&gt; Die Zahlungsmöglichkeit/en wird/werden dem Kunden im Online-Shop des Verkäufers mitgeteilt.&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;b&gt;4.4&lt;/b&gt; Bei Zahlung mittels einer von PayPal angebotenen Zahlungsart erfolgt die Zahlungsabwicklung über den Zahlungsdienstleister PayPal (Europe) S.à r.l. et Cie, S.C.A., 22-24 Boulevard Royal, L-2449 Luxembourg (im Folgenden: &quot;PayPal&quot;), unter Geltung der PayPal-Nutzungsbedingungen, einsehbar unter https://www.paypal.com/de/webapps/mpp/ua/useragreement-full oder - falls der Kunde nicht über ein PayPal-Konto verfügt – unter Geltung der Bedingungen für Zahlungen ohne PayPal-Konto, einsehbar unter https://www.paypal.com/de/webapps/mpp/ua/privacywax-full.&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;b&gt;4.5&lt;/b&gt; Bei Auswahl der Zahlungsart „SOFORT“ erfolgt die Zahlungsabwicklung über den Zahlungsdienstleister SOFORT GmbH, Theresienhöhe 12, 80339 München (im Folgenden „SOFORT“). Um den Rechnungsbetrag über „SOFORT“ bezahlen zu können, muss der Kunde über ein für die Teilnahme an „SOFORT“ frei geschaltetes Online-Banking-Konto mit PIN/TAN-Verfahren verfügen, sich beim Zahlungsvorgang entsprechend legitimieren und die Zahlungsanweisung gegenüber „SOFORT“ bestätigen. Die Zahlungstransaktion wird unmittelbar danach von „SOFORT“ durchgeführt und das Bankkonto des Kunden belastet. Nähere Informationen zur Zahlungsart „SOFORT“ kann der Kunde im Internet unter https://www.klarna.com/sofort/ abrufen.&lt;/p&gt;\r\n\r\n&lt;h2&gt;5) Liefer- und Versandbedingungen&lt;/h2&gt;\r\n\r\n&lt;p&gt;&lt;b&gt;5.1&lt;/b&gt; Die Lieferung von Waren erfolgt auf dem Versandweg an die vom Kunden angegebene Lieferanschrift, sofern nichts anderes vereinbart ist. Bei der Abwicklung der Transaktion ist die in der Bestellabwicklung des Verkäufers angegebene Lieferanschrift maßgeblich.&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;b&gt;5.2&lt;/b&gt; Sendet das Transportunternehmen die versandte Ware an den Verkäufer zurück, da eine Zustellung beim Kunden nicht möglich war, trägt der Kunde die Kosten für den erfolglosen Versand. Dies gilt nicht, wenn der Kunde den Umstand, der zur Unmöglichkeit der Zustellung geführt hat, nicht zu vertreten hat oder wenn er vorübergehend an der Annahme der angebotenen Leistung verhindert war, es sei denn, dass der Verkäufer ihm die Leistung eine angemessene Zeit vorher angekündigt hatte. Ferner gilt dies im Hinblick auf die Kosten für die Hinsendung nicht, wenn der Kunde sein Widerrufsrecht wirksam ausübt. Für die Rücksendekosten gilt bei wirksamer Ausübung des Widerrufsrechts durch den Kunden die in der Widerrufsbelehrung des Verkäufers hierzu getroffene Regelung.&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;b&gt;5.3&lt;/b&gt; Bei Selbstabholung informiert der Verkäufer den Kunden zunächst per E-Mail darüber, dass die von ihm bestellte Ware zur Abholung bereit steht. Nach Erhalt dieser E-Mail kann der Kunde die Ware nach Absprache mit dem Verkäufer am Sitz des Verkäufers abholen. In diesem Fall werden keine Versandkosten berechnet.&lt;/p&gt;\r\n\r\n&lt;h2&gt;6) Eigentumsvorbehalt&lt;/h2&gt;\r\n\r\n&lt;p&gt;Tritt der Verkäufer in Vorleistung, behält er sich bis zur vollständigen Bezahlung des geschuldeten Kaufpreises das Eigentum an der gelieferten Ware vor.&lt;/p&gt;\r\n\r\n&lt;h2&gt;7) Mängelhaftung (Gewährleistung)&lt;/h2&gt;\r\n\r\n&lt;p&gt;&lt;b&gt;7.1&lt;/b&gt; Ist die Kaufsache mangelhaft, gelten die Vorschriften der gesetzlichen Mängelhaftung.&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;b&gt;7.2&lt;/b&gt; Der Kunde wird gebeten, angelieferte Waren mit offensichtlichen Transportschäden bei dem Zusteller zu reklamieren und den Verkäufer hiervon in Kenntnis zu setzen. Kommt der Kunde dem nicht nach, hat dies keinerlei Auswirkungen auf seine gesetzlichen oder vertraglichen Mängelansprüche.&lt;/p&gt;\r\n\r\n&lt;h2&gt;8) Anwendbares Recht&lt;/h2&gt;\r\n\r\n&lt;p&gt;&lt;b&gt;8.1&lt;/b&gt; Für sämtliche Rechtsbeziehungen der Parteien gilt das Recht der Bundesrepublik Deutschland unter Ausschluss der Gesetze über den internationalen Kauf beweglicher Waren. Bei Verbrauchern gilt diese Rechtswahl nur insoweit, als nicht der gewährte Schutz durch zwingende Bestimmungen des Rechts des Staates, in dem der Verbraucher seinen gewöhnlichen Aufenthalt hat, entzogen wird.&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;b&gt;8.2&lt;/b&gt; Ferner gilt diese Rechtswahl im Hinblick auf das gesetzliche Widerrufsrecht nicht bei Verbrauchern, die zum Zeitpunkt des Vertragsschlusses keinem Mitgliedstaat der Europäischen Union angehören und deren alleiniger Wohnsitz und Lieferadresse zum Zeitpunkt des Vertragsschlusses außerhalb der Europäischen Union liegen.&lt;/p&gt;\r\n\r\n&lt;h2&gt;9) Gerichtsstand&lt;/h2&gt;\r\n\r\n&lt;p&gt;Handelt der Kunde als Kaufmann, juristische Person des öffentlichen Rechts oder öffentlich-rechtliches Sondervermögen mit Sitz im Hoheitsgebiet der Bundesrepublik Deutschland, ist ausschließlicher Gerichtsstand für alle Streitigkeiten aus diesem Vertrag der Geschäftssitz des Verkäufers. Hat der Kunde seinen Sitz außerhalb des Hoheitsgebiets der Bundesrepublik Deutschland, so ist der Geschäftssitz des Verkäufers ausschließlicher Gerichtsstand für alle Streitigkeiten aus diesem Vertrag, wenn der Vertrag oder Ansprüche aus dem Vertrag der beruflichen oder gewerblichen Tätigkeit des Kunden zugerechnet werden können. Der Verkäufer ist in den vorstehenden Fällen jedoch in jedem Fall berechtigt, das Gericht am Sitz des Kunden anzurufen.&lt;/p&gt;\r\n\r\n&lt;h2&gt;10) Alternative Streitbeilegung&lt;/h2&gt;\r\n\r\n&lt;p&gt;&lt;b&gt;10.1&lt;/b&gt; Die EU-Kommission stellt im Internet unter folgendem Link eine Plattform zur Online-Streitbeilegung bereit: https://ec.europa.eu/consumers/odr&lt;/p&gt;\r\n\r\n&lt;p&gt;Diese Plattform dient als Anlaufstelle zur außergerichtlichen Beilegung von Streitigkeiten aus Online-Kauf- oder Dienstleistungsverträgen, an denen ein Verbraucher beteiligt ist.&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;b&gt;10.2&lt;/b&gt; Der Verkäufer ist zur Teilnahme an einem Streitbeilegungsverfahren vor einer Verbraucherschlichtungsstelle weder verpflichtet noch bereit.&lt;/p&gt;&lt;h2&gt;11) Umgang mit Gas. und Schreckschusswaffen&lt;/h2&gt;&lt;p&gt;Umgang mit Gas- und Signalwaffen seit dem 01. April 2003&lt;/p&gt;&lt;p&gt;1. Erwerb und Besitz von Gas- und Signalwaffen&lt;/p&gt;&lt;p&gt;Der Erwerb und Besitz von Gas- und Signalwaffen, die der zugelassenen Bauart nach § 8 Beschussgesetz entsprechen und ein PTB-Zulassungszeichen tragen, und der dazugehörigen Munition ist weiterhin erlaubnisfrei ab 18 Jahren.&lt;/p&gt;&lt;p&gt;2. Führen von Gas- und Signalwaffen&lt;/p&gt;&lt;p&gt;Nur wer die tatsachliche Gewalt über Gas- und Signalwaffen außerhalb der eigenen Wohnung, Geschäftsräume oder des eigenen befriedeten Besitztums ausüben will (führen), bedarf einer behördlichen Erlaubnis – kleiner Waffenschein – (§ 10 Abs. 4 Satz 4 i.V.m. Anlage 2 Abschnitt 2 Unterabschnitt 3 Nr. 2 und 2.1 WaffG-neu). Für den Transport von Gas- und Signalwaffen, die weder schuss- noch zugriffsbereit sind, bedarf es keines kleinen Waffenscheins (z.B. Transport zum Büchsenmacher).&lt;/p&gt;&lt;p&gt;Der kleine Waffenschein wird auf Antrag von der örtlich zuständigen Waffenbehörde erteilt, wenn der Antragsteller zuverlässig ist und die persönliche Eignung besitzt.&lt;/p&gt;&lt;p&gt;Wer mit Gas- und Signalwaffen nur in seiner eigenen Wohnung, Geschäfträumen oder des eigenen befriedeten Besitztums umgehen will, braucht keine Erlaubnis.&lt;/p&gt;&lt;p&gt;3. Schießen mit Gas- und Signalwaffen&lt;/p&gt;&lt;p&gt;Jedes Schießen außerhalb von Schießständen ist erlaubnispflichtig.&lt;/p&gt;&lt;p&gt;Ausnahmen gemäß § 12 Abs. 4 WaffG-neu:&lt;/p&gt;&lt;p&gt;a) Notwehr, Notstand&lt;/p&gt;&lt;p&gt;b) mit Signalwaffen bei Not- und Rettungsübungen&lt;/p&gt;&lt;p&gt;c) mit Schußwaffen aus denen nur Kartuschenmunition verschossen werden kann&lt;/p&gt;&lt;p&gt;(1) durch Mitwirkende an Theateraufführungen und diesen gleich zu achtende Vorführungen,&lt;/p&gt;&lt;p&gt;(2) zum Vertreiben von Vögeln in landwirtschaftlichen Betrieben&lt;/p&gt;&lt;p&gt;d) im befriedeten Besitztum – mit Genehmigung des Inhabers des Hausrechtes – mit Schußwaffen, aus denen nur Kartuschenmunition verschossen werden kann,&lt;/p&gt;&lt;p&gt;e) mit Schreckschuss- oder Signalwaffen zur Abgabe von Start- oder Beendigungszeichen im Auftrag der Veranstalter bei Sportveranstaltungen, wenn optische oder akustische Signalgebung erforderlich ist.&lt;/p&gt;&lt;p&gt;4. Hinweis- und Protokollierpflicht des Händlers beim „Kleinen Waffenschein“&lt;/p&gt;&lt;p&gt;Im gewerbsmäßigen Waffenhandel (Direkt- und Versandhandel) ist beim Überlassen von Schreckschuss-, Reizstoff- und Signalwaffen auf das Erfordernis des Kleinen Waffenscheins und einer Schießerlaubnis sowie auf die Strafbarkeit des Führens ohne Kleinen Waffenschein hinzuweisen und dieser Hinweis zu protokollieren (§ 35 Abs. 2 WaffG-neu).&lt;/p&gt;&lt;p&gt;Das Abschießen von pyrotechnischer Munition zu Silvester vom eigenen befriedeten Besitztum oder vom befriedeten Besitztum eines anderen mit Zustimmung des Inhabers des Hausrechts ist frei von waffenrechtlichen Erlaubnispflichten zulässig, wenn es den Vorgaben der Verwendersicherheit (also Schießen senkrecht nach oben, nicht in der Nähe von leicht brennbaren Objekten usw.) entspricht. Der Transport der Waffe zum Silvesterschiessen von Ort zu Ort ist erlaubnisfrei, wenn die Waffe nicht schuss- und zugriffsbereit transportiert wird, also ohne Kleinen Waffenschein.&lt;/p&gt;&lt;p&gt;Diese Auffassung vertritt auch das Bundesministerium des Innern und teilte uns dies mit Schreiben vom 22. Juli 2004 mit.&lt;/p&gt;&lt;p&gt;&lt;br&gt;&lt;/p&gt;', 'Terms &amp; Conditions', '', ''),
(7, 2, 'Impressum', '&lt;h1&gt;Impressum&lt;/h1&gt;\r\n\r\n&lt;h2&gt;Angaben gemäß § 5 TMG:&lt;/h2&gt;\r\n&lt;p&gt;Waffen-Bock Carl Bock KG &lt;br&gt;\r\nBerliner Str. 28 &lt;br&gt;\r\n60311 Frankfurt am Main&lt;/p&gt;\r\n\r\n&lt;h2&gt;Vertreten durch:&lt;/h2&gt;\r\n&lt;p&gt;Günter Lingenberg&lt;br&gt;\r\nFrank Lingenberg&lt;/p&gt;\r\n\r\n&lt;h2&gt;Kontakt:&lt;/h2&gt;\r\n&lt;p&gt;Telefon: 069/285590&lt;br&gt;\r\nTelefax: 069/289801&lt;br&gt;\r\nE-Mail: info@waffen-bock.de&lt;/p&gt;\r\n\r\n&lt;h2&gt;Registereintrag:&lt;/h2&gt;\r\n&lt;p&gt;Eintragung im Handelsregister. &lt;br&gt;\r\nRegistergericht:Frankfurt am Main &lt;br&gt;\r\nRegisternummer: 14370&lt;/p&gt;\r\n\r\n&lt;h2&gt;Umsatzsteuer:&lt;/h2&gt;\r\n&lt;p&gt;Umsatzsteuer-Identifikationsnummer gemäß §27 a Umsatzsteuergesetz:&lt;br&gt;\r\nDE111998411&lt;/p&gt;\r\n\r\n&lt;h2 style=&quot;font-family: &amp;quot;Open Sans&amp;quot;, sans-serif; color: rgb(0, 0, 0);&quot;&gt;Umsetzung/Programmierung&lt;/h2&gt;&lt;p&gt;Skibicki, Technik und Gestaltung&amp;nbsp;&lt;a href=&quot;http://www.skibicki.biz/&quot; target=&quot;_blank&quot;&gt;www.skibicki.biz&lt;/a&gt;&lt;br&gt;&lt;/p&gt;&lt;p&gt;pixel-dusche.de, Björn Knetter&amp;nbsp;&amp;nbsp;&lt;a href=&quot;http://www.pixel-dusche.de&quot; target=&quot;_blank&quot;&gt;www.pixel-dusche.de&lt;/a&gt;&lt;br&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;font-size: 25px;&quot;&gt;Streitschlichtung&lt;/span&gt;&lt;br&gt;&lt;/p&gt;&lt;p&gt;Die Europäische Kommission stellt eine Plattform zur Online-Streitbeilegung (OS) bereit:&amp;nbsp;&lt;a href=&quot;https://ec.europa.eu/consumers/odr&quot; target=&quot;_blank&quot;&gt;https://ec.europa.eu/consumers/odr&lt;/a&gt;.&lt;br&gt;Unsere E-Mail-Adresse finden Sie oben im Impressum.&lt;/p&gt;&lt;p&gt;Wir sind nicht bereit oder verpflichtet, an Streitbeilegungsverfahren vor einer Verbraucherschlichtungsstelle teilzunehmen.&lt;/p&gt;&lt;h2&gt;Haftung für Inhalte&lt;br&gt;&lt;/h2&gt; &lt;p&gt;Als Diensteanbieter sind wir gemäß § 7 Abs.1 TMG für eigene Inhalte auf diesen Seiten nach den allgemeinen Gesetzen verantwortlich. Nach §§ 8 bis 10 TMG sind wir als Diensteanbieter jedoch nicht verpflichtet, übermittelte oder gespeicherte fremde Informationen zu überwachen oder nach Umständen zu forschen, die auf eine rechtswidrige Tätigkeit hinweisen.&lt;/p&gt; &lt;p&gt;Verpflichtungen zur Entfernung oder Sperrung der Nutzung von Informationen nach den allgemeinen Gesetzen bleiben hiervon unberührt. Eine diesbezügliche Haftung ist jedoch erst ab dem Zeitpunkt der Kenntnis einer konkreten Rechtsverletzung möglich. Bei Bekanntwerden von entsprechenden Rechtsverletzungen werden wir diese Inhalte umgehend entfernen.&lt;/p&gt; &lt;h3&gt;Haftung für Links&lt;/h3&gt; &lt;p&gt;Unser Angebot enthält Links zu externen Websites Dritter, auf deren Inhalte wir keinen Einfluss haben. Deshalb können wir für diese fremden Inhalte auch keine Gewähr übernehmen. Für die Inhalte der verlinkten Seiten ist stets der jeweilige Anbieter oder Betreiber der Seiten verantwortlich. Die verlinkten Seiten wurden zum Zeitpunkt der Verlinkung auf mögliche Rechtsverstöße überprüft. Rechtswidrige Inhalte waren zum Zeitpunkt der Verlinkung nicht erkennbar.&lt;/p&gt; &lt;p&gt;Eine permanente inhaltliche Kontrolle der verlinkten Seiten ist jedoch ohne konkrete Anhaltspunkte einer Rechtsverletzung nicht zumutbar. Bei Bekanntwerden von Rechtsverletzungen werden wir derartige Links umgehend entfernen.&lt;/p&gt; &lt;h3&gt;Urheberrecht&lt;/h3&gt; &lt;p&gt;Die durch die Seitenbetreiber erstellten Inhalte und Werke auf diesen Seiten unterliegen dem deutschen Urheberrecht. Die Vervielfältigung, Bearbeitung, Verbreitung und jede Art der Verwertung außerhalb der Grenzen des Urheberrechtes bedürfen der schriftlichen Zustimmung des jeweiligen Autors bzw. Erstellers. Downloads und Kopien dieser Seite sind nur für den privaten, nicht kommerziellen Gebrauch gestattet.&lt;/p&gt; &lt;p&gt;Soweit die Inhalte auf dieser Seite nicht vom Betreiber erstellt wurden, werden die Urheberrechte Dritter beachtet. Insbesondere werden Inhalte Dritter als solche gekennzeichnet. Sollten Sie trotzdem auf eine Urheberrechtsverletzung aufmerksam werden, bitten wir um einen entsprechenden Hinweis. Bei Bekanntwerden von Rechtsverletzungen werden wir derartige Inhalte umgehend entfernen.&lt;/p&gt;\r\n\r\n', 'Impressum', '', ''),
(7, 1, 'Imprint', '&lt;h1&gt;Impressum&lt;/h1&gt;\r\n\r\n&lt;h2&gt;Angaben gemäß § 5 TMG:&lt;/h2&gt;\r\n&lt;p&gt;Waffen-Bock Carl Bock KG &lt;br&gt;\r\nBerliner Str. 28 &lt;br&gt;\r\n60311 Frankfurt am Main&lt;/p&gt;\r\n\r\n&lt;h2&gt;Vertreten durch:&lt;/h2&gt;\r\n&lt;p&gt;Günter Lingenberg&lt;br&gt;\r\nFrank Lingenberg&lt;/p&gt;\r\n\r\n&lt;h2&gt;Kontakt:&lt;/h2&gt;\r\n&lt;p&gt;Telefon: 069/285590&lt;br&gt;\r\nTelefax: 069/289801&lt;br&gt;\r\nE-Mail: info@waffen-bock.de&lt;/p&gt;\r\n\r\n&lt;h2&gt;Registereintrag:&lt;/h2&gt;\r\n&lt;p&gt;Eintragung im Handelsregister. &lt;br&gt;\r\nRegistergericht:Frankfurt am Main &lt;br&gt;\r\nRegisternummer: 14370&lt;/p&gt;\r\n\r\n&lt;h2&gt;Umsatzsteuer:&lt;/h2&gt;\r\n&lt;p&gt;Umsatzsteuer-Identifikationsnummer gemäß §27 a Umsatzsteuergesetz:&lt;br&gt;\r\nDE111998411&lt;/p&gt;\r\n\r\n&lt;h2&gt;Streitschlichtung&lt;/h2&gt;\r\n&lt;p&gt;Die Europäische Kommission stellt eine Plattform zur Online-Streitbeilegung (OS) bereit: &lt;a href=&quot;https://ec.europa.eu/consumers/odr&quot; target=&quot;_blank&quot;&gt;https://ec.europa.eu/consumers/odr&lt;/a&gt;.&lt;br&gt; Unsere E-Mail-Adresse finden Sie oben im Impressum.&lt;/p&gt;\r\n\r\n&lt;p&gt;Wir sind nicht bereit oder verpflichtet, an Streitbeilegungsverfahren vor einer Verbraucherschlichtungsstelle teilzunehmen.&lt;/p&gt;\r\n\r\n&lt;h3&gt;Haftung für Inhalte&lt;/h3&gt; &lt;p&gt;Als Diensteanbieter sind wir gemäß § 7 Abs.1 TMG für eigene Inhalte auf diesen Seiten nach den allgemeinen Gesetzen verantwortlich. Nach §§ 8 bis 10 TMG sind wir als Diensteanbieter jedoch nicht verpflichtet, übermittelte oder gespeicherte fremde Informationen zu überwachen oder nach Umständen zu forschen, die auf eine rechtswidrige Tätigkeit hinweisen.&lt;/p&gt; &lt;p&gt;Verpflichtungen zur Entfernung oder Sperrung der Nutzung von Informationen nach den allgemeinen Gesetzen bleiben hiervon unberührt. Eine diesbezügliche Haftung ist jedoch erst ab dem Zeitpunkt der Kenntnis einer konkreten Rechtsverletzung möglich. Bei Bekanntwerden von entsprechenden Rechtsverletzungen werden wir diese Inhalte umgehend entfernen.&lt;/p&gt; &lt;h3&gt;Haftung für Links&lt;/h3&gt; &lt;p&gt;Unser Angebot enthält Links zu externen Websites Dritter, auf deren Inhalte wir keinen Einfluss haben. Deshalb können wir für diese fremden Inhalte auch keine Gewähr übernehmen. Für die Inhalte der verlinkten Seiten ist stets der jeweilige Anbieter oder Betreiber der Seiten verantwortlich. Die verlinkten Seiten wurden zum Zeitpunkt der Verlinkung auf mögliche Rechtsverstöße überprüft. Rechtswidrige Inhalte waren zum Zeitpunkt der Verlinkung nicht erkennbar.&lt;/p&gt; &lt;p&gt;Eine permanente inhaltliche Kontrolle der verlinkten Seiten ist jedoch ohne konkrete Anhaltspunkte einer Rechtsverletzung nicht zumutbar. Bei Bekanntwerden von Rechtsverletzungen werden wir derartige Links umgehend entfernen.&lt;/p&gt; &lt;h3&gt;Urheberrecht&lt;/h3&gt; &lt;p&gt;Die durch die Seitenbetreiber erstellten Inhalte und Werke auf diesen Seiten unterliegen dem deutschen Urheberrecht. Die Vervielfältigung, Bearbeitung, Verbreitung und jede Art der Verwertung außerhalb der Grenzen des Urheberrechtes bedürfen der schriftlichen Zustimmung des jeweiligen Autors bzw. Erstellers. Downloads und Kopien dieser Seite sind nur für den privaten, nicht kommerziellen Gebrauch gestattet.&lt;/p&gt; &lt;p&gt;Soweit die Inhalte auf dieser Seite nicht vom Betreiber erstellt wurden, werden die Urheberrechte Dritter beachtet. Insbesondere werden Inhalte Dritter als solche gekennzeichnet. Sollten Sie trotzdem auf eine Urheberrechtsverletzung aufmerksam werden, bitten wir um einen entsprechenden Hinweis. Bei Bekanntwerden von Rechtsverletzungen werden wir derartige Inhalte umgehend entfernen.&lt;/p&gt;\r\n\r\n', 'Imprint', '', ''),
(8, 2, 'manufacture 1', '&lt;p&gt;manufacture 1&lt;/p&gt;', 'manufacture1', '', ''),
(8, 1, 'dgdgdfg', '&lt;p&gt;fgfg&lt;/p&gt;', 'fggd', '', ''),
(4, 2, 'Über uns', '&lt;p&gt;Das Unternehmen &quot;Waffen-Bock&quot; existiert seit 1897 und ist das älteste Fachgeschäft\r\nin Frankfurt am Main. Es befindet sich seit Gründung im Familienbesitz. Unser Ladengeschäft liegt nur wenige Gehminuten von der Haupteinkaufsstraße &quot;Zeil&quot; entfernt. &lt;/p&gt;&lt;p&gt;Nachdem wir schon im Jahre 2018, erfolgreich einen Onlineshop nur für Messer ins Leben gerufen haben, war es nur eine Frage der Zeit, dass wir nun auch unser restliches Sortiment online anbieten.&lt;/p&gt;&lt;p&gt;In diesem Zusammenhang haben wir gleich eine komplett neue Homepage gestaltet die dem 21. Jahrhundert entspricht.&lt;/p&gt;&lt;p&gt;Dem Logo sind wir treu geblieben, haben uns allerdings von dem &quot;altbackenen Jägergrün&quot; getrennt und uns für ein frischeres moderneres grün entschieden.&lt;/p&gt;&lt;p&gt;An unsrem gesamten Sortiment hat sich nichts geändert. Nach wie Vor erhält sowohl der Jäger als auch der Sportschütze, Waffen, Munition, Optik und Zubehör.&lt;/p&gt;&lt;p&gt;Mit Ausnahme der Bekleidung, von der haben wir uns jetzt nach reiflicher Überlegung endgültig getrennt.&lt;/p&gt;&lt;p&gt;Wir werden Schritt für Schritt unser Sortiment auch online erweitern.&lt;/p&gt;&lt;p&gt;Auch unsere kleine Büchsenmacher Werkstatt bleibt bestehen und wir können weiterhin Reparaturen an Jagd-, Sport,- Gas-Schreckschuss, CO2 u. Luftdruckwaffen durchführen.&lt;/p&gt;&lt;p&gt;Wir freuen uns auf Ihren Besuch.&lt;/p&gt;', 'About Us', '', ''),
(6, 2, 'Lieferung und Versand', '&lt;p&gt;Der Versand erfolgt innerhalb von Deutschland mit DHL versichert und portofrei, ab einem Verkaufswert von 100,00 €.&lt;/p&gt;&lt;p&gt;Sollte sich ein Rückversand durch einen Fehler unsererseits ergeben, ist dieser natürlich portofrei und wir kümmern uns um die Abwicklung.&lt;/p&gt;&lt;p&gt;Ansonsten muss der Kunde, den Artikel ausreichend versichert und frankiert zu uns zurück senden.&lt;/p&gt;\r\n', 'Delivery Information', '', ''),
(6, 1, 'Delivery Information', '&lt;p&gt;\r\n	Delivery Information&lt;/p&gt;\r\n', 'Delivery Information', '', ''),
(9, 2, 'Widerrufsbelehrung', '&lt;p&gt;&lt;b&gt;Widerrufsbelehrung &amp;amp; Widerrufsformular&lt;/b&gt;&lt;/p&gt;&lt;p&gt;&lt;b&gt;&lt;br&gt;&lt;/b&gt;&lt;/p&gt;&lt;p&gt;Verbrauchern steht ein Widerrufsrecht nach folgender Maßgabe zu, wobei Verbraucher&lt;/p&gt;&lt;p&gt;jede natürliche Person ist, die ein Rechtsgeschäft zu Zwecken abschließt, die&lt;/p&gt;&lt;p&gt;überwiegend weder ihrer gewerblichen noch ihrer selbständigen beruflichen Tätigkeit&lt;/p&gt;&lt;p&gt;zugerechnet werden können:&lt;/p&gt;&lt;p&gt;&lt;br&gt;&lt;/p&gt;&lt;p&gt;&lt;b&gt;A. Widerrufsbelehrung&lt;/b&gt;&lt;/p&gt;&lt;p&gt;&lt;b&gt;&lt;br&gt;&lt;/b&gt;&lt;/p&gt;&lt;p&gt;&lt;b&gt;Widerrufsrecht&lt;/b&gt;&lt;/p&gt;&lt;p&gt;Sie haben das Recht, binnen vierzehn Tagen ohne Angabe von Gründen diesen Vertrag&lt;/p&gt;&lt;p&gt;zu widerrufen.&lt;/p&gt;&lt;p&gt;Die Widerrufsfrist beträgt vierzehn Tage ab dem Tag, an dem Sie oder ein von Ihnen&lt;/p&gt;&lt;p&gt;benannter Dritter, der nicht der Beförderer ist, die letzte Ware in Besitz genommen&lt;/p&gt;&lt;p&gt;haben bzw. hat.&lt;/p&gt;&lt;p&gt;Um Ihr Widerrufsrecht auszuüben, müssen Sie uns (Waffen-Bock, Carl Bock KG, Berliner&lt;/p&gt;&lt;p&gt;Str. 28, 60311 Frankfurt/M., Deutschland, Tel.: 069-285590, Fax: 069-289801, E-Mail:&lt;/p&gt;&lt;p&gt;info@waffen-bock.de) mittels einer eindeutigen Erklärung (z. B. ein mit der Post&lt;/p&gt;&lt;p&gt;versandter Brief, Telefax oder E-Mail) über Ihren Entschluss, diesen Vertrag zu&lt;/p&gt;&lt;p&gt;widerrufen, informieren.&lt;/p&gt;&lt;p&gt;Zur Wahrung der Widerrufsfrist reicht es aus, dass Sie die Mitteilung über die Ausübung&lt;/p&gt;&lt;p&gt;des Widerrufsrechts vor Ablauf der Widerrufsfrist absenden.&lt;/p&gt;&lt;p&gt;&lt;br&gt;&lt;/p&gt;&lt;p&gt;&lt;b&gt;Folgen des Widerrufs&lt;/b&gt;&lt;/p&gt;&lt;p&gt;&lt;b&gt;&lt;br&gt;&lt;/b&gt;&lt;/p&gt;&lt;p&gt;Wenn Sie diesen Vertrag widerrufen, haben wir Ihnen alle Zahlungen, die wir von Ihnen&lt;/p&gt;&lt;p&gt;erhalten haben, einschließlich der Lieferkosten (mit Ausnahme der zusätzlichen Kosten,&lt;/p&gt;&lt;p&gt;die sich daraus ergeben, dass Sie eine andere Art der Lieferung als die von uns&lt;/p&gt;&lt;p&gt;angebotene, günstigste Standardlieferung gewählt haben), unverzüglich und spätestens&lt;/p&gt;&lt;p&gt;binnen vierzehn Tagen ab dem Tag zurückzuzahlen, an dem die Mitteilung über Ihren&lt;/p&gt;&lt;p&gt;Widerruf dieses Vertrags bei uns eingegangen ist. Für diese Rückzahlung verwenden wir&lt;/p&gt;&lt;p&gt;dasselbe Zahlungsmittel, das Sie bei der ursprünglichen Transaktion eingesetzt haben,&lt;/p&gt;&lt;p&gt;es sei denn, mit Ihnen wurde ausdrücklich etwas anderes vereinbart; in keinem Fall&lt;/p&gt;&lt;p&gt;werden Ihnen wegen dieser Rückzahlung Entgelte berechnet. Wir können die&lt;/p&gt;&lt;p&gt;Rückzahlung verweigern, bis wir die Waren wieder zurückerhalten haben oder bis Sie&lt;/p&gt;&lt;p&gt;den Nachweis erbracht haben, dass Sie die Waren zurückgesandt haben, je nachdem,&lt;/p&gt;&lt;p&gt;welches der frühere Zeitpunkt ist.&lt;/p&gt;&lt;p&gt;Sie haben die Waren unverzüglich und in jedem Fall spätestens binnen vierzehn Tagen&lt;/p&gt;&lt;p&gt;ab dem Tag, an dem Sie uns über den Widerruf dieses Vertrags unterrichten, an uns&lt;/p&gt;&lt;p&gt;zurückzusenden oder zu übergeben. Die Frist ist gewahrt, wenn Sie die Waren vor Ablauf&lt;/p&gt;&lt;p&gt;der Frist von vierzehn Tagen absenden.Sie tragen die unmittelbaren Kosten der Rücksendung der Waren.&lt;/p&gt;&lt;p&gt;Sie müssen für einen etwaigen Wertverlust der Waren nur aufkommen, wenn dieser&lt;/p&gt;&lt;p&gt;Wertverlust auf einen zur Prüfung der Beschaffenheit, Eigenschaften und Funktionsweise&lt;/p&gt;&lt;p&gt;der Waren nicht notwendigen Umgang mit ihnen zurückzuführen ist.&lt;/p&gt;&lt;p&gt;&lt;br&gt;&lt;/p&gt;&lt;p&gt;&lt;b&gt;Allgemeine Hinweise&lt;/b&gt;&lt;/p&gt;&lt;p&gt;&lt;br&gt;&lt;/p&gt;&lt;p&gt;&lt;b&gt;1)&lt;/b&gt; Bitte vermeiden Sie Beschädigungen und Verunreinigungen der Ware. Senden Sie die&lt;/p&gt;&lt;p&gt;Ware bitte in Originalverpackung mit sämtlichem Zubehör und mit allen&lt;/p&gt;&lt;p&gt;Verpackungsbestandteilen an uns zurück. Verwenden Sie ggf. eine schützende&lt;/p&gt;&lt;p&gt;Umverpackung. Wenn Sie die Originalverpackung nicht mehr besitzen, sorgen Sie bitte&lt;/p&gt;&lt;p&gt;mit einer geeigneten Verpackung für einen ausreichenden Schutz vor Transportschäden.&lt;/p&gt;&lt;p&gt;&lt;br&gt;&lt;/p&gt;&lt;p&gt;&lt;b&gt;2) &lt;/b&gt;Senden Sie die Ware bitte nicht unfrei an uns zurück.&lt;/p&gt;&lt;p&gt;&lt;br&gt;&lt;/p&gt;&lt;p&gt;&lt;br&gt;&lt;/p&gt;&lt;p&gt;&lt;br&gt;&lt;/p&gt;', 'Widerrufsbelehrung', 'Widerrufsbelehrung', ''),
(9, 1, 'Widerrufsbelehrung', '&lt;p&gt;&lt;b&gt;Widerrufsbelehrung &amp;amp; Widerrufsformular&lt;/b&gt;&lt;/p&gt;&lt;p&gt;&lt;b&gt;&lt;br&gt;&lt;/b&gt;&lt;/p&gt;&lt;p&gt;Verbrauchern steht ein Widerrufsrecht nach folgender Maßgabe zu, wobei Verbraucher&lt;/p&gt;&lt;p&gt;jede natürliche Person ist, die ein Rechtsgeschäft zu Zwecken abschließt, die&lt;/p&gt;&lt;p&gt;überwiegend weder ihrer gewerblichen noch ihrer selbständigen beruflichen Tätigkeit&lt;/p&gt;&lt;p&gt;zugerechnet werden können:&lt;/p&gt;&lt;p&gt;&lt;br&gt;&lt;/p&gt;&lt;p&gt;&lt;b&gt;A. Widerrufsbelehrung&lt;/b&gt;&lt;/p&gt;&lt;p&gt;&lt;b&gt;&lt;br&gt;&lt;/b&gt;&lt;/p&gt;&lt;p&gt;&lt;b&gt;Widerrufsrecht&lt;/b&gt;&lt;/p&gt;&lt;p&gt;Sie haben das Recht, binnen vierzehn Tagen ohne Angabe von Gründen diesen Vertrag&lt;/p&gt;&lt;p&gt;zu widerrufen.&lt;/p&gt;&lt;p&gt;Die Widerrufsfrist beträgt vierzehn Tage ab dem Tag, an dem Sie oder ein von Ihnen&lt;/p&gt;&lt;p&gt;benannter Dritter, der nicht der Beförderer ist, die letzte Ware in Besitz genommen&lt;/p&gt;&lt;p&gt;haben bzw. hat.&lt;/p&gt;&lt;p&gt;Um Ihr Widerrufsrecht auszuüben, müssen Sie uns (Waffen-Bock, Carl Bock KG, Berliner&lt;/p&gt;&lt;p&gt;Str. 28, 60311 Frankfurt/M., Deutschland, Tel.: 069-285590, Fax: 069-289801, E-Mail:&lt;/p&gt;&lt;p&gt;info@waffen-bock.de) mittels einer eindeutigen Erklärung (z. B. ein mit der Post&lt;/p&gt;&lt;p&gt;versandter Brief, Telefax oder E-Mail) über Ihren Entschluss, diesen Vertrag zu&lt;/p&gt;&lt;p&gt;widerrufen, informieren.&lt;/p&gt;&lt;p&gt;Zur Wahrung der Widerrufsfrist reicht es aus, dass Sie die Mitteilung über die Ausübung&lt;/p&gt;&lt;p&gt;des Widerrufsrechts vor Ablauf der Widerrufsfrist absenden.&lt;/p&gt;&lt;p&gt;&lt;br&gt;&lt;/p&gt;&lt;p&gt;&lt;b&gt;Folgen des Widerrufs&lt;/b&gt;&lt;/p&gt;&lt;p&gt;&lt;b&gt;&lt;br&gt;&lt;/b&gt;&lt;/p&gt;&lt;p&gt;Wenn Sie diesen Vertrag widerrufen, haben wir Ihnen alle Zahlungen, die wir von Ihnen&lt;/p&gt;&lt;p&gt;erhalten haben, einschließlich der Lieferkosten (mit Ausnahme der zusätzlichen Kosten,&lt;/p&gt;&lt;p&gt;die sich daraus ergeben, dass Sie eine andere Art der Lieferung als die von uns&lt;/p&gt;&lt;p&gt;angebotene, günstigste Standardlieferung gewählt haben), unverzüglich und spätestens&lt;/p&gt;&lt;p&gt;binnen vierzehn Tagen ab dem Tag zurückzuzahlen, an dem die Mitteilung über Ihren&lt;/p&gt;&lt;p&gt;Widerruf dieses Vertrags bei uns eingegangen ist. Für diese Rückzahlung verwenden wir&lt;/p&gt;&lt;p&gt;dasselbe Zahlungsmittel, das Sie bei der ursprünglichen Transaktion eingesetzt haben,&lt;/p&gt;&lt;p&gt;es sei denn, mit Ihnen wurde ausdrücklich etwas anderes vereinbart; in keinem Fall&lt;/p&gt;&lt;p&gt;werden Ihnen wegen dieser Rückzahlung Entgelte berechnet. Wir können die&lt;/p&gt;&lt;p&gt;Rückzahlung verweigern, bis wir die Waren wieder zurückerhalten haben oder bis Sie&lt;/p&gt;&lt;p&gt;den Nachweis erbracht haben, dass Sie die Waren zurückgesandt haben, je nachdem,&lt;/p&gt;&lt;p&gt;welches der frühere Zeitpunkt ist.&lt;/p&gt;&lt;p&gt;Sie haben die Waren unverzüglich und in jedem Fall spätestens binnen vierzehn Tagen&lt;/p&gt;&lt;p&gt;ab dem Tag, an dem Sie uns über den Widerruf dieses Vertrags unterrichten, an uns&lt;/p&gt;&lt;p&gt;zurückzusenden oder zu übergeben. Die Frist ist gewahrt, wenn Sie die Waren vor Ablauf&lt;/p&gt;&lt;p&gt;der Frist von vierzehn Tagen absenden.Sie tragen die unmittelbaren Kosten der Rücksendung der Waren.&lt;/p&gt;&lt;p&gt;Sie müssen für einen etwaigen Wertverlust der Waren nur aufkommen, wenn dieser&lt;/p&gt;&lt;p&gt;Wertverlust auf einen zur Prüfung der Beschaffenheit, Eigenschaften und Funktionsweise&lt;/p&gt;&lt;p&gt;der Waren nicht notwendigen Umgang mit ihnen zurückzuführen ist.&lt;/p&gt;&lt;p&gt;&lt;br&gt;&lt;/p&gt;&lt;p&gt;&lt;b&gt;Allgemeine Hinweise&lt;/b&gt;&lt;/p&gt;&lt;p&gt;&lt;br&gt;&lt;/p&gt;&lt;p&gt;&lt;b&gt;1)&lt;/b&gt;&amp;nbsp;Bitte vermeiden Sie Beschädigungen und Verunreinigungen der Ware. Senden Sie die&lt;/p&gt;&lt;p&gt;Ware bitte in Originalverpackung mit sämtlichem Zubehör und mit allen&lt;/p&gt;&lt;p&gt;Verpackungsbestandteilen an uns zurück. Verwenden Sie ggf. eine schützende&lt;/p&gt;&lt;p&gt;Umverpackung. Wenn Sie die Originalverpackung nicht mehr besitzen, sorgen Sie bitte&lt;/p&gt;&lt;p&gt;mit einer geeigneten Verpackung für einen ausreichenden Schutz vor Transportschäden.&lt;/p&gt;&lt;p&gt;&lt;br&gt;&lt;/p&gt;&lt;p&gt;&lt;b&gt;2)&amp;nbsp;&lt;/b&gt;Senden Sie die Ware bitte nicht unfrei an uns zurück.&lt;/p&gt;&lt;p&gt;&lt;br&gt;&lt;/p&gt;&lt;p&gt;&lt;br&gt;&lt;/p&gt;', 'Widerrufsbelehrung', '', ''),
(5, 1, 'Terms &amp; Conditions', '&lt;p&gt;\r\n	Terms &amp;amp; Conditions&lt;/p&gt;\r\n', 'Terms &amp; Conditions', '', ''),
(4, 1, 'About Us', '&lt;p&gt;\r\n	About Us&lt;/p&gt;\r\n', 'About Us', '', '');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `oc_information_to_layout`
--

DROP TABLE IF EXISTS `oc_information_to_layout`;
CREATE TABLE `oc_information_to_layout` (
  `information_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  `layout_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `oc_information_to_layout`
--

INSERT INTO `oc_information_to_layout` (`information_id`, `store_id`, `layout_id`) VALUES
(3, 0, 0),
(7, 0, 0),
(4, 0, 0),
(6, 0, 0),
(5, 0, 0),
(8, 0, 0),
(9, 0, 11);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `oc_information_to_store`
--

DROP TABLE IF EXISTS `oc_information_to_store`;
CREATE TABLE `oc_information_to_store` (
  `information_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `oc_information_to_store`
--

INSERT INTO `oc_information_to_store` (`information_id`, `store_id`) VALUES
(3, 0),
(4, 0),
(5, 0),
(6, 0),
(7, 0),
(8, 0),
(9, 0);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `oc_language`
--

DROP TABLE IF EXISTS `oc_language`;
CREATE TABLE `oc_language` (
  `language_id` int(11) NOT NULL,
  `name` varchar(32) NOT NULL,
  `code` varchar(5) NOT NULL,
  `locale` varchar(255) NOT NULL,
  `image` varchar(64) NOT NULL,
  `directory` varchar(32) NOT NULL,
  `sort_order` int(3) NOT NULL DEFAULT 0,
  `status` tinyint(1) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `oc_language`
--

INSERT INTO `oc_language` (`language_id`, `name`, `code`, `locale`, `image`, `directory`, `sort_order`, `status`) VALUES
(1, 'English', 'en-gb', 'en-US,en_US.UTF-8,en_US,en-gb,english', 'gb.png', 'english', 2, 1),
(2, 'Germany', 'de-DE', 'de-DE', '', '', 1, 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `oc_layout`
--

DROP TABLE IF EXISTS `oc_layout`;
CREATE TABLE `oc_layout` (
  `layout_id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `oc_layout`
--

INSERT INTO `oc_layout` (`layout_id`, `name`) VALUES
(1, 'Home'),
(2, 'Product'),
(3, 'Category'),
(4, 'Default'),
(5, 'Manufacturer'),
(6, 'Account'),
(7, 'Checkout'),
(8, 'Contact'),
(9, 'Sitemap'),
(10, 'Affiliate'),
(11, 'Information'),
(12, 'Compare'),
(13, 'Search'),
(14, 'blog'),
(15, 'footer');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `oc_layout_module`
--

DROP TABLE IF EXISTS `oc_layout_module`;
CREATE TABLE `oc_layout_module` (
  `layout_module_id` int(11) NOT NULL,
  `layout_id` int(11) NOT NULL,
  `code` varchar(64) NOT NULL,
  `position` varchar(14) NOT NULL,
  `sort_order` int(3) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `oc_layout_module`
--

INSERT INTO `oc_layout_module` (`layout_module_id`, `layout_id`, `code`, `position`, `sort_order`) VALUES
(2, 4, '0', 'content_top', 0),
(3, 4, '0', 'content_top', 1),
(20, 5, '0', 'column_left', 2),
(69, 10, 'affiliate', 'column_right', 1),
(68, 6, 'account', 'column_right', 1),
(194, 15, 'html.35', 'content_top', 0),
(238, 3, 'html.39', 'footertop', 0),
(485, 1, 'newsletter', 'footertop', 1),
(195, 15, 'html.33', 'footertop', 0),
(484, 1, 'html.39', 'footertop', 0),
(483, 1, 'carousel.29', 'content_bottom', 9),
(230, 7, 'html.39', 'footertop', 0),
(231, 7, 'html.40', 'footerright', 0),
(237, 3, 'banner.30', 'column_left', 2),
(236, 3, 'category', 'column_left', 1),
(239, 3, 'newsletter', 'footertop', 1),
(240, 3, 'html.40', 'footerright', 0),
(241, 2, 'html.39', 'footertop', 0),
(242, 2, 'newsletter', 'footertop', 1),
(243, 2, 'html.40', 'footerright', 0),
(482, 1, 'html.47', 'content_bottom', 8),
(481, 1, 'html.46', 'content_bottom', 7),
(480, 1, 'html.45', 'content_bottom', 6),
(479, 1, 'html.44', 'content_bottom', 5),
(478, 1, 'html.48', 'content_bottom', 4),
(477, 1, 'html.43', 'content_bottom', 3),
(476, 1, 'html.42', 'content_bottom', 2),
(475, 1, 'html.41', 'content_bottom', 1),
(474, 1, 'latest.38', 'content_bottom', 0),
(473, 1, 'html.60', 'content_topban', 7),
(472, 1, 'html.59', 'content_topban', 6),
(471, 1, 'html.58', 'content_topban', 5),
(470, 1, 'html.57', 'content_topban', 4),
(469, 1, 'html.36', 'content_topban', 3),
(468, 1, 'html.35', 'content_topban', 2),
(467, 1, 'html.34', 'content_topban', 1),
(466, 1, 'html.33', 'content_topban', 0),
(465, 1, 'slideshow.27', 'content_top', 0);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `oc_layout_route`
--

DROP TABLE IF EXISTS `oc_layout_route`;
CREATE TABLE `oc_layout_route` (
  `layout_route_id` int(11) NOT NULL,
  `layout_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  `route` varchar(64) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `oc_layout_route`
--

INSERT INTO `oc_layout_route` (`layout_route_id`, `layout_id`, `store_id`, `route`) VALUES
(38, 6, 0, 'account/%'),
(17, 10, 0, 'affiliate/%'),
(89, 3, 0, 'product/category'),
(102, 1, 0, 'common/home'),
(90, 2, 0, 'product/product'),
(24, 11, 0, 'information/information'),
(87, 7, 0, 'checkout/%'),
(31, 8, 0, 'information/contact'),
(32, 9, 0, 'information/sitemap'),
(34, 4, 0, ''),
(45, 5, 0, 'product/manufacturer'),
(52, 12, 0, 'product/compare'),
(53, 13, 0, 'product/search'),
(59, 14, 0, 'information/blogger/blogs'),
(82, 15, 0, 'common/footer');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `oc_length_class`
--

DROP TABLE IF EXISTS `oc_length_class`;
CREATE TABLE `oc_length_class` (
  `length_class_id` int(11) NOT NULL,
  `value` decimal(15,8) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `oc_length_class`
--

INSERT INTO `oc_length_class` (`length_class_id`, `value`) VALUES
(1, '1.00000000'),
(2, '10.00000000'),
(3, '0.39370000');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `oc_length_class_description`
--

DROP TABLE IF EXISTS `oc_length_class_description`;
CREATE TABLE `oc_length_class_description` (
  `length_class_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `title` varchar(32) NOT NULL,
  `unit` varchar(4) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `oc_length_class_description`
--

INSERT INTO `oc_length_class_description` (`length_class_id`, `language_id`, `title`, `unit`) VALUES
(1, 1, 'Centimeter', 'cm'),
(2, 1, 'Millimeter', 'mm'),
(3, 1, 'Inch', 'in'),
(1, 2, 'Centimeter', 'cm'),
(2, 2, 'Millimeter', 'mm'),
(3, 2, 'Inch', 'in');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `oc_location`
--

DROP TABLE IF EXISTS `oc_location`;
CREATE TABLE `oc_location` (
  `location_id` int(11) NOT NULL,
  `name` varchar(32) NOT NULL,
  `address` text NOT NULL,
  `telephone` varchar(32) NOT NULL,
  `fax` varchar(32) NOT NULL,
  `geocode` varchar(32) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `open` text NOT NULL,
  `comment` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `oc_manufacturer`
--

DROP TABLE IF EXISTS `oc_manufacturer`;
CREATE TABLE `oc_manufacturer` (
  `manufacturer_id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  `des` text NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `sort_order` int(3) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `oc_manufacturer`
--

INSERT INTO `oc_manufacturer` (`manufacturer_id`, `name`, `des`, `image`, `sort_order`) VALUES
(60, 'Umarex', '', '', 0),
(61, 'Zoraki', '', '', 0),
(62, 'RUAG AMMOTEC', '', '', 0),
(63, 'Weihrauch', '', '', 0);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `oc_manufacturer_to_store`
--

DROP TABLE IF EXISTS `oc_manufacturer_to_store`;
CREATE TABLE `oc_manufacturer_to_store` (
  `manufacturer_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `oc_manufacturer_to_store`
--

INSERT INTO `oc_manufacturer_to_store` (`manufacturer_id`, `store_id`) VALUES
(60, 0),
(61, 0),
(62, 0),
(63, 0);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `oc_marketing`
--

DROP TABLE IF EXISTS `oc_marketing`;
CREATE TABLE `oc_marketing` (
  `marketing_id` int(11) NOT NULL,
  `name` varchar(32) NOT NULL,
  `description` text NOT NULL,
  `code` varchar(64) NOT NULL,
  `clicks` int(5) NOT NULL DEFAULT 0,
  `date_added` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `oc_menu`
--

DROP TABLE IF EXISTS `oc_menu`;
CREATE TABLE `oc_menu` (
  `menu_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  `type` varchar(6) NOT NULL,
  `link` varchar(255) NOT NULL,
  `sort_order` int(3) NOT NULL,
  `status` tinyint(1) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `oc_menu_description`
--

DROP TABLE IF EXISTS `oc_menu_description`;
CREATE TABLE `oc_menu_description` (
  `menu_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `oc_menu_module`
--

DROP TABLE IF EXISTS `oc_menu_module`;
CREATE TABLE `oc_menu_module` (
  `menu_module_id` int(11) NOT NULL,
  `menu_id` int(11) NOT NULL,
  `code` varchar(64) NOT NULL,
  `sort_order` int(3) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `oc_modification`
--

DROP TABLE IF EXISTS `oc_modification`;
CREATE TABLE `oc_modification` (
  `modification_id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  `code` varchar(64) NOT NULL,
  `author` varchar(64) NOT NULL,
  `version` varchar(32) NOT NULL,
  `link` varchar(255) NOT NULL,
  `xml` mediumtext NOT NULL,
  `status` tinyint(1) NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `oc_modification`
--

INSERT INTO `oc_modification` (`modification_id`, `name`, `code`, `author`, `version`, `link`, `xml`, `status`, `date_added`) VALUES
(1, 'payengine3cw', '<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<modification>\n	<name>pay', 'customweb ltd', '1.0.0', 'https://www.sellxed.com', '<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<modification>\n	<name>payengine3cw</name>\n	<version>1.0.0</version>\n	<author>customweb ltd</author>\n\n	<!-- Add menu link to header controller in 2.3 -->\n	<file path=\"admin/controller/common/column_left.php\">\n		<operation>\n			<search><![CDATA[if ($this->user->hasPermission(\'access\', \'sale/recurring\')) {]]></search>\n			<add position=\"before\"><![CDATA[\n			\n			if ($this->user->hasPermission(\'access\', \'payengine3cw/transaction\')) {\n				require_once (dirname(DIR_SYSTEM) . \'/system/library/cw/PayEngine3Cw/init.php\');\n				PayEngine3Cw_Util::setRegistry($this->registry);\n				\n				$sale[] = array(\n					\'name\'	   => PayEngine3Cw_Language::_(\'Concardis PayEngine 3.0 Transactions\'),\n					\'href\'     => $this->url->link(\'payengine3cw/transaction\', \'token=\' . $this->session->data[\'token\'], \'SSL\'),\n					\'children\' => array()		\n				);\n			}\n\n			]]></add>\n		</operation>\n	</file>\n\n	<!--The \'route\' parameter may be sent via POST. We make here sure OpenCart \n		receives the parameter. -->\n	<file path=\"system/engine/action.php\">\n		<operation>\n			<search><![CDATA[<?php]]></search>\n			<add position=\"after\"><![CDATA[if (isset($_POST[\'route\']) && !isset($_GET[\'route\'])) { $_GET[\'route\'] = $_POST[\'route\'];}]]></add>\n		</operation>\n	</file>\n\n	<file path=\"catalog/model/checkout/order.php\">\n		<operation>\n			<search limit=\"1\"><![CDATA[// Order Totals]]></search>\n			<add position=\"before\"><![CDATA[\n\nrequire_once DIR_SYSTEM . \'/library/cw/PayEngine3Cw/init.php\';\nrequire_once (\'PayEngine3Cw/Util.php\');\nrequire_once (\'PayEngine3Cw/Language.php\');\nPayEngine3Cw_Util::setRegistry($this->registry);\n$payengine3cw_entities = PayEngine3Cw_Util::getEntityManager()->searchByFilterName(\'PayEngine3Cw_Entity_Transaction\', \'loadByOrderId\', array(\'>orderId\' => $order_id));\nif(!empty($payengine3cw_entities)){\n	foreach($payengine3cw_entities as $payengine3cw_transaction_entity) {\n		if($payengine3cw_transaction_entity->getAuthorizationStatus() == \'successful\' || $payengine3cw_transaction_entity->getAuthorizationStatus() == \'authorizing\') {\n			$data[\'payengine3cw_payment_information_title\'] = PayEngine3Cw_Language::_(\'Payment Information\');\n			$data[\'payengine3cw_payment_information\'] = $payengine3cw_transaction_entity->getTransactionObject()->getPaymentInformation();\n			break;\n		}\n	}\n}\n 			]]></add>\n		</operation>\n	</file>\n\n	<file path=\"catalog/model/checkout/order.php\">\n		<operation>\n			<search limit=\"1\"><![CDATA[$text .= $language->get(\'text_new_products\') . \"\\n\";]]></search>\n			<add position=\"before\"><![CDATA[\nrequire_once DIR_SYSTEM . \'/library/cw/PayEngine3Cw/init.php\';\nrequire_once (\'Customweb/Core/Util/Html.php\');\n$text .= isset($data[\'payengine3cw_payment_information\']) ? Customweb_Core_Util_Html::toText($data[\'payengine3cw_payment_information\']) : \'\';\n 			]]></add>\n		</operation>\n	</file>\n\n	<file path=\"catalog/view/theme/*/template/mail/order.tpl\">\n		<operation>\n			<search><![CDATA[<?php if ($comment) { ?>]]></search>\n			<add position=\"before\"><![CDATA[\n  <?php if (isset($payengine3cw_payment_information)) { ?>\n  <table style=\"border-collapse: collapse; width: 100%; border-top: 1px solid #DDDDDD; border-left: 1px solid #DDDDDD; margin-bottom: 20px;\">\n    <thead>\n      <tr>\n        <td style=\"font-size: 12px; border-right: 1px solid #DDDDDD; border-bottom: 1px solid #DDDDDD; background-color: #EFEFEF; font-weight: bold; text-align: left; padding: 7px; color: #222222;\"><?php echo $payengine3cw_payment_information_title; ?></td>\n      </tr>\n    </thead>\n    <tbody>\n      <tr>\n        <td style=\"font-size: 12px;	border-right: 1px solid #DDDDDD; border-bottom: 1px solid #DDDDDD; text-align: left; padding: 7px;\"><?php echo $payengine3cw_payment_information; ?></td>\n      </tr>\n    </tbody>\n  </table>\n  <?php } ?>\n 			]]></add>\n		</operation>\n	</file>\n	\n	<file path=\"model/catalog/extension/total/coupon.php\">\n		<operation>\n			<search limit=\"1\"><![CDATA[foreach ($this->cart->getProducts() as $product) {]]></search>\n			<add position=\"replace\"><![CDATA[\n		require_once DIR_SYSTEM . \'library/cw/init.php\';\n		$products = empty($this->cart->getProducts()) ? PayEngine3Cw_Util::getMockCartProducts() : $this->cart->getProducts();\n		foreach ($products as $product) {\n 			]]></add>\n		</operation>\n	</file>\n</modification>', 1, '2018-06-06 11:26:04');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `oc_module`
--

DROP TABLE IF EXISTS `oc_module`;
CREATE TABLE `oc_module` (
  `module_id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  `code` varchar(32) NOT NULL,
  `setting` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `oc_module`
--

INSERT INTO `oc_module` (`module_id`, `name`, `code`, `setting`) VALUES
(30, 'Category', 'banner', '{\"name\":\"Category\",\"banner_id\":\"6\",\"width\":\"182\",\"height\":\"182\",\"status\":\"1\"}'),
(29, 'Home Page', 'carousel', '{\"name\":\"Home Page\",\"banner_id\":\"8\",\"width\":\"130\",\"height\":\"100\",\"status\":\"1\"}'),
(28, 'Home Page', 'featured', '{\"name\":\"Home Page\",\"product_name\":\"\",\"product\":[\"95\",\"90\"],\"limit\":\"8\",\"width\":\"200\",\"height\":\"200\",\"status\":\"1\"}'),
(27, 'Home Page', 'slideshow', '{\"name\":\"Home Page\",\"banner_id\":\"7\",\"width\":\"1903\",\"height\":\"710\",\"status\":\"1\"}'),
(31, 'Banner 1', 'banner', '{\"name\":\"Banner 1\",\"banner_id\":\"6\",\"width\":\"182\",\"height\":\"182\",\"status\":\"1\"}'),
(33, 'HP Banner 01 nach Slider', 'html', '{\"name\":\"HP Banner 01 nach Slider\",\"module_description\":{\"2\":{\"title\":\"Beretta;CX4 Storm.;;\\/CO2 4,5mm\",\"description\":\"&lt;p&gt;&lt;img src=&quot;http:\\/\\/temp20.waffen-bock.de\\/image\\/catalog\\/Startseite_600\\/20070222-475.00.10_Cx4Storm_links.JPG&quot; style=&quot;width: 600px;&quot;&gt;&lt;br&gt;&lt;\\/p&gt;\"},\"1\":{\"title\":\"\",\"description\":\"\"}},\"status\":\"1\"}'),
(34, 'HP Banner 02 nach Slider', 'html', '{\"name\":\"HP Banner 02 nach Slider\",\"module_description\":{\"2\":{\"title\":\"Walther P 22 Q;Mintos;9mm P.A.K.\",\"description\":\"&lt;p&gt;&lt;img src=&quot;http:\\/\\/temp20.waffen-bock.de\\/image\\/catalog\\/Startseite_600\\/20191217-308.02.41_P22QMintos_persp.JPG&quot; style=&quot;width: 600px;&quot;&gt;&lt;br&gt;&lt;\\/p&gt;\"},\"1\":{\"title\":\"\",\"description\":\"\"}},\"status\":\"1\"}'),
(35, 'HP Banner 03 nach Slider', 'html', '{\"name\":\"HP Banner 03 nach Slider\",\"module_description\":{\"2\":{\"title\":\"Browning;GPDA;Kal. 9mm P.A.K.;\",\"description\":\"&lt;p&gt;&lt;img src=&quot;http:\\/\\/temp20.waffen-bock.de\\/image\\/catalog\\/Startseite_600\\/20121123-318.02.11_GPDA9_Comp.JPG&quot; style=&quot;width: 600px;&quot;&gt;&lt;br&gt;&lt;\\/p&gt;\"},\"1\":{\"title\":\"\",\"description\":\"\"}},\"status\":\"1\"}'),
(36, 'HP Banner 04 nach Slider', 'html', '{\"name\":\"HP Banner 04 nach Slider\",\"module_description\":{\"2\":{\"title\":\"Smith &amp; Wesson;Blue Chief Special;vergoldet;\\/9mm R\",\"description\":\"&lt;p&gt;&lt;img src=&quot;http:\\/\\/temp20.waffen-bock.de\\/image\\/catalog\\/Startseite_600\\/20190314-348.02.13_ChiefsSpecial_links_ret.JPG&quot; style=&quot;width: 600px;&quot;&gt;&lt;br&gt;&lt;\\/p&gt;\"},\"1\":{\"title\":\"\",\"description\":\"\"}},\"status\":\"1\"}'),
(37, 'OFF ? Homepage Subbaner-5', 'html', '{\"name\":\"OFF ? Homepage Subbaner-5\",\"module_description\":{\"2\":{\"title\":\"Most Popularzz;NESMUK exklusiv;Shop for the latest Items\",\"description\":\"&lt;img class=&quot;leftbanner&quot; src=&quot;\\/image\\/catalog\\/sub-banner1.jpg&quot; alt=&quot;sub-banner1&quot;&gt;\"},\"1\":{\"title\":\"\",\"description\":\"\"}},\"status\":\"1\"}'),
(38, 'Neuigkeiten', 'latest', '{\"name\":\"Neuigkeiten\",\"limit\":\"16\",\"width\":\"200\",\"height\":\"200\",\"status\":\"1\"}'),
(39, 'footer mitte', 'html', '{\"name\":\"footer mitte\",\"module_description\":{\"2\":{\"title\":\"Waffen-Bock FOOTER\",\"description\":\"&lt;div class=&quot;footer-common&quot;&gt;\\r\\n\\r\\n&lt;div style=&quot;text-align: center;&quot;&gt;&lt;img class=&quot;img-logo&quot; src=&quot;\\/image\\/WaffenBock_Logo.svg&quot; alt=&quot;footer-logo&quot; width=&quot;60&quot;&gt;&lt;\\/div&gt;\\r\\n\\r\\n&lt;\\/div&gt;\"},\"1\":{\"title\":\"\",\"description\":\"\"}},\"status\":\"1\"}'),
(40, 'Contact us', 'html', '{\"name\":\"Contact us\",\"module_description\":{\"2\":{\"title\":\"\",\"description\":\"&lt;div class=&quot;footer-common collapsible mobile-collapsible&quot;&gt;\\r\\n&lt;div class=&quot;footer-static&quot;&gt;\\r\\n&lt;h4&gt;Kontakt&lt;\\/h4&gt;\\r\\n&lt;p&gt;\\r\\nWaffen-Bock Carl Bock KG&lt;br&gt;\\r\\nBerliner Str. 28 &lt;br&gt;\\r\\n60311 Frankfurt am Main&lt;br&gt;\\r\\nTelefon: +49 69 285590&lt;br&gt;\\r\\nE-Mail: &lt;a href=&quot;mailto:info@waffen-bock.de?Subject=Anfrage&amp;amp;Body=Nachricht: &quot;&gt;info@waffen-bock.de&lt;\\/a&gt;\\r\\n&lt;\\/p&gt;\\r\\n&lt;\\/div&gt;\\r\\n&lt;\\/div&gt;\"},\"1\":{\"title\":\"\",\"description\":\"&lt;div class=&quot;footer-common collapsible mobile-collapsible&quot;&gt;&lt;div class=&quot;footer-static&quot;&gt;&lt;h4&gt;Contacts &lt;\\/h4&gt;&lt;h5 class=&quot;collapsed&quot; data-target=&quot;#dropdown-contact&quot; data-toggle=&quot;collapse&quot;&gt;Contacts &lt;span class=&quot;icon&quot;&gt;&lt;\\/span&gt; &lt;\\/h5&gt;&lt;ul class=&quot;clearfix collapse&quot; id=&quot;dropdown-contact&quot;&gt;&lt;li class=&quot;item&quot;&gt;Tizzy custom Site Designs&lt;br&gt;600, Boltacusta avenue apt.&lt;br&gt;Mesa,California&lt;\\/li&gt;&lt;li class=&quot;item email&quot;&gt;&lt;a href=&quot;mailto:info@customdesign.com?Subject=Feedback&amp;amp;Body=start&quot;&gt;info@customdesign.com&lt;\\/a&gt;&lt;\\/li&gt;&lt;li class=&quot;item call&quot;&gt;(+91) 12-3456-7890&lt;\\/li&gt;&lt;\\/ul&gt;&lt;\\/div&gt;&lt;\\/div&gt;\"}},\"status\":\"1\"}'),
(41, 'HP Verkaufsteam', 'html', '{\"name\":\"HP Verkaufsteam\",\"module_description\":{\"2\":{\"title\":\"VERKAUFSTEAM\",\"description\":\"&lt;p&gt;im Ladengesch\\u00e4ft und Onlineshop&lt;\\/p&gt;&lt;p&gt;&lt;\\/p&gt;\"},\"1\":{\"title\":\"\",\"description\":\"&lt;p&gt;&lt;br&gt;&lt;\\/p&gt;\"}},\"status\":\"1\"}'),
(42, 'HP 3er Banner schwarz Text - Versand / 01', 'html', '{\"name\":\"HP 3er Banner schwarz Text - Versand \\/ 01\",\"module_description\":{\"2\":{\"title\":\"KOSTENLOSER VERSAND\",\"description\":\"&lt;p&gt;INNERHALB VON DEUTSCHLAND&lt;br&gt;&lt;\\/p&gt;\"},\"1\":{\"title\":\"\",\"description\":\"\"}},\"status\":\"1\"}'),
(43, 'HP 3er Banner schwarz Text - Versand / 02', 'html', '{\"name\":\"HP 3er Banner schwarz Text - Versand \\/ 02\",\"module_description\":{\"2\":{\"title\":\"EUROPAWEITER VERSAND\",\"description\":\"&lt;p&gt;SIEHE &lt;br&gt;# LIEFERUNG &amp;amp; VERSAND&lt;\\/p&gt;\"},\"1\":{\"title\":\"Money Back EN\",\"description\":\"&lt;p&gt;Not receiving an item applied to reward&lt;\\/p&gt;\"}},\"status\":\"1\"}'),
(44, 'HP 4er Block weiss 01', 'html', '{\"name\":\"HP 4er Block weiss 01\",\"module_description\":{\"2\":{\"title\":\"Reiner Groesche;\\/01RG017\",\"description\":\"&lt;p&gt;&lt;img src=&quot;https:\\/\\/www.messer-bock.de\\/image\\/catalog\\/Startseite Slider 300\\/Startseits Slider 300-7.jpg&quot; style=&quot;width: 300px;&quot;&gt;&lt;br&gt;&lt;\\/p&gt;\"},\"1\":{\"title\":\"\",\"description\":\"\"}},\"status\":\"1\"}'),
(45, 'HP 4er Block weiss 02', 'html', '{\"name\":\"HP 4er Block weiss 02\",\"module_description\":{\"2\":{\"title\":\"Patrick Teyke;\\/02TY023\",\"description\":\"&lt;p&gt;&lt;img src=&quot;https:\\/\\/www.messer-bock.de\\/image\\/catalog\\/Startseite Slider 300\\/Patrick Teyke.jpg&quot; style=&quot;width: 300px;&quot;&gt;&lt;br&gt;&lt;\\/p&gt;\"},\"1\":{\"title\":\"\",\"description\":\"\"}},\"status\":\"1\"}'),
(46, 'HP 4er Block weiss 03', 'html', '{\"name\":\"HP 4er Block weiss 03\",\"module_description\":{\"2\":{\"title\":\"Medford;\\/01MD004\",\"description\":\"&lt;p&gt;&lt;img src=&quot;https:\\/\\/www.messer-bock.de\\/image\\/catalog\\/Startseite Slider 300\\/20200917-Medford-22-2.JPG&quot; style=&quot;width: 300px;&quot;&gt;&lt;br&gt;&lt;\\/p&gt;\"},\"1\":{\"title\":\"\",\"description\":\"\"}},\"status\":\"1\"}'),
(47, 'HP 4er Block weiss 04', 'html', '{\"name\":\"HP 4er Block weiss 04\",\"module_description\":{\"2\":{\"title\":\"Tumpek Ferenc (DNC);\\/01DN008\",\"description\":\"&lt;p&gt;&lt;img src=&quot;https:\\/\\/www.messer-bock.de\\/image\\/catalog\\/Slider 300--2.jpg&quot; style=&quot;width: 300px;&quot;&gt;&lt;br&gt;&lt;\\/p&gt;\"},\"1\":{\"title\":\"\",\"description\":\"\"}},\"status\":\"1\"}'),
(48, 'HP 3er Banner schwarz Text - Versand / 03', 'html', '{\"name\":\"HP 3er Banner schwarz Text - Versand \\/ 03\",\"module_description\":{\"2\":{\"title\":\"ALLE ARTIKEL LAGERWARE\",\"description\":\"&lt;p&gt;KEINE LANGEN LIEFERZEITEN&lt;\\/p&gt;\"},\"1\":{\"title\":\"Watch by Size E\",\"description\":\"&lt;p&gt;Many desktop publishing packages and web page editors now Internet tend to repeat predefined chunks as necessary&lt;\\/p&gt;\"}},\"status\":\"1\"}'),
(50, 'OFF Hersteller / Manufacture Box 02', 'html', '{\"name\":\"OFF Hersteller \\/ Manufacture Box 02\",\"module_description\":{\"2\":{\"title\":\"Hersteller \\/ Manufacture Box 02\",\"description\":\"&lt;div class=&quot;product-thumb transition&quot;&gt;\\r\\n\\r\\n\\r\\n\\t\\t&lt;div class=&quot;image&quot;&gt;&lt;img src=&quot;\\/image\\/catalog\\/Startseite Slider\\/Reiner Groesche-4736.jpg&quot; style=&quot;width: 1200px;&quot;&gt;&lt;br&gt;&lt;\\/div&gt;\\r\\n      \\t &lt;div class=&quot;product-details&quot;&gt;\\r\\n\\t\\t&lt;div class=&quot;caption&quot;&gt;\\r\\n\\r\\n\\t\\t\\t&lt;!--  --&gt;\\r\\n                   \\t&lt;h4&gt;Reiner Groesche &quot;White Flash&quot;&lt;\\/h4&gt;\\r\\n\\t\\t\\t\\r\\n\\t\\t\\t\\t\\t\\t&lt;p class=&quot;price&quot;&gt;999,00\\u20ac&lt;\\/p&gt;&lt;\\/div&gt;\\r\\n\\t  &lt;\\/div&gt;\\r\\n\\r\\n\\t&lt;\\/div&gt;\"},\"1\":{\"title\":\"\",\"description\":\"\"}},\"status\":\"1\"}'),
(49, 'OFF Nesmuk', 'html', '{\"name\":\"OFF Nesmuk\",\"module_description\":{\"2\":{\"title\":\"Nesmuk \\/ Exklusiv Folder\\/Torsionsdamast\",\"description\":\"&lt;div class=&quot;product-thumb transition&quot;&gt;\\r\\n\\r\\n\\r\\n\\t\\t&lt;div class=&quot;image&quot;&gt;\\r\\n\\t\\t\\t&lt;img src=&quot;\\/image\\/catalog\\/Nesmuk Slider (1 von 2).jpg&quot; style=&quot;width: 600px;&quot;&gt;&lt;a href=&quot;http:\\/\\/temp.messer-bock.de\\/01FL010&quot;&gt;&lt;br&gt;&lt;\\/a&gt;\\r\\n\\r\\n\\r\\n\\r\\n      \\t\\t\\t \\t\\t&lt;\\/div&gt;\\r\\n      \\t &lt;div class=&quot;product-details&quot;&gt;\\r\\n\\t\\t&lt;div class=&quot;caption&quot;&gt;\\r\\n\\r\\n\\t\\t\\t&lt;!--  --&gt;\\r\\n                   \\t&lt;h4 style=&quot;text-align: center; &quot;&gt;Nesmuk Exklusiv Folder&lt;\\/h4&gt;&lt;p style=&quot;text-align: center; &quot;&gt;11 oder 66 Lagen Torsionsdamast&lt;\\/p&gt;&lt;\\/div&gt;\\r\\n\\t  &lt;\\/div&gt;\\r\\n\\r\\n\\t&lt;\\/div&gt;\"},\"1\":{\"title\":\"\",\"description\":\"\"}},\"status\":\"1\"}'),
(51, 'OFF Hersteller / Manufacture Box 03', 'html', '{\"name\":\"OFF Hersteller \\/ Manufacture Box 03\",\"module_description\":{\"2\":{\"title\":\"Hersteller \\/ Manufacture Box 03\",\"description\":\"&lt;div class=&quot;product-thumb transition&quot;&gt;\\r\\n\\r\\n\\r\\n\\t\\t&lt;div class=&quot;image&quot;&gt;&lt;br&gt;&lt;\\/div&gt;\\r\\n      \\t &lt;div class=&quot;product-details&quot;&gt;\\r\\n\\t\\t&lt;div class=&quot;caption&quot;&gt;\\r\\n\\r\\n\\t\\t\\t&lt;!--  --&gt;\\r\\n                   \\t&lt;h4&gt;&lt;img src=&quot;\\/image\\/catalog\\/Startseite Slider\\/Reiner Groesche-4736.jpg&quot; style=&quot;width: 50%;&quot;&gt;&lt;\\/h4&gt;&lt;p&gt;Reiner Groesche &quot;White Flash&quot;&lt;\\/p&gt;&lt;p&gt;999,-- \\u20ac&lt;\\/p&gt;&lt;\\/div&gt;\\r\\n\\t  &lt;\\/div&gt;\\r\\n\\r\\n\\t&lt;\\/div&gt;\"},\"1\":{\"title\":\"\",\"description\":\"\"}},\"status\":\"1\"}'),
(52, 'OFF Hersteller / Manufacture Box 04', 'html', '{\"name\":\"OFF Hersteller \\/ Manufacture Box 04\",\"module_description\":{\"2\":{\"title\":\"OFF Hersteller \\/ Manufacture Box 04\",\"description\":\"&lt;div class=&quot;product-thumb transition&quot;&gt;\\r\\n\\r\\n\\r\\n\\t\\t&lt;div class=&quot;image&quot;&gt;\\r\\n\\t\\t\\t&lt;a href=&quot;http:\\/\\/temp.messer-bock.de\\/01FL010&quot;&gt;&lt;img src=&quot;\\/image\\/cache\\/catalog\\/Forge%20de%20Laguile\\/S.%20Rambaud\\/Koralle\\/Forge%20de%20Laguiole%20S.%20Rambaud-8286-200x200.jpg&quot; alt=&quot;Forge de Laguiole Meisterst\\u00fcck S.Rambaud  &amp;quot;Haifisch und blaue Koralle&amp;quot;                                    &quot; title=&quot;Forge de Laguiole Meisterst\\u00fcck S.Rambaud  &amp;quot;Haifisch und blaue Koralle&amp;quot;                                    &quot; class=&quot;img-responsive&quot;&gt;&lt;\\/a&gt;\\r\\n\\r\\n\\r\\n\\r\\n      \\t\\t\\t \\t\\t&lt;\\/div&gt;\\r\\n      \\t &lt;div class=&quot;product-details&quot;&gt;\\r\\n\\t\\t&lt;div class=&quot;caption&quot;&gt;\\r\\n\\r\\n\\t\\t\\t&lt;!--  --&gt;\\r\\n                   \\t&lt;h4&gt;&lt;a href=&quot;\\/01FL010&quot;&gt;Forge de Laguiole Meisterst\\u00fcck S.Rambaud  &quot;Haifisch und blaue Koralle&quot;                                    &lt;\\/a&gt;&lt;\\/h4&gt;\\r\\n\\t\\t\\t\\r\\n\\t\\t\\t\\t\\t\\t&lt;p class=&quot;price&quot;&gt;\\r\\n\\t\\t\\t  \\t\\t\\t  3.732,00\\u20ac&lt;\\/p&gt;&lt;\\/div&gt;\\r\\n\\t  &lt;\\/div&gt;\\r\\n\\r\\n\\t&lt;\\/div&gt;\"},\"1\":{\"title\":\"\",\"description\":\"\"}},\"status\":\"1\"}'),
(53, 'OFF Hersteller / Manufacture Box 05', 'html', '{\"name\":\"OFF Hersteller \\/ Manufacture Box 05\",\"module_description\":{\"2\":{\"title\":\"Hersteller \\/ Manufacture Box 05\",\"description\":\"&lt;div class=&quot;product-thumb transition&quot;&gt;\\r\\n\\r\\n\\r\\n\\t\\t&lt;div class=&quot;image&quot;&gt;\\r\\n\\t\\t\\t&lt;a href=&quot;\\/01FL010&quot;&gt;&lt;img src=&quot;\\/image\\/cache\\/catalog\\/Forge%20de%20Laguile\\/S.%20Rambaud\\/Koralle\\/Forge%20de%20Laguiole%20S.%20Rambaud-8286-200x200.jpg&quot; alt=&quot;Forge de Laguiole Meisterst\\u00fcck S.Rambaud  &amp;quot;Haifisch und blaue Koralle&amp;quot;                                    &quot; title=&quot;Forge de Laguiole Meisterst\\u00fcck S.Rambaud  &amp;quot;Haifisch und blaue Koralle&amp;quot;                                    &quot; class=&quot;img-responsive&quot;&gt;&lt;\\/a&gt;\\r\\n\\r\\n\\r\\n\\r\\n      \\t\\t\\t \\t\\t&lt;\\/div&gt;\\r\\n      \\t &lt;div class=&quot;product-details&quot;&gt;\\r\\n\\t\\t&lt;div class=&quot;caption&quot;&gt;\\r\\n\\r\\n\\t\\t\\t&lt;!--  --&gt;\\r\\n                   \\t&lt;h4&gt;&lt;a href=&quot;\\/01FL010&quot;&gt;Forge de Laguiole Meisterst\\u00fcck S.Rambaud  &quot;Haifisch und blaue Koralle&quot;                                    &lt;\\/a&gt;&lt;\\/h4&gt;\\r\\n\\t\\t\\t\\r\\n\\t\\t\\t\\t\\t\\t&lt;p class=&quot;price&quot;&gt;\\r\\n\\t\\t\\t  \\t\\t\\t  3.732,00\\u20ac&lt;\\/p&gt;&lt;\\/div&gt;\\r\\n\\t  &lt;\\/div&gt;\\r\\n\\r\\n\\t&lt;\\/div&gt;\"},\"1\":{\"title\":\"\",\"description\":\"\"}},\"status\":\"1\"}'),
(54, 'OFF Hersteller / Manufacture Box 06', 'html', '{\"name\":\"OFF Hersteller \\/ Manufacture Box 06\",\"module_description\":{\"2\":{\"title\":\"Hersteller \\/ Manufacture Box 06\",\"description\":\"&lt;div class=&quot;product-thumb transition&quot;&gt;\\r\\n\\r\\n\\r\\n\\t\\t&lt;div class=&quot;image&quot;&gt;\\r\\n\\t\\t\\t&lt;a href=&quot;\\/01FL010&quot;&gt;&lt;img src=&quot;\\/image\\/cache\\/catalog\\/Forge%20de%20Laguile\\/S.%20Rambaud\\/Koralle\\/Forge%20de%20Laguiole%20S.%20Rambaud-8286-200x200.jpg&quot; alt=&quot;Forge de Laguiole Meisterst\\u00fcck S.Rambaud  &amp;quot;Haifisch und blaue Koralle&amp;quot;                                    &quot; title=&quot;Forge de Laguiole Meisterst\\u00fcck S.Rambaud  &amp;quot;Haifisch und blaue Koralle&amp;quot;                                    &quot; class=&quot;img-responsive&quot;&gt;&lt;\\/a&gt;\\r\\n\\r\\n\\r\\n\\r\\n      \\t\\t\\t \\t\\t&lt;\\/div&gt;\\r\\n      \\t &lt;div class=&quot;product-details&quot;&gt;\\r\\n\\t\\t&lt;div class=&quot;caption&quot;&gt;\\r\\n\\r\\n\\t\\t\\t&lt;!--  --&gt;\\r\\n                   \\t&lt;h4&gt;&lt;a href=&quot;http:\\/\\/temp.messer-bock.de\\/01FL010&quot;&gt;Forge de Laguiole Meisterst\\u00fcck S.Rambaud  &quot;Haifisch und blaue Koralle&quot;                                    &lt;\\/a&gt;&lt;\\/h4&gt;\\r\\n\\t\\t\\t\\r\\n\\t\\t\\t\\t\\t\\t&lt;p class=&quot;price&quot;&gt;\\r\\n\\t\\t\\t  \\t\\t\\t  3.732,00\\u20ac&lt;\\/p&gt;&lt;\\/div&gt;\\r\\n\\t  &lt;\\/div&gt;\\r\\n\\r\\n\\t&lt;\\/div&gt;\"},\"1\":{\"title\":\"\",\"description\":\"\"}},\"status\":\"1\"}'),
(55, 'OFF Hersteller / Manufacture Box 07', 'html', '{\"name\":\"OFF Hersteller \\/ Manufacture Box 07\",\"module_description\":{\"2\":{\"title\":\"Hersteller \\/ Manufacture Box 07\",\"description\":\"&lt;div class=&quot;product-thumb transition&quot;&gt;\\r\\n\\r\\n\\r\\n\\t\\t&lt;div class=&quot;image&quot;&gt;\\r\\n\\t\\t\\t&lt;a href=&quot;\\/01FL010&quot;&gt;&lt;img src=&quot;\\/image\\/cache\\/catalog\\/Forge%20de%20Laguile\\/S.%20Rambaud\\/Koralle\\/Forge%20de%20Laguiole%20S.%20Rambaud-8286-200x200.jpg&quot; alt=&quot;Forge de Laguiole Meisterst\\u00fcck S.Rambaud  &amp;quot;Haifisch und blaue Koralle&amp;quot;                                    &quot; title=&quot;Forge de Laguiole Meisterst\\u00fcck S.Rambaud  &amp;quot;Haifisch und blaue Koralle&amp;quot;                                    &quot; class=&quot;img-responsive&quot;&gt;&lt;\\/a&gt;\\r\\n\\r\\n\\r\\n\\r\\n      \\t\\t\\t \\t\\t&lt;\\/div&gt;\\r\\n      \\t &lt;div class=&quot;product-details&quot;&gt;\\r\\n\\t\\t&lt;div class=&quot;caption&quot;&gt;\\r\\n\\r\\n\\t\\t\\t&lt;!--  --&gt;\\r\\n                   \\t&lt;h4&gt;&lt;a href=&quot;\\/01FL010&quot;&gt;Forge de Laguiole Meisterst\\u00fcck S.Rambaud  &quot;Haifisch und blaue Koralle&quot;                                    &lt;\\/a&gt;&lt;\\/h4&gt;\\r\\n\\t\\t\\t\\r\\n\\t\\t\\t\\t\\t\\t&lt;p class=&quot;price&quot;&gt;\\r\\n\\t\\t\\t  \\t\\t\\t  3.732,00\\u20ac&lt;\\/p&gt;&lt;\\/div&gt;\\r\\n\\t  &lt;\\/div&gt;\\r\\n\\r\\n\\t&lt;\\/div&gt;\"},\"1\":{\"title\":\"\",\"description\":\"\"}},\"status\":\"1\"}'),
(56, 'OFF Hersteller / Manufacture Box 08', 'html', '{\"name\":\"OFF Hersteller \\/ Manufacture Box 08\",\"module_description\":{\"2\":{\"title\":\"Hersteller \\/ Manufacture Box 08\",\"description\":\"&lt;div class=&quot;product-thumb transition&quot;&gt;\\r\\n\\r\\n\\r\\n\\t\\t&lt;div class=&quot;image&quot;&gt;\\r\\n\\t\\t\\t&lt;a href=&quot;\\/01FL010&quot;&gt;&lt;img src=&quot;\\/image\\/cache\\/catalog\\/Forge%20de%20Laguile\\/S.%20Rambaud\\/Koralle\\/Forge%20de%20Laguiole%20S.%20Rambaud-8286-200x200.jpg&quot; alt=&quot;Forge de Laguiole Meisterst\\u00fcck S.Rambaud  &amp;quot;Haifisch und blaue Koralle&amp;quot;                                    &quot; title=&quot;Forge de Laguiole Meisterst\\u00fcck S.Rambaud  &amp;quot;Haifisch und blaue Koralle&amp;quot;                                    &quot; class=&quot;img-responsive&quot;&gt;&lt;\\/a&gt;\\r\\n\\r\\n\\r\\n\\r\\n      \\t\\t\\t \\t\\t&lt;\\/div&gt;\\r\\n      \\t &lt;div class=&quot;product-details&quot;&gt;\\r\\n\\t\\t&lt;div class=&quot;caption&quot;&gt;\\r\\n\\r\\n\\t\\t\\t&lt;!--  --&gt;\\r\\n                   \\t&lt;h4&gt;&lt;a href=&quot;\\/01FL010&quot;&gt;Forge de Laguiole Meisterst\\u00fcck S.Rambaud  &quot;Haifisch und blaue Koralle&quot;                                    &lt;\\/a&gt;&lt;\\/h4&gt;\\r\\n\\t\\t\\t\\r\\n\\t\\t\\t\\t\\t\\t&lt;p class=&quot;price&quot;&gt;\\r\\n\\t\\t\\t  \\t\\t\\t  3.732,00\\u20ac&lt;\\/p&gt;&lt;\\/div&gt;\\r\\n\\t  &lt;\\/div&gt;\\r\\n\\r\\n\\t&lt;\\/div&gt;\"},\"1\":{\"title\":\"\",\"description\":\"\"}},\"status\":\"1\"}'),
(57, 'HP Banner 05 nach Slider', 'html', '{\"name\":\"HP Banner 05 nach Slider\",\"module_description\":{\"2\":{\"title\":\"Walther PPQ;TFE Kal. .43;\",\"description\":\"&lt;p&gt;&lt;img src=&quot;http:\\/\\/temp20.waffen-bock.de\\/image\\/catalog\\/Startseite_600\\/20170210-2.4761_PPQM2_Anw.JPG&quot; style=&quot;width: 600px;&quot;&gt;&lt;br&gt;&lt;\\/p&gt;\"},\"1\":{\"title\":\"\",\"description\":\"\"}},\"status\":\"1\"}'),
(58, 'HP Banner 06 nach Slider', 'html', '{\"name\":\"HP Banner 06 nach Slider\",\"module_description\":{\"2\":{\"title\":\"Walther Ready 2 Defense;P22Q, Pfefferspray, Messer, Taschenlampe;\",\"description\":\"&lt;p&gt;&lt;img src=&quot;http:\\/\\/temp20.waffen-bock.de\\/image\\/catalog\\/Startseite_600\\/20170215-308.02.20-1_P22QR2DKit_Detail1_ret.JPG&quot; style=&quot;width: 600px;&quot;&gt;&lt;br&gt;&lt;\\/p&gt;\"},\"1\":{\"title\":\"HeinrichSchmidbauer;Hunter;Sambar-Hirschhorn;\\/HeinrichSchmidbauer\",\"description\":\"\"}},\"status\":\"1\"}'),
(59, 'HP Banner 07 nach Slider', 'html', '{\"name\":\"HP Banner 07 nach Slider\",\"module_description\":{\"2\":{\"title\":\"Umarex;850 Air Magnum XT;CO2 4,5mm\",\"description\":\"&lt;p&gt;&lt;img src=&quot;http:\\/\\/temp20.waffen-bock.de\\/image\\/catalog\\/Startseite_600\\/20181121-464.00.01-2_850M2_TargetKit_links_mitZF_und_SB.JPG&quot; style=&quot;width: 600px;&quot;&gt;&lt;br&gt;&lt;\\/p&gt;\"},\"1\":{\"title\":\"\",\"description\":\"\"}},\"status\":\"1\"}'),
(60, 'HP Banner 08 nach Slider', 'html', '{\"name\":\"HP Banner 08 nach Slider\",\"module_description\":{\"2\":{\"title\":\"Heckler &amp; Koch P 30;Kal. 9mm P.A.K.d\",\"description\":\"&lt;p&gt;&lt;img src=&quot;http:\\/\\/temp20.waffen-bock.de\\/image\\/catalog\\/Startseite_600\\/20120113-302.02.00_P30_Detail3.JPG&quot; style=&quot;width: 600px;&quot;&gt;&lt;br&gt;&lt;\\/p&gt;\"},\"1\":{\"title\":\"Arno Bernard;8113B Rinkhals;Mammut Molar;\\/Arno-Bernard\",\"description\":\"\"}},\"status\":\"1\"}');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `oc_newsletter_subscribe`
--

DROP TABLE IF EXISTS `oc_newsletter_subscribe`;
CREATE TABLE `oc_newsletter_subscribe` (
  `newsletter_id` int(11) NOT NULL,
  `newsletter_email` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `oc_newsletter_subscribe`
--

INSERT INTO `oc_newsletter_subscribe` (`newsletter_id`, `newsletter_email`) VALUES
(1, 'vunamkhtn@yahoo.com');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `oc_option`
--

DROP TABLE IF EXISTS `oc_option`;
CREATE TABLE `oc_option` (
  `option_id` int(11) NOT NULL,
  `type` varchar(32) NOT NULL,
  `sort_order` int(3) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `oc_option`
--

INSERT INTO `oc_option` (`option_id`, `type`, `sort_order`) VALUES
(1, 'radio', 1),
(2, 'checkbox', 2),
(4, 'text', 3),
(5, 'select', 4),
(6, 'textarea', 5),
(7, 'file', 6),
(8, 'date', 7),
(9, 'time', 8),
(10, 'datetime', 9),
(11, 'select', 10),
(12, 'date', 11);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `oc_option_description`
--

DROP TABLE IF EXISTS `oc_option_description`;
CREATE TABLE `oc_option_description` (
  `option_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(128) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `oc_option_description`
--

INSERT INTO `oc_option_description` (`option_id`, `language_id`, `name`) VALUES
(1, 1, 'Radio'),
(2, 1, 'Checkbox'),
(4, 1, 'Text'),
(6, 1, 'Textarea'),
(8, 1, 'Date'),
(7, 1, 'File'),
(5, 1, 'Select'),
(9, 1, 'Time'),
(10, 1, 'Date &amp; Time'),
(12, 1, 'Delivery Date'),
(11, 1, 'Size'),
(1, 2, 'Radio'),
(2, 2, 'Checkbox'),
(4, 2, 'Text'),
(6, 2, 'Textarea'),
(8, 2, 'Date'),
(7, 2, 'File'),
(5, 2, 'Select'),
(9, 2, 'Time'),
(10, 2, 'Date &amp; Time'),
(12, 2, 'Delivery Date'),
(11, 2, 'Size');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `oc_option_value`
--

DROP TABLE IF EXISTS `oc_option_value`;
CREATE TABLE `oc_option_value` (
  `option_value_id` int(11) NOT NULL,
  `option_id` int(11) NOT NULL,
  `image` varchar(255) NOT NULL,
  `sort_order` int(3) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `oc_option_value`
--

INSERT INTO `oc_option_value` (`option_value_id`, `option_id`, `image`, `sort_order`) VALUES
(43, 1, '', 3),
(32, 1, '', 1),
(45, 2, '', 4),
(44, 2, '', 3),
(42, 5, '', 4),
(41, 5, '', 3),
(39, 5, '', 1),
(40, 5, '', 2),
(31, 1, '', 2),
(23, 2, '', 1),
(24, 2, '', 2),
(46, 11, '', 1),
(47, 11, '', 2),
(48, 11, '', 3);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `oc_option_value_description`
--

DROP TABLE IF EXISTS `oc_option_value_description`;
CREATE TABLE `oc_option_value_description` (
  `option_value_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `option_id` int(11) NOT NULL,
  `name` varchar(128) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `oc_option_value_description`
--

INSERT INTO `oc_option_value_description` (`option_value_id`, `language_id`, `option_id`, `name`) VALUES
(43, 1, 1, 'Large'),
(32, 1, 1, 'Small'),
(45, 1, 2, 'Checkbox 4'),
(44, 1, 2, 'Checkbox 3'),
(31, 1, 1, 'Medium'),
(42, 1, 5, 'Yellow'),
(41, 1, 5, 'Green'),
(39, 1, 5, 'Red'),
(40, 1, 5, 'Blue'),
(23, 1, 2, 'Checkbox 1'),
(24, 1, 2, 'Checkbox 2'),
(48, 1, 11, 'Large'),
(47, 1, 11, 'Medium'),
(46, 1, 11, 'Small'),
(43, 2, 1, 'Large'),
(32, 2, 1, 'Small'),
(45, 2, 2, 'Checkbox 4'),
(44, 2, 2, 'Checkbox 3'),
(31, 2, 1, 'Medium'),
(42, 2, 5, 'Yellow'),
(41, 2, 5, 'Green'),
(39, 2, 5, 'Red'),
(40, 2, 5, 'Blue'),
(23, 2, 2, 'Checkbox 1'),
(24, 2, 2, 'Checkbox 2'),
(48, 2, 11, 'Large'),
(47, 2, 11, 'Medium'),
(46, 2, 11, 'Small');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `oc_order`
--

DROP TABLE IF EXISTS `oc_order`;
CREATE TABLE `oc_order` (
  `order_id` int(11) NOT NULL,
  `invoice_no` int(11) NOT NULL DEFAULT 0,
  `invoice_prefix` varchar(26) NOT NULL,
  `store_id` int(11) NOT NULL DEFAULT 0,
  `store_name` varchar(64) NOT NULL,
  `store_url` varchar(255) NOT NULL,
  `customer_id` int(11) NOT NULL DEFAULT 0,
  `customer_group_id` int(11) NOT NULL DEFAULT 0,
  `firstname` varchar(32) NOT NULL,
  `lastname` varchar(32) NOT NULL,
  `email` varchar(96) NOT NULL,
  `telephone` varchar(32) NOT NULL,
  `fax` varchar(32) NOT NULL,
  `custom_field` text NOT NULL,
  `payment_firstname` varchar(32) NOT NULL,
  `payment_lastname` varchar(32) NOT NULL,
  `payment_company` varchar(60) NOT NULL,
  `payment_address_1` varchar(128) NOT NULL,
  `payment_address_2` varchar(128) NOT NULL,
  `payment_city` varchar(128) NOT NULL,
  `payment_postcode` varchar(10) NOT NULL,
  `payment_country` varchar(128) NOT NULL,
  `payment_country_id` int(11) NOT NULL,
  `payment_zone` varchar(128) NOT NULL,
  `payment_zone_id` int(11) NOT NULL,
  `payment_address_format` text NOT NULL,
  `payment_custom_field` text NOT NULL,
  `payment_method` varchar(128) NOT NULL,
  `payment_code` varchar(128) NOT NULL,
  `shipping_firstname` varchar(32) NOT NULL,
  `shipping_lastname` varchar(32) NOT NULL,
  `shipping_company` varchar(40) NOT NULL,
  `shipping_address_1` varchar(128) NOT NULL,
  `shipping_address_2` varchar(128) NOT NULL,
  `shipping_city` varchar(128) NOT NULL,
  `shipping_postcode` varchar(10) NOT NULL,
  `shipping_country` varchar(128) NOT NULL,
  `shipping_country_id` int(11) NOT NULL,
  `shipping_zone` varchar(128) NOT NULL,
  `shipping_zone_id` int(11) NOT NULL,
  `shipping_address_format` text NOT NULL,
  `shipping_custom_field` text NOT NULL,
  `shipping_method` varchar(128) NOT NULL,
  `shipping_code` varchar(128) NOT NULL,
  `comment` text NOT NULL,
  `total` decimal(15,4) NOT NULL DEFAULT 0.0000,
  `order_status_id` int(11) NOT NULL DEFAULT 0,
  `affiliate_id` int(11) NOT NULL,
  `commission` decimal(15,4) NOT NULL,
  `marketing_id` int(11) NOT NULL,
  `tracking` varchar(64) NOT NULL,
  `language_id` int(11) NOT NULL,
  `currency_id` int(11) NOT NULL,
  `currency_code` varchar(3) NOT NULL,
  `currency_value` decimal(15,8) NOT NULL DEFAULT 1.00000000,
  `ip` varchar(40) NOT NULL,
  `forwarded_ip` varchar(40) NOT NULL,
  `user_agent` varchar(255) NOT NULL,
  `accept_language` varchar(255) NOT NULL,
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `oc_order`
--

INSERT INTO `oc_order` (`order_id`, `invoice_no`, `invoice_prefix`, `store_id`, `store_name`, `store_url`, `customer_id`, `customer_group_id`, `firstname`, `lastname`, `email`, `telephone`, `fax`, `custom_field`, `payment_firstname`, `payment_lastname`, `payment_company`, `payment_address_1`, `payment_address_2`, `payment_city`, `payment_postcode`, `payment_country`, `payment_country_id`, `payment_zone`, `payment_zone_id`, `payment_address_format`, `payment_custom_field`, `payment_method`, `payment_code`, `shipping_firstname`, `shipping_lastname`, `shipping_company`, `shipping_address_1`, `shipping_address_2`, `shipping_city`, `shipping_postcode`, `shipping_country`, `shipping_country_id`, `shipping_zone`, `shipping_zone_id`, `shipping_address_format`, `shipping_custom_field`, `shipping_method`, `shipping_code`, `comment`, `total`, `order_status_id`, `affiliate_id`, `commission`, `marketing_id`, `tracking`, `language_id`, `currency_id`, `currency_code`, `currency_value`, `ip`, `forwarded_ip`, `user_agent`, `accept_language`, `date_added`, `date_modified`) VALUES
(1, 0, 'WB-2018-00', 0, 'Waffen-Bock Frankfurt', 'http://localhost/wafen/', 0, 1, 'first', 'family', 'dds@sddd.com', '5546546', '', '[]', 'first', 'family', 'name_company', 'germany', '', 'Hanover (Hannover)', '12345', 'Germany', 81, 'Sachsen', 1266, '{company}\r\n{firstname} {lastname}\r\n{address_1}\r\n{address_2}\r\n{postcode} {city}\r\n{country}', '[]', 'Nachnahme', 'cod', 'first', 'family', 'name_company', 'germany', '', 'Hanover (Hannover)', '12345', 'Germany', 81, 'Sachsen', 1266, '{company}\r\n{firstname} {lastname}\r\n{address_1}\r\n{address_2}\r\n{postcode} {city}\r\n{country}', '[]', 'Versand Deutschland', 'weight.weight_9', '', '149.0000', 1, 0, '0.0000', 0, '', 2, 3, 'EUR', '1.00000000', '::1', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.88 Safari/537.36', 'vi-VN,vi;q=0.9,fr-FR;q=0.8,fr;q=0.7,en-US;q=0.6,en;q=0.5,de;q=0.4', '2020-12-23 10:24:18', '2020-12-23 10:24:24');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `oc_order_custom_field`
--

DROP TABLE IF EXISTS `oc_order_custom_field`;
CREATE TABLE `oc_order_custom_field` (
  `order_custom_field_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `custom_field_id` int(11) NOT NULL,
  `custom_field_value_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `value` text NOT NULL,
  `type` varchar(32) NOT NULL,
  `location` varchar(16) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `oc_order_history`
--

DROP TABLE IF EXISTS `oc_order_history`;
CREATE TABLE `oc_order_history` (
  `order_history_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `order_status_id` int(11) NOT NULL,
  `notify` tinyint(1) NOT NULL DEFAULT 0,
  `comment` text NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `oc_order_history`
--

INSERT INTO `oc_order_history` (`order_history_id`, `order_id`, `order_status_id`, `notify`, `comment`, `date_added`) VALUES
(659, 655, 1, 0, '', '2020-12-23 10:16:44'),
(660, 1, 1, 0, '', '2020-12-23 10:24:24');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `oc_order_option`
--

DROP TABLE IF EXISTS `oc_order_option`;
CREATE TABLE `oc_order_option` (
  `order_option_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `order_product_id` int(11) NOT NULL,
  `product_option_id` int(11) NOT NULL,
  `product_option_value_id` int(11) NOT NULL DEFAULT 0,
  `name` varchar(255) NOT NULL,
  `value` text NOT NULL,
  `type` varchar(32) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `oc_order_product`
--

DROP TABLE IF EXISTS `oc_order_product`;
CREATE TABLE `oc_order_product` (
  `order_product_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `model` varchar(64) NOT NULL,
  `quantity` int(4) NOT NULL,
  `price` decimal(15,4) NOT NULL DEFAULT 0.0000,
  `total` decimal(15,4) NOT NULL DEFAULT 0.0000,
  `tax` decimal(15,4) NOT NULL DEFAULT 0.0000,
  `reward` int(8) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `oc_order_product`
--

INSERT INTO `oc_order_product` (`order_product_id`, `order_id`, `product_id`, `name`, `model`, `quantity`, `price`, `total`, `tax`, `reward`) VALUES
(1, 1, 54, 'Knife 5', 'knife', 98, '3.4900', '342.0200', '0.0000', 0),
(2, 2, 54, 'Knife 5', 'knife', 8, '3.4900', '27.9200', '0.0000', 0),
(3, 3, 50, 'Knife 1', 'knife', 8, '3.4900', '27.9200', '0.0000', 0),
(4, 4, 50, 'Knife 1', 'knife', 5, '3.4900', '17.4500', '0.0000', 0),
(5, 5, 50, 'Knife 1', 'knife', 1, '3.4900', '3.4900', '0.0000', 0),
(6, 5, 55, 'Knife 6', 'knife', 1, '3.4900', '3.4900', '0.0000', 0),
(7, 6, 50, 'Knife 1', 'knife', 1, '3.4900', '3.4900', '0.0000', 0),
(8, 6, 55, 'Knife 6', 'knife', 1, '3.4900', '3.4900', '0.0000', 0),
(9, 7, 547, 'Patrick Teyke Harzer Schwarzwildmesser Wuesteneisenholz', '02TY012', 1, '1599.0000', '1599.0000', '0.0000', 0),
(10, 8, 547, 'Patrick Teyke Harzer Schwarzwildmesser Wuesteneisenholz', '02TY012', 1, '1599.0000', '1599.0000', '0.0000', 0),
(11, 9, 547, 'Patrick Teyke Harzer Schwarzwildmesser Wuesteneisenholz', '02TY012', 1, '1599.0000', '1599.0000', '0.0000', 0),
(12, 10, 61, 'DNC Custom Scrimshaw &quot;Big Five&quot;', '02DN016', 1, '2999.0000', '2999.0000', '0.0000', 0),
(13, 11, 61, 'DNC Custom Scrimshaw &quot;Big Five&quot;', '02DN016', 1, '2999.0000', '2999.0000', '0.0000', 0),
(14, 12, 302, 'Benchmade - 570BK Presidio II', '01BM010', 1, '299.0000', '299.0000', '0.0000', 0),
(15, 13, 61, 'DNC Custom Scrimshaw &quot;Big Five&quot;', '02DN016', 1, '2999.0000', '2999.0000', '0.0000', 0),
(16, 14, 61, 'DNC Custom Scrimshaw &quot;Big Five&quot;', '02DN016', 1, '2999.0000', '2999.0000', '0.0000', 0),
(17, 15, 628, 'Extrema Ratio 04.1000.0220/SAT Arditi 1942/2018', '02EX20', 1, '679.0000', '679.0000', '0.0000', 0),
(18, 16, 628, 'Extrema Ratio 04.1000.0220/SAT Arditi 1942/2018', '02EX20', 1, '679.0000', '679.0000', '0.0000', 0),
(19, 17, 628, 'Extrema Ratio 04.1000.0220/SAT Arditi 1942/2018', '02EX20', 1, '679.0000', '679.0000', '0.0000', 0),
(20, 18, 628, 'Extrema Ratio 04.1000.0220/SAT Arditi 1942/2018', '02EX20', 1, '679.0000', '679.0000', '0.0000', 0),
(21, 19, 628, 'Extrema Ratio 04.1000.0220/SAT Arditi 1942/2018', '02EX20', 1, '679.0000', '679.0000', '0.0000', 0),
(22, 20, 628, 'Extrema Ratio 04.1000.0220/SAT Arditi 1942/2018', '02EX20', 1, '679.0000', '679.0000', '0.0000', 0),
(23, 21, 628, 'Extrema Ratio 04.1000.0220/SAT Arditi 1942/2018', '02EX20', 1, '679.0000', '679.0000', '0.0000', 0),
(24, 22, 628, 'Extrema Ratio 04.1000.0220/SAT Arditi 1942/2018', '02EX20', 1, '679.0000', '679.0000', '0.0000', 0),
(25, 23, 628, 'Extrema Ratio 04.1000.0220/SAT Arditi 1942/2018', '02EX20', 1, '679.0000', '679.0000', '0.0000', 0),
(26, 24, 628, 'Extrema Ratio 04.1000.0220/SAT Arditi 1942/2018', '02EX20', 1, '679.0000', '679.0000', '0.0000', 0),
(27, 25, 628, 'Extrema Ratio 04.1000.0220/SAT Arditi 1942/2018', '02EX20', 1, '679.0000', '679.0000', '0.0000', 0),
(28, 26, 628, 'Extrema Ratio 04.1000.0220/SAT Arditi 1942/2018', '02EX20', 1, '679.0000', '679.0000', '0.0000', 0),
(29, 27, 628, 'Extrema Ratio 04.1000.0220/SAT Arditi 1942/2018', '02EX20', 1, '679.0000', '679.0000', '0.0000', 0),
(30, 28, 628, 'Extrema Ratio 04.1000.0220/SAT Arditi 1942/2018', '02EX20', 1, '679.0000', '679.0000', '0.0000', 0),
(31, 29, 628, 'Extrema Ratio 04.1000.0220/SAT Arditi 1942/2018', '02EX20', 1, '679.0000', '679.0000', '0.0000', 0),
(32, 30, 628, 'Extrema Ratio 04.1000.0220/SAT Arditi 1942/2018', '02EX20', 1, '679.0000', '679.0000', '0.0000', 0),
(33, 31, 628, 'Extrema Ratio 04.1000.0220/SAT Arditi 1942/2018', '02EX20', 1, '679.0000', '679.0000', '0.0000', 0),
(34, 32, 146, 'Böker Special Run Mod. 10', '01BO009', 1, '599.0000', '599.0000', '0.0000', 0),
(35, 33, 146, 'Böker Special Run Mod. 10', '01BO009', 1, '599.0000', '599.0000', '0.0000', 0),
(36, 34, 146, 'Böker Special Run Mod. 10', '01BO009', 1, '599.0000', '599.0000', '0.0000', 0),
(37, 35, 146, 'Böker Special Run Mod. 10', '01BO009', 1, '599.0000', '599.0000', '0.0000', 0),
(38, 36, 246, 'Forge de Laguiole Meisterstück S.Rambaud  &quot;Haifisch und blaue Koralle&quot;                                    ', '01FL010', 1, '3732.0000', '3732.0000', '0.0000', 0),
(39, 37, 246, 'Forge de Laguiole Meisterstück S.Rambaud  &quot;Haifisch und blaue Koralle&quot;                                    ', '01FL010', 1, '3732.0000', '3732.0000', '0.0000', 0),
(40, 38, 578, 'Fox Knives FX-599TiT Karambit Titan Schwarz', '01FX122', 1, '299.0000', '299.0000', '0.0000', 0),
(41, 39, 578, 'Fox Knives FX-599TiT Karambit Titan Schwarz', '01FX122', 1, '299.0000', '299.0000', '0.0000', 0),
(42, 40, 248, 'Forge de Laguiole Meisterstück S.Rambaud Giraffenknochen', '01FL012', 1, '2189.0000', '2189.0000', '0.0000', 0),
(43, 41, 248, 'Forge de Laguiole Meisterstück S.Rambaud Giraffenknochen', '01FL012', 1, '2189.0000', '2189.0000', '0.0000', 0),
(44, 42, 248, 'Forge de Laguiole Meisterstück S.Rambaud Giraffenknochen', '01FL012', 1, '2189.0000', '2189.0000', '0.0000', 0),
(45, 43, 248, 'Forge de Laguiole Meisterstück S.Rambaud Giraffenknochen', '01FL012', 1, '2189.0000', '2189.0000', '0.0000', 0),
(46, 44, 272, 'Hartkopf Mod. 255 22 0 31 Damast Bunthorn', '01HK005', 1, '249.0000', '249.0000', '0.0000', 0),
(47, 45, 272, 'Hartkopf Mod. 255 22 0 31 Damast Bunthorn', '01HK005', 1, '249.0000', '249.0000', '0.0000', 0),
(48, 46, 578, 'Fox Knives FX-599TiT Karambit Titan Schwarz', '01FX122', 1, '299.0000', '299.0000', '0.0000', 0),
(49, 47, 578, 'Fox Knives FX-599TiT Karambit Titan Schwarz', '01FX122', 1, '299.0000', '299.0000', '0.0000', 0),
(50, 48, 578, 'Fox Knives FX-599TiT Karambit Titan Schwarz', '01FX122', 1, '299.0000', '299.0000', '0.0000', 0),
(51, 49, 578, 'Fox Knives FX-599TiT Karambit Titan Schwarz', '01FX122', 1, '299.0000', '299.0000', '0.0000', 0),
(52, 50, 578, 'Fox Knives FX-599TiT Karambit Titan Schwarz', '01FX122', 1, '299.0000', '299.0000', '0.0000', 0),
(53, 51, 578, 'Fox Knives FX-599TiT Karambit Titan Schwarz', '01FX122', 1, '299.0000', '299.0000', '0.0000', 0),
(54, 52, 578, 'Fox Knives FX-599TiT Karambit Titan Schwarz', '01FX122', 1, '299.0000', '299.0000', '0.0000', 0),
(55, 53, 302, 'Benchmade - 570BK Presidio II', '01BM010', 1, '299.0000', '299.0000', '0.0000', 0),
(56, 54, 302, 'Benchmade - 570BK Presidio II', '01BM010', 1, '299.0000', '299.0000', '0.0000', 0),
(57, 55, 302, 'Benchmade - 570BK Presidio II', '01BM010', 1, '299.0000', '299.0000', '0.0000', 0),
(58, 56, 302, 'Benchmade - 570BK Presidio II', '01BM010', 1, '299.0000', '299.0000', '0.0000', 0),
(59, 57, 302, 'Benchmade - 570BK Presidio II', '01BM010', 1, '299.0000', '299.0000', '0.0000', 0),
(60, 58, 302, 'Benchmade - 570BK Presidio II', '01BM010', 1, '299.0000', '299.0000', '0.0000', 0),
(61, 59, 302, 'Benchmade - 570BK Presidio II', '01BM010', 1, '299.0000', '299.0000', '0.0000', 0),
(62, 60, 302, 'Benchmade - 570BK Presidio II', '01BM010', 1, '299.0000', '299.0000', '0.0000', 0),
(63, 61, 302, 'Benchmade - 570BK Presidio II', '01BM010', 1, '299.0000', '299.0000', '0.0000', 0),
(64, 62, 302, 'Benchmade - 570BK Presidio II', '01BM010', 1, '299.0000', '299.0000', '0.0000', 0),
(65, 63, 302, 'Benchmade - 570BK Presidio II', '01BM010', 1, '299.0000', '299.0000', '0.0000', 0),
(66, 64, 279, 'Juergen Schanz Viper Advance Raffir Stripes rot', '02JS001', 1, '390.0000', '390.0000', '0.0000', 0),
(67, 64, 578, 'Fox Knives FX-599TiT Karambit Titan Schwarz', '01FX122', 1, '299.0000', '299.0000', '0.0000', 0),
(68, 65, 279, 'Juergen Schanz Viper Advance Raffir Stripes rot', '02JS001', 1, '390.0000', '390.0000', '0.0000', 0),
(69, 65, 578, 'Fox Knives FX-599TiT Karambit Titan Schwarz', '01FX122', 1, '299.0000', '299.0000', '0.0000', 0),
(70, 66, 246, 'Forge de Laguiole Meisterstück S.Rambaud  &quot;Haifisch und blaue Koralle&quot;                                    ', '01FL010', 1, '3732.0000', '3732.0000', '0.0000', 0),
(71, 67, 246, 'Forge de Laguiole Meisterstück S.Rambaud  &quot;Haifisch und blaue Koralle&quot;                                    ', '01FL010', 1, '3732.0000', '3732.0000', '0.0000', 0),
(72, 68, 309, 'Patrick Teyke 10091 Harzer Schwarzwildmesser DSC Buche', '02TY010', 1, '1499.0000', '1499.0000', '0.0000', 0),
(73, 69, 309, 'Patrick Teyke 10091 Harzer Schwarzwildmesser DSC Buche', '02TY010', 1, '1499.0000', '1499.0000', '0.0000', 0),
(74, 70, 605, 'DNC Custom Leopard ', '01DN004', 1, '1499.0000', '1499.0000', '0.0000', 0),
(122, 116, 67, 'FKMD A.L.S.R.2', '01FX152', 1, '174.9500', '174.9500', '0.0000', 0),
(76, 72, 247, 'Forge de Laguiole Meisterstück S.Rambaud &quot;Warzenschwein&quot;', '01FL011', 1, '2582.0000', '2582.0000', '0.0000', 0),
(77, 73, 247, 'Forge de Laguiole Meisterstück S.Rambaud &quot;Warzenschwein&quot;', '01FL011', 1, '2582.0000', '2582.0000', '0.0000', 0),
(78, 74, 247, 'Forge de Laguiole Meisterstück S.Rambaud &quot;Warzenschwein&quot;', '01FL011', 1, '2582.0000', '2582.0000', '0.0000', 0),
(79, 75, 247, 'Forge de Laguiole Meisterstück S.Rambaud &quot;Warzenschwein&quot;', '01FL011', 1, '2582.0000', '2582.0000', '0.0000', 0),
(80, 76, 646, 'aaaa test', '1233456', 1, '1.0000', '1.0000', '0.0000', 0),
(81, 77, 646, 'aaaa test', '1233456', 1, '1.0000', '1.0000', '0.0000', 0),
(123, 117, 67, 'FKMD A.L.S.R.2', '01FX152', 1, '174.9500', '174.9500', '0.0000', 0),
(83, 79, 284, 'Patrick Teyke 3-Finger K98 Damast gestockte Buche', '02TY004', 1, '499.0000', '499.0000', '0.0000', 0),
(84, 80, 284, 'Patrick Teyke 3-Finger K98 Damast gestockte Buche', '02TY004', 1, '499.0000', '499.0000', '0.0000', 0),
(85, 81, 284, 'Patrick Teyke 3-Finger K98 Damast gestockte Buche', '02TY004', 1, '499.0000', '499.0000', '0.0000', 0),
(86, 82, 61, 'DNC Custom Scrimshaw &quot;Big Five&quot;', '02DN016', 1, '2999.0000', '2999.0000', '0.0000', 0),
(87, 83, 61, 'DNC Custom Scrimshaw &quot;Big Five&quot;', '02DN016', 1, '2999.0000', '2999.0000', '0.0000', 0),
(184, 176, 64, 'Fox Knives Dart', '01FX022', 1, '129.9500', '129.9500', '0.0000', 0),
(125, 119, 246, 'Forge de Laguiole Meisterstück S.Rambaud  &quot;Haifisch und blaue Koralle&quot;                                    ', '01FL010', 1, '3732.0000', '3732.0000', '0.0000', 0),
(90, 86, 563, 'DNC Custom Big Solar Kamelknochen', '02DN019', 1, '469.0000', '469.0000', '0.0000', 0),
(91, 87, 563, 'DNC Custom Big Solar Kamelknochen', '02DN019', 1, '469.0000', '469.0000', '0.0000', 0),
(92, 88, 308, 'Patrick Teyke 10110 Drop Point Hunter - Loveless style', '02TY009', 1, '1195.0000', '1195.0000', '0.0000', 0),
(93, 89, 308, 'Patrick Teyke 10110 Drop Point Hunter - Loveless style', '02TY009', 1, '1195.0000', '1195.0000', '0.0000', 0),
(94, 90, 246, 'Forge de Laguiole Meisterstück S.Rambaud  &quot;Haifisch und blaue Koralle&quot;                                    ', '01FL010', 1, '3732.0000', '3732.0000', '0.0000', 0),
(95, 90, 308, 'Patrick Teyke 10110 Drop Point Hunter - Loveless style', '02TY009', 1, '1195.0000', '1195.0000', '0.0000', 0),
(96, 91, 500, 'Cheburkov Mod. Russki &quot;Pyramidendamast&quot;', '01CV002', 1, '549.0000', '549.0000', '0.0000', 0),
(97, 92, 500, 'Cheburkov Mod. Russki &quot;Pyramidendamast&quot;', '01CV002', 1, '549.0000', '549.0000', '0.0000', 0),
(98, 93, 500, 'Cheburkov Mod. Russki &quot;Pyramidendamast&quot;', '01CV002', 1, '549.0000', '549.0000', '0.0000', 0),
(99, 94, 500, 'Cheburkov Mod. Russki &quot;Pyramidendamast&quot;', '01CV002', 1, '549.0000', '549.0000', '0.0000', 0),
(100, 95, 500, 'Cheburkov Mod. Russki &quot;Pyramidendamast&quot;', '01CV002', 1, '549.0000', '549.0000', '0.0000', 0),
(101, 96, 306, 'Patrick Teyke 10119 Harzer Rotwildmesser Pappel Maser', '02TY007', 1, '1599.0000', '1599.0000', '0.0000', 0),
(102, 97, 548, 'Patrick Teyke 3 Finger Messer Esche', '02TY013', 1, '399.0000', '399.0000', '0.0000', 0),
(103, 98, 548, 'Patrick Teyke 3 Finger Messer Esche', '02TY013', 1, '399.0000', '399.0000', '0.0000', 0),
(104, 99, 548, 'Patrick Teyke 3 Finger Messer Esche', '02TY013', 1, '399.0000', '399.0000', '0.0000', 0),
(105, 100, 548, 'Patrick Teyke 3 Finger Messer Esche', '02TY013', 1, '399.0000', '399.0000', '0.0000', 0),
(106, 101, 548, 'Patrick Teyke 3 Finger Messer Esche', '02TY013', 1, '399.0000', '399.0000', '0.0000', 0),
(108, 103, 247, 'Forge de Laguiole Meisterstück S.Rambaud &quot;Warzenschwein&quot;', '01FL011', 1, '2582.0000', '2582.0000', '0.0000', 0),
(109, 103, 548, 'Patrick Teyke 3 Finger Messer Esche', '02TY013', 1, '399.0000', '399.0000', '0.0000', 0),
(110, 104, 247, 'Forge de Laguiole Meisterstück S.Rambaud &quot;Warzenschwein&quot;', '01FL011', 1, '2582.0000', '2582.0000', '0.0000', 0),
(111, 105, 246, 'Forge de Laguiole Meisterstück S.Rambaud  &quot;Haifisch und blaue Koralle&quot;                                    ', '01FL010', 1, '3732.0000', '3732.0000', '0.0000', 0),
(112, 106, 246, 'Forge de Laguiole Meisterstück S.Rambaud  &quot;Haifisch und blaue Koralle&quot;                                    ', '01FL010', 1, '3732.0000', '3732.0000', '0.0000', 0),
(126, 120, 246, 'Forge de Laguiole Meisterstück S.Rambaud  &quot;Haifisch und blaue Koralle&quot;                                    ', '01FL010', 1, '3732.0000', '3732.0000', '0.0000', 0),
(114, 108, 306, 'Patrick Teyke 10119 Harzer Rotwildmesser Pappel Maser', '02TY007', 1, '1599.0000', '1599.0000', '0.0000', 0),
(115, 109, 306, 'Patrick Teyke 10119 Harzer Rotwildmesser Pappel Maser', '02TY007', 1, '1599.0000', '1599.0000', '0.0000', 0),
(116, 110, 306, 'Patrick Teyke 10119 Harzer Rotwildmesser Pappel Maser', '02TY007', 1, '1599.0000', '1599.0000', '0.0000', 0),
(117, 111, 306, 'Patrick Teyke 10119 Harzer Rotwildmesser Pappel Maser', '02TY007', 1, '1599.0000', '1599.0000', '0.0000', 0),
(118, 112, 306, 'Patrick Teyke 10119 Harzer Rotwildmesser Pappel Maser', '02TY007', 1, '1599.0000', '1599.0000', '0.0000', 0),
(119, 113, 306, 'Patrick Teyke 10119 Harzer Rotwildmesser Pappel Maser', '02TY007', 1, '1599.0000', '1599.0000', '0.0000', 0),
(120, 114, 306, 'Patrick Teyke 10119 Harzer Rotwildmesser Pappel Maser', '02TY007', 1, '1599.0000', '1599.0000', '0.0000', 0),
(121, 115, 306, 'Patrick Teyke 10119 Harzer Rotwildmesser Pappel Maser', '02TY007', 1, '1599.0000', '1599.0000', '0.0000', 0),
(127, 121, 246, 'Forge de Laguiole Meisterstück S.Rambaud  &quot;Haifisch und blaue Koralle&quot;                                    ', '01FL010', 1, '3732.0000', '3732.0000', '0.0000', 0),
(129, 123, 605, 'DNC Custom Leopard ', '01DN004', 1, '1499.0000', '1499.0000', '0.0000', 0),
(130, 124, 648, 'Benchmade 15085-2 Mini Crooked River', '01BM009', 1, '269.0000', '269.0000', '0.0000', 0),
(131, 125, 109, 'Beltrame 3-D Nero', '01BT001', 1, '99.9500', '99.9500', '0.0000', 0),
(132, 126, 109, 'Beltrame 3-D Nero', '01BT001', 1, '99.9500', '99.9500', '0.0000', 0),
(133, 127, 606, 'Mikov - 129627 - Predator Damast Bunthorn', '01MV001', 1, '449.0000', '449.0000', '0.0000', 0),
(134, 128, 124, 'Beltrame Lusso Cervo', '01BT004', 1, '89.9000', '89.9000', '0.0000', 0),
(186, 178, 518, 'Nesmuk Folder Exklusiv 11 Lagen Cocobolo', '01NM010', 1, '1250.0000', '1250.0000', '0.0000', 0),
(139, 132, 318, 'Klötzli - 3036 - Model 11', '02KL002', 1, '299.0000', '299.0000', '0.0000', 0),
(140, 133, 318, 'Klötzli - 3036 - Model 11', '02KL002', 1, '299.0000', '299.0000', '0.0000', 0),
(141, 134, 318, 'Klötzli - 3036 - Model 11', '02KL002', 1, '299.0000', '299.0000', '0.0000', 0),
(142, 135, 318, 'Klötzli - 3036 - Model 11', '02KL002', 1, '299.0000', '299.0000', '0.0000', 0),
(143, 136, 318, 'Klötzli - 3036 - Model 11', '02KL002', 1, '299.0000', '299.0000', '0.0000', 0),
(144, 137, 688, 'Victorinox Schäler', '03VX001', 1, '5.0000', '5.0000', '0.0000', 0),
(145, 138, 688, 'Victorinox Schäler', '03VX001', 1, '5.0000', '5.0000', '0.0000', 0),
(146, 139, 688, 'Victorinox Schäler', '03VX001', 1, '5.0000', '5.0000', '0.0000', 0),
(147, 140, 688, 'Victorinox Schäler', '03VX001', 1, '5.0000', '5.0000', '0.0000', 0),
(148, 141, 688, 'Victorinox Schäler', '03VX001', 1, '5.0000', '5.0000', '0.0000', 0),
(149, 142, 688, 'Victorinox Schäler', '03VX001', 1, '5.0000', '5.0000', '0.0000', 0),
(150, 143, 688, 'Victorinox Schäler', '03VX001', 1, '5.0000', '5.0000', '0.0000', 0),
(151, 144, 688, 'Victorinox Schäler', '03VX001', 1, '5.0000', '5.0000', '0.0000', 0),
(155, 147, 688, 'Victorinox Schäler', '03VX001', 1, '5.0000', '5.0000', '0.0000', 0),
(156, 148, 689, 'Victorinox Gemüsemesser klein', '02VX001', 1, '3.5000', '3.5000', '0.0000', 0),
(157, 149, 689, 'Victorinox Gemüsemesser klein', '02VX001', 1, '3.5000', '3.5000', '0.0000', 0),
(159, 151, 246, 'Forge de Laguiole Meisterstück S.Rambaud  &quot;Haifisch und blaue Koralle&quot;                                    ', '01FL010', 1, '3732.0000', '3732.0000', '0.0000', 0),
(160, 152, 246, 'Forge de Laguiole Meisterstück S.Rambaud  &quot;Haifisch und blaue Koralle&quot;                                    ', '01FL010', 1, '3732.0000', '3732.0000', '0.0000', 0),
(161, 153, 689, 'Victorinox Gemüsemesser klein', '02VX001', 1, '3.5000', '3.5000', '0.0000', 0),
(162, 154, 689, 'Victorinox Gemüsemesser klein', '02VX001', 1, '3.5000', '3.5000', '0.0000', 0),
(163, 155, 691, 'Victorinox - 1.4721.J18 - Jahrersmesser 2018 Deluxe Tinker Damast Pflaumenholz', '01VX001', 1, '289.0000', '289.0000', '0.0000', 0),
(164, 156, 596, 'White River WRBP-PBL Backpacker - Black', '02WR008', 1, '99.0000', '99.0000', '0.0000', 0),
(165, 157, 596, 'White River WRBP-PBL Backpacker - Black', '02WR008', 1, '99.0000', '99.0000', '0.0000', 0),
(166, 158, 596, 'White River WRBP-PBL Backpacker - Black', '02WR008', 1, '99.0000', '99.0000', '0.0000', 0),
(167, 159, 596, 'White River WRBP-PBL Backpacker - Black', '02WR008', 1, '99.0000', '99.0000', '0.0000', 0),
(169, 161, 691, 'Victorinox - 1.4721.J18 - Jahrersmesser 2018 Deluxe Tinker Damast Pflaumenholz', '01VX001', 1, '289.0000', '289.0000', '0.0000', 0),
(170, 162, 276, 'Reiner Grösche Torsionsdamast Stellersche Seekuh', '01RG002', 1, '1199.0000', '1199.0000', '0.0000', 0),
(171, 163, 276, 'Reiner Grösche Torsionsdamast Stellersche Seekuh', '01RG002', 1, '1199.0000', '1199.0000', '0.0000', 0),
(172, 164, 276, 'Reiner Grösche Torsionsdamast Stellersche Seekuh', '01RG002', 1, '1199.0000', '1199.0000', '0.0000', 0),
(173, 165, 276, 'Reiner Grösche Torsionsdamast Stellersche Seekuh', '01RG002', 1, '1199.0000', '1199.0000', '0.0000', 0),
(174, 166, 638, 'Pohl Force Kaila Two Black', '02PF014', 1, '169.0000', '169.0000', '0.0000', 0),
(175, 167, 689, 'Victorinox Gemüsemesser klein', '02VX001', 1, '3.5000', '3.5000', '0.0000', 0),
(176, 168, 689, 'Victorinox Gemüsemesser klein', '02VX001', 1, '3.5000', '3.5000', '0.0000', 0),
(177, 169, 689, 'Victorinox Gemüsemesser klein', '02VX001', 1, '3.5000', '3.5000', '0.0000', 0),
(179, 171, 689, 'Victorinox Gemüsemesser klein', '02VX001', 1, '3.5000', '3.5000', '0.0000', 0),
(181, 173, 577, 'Boeker CDC Waffen Bock/Frankfurt Mod. Trapper Pflaumenholz', '01BO041', 1, '69.9500', '69.9500', '0.0000', 0),
(182, 174, 213, 'Pohl Force Charlie One Outdoor', '02PF005', 1, '119.0000', '119.0000', '0.0000', 0),
(198, 184, 501, 'Cheburkov Mod. Russki Timast/Carbon Pyramidendamast', '01CV003', 1, '1149.0000', '1149.0000', '0.0000', 0),
(199, 185, 501, 'Cheburkov Mod. Russki Timast/Carbon Pyramidendamast', '01CV003', 1, '1149.0000', '1149.0000', '0.0000', 0),
(205, 190, 61, 'DNC Custom Scrimshaw &quot;Big Five&quot;', '02DN016', 1, '2999.0000', '2999.0000', '0.0000', 0),
(206, 191, 230, 'FKMD Grand Trapper', '02FX078', 1, '202.0000', '202.0000', '0.0000', 0),
(207, 192, 230, 'FKMD Grand Trapper', '02FX078', 1, '202.0000', '202.0000', '0.0000', 0),
(208, 193, 230, 'FKMD Grand Trapper', '02FX078', 1, '202.0000', '202.0000', '0.0000', 0),
(210, 195, 706, 'Pohl Force MK5', '02PF018', 1, '369.0000', '369.0000', '0.0000', 0),
(211, 196, 706, 'Pohl Force MK5', '02PF018', 1, '369.0000', '369.0000', '0.0000', 0),
(212, 197, 706, 'Pohl Force MK5', '02PF018', 1, '369.0000', '369.0000', '0.0000', 0),
(214, 199, 706, 'Pohl Force MK5', '02PF018', 2, '369.0000', '738.0000', '0.0000', 0),
(218, 202, 500, 'Cheburkov Mod. Russki &quot;Pyramidendamast&quot;', '01CV002', 1, '549.0000', '549.0000', '0.0000', 0),
(229, 213, 592, 'Reiner Grösche Nr. 688 Eibe Dream', '01RG008', 1, '1299.0000', '1299.0000', '0.0000', 0),
(230, 214, 592, 'Reiner Grösche Nr. 688 Eibe Dream', '01RG008', 1, '1299.0000', '1299.0000', '0.0000', 0),
(231, 215, 592, 'Reiner Grösche Nr. 688 Eibe Dream', '01RG008', 1, '1299.0000', '1299.0000', '0.0000', 0),
(232, 216, 592, 'Reiner Grösche Nr. 688 Eibe Dream', '01RG008', 1, '1299.0000', '1299.0000', '0.0000', 0),
(235, 219, 230, 'FKMD Grand Trapper', '02FX078', 1, '202.0000', '202.0000', '0.0000', 0),
(236, 220, 230, 'FKMD Grand Trapper', '02FX078', 1, '202.0000', '202.0000', '0.0000', 0),
(237, 221, 230, 'FKMD Grand Trapper', '02FX078', 1, '202.0000', '202.0000', '0.0000', 0),
(238, 222, 230, 'FKMD Grand Trapper', '02FX078', 1, '202.0000', '202.0000', '0.0000', 0),
(239, 223, 230, 'FKMD Grand Trapper', '02FX078', 1, '202.0000', '202.0000', '0.0000', 0),
(240, 224, 230, 'FKMD Grand Trapper', '02FX078', 1, '202.0000', '202.0000', '0.0000', 0),
(241, 225, 689, 'Victorinox Gemüsemesser klein. leer', '02VX001', 1, '3.5000', '3.5000', '0.0000', 0),
(243, 227, 689, 'Victorinox Gemüsemesser klein. leer', '02VX001', 1, '3.5000', '3.5000', '0.0000', 0),
(244, 228, 230, 'FKMD Grand Trapper', '02FX078', 1, '202.0000', '202.0000', '0.0000', 0),
(245, 229, 230, 'FKMD Grand Trapper', '02FX078', 1, '202.0000', '202.0000', '0.0000', 0),
(246, 230, 230, 'FKMD Grand Trapper', '02FX078', 1, '202.0000', '202.0000', '0.0000', 0),
(247, 231, 230, 'FKMD Grand Trapper', '02FX078', 1, '202.0000', '202.0000', '0.0000', 0),
(249, 233, 710, 'Spyderco Sprint Run C223GPBORE Para 3 Burnt Orange + CPM REX 45', '01SY020', 1, '229.0000', '229.0000', '0.0000', 0),
(250, 234, 710, 'Spyderco Sprint Run C223GPBORE Para 3 Burnt Orange + CPM REX 45', '01SY020', 1, '229.0000', '229.0000', '0.0000', 0),
(251, 235, 710, 'Spyderco Sprint Run C223GPBORE Para 3 Burnt Orange + CPM REX 45', '01SY020', 1, '229.0000', '229.0000', '0.0000', 0),
(253, 237, 637, 'Boeker CDC TacOpsGear Pry Mate 041/100', '02BO015', 1, '223.0000', '223.0000', '0.0000', 0),
(255, 239, 637, 'Boeker CDC TacOpsGear Pry Mate 041/100', '02BO015', 1, '223.0000', '223.0000', '0.0000', 0),
(256, 240, 637, 'Boeker CDC TacOpsGear Pry Mate 041/100', '02BO015', 1, '223.0000', '223.0000', '0.0000', 0),
(257, 241, 637, 'Boeker CDC TacOpsGear Pry Mate 041/100', '02BO015', 1, '223.0000', '223.0000', '0.0000', 0),
(263, 247, 141, 'Boeker Leopard III Damast &quot;all black&quot;', '01BO004', 1, '349.0000', '349.0000', '0.0000', 0),
(266, 249, 727, 'Extrema Ratio - 4.1000.013-BLK - RAO II', '01EX015', 1, '369.0000', '369.0000', '0.0000', 0),
(267, 250, 727, 'Extrema Ratio - 4.1000.013-BLK - RAO II', '01EX015', 1, '369.0000', '369.0000', '0.0000', 0),
(284, 258, 914, 'Benchmade - 531-1901 - Drop Point International Exclusive limited', '01BM029', 1, '249.0000', '249.0000', '0.0000', 0),
(292, 263, 918, 'DNC Mod. Argo Vollintegral Damast Mammutelfenbeinkruste', '02DN025', 1, '2399.0000', '2399.0000', '0.0000', 0),
(293, 264, 943, 'Extrema Ratio - 04.1000.0492BLK - BF2 R CT BLack', '01EX035', 1, '209.0000', '209.0000', '0.0000', 0),
(294, 265, 943, 'Extrema Ratio - 04.1000.0492BLK - BF2 R CT BLack', '01EX035', 1, '209.0000', '209.0000', '0.0000', 0),
(300, 271, 434, 'White River FC7 Firecraft 7', '02WR004', 1, '339.0000', '339.0000', '0.0000', 0),
(306, 276, 739, 'Eickhorn Forester III', '02EH042', 1, '149.0000', '149.0000', '0.0000', 0),
(308, 278, 926, 'VIctorinox - 0.9701.J19 - Wine Master Damast Limited Edition 2019', '01VX002', 2, '398.0000', '796.0000', '0.0000', 0),
(309, 279, 926, 'VIctorinox - 0.9701.J19 - Wine Master Damast Limited Edition 2019', '01VX002', 2, '398.0000', '796.0000', '0.0000', 0),
(317, 287, 924, 'Pohl Force #1098 Mike Six Survival ', '01PF023', 1, '329.0000', '329.0000', '0.0000', 0),
(322, 291, 176, 'Eickhorn KM 2000 BW', '02EH028', 1, '159.0000', '159.0000', '0.0000', 0),
(327, 295, 552, 'Boeker 1674 Amboina Mamba', '01BO023', 1, '179.9500', '179.9500', '0.0000', 0),
(329, 297, 704, 'Patrick Teyke Harzer Schwarzwildmesser DSC Damast mit Giraffenknochen - Halbintegral', '02TY016', 1, '1699.0000', '1699.0000', '0.0000', 0),
(331, 299, 501, 'Cheburkov Mod. Russki Timast/Carbon Pyramidendamast', '01CV003', 1, '1149.0000', '1149.0000', '0.0000', 0),
(335, 302, 182, 'Eickhorn &quot;Original PRT&quot;', '01EH003', 1, '109.0000', '109.0000', '0.0000', 0),
(337, 304, 382, 'Forge de Laguiole 11er Birke matt', '01FL063', 1, '119.0000', '119.0000', '0.0000', 0),
(338, 305, 127, 'Beltrame Lusso Bianco', '01BT007', 1, '49.5000', '49.5000', '0.0000', 0),
(340, 307, 739, 'Eickhorn Forester III', '02EH042', 1, '149.0000', '149.0000', '0.0000', 0),
(341, 308, 739, 'Eickhorn Forester III', '02EH042', 1, '149.0000', '149.0000', '0.0000', 0),
(344, 311, 334, 'Zero Tolerance Mod. 0095BW', '01ZT008', 1, '259.9500', '259.9500', '0.0000', 0),
(346, 313, 208, 'Pohl Force Alpha Four Tactical Desert 106/600', '01PF007', 1, '169.0000', '169.0000', '0.0000', 0),
(347, 314, 208, 'Pohl Force Alpha Four Tactical Desert 106/600', '01PF007', 1, '169.0000', '169.0000', '0.0000', 0),
(350, 317, 528, 'Boeker Boy Scout Honeycomb Blue', '01BO032', 1, '89.0000', '89.0000', '0.0000', 0),
(351, 318, 528, 'Boeker Boy Scout Honeycomb Blue', '01BO032', 1, '89.0000', '89.0000', '0.0000', 0),
(352, 319, 528, 'Boeker Boy Scout Honeycomb Blue', '01BO032', 1, '89.0000', '89.0000', '0.0000', 0),
(353, 320, 528, 'Boeker Boy Scout Honeycomb Blue', '01BO032', 1, '89.0000', '89.0000', '0.0000', 0),
(354, 321, 528, 'Boeker Boy Scout Honeycomb Blue', '01BO032', 1, '89.0000', '89.0000', '0.0000', 0),
(355, 322, 528, 'Boeker Boy Scout Honeycomb Blue', '01BO032', 1, '89.0000', '89.0000', '0.0000', 0),
(356, 323, 528, 'Boeker Boy Scout Honeycomb Blue', '01BO032', 1, '89.0000', '89.0000', '0.0000', 0),
(357, 324, 528, 'Boeker Boy Scout Honeycomb Blue', '01BO032', 1, '89.0000', '89.0000', '0.0000', 0),
(358, 325, 528, 'Boeker Boy Scout Honeycomb Blue', '01BO032', 1, '89.0000', '89.0000', '0.0000', 0),
(363, 330, 123, 'Beltrame Nero 1', '01BT002', 1, '85.0000', '85.0000', '0.0000', 0),
(365, 332, 316, 'Klötzli SBG1', '01KL007', 1, '399.0000', '399.0000', '0.0000', 0),
(366, 333, 316, 'Klötzli SBG1', '01KL007', 1, '399.0000', '399.0000', '0.0000', 0),
(367, 334, 570, 'Schmiedeglut Gourmet Folder mammoth teeth blue', '01SG011-3', 1, '599.0000', '599.0000', '0.0000', 0),
(369, 336, 566, 'Schmiedeglut Gourmet Folder Noble Uranium', '01SG007', 1, '499.0000', '499.0000', '0.0000', 0),
(370, 337, 566, 'Schmiedeglut Gourmet Folder Noble Uranium', '01SG007', 1, '499.0000', '499.0000', '0.0000', 0),
(371, 338, 566, 'Schmiedeglut Gourmet Folder Noble Uranium', '01SG007', 1, '499.0000', '499.0000', '0.0000', 0),
(372, 339, 566, 'Schmiedeglut Gourmet Folder Noble Uranium', '01SG007', 1, '499.0000', '499.0000', '0.0000', 0),
(373, 340, 566, 'Schmiedeglut Gourmet Folder Noble Uranium', '01SG007', 1, '499.0000', '499.0000', '0.0000', 0),
(378, 345, 82, 'Forge de Laguiole 6er Steak Messer Set Thuja Poliert', '06FL001TH', 1, '499.0000', '499.0000', '0.0000', 0),
(385, 352, 152, 'Boeker Speedlock I 2.0 Serrated ', '01BO015', 1, '149.9500', '149.9500', '0.0000', 0),
(389, 356, 82, 'Forge de Laguiole 6er Steak Messer Set Thuja Poliert', '06FL001TH', 1, '499.0000', '499.0000', '0.0000', 0),
(391, 358, 608, 'Mikov - V18037431- Predator Schlangenholz', '01MV004', 1, '199.0000', '199.0000', '0.0000', 0),
(393, 360, 150, 'Boeker Speedlock I 2.0', '01BO013', 1, '179.9500', '179.9500', '0.0000', 0),
(394, 361, 150, 'Boeker Speedlock I 2.0', '01BO013', 1, '179.9500', '179.9500', '0.0000', 0),
(395, 362, 795, 'Linder - 107512 - Mark I Hirschhorn', '02LI024', 1, '132.5000', '132.5000', '0.0000', 0),
(396, 363, 795, 'Linder - 107512 - Mark I Hirschhorn', '02LI024', 1, '132.5000', '132.5000', '0.0000', 0),
(397, 364, 127, 'Beltrame Lusso Bianco', '01BT007', 1, '49.5000', '49.5000', '0.0000', 0),
(398, 365, 127, 'Beltrame Lusso Bianco', '01BT007', 1, '49.5000', '49.5000', '0.0000', 0),
(405, 372, 482, 'Pohl Force November One Wood Outdoor Gen 2 ', '02PF015', 1, '249.0000', '249.0000', '0.0000', 0),
(406, 373, 482, 'Pohl Force November One Wood Outdoor Gen 2 ', '02PF015', 1, '249.0000', '249.0000', '0.0000', 0),
(408, 375, 1084, 'Patrick Teyke 3 Finger Messer Damast Büffelknochen', '02TY023', 1, '469.0000', '469.0000', '0.0000', 0),
(410, 377, 516, 'Nesmuk Folder Janus Mooreiche', '01NM008', 1, '690.0000', '690.0000', '0.0000', 0),
(414, 381, 1089, 'Chris Reeve - L21- 1144 - Large Sebenza 21 Inlay Micarta Black', '01CR015', 1, '599.0000', '599.0000', '0.0000', 0),
(418, 385, 273, 'Hartkopf Mod. 255 22 0 22 Damast Rotholz', '01HK006', 1, '219.0000', '219.0000', '0.0000', 0),
(419, 386, 273, 'Hartkopf Mod. 255 22 0 22 Damast Rotholz', '01HK006', 1, '219.0000', '219.0000', '0.0000', 0),
(422, 389, 1095, 'Heinrich Schmidbauer Oosik Hunter ', '02HS001', 1, '1299.0000', '1299.0000', '0.0000', 0),
(423, 390, 1095, 'Heinrich Schmidbauer Oosik Hunter ', '02HS001', 1, '1299.0000', '1299.0000', '0.0000', 0),
(424, 391, 1095, 'Heinrich Schmidbauer Oosik Hunter ', '02HS001', 1, '1299.0000', '1299.0000', '0.0000', 0),
(425, 392, 1095, 'Heinrich Schmidbauer Oosik Hunter ', '02HS001', 1, '1299.0000', '1299.0000', '0.0000', 0),
(428, 395, 931, 'Pohl Force #2072 Movie Knife 7 MK7', '02PF021', 1, '349.0000', '349.0000', '0.0000', 0),
(431, 398, 1098, 'Heinrich Schmiedbauer Hunter Messerwerk-Damast Sambar-Hirschhorn', '02HS002', 1, '1499.0000', '1499.0000', '0.0000', 0),
(432, 399, 319, 'Cold Steel 53CC &quot;The Spike&quot;', '02CS001', 1, '49.0000', '49.0000', '0.0000', 0),
(435, 402, 1049, 'Chris Reeve - L21-1056 - Large Sebenza 21 Unique', '01CR009', 1, '849.0000', '849.0000', '0.0000', 0),
(436, 402, 1088, 'Chris Reeve - L21-1122 - Large Sebenza 21 Inlay Macassar Raindrop Damascus Drop Point', '01CR014', 1, '869.0000', '869.0000', '0.0000', 0),
(437, 403, 1049, 'Chris Reeve - L21-1056 - Large Sebenza 21 Unique', '01CR009', 1, '849.0000', '849.0000', '0.0000', 0),
(438, 403, 1088, 'Chris Reeve - L21-1122 - Large Sebenza 21 Inlay Macassar Raindrop Damascus Drop Point', '01CR014', 1, '869.0000', '869.0000', '0.0000', 0),
(439, 404, 1049, 'Chris Reeve - L21-1056 - Large Sebenza 21 Unique', '01CR009', 1, '849.0000', '849.0000', '0.0000', 0),
(440, 404, 1088, 'Chris Reeve - L21-1122 - Large Sebenza 21 Inlay Macassar Raindrop Damascus Drop Point', '01CR014', 1, '869.0000', '869.0000', '0.0000', 0),
(443, 406, 744, 'Eickhorn Secutor Aluminium Holz 42a', '01EH018', 1, '149.0000', '149.0000', '0.0000', 0),
(445, 408, 1069, 'Pieter Annandale Damast-Timast Heavy Folder', '01PA001', 1, '1099.0000', '1099.0000', '0.0000', 0),
(448, 411, 925, 'Pohl Force #1097 MK2', '01PF024', 1, '329.0000', '329.0000', '0.0000', 0),
(451, 414, 1073, 'Schmiedeglut - X-Hunter Unlimited Pappel - Inox Damast', '02SG017', 1, '349.0000', '349.0000', '0.0000', 0),
(454, 417, 1081, 'Dawson Knives Mod. Snakebite CPM-3V OD Green G10', '02DA007', 1, '219.0000', '219.0000', '0.0000', 0),
(456, 419, 158, 'DNC Mod. Hubertus Amboina', '02DN007', 1, '379.0000', '379.0000', '0.0000', 0),
(457, 420, 158, 'DNC Mod. Hubertus Amboina', '02DN007', 1, '379.0000', '379.0000', '0.0000', 0),
(458, 421, 158, 'DNC Mod. Hubertus Amboina', '02DN007', 1, '379.0000', '379.0000', '0.0000', 0),
(459, 422, 158, 'DNC Mod. Hubertus Amboina', '02DN007', 1, '379.0000', '379.0000', '0.0000', 0),
(460, 423, 158, 'DNC Mod. Hubertus Amboina', '02DN007', 1, '379.0000', '379.0000', '0.0000', 0),
(462, 425, 318, 'Klötzli - 3036 - Model 11', '02KL002', 1, '199.0000', '199.0000', '0.0000', 0),
(463, 426, 318, 'Klötzli - 3036 - Model 11', '02KL002', 1, '199.0000', '199.0000', '0.0000', 0),
(471, 434, 225, 'Pohl Force Prepper Two Outdoor', '02PF010', 1, '329.0000', '329.0000', '0.0000', 0),
(472, 435, 1073, 'Schmiedeglut - X-Hunter Unlimited Pappel - Inox Damast', '02SG017', 1, '349.0000', '349.0000', '0.0000', 0),
(475, 438, 211, 'Pohl Force Bravo One Gen 3 Survival ', '01PF018', 1, '159.0000', '159.0000', '0.0000', 0),
(477, 440, 1102, 'Benchmade - 391BK - SOCP Folder plain', '01BM046', 1, '229.0000', '229.0000', '0.0000', 0),
(479, 442, 718, 'Benchmade 15080-01 Crooked River G10', '01BM016', 1, '289.0000', '289.0000', '0.0000', 0),
(481, 444, 211, 'Pohl Force Bravo One Gen 3 Survival ', '01PF018', 1, '159.0000', '159.0000', '0.0000', 0),
(482, 444, 978, 'Pohl Force #2076 November One Hunter Set', '02PF025', 1, '259.0000', '259.0000', '0.0000', 0),
(483, 445, 1118, 'Victorinox - 0.9410.J20 - Hunter Pro Alox Damast Limited Edition 2020 ', '01VX003', 1, '379.0000', '379.0000', '0.0000', 0),
(484, 446, 1118, 'Victorinox - 0.9410.J20 - Hunter Pro Alox Damast Limited Edition 2020 ', '01VX003', 1, '379.0000', '379.0000', '0.0000', 0),
(490, 452, 233, 'FKMD FX-500 Meskwaki Tracker', '01FX005', 1, '236.0000', '236.0000', '0.0000', 0),
(495, 457, 1096, 'Benchmade - 940-2001 - Osborne limited Edition', '01BM042', 1, '499.0000', '499.0000', '0.0000', 0),
(498, 460, 1026, 'Schmiedeglut Breacher Ahorn stabilsiert grün', '02SG014', 1, '425.0000', '425.0000', '0.0000', 0),
(499, 461, 334, 'Zero Tolerance Mod. 0095BW', '01ZT008', 1, '259.9500', '259.9500', '0.0000', 0),
(505, 467, 1026, 'Schmiedeglut Breacher Ahorn stabilsiert grün', '02SG014', 1, '425.0000', '425.0000', '0.0000', 0),
(507, 469, 127, 'Beltrame Lusso Bianco', '01BT007', 1, '59.0000', '59.0000', '0.0000', 0),
(508, 470, 127, 'Beltrame Lusso Bianco', '01BT007', 1, '59.0000', '59.0000', '0.0000', 0),
(512, 473, 787, 'Amare Knives 201808 Track bronze', '01AM003', 1, '209.0000', '209.0000', '0.0000', 0),
(513, 474, 787, 'Amare Knives 201808 Track bronze', '01AM003', 1, '209.0000', '209.0000', '0.0000', 0),
(517, 478, 708, 'Klötzli - 3036 - Model 11 - Wicklung Grün.', '02KL004', 1, '199.0000', '199.0000', '0.0000', 0),
(519, 480, 868, 'Pohl Force #1082 Force One Outdoor', '01PF021', 1, '349.0000', '349.0000', '0.0000', 0),
(520, 481, 868, 'Pohl Force #1082 Force One Outdoor', '01PF021', 1, '349.0000', '349.0000', '0.0000', 0),
(526, 487, 752, 'Linder Super Edge 1 black', '02LI003', 1, '125.0000', '125.0000', '0.0000', 0),
(527, 488, 752, 'Linder Super Edge 1 black', '02LI003', 1, '125.0000', '125.0000', '0.0000', 0),
(531, 492, 979, 'Benchmade 4300-1801 CLA Carbon', '01BM033', 1, '339.0000', '339.0000', '0.0000', 0),
(532, 493, 979, 'Benchmade 4300-1801 CLA Carbon', '01BM033', 1, '339.0000', '339.0000', '0.0000', 0),
(533, 494, 979, 'Benchmade 4300-1801 CLA Carbon', '01BM033', 1, '339.0000', '339.0000', '0.0000', 0),
(534, 495, 979, 'Benchmade 4300-1801 CLA Carbon', '01BM033', 1, '339.0000', '339.0000', '0.0000', 0),
(535, 496, 979, 'Benchmade 4300-1801 CLA Carbon', '01BM033', 1, '339.0000', '339.0000', '0.0000', 0),
(536, 497, 979, 'Benchmade 4300-1801 CLA Carbon', '01BM033', 1, '339.0000', '339.0000', '0.0000', 0),
(537, 498, 979, 'Benchmade 4300-1801 CLA Carbon', '01BM033', 1, '339.0000', '339.0000', '0.0000', 0),
(538, 499, 979, 'Benchmade 4300-1801 CLA Carbon', '01BM033', 1, '339.0000', '339.0000', '0.0000', 0),
(539, 500, 979, 'Benchmade 4300-1801 CLA Carbon', '01BM033', 1, '339.0000', '339.0000', '0.0000', 0),
(540, 501, 979, 'Benchmade 4300-1801 CLA Carbon', '01BM033', 1, '339.0000', '339.0000', '0.0000', 0),
(543, 503, 979, 'Benchmade 4300-1801 CLA Carbon', '01BM033', 1, '339.0000', '339.0000', '0.0000', 0),
(544, 504, 979, 'Benchmade 4300-1801 CLA Carbon', '01BM033', 1, '339.0000', '339.0000', '0.0000', 0),
(545, 505, 1100, 'Benchmade - Benchmade - 8551BK - Mediator Tanto Auto', '01BM045', 1, '359.0000', '359.0000', '0.0000', 0),
(547, 507, 328, 'Zero Tolerance Mod. 0850', '01ZT013', 1, '349.9500', '349.9500', '0.0000', 0),
(552, 512, 961, 'Reiner Groesche &quot;Blue Mammoth Molar&quot;', '01RG013', 1, '1499.0000', '1499.0000', '0.0000', 0),
(553, 513, 961, 'Reiner Groesche &quot;Blue Mammoth Molar&quot;', '01RG013', 1, '1499.0000', '1499.0000', '0.0000', 0),
(554, 514, 961, 'Reiner Groesche &quot;Blue Mammoth Molar&quot;', '01RG013', 1, '1499.0000', '1499.0000', '0.0000', 0),
(555, 515, 961, 'Reiner Groesche &quot;Blue Mammoth Molar&quot;', '01RG013', 1, '1499.0000', '1499.0000', '0.0000', 0),
(556, 516, 961, 'Reiner Groesche &quot;Blue Mammoth Molar&quot;', '01RG013', 1, '1499.0000', '1499.0000', '0.0000', 0),
(557, 517, 328, 'Zero Tolerance Mod. 0850', '01ZT013', 1, '349.9500', '349.9500', '0.0000', 0),
(560, 519, 1172, 'Acta Non Verba - ANVZ100-021 - Z100 - G10 Olive / Liner Lock, DLC Black / Plain Edge', '01AV002', 1, '119.0000', '119.0000', '0.0000', 0),
(561, 520, 1172, 'Acta Non Verba - ANVZ100-021 - Z100 - G10 Olive / Liner Lock, DLC Black / Plain Edge', '01AV002', 1, '119.0000', '119.0000', '0.0000', 0),
(562, 521, 1172, 'Acta Non Verba - ANVZ100-021 - Z100 - G10 Olive / Liner Lock, DLC Black / Plain Edge', '01AV002', 1, '119.0000', '119.0000', '0.0000', 0),
(563, 522, 1172, 'Acta Non Verba - ANVZ100-021 - Z100 - G10 Olive / Liner Lock, DLC Black / Plain Edge', '01AV002', 1, '119.0000', '119.0000', '0.0000', 0),
(564, 523, 1172, 'Acta Non Verba - ANVZ100-021 - Z100 - G10 Olive / Liner Lock, DLC Black / Plain Edge', '01AV002', 1, '119.0000', '119.0000', '0.0000', 0),
(573, 531, 868, 'Pohl Force #1082 Force One Outdoor Nr. 109', '01PF021', 1, '349.0000', '349.0000', '0.0000', 0),
(574, 532, 868, 'Pohl Force #1082 Force One Outdoor Nr. 109', '01PF021', 1, '349.0000', '349.0000', '0.0000', 0),
(579, 537, 887, 'Pohl Force #1083 Force One Hunter', '01PF022', 1, '349.0000', '349.0000', '0.0000', 0),
(580, 538, 887, 'Pohl Force #1083 Force One Hunter', '01PF022', 1, '349.0000', '349.0000', '0.0000', 0),
(581, 539, 887, 'Pohl Force #1083 Force One Hunter', '01PF022', 1, '349.0000', '349.0000', '0.0000', 0),
(582, 540, 887, 'Pohl Force #1083 Force One Hunter', '01PF022', 1, '349.0000', '349.0000', '0.0000', 0),
(587, 544, 1090, 'Chris Reeve - L21- 1144 - Large Sebenza 21 Inlay Micarta ', '01CR016', 1, '599.0000', '599.0000', '0.0000', 0),
(588, 545, 1090, 'Chris Reeve - L21- 1144 - Large Sebenza 21 Inlay Micarta ', '01CR016', 1, '599.0000', '599.0000', '0.0000', 0),
(589, 546, 1090, 'Chris Reeve - L21- 1144 - Large Sebenza 21 Inlay Micarta ', '01CR016', 1, '599.0000', '599.0000', '0.0000', 0),
(590, 547, 1090, 'Chris Reeve - L21- 1144 - Large Sebenza 21 Inlay Micarta ', '01CR016', 1, '599.0000', '599.0000', '0.0000', 0),
(591, 548, 1090, 'Chris Reeve - L21- 1144 - Large Sebenza 21 Inlay Micarta ', '01CR016', 1, '599.0000', '599.0000', '0.0000', 0),
(592, 549, 1090, 'Chris Reeve - L21- 1144 - Large Sebenza 21 Inlay Micarta ', '01CR016', 1, '599.0000', '599.0000', '0.0000', 0),
(593, 550, 1194, 'Extrema Ratio - 04.1000.0479/BLK/CiV - Misericordia ', '02EX030', 1, '189.0000', '189.0000', '0.0000', 0),
(594, 551, 1194, 'Extrema Ratio - 04.1000.0479/BLK/CiV - Misericordia ', '02EX030', 1, '189.0000', '189.0000', '0.0000', 0),
(597, 554, 211, 'Pohl Force Bravo One Gen 3 Survival ', '01PF018', 1, '159.0000', '159.0000', '0.0000', 0),
(599, 556, 851, 'Forge de Laguiole 6er Set Steakmesser Horn Poliert', '06FL001HO', 1, '599.0000', '599.0000', '0.0000', 0),
(602, 558, 1090, 'Chris Reeve - L21- 1144 - Large Sebenza 21 Inlay Micarta ', '01CR016', 1, '599.0000', '599.0000', '0.0000', 0),
(603, 559, 1090, 'Chris Reeve - L21- 1144 - Large Sebenza 21 Inlay Micarta ', '01CR016', 1, '599.0000', '599.0000', '0.0000', 0),
(604, 560, 1090, 'Chris Reeve - L21- 1144 - Large Sebenza 21 Inlay Micarta ', '01CR016', 1, '599.0000', '599.0000', '0.0000', 0),
(605, 561, 1090, 'Chris Reeve - L21- 1144 - Large Sebenza 21 Inlay Micarta ', '01CR016', 1, '599.0000', '599.0000', '0.0000', 0),
(606, 562, 1090, 'Chris Reeve - L21- 1144 - Large Sebenza 21 Inlay Micarta ', '01CR016', 1, '599.0000', '599.0000', '0.0000', 0),
(607, 563, 1090, 'Chris Reeve - L21- 1144 - Large Sebenza 21 Inlay Micarta ', '01CR016', 1, '599.0000', '599.0000', '0.0000', 0),
(609, 565, 887, 'Pohl Force #1083 Force One Hunter', '01PF022', 2, '349.0000', '698.0000', '0.0000', 0),
(610, 565, 955, 'Pohl Force #2057BO Prepper Two Outdoor Blaze Orange', '02PF022', 1, '349.0000', '349.0000', '0.0000', 0),
(619, 573, 1196, 'Boeker Plus - 01BO125 - BHQ LRF Copper', '01BP003', 1, '79.9500', '79.9500', '0.0000', 0),
(622, 576, 1119, 'Patrick Teyke Full Tang Loveless Style Drop Point', '02TY027', 1, '990.0000', '990.0000', '0.0000', 0),
(626, 579, 661, 'Boeker 121587 Vollintegral 2.0 Grenadill', '02BO017', 1, '319.0000', '319.0000', '0.0000', 0),
(627, 580, 661, 'Boeker 121587 Vollintegral 2.0 Grenadill', '02BO017', 1, '319.0000', '319.0000', '0.0000', 0),
(629, 582, 1096, 'Benchmade - 940-2001 - Osborne limited Edition', '01BM042', 1, '499.0000', '499.0000', '0.0000', 0),
(640, 593, 150, 'Boeker Speedlock I 2.0', '01BO013', 1, '179.9500', '179.9500', '0.0000', 0),
(642, 595, 829, 'Pohl Force #2040 November One Survival Gen1.1', '02PF019', 1, '279.0000', '279.0000', '0.0000', 0),
(643, 596, 829, 'Pohl Force #2040 November One Survival Gen1.1', '02PF019', 1, '279.0000', '279.0000', '0.0000', 0),
(646, 599, 828, 'Reiner Groesche Nr. 663 &quot;Leopard&quot;', '01RG012', 1, '1099.0000', '1099.0000', '0.0000', 0),
(652, 605, 958, 'Pohl Force #2041 November One Outdoor Gen1.1', '02PF024', 1, '249.0000', '249.0000', '0.0000', 0),
(653, 606, 958, 'Pohl Force #2041 November One Outdoor Gen1.1', '02PF024', 1, '249.0000', '249.0000', '0.0000', 0),
(654, 607, 958, 'Pohl Force #2041 November One Outdoor Gen1.1', '02PF024', 1, '249.0000', '249.0000', '0.0000', 0),
(656, 609, 1244, 'Cheburkov Mod. Swift large S60V Titan', '01CV015', 1, '0.0000', '0.0000', '0.0000', 0),
(657, 610, 827, 'Reiner Groesche Nr. 702 &quot;Brown Mammoth Molar&quot;', '01RG010', 1, '1399.0000', '1399.0000', '0.0000', 0),
(660, 613, 547, 'Patrick Teyke Harzer Schwarzwildmesser Tirpitz-Damast Wuesteneisenholz', '02TY012', 1, '1599.0000', '1599.0000', '0.0000', 0),
(663, 616, 125, 'Beltrame Lusso Corno', '01BT005', 1, '59.0000', '59.0000', '0.0000', 0),
(665, 618, 1281, 'Röhm RG 88 black', '702.02.00', 1, '149.0000', '149.0000', '0.0000', 0),
(666, 619, 1281, 'Röhm RG 88 black', '702.02.00', 1, '149.0000', '149.0000', '0.0000', 0),
(667, 620, 1313, 'Zoraki R2 2&quot; Schwarz', 'ZR22bl', 1, '149.0000', '149.0000', '0.0000', 0),
(668, 621, 1313, 'Zoraki R2 2&quot; Schwarz', 'ZR22bl', 1, '149.0000', '149.0000', '0.0000', 0),
(669, 622, 1313, 'Zoraki R2 2&quot; Schwarz', 'ZR22bl', 1, '149.0000', '149.0000', '0.0000', 0),
(670, 623, 1313, 'Zoraki R2 2&quot; Schwarz', 'ZR22bl', 1, '149.0000', '149.0000', '0.0000', 0),
(671, 624, 1313, 'Zoraki R2 2&quot; Schwarz', 'ZR22bl', 1, '149.0000', '149.0000', '0.0000', 0),
(672, 625, 1313, 'Zoraki R2 2&quot; Schwarz', 'ZR22bl', 1, '149.0000', '149.0000', '0.0000', 0),
(673, 626, 1313, 'Zoraki R2 2&quot; Schwarz', 'ZR22bl', 1, '149.0000', '149.0000', '0.0000', 0),
(674, 627, 1313, 'Zoraki R2 2&quot; Schwarz', 'ZR22bl', 1, '149.0000', '149.0000', '0.0000', 0),
(675, 628, 1313, 'Zoraki R2 2&quot; Schwarz', 'ZR22bl', 1, '149.0000', '149.0000', '0.0000', 0),
(676, 629, 1313, 'Zoraki R2 2&quot; Schwarz', 'ZR22bl', 1, '149.0000', '149.0000', '0.0000', 0),
(677, 630, 1313, 'Zoraki R2 2&quot; Schwarz', 'ZR22bl', 1, '149.0000', '149.0000', '0.0000', 0),
(678, 631, 1313, 'Zoraki R2 2&quot; Schwarz', 'ZR22bl', 1, '149.0000', '149.0000', '0.0000', 0),
(679, 632, 1313, 'Zoraki R2 2&quot; Schwarz', 'ZR22bl', 1, '149.0000', '149.0000', '0.0000', 0),
(680, 633, 1313, 'Zoraki R2 2&quot; Schwarz', 'ZR22bl', 1, '149.0000', '149.0000', '0.0000', 0),
(681, 634, 1313, 'Zoraki R2 2&quot; Schwarz', 'ZR22bl', 1, '149.0000', '149.0000', '0.0000', 0),
(682, 635, 1313, 'Zoraki R2 2&quot; Schwarz', 'ZR22bl', 1, '149.0000', '149.0000', '0.0000', 0),
(683, 636, 1317, 'Weihrauch HW 88 black', 'HW88bl', 1, '199.0000', '199.0000', '0.0000', 0),
(684, 637, 1317, 'Weihrauch HW 88 black', 'HW88bl', 1, '199.0000', '199.0000', '0.0000', 0),
(685, 638, 1317, 'Weihrauch HW 88 black', 'HW88bl', 1, '199.0000', '199.0000', '0.0000', 0),
(686, 639, 1317, 'Weihrauch HW 88 black', 'HW88bl', 1, '199.0000', '199.0000', '0.0000', 0),
(687, 640, 1317, 'Weihrauch HW 88 black', 'HW88bl', 1, '199.0000', '199.0000', '0.0000', 0),
(688, 641, 1317, 'Weihrauch HW 88 black', 'HW88bl', 1, '199.0000', '199.0000', '0.0000', 0),
(689, 642, 1317, 'Weihrauch HW 88 black', 'HW88bl', 1, '199.0000', '199.0000', '0.0000', 0),
(690, 643, 1317, 'Weihrauch HW 88 black', 'HW88bl', 1, '199.0000', '199.0000', '0.0000', 0),
(691, 644, 1317, 'Weihrauch HW 88 black', 'HW88bl', 1, '199.0000', '199.0000', '0.0000', 0),
(692, 645, 1317, 'Weihrauch HW 88 black', 'HW88bl', 1, '199.0000', '199.0000', '0.0000', 0),
(693, 646, 1317, 'Weihrauch HW 88 black', 'HW88bl', 1, '199.0000', '199.0000', '0.0000', 0),
(694, 647, 1317, 'Weihrauch HW 88 black', 'HW88bl', 1, '199.0000', '199.0000', '0.0000', 0),
(695, 648, 1317, 'Weihrauch HW 88 black', 'HW88bl', 1, '199.0000', '199.0000', '0.0000', 0),
(696, 649, 1317, 'Weihrauch HW 88 black', 'HW88bl', 1, '199.0000', '199.0000', '0.0000', 0),
(697, 650, 1317, 'Weihrauch HW 88 black', 'HW88bl', 1, '199.0000', '199.0000', '0.0000', 0),
(698, 651, 1317, 'Weihrauch HW 88 black', 'HW88bl', 1, '199.0000', '199.0000', '0.0000', 0),
(699, 652, 1317, 'Weihrauch HW 88 black', 'HW88bl', 1, '199.0000', '199.0000', '0.0000', 0),
(700, 653, 1317, 'Weihrauch HW 88 black', 'HW88bl', 1, '199.0000', '199.0000', '0.0000', 0),
(701, 654, 1317, 'Weihrauch HW 88 black', 'HW88bl', 1, '199.0000', '199.0000', '0.0000', 0),
(702, 655, 1317, 'Weihrauch HW 88 black', 'HW88bl', 1, '199.0000', '199.0000', '0.0000', 0),
(703, 1, 1315, 'Weihrauch HW 37 black', 'HW37', 1, '149.0000', '149.0000', '0.0000', 0);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `oc_order_recurring`
--

DROP TABLE IF EXISTS `oc_order_recurring`;
CREATE TABLE `oc_order_recurring` (
  `order_recurring_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `reference` varchar(255) NOT NULL,
  `product_id` int(11) NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `product_quantity` int(11) NOT NULL,
  `recurring_id` int(11) NOT NULL,
  `recurring_name` varchar(255) NOT NULL,
  `recurring_description` varchar(255) NOT NULL,
  `recurring_frequency` varchar(25) NOT NULL,
  `recurring_cycle` smallint(6) NOT NULL,
  `recurring_duration` smallint(6) NOT NULL,
  `recurring_price` decimal(10,4) NOT NULL,
  `trial` tinyint(1) NOT NULL,
  `trial_frequency` varchar(25) NOT NULL,
  `trial_cycle` smallint(6) NOT NULL,
  `trial_duration` smallint(6) NOT NULL,
  `trial_price` decimal(10,4) NOT NULL,
  `status` tinyint(4) NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `oc_order_recurring_transaction`
--

DROP TABLE IF EXISTS `oc_order_recurring_transaction`;
CREATE TABLE `oc_order_recurring_transaction` (
  `order_recurring_transaction_id` int(11) NOT NULL,
  `order_recurring_id` int(11) NOT NULL,
  `reference` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL,
  `amount` decimal(10,4) NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `oc_order_status`
--

DROP TABLE IF EXISTS `oc_order_status`;
CREATE TABLE `oc_order_status` (
  `order_status_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(32) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `oc_order_status`
--

INSERT INTO `oc_order_status` (`order_status_id`, `language_id`, `name`) VALUES
(2, 1, 'Processing'),
(3, 1, 'Shipped'),
(7, 1, 'Canceled'),
(5, 1, 'Complete'),
(8, 1, 'Denied'),
(9, 1, 'Canceled Reversal'),
(10, 1, 'Failed'),
(11, 1, 'Refunded'),
(12, 1, 'Reversed'),
(13, 1, 'Chargeback'),
(1, 1, 'Pending'),
(16, 1, 'Voided'),
(15, 1, 'Processed'),
(14, 1, 'Expired'),
(2, 2, 'Processing'),
(3, 2, 'Shipped'),
(7, 2, 'Canceled'),
(5, 2, 'Complete'),
(8, 2, 'Denied'),
(9, 2, 'Canceled Reversal'),
(10, 2, 'Failed'),
(11, 2, 'Refunded'),
(12, 2, 'Reversed'),
(13, 2, 'Chargeback'),
(1, 2, 'Pending'),
(16, 2, 'Voided'),
(15, 2, 'Processed'),
(14, 2, 'Expired'),
(17, 1, 'Payment uncertain (Concardis Pay'),
(17, 2, 'Payment uncertain (Concardis Pay'),
(18, 1, 'Payment cancelled (Concardis Pay'),
(18, 2, 'Payment cancelled (Concardis Pay'),
(19, 1, 'Pending Payment (Concardis PayEn'),
(19, 2, 'Pending Payment (Concardis PayEn');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `oc_order_total`
--

DROP TABLE IF EXISTS `oc_order_total`;
CREATE TABLE `oc_order_total` (
  `order_total_id` int(10) NOT NULL,
  `order_id` int(11) NOT NULL,
  `code` varchar(32) NOT NULL,
  `title` varchar(255) NOT NULL,
  `value` decimal(15,4) NOT NULL DEFAULT 0.0000,
  `sort_order` int(3) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `oc_order_total`
--

INSERT INTO `oc_order_total` (`order_total_id`, `order_id`, `code`, `title`, `value`, `sort_order`) VALUES
(1, 1, 'sub_total', 'Sub-Total', '342.0200', 1),
(2, 1, 'shipping', 'Free Shipping', '0.0000', 3),
(3, 1, 'total', 'Total', '342.0200', 9),
(4, 2, 'sub_total', 'Sub-Total', '27.9200', 1),
(5, 2, 'shipping', 'Deutschland', '6.9900', 3),
(6, 2, 'total', 'Total', '34.9100', 9),
(7, 3, 'sub_total', 'Sub-Total', '27.9200', 1),
(8, 3, 'shipping', 'Deutschland', '6.9900', 3),
(9, 3, 'total', 'Total', '34.9100', 9),
(10, 4, 'sub_total', 'Sub-Total', '17.4500', 1),
(11, 4, 'shipping', 'Out Deutschland', '15.9900', 3),
(12, 4, 'total', 'Total', '33.4400', 9),
(13, 5, 'sub_total', 'Zwischensumme', '6.9800', 1),
(14, 5, 'shipping', 'Deutschland', '6.9900', 3),
(15, 5, 'total', 'Gesamtsumme', '13.9700', 9),
(16, 6, 'sub_total', 'Sub-Total', '6.9800', 1),
(17, 6, 'shipping', 'Deutschland', '6.9900', 3),
(18, 6, 'total', 'Total', '13.9700', 9),
(19, 7, 'sub_total', 'Zwischensumme', '1599.0000', 1),
(20, 7, 'shipping', 'Versandkostenfrei', '0.0000', 3),
(21, 7, 'total', 'Gesamtsumme', '1599.0000', 9),
(22, 8, 'sub_total', 'Zwischensumme', '1599.0000', 1),
(23, 8, 'shipping', 'Versandkostenfrei', '0.0000', 3),
(24, 8, 'total', 'Gesamtsumme', '1599.0000', 9),
(25, 9, 'sub_total', 'Zwischensumme', '1599.0000', 1),
(26, 9, 'shipping', 'Versandkostenfrei', '0.0000', 3),
(27, 9, 'total', 'Gesamtsumme', '1599.0000', 9),
(28, 10, 'sub_total', 'Zwischensumme', '2999.0000', 1),
(29, 10, 'shipping', 'Versandkostenfrei', '0.0000', 3),
(30, 10, 'total', 'Gesamtsumme', '2999.0000', 9),
(31, 11, 'sub_total', 'Zwischensumme', '2999.0000', 1),
(32, 11, 'shipping', 'Versandkostenfrei', '0.0000', 3),
(33, 11, 'total', 'Gesamtsumme', '2999.0000', 9),
(34, 12, 'sub_total', 'Zwischensumme', '299.0000', 1),
(35, 12, 'shipping', 'Versandkostenfrei', '0.0000', 3),
(36, 12, 'total', 'Gesamtsumme', '299.0000', 9),
(37, 13, 'sub_total', 'Zwischensumme', '2999.0000', 1),
(38, 13, 'shipping', 'Versandkostenfrei', '0.0000', 3),
(39, 13, 'total', 'Gesamtsumme', '2999.0000', 9),
(40, 14, 'sub_total', 'Zwischensumme', '2999.0000', 1),
(41, 14, 'shipping', 'Versandkostenfrei', '0.0000', 3),
(42, 14, 'total', 'Gesamtsumme', '2999.0000', 9),
(43, 15, 'sub_total', 'Zwischensumme', '679.0000', 1),
(44, 15, 'shipping', 'Versandkostenfrei', '0.0000', 3),
(45, 15, 'total', 'Gesamtsumme', '679.0000', 9),
(46, 16, 'sub_total', 'Zwischensumme', '679.0000', 1),
(47, 16, 'shipping', 'Versandkostenfrei', '0.0000', 3),
(48, 16, 'total', 'Gesamtsumme', '679.0000', 9),
(49, 17, 'sub_total', 'Zwischensumme', '679.0000', 1),
(50, 17, 'shipping', 'Versandkostenfrei', '0.0000', 3),
(51, 17, 'total', 'Gesamtsumme', '679.0000', 9),
(52, 18, 'sub_total', 'Zwischensumme', '679.0000', 1),
(53, 18, 'shipping', 'Versandkostenfrei', '0.0000', 3),
(54, 18, 'total', 'Gesamtsumme', '679.0000', 9),
(55, 19, 'sub_total', 'Zwischensumme', '679.0000', 1),
(56, 19, 'shipping', 'Versandkostenfrei', '0.0000', 3),
(57, 19, 'total', 'Gesamtsumme', '679.0000', 9),
(58, 20, 'sub_total', 'Zwischensumme', '679.0000', 1),
(59, 20, 'shipping', 'Versandkostenfrei', '0.0000', 3),
(60, 20, 'total', 'Gesamtsumme', '679.0000', 9),
(61, 21, 'sub_total', 'Zwischensumme', '679.0000', 1),
(62, 21, 'shipping', 'Versandkostenfrei', '0.0000', 3),
(63, 21, 'total', 'Gesamtsumme', '679.0000', 9),
(64, 22, 'sub_total', 'Zwischensumme', '679.0000', 1),
(65, 22, 'shipping', 'Versandkostenfrei', '0.0000', 3),
(66, 22, 'total', 'Gesamtsumme', '679.0000', 9),
(67, 23, 'sub_total', 'Zwischensumme', '679.0000', 1),
(68, 23, 'shipping', 'Versandkostenfrei', '0.0000', 3),
(69, 23, 'total', 'Gesamtsumme', '679.0000', 9),
(70, 24, 'sub_total', 'Zwischensumme', '679.0000', 1),
(71, 24, 'shipping', 'Versandkostenfrei', '0.0000', 3),
(72, 24, 'total', 'Gesamtsumme', '679.0000', 9),
(73, 25, 'sub_total', 'Zwischensumme', '679.0000', 1),
(74, 25, 'shipping', 'Versandkostenfrei', '0.0000', 3),
(75, 25, 'total', 'Gesamtsumme', '679.0000', 9),
(76, 26, 'sub_total', 'Zwischensumme', '679.0000', 1),
(77, 26, 'shipping', 'Versandkostenfrei', '0.0000', 3),
(78, 26, 'total', 'Gesamtsumme', '679.0000', 9),
(79, 27, 'sub_total', 'Zwischensumme', '679.0000', 1),
(80, 27, 'shipping', 'Versandkostenfrei', '0.0000', 3),
(81, 27, 'total', 'Gesamtsumme', '679.0000', 9),
(82, 28, 'sub_total', 'Zwischensumme', '679.0000', 1),
(83, 28, 'shipping', 'Versandkostenfrei', '0.0000', 3),
(84, 28, 'total', 'Gesamtsumme', '679.0000', 9),
(85, 29, 'sub_total', 'Zwischensumme', '679.0000', 1),
(86, 29, 'shipping', 'Versandkostenfrei', '0.0000', 3),
(87, 29, 'total', 'Gesamtsumme', '679.0000', 9),
(88, 30, 'sub_total', 'Zwischensumme', '679.0000', 1),
(89, 30, 'shipping', 'Versandkostenfrei', '0.0000', 3),
(90, 30, 'total', 'Gesamtsumme', '679.0000', 9),
(91, 31, 'sub_total', 'Zwischensumme', '679.0000', 1),
(92, 31, 'shipping', 'Versandkostenfrei', '0.0000', 3),
(93, 31, 'total', 'Gesamtsumme', '679.0000', 9),
(94, 32, 'sub_total', 'Zwischensumme', '599.0000', 1),
(95, 32, 'shipping', 'Versandkostenfrei', '0.0000', 3),
(96, 32, 'total', 'Gesamtsumme', '599.0000', 9),
(97, 33, 'sub_total', 'Zwischensumme', '599.0000', 1),
(98, 33, 'shipping', 'Versandkostenfrei', '0.0000', 3),
(99, 33, 'total', 'Gesamtsumme', '599.0000', 9),
(100, 34, 'sub_total', 'Zwischensumme', '599.0000', 1),
(101, 34, 'shipping', 'Versandkostenfrei', '0.0000', 3),
(102, 34, 'total', 'Gesamtsumme', '599.0000', 9),
(103, 35, 'sub_total', 'Zwischensumme', '599.0000', 1),
(104, 35, 'shipping', 'Versandkostenfrei', '0.0000', 3),
(105, 35, 'total', 'Gesamtsumme', '599.0000', 9),
(106, 36, 'sub_total', 'Zwischensumme', '3732.0000', 1),
(107, 36, 'shipping', 'Versandkostenfrei', '0.0000', 3),
(108, 36, 'total', 'Gesamtsumme', '3732.0000', 9),
(109, 37, 'sub_total', 'Zwischensumme', '3732.0000', 1),
(110, 37, 'shipping', 'Versandkostenfrei', '0.0000', 3),
(111, 37, 'total', 'Gesamtsumme', '3732.0000', 9),
(112, 38, 'sub_total', 'Zwischensumme', '299.0000', 1),
(113, 38, 'shipping', 'Versandkostenfrei', '0.0000', 3),
(114, 38, 'total', 'Gesamtsumme', '299.0000', 9),
(115, 39, 'sub_total', 'Zwischensumme', '299.0000', 1),
(116, 39, 'shipping', 'Versandkostenfrei', '0.0000', 3),
(117, 39, 'total', 'Gesamtsumme', '299.0000', 9),
(118, 40, 'sub_total', 'Zwischensumme', '2189.0000', 1),
(119, 40, 'shipping', 'Versandkostenfrei', '0.0000', 3),
(120, 40, 'total', 'Gesamtsumme', '2189.0000', 9),
(121, 41, 'sub_total', 'Zwischensumme', '2189.0000', 1),
(122, 41, 'shipping', 'Versandkostenfrei', '0.0000', 3),
(123, 41, 'total', 'Gesamtsumme', '2189.0000', 9),
(124, 42, 'sub_total', 'Zwischensumme', '2189.0000', 1),
(125, 42, 'shipping', 'Versandkostenfrei', '0.0000', 3),
(126, 42, 'total', 'Gesamtsumme', '2189.0000', 9),
(127, 43, 'sub_total', 'Zwischensumme', '2189.0000', 1),
(128, 43, 'shipping', 'Versandkostenfrei', '0.0000', 3),
(129, 43, 'total', 'Gesamtsumme', '2189.0000', 9),
(130, 44, 'sub_total', 'Zwischensumme', '249.0000', 1),
(131, 44, 'shipping', 'Versandkostenfrei', '0.0000', 3),
(132, 44, 'total', 'Gesamtsumme', '249.0000', 9),
(133, 45, 'sub_total', 'Zwischensumme', '249.0000', 1),
(134, 45, 'shipping', 'Versandkostenfrei', '0.0000', 3),
(135, 45, 'total', 'Gesamtsumme', '249.0000', 9),
(136, 46, 'sub_total', 'Zwischensumme', '299.0000', 1),
(137, 46, 'shipping', 'Versandkostenfrei', '0.0000', 3),
(138, 46, 'total', 'Gesamtsumme', '299.0000', 9),
(139, 47, 'sub_total', 'Zwischensumme', '299.0000', 1),
(140, 47, 'shipping', 'Versandkostenfrei', '0.0000', 3),
(141, 47, 'total', 'Gesamtsumme', '299.0000', 9),
(142, 48, 'sub_total', 'Zwischensumme', '299.0000', 1),
(143, 48, 'shipping', 'Versandkostenfrei', '0.0000', 3),
(144, 48, 'total', 'Gesamtsumme', '299.0000', 9),
(145, 49, 'sub_total', 'Zwischensumme', '299.0000', 1),
(146, 49, 'shipping', 'Versandkostenfrei', '0.0000', 3),
(147, 49, 'total', 'Gesamtsumme', '299.0000', 9),
(148, 50, 'sub_total', 'Zwischensumme', '299.0000', 1),
(149, 50, 'shipping', 'Versandkostenfrei', '0.0000', 3),
(150, 50, 'total', 'Gesamtsumme', '299.0000', 9),
(151, 51, 'sub_total', 'Zwischensumme', '299.0000', 1),
(152, 51, 'shipping', 'Versandkostenfrei', '0.0000', 3),
(153, 51, 'total', 'Gesamtsumme', '299.0000', 9),
(154, 52, 'sub_total', 'Zwischensumme', '299.0000', 1),
(155, 52, 'shipping', 'Versandkostenfrei', '0.0000', 3),
(156, 52, 'total', 'Gesamtsumme', '299.0000', 9),
(157, 53, 'sub_total', 'Zwischensumme', '299.0000', 1),
(158, 53, 'shipping', 'Versandkostenfrei', '0.0000', 3),
(159, 53, 'total', 'Gesamtsumme', '299.0000', 9),
(160, 54, 'sub_total', 'Zwischensumme', '299.0000', 1),
(161, 54, 'shipping', 'Versandkostenfrei', '0.0000', 3),
(162, 54, 'total', 'Gesamtsumme', '299.0000', 9),
(163, 55, 'sub_total', 'Zwischensumme', '299.0000', 1),
(164, 55, 'shipping', 'Versandkostenfrei', '0.0000', 3),
(165, 55, 'total', 'Gesamtsumme', '299.0000', 9),
(166, 56, 'sub_total', 'Zwischensumme', '299.0000', 1),
(167, 56, 'shipping', 'Versandkostenfrei', '0.0000', 3),
(168, 56, 'total', 'Gesamtsumme', '299.0000', 9),
(169, 57, 'sub_total', 'Zwischensumme', '299.0000', 1),
(170, 57, 'shipping', 'Versandkostenfrei', '0.0000', 3),
(171, 57, 'total', 'Gesamtsumme', '299.0000', 9),
(172, 58, 'sub_total', 'Zwischensumme', '299.0000', 1),
(173, 58, 'shipping', 'Versandkostenfrei', '0.0000', 3),
(174, 58, 'total', 'Gesamtsumme', '299.0000', 9),
(175, 59, 'sub_total', 'Zwischensumme', '299.0000', 1),
(176, 59, 'shipping', 'Versandkostenfrei', '0.0000', 3),
(177, 59, 'total', 'Gesamtsumme', '299.0000', 9),
(178, 60, 'sub_total', 'Zwischensumme', '299.0000', 1),
(179, 60, 'shipping', 'Versandkostenfrei', '0.0000', 3),
(180, 60, 'total', 'Gesamtsumme', '299.0000', 9),
(181, 61, 'sub_total', 'Zwischensumme', '299.0000', 1),
(182, 61, 'shipping', 'Versandkostenfrei', '0.0000', 3),
(183, 61, 'total', 'Gesamtsumme', '299.0000', 9),
(184, 62, 'sub_total', 'Zwischensumme', '299.0000', 1),
(185, 62, 'shipping', 'Versandkostenfrei', '0.0000', 3),
(186, 62, 'total', 'Gesamtsumme', '299.0000', 9),
(187, 63, 'sub_total', 'Zwischensumme', '299.0000', 1),
(188, 63, 'shipping', 'Versandkostenfrei', '0.0000', 3),
(189, 63, 'total', 'Gesamtsumme', '299.0000', 9),
(190, 64, 'sub_total', 'Zwischensumme', '689.0000', 1),
(191, 64, 'shipping', 'Versandkostenfrei', '0.0000', 3),
(192, 64, 'total', 'Gesamtsumme', '689.0000', 9),
(193, 65, 'sub_total', 'Zwischensumme', '689.0000', 1),
(194, 65, 'shipping', 'Versandkostenfrei', '0.0000', 3),
(195, 65, 'total', 'Gesamtsumme', '689.0000', 9),
(196, 66, 'sub_total', 'Zwischensumme', '3732.0000', 1),
(197, 66, 'shipping', 'Switzerland  (Gewicht 0.00kg)', '29.9000', 3),
(198, 66, 'total', 'Gesamtsumme', '3761.9000', 9),
(199, 67, 'sub_total', 'Zwischensumme', '3732.0000', 1),
(200, 67, 'shipping', 'Switzerland  (Gewicht 0.00kg)', '29.9000', 3),
(201, 67, 'total', 'Gesamtsumme', '3761.9000', 9),
(202, 68, 'sub_total', 'Zwischensumme', '1499.0000', 1),
(203, 68, 'shipping', 'Ireland  (Gewicht 0.00kg)', '22.2200', 3),
(204, 68, 'total', 'Gesamtsumme', '1521.2200', 9),
(205, 69, 'sub_total', 'Zwischensumme', '1499.0000', 1),
(206, 69, 'shipping', 'Ireland  (Gewicht 0.00kg)', '22.2200', 3),
(207, 69, 'total', 'Gesamtsumme', '1521.2200', 9),
(208, 70, 'sub_total', 'Zwischensumme', '1499.0000', 1),
(209, 70, 'shipping', 'Ireland', '22.2200', 3),
(210, 70, 'total', 'Gesamtsumme', '1521.2200', 9),
(347, 116, 'shipping', 'Versand Deutschland', '0.0000', 3),
(346, 116, 'sub_total', 'Zwischensumme', '174.9500', 1),
(214, 72, 'sub_total', 'Zwischensumme', '2582.0000', 1),
(215, 72, 'shipping', 'Versand Schweiz', '29.9000', 3),
(216, 72, 'total', 'Gesamtsumme', '2611.9000', 9),
(217, 73, 'sub_total', 'Zwischensumme', '2582.0000', 1),
(218, 73, 'shipping', 'Versand Schweiz', '29.9000', 3),
(219, 73, 'total', 'Gesamtsumme', '2611.9000', 9),
(220, 74, 'sub_total', 'Zwischensumme', '2582.0000', 1),
(221, 74, 'shipping', 'Versand Schweiz', '29.9000', 3),
(222, 74, 'total', 'Gesamtsumme', '2611.9000', 9),
(223, 75, 'sub_total', 'Zwischensumme', '2582.0000', 1),
(224, 75, 'shipping', 'Versand Schweiz', '29.9000', 3),
(225, 75, 'total', 'Gesamtsumme', '2611.9000', 9),
(226, 76, 'sub_total', 'Zwischensumme', '1.0000', 1),
(227, 76, 'shipping', 'Versand Schweiz', '29.9000', 3),
(228, 76, 'total', 'Gesamtsumme', '30.9000', 9),
(229, 77, 'sub_total', 'Zwischensumme', '1.0000', 1),
(230, 77, 'shipping', 'Versand Schweiz', '29.9000', 3),
(231, 77, 'total', 'Gesamtsumme', '30.9000', 9),
(349, 117, 'sub_total', 'Zwischensumme', '174.9500', 1),
(348, 116, 'total', 'Gesamtsumme', '174.9500', 9),
(235, 79, 'sub_total', 'Zwischensumme', '499.0000', 1),
(236, 79, 'shipping', 'Versand Deutschland', '0.0000', 3),
(237, 79, 'total', 'Gesamtsumme', '499.0000', 9),
(238, 80, 'sub_total', 'Zwischensumme', '499.0000', 1),
(239, 80, 'shipping', 'Versand Deutschland', '0.0000', 3),
(240, 80, 'total', 'Gesamtsumme', '499.0000', 9),
(241, 81, 'sub_total', 'Zwischensumme', '499.0000', 1),
(242, 81, 'shipping', 'Versand Deutschland', '0.0000', 3),
(243, 81, 'total', 'Gesamtsumme', '499.0000', 9),
(244, 82, 'sub_total', 'Zwischensumme', '2999.0000', 1),
(245, 82, 'shipping', 'Versand Deutschland', '0.0000', 3),
(246, 82, 'total', 'Gesamtsumme', '2999.0000', 9),
(247, 83, 'sub_total', 'Zwischensumme', '2999.0000', 1),
(248, 83, 'shipping', 'Versand Deutschland', '0.0000', 3),
(249, 83, 'total', 'Gesamtsumme', '2999.0000', 9),
(533, 176, 'shipping', 'Versand Deutschland', '0.0000', 3),
(351, 117, 'total', 'Gesamtsumme', '174.9500', 9),
(350, 117, 'shipping', 'Versand Deutschland', '0.0000', 3),
(256, 86, 'sub_total', 'Zwischensumme', '469.0000', 1),
(257, 86, 'shipping', 'Versand Deutschland', '0.0000', 3),
(258, 86, 'total', 'Gesamtsumme', '469.0000', 9),
(259, 87, 'sub_total', 'Zwischensumme', '469.0000', 1),
(260, 87, 'shipping', 'Versand Deutschland', '0.0000', 3),
(261, 87, 'total', 'Gesamtsumme', '469.0000', 9),
(262, 88, 'sub_total', 'Zwischensumme', '1195.0000', 1),
(263, 88, 'shipping', 'Versand Deutschland', '0.0000', 3),
(264, 88, 'total', 'Gesamtsumme', '1195.0000', 9),
(265, 89, 'sub_total', 'Zwischensumme', '1195.0000', 1),
(266, 89, 'shipping', 'Versand Deutschland', '0.0000', 3),
(267, 89, 'total', 'Gesamtsumme', '1195.0000', 9),
(268, 90, 'sub_total', 'Zwischensumme', '4927.0000', 1),
(269, 90, 'shipping', 'Versand Deutschland', '0.0000', 3),
(270, 90, 'total', 'Gesamtsumme', '4927.0000', 9),
(271, 91, 'sub_total', 'Zwischensumme', '549.0000', 1),
(272, 91, 'shipping', 'Versand Deutschland', '0.0000', 3),
(273, 91, 'total', 'Gesamtsumme', '549.0000', 9),
(274, 92, 'sub_total', 'Zwischensumme', '549.0000', 1),
(275, 92, 'shipping', 'Versand Deutschland', '0.0000', 3),
(276, 92, 'total', 'Gesamtsumme', '549.0000', 9),
(277, 93, 'sub_total', 'Zwischensumme', '549.0000', 1),
(278, 93, 'shipping', 'Versand Deutschland', '0.0000', 3),
(279, 93, 'total', 'Gesamtsumme', '549.0000', 9),
(280, 94, 'sub_total', 'Zwischensumme', '549.0000', 1),
(281, 94, 'shipping', 'Versand Deutschland', '0.0000', 3),
(282, 94, 'total', 'Gesamtsumme', '549.0000', 9),
(283, 95, 'sub_total', 'Zwischensumme', '549.0000', 1),
(284, 95, 'shipping', 'Versand Deutschland', '0.0000', 3),
(285, 95, 'total', 'Gesamtsumme', '549.0000', 9),
(286, 96, 'sub_total', 'Zwischensumme', '1599.0000', 1),
(287, 96, 'shipping', 'Versand Deutschland', '0.0000', 3),
(288, 96, 'total', 'Gesamtsumme', '1599.0000', 9),
(289, 97, 'sub_total', 'Zwischensumme', '399.0000', 1),
(290, 97, 'shipping', 'Versand Deutschland', '0.0000', 3),
(291, 97, 'total', 'Gesamtsumme', '399.0000', 9),
(292, 98, 'sub_total', 'Zwischensumme', '399.0000', 1),
(293, 98, 'shipping', 'Versand Deutschland', '0.0000', 3),
(294, 98, 'total', 'Gesamtsumme', '399.0000', 9),
(295, 99, 'sub_total', 'Zwischensumme', '399.0000', 1),
(296, 99, 'shipping', 'Versand Deutschland', '0.0000', 3),
(297, 99, 'total', 'Gesamtsumme', '399.0000', 9),
(298, 100, 'sub_total', 'Zwischensumme', '399.0000', 1),
(299, 100, 'shipping', 'Versand Deutschland', '0.0000', 3),
(300, 100, 'total', 'Gesamtsumme', '399.0000', 9),
(301, 101, 'sub_total', 'Zwischensumme', '399.0000', 1),
(302, 101, 'shipping', 'Versand Deutschland', '0.0000', 3),
(303, 101, 'total', 'Gesamtsumme', '399.0000', 9),
(356, 119, 'shipping', 'Versand Deutschland', '0.0000', 3),
(355, 119, 'sub_total', 'Zwischensumme', '3732.0000', 1),
(532, 176, 'sub_total', 'Zwischensumme', '129.9500', 1),
(307, 103, 'sub_total', 'Zwischensumme', '2981.0000', 1),
(308, 103, 'shipping', 'Versand Deutschland', '0.0000', 3),
(309, 103, 'total', 'Gesamtsumme', '2981.0000', 9),
(310, 104, 'sub_total', 'Zwischensumme', '2582.0000', 1),
(311, 104, 'shipping', 'Versand Deutschland', '0.0000', 3),
(312, 104, 'total', 'Gesamtsumme', '2582.0000', 9),
(313, 105, 'sub_total', 'Zwischensumme', '3732.0000', 1),
(314, 105, 'shipping', 'Versand Deutschland', '0.0000', 3),
(315, 105, 'total', 'Gesamtsumme', '3732.0000', 9),
(316, 106, 'sub_total', 'Zwischensumme', '3732.0000', 1),
(317, 106, 'shipping', 'Versand Deutschland', '0.0000', 3),
(318, 106, 'total', 'Gesamtsumme', '3732.0000', 9),
(358, 120, 'sub_total', 'Zwischensumme', '3732.0000', 1),
(357, 119, 'total', 'Gesamtsumme', '3732.0000', 9),
(322, 108, 'sub_total', 'Zwischensumme', '1599.0000', 1),
(323, 108, 'shipping', 'Versand Zone 1', '11.5000', 3),
(324, 108, 'total', 'Gesamtsumme', '1610.5000', 9),
(325, 109, 'sub_total', 'Zwischensumme', '1599.0000', 1),
(326, 109, 'shipping', 'Versand Zone 1', '11.5000', 3),
(327, 109, 'total', 'Gesamtsumme', '1610.5000', 9),
(328, 110, 'sub_total', 'Zwischensumme', '1599.0000', 1),
(329, 110, 'shipping', 'Versand Zone 1', '11.5000', 3),
(330, 110, 'total', 'Gesamtsumme', '1610.5000', 9),
(331, 111, 'sub_total', 'Zwischensumme', '1599.0000', 1),
(332, 111, 'shipping', 'Versand Zone 1', '11.5000', 3),
(333, 111, 'total', 'Gesamtsumme', '1610.5000', 9),
(334, 112, 'sub_total', 'Zwischensumme', '1599.0000', 1),
(335, 112, 'shipping', 'Versand Zone 1', '11.5000', 3),
(336, 112, 'total', 'Gesamtsumme', '1610.5000', 9),
(337, 113, 'sub_total', 'Zwischensumme', '1599.0000', 1),
(338, 113, 'shipping', 'Versand Zone 1', '11.5000', 3),
(339, 113, 'total', 'Gesamtsumme', '1610.5000', 9),
(340, 114, 'sub_total', 'Zwischensumme', '1599.0000', 1),
(341, 114, 'shipping', 'Versand Zone 1', '11.5000', 3),
(342, 114, 'total', 'Gesamtsumme', '1610.5000', 9),
(343, 115, 'sub_total', 'Zwischensumme', '1599.0000', 1),
(344, 115, 'shipping', 'Versand Zone 1', '11.5000', 3),
(345, 115, 'total', 'Gesamtsumme', '1610.5000', 9),
(359, 120, 'shipping', 'Versand Deutschland', '0.0000', 3),
(360, 120, 'total', 'Gesamtsumme', '3732.0000', 9),
(361, 121, 'sub_total', 'Zwischensumme', '3732.0000', 1),
(362, 121, 'shipping', 'Versand Deutschland', '0.0000', 3),
(363, 121, 'total', 'Gesamtsumme', '3732.0000', 9),
(534, 176, 'total', 'Gesamtsumme', '129.9500', 9),
(367, 123, 'sub_total', 'Zwischensumme', '1499.0000', 1),
(368, 123, 'shipping', 'Versand Deutschland', '0.0000', 3),
(369, 123, 'total', 'Gesamtsumme', '1499.0000', 9),
(370, 124, 'sub_total', 'Zwischensumme', '269.0000', 1),
(371, 124, 'shipping', 'Versand Deutschland', '0.0000', 3),
(372, 124, 'total', 'Gesamtsumme', '269.0000', 9),
(373, 125, 'sub_total', 'Zwischensumme', '99.9500', 1),
(374, 125, 'shipping', 'Versand Deutschland', '0.0000', 3),
(375, 125, 'total', 'Gesamtsumme', '99.9500', 9),
(376, 126, 'sub_total', 'Zwischensumme', '99.9500', 1),
(377, 126, 'shipping', 'Versand Deutschland', '0.0000', 3),
(378, 126, 'total', 'Gesamtsumme', '99.9500', 9),
(379, 127, 'sub_total', 'Zwischensumme', '449.0000', 1),
(380, 127, 'shipping', 'Versand Deutschland', '0.0000', 3),
(381, 127, 'total', 'Gesamtsumme', '449.0000', 9),
(382, 128, 'sub_total', 'Zwischensumme', '89.9000', 1),
(383, 128, 'shipping', 'Versand Deutschland', '0.0000', 3),
(384, 128, 'total', 'Gesamtsumme', '89.9000', 9),
(538, 178, 'sub_total', 'Zwischensumme', '1250.0000', 1),
(540, 178, 'total', 'Gesamtsumme', '1250.0000', 9),
(539, 178, 'shipping', 'Versand Deutschland', '0.0000', 3),
(397, 132, 'sub_total', 'Zwischensumme', '299.0000', 1),
(398, 132, 'shipping', 'Versand Deutschland', '0.0000', 3),
(399, 132, 'total', 'Gesamtsumme', '299.0000', 9),
(400, 133, 'sub_total', 'Zwischensumme', '299.0000', 1),
(401, 133, 'shipping', 'Versand Deutschland', '0.0000', 3),
(402, 133, 'total', 'Gesamtsumme', '299.0000', 9),
(403, 134, 'sub_total', 'Zwischensumme', '299.0000', 1),
(404, 134, 'shipping', 'Versand Deutschland', '0.0000', 3),
(405, 134, 'total', 'Gesamtsumme', '299.0000', 9),
(406, 135, 'sub_total', 'Zwischensumme', '299.0000', 1),
(407, 135, 'shipping', 'Versand Deutschland', '0.0000', 3),
(408, 135, 'total', 'Gesamtsumme', '299.0000', 9),
(409, 136, 'sub_total', 'Zwischensumme', '299.0000', 1),
(410, 136, 'shipping', 'Versand Deutschland', '0.0000', 3),
(411, 136, 'total', 'Gesamtsumme', '299.0000', 9),
(412, 137, 'sub_total', 'Zwischensumme', '5.0000', 1),
(413, 137, 'shipping', 'Versand Deutschland', '0.0000', 3),
(414, 137, 'total', 'Gesamtsumme', '5.0000', 9),
(415, 138, 'sub_total', 'Zwischensumme', '5.0000', 1),
(416, 138, 'shipping', 'Versand Deutschland', '0.0000', 3),
(417, 138, 'total', 'Gesamtsumme', '5.0000', 9),
(418, 139, 'sub_total', 'Zwischensumme', '5.0000', 1),
(419, 139, 'shipping', 'Versand Deutschland', '0.0000', 3),
(420, 139, 'total', 'Gesamtsumme', '5.0000', 9),
(421, 140, 'sub_total', 'Zwischensumme', '5.0000', 1),
(422, 140, 'shipping', 'Versand Deutschland', '0.0000', 3),
(423, 140, 'total', 'Gesamtsumme', '5.0000', 9),
(424, 141, 'sub_total', 'Zwischensumme', '5.0000', 1),
(425, 141, 'shipping', 'Versand Deutschland', '0.0000', 3),
(426, 141, 'total', 'Gesamtsumme', '5.0000', 9),
(427, 142, 'sub_total', 'Zwischensumme', '5.0000', 1),
(428, 142, 'shipping', 'Versand Deutschland', '0.0000', 3),
(429, 142, 'total', 'Gesamtsumme', '5.0000', 9),
(430, 143, 'sub_total', 'Zwischensumme', '5.0000', 1),
(431, 143, 'shipping', 'Versand Deutschland', '0.0000', 3),
(432, 143, 'total', 'Gesamtsumme', '5.0000', 9),
(433, 144, 'sub_total', 'Zwischensumme', '5.0000', 1),
(434, 144, 'shipping', 'Versand Deutschland', '0.0000', 3),
(435, 144, 'total', 'Gesamtsumme', '5.0000', 9),
(445, 147, 'sub_total', 'Zwischensumme', '5.0000', 1),
(446, 147, 'shipping', 'Versand Deutschland', '0.0000', 3),
(447, 147, 'total', 'Gesamtsumme', '5.0000', 9),
(448, 148, 'sub_total', 'Zwischensumme', '3.5000', 1),
(449, 148, 'shipping', 'Versand Deutschland', '0.0000', 3),
(450, 148, 'total', 'Gesamtsumme', '3.5000', 9),
(451, 149, 'sub_total', 'Zwischensumme', '3.5000', 1),
(452, 149, 'shipping', 'Versand Deutschland', '0.0000', 3),
(453, 149, 'total', 'Gesamtsumme', '3.5000', 9),
(457, 151, 'sub_total', 'Zwischensumme', '3732.0000', 1),
(458, 151, 'shipping', 'Versand Deutschland', '0.0000', 3),
(459, 151, 'total', 'Gesamtsumme', '3732.0000', 9),
(460, 152, 'sub_total', 'Zwischensumme', '3732.0000', 1),
(461, 152, 'shipping', 'Versand Deutschland', '0.0000', 3),
(462, 152, 'total', 'Gesamtsumme', '3732.0000', 9),
(463, 153, 'sub_total', 'Zwischensumme', '3.5000', 1),
(464, 153, 'shipping', 'Versand Deutschland', '0.0000', 3),
(465, 153, 'total', 'Gesamtsumme', '3.5000', 9),
(466, 154, 'sub_total', 'Zwischensumme', '3.5000', 1),
(467, 154, 'shipping', 'Versand Deutschland', '0.0000', 3),
(468, 154, 'total', 'Gesamtsumme', '3.5000', 9),
(469, 155, 'sub_total', 'Zwischensumme', '289.0000', 1),
(470, 155, 'shipping', 'Versand Deutschland', '0.0000', 3),
(471, 155, 'total', 'Gesamtsumme', '289.0000', 9),
(472, 156, 'sub_total', 'Sub-Total', '99.0000', 1),
(473, 156, 'shipping', 'Versand Deutschland', '0.0000', 3),
(474, 156, 'total', 'Total', '99.0000', 9),
(475, 157, 'sub_total', 'Sub-Total', '99.0000', 1),
(476, 157, 'shipping', 'Versand Deutschland', '0.0000', 3),
(477, 157, 'total', 'Total', '99.0000', 9),
(478, 158, 'sub_total', 'Sub-Total', '99.0000', 1),
(479, 158, 'shipping', 'Versand Deutschland', '0.0000', 3),
(480, 158, 'total', 'Total', '99.0000', 9),
(481, 159, 'sub_total', 'Sub-Total', '99.0000', 1),
(482, 159, 'shipping', 'Versand Deutschland', '0.0000', 3),
(483, 159, 'total', 'Total', '99.0000', 9),
(487, 161, 'sub_total', 'Zwischensumme', '289.0000', 1),
(488, 161, 'shipping', 'Versand Deutschland', '0.0000', 3),
(489, 161, 'total', 'Gesamtsumme', '289.0000', 9),
(490, 162, 'sub_total', 'Sub-Total', '1199.0000', 1),
(491, 162, 'shipping', 'Versand Deutschland', '0.0000', 3),
(492, 162, 'total', 'Total', '1199.0000', 9),
(493, 163, 'sub_total', 'Sub-Total', '1199.0000', 1),
(494, 163, 'shipping', 'Versand Deutschland', '0.0000', 3),
(495, 163, 'total', 'Total', '1199.0000', 9),
(496, 164, 'sub_total', 'Sub-Total', '1199.0000', 1),
(497, 164, 'shipping', 'Versand Deutschland', '0.0000', 3),
(498, 164, 'total', 'Total', '1199.0000', 9),
(499, 165, 'sub_total', 'Sub-Total', '1199.0000', 1),
(500, 165, 'shipping', 'Versand Deutschland', '0.0000', 3),
(501, 165, 'total', 'Total', '1199.0000', 9),
(502, 166, 'sub_total', 'Zwischensumme', '169.0000', 1),
(503, 166, 'shipping', 'Versand Deutschland', '0.0000', 3),
(504, 166, 'total', 'Gesamtsumme', '169.0000', 9),
(505, 167, 'sub_total', 'Zwischensumme', '3.5000', 1),
(506, 167, 'shipping', 'Versand Deutschland', '0.0000', 3),
(507, 167, 'total', 'Gesamtsumme', '3.5000', 9),
(508, 168, 'sub_total', 'Zwischensumme', '3.5000', 1),
(509, 168, 'shipping', 'Versand Deutschland', '0.0000', 3),
(510, 168, 'total', 'Gesamtsumme', '3.5000', 9),
(511, 169, 'sub_total', 'Zwischensumme', '3.5000', 1),
(512, 169, 'shipping', 'Versand Deutschland', '0.0000', 3),
(513, 169, 'total', 'Gesamtsumme', '3.5000', 9),
(517, 171, 'sub_total', 'Zwischensumme', '3.5000', 1),
(518, 171, 'shipping', 'Versand Deutschland', '0.0000', 3),
(519, 171, 'total', 'Gesamtsumme', '3.5000', 9),
(523, 173, 'sub_total', 'Zwischensumme', '69.9500', 1),
(524, 173, 'shipping', 'Versand Deutschland', '0.0000', 3),
(525, 173, 'total', 'Gesamtsumme', '69.9500', 9),
(526, 174, 'sub_total', 'Zwischensumme', '119.0000', 1),
(527, 174, 'shipping', 'Versand Deutschland', '0.0000', 3),
(528, 174, 'total', 'Gesamtsumme', '119.0000', 9),
(571, 184, 'sub_total', 'Zwischensumme', '1149.0000', 1),
(572, 184, 'shipping', 'Versand Deutschland', '0.0000', 3),
(573, 184, 'total', 'Gesamtsumme', '1149.0000', 9),
(574, 185, 'sub_total', 'Zwischensumme', '1149.0000', 1),
(575, 185, 'shipping', 'Versand Deutschland', '0.0000', 3),
(576, 185, 'total', 'Gesamtsumme', '1149.0000', 9),
(592, 190, 'sub_total', 'Zwischensumme', '2999.0000', 1),
(593, 190, 'shipping', 'Versand Zone 6', '28.5000', 3),
(594, 190, 'total', 'Gesamtsumme', '3027.5000', 9),
(595, 191, 'sub_total', 'Zwischensumme', '202.0000', 1),
(596, 191, 'shipping', 'Versand Deutschland', '0.0000', 3),
(597, 191, 'total', 'Gesamtsumme', '202.0000', 9),
(598, 192, 'sub_total', 'Zwischensumme', '202.0000', 1),
(599, 192, 'shipping', 'Versand Deutschland', '0.0000', 3),
(600, 192, 'total', 'Gesamtsumme', '202.0000', 9),
(601, 193, 'sub_total', 'Zwischensumme', '202.0000', 1),
(602, 193, 'shipping', 'Versand Deutschland', '0.0000', 3),
(603, 193, 'total', 'Gesamtsumme', '202.0000', 9),
(607, 195, 'sub_total', 'Zwischensumme', '369.0000', 1),
(608, 195, 'shipping', 'Versand Deutschland', '0.0000', 3),
(609, 195, 'total', 'Gesamtsumme', '369.0000', 9),
(610, 196, 'sub_total', 'Zwischensumme', '369.0000', 1),
(611, 196, 'shipping', 'Versand Deutschland', '0.0000', 3),
(612, 196, 'total', 'Gesamtsumme', '369.0000', 9),
(613, 197, 'sub_total', 'Zwischensumme', '369.0000', 1),
(614, 197, 'shipping', 'Versand Deutschland', '0.0000', 3),
(615, 197, 'total', 'Gesamtsumme', '369.0000', 9),
(619, 199, 'sub_total', 'Zwischensumme', '738.0000', 1),
(620, 199, 'shipping', 'Versand Deutschland', '0.0000', 3),
(621, 199, 'total', 'Gesamtsumme', '738.0000', 9),
(631, 202, 'sub_total', 'Sub-Total', '549.0000', 1),
(632, 202, 'shipping', 'Versand Zone 5', '26.5000', 3),
(633, 202, 'total', 'Total', '575.5000', 9),
(664, 213, 'sub_total', 'Zwischensumme', '1299.0000', 1),
(665, 213, 'shipping', 'Versand Deutschland', '0.0000', 3),
(666, 213, 'total', 'Gesamtsumme', '1299.0000', 9),
(667, 214, 'sub_total', 'Zwischensumme', '1299.0000', 1),
(668, 214, 'shipping', 'Versand Deutschland', '0.0000', 3),
(669, 214, 'total', 'Gesamtsumme', '1299.0000', 9),
(670, 215, 'sub_total', 'Zwischensumme', '1299.0000', 1),
(671, 215, 'shipping', 'Versand Deutschland', '0.0000', 3),
(672, 215, 'total', 'Gesamtsumme', '1299.0000', 9),
(673, 216, 'sub_total', 'Zwischensumme', '1299.0000', 1),
(674, 216, 'shipping', 'Versand Deutschland', '0.0000', 3),
(675, 216, 'total', 'Gesamtsumme', '1299.0000', 9),
(682, 219, 'sub_total', 'Zwischensumme', '202.0000', 1),
(683, 219, 'shipping', 'Versand Deutschland', '0.0000', 3),
(684, 219, 'total', 'Gesamtsumme', '202.0000', 9),
(685, 220, 'sub_total', 'Zwischensumme', '202.0000', 1),
(686, 220, 'shipping', 'Versand Deutschland', '0.0000', 3),
(687, 220, 'total', 'Gesamtsumme', '202.0000', 9),
(688, 221, 'sub_total', 'Zwischensumme', '202.0000', 1),
(689, 221, 'shipping', 'Versand Deutschland', '0.0000', 3),
(690, 221, 'total', 'Gesamtsumme', '202.0000', 9),
(691, 222, 'sub_total', 'Zwischensumme', '202.0000', 1),
(692, 222, 'shipping', 'Versand Deutschland', '0.0000', 3),
(693, 222, 'total', 'Gesamtsumme', '202.0000', 9),
(694, 223, 'sub_total', 'Zwischensumme', '202.0000', 1),
(695, 223, 'shipping', 'Versand Deutschland', '0.0000', 3),
(696, 223, 'total', 'Gesamtsumme', '202.0000', 9),
(697, 224, 'sub_total', 'Zwischensumme', '202.0000', 1),
(698, 224, 'shipping', 'Versand Deutschland', '0.0000', 3),
(699, 224, 'total', 'Gesamtsumme', '202.0000', 9),
(700, 225, 'sub_total', 'Zwischensumme', '3.5000', 1),
(701, 225, 'shipping', 'Versand Deutschland', '0.0000', 3),
(702, 225, 'total', 'Gesamtsumme', '3.5000', 9),
(706, 227, 'sub_total', 'Zwischensumme', '3.5000', 1),
(707, 227, 'shipping', 'Versand Deutschland', '0.0000', 3),
(708, 227, 'total', 'Gesamtsumme', '3.5000', 9),
(709, 228, 'sub_total', 'Zwischensumme', '202.0000', 1),
(710, 228, 'shipping', 'Versand Deutschland', '0.0000', 3),
(711, 228, 'total', 'Gesamtsumme', '202.0000', 9),
(712, 229, 'sub_total', 'Zwischensumme', '202.0000', 1),
(713, 229, 'shipping', 'Versand Deutschland', '0.0000', 3),
(714, 229, 'total', 'Gesamtsumme', '202.0000', 9),
(715, 230, 'sub_total', 'Zwischensumme', '202.0000', 1),
(716, 230, 'shipping', 'Versand Deutschland', '0.0000', 3),
(717, 230, 'total', 'Gesamtsumme', '202.0000', 9),
(718, 231, 'sub_total', 'Zwischensumme', '202.0000', 1),
(719, 231, 'shipping', 'Versand Deutschland', '0.0000', 3),
(720, 231, 'total', 'Gesamtsumme', '202.0000', 9),
(724, 233, 'sub_total', 'Zwischensumme', '229.0000', 1),
(725, 233, 'shipping', 'Versand Deutschland', '0.0000', 3),
(726, 233, 'total', 'Gesamtsumme', '229.0000', 9),
(727, 234, 'sub_total', 'Zwischensumme', '229.0000', 1),
(728, 234, 'shipping', 'Versand Deutschland', '0.0000', 3),
(729, 234, 'total', 'Gesamtsumme', '229.0000', 9),
(730, 235, 'sub_total', 'Zwischensumme', '229.0000', 1),
(731, 235, 'shipping', 'Versand Deutschland', '0.0000', 3),
(732, 235, 'total', 'Gesamtsumme', '229.0000', 9),
(736, 237, 'sub_total', 'Zwischensumme', '223.0000', 1),
(737, 237, 'shipping', 'Versand Deutschland', '0.0000', 3),
(738, 237, 'total', 'Gesamtsumme', '223.0000', 9),
(742, 239, 'sub_total', 'Zwischensumme', '223.0000', 1),
(743, 239, 'shipping', 'Versand Zone 3', '19.5000', 3),
(744, 239, 'total', 'Gesamtsumme', '242.5000', 9),
(745, 240, 'sub_total', 'Zwischensumme', '223.0000', 1),
(746, 240, 'shipping', 'Versand Zone 3', '19.5000', 3),
(747, 240, 'total', 'Gesamtsumme', '242.5000', 9),
(748, 241, 'sub_total', 'Zwischensumme', '223.0000', 1),
(749, 241, 'shipping', 'Versand Zone 3', '19.5000', 3),
(750, 241, 'total', 'Gesamtsumme', '242.5000', 9),
(766, 247, 'sub_total', 'Zwischensumme', '349.0000', 1),
(767, 247, 'shipping', 'Versand Deutschland', '0.0000', 3),
(768, 247, 'total', 'Gesamtsumme', '349.0000', 9),
(775, 249, 'sub_total', 'Zwischensumme', '369.0000', 1),
(776, 249, 'shipping', 'Versand Deutschland', '0.0000', 3),
(777, 249, 'total', 'Gesamtsumme', '369.0000', 9),
(778, 250, 'sub_total', 'Zwischensumme', '369.0000', 1),
(779, 250, 'shipping', 'Versand Deutschland', '0.0000', 3),
(780, 250, 'total', 'Gesamtsumme', '369.0000', 9),
(820, 258, 'sub_total', 'Zwischensumme', '249.0000', 1),
(821, 258, 'shipping', 'Versand Zone 6', '28.5000', 3),
(822, 258, 'total', 'Gesamtsumme', '277.5000', 9),
(835, 263, 'sub_total', 'Zwischensumme', '2399.0000', 1),
(836, 263, 'shipping', 'Versand Deutschland', '0.0000', 3),
(837, 263, 'total', 'Gesamtsumme', '2399.0000', 9),
(838, 264, 'sub_total', 'Sub-Total', '209.0000', 1),
(839, 264, 'shipping', 'Versand Deutschland', '0.0000', 3),
(840, 264, 'total', 'Total', '209.0000', 9),
(841, 265, 'sub_total', 'Sub-Total', '209.0000', 1),
(842, 265, 'shipping', 'Versand Deutschland', '0.0000', 3),
(843, 265, 'total', 'Total', '209.0000', 9),
(859, 271, 'sub_total', 'Zwischensumme', '339.0000', 1),
(860, 271, 'shipping', 'Versand Zone 1', '11.5000', 3),
(861, 271, 'total', 'Gesamtsumme', '350.5000', 9),
(874, 276, 'sub_total', 'Zwischensumme', '149.0000', 1),
(875, 276, 'shipping', 'Versand Deutschland', '0.0000', 3),
(876, 276, 'total', 'Gesamtsumme', '149.0000', 9),
(880, 278, 'sub_total', 'Zwischensumme', '796.0000', 1),
(881, 278, 'shipping', 'Versand Deutschland', '0.0000', 3),
(882, 278, 'total', 'Gesamtsumme', '796.0000', 9),
(883, 279, 'sub_total', 'Zwischensumme', '796.0000', 1),
(884, 279, 'shipping', 'Versand Deutschland', '0.0000', 3),
(885, 279, 'total', 'Gesamtsumme', '796.0000', 9),
(907, 287, 'sub_total', 'Zwischensumme', '329.0000', 1),
(908, 287, 'shipping', 'Versand Zone 3', '19.5000', 3),
(909, 287, 'total', 'Gesamtsumme', '348.5000', 9),
(922, 291, 'sub_total', 'Zwischensumme', '159.0000', 1),
(923, 291, 'shipping', 'Versand Deutschland', '0.0000', 3),
(924, 291, 'total', 'Gesamtsumme', '159.0000', 9),
(937, 295, 'sub_total', 'Zwischensumme', '179.9500', 1),
(938, 295, 'shipping', 'Versand Deutschland', '0.0000', 3),
(939, 295, 'total', 'Gesamtsumme', '179.9500', 9),
(943, 297, 'sub_total', 'Zwischensumme', '1699.0000', 1),
(944, 297, 'shipping', 'Versand Deutschland', '0.0000', 3),
(945, 297, 'total', 'Gesamtsumme', '1699.0000', 9),
(949, 299, 'sub_total', 'Zwischensumme', '1149.0000', 1),
(950, 299, 'shipping', 'Versand Deutschland', '0.0000', 3),
(951, 299, 'total', 'Gesamtsumme', '1149.0000', 9),
(961, 302, 'sub_total', 'Zwischensumme', '109.0000', 1),
(962, 302, 'shipping', 'Versand Deutschland', '0.0000', 3),
(963, 302, 'total', 'Gesamtsumme', '109.0000', 9),
(967, 304, 'sub_total', 'Zwischensumme', '119.0000', 1),
(968, 304, 'shipping', 'Versand Zone 6', '28.5000', 3),
(969, 304, 'total', 'Gesamtsumme', '147.5000', 9),
(970, 305, 'sub_total', 'Sub-Total', '49.5000', 1),
(971, 305, 'shipping', 'Versand Deutschland', '0.0000', 3),
(972, 305, 'total', 'Total', '49.5000', 9),
(976, 307, 'sub_total', 'Zwischensumme', '149.0000', 1),
(977, 307, 'shipping', 'Versand Deutschland', '0.0000', 3),
(978, 307, 'total', 'Gesamtsumme', '149.0000', 9),
(979, 308, 'sub_total', 'Zwischensumme', '149.0000', 1),
(980, 308, 'shipping', 'Versand Deutschland', '0.0000', 3),
(981, 308, 'total', 'Gesamtsumme', '149.0000', 9),
(988, 311, 'sub_total', 'Zwischensumme', '259.9500', 1),
(989, 311, 'shipping', 'Versand Zone 2', '18.0000', 3),
(990, 311, 'total', 'Gesamtsumme', '277.9500', 9),
(994, 313, 'sub_total', 'Zwischensumme', '169.0000', 1),
(995, 313, 'shipping', 'Versand Deutschland', '0.0000', 3),
(996, 313, 'total', 'Gesamtsumme', '169.0000', 9),
(997, 314, 'sub_total', 'Zwischensumme', '169.0000', 1),
(998, 314, 'shipping', 'Versand Deutschland', '0.0000', 3),
(999, 314, 'total', 'Gesamtsumme', '169.0000', 9),
(1006, 317, 'sub_total', 'Zwischensumme', '89.0000', 1),
(1007, 317, 'shipping', 'Versand Deutschland', '0.0000', 3),
(1008, 317, 'total', 'Gesamtsumme', '89.0000', 9),
(1009, 318, 'sub_total', 'Zwischensumme', '89.0000', 1),
(1010, 318, 'shipping', 'Versand Deutschland', '0.0000', 3),
(1011, 318, 'total', 'Gesamtsumme', '89.0000', 9),
(1012, 319, 'sub_total', 'Zwischensumme', '89.0000', 1),
(1013, 319, 'shipping', 'Versand Deutschland', '0.0000', 3),
(1014, 319, 'total', 'Gesamtsumme', '89.0000', 9),
(1015, 320, 'sub_total', 'Zwischensumme', '89.0000', 1),
(1016, 320, 'shipping', 'Versand Deutschland', '0.0000', 3),
(1017, 320, 'total', 'Gesamtsumme', '89.0000', 9),
(1018, 321, 'sub_total', 'Zwischensumme', '89.0000', 1),
(1019, 321, 'shipping', 'Versand Deutschland', '0.0000', 3),
(1020, 321, 'total', 'Gesamtsumme', '89.0000', 9),
(1021, 322, 'sub_total', 'Zwischensumme', '89.0000', 1),
(1022, 322, 'shipping', 'Versand Deutschland', '0.0000', 3),
(1023, 322, 'total', 'Gesamtsumme', '89.0000', 9),
(1024, 323, 'sub_total', 'Zwischensumme', '89.0000', 1),
(1025, 323, 'shipping', 'Versand Deutschland', '0.0000', 3),
(1026, 323, 'total', 'Gesamtsumme', '89.0000', 9),
(1027, 324, 'sub_total', 'Zwischensumme', '89.0000', 1),
(1028, 324, 'shipping', 'Versand Deutschland', '0.0000', 3),
(1029, 324, 'total', 'Gesamtsumme', '89.0000', 9),
(1030, 325, 'sub_total', 'Zwischensumme', '89.0000', 1),
(1031, 325, 'shipping', 'Versand Deutschland', '0.0000', 3),
(1032, 325, 'total', 'Gesamtsumme', '89.0000', 9),
(1045, 330, 'sub_total', 'Zwischensumme', '85.0000', 1),
(1046, 330, 'shipping', 'Versand Zone 3', '19.5000', 3),
(1047, 330, 'total', 'Gesamtsumme', '104.5000', 9),
(1051, 332, 'sub_total', 'Zwischensumme', '399.0000', 1),
(1052, 332, 'shipping', 'Versand Deutschland', '0.0000', 3),
(1053, 332, 'total', 'Gesamtsumme', '399.0000', 9),
(1054, 333, 'sub_total', 'Zwischensumme', '399.0000', 1),
(1055, 333, 'shipping', 'Versand Deutschland', '0.0000', 3),
(1056, 333, 'total', 'Gesamtsumme', '399.0000', 9),
(1057, 334, 'sub_total', 'Sub-Total', '599.0000', 1),
(1058, 334, 'shipping', 'Versand Deutschland', '0.0000', 3),
(1059, 334, 'total', 'Total', '599.0000', 9),
(1063, 336, 'sub_total', 'Zwischensumme', '499.0000', 1),
(1064, 336, 'shipping', 'Versand Deutschland', '0.0000', 3),
(1065, 336, 'total', 'Gesamtsumme', '499.0000', 9),
(1066, 337, 'sub_total', 'Zwischensumme', '499.0000', 1),
(1067, 337, 'shipping', 'Versand Deutschland', '0.0000', 3),
(1068, 337, 'total', 'Gesamtsumme', '499.0000', 9),
(1069, 338, 'sub_total', 'Zwischensumme', '499.0000', 1),
(1070, 338, 'shipping', 'Versand Deutschland', '0.0000', 3),
(1071, 338, 'total', 'Gesamtsumme', '499.0000', 9),
(1072, 339, 'sub_total', 'Zwischensumme', '499.0000', 1),
(1073, 339, 'shipping', 'Versand Deutschland', '0.0000', 3),
(1074, 339, 'total', 'Gesamtsumme', '499.0000', 9),
(1075, 340, 'sub_total', 'Zwischensumme', '499.0000', 1),
(1076, 340, 'shipping', 'Versand Deutschland', '0.0000', 3),
(1077, 340, 'total', 'Gesamtsumme', '499.0000', 9),
(1090, 345, 'sub_total', 'Zwischensumme', '499.0000', 1),
(1091, 345, 'shipping', 'Versand Zone 6', '28.5000', 3),
(1092, 345, 'total', 'Gesamtsumme', '527.5000', 9),
(1111, 352, 'sub_total', 'Zwischensumme', '149.9500', 1),
(1112, 352, 'shipping', 'Versand Deutschland', '0.0000', 3),
(1113, 352, 'total', 'Gesamtsumme', '149.9500', 9),
(1123, 356, 'sub_total', 'Zwischensumme', '499.0000', 1),
(1124, 356, 'shipping', 'Versand Zone 3', '19.5000', 3),
(1125, 356, 'total', 'Gesamtsumme', '518.5000', 9),
(1129, 358, 'sub_total', 'Zwischensumme', '199.0000', 1),
(1130, 358, 'shipping', 'Versand Deutschland', '0.0000', 3),
(1131, 358, 'total', 'Gesamtsumme', '199.0000', 9),
(1135, 360, 'sub_total', 'Zwischensumme', '179.9500', 1),
(1136, 360, 'shipping', 'Versand Deutschland', '0.0000', 3),
(1137, 360, 'total', 'Gesamtsumme', '179.9500', 9),
(1138, 361, 'sub_total', 'Zwischensumme', '179.9500', 1),
(1139, 361, 'shipping', 'Versand Deutschland', '0.0000', 3),
(1140, 361, 'total', 'Gesamtsumme', '179.9500', 9),
(1141, 362, 'sub_total', 'Zwischensumme', '132.5000', 1),
(1142, 362, 'shipping', 'Versand Deutschland', '0.0000', 3),
(1143, 362, 'total', 'Gesamtsumme', '132.5000', 9),
(1144, 363, 'sub_total', 'Zwischensumme', '132.5000', 1),
(1145, 363, 'shipping', 'Versand Deutschland', '0.0000', 3),
(1146, 363, 'total', 'Gesamtsumme', '132.5000', 9),
(1147, 364, 'sub_total', 'Zwischensumme', '49.5000', 1),
(1148, 364, 'shipping', 'Versand Deutschland', '0.0000', 3),
(1149, 364, 'total', 'Gesamtsumme', '49.5000', 9),
(1150, 365, 'sub_total', 'Zwischensumme', '49.5000', 1),
(1151, 365, 'shipping', 'Versand Deutschland', '0.0000', 3),
(1152, 365, 'total', 'Gesamtsumme', '49.5000', 9),
(1171, 372, 'sub_total', 'Zwischensumme', '249.0000', 1),
(1172, 372, 'shipping', 'Versand Deutschland', '0.0000', 3),
(1173, 372, 'total', 'Gesamtsumme', '249.0000', 9),
(1174, 373, 'sub_total', 'Zwischensumme', '249.0000', 1),
(1175, 373, 'shipping', 'Versand Deutschland', '0.0000', 3),
(1176, 373, 'total', 'Gesamtsumme', '249.0000', 9),
(1180, 375, 'sub_total', 'Sub-Total', '469.0000', 1),
(1181, 375, 'shipping', 'Versand Zone 5', '26.5000', 3),
(1182, 375, 'total', 'Total', '495.5000', 9),
(1186, 377, 'sub_total', 'Zwischensumme', '690.0000', 1),
(1187, 377, 'shipping', 'Versand Deutschland', '0.0000', 3),
(1188, 377, 'total', 'Gesamtsumme', '690.0000', 9),
(1198, 381, 'sub_total', 'Zwischensumme', '599.0000', 1),
(1199, 381, 'shipping', 'Versand Deutschland', '0.0000', 3),
(1200, 381, 'total', 'Gesamtsumme', '599.0000', 9),
(1210, 385, 'sub_total', 'Zwischensumme', '219.0000', 1),
(1211, 385, 'shipping', 'Versand Deutschland', '0.0000', 3),
(1212, 385, 'total', 'Gesamtsumme', '219.0000', 9),
(1213, 386, 'sub_total', 'Zwischensumme', '219.0000', 1),
(1214, 386, 'shipping', 'Versand Deutschland', '0.0000', 3),
(1215, 386, 'total', 'Gesamtsumme', '219.0000', 9),
(1222, 389, 'sub_total', 'Zwischensumme', '1299.0000', 1),
(1223, 389, 'shipping', 'Versand Zone 4', '23.5000', 3),
(1224, 389, 'total', 'Gesamtsumme', '1322.5000', 9),
(1225, 390, 'sub_total', 'Zwischensumme', '1299.0000', 1),
(1226, 390, 'shipping', 'Versand Zone 4', '23.5000', 3),
(1227, 390, 'total', 'Gesamtsumme', '1322.5000', 9),
(1228, 391, 'sub_total', 'Zwischensumme', '1299.0000', 1),
(1229, 391, 'shipping', 'Versand Zone 4', '23.5000', 3),
(1230, 391, 'total', 'Gesamtsumme', '1322.5000', 9),
(1231, 392, 'sub_total', 'Zwischensumme', '1299.0000', 1),
(1232, 392, 'shipping', 'Versand Zone 4', '23.5000', 3),
(1233, 392, 'total', 'Gesamtsumme', '1322.5000', 9),
(1240, 395, 'sub_total', 'Zwischensumme', '349.0000', 1),
(1241, 395, 'shipping', 'Versand Zone 3', '19.5000', 3),
(1242, 395, 'total', 'Gesamtsumme', '368.5000', 9),
(1249, 398, 'sub_total', 'Sub-Total', '1499.0000', 1),
(1250, 398, 'shipping', 'Versand Zone 5', '26.5000', 3),
(1251, 398, 'total', 'Total', '1525.5000', 9),
(1252, 399, 'sub_total', 'Zwischensumme', '49.0000', 1),
(1253, 399, 'shipping', 'Versand Deutschland', '0.0000', 3),
(1254, 399, 'total', 'Gesamtsumme', '49.0000', 9),
(1261, 402, 'sub_total', 'Zwischensumme', '1718.0000', 1),
(1262, 402, 'shipping', 'Versand Deutschland', '0.0000', 3),
(1263, 402, 'total', 'Gesamtsumme', '1718.0000', 9),
(1264, 403, 'sub_total', 'Zwischensumme', '1718.0000', 1),
(1265, 403, 'shipping', 'Versand Deutschland', '0.0000', 3),
(1266, 403, 'total', 'Gesamtsumme', '1718.0000', 9),
(1267, 404, 'sub_total', 'Zwischensumme', '1718.0000', 1),
(1268, 404, 'shipping', 'Versand Deutschland', '0.0000', 3),
(1269, 404, 'total', 'Gesamtsumme', '1718.0000', 9),
(1273, 406, 'sub_total', 'Zwischensumme', '149.0000', 1),
(1274, 406, 'shipping', 'Versand Deutschland', '0.0000', 3),
(1275, 406, 'total', 'Gesamtsumme', '149.0000', 9),
(1279, 408, 'sub_total', 'Zwischensumme', '1099.0000', 1),
(1280, 408, 'shipping', 'Versand Deutschland', '0.0000', 3),
(1281, 408, 'total', 'Gesamtsumme', '1099.0000', 9),
(1288, 411, 'sub_total', 'Zwischensumme', '329.0000', 1),
(1289, 411, 'shipping', 'Versand Deutschland', '0.0000', 3),
(1290, 411, 'total', 'Gesamtsumme', '329.0000', 9),
(1297, 414, 'sub_total', 'Zwischensumme', '349.0000', 1),
(1298, 414, 'shipping', 'Versand Deutschland', '0.0000', 3),
(1299, 414, 'total', 'Gesamtsumme', '349.0000', 9),
(1306, 417, 'sub_total', 'Zwischensumme', '219.0000', 1),
(1307, 417, 'shipping', 'Versand Deutschland', '0.0000', 3),
(1308, 417, 'total', 'Gesamtsumme', '219.0000', 9),
(1312, 419, 'sub_total', 'Zwischensumme', '379.0000', 1),
(1313, 419, 'shipping', 'Versand Deutschland', '0.0000', 3),
(1314, 419, 'total', 'Gesamtsumme', '379.0000', 9),
(1315, 420, 'sub_total', 'Zwischensumme', '379.0000', 1),
(1316, 420, 'shipping', 'Versand Deutschland', '0.0000', 3),
(1317, 420, 'total', 'Gesamtsumme', '379.0000', 9),
(1318, 421, 'sub_total', 'Zwischensumme', '379.0000', 1),
(1319, 421, 'shipping', 'Versand Deutschland', '0.0000', 3),
(1320, 421, 'total', 'Gesamtsumme', '379.0000', 9),
(1321, 422, 'sub_total', 'Zwischensumme', '379.0000', 1),
(1322, 422, 'shipping', 'Versand Deutschland', '0.0000', 3),
(1323, 422, 'total', 'Gesamtsumme', '379.0000', 9),
(1324, 423, 'sub_total', 'Zwischensumme', '379.0000', 1),
(1325, 423, 'shipping', 'Versand Deutschland', '0.0000', 3),
(1326, 423, 'total', 'Gesamtsumme', '379.0000', 9),
(1330, 425, 'sub_total', 'Zwischensumme', '199.0000', 1),
(1331, 425, 'shipping', 'Versand Deutschland', '0.0000', 3),
(1332, 425, 'total', 'Gesamtsumme', '199.0000', 9),
(1333, 426, 'sub_total', 'Zwischensumme', '199.0000', 1),
(1334, 426, 'shipping', 'Versand Deutschland', '0.0000', 3),
(1335, 426, 'total', 'Gesamtsumme', '199.0000', 9),
(1357, 434, 'sub_total', 'Zwischensumme', '329.0000', 1),
(1358, 434, 'shipping', 'Versand Deutschland', '0.0000', 3),
(1359, 434, 'total', 'Gesamtsumme', '329.0000', 9),
(1360, 435, 'sub_total', 'Zwischensumme', '349.0000', 1),
(1361, 435, 'shipping', 'Versand Deutschland', '0.0000', 3),
(1362, 435, 'total', 'Gesamtsumme', '349.0000', 9),
(1369, 438, 'sub_total', 'Zwischensumme', '159.0000', 1),
(1370, 438, 'shipping', 'Versand Deutschland', '0.0000', 3),
(1371, 438, 'total', 'Gesamtsumme', '159.0000', 9),
(1375, 440, 'sub_total', 'Zwischensumme', '229.0000', 1),
(1376, 440, 'shipping', 'Versand Deutschland', '0.0000', 3),
(1377, 440, 'total', 'Gesamtsumme', '229.0000', 9),
(1381, 442, 'sub_total', 'Zwischensumme', '289.0000', 1),
(1382, 442, 'shipping', 'Versand Deutschland', '0.0000', 3),
(1383, 442, 'total', 'Gesamtsumme', '289.0000', 9),
(1387, 444, 'sub_total', 'Zwischensumme', '418.0000', 1),
(1388, 444, 'shipping', 'Versand Deutschland', '0.0000', 3),
(1389, 444, 'total', 'Gesamtsumme', '418.0000', 9),
(1390, 445, 'sub_total', 'Zwischensumme', '379.0000', 1),
(1391, 445, 'shipping', 'Versand Deutschland', '0.0000', 3),
(1392, 445, 'total', 'Gesamtsumme', '379.0000', 9),
(1393, 446, 'sub_total', 'Zwischensumme', '379.0000', 1),
(1394, 446, 'shipping', 'Versand Deutschland', '0.0000', 3),
(1395, 446, 'total', 'Gesamtsumme', '379.0000', 9),
(1411, 452, 'sub_total', 'Zwischensumme', '236.0000', 1),
(1412, 452, 'shipping', 'Versand Deutschland', '0.0000', 3),
(1413, 452, 'total', 'Gesamtsumme', '236.0000', 9),
(1426, 457, 'sub_total', 'Zwischensumme', '499.0000', 1),
(1427, 457, 'shipping', 'Versand Deutschland', '0.0000', 3),
(1428, 457, 'total', 'Gesamtsumme', '499.0000', 9),
(1435, 460, 'sub_total', 'Zwischensumme', '425.0000', 1),
(1436, 460, 'shipping', 'Versand Zone 3', '19.5000', 3),
(1437, 460, 'total', 'Gesamtsumme', '444.5000', 9),
(1438, 461, 'sub_total', 'Zwischensumme', '259.9500', 1),
(1439, 461, 'shipping', 'Versand Deutschland', '0.0000', 3),
(1440, 461, 'total', 'Gesamtsumme', '259.9500', 9),
(1456, 467, 'sub_total', 'Zwischensumme', '425.0000', 1),
(1457, 467, 'shipping', 'Versand Deutschland', '0.0000', 3),
(1458, 467, 'total', 'Gesamtsumme', '425.0000', 9),
(1462, 469, 'sub_total', 'Zwischensumme', '59.0000', 1),
(1463, 469, 'shipping', 'Versand Deutschland', '0.0000', 3),
(1464, 469, 'total', 'Gesamtsumme', '59.0000', 9),
(1465, 470, 'sub_total', 'Zwischensumme', '59.0000', 1),
(1466, 470, 'shipping', 'Versand Deutschland', '0.0000', 3),
(1467, 470, 'total', 'Gesamtsumme', '59.0000', 9),
(1474, 473, 'sub_total', 'Zwischensumme', '209.0000', 1),
(1475, 473, 'shipping', 'Versand Deutschland', '0.0000', 3),
(1476, 473, 'total', 'Gesamtsumme', '209.0000', 9),
(1477, 474, 'sub_total', 'Zwischensumme', '209.0000', 1),
(1478, 474, 'shipping', 'Versand Deutschland', '0.0000', 3),
(1479, 474, 'total', 'Gesamtsumme', '209.0000', 9),
(1489, 478, 'sub_total', 'Zwischensumme', '199.0000', 1),
(1490, 478, 'shipping', 'Versand Deutschland', '0.0000', 3),
(1491, 478, 'total', 'Gesamtsumme', '199.0000', 9),
(1495, 480, 'sub_total', 'Zwischensumme', '349.0000', 1),
(1496, 480, 'shipping', 'Versand Deutschland', '0.0000', 3),
(1497, 480, 'total', 'Gesamtsumme', '349.0000', 9),
(1498, 481, 'sub_total', 'Zwischensumme', '349.0000', 1),
(1499, 481, 'shipping', 'Versand Deutschland', '0.0000', 3),
(1500, 481, 'total', 'Gesamtsumme', '349.0000', 9),
(1516, 487, 'sub_total', 'Zwischensumme', '125.0000', 1),
(1517, 487, 'shipping', 'Versand Deutschland', '0.0000', 3),
(1518, 487, 'total', 'Gesamtsumme', '125.0000', 9),
(1519, 488, 'sub_total', 'Zwischensumme', '125.0000', 1),
(1520, 488, 'shipping', 'Versand Deutschland', '0.0000', 3),
(1521, 488, 'total', 'Gesamtsumme', '125.0000', 9),
(1531, 492, 'sub_total', 'Zwischensumme', '339.0000', 1),
(1532, 492, 'shipping', 'Versand Deutschland', '0.0000', 3),
(1533, 492, 'total', 'Gesamtsumme', '339.0000', 9),
(1534, 493, 'sub_total', 'Zwischensumme', '339.0000', 1),
(1535, 493, 'shipping', 'Versand Deutschland', '0.0000', 3),
(1536, 493, 'total', 'Gesamtsumme', '339.0000', 9),
(1537, 494, 'sub_total', 'Zwischensumme', '339.0000', 1),
(1538, 494, 'shipping', 'Versand Deutschland', '0.0000', 3),
(1539, 494, 'total', 'Gesamtsumme', '339.0000', 9),
(1540, 495, 'sub_total', 'Zwischensumme', '339.0000', 1),
(1541, 495, 'shipping', 'Versand Deutschland', '0.0000', 3),
(1542, 495, 'total', 'Gesamtsumme', '339.0000', 9),
(1543, 496, 'sub_total', 'Zwischensumme', '339.0000', 1),
(1544, 496, 'shipping', 'Versand Deutschland', '0.0000', 3),
(1545, 496, 'total', 'Gesamtsumme', '339.0000', 9),
(1546, 497, 'sub_total', 'Zwischensumme', '339.0000', 1),
(1547, 497, 'shipping', 'Versand Deutschland', '0.0000', 3),
(1548, 497, 'total', 'Gesamtsumme', '339.0000', 9),
(1549, 498, 'sub_total', 'Zwischensumme', '339.0000', 1),
(1550, 498, 'shipping', 'Versand Deutschland', '0.0000', 3),
(1551, 498, 'total', 'Gesamtsumme', '339.0000', 9),
(1552, 499, 'sub_total', 'Zwischensumme', '339.0000', 1),
(1553, 499, 'shipping', 'Versand Deutschland', '0.0000', 3),
(1554, 499, 'total', 'Gesamtsumme', '339.0000', 9),
(1555, 500, 'sub_total', 'Zwischensumme', '339.0000', 1),
(1556, 500, 'shipping', 'Versand Deutschland', '0.0000', 3),
(1557, 500, 'total', 'Gesamtsumme', '339.0000', 9),
(1558, 501, 'sub_total', 'Zwischensumme', '339.0000', 1),
(1559, 501, 'shipping', 'Versand Deutschland', '0.0000', 3),
(1560, 501, 'total', 'Gesamtsumme', '339.0000', 9),
(1564, 503, 'sub_total', 'Zwischensumme', '339.0000', 1),
(1565, 503, 'shipping', 'Versand Deutschland', '0.0000', 3),
(1566, 503, 'total', 'Gesamtsumme', '339.0000', 9),
(1567, 504, 'sub_total', 'Zwischensumme', '339.0000', 1),
(1568, 504, 'shipping', 'Versand Deutschland', '0.0000', 3),
(1569, 504, 'total', 'Gesamtsumme', '339.0000', 9),
(1570, 505, 'sub_total', 'Zwischensumme', '359.0000', 1),
(1571, 505, 'shipping', 'Versand Deutschland', '0.0000', 3),
(1572, 505, 'total', 'Gesamtsumme', '359.0000', 9),
(1576, 507, 'sub_total', 'Zwischensumme', '349.9500', 1),
(1577, 507, 'shipping', 'Versand Deutschland', '0.0000', 3),
(1578, 507, 'total', 'Gesamtsumme', '349.9500', 9),
(1591, 512, 'sub_total', 'Zwischensumme', '1499.0000', 1),
(1592, 512, 'shipping', 'Versand Deutschland', '0.0000', 3),
(1593, 512, 'total', 'Gesamtsumme', '1499.0000', 9),
(1594, 513, 'sub_total', 'Zwischensumme', '1499.0000', 1),
(1595, 513, 'shipping', 'Versand Deutschland', '0.0000', 3);
INSERT INTO `oc_order_total` (`order_total_id`, `order_id`, `code`, `title`, `value`, `sort_order`) VALUES
(1596, 513, 'total', 'Gesamtsumme', '1499.0000', 9),
(1597, 514, 'sub_total', 'Zwischensumme', '1499.0000', 1),
(1598, 514, 'shipping', 'Versand Deutschland', '0.0000', 3),
(1599, 514, 'total', 'Gesamtsumme', '1499.0000', 9),
(1600, 515, 'sub_total', 'Zwischensumme', '1499.0000', 1),
(1601, 515, 'shipping', 'Versand Deutschland', '0.0000', 3),
(1602, 515, 'total', 'Gesamtsumme', '1499.0000', 9),
(1603, 516, 'sub_total', 'Zwischensumme', '1499.0000', 1),
(1604, 516, 'shipping', 'Versand Deutschland', '0.0000', 3),
(1605, 516, 'total', 'Gesamtsumme', '1499.0000', 9),
(1606, 517, 'sub_total', 'Zwischensumme', '349.9500', 1),
(1607, 517, 'shipping', 'Versand Deutschland', '0.0000', 3),
(1608, 517, 'total', 'Gesamtsumme', '349.9500', 9),
(1612, 519, 'sub_total', 'Zwischensumme', '119.0000', 1),
(1613, 519, 'shipping', 'Versand Deutschland', '0.0000', 3),
(1614, 519, 'total', 'Gesamtsumme', '119.0000', 9),
(1615, 520, 'sub_total', 'Zwischensumme', '119.0000', 1),
(1616, 520, 'shipping', 'Versand Deutschland', '0.0000', 3),
(1617, 520, 'total', 'Gesamtsumme', '119.0000', 9),
(1618, 521, 'sub_total', 'Zwischensumme', '119.0000', 1),
(1619, 521, 'shipping', 'Versand Deutschland', '0.0000', 3),
(1620, 521, 'total', 'Gesamtsumme', '119.0000', 9),
(1621, 522, 'sub_total', 'Zwischensumme', '119.0000', 1),
(1622, 522, 'shipping', 'Versand Deutschland', '0.0000', 3),
(1623, 522, 'total', 'Gesamtsumme', '119.0000', 9),
(1624, 523, 'sub_total', 'Zwischensumme', '119.0000', 1),
(1625, 523, 'shipping', 'Versand Deutschland', '0.0000', 3),
(1626, 523, 'total', 'Gesamtsumme', '119.0000', 9),
(1648, 531, 'sub_total', 'Zwischensumme', '349.0000', 1),
(1649, 531, 'shipping', 'Versand Deutschland', '0.0000', 3),
(1650, 531, 'total', 'Gesamtsumme', '349.0000', 9),
(1651, 532, 'sub_total', 'Zwischensumme', '349.0000', 1),
(1652, 532, 'shipping', 'Versand Deutschland', '0.0000', 3),
(1653, 532, 'total', 'Gesamtsumme', '349.0000', 9),
(1666, 537, 'sub_total', 'Zwischensumme', '349.0000', 1),
(1667, 537, 'shipping', 'Versand Deutschland', '0.0000', 3),
(1668, 537, 'total', 'Gesamtsumme', '349.0000', 9),
(1669, 538, 'sub_total', 'Zwischensumme', '349.0000', 1),
(1670, 538, 'shipping', 'Versand Deutschland', '0.0000', 3),
(1671, 538, 'total', 'Gesamtsumme', '349.0000', 9),
(1672, 539, 'sub_total', 'Zwischensumme', '349.0000', 1),
(1673, 539, 'shipping', 'Versand Deutschland', '0.0000', 3),
(1674, 539, 'total', 'Gesamtsumme', '349.0000', 9),
(1675, 540, 'sub_total', 'Zwischensumme', '349.0000', 1),
(1676, 540, 'shipping', 'Versand Deutschland', '0.0000', 3),
(1677, 540, 'total', 'Gesamtsumme', '349.0000', 9),
(1687, 544, 'sub_total', 'Zwischensumme', '599.0000', 1),
(1688, 544, 'shipping', 'Versand Deutschland', '0.0000', 3),
(1689, 544, 'total', 'Gesamtsumme', '599.0000', 9),
(1690, 545, 'sub_total', 'Zwischensumme', '599.0000', 1),
(1691, 545, 'shipping', 'Versand Deutschland', '0.0000', 3),
(1692, 545, 'total', 'Gesamtsumme', '599.0000', 9),
(1693, 546, 'sub_total', 'Zwischensumme', '599.0000', 1),
(1694, 546, 'shipping', 'Versand Deutschland', '0.0000', 3),
(1695, 546, 'total', 'Gesamtsumme', '599.0000', 9),
(1696, 547, 'sub_total', 'Zwischensumme', '599.0000', 1),
(1697, 547, 'shipping', 'Versand Deutschland', '0.0000', 3),
(1698, 547, 'total', 'Gesamtsumme', '599.0000', 9),
(1699, 548, 'sub_total', 'Zwischensumme', '599.0000', 1),
(1700, 548, 'shipping', 'Versand Deutschland', '0.0000', 3),
(1701, 548, 'total', 'Gesamtsumme', '599.0000', 9),
(1702, 549, 'sub_total', 'Zwischensumme', '599.0000', 1),
(1703, 549, 'shipping', 'Versand Deutschland', '0.0000', 3),
(1704, 549, 'total', 'Gesamtsumme', '599.0000', 9),
(1705, 550, 'sub_total', 'Zwischensumme', '189.0000', 1),
(1706, 550, 'shipping', 'Versand Deutschland', '0.0000', 3),
(1707, 550, 'total', 'Gesamtsumme', '189.0000', 9),
(1708, 551, 'sub_total', 'Zwischensumme', '189.0000', 1),
(1709, 551, 'shipping', 'Versand Deutschland', '0.0000', 3),
(1710, 551, 'total', 'Gesamtsumme', '189.0000', 9),
(1717, 554, 'sub_total', 'Zwischensumme', '159.0000', 1),
(1718, 554, 'shipping', 'Versand Deutschland', '0.0000', 3),
(1719, 554, 'total', 'Gesamtsumme', '159.0000', 9),
(1723, 556, 'sub_total', 'Zwischensumme', '599.0000', 1),
(1724, 556, 'shipping', 'Versand Zone 6', '28.5000', 3),
(1725, 556, 'total', 'Gesamtsumme', '627.5000', 9),
(1729, 558, 'sub_total', 'Zwischensumme', '599.0000', 1),
(1730, 558, 'shipping', 'Versand Deutschland', '0.0000', 3),
(1731, 558, 'total', 'Gesamtsumme', '599.0000', 9),
(1732, 559, 'sub_total', 'Zwischensumme', '599.0000', 1),
(1733, 559, 'shipping', 'Versand Deutschland', '0.0000', 3),
(1734, 559, 'total', 'Gesamtsumme', '599.0000', 9),
(1735, 560, 'sub_total', 'Zwischensumme', '599.0000', 1),
(1736, 560, 'shipping', 'Versand Deutschland', '0.0000', 3),
(1737, 560, 'total', 'Gesamtsumme', '599.0000', 9),
(1738, 561, 'sub_total', 'Zwischensumme', '599.0000', 1),
(1739, 561, 'shipping', 'Versand Deutschland', '0.0000', 3),
(1740, 561, 'total', 'Gesamtsumme', '599.0000', 9),
(1741, 562, 'sub_total', 'Zwischensumme', '599.0000', 1),
(1742, 562, 'shipping', 'Versand Deutschland', '0.0000', 3),
(1743, 562, 'total', 'Gesamtsumme', '599.0000', 9),
(1744, 563, 'sub_total', 'Zwischensumme', '599.0000', 1),
(1745, 563, 'shipping', 'Versand Deutschland', '0.0000', 3),
(1746, 563, 'total', 'Gesamtsumme', '599.0000', 9),
(1750, 565, 'sub_total', 'Zwischensumme', '1047.0000', 1),
(1751, 565, 'shipping', 'Versand Deutschland', '0.0000', 3),
(1752, 565, 'total', 'Gesamtsumme', '1047.0000', 9),
(1774, 573, 'sub_total', 'Zwischensumme', '79.9500', 1),
(1775, 573, 'shipping', 'Versand Zone 5', '26.5000', 3),
(1776, 573, 'total', 'Gesamtsumme', '106.4500', 9),
(1783, 576, 'sub_total', 'Zwischensumme', '990.0000', 1),
(1784, 576, 'shipping', 'Versand Deutschland', '0.0000', 3),
(1785, 576, 'total', 'Gesamtsumme', '990.0000', 9),
(1792, 579, 'sub_total', 'Zwischensumme', '319.0000', 1),
(1793, 579, 'shipping', 'Versand Deutschland', '0.0000', 3),
(1794, 579, 'total', 'Gesamtsumme', '319.0000', 9),
(1795, 580, 'sub_total', 'Zwischensumme', '319.0000', 1),
(1796, 580, 'shipping', 'Versand Deutschland', '0.0000', 3),
(1797, 580, 'total', 'Gesamtsumme', '319.0000', 9),
(1801, 582, 'sub_total', 'Zwischensumme', '499.0000', 1),
(1802, 582, 'shipping', 'Versand Deutschland', '0.0000', 3),
(1803, 582, 'total', 'Gesamtsumme', '499.0000', 9),
(1834, 593, 'sub_total', 'Zwischensumme', '179.9500', 1),
(1835, 593, 'shipping', 'Versand Deutschland', '0.0000', 3),
(1836, 593, 'total', 'Gesamtsumme', '179.9500', 9),
(1840, 595, 'sub_total', 'Zwischensumme', '279.0000', 1),
(1841, 595, 'shipping', 'Versand Deutschland', '0.0000', 3),
(1842, 595, 'total', 'Gesamtsumme', '279.0000', 9),
(1843, 596, 'sub_total', 'Zwischensumme', '279.0000', 1),
(1844, 596, 'shipping', 'Versand Deutschland', '0.0000', 3),
(1845, 596, 'total', 'Gesamtsumme', '279.0000', 9),
(1852, 599, 'sub_total', 'Zwischensumme', '1099.0000', 1),
(1853, 599, 'shipping', 'Versand Deutschland', '0.0000', 3),
(1854, 599, 'total', 'Gesamtsumme', '1099.0000', 9),
(1870, 605, 'sub_total', 'Zwischensumme', '249.0000', 1),
(1871, 605, 'shipping', 'Versand Deutschland', '0.0000', 3),
(1872, 605, 'total', 'Gesamtsumme', '249.0000', 9),
(1873, 606, 'sub_total', 'Zwischensumme', '249.0000', 1),
(1874, 606, 'shipping', 'Versand Deutschland', '0.0000', 3),
(1875, 606, 'total', 'Gesamtsumme', '249.0000', 9),
(1876, 607, 'sub_total', 'Zwischensumme', '249.0000', 1),
(1877, 607, 'shipping', 'Versand Deutschland', '0.0000', 3),
(1878, 607, 'total', 'Gesamtsumme', '249.0000', 9),
(1882, 609, 'sub_total', 'Sub-Total', '0.0000', 1),
(1883, 609, 'shipping', 'Versand Deutschland', '0.0000', 3),
(1884, 609, 'total', 'Total', '0.0000', 9),
(1885, 610, 'sub_total', 'Zwischensumme', '1399.0000', 1),
(1886, 610, 'shipping', 'Versand Deutschland', '0.0000', 3),
(1887, 610, 'total', 'Gesamtsumme', '1399.0000', 9),
(1894, 613, 'sub_total', 'Zwischensumme', '1599.0000', 1),
(1895, 613, 'shipping', 'Versand Deutschland', '0.0000', 3),
(1896, 613, 'total', 'Gesamtsumme', '1599.0000', 9),
(1903, 616, 'sub_total', 'Zwischensumme', '59.0000', 1),
(1904, 616, 'shipping', 'Versand Deutschland', '0.0000', 3),
(1905, 616, 'total', 'Gesamtsumme', '59.0000', 9),
(1909, 618, 'sub_total', 'Zwischensumme', '149.0000', 1),
(1910, 618, 'shipping', 'Versand Deutschland', '6.9000', 3),
(1911, 618, 'total', 'Gesamtsumme', '155.9000', 9),
(1912, 619, 'sub_total', 'Zwischensumme', '149.0000', 1),
(1913, 619, 'shipping', 'Versand Deutschland', '0.0000', 3),
(1914, 619, 'total', 'Gesamtsumme', '149.0000', 9),
(1915, 620, 'sub_total', 'Zwischensumme', '149.0000', 1),
(1916, 620, 'shipping', 'Versand Deutschland', '0.0000', 3),
(1917, 620, 'total', 'Gesamtsumme', '149.0000', 9),
(1918, 621, 'sub_total', 'Zwischensumme', '149.0000', 1),
(1919, 621, 'shipping', 'Versand Deutschland', '0.0000', 3),
(1920, 621, 'total', 'Gesamtsumme', '149.0000', 9),
(1921, 622, 'sub_total', 'Zwischensumme', '149.0000', 1),
(1922, 622, 'shipping', 'Versand Deutschland', '0.0000', 3),
(1923, 622, 'total', 'Gesamtsumme', '149.0000', 9),
(1924, 623, 'sub_total', 'Zwischensumme', '149.0000', 1),
(1925, 623, 'shipping', 'Versand Deutschland', '0.0000', 3),
(1926, 623, 'total', 'Gesamtsumme', '149.0000', 9),
(1927, 624, 'sub_total', 'Zwischensumme', '149.0000', 1),
(1928, 624, 'shipping', 'Versand Deutschland', '0.0000', 3),
(1929, 624, 'total', 'Gesamtsumme', '149.0000', 9),
(1930, 625, 'sub_total', 'Zwischensumme', '149.0000', 1),
(1931, 625, 'shipping', 'Versand Deutschland', '0.0000', 3),
(1932, 625, 'total', 'Gesamtsumme', '149.0000', 9),
(1933, 626, 'sub_total', 'Zwischensumme', '149.0000', 1),
(1934, 626, 'shipping', 'Versand Deutschland', '0.0000', 3),
(1935, 626, 'total', 'Gesamtsumme', '149.0000', 9),
(1936, 627, 'sub_total', 'Zwischensumme', '149.0000', 1),
(1937, 627, 'shipping', 'Versandkostenfrei', '0.0000', 3),
(1938, 627, 'total', 'Gesamtsumme', '149.0000', 9),
(1939, 628, 'sub_total', 'Zwischensumme', '149.0000', 1),
(1940, 628, 'shipping', 'Versandkostenfrei', '0.0000', 3),
(1941, 628, 'total', 'Gesamtsumme', '149.0000', 9),
(1942, 629, 'sub_total', 'Zwischensumme', '149.0000', 1),
(1943, 629, 'shipping', 'Versandkostenfrei', '0.0000', 3),
(1944, 629, 'total', 'Gesamtsumme', '149.0000', 9),
(1945, 630, 'sub_total', 'Zwischensumme', '149.0000', 1),
(1946, 630, 'shipping', 'Versandkostenfrei', '0.0000', 3),
(1947, 630, 'total', 'Gesamtsumme', '149.0000', 9),
(1948, 631, 'sub_total', 'Zwischensumme', '149.0000', 1),
(1949, 631, 'shipping', 'Versandkostenfrei', '0.0000', 3),
(1950, 631, 'total', 'Gesamtsumme', '149.0000', 9),
(1951, 632, 'sub_total', 'Zwischensumme', '149.0000', 1),
(1952, 632, 'shipping', 'Versandkostenfrei', '0.0000', 3),
(1953, 632, 'total', 'Gesamtsumme', '149.0000', 9),
(1954, 633, 'sub_total', 'Zwischensumme', '149.0000', 1),
(1955, 633, 'shipping', 'Versandkostenfrei', '0.0000', 3),
(1956, 633, 'total', 'Gesamtsumme', '149.0000', 9),
(1957, 634, 'sub_total', 'Zwischensumme', '149.0000', 1),
(1958, 634, 'shipping', 'Versand Deutschland', '0.0000', 3),
(1959, 634, 'total', 'Gesamtsumme', '149.0000', 9),
(1960, 635, 'sub_total', 'Zwischensumme', '149.0000', 1),
(1961, 635, 'shipping', 'Versandkostenfrei', '0.0000', 3),
(1962, 635, 'total', 'Gesamtsumme', '149.0000', 9),
(1963, 636, 'sub_total', 'Zwischensumme', '199.0000', 1),
(1964, 636, 'shipping', 'Versandkostenfrei', '0.0000', 3),
(1965, 636, 'total', 'Gesamtsumme', '199.0000', 9),
(1966, 637, 'sub_total', 'Zwischensumme', '199.0000', 1),
(1967, 637, 'shipping', 'Versand Deutschland', '0.0000', 3),
(1968, 637, 'total', 'Gesamtsumme', '199.0000', 9),
(1969, 638, 'sub_total', 'Zwischensumme', '199.0000', 1),
(1970, 638, 'shipping', 'Versandkostenfrei', '0.0000', 3),
(1971, 638, 'total', 'Gesamtsumme', '199.0000', 9),
(1972, 639, 'sub_total', 'Zwischensumme', '199.0000', 1),
(1973, 639, 'shipping', 'Versand Deutschland', '0.0000', 3),
(1974, 639, 'total', 'Gesamtsumme', '199.0000', 9),
(1975, 640, 'sub_total', 'Zwischensumme', '199.0000', 1),
(1976, 640, 'shipping', 'Versand Deutschland', '0.0000', 3),
(1977, 640, 'total', 'Gesamtsumme', '199.0000', 9),
(1978, 641, 'sub_total', 'Zwischensumme', '199.0000', 1),
(1979, 641, 'shipping', 'Versand Deutschland', '0.0000', 3),
(1980, 641, 'total', 'Gesamtsumme', '199.0000', 9),
(1981, 642, 'sub_total', 'Zwischensumme', '199.0000', 1),
(1982, 642, 'shipping', 'Versand Deutschland', '0.0000', 3),
(1983, 642, 'total', 'Gesamtsumme', '199.0000', 9),
(1984, 643, 'sub_total', 'Zwischensumme', '199.0000', 1),
(1985, 643, 'shipping', 'Versand Deutschland', '0.0000', 3),
(1986, 643, 'total', 'Gesamtsumme', '199.0000', 9),
(1987, 644, 'sub_total', 'Zwischensumme', '199.0000', 1),
(1988, 644, 'shipping', 'Versand Deutschland', '0.0000', 3),
(1989, 644, 'total', 'Gesamtsumme', '199.0000', 9),
(1990, 645, 'sub_total', 'Zwischensumme', '199.0000', 1),
(1991, 645, 'shipping', 'Versand Deutschland', '0.0000', 3),
(1992, 645, 'total', 'Gesamtsumme', '199.0000', 9),
(1993, 646, 'sub_total', 'Zwischensumme', '199.0000', 1),
(1994, 646, 'shipping', 'Versand Deutschland', '0.0000', 3),
(1995, 646, 'total', 'Gesamtsumme', '199.0000', 9),
(1996, 647, 'sub_total', 'Zwischensumme', '199.0000', 1),
(1997, 647, 'shipping', 'Versand Deutschland', '0.0000', 3),
(1998, 647, 'total', 'Gesamtsumme', '199.0000', 9),
(1999, 648, 'sub_total', 'Zwischensumme', '199.0000', 1),
(2000, 648, 'shipping', 'Versandkostenfrei', '0.0000', 3),
(2001, 648, 'total', 'Gesamtsumme', '199.0000', 9),
(2002, 649, 'sub_total', 'Zwischensumme', '199.0000', 1),
(2003, 649, 'shipping', 'Versand Deutschland', '0.0000', 3),
(2004, 649, 'total', 'Gesamtsumme', '199.0000', 9),
(2005, 650, 'sub_total', 'Zwischensumme', '199.0000', 1),
(2006, 650, 'shipping', 'Versand Deutschland', '0.0000', 3),
(2007, 650, 'total', 'Gesamtsumme', '199.0000', 9),
(2008, 651, 'sub_total', 'Zwischensumme', '199.0000', 1),
(2009, 651, 'shipping', 'Versand Deutschland', '0.0000', 3),
(2010, 651, 'total', 'Gesamtsumme', '199.0000', 9),
(2011, 652, 'sub_total', 'Zwischensumme', '199.0000', 1),
(2012, 652, 'shipping', 'Versand Deutschland', '0.0000', 3),
(2013, 652, 'total', 'Gesamtsumme', '199.0000', 9),
(2014, 653, 'sub_total', 'Zwischensumme', '199.0000', 1),
(2015, 653, 'shipping', 'Versand Deutschland', '0.0000', 3),
(2016, 653, 'total', 'Gesamtsumme', '199.0000', 9),
(2017, 654, 'sub_total', 'Zwischensumme', '199.0000', 1),
(2018, 654, 'shipping', 'Versand Deutschland', '0.0000', 3),
(2019, 654, 'total', 'Gesamtsumme', '199.0000', 9),
(2020, 655, 'sub_total', 'Zwischensumme', '199.0000', 1),
(2021, 655, 'shipping', 'Versand Deutschland', '0.0000', 3),
(2022, 655, 'total', 'Gesamtsumme', '199.0000', 9),
(2023, 1, 'sub_total', 'Zwischensumme', '149.0000', 1),
(2024, 1, 'shipping', 'Versand Deutschland', '0.0000', 3),
(2025, 1, 'total', 'Gesamtsumme', '149.0000', 9);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `oc_order_voucher`
--

DROP TABLE IF EXISTS `oc_order_voucher`;
CREATE TABLE `oc_order_voucher` (
  `order_voucher_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `voucher_id` int(11) NOT NULL,
  `description` varchar(255) NOT NULL,
  `code` varchar(10) NOT NULL,
  `from_name` varchar(64) NOT NULL,
  `from_email` varchar(96) NOT NULL,
  `to_name` varchar(64) NOT NULL,
  `to_email` varchar(96) NOT NULL,
  `voucher_theme_id` int(11) NOT NULL,
  `message` text NOT NULL,
  `amount` decimal(15,4) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `oc_payengine3cw_customer_contexts`
--

DROP TABLE IF EXISTS `oc_payengine3cw_customer_contexts`;
CREATE TABLE `oc_payengine3cw_customer_contexts` (
  `contextId` bigint(20) NOT NULL,
  `customerId` varchar(255) DEFAULT NULL,
  `context_values` longtext DEFAULT NULL,
  `versionNumber` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `oc_payengine3cw_customer_contexts`
--

INSERT INTO `oc_payengine3cw_customer_contexts` (`contextId`, `customerId`, `context_values`, `versionNumber`) VALUES
(1, '5', 'YTowOnt9', 1),
(2, '6', 'YTowOnt9', 1),
(3, '7', 'YTowOnt9', 1),
(4, '9', 'YTowOnt9', 1),
(5, '10', 'YTowOnt9', 1),
(6, '13', 'YTowOnt9', 1),
(7, '12', 'YTowOnt9', 1),
(8, '15', 'YTowOnt9', 1),
(9, '16', 'YTowOnt9', 1),
(10, '17', 'YTowOnt9', 1),
(11, '18', 'YTowOnt9', 1),
(12, '19', 'YTowOnt9', 1),
(13, '20', 'YTowOnt9', 1),
(14, '22', 'YTowOnt9', 1),
(15, '23', 'YTowOnt9', 1),
(16, '24', 'YTowOnt9', 1),
(17, '25', 'YTowOnt9', 1),
(18, '26', 'YTowOnt9', 1),
(19, '27', 'YTowOnt9', 1),
(20, '28', 'YTowOnt9', 1),
(21, '29', 'YTowOnt9', 1),
(22, '30', 'YTowOnt9', 1),
(23, '31', 'YTowOnt9', 1),
(24, '32', 'YTowOnt9', 1),
(25, '33', 'YTowOnt9', 1),
(26, '34', 'YTowOnt9', 1),
(27, '35', 'YTowOnt9', 1),
(28, '37', 'YTowOnt9', 1),
(29, '39', 'YTowOnt9', 1),
(30, '40', 'YTowOnt9', 1),
(31, '41', 'YTowOnt9', 1),
(32, '42', 'YTowOnt9', 1),
(33, '44', 'YTowOnt9', 1),
(34, '45', 'YTowOnt9', 1),
(35, '48', 'YTowOnt9', 1),
(36, '49', 'YTowOnt9', 1),
(37, '50', 'YTowOnt9', 1),
(38, '51', 'YTowOnt9', 1),
(39, '52', 'YTowOnt9', 1),
(40, '55', 'YTowOnt9', 1),
(41, '56', 'YTowOnt9', 1),
(42, '57', 'YTowOnt9', 1),
(43, '58', 'YTowOnt9', 1),
(44, '59', 'YTowOnt9', 1),
(45, '61', 'YTowOnt9', 1),
(46, '64', 'YTowOnt9', 1),
(47, '65', 'YTowOnt9', 1),
(48, '66', 'YTowOnt9', 1),
(49, '67', 'YTowOnt9', 1),
(50, '69', 'YTowOnt9', 1),
(51, '70', 'YTowOnt9', 1),
(52, '71', 'YTowOnt9', 1),
(53, '72', 'YTowOnt9', 1),
(54, '73', 'YTowOnt9', 1),
(55, '74', 'YTowOnt9', 1),
(56, '75', 'YTowOnt9', 1),
(57, '77', 'YTowOnt9', 1),
(58, '78', 'YTowOnt9', 1),
(59, '79', 'YTowOnt9', 1),
(60, '81', 'YTowOnt9', 1),
(61, '82', 'YTowOnt9', 1),
(62, '84', 'YTowOnt9', 1),
(63, '85', 'YTowOnt9', 1),
(64, '88', 'YTowOnt9', 1),
(65, '89', 'YTowOnt9', 1),
(66, '90', 'YTowOnt9', 1),
(67, '91', 'YTowOnt9', 1),
(68, '93', 'YTowOnt9', 1),
(69, '94', 'YTowOnt9', 1),
(70, '95', 'YTowOnt9', 1),
(71, '97', 'YTowOnt9', 1),
(72, '98', 'YTowOnt9', 1),
(73, '99', 'YTowOnt9', 1),
(74, '100', 'YTowOnt9', 1),
(75, '102', 'YTowOnt9', 1),
(76, '103', 'YTowOnt9', 1),
(77, '104', 'YTowOnt9', 1),
(78, '105', 'YTowOnt9', 1),
(79, '106', 'YTowOnt9', 1),
(80, '109', 'YTowOnt9', 1),
(81, '110', 'YTowOnt9', 1),
(82, '111', 'YTowOnt9', 1),
(83, '112', 'YTowOnt9', 1),
(84, '113', 'YTowOnt9', 1),
(85, '114', 'YTowOnt9', 1),
(86, '117', 'YTowOnt9', 1),
(87, '118', 'YTowOnt9', 1),
(88, '120', 'YTowOnt9', 1),
(89, '121', 'YTowOnt9', 1),
(90, '123', 'YTowOnt9', 1),
(91, '124', 'YTowOnt9', 1),
(92, '125', 'YTowOnt9', 1),
(93, '126', 'YTowOnt9', 1),
(94, '127', 'YTowOnt9', 1),
(95, '128', 'YTowOnt9', 1),
(96, '129', 'YTowOnt9', 1),
(97, '131', 'YTowOnt9', 1),
(98, '132', 'YTowOnt9', 1),
(99, '133', 'YTowOnt9', 1),
(100, '134', 'YTowOnt9', 1),
(101, '135', 'YTowOnt9', 1),
(102, '136', 'YTowOnt9', 1),
(103, '137', 'YTowOnt9', 1),
(104, '138', 'YTowOnt9', 1),
(105, '139', 'YTowOnt9', 1),
(106, '140', 'YTowOnt9', 1),
(107, '141', 'YTowOnt9', 1),
(108, '142', 'YTowOnt9', 1),
(109, '143', 'YTowOnt9', 1),
(110, '144', 'YTowOnt9', 1),
(111, '145', 'YTowOnt9', 1),
(112, '146', 'YTowOnt9', 1),
(113, '147', 'YTowOnt9', 1),
(114, '148', 'YTowOnt9', 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `oc_payengine3cw_schema_version`
--

DROP TABLE IF EXISTS `oc_payengine3cw_schema_version`;
CREATE TABLE `oc_payengine3cw_schema_version` (
  `version_id` int(10) NOT NULL,
  `version_number` varchar(20) NOT NULL,
  `comment` varchar(255) DEFAULT '',
  `installed_on` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `oc_payengine3cw_schema_version`
--

INSERT INTO `oc_payengine3cw_schema_version` (`version_id`, `version_number`, `comment`, `installed_on`) VALUES
(1, '1.0.0', 'Initial', '2018-05-30 03:56:42'),
(2, '2.0.0', 'EntityManager', '2018-05-30 03:56:43'),
(3, '2.0.1', 'GroupField', '2018-05-30 03:56:43'),
(4, '2.1.0', 'OptimisticLocking', '2018-05-30 03:56:43'),
(5, '2.2.0', 'TransactionObjectBinary', '2018-05-30 03:56:43');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `oc_payengine3cw_storage`
--

DROP TABLE IF EXISTS `oc_payengine3cw_storage`;
CREATE TABLE `oc_payengine3cw_storage` (
  `keyId` bigint(20) NOT NULL,
  `keyName` varchar(165) DEFAULT NULL,
  `keySpace` varchar(165) DEFAULT NULL,
  `keyValue` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `oc_payengine3cw_storage`
--

INSERT INTO `oc_payengine3cw_storage` (`keyId`, `keyName`, `keySpace`, `keyValue`) VALUES
(1, 'response', 'wer112q21339sfkl14rdeakelwelger23434sdf214eard', 'czozNDQ6InBKVHU4ZVpyQnJzOUR0YXFnWEhYNW9LYUNhT1pJQUNna2hIVWxUTm1pYndTTWJZNkM1Qm5jeURqRC8wcnFKUzZ6dS9qNzg4bU5WZDd6eXVXS3RzelMvU0VzKzY3T3BON1RLclNsdGU2UFJTd1dQQVZxTWVvc25DYTNIcGVuK2tyejREN0dIWXVwY04ra3hSSkxaYmg3TENVVmowckFacXA0WHlBRG5GWUNOTHNKUXh0bWI2czVYSUJjbXZwamYvSExtQjBKQ2pkbVlrMVdVWHdmdXdxZTF0SHJxVkkrOWlVeDNEYnNqRU5zQWt0M1lVOU91UTY1K2FXYVRtYzNGaXhHbUFaT1g5VFNUdld6bWY1WDh5K284YXNyNjdWTnlZNkF3eVVCazR5QU9JMEsyWGxlL0hzR0FlUWxGS2d6cmZFR3BtQVV4UTF3dGNPM2VBQUhXNURPdz09Ijs=');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `oc_payengine3cw_transactions`
--

DROP TABLE IF EXISTS `oc_payengine3cw_transactions`;
CREATE TABLE `oc_payengine3cw_transactions` (
  `transactionId` bigint(20) NOT NULL,
  `transactionExternalId` varchar(255) DEFAULT NULL,
  `orderId` varchar(255) DEFAULT NULL,
  `aliasForDisplay` varchar(255) DEFAULT NULL,
  `aliasActive` char(1) DEFAULT NULL,
  `paymentMachineName` varchar(255) DEFAULT NULL,
  `payment_method_definitions` text DEFAULT NULL,
  `transactionObject` longtext DEFAULT NULL,
  `authorizationType` varchar(255) DEFAULT NULL,
  `customerId` varchar(255) DEFAULT NULL,
  `updatedOn` datetime DEFAULT NULL,
  `createdOn` datetime DEFAULT NULL,
  `paymentId` varchar(255) DEFAULT NULL,
  `updatable` char(1) DEFAULT NULL,
  `executeUpdateOn` datetime DEFAULT NULL,
  `authorizationAmount` decimal(10,5) DEFAULT NULL,
  `authorizationStatus` varchar(255) DEFAULT NULL,
  `paid` char(1) DEFAULT NULL,
  `currency` varchar(255) DEFAULT NULL,
  `securityToken` varchar(255) DEFAULT NULL,
  `lastSetOrderStatusSettingKey` varchar(255) DEFAULT NULL,
  `versionNumber` int(11) NOT NULL,
  `liveTransaction` char(1) DEFAULT NULL,
  `transactionObjectBinary` blob DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `oc_payengine3cw_transactions`
--

INSERT INTO `oc_payengine3cw_transactions` (`transactionId`, `transactionExternalId`, `orderId`, `aliasForDisplay`, `aliasActive`, `paymentMachineName`, `payment_method_definitions`, `transactionObject`, `authorizationType`, `customerId`, `updatedOn`, `createdOn`, `paymentId`, `updatable`, `executeUpdateOn`, `authorizationAmount`, `authorizationStatus`, `paid`, `currency`, `securityToken`, `lastSetOrderStatusSettingKey`, `versionNumber`, `liveTransaction`, `transactionObjectBinary`) VALUES
(1, '618_1', '618', '', 'y', 'paypal', NULL, 'Tjs=', 'PaymentPage', '0', '2020-12-18 13:36:06', '2020-12-18 13:36:06', '', 'y', '2020-12-18 14:06:06', '155.90000', 'pending', 'n', 'EUR', NULL, '', 2, 'y', 0x789cbd59eb6e1bbb11f6ef027d0741bf92534bdebb566b14a863d9499a38f6b19df8a07f046a97b258efed90dcd88aa1d7ea0bf4c53a24971225ad7cd90405829822871fe7cee1ec79e40551f7b862bcc8eef1647c81e627f92dc9b13b3eaaf8aca0e407e2a4c8c7d714e50cc562dc8dbc307a6451003bf75eb7750f3f704c7394aa6d987e4cba875f0e01cb6f8f7581292b72f42ba0de913425f9ed12ea2724bc9a91b234b1dcf658e7343154d582a992e2b5c525d6a005169a6738e71f73c669254735d8a085e2b7c08e38a7645271cc14a83f6c236d915431ff8232dc1542465d38a644a9f8e187afc74b308b292979416b9e5a58605ad06c8438ea1ea2c88a1e17edfc94b04b3cadf2e4aa2acb82720c9a9f44764ba720ec1895bca2781bad156bc7288f71ba0536b036c1849d379046788aaa949b807c353e2e720eb1d03d3c8f5c3beaaef839be3779d0649127d29303947bbfeda194206610696f757cb95c3ba0ce47c64981bd911877b37dd10c1239cd69f2b5407b192a577ef31a7deec0abca04c90843911d3d92c8aac117006f2bbd1422e518da10ea5ad3fbb949100d85a4ae88d59d447b71cdc57a18b8e1939bea58d67b96ec06e2402feae67590db90c92efffb9f59d6b97cdf09c3ce2445f19d0cf8a89b150996c10ffc0d2ca72ffe59f55a49492c01800ddb1bc2825a829f7f5628e784cf253caccabf70242f384ac7f784cfc61c3d740f13981d2a34b9a46716cf4b27b57c2d364963b85a3abf962e06ce6bc6593519d7f0ea28c25325395c2cffba272c9ee19c55995207107c47698557dcd9e0360c02732ccf34650216418e310597e81e8af3170402779b09a063f5a5b6c50330f80dae6194279d11ae383093c2789393a0bf93137717274e03272b4d6fb00140ef3143196f5684efef6660d8ccc0e259b706416f2b748b8f57cc25b8373a11e3672382529cc773bd152c79f2f5528e062ff41b532e37787ed3c77c5a08570b640081bc72764c92fafcc00ebbb58a48febd80e018e745ad224b47805e81b2624a1e34fdcdbb9e63d9616f194010ee14d7d0cbed969ed7912bf2f40d9a4e71de7b57c4779d53c8d577d38a72edf892baa2d2da0e4ccc382fa383038eb3d2b1faf76aeb04b6f6137ca0dd40279b8de361fb9450c6f5e17efdbbe63845ab2550e61465249dd774384344f2603b60e184fd832549d28f8bacc6e538c5e5acc8e566309fef7b01fcabf53a45524f20bd86501c8ea704a7c92a1d8a3c56df49e39d9cdac18a6827cb22916b22e0b244f95c1f2de8d7e68c43519250ccd8d8aec5b8c5347b82cc31a532d82a0bc68d70b51dd7f3f5f14bae747205cd7f4079f11dd3ce1b18c8d1db4d197e806a6b6b7a0230186ce2fda8952f5cf40ac533067e7194cf50ca37b99758f12aeaae8e8e35232b955539a7f3fa443825b4b7b52a496a45bd371465e01056c89394a6004765864612b7666774f255123bdbfa16752452ee0a3ef7581b71f1d7bf3c2ebd65d179d44e21e69706357f38e287b6116c10a61053b5480b79bc6588daecacde8a22c3507f24da0d20e7c488268475201f5da074cbf4b5eec5c501735865acf87ebcaad46de3be7922140606d5ee58080caae782c13cf7a96868a25b0b0793b59df1e09a9c3d1f10a6203b22c2dd20792224c24db4869818aea9ae3928826d9a86a8309176854523cd665cb80d9aff7f06866d8adb1c19be416284c6ee3a69dd11747800cc3d26b733de577fc6c35aaf209f0824c3ddcca24814b3a228a88b5901a3ee79c611afd8e69decac2fab07929885bb95c0fb8937dde28203c2986808a970b396c5b3b8807559b4dae96831974b7143c9a42e6f5517adf6ba7aef7229deaa99848f2f97eba24fb16a4bce34772017297575e678961f79a16545be339c82d0c9309a5a7012b28750b00e318a6294385a4de065f790d7703256103ad4e16fc540812095328a2db8392b7e903445077edfeabcb9217952dcb3ce97eb8e0daa3aecc044e01d761e02ef6de7a82c537c83279f083ff0dd41df0d3a6f3e7db83efbbcdf49c91deebcc7f15df1b6733ca350d41c8483bed5f79cd0eac34be70a4d1125f52e6d6d14c7b814c581d2b4b490288549efdb97fdefe4f0cfbf5bfde1fe94f64e2fe53884b11c0cf621437cbd92e300c672e0ef27580e3c2dac783f8ad0c34bb7762cc7ead94ecf0e3b203a94a256a06d2689e1114620489ea65fa85cb27a979fd5a1030f7f77e3017a6152dc50549650cb833b3c32d9d3dc7b96189ed5f10cd61bfb442f8498c02b13e7898610dd89b5ab4f6defb87d2b326e426fabba6f049f5251b9afd09b2fd6855232e80c5e80e025956cc8a9d740e24f51ecdbd39e37f09d9e877cbf3749bca497c476380c9349ec0d8712c1f12402580a4d10c31bfd12f11e6cec58bdba93a3d1986cafb401d31d43dd746c09834c82a34c6477f3291578ed6077bfe8da22ce887800cd3fc27387adee177fab71fb42b145376c57eff71510a7051d1156a668fe0bcd70b6ba2755974f605ce8f4e5fcdc09aa2169fd2a5e4fe1316840b634ee1ae4d73cc69423926bd4a065e734566ddd25776d432d960d5d43ccb63628118514c6a1f031dadfaf688b3609a7639628ce5aa251d94edf426b99e86ade8ed382194a6be91b8ab575acedaf21afc132b5ff73ae6566a2962c29e7624f7d0f791910a6b4a06750bb43a230e1da3a3dc550ae24e7b9ec7abbe6378091a863c47fd7042e64d18b56a58cba38e5ec11bbe2b46e908a96b959e5b8aacaf91bd49aa2105d347d487a693c919fce66ea1bc0c9038e2bf17b245b9ebf58620fc45d97b8ad9119b049e129765d40b9a5afd31c7dfe56e1a3ec2c4b7eff7711a29b3041ec2efe7c7a1187b3bbb36afee1f7d11fe813ff63767572f9903bdf4efe39fd342826389c27673789acd3dbde8229f96e5649bbbf9cbd0c0edef7e225f5a5ca26a223ad4aa441cbd0ca10bd8394c62ec04dde6178b260e36a69fe44fe422bc0f310bba32b610cd5bb052bb8494f5a07f7f282f7a0724d498c26aa213fd8fae8fdc298ae3f7c6fd4a1f2a518d861dd8e6909ae5bc3e2532a03cfbd2e2e4419a3c2296ce90f95d6b031794a4084743ec2710a657e1db18bff016ae2863e),
(2, '619_2', '619', '', 'y', 'paypal', NULL, 'Tjs=', 'PaymentPage', '0', '2020-12-18 13:38:31', '2020-12-18 13:38:31', '', 'y', '2020-12-18 14:08:31', '149.00000', 'pending', 'n', 'EUR', NULL, '', 2, 'y', 0x789cbd59ed6edbbc15ceef01bb07c3bfda77b1a30f4bb6150c5862276dd725f59ba40db03f062dd1311b5952492a8e1bf8b67603bbb11d92a245db723ed46240d1d0e4e1c3f3cdc3a32f41c70f9a839cf174bec093f1082dcf923b9260777c92f3594ac94fc4499a8c6f284a180ac5b819747ac1130b7cd879f0b6ad07f891639aa0586dc3f453d43cbe3c062caf3ed608539626e877409d923826c9dd1aea1724bc9e912c33b1dcfa585f6864a8aa065319c51b8b6bac6e0d2cb49ce3847f4a18a7b91c1560dd1a8adf013be19c9249ce3153a05ebf8eb4699487fc12cd7153081934e1980cc5e287d77b3b5e84594849c6535af054c302d394ce8788a3e6310aace06955cf4f09bbc2d33c89aef32c4b29c7a0f94960d7740ac20628e339c5bb68b5581ba024c4f10e58d7da061376de421ae229ca636e02f2723c48130eb1d03cfe12b876d02cf9192c4c1e3459d011e9c901ca833f0e504c103388b4b73a9e5c2e1c50e723e324dfde4a8cfbd91e5583044e759a7c2bd0c11c65a5dfbc459f7bf0f22c4232c25060074f24b00af015c0db4a2fa94839863684ba36f4fec52408fa425257c4ea5ea283b0e062330cdcdeb39b8a58d67bd6ecfae2c04ed04c8a20b721935dfdf73fb379e3ea43a3d76b4c6214decb800f9af334c232f881bfaee5b4c53fab58cb28092500b06177fab0a096e0e78f1c259cf0a5848755f9178ee42947f17841f86cccd163f33882d9be42934b7a66f5b27452cb3762933486aba5f30ae942e0bc609ce5937101af8e223c5692c3c5f2ef0561e10c272c9f2b7500c1038a735c726783db3008ccb13cd39409580439c6145ca2792cce5f1108dc5d26808e1597da0e0fc0e037b8865112358638e7c04c0ce36d4eac7d7cb8fbf8702af828f5bcc504007dc00ccdf95bd5d0af3e7ef5a24b83907739bac38392b508b7866762fc6234508a9370a9b78215cfbe5ec951f7953e534ae5fa2f6ff9944c53e164be0c1d9056ce8e49549ceedb520d4241247948212cc6495a28c8d2beaf57a0a09892474d7f7bda722cbbd75a870e043ac505f47abba5e775cc8a0c7d8ba6539cb44ed3f0be710e59fa7e9a53ae5d5e52e7545ada818919e7597074c4f13c73acf6426d9dc0d676848fb40be834b3753c6c9f12cab83edc2b7e171cc7a85c02654ed19cc4cb820ecf11913cd80ed83762ff605114b5c3745ee0721ce36c9626723318cff33a3efc2bf43a45524f20bd86501c8ea704c751990845062b6ea3f15e4e6dbf24dacbb248e19a08b8cc50b2d4470bfa8d39e3501445143336b60b31ee309d3f43e69852196c6529e346a8da8edbf1f4f16bae745a05cd7f4449fa8069e31d0ce4e8fdb60c3f41b585353b02d0ef6ee3fd2c942f5cf41a8533067e7192cc50ccb7b99758611973d72703cd48a9b23ce174599c08a7f4ec5dad4a9242511f0c45193884a5f224a529c05179a192c42dd8199e7d95c4ceaebe45058994bb82cf3d15465cfdf52f4f6b6f59359eb45388f9b541cd1f8ef8a16d041b8429c45421d24a1e6f19a2563b6ba7a49863a83c22ed069073424423c21a908f4628de317da17b7165c01c56192b5c8ccb1add366e9a6742a16b50ed8f05dfa07a2918cc739f8b862aba8d703059db1b0faec9d9cb01610ab22722dc2d926742a2b78d561113fd0dd5550785bf4b53111526d2beb0a8a4d98e0bb742f3ffcfc0b04d71ab23c333488cd0d85f216d3a820e0f8059607237e36df567dc2ff40af2894032dccd2c88b6ca5801a3ee79c611cfd9f69dec6c2eaba7919885bb95c0cb8957dde28203c2986805a970b3caf36c7195aaa2a8dce96831d74b6145c1a42e6f5515957b5dbd77bd14ee544cc2c7d7cb45c1a758b525679a3b908b64ba36733a9617747a9615784e7f0a4247fd606ac149c8ee4781dfc7280851e4683581972d20afe168ac2074a8c3df9c8102412a65145b707391fe24718c8ebcb6d578774b92285db0c6e54dc306551d3760c2ef1c371efdcefbc64996c5f8164f3e137ee4b9ddb6eb37de7dfe7873f1afc3464cee71e3030eefd3f78dc18c425173d4ebb6ad76c7e9596d78e35ca329a2a4d8a5ad8dc21067a238509a9616126530697dbb3c7c20c73ffe6eb5fb8753da3abf92e31e8ce5a07b0819e2ebb51cfb309603ef30c272d0d1c28a97a3083dbc766bc772ac96edb4ec5e034487178f6b6b9b4962787e110892e7e9572a97942ff28b2274e0c9ef6e3d3d4726c52d455906953cb8c31393ddcc831789e1411dce60bdb243f44a8809bc2f71126908d197d8b8fad4f686dbb602e326ececd4f695e0532a2af712bdfa625d292583cee0ed075e92cb569c7a0df8a1835cecba2d1f39b8d5e94ea2d6c4f5fc96174e22dcb5bbfdd0b52482d39108602934410c6f754ac40bacb257f5e61e8e4663b2b152074cf70a75bbb1260c32094ee622bb970f29bf530f74ff6bae2ee28c88e7cff2133c765879bb783b0ddb570a2dba60fb7abe6f80384fe990b02c46cbdf68848bf29654dd3d8131d2c9cbf9b5135423d2fa5dbc9ec353d080ac69dc0dc8af4988294724d1a87ecd8e69a8dab96beeea065a281bb98698756d90210a098c43d963b4bddfd00ead124e472c519cd544a3b28dbe835633cd15bc0de294194aabe91b8ab54dacddaf206fc132b5ff6bae6566a29a2c29e762cf7d07791d10a634a51750b943a230e1ea3a3dc550ac445f12d9ed76cddeff505431e2bf1b02d7b1e841ab42465d9b72f6845d735a344645abdcac715c55e3fc0d2a4d4bddb9bb1f905e1b4fe497b399eafd9f3de23017bf87b2ddf99b25ee04d696c4758dcc804d0a0fb19b148a2d7d9d4e1fdcf33f43e7cfcfff7cbcb8f747fceab6e7b2ef78707a7d71dbcfbf2fefd3d3fce27e749fccbfcd06e78f8bb3c147167ab7e70f3f66bdef9927bbbe756fc1983c9835d2fe2f66af8383d7bd78475de6f389e84613f5c5ac6668cd11bd8794c646e026a7181e2cd8b85aaa3f8dbfd20af038c4eef05a1843756ec10a6ed492d6c1ad24e52da85b6312a2896ac577773e76bf32a68b0fde5b55a87c27fa765fb50cea82ebc6b0f884cac0736fd29128635438f56afa43ae356c4c9e1310215e0e711843915f44ecea7f05a783fe);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `oc_product`
--

DROP TABLE IF EXISTS `oc_product`;
CREATE TABLE `oc_product` (
  `product_id` int(11) NOT NULL,
  `model` varchar(64) NOT NULL,
  `sku` varchar(64) NOT NULL,
  `upc` varchar(12) NOT NULL,
  `ean` varchar(14) NOT NULL,
  `jan` varchar(13) NOT NULL,
  `isbn` varchar(17) NOT NULL,
  `mpn` varchar(64) NOT NULL,
  `location` varchar(128) NOT NULL,
  `quantity` int(4) NOT NULL DEFAULT 0,
  `stock_status_id` int(11) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `manufacturer_id` int(11) NOT NULL,
  `shipping` tinyint(1) NOT NULL DEFAULT 1,
  `price` decimal(15,4) NOT NULL DEFAULT 0.0000,
  `points` int(8) NOT NULL DEFAULT 0,
  `tax_class_id` int(11) NOT NULL,
  `date_available` date NOT NULL DEFAULT '0000-00-00',
  `weight` decimal(15,8) NOT NULL DEFAULT 0.00000000,
  `weight_class_id` int(11) NOT NULL DEFAULT 0,
  `length` decimal(15,8) NOT NULL DEFAULT 0.00000000,
  `width` decimal(15,8) NOT NULL DEFAULT 0.00000000,
  `height` decimal(15,8) NOT NULL DEFAULT 0.00000000,
  `length_class_id` int(11) NOT NULL DEFAULT 0,
  `subtract` tinyint(1) NOT NULL DEFAULT 1,
  `minimum` int(11) NOT NULL DEFAULT 1,
  `sort_order` int(11) NOT NULL DEFAULT 0,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `viewed` int(5) NOT NULL DEFAULT 0,
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `oc_product`
--

INSERT INTO `oc_product` (`product_id`, `model`, `sku`, `upc`, `ean`, `jan`, `isbn`, `mpn`, `location`, `quantity`, `stock_status_id`, `image`, `manufacturer_id`, `shipping`, `price`, `points`, `tax_class_id`, `date_available`, `weight`, `weight_class_id`, `length`, `width`, `height`, `length_class_id`, `subtract`, `minimum`, `sort_order`, `status`, `viewed`, `date_added`, `date_modified`) VALUES
(1251, '311.02.01', '', '', '', '', '', '', '', 5, 6, 'catalog/Gaspistolen/Glock/311.02.01_G17Gen5_persp_572_400_0.jpg', 60, 1, '269.0000', 0, 0, '2020-12-17', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 1, 1, 3, '2020-12-17 11:47:26', '2020-12-17 11:58:43'),
(1252, '302.02.00', '', '', '', '', '', '', '', 5, 6, 'catalog/Gaspistolen/Heckler_Koch/20170818-302.02.00_P30_links.JPG', 60, 1, '189.9000', 0, 0, '2020-12-17', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 1, 1, 4, '2020-12-17 11:57:17', '2020-12-17 12:37:44'),
(1253, 'Z917bl', '', '', '', '', '', '', '', 5, 6, 'catalog/Gaspistolen/Zoraki/917/Schreckschusspistole_Zoraki_917_matt_schwarz_schwarz_links.png', 61, 1, '169.0000', 0, 0, '2020-12-17', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 1, 1, 1, '2020-12-17 12:21:10', '2020-12-17 12:39:53'),
(1254, '312.02.00', '', '', '', '', '', '', '', 5, 6, 'catalog/Gaspistolen/Walther/Walther_P99/20160330-312.02.00_P99_links.JPG', 60, 1, '179.9000', 0, 0, '2020-12-17', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 1, 1, 6, '2020-12-17 12:29:56', '2020-12-17 12:50:45'),
(1255, '312.02.01', '', '', '', '', '', '', '', 1, 6, 'catalog/Gaspistolen/Walther/Walther_P99/20171011-312.02.01_P99_links.JPG', 60, 1, '209.9000', 0, 0, '2020-12-17', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 1, 1, 1, '2020-12-17 12:31:18', '2020-12-17 12:50:36'),
(1256, '312.02.rot', '', '', '', '', '', '', '', 1, 6, 'catalog/Gaspistolen/Walther/Walther_P99/20190621-312.02.16_P99_links_ret.JPG', 60, 1, '199.9000', 0, 0, '2020-12-17', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 1, 1, 3, '2020-12-17 12:31:23', '2020-12-17 12:50:53'),
(1257, '308.02.00', '', '', '', '', '', '', '', 5, 6, 'catalog/Gaspistolen/Walther/Walther_P_22/20160330-308.02.00_P22_links.JPG', 60, 1, '139.9000', 0, 0, '2020-12-17', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 1, 1, 0, '2020-12-17 12:45:03', '2020-12-17 12:49:42'),
(1258, '308.02.01', '', '', '', '', '', '', '', 1, 6, 'catalog/Gaspistolen/Walther/Walther_P_22/20160330-308.02.01_P22_links_ret.JPG', 60, 1, '159.9000', 0, 0, '2020-12-17', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 1, 1, 1, '2020-12-17 12:51:17', '2020-12-17 13:24:17'),
(1259, '308.02.20-1', '', '', '', '', '', '', '', 5, 6, 'catalog/Gaspistolen/Walther/Walther_P_22/20170215-308.02.20-1_P22QR2DKit_Detail1_ret.JPG', 60, 1, '199.0000', 0, 0, '2020-12-17', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 1, 1, 0, '2020-12-17 13:14:07', '2020-12-17 13:15:08'),
(1260, '308.02.20', '', '', '', '', '', '', '', 5, 6, 'catalog/Gaspistolen/Walther/Walther_P_22/20160330-308.02.20_P22Q_links.JPG', 60, 1, '159.9000', 0, 0, '2020-12-17', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 1, 1, 0, '2020-12-17 13:16:59', '2020-12-17 13:22:07'),
(1261, '308.02.40', '', '', '', '', '', '', '', 1, 6, 'catalog/Gaspistolen/Walther/Walther_P_22/20150119-308.02.40_P22_BlueStar_links.JPG', 60, 1, '169.9000', 0, 0, '2020-12-17', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 1, 1, 0, '2020-12-17 13:20:32', '2020-12-17 13:21:51'),
(1262, '308.02.41', '', '', '', '', '', '', '', 1, 6, 'catalog/Gaspistolen/Walther/Walther_P_22/20191217-308.02.41_P22QMintos_links.JPG', 60, 1, '169.9000', 0, 0, '2020-12-17', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 1, 1, 0, '2020-12-17 13:22:13', '2020-12-17 13:25:33'),
(1263, '310.02.00', '', '', '', '', '', '', '', 3, 6, 'catalog/Gaspistolen/Walther/Walther_PPQ/20101104-310.02.00_PPQ_links_ret.JPG', 60, 1, '169.9000', 0, 0, '2020-12-17', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 1, 1, 0, '2020-12-17 14:02:58', '0000-00-00 00:00:00'),
(1264, '310.02.05', '', '', '', '', '', '', '', 3, 6, 'catalog/Gaspistolen/Walther/Walther_PPQ/20140128-310.02.05_PPQM2NavyKit_links_ret.JPG', 60, 1, '219.0000', 0, 0, '2020-12-17', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 1, 1, 0, '2020-12-17 14:03:15', '2020-12-17 14:05:14'),
(1265, '318.02.10', '', '', '', '', '', '', '', 1, 6, 'catalog/Gaspistolen/Browning/20170818-318.02.10_GPDA9_links.JPG', 60, 1, '179.9000', 0, 0, '2020-12-17', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 1, 1, 0, '2020-12-17 14:13:18', '0000-00-00 00:00:00'),
(1266, '318.02.12', '', '', '', '', '', '', '', 3, 6, 'catalog/Gaspistolen/Browning/20170818-318.02.12_GPDA9_links.JPG', 60, 1, '229.9000', 0, 0, '2020-12-17', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 1, 1, 0, '2020-12-17 14:16:36', '2020-12-17 14:18:10'),
(1267, '317.02.30', '', '', '', '', '', '', '', 1, 6, 'catalog/Gaspistolen/Colt/1911/20190307-317.02.30_1911A1_links.JPG', 60, 1, '169.9000', 0, 0, '2020-12-17', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 1, 1, 0, '2020-12-17 14:26:58', '0000-00-00 00:00:00'),
(1268, '317.02.38', '', '', '', '', '', '', '', 1, 6, 'catalog/Gaspistolen/Colt/1911/20170419-317.02.38_Government1911_links.JPG', 60, 1, '189.9000', 0, 0, '2020-12-17', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 1, 1, 0, '2020-12-17 14:27:04', '2020-12-17 14:29:59'),
(1269, '4.1323', '', '', '', '', '', '', '', 15, 6, 'catalog/Munition/9mmP.A.K./20111209-4.1323_Titan9mmPAK_persp_ret-2.JPG', 60, 1, '99.9500', 0, 0, '2020-12-17', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 1, 1, 0, '2020-12-17 14:55:39', '2020-12-18 09:41:33'),
(1270, '4.1322', '', '', '', '', '', '', '', 15, 6, 'catalog/Munition/9mmP.A.K./20111209-4.1322_Titan9mmPAK_persp_ret-2.JPG', 60, 1, '15.0000', 0, 0, '2020-12-17', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 1, 1, 0, '2020-12-17 14:55:47', '2020-12-18 09:41:21'),
(1271, '231 73 22', '', '', '', '', '', '', '', 15, 6, '', 62, 1, '18.0000', 0, 0, '2020-12-17', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 1, 1, 0, '2020-12-17 15:03:55', '2020-12-18 09:41:51'),
(1272, '2x 231 73 22', '', '', '', '', '', '', '', 15, 6, '', 62, 1, '32.0000', 0, 0, '2020-12-17', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 1, 1, 0, '2020-12-17 15:04:01', '2020-12-18 09:42:23'),
(1273, '231 73 19', '', '', '', '', '', '', '', 15, 6, '', 62, 1, '21.0000', 0, 0, '2020-12-17', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 1, 1, 0, '2020-12-17 15:05:42', '2020-12-18 09:42:06'),
(1274, '2x 231 73 19', '', '', '', '', '', '', '', 15, 6, '', 62, 1, '38.0000', 0, 0, '2020-12-17', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 1, 1, 0, '2020-12-17 15:06:42', '2020-12-18 09:42:39'),
(1275, '231 86 31', '', '', '', '', '', '', '', 15, 6, '', 62, 1, '11.0000', 0, 0, '2020-12-17', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 1, 1, 0, '2020-12-17 15:09:19', '2020-12-18 09:42:47'),
(1276, '2x 231 86 38', '', '', '', '', '', '', '', 15, 6, 'catalog/Munition/9mm R/Schwarzpulver 9mm R.jpg', 62, 1, '21.0000', 0, 0, '2020-12-17', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 1, 1, 0, '2020-12-17 15:11:05', '2020-12-19 15:10:46'),
(1277, '231 86 38', '', '', '', '', '', '', '', 15, 6, 'catalog/Munition/9mm R/Schwarzpulver 9mm R.jpg', 62, 1, '21.0000', 0, 0, '2020-12-17', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 1, 1, 0, '2020-12-17 15:11:10', '2020-12-19 15:10:08'),
(1278, '4.1300-1', '', '', '', '', '', '', '', 15, 6, 'catalog/Munition/9mmP.A.K./20160420-4.1300-1_9mmRKRB_persp2_ret.JPG', 62, 1, '18.0000', 0, 0, '2020-12-17', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 1, 1, 5, '2020-12-17 15:13:31', '2020-12-18 09:41:42'),
(1279, '2x4.1300-1', '', '', '', '', '', '', '', 15, 6, 'catalog/Munition/9mmP.A.K./20160420-4.1300-1_9mmRKRB_persp2_ret.JPG', 62, 1, '32.0000', 0, 0, '2020-12-17', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 1, 1, 0, '2020-12-17 15:15:07', '2020-12-19 14:28:20'),
(1280, '701.02.00', '', '', '', '', '', '', '', 1, 6, 'catalog/Gaspistolen/Roehm/RG_96/701.02.00_RG96_links_501_400_0.jpg', 60, 1, '179.0000', 0, 0, '2020-12-18', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 1, 1, 1, '2020-12-18 09:12:19', '0000-00-00 00:00:00'),
(1281, '702.02.00', '', '', '', '', '', '', '', 1, 6, 'catalog/Gaspistolen/Roehm/RG_88/702.02.00_RG88_links_439_400_0.jpg', 60, 1, '149.0000', 0, 0, '2020-12-18', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 1, 1, 1, '2020-12-18 09:23:43', '0000-00-00 00:00:00'),
(1282, '708.02.00', '', '', '', '', '', '', '', 1, 6, 'catalog/Gaspistolen/Roehm/RG_3/708.02.00_RG3_links_400_400_0.jpg', 60, 1, '89.9000', 0, 0, '2020-12-18', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 1, 1, 1, '2020-12-18 09:33:10', '2020-12-19 11:12:37'),
(1283, '722.02.05', '', '', '', '', '', '', '', 2, 6, 'catalog/Gaspistolen/Roehm/RG_56/722.02.25_RG56_links_472_400_0.jpg', 60, 1, '109.9000', 0, 0, '2020-12-19', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 1, 1, 0, '2020-12-19 11:12:20', '2020-12-19 13:50:21'),
(1284, '722.02.00', '', '', '', '', '', '', '', 2, 6, 'catalog/Gaspistolen/Roehm/RG_59/722.02.00_RG59_links_476_400_0.jpg', 60, 1, '129.9000', 0, 0, '2020-12-19', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 1, 1, 0, '2020-12-19 12:06:50', '2020-12-19 13:50:36'),
(1285, '722.02.06', '', '', '', '', '', '', '', 2, 6, 'catalog/Gaspistolen/Roehm/RG_59/722.02.06_RG59_links_450_400_0.jpg', 60, 1, '129.9000', 0, 0, '2020-12-19', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 1, 1, 0, '2020-12-19 12:06:58', '2020-12-19 12:19:21'),
(1286, '721.02.00', '', '', '', '', '', '', '', 2, 6, 'catalog/Gaspistolen/Roehm/RG_89/721.02.00_RG89_links_492_400_0.jpg', 60, 1, '149.9000', 0, 0, '2020-12-19', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 1, 1, 0, '2020-12-19 12:47:51', '2020-12-19 13:51:05'),
(1287, '721.02.06', '', '', '', '', '', '', '', 2, 6, 'catalog/Gaspistolen/Roehm/RG_89/721.02.06_RG89_links_600_400_0.jpg', 60, 1, '169.9000', 0, 0, '2020-12-19', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 1, 1, 0, '2020-12-19 12:48:09', '2020-12-19 13:52:19'),
(1288, '348.02.07', '', '', '', '', '', '', '', 1, 6, 'catalog/Gaspistolen/Smith_and_Wesson/Chief_Special/20170818-348.02.07_ChiefsSpecial_links.JPG', 60, 1, '129.9000', 0, 0, '2020-12-19', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 1, 1, 2, '2020-12-19 13:49:07', '2020-12-19 13:51:24'),
(1289, '348.02.09', '', '', '', '', '', '', '', 1, 6, 'catalog/Gaspistolen/Smith_and_Wesson/Chief_Special/20170818-348.02.09_ChiefsSpecial_links.JPG', 60, 1, '149.9000', 0, 0, '2020-12-19', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 1, 1, 0, '2020-12-19 13:52:27', '2020-12-19 13:53:26'),
(1290, '344.02.46', '', '', '', '', '', '', '', 1, 6, 'catalog/Gaspistolen/Colt/Combat_Special/20180215-344.02.46_DetectiveSpecial_links.JPG', 60, 1, '139.9000', 0, 0, '2020-12-19', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 1, 1, 0, '2020-12-19 14:03:05', '0000-00-00 00:00:00'),
(1291, '344.02.49', '', '', '', '', '', '', '', 1, 6, 'catalog/Gaspistolen/Colt/Combat_Special/20180215-344.02.49_DetectiveSpecial_links.JPG', 60, 1, '189.9000', 0, 0, '2020-12-19', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 1, 1, 1, '2020-12-19 14:03:12', '2020-12-19 14:05:08'),
(1292, 'Z917CM', '', '', '', '', '', '', '', 5, 6, 'catalog/Gaspistolen/Zoraki/917/z510049_Zoraki_917_matt_chrom.jpg', 61, 1, '179.0000', 0, 0, '2020-12-17', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 1, 1, 0, '2020-12-19 14:11:24', '2020-12-19 14:12:50'),
(1293, 'Z917TAN', '', '', '', '', '', '', '', 5, 6, 'catalog/Gaspistolen/Zoraki/917/-5030-1.jpg', 61, 1, '179.0000', 0, 0, '2020-12-17', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 1, 1, 0, '2020-12-19 14:11:31', '2020-12-19 14:15:02'),
(1294, 'Z918bl', '', '', '', '', '', '', '', 5, 6, 'catalog/Gaspistolen/Zoraki/918/Schreckschusspistole_Zoraki_918_matt_schwarz_links.png', 61, 1, '169.0000', 0, 0, '2020-12-19', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 1, 1, 0, '2020-12-19 14:21:11', '0000-00-00 00:00:00'),
(1295, 'Z918CM', '', '', '', '', '', '', '', 5, 6, 'catalog/Gaspistolen/Zoraki/918/Z510059_Zoraki_918_matt_chrom.jpg', 61, 1, '179.0000', 0, 0, '2020-12-19', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 1, 1, 0, '2020-12-19 14:21:21', '2020-12-19 14:22:22'),
(1296, 'Z914bl', '', '', '', '', '', '', '', 0, 6, 'catalog/Gaspistolen/Zoraki/914/914 schwarz links.jpg', 61, 1, '139.0000', 0, 0, '2020-12-19', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 1, 0, 0, '2020-12-19 14:41:47', '0000-00-00 00:00:00'),
(1297, 'Z914CM', '', '', '', '', '', '', '', 5, 6, 'catalog/Gaspistolen/Zoraki/914/914 silber schwarze griffschalen.jpg', 61, 1, '149.0000', 0, 0, '2020-12-19', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 1, 1, 1, '2020-12-19 14:42:05', '2020-12-19 14:43:56'),
(1298, 'Z914SAT', '', '', '', '', '', '', '', 5, 6, 'catalog/Gaspistolen/Zoraki/914/5325_zoraki_gr.jpg', 61, 1, '149.0000', 0, 0, '2020-12-19', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 1, 1, 3, '2020-12-19 14:42:17', '2020-12-19 14:47:36'),
(1299, 'Z2918bl', '', '', '', '', '', '', '', 3, 6, 'catalog/Gaspistolen/Zoraki/2918/Z510070_Zoraki_2918_schwarz.png', 61, 1, '169.0000', 0, 0, '2020-12-21', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 1, 1, 0, '2020-12-21 09:59:32', '2020-12-21 10:27:54'),
(1300, 'Z2918CM', '', '', '', '', '', '', '', 3, 6, 'catalog/Gaspistolen/Zoraki/2918/Z510079_Zoraki_2918_matt_chrom.jpg', 61, 1, '179.0000', 0, 0, '2020-12-21', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 1, 1, 0, '2020-12-21 09:59:43', '2020-12-21 10:28:07'),
(1301, 'Z4918bl', '', '', '', '', '', '', '', 1, 6, 'catalog/Gaspistolen/Zoraki/4918/Z510080_Zoraki_4918_schwarz.png', 61, 1, '169.0000', 0, 0, '2020-12-21', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 1, 0, 0, '2020-12-21 10:09:24', '2020-12-21 10:28:18'),
(1302, 'Z4918CM', '', '', '', '', '', '', '', 1, 6, 'catalog/Gaspistolen/Zoraki/4918/Z510089_Zoraki_4918_matt_chrom.jpg', 61, 1, '179.0000', 0, 0, '2020-12-21', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 1, 0, 0, '2020-12-21 10:10:56', '2020-12-21 10:28:29'),
(1303, 'Z925bl', '', '', '', '', '', '', '', 1, 6, 'catalog/Gaspistolen/Zoraki/925/-5126-1.jpg', 61, 1, '199.0000', 0, 0, '2020-12-21', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 1, 1, 0, '2020-12-21 10:27:18', '0000-00-00 00:00:00'),
(1304, 'Z925camo', '', '', '', '', '', '', '', 1, 6, 'catalog/Gaspistolen/Zoraki/925/Z510925CMF_Zoraki_925_camo.jpg', 61, 1, '229.0000', 0, 0, '2020-12-21', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 1, 1, 0, '2020-12-21 10:28:42', '2020-12-21 11:03:15'),
(1305, 'Z906bl', '', '', '', '', '', '', '', 1, 6, 'catalog/Gaspistolen/Zoraki/906/906_schwarz.jpg', 61, 1, '129.0000', 0, 0, '2020-12-21', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 1, 1, 0, '2020-12-21 10:43:54', '0000-00-00 00:00:00'),
(1306, 'Z906CM', '', '', '', '', '', '', '', 1, 6, 'catalog/Gaspistolen/Zoraki/906/Schreckschusspistole Zoraki 906 Titan links.png', 61, 1, '139.0000', 0, 0, '2020-12-21', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 1, 1, 0, '2020-12-21 10:44:21', '2020-12-21 10:45:46'),
(1307, 'ZorakiR12.5HG', '', '', '', '', '', '', '', 4, 6, 'catalog/Gaspistolen/Zoraki/R_1/-5125-1.jpg', 61, 1, '149.0000', 0, 0, '2020-12-21', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 1, 1, 0, '2020-12-21 10:55:53', '0000-00-00 00:00:00'),
(1308, 'ZorakiR14.5HG', '', '', '', '', '', '', '', 4, 6, 'catalog/Gaspistolen/Zoraki/R_1/Zoraki R1 4_5 Zoll Shiny.jpg', 61, 1, '159.0000', 0, 0, '2020-12-21', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 1, 1, 0, '2020-12-21 10:56:04', '2020-12-21 11:00:23'),
(1309, 'ZorakiR16HG', '', '', '', '', '', '', '', 4, 6, 'catalog/Gaspistolen/Zoraki/R_1/Zoraki R1 6 Zoll links.jpg', 61, 1, '169.0000', 0, 0, '2020-12-21', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 1, 1, 0, '2020-12-21 11:00:29', '2020-12-21 11:43:25'),
(1310, 'ZorakiR14.5bl', '', '', '', '', '', '', '', 4, 6, 'catalog/Gaspistolen/Zoraki/R_1/Z510090_Zoraki_R1_4_5_schwarz.png', 61, 1, '159.0000', 0, 0, '2020-12-21', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 1, 1, 0, '2020-12-21 11:03:23', '2020-12-21 11:04:53'),
(1311, 'ZorakiR14.5Ti', '', '', '', '', '', '', '', 4, 6, 'catalog/Gaspistolen/Zoraki/R_1/Z510091_Zoraki_R1_Titan_4,5.png', 61, 1, '169.0000', 0, 0, '2020-12-21', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 1, 1, 0, '2020-12-21 11:03:28', '2020-12-21 11:07:07'),
(1312, 'ZorakiR16bl', '', '', '', '', '', '', '', 4, 6, 'catalog/Gaspistolen/Zoraki/R_1/Z510100_Zoraki_R1_6_schwarz.png', 61, 1, '169.0000', 0, 0, '2020-12-21', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 1, 1, 0, '2020-12-21 11:07:36', '2020-12-21 11:42:22'),
(1313, 'ZR22bl', '', '', '', '', '', '', '', 1, 6, 'catalog/Gaspistolen/Zoraki/R_2/Z510130_Zoraki_R2_2_Zoll_schwarz.png', 61, 1, '149.0000', 0, 0, '2020-12-21', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 1, 1, 0, '2020-12-21 11:38:26', '0000-00-00 00:00:00'),
(1314, 'ZR22Ti', '', '', '', '', '', '', '', 1, 6, 'catalog/Gaspistolen/Zoraki/R_2/Z510131_Zoraki_R2_2_titan.png', 61, 1, '159.0000', 0, 0, '2020-12-21', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 1, 1, 0, '2020-12-21 11:38:34', '2020-12-21 11:41:58'),
(1315, 'HW37', '', '', '', '', '', '', '', 0, 6, 'catalog/Gaspistolen/Weihrauch/HW_37/Weihrauch HW37 black.jpg', 63, 1, '149.0000', 0, 0, '2020-12-21', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 1, 1, 0, '2020-12-21 12:59:01', '2020-12-21 13:18:59'),
(1316, 'HW37ST', '', '', '', '', '', '', '', 1, 6, 'catalog/Gaspistolen/Weihrauch/HW_37/Weihrauch HW37 stainless.jpg', 63, 1, '179.0000', 0, 0, '2020-12-21', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 1, 1, 0, '2020-12-21 12:59:16', '2020-12-21 13:19:16'),
(1317, 'HW88bl', '', '', '', '', '', '', '', 0, 6, 'catalog/Gaspistolen/Weihrauch/HW_88/HW-88-quer-08-2015-1024x682.jpg', 63, 1, '199.0000', 0, 0, '2020-12-21', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 1, 1, 0, '2020-12-21 13:14:28', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `oc_product_attribute`
--

DROP TABLE IF EXISTS `oc_product_attribute`;
CREATE TABLE `oc_product_attribute` (
  `product_id` int(11) NOT NULL,
  `attribute_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `text` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `oc_product_attribute`
--

INSERT INTO `oc_product_attribute` (`product_id`, `attribute_id`, `language_id`, `text`) VALUES
(1251, 59, 2, 'Ja - mit Pyrotechnischem Abschussbecher'),
(1251, 57, 1, 'yes'),
(1251, 57, 2, 'Ja'),
(1251, 46, 1, '17'),
(1251, 46, 2, '17'),
(1251, 45, 1, '9mm PAK'),
(1251, 45, 2, '9mm P.A.K.'),
(1251, 44, 1, ''),
(1251, 44, 2, '4&quot;'),
(1251, 43, 1, '197'),
(1251, 43, 2, '197'),
(1251, 42, 1, '723'),
(1251, 42, 2, '723'),
(1252, 44, 2, '103'),
(1252, 45, 2, '9mm P.A.K'),
(1252, 45, 1, '9mm P.A.K'),
(1252, 46, 2, '15'),
(1252, 46, 1, '15'),
(1252, 53, 2, 'Fallsicherung'),
(1252, 53, 1, 'fall safety'),
(1252, 54, 2, 'Ja'),
(1252, 54, 1, 'yes'),
(1252, 56, 2, 'Ja'),
(1252, 56, 1, 'yes'),
(1252, 57, 2, 'Ja'),
(1252, 57, 1, 'Yes'),
(1251, 59, 1, 'yes'),
(1253, 57, 1, 'yes'),
(1253, 58, 2, 'Ja'),
(1253, 56, 1, 'yes'),
(1253, 57, 2, 'Ja'),
(1253, 56, 2, 'Ja'),
(1253, 44, 2, '103'),
(1253, 44, 1, '103'),
(1253, 45, 2, '9mm P.A.K'),
(1253, 45, 1, '9mm P.A.K'),
(1253, 46, 2, '17'),
(1253, 46, 1, '17'),
(1253, 53, 2, 'Fallsicherung'),
(1254, 58, 2, 'Ja'),
(1254, 58, 1, 'yes'),
(1254, 42, 2, '655'),
(1254, 42, 1, '655'),
(1254, 43, 2, '103'),
(1254, 43, 1, '103'),
(1254, 45, 2, '9mm P.A.K'),
(1254, 45, 1, '9mm P.A.K'),
(1254, 46, 2, '15'),
(1254, 46, 1, '15'),
(1254, 54, 2, 'Ja'),
(1254, 54, 1, 'yes'),
(1254, 56, 2, 'Ja'),
(1254, 56, 1, 'yes'),
(1254, 57, 2, 'Ja'),
(1254, 57, 1, 'yes'),
(1255, 45, 2, '9mm P.A.K'),
(1255, 45, 1, '9mm P.A.K'),
(1255, 46, 2, '15'),
(1255, 46, 1, '15'),
(1255, 54, 2, 'Ja'),
(1255, 54, 1, 'yes'),
(1255, 56, 2, 'Ja'),
(1255, 56, 1, 'yes'),
(1255, 57, 2, 'Ja'),
(1255, 57, 1, 'yes'),
(1255, 58, 2, 'Ja'),
(1255, 58, 1, 'yes'),
(1256, 46, 2, '15'),
(1256, 46, 1, '15'),
(1256, 54, 2, 'Ja'),
(1256, 54, 1, 'yes'),
(1256, 56, 2, 'Ja'),
(1256, 56, 1, 'yes'),
(1256, 57, 2, 'Ja'),
(1256, 57, 1, 'yes'),
(1256, 58, 2, 'Ja'),
(1256, 58, 1, 'yes'),
(1256, 59, 2, 'Ja - inkl. Pyrotechnischem Abschussbecher'),
(1252, 58, 2, 'Ja'),
(1255, 43, 2, '103'),
(1255, 43, 1, '103'),
(1255, 42, 1, '655'),
(1256, 45, 1, '9mm P.A.K'),
(1256, 45, 2, '9mm P.A.K'),
(1256, 43, 2, '103'),
(1256, 43, 1, '103'),
(1256, 42, 2, '655'),
(1254, 59, 2, 'Ja - inkl. Pyrotechnischem Abschussbecher'),
(1254, 59, 1, 'yes'),
(1252, 44, 1, '103'),
(1252, 43, 1, '178'),
(1252, 43, 2, '178'),
(1252, 42, 2, '665'),
(1252, 42, 1, '665'),
(1256, 42, 1, '655'),
(1252, 58, 1, 'yes'),
(1252, 59, 2, 'Ja - inkl. Pyrotechnischem Abschussbecher'),
(1252, 59, 1, 'yes'),
(1255, 59, 2, 'Ja - inkl. Pyrotechnischem Abschussbecher'),
(1255, 59, 1, 'yes'),
(1253, 53, 1, 'fall safety'),
(1253, 43, 1, '201'),
(1253, 43, 2, '201'),
(1253, 42, 2, '830'),
(1253, 42, 1, '830'),
(1255, 42, 2, '655'),
(1253, 58, 1, 'yes'),
(1253, 59, 2, 'Ja - inkl. pyrotechnischem Abschussbecher'),
(1253, 59, 1, 'yes'),
(1257, 55, 2, 'Ja'),
(1257, 53, 1, 'Bolt safety manual'),
(1257, 53, 2, 'Schlagbolzensicherung - manuell'),
(1257, 46, 1, '7'),
(1257, 46, 2, '7'),
(1257, 45, 1, '9mm PAK'),
(1257, 45, 2, '9mm PAK'),
(1257, 44, 1, '8,5 (3,5&quot;)'),
(1257, 44, 2, '8,5 (3,5&quot;)'),
(1257, 43, 1, '154'),
(1257, 43, 2, '154'),
(1257, 42, 1, '480'),
(1257, 42, 2, '480'),
(1257, 55, 1, 'yes'),
(1257, 56, 2, 'Ja'),
(1257, 56, 1, 'yes'),
(1257, 57, 2, 'Ja'),
(1257, 57, 1, 'yes'),
(1257, 58, 2, 'Ja'),
(1257, 58, 1, 'yes'),
(1257, 59, 2, 'Ja - mit Pyrotechnischem Abschussbecher'),
(1257, 59, 1, 'yes'),
(1256, 59, 1, 'yes'),
(1258, 59, 2, 'Ja - mit Pyrotechnischem Abschussbecher'),
(1258, 58, 2, 'Ja'),
(1258, 58, 1, 'yes'),
(1258, 57, 2, 'Ja'),
(1258, 57, 1, 'yes'),
(1258, 55, 1, 'yes'),
(1258, 56, 2, 'Ja'),
(1258, 56, 1, 'yes'),
(1258, 55, 2, 'Ja'),
(1258, 53, 1, 'Bolt safety manual'),
(1258, 46, 1, '7'),
(1258, 53, 2, 'Schlagbolzensicherung - manuell'),
(1258, 45, 1, '9mm PAK'),
(1258, 46, 2, '7'),
(1258, 42, 1, '480'),
(1258, 43, 2, '154'),
(1258, 43, 1, '154'),
(1258, 44, 2, '8,5 (3,5&quot;)'),
(1258, 44, 1, '8,5 (3,5&quot;)'),
(1258, 45, 2, '9mm PAK'),
(1259, 58, 2, 'Ja'),
(1259, 57, 1, 'yes'),
(1259, 57, 2, 'Ja'),
(1259, 56, 1, 'yes'),
(1259, 56, 2, 'Ja'),
(1259, 53, 1, 'yes'),
(1259, 53, 2, 'Schlagbolzensicherung - manuel'),
(1259, 46, 1, '7'),
(1259, 46, 2, '7'),
(1259, 45, 1, '9mm PAK'),
(1259, 45, 2, '9mm PAK'),
(1259, 44, 1, '8,5 (3,5&quot;)'),
(1259, 44, 2, '8,5 (3,5&quot;)'),
(1259, 43, 1, '154'),
(1259, 43, 2, '154'),
(1259, 42, 1, '480'),
(1259, 42, 2, '480'),
(1259, 58, 1, 'yes'),
(1259, 59, 2, 'Ja - mit pyrotechnischem Abschussbecher'),
(1259, 59, 1, 'yes'),
(1258, 42, 2, '480'),
(1260, 59, 2, 'Ja - mit pyrotechnischem Abschussbecher'),
(1260, 44, 1, '8,5 (3,5&quot;)'),
(1260, 45, 2, '9mm PAK'),
(1260, 45, 1, '9mm PAK'),
(1260, 46, 2, '7'),
(1260, 46, 1, '7'),
(1260, 53, 2, 'Schlagbolzensicherung - manuel'),
(1260, 53, 1, 'yes'),
(1260, 56, 2, 'Ja'),
(1260, 56, 1, 'yes'),
(1260, 57, 2, 'Ja'),
(1260, 57, 1, 'yes'),
(1260, 58, 2, 'Ja'),
(1260, 58, 1, 'yes'),
(1260, 44, 2, '8,5 (3,5&quot;)'),
(1260, 43, 1, '154'),
(1260, 43, 2, '154'),
(1260, 42, 2, '480'),
(1260, 42, 1, '480'),
(1261, 53, 1, 'yes'),
(1261, 53, 2, 'Schlagbolzensicherung - manuel'),
(1261, 46, 1, '7'),
(1261, 46, 2, '7'),
(1261, 45, 1, '9mm PAK'),
(1261, 45, 2, '9mm PAK'),
(1261, 44, 1, '8,5 (3,5&quot;)'),
(1261, 44, 2, '8,5 (3,5&quot;)'),
(1261, 43, 1, '154'),
(1261, 43, 2, '154'),
(1261, 42, 1, '480'),
(1261, 42, 2, '480'),
(1261, 56, 2, 'Ja'),
(1261, 56, 1, 'yes'),
(1261, 57, 2, 'Ja'),
(1261, 57, 1, 'yes'),
(1261, 58, 2, 'Ja'),
(1261, 58, 1, 'yes'),
(1261, 59, 2, 'Ja - mit pyrotechnischem Abschussbecher'),
(1261, 59, 1, 'yes'),
(1260, 59, 1, 'yes'),
(1262, 59, 2, 'Ja - mit pyrotechnischem Abschussbecher'),
(1262, 44, 1, '8,5 (3,5&quot;)'),
(1262, 45, 2, '9mm PAK'),
(1262, 45, 1, '9mm PAK'),
(1262, 46, 2, '7'),
(1262, 46, 1, '7'),
(1262, 53, 2, 'Schlagbolzensicherung - manuel'),
(1262, 53, 1, 'yes'),
(1262, 56, 2, 'Ja'),
(1262, 56, 1, 'yes'),
(1262, 57, 2, 'Ja'),
(1262, 57, 1, 'yes'),
(1262, 58, 2, 'Ja'),
(1262, 58, 1, 'yes'),
(1262, 44, 2, '8,5 (3,5&quot;)'),
(1262, 43, 1, '154'),
(1262, 43, 2, '154'),
(1262, 42, 2, '480'),
(1262, 42, 1, '480'),
(1258, 59, 1, 'yes'),
(1262, 59, 1, 'yes'),
(1263, 42, 2, '645'),
(1263, 42, 1, '645'),
(1263, 45, 2, '9mm PAK'),
(1263, 45, 1, '9mm PAK'),
(1263, 43, 2, '180'),
(1263, 43, 1, '180'),
(1263, 44, 2, '103'),
(1263, 44, 1, '103'),
(1263, 46, 2, '15'),
(1263, 46, 1, '15'),
(1263, 59, 2, 'Ja - mit pyrotechnischem Abschussbecher'),
(1263, 59, 1, 'yes'),
(1263, 56, 2, 'Ja'),
(1263, 56, 1, 'yes'),
(1263, 58, 2, 'Ja'),
(1263, 58, 1, 'yes'),
(1263, 53, 2, 'Abzugssicherung, Fallsicherung'),
(1263, 53, 1, 'saftey'),
(1264, 56, 2, 'Ja'),
(1264, 53, 1, 'saftey'),
(1264, 53, 2, 'Abzugssicherung, Fallsicherung'),
(1264, 46, 1, '15'),
(1264, 46, 2, '15'),
(1264, 45, 1, '9mm PAK'),
(1264, 45, 2, '9mm PAK'),
(1264, 44, 1, '103'),
(1264, 44, 2, '103'),
(1264, 43, 1, '180'),
(1264, 43, 2, '180'),
(1264, 42, 1, '645'),
(1264, 42, 2, '645'),
(1264, 56, 1, 'yes'),
(1264, 58, 2, 'Ja'),
(1264, 58, 1, 'yes'),
(1264, 59, 2, 'Ja - mit pyrotechnischem Abschussbecher'),
(1264, 59, 1, 'yes'),
(1265, 57, 2, 'Ja'),
(1265, 57, 1, 'yes'),
(1265, 54, 2, 'Ja'),
(1265, 54, 1, 'yes'),
(1265, 42, 2, '885'),
(1265, 42, 1, '885'),
(1265, 45, 2, '9mm PAK'),
(1265, 45, 1, '9mm PAK'),
(1265, 43, 2, '194'),
(1265, 43, 1, '194'),
(1265, 44, 2, '103'),
(1265, 44, 1, '103'),
(1265, 46, 2, '11'),
(1265, 46, 1, '11'),
(1265, 59, 2, 'Ja - mit pyrotechnischem Abschussbecher'),
(1265, 59, 1, 'yes'),
(1265, 56, 2, 'Ja'),
(1265, 56, 1, 'yes'),
(1265, 55, 2, 'Ja'),
(1265, 55, 1, 'yes'),
(1266, 56, 2, 'Ja'),
(1266, 55, 1, 'yes'),
(1266, 55, 2, 'Ja'),
(1266, 54, 1, 'yes'),
(1266, 54, 2, 'Ja'),
(1266, 46, 1, '11'),
(1266, 46, 2, '11'),
(1266, 45, 1, '9mm PAK'),
(1266, 45, 2, '9mm PAK'),
(1266, 44, 1, '103'),
(1266, 44, 2, '103'),
(1266, 43, 1, '194'),
(1266, 43, 2, '194'),
(1266, 42, 1, '885'),
(1266, 42, 2, '885'),
(1266, 56, 1, 'yes'),
(1266, 57, 2, 'Ja'),
(1266, 57, 1, 'yes'),
(1266, 59, 2, 'Ja - mit pyrotechnischem Abschussbecher'),
(1266, 59, 1, 'yes'),
(1267, 42, 2, '960'),
(1267, 42, 1, '960'),
(1267, 45, 2, '9mm PAK'),
(1267, 45, 1, '9mm PAK'),
(1267, 43, 2, '220'),
(1267, 43, 1, '220'),
(1267, 44, 2, '12,5 (5&quot;)'),
(1267, 44, 1, '12,5 (5&quot;)'),
(1267, 46, 2, '9'),
(1267, 46, 1, '9'),
(1267, 59, 2, 'Ja - mit pyrotechnischem Abschussbecher'),
(1267, 59, 1, 'yes'),
(1267, 56, 2, 'Ja'),
(1267, 56, 1, 'yes'),
(1267, 58, 2, 'Ja, funktioniert nur manuell'),
(1267, 58, 1, 'yes'),
(1267, 55, 2, 'Ja'),
(1267, 55, 1, 'yes'),
(1267, 53, 2, 'Abszugssicherung'),
(1267, 53, 1, 'Abzugssicherung'),
(1268, 55, 1, 'yes'),
(1268, 55, 2, 'Ja'),
(1268, 53, 1, 'Abzugssicherung'),
(1268, 53, 2, 'Abszugssicherung'),
(1268, 46, 1, '9'),
(1268, 46, 2, '9'),
(1268, 45, 1, '9mm PAK'),
(1268, 45, 2, '9mm PAK'),
(1268, 44, 1, '12,5 (5&quot;)'),
(1268, 44, 2, '12,5 (5&quot;)'),
(1268, 43, 1, '220'),
(1268, 43, 2, '220'),
(1268, 42, 1, '960'),
(1268, 42, 2, '960'),
(1268, 56, 2, 'Ja'),
(1268, 56, 1, 'yes'),
(1268, 58, 2, 'Ja, funktioniert nur manuell'),
(1268, 58, 1, 'yes'),
(1268, 59, 2, 'Ja - mit pyrotechnischem Abschussbecher'),
(1268, 59, 1, 'yes'),
(1269, 45, 2, '9mm PAK'),
(1270, 45, 1, '9mm PAK'),
(1270, 45, 2, '9mm PAK'),
(1271, 45, 2, '9mm PAK'),
(1272, 45, 1, '9mm PAK'),
(1272, 45, 2, '9mm PAK'),
(1273, 45, 1, '8mm PAK'),
(1273, 45, 2, '8mm PAK'),
(1274, 45, 1, '8mm PAK'),
(1274, 45, 2, '8mm PAK'),
(1275, 45, 2, '6mm Flobert'),
(1276, 45, 2, '9mm Revolver /.380 R Blanc'),
(1277, 45, 1, '9mm Revolver'),
(1277, 45, 2, '9mm Revolver /.380 R Blanc'),
(1276, 45, 1, '9mm Revolver'),
(1275, 45, 1, '6mm Flobert'),
(1278, 45, 1, '9mm Revolver'),
(1278, 45, 2, '9mm Revolver /.380 R Blanc'),
(1279, 45, 1, '9mm Revolver'),
(1279, 45, 2, '9mm Revolver /.380 R Blanc'),
(1271, 45, 1, '9mm PAK'),
(1269, 45, 1, '9mm PAK'),
(1280, 57, 2, 'Ja'),
(1280, 57, 1, 'yes'),
(1280, 54, 2, 'Ja - über Sicherungshebel'),
(1280, 54, 1, 'yes'),
(1280, 42, 2, '800'),
(1280, 42, 1, '800'),
(1280, 45, 2, '9mm PAK'),
(1280, 45, 1, '9mm PAK'),
(1280, 43, 2, '187'),
(1280, 43, 1, '187'),
(1280, 44, 2, '103'),
(1280, 44, 1, '103'),
(1280, 46, 2, '9'),
(1280, 46, 1, '9'),
(1280, 59, 2, 'Ja - mit pyrotechnischem Abschussbecher'),
(1280, 59, 1, 'yes'),
(1280, 56, 2, 'Ja'),
(1280, 56, 1, 'yes'),
(1280, 58, 2, 'Ja'),
(1280, 58, 1, 'yes'),
(1280, 55, 2, 'Ja'),
(1280, 55, 1, 'yes'),
(1280, 53, 2, 'Ja'),
(1280, 53, 1, 'yes'),
(1281, 57, 2, 'Ja'),
(1281, 57, 1, 'yes'),
(1281, 42, 2, '580'),
(1281, 42, 1, '580'),
(1281, 45, 2, '9mm PAK'),
(1281, 45, 1, '9mm PAK'),
(1281, 43, 2, '160'),
(1281, 43, 1, '160'),
(1281, 44, 2, '103'),
(1281, 44, 1, '103'),
(1281, 46, 2, '7'),
(1281, 46, 1, '7'),
(1281, 59, 2, 'Ja - mit pyrotechnischem Abschussbecher'),
(1281, 59, 1, 'yes'),
(1281, 56, 2, 'Ja'),
(1281, 56, 1, 'yes'),
(1281, 55, 2, 'Ja'),
(1281, 55, 1, 'yes'),
(1281, 53, 2, 'Ja'),
(1281, 53, 1, 'yes'),
(1282, 57, 2, 'Ja'),
(1282, 57, 1, 'yes'),
(1282, 53, 1, 'yes'),
(1282, 46, 1, '6'),
(1282, 53, 2, '3 Stufig = Feuern, Entladen und Sichern'),
(1282, 43, 1, '105'),
(1282, 44, 2, '~75'),
(1282, 44, 1, '~75'),
(1282, 45, 2, '6mm Flobert'),
(1282, 45, 1, '6mm Flobert'),
(1282, 46, 2, '6'),
(1282, 43, 2, '105'),
(1282, 42, 2, '335'),
(1282, 42, 1, '335'),
(1283, 59, 2, 'Ja - mit pyrotechnischem Abschussbecher'),
(1283, 57, 2, 'Ja'),
(1283, 57, 1, 'yes'),
(1283, 56, 2, 'Ja'),
(1283, 56, 1, 'yes'),
(1283, 44, 2, '46 (3&quot;)'),
(1283, 44, 1, '46 (3&quot;)'),
(1283, 45, 2, '6mm Flobert'),
(1283, 45, 1, '6mm Flobert'),
(1283, 46, 2, '7'),
(1282, 59, 2, 'Ja - mit pyrotechnischem Abschussbecher'),
(1282, 59, 1, 'yes'),
(1283, 46, 1, '7'),
(1283, 43, 1, '155'),
(1283, 43, 2, '155'),
(1283, 42, 2, '470'),
(1283, 42, 1, '470'),
(1284, 57, 1, 'yes'),
(1284, 59, 2, 'Ja - mit Pyrotechnischem Abschussbecher'),
(1284, 56, 1, 'yes'),
(1284, 57, 2, 'Ja'),
(1284, 44, 1, '46(3&quot;)'),
(1284, 45, 2, '9mm Revolver Knall'),
(1284, 45, 1, '9mm R'),
(1284, 46, 2, '5'),
(1284, 46, 1, '5'),
(1284, 56, 2, 'Ja'),
(1285, 44, 1, '46(3&quot;)'),
(1285, 45, 1, '9mm R'),
(1285, 46, 2, '5'),
(1285, 46, 1, '5'),
(1285, 55, 2, 'Ja'),
(1285, 55, 1, 'yes'),
(1285, 56, 2, 'Ja'),
(1285, 56, 1, 'yes'),
(1285, 57, 2, 'Ja'),
(1285, 45, 2, '9mm Revolver Knall'),
(1285, 44, 2, '46 (3&quot;)'),
(1285, 42, 2, '462'),
(1285, 42, 1, '462'),
(1285, 57, 1, 'yes'),
(1285, 59, 2, 'Ja - mit Pyrotechnischem Abschussbecher'),
(1285, 59, 1, 'yes'),
(1286, 57, 1, 'yes'),
(1286, 59, 2, 'Ja - mit pyrotechnischem Abschussbecher'),
(1286, 44, 2, '65'),
(1286, 44, 1, '65'),
(1286, 46, 2, '6'),
(1286, 46, 1, '6'),
(1286, 56, 2, 'Ja'),
(1286, 56, 1, 'yes'),
(1286, 57, 2, 'Ja'),
(1287, 57, 1, 'yes'),
(1287, 59, 2, 'Ja - mit pyrotechnischem Abschussbecher'),
(1287, 56, 1, 'yes'),
(1287, 57, 2, 'Ja'),
(1287, 46, 1, '6'),
(1287, 56, 2, 'Ja'),
(1287, 44, 1, '65'),
(1287, 46, 2, '6'),
(1287, 42, 1, '658'),
(1287, 43, 2, '185'),
(1287, 43, 1, '185'),
(1287, 44, 2, '65'),
(1286, 43, 1, '185'),
(1286, 43, 2, '185'),
(1286, 42, 2, '658'),
(1286, 42, 1, '658'),
(1288, 43, 1, '155'),
(1288, 44, 2, '46'),
(1288, 44, 1, '46'),
(1288, 45, 2, '9mm R Knall'),
(1288, 45, 1, '9mm R Knall'),
(1288, 46, 2, '5'),
(1288, 46, 1, '5'),
(1288, 42, 2, '480'),
(1288, 42, 1, '480'),
(1288, 43, 2, '155'),
(1284, 44, 2, '46 (3&quot;)'),
(1284, 42, 2, '462'),
(1284, 42, 1, '462'),
(1283, 59, 1, 'yes'),
(1284, 59, 1, 'yes'),
(1287, 42, 2, '658'),
(1286, 59, 1, 'yes'),
(1288, 56, 2, 'Ja'),
(1288, 56, 1, 'yes'),
(1288, 57, 2, 'Ja'),
(1288, 57, 1, 'yes'),
(1288, 59, 2, 'Ja - mit pyrotechnischem Abschussbecher'),
(1288, 59, 1, 'yes'),
(1287, 59, 1, 'yes'),
(1289, 57, 1, 'yes'),
(1289, 57, 2, 'Ja'),
(1289, 56, 1, 'yes'),
(1289, 56, 2, 'Ja'),
(1289, 46, 1, '5'),
(1289, 46, 2, '5'),
(1289, 45, 1, '9mm R Knall'),
(1289, 45, 2, '9mm R Knall'),
(1289, 44, 1, '46'),
(1289, 44, 2, '46'),
(1289, 43, 1, '155'),
(1289, 43, 2, '155'),
(1289, 42, 1, '480'),
(1289, 42, 2, '480'),
(1289, 59, 2, 'Ja - mit pyrotechnischem Abschussbecher'),
(1289, 59, 1, 'yes'),
(1290, 57, 2, 'Ja'),
(1290, 57, 1, 'yes'),
(1290, 56, 2, 'Ja'),
(1290, 56, 1, 'yes'),
(1290, 42, 2, '610'),
(1290, 42, 1, '610'),
(1290, 45, 2, '9mm Revolver Knall'),
(1290, 45, 1, '9mm Revolver Knall'),
(1290, 43, 2, '175'),
(1290, 43, 1, '175'),
(1290, 44, 2, '55'),
(1290, 44, 1, '55'),
(1290, 46, 2, '6'),
(1290, 46, 1, '6'),
(1290, 59, 2, 'Ja - mit pyrotechnischem Abschussbecher'),
(1290, 59, 1, 'yes '),
(1291, 43, 1, '175'),
(1291, 43, 2, '175'),
(1291, 44, 2, '55'),
(1291, 44, 1, '55'),
(1291, 45, 2, '9mm Revolver Knall'),
(1291, 45, 1, '9mm Revolver Knall'),
(1291, 46, 2, '6'),
(1291, 46, 1, '6'),
(1291, 56, 2, 'Ja'),
(1291, 42, 2, '610'),
(1291, 42, 1, '610'),
(1291, 56, 1, 'yes'),
(1291, 57, 2, 'Ja'),
(1291, 57, 1, 'yes'),
(1291, 59, 2, 'Ja - mit pyrotechnischem Abschussbecher'),
(1291, 59, 1, 'yes '),
(1292, 56, 1, 'yes'),
(1292, 56, 2, 'Ja'),
(1292, 53, 1, 'fall safety'),
(1292, 53, 2, 'Fallsicherung'),
(1292, 46, 1, '17'),
(1292, 46, 2, '17'),
(1292, 45, 1, '9mm P.A.K'),
(1292, 45, 2, '9mm P.A.K'),
(1292, 44, 1, '103'),
(1292, 44, 2, '103'),
(1292, 43, 1, '201'),
(1292, 43, 2, '201'),
(1292, 42, 1, '830'),
(1292, 42, 2, '830'),
(1293, 56, 1, 'yes'),
(1293, 56, 2, 'Ja'),
(1293, 53, 1, 'fall safety'),
(1293, 53, 2, 'Fallsicherung'),
(1293, 46, 1, '17'),
(1293, 46, 2, '17'),
(1293, 45, 1, '9mm P.A.K'),
(1293, 45, 2, '9mm P.A.K'),
(1293, 44, 1, '103'),
(1293, 44, 2, '103'),
(1293, 43, 1, '201'),
(1293, 43, 2, '201'),
(1293, 42, 1, '830'),
(1293, 42, 2, '830'),
(1292, 57, 2, 'Ja'),
(1292, 57, 1, 'yes'),
(1292, 58, 2, 'Ja'),
(1292, 58, 1, 'yes'),
(1292, 59, 2, 'Ja - inkl. pyrotechnischem Abschussbecher'),
(1292, 59, 1, 'yes'),
(1293, 57, 2, 'Ja'),
(1293, 57, 1, 'yes'),
(1293, 58, 2, 'Ja'),
(1293, 58, 1, 'yes'),
(1293, 59, 2, 'Ja - inkl. pyrotechnischem Abschussbecher'),
(1293, 59, 1, 'yes'),
(1294, 57, 2, 'Ja'),
(1294, 57, 1, 'yes'),
(1294, 42, 2, '870'),
(1294, 42, 1, '870'),
(1294, 45, 2, '9mm P.A.K.'),
(1294, 45, 1, '9mm P.A.K.'),
(1294, 43, 2, '219'),
(1294, 43, 1, '219'),
(1294, 44, 2, '130 '),
(1294, 44, 1, '130'),
(1294, 46, 2, '18'),
(1294, 46, 1, '18'),
(1294, 59, 2, 'Ja - mit pyrotechnischem Abschussbecher'),
(1294, 59, 1, 'yes'),
(1294, 56, 2, 'Ja'),
(1294, 56, 1, 'yes'),
(1294, 58, 2, 'Ja'),
(1294, 58, 1, 'yes'),
(1294, 53, 2, 'Ja'),
(1294, 53, 1, 'yes'),
(1295, 56, 1, 'yes'),
(1295, 56, 2, 'Ja'),
(1295, 53, 1, 'yes'),
(1295, 53, 2, 'Ja'),
(1295, 46, 1, '18'),
(1295, 46, 2, '18'),
(1295, 45, 1, '9mm P.A.K.'),
(1295, 45, 2, '9mm P.A.K.'),
(1295, 44, 1, '130'),
(1295, 44, 2, '130 '),
(1295, 43, 1, '219'),
(1295, 43, 2, '219'),
(1295, 42, 1, '870'),
(1295, 42, 2, '870'),
(1295, 57, 2, 'Ja'),
(1295, 57, 1, 'yes'),
(1295, 58, 2, 'Ja'),
(1295, 58, 1, 'yes'),
(1295, 59, 2, 'Ja - mit pyrotechnischem Abschussbecher'),
(1295, 59, 1, 'yes'),
(1296, 56, 2, 'Ja'),
(1296, 56, 1, 'yes'),
(1296, 57, 2, 'Ja'),
(1296, 57, 1, 'yes'),
(1296, 42, 2, '700'),
(1296, 42, 1, '700'),
(1296, 45, 2, '9mm P.A.K.'),
(1296, 45, 1, '9mm P.A.K.'),
(1296, 43, 2, '154'),
(1296, 43, 1, '154'),
(1296, 44, 2, '84'),
(1296, 44, 1, '84'),
(1296, 59, 2, 'Ja - mit pyrotechnischem Abschussbecher'),
(1296, 59, 1, 'yes'),
(1296, 58, 2, 'Ja'),
(1296, 58, 1, 'yes'),
(1296, 53, 2, 'Ja'),
(1296, 53, 1, 'yes'),
(1296, 55, 2, 'ja'),
(1296, 55, 1, 'yes'),
(1297, 43, 1, '154'),
(1297, 44, 1, '84'),
(1297, 45, 2, '9mm P.A.K.'),
(1297, 45, 1, '9mm P.A.K.'),
(1297, 53, 2, 'Ja'),
(1297, 53, 1, 'yes'),
(1297, 55, 2, 'ja'),
(1297, 55, 1, 'yes'),
(1297, 56, 2, 'Ja'),
(1297, 56, 1, 'yes'),
(1297, 57, 2, 'Ja'),
(1297, 57, 1, 'yes'),
(1297, 58, 2, 'Ja'),
(1298, 43, 1, '154'),
(1298, 44, 1, '84'),
(1298, 45, 2, '9mm P.A.K.'),
(1298, 45, 1, '9mm P.A.K.'),
(1298, 53, 2, 'Ja'),
(1298, 53, 1, 'yes'),
(1298, 55, 2, 'ja'),
(1298, 55, 1, 'yes'),
(1298, 56, 2, 'Ja'),
(1298, 56, 1, 'yes'),
(1298, 57, 2, 'Ja'),
(1298, 57, 1, 'yes'),
(1298, 58, 2, 'Ja'),
(1297, 44, 2, '84'),
(1297, 43, 2, '154'),
(1297, 42, 2, '700'),
(1297, 42, 1, '700'),
(1297, 58, 1, 'yes'),
(1297, 59, 2, 'Ja - mit pyrotechnischem Abschussbecher'),
(1297, 59, 1, 'yes'),
(1298, 44, 2, '84'),
(1298, 43, 2, '154'),
(1298, 42, 2, '700'),
(1298, 42, 1, '700'),
(1298, 58, 1, 'yes'),
(1298, 59, 2, 'Ja - mit pyrotechnischem Abschussbecher'),
(1298, 59, 1, 'yes'),
(1299, 58, 2, 'Ja'),
(1299, 57, 2, 'Ja'),
(1299, 57, 1, 'yes'),
(1299, 56, 2, 'Ja'),
(1299, 56, 1, 'yes'),
(1299, 44, 1, '110'),
(1299, 45, 2, '9mm P.A.K.'),
(1299, 45, 1, '9mm P.A.K'),
(1299, 46, 2, '18'),
(1299, 46, 1, '18'),
(1299, 53, 2, 'Ja - Abzugssicherung'),
(1299, 53, 1, 'yes'),
(1300, 57, 1, 'yes'),
(1300, 58, 2, 'Ja'),
(1300, 56, 1, 'yes'),
(1300, 57, 2, 'Ja'),
(1300, 53, 1, 'yes'),
(1300, 56, 2, 'Ja'),
(1300, 53, 2, 'Ja - Abzugssicherung'),
(1300, 42, 2, '880'),
(1300, 42, 1, '880'),
(1300, 43, 2, '200'),
(1300, 43, 1, '200'),
(1300, 44, 2, '110'),
(1300, 44, 1, '110'),
(1300, 45, 2, '9mm P.A.K.'),
(1300, 45, 1, '9mm P.A.K'),
(1300, 46, 2, '18'),
(1301, 45, 2, '9mm P.A.K'),
(1301, 45, 1, '9mm P.A.K'),
(1301, 46, 2, '18'),
(1301, 46, 1, '18'),
(1301, 53, 2, 'Ja'),
(1301, 53, 1, 'yes'),
(1301, 56, 2, 'Ja'),
(1301, 42, 2, '840'),
(1301, 42, 1, '840'),
(1301, 43, 2, '200'),
(1301, 43, 1, '200'),
(1301, 44, 2, '110'),
(1301, 44, 1, '110'),
(1299, 44, 2, '110'),
(1299, 43, 1, '200'),
(1299, 42, 2, '880'),
(1299, 42, 1, '880'),
(1299, 43, 2, '200'),
(1300, 58, 1, 'yes'),
(1300, 59, 2, 'Ja - mit pyrotechnischem Abschussbecher'),
(1300, 46, 1, '18'),
(1302, 43, 1, '200'),
(1302, 44, 1, '110'),
(1302, 45, 2, '9mm P.A.K'),
(1302, 45, 1, '9mm P.A.K'),
(1302, 46, 2, '18'),
(1302, 46, 1, '18'),
(1302, 53, 2, 'Ja'),
(1302, 53, 1, 'yes'),
(1302, 56, 2, 'Ja'),
(1302, 56, 1, 'yes'),
(1302, 57, 2, 'Ja'),
(1302, 57, 1, 'yes'),
(1302, 44, 2, '110'),
(1302, 43, 2, '200'),
(1302, 42, 2, '840'),
(1302, 42, 1, '840'),
(1303, 57, 2, 'Ja'),
(1303, 57, 1, 'yes'),
(1303, 42, 2, '820'),
(1303, 42, 1, '820'),
(1303, 45, 2, '9mm P.A.K'),
(1303, 45, 1, '9mm P.A.K.'),
(1303, 43, 2, '202'),
(1303, 43, 1, '202'),
(1303, 46, 2, '16 / 25'),
(1303, 46, 1, '16 /25'),
(1303, 59, 2, 'Ja - mit pyrotechnischem Abschussbecher'),
(1303, 59, 1, 'yes'),
(1303, 56, 2, 'Ja'),
(1303, 56, 1, 'yes'),
(1303, 58, 2, 'Ja'),
(1303, 58, 1, 'yes'),
(1303, 53, 2, 'Ja'),
(1303, 53, 1, 'yes'),
(1299, 58, 1, 'yes'),
(1299, 59, 2, 'Ja - mit pyrotechnischem Abschussbecher'),
(1299, 59, 1, 'yes'),
(1300, 59, 1, 'yes'),
(1301, 56, 1, 'yes'),
(1301, 57, 2, 'Ja'),
(1301, 57, 1, 'yes'),
(1301, 58, 2, 'Ja'),
(1301, 58, 1, 'yes'),
(1301, 59, 2, 'Ja - mit pyrotechnischem Abschussbecher'),
(1301, 59, 1, 'yes'),
(1302, 58, 2, 'Ja'),
(1302, 58, 1, 'yes'),
(1302, 59, 2, 'Ja - mit pyrotechnischem Abschussbecher'),
(1302, 59, 1, 'yes'),
(1304, 45, 2, '9mm P.A.K'),
(1304, 43, 1, '202'),
(1304, 45, 1, '9mm P.A.K.'),
(1304, 46, 2, '16 / 25'),
(1304, 46, 1, '16 /25'),
(1304, 53, 2, 'Ja'),
(1304, 53, 1, 'yes'),
(1304, 56, 2, 'Ja'),
(1304, 56, 1, 'yes'),
(1304, 57, 2, 'Ja'),
(1304, 43, 2, '202'),
(1304, 42, 2, '820'),
(1304, 42, 1, '820'),
(1305, 42, 2, '465'),
(1305, 42, 1, '465'),
(1305, 45, 2, '9mm P.A.K.'),
(1305, 45, 1, '9mm P.A.K.'),
(1305, 43, 2, '143'),
(1305, 43, 1, '143'),
(1305, 44, 2, '75'),
(1305, 44, 1, '75'),
(1305, 46, 2, '6'),
(1305, 46, 1, '6'),
(1305, 59, 2, 'Ja - mit pyrotechnischem Abschussbecher'),
(1305, 59, 1, 'yes'),
(1305, 56, 2, 'Ja'),
(1305, 56, 1, 'yes'),
(1305, 58, 2, 'Ja'),
(1305, 58, 1, 'yes'),
(1305, 53, 2, 'Ja'),
(1305, 53, 1, 'yes'),
(1305, 55, 2, 'Ja'),
(1305, 55, 1, 'yes'),
(1306, 56, 2, 'Ja'),
(1306, 55, 1, 'yes'),
(1306, 55, 2, 'Ja'),
(1306, 53, 1, 'yes'),
(1306, 53, 2, 'Ja'),
(1306, 46, 1, '6'),
(1306, 46, 2, '6'),
(1306, 45, 1, '9mm P.A.K.'),
(1306, 45, 2, '9mm P.A.K.'),
(1306, 44, 1, '75'),
(1306, 44, 2, '75'),
(1306, 43, 1, '143'),
(1306, 43, 2, '143'),
(1306, 42, 1, '465'),
(1306, 42, 2, '465'),
(1306, 56, 1, 'yes'),
(1306, 58, 2, 'Ja'),
(1306, 58, 1, 'yes'),
(1306, 59, 2, 'Ja - mit pyrotechnischem Abschussbecher'),
(1306, 59, 1, 'yes'),
(1307, 57, 2, 'Ja'),
(1307, 57, 1, 'yes'),
(1307, 42, 2, '710'),
(1307, 42, 1, '710'),
(1307, 45, 2, '9mm Revolver Knall'),
(1307, 45, 1, '9mm Revolver Knall'),
(1307, 43, 2, '180'),
(1307, 43, 1, '180'),
(1307, 44, 2, '64 (2,5&quot;)\r\n'),
(1307, 44, 1, '64 (2,5&quot;)'),
(1307, 46, 2, '6'),
(1307, 46, 1, '6'),
(1307, 59, 2, 'Ja - mit pyrotechnischem Abschussbecher'),
(1307, 59, 1, 'yes'),
(1307, 56, 2, 'Ja'),
(1307, 56, 1, 'yes'),
(1308, 56, 2, 'Ja'),
(1308, 46, 1, '6'),
(1308, 46, 2, '6'),
(1308, 45, 1, '9mm Revolver Knall'),
(1308, 45, 2, '9mm Revolver Knall'),
(1308, 44, 1, '115 (4,5&quot;)'),
(1308, 44, 2, '115 (4,5&quot;)\r\n'),
(1308, 43, 1, '240'),
(1308, 43, 2, '240'),
(1308, 42, 1, '800'),
(1308, 42, 2, '800'),
(1308, 56, 1, 'yes'),
(1308, 57, 2, 'Ja'),
(1308, 57, 1, 'yes'),
(1308, 59, 2, 'Ja - mit pyrotechnischem Abschussbecher'),
(1308, 59, 1, 'yes'),
(1309, 44, 2, '152 (6&quot;)\r\n'),
(1309, 43, 1, '275'),
(1309, 44, 1, '152 (6&quot;)'),
(1309, 45, 2, '9mm Revolver Knall'),
(1309, 45, 1, '9mm Revolver Knall'),
(1309, 46, 2, '6'),
(1309, 46, 1, '6'),
(1309, 56, 2, 'Ja'),
(1309, 56, 1, 'yes'),
(1309, 43, 2, '275'),
(1309, 42, 2, '900'),
(1309, 42, 1, '900'),
(1304, 57, 1, 'yes'),
(1304, 58, 2, 'Ja'),
(1304, 58, 1, 'yes'),
(1304, 59, 2, 'Ja - mit pyrotechnischem Abschussbecher'),
(1304, 59, 1, 'yes'),
(1310, 56, 1, 'yes'),
(1310, 56, 2, 'Ja'),
(1310, 46, 1, '6'),
(1310, 46, 2, '6'),
(1310, 45, 1, '9mm Revolver Knall'),
(1310, 45, 2, '9mm Revolver Knall'),
(1310, 44, 1, '115 (4,5&quot;)'),
(1310, 44, 2, '115 (4,5&quot;)\r\n'),
(1310, 43, 1, '240'),
(1310, 43, 2, '240'),
(1310, 42, 1, '800'),
(1310, 42, 2, '800'),
(1311, 56, 1, 'yes'),
(1311, 56, 2, 'Ja'),
(1311, 46, 1, '6'),
(1311, 46, 2, '6'),
(1311, 45, 1, '9mm Revolver Knall'),
(1311, 45, 2, '9mm Revolver Knall'),
(1311, 44, 1, '115 (4,5&quot;)'),
(1311, 44, 2, '115 (4,5&quot;)\r\n'),
(1311, 43, 1, '240'),
(1311, 43, 2, '240'),
(1311, 42, 1, '800'),
(1311, 42, 2, '800'),
(1310, 57, 2, 'Ja'),
(1310, 57, 1, 'yes'),
(1310, 59, 2, 'Ja - mit pyrotechnischem Abschussbecher'),
(1310, 59, 1, 'yes'),
(1311, 57, 2, 'Ja'),
(1311, 57, 1, 'yes'),
(1311, 59, 2, 'Ja - mit pyrotechnischem Abschussbecher'),
(1311, 59, 1, 'yes'),
(1312, 43, 1, '275'),
(1312, 44, 1, '152 (6&quot;)'),
(1312, 45, 2, '9mm Revolver Knall'),
(1312, 45, 1, '9mm Revolver Knall'),
(1312, 46, 2, '6'),
(1312, 46, 1, '6'),
(1312, 56, 2, 'Ja'),
(1312, 56, 1, 'yes'),
(1312, 57, 2, 'Ja'),
(1312, 57, 1, 'yes'),
(1312, 44, 2, '152 (6&quot;)\r\n'),
(1312, 43, 2, '275'),
(1312, 42, 2, '900'),
(1312, 42, 1, '900'),
(1313, 57, 2, 'Ja'),
(1313, 57, 1, 'yes'),
(1313, 42, 2, '685'),
(1313, 42, 1, '685'),
(1313, 45, 2, '9mm Revolver Knall'),
(1313, 45, 1, '9mm Revolver Knall'),
(1313, 43, 2, '165'),
(1313, 43, 1, '165'),
(1313, 44, 2, '50 (2&quot;)'),
(1313, 44, 1, '50 (2&quot;)'),
(1313, 46, 2, '6'),
(1313, 46, 1, '6'),
(1313, 59, 2, 'Ja - mit pyrotechnischem Abschussbecher'),
(1313, 59, 1, 'yes'),
(1313, 56, 2, 'Ja'),
(1313, 56, 1, 'yes'),
(1314, 44, 2, '50 (2&quot;)'),
(1314, 44, 1, '50 (2&quot;)'),
(1314, 45, 2, '9mm Revolver Knall'),
(1314, 45, 1, '9mm Revolver Knall'),
(1314, 46, 2, '6'),
(1314, 46, 1, '6'),
(1314, 56, 2, 'Ja'),
(1314, 56, 1, 'yes'),
(1314, 57, 2, 'Ja'),
(1314, 57, 1, 'yes'),
(1314, 59, 2, 'Ja - mit pyrotechnischem Abschussbecher'),
(1314, 43, 1, '165'),
(1314, 43, 2, '165'),
(1314, 42, 2, '685'),
(1314, 42, 1, '685'),
(1314, 59, 1, 'yes'),
(1312, 59, 2, 'Ja - mit pyrotechnischem Abschussbecher'),
(1312, 59, 1, 'yes'),
(1309, 57, 2, 'Ja'),
(1309, 57, 1, 'yes'),
(1309, 59, 2, 'Ja - mit pyrotechnischem Abschussbecher'),
(1309, 59, 1, 'yes'),
(1315, 44, 2, '48'),
(1315, 44, 1, '48'),
(1315, 46, 2, '5'),
(1315, 46, 1, '5'),
(1315, 56, 2, 'Ja'),
(1315, 56, 1, 'yes'),
(1315, 42, 2, '520'),
(1315, 42, 1, '520'),
(1315, 43, 2, '155'),
(1315, 43, 1, '155'),
(1316, 43, 2, '155'),
(1316, 43, 1, '155'),
(1316, 44, 2, '48'),
(1316, 44, 1, '48'),
(1316, 46, 2, '5'),
(1316, 46, 1, '5'),
(1316, 56, 2, 'Ja'),
(1316, 56, 1, 'yes'),
(1316, 57, 2, 'Ja'),
(1316, 42, 2, '520'),
(1316, 42, 1, '520'),
(1317, 57, 2, 'Ja'),
(1317, 57, 1, 'yes'),
(1317, 42, 2, '277'),
(1317, 42, 1, '277'),
(1317, 45, 2, '9mm Revolver Knall'),
(1317, 45, 1, '9mm Revolver Knall'),
(1317, 43, 2, '160'),
(1317, 43, 1, '160'),
(1317, 44, 2, '48'),
(1317, 44, 1, '48'),
(1317, 46, 2, '5'),
(1317, 46, 1, '5'),
(1317, 59, 2, 'Ja - mit pyrotechnischem Abschussbecher und Gewindeschoner'),
(1317, 59, 1, 'ja'),
(1317, 56, 2, ''),
(1317, 56, 1, ''),
(1315, 57, 2, 'Ja'),
(1315, 57, 1, 'yes'),
(1315, 59, 2, 'Ja - mit pyrotechnischem Abschussbecher und Gewindeschoner'),
(1315, 59, 1, 'yes'),
(1316, 57, 1, 'yes'),
(1316, 59, 2, 'Ja - mit pyrotechnischem Abschussbecher und Gewindeschoner'),
(1316, 59, 1, 'yes');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `oc_product_description`
--

DROP TABLE IF EXISTS `oc_product_description`;
CREATE TABLE `oc_product_description` (
  `product_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `tag` text NOT NULL,
  `meta_title` varchar(255) NOT NULL,
  `meta_description` varchar(255) NOT NULL,
  `meta_keyword` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `oc_product_description`
--

INSERT INTO `oc_product_description` (`product_id`, `language_id`, `name`, `description`, `tag`, `meta_title`, `meta_description`, `meta_keyword`) VALUES
(1251, 2, 'Glock 17 Gen 5 First Edition', '&lt;p&gt;In der \r\nlimitierten „First Edition“ wird die GLOCK 17 Gen5 9 mm P.A.K. im \r\noriginalen GLOCK-Koffer und inklusive vier zusätzlicher, originaler \r\nGriffrücken (Größen M &amp;amp; L, jeweils mit und ohne Beavertail) \r\nausgeliefert.&lt;/p&gt;&lt;div class=&quot;visible-md visible-lg&quot;&gt;&lt;div class=&quot;ux-text-descr&quot;&gt;&lt;p&gt;Den mattschwarzen Schlitten zieren die originalen \r\nMarkings und eine austauschbare Visierung. Direkt erkennbar auch die \r\nwechselbare Slide Cover Plate im Originalmaß – abnehmen, modifizieren \r\noder gegen Plates vom Zubehörmarkt tauschen. Innen warten Features wie \r\nder vierkantige Schlagbolzen und der verstärkte Stahl-Stoßboden auf \r\nechte GLOCK-Fans. Für ein realistisches Schussverhalten setzt sie auf \r\nein optimiertes Verschlussfederpaket aus einer Haupt-, einer Tenderfeder\r\n und einem Gummipuffer. Direkt unterhalb lässt die Picatinny-Schiene die\r\n Montage von gängigem Zubehör zu. &lt;/p&gt;&lt;p&gt;Gen5-typisch bietet auch die \r\nSchreckschuss-GLOCK einen geweiteten Magazinschacht und Front \r\nSerrations. Zusammen mit dem umsetzbaren Magazinhalter und dem \r\nbeidseitigen Schlittenfanghebel garantiert sie eine schnelle Action und \r\neinen sauberen Magazinwechsel in beidseitiger Bedienung. Das Magazin \r\nselbst ist wie beim Original 17-schüssig und setzt auf einen gut \r\nerkennbaren, orangefarbenen Follower. Zusätzlich stahlverstärkt und mit \r\neiner Ladestandanzeige ab dem vierten Schuss lässt es keine Wünsche \r\noffen.&lt;/p&gt;&lt;p&gt;In den Abmessungen hält sich die GLOCK 17 Gen5 9 mm P.A.K. \r\nso exakt an ihr Vorbild, dass sie ein Tragen in allen gängigen Holstern \r\nzulässt und auch originales Zubehör an der Aufnahme am Griffrücken \r\nakzeptiert.&lt;/p&gt;&lt;/div&gt;&lt;/div&gt;&lt;p&gt;&lt;br&gt;&lt;/p&gt;', 'Schreckschusspistole, authentisch, 9mm, limitiert', '311.02.01 - Glock 17 Gen 5 First Edition', 'Schreckschuss Glock 17 Gen5 First Edition black', 'Gasi Schreckschuss Glock 17 Gen 5 First Edition'),
(1252, 2, 'Heckler&amp; Koch P30 black', '&lt;p&gt;&quot;Sicherheit mit System&quot; - so umschreibt Heckler &amp;amp; Koch ihr Modell \r\nP30. Eine moderne Polizeipistole, deren Anspruch an Sicherheit und \r\nFunktionalität hoch ist. &lt;/p&gt;&lt;p&gt;Das modular gestaltete Griffstück ist unter der\r\n Maßgabe der möglichst schnellen Zielerfassung konstruiert worden. &lt;/p&gt;&lt;p&gt;Der \r\nNachbau im Kaliber 9 mm P.A.K. ist eine exakte Replika dieser \r\nSelbstladepistole mit einer Magazinkapazität von 15 Schuss sowie \r\nfunktionierenden Bedienelementen wie Entspanndrücker und \r\nSchlittenfanghebel.&lt;/p&gt;&lt;p&gt;&lt;br&gt;&lt;/p&gt;&lt;p&gt;Lieferumfang: Waffe, Bedienungsanleitung, Abschussbecher, Reinigungsbürste und Koffer&lt;br&gt;&lt;/p&gt;', 'Schreckschusspistole, authentisch, 9mm, ', 'Heckler&amp; Koch P30 black', 'Heckler &amp; Koch P30 black Schreckschusswaffe 9mm PAK', 'Gasi Schreckschusspistole Heckler &amp; Koch P30'),
(1252, 1, 'Heckler&amp; Koch P30 black', '', '', 'Heckler&amp; Koch P30 black', '', ''),
(1251, 1, '311.02.01 - Glock 17 Gen 5 First Edition', '', '', '311.02.01 - Glock 17 Gen 5 First Edition', '', ''),
(1253, 2, 'Zoraki 917 black', '&lt;p&gt;Die Zoraki 917 im Kal. 9mm P.A. aus dem Haus Atak Arms überzeugt wie \r\nauch die anderen Zoraki Modelle mit ihrer Zuverlässigkeit und soliden \r\nVerarbeitung. &lt;/p&gt;&lt;p&gt;Das Magazin hat eine Kapazität von 17 Schuss, die \r\nSchreckschusspistole hat ein Gesamtgewicht von ca. 830g. &lt;/p&gt;&lt;p&gt;Im Lieferumfang\r\n enthalten ist der entsprechende Signalbecher zum Verschießen von \r\nSignalmunition, eine Reinigungsbürste und ein Kunststoffkoffer.&lt;br&gt;&lt;/p&gt;', 'Schreckschusswaffe, 9mm, ', 'Zoraki 917 9mm PAK black', 'Zoraki 917 9mm PAK', 'Zoraki 917 black '),
(1253, 1, 'Zoraki 917 9mm PAK black', '', '', 'Zoraki 917 9mm PAK black', '', ''),
(1254, 2, 'Walther P99 black', '&lt;p&gt;Ihr berühmtester Fan ist Geheimagent Ihrer Majestät und verlässt sich \r\nbei seinen Filmabenteuern stets auf &quot;seine&quot; Walther P99. &lt;/p&gt;&lt;p&gt;Polizei und \r\nMilitär weltweit verwenden die Walther P99 - eine der modernsten und \r\ninnovativsten Faustfeuerwaffen der heutigen Zeit. &lt;/p&gt;&lt;p&gt;Die Walther P99 \r\nverfügt über ein robustes Polymer-Griffstück und ein 15-schüssiges \r\nzweireihiges Magazin. &lt;/p&gt;&lt;p&gt;Höchster Bedienkomfort sowie größtmögliche \r\nSicherheit durch den Entspanndrücker und trotzdem schnelle \r\nFeuerbereitschaft faszinieren die Waffenkenner weltweit.&lt;/p&gt;&lt;p&gt;&lt;br&gt;&lt;/p&gt;&lt;p&gt;&lt;br&gt;&lt;/p&gt;&lt;p&gt;&lt;br&gt;&lt;/p&gt;&lt;p&gt;Zubehör: Bedienungsanleitung, Reinigungsbürste, Abschussbecher und Koffer&lt;br&gt;&lt;/p&gt;', 'Schreckschusswaffe, 9mm, authentisch', 'Walther P99 9mm PAK black', 'Walther P99 9mm PAK', 'Walther 9mm PAK black Gasi Schreckschusswaffe'),
(1255, 2, 'Walther P99 bicolor', '&lt;p&gt;Ihr berühmtester Fan ist Geheimagent Ihrer Majestät und verlässt sich \r\nbei seinen Filmabenteuern stets auf &quot;seine&quot; Walther P99. &lt;/p&gt;&lt;p&gt;Polizei und \r\nMilitär weltweit verwenden die Walther P99 - eine der modernsten und \r\ninnovativsten Faustfeuerwaffen der heutigen Zeit. &lt;/p&gt;&lt;p&gt;Die Walther P99 \r\nverfügt über ein robustes Polymer-Griffstück und ein 15-schüssiges \r\nzweireihiges Magazin. &lt;/p&gt;&lt;p&gt;Höchster Bedienkomfort sowie größtmögliche \r\nSicherheit durch den Entspanndrücker und trotzdem schnelle \r\nFeuerbereitschaft faszinieren die Waffenkenner weltweit.&lt;/p&gt;&lt;p&gt;&lt;br&gt;&lt;/p&gt;&lt;p&gt;Zubehör: Bedienungsanleitung, Reinigungsbürste, Abschussbecher und Koffer&lt;br&gt;&lt;/p&gt;', 'Schreckschusswaffe, 9mm, authentisch', 'Walther P99 9mm PAK bicolor', 'Walther P99 9mm PAK', 'Walther 9mm PAK black Gasi Schreckschusswaffe'),
(1256, 2, 'Walther P99 rot', '&lt;p&gt;Ihr berühmtester Fan ist Geheimagent Ihrer Majestät und verlässt sich \r\nbei seinen Filmabenteuern stets auf &quot;seine&quot; Walther P99. &lt;/p&gt;&lt;p&gt;Polizei und \r\nMilitär weltweit verwenden die Walther P99 - eine der modernsten und \r\ninnovativsten Faustfeuerwaffen der heutigen Zeit. &lt;/p&gt;&lt;p&gt;Die Walther P99 \r\nverfügt über ein robustes Polymer-Griffstück und ein 15-schüssiges \r\nzweireihiges Magazin. &lt;/p&gt;&lt;p&gt;Höchster Bedienkomfort sowie größtmögliche \r\nSicherheit durch den Entspanndrücker und trotzdem schnelle \r\nFeuerbereitschaft faszinieren die Waffenkenner weltweit.&lt;/p&gt;&lt;p&gt;&lt;br&gt;&lt;/p&gt;&lt;p&gt;&lt;br&gt;&lt;/p&gt;&lt;p&gt;&lt;br&gt;&lt;/p&gt;&lt;p&gt;Zubehör: Bedienungsanleitung, Reinigungsbürste, Abschussbecher und Koffer&lt;br&gt;&lt;/p&gt;', 'Schreckschusswaffe, 9mm, authentisch, limitiert', 'Walther P99 9mm PAKrot', 'Walther P99 9mm PAK', 'Walther 9mm PAK black Gasi Schreckschusswaffe'),
(1257, 1, 'Walther P22  black', '', '', 'Walther P22  black', '', ''),
(1257, 2, 'Walther P22 black', '&lt;p&gt;Viel Feuerkraft, wenig Gewicht - dies charakterisiert die Walther P22. \r\n&lt;/p&gt;&lt;p&gt;Bei dieser kompakten Waffe liegt der Hahn außen, die Sicherung ist \r\nbeidseitig bedienbar. &lt;/p&gt;&lt;p&gt;Das profilierte Griffstück und die extra griffige \r\nDurchladeriffelung im vorderen und hinteren Bereich des Schlittens \r\ngarantieren den festen Griff und einen stabilen Anschlag.&lt;/p&gt;&lt;p&gt;&lt;br&gt;&lt;/p&gt;&lt;p&gt;Zubehör: Bedienungsanleitung, Abschussbecher, Reinigungsbürste und Koffer&lt;br&gt;&lt;/p&gt;', 'Schreckschusspistole, authentisch, 9mm,', 'Walther P22 black', 'Walther P22 black mit 9mm Knallpatronen', 'Walther P22 black 9mm PAK Gasi'),
(1255, 1, 'Walther P99 9mm PAK bicolor', '', '', 'Walther P99 9mm PAK bicolor', '', ''),
(1254, 1, 'Walther P99 9mm PAK black', '', '', 'Walther P99 9mm PAK black', '', ''),
(1256, 1, 'Walther P99 9mm PAK rot', '', '', 'Walther P99 9mm PAK rot', '', ''),
(1258, 2, 'Walther P22 bicolor', '&lt;p&gt;Viel Feuerkraft, wenig Gewicht - dies charakterisiert die Walther P22. \r\n&lt;/p&gt;&lt;p&gt;Bei dieser kompakten Waffe liegt der Hahn außen, die Sicherung ist \r\nbeidseitig bedienbar. &lt;/p&gt;&lt;p&gt;Das profilierte Griffstück und die extra griffige \r\nDurchladeriffelung im vorderen und hinteren Bereich des Schlittens \r\ngarantieren den festen Griff und einen stabilen Anschlag.&lt;/p&gt;&lt;p&gt;&lt;br&gt;&lt;/p&gt;&lt;p&gt;Zubehör: Bedienungsanleitung, Abschussbecher, Reinigungsbürste und Koffer&lt;br&gt;&lt;/p&gt;', 'Schreckschusspistole, authentisch, 9mm,', 'Walther P22 bicolor', 'Walther P22 bicolor mit 9mm Knallpatronen', 'Walther P22 bicolor9mm PAK Gasi'),
(1258, 1, 'Walther P22  black', '', '', 'Walther P22  black', '', ''),
(1259, 2, 'Walther P22Q black Set &quot;R2D&quot;', '&lt;p&gt;„Ready 2 defend“, bereit zum Abwehren, so heißt dieses Umarex-Kit rund \r\num die Walther P22Q im Kaliber 9 mm P.A.K.. &lt;/p&gt;&lt;p&gt;Der stabile Kunststoffkoffer\r\n enthält eine sorgfältig zusammengestellte Auswahl hochwertiger \r\nWalther-Produkte zur Selbstverteidigung. &lt;/p&gt;&lt;br&gt;&lt;p&gt;&lt;br&gt;&lt;/p&gt;&lt;p&gt;Lieferumfang:&lt;/p&gt;&lt;p&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp; - Schreckschusspistole Walther P22Q black 9mm PAK&lt;/p&gt;&lt;p&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp; - hochwertiger Koffer&lt;/p&gt;&lt;p&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp; - BlackTac Messer&lt;/p&gt;&lt;p&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp; - Walther Taschenlampe LD50&lt;/p&gt;&lt;p&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp; - Walther Pfefferjet 53ml&lt;/p&gt;&lt;p&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp; - Bedienungsanleitung(en), Abschussbecher, Reinigungsbürste&lt;/p&gt;&lt;p&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp; - Messertasche&lt;/p&gt;&lt;p&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp; - Taschenlampe Tasche, Fangriemenöse&lt;br&gt;&lt;/p&gt;', 'Schreckschusspistole, authentisch, 9mm, Sicherheit', 'Walther P22Q black Set &quot;R2D&quot;', 'Walther P22Q black Set Ready 2 Defense', 'Walther P22Q black Set Ready 2 Defense'),
(1259, 1, 'Walther P22Q black Set &quot;R2D&quot;', '', '', 'Walther P22Q black Set &quot;R2D&quot;', '', ''),
(1260, 2, 'Walther P22Q black ', '&lt;p&gt;Walther P22 Quick Defense – das versteckt sich hinter dem Namen der \r\nP22Q. Das Original ist die konsequente Weiterentwicklung einer der \r\nerfolgreichsten Kleinkaliberwaffen weltweit – der Walther P22. Mit dem \r\nUpdate behält Walther die bewährten Features bei und spendiert der P22 \r\nneben dem verbesserten Demontagebügel eine moderne Optik. Vielfach \r\nbewährt hat sich das ergonomische Polymer-Griffstück mit \r\nHi-Grip-Oberfläche. Das Schreckschuss-Modell verfügt über die gleichen \r\nFeatures.&lt;/p&gt;&lt;p&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp; &lt;/p&gt;&lt;p&gt;Zubehör: Koffer, Bedienungsanleitung, Reingungsbürste und Abschussbecher&lt;br&gt;&lt;/p&gt;', 'Schreckschusspistole, authentisch, 9mm, Sicherheit', 'Walther P22Q black ', 'Walther P22Q black Set Ready 2 Defense', 'Walther P22Q black Set Ready 2 Defense'),
(1260, 1, 'Walther P22Q black ', '', '', 'Walther P22Q black ', '', ''),
(1261, 1, 'Walther P22Q black ', '', '', 'Walther P22Q black ', '', ''),
(1261, 2, 'Walther P22Q blue Star', '&lt;p&gt;Walther P22 Quick Defense – das versteckt sich hinter dem Namen der \r\nP22Q. Das Original ist die konsequente Weiterentwicklung einer der \r\nerfolgreichsten Kleinkaliberwaffen weltweit – der Walther P22. Mit dem \r\nUpdate behält Walther die bewährten Features bei und spendiert der P22 \r\nneben dem verbesserten Demontagebügel eine moderne Optik. Vielfach \r\nbewährt hat sich das ergonomische Polymer-Griffstück mit \r\nHi-Grip-Oberfläche. Das Schreckschuss-Modell verfügt über die gleichen \r\nFeatures.&lt;/p&gt;&lt;p&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp; &lt;/p&gt;&lt;p&gt;Zubehör: Koffer, Bedienungsanleitung, Reingungsbürste und Abschussbecher&lt;br&gt;&lt;/p&gt;', 'Schreckschusspistole, authentisch, 9mm, limitiert', 'Walther P22Q blue Star', 'Walther P22Q black Blue Star', 'Walther P22Q  Blue Star'),
(1262, 1, 'Walther P22Q black ', '', '', 'Walther P22Q black ', '', ''),
(1262, 2, 'Walther P22Q Mintos', '&lt;p&gt;Walther P22 Quick Defense – das versteckt sich hinter dem Namen der \r\nP22Q. Das Original ist die konsequente Weiterentwicklung einer der \r\nerfolgreichsten Kleinkaliberwaffen weltweit – der Walther P22. Mit dem \r\nUpdate behält Walther die bewährten Features bei und spendiert der P22 \r\nneben dem verbesserten Demontagebügel eine moderne Optik. Vielfach \r\nbewährt hat sich das ergonomische Polymer-Griffstück mit \r\nHi-Grip-Oberfläche. Das Schreckschuss-Modell verfügt über die gleichen \r\nFeatures.&lt;/p&gt;&lt;p&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp; &lt;/p&gt;&lt;p&gt;Zubehör: Koffer, Bedienungsanleitung, Reingungsbürste und Abschussbecher&lt;br&gt;&lt;/p&gt;', 'Schreckschusspistole, authentisch, 9mm, limitiert', 'Walther P22Q Mintos', 'Walther P22Q Mintos', 'Walther P22Q  Mintos'),
(1263, 2, 'Walther PPQ black', '&lt;p&gt;Ursprünglich\r\n konzipiert und konstruiert für Spezialeinheiten, hat die Walther PPQ \r\nlängst auch den zivilen Markt erobert. &lt;/p&gt;&lt;p&gt;Die ausgefeilte Griff-Ergonomie \r\nin Verbindung mit der rutsch-sicheren Hi-Grip™ Oberflächenstruktur sowie\r\n die außergewöhnliche Abzugscharakteristik prädestinieren die Walther \r\nPPQ nicht nur für den professionellen Einsatz bei Behörden, sondern \r\nbegeistern auch Sportschützen.&lt;/p&gt;&lt;div class=&quot;visible-md visible-lg&quot;&gt;&lt;div class=&quot;ux-text-descr&quot;&gt;&lt;p&gt;Mit dem Modell PPQ M2 bietet\r\n Walther nun auch eine Variante mit seitlichem Magazinknopf. Die \r\nGas-Signal-Ausführung der Walther PPQ M2 überzeugt mit der gleichen \r\nHaptik und Handhabung wie das Original. Ausführung: brüniert, \r\nKunststoffgriffschalen.&lt;/p&gt;&lt;/div&gt;&lt;/div&gt;&lt;p&gt;&lt;br&gt;&lt;/p&gt;&lt;p&gt;Zubehör: Koffer, Bedienungsanleitung, Reinigungsbürste und Abschussbecher&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&lt;br&gt;&lt;/p&gt;', 'Schreckschusswaffe, 9mm, authentisch', 'Walther PPQ black', 'Walther PPQ black im Kal. 9mm PAK von Umarex', 'Walther PPQ black 9mm PAK'),
(1263, 1, 'Walther PPQ black', '', '', 'Walther PPQ black', '', ''),
(1264, 2, 'Walther PPQ M2 Navy Kit', '&lt;p&gt;Ursprünglich\r\n konzipiert und konstruiert für Spezialeinheiten, hat die Walther PPQ \r\nlängst auch den zivilen Markt erobert. &lt;/p&gt;&lt;p&gt;Die ausgefeilte Griff-Ergonomie \r\nin Verbindung mit der rutsch-sicheren Hi-Grip™ Oberflächenstruktur sowie\r\n die außergewöhnliche Abzugscharakteristik prädestinieren die Walther \r\nPPQ nicht nur für den professionellen Einsatz bei Behörden, sondern \r\nbegeistern auch Sportschützen.&lt;/p&gt;&lt;div class=&quot;visible-md visible-lg&quot;&gt;&lt;div class=&quot;ux-text-descr&quot;&gt;&lt;p&gt;Mit dem Modell PPQ M2 bietet\r\n Walther nun auch eine Variante mit seitlichem Magazinknopf. Die \r\nGas-Signal-Ausführung der Walther PPQ M2 überzeugt mit der gleichen \r\nHaptik und Handhabung wie das Original. Ausführung: brüniert, \r\nKunststoffgriffschalen.&lt;/p&gt;&lt;/div&gt;&lt;/div&gt;&lt;p&gt;&lt;br&gt;&lt;/p&gt;&lt;p&gt;Zubehör: Koffer, Bedienungsanleitung, Reinigungsbürste und Abschussbecher&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&lt;br&gt;&lt;/p&gt;', 'Schreckschusswaffe, 9mm, authentisch', 'Walther PPQ M2 Navy Kit', 'Walther PPQ Navy Kit  im Kal. 9mm PAK von Umarex', 'Walther PPQ Navy 9mm PAK'),
(1264, 1, 'Walther PPQ M2 Navy Kit', '', '', 'Walther PPQ M2 Navy Kit', '', ''),
(1265, 2, 'Browning GPDA 9 black', '&lt;p&gt;Eine legendäre Konstruktion des genialen \r\nJohn Moses Browning, der seiner Zeit stets einen Schritt voraus war. \r\n&lt;/p&gt;&lt;p&gt;Schon mit dem Vorgängermodell bewies Browning seine Innovationskraft. \r\nBis heute vertrauen Militärs und Spezialeinheiten auf der ganzen Welt \r\ndieser robusten und wegweisenden Konstruktion. &lt;/p&gt;&lt;p&gt;Wie es sich für eine \r\nlegendäre Browning gehört, ist die GPDA 9 natürlich aufwändig \r\nausgestattet: Wir haben sie mit einem Spannabzug optimiert und ihr neben\r\n dem funktionierenden Schlittenfanghebel noch einen beidseitig \r\nbedienbaren Entspannhebel spendiert.&lt;/p&gt;&lt;div class=&quot;ux-text-descr&quot;&gt;&lt;p&gt;Browning GPDA 9 - Die Gas-Signal-Waffe für Profis im starken Kaliber 9 mm P.A.K., hier schwarz, mit Kunststoffgriffschalen.&lt;/p&gt;&lt;p&gt;&lt;br&gt;&lt;/p&gt;&lt;p&gt;Zubehör: Bedienungsanleitung, Abschussbecher, Reinigungsbürste und Koffer&lt;br&gt;&lt;/p&gt;&lt;/div&gt;&lt;p&gt;&lt;br&gt;&lt;/p&gt;', 'Schreckschusswaffe, 9mm,', 'Browning GPDA 9 black', 'Browning GPDA  9mm PAK black', 'Browning GPDA 9mm PAK black'),
(1265, 1, 'Browning GPDA 9 black', '', '', 'Browning GPDA 9 black', '', ''),
(1266, 2, 'Browning GPDA 9 Gold', '&lt;p&gt;Eine legendäre Konstruktion des genialen \r\nJohn Moses Browning, der seiner Zeit stets einen Schritt voraus war. \r\n&lt;/p&gt;&lt;p&gt;Schon mit dem Vorgängermodell bewies Browning seine Innovationskraft. \r\nBis heute vertrauen Militärs und Spezialeinheiten auf der ganzen Welt \r\ndieser robusten und wegweisenden Konstruktion. &lt;/p&gt;&lt;p&gt;Wie es sich für eine \r\nlegendäre Browning gehört, ist die GPDA 9 natürlich aufwändig \r\nausgestattet: Wir haben sie mit einem Spannabzug optimiert und ihr neben\r\n dem funktionierenden Schlittenfanghebel noch einen beidseitig \r\nbedienbaren Entspannhebel spendiert.&lt;/p&gt;&lt;div class=&quot;ux-text-descr&quot;&gt;&lt;p&gt;Browning GPDA 9 - Die Gas-Signal-Waffe für Profis im starken Kaliber 9 mm P.A.K., hier schwarz, mit Kunststoffgriffschalen.&lt;/p&gt;&lt;p&gt;&lt;br&gt;&lt;/p&gt;&lt;p&gt;Zubehör: Bedienungsanleitung, Abschussbecher, Reinigungsbürste und Koffer&lt;br&gt;&lt;/p&gt;&lt;/div&gt;&lt;p&gt;&lt;br&gt;&lt;/p&gt;', 'Schreckschusswaffe, 9mm, limitiert', 'Browning GPDA 9 Gold', 'Browning GPDA  9mm PAK golden', 'Browning GPDA 9mm PAK gold'),
(1266, 1, 'Browning GPDA 9 black', '', '', 'Browning GPDA 9 black', '', ''),
(1267, 2, 'Colt 1911 black', '&lt;p&gt;Wenn Kenner an Combatwaffen denken, gilt ihr erster Gedanke meist der \r\n1911er. &lt;/p&gt;&lt;p&gt;Seit ihrer Einführung im Jahre 1911 ist die Konstruktion von \r\nJohn Moses Browning eine der meist verbreiteten Selbstladepistolen \r\nüberhaupt. &lt;/p&gt;&lt;p&gt;Ihr starkes Kaliber und ihre Robustheit prädestinierten die \r\nPistole für den militärischen Gebrauch. Bei manch historischer Schlacht \r\nkam sie zum Einsatz. &lt;/p&gt;&lt;p&gt;Diese Geschichtsträchtigkeit ist es, die Sammler, \r\nSportschützen und Sicherheitsexperten auf der ganzen Welt auch heute \r\nnoch begeistert. &lt;/p&gt;&lt;p&gt;An diese Tradition knüpft unser Modell der Colt \r\nGovernment an: Es gibt Ihnen das gute Gefühl von Sicherheit und \r\nZuverlässigkeit.&lt;/p&gt;&lt;p&gt;&lt;br&gt;&lt;/p&gt;&lt;p&gt;Zubehör: Koffer, Abschussbecher, Reinigungsbürste und Bedienungsanleitung&lt;br&gt;&lt;/p&gt;', 'Schreckschusswaffe, 9mm,', 'Colt 1911 black', 'Umarex Colt 1911 in schwarz mit 9mm PAK', 'Colt 1911 9mm Gasi schreckschusswaffen'),
(1267, 1, 'Colt 1911 black', '', '', 'Colt 1911 black', '', ''),
(1268, 2, 'Colt 1911 Chrom poliert', '&lt;p&gt;Wenn Kenner an Combatwaffen denken, gilt ihr erster Gedanke meist der \r\n1911er. &lt;/p&gt;&lt;p&gt;Seit ihrer Einführung im Jahre 1911 ist die Konstruktion von \r\nJohn Moses Browning eine der meist verbreiteten Selbstladepistolen \r\nüberhaupt. &lt;/p&gt;&lt;p&gt;Ihr starkes Kaliber und ihre Robustheit prädestinierten die \r\nPistole für den militärischen Gebrauch. Bei manch historischer Schlacht \r\nkam sie zum Einsatz. &lt;/p&gt;&lt;p&gt;Diese Geschichtsträchtigkeit ist es, die Sammler, \r\nSportschützen und Sicherheitsexperten auf der ganzen Welt auch heute \r\nnoch begeistert. &lt;/p&gt;&lt;p&gt;An diese Tradition knüpft unser Modell der Colt \r\nGovernment an: Es gibt Ihnen das gute Gefühl von Sicherheit und \r\nZuverlässigkeit.&lt;/p&gt;&lt;p&gt;&lt;br&gt;&lt;/p&gt;&lt;p&gt;Zubehör: Koffer, Abschussbecher, Reinigungsbürste und Bedienungsanleitung&lt;br&gt;&lt;/p&gt;', 'Schreckschusswaffe, 9mm,', 'Colt 1911 Chrom poliert', 'Umarex Colt 1911 in chrom poliert mit 9mm PAK', 'Colt 1911 9mm Gasi schreckschusswaffen'),
(1268, 1, 'Colt 1911 black', '', '', 'Colt 1911 black', '', ''),
(1269, 2, '600x Perfecta Titan 9mm PAK', '&lt;p&gt;600 Stück Knallmunition in Stahlhülsen zu 8x 75 Stk verpackt&lt;br&gt;&lt;/p&gt;', 'Munition, Schreckschuss, 9mm', '600x Perfecta Titan 9mm PAK', 'Perfecta Titan 600 Stk 9mm PAK', '600 Perfecta Titan 9mm PAK'),
(1269, 1, '600x Perfecta Titan 9mm PAK', '', '', '600x Perfecta Titan 9mm PAK', '', ''),
(1270, 1, '600x Perfecta Titan 9mm PAK', '', '', '600x Perfecta Titan 9mm PAK', '', ''),
(1270, 2, '75x Perfecta Titan 9mm PAK', '&lt;p&gt;75 Stück Knallmunition in Stahlhülsen &lt;br&gt;&lt;/p&gt;', 'Munition, Schreckschuss, 9mm', '75x Perfecta Titan 9mm PAK', 'Perfecta Titan 75 Stk 9mm PAK', '75 Perfecta Titan 9mm PAK'),
(1271, 2, '50x Geco 9mmPAK', '&lt;p&gt;50 Stück Knallmunition in Messinghülsen von RWS / Geco&lt;br&gt;&lt;/p&gt;', 'Munition, Schreckschuss, 9mm', '50x Geco 9mmPAK', '50 Geco 9mm PAK', '50 Stück Geco 9mm PAK'),
(1271, 1, '50x Geco 9mmPAK', '', '', '50x Geco 9mmPAK', '', ''),
(1272, 2, '100x Geco 9mmPAK', '&lt;p&gt;100 Stück Knallmunition in Messinghülsen von RWS / Geco in 2x 50 Stück Schachteln&lt;br&gt;&lt;/p&gt;', 'Munition, Schreckschuss, 9mm', '100x Geco 9mmPAK', '100 Geco 9mm PAK', '100 Stück Geco 9mm PAK'),
(1272, 1, '50x Geco 9mmPAK', '', '', '50x Geco 9mmPAK', '', ''),
(1273, 1, '50x Geco 8mmPAK', '', '', '50x Geco 8mmPAK', '', ''),
(1273, 2, '50x Geco 8mmPAK', '&lt;p&gt;50 Stück Knallmunition in Messinghülsen von RWS / Geco&lt;br&gt;&lt;/p&gt;', 'Munition, Schreckschuss, 8mm', '50x Geco 8mmPAK', '50 Geco 8mm PAK', '50 Stück Geco 8mm PAK'),
(1274, 2, '100x Geco 8mmPAK', '&lt;p&gt;100 Stück Knallmunition in Messinghülsen von RWS / Geco&lt;br&gt;&lt;/p&gt;', 'Munition, Schreckschuss, 8mm', '100x Geco 8mmPAK', '100 Geco 8mm PAK', '100 Stück Geco 8mm PAK'),
(1274, 1, '100x Geco 8mmPAK', '', '', '100x Geco 8mmPAK', '', ''),
(1275, 2, '100x Geco 6mm Flobert', '&lt;p&gt;100x 6mm Flobert aus Kupfer von RWS/Geco in der Dose&lt;br&gt;&lt;/p&gt;', 'Munition, Schreckschuss, 6mm Flobert', '100x Geco 6mm Flobert', '100 Stück 6mm Flobert Geco', 'RWS Geco 100 Stück 6mm Flobert'),
(1276, 1, '50x Geco 9mm Revolver Knall Schwarzpulver', '', '', '50x Geco 9mm Revolver Knall Schwarzpulver', '', ''),
(1277, 2, '50x Geco 9mm Revolver Knall Schwarzpulver', '&lt;p&gt;50 Stück Geco 9mm Revolver Knall in Messinghülse mit Schwarzpulver Ladung&lt;br&gt;&lt;/p&gt;', '', '50x Geco 9mm Revolver Knall Schwarzpulver', '', ''),
(1277, 1, '50x Geco 9mm Revolver Knall Schwarzpulver', '', '', '50x Geco 9mm Revolver Knall Schwarzpulver', '', ''),
(1276, 2, '100x Geco 9mm Revolver Knall Schwarzpulver', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;&lt;p&gt;100 Stück Geco 9mm Revolver Knall in Messinghülse mit Schwarzpulver Ladung in Dosen á 50 Stück&lt;br&gt;&lt;/p&gt;&lt;p&gt;&lt;br&gt;&lt;/p&gt;', 'Munition, Schreckschuss, 9mm', '100x Geco 9mm Revolver Knall Schwarzpulver', '100 Geco Schwarzpulver 9mm R Revolver', '100 Geco Schwarzpulver 9mm'),
(1275, 1, '100x Geco 6mm Flobert', '', '', '100x Geco 6mm Flobert', '', ''),
(1278, 2, '50x Walther 9mm Revolver Knall Nitrocellulose', '&lt;p&gt;50 Stück Walther 9mm Revolver Knall in Messinghülse mit NC Ladung&lt;br&gt;&lt;/p&gt;', 'Munition, Schreckschuss, 9mm', '50x Walther 9mm Revolver Knall Nitrocellulose', '50 Stück Walther Knallpatronen Revolver 9mm R ', 'Walther Knallpatronen 9mm R'),
(1278, 1, '50x Walther 9mm Revolver Knall Nitrocellulose', '', '', '50x Walther 9mm Revolver Knall Nitrocellulose', '', ''),
(1279, 1, '50x Walther 9mm Revolver Knall Nitrocellulose', '', '', '50x Walther 9mm Revolver Knall Nitrocellulose', '', ''),
(1279, 2, '100x Walther 9mm Revolver Knall Nitrocellulose', '&lt;p&gt;100 Stück Walther 9mm Revolver Knall in Messinghülse mit NC Ladung in 2 Dosen á 50 Stück&lt;br&gt;&lt;/p&gt;', 'Munition, Schreckschuss, 9mm', '100x Walther 9mm Revolver Knall Nitrocellulose', '100 Stück Walther Knallpatronen Revolver 9mm R ', 'Walther Knallpatronen 9mm R'),
(1280, 2, 'Röhm RG96 black', '&lt;p&gt;Die seit Oktober 1996 gebaute Gas- und Signalpistole gehört zu den \r\nVerkaufsschlager in diesem Marktsegment bei UMAREX. &lt;/p&gt;&lt;p&gt;Vom Design angelehnt\r\n an die aktuelle deutsche Bundeswehr-Pistole, bietet die neunschüssige \r\nWaffe im Kaliber 9 mm P.A.K. ein gutes Preis-Leistungsverhältnis - hier \r\nbrüniert und mit Polymergriffstück.&lt;/p&gt;&lt;p&gt;&lt;br&gt;&lt;/p&gt;&lt;p&gt;Zubehör: Koffer, Bedienungsanleitung, Reinigungsbürste und Abschussbecher&lt;br&gt;&lt;/p&gt;', 'Schreckschusswaffe, 9mm,', 'Röhm RG96 black', 'Die Röhm RG 96 ist eine Schreckschusspistole mit besonderen funktionen', 'Roehm RG 96 Röhm RG96 Gasi'),
(1280, 1, 'Röhm RG96 black', '', '', 'Röhm RG96 black', '', ''),
(1281, 2, 'Röhm RG 88 black', '&lt;p&gt;Sie ist klein, kompakt und hat es in sich: Die Röhm RG88 \r\nSchreckschusspistole im Kaliber 9 Millimeter P.A.K. wartet mit einer \r\nSingle- und einer Double-Action-Funktion sowie einem seitlichen \r\nPatronenauswurf auf. &lt;/p&gt;&lt;p&gt;Die Schreckschusspistole Made in Germany verschießt\r\n Gas- und Pfeffermunition sowie Platzpatronen. &lt;/p&gt;&lt;p&gt;Somit eignet sie sich gut\r\n für den Selbstschutz. &lt;/p&gt;&lt;p&gt;Trotz ihrer geringen Größe ist sie sehr effektiv –\r\n dank des starken Kalibers. &lt;/p&gt;&lt;p&gt;Das zeigt die RG88 auch an Silvester, wenn \r\nsie genormte Pyromunition in 15 Millimeter mit dem passenden \r\nAbschussbecher hoch in den Himmel schießt – ein echtes Highlight.&lt;/p&gt;&lt;p&gt;&lt;br&gt;&lt;/p&gt;&lt;p&gt;Zubehör: Koffer, Reinigungsbürste, Abschussbecher und Bedienungsanleitung&lt;br&gt;&lt;/p&gt;', 'Schreckschusswaffe, 9mm,', 'Röhm RG 88 black', 'Die Röhm RG 88 ist eine kompakte Pistole mit Kaliber 9mm Pistole Automatik Knall', 'Röhm RG 88 Roehm Gasi'),
(1281, 1, 'Röhm RG 88 black', '', '', 'Röhm RG 88 black', '', ''),
(1282, 2, 'Röhm RG 3 black', '&lt;p&gt;Die Röhm RG 3 gehört zu den von der Bauart ersten Schreckschusswaffen am Markt.&lt;/p&gt;&lt;p&gt;Zuverlässigkeit, Robustheit und niedrige Gefahrenquelle haben dieses Modell durch die letzten 60 Jahre gebracht.&lt;/p&gt;&lt;p&gt;&lt;br&gt;&lt;/p&gt;&lt;p&gt;Zubehör: Bedienungsanleitung, Koffer, Abschussbecher und Reinigungsbürste&lt;br&gt;&lt;/p&gt;', 'Schreckschusswaffe, 6mm', 'Röhm RG 3 black', 'Die Röhm RG 3 ist der klassiker unter den 6mm Schreckschusspistolen', 'Röhm Roehm RG 3 6mm Flobert'),
(1282, 1, 'Röhm RG 3 black', '', '', 'Röhm RG 3 black', '', ''),
(1283, 2, 'Röhm RG 56', '&lt;p&gt;Der ideale Signalgeber, kompakt und feuerstark.&lt;/p&gt;&lt;p&gt;Sehr gut geeignet zur Hundeausbildung.&lt;/p&gt;&lt;p&gt;&lt;br&gt;&lt;/p&gt;&lt;p&gt;Zubehör: Reinigungsbürste, Koffer, Bedienungsanleitung und Abschussbecher&lt;br&gt;&lt;/p&gt;', 'Schreckschusswaffe, 6mm', 'Röhm RG 56', 'Röhm RG 56 mit 6mm Flobert und 7 Schuss in der Trommel', 'Roehm Röhm RG 56'),
(1283, 1, 'Röhm RG 56', '', '', 'Röhm RG 56', '', ''),
(1284, 2, 'Röhm RG 59 black', '&lt;p&gt;Der RG 59 gehört zu den meist verkauftesten Revolvern.&lt;/p&gt;&lt;p&gt;Die kompakte Größe, das große Kaliber und die niedrige Störanfälligkeit macht sie zum perfekten Begleiter.&lt;/p&gt;&lt;p&gt;&lt;br&gt;&lt;/p&gt;&lt;p&gt;Zubehör: Reinigungsbürste, Koffer, Abschussbecher und Bedienunganleitung&lt;br&gt;&lt;/p&gt;', 'Schreckschusswaffe, 9mm,', 'Röhm RG 59 black', 'Roehm RG 59 black mit 9mm R Knall Patronen', 'Röhm RG 59 Roehm Gasi'),
(1284, 1, 'Röhm RG 59 black', '', '', 'Röhm RG 59 black', '', ''),
(1285, 1, 'Röhm RG 59 alu chrom', '', '', 'Röhm RG 59 alu chrom', '', ''),
(1285, 2, 'Röhm RG 59 alu chrom', '&lt;p&gt;Der RG 59 gehört zu den meist verkauftesten Revolvern.&lt;/p&gt;&lt;p&gt;Die kompakte Größe, das große Kaliber und die niedrige Störanfälligkeit macht sie zum perfekten Begleiter.&lt;/p&gt;&lt;p&gt;Die Alu Chrom Beschichtung ist eine Hartchromierung und extrem widerstandsfähig.&lt;br&gt;&lt;/p&gt;&lt;p&gt;&lt;br&gt;&lt;/p&gt;&lt;p&gt;Zubehör: Reinigungsbürste, Koffer, Abschussbecher und Bedienunganleitung&lt;br&gt;&lt;/p&gt;', 'Schreckschusswaffe, 9mm,', 'Röhm RG 59 alu chrom', 'Roehm RG 59 Alu Chrom mit 9mm R Knall Patronen', 'Röhm RG 59 Roehm Gasi'),
(1286, 1, 'Röhm RG 89 black', '', '', 'Röhm RG 89 black', '', ''),
(1287, 2, 'Röhm RG 89 Alu Chrom', '&lt;p&gt;Einer der robustesten und unempfindlichsten Revolver am Markt.&lt;/p&gt;&lt;p&gt;Die Combatgriffschalen funktionieren auch gut in großen Händen.&lt;/p&gt;&lt;p&gt;&lt;br&gt;&lt;/p&gt;&lt;p&gt;Zubehör: Reinigungsbürste, Bedienungsanleitung, Koffer und Abschussbecher&lt;br&gt;&lt;/p&gt;', 'Schreckschusswaffe, 9mm,', 'Röhm RG 89 Alu Chrom', 'Röhm Roehm Rg 89 Alu Chrom', 'Röhm Roehm RG 89 alu chrom'),
(1287, 1, 'Röhm RG 89 Alu Chrom', '', '', 'Röhm RG 89 Alu Chrom', '', ''),
(1286, 2, 'Röhm RG 89 black', '&lt;p&gt;Einer der robustesten und unempfindlichsten Revolver am Markt.&lt;/p&gt;&lt;p&gt;6 Schuss 9mm Revolver Knall machen ordentlich Dampf.&lt;br&gt;&lt;/p&gt;&lt;p&gt;&lt;br&gt;&lt;/p&gt;&lt;p&gt;Zubehör: Reinigungsbürste, Bedienungsanleitung, Koffer und Abschussbecher&lt;br&gt;&lt;/p&gt;&lt;p&gt;&lt;br&gt;&lt;/p&gt;', 'Schreckschusswaffe, 9mm,', 'Röhm RG 89 black', 'Röhm RG 89 black 6 Schuss 9mm Revolver Knall', 'Roehm Röhm Gasi RG 89'),
(1288, 2, 'Smith &amp; Wesson Chief Special Black', '&lt;p&gt;&quot;Machine Gun&quot; Kelly war einer der meistgesuchten Gangster der 30er \r\nJahre. Für die FBI-Agenten, die ihn jagten, hatte er einen speziellen \r\nAusdruck: G-Men. &lt;/p&gt;&lt;p&gt;Der gleichnamige Hollywood-Film machte die Männer im \r\nDienste des &quot;Government&quot; weltberühmt - und ihren Dienst-Revolver zur \r\nLegende. &lt;/p&gt;&lt;p&gt;Smith &amp;amp; Wesson hat mit diesem Waffentyp eine neue Klasse \r\ngeschaffen: die Snubbys. &lt;/p&gt;&lt;p&gt;Waffenträger auf der ganzen Welt bezeichnen die\r\n &quot;Stupsnasen&quot; noch heute als ihre &quot;Lebensversicherung&quot;. &lt;/p&gt;&lt;p&gt;Als \r\nGas-Signal-Waffe ist der S&amp;amp;W Chiefs Special ein starker Revolver in \r\neinem starken Kaliber.&lt;/p&gt;&lt;p&gt;&lt;br&gt;&lt;/p&gt;&lt;p&gt;Zubehör: Koffer, Reinigungsbürste, Abschussbecher und Bedienungsanleitung&lt;br&gt;&lt;/p&gt;', 'Schreckschusswaffe, 9mm,', 'Smith &amp; Wesson Chief Special Black', 'Smith &amp; Wesson Chief Special Black 9mm Revolver Knall', 'Smith &amp; Wesson Chief Special 9mm R Knall'),
(1288, 1, 'Smith &amp; Wesson Chief Special Black', '', '', 'Smith &amp; Wesson Chief Special Black', '', ''),
(1289, 1, 'Smith &amp; Wesson Chief Special Nickel', '', '', 'Smith &amp; Wesson Chief Special Nickel', '', ''),
(1289, 2, 'Smith &amp; Wesson Chief Special Nickel', '&lt;p&gt;&quot;Machine Gun&quot; Kelly war einer der meistgesuchten Gangster der 30er \r\nJahre. Für die FBI-Agenten, die ihn jagten, hatte er einen speziellen \r\nAusdruck: G-Men. &lt;/p&gt;&lt;p&gt;Der gleichnamige Hollywood-Film machte die Männer im \r\nDienste des &quot;Government&quot; weltberühmt - und ihren Dienst-Revolver zur \r\nLegende. &lt;/p&gt;&lt;p&gt;Smith &amp;amp; Wesson hat mit diesem Waffentyp eine neue Klasse \r\ngeschaffen: die Snubbys. &lt;/p&gt;&lt;p&gt;Waffenträger auf der ganzen Welt bezeichnen die\r\n &quot;Stupsnasen&quot; noch heute als ihre &quot;Lebensversicherung&quot;. &lt;/p&gt;&lt;p&gt;Als \r\nGas-Signal-Waffe ist der S&amp;amp;W Chiefs Special ein starker Revolver in \r\neinem starken Kaliber.&lt;/p&gt;&lt;p&gt;&lt;br&gt;&lt;/p&gt;&lt;p&gt;Zubehör: Koffer, Reinigungsbürste, Abschussbecher und Bedienungsanleitung&lt;br&gt;&lt;/p&gt;', 'Schreckschusswaffe, 9mm,', 'Smith &amp; Wesson Chief Special Nickel', 'Smith &amp; Wesson Chief Special Black 9mm Revolver Knall', 'Smith &amp; Wesson Chief Special 9mm R Knall'),
(1290, 2, 'Colt Detective Special Black', '&lt;p&gt;Wer Colt hört, denkt an Revolver. Doch wie wurde dieser Name zum \r\nGattungsbegriff? &lt;/p&gt;&lt;p&gt;Angefangen hat alles im Jahre 1836. &lt;/p&gt;&lt;p&gt;Damals brachte \r\nSamuel Colt seinen ersten Revolver auf den Markt und hatte mit seiner \r\nKonstruktion die Waffenentwicklung revolutioniert. &lt;/p&gt;&lt;p&gt;Sie spüren etwas von \r\ndieser Faszination, wenn sie unseren absolut authentischen Nachbau im \r\ntraditionellen Revolverkaliber 9 mm R.K. in den Händen halten. &lt;/p&gt;&lt;p&gt;Mit der \r\nColt Detective Special besitzen Sie ein Stück Waffengeschichte. &lt;/p&gt;&lt;p&gt;Auch die\r\n 6 Schuss fassende Trommel ist eine Hommage an die Vergangenheit: Als im\r\n Wilden Westen noch scharf geschossen wurde, kam es oft genug auf die \r\neine Kugel mehr an!&lt;/p&gt;&lt;p&gt;&lt;br&gt;&lt;/p&gt;&lt;p&gt;Zubehör: Koffer, Reinigungsbürste, Abschussbecher und Bedienungsanleitung&lt;br&gt;&lt;/p&gt;', 'Schreckschusswaffe, 9mm,', 'Colt Detective Special Black', 'Der authentische Colt Detetctive Special im starken 9mm Revolver Knall Kaliber', 'Colt Gasi 9mm Revolver'),
(1290, 1, 'Colt Detective Special Black', '', '', 'Colt Detective Special Black', '', ''),
(1291, 2, 'Colt Detective Special Nickel Holzgriffschalen', '&lt;p&gt;Wer Colt hört, denkt an Revolver. Doch wie wurde dieser Name zum \r\nGattungsbegriff? &lt;/p&gt;&lt;p&gt;Angefangen hat alles im Jahre 1836. &lt;/p&gt;&lt;p&gt;Damals brachte \r\nSamuel Colt seinen ersten Revolver auf den Markt und hatte mit seiner \r\nKonstruktion die Waffenentwicklung revolutioniert. &lt;/p&gt;&lt;p&gt;Sie spüren etwas von \r\ndieser Faszination, wenn sie unseren absolut authentischen Nachbau im \r\ntraditionellen Revolverkaliber 9 mm R.K. in den Händen halten. &lt;/p&gt;&lt;p&gt;Mit der \r\nColt Detective Special besitzen Sie ein Stück Waffengeschichte. &lt;/p&gt;&lt;p&gt;Auch die\r\n 6 Schuss fassende Trommel ist eine Hommage an die Vergangenheit: Als im\r\n Wilden Westen noch scharf geschossen wurde, kam es oft genug auf die \r\neine Kugel mehr an!&lt;/p&gt;&lt;p&gt;&lt;br&gt;&lt;/p&gt;&lt;p&gt;Zubehör: Koffer, Reinigungsbürste, Abschussbecher und Bedienungsanleitung&lt;br&gt;&lt;/p&gt;', 'Schreckschusswaffe, 9mm,', 'Colt Detective Special Nickel Holzgriffschalen', 'Der authentische Colt Detetctive Special im starken 9mm Revolver Knall Kaliber', 'Colt Gasi 9mm Revolver'),
(1291, 1, 'Colt Detective Special Nickel Holzgriffschalen', '', '', 'Colt Detective Special Nickel Holzgriffschalen', '', ''),
(1292, 2, 'Zoraki 917 chrom matt', '&lt;p&gt;Die Zoraki 917 im Kal. 9mm P.A. aus dem Haus Atak Arms überzeugt wie \r\nauch die anderen Zoraki Modelle mit ihrer Zuverlässigkeit und soliden \r\nVerarbeitung. &lt;/p&gt;&lt;p&gt;Das Magazin hat eine Kapazität von 17 Schuss, die \r\nSchreckschusspistole hat ein Gesamtgewicht von ca. 830g. &lt;/p&gt;&lt;p&gt;Im Lieferumfang\r\n enthalten ist der entsprechende Signalbecher zum Verschießen von \r\nSignalmunition, eine Reinigungsbürste und ein Kunststoffkoffer.&lt;br&gt;&lt;/p&gt;', 'Schreckschusswaffe, 9mm, ', 'Zoraki 917 chrom matt', 'Zoraki 917 chrom matt', 'Zoraki 917 chrom matt'),
(1293, 1, 'Zoraki 917 9mm PAK black', '', '', 'Zoraki 917 9mm PAK black', '', ''),
(1293, 2, 'Zoraki 917 TAN', '&lt;p&gt;Die Zoraki 917 im Kal. 9mm P.A. aus dem Haus Atak Arms überzeugt wie \r\nauch die anderen Zoraki Modelle mit ihrer Zuverlässigkeit und soliden \r\nVerarbeitung. &lt;/p&gt;&lt;p&gt;Das Magazin hat eine Kapazität von 17 Schuss, die \r\nSchreckschusspistole hat ein Gesamtgewicht von ca. 830g. &lt;/p&gt;&lt;p&gt;Im Lieferumfang\r\n enthalten ist der entsprechende Signalbecher zum Verschießen von \r\nSignalmunition, eine Reinigungsbürste und ein Kunststoffkoffer.&lt;br&gt;&lt;/p&gt;', 'Schreckschusswaffe, 9mm, ', 'Zoraki 917 TAN', 'Zoraki 917 TAN', 'Zoraki 917 TAN '),
(1292, 1, 'Zoraki 917 9mm PAK black', '', '', 'Zoraki 917 9mm PAK black', '', ''),
(1294, 2, 'Zoraki 918 black', '&lt;p&gt;Die Zoraki 918 im Kal. 9mm P.A. überzeugt \r\nwie auch die anderen Zoraki Modelle mit ihrer Zuverlässigkeit und \r\nsoliden Verarbeitung.&amp;nbsp;&lt;/p&gt;&lt;div class=&quot;data item content&quot; aria-labelledby=&quot;tab-label-description&quot; id=&quot;description&quot; data-role=&quot;content&quot; role=&quot;tabpanel&quot; aria-hidden=&quot;false&quot; style=&quot;display: block;&quot;&gt;&lt;div class=&quot;product attribute description&quot;&gt;&lt;div class=&quot;value&quot;&gt;\r\n&lt;p&gt;Das Magazin hat eine Kapazität von 18 Schuss, die Schreckschusspistole hat ein Gesamtgewicht von ca. 870g.&lt;/p&gt;\r\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;\r\n&lt;p&gt;Im Lieferumfang enthalten ist der entsprechende Signalbecher zum \r\nVerschießen von Signalmunition, eine Reinigungsbürste und ein \r\nKunststoffkoffer, sowie eine mehrsprachrige Bedienungsanleitung.&lt;br&gt;&lt;/p&gt;&lt;/div&gt;\r\n&lt;/div&gt;\r\n                &lt;/div&gt;&lt;p&gt;&lt;br&gt;&lt;/p&gt;', 'Schreckschusswaffe, 9mm,', 'Zoraki 918 black', 'Zoraki 918 black', 'Zoraki 918 black'),
(1294, 1, 'Zoraki 918 black', '', '', 'Zoraki 918 black', '', ''),
(1295, 2, 'Zoraki 918 Chrom Matt', '&lt;p&gt;Die Zoraki 918 im Kal. 9mm P.A. überzeugt \r\nwie auch die anderen Zoraki Modelle mit ihrer Zuverlässigkeit und \r\nsoliden Verarbeitung.&amp;nbsp;&lt;/p&gt;&lt;div class=&quot;data item content&quot; aria-labelledby=&quot;tab-label-description&quot; id=&quot;description&quot; data-role=&quot;content&quot; role=&quot;tabpanel&quot; aria-hidden=&quot;false&quot; style=&quot;display: block;&quot;&gt;&lt;div class=&quot;product attribute description&quot;&gt;&lt;div class=&quot;value&quot;&gt;\r\n&lt;p&gt;Das Magazin hat eine Kapazität von 18 Schuss, die Schreckschusspistole hat ein Gesamtgewicht von ca. 870g.&lt;/p&gt;\r\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;\r\n&lt;p&gt;Im Lieferumfang enthalten ist der entsprechende Signalbecher zum \r\nVerschießen von Signalmunition, eine Reinigungsbürste und ein \r\nKunststoffkoffer, sowie eine mehrsprachrige Bedienungsanleitung.&lt;br&gt;&lt;/p&gt;&lt;/div&gt;\r\n&lt;/div&gt;\r\n                &lt;/div&gt;&lt;p&gt;&lt;br&gt;&lt;/p&gt;', 'Schreckschusswaffe, 9mm,', 'Zoraki 918 Chrom Matt', 'Zoraki 918 Chrom Matt', 'Zoraki 918 Chrom Matt'),
(1295, 1, 'Zoraki 918 Chrom Matt', '', '', 'Zoraki 918 Chrom Matt', '', ''),
(1296, 2, 'Zoraki 914 black', '&lt;p&gt;Der neue Stern unter den Gas- und Schreckschusswaffen. Diese dynamische Schreckschusswaffe&lt;/p&gt;&lt;div class=&quot;data item content&quot; aria-labelledby=&quot;tab-label-description&quot; id=&quot;description&quot; data-role=&quot;content&quot; role=&quot;tabpanel&quot; aria-hidden=&quot;false&quot; style=&quot;display: block;&quot;&gt;&lt;div class=&quot;product attribute description&quot;&gt;&lt;div class=&quot;value&quot;&gt;\r\n&lt;p&gt;aus dem Haus ATAK besticht durch hochwertige Verarbeitung und Leistungsstärke.&amp;nbsp;&lt;/p&gt;\r\n&lt;p&gt;Semi Automatik, Single/Double Aciton Abzug, manuelle Sicherung und ein extra erhältiches&amp;nbsp;&lt;/p&gt;\r\n&lt;p&gt;&lt;br&gt;&lt;/p&gt;\r\n&lt;p&gt;(Lieferung inkl. Leuchtkugel - Signalbecher, Reinigungsbürste, Koffer und Bedienungsanleitung)&lt;/p&gt;&lt;/div&gt;\r\n&lt;/div&gt;\r\n                &lt;/div&gt;&lt;p&gt;&lt;br&gt;&lt;/p&gt;', 'Schreckschusswaffe, 9mm,', 'Zoraki 914 black', 'Zoraki 914 black', 'Zoraki 914 black'),
(1296, 1, 'Zoraki 914 black', '', '', 'Zoraki 914 black', '', ''),
(1297, 2, 'Zoraki 914 Chrom Matt', '&lt;p&gt;Der neue Stern unter den Gas- und Schreckschusswaffen. Diese dynamische Schreckschusswaffe&lt;/p&gt;&lt;div class=&quot;data item content&quot; aria-labelledby=&quot;tab-label-description&quot; id=&quot;description&quot; data-role=&quot;content&quot; role=&quot;tabpanel&quot; aria-hidden=&quot;false&quot; style=&quot;display: block;&quot;&gt;&lt;div class=&quot;product attribute description&quot;&gt;&lt;div class=&quot;value&quot;&gt;\r\n&lt;p&gt;aus dem Haus ATAK besticht durch hochwertige Verarbeitung und Leistungsstärke.&amp;nbsp;&lt;/p&gt;\r\n&lt;p&gt;Semi Automatik, Single/Double Aciton Abzug, manuelle Sicherung und ein extra erhältiches&amp;nbsp;&lt;/p&gt;\r\n&lt;p&gt;&lt;br&gt;&lt;/p&gt;\r\n&lt;p&gt;(Lieferung inkl. Leuchtkugel - Signalbecher, Reinigungsbürste, Koffer und Bedienungsanleitung)&lt;/p&gt;&lt;/div&gt;\r\n&lt;/div&gt;\r\n                &lt;/div&gt;&lt;p&gt;&lt;br&gt;&lt;/p&gt;', 'Schreckschusswaffe, 9mm,', 'Zoraki 914 Chrom Matt', 'Zoraki 914 Chrom Matt', 'Zoraki 914 Chrom Matt'),
(1298, 2, 'Zoraki 914 satina', '&lt;p&gt;Der neue Stern unter den Gas- und Schreckschusswaffen. Diese dynamische Schreckschusswaffe&lt;/p&gt;&lt;div class=&quot;data item content&quot; aria-labelledby=&quot;tab-label-description&quot; id=&quot;description&quot; data-role=&quot;content&quot; role=&quot;tabpanel&quot; aria-hidden=&quot;false&quot; style=&quot;display: block;&quot;&gt;&lt;div class=&quot;product attribute description&quot;&gt;&lt;div class=&quot;value&quot;&gt;\r\n&lt;p&gt;aus dem Haus ATAK besticht durch hochwertige Verarbeitung und Leistungsstärke.&amp;nbsp;&lt;/p&gt;\r\n&lt;p&gt;Semi Automatik, Single/Double Aciton Abzug, manuelle Sicherung und ein extra erhältiches&amp;nbsp;&lt;/p&gt;\r\n&lt;p&gt;&lt;br&gt;&lt;/p&gt;\r\n&lt;p&gt;(Lieferung inkl. Leuchtkugel - Signalbecher, Reinigungsbürste, Koffer und Bedienungsanleitung)&lt;/p&gt;&lt;/div&gt;\r\n&lt;/div&gt;\r\n                &lt;/div&gt;&lt;p&gt;&lt;br&gt;&lt;/p&gt;', 'Schreckschusswaffe, 9mm,', 'Zoraki 914 satina', 'Zoraki 914 satina', 'Zoraki 914 satina'),
(1298, 1, 'Zoraki 914 satina', '', '', 'Zoraki 914 satina', '', ''),
(1297, 1, 'Zoraki 914 Chrom Matt', '', '', 'Zoraki 914 Chrom Matt', '', ''),
(1299, 2, 'Zoraki 2918 black', '&lt;p&gt;Die Zoraki Familie erhält Nachwuchs in Deutschland in Form der Zoraki 2918. Sie ist eine weitere hochwertig verarbeitete&lt;/p&gt;&lt;p&gt;Schreckschusspistole aus dem Hause Atak Arms. &lt;/p&gt;&lt;p&gt;Durch Ihren Single-/Double-Action Abzug eignet sie sich auch perfekt zum Selbstschutz. &lt;/p&gt;&lt;p&gt;Die Zoraki 2918 liegt trotz ihrer Größe und Gewichts \r\ngut in der Hand. Das doppelreihige Magazin der Schreckschusspistole \r\nfasst 18 Patronen im Kaliber 9 mm P.A.K. und ist kompatible mit der 918 \r\nund 4918.&lt;/p&gt;&lt;p&gt;&lt;br&gt;&lt;/p&gt;&lt;p&gt;Zubehör: Abschussbecher, Koffer, Reinigungsbürste und Bedienungsanleitung&lt;br&gt;&lt;/p&gt;', 'Schreckschusswaffe, 9mm,', 'Zoraki 2918 black', 'Zoraki 2918 black schwarz brüniert ', 'Zoraki 2918 9mm PAK Gasi'),
(1300, 2, 'Zoraki 2918 chrom matt', '&lt;p&gt;Die Zoraki Familie erhält Nachwuchs in Deutschland in Form der Zoraki 2918. Sie ist eine weitere hochwertig verarbeitete&lt;/p&gt;&lt;p&gt;Schreckschusspistole aus dem Hause Atak Arms. &lt;/p&gt;&lt;p&gt;Durch Ihren Single-/Double-Action Abzug eignet sie sich auch perfekt zum Selbstschutz. &lt;/p&gt;&lt;p&gt;Die Zoraki 2918 liegt trotz ihrer Größe und Gewichts \r\ngut in der Hand. Das doppelreihige Magazin der Schreckschusspistole \r\nfasst 18 Patronen im Kaliber 9 mm P.A.K. und ist kompatible mit der 918 \r\nund 4918.&lt;/p&gt;&lt;p&gt;&lt;br&gt;&lt;/p&gt;&lt;p&gt;Zubehör: Abschussbecher, Koffer, Reinigungsbürste und Bedienungsanleitung&lt;br&gt;&lt;/p&gt;', 'Schreckschusswaffe, 9mm,', 'Zoraki 2918 chrom matt', 'Zoraki 2918 chrom matt im starken selbstverteidigungskaliber 9mm PAK', 'Zoraki 2918 9mm PAK Gasi'),
(1301, 2, 'Zoraki 4918 black ', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;&lt;div class=&quot;data item content&quot; aria-labelledby=&quot;tab-label-description&quot; id=&quot;description&quot; data-role=&quot;content&quot; role=&quot;tabpanel&quot; aria-hidden=&quot;false&quot; style=&quot;display: block;&quot;&gt;\r\n                    \r\n&lt;div class=&quot;product attribute description&quot;&gt;\r\n        &lt;div class=&quot;value&quot;&gt;&lt;p&gt;Die Zoraki Familie erhält Nachwuchs in Deutschland in Form der Zoraki 4918. &lt;/p&gt;&lt;p&gt;Sie ist eine weitere hochwertig verarbeitete Schreckschusspistole aus dem Hause Atak Arms. &lt;/p&gt;&lt;p&gt;Durch Ihren Single-/Double-Action Abzug eignet sie sich auch perfekt zum Selbstschutz. &lt;/p&gt;&lt;p&gt;Die Zoraki 4918 liegt trotz ihrer Größe und Gewichts \r\ngut in der Hand. &lt;/p&gt;&lt;p&gt;Das doppelreihige Magazin der Schreckschusspistole fasst 18 Patronen im Kaliber 9 mm P.A.K. und ist kompatible mit der 918 und 2918.&lt;/p&gt;&lt;p&gt;&lt;br&gt;&lt;/p&gt;&lt;p&gt;Zubehör: Abschussbecher, Koffer, Reinigungsbürste und Bedienungsanleitung&lt;br&gt;&lt;/p&gt;&lt;/div&gt;\r\n&lt;/div&gt;\r\n                &lt;/div&gt;&lt;p&gt;&lt;br&gt;&lt;/p&gt;', 'Schreckschusswaffe, 9mm,', 'Zoraki 4918 black ', 'Zoraki 4918 black schwarz brüniert im starken selbstverteidigungs kaliber 9mm P.A.K.', 'Zoraki 4918 black '),
(1302, 2, 'Zoraki 4918 chrom matt', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;&lt;div class=&quot;data item content&quot; aria-labelledby=&quot;tab-label-description&quot; id=&quot;description&quot; data-role=&quot;content&quot; role=&quot;tabpanel&quot; aria-hidden=&quot;false&quot; style=&quot;display: block;&quot;&gt;\r\n                    \r\n&lt;div class=&quot;product attribute description&quot;&gt;\r\n        &lt;div class=&quot;value&quot;&gt;&lt;p&gt;Die Zoraki Familie erhält Nachwuchs in Deutschland in Form der Zoraki 4918. &lt;/p&gt;&lt;p&gt;Sie ist eine weitere hochwertig verarbeitete Schreckschusspistole aus dem Hause Atak Arms. &lt;/p&gt;&lt;p&gt;Durch Ihren Single-/Double-Action Abzug eignet sie sich auch perfekt zum Selbstschutz. &lt;/p&gt;&lt;p&gt;Die Zoraki 4918 liegt trotz ihrer Größe und Gewichts \r\ngut in der Hand. &lt;/p&gt;&lt;p&gt;Das doppelreihige Magazin der Schreckschusspistole fasst 18 Patronen im Kaliber 9 mm P.A.K. und ist kompatible mit der 918 und 2918.&lt;/p&gt;&lt;p&gt;&lt;br&gt;&lt;/p&gt;&lt;p&gt;Zubehör: Abschussbecher, Koffer, Reinigungsbürste und Bedienungsanleitung&lt;br&gt;&lt;/p&gt;&lt;/div&gt;\r\n&lt;/div&gt;\r\n                &lt;/div&gt;&lt;p&gt;&lt;br&gt;&lt;/p&gt;', 'Schreckschusswaffe, 9mm,', 'Zoraki 4918 chrom matt', 'Zoraki 4918 chrom matt silber cool im starken selbstverteidigungs kaliber 9mm P.A.K.', 'Zoraki 4918 chrom matt Gasi'),
(1303, 2, 'Zoraki 925 black', '&lt;p&gt;Zoraki 925 Schreckschusspistole&lt;/p&gt;&lt;div class=&quot;data item content&quot; aria-labelledby=&quot;tab-label-description&quot; id=&quot;description&quot; data-role=&quot;content&quot; role=&quot;tabpanel&quot; aria-hidden=&quot;false&quot; style=&quot;display: block;&quot;&gt;&lt;div class=&quot;product attribute description&quot;&gt;&lt;div class=&quot;value&quot;&gt;\r\n&lt;p&gt;Eine weitere Neuheit aus dem Hause Atak Arms, endlich mit PTB Zulassung für den deutschen Markt.&lt;/p&gt;\r\n&lt;p&gt;Die Zoraki 925 wird in einem stabilen Waffenkoffer komplett mit einem 16-Schuss- und einem 25 Schuss Magazin ausgeliefert.&lt;/p&gt;\r\n&lt;p&gt;Die Schreckschusspistole Zoraki 925 überzeugt durch die bekannte Zoraki Qualität sowie ihr einzigartiges Design.&lt;/p&gt;&lt;p&gt;&lt;br&gt;&lt;/p&gt;&lt;p&gt;Zubehör: hochwertiger Innenunterteilter Koffer, 2tes Magazin, Reinigungsbürste, Öl, Abschussbecher&lt;br&gt;&lt;/p&gt;&lt;/div&gt;\r\n&lt;/div&gt;\r\n                &lt;/div&gt;&lt;p&gt;&lt;br&gt;&lt;/p&gt;', 'Schreckschusswaffe, 9mm,', 'Zoraki 925 black', 'Die Zoraki 925 in schwarz ist ein an die scorpion angelehnte Pistole im MP design', 'Zoraki 925 schwarz black Gasi'),
(1303, 1, 'Zoraki 925 black', '', '', 'Zoraki 925 black', '', ''),
(1299, 1, 'Zoraki 2918 black', '', '', 'Zoraki 2918 black', '', ''),
(1300, 1, 'Zoraki 2918 chrom matt', '', '', 'Zoraki 2918 chrom matt', '', ''),
(1301, 1, 'Zoraki 4918 black ', '', '', 'Zoraki 4918 black ', '', ''),
(1302, 1, 'Zoraki 4918 chrom matt', '', '', 'Zoraki 4918 chrom matt', '', ''),
(1304, 1, 'Zoraki 925 camo', '', '', 'Zoraki 925 camo', '', ''),
(1304, 2, 'Zoraki 925 camo', '&lt;p&gt;Zoraki 925 Schreckschusspistole&lt;/p&gt;&lt;div class=&quot;data item content&quot; aria-labelledby=&quot;tab-label-description&quot; id=&quot;description&quot; data-role=&quot;content&quot; role=&quot;tabpanel&quot; aria-hidden=&quot;false&quot; style=&quot;display: block;&quot;&gt;&lt;div class=&quot;product attribute description&quot;&gt;&lt;div class=&quot;value&quot;&gt;\r\n&lt;p&gt;Eine weitere Neuheit aus dem Hause Atak Arms, endlich mit PTB Zulassung für den deutschen Markt.&lt;/p&gt;\r\n&lt;p&gt;Die Zoraki 925 wird in einem stabilen Waffenkoffer komplett mit einem 16-Schuss- und einem 25 Schuss Magazin ausgeliefert.&lt;/p&gt;\r\n&lt;p&gt;Die Schreckschusspistole Zoraki 925 überzeugt durch die bekannte Zoraki Qualität sowie ihr einzigartiges Design.&lt;/p&gt;&lt;p&gt;&lt;br&gt;&lt;/p&gt;&lt;p&gt;Zubehör: hochwertiger Innenunterteilter Koffer, 2tes Magazin, Reinigungsbürste, Öl, Abschussbecher&lt;br&gt;&lt;/p&gt;&lt;/div&gt;\r\n&lt;/div&gt;\r\n                &lt;/div&gt;&lt;p&gt;&lt;br&gt;&lt;/p&gt;', 'Schreckschusswaffe, 9mm,', 'Zoraki 925 camo', 'Die Zoraki 925 in flecktarn ist ein an die scorpion angelehnte Pistole im MP design', 'Zoraki 925 camo flecktarn Gasi');
INSERT INTO `oc_product_description` (`product_id`, `language_id`, `name`, `description`, `tag`, `meta_title`, `meta_description`, `meta_keyword`) VALUES
(1305, 2, 'Zoraki 906 black', '&lt;p&gt;Die Schreckschusspistole Zoraki 906 aus dem Hause Atak ist klein, leicht und handlich. &lt;br&gt;&lt;/p&gt;&lt;div class=&quot;data item content&quot; aria-labelledby=&quot;tab-label-description&quot; id=&quot;description&quot; data-role=&quot;content&quot; role=&quot;tabpanel&quot; aria-hidden=&quot;false&quot; style=&quot;display: block;&quot;&gt;&lt;div class=&quot;product attribute description&quot;&gt;&lt;div class=&quot;value&quot;&gt;&lt;p&gt;Der perfekte Begleiter in allen Lebenslagen. Die perfekte Taschenpistole zur Verteidigung.&lt;/p&gt;\r\n&lt;p&gt;Lieferung erfolgt im Koffer, mit Reinigungsbürste, Signalbecher und Bedienungsanweisung.&lt;/p&gt;\r\n&lt;p&gt;- manuelle Sicherung&lt;br&gt;- stahlverstärkte Funktionsteile&lt;br&gt;- unkompliziert zerlegbar&lt;/p&gt;&lt;/div&gt;\r\n&lt;/div&gt;\r\n                &lt;/div&gt;&lt;p&gt;&lt;br&gt;&lt;/p&gt;', 'Schreckschusswaffe, 9mm,', 'Zoraki 906 black', 'Die Zoraki 906 black ist eine kleine Pistole mit 6 Schuss super zum immer dabei haben', 'Zoraki 906 black Gasi'),
(1305, 1, 'Zoraki 906 black', '', '', 'Zoraki 906 black', '', ''),
(1306, 2, 'Zoraki 906 Chrom Matt', '&lt;p&gt;Die Schreckschusspistole Zoraki 906 aus dem Hause Atak ist klein, leicht und handlich. &lt;br&gt;&lt;/p&gt;&lt;div class=&quot;data item content&quot; aria-labelledby=&quot;tab-label-description&quot; id=&quot;description&quot; data-role=&quot;content&quot; role=&quot;tabpanel&quot; aria-hidden=&quot;false&quot; style=&quot;display: block;&quot;&gt;&lt;div class=&quot;product attribute description&quot;&gt;&lt;div class=&quot;value&quot;&gt;&lt;p&gt;Der perfekte Begleiter in allen Lebenslagen. Die perfekte Taschenpistole zur Verteidigung.&lt;/p&gt;\r\n&lt;p&gt;Lieferung erfolgt im Koffer, mit Reinigungsbürste, Signalbecher und Bedienungsanweisung.&lt;/p&gt;\r\n&lt;p&gt;- manuelle Sicherung&lt;br&gt;- stahlverstärkte Funktionsteile&lt;br&gt;- unkompliziert zerlegbar&lt;/p&gt;&lt;/div&gt;\r\n&lt;/div&gt;\r\n                &lt;/div&gt;&lt;p&gt;&lt;br&gt;&lt;/p&gt;', 'Schreckschusswaffe, 9mm,', 'Zoraki 906 Chrom Matt', 'Die Zoraki 906 chrom matt ist eine kleine Pistole mit 6 Schuss super zum immer dabei haben', 'Zoraki 906 chrom matt Gasi'),
(1306, 1, 'Zoraki 906 Chrom Matt', '', '', 'Zoraki 906 Chrom Matt', '', ''),
(1307, 2, 'Zoraki R1 2,5&quot; SHINY mit Griffen in Holzoptik', '&lt;p&gt;Seit ihrer Markteinführung überzeugen die Gas-Signalwaffen von Zoraki mit einem unschlagbaren Preis-Leistungsverhältnis.&lt;/p&gt;&lt;p&gt;Material, Verarbeitung und die damit einhergehende Funktionalität sowie Zuverlässigkeit suchen ihresgleichen auf dem deutschen Markt. &lt;/p&gt;&lt;p&gt;Der neue R1 ist ein klassischer Double-Action Revolver mit 2,5“ Lauflänge. &lt;/p&gt;&lt;p&gt;Sowohl die 6 Schuss fassende Trommel wie auch diverse Bauteile sind aus hochwertigem Stahl gefertigt und sorgfältig\r\n verarbeitet. &lt;/p&gt;&lt;p&gt;Dem entsprechend präzise ist der Schlossgang beim Modell R1, die neue Sonderedition in Shiny Black und Holzoptikgriffschalen ergänzt die R1-Serie nun. &lt;/p&gt;&lt;p&gt;&lt;br&gt;&lt;/p&gt;&lt;p&gt;Zubehör: Abschussbecher, Reinigungsbürste, Bedienungsanleitung und Koffer&lt;br&gt;&lt;/p&gt;&lt;p&gt;&lt;br&gt;&lt;/p&gt;', 'Schreckschusswaffe, 9mm,', 'Zoraki R1 2,5&quot; SHINY mit Griffen in Holzoptik', 'Zoraki R1 2,5 Zoll Shiny', 'Zoraki R1 2,5 9mm PAK GAsi'),
(1307, 1, 'Zoraki R1 2,5&quot; SHINY mit Griffen in Holzoptik', '', '', 'Zoraki R1 2,5&quot; SHINY mit Griffen in Holzoptik', '', ''),
(1308, 1, 'Zoraki R1 4,5&quot; SHINY mit Griffen in Holzoptik', '', '', 'Zoraki R1 4,5&quot; SHINY mit Griffen in Holzoptik', '', ''),
(1308, 2, 'Zoraki R1 4,5&quot; SHINY mit Griffen in Holzoptik', '&lt;p&gt;Seit ihrer Markteinführung überzeugen die Gas-Signalwaffen von Zoraki mit einem unschlagbaren Preis-Leistungsverhältnis.&lt;/p&gt;&lt;p&gt;Material, Verarbeitung und die damit einhergehende Funktionalität sowie Zuverlässigkeit suchen ihresgleichen auf dem deutschen Markt. &lt;/p&gt;&lt;p&gt;Der neue R1 ist ein klassischer Double-Action Revolver mit 4,5“ Lauflänge. &lt;/p&gt;&lt;p&gt;Sowohl die 6 Schuss fassende Trommel wie auch diverse Bauteile sind aus hochwertigem Stahl gefertigt und sorgfältig\r\n verarbeitet. &lt;/p&gt;&lt;p&gt;Dem entsprechend präzise ist der Schlossgang beim Modell R1, die neue Sonderedition in Shiny Black und Holzoptikgriffschalen ergänzt die R1-Serie nun. &lt;/p&gt;&lt;p&gt;&lt;br&gt;&lt;/p&gt;&lt;p&gt;Zubehör: Abschussbecher, Reinigungsbürste, Bedienungsanleitung und Koffer&lt;br&gt;&lt;/p&gt;&lt;p&gt;&lt;br&gt;&lt;/p&gt;', 'Schreckschusswaffe, 9mm,', 'Zoraki R1 4,5&quot; SHINY mit Griffen in Holzoptik', 'Zoraki R1 4,5 Zoll Shiny', 'Zoraki R1 4,5 9mm PAK GAsi'),
(1309, 1, 'Zoraki R1 6&quot; SHINY mit Griffen in Holzoptik', '', '', 'Zoraki R1 6&quot; SHINY mit Griffen in Holzoptik', '', ''),
(1309, 2, 'Zoraki R1 6&quot; SHINY mit Griffen in Holzoptik', '&lt;p&gt;Seit ihrer Markteinführung überzeugen die Gas-Signalwaffen von Zoraki mit einem unschlagbaren Preis-Leistungsverhältnis.&lt;/p&gt;&lt;p&gt;Material, Verarbeitung und die damit einhergehende Funktionalität sowie Zuverlässigkeit suchen ihresgleichen auf dem deutschen Markt. &lt;/p&gt;&lt;p&gt;Der neue R1 ist ein klassischer Double-Action Revolver mit 6“ Lauflänge. &lt;/p&gt;&lt;p&gt;Sowohl die 6 Schuss fassende Trommel wie auch diverse Bauteile sind aus hochwertigem Stahl gefertigt und sorgfältig\r\n verarbeitet. &lt;/p&gt;&lt;p&gt;Dem entsprechend präzise ist der Schlossgang beim Modell R1, die neue Sonderedition in Shiny Black und Holzoptikgriffschalen ergänzt die R1-Serie nun. &lt;/p&gt;&lt;p&gt;&lt;br&gt;&lt;/p&gt;&lt;p&gt;Zubehör: Abschussbecher, Reinigungsbürste, Bedienungsanleitung und Koffer&lt;br&gt;&lt;/p&gt;&lt;p&gt;&lt;br&gt;&lt;/p&gt;', 'Schreckschusswaffe, 9mm,', 'Zoraki R1 6&quot; SHINY mit Griffen in Holzoptik', 'Zoraki R1 6 Zoll Shiny', 'Zoraki R1 6 9mm PAK GAsi'),
(1312, 2, 'Zoraki R1 6&quot; black', '&lt;p&gt;Seit ihrer Markteinführung überzeugen die Gas-Signalwaffen von Zoraki mit einem unschlagbaren Preis-Leistungsverhältnis.&lt;/p&gt;&lt;p&gt;Material, Verarbeitung und die damit einhergehende Funktionalität sowie Zuverlässigkeit suchen ihresgleichen auf dem deutschen Markt. &lt;/p&gt;&lt;p&gt;Der neue R1 ist ein klassischer Double-Action Revolver mit 6“ Lauflänge. &lt;/p&gt;&lt;p&gt;Sowohl die 6 Schuss fassende Trommel wie auch diverse Bauteile sind aus hochwertigem Stahl gefertigt und sorgfältig\r\n verarbeitet. &lt;/p&gt;&lt;p&gt;Dem entsprechend präzise ist der Schlossgang beim Modell R1, die neue Sonderedition in Shiny Black und Holzoptikgriffschalen ergänzt die R1-Serie nun. &lt;/p&gt;&lt;p&gt;&lt;br&gt;&lt;/p&gt;&lt;p&gt;Zubehör: Abschussbecher, Reinigungsbürste, Bedienungsanleitung und Koffer&lt;br&gt;&lt;/p&gt;&lt;p&gt;&lt;br&gt;&lt;/p&gt;', 'Schreckschusswaffe, 9mm,', 'Zoraki R1 6&quot; black', 'Zoraki R1 6&quot; black', 'Zoraki R1 6 9mm PAK GAsi'),
(1310, 2, 'Zoraki R1 4,5&quot; black', '&lt;p&gt;Seit ihrer Markteinführung überzeugen die Gas-Signalwaffen von Zoraki mit einem unschlagbaren Preis-Leistungsverhältnis.&lt;/p&gt;&lt;p&gt;Material, Verarbeitung und die damit einhergehende Funktionalität sowie Zuverlässigkeit suchen ihresgleichen auf dem deutschen Markt. &lt;/p&gt;&lt;p&gt;Der neue R1 ist ein klassischer Double-Action Revolver mit 4,5“ Lauflänge. &lt;/p&gt;&lt;p&gt;Sowohl die 6 Schuss fassende Trommel wie auch diverse Bauteile sind aus hochwertigem Stahl gefertigt und sorgfältig\r\n verarbeitet. &lt;/p&gt;&lt;p&gt;Dem entsprechend präzise ist der Schlossgang beim Modell R1.&lt;/p&gt;&lt;p&gt;&lt;br&gt;&lt;/p&gt;&lt;p&gt;Zubehör: Abschussbecher, Reinigungsbürste, Bedienungsanleitung und Koffer&lt;br&gt;&lt;/p&gt;&lt;p&gt;&lt;br&gt;&lt;/p&gt;', 'Schreckschusswaffe, 9mm,', 'Zoraki R1 4,5&quot; black', 'Zoraki R1 4,5 Zoll black', 'Zoraki R1 4,5 9mm PAK GAsi'),
(1310, 1, 'Zoraki R1 4,5&quot; black.', '', '', 'Zoraki R1 4,5&quot; black.', '', ''),
(1311, 2, 'Zoraki R1 4,5&quot; Titan', '&lt;p&gt;Seit ihrer Markteinführung überzeugen die Gas-Signalwaffen von Zoraki mit einem unschlagbaren Preis-Leistungsverhältnis.&lt;/p&gt;&lt;p&gt;Material, Verarbeitung und die damit einhergehende Funktionalität sowie Zuverlässigkeit suchen ihresgleichen auf dem deutschen Markt. &lt;/p&gt;&lt;p&gt;Der neue R1 ist ein klassischer Double-Action Revolver mit 4,5“ Lauflänge. &lt;/p&gt;&lt;p&gt;Sowohl die 6 Schuss fassende Trommel wie auch diverse Bauteile sind aus hochwertigem Stahl gefertigt und sorgfältig\r\n verarbeitet. &lt;/p&gt;&lt;p&gt;Dem entsprechend präzise ist der Schlossgang beim Modell R1, die neue Sonderedition in Shiny Black und Holzoptikgriffschalen ergänzt die R1-Serie nun. &lt;/p&gt;&lt;p&gt;&lt;br&gt;&lt;/p&gt;&lt;p&gt;Zubehör: Abschussbecher, Reinigungsbürste, Bedienungsanleitung und Koffer&lt;br&gt;&lt;/p&gt;&lt;p&gt;&lt;br&gt;&lt;/p&gt;', 'Schreckschusswaffe, 9mm,', 'Zoraki R1 4,5&quot; Titan', 'Zoraki R1 4,5 Zoll Titan', 'Zoraki R1 4,5 9mm PAK GAsi'),
(1311, 1, 'Zoraki R1 4,5&quot; Titan', '', '', 'Zoraki R1 4,5&quot; Titan', '', ''),
(1312, 1, 'Zoraki R1 6&quot; SHINY mit Griffen in Holzoptik', '', '', 'Zoraki R1 6&quot; SHINY mit Griffen in Holzoptik', '', ''),
(1313, 2, 'Zoraki R2 2&quot; Schwarz', '&lt;p&gt;Der Zoraki R2 Signalrevolver ergänzt ab jetzt den erfolgreichen Zoraki R1 Revolver. &lt;br&gt;&lt;/p&gt;&lt;p&gt;Er ist, wie auch der R1, ein hochwertig verarbeiteter Gas-Signalrevolver aus dem Hause Atak Arms mit integrierter Fallsicherung,&lt;/p&gt;&lt;p&gt;Griffstück aus Metall und Griffschalen aus schlagfestem \r\nKunststoff.&amp;nbsp;&lt;/p&gt;&lt;p&gt;Durch seinen Single-/Double-Action Abzug eignet sie der \r\nRevolver auch perfekt zum Selbstschutz.&amp;nbsp;Der Zoraki R2 Gasrevolver liegt gut in der Hand. &lt;/p&gt;&lt;p&gt;Die&amp;nbsp;Stahltrommel&amp;nbsp;bietet Platz für 6 Schuss. &lt;br&gt;&lt;/p&gt;&lt;p&gt;&lt;br&gt;&lt;/p&gt;&lt;p&gt;&lt;br&gt;&lt;/p&gt;&lt;p&gt;Zubehör: Abschussbecher, Koffer, Reinigungsbürste und Bedienungsanleitung&lt;br&gt;&lt;/p&gt;', 'Schreckschusswaffe, 9mm,', 'Zoraki R2 2&quot; Schwarz', 'Zoraki R2 2&quot; Schwarz', 'Zoraki R2 2&quot; schwarz'),
(1313, 1, 'Zoraki R2 2&quot; Schwarz', '', '', 'Zoraki R2 2&quot; Schwarz', '', ''),
(1314, 1, 'Zoraki R2 2&quot; Titan', '', '', 'Zoraki R2 2&quot; Titan', '', ''),
(1314, 2, 'Zoraki R2 2&quot; Titan', '&lt;p&gt;Der Zoraki R2 Signalrevolver ergänzt ab jetzt den erfolgreichen Zoraki R1 Revolver. &lt;br&gt;&lt;/p&gt;&lt;p&gt;Er ist, wie auch der R1, ein hochwertig verarbeiteter Gas-Signalrevolver aus dem Hause Atak Arms mit integrierter Fallsicherung,&lt;/p&gt;&lt;p&gt;Griffstück aus Metall und Griffschalen aus schlagfestem \r\nKunststoff.&amp;nbsp;&lt;/p&gt;&lt;p&gt;Durch seinen Single-/Double-Action Abzug eignet sie der \r\nRevolver auch perfekt zum Selbstschutz.&amp;nbsp;Der Zoraki R2 Gasrevolver liegt gut in der Hand. &lt;/p&gt;&lt;p&gt;Die&amp;nbsp;Stahltrommel&amp;nbsp;bietet Platz für 6 Schuss. &lt;br&gt;&lt;/p&gt;&lt;p&gt;&lt;br&gt;&lt;/p&gt;&lt;p&gt;&lt;br&gt;&lt;/p&gt;&lt;p&gt;Zubehör: Abschussbecher, Koffer, Reinigungsbürste und Bedienungsanleitung&lt;br&gt;&lt;/p&gt;', 'Schreckschusswaffe, 9mm,', 'Zoraki R2 2&quot; Titan', 'Zoraki R2 2&quot; Titan', 'Zoraki R2 2&quot; Titan'),
(1315, 2, 'Weihrauch HW 37 black', '&lt;p style=&quot;text-align: justify;&quot;&gt;Der Selbstschutzrevolver HW 37&amp;nbsp; ist eine\r\n weitere interessante Entwicklung für den optimalen Selbstschutz in Kal.\r\n 9 mm. &lt;/p&gt;&lt;p style=&quot;text-align: justify;&quot;&gt;Im klassischen, amerikanischen Design, kompakt und handlich, \r\nideal zum unauffälligen Tragen. &lt;/p&gt;&lt;p style=&quot;text-align: justify;&quot;&gt;Völlig neu entwickelter \r\nAbzugsmechanismus, weich und präzise, besonders auch für Damen geeignet.\r\n &lt;/p&gt;&lt;p style=&quot;text-align: justify;&quot;&gt;Alle Funktionsteile des Abzugsmechanismus wie z. B. Hahn und Abzug aus \r\nStahl.&lt;/p&gt;&lt;p&gt;\r\nFür alle HW-Selbstschutzwaffen können \r\nsowohl Knall- als auch Gaspatronen verwendet werden (Ausnahmen HW 37 S \r\nund Western-Single-Action-Revolver). &lt;/p&gt;&lt;p&gt;Die Patronen mit Pfeffergas sind für den Selbstschutz besonders zu empfehlen&lt;/p&gt;&lt;p&gt;&lt;br&gt;&lt;/p&gt;&lt;p&gt;Zubehör: Bedienungsanleitung, Reinigungsbürste, Abschussbecher und Gewindeschoner im dekorativen Karton&lt;br&gt;&lt;/p&gt;', 'Schreckschusswaffe, 9mm,', 'Weihrauch HW37 black', 'Weihrauch HW 37 der klassiker', 'Weihracuh Gasi Weihrauch Hw 37'),
(1315, 1, 'Weihrauch HW37 black', '', '', 'Weihrauch HW37 black', '', ''),
(1316, 2, 'Weihrauch HW 37 Stainless', '&lt;p style=&quot;text-align: justify;&quot;&gt;Der Selbstschutzrevolver HW 37&amp;nbsp; ist eine\r\n weitere interessante Entwicklung für den optimalen Selbstschutz in Kal.\r\n 9 mm. &lt;/p&gt;&lt;p style=&quot;text-align: justify;&quot;&gt;Im klassischen, amerikanischen Design, kompakt und handlich, \r\nideal zum unauffälligen Tragen. &lt;/p&gt;&lt;p style=&quot;text-align: justify;&quot;&gt;Völlig neu entwickelter \r\nAbzugsmechanismus, weich und präzise, besonders auch für Damen geeignet.\r\n &lt;/p&gt;&lt;p style=&quot;text-align: justify;&quot;&gt;Alle Funktionsteile des Abzugsmechanismus wie z. B. Hahn und Abzug aus \r\nStahl.&lt;/p&gt;&lt;p&gt;\r\nFür alle HW-Selbstschutzwaffen können \r\nsowohl Knall- als auch Gaspatronen verwendet werden (Ausnahmen HW 37 S \r\nund Western-Single-Action-Revolver). &lt;/p&gt;&lt;p&gt;Die Patronen mit Pfeffergas sind für den Selbstschutz besonders zu empfehlen&lt;/p&gt;&lt;p&gt;&lt;br&gt;&lt;/p&gt;&lt;p&gt;Zubehör: Bedienungsanleitung, Reinigungsbürste, Abschussbecher und Gewindeschoner im dekorativen Karton&lt;br&gt;&lt;/p&gt;', 'Schreckschusswaffe, 9mm,', 'Weihrauch HW 37 Stainless', 'Weihrauch HW 37 der klassiker', 'Weihracuh Gasi Weihrauch Hw 37'),
(1316, 1, 'Weihrauch HW37 Stainless', '', '', 'Weihrauch HW37 Stainless', '', ''),
(1317, 2, 'Weihrauch HW 88 black', '&lt;p style=&quot;text-align: justify;&quot;&gt;Der \r\nSelbstschutzrevolver HW 88 SUPER Airweight ist der zur Zeit leichteste \r\n&quot;9-mm-Revolver&quot; auf dem Markt. &lt;/p&gt;&lt;p style=&quot;text-align: justify;&quot;&gt;Im Design eines bekannten amerikanischen \r\nTaschenrevolvers. &lt;/p&gt;&lt;p style=&quot;text-align: justify;&quot;&gt;Durch den Einsatz von High-Tech-Aluminiumwerkstoffen \r\nkonnte ein geringes Gewicht von nur 277 g erreicht werden. &lt;/p&gt;&lt;p style=&quot;text-align: justify;&quot;&gt;Er ist \r\ndeshalb besonders handlich und unauffällig tragbar, besonders auch für \r\nDamen. &lt;/p&gt;&lt;p style=&quot;text-align: justify;&quot;&gt;Der Abzugsgang ist sehr weich und präzise. Alle Funktionsteile \r\ndes Abzugsmechanismus wie z. B. Hahn und Abzug sind aus Stahl.&lt;/p&gt;&lt;div class=&quot;textwidget&quot;&gt;\r\n&lt;p style=&quot;text-align: justify;&quot;&gt;Für alle HW-Selbstschutzwaffen können \r\nsowohl Knall- als auch Gaspatronen verwendet werden (Ausnahmen HW 37 S \r\nund Western-Single-Action-Revolver). &lt;/p&gt;&lt;p style=&quot;text-align: justify;&quot;&gt;Die Patronen mit Peffer \r\nsind für den Selbstschutz besonders zu empfehlen.&lt;/p&gt;&lt;p style=&quot;text-align: justify;&quot;&gt;&lt;br&gt;&lt;/p&gt;&lt;p style=&quot;text-align: justify;&quot;&gt;Zubehör: Abschussbecher, Reinigungsbürste, Gewindeschoner und Bedienungsanleitung&lt;br&gt;&lt;/p&gt;\r\n&lt;/div&gt;&lt;p&gt;&lt;br&gt;&lt;/p&gt;', 'Schreckschusswaffe, 9mm,', 'Weihrauch HW 88 black', 'Der Weihrauch Hw 88 ist der leichteste Revolver von allen', 'Weihrauch Hw88 weisrauch Gasi'),
(1317, 1, 'Weihrauch HW 88 black', '', '', 'Weihrauch HW 88 black', '', '');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `oc_product_discount`
--

DROP TABLE IF EXISTS `oc_product_discount`;
CREATE TABLE `oc_product_discount` (
  `product_discount_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `customer_group_id` int(11) NOT NULL,
  `quantity` int(4) NOT NULL DEFAULT 0,
  `priority` int(5) NOT NULL DEFAULT 1,
  `price` decimal(15,4) NOT NULL DEFAULT 0.0000,
  `date_start` date NOT NULL DEFAULT '0000-00-00',
  `date_end` date NOT NULL DEFAULT '0000-00-00'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `oc_product_filter`
--

DROP TABLE IF EXISTS `oc_product_filter`;
CREATE TABLE `oc_product_filter` (
  `product_id` int(11) NOT NULL,
  `filter_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `oc_product_image`
--

DROP TABLE IF EXISTS `oc_product_image`;
CREATE TABLE `oc_product_image` (
  `product_image_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `sort_order` int(3) NOT NULL DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `oc_product_image`
--

INSERT INTO `oc_product_image` (`product_image_id`, `product_id`, `image`, `sort_order`) VALUES
(55823, 1252, 'catalog/Gaspistolen/Heckler_Koch/20170818-302.02.00_P30_persp_ret.JPG', 2),
(55822, 1252, 'catalog/Gaspistolen/Heckler_Koch/20170818-302.02.00_P30_rechts.JPG', 1),
(55825, 1253, 'catalog/Gaspistolen/Zoraki/917/Schreckschusspistole Zoraki 917 schwarz right.png', 0),
(55826, 1257, 'catalog/Gaspistolen/Walther/Walther_P_22/20170818-308.02.00_P22_persp.JPG', 0),
(55830, 1258, 'catalog/Gaspistolen/Walther/Walther_P_22/20170818-308.02.01_P22_persp.JPG', 0),
(55831, 1263, 'catalog/Gaspistolen/Walther/Walther_PPQ/20101104-310.02.00_PPQ_rechts_ret.JPG', 1),
(55832, 1263, 'catalog/Gaspistolen/Walther/Walther_PPQ/20101104-310.02.00_PPQ_persp_ret.JPG', 2),
(55833, 1263, 'catalog/Gaspistolen/Walther/Walther_PPQ/20131009-310.02.00_PPQ_Sonderpersp1.JPG', 3),
(55834, 1263, 'catalog/Gaspistolen/Walther/Walther_PPQ/20131009-310.02.00_PPQ_Sonderpersp2.JPG', 4),
(55841, 1267, 'catalog/Gaspistolen/Colt/1911/20180215-317.02.30_1911A1_persp.JPG', 0),
(55840, 1266, 'catalog/Gaspistolen/Browning/20170818-318.02.12_GPDA9_persp.JPG', 0),
(55839, 1264, 'catalog/Gaspistolen/Walther/Walther_PPQ/20140128-310.02.05_PPQM2NavyKit_rechts_ret.JPG', 2),
(55843, 1268, 'catalog/Gaspistolen/Colt/1911/20170419-317.02.38_Government1911_rechts.JPG', 0),
(55844, 1268, 'catalog/Gaspistolen/Colt/1911/20170420-317.02.38_Government1911_persp.JPG', 0),
(55856, 1283, 'catalog/Gaspistolen/Roehm/RG_56/722.02.25_RG56_persp_472_400_0.jpg', 0),
(55857, 1284, 'catalog/Gaspistolen/Roehm/RG_59/722.02.00_RG59_persp_476_400_0.jpg', 0),
(55849, 1285, 'catalog/Gaspistolen/Roehm/RG_59/722.02.06_RG59_pers_450_400_0.jpg', 0),
(55860, 1286, 'catalog/Gaspistolen/Roehm/RG_89/721.02.00_RG89_persp_492_400_0.jpg', 0),
(55862, 1287, 'catalog/Gaspistolen/Roehm/RG_89/721.02.06_RG89_persp_600_400_0.jpg', 0),
(55861, 1287, 'catalog/Gaspistolen/Roehm/RG_89/721.02.06_RG89_rechts_600_400_0.jpg', 0),
(55864, 1291, 'catalog/Gaspistolen/Colt/Combat_Special/20180215-344.02.49_DetectiveSpecial_persp.JPG', 0),
(55867, 1292, 'catalog/Gaspistolen/Zoraki/917/z510049_Zoraki_917_matt_chrom_2.jpg', 0),
(55868, 1293, 'catalog/Gaspistolen/Zoraki/917/-5030-2_3.jpg', 0),
(55869, 1293, 'catalog/Gaspistolen/Zoraki/917/-5030-3.jpg', 0),
(55870, 1294, 'catalog/Gaspistolen/Zoraki/918/Schreckschusspistole_Zoraki_918_matt_schwarz_rechts.png', 0),
(55872, 1295, 'catalog/Gaspistolen/Zoraki/918/Z510059_Zoraki_918_matt_chrom_2.jpg', 0),
(55873, 1296, 'catalog/Gaspistolen/Zoraki/914/914 schwarz rechts.jpg', 0),
(55874, 1296, '', 0),
(55890, 1299, 'catalog/Gaspistolen/Zoraki/2918/Z510070_Zoraki_2918_schwarz_2.png', 0),
(55880, 1298, 'catalog/Gaspistolen/Zoraki/914/914 Satina rechts.jpg', 0),
(55891, 1300, 'catalog/Gaspistolen/Zoraki/2918/Z510079_Zoraki_2918_matt_chrom_2.jpg', 0),
(55892, 1301, 'catalog/Gaspistolen/Zoraki/4918/Z510080_Zoraki_4918_schwarz_2.png', 0),
(55893, 1302, 'catalog/Gaspistolen/Zoraki/4918/Z510089_Zoraki_4918_matt_chrom_2.jpg', 0),
(55908, 1304, 'catalog/Gaspistolen/Zoraki/925/Z510925CMF_Zoraki_925_camo_2.jpg', 0),
(55895, 1305, 'catalog/Gaspistolen/Zoraki/906/906_schwarz_schräg.jpg', 0),
(55897, 1306, 'catalog/Gaspistolen/Zoraki/906/Schreckschusspistole Zoraki 906 Titan Black rechts.png', 0),
(55898, 1307, 'catalog/Gaspistolen/Zoraki/R_1/-5125-2.jpg', 0),
(55899, 1307, 'catalog/Gaspistolen/Zoraki/R_1/-5125-3.jpg', 0),
(55902, 1308, 'catalog/Gaspistolen/Zoraki/R_1/Zoraki R1 4_5 Zoll Shiny rechts.jpg', 0),
(55903, 1308, 'catalog/Gaspistolen/Zoraki/R_1/Zoraki R1 4_5 Zoll Shiny offen.jpg', 0),
(55924, 1309, 'catalog/Gaspistolen/Zoraki/R_1/Zoraki R1 6 Zoll rechts.jpg', 1),
(55923, 1309, 'catalog/Gaspistolen/Zoraki/R_1/Zoraki R1 6 Zoll offen.jpg', 2),
(55918, 1313, 'catalog/Gaspistolen/Zoraki/R_2/Z510130_Zoraki_R2_2_Zoll_schwarz_2.png', 0),
(55913, 1310, 'catalog/Gaspistolen/Zoraki/R_1/Z510090_Zoraki_R1_4_5_schwarz_2.png', 0),
(55922, 1312, 'catalog/Gaspistolen/Zoraki/R_1/Z510100_Zoraki_R1_6_schwarz_2.png', 0),
(55914, 1311, 'catalog/Gaspistolen/Zoraki/R_1/Z510091_Zoraki_R1_Titan_4,5_2.png', 0),
(55921, 1314, 'catalog/Gaspistolen/Zoraki/R_2/Z510131_Zoraki_R2_2_titan_2.png', 0);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `oc_product_option`
--

DROP TABLE IF EXISTS `oc_product_option`;
CREATE TABLE `oc_product_option` (
  `product_option_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `option_id` int(11) NOT NULL,
  `value` text NOT NULL,
  `required` tinyint(1) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `oc_product_option_value`
--

DROP TABLE IF EXISTS `oc_product_option_value`;
CREATE TABLE `oc_product_option_value` (
  `product_option_value_id` int(11) NOT NULL,
  `product_option_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `option_id` int(11) NOT NULL,
  `option_value_id` int(11) NOT NULL,
  `quantity` int(3) NOT NULL,
  `subtract` tinyint(1) NOT NULL,
  `price` decimal(15,4) NOT NULL,
  `price_prefix` varchar(1) NOT NULL,
  `points` int(8) NOT NULL,
  `points_prefix` varchar(1) NOT NULL,
  `weight` decimal(15,8) NOT NULL,
  `weight_prefix` varchar(1) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `oc_product_recurring`
--

DROP TABLE IF EXISTS `oc_product_recurring`;
CREATE TABLE `oc_product_recurring` (
  `product_id` int(11) NOT NULL,
  `recurring_id` int(11) NOT NULL,
  `customer_group_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `oc_product_related`
--

DROP TABLE IF EXISTS `oc_product_related`;
CREATE TABLE `oc_product_related` (
  `product_id` int(11) NOT NULL,
  `related_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `oc_product_reward`
--

DROP TABLE IF EXISTS `oc_product_reward`;
CREATE TABLE `oc_product_reward` (
  `product_reward_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL DEFAULT 0,
  `customer_group_id` int(11) NOT NULL DEFAULT 0,
  `points` int(8) NOT NULL DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `oc_product_special`
--

DROP TABLE IF EXISTS `oc_product_special`;
CREATE TABLE `oc_product_special` (
  `product_special_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `customer_group_id` int(11) NOT NULL,
  `priority` int(5) NOT NULL DEFAULT 1,
  `price` decimal(15,4) NOT NULL DEFAULT 0.0000,
  `date_start` date NOT NULL DEFAULT '0000-00-00',
  `date_end` date NOT NULL DEFAULT '0000-00-00'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `oc_product_to_category`
--

DROP TABLE IF EXISTS `oc_product_to_category`;
CREATE TABLE `oc_product_to_category` (
  `product_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `oc_product_to_category`
--

INSERT INTO `oc_product_to_category` (`product_id`, `category_id`) VALUES
(1251, 162),
(1251, 173),
(1251, 196),
(1252, 162),
(1252, 173),
(1252, 196),
(1253, 162),
(1253, 173),
(1253, 196),
(1254, 162),
(1254, 173),
(1254, 196),
(1255, 162),
(1255, 173),
(1255, 196),
(1256, 162),
(1256, 173),
(1256, 196),
(1257, 162),
(1257, 173),
(1257, 196),
(1258, 162),
(1258, 173),
(1258, 196),
(1259, 162),
(1259, 173),
(1259, 196),
(1260, 162),
(1260, 173),
(1260, 196),
(1261, 162),
(1261, 173),
(1261, 196),
(1262, 162),
(1262, 173),
(1262, 196),
(1263, 162),
(1263, 173),
(1263, 196),
(1264, 162),
(1264, 173),
(1264, 196),
(1265, 162),
(1265, 173),
(1265, 196),
(1266, 162),
(1266, 173),
(1266, 196),
(1267, 162),
(1267, 173),
(1267, 196),
(1268, 162),
(1268, 173),
(1268, 196),
(1269, 162),
(1269, 173),
(1269, 219),
(1269, 229),
(1270, 162),
(1270, 173),
(1270, 219),
(1270, 229),
(1271, 162),
(1271, 173),
(1271, 219),
(1271, 229),
(1272, 162),
(1272, 173),
(1272, 219),
(1272, 229),
(1273, 162),
(1273, 219),
(1274, 162),
(1274, 219),
(1275, 162),
(1275, 172),
(1275, 219),
(1275, 228),
(1276, 162),
(1276, 174),
(1276, 219),
(1276, 230),
(1277, 162),
(1277, 174),
(1277, 219),
(1277, 230),
(1278, 162),
(1278, 174),
(1278, 219),
(1278, 230),
(1279, 162),
(1279, 174),
(1279, 219),
(1279, 230),
(1280, 162),
(1280, 173),
(1280, 196),
(1281, 162),
(1281, 173),
(1281, 196),
(1282, 162),
(1282, 172),
(1282, 195),
(1283, 162),
(1283, 172),
(1283, 195),
(1284, 162),
(1284, 174),
(1284, 197),
(1285, 162),
(1285, 174),
(1285, 197),
(1286, 162),
(1286, 174),
(1286, 197),
(1287, 162),
(1287, 174),
(1287, 197),
(1288, 162),
(1288, 174),
(1288, 197),
(1289, 162),
(1289, 174),
(1289, 197),
(1290, 162),
(1290, 174),
(1290, 197),
(1291, 162),
(1291, 174),
(1291, 197),
(1292, 162),
(1292, 173),
(1292, 196),
(1293, 162),
(1293, 173),
(1293, 196),
(1294, 162),
(1294, 173),
(1294, 196),
(1295, 162),
(1295, 173),
(1295, 196),
(1296, 162),
(1296, 173),
(1296, 196),
(1297, 162),
(1297, 173),
(1297, 196),
(1298, 162),
(1298, 173),
(1298, 196),
(1299, 162),
(1299, 173),
(1299, 196),
(1300, 162),
(1300, 173),
(1300, 196),
(1301, 162),
(1301, 173),
(1301, 196),
(1302, 162),
(1302, 173),
(1302, 196),
(1303, 162),
(1303, 173),
(1303, 196),
(1304, 162),
(1304, 173),
(1304, 196),
(1305, 162),
(1305, 173),
(1305, 196),
(1306, 162),
(1306, 173),
(1306, 196),
(1307, 162),
(1307, 174),
(1307, 197),
(1308, 162),
(1308, 174),
(1308, 197),
(1309, 162),
(1309, 174),
(1309, 197),
(1310, 162),
(1310, 174),
(1310, 197),
(1311, 162),
(1311, 174),
(1311, 197),
(1312, 162),
(1312, 174),
(1312, 197),
(1313, 162),
(1313, 174),
(1313, 197),
(1314, 162),
(1314, 174),
(1314, 197),
(1315, 162),
(1315, 174),
(1315, 197),
(1316, 162),
(1316, 174),
(1316, 197),
(1317, 162),
(1317, 174),
(1317, 197);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `oc_product_to_download`
--

DROP TABLE IF EXISTS `oc_product_to_download`;
CREATE TABLE `oc_product_to_download` (
  `product_id` int(11) NOT NULL,
  `download_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `oc_product_to_layout`
--

DROP TABLE IF EXISTS `oc_product_to_layout`;
CREATE TABLE `oc_product_to_layout` (
  `product_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  `layout_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `oc_product_to_layout`
--

INSERT INTO `oc_product_to_layout` (`product_id`, `store_id`, `layout_id`) VALUES
(1251, 0, 0),
(1252, 0, 0),
(1253, 0, 0),
(1254, 0, 0),
(1255, 0, 0),
(1256, 0, 0),
(1257, 0, 0),
(1258, 0, 0),
(1259, 0, 0),
(1260, 0, 0),
(1261, 0, 0),
(1262, 0, 0),
(1263, 0, 0),
(1264, 0, 0),
(1265, 0, 0),
(1266, 0, 0),
(1267, 0, 0),
(1268, 0, 0),
(1269, 0, 0),
(1270, 0, 0),
(1271, 0, 0),
(1272, 0, 0),
(1273, 0, 0),
(1274, 0, 0),
(1275, 0, 0),
(1276, 0, 0),
(1277, 0, 0),
(1278, 0, 0),
(1279, 0, 0),
(1280, 0, 0),
(1281, 0, 0),
(1282, 0, 0),
(1283, 0, 0),
(1284, 0, 0),
(1285, 0, 0),
(1286, 0, 0),
(1287, 0, 0),
(1288, 0, 0),
(1289, 0, 0),
(1290, 0, 0),
(1291, 0, 0),
(1292, 0, 0),
(1293, 0, 0),
(1294, 0, 0),
(1295, 0, 0),
(1296, 0, 0),
(1297, 0, 0),
(1298, 0, 0),
(1299, 0, 0),
(1300, 0, 0),
(1301, 0, 0),
(1302, 0, 0),
(1303, 0, 0),
(1304, 0, 0),
(1305, 0, 0),
(1306, 0, 0),
(1307, 0, 0),
(1308, 0, 0),
(1309, 0, 0),
(1310, 0, 0),
(1311, 0, 0),
(1312, 0, 0),
(1313, 0, 0),
(1314, 0, 0),
(1315, 0, 0),
(1316, 0, 0),
(1317, 0, 0);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `oc_product_to_store`
--

DROP TABLE IF EXISTS `oc_product_to_store`;
CREATE TABLE `oc_product_to_store` (
  `product_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `oc_product_to_store`
--

INSERT INTO `oc_product_to_store` (`product_id`, `store_id`) VALUES
(1251, 0),
(1252, 0),
(1253, 0),
(1254, 0),
(1255, 0),
(1256, 0),
(1257, 0),
(1258, 0),
(1259, 0),
(1260, 0),
(1261, 0),
(1262, 0),
(1263, 0),
(1264, 0),
(1265, 0),
(1266, 0),
(1267, 0),
(1268, 0),
(1269, 0),
(1270, 0),
(1271, 0),
(1272, 0),
(1273, 0),
(1274, 0),
(1275, 0),
(1276, 0),
(1277, 0),
(1278, 0),
(1279, 0),
(1280, 0),
(1281, 0),
(1282, 0),
(1283, 0),
(1284, 0),
(1285, 0),
(1286, 0),
(1287, 0),
(1288, 0),
(1289, 0),
(1290, 0),
(1291, 0),
(1292, 0),
(1293, 0),
(1294, 0),
(1295, 0),
(1296, 0),
(1297, 0),
(1298, 0),
(1299, 0),
(1300, 0),
(1301, 0),
(1302, 0),
(1303, 0),
(1304, 0),
(1305, 0),
(1306, 0),
(1307, 0),
(1308, 0),
(1309, 0),
(1310, 0),
(1311, 0),
(1312, 0),
(1313, 0),
(1314, 0),
(1315, 0),
(1316, 0),
(1317, 0);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `oc_recurring`
--

DROP TABLE IF EXISTS `oc_recurring`;
CREATE TABLE `oc_recurring` (
  `recurring_id` int(11) NOT NULL,
  `price` decimal(10,4) NOT NULL,
  `frequency` enum('day','week','semi_month','month','year') NOT NULL,
  `duration` int(10) UNSIGNED NOT NULL,
  `cycle` int(10) UNSIGNED NOT NULL,
  `trial_status` tinyint(4) NOT NULL,
  `trial_price` decimal(10,4) NOT NULL,
  `trial_frequency` enum('day','week','semi_month','month','year') NOT NULL,
  `trial_duration` int(10) UNSIGNED NOT NULL,
  `trial_cycle` int(10) UNSIGNED NOT NULL,
  `status` tinyint(4) NOT NULL,
  `sort_order` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `oc_recurring_description`
--

DROP TABLE IF EXISTS `oc_recurring_description`;
CREATE TABLE `oc_recurring_description` (
  `recurring_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `oc_return`
--

DROP TABLE IF EXISTS `oc_return`;
CREATE TABLE `oc_return` (
  `return_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `firstname` varchar(32) NOT NULL,
  `lastname` varchar(32) NOT NULL,
  `email` varchar(96) NOT NULL,
  `telephone` varchar(32) NOT NULL,
  `product` varchar(255) NOT NULL,
  `model` varchar(64) NOT NULL,
  `quantity` int(4) NOT NULL,
  `opened` tinyint(1) NOT NULL,
  `return_reason_id` int(11) NOT NULL,
  `return_action_id` int(11) NOT NULL,
  `return_status_id` int(11) NOT NULL,
  `comment` text DEFAULT NULL,
  `date_ordered` date NOT NULL DEFAULT '0000-00-00',
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `oc_return_action`
--

DROP TABLE IF EXISTS `oc_return_action`;
CREATE TABLE `oc_return_action` (
  `return_action_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL DEFAULT 0,
  `name` varchar(64) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `oc_return_action`
--

INSERT INTO `oc_return_action` (`return_action_id`, `language_id`, `name`) VALUES
(1, 1, 'Refunded'),
(2, 1, 'Credit Issued'),
(3, 1, 'Replacement Sent'),
(1, 2, 'Refunded'),
(2, 2, 'Credit Issued'),
(3, 2, 'Replacement Sent');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `oc_return_history`
--

DROP TABLE IF EXISTS `oc_return_history`;
CREATE TABLE `oc_return_history` (
  `return_history_id` int(11) NOT NULL,
  `return_id` int(11) NOT NULL,
  `return_status_id` int(11) NOT NULL,
  `notify` tinyint(1) NOT NULL,
  `comment` text NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `oc_return_reason`
--

DROP TABLE IF EXISTS `oc_return_reason`;
CREATE TABLE `oc_return_reason` (
  `return_reason_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL DEFAULT 0,
  `name` varchar(128) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `oc_return_reason`
--

INSERT INTO `oc_return_reason` (`return_reason_id`, `language_id`, `name`) VALUES
(1, 1, 'Dead On Arrival'),
(2, 1, 'Received Wrong Item'),
(3, 1, 'Order Error'),
(4, 1, 'Faulty, please supply details'),
(5, 1, 'Other, please supply details'),
(1, 2, 'Dead On Arrival'),
(2, 2, 'Received Wrong Item'),
(3, 2, 'Order Error'),
(4, 2, 'Faulty, please supply details'),
(5, 2, 'Other, please supply details');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `oc_return_status`
--

DROP TABLE IF EXISTS `oc_return_status`;
CREATE TABLE `oc_return_status` (
  `return_status_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL DEFAULT 0,
  `name` varchar(32) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `oc_return_status`
--

INSERT INTO `oc_return_status` (`return_status_id`, `language_id`, `name`) VALUES
(1, 1, 'Pending'),
(3, 1, 'Complete'),
(2, 1, 'Awaiting Products'),
(1, 2, 'Pending'),
(3, 2, 'Complete'),
(2, 2, 'Awaiting Products');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `oc_review`
--

DROP TABLE IF EXISTS `oc_review`;
CREATE TABLE `oc_review` (
  `review_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `author` varchar(64) NOT NULL,
  `text` text NOT NULL,
  `rating` int(1) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `oc_setting`
--

DROP TABLE IF EXISTS `oc_setting`;
CREATE TABLE `oc_setting` (
  `setting_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL DEFAULT 0,
  `code` varchar(32) NOT NULL,
  `key` varchar(64) NOT NULL,
  `value` text NOT NULL,
  `serialized` tinyint(1) NOT NULL,
  `group` varchar(32) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `oc_setting`
--

INSERT INTO `oc_setting` (`setting_id`, `store_id`, `code`, `key`, `value`, `serialized`, `group`) VALUES
(435, 0, 'voucher', 'voucher_sort_order', '8', 0, NULL),
(434, 0, 'voucher', 'voucher_status', '0', 0, NULL),
(5800, 0, 'payengine3cw', 'payengine3cw_operating_mode', 'live', 0, NULL),
(4996, 0, 'free_checkout', 'free_checkout_status', '0', 0, NULL),
(97, 0, 'shipping', 'shipping_sort_order', '3', 0, NULL),
(98, 0, 'sub_total', 'sub_total_sort_order', '1', 0, NULL),
(99, 0, 'sub_total', 'sub_total_status', '1', 0, NULL),
(100, 0, 'tax', 'tax_status', '1', 0, NULL),
(101, 0, 'total', 'total_sort_order', '9', 0, NULL),
(102, 0, 'total', 'total_status', '1', 0, NULL),
(103, 0, 'tax', 'tax_sort_order', '5', 0, NULL),
(4995, 0, 'free_checkout', 'free_checkout_order_status_id', '1', 0, NULL),
(9567, 0, 'cod', 'cod_status', '1', 0, NULL),
(9566, 0, 'cod', 'cod_geo_zone_id', '0', 0, NULL),
(110, 0, 'shipping', 'shipping_status', '1', 0, NULL),
(111, 0, 'shipping', 'shipping_estimator', '1', 0, NULL),
(433, 0, 'coupon', 'coupon_sort_order', '4', 0, NULL),
(432, 0, 'coupon', 'coupon_status', '0', 0, NULL),
(119, 0, 'credit', 'credit_sort_order', '7', 0, NULL),
(120, 0, 'credit', 'credit_status', '1', 0, NULL),
(437, 0, 'reward', 'reward_sort_order', '2', 0, NULL),
(436, 0, 'reward', 'reward_status', '0', 0, NULL),
(123, 0, 'category', 'category_status', '1', 0, NULL),
(124, 0, 'account', 'account_status', '1', 0, NULL),
(125, 0, 'affiliate', 'affiliate_status', '1', 0, NULL),
(3237, 0, 'theme_default', 'theme_default_image_wishlist_height', '47', 0, NULL),
(3236, 0, 'theme_default', 'theme_default_image_wishlist_width', '47', 0, NULL),
(3235, 0, 'theme_default', 'theme_default_image_compare_height', '90', 0, NULL),
(3234, 0, 'theme_default', 'theme_default_image_compare_width', '90', 0, NULL),
(3233, 0, 'theme_default', 'theme_default_image_related_height', '200', 0, NULL),
(3232, 0, 'theme_default', 'theme_default_image_related_width', '200', 0, NULL),
(3231, 0, 'theme_default', 'theme_default_image_additional_height', '74', 0, NULL),
(3230, 0, 'theme_default', 'theme_default_image_additional_width', '74', 0, NULL),
(3229, 0, 'theme_default', 'theme_default_image_product_height', '228', 0, NULL),
(150, 0, 'dashboard_activity', 'dashboard_activity_status', '1', 0, NULL),
(151, 0, 'dashboard_activity', 'dashboard_activity_sort_order', '7', 0, NULL),
(152, 0, 'dashboard_sale', 'dashboard_sale_status', '1', 0, NULL),
(153, 0, 'dashboard_sale', 'dashboard_sale_width', '3', 0, NULL),
(154, 0, 'dashboard_chart', 'dashboard_chart_status', '1', 0, NULL),
(155, 0, 'dashboard_chart', 'dashboard_chart_width', '6', 0, NULL),
(156, 0, 'dashboard_customer', 'dashboard_customer_status', '1', 0, NULL),
(157, 0, 'dashboard_customer', 'dashboard_customer_width', '3', 0, NULL),
(158, 0, 'dashboard_map', 'dashboard_map_status', '1', 0, NULL),
(159, 0, 'dashboard_map', 'dashboard_map_width', '6', 0, NULL),
(160, 0, 'dashboard_online', 'dashboard_online_status', '1', 0, NULL),
(161, 0, 'dashboard_online', 'dashboard_online_width', '3', 0, NULL),
(162, 0, 'dashboard_order', 'dashboard_order_sort_order', '1', 0, NULL),
(163, 0, 'dashboard_order', 'dashboard_order_status', '1', 0, NULL),
(164, 0, 'dashboard_order', 'dashboard_order_width', '3', 0, NULL),
(165, 0, 'dashboard_sale', 'dashboard_sale_sort_order', '2', 0, NULL),
(166, 0, 'dashboard_customer', 'dashboard_customer_sort_order', '3', 0, NULL),
(167, 0, 'dashboard_online', 'dashboard_online_sort_order', '4', 0, NULL),
(168, 0, 'dashboard_map', 'dashboard_map_sort_order', '5', 0, NULL),
(169, 0, 'dashboard_chart', 'dashboard_chart_sort_order', '6', 0, NULL),
(170, 0, 'dashboard_recent', 'dashboard_recent_status', '1', 0, NULL),
(171, 0, 'dashboard_recent', 'dashboard_recent_sort_order', '8', 0, NULL),
(172, 0, 'dashboard_activity', 'dashboard_activity_width', '4', 0, NULL),
(173, 0, 'dashboard_recent', 'dashboard_recent_width', '8', 0, NULL),
(3228, 0, 'theme_default', 'theme_default_image_product_width', '228', 0, NULL),
(3227, 0, 'theme_default', 'theme_default_image_popup_height', '1500', 0, NULL),
(340, 0, 'newsletter', 'newsletter_status', '1', 0, NULL),
(9471, 0, 'free', 'free_status', '1', 0, NULL),
(9470, 0, 'free', 'free_geo_zone_id', '0', 0, NULL),
(9454, 0, 'weight', 'weight_4_rate', '0:28.50', 0, NULL),
(3226, 0, 'theme_default', 'theme_default_image_popup_width', '1500', 0, NULL),
(3225, 0, 'theme_default', 'theme_default_image_thumb_height', '456', 0, NULL),
(3224, 0, 'theme_default', 'theme_default_image_thumb_width', '456', 0, NULL),
(3223, 0, 'theme_default', 'theme_default_image_category_height', '80', 0, NULL),
(3222, 0, 'theme_default', 'theme_default_image_category_width', '80', 0, NULL),
(3221, 0, 'theme_default', 'theme_default_product_description_length', '100', 0, NULL),
(3220, 0, 'theme_default', 'theme_default_product_limit', '15', 0, NULL),
(3219, 0, 'theme_default', 'theme_default_status', '1', 0, NULL),
(3218, 0, 'theme_default', 'theme_default_directory', 'oc02', 0, NULL),
(3238, 0, 'theme_default', 'theme_default_image_cart_width', '47', 0, NULL),
(3239, 0, 'theme_default', 'theme_default_image_cart_height', '47', 0, NULL),
(3240, 0, 'theme_default', 'theme_default_image_location_width', '268', 0, NULL),
(3241, 0, 'theme_default', 'theme_default_image_location_height', '50', 0, NULL),
(4971, 0, 'payengine3cw', 'payengine3cw_order_status_status_id_uncertain', '17', 0, NULL),
(4972, 0, 'payengine3cw', 'payengine3cw_order_status_status_id_cancelled', '18', 0, NULL),
(4973, 0, 'payengine3cw', 'payengine3cw_order_status_status_id_pending', '19', 0, NULL),
(4974, 0, 'payengine3cw', 'payengine3cw_creditcard_status', '1', 0, NULL),
(4975, 0, 'payengine3cw', 'payengine3cw_creditcard_sort_order', '3', 0, NULL),
(4976, 0, 'payengine3cw', 'payengine3cw_creditcard_allowed_zones', 'a:0:{}', 1, NULL),
(4977, 0, 'payengine3cw', 'payengine3cw_creditcard_title', 'a:2:{i:1;s:16:\"Concardis Credit\";i:2;s:16:\"Concardis Credit\";}', 1, NULL),
(4978, 0, 'payengine3cw', 'payengine3cw_creditcard_description', 'a:2:{i:1;s:16:\"Concardis Credit\";i:2;s:16:\"Concardis Credit\";}', 1, NULL),
(4979, 0, 'payengine3cw', 'payengine3cw_creditcard_confirm_button_name', 'a:2:{i:1;s:16:\"Concardis Credit\";i:2;s:16:\"Concardis Credit\";}', 1, NULL),
(4980, 0, 'payengine3cw', 'payengine3cw_creditcard_min_total', '0', 0, NULL),
(4981, 0, 'payengine3cw', 'payengine3cw_creditcard_max_total', '0', 0, NULL),
(4982, 0, 'payengine3cw', 'payengine3cw_creditcard_active_currencies', 'a:0:{}', 1, NULL),
(4983, 0, 'payengine3cw', 'payengine3cw_creditcard_capturing', 'direct', 0, NULL),
(4984, 0, 'payengine3cw', 'payengine3cw_creditcard_status_authorized', '1', 0, NULL),
(4985, 0, 'payengine3cw', 'payengine3cw_creditcard_status_uncertain', '17', 0, NULL),
(4986, 0, 'payengine3cw', 'payengine3cw_creditcard_status_cancelled', '18', 0, NULL),
(4987, 0, 'payengine3cw', 'payengine3cw_creditcard_status_captured', 'no_status_change', 0, NULL),
(4988, 0, 'payengine3cw', 'payengine3cw_creditcard_authorizationmethod', 'AjaxAuthorization', 0, NULL),
(4989, 0, 'payengine3cw', 'payengine3cw_creditcard_alias_manager', 'active', 0, NULL),
(9565, 0, 'cod', 'cod_order_status_id', '1', 0, NULL),
(4997, 0, 'free_checkout', 'free_checkout_sort_order', '1', 0, NULL),
(4998, 0, 'payengine3cw', 'payengine3cw_paydirekt_status', '0', 0, NULL),
(4999, 0, 'payengine3cw', 'payengine3cw_paydirekt_sort_order', '0', 0, NULL),
(5000, 0, 'payengine3cw', 'payengine3cw_paydirekt_allowed_zones', 'a:0:{}', 1, NULL),
(5001, 0, 'payengine3cw', 'payengine3cw_paydirekt_title', 'a:2:{i:1;s:19:\"Concardis Paydirekt\";i:2;s:19:\"Concardis Paydirekt\";}', 1, NULL),
(5002, 0, 'payengine3cw', 'payengine3cw_paydirekt_description', 'a:2:{i:1;s:19:\"Concardis Paydirekt\";i:2;s:19:\"Concardis Paydirekt\";}', 1, NULL),
(5003, 0, 'payengine3cw', 'payengine3cw_paydirekt_confirm_button_name', 'a:2:{i:1;s:19:\"Concardis Paydirekt\";i:2;s:19:\"Concardis Paydirekt\";}', 1, NULL),
(5004, 0, 'payengine3cw', 'payengine3cw_paydirekt_min_total', '0', 0, NULL),
(5005, 0, 'payengine3cw', 'payengine3cw_paydirekt_max_total', '0', 0, NULL),
(5006, 0, 'payengine3cw', 'payengine3cw_paydirekt_active_currencies', 'a:0:{}', 1, NULL),
(5007, 0, 'payengine3cw', 'payengine3cw_paydirekt_capturing', 'direct', 0, NULL),
(5008, 0, 'payengine3cw', 'payengine3cw_paydirekt_status_authorized', '1', 0, NULL),
(5009, 0, 'payengine3cw', 'payengine3cw_paydirekt_status_uncertain', '17', 0, NULL),
(5010, 0, 'payengine3cw', 'payengine3cw_paydirekt_status_cancelled', '18', 0, NULL),
(5011, 0, 'payengine3cw', 'payengine3cw_paydirekt_status_captured', 'no_status_change', 0, NULL),
(5012, 0, 'payengine3cw', 'payengine3cw_paydirekt_authorizationmethod', 'PaymentPage', 0, NULL),
(5013, 0, 'payengine3cw', 'payengine3cw_paypal_status', '1', 0, NULL),
(5014, 0, 'payengine3cw', 'payengine3cw_paypal_sort_order', '0', 0, NULL),
(5015, 0, 'payengine3cw', 'payengine3cw_paypal_allowed_zones', 'a:0:{}', 1, NULL),
(5016, 0, 'payengine3cw', 'payengine3cw_paypal_title', 'a:2:{i:1;s:16:\"Concardis PayPal\";i:2;s:16:\"Concardis PayPal\";}', 1, NULL),
(5017, 0, 'payengine3cw', 'payengine3cw_paypal_description', 'a:2:{i:1;s:16:\"Concardis PayPal\";i:2;s:16:\"Concardis PayPal\";}', 1, NULL),
(5018, 0, 'payengine3cw', 'payengine3cw_paypal_confirm_button_name', 'a:2:{i:1;s:16:\"Concardis PayPal\";i:2;s:16:\"Concardis PayPal\";}', 1, NULL),
(5019, 0, 'payengine3cw', 'payengine3cw_paypal_min_total', '0', 0, NULL),
(5020, 0, 'payengine3cw', 'payengine3cw_paypal_max_total', '0', 0, NULL),
(5021, 0, 'payengine3cw', 'payengine3cw_paypal_active_currencies', 'a:0:{}', 1, NULL),
(5022, 0, 'payengine3cw', 'payengine3cw_paypal_capturing', 'direct', 0, NULL),
(5023, 0, 'payengine3cw', 'payengine3cw_paypal_status_authorized', '1', 0, NULL),
(5024, 0, 'payengine3cw', 'payengine3cw_paypal_status_uncertain', '17', 0, NULL),
(5025, 0, 'payengine3cw', 'payengine3cw_paypal_status_cancelled', '18', 0, NULL),
(5026, 0, 'payengine3cw', 'payengine3cw_paypal_status_captured', 'no_status_change', 0, NULL),
(5027, 0, 'payengine3cw', 'payengine3cw_paypal_authorizationmethod', 'PaymentPage', 0, NULL),
(5028, 0, 'payengine3cw', 'payengine3cw_ratepaydirectdebits_status', '0', 0, NULL),
(5029, 0, 'payengine3cw', 'payengine3cw_ratepaydirectdebits_sort_order', '0', 0, NULL),
(5030, 0, 'payengine3cw', 'payengine3cw_ratepaydirectdebits_allowed_zones', 'a:0:{}', 1, NULL),
(5031, 0, 'payengine3cw', 'payengine3cw_ratepaydirectdebits_title', 'a:2:{i:1;s:31:\"Concardis RatePay Direct Debits\";i:2;s:31:\"Concardis RatePay Direct Debits\";}', 1, NULL),
(5032, 0, 'payengine3cw', 'payengine3cw_ratepaydirectdebits_description', 'a:2:{i:1;s:31:\"Concardis RatePay Direct Debits\";i:2;s:31:\"Concardis RatePay Direct Debits\";}', 1, NULL),
(5033, 0, 'payengine3cw', 'payengine3cw_ratepaydirectdebits_confirm_button_name', 'a:2:{i:1;s:31:\"Concardis RatePay Direct Debits\";i:2;s:31:\"Concardis RatePay Direct Debits\";}', 1, NULL),
(5034, 0, 'payengine3cw', 'payengine3cw_ratepaydirectdebits_min_total', '0', 0, NULL),
(5035, 0, 'payengine3cw', 'payengine3cw_ratepaydirectdebits_max_total', '0', 0, NULL),
(5036, 0, 'payengine3cw', 'payengine3cw_ratepaydirectdebits_active_currencies', 'a:0:{}', 1, NULL),
(5037, 0, 'payengine3cw', 'payengine3cw_ratepaydirectdebits_status_authorized', '1', 0, NULL),
(5038, 0, 'payengine3cw', 'payengine3cw_ratepaydirectdebits_status_uncertain', '17', 0, NULL),
(5039, 0, 'payengine3cw', 'payengine3cw_ratepaydirectdebits_status_cancelled', '18', 0, NULL),
(5040, 0, 'payengine3cw', 'payengine3cw_ratepaydirectdebits_status_captured', 'no_status_change', 0, NULL),
(5041, 0, 'payengine3cw', 'payengine3cw_ratepaydirectdebits_authorizationmethod', 'ServerAuthorization', 0, NULL),
(5042, 0, 'payengine3cw', 'payengine3cw_ratepayopeninvoice_status', '0', 0, NULL),
(5043, 0, 'payengine3cw', 'payengine3cw_ratepayopeninvoice_sort_order', '0', 0, NULL),
(5044, 0, 'payengine3cw', 'payengine3cw_ratepayopeninvoice_allowed_zones', 'a:0:{}', 1, NULL),
(5045, 0, 'payengine3cw', 'payengine3cw_ratepayopeninvoice_title', 'a:2:{i:1;s:30:\"Concardis RatePay Open Invoice\";i:2;s:30:\"Concardis RatePay Open Invoice\";}', 1, NULL),
(5046, 0, 'payengine3cw', 'payengine3cw_ratepayopeninvoice_description', 'a:2:{i:1;s:30:\"Concardis RatePay Open Invoice\";i:2;s:30:\"Concardis RatePay Open Invoice\";}', 1, NULL),
(5047, 0, 'payengine3cw', 'payengine3cw_ratepayopeninvoice_confirm_button_name', 'a:2:{i:1;s:30:\"Concardis RatePay Open Invoice\";i:2;s:30:\"Concardis RatePay Open Invoice\";}', 1, NULL),
(5048, 0, 'payengine3cw', 'payengine3cw_ratepayopeninvoice_min_total', '0', 0, NULL),
(5049, 0, 'payengine3cw', 'payengine3cw_ratepayopeninvoice_max_total', '0', 0, NULL),
(5050, 0, 'payengine3cw', 'payengine3cw_ratepayopeninvoice_active_currencies', 'a:0:{}', 1, NULL),
(5051, 0, 'payengine3cw', 'payengine3cw_ratepayopeninvoice_status_authorized', '1', 0, NULL),
(5052, 0, 'payengine3cw', 'payengine3cw_ratepayopeninvoice_status_uncertain', '17', 0, NULL),
(5053, 0, 'payengine3cw', 'payengine3cw_ratepayopeninvoice_status_cancelled', '18', 0, NULL),
(5054, 0, 'payengine3cw', 'payengine3cw_ratepayopeninvoice_status_captured', 'no_status_change', 0, NULL),
(5055, 0, 'payengine3cw', 'payengine3cw_ratepayopeninvoice_authorizationmethod', 'ServerAuthorization', 0, NULL),
(5056, 0, 'payengine3cw', 'payengine3cw_sofortueberweisung_status', '1', 0, NULL),
(5057, 0, 'payengine3cw', 'payengine3cw_sofortueberweisung_sort_order', '0', 0, NULL),
(5058, 0, 'payengine3cw', 'payengine3cw_sofortueberweisung_allowed_zones', 'a:7:{i:0;s:1:\"9\";i:1;s:1:\"3\";i:2;s:1:\"5\";i:3;s:1:\"6\";i:4;s:1:\"8\";i:5;s:1:\"7\";i:6;s:1:\"4\";}', 1, NULL),
(5059, 0, 'payengine3cw', 'payengine3cw_sofortueberweisung_title', 'a:2:{i:1;s:28:\"Concardis Sofortüberweisung\";i:2;s:28:\"Concardis Sofortüberweisung\";}', 1, NULL),
(5060, 0, 'payengine3cw', 'payengine3cw_sofortueberweisung_description', 'a:2:{i:1;s:28:\"Concardis Sofortüberweisung\";i:2;s:28:\"Concardis Sofortüberweisung\";}', 1, NULL),
(5061, 0, 'payengine3cw', 'payengine3cw_sofortueberweisung_confirm_button_name', 'a:2:{i:1;s:28:\"Concardis Sofortüberweisung\";i:2;s:28:\"Concardis Sofortüberweisung\";}', 1, NULL),
(5062, 0, 'payengine3cw', 'payengine3cw_sofortueberweisung_min_total', '0', 0, NULL),
(5063, 0, 'payengine3cw', 'payengine3cw_sofortueberweisung_max_total', '0', 0, NULL),
(5064, 0, 'payengine3cw', 'payengine3cw_sofortueberweisung_active_currencies', 'a:0:{}', 1, NULL),
(5065, 0, 'payengine3cw', 'payengine3cw_sofortueberweisung_capturing', 'direct', 0, NULL),
(5066, 0, 'payengine3cw', 'payengine3cw_sofortueberweisung_status_authorized', '1', 0, NULL),
(5067, 0, 'payengine3cw', 'payengine3cw_sofortueberweisung_status_uncertain', '17', 0, NULL),
(5068, 0, 'payengine3cw', 'payengine3cw_sofortueberweisung_status_cancelled', '18', 0, NULL),
(5069, 0, 'payengine3cw', 'payengine3cw_sofortueberweisung_status_captured', 'no_status_change', 0, NULL),
(5070, 0, 'payengine3cw', 'payengine3cw_sofortueberweisung_authorizationmethod', 'PaymentPage', 0, NULL),
(5162, 0, 'laybuy_layout', 'laybuy_layout_status', '1', 0, NULL),
(5801, 0, 'payengine3cw', 'payengine3cw_merchant_id_live', 'merchant_nb6uizslpo', 0, NULL),
(5802, 0, 'payengine3cw', 'payengine3cw_merchant_password_live', 'LplWuwsUiJrfINEb', 0, NULL),
(5803, 0, 'payengine3cw', 'payengine3cw_ratepay_id_live', '', 0, NULL),
(5804, 0, 'payengine3cw', 'payengine3cw_merchant_id_test', 'merchant_mn5palcilu', 0, NULL),
(5805, 0, 'payengine3cw', 'payengine3cw_merchant_password_test', 'CPLlcv29bXg1MUrS', 0, NULL),
(5806, 0, 'payengine3cw', 'payengine3cw_ratepay_id_test', '', 0, NULL),
(5807, 0, 'payengine3cw', 'payengine3cw_order_schema', '{id}', 0, NULL),
(5808, 0, 'payengine3cw', 'payengine3cw_log_level', 'debug', 0, NULL),
(9452, 0, 'weight', 'weight_7_rate', '0:26.50', 0, NULL),
(9469, 0, 'free', 'free_total', '', 0, NULL),
(9453, 0, 'weight', 'weight_7_status', '0', 0, NULL),
(9451, 0, 'weight', 'weight_8_status', '0', 0, NULL),
(9450, 0, 'weight', 'weight_8_rate', '0:23.50', 0, NULL),
(9366, 0, 'config', 'config_mail_smtp_username', '', 0, NULL),
(9367, 0, 'config', 'config_mail_smtp_password', '', 0, NULL),
(9368, 0, 'config', 'config_mail_smtp_port', '25', 0, NULL),
(9369, 0, 'config', 'config_mail_smtp_timeout', '5', 0, NULL),
(9370, 0, 'config', 'config_mail_alert', '[\"order\"]', 1, NULL),
(9371, 0, 'config', 'config_mail_alert_email', '', 0, NULL),
(9372, 0, 'config', 'config_maintenance', '0', 0, NULL),
(9373, 0, 'config', 'config_seo_url', '1', 0, NULL),
(9374, 0, 'config', 'config_robots', 'abot\r\ndbot\r\nebot\r\nhbot\r\nkbot\r\nlbot\r\nmbot\r\nnbot\r\nobot\r\npbot\r\nrbot\r\nsbot\r\ntbot\r\nvbot\r\nybot\r\nzbot\r\nbot.\r\nbot/\r\n_bot\r\n.bot\r\n/bot\r\n-bot\r\n:bot\r\n(bot\r\ncrawl\r\nslurp\r\nspider\r\nseek\r\naccoona\r\nacoon\r\nadressendeutschland\r\nah-ha.com\r\nahoy\r\naltavista\r\nananzi\r\nanthill\r\nappie\r\narachnophilia\r\narale\r\naraneo\r\naranha\r\narchitext\r\naretha\r\narks\r\nasterias\r\natlocal\r\natn\r\natomz\r\naugurfind\r\nbackrub\r\nbannana_bot\r\nbaypup\r\nbdfetch\r\nbig brother\r\nbiglotron\r\nbjaaland\r\nblackwidow\r\nblaiz\r\nblog\r\nblo.\r\nbloodhound\r\nboitho\r\nbooch\r\nbradley\r\nbutterfly\r\ncalif\r\ncassandra\r\nccubee\r\ncfetch\r\ncharlotte\r\nchurl\r\ncienciaficcion\r\ncmc\r\ncollective\r\ncomagent\r\ncombine\r\ncomputingsite\r\ncsci\r\ncurl\r\ncusco\r\ndaumoa\r\ndeepindex\r\ndelorie\r\ndepspid\r\ndeweb\r\ndie blinde kuh\r\ndigger\r\nditto\r\ndmoz\r\ndocomo\r\ndownload express\r\ndtaagent\r\ndwcp\r\nebiness\r\nebingbong\r\ne-collector\r\nejupiter\r\nemacs-w3 search engine\r\nesther\r\nevliya celebi\r\nezresult\r\nfalcon\r\nfelix ide\r\nferret\r\nfetchrover\r\nfido\r\nfindlinks\r\nfireball\r\nfish search\r\nfouineur\r\nfunnelweb\r\ngazz\r\ngcreep\r\ngenieknows\r\ngetterroboplus\r\ngeturl\r\nglx\r\ngoforit\r\ngolem\r\ngrabber\r\ngrapnel\r\ngralon\r\ngriffon\r\ngromit\r\ngrub\r\ngulliver\r\nhamahakki\r\nharvest\r\nhavindex\r\nhelix\r\nheritrix\r\nhku www octopus\r\nhomerweb\r\nhtdig\r\nhtml index\r\nhtml_analyzer\r\nhtmlgobble\r\nhubater\r\nhyper-decontextualizer\r\nia_archiver\r\nibm_planetwide\r\nichiro\r\niconsurf\r\niltrovatore\r\nimage.kapsi.net\r\nimagelock\r\nincywincy\r\nindexer\r\ninfobee\r\ninformant\r\ningrid\r\ninktomisearch.com\r\ninspector web\r\nintelliagent\r\ninternet shinchakubin\r\nip3000\r\niron33\r\nisraeli-search\r\nivia\r\njack\r\njakarta\r\njavabee\r\njetbot\r\njumpstation\r\nkatipo\r\nkdd-explorer\r\nkilroy\r\nknowledge\r\nkototoi\r\nkretrieve\r\nlabelgrabber\r\nlachesis\r\nlarbin\r\nlegs\r\nlibwww\r\nlinkalarm\r\nlink validator\r\nlinkscan\r\nlockon\r\nlwp\r\nlycos\r\nmagpie\r\nmantraagent\r\nmapoftheinternet\r\nmarvin/\r\nmattie\r\nmediafox\r\nmediapartners\r\nmercator\r\nmerzscope\r\nmicrosoft url control\r\nminirank\r\nmiva\r\nmj12\r\nmnogosearch\r\nmoget\r\nmonster\r\nmoose\r\nmotor\r\nmultitext\r\nmuncher\r\nmuscatferret\r\nmwd.search\r\nmyweb\r\nnajdi\r\nnameprotect\r\nnationaldirectory\r\nnazilla\r\nncsa beta\r\nnec-meshexplorer\r\nnederland.zoek\r\nnetcarta webmap engine\r\nnetmechanic\r\nnetresearchserver\r\nnetscoop\r\nnewscan-online\r\nnhse\r\nnokia6682/\r\nnomad\r\nnoyona\r\nnutch\r\nnzexplorer\r\nobjectssearch\r\noccam\r\nomni\r\nopen text\r\nopenfind\r\nopenintelligencedata\r\norb search\r\nosis-project\r\npack rat\r\npageboy\r\npagebull\r\npage_verifier\r\npanscient\r\nparasite\r\npartnersite\r\npatric\r\npear.\r\npegasus\r\nperegrinator\r\npgp key agent\r\nphantom\r\nphpdig\r\npicosearch\r\npiltdownman\r\npimptrain\r\npinpoint\r\npioneer\r\npiranha\r\nplumtreewebaccessor\r\npogodak\r\npoirot\r\npompos\r\npoppelsdorf\r\npoppi\r\npopular iconoclast\r\npsycheclone\r\npublisher\r\npython\r\nrambler\r\nraven search\r\nroach\r\nroad runner\r\nroadhouse\r\nrobbie\r\nrobofox\r\nrobozilla\r\nrules\r\nsalty\r\nsbider\r\nscooter\r\nscoutjet\r\nscrubby\r\nsearch.\r\nsearchprocess\r\nsemanticdiscovery\r\nsenrigan\r\nsg-scout\r\nshai\'hulud\r\nshark\r\nshopwiki\r\nsidewinder\r\nsift\r\nsilk\r\nsimmany\r\nsite searcher\r\nsite valet\r\nsitetech-rover\r\nskymob.com\r\nsleek\r\nsmartwit\r\nsna-\r\nsnappy\r\nsnooper\r\nsohu\r\nspeedfind\r\nsphere\r\nsphider\r\nspinner\r\nspyder\r\nsteeler/\r\nsuke\r\nsuntek\r\nsupersnooper\r\nsurfnomore\r\nsven\r\nsygol\r\nszukacz\r\ntach black widow\r\ntarantula\r\ntempleton\r\n/teoma\r\nt-h-u-n-d-e-r-s-t-o-n-e\r\ntheophrastus\r\ntitan\r\ntitin\r\ntkwww\r\ntoutatis\r\nt-rex\r\ntutorgig\r\ntwiceler\r\ntwisted\r\nucsd\r\nudmsearch\r\nurl check\r\nupdated\r\nvagabondo\r\nvalkyrie\r\nverticrawl\r\nvictoria\r\nvision-search\r\nvolcano\r\nvoyager/\r\nvoyager-hc\r\nw3c_validator\r\nw3m2\r\nw3mir\r\nwalker\r\nwallpaper\r\nwanderer\r\nwauuu\r\nwavefire\r\nweb core\r\nweb hopper\r\nweb wombat\r\nwebbandit\r\nwebcatcher\r\nwebcopy\r\nwebfoot\r\nweblayers\r\nweblinker\r\nweblog monitor\r\nwebmirror\r\nwebmonkey\r\nwebquest\r\nwebreaper\r\nwebsitepulse\r\nwebsnarf\r\nwebstolperer\r\nwebvac\r\nwebwalk\r\nwebwatch\r\nwebwombat\r\nwebzinger\r\nwhizbang\r\nwhowhere\r\nwild ferret\r\nworldlight\r\nwwwc\r\nwwwster\r\nxenu\r\nxget\r\nxift\r\nxirq\r\nyandex\r\nyanga\r\nyeti\r\nyodao\r\nzao\r\nzippp\r\nzyborg', 0, NULL),
(9382, 0, 'config', 'config_file_mime_allowed', 'text/plain\r\nimage/png\r\nimage/jpeg\r\nimage/gif\r\nimage/bmp\r\nimage/tiff\r\nimage/svg+xml\r\napplication/zip\r\n&quot;application/zip&quot;\r\napplication/x-zip\r\n&quot;application/x-zip&quot;\r\napplication/x-zip-compressed\r\n&quot;application/x-zip-compressed&quot;\r\napplication/rar\r\n&quot;application/rar&quot;\r\napplication/x-rar\r\n&quot;application/x-rar&quot;\r\napplication/x-rar-compressed\r\n&quot;application/x-rar-compressed&quot;\r\napplication/octet-stream\r\n&quot;application/octet-stream&quot;\r\naudio/mpeg\r\nvideo/quicktime\r\napplication/pdf', 0, NULL),
(9381, 0, 'config', 'config_file_ext_allowed', 'zip\r\ntxt\r\npng\r\njpe\r\njpeg\r\njpg\r\ngif\r\nbmp\r\nico\r\ntiff\r\ntif\r\nsvg\r\nsvgz\r\nzip\r\nrar\r\nmsi\r\ncab\r\nmp3\r\nqt\r\nmov\r\npdf\r\npsd\r\nai\r\neps\r\nps\r\ndoc', 0, NULL),
(9380, 0, 'config', 'config_file_max_size', '300000', 0, NULL),
(9375, 0, 'config', 'config_compression', '0', 0, NULL),
(9376, 0, 'config', 'config_secure', '0', 0, NULL),
(9377, 0, 'config', 'config_password', '1', 0, NULL),
(9378, 0, 'config', 'config_shared', '0', 0, NULL),
(9379, 0, 'config', 'config_encryption', 'nbEncyRO8VQh3m6nVHufVQ2OyNKdktK0A2ldC8sOG2UQ7LtsVPgfFsUa7brEtnwJlMU5w4uvj12ylPq1ebJ123teLRB5P00zIN9AZIMGlmZawyddgwS6OVIHso1iwI1npytYfOtahkqkhXMqVoR9FyklZOqYUHynAK9NCPTjZkK5u65awnJtgDPBtAI77tDvyDi6XwBEOGWPYsPX3E93HvYG82SYKtBroFeISbmwHeY3ynrcKI7JAB25MpI2tlfiLLBxOjcNJqELyF6cABJgYS2PHfjv7GJJvzpHAQFC7WST8BAR6OpO2PYHUNEKmYGqVjz8GVWCzPXG2HFVKgpF0pxeLdGwbylsX8voFwvqiAtQmmdJGIyhOvp7tIplNZe2kVRazoCgy34U4CYgw2Z1lCNu9npwtPKIhAtFutxEjc4aYcJV3FZzPdtUetlgFMcJATiUBIyOb3qF3VrLVk4ZlQvXWYRrr5Krc3eQCZMDvaQ7UHxVHvo0dtzCkpyQU1z19K6Nk1LKcZbTj4aU8glBJPSvMZuPVnsPP9SqBA7IP3gQVh4qDAsLOELXPKJoH87PQj7VX3wMNyZRNubfjfP1Q4aPyUcZEzYsbB4Szndn9TGOZPP6dZPyVglBMIll84SIycncAyMi84U90A9kTsPwLFdKFVxqYGWihNqXJRMs7bQlkt23tvWJdrTriITgYnAto7BRkoli5j7khhvnQQsycYW9f1yw8FSI57NkcNKlGhVCVb0RcYa46j4dWD3fFXfugX9y8Q2Y0bHC7bydwrxXjZyPluL7I2yRDzbAIKKikI8uwqTe8ePoacVNfwLGgyWa7nKSoLmGF0jQOI0doDR8JYIUN1nQUgQ8nqPjIJaC1gbY0Fmyku9aEjqWoRw3O789MTeIU6YBezeKG4UDhJgJzM4pWTGb6OT4MiZpmzOj08LKpTPIl18A42VfKNKEUMK8E7qT0NIKuTxO77YY5EC3vDTk4VQdVGtr35gAxzNuO1hqUwsgHFJcH9NKLW4wz0gz', 0, NULL),
(9449, 0, 'weight', 'weight_6_status', '0', 0, NULL),
(9448, 0, 'weight', 'weight_6_rate', '0:19.50', 0, NULL),
(9447, 0, 'weight', 'weight_5_status', '0', 0, NULL),
(9444, 0, 'weight', 'weight_3_rate', '0:11.50', 0, NULL),
(9445, 0, 'weight', 'weight_3_status', '0', 0, NULL),
(9446, 0, 'weight', 'weight_5_rate', '0:18.00', 0, NULL),
(9443, 0, 'weight', 'weight_9_status', '1', 0, NULL),
(9364, 0, 'config', 'config_mail_parameter', '', 0, NULL),
(9365, 0, 'config', 'config_mail_smtp_hostname', '', 0, NULL),
(9362, 0, 'config', 'config_ftp_status', '0', 0, NULL),
(9363, 0, 'config', 'config_mail_protocol', 'mail', 0, NULL),
(9361, 0, 'config', 'config_ftp_root', '', 0, NULL),
(9360, 0, 'config', 'config_ftp_password', '', 0, NULL),
(9359, 0, 'config', 'config_ftp_username', '', 0, NULL),
(9358, 0, 'config', 'config_ftp_port', '21', 0, NULL),
(9357, 0, 'config', 'config_ftp_hostname', 'localhost', 0, NULL),
(9356, 0, 'config', 'config_icon', 'catalog/favicon-32x32.png', 0, NULL),
(9355, 0, 'config', 'config_logo', 'catalog/logo.png', 0, NULL),
(9353, 0, 'config', 'config_captcha', '', 0, NULL),
(9354, 0, 'config', 'config_captcha_page', '[\"review\",\"return\",\"contact\"]', 1, NULL),
(9352, 0, 'config', 'config_return_status_id', '2', 0, NULL),
(9351, 0, 'config', 'config_return_id', '5', 0, NULL),
(9350, 0, 'config', 'config_affiliate_id', '5', 0, NULL),
(9349, 0, 'config', 'config_affiliate_commission', '5', 0, NULL),
(8726, 0, 'openbaypro', 'openbaypro_status', '1', 0, NULL),
(8727, 0, 'google_sitemap', 'google_sitemap_status', '1', 0, NULL),
(8728, 0, 'gcrdev_sitemap', 'gcrdev_sitemap_status', '1', 0, NULL),
(9348, 0, 'config', 'config_affiliate_auto', '0', 0, NULL),
(9347, 0, 'config', 'config_affiliate_approval', '0', 0, NULL),
(9346, 0, 'config', 'config_stock_checkout', '0', 0, NULL),
(9345, 0, 'config', 'config_stock_warning', '0', 0, NULL),
(9343, 0, 'config', 'config_api_id', '1', 0, NULL),
(9344, 0, 'config', 'config_stock_display', '0', 0, NULL),
(9342, 0, 'config', 'config_fraud_status_id', '7', 0, NULL),
(9341, 0, 'config', 'config_complete_status', '[\"5\",\"3\"]', 1, NULL),
(9340, 0, 'config', 'config_processing_status', '[\"5\",\"1\",\"2\",\"12\",\"3\"]', 1, NULL),
(9339, 0, 'config', 'config_order_status_id', '1', 0, NULL),
(9338, 0, 'config', 'config_checkout_id', '5', 0, NULL),
(9337, 0, 'config', 'config_checkout_guest', '1', 0, NULL),
(9336, 0, 'config', 'config_cart_weight', '0', 0, NULL),
(9335, 0, 'config', 'config_invoice_prefix', 'WB-2018-00', 0, NULL),
(9334, 0, 'config', 'config_account_id', '3', 0, NULL),
(9332, 0, 'config', 'config_customer_price', '0', 0, NULL),
(9333, 0, 'config', 'config_login_attempts', '5', 0, NULL),
(9330, 0, 'config', 'config_customer_group_id', '1', 0, NULL),
(9331, 0, 'config', 'config_customer_group_display', '[\"1\"]', 1, NULL),
(9329, 0, 'config', 'config_customer_search', '0', 0, NULL),
(9328, 0, 'config', 'config_customer_activity', '0', 0, NULL),
(9327, 0, 'config', 'config_customer_online', '0', 0, NULL),
(9322, 0, 'config', 'config_voucher_min', '100', 0, NULL),
(9323, 0, 'config', 'config_voucher_max', '200', 0, NULL),
(9324, 0, 'config', 'config_tax', '0', 0, NULL),
(9325, 0, 'config', 'config_tax_default', 'shipping', 0, NULL),
(9326, 0, 'config', 'config_tax_customer', 'shipping', 0, NULL),
(9564, 0, 'cod', 'cod_total', '0.01', 0, NULL),
(9318, 0, 'config', 'config_product_count', '0', 0, NULL),
(9319, 0, 'config', 'config_limit_admin', '50', 0, NULL),
(9320, 0, 'config', 'config_review_status', '0', 0, NULL),
(9321, 0, 'config', 'config_review_guest', '0', 0, NULL),
(9302, 0, 'config', 'config_address', 'Berliner Str. 28 \r\n60311 Frankfurt am Main', 0, NULL),
(9303, 0, 'config', 'config_geocode', '50.11214,8.680586', 0, NULL),
(9304, 0, 'config', 'config_email', 'verkauf@waffen-bock.de', 0, NULL),
(9305, 0, 'config', 'config_telephone', '+4969285590', 0, NULL),
(9306, 0, 'config', 'config_fax', '', 0, NULL),
(9307, 0, 'config', 'config_image', 'catalog/logo-gross.png', 0, NULL),
(9308, 0, 'config', 'config_open', '', 0, NULL),
(9309, 0, 'config', 'config_comment', '', 0, NULL),
(9310, 0, 'config', 'config_country_id', '81', 0, NULL),
(9311, 0, 'config', 'config_zone_id', '1260', 0, NULL),
(9312, 0, 'config', 'config_language', 'de-DE', 0, NULL),
(9313, 0, 'config', 'config_admin_language', 'de-DE', 0, NULL),
(9314, 0, 'config', 'config_currency', 'EUR', 0, NULL),
(9315, 0, 'config', 'config_currency_auto', '1', 0, NULL),
(9316, 0, 'config', 'config_length_class_id', '1', 0, NULL),
(9317, 0, 'config', 'config_weight_class_id', '1', 0, NULL),
(9299, 0, 'config', 'config_layout_id', '4', 0, NULL),
(9300, 0, 'config', 'config_name', 'Waffen-Bock Frankfurt', 0, NULL),
(9301, 0, 'config', 'config_owner', 'Waffen-Bock Carl Bock KG ', 0, NULL),
(9296, 0, 'config', 'config_meta_description', 'Messer Shop für Exklusive Messer / Messermacher.  Jagdmesser, Feststehende Messer, Neck Knives, Outdoor Messer, Beltrame, Benchmade, Boeker, Cheburkov, Cold Steel, DNC (Tumpek Ferenc), Eickhorn, Extrema Ratio', 0, NULL),
(9297, 0, 'config', 'config_meta_keyword', 'Messer – Exklusive Messer, Jagdmesser, Feststehende Messer, Neck Knives, Outdoor Messer, Beltrame, Benchmade, Boeker, Cheburkov, Cold Steel, DNC (Tumpek Ferenc), Eickhorn, Extrema Ratio', 0, NULL),
(9298, 0, 'config', 'config_theme', 'theme_default', 0, NULL),
(9295, 0, 'config', 'config_meta_title', 'Waffen Bock Shop für Exklusive Messer / Messermacher, Frankfurt', 0, NULL),
(9383, 0, 'config', 'config_error_display', '0', 0, NULL),
(9384, 0, 'config', 'config_error_log', '0', 0, NULL),
(9385, 0, 'config', 'config_error_filename', 'error.log', 0, NULL),
(9386, 0, 'payengine3cw', 'payengine3cw_paypal_device_id', 'inactive', 0, NULL),
(9387, 0, 'payengine3cw', 'payengine3cw_paypal_device_id_minimum', '0', 0, NULL),
(9442, 0, 'weight', 'weight_9_rate', '100:6.9', 0, NULL),
(9440, 0, 'weight', 'weight_status', '1', 0, NULL),
(9441, 0, 'weight', 'weight_sort_order', '', 0, NULL),
(9439, 0, 'weight', 'weight_tax_class_id', '0', 0, NULL),
(9455, 0, 'weight', 'weight_4_status', '0', 0, NULL),
(9563, 0, 'dibseasy', 'dibseasy_debug', '1', 0, NULL),
(9562, 0, 'dibseasy', 'dibseasy_allowed_customer_type', 'b2c', 0, NULL),
(9561, 0, 'dibseasy', 'dibseasy_language', 'sv-SE', 0, NULL),
(9559, 0, 'dibseasy', 'dibseasy_status', '1', 0, NULL),
(9560, 0, 'dibseasy', 'dibseasy_testmode', '1', 0, NULL),
(9558, 0, 'dibseasy', 'dibseasy_shipping_method', 'free', 0, NULL),
(9557, 0, 'dibseasy', 'dibseasy_order_status_id', '7', 0, NULL),
(9555, 0, 'dibseasy', 'dibseasy_checkoutkey_test', 'test-checkout-key-4537964b935c4376a67abb53c2e2e545', 0, NULL),
(9556, 0, 'dibseasy', 'dibseasy_terms_and_conditions', 'http://temp20.waffen-bock.de/', 0, NULL),
(9472, 0, 'free', 'free_sort_order', '', 0, NULL),
(9554, 0, 'dibseasy', 'dibseasy_testkey', 'test-secret-key-d301621cf5d540558263458bbf7a4f00', 0, NULL),
(9553, 0, 'dibseasy', 'dibseasy_checkoutkey_live', 'f5f9dc454a3840b89c5ab71fe697b19f', 0, NULL),
(9552, 0, 'dibseasy', 'dibseasy_livekey', 'live-secret-key-ead0b28a9b5c49989959e9681a9f0000', 0, NULL),
(9551, 0, 'dibseasy', 'dibseasy_merchant', '100020453', 0, NULL),
(9568, 0, 'cod', 'cod_sort_order', '5', 0, NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `oc_stock_status`
--

DROP TABLE IF EXISTS `oc_stock_status`;
CREATE TABLE `oc_stock_status` (
  `stock_status_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(32) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `oc_stock_status`
--

INSERT INTO `oc_stock_status` (`stock_status_id`, `language_id`, `name`) VALUES
(8, 1, 'Pre-Order'),
(5, 1, 'Out Of Stock'),
(7, 2, 'Ausverkauft / auf Anfrage'),
(8, 2, 'Pre-Order'),
(5, 2, 'Out Of Stock'),
(6, 2, 'Ausverkauft / Anfrage'),
(6, 1, '2-3 Days');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `oc_store`
--

DROP TABLE IF EXISTS `oc_store`;
CREATE TABLE `oc_store` (
  `store_id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  `url` varchar(255) NOT NULL,
  `ssl` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `oc_tax_class`
--

DROP TABLE IF EXISTS `oc_tax_class`;
CREATE TABLE `oc_tax_class` (
  `tax_class_id` int(11) NOT NULL,
  `title` varchar(32) NOT NULL,
  `description` varchar(255) NOT NULL,
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `oc_tax_class`
--

INSERT INTO `oc_tax_class` (`tax_class_id`, `title`, `description`, `date_added`, `date_modified`) VALUES
(9, 'Taxable Goods', 'Taxed goods', '2009-01-06 23:21:53', '2011-09-23 14:07:50'),
(10, 'Downloadable Products', 'Downloadable', '2011-09-21 22:19:39', '2011-09-22 10:27:36');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `oc_tax_rate`
--

DROP TABLE IF EXISTS `oc_tax_rate`;
CREATE TABLE `oc_tax_rate` (
  `tax_rate_id` int(11) NOT NULL,
  `geo_zone_id` int(11) NOT NULL DEFAULT 0,
  `name` varchar(32) NOT NULL,
  `rate` decimal(15,4) NOT NULL DEFAULT 0.0000,
  `type` char(1) NOT NULL,
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `oc_tax_rate`
--

INSERT INTO `oc_tax_rate` (`tax_rate_id`, `geo_zone_id`, `name`, `rate`, `type`, `date_added`, `date_modified`) VALUES
(86, 3, 'VAT (20%)', '20.0000', 'P', '2011-03-09 21:17:10', '2011-09-22 22:24:29'),
(87, 3, 'Eco Tax (-2.00)', '2.0000', 'F', '2011-09-21 21:49:23', '2011-09-23 00:40:19');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `oc_tax_rate_to_customer_group`
--

DROP TABLE IF EXISTS `oc_tax_rate_to_customer_group`;
CREATE TABLE `oc_tax_rate_to_customer_group` (
  `tax_rate_id` int(11) NOT NULL,
  `customer_group_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `oc_tax_rate_to_customer_group`
--

INSERT INTO `oc_tax_rate_to_customer_group` (`tax_rate_id`, `customer_group_id`) VALUES
(86, 1),
(87, 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `oc_tax_rule`
--

DROP TABLE IF EXISTS `oc_tax_rule`;
CREATE TABLE `oc_tax_rule` (
  `tax_rule_id` int(11) NOT NULL,
  `tax_class_id` int(11) NOT NULL,
  `tax_rate_id` int(11) NOT NULL,
  `based` varchar(10) NOT NULL,
  `priority` int(5) NOT NULL DEFAULT 1
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `oc_tax_rule`
--

INSERT INTO `oc_tax_rule` (`tax_rule_id`, `tax_class_id`, `tax_rate_id`, `based`, `priority`) VALUES
(121, 10, 86, 'payment', 1),
(120, 10, 87, 'store', 0),
(128, 9, 86, 'shipping', 1),
(127, 9, 87, 'shipping', 2);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `oc_theme`
--

DROP TABLE IF EXISTS `oc_theme`;
CREATE TABLE `oc_theme` (
  `theme_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  `theme` varchar(64) NOT NULL,
  `route` varchar(64) NOT NULL,
  `code` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `oc_translation`
--

DROP TABLE IF EXISTS `oc_translation`;
CREATE TABLE `oc_translation` (
  `translation_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `route` varchar(64) NOT NULL,
  `key` varchar(64) NOT NULL,
  `value` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `oc_upload`
--

DROP TABLE IF EXISTS `oc_upload`;
CREATE TABLE `oc_upload` (
  `upload_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `filename` varchar(255) NOT NULL,
  `code` varchar(255) NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `oc_url_alias`
--

DROP TABLE IF EXISTS `oc_url_alias`;
CREATE TABLE `oc_url_alias` (
  `url_alias_id` int(11) NOT NULL,
  `query` varchar(255) NOT NULL,
  `keyword` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `oc_url_alias`
--

INSERT INTO `oc_url_alias` (`url_alias_id`, `query`, `keyword`) VALUES
(11202, 'information_id=4', 'about_us'),
(11071, 'information_id=6', 'delivery'),
(11061, 'information_id=5', 'terms'),
(874, 'account/register', 'register'),
(875, 'account/login', 'login'),
(886, 'checkout/cart', 'cart'),
(887, 'checkout/checkout', 'checkout'),
(893, 'checkout/cart/edit', 'edit'),
(11044, 'manufacturer_id=60', 'Umarex'),
(7523, 'information_id=3', 'datenschutz'),
(7528, 'information_id=7', 'impressum'),
(2604, 'information_id=8', 'manufacture1'),
(2621, 'product/manufacturer', 'messer-hersteller'),
(6676, 'information_id=9', 'Widerrufsbelehrung'),
(10972, 'category_id=178', ''),
(10962, 'category_id=168', ''),
(10963, 'category_id=169', ''),
(10961, 'category_id=167', ''),
(10965, 'category_id=171', ''),
(10966, 'category_id=172', ''),
(10967, 'category_id=173', ''),
(10968, 'category_id=174', ''),
(10970, 'category_id=176', ''),
(10971, 'category_id=177', ''),
(10973, 'category_id=179', ''),
(10974, 'category_id=180', ''),
(10975, 'category_id=181', ''),
(10976, 'category_id=182', ''),
(10977, 'category_id=183', ''),
(10978, 'category_id=184', ''),
(10979, 'category_id=185', ''),
(10980, 'category_id=186', ''),
(10981, 'category_id=187', ''),
(10982, 'category_id=188', ''),
(10983, 'category_id=189', ''),
(10984, 'category_id=190', ''),
(10987, 'category_id=193', ''),
(10988, 'category_id=194', ''),
(10989, 'category_id=195', ''),
(10991, 'category_id=197', ''),
(10992, 'category_id=198', ''),
(10993, 'category_id=199', ''),
(10994, 'category_id=200', ''),
(10995, 'category_id=201', ''),
(10996, 'category_id=202', ''),
(10997, 'category_id=203', ''),
(10998, 'category_id=204', ''),
(10999, 'category_id=205', ''),
(11000, 'category_id=206', ''),
(11001, 'category_id=207', ''),
(11002, 'category_id=208', ''),
(11003, 'category_id=209', ''),
(11004, 'category_id=210', ''),
(11005, 'category_id=211', ''),
(11006, 'category_id=212', ''),
(11007, 'category_id=213', ''),
(11008, 'category_id=214', ''),
(11009, 'category_id=215', ''),
(11010, 'category_id=216', ''),
(11011, 'category_id=217', ''),
(11012, 'category_id=218', ''),
(11014, 'category_id=220', ''),
(11015, 'category_id=221', ''),
(11016, 'category_id=222', ''),
(11017, 'category_id=223', ''),
(11018, 'category_id=224', ''),
(11019, 'category_id=225', ''),
(11020, 'category_id=226', ''),
(11022, 'category_id=228', ''),
(11023, 'category_id=229', ''),
(11024, 'category_id=230', ''),
(11026, 'category_id=232', ''),
(11027, 'category_id=233', ''),
(11029, 'category_id=235', ''),
(11031, 'category_id=237', ''),
(11032, 'category_id=238', ''),
(11033, 'category_id=239', ''),
(11034, 'category_id=240', ''),
(11035, 'category_id=241', ''),
(11036, 'category_id=242', ''),
(11037, 'category_id=243', ''),
(11038, 'category_id=244', ''),
(11039, 'category_id=245', ''),
(11040, 'category_id=246', ''),
(11041, 'category_id=247', ''),
(11042, 'category_id=248', ''),
(11043, 'category_id=249', ''),
(11058, 'product_id=1251', 'Glock179mmPAKFE'),
(11073, 'product_id=1252', 'HKP309mmPAK'),
(11059, 'manufacturer_id=61', 'Zoraki'),
(11079, 'product_id=1253', 'Zoraki9179mmPAKbl'),
(11083, 'product_id=1254', 'WaltherP999mmPAKbl'),
(11082, 'product_id=1255', 'WaltherP999mmPAKBi'),
(11084, 'product_id=1256', 'WaltherP999mmPAKrot'),
(11081, 'product_id=1257', 'WaltherP229mmPAKbl'),
(11094, 'product_id=1258', 'WaltherP229mmPAKbi'),
(11088, 'product_id=1259', 'WaltherP22Q9mmPAKR2D'),
(11092, 'product_id=1260', 'WaltherP22Q9mmPAKbl'),
(11091, 'product_id=1261', 'WaltherP22Q9mmPAKbluestar'),
(11095, 'product_id=1262', 'WaltherP22Q9mmPAKmintos'),
(11096, 'product_id=1263', 'WaltherPPQ9mmPAKbl'),
(11097, 'product_id=1264', 'WaltherPPQ9mmPAKNavy'),
(11098, 'product_id=1265', 'BrowningGPDA9mmPAKbl'),
(11099, 'product_id=1266', 'BrowningGPDA9mmPAKgold'),
(11100, 'product_id=1267', 'Colt19119mmPAKbl'),
(11101, 'product_id=1268', 'Colt19119mmPAKpc'),
(11133, 'product_id=1269', '600xTitan9mmPAK'),
(11132, 'product_id=1270', '75TITAN'),
(11105, 'manufacturer_id=62', 'RWS'),
(11135, 'product_id=1271', '50Geco9mmPAK'),
(11138, 'product_id=1272', '100Geco9mmPAK'),
(11136, 'product_id=1273', '50Geco8mmPAK'),
(11140, 'product_id=1274', '100Geco8mmPAK'),
(11141, 'product_id=1275', '100Geco6mmFlobert'),
(11174, 'product_id=1276', '50Geco9mmR'),
(11134, 'product_id=1278', '50Walther9mmR'),
(11168, 'product_id=1279', '100Walther9mmR'),
(11128, 'product_id=1280', 'RoehmRG969mmPAKbl'),
(11129, 'product_id=1281', 'RoehmRG889mmPAKbl'),
(11143, 'product_id=1282', 'RoehmRG36mm'),
(11154, 'product_id=1283', 'RoehmRG566mmFlobert'),
(11155, 'product_id=1284', 'RoehmRG599mmR'),
(11148, 'product_id=1285', 'RoehmRG5999mmRAC'),
(11157, 'product_id=1286', 'RoehmRG899mmRbl'),
(11159, 'product_id=1287', 'RoehmRG899mmRAC'),
(11158, 'product_id=1288', 'SW9mmRbl'),
(11160, 'product_id=1289', 'SW9mmRNi'),
(11161, 'product_id=1290', 'ColtDTS9mmRbl'),
(11163, 'product_id=1291', 'ColtDTS9mmRNiHG'),
(11164, 'product_id=1292', 'Zoraki9179mmPAKCM'),
(11165, 'product_id=1293', 'Zoraki9179mmPAKTAN'),
(11166, 'product_id=1294', 'Zoraki9189mmPAKbl'),
(11167, 'product_id=1295', 'Zoraki9189mmPAKCM'),
(11169, 'product_id=1296', 'Zoraki9149mmPAKbl'),
(11171, 'product_id=1297', 'Zoraki9149mmPAKCM'),
(11173, 'product_id=1298', 'Zoraki9149mmPAKSAT'),
(11183, 'product_id=1299', 'Zoraki29189mmPAKbl'),
(11184, 'product_id=1300', 'Zoraki29189mmPAKCM'),
(11185, 'product_id=1301', 'Zoraki49189mmPAKbl'),
(11186, 'product_id=1302', 'Z49189mmPAK4918'),
(11182, 'product_id=1303', 'Zoraki9259mmPAKbl'),
(11193, 'product_id=1304', 'Zoraki9259mmPAKcamo'),
(11188, 'product_id=1305', 'Zoraki9069mmPAKbl'),
(11189, 'product_id=1306', 'Zoraki9069mmPAKCM'),
(11190, 'product_id=1307', 'ZorakiR19mmRHG2'),
(11191, 'product_id=1308', 'ZorakiR19mmRHG4'),
(11201, 'product_id=1309', 'ZorakiR19mmRHG6'),
(11194, 'product_id=1310', 'ZorakiR19mmRbl4'),
(11195, 'product_id=1311', 'ZorakiR19mmRTi4'),
(11200, 'product_id=1312', 'ZorakiR19mmRbl6'),
(11197, 'product_id=1313', 'ZorakiR29mmRbl2'),
(11199, 'product_id=1314', 'ZorakiR29mmRTi'),
(11203, 'manufacturer_id=63', 'Weihrauch'),
(11207, 'product_id=1315', 'HW37bl'),
(11208, 'product_id=1316', 'HW37ST'),
(11206, 'product_id=1317', 'HW88bl');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `oc_user`
--

DROP TABLE IF EXISTS `oc_user`;
CREATE TABLE `oc_user` (
  `user_id` int(11) NOT NULL,
  `user_group_id` int(11) NOT NULL,
  `username` varchar(20) NOT NULL,
  `password` varchar(40) NOT NULL,
  `salt` varchar(9) NOT NULL,
  `firstname` varchar(32) NOT NULL,
  `lastname` varchar(32) NOT NULL,
  `email` varchar(96) NOT NULL,
  `image` varchar(255) NOT NULL,
  `code` varchar(40) NOT NULL,
  `ip` varchar(40) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `oc_user`
--

INSERT INTO `oc_user` (`user_id`, `user_group_id`, `username`, `password`, `salt`, `firstname`, `lastname`, `email`, `image`, `code`, `ip`, `status`, `date_added`) VALUES
(1, 1, 'admin', 'e10adc3949ba59abbe56e057f20f883e', 'YbnoZyYbG', 'John', 'Doe', 'vunamkhtn@yahoo.com', '', '', '::1', 1, '2017-09-03 08:36:17'),
(2, 1, 'frank', '07560a370755dee07441a2e76d9fc5ae1250e234', '0rhpiBaMp', 'Frank', 'Lingenberg', 'info@waffen-bock.de', '', '', '2003:c9:ef26:4c00:8cac:edce:f6ba:a2e6', 1, '2018-02-01 09:10:57'),
(3, 1, 'Laptop', '58af3280efebef176bdd9d3dfdf345a809843f34', 'yPejhyQYp', 'Silvester', 'Ohnesorg', 'verkauf@waffen-bock.de', '', '', '', 1, '2018-02-20 14:24:05'),
(4, 1, 'concardis', '67ead5d5874e33a7c97e14652ee080e0387b421f', 'VPN6kenkk', 'Till', 'Gramlich', 'Till.Gramlich@concardis.com', '', '', '194.25.141.173', 0, '2018-06-19 12:25:59'),
(5, 1, 'customweb', '755483b4689ce98a26221f7b8a9a19439bded731', 'dSTmXKnwA', 'Sascha', 'Krüsi', 'info@customweb.com', '', '', '2001:171b:c9a2:cb40:581f:ec03:50f6:9c82', 1, '2018-06-25 10:24:58');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `oc_user_group`
--

DROP TABLE IF EXISTS `oc_user_group`;
CREATE TABLE `oc_user_group` (
  `user_group_id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  `permission` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `oc_user_group`
--

INSERT INTO `oc_user_group` (`user_group_id`, `name`, `permission`) VALUES
(1, 'Administrator', '{\"access\":[\"catalog\\/attribute\",\"catalog\\/attribute_group\",\"catalog\\/category\",\"catalog\\/download\",\"catalog\\/filter\",\"catalog\\/information\",\"catalog\\/manufacturer\",\"catalog\\/option\",\"catalog\\/product\",\"catalog\\/recurring\",\"catalog\\/review\",\"common\\/column_left\",\"common\\/filemanager\",\"customer\\/custom_field\",\"customer\\/customer\",\"customer\\/customer_group\",\"design\\/banner\",\"design\\/language\",\"design\\/layout\",\"design\\/menu\",\"design\\/theme\",\"design\\/translation\",\"event\\/compatibility\",\"event\\/theme\",\"extension\\/analytics\\/google_analytics\",\"extension\\/captcha\\/basic_captcha\",\"extension\\/captcha\\/google_captcha\",\"extension\\/dashboard\\/activity\",\"extension\\/dashboard\\/chart\",\"extension\\/dashboard\\/customer\",\"extension\\/dashboard\\/map\",\"extension\\/dashboard\\/online\",\"extension\\/dashboard\\/order\",\"extension\\/dashboard\\/recent\",\"extension\\/dashboard\\/sale\",\"extension\\/event\",\"extension\\/extension\",\"extension\\/extension\\/analytics\",\"extension\\/extension\\/captcha\",\"extension\\/extension\\/dashboard\",\"extension\\/extension\\/feed\",\"extension\\/extension\\/fraud\",\"extension\\/extension\\/module\",\"extension\\/extension\\/payment\",\"extension\\/extension\\/shipping\",\"extension\\/extension\\/theme\",\"extension\\/extension\\/total\",\"extension\\/feed\\/gcrdev_sitemap\",\"extension\\/feed\\/google_base\",\"extension\\/feed\\/google_sitemap\",\"extension\\/feed\\/openbaypro\",\"extension\\/fraud\\/fraudlabspro\",\"extension\\/fraud\\/ip\",\"extension\\/fraud\\/maxmind\",\"extension\\/installer\",\"extension\\/modification\",\"extension\\/module\\/account\",\"extension\\/module\\/affiliate\",\"extension\\/module\\/amazon_login\",\"extension\\/module\\/amazon_pay\",\"extension\\/module\\/banner\",\"extension\\/module\\/bestseller\",\"extension\\/module\\/blogger\",\"extension\\/module\\/carousel\",\"extension\\/module\\/category\",\"extension\\/module\\/divido_calculator\",\"extension\\/module\\/ebay_listing\",\"extension\\/module\\/featured\",\"extension\\/module\\/filter\",\"extension\\/module\\/google_hangouts\",\"extension\\/module\\/html\",\"extension\\/module\\/information\",\"extension\\/module\\/klarna_checkout_module\",\"extension\\/module\\/latest\",\"extension\\/module\\/laybuy_layout\",\"extension\\/module\\/live_search\",\"extension\\/module\\/newsletter\",\"extension\\/module\\/payengine3cw\",\"extension\\/module\\/pilibaba_button\",\"extension\\/module\\/pp_button\",\"extension\\/module\\/pp_login\",\"extension\\/module\\/sagepay_direct_cards\",\"extension\\/module\\/sagepay_server_cards\",\"extension\\/module\\/slideshow\",\"extension\\/module\\/special\",\"extension\\/module\\/store\",\"extension\\/openbay\",\"extension\\/openbay\\/amazon\",\"extension\\/openbay\\/amazon_listing\",\"extension\\/openbay\\/amazon_product\",\"extension\\/openbay\\/amazonus\",\"extension\\/openbay\\/amazonus_listing\",\"extension\\/openbay\\/amazonus_product\",\"extension\\/openbay\\/ebay\",\"extension\\/openbay\\/ebay_profile\",\"extension\\/openbay\\/ebay_template\",\"extension\\/openbay\\/etsy\",\"extension\\/openbay\\/etsy_product\",\"extension\\/openbay\\/etsy_shipping\",\"extension\\/openbay\\/etsy_shop\",\"extension\\/openbay\\/fba\",\"extension\\/payment\\/amazon_login_pay\",\"extension\\/payment\\/authorizenet_aim\",\"extension\\/payment\\/authorizenet_sim\",\"extension\\/payment\\/bank_transfer\",\"extension\\/payment\\/bluepay_hosted\",\"extension\\/payment\\/bluepay_redirect\",\"extension\\/payment\\/cardconnect\",\"extension\\/payment\\/cardinity\",\"extension\\/payment\\/cheque\",\"extension\\/payment\\/cod\",\"extension\\/payment\\/divido\",\"extension\\/payment\\/eway\",\"extension\\/payment\\/firstdata\",\"extension\\/payment\\/firstdata_remote\",\"extension\\/payment\\/free_checkout\",\"extension\\/payment\\/g2apay\",\"extension\\/payment\\/globalpay\",\"extension\\/payment\\/globalpay_remote\",\"extension\\/payment\\/klarna_account\",\"extension\\/payment\\/klarna_checkout\",\"extension\\/payment\\/klarna_invoice\",\"extension\\/payment\\/laybuy\",\"extension\\/payment\\/liqpay\",\"extension\\/payment\\/nochex\",\"extension\\/payment\\/payengine3cw_alipay\",\"extension\\/payment\\/payengine3cw_bcmc\",\"extension\\/payment\\/payengine3cw_creditcard\",\"extension\\/payment\\/payengine3cw_eps\",\"extension\\/payment\\/payengine3cw_giropay\",\"extension\\/payment\\/payengine3cw_ideal\",\"extension\\/payment\\/payengine3cw_paydirekt\",\"extension\\/payment\\/payengine3cw_paypal\",\"extension\\/payment\\/payengine3cw_postfinancecard\",\"extension\\/payment\\/payengine3cw_ratepaydirectdebits\",\"extension\\/payment\\/payengine3cw_ratepayinstallments\",\"extension\\/payment\\/payengine3cw_ratepayopeninvoice\",\"extension\\/payment\\/payengine3cw_sofortueberweisung\",\"extension\\/payment\\/payengine3cw_wechatpay\",\"extension\\/payment\\/paymate\",\"extension\\/payment\\/paypoint\",\"extension\\/payment\\/payza\",\"extension\\/payment\\/perpetual_payments\",\"extension\\/payment\\/pilibaba\",\"extension\\/payment\\/pp_express\",\"extension\\/payment\\/pp_payflow\",\"extension\\/payment\\/pp_payflow_iframe\",\"extension\\/payment\\/pp_pro\",\"extension\\/payment\\/pp_pro_iframe\",\"extension\\/payment\\/pp_standard\",\"extension\\/payment\\/realex\",\"extension\\/payment\\/realex_remote\",\"extension\\/payment\\/sagepay_direct\",\"extension\\/payment\\/sagepay_server\",\"extension\\/payment\\/sagepay_us\",\"extension\\/payment\\/securetrading_pp\",\"extension\\/payment\\/securetrading_ws\",\"extension\\/payment\\/skrill\",\"extension\\/payment\\/twocheckout\",\"extension\\/payment\\/web_payment_software\",\"extension\\/payment\\/worldpay\",\"extension\\/shipping\\/auspost\",\"extension\\/shipping\\/citylink\",\"extension\\/shipping\\/fedex\",\"extension\\/shipping\\/flat\",\"extension\\/shipping\\/free\",\"extension\\/shipping\\/item\",\"extension\\/shipping\\/parcelforce_48\",\"extension\\/shipping\\/pickup\",\"extension\\/shipping\\/royal_mail\",\"extension\\/shipping\\/ups\",\"extension\\/shipping\\/usps\",\"extension\\/shipping\\/weight\",\"extension\\/store\",\"extension\\/theme\\/theme_default\",\"extension\\/total\\/coupon\",\"extension\\/total\\/credit\",\"extension\\/total\\/handling\",\"extension\\/total\\/klarna_fee\",\"extension\\/total\\/low_order_fee\",\"extension\\/total\\/reward\",\"extension\\/total\\/shipping\",\"extension\\/total\\/sub_total\",\"extension\\/total\\/tax\",\"extension\\/total\\/total\",\"extension\\/total\\/voucher\",\"localisation\\/country\",\"localisation\\/currency\",\"localisation\\/geo_zone\",\"localisation\\/language\",\"localisation\\/length_class\",\"localisation\\/location\",\"localisation\\/order_status\",\"localisation\\/return_action\",\"localisation\\/return_reason\",\"localisation\\/return_status\",\"localisation\\/stock_status\",\"localisation\\/tax_class\",\"localisation\\/tax_rate\",\"localisation\\/weight_class\",\"localisation\\/zone\",\"marketing\\/affiliate\",\"marketing\\/contact\",\"marketing\\/coupon\",\"marketing\\/marketing\",\"payengine3cw\\/abstract_method\",\"payengine3cw\\/transaction\",\"report\\/affiliate\",\"report\\/affiliate_activity\",\"report\\/affiliate_login\",\"report\\/customer_activity\",\"report\\/customer_credit\",\"report\\/customer_login\",\"report\\/customer_online\",\"report\\/customer_order\",\"report\\/customer_reward\",\"report\\/customer_search\",\"report\\/marketing\",\"report\\/product_purchased\",\"report\\/product_viewed\",\"report\\/sale_coupon\",\"report\\/sale_order\",\"report\\/sale_return\",\"report\\/sale_shipping\",\"report\\/sale_tax\",\"sale\\/order\",\"sale\\/recurring\",\"sale\\/return\",\"sale\\/voucher\",\"sale\\/voucher_theme\",\"setting\\/setting\",\"setting\\/store\",\"startup\\/compatibility\",\"startup\\/error\",\"startup\\/event\",\"startup\\/login\",\"startup\\/permission\",\"startup\\/router\",\"startup\\/sass\",\"startup\\/startup\",\"tool\\/backup\",\"tool\\/log\",\"tool\\/upload\",\"user\\/api\",\"user\\/user\",\"user\\/user_permission\",\"extension\\/payment\\/payengine3cw_paypal\",\"extension\\/payment\\/dibseasy\"],\"modify\":[\"catalog\\/attribute\",\"catalog\\/attribute_group\",\"catalog\\/category\",\"catalog\\/download\",\"catalog\\/filter\",\"catalog\\/information\",\"catalog\\/manufacturer\",\"catalog\\/option\",\"catalog\\/product\",\"catalog\\/recurring\",\"catalog\\/review\",\"common\\/column_left\",\"common\\/filemanager\",\"customer\\/custom_field\",\"customer\\/customer\",\"customer\\/customer_group\",\"design\\/banner\",\"design\\/language\",\"design\\/layout\",\"design\\/menu\",\"design\\/theme\",\"design\\/translation\",\"event\\/compatibility\",\"event\\/theme\",\"extension\\/analytics\\/google_analytics\",\"extension\\/captcha\\/basic_captcha\",\"extension\\/captcha\\/google_captcha\",\"extension\\/dashboard\\/activity\",\"extension\\/dashboard\\/chart\",\"extension\\/dashboard\\/customer\",\"extension\\/dashboard\\/map\",\"extension\\/dashboard\\/online\",\"extension\\/dashboard\\/order\",\"extension\\/dashboard\\/recent\",\"extension\\/dashboard\\/sale\",\"extension\\/event\",\"extension\\/extension\",\"extension\\/extension\\/analytics\",\"extension\\/extension\\/captcha\",\"extension\\/extension\\/dashboard\",\"extension\\/extension\\/feed\",\"extension\\/extension\\/fraud\",\"extension\\/extension\\/module\",\"extension\\/extension\\/payment\",\"extension\\/extension\\/shipping\",\"extension\\/extension\\/theme\",\"extension\\/extension\\/total\",\"extension\\/feed\\/gcrdev_sitemap\",\"extension\\/feed\\/google_base\",\"extension\\/feed\\/google_sitemap\",\"extension\\/feed\\/openbaypro\",\"extension\\/fraud\\/fraudlabspro\",\"extension\\/fraud\\/ip\",\"extension\\/fraud\\/maxmind\",\"extension\\/installer\",\"extension\\/modification\",\"extension\\/module\\/account\",\"extension\\/module\\/affiliate\",\"extension\\/module\\/amazon_login\",\"extension\\/module\\/amazon_pay\",\"extension\\/module\\/banner\",\"extension\\/module\\/bestseller\",\"extension\\/module\\/blogger\",\"extension\\/module\\/carousel\",\"extension\\/module\\/category\",\"extension\\/module\\/divido_calculator\",\"extension\\/module\\/ebay_listing\",\"extension\\/module\\/featured\",\"extension\\/module\\/filter\",\"extension\\/module\\/google_hangouts\",\"extension\\/module\\/html\",\"extension\\/module\\/information\",\"extension\\/module\\/klarna_checkout_module\",\"extension\\/module\\/latest\",\"extension\\/module\\/laybuy_layout\",\"extension\\/module\\/live_search\",\"extension\\/module\\/newsletter\",\"extension\\/module\\/payengine3cw\",\"extension\\/module\\/pilibaba_button\",\"extension\\/module\\/pp_button\",\"extension\\/module\\/pp_login\",\"extension\\/module\\/sagepay_direct_cards\",\"extension\\/module\\/sagepay_server_cards\",\"extension\\/module\\/slideshow\",\"extension\\/module\\/special\",\"extension\\/module\\/store\",\"extension\\/openbay\",\"extension\\/openbay\\/amazon\",\"extension\\/openbay\\/amazon_listing\",\"extension\\/openbay\\/amazon_product\",\"extension\\/openbay\\/amazonus\",\"extension\\/openbay\\/amazonus_listing\",\"extension\\/openbay\\/amazonus_product\",\"extension\\/openbay\\/ebay\",\"extension\\/openbay\\/ebay_profile\",\"extension\\/openbay\\/ebay_template\",\"extension\\/openbay\\/etsy\",\"extension\\/openbay\\/etsy_product\",\"extension\\/openbay\\/etsy_shipping\",\"extension\\/openbay\\/etsy_shop\",\"extension\\/openbay\\/fba\",\"extension\\/payment\\/amazon_login_pay\",\"extension\\/payment\\/authorizenet_aim\",\"extension\\/payment\\/authorizenet_sim\",\"extension\\/payment\\/bank_transfer\",\"extension\\/payment\\/bluepay_hosted\",\"extension\\/payment\\/bluepay_redirect\",\"extension\\/payment\\/cardconnect\",\"extension\\/payment\\/cardinity\",\"extension\\/payment\\/cheque\",\"extension\\/payment\\/cod\",\"extension\\/payment\\/divido\",\"extension\\/payment\\/eway\",\"extension\\/payment\\/firstdata\",\"extension\\/payment\\/firstdata_remote\",\"extension\\/payment\\/free_checkout\",\"extension\\/payment\\/g2apay\",\"extension\\/payment\\/globalpay\",\"extension\\/payment\\/globalpay_remote\",\"extension\\/payment\\/klarna_account\",\"extension\\/payment\\/klarna_checkout\",\"extension\\/payment\\/klarna_invoice\",\"extension\\/payment\\/laybuy\",\"extension\\/payment\\/liqpay\",\"extension\\/payment\\/nochex\",\"extension\\/payment\\/payengine3cw_alipay\",\"extension\\/payment\\/payengine3cw_bcmc\",\"extension\\/payment\\/payengine3cw_creditcard\",\"extension\\/payment\\/payengine3cw_eps\",\"extension\\/payment\\/payengine3cw_giropay\",\"extension\\/payment\\/payengine3cw_ideal\",\"extension\\/payment\\/payengine3cw_paydirekt\",\"extension\\/payment\\/payengine3cw_paypal\",\"extension\\/payment\\/payengine3cw_postfinancecard\",\"extension\\/payment\\/payengine3cw_ratepaydirectdebits\",\"extension\\/payment\\/payengine3cw_ratepayinstallments\",\"extension\\/payment\\/payengine3cw_ratepayopeninvoice\",\"extension\\/payment\\/payengine3cw_sofortueberweisung\",\"extension\\/payment\\/payengine3cw_wechatpay\",\"extension\\/payment\\/paymate\",\"extension\\/payment\\/paypoint\",\"extension\\/payment\\/payza\",\"extension\\/payment\\/perpetual_payments\",\"extension\\/payment\\/pilibaba\",\"extension\\/payment\\/pp_express\",\"extension\\/payment\\/pp_payflow\",\"extension\\/payment\\/pp_payflow_iframe\",\"extension\\/payment\\/pp_pro\",\"extension\\/payment\\/pp_pro_iframe\",\"extension\\/payment\\/pp_standard\",\"extension\\/payment\\/realex\",\"extension\\/payment\\/realex_remote\",\"extension\\/payment\\/sagepay_direct\",\"extension\\/payment\\/sagepay_server\",\"extension\\/payment\\/sagepay_us\",\"extension\\/payment\\/securetrading_pp\",\"extension\\/payment\\/securetrading_ws\",\"extension\\/payment\\/skrill\",\"extension\\/payment\\/twocheckout\",\"extension\\/payment\\/web_payment_software\",\"extension\\/payment\\/worldpay\",\"extension\\/shipping\\/auspost\",\"extension\\/shipping\\/citylink\",\"extension\\/shipping\\/fedex\",\"extension\\/shipping\\/flat\",\"extension\\/shipping\\/free\",\"extension\\/shipping\\/item\",\"extension\\/shipping\\/parcelforce_48\",\"extension\\/shipping\\/pickup\",\"extension\\/shipping\\/royal_mail\",\"extension\\/shipping\\/ups\",\"extension\\/shipping\\/usps\",\"extension\\/shipping\\/weight\",\"extension\\/store\",\"extension\\/theme\\/theme_default\",\"extension\\/total\\/coupon\",\"extension\\/total\\/credit\",\"extension\\/total\\/handling\",\"extension\\/total\\/klarna_fee\",\"extension\\/total\\/low_order_fee\",\"extension\\/total\\/reward\",\"extension\\/total\\/shipping\",\"extension\\/total\\/sub_total\",\"extension\\/total\\/tax\",\"extension\\/total\\/total\",\"extension\\/total\\/voucher\",\"localisation\\/country\",\"localisation\\/currency\",\"localisation\\/geo_zone\",\"localisation\\/language\",\"localisation\\/length_class\",\"localisation\\/location\",\"localisation\\/order_status\",\"localisation\\/return_action\",\"localisation\\/return_reason\",\"localisation\\/return_status\",\"localisation\\/stock_status\",\"localisation\\/tax_class\",\"localisation\\/tax_rate\",\"localisation\\/weight_class\",\"localisation\\/zone\",\"marketing\\/affiliate\",\"marketing\\/contact\",\"marketing\\/coupon\",\"marketing\\/marketing\",\"payengine3cw\\/abstract_method\",\"payengine3cw\\/transaction\",\"report\\/affiliate\",\"report\\/affiliate_activity\",\"report\\/affiliate_login\",\"report\\/customer_activity\",\"report\\/customer_credit\",\"report\\/customer_login\",\"report\\/customer_online\",\"report\\/customer_order\",\"report\\/customer_reward\",\"report\\/customer_search\",\"report\\/marketing\",\"report\\/product_purchased\",\"report\\/product_viewed\",\"report\\/sale_coupon\",\"report\\/sale_order\",\"report\\/sale_return\",\"report\\/sale_shipping\",\"report\\/sale_tax\",\"sale\\/order\",\"sale\\/recurring\",\"sale\\/return\",\"sale\\/voucher\",\"sale\\/voucher_theme\",\"setting\\/setting\",\"setting\\/store\",\"startup\\/compatibility\",\"startup\\/error\",\"startup\\/event\",\"startup\\/login\",\"startup\\/permission\",\"startup\\/router\",\"startup\\/sass\",\"startup\\/startup\",\"tool\\/backup\",\"tool\\/log\",\"tool\\/upload\",\"user\\/api\",\"user\\/user\",\"user\\/user_permission\",\"extension\\/payment\\/payengine3cw_paypal\",\"extension\\/payment\\/dibseasy\"]}'),
(10, 'Demonstration', '{\"access\":[\"catalog\\/attribute\",\"catalog\\/attribute_group\",\"catalog\\/category\",\"catalog\\/download\",\"catalog\\/filter\",\"catalog\\/information\",\"catalog\\/manufacturer\",\"catalog\\/option\",\"catalog\\/product\",\"catalog\\/recurring\",\"catalog\\/review\",\"common\\/column_left\",\"common\\/filemanager\",\"customer\\/custom_field\",\"customer\\/customer\",\"customer\\/customer_group\",\"design\\/banner\",\"design\\/language\",\"design\\/layout\",\"design\\/menu\",\"design\\/theme\",\"design\\/translation\",\"event\\/compatibility\",\"event\\/theme\",\"extension\\/analytics\\/google_analytics\",\"extension\\/captcha\\/basic_captcha\",\"extension\\/captcha\\/google_captcha\",\"extension\\/dashboard\\/activity\",\"extension\\/dashboard\\/chart\",\"extension\\/dashboard\\/customer\",\"extension\\/dashboard\\/map\",\"extension\\/dashboard\\/online\",\"extension\\/dashboard\\/order\",\"extension\\/dashboard\\/recent\",\"extension\\/dashboard\\/sale\",\"extension\\/event\",\"extension\\/extension\",\"extension\\/extension\\/analytics\",\"extension\\/extension\\/captcha\",\"extension\\/extension\\/dashboard\",\"extension\\/extension\\/feed\",\"extension\\/extension\\/fraud\",\"extension\\/extension\\/module\",\"extension\\/extension\\/payment\",\"extension\\/extension\\/shipping\",\"extension\\/extension\\/theme\",\"extension\\/extension\\/total\",\"extension\\/feed\\/gcrdev_sitemap\",\"extension\\/feed\\/google_base\",\"extension\\/feed\\/google_sitemap\",\"extension\\/feed\\/openbaypro\",\"extension\\/fraud\\/fraudlabspro\",\"extension\\/fraud\\/ip\",\"extension\\/fraud\\/maxmind\",\"extension\\/installer\",\"extension\\/modification\",\"extension\\/module\\/account\",\"extension\\/module\\/affiliate\",\"extension\\/module\\/amazon_login\",\"extension\\/module\\/amazon_pay\",\"extension\\/module\\/banner\",\"extension\\/module\\/bestseller\",\"extension\\/module\\/blogger\",\"extension\\/module\\/carousel\",\"extension\\/module\\/category\",\"extension\\/module\\/divido_calculator\",\"extension\\/module\\/ebay_listing\",\"extension\\/module\\/featured\",\"extension\\/module\\/filter\",\"extension\\/module\\/google_hangouts\",\"extension\\/module\\/html\",\"extension\\/module\\/information\",\"extension\\/module\\/klarna_checkout_module\",\"extension\\/module\\/latest\",\"extension\\/module\\/laybuy_layout\",\"extension\\/module\\/live_search\",\"extension\\/module\\/newsletter\",\"extension\\/module\\/payengine3cw\",\"extension\\/module\\/pilibaba_button\",\"extension\\/module\\/pp_button\",\"extension\\/module\\/pp_login\",\"extension\\/module\\/sagepay_direct_cards\",\"extension\\/module\\/sagepay_server_cards\",\"extension\\/module\\/slideshow\",\"extension\\/module\\/special\",\"extension\\/module\\/store\",\"extension\\/openbay\",\"extension\\/openbay\\/amazon\",\"extension\\/openbay\\/amazon_listing\",\"extension\\/openbay\\/amazon_product\",\"extension\\/openbay\\/amazonus\",\"extension\\/openbay\\/amazonus_listing\",\"extension\\/openbay\\/amazonus_product\",\"extension\\/openbay\\/ebay\",\"extension\\/openbay\\/ebay_profile\",\"extension\\/openbay\\/ebay_template\",\"extension\\/openbay\\/etsy\",\"extension\\/openbay\\/etsy_product\",\"extension\\/openbay\\/etsy_shipping\",\"extension\\/openbay\\/etsy_shop\",\"extension\\/openbay\\/fba\",\"extension\\/payment\\/amazon_login_pay\",\"extension\\/payment\\/authorizenet_aim\",\"extension\\/payment\\/authorizenet_sim\",\"extension\\/payment\\/bank_transfer\",\"extension\\/payment\\/bluepay_hosted\",\"extension\\/payment\\/bluepay_redirect\",\"extension\\/payment\\/cardconnect\",\"extension\\/payment\\/cardinity\",\"extension\\/payment\\/cheque\",\"extension\\/payment\\/cod\",\"extension\\/payment\\/divido\",\"extension\\/payment\\/eway\",\"extension\\/payment\\/firstdata\",\"extension\\/payment\\/firstdata_remote\",\"extension\\/payment\\/free_checkout\",\"extension\\/payment\\/g2apay\",\"extension\\/payment\\/globalpay\",\"extension\\/payment\\/globalpay_remote\",\"extension\\/payment\\/klarna_account\",\"extension\\/payment\\/klarna_checkout\",\"extension\\/payment\\/klarna_invoice\",\"extension\\/payment\\/laybuy\",\"extension\\/payment\\/liqpay\",\"extension\\/payment\\/nochex\",\"extension\\/payment\\/payengine3cw_alipay\",\"extension\\/payment\\/payengine3cw_bcmc\",\"extension\\/payment\\/payengine3cw_creditcard\",\"extension\\/payment\\/payengine3cw_eps\",\"extension\\/payment\\/payengine3cw_giropay\",\"extension\\/payment\\/payengine3cw_ideal\",\"extension\\/payment\\/payengine3cw_paydirekt\",\"extension\\/payment\\/payengine3cw_paypal\",\"extension\\/payment\\/payengine3cw_postfinancecard\",\"extension\\/payment\\/payengine3cw_ratepaydirectdebits\",\"extension\\/payment\\/payengine3cw_ratepayinstallments\",\"extension\\/payment\\/payengine3cw_ratepayopeninvoice\",\"extension\\/payment\\/payengine3cw_sofortueberweisung\",\"extension\\/payment\\/payengine3cw_wechatpay\",\"extension\\/payment\\/paymate\",\"extension\\/payment\\/paypoint\",\"extension\\/payment\\/payza\",\"extension\\/payment\\/perpetual_payments\",\"extension\\/payment\\/pilibaba\",\"extension\\/payment\\/pp_express\",\"extension\\/payment\\/pp_payflow\",\"extension\\/payment\\/pp_payflow_iframe\",\"extension\\/payment\\/pp_pro\",\"extension\\/payment\\/pp_pro_iframe\",\"extension\\/payment\\/pp_standard\",\"extension\\/payment\\/realex\",\"extension\\/payment\\/realex_remote\",\"extension\\/payment\\/sagepay_direct\",\"extension\\/payment\\/sagepay_server\",\"extension\\/payment\\/sagepay_us\",\"extension\\/payment\\/securetrading_pp\",\"extension\\/payment\\/securetrading_ws\",\"extension\\/payment\\/skrill\",\"extension\\/payment\\/twocheckout\",\"extension\\/payment\\/web_payment_software\",\"extension\\/payment\\/worldpay\",\"extension\\/shipping\\/auspost\",\"extension\\/shipping\\/citylink\",\"extension\\/shipping\\/fedex\",\"extension\\/shipping\\/flat\",\"extension\\/shipping\\/free\",\"extension\\/shipping\\/item\",\"extension\\/shipping\\/parcelforce_48\",\"extension\\/shipping\\/pickup\",\"extension\\/shipping\\/royal_mail\",\"extension\\/shipping\\/ups\",\"extension\\/shipping\\/usps\",\"extension\\/shipping\\/weight\",\"extension\\/store\",\"extension\\/theme\\/theme_default\",\"extension\\/total\\/coupon\",\"extension\\/total\\/credit\",\"extension\\/total\\/handling\",\"extension\\/total\\/klarna_fee\",\"extension\\/total\\/low_order_fee\",\"extension\\/total\\/reward\",\"extension\\/total\\/shipping\",\"extension\\/total\\/sub_total\",\"extension\\/total\\/tax\",\"extension\\/total\\/total\",\"extension\\/total\\/voucher\",\"localisation\\/country\",\"localisation\\/currency\",\"localisation\\/geo_zone\",\"localisation\\/language\",\"localisation\\/length_class\",\"localisation\\/location\",\"localisation\\/order_status\",\"localisation\\/return_action\",\"localisation\\/return_reason\",\"localisation\\/return_status\",\"localisation\\/stock_status\",\"localisation\\/tax_class\",\"localisation\\/tax_rate\",\"localisation\\/weight_class\",\"localisation\\/zone\",\"marketing\\/affiliate\",\"marketing\\/contact\",\"marketing\\/coupon\",\"marketing\\/marketing\",\"payengine3cw\\/abstract_method\",\"payengine3cw\\/transaction\",\"report\\/affiliate\",\"report\\/affiliate_activity\",\"report\\/affiliate_login\",\"report\\/customer_activity\",\"report\\/customer_credit\",\"report\\/customer_login\",\"report\\/customer_online\",\"report\\/customer_order\",\"report\\/customer_reward\",\"report\\/customer_search\",\"report\\/marketing\",\"report\\/product_purchased\",\"report\\/product_viewed\",\"report\\/sale_coupon\",\"report\\/sale_order\",\"report\\/sale_return\",\"report\\/sale_shipping\",\"report\\/sale_tax\",\"sale\\/order\",\"sale\\/recurring\",\"sale\\/return\",\"sale\\/voucher\",\"sale\\/voucher_theme\",\"setting\\/setting\",\"setting\\/store\",\"startup\\/compatibility\",\"startup\\/error\",\"startup\\/event\",\"startup\\/login\",\"startup\\/permission\",\"startup\\/router\",\"startup\\/sass\",\"startup\\/startup\",\"tool\\/backup\",\"tool\\/log\",\"tool\\/upload\",\"user\\/api\",\"user\\/user\",\"user\\/user_permission\"],\"modify\":[\"catalog\\/attribute\",\"catalog\\/attribute_group\",\"catalog\\/category\",\"catalog\\/download\",\"catalog\\/filter\",\"catalog\\/information\",\"catalog\\/manufacturer\",\"catalog\\/option\",\"catalog\\/product\",\"catalog\\/recurring\",\"catalog\\/review\",\"common\\/column_left\",\"common\\/filemanager\",\"customer\\/custom_field\",\"customer\\/customer\",\"customer\\/customer_group\",\"design\\/banner\",\"design\\/language\",\"design\\/layout\",\"design\\/menu\",\"design\\/theme\",\"design\\/translation\",\"event\\/compatibility\",\"event\\/theme\",\"extension\\/analytics\\/google_analytics\",\"extension\\/captcha\\/basic_captcha\",\"extension\\/captcha\\/google_captcha\",\"extension\\/dashboard\\/activity\",\"extension\\/dashboard\\/chart\",\"extension\\/dashboard\\/customer\",\"extension\\/dashboard\\/map\",\"extension\\/dashboard\\/online\",\"extension\\/dashboard\\/order\",\"extension\\/dashboard\\/recent\",\"extension\\/dashboard\\/sale\",\"extension\\/event\",\"extension\\/extension\",\"extension\\/extension\\/analytics\",\"extension\\/extension\\/captcha\",\"extension\\/extension\\/dashboard\",\"extension\\/extension\\/feed\",\"extension\\/extension\\/fraud\",\"extension\\/extension\\/module\",\"extension\\/extension\\/payment\",\"extension\\/extension\\/shipping\",\"extension\\/extension\\/theme\",\"extension\\/extension\\/total\",\"extension\\/feed\\/gcrdev_sitemap\",\"extension\\/feed\\/google_base\",\"extension\\/feed\\/google_sitemap\",\"extension\\/feed\\/openbaypro\",\"extension\\/fraud\\/fraudlabspro\",\"extension\\/fraud\\/ip\",\"extension\\/fraud\\/maxmind\",\"extension\\/installer\",\"extension\\/modification\",\"extension\\/module\\/account\",\"extension\\/module\\/affiliate\",\"extension\\/module\\/amazon_login\",\"extension\\/module\\/amazon_pay\",\"extension\\/module\\/banner\",\"extension\\/module\\/bestseller\",\"extension\\/module\\/blogger\",\"extension\\/module\\/carousel\",\"extension\\/module\\/category\",\"extension\\/module\\/divido_calculator\",\"extension\\/module\\/ebay_listing\",\"extension\\/module\\/featured\",\"extension\\/module\\/filter\",\"extension\\/module\\/google_hangouts\",\"extension\\/module\\/html\",\"extension\\/module\\/information\",\"extension\\/module\\/klarna_checkout_module\",\"extension\\/module\\/latest\",\"extension\\/module\\/laybuy_layout\",\"extension\\/module\\/live_search\",\"extension\\/module\\/newsletter\",\"extension\\/module\\/payengine3cw\",\"extension\\/module\\/pilibaba_button\",\"extension\\/module\\/pp_button\",\"extension\\/module\\/pp_login\",\"extension\\/module\\/sagepay_direct_cards\",\"extension\\/module\\/sagepay_server_cards\",\"extension\\/module\\/slideshow\",\"extension\\/module\\/special\",\"extension\\/module\\/store\",\"extension\\/openbay\",\"extension\\/openbay\\/amazon\",\"extension\\/openbay\\/amazon_listing\",\"extension\\/openbay\\/amazon_product\",\"extension\\/openbay\\/amazonus\",\"extension\\/openbay\\/amazonus_listing\",\"extension\\/openbay\\/amazonus_product\",\"extension\\/openbay\\/ebay\",\"extension\\/openbay\\/ebay_profile\",\"extension\\/openbay\\/ebay_template\",\"extension\\/openbay\\/etsy\",\"extension\\/openbay\\/etsy_product\",\"extension\\/openbay\\/etsy_shipping\",\"extension\\/openbay\\/etsy_shop\",\"extension\\/openbay\\/fba\",\"extension\\/payment\\/amazon_login_pay\",\"extension\\/payment\\/authorizenet_aim\",\"extension\\/payment\\/authorizenet_sim\",\"extension\\/payment\\/bank_transfer\",\"extension\\/payment\\/bluepay_hosted\",\"extension\\/payment\\/bluepay_redirect\",\"extension\\/payment\\/cardconnect\",\"extension\\/payment\\/cardinity\",\"extension\\/payment\\/cheque\",\"extension\\/payment\\/cod\",\"extension\\/payment\\/divido\",\"extension\\/payment\\/eway\",\"extension\\/payment\\/firstdata\",\"extension\\/payment\\/firstdata_remote\",\"extension\\/payment\\/free_checkout\",\"extension\\/payment\\/g2apay\",\"extension\\/payment\\/globalpay\",\"extension\\/payment\\/globalpay_remote\",\"extension\\/payment\\/klarna_account\",\"extension\\/payment\\/klarna_checkout\",\"extension\\/payment\\/klarna_invoice\",\"extension\\/payment\\/laybuy\",\"extension\\/payment\\/liqpay\",\"extension\\/payment\\/nochex\",\"extension\\/payment\\/payengine3cw_alipay\",\"extension\\/payment\\/payengine3cw_bcmc\",\"extension\\/payment\\/payengine3cw_creditcard\",\"extension\\/payment\\/payengine3cw_eps\",\"extension\\/payment\\/payengine3cw_giropay\",\"extension\\/payment\\/payengine3cw_ideal\",\"extension\\/payment\\/payengine3cw_paydirekt\",\"extension\\/payment\\/payengine3cw_paypal\",\"extension\\/payment\\/payengine3cw_postfinancecard\",\"extension\\/payment\\/payengine3cw_ratepaydirectdebits\",\"extension\\/payment\\/payengine3cw_ratepayinstallments\",\"extension\\/payment\\/payengine3cw_ratepayopeninvoice\",\"extension\\/payment\\/payengine3cw_sofortueberweisung\",\"extension\\/payment\\/payengine3cw_wechatpay\",\"extension\\/payment\\/paymate\",\"extension\\/payment\\/paypoint\",\"extension\\/payment\\/payza\",\"extension\\/payment\\/perpetual_payments\",\"extension\\/payment\\/pilibaba\",\"extension\\/payment\\/pp_express\",\"extension\\/payment\\/pp_payflow\",\"extension\\/payment\\/pp_payflow_iframe\",\"extension\\/payment\\/pp_pro\",\"extension\\/payment\\/pp_pro_iframe\",\"extension\\/payment\\/pp_standard\",\"extension\\/payment\\/realex\",\"extension\\/payment\\/realex_remote\",\"extension\\/payment\\/sagepay_direct\",\"extension\\/payment\\/sagepay_server\",\"extension\\/payment\\/sagepay_us\",\"extension\\/payment\\/securetrading_pp\",\"extension\\/payment\\/securetrading_ws\",\"extension\\/payment\\/skrill\",\"extension\\/payment\\/twocheckout\",\"extension\\/payment\\/web_payment_software\",\"extension\\/payment\\/worldpay\",\"extension\\/shipping\\/auspost\",\"extension\\/shipping\\/citylink\",\"extension\\/shipping\\/fedex\",\"extension\\/shipping\\/flat\",\"extension\\/shipping\\/free\",\"extension\\/shipping\\/item\",\"extension\\/shipping\\/parcelforce_48\",\"extension\\/shipping\\/pickup\",\"extension\\/shipping\\/royal_mail\",\"extension\\/shipping\\/ups\",\"extension\\/shipping\\/usps\",\"extension\\/shipping\\/weight\",\"extension\\/store\",\"extension\\/theme\\/theme_default\",\"extension\\/total\\/coupon\",\"extension\\/total\\/credit\",\"extension\\/total\\/handling\",\"extension\\/total\\/klarna_fee\",\"extension\\/total\\/low_order_fee\",\"extension\\/total\\/reward\",\"extension\\/total\\/shipping\",\"extension\\/total\\/sub_total\",\"extension\\/total\\/tax\",\"extension\\/total\\/total\",\"extension\\/total\\/voucher\",\"localisation\\/country\",\"localisation\\/currency\",\"localisation\\/geo_zone\",\"localisation\\/language\",\"localisation\\/length_class\",\"localisation\\/location\",\"localisation\\/order_status\",\"localisation\\/return_action\",\"localisation\\/return_reason\",\"localisation\\/return_status\",\"localisation\\/stock_status\",\"localisation\\/tax_class\",\"localisation\\/tax_rate\",\"localisation\\/weight_class\",\"localisation\\/zone\",\"marketing\\/affiliate\",\"marketing\\/contact\",\"marketing\\/coupon\",\"marketing\\/marketing\",\"payengine3cw\\/abstract_method\",\"payengine3cw\\/transaction\",\"report\\/affiliate\",\"report\\/affiliate_activity\",\"report\\/affiliate_login\",\"report\\/customer_activity\",\"report\\/customer_credit\",\"report\\/customer_login\",\"report\\/customer_online\",\"report\\/customer_order\",\"report\\/customer_reward\",\"report\\/customer_search\",\"report\\/marketing\",\"report\\/product_purchased\",\"report\\/product_viewed\",\"report\\/sale_coupon\",\"report\\/sale_order\",\"report\\/sale_return\",\"report\\/sale_shipping\",\"report\\/sale_tax\",\"sale\\/order\",\"sale\\/recurring\",\"sale\\/return\",\"sale\\/voucher\",\"sale\\/voucher_theme\",\"setting\\/setting\",\"setting\\/store\",\"startup\\/compatibility\",\"startup\\/error\",\"startup\\/event\",\"startup\\/login\",\"startup\\/permission\",\"startup\\/router\",\"startup\\/sass\",\"startup\\/startup\",\"tool\\/backup\",\"tool\\/log\",\"tool\\/upload\",\"user\\/api\",\"user\\/user\",\"user\\/user_permission\"]}');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `oc_voucher`
--

DROP TABLE IF EXISTS `oc_voucher`;
CREATE TABLE `oc_voucher` (
  `voucher_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `code` varchar(10) NOT NULL,
  `from_name` varchar(64) NOT NULL,
  `from_email` varchar(96) NOT NULL,
  `to_name` varchar(64) NOT NULL,
  `to_email` varchar(96) NOT NULL,
  `voucher_theme_id` int(11) NOT NULL,
  `message` text NOT NULL,
  `amount` decimal(15,4) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `oc_voucher_history`
--

DROP TABLE IF EXISTS `oc_voucher_history`;
CREATE TABLE `oc_voucher_history` (
  `voucher_history_id` int(11) NOT NULL,
  `voucher_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `amount` decimal(15,4) NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `oc_voucher_theme`
--

DROP TABLE IF EXISTS `oc_voucher_theme`;
CREATE TABLE `oc_voucher_theme` (
  `voucher_theme_id` int(11) NOT NULL,
  `image` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `oc_voucher_theme`
--

INSERT INTO `oc_voucher_theme` (`voucher_theme_id`, `image`) VALUES
(8, 'catalog/demo/canon_eos_5d_2.jpg'),
(7, 'catalog/demo/gift-voucher-birthday.jpg'),
(6, 'catalog/demo/apple_logo.jpg');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `oc_voucher_theme_description`
--

DROP TABLE IF EXISTS `oc_voucher_theme_description`;
CREATE TABLE `oc_voucher_theme_description` (
  `voucher_theme_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(32) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `oc_voucher_theme_description`
--

INSERT INTO `oc_voucher_theme_description` (`voucher_theme_id`, `language_id`, `name`) VALUES
(6, 1, 'Christmas'),
(7, 1, 'Birthday'),
(8, 1, 'General'),
(6, 2, 'Christmas'),
(7, 2, 'Birthday'),
(8, 2, 'General');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `oc_weight_class`
--

DROP TABLE IF EXISTS `oc_weight_class`;
CREATE TABLE `oc_weight_class` (
  `weight_class_id` int(11) NOT NULL,
  `value` decimal(15,8) NOT NULL DEFAULT 0.00000000
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `oc_weight_class`
--

INSERT INTO `oc_weight_class` (`weight_class_id`, `value`) VALUES
(1, '1.00000000'),
(2, '1000.00000000'),
(5, '2.20460000'),
(6, '35.27400000');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `oc_weight_class_description`
--

DROP TABLE IF EXISTS `oc_weight_class_description`;
CREATE TABLE `oc_weight_class_description` (
  `weight_class_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `title` varchar(32) NOT NULL,
  `unit` varchar(4) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `oc_weight_class_description`
--

INSERT INTO `oc_weight_class_description` (`weight_class_id`, `language_id`, `title`, `unit`) VALUES
(1, 1, 'Kilogram', 'kg'),
(2, 1, 'Gram', 'g'),
(5, 1, 'Pound ', 'lb'),
(6, 1, 'Ounce', 'oz'),
(1, 2, 'Kilogram', 'kg'),
(2, 2, 'Gram', 'g'),
(5, 2, 'Pound ', 'lb'),
(6, 2, 'Ounce', 'oz');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `oc_zone`
--

DROP TABLE IF EXISTS `oc_zone`;
CREATE TABLE `oc_zone` (
  `zone_id` int(11) NOT NULL,
  `country_id` int(11) NOT NULL,
  `name` varchar(128) NOT NULL,
  `code` varchar(32) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `oc_zone`
--

INSERT INTO `oc_zone` (`zone_id`, `country_id`, `name`, `code`, `status`) VALUES
(1, 1, 'Badakhshan', 'BDS', 0),
(2, 1, 'Badghis', 'BDG', 0),
(3, 1, 'Baghlan', 'BGL', 0),
(4, 1, 'Balkh', 'BAL', 0),
(5, 1, 'Bamian', 'BAM', 0),
(6, 1, 'Farah', 'FRA', 0),
(7, 1, 'Faryab', 'FYB', 0),
(8, 1, 'Ghazni', 'GHA', 0),
(9, 1, 'Ghowr', 'GHO', 0),
(10, 1, 'Helmand', 'HEL', 0),
(11, 1, 'Herat', 'HER', 0),
(12, 1, 'Jowzjan', 'JOW', 0),
(13, 1, 'Kabul', 'KAB', 0),
(14, 1, 'Kandahar', 'KAN', 0),
(15, 1, 'Kapisa', 'KAP', 0),
(16, 1, 'Khost', 'KHO', 0),
(17, 1, 'Konar', 'KNR', 0),
(18, 1, 'Kondoz', 'KDZ', 0),
(19, 1, 'Laghman', 'LAG', 0),
(20, 1, 'Lowgar', 'LOW', 0),
(21, 1, 'Nangrahar', 'NAN', 0),
(22, 1, 'Nimruz', 'NIM', 0),
(23, 1, 'Nurestan', 'NUR', 0),
(24, 1, 'Oruzgan', 'ORU', 0),
(25, 1, 'Paktia', 'PIA', 0),
(26, 1, 'Paktika', 'PKA', 0),
(27, 1, 'Parwan', 'PAR', 0),
(28, 1, 'Samangan', 'SAM', 0),
(29, 1, 'Sar-e Pol', 'SAR', 0),
(30, 1, 'Takhar', 'TAK', 0),
(31, 1, 'Wardak', 'WAR', 0),
(32, 1, 'Zabol', 'ZAB', 0),
(33, 2, 'Berat', 'BR', 0),
(34, 2, 'Bulqize', 'BU', 0),
(35, 2, 'Delvine', 'DL', 0),
(36, 2, 'Devoll', 'DV', 0),
(37, 2, 'Diber', 'DI', 0),
(38, 2, 'Durres', 'DR', 0),
(39, 2, 'Elbasan', 'EL', 0),
(40, 2, 'Kolonje', 'ER', 0),
(41, 2, 'Fier', 'FR', 0),
(42, 2, 'Gjirokaster', 'GJ', 0),
(43, 2, 'Gramsh', 'GR', 0),
(44, 2, 'Has', 'HA', 0),
(45, 2, 'Kavaje', 'KA', 0),
(46, 2, 'Kurbin', 'KB', 0),
(47, 2, 'Kucove', 'KC', 0),
(48, 2, 'Korce', 'KO', 0),
(49, 2, 'Kruje', 'KR', 0),
(50, 2, 'Kukes', 'KU', 0),
(51, 2, 'Librazhd', 'LB', 0),
(52, 2, 'Lezhe', 'LE', 0),
(53, 2, 'Lushnje', 'LU', 0),
(54, 2, 'Malesi e Madhe', 'MM', 0),
(55, 2, 'Mallakaster', 'MK', 0),
(56, 2, 'Mat', 'MT', 0),
(57, 2, 'Mirdite', 'MR', 0),
(58, 2, 'Peqin', 'PQ', 0),
(59, 2, 'Permet', 'PR', 0),
(60, 2, 'Pogradec', 'PG', 0),
(61, 2, 'Puke', 'PU', 0),
(62, 2, 'Shkoder', 'SH', 0),
(63, 2, 'Skrapar', 'SK', 0),
(64, 2, 'Sarande', 'SR', 0),
(65, 2, 'Tepelene', 'TE', 0),
(66, 2, 'Tropoje', 'TP', 0),
(67, 2, 'Tirane', 'TR', 0),
(68, 2, 'Vlore', 'VL', 0),
(69, 3, 'Adrar', 'ADR', 0),
(70, 3, 'Ain Defla', 'ADE', 0),
(71, 3, 'Ain Temouchent', 'ATE', 0),
(72, 3, 'Alger', 'ALG', 0),
(73, 3, 'Annaba', 'ANN', 0),
(74, 3, 'Batna', 'BAT', 0),
(75, 3, 'Bechar', 'BEC', 0),
(76, 3, 'Bejaia', 'BEJ', 0),
(77, 3, 'Biskra', 'BIS', 0),
(78, 3, 'Blida', 'BLI', 0),
(79, 3, 'Bordj Bou Arreridj', 'BBA', 0),
(80, 3, 'Bouira', 'BOA', 0),
(81, 3, 'Boumerdes', 'BMD', 0),
(82, 3, 'Chlef', 'CHL', 0),
(83, 3, 'Constantine', 'CON', 0),
(84, 3, 'Djelfa', 'DJE', 0),
(85, 3, 'El Bayadh', 'EBA', 0),
(86, 3, 'El Oued', 'EOU', 0),
(87, 3, 'El Tarf', 'ETA', 0),
(88, 3, 'Ghardaia', 'GHA', 0),
(89, 3, 'Guelma', 'GUE', 0),
(90, 3, 'Illizi', 'ILL', 0),
(91, 3, 'Jijel', 'JIJ', 0),
(92, 3, 'Khenchela', 'KHE', 0),
(93, 3, 'Laghouat', 'LAG', 0),
(94, 3, 'Muaskar', 'MUA', 0),
(95, 3, 'Medea', 'MED', 0),
(96, 3, 'Mila', 'MIL', 0),
(97, 3, 'Mostaganem', 'MOS', 0),
(98, 3, 'M\'Sila', 'MSI', 0),
(99, 3, 'Naama', 'NAA', 0),
(100, 3, 'Oran', 'ORA', 0),
(101, 3, 'Ouargla', 'OUA', 0),
(102, 3, 'Oum el-Bouaghi', 'OEB', 0),
(103, 3, 'Relizane', 'REL', 0),
(104, 3, 'Saida', 'SAI', 0),
(105, 3, 'Setif', 'SET', 0),
(106, 3, 'Sidi Bel Abbes', 'SBA', 0),
(107, 3, 'Skikda', 'SKI', 0),
(108, 3, 'Souk Ahras', 'SAH', 0),
(109, 3, 'Tamanghasset', 'TAM', 0),
(110, 3, 'Tebessa', 'TEB', 0),
(111, 3, 'Tiaret', 'TIA', 0),
(112, 3, 'Tindouf', 'TIN', 0),
(113, 3, 'Tipaza', 'TIP', 0),
(114, 3, 'Tissemsilt', 'TIS', 0),
(115, 3, 'Tizi Ouzou', 'TOU', 0),
(116, 3, 'Tlemcen', 'TLE', 0),
(117, 4, 'Eastern', 'E', 0),
(118, 4, 'Manu\'a', 'M', 0),
(119, 4, 'Rose Island', 'R', 0),
(120, 4, 'Swains Island', 'S', 0),
(121, 4, 'Western', 'W', 0),
(122, 5, 'Andorra la Vella', 'ALV', 0),
(123, 5, 'Canillo', 'CAN', 0),
(124, 5, 'Encamp', 'ENC', 0),
(125, 5, 'Escaldes-Engordany', 'ESE', 0),
(126, 5, 'La Massana', 'LMA', 0),
(127, 5, 'Ordino', 'ORD', 0),
(128, 5, 'Sant Julia de Loria', 'SJL', 0),
(129, 6, 'Bengo', 'BGO', 0),
(130, 6, 'Benguela', 'BGU', 0),
(131, 6, 'Bie', 'BIE', 0),
(132, 6, 'Cabinda', 'CAB', 0),
(133, 6, 'Cuando-Cubango', 'CCU', 0),
(134, 6, 'Cuanza Norte', 'CNO', 0),
(135, 6, 'Cuanza Sul', 'CUS', 0),
(136, 6, 'Cunene', 'CNN', 0),
(137, 6, 'Huambo', 'HUA', 0),
(138, 6, 'Huila', 'HUI', 0),
(139, 6, 'Luanda', 'LUA', 0),
(140, 6, 'Lunda Norte', 'LNO', 0),
(141, 6, 'Lunda Sul', 'LSU', 0),
(142, 6, 'Malange', 'MAL', 0),
(143, 6, 'Moxico', 'MOX', 0),
(144, 6, 'Namibe', 'NAM', 0),
(145, 6, 'Uige', 'UIG', 0),
(146, 6, 'Zaire', 'ZAI', 0),
(147, 9, 'Saint George', 'ASG', 0),
(148, 9, 'Saint John', 'ASJ', 0),
(149, 9, 'Saint Mary', 'ASM', 0),
(150, 9, 'Saint Paul', 'ASL', 0),
(151, 9, 'Saint Peter', 'ASR', 0),
(152, 9, 'Saint Philip', 'ASH', 0),
(153, 9, 'Barbuda', 'BAR', 0),
(154, 9, 'Redonda', 'RED', 0),
(155, 10, 'Antartida e Islas del Atlantico', 'AN', 0),
(156, 10, 'Buenos Aires', 'BA', 0),
(157, 10, 'Catamarca', 'CA', 0),
(158, 10, 'Chaco', 'CH', 0),
(159, 10, 'Chubut', 'CU', 0),
(160, 10, 'Cordoba', 'CO', 0),
(161, 10, 'Corrientes', 'CR', 0),
(162, 10, 'Distrito Federal', 'DF', 0),
(163, 10, 'Entre Rios', 'ER', 0),
(164, 10, 'Formosa', 'FO', 0),
(165, 10, 'Jujuy', 'JU', 0),
(166, 10, 'La Pampa', 'LP', 0),
(167, 10, 'La Rioja', 'LR', 0),
(168, 10, 'Mendoza', 'ME', 0),
(169, 10, 'Misiones', 'MI', 0),
(170, 10, 'Neuquen', 'NE', 0),
(171, 10, 'Rio Negro', 'RN', 0),
(172, 10, 'Salta', 'SA', 0),
(173, 10, 'San Juan', 'SJ', 0),
(174, 10, 'San Luis', 'SL', 0),
(175, 10, 'Santa Cruz', 'SC', 0),
(176, 10, 'Santa Fe', 'SF', 0),
(177, 10, 'Santiago del Estero', 'SD', 0),
(178, 10, 'Tierra del Fuego', 'TF', 0),
(179, 10, 'Tucuman', 'TU', 0),
(180, 11, 'Aragatsotn', 'AGT', 0),
(181, 11, 'Ararat', 'ARR', 0),
(182, 11, 'Armavir', 'ARM', 0),
(183, 11, 'Geghark\'unik\'', 'GEG', 0),
(184, 11, 'Kotayk\'', 'KOT', 0),
(185, 11, 'Lorri', 'LOR', 0),
(186, 11, 'Shirak', 'SHI', 0),
(187, 11, 'Syunik\'', 'SYU', 0),
(188, 11, 'Tavush', 'TAV', 0),
(189, 11, 'Vayots\' Dzor', 'VAY', 0),
(190, 11, 'Yerevan', 'YER', 0),
(191, 13, 'Australian Capital Territory', 'ACT', 0),
(192, 13, 'New South Wales', 'NSW', 0),
(193, 13, 'Northern Territory', 'NT', 0),
(194, 13, 'Queensland', 'QLD', 0),
(195, 13, 'South Australia', 'SA', 0),
(196, 13, 'Tasmania', 'TAS', 0),
(197, 13, 'Victoria', 'VIC', 0),
(198, 13, 'Western Australia', 'WA', 0),
(199, 14, 'Burgenland', 'BUR', 1),
(200, 14, 'Kärnten', 'KAR', 1),
(201, 14, 'Niederösterreich', 'NOS', 1),
(202, 14, 'Oberösterreich', 'OOS', 1),
(203, 14, 'Salzburg', 'SAL', 1),
(204, 14, 'Steiermark', 'STE', 1),
(205, 14, 'Tirol', 'TIR', 1),
(206, 14, 'Vorarlberg', 'VOR', 1),
(207, 14, 'Wien', 'WIE', 1),
(208, 15, 'Ali Bayramli', 'AB', 0),
(209, 15, 'Abseron', 'ABS', 0),
(210, 15, 'AgcabAdi', 'AGC', 0),
(211, 15, 'Agdam', 'AGM', 0),
(212, 15, 'Agdas', 'AGS', 0),
(213, 15, 'Agstafa', 'AGA', 0),
(214, 15, 'Agsu', 'AGU', 0),
(215, 15, 'Astara', 'AST', 0),
(216, 15, 'Baki', 'BA', 0),
(217, 15, 'BabAk', 'BAB', 0),
(218, 15, 'BalakAn', 'BAL', 0),
(219, 15, 'BArdA', 'BAR', 0),
(220, 15, 'Beylaqan', 'BEY', 0),
(221, 15, 'Bilasuvar', 'BIL', 0),
(222, 15, 'Cabrayil', 'CAB', 0),
(223, 15, 'Calilabab', 'CAL', 0),
(224, 15, 'Culfa', 'CUL', 0),
(225, 15, 'Daskasan', 'DAS', 0),
(226, 15, 'Davaci', 'DAV', 0),
(227, 15, 'Fuzuli', 'FUZ', 0),
(228, 15, 'Ganca', 'GA', 0),
(229, 15, 'Gadabay', 'GAD', 0),
(230, 15, 'Goranboy', 'GOR', 0),
(231, 15, 'Goycay', 'GOY', 0),
(232, 15, 'Haciqabul', 'HAC', 0),
(233, 15, 'Imisli', 'IMI', 0),
(234, 15, 'Ismayilli', 'ISM', 0),
(235, 15, 'Kalbacar', 'KAL', 0),
(236, 15, 'Kurdamir', 'KUR', 0),
(237, 15, 'Lankaran', 'LA', 0),
(238, 15, 'Lacin', 'LAC', 0),
(239, 15, 'Lankaran', 'LAN', 0),
(240, 15, 'Lerik', 'LER', 0),
(241, 15, 'Masalli', 'MAS', 0),
(242, 15, 'Mingacevir', 'MI', 0),
(243, 15, 'Naftalan', 'NA', 0),
(244, 15, 'Neftcala', 'NEF', 0),
(245, 15, 'Oguz', 'OGU', 0),
(246, 15, 'Ordubad', 'ORD', 0),
(247, 15, 'Qabala', 'QAB', 0),
(248, 15, 'Qax', 'QAX', 0),
(249, 15, 'Qazax', 'QAZ', 0),
(250, 15, 'Qobustan', 'QOB', 0),
(251, 15, 'Quba', 'QBA', 0),
(252, 15, 'Qubadli', 'QBI', 0),
(253, 15, 'Qusar', 'QUS', 0),
(254, 15, 'Saki', 'SA', 0),
(255, 15, 'Saatli', 'SAT', 0),
(256, 15, 'Sabirabad', 'SAB', 0),
(257, 15, 'Sadarak', 'SAD', 0),
(258, 15, 'Sahbuz', 'SAH', 0),
(259, 15, 'Saki', 'SAK', 0),
(260, 15, 'Salyan', 'SAL', 0),
(261, 15, 'Sumqayit', 'SM', 0),
(262, 15, 'Samaxi', 'SMI', 0),
(263, 15, 'Samkir', 'SKR', 0),
(264, 15, 'Samux', 'SMX', 0),
(265, 15, 'Sarur', 'SAR', 0),
(266, 15, 'Siyazan', 'SIY', 0),
(267, 15, 'Susa', 'SS', 0),
(268, 15, 'Susa', 'SUS', 0),
(269, 15, 'Tartar', 'TAR', 0),
(270, 15, 'Tovuz', 'TOV', 0),
(271, 15, 'Ucar', 'UCA', 0),
(272, 15, 'Xankandi', 'XA', 0),
(273, 15, 'Xacmaz', 'XAC', 0),
(274, 15, 'Xanlar', 'XAN', 0),
(275, 15, 'Xizi', 'XIZ', 0),
(276, 15, 'Xocali', 'XCI', 0),
(277, 15, 'Xocavand', 'XVD', 0),
(278, 15, 'Yardimli', 'YAR', 0),
(279, 15, 'Yevlax', 'YEV', 0),
(280, 15, 'Zangilan', 'ZAN', 0),
(281, 15, 'Zaqatala', 'ZAQ', 0),
(282, 15, 'Zardab', 'ZAR', 0),
(283, 15, 'Naxcivan', 'NX', 0),
(284, 16, 'Acklins', 'ACK', 0),
(285, 16, 'Berry Islands', 'BER', 0),
(286, 16, 'Bimini', 'BIM', 0),
(287, 16, 'Black Point', 'BLK', 0),
(288, 16, 'Cat Island', 'CAT', 0),
(289, 16, 'Central Abaco', 'CAB', 0),
(290, 16, 'Central Andros', 'CAN', 0),
(291, 16, 'Central Eleuthera', 'CEL', 0),
(292, 16, 'City of Freeport', 'FRE', 0),
(293, 16, 'Crooked Island', 'CRO', 0),
(294, 16, 'East Grand Bahama', 'EGB', 0),
(295, 16, 'Exuma', 'EXU', 0),
(296, 16, 'Grand Cay', 'GRD', 0),
(297, 16, 'Harbour Island', 'HAR', 0),
(298, 16, 'Hope Town', 'HOP', 0),
(299, 16, 'Inagua', 'INA', 0),
(300, 16, 'Long Island', 'LNG', 0),
(301, 16, 'Mangrove Cay', 'MAN', 0),
(302, 16, 'Mayaguana', 'MAY', 0),
(303, 16, 'Moore\'s Island', 'MOO', 0),
(304, 16, 'North Abaco', 'NAB', 0),
(305, 16, 'North Andros', 'NAN', 0),
(306, 16, 'North Eleuthera', 'NEL', 0),
(307, 16, 'Ragged Island', 'RAG', 0),
(308, 16, 'Rum Cay', 'RUM', 0),
(309, 16, 'San Salvador', 'SAL', 0),
(310, 16, 'South Abaco', 'SAB', 0),
(311, 16, 'South Andros', 'SAN', 0),
(312, 16, 'South Eleuthera', 'SEL', 0),
(313, 16, 'Spanish Wells', 'SWE', 0),
(314, 16, 'West Grand Bahama', 'WGB', 0),
(315, 17, 'Capital', 'CAP', 0),
(316, 17, 'Central', 'CEN', 0),
(317, 17, 'Muharraq', 'MUH', 0),
(318, 17, 'Northern', 'NOR', 0),
(319, 17, 'Southern', 'SOU', 0),
(320, 18, 'Barisal', 'BAR', 0),
(321, 18, 'Chittagong', 'CHI', 0),
(322, 18, 'Dhaka', 'DHA', 0),
(323, 18, 'Khulna', 'KHU', 0),
(324, 18, 'Rajshahi', 'RAJ', 0),
(325, 18, 'Sylhet', 'SYL', 0),
(326, 19, 'Christ Church', 'CC', 0),
(327, 19, 'Saint Andrew', 'AND', 0),
(328, 19, 'Saint George', 'GEO', 0),
(329, 19, 'Saint James', 'JAM', 0),
(330, 19, 'Saint John', 'JOH', 0),
(331, 19, 'Saint Joseph', 'JOS', 0),
(332, 19, 'Saint Lucy', 'LUC', 0),
(333, 19, 'Saint Michael', 'MIC', 0),
(334, 19, 'Saint Peter', 'PET', 0),
(335, 19, 'Saint Philip', 'PHI', 0),
(336, 19, 'Saint Thomas', 'THO', 0),
(337, 20, 'Brestskaya (Brest)', 'BR', 0),
(338, 20, 'Homyel\'skaya (Homyel\')', 'HO', 0),
(339, 20, 'Horad Minsk', 'HM', 0),
(340, 20, 'Hrodzyenskaya (Hrodna)', 'HR', 0),
(341, 20, 'Mahilyowskaya (Mahilyow)', 'MA', 0),
(342, 20, 'Minskaya', 'MI', 0),
(343, 20, 'Vitsyebskaya (Vitsyebsk)', 'VI', 0),
(344, 21, 'Antwerpen', 'VAN', 0),
(345, 21, 'Brabant Wallon', 'WBR', 0),
(346, 21, 'Hainaut', 'WHT', 0),
(347, 21, 'Liège', 'WLG', 0),
(348, 21, 'Limburg', 'VLI', 0),
(349, 21, 'Luxembourg', 'WLX', 0),
(350, 21, 'Namur', 'WNA', 0),
(351, 21, 'Oost-Vlaanderen', 'VOV', 0),
(352, 21, 'Vlaams Brabant', 'VBR', 0),
(353, 21, 'West-Vlaanderen', 'VWV', 0),
(354, 22, 'Belize', 'BZ', 0),
(355, 22, 'Cayo', 'CY', 0),
(356, 22, 'Corozal', 'CR', 0),
(357, 22, 'Orange Walk', 'OW', 0),
(358, 22, 'Stann Creek', 'SC', 0),
(359, 22, 'Toledo', 'TO', 0),
(360, 23, 'Alibori', 'AL', 0),
(361, 23, 'Atakora', 'AK', 0),
(362, 23, 'Atlantique', 'AQ', 0),
(363, 23, 'Borgou', 'BO', 0),
(364, 23, 'Collines', 'CO', 0),
(365, 23, 'Donga', 'DO', 0),
(366, 23, 'Kouffo', 'KO', 0),
(367, 23, 'Littoral', 'LI', 0),
(368, 23, 'Mono', 'MO', 0),
(369, 23, 'Oueme', 'OU', 0),
(370, 23, 'Plateau', 'PL', 0),
(371, 23, 'Zou', 'ZO', 0),
(372, 24, 'Devonshire', 'DS', 0),
(373, 24, 'Hamilton City', 'HC', 0),
(374, 24, 'Hamilton', 'HA', 0),
(375, 24, 'Paget', 'PG', 0),
(376, 24, 'Pembroke', 'PB', 0),
(377, 24, 'Saint George City', 'GC', 0),
(378, 24, 'Saint George\'s', 'SG', 0),
(379, 24, 'Sandys', 'SA', 0),
(380, 24, 'Smith\'s', 'SM', 0),
(381, 24, 'Southampton', 'SH', 0),
(382, 24, 'Warwick', 'WA', 0),
(383, 25, 'Bumthang', 'BUM', 0),
(384, 25, 'Chukha', 'CHU', 0),
(385, 25, 'Dagana', 'DAG', 0),
(386, 25, 'Gasa', 'GAS', 0),
(387, 25, 'Haa', 'HAA', 0),
(388, 25, 'Lhuntse', 'LHU', 0),
(389, 25, 'Mongar', 'MON', 0),
(390, 25, 'Paro', 'PAR', 0),
(391, 25, 'Pemagatshel', 'PEM', 0),
(392, 25, 'Punakha', 'PUN', 0),
(393, 25, 'Samdrup Jongkhar', 'SJO', 0),
(394, 25, 'Samtse', 'SAT', 0),
(395, 25, 'Sarpang', 'SAR', 0),
(396, 25, 'Thimphu', 'THI', 0),
(397, 25, 'Trashigang', 'TRG', 0),
(398, 25, 'Trashiyangste', 'TRY', 0),
(399, 25, 'Trongsa', 'TRO', 0),
(400, 25, 'Tsirang', 'TSI', 0),
(401, 25, 'Wangdue Phodrang', 'WPH', 0),
(402, 25, 'Zhemgang', 'ZHE', 0),
(403, 26, 'Beni', 'BEN', 0),
(404, 26, 'Chuquisaca', 'CHU', 0),
(405, 26, 'Cochabamba', 'COC', 0),
(406, 26, 'La Paz', 'LPZ', 0),
(407, 26, 'Oruro', 'ORU', 0),
(408, 26, 'Pando', 'PAN', 0),
(409, 26, 'Potosi', 'POT', 0),
(410, 26, 'Santa Cruz', 'SCZ', 0),
(411, 26, 'Tarija', 'TAR', 0),
(412, 27, 'Brcko district', 'BRO', 0),
(413, 27, 'Unsko-Sanski Kanton', 'FUS', 0),
(414, 27, 'Posavski Kanton', 'FPO', 0),
(415, 27, 'Tuzlanski Kanton', 'FTU', 0),
(416, 27, 'Zenicko-Dobojski Kanton', 'FZE', 0),
(417, 27, 'Bosanskopodrinjski Kanton', 'FBP', 0),
(418, 27, 'Srednjebosanski Kanton', 'FSB', 0),
(419, 27, 'Hercegovacko-neretvanski Kanton', 'FHN', 0),
(420, 27, 'Zapadnohercegovacka Zupanija', 'FZH', 0),
(421, 27, 'Kanton Sarajevo', 'FSA', 0),
(422, 27, 'Zapadnobosanska', 'FZA', 0),
(423, 27, 'Banja Luka', 'SBL', 0),
(424, 27, 'Doboj', 'SDO', 0),
(425, 27, 'Bijeljina', 'SBI', 0),
(426, 27, 'Vlasenica', 'SVL', 0),
(427, 27, 'Sarajevo-Romanija or Sokolac', 'SSR', 0),
(428, 27, 'Foca', 'SFO', 0),
(429, 27, 'Trebinje', 'STR', 0),
(430, 28, 'Central', 'CE', 0),
(431, 28, 'Ghanzi', 'GH', 0),
(432, 28, 'Kgalagadi', 'KD', 0),
(433, 28, 'Kgatleng', 'KT', 0),
(434, 28, 'Kweneng', 'KW', 0),
(435, 28, 'Ngamiland', 'NG', 0),
(436, 28, 'North East', 'NE', 0),
(437, 28, 'North West', 'NW', 0),
(438, 28, 'South East', 'SE', 0),
(439, 28, 'Southern', 'SO', 0),
(440, 30, 'Acre', 'AC', 0),
(441, 30, 'Alagoas', 'AL', 0),
(442, 30, 'Amapá', 'AP', 0),
(443, 30, 'Amazonas', 'AM', 0),
(444, 30, 'Bahia', 'BA', 0),
(445, 30, 'Ceará', 'CE', 0),
(446, 30, 'Distrito Federal', 'DF', 0),
(447, 30, 'Espírito Santo', 'ES', 0),
(448, 30, 'Goiás', 'GO', 0),
(449, 30, 'Maranhão', 'MA', 0),
(450, 30, 'Mato Grosso', 'MT', 0),
(451, 30, 'Mato Grosso do Sul', 'MS', 0),
(452, 30, 'Minas Gerais', 'MG', 0),
(453, 30, 'Pará', 'PA', 0),
(454, 30, 'Paraíba', 'PB', 0),
(455, 30, 'Paraná', 'PR', 0),
(456, 30, 'Pernambuco', 'PE', 0),
(457, 30, 'Piauí', 'PI', 0),
(458, 30, 'Rio de Janeiro', 'RJ', 0),
(459, 30, 'Rio Grande do Norte', 'RN', 0),
(460, 30, 'Rio Grande do Sul', 'RS', 0),
(461, 30, 'Rondônia', 'RO', 0),
(462, 30, 'Roraima', 'RR', 0),
(463, 30, 'Santa Catarina', 'SC', 0),
(464, 30, 'São Paulo', 'SP', 0),
(465, 30, 'Sergipe', 'SE', 0),
(466, 30, 'Tocantins', 'TO', 0),
(467, 31, 'Peros Banhos', 'PB', 0),
(468, 31, 'Salomon Islands', 'SI', 0),
(469, 31, 'Nelsons Island', 'NI', 0),
(470, 31, 'Three Brothers', 'TB', 0),
(471, 31, 'Eagle Islands', 'EA', 0),
(472, 31, 'Danger Island', 'DI', 0),
(473, 31, 'Egmont Islands', 'EG', 0),
(474, 31, 'Diego Garcia', 'DG', 0),
(475, 32, 'Belait', 'BEL', 0),
(476, 32, 'Brunei and Muara', 'BRM', 0),
(477, 32, 'Temburong', 'TEM', 0),
(478, 32, 'Tutong', 'TUT', 0),
(479, 33, 'Blagoevgrad', '', 0),
(480, 33, 'Burgas', '', 0),
(481, 33, 'Dobrich', '', 0),
(482, 33, 'Gabrovo', '', 0),
(483, 33, 'Haskovo', '', 0),
(484, 33, 'Kardjali', '', 0),
(485, 33, 'Kyustendil', '', 0),
(486, 33, 'Lovech', '', 0),
(487, 33, 'Montana', '', 0),
(488, 33, 'Pazardjik', '', 0),
(489, 33, 'Pernik', '', 0),
(490, 33, 'Pleven', '', 0),
(491, 33, 'Plovdiv', '', 0),
(492, 33, 'Razgrad', '', 0),
(493, 33, 'Shumen', '', 0),
(494, 33, 'Silistra', '', 0),
(495, 33, 'Sliven', '', 0),
(496, 33, 'Smolyan', '', 0),
(497, 33, 'Sofia', '', 0),
(498, 33, 'Sofia - town', '', 0),
(499, 33, 'Stara Zagora', '', 0),
(500, 33, 'Targovishte', '', 0),
(501, 33, 'Varna', '', 0),
(502, 33, 'Veliko Tarnovo', '', 0),
(503, 33, 'Vidin', '', 0),
(504, 33, 'Vratza', '', 0),
(505, 33, 'Yambol', '', 0),
(506, 34, 'Bale', 'BAL', 0),
(507, 34, 'Bam', 'BAM', 0),
(508, 34, 'Banwa', 'BAN', 0),
(509, 34, 'Bazega', 'BAZ', 0),
(510, 34, 'Bougouriba', 'BOR', 0),
(511, 34, 'Boulgou', 'BLG', 0),
(512, 34, 'Boulkiemde', 'BOK', 0),
(513, 34, 'Comoe', 'COM', 0),
(514, 34, 'Ganzourgou', 'GAN', 0),
(515, 34, 'Gnagna', 'GNA', 0),
(516, 34, 'Gourma', 'GOU', 0),
(517, 34, 'Houet', 'HOU', 0),
(518, 34, 'Ioba', 'IOA', 0),
(519, 34, 'Kadiogo', 'KAD', 0),
(520, 34, 'Kenedougou', 'KEN', 0),
(521, 34, 'Komondjari', 'KOD', 0),
(522, 34, 'Kompienga', 'KOP', 0),
(523, 34, 'Kossi', 'KOS', 0),
(524, 34, 'Koulpelogo', 'KOL', 0),
(525, 34, 'Kouritenga', 'KOT', 0),
(526, 34, 'Kourweogo', 'KOW', 0),
(527, 34, 'Leraba', 'LER', 0),
(528, 34, 'Loroum', 'LOR', 0),
(529, 34, 'Mouhoun', 'MOU', 0),
(530, 34, 'Nahouri', 'NAH', 0),
(531, 34, 'Namentenga', 'NAM', 0),
(532, 34, 'Nayala', 'NAY', 0),
(533, 34, 'Noumbiel', 'NOU', 0),
(534, 34, 'Oubritenga', 'OUB', 0),
(535, 34, 'Oudalan', 'OUD', 0),
(536, 34, 'Passore', 'PAS', 0),
(537, 34, 'Poni', 'PON', 0),
(538, 34, 'Sanguie', 'SAG', 0),
(539, 34, 'Sanmatenga', 'SAM', 0),
(540, 34, 'Seno', 'SEN', 0),
(541, 34, 'Sissili', 'SIS', 0),
(542, 34, 'Soum', 'SOM', 0),
(543, 34, 'Sourou', 'SOR', 0),
(544, 34, 'Tapoa', 'TAP', 0),
(545, 34, 'Tuy', 'TUY', 0),
(546, 34, 'Yagha', 'YAG', 0),
(547, 34, 'Yatenga', 'YAT', 0),
(548, 34, 'Ziro', 'ZIR', 0),
(549, 34, 'Zondoma', 'ZOD', 0),
(550, 34, 'Zoundweogo', 'ZOW', 0),
(551, 35, 'Bubanza', 'BB', 0),
(552, 35, 'Bujumbura', 'BJ', 0),
(553, 35, 'Bururi', 'BR', 0),
(554, 35, 'Cankuzo', 'CA', 0),
(555, 35, 'Cibitoke', 'CI', 0),
(556, 35, 'Gitega', 'GI', 0),
(557, 35, 'Karuzi', 'KR', 0),
(558, 35, 'Kayanza', 'KY', 0),
(559, 35, 'Kirundo', 'KI', 0),
(560, 35, 'Makamba', 'MA', 0),
(561, 35, 'Muramvya', 'MU', 0),
(562, 35, 'Muyinga', 'MY', 0),
(563, 35, 'Mwaro', 'MW', 0),
(564, 35, 'Ngozi', 'NG', 0),
(565, 35, 'Rutana', 'RT', 0),
(566, 35, 'Ruyigi', 'RY', 0),
(567, 36, 'Phnom Penh', 'PP', 0),
(568, 36, 'Preah Seihanu (Kompong Som or Sihanoukville)', 'PS', 0),
(569, 36, 'Pailin', 'PA', 0),
(570, 36, 'Keb', 'KB', 0),
(571, 36, 'Banteay Meanchey', 'BM', 0),
(572, 36, 'Battambang', 'BA', 0),
(573, 36, 'Kampong Cham', 'KM', 0),
(574, 36, 'Kampong Chhnang', 'KN', 0),
(575, 36, 'Kampong Speu', 'KU', 0),
(576, 36, 'Kampong Som', 'KO', 0),
(577, 36, 'Kampong Thom', 'KT', 0),
(578, 36, 'Kampot', 'KP', 0),
(579, 36, 'Kandal', 'KL', 0),
(580, 36, 'Kaoh Kong', 'KK', 0),
(581, 36, 'Kratie', 'KR', 0),
(582, 36, 'Mondul Kiri', 'MK', 0),
(583, 36, 'Oddar Meancheay', 'OM', 0),
(584, 36, 'Pursat', 'PU', 0),
(585, 36, 'Preah Vihear', 'PR', 0),
(586, 36, 'Prey Veng', 'PG', 0),
(587, 36, 'Ratanak Kiri', 'RK', 0),
(588, 36, 'Siemreap', 'SI', 0),
(589, 36, 'Stung Treng', 'ST', 0),
(590, 36, 'Svay Rieng', 'SR', 0),
(591, 36, 'Takeo', 'TK', 0),
(592, 37, 'Adamawa (Adamaoua)', 'ADA', 0),
(593, 37, 'Centre', 'CEN', 0),
(594, 37, 'East (Est)', 'EST', 0),
(595, 37, 'Extreme North (Extreme-Nord)', 'EXN', 0),
(596, 37, 'Littoral', 'LIT', 0),
(597, 37, 'North (Nord)', 'NOR', 0),
(598, 37, 'Northwest (Nord-Ouest)', 'NOT', 0),
(599, 37, 'West (Ouest)', 'OUE', 0),
(600, 37, 'South (Sud)', 'SUD', 0),
(601, 37, 'Southwest (Sud-Ouest).', 'SOU', 0),
(602, 38, 'Alberta', 'AB', 0),
(603, 38, 'British Columbia', 'BC', 0),
(604, 38, 'Manitoba', 'MB', 0),
(605, 38, 'New Brunswick', 'NB', 0),
(606, 38, 'Newfoundland and Labrador', 'NL', 0),
(607, 38, 'Northwest Territories', 'NT', 0),
(608, 38, 'Nova Scotia', 'NS', 0),
(609, 38, 'Nunavut', 'NU', 0),
(610, 38, 'Ontario', 'ON', 0),
(611, 38, 'Prince Edward Island', 'PE', 0),
(612, 38, 'Qu&eacute;bec', 'QC', 0),
(613, 38, 'Saskatchewan', 'SK', 0),
(614, 38, 'Yukon Territory', 'YT', 0),
(615, 39, 'Boa Vista', 'BV', 0),
(616, 39, 'Brava', 'BR', 0),
(617, 39, 'Calheta de Sao Miguel', 'CS', 0),
(618, 39, 'Maio', 'MA', 0),
(619, 39, 'Mosteiros', 'MO', 0),
(620, 39, 'Paul', 'PA', 0),
(621, 39, 'Porto Novo', 'PN', 0),
(622, 39, 'Praia', 'PR', 0),
(623, 39, 'Ribeira Grande', 'RG', 0),
(624, 39, 'Sal', 'SL', 0),
(625, 39, 'Santa Catarina', 'CA', 0),
(626, 39, 'Santa Cruz', 'CR', 0),
(627, 39, 'Sao Domingos', 'SD', 0),
(628, 39, 'Sao Filipe', 'SF', 0),
(629, 39, 'Sao Nicolau', 'SN', 0),
(630, 39, 'Sao Vicente', 'SV', 0),
(631, 39, 'Tarrafal', 'TA', 0),
(632, 40, 'Creek', 'CR', 0),
(633, 40, 'Eastern', 'EA', 0),
(634, 40, 'Midland', 'ML', 0),
(635, 40, 'South Town', 'ST', 0),
(636, 40, 'Spot Bay', 'SP', 0),
(637, 40, 'Stake Bay', 'SK', 0),
(638, 40, 'West End', 'WD', 0),
(639, 40, 'Western', 'WN', 0),
(640, 41, 'Bamingui-Bangoran', 'BBA', 0),
(641, 41, 'Basse-Kotto', 'BKO', 0),
(642, 41, 'Haute-Kotto', 'HKO', 0),
(643, 41, 'Haut-Mbomou', 'HMB', 0),
(644, 41, 'Kemo', 'KEM', 0),
(645, 41, 'Lobaye', 'LOB', 0),
(646, 41, 'Mambere-KadeÔ', 'MKD', 0),
(647, 41, 'Mbomou', 'MBO', 0),
(648, 41, 'Nana-Mambere', 'NMM', 0),
(649, 41, 'Ombella-M\'Poko', 'OMP', 0),
(650, 41, 'Ouaka', 'OUK', 0),
(651, 41, 'Ouham', 'OUH', 0),
(652, 41, 'Ouham-Pende', 'OPE', 0),
(653, 41, 'Vakaga', 'VAK', 0),
(654, 41, 'Nana-Grebizi', 'NGR', 0),
(655, 41, 'Sangha-Mbaere', 'SMB', 0),
(656, 41, 'Bangui', 'BAN', 0),
(657, 42, 'Batha', 'BA', 0),
(658, 42, 'Biltine', 'BI', 0),
(659, 42, 'Borkou-Ennedi-Tibesti', 'BE', 0),
(660, 42, 'Chari-Baguirmi', 'CB', 0),
(661, 42, 'Guera', 'GU', 0),
(662, 42, 'Kanem', 'KA', 0),
(663, 42, 'Lac', 'LA', 0),
(664, 42, 'Logone Occidental', 'LC', 0),
(665, 42, 'Logone Oriental', 'LR', 0),
(666, 42, 'Mayo-Kebbi', 'MK', 0),
(667, 42, 'Moyen-Chari', 'MC', 0),
(668, 42, 'Ouaddai', 'OU', 0),
(669, 42, 'Salamat', 'SA', 0),
(670, 42, 'Tandjile', 'TA', 0),
(671, 43, 'Aisen del General Carlos Ibanez', 'AI', 0),
(672, 43, 'Antofagasta', 'AN', 0),
(673, 43, 'Araucania', 'AR', 0),
(674, 43, 'Atacama', 'AT', 0),
(675, 43, 'Bio-Bio', 'BI', 0),
(676, 43, 'Coquimbo', 'CO', 0),
(677, 43, 'Libertador General Bernardo O\'Higgins', 'LI', 0),
(678, 43, 'Los Lagos', 'LL', 0),
(679, 43, 'Magallanes y de la Antartica Chilena', 'MA', 0),
(680, 43, 'Maule', 'ML', 0),
(681, 43, 'Region Metropolitana', 'RM', 0),
(682, 43, 'Tarapaca', 'TA', 0),
(683, 43, 'Valparaiso', 'VS', 0),
(684, 44, 'Anhui', 'AN', 0),
(685, 44, 'Beijing', 'BE', 0),
(686, 44, 'Chongqing', 'CH', 0),
(687, 44, 'Fujian', 'FU', 0),
(688, 44, 'Gansu', 'GA', 0),
(689, 44, 'Guangdong', 'GU', 0),
(690, 44, 'Guangxi', 'GX', 0),
(691, 44, 'Guizhou', 'GZ', 0),
(692, 44, 'Hainan', 'HA', 0),
(693, 44, 'Hebei', 'HB', 0),
(694, 44, 'Heilongjiang', 'HL', 0),
(695, 44, 'Henan', 'HE', 0),
(696, 44, 'Hong Kong', 'HK', 0),
(697, 44, 'Hubei', 'HU', 0),
(698, 44, 'Hunan', 'HN', 0),
(699, 44, 'Inner Mongolia', 'IM', 0),
(700, 44, 'Jiangsu', 'JI', 0),
(701, 44, 'Jiangxi', 'JX', 0),
(702, 44, 'Jilin', 'JL', 0),
(703, 44, 'Liaoning', 'LI', 0),
(704, 44, 'Macau', 'MA', 0),
(705, 44, 'Ningxia', 'NI', 0),
(706, 44, 'Shaanxi', 'SH', 0),
(707, 44, 'Shandong', 'SA', 0),
(708, 44, 'Shanghai', 'SG', 0),
(709, 44, 'Shanxi', 'SX', 0),
(710, 44, 'Sichuan', 'SI', 0),
(711, 44, 'Tianjin', 'TI', 0),
(712, 44, 'Xinjiang', 'XI', 0),
(713, 44, 'Yunnan', 'YU', 0),
(714, 44, 'Zhejiang', 'ZH', 0),
(715, 46, 'Direction Island', 'D', 0),
(716, 46, 'Home Island', 'H', 0),
(717, 46, 'Horsburgh Island', 'O', 0),
(718, 46, 'South Island', 'S', 0),
(719, 46, 'West Island', 'W', 0),
(720, 47, 'Amazonas', 'AMZ', 0),
(721, 47, 'Antioquia', 'ANT', 0),
(722, 47, 'Arauca', 'ARA', 0),
(723, 47, 'Atlantico', 'ATL', 0),
(724, 47, 'Bogota D.C.', 'BDC', 0),
(725, 47, 'Bolivar', 'BOL', 0),
(726, 47, 'Boyaca', 'BOY', 0),
(727, 47, 'Caldas', 'CAL', 0),
(728, 47, 'Caqueta', 'CAQ', 0),
(729, 47, 'Casanare', 'CAS', 0),
(730, 47, 'Cauca', 'CAU', 0),
(731, 47, 'Cesar', 'CES', 0),
(732, 47, 'Choco', 'CHO', 0),
(733, 47, 'Cordoba', 'COR', 0),
(734, 47, 'Cundinamarca', 'CAM', 0),
(735, 47, 'Guainia', 'GNA', 0),
(736, 47, 'Guajira', 'GJR', 0),
(737, 47, 'Guaviare', 'GVR', 0),
(738, 47, 'Huila', 'HUI', 0),
(739, 47, 'Magdalena', 'MAG', 0),
(740, 47, 'Meta', 'MET', 0),
(741, 47, 'Narino', 'NAR', 0),
(742, 47, 'Norte de Santander', 'NDS', 0),
(743, 47, 'Putumayo', 'PUT', 0),
(744, 47, 'Quindio', 'QUI', 0),
(745, 47, 'Risaralda', 'RIS', 0),
(746, 47, 'San Andres y Providencia', 'SAP', 0),
(747, 47, 'Santander', 'SAN', 0),
(748, 47, 'Sucre', 'SUC', 0),
(749, 47, 'Tolima', 'TOL', 0),
(750, 47, 'Valle del Cauca', 'VDC', 0),
(751, 47, 'Vaupes', 'VAU', 0),
(752, 47, 'Vichada', 'VIC', 0),
(753, 48, 'Grande Comore', 'G', 0),
(754, 48, 'Anjouan', 'A', 0),
(755, 48, 'Moheli', 'M', 0),
(756, 49, 'Bouenza', 'BO', 0),
(757, 49, 'Brazzaville', 'BR', 0),
(758, 49, 'Cuvette', 'CU', 0),
(759, 49, 'Cuvette-Ouest', 'CO', 0),
(760, 49, 'Kouilou', 'KO', 0),
(761, 49, 'Lekoumou', 'LE', 0),
(762, 49, 'Likouala', 'LI', 0),
(763, 49, 'Niari', 'NI', 0),
(764, 49, 'Plateaux', 'PL', 0),
(765, 49, 'Pool', 'PO', 0),
(766, 49, 'Sangha', 'SA', 0),
(767, 50, 'Pukapuka', 'PU', 0),
(768, 50, 'Rakahanga', 'RK', 0),
(769, 50, 'Manihiki', 'MK', 0),
(770, 50, 'Penrhyn', 'PE', 0),
(771, 50, 'Nassau Island', 'NI', 0),
(772, 50, 'Surwarrow', 'SU', 0),
(773, 50, 'Palmerston', 'PA', 0),
(774, 50, 'Aitutaki', 'AI', 0),
(775, 50, 'Manuae', 'MA', 0),
(776, 50, 'Takutea', 'TA', 0),
(777, 50, 'Mitiaro', 'MT', 0),
(778, 50, 'Atiu', 'AT', 0),
(779, 50, 'Mauke', 'MU', 0),
(780, 50, 'Rarotonga', 'RR', 0),
(781, 50, 'Mangaia', 'MG', 0),
(782, 51, 'Alajuela', 'AL', 0),
(783, 51, 'Cartago', 'CA', 0),
(784, 51, 'Guanacaste', 'GU', 0),
(785, 51, 'Heredia', 'HE', 0),
(786, 51, 'Limon', 'LI', 0),
(787, 51, 'Puntarenas', 'PU', 0),
(788, 51, 'San Jose', 'SJ', 0),
(789, 52, 'Abengourou', 'ABE', 0),
(790, 52, 'Abidjan', 'ABI', 0),
(791, 52, 'Aboisso', 'ABO', 0),
(792, 52, 'Adiake', 'ADI', 0),
(793, 52, 'Adzope', 'ADZ', 0),
(794, 52, 'Agboville', 'AGB', 0),
(795, 52, 'Agnibilekrou', 'AGN', 0),
(796, 52, 'Alepe', 'ALE', 0),
(797, 52, 'Bocanda', 'BOC', 0),
(798, 52, 'Bangolo', 'BAN', 0),
(799, 52, 'Beoumi', 'BEO', 0),
(800, 52, 'Biankouma', 'BIA', 0),
(801, 52, 'Bondoukou', 'BDK', 0),
(802, 52, 'Bongouanou', 'BGN', 0),
(803, 52, 'Bouafle', 'BFL', 0),
(804, 52, 'Bouake', 'BKE', 0),
(805, 52, 'Bouna', 'BNA', 0),
(806, 52, 'Boundiali', 'BDL', 0),
(807, 52, 'Dabakala', 'DKL', 0),
(808, 52, 'Dabou', 'DBU', 0),
(809, 52, 'Daloa', 'DAL', 0),
(810, 52, 'Danane', 'DAN', 0),
(811, 52, 'Daoukro', 'DAO', 0),
(812, 52, 'Dimbokro', 'DIM', 0),
(813, 52, 'Divo', 'DIV', 0),
(814, 52, 'Duekoue', 'DUE', 0),
(815, 52, 'Ferkessedougou', 'FER', 0),
(816, 52, 'Gagnoa', 'GAG', 0),
(817, 52, 'Grand-Bassam', 'GBA', 0),
(818, 52, 'Grand-Lahou', 'GLA', 0),
(819, 52, 'Guiglo', 'GUI', 0),
(820, 52, 'Issia', 'ISS', 0),
(821, 52, 'Jacqueville', 'JAC', 0),
(822, 52, 'Katiola', 'KAT', 0),
(823, 52, 'Korhogo', 'KOR', 0),
(824, 52, 'Lakota', 'LAK', 0),
(825, 52, 'Man', 'MAN', 0),
(826, 52, 'Mankono', 'MKN', 0),
(827, 52, 'Mbahiakro', 'MBA', 0),
(828, 52, 'Odienne', 'ODI', 0),
(829, 52, 'Oume', 'OUM', 0),
(830, 52, 'Sakassou', 'SAK', 0),
(831, 52, 'San-Pedro', 'SPE', 0),
(832, 52, 'Sassandra', 'SAS', 0),
(833, 52, 'Seguela', 'SEG', 0),
(834, 52, 'Sinfra', 'SIN', 0),
(835, 52, 'Soubre', 'SOU', 0),
(836, 52, 'Tabou', 'TAB', 0),
(837, 52, 'Tanda', 'TAN', 0),
(838, 52, 'Tiebissou', 'TIE', 0),
(839, 52, 'Tingrela', 'TIN', 0),
(840, 52, 'Tiassale', 'TIA', 0),
(841, 52, 'Touba', 'TBA', 0),
(842, 52, 'Toulepleu', 'TLP', 0),
(843, 52, 'Toumodi', 'TMD', 0),
(844, 52, 'Vavoua', 'VAV', 0),
(845, 52, 'Yamoussoukro', 'YAM', 0),
(846, 52, 'Zuenoula', 'ZUE', 0),
(847, 53, 'Bjelovarsko-bilogorska', 'BB', 0),
(848, 53, 'Grad Zagreb', 'GZ', 0),
(849, 53, 'Dubrovačko-neretvanska', 'DN', 0),
(850, 53, 'Istarska', 'IS', 0),
(851, 53, 'Karlovačka', 'KA', 0),
(852, 53, 'Koprivničko-križevačka', 'KK', 0),
(853, 53, 'Krapinsko-zagorska', 'KZ', 0),
(854, 53, 'Ličko-senjska', 'LS', 0),
(855, 53, 'Međimurska', 'ME', 0),
(856, 53, 'Osječko-baranjska', 'OB', 0),
(857, 53, 'Požeško-slavonska', 'PS', 0),
(858, 53, 'Primorsko-goranska', 'PG', 0),
(859, 53, 'Šibensko-kninska', 'SK', 0),
(860, 53, 'Sisačko-moslavačka', 'SM', 0),
(861, 53, 'Brodsko-posavska', 'BP', 0),
(862, 53, 'Splitsko-dalmatinska', 'SD', 0),
(863, 53, 'Varaždinska', 'VA', 0),
(864, 53, 'Virovitičko-podravska', 'VP', 0),
(865, 53, 'Vukovarsko-srijemska', 'VS', 0),
(866, 53, 'Zadarska', 'ZA', 0),
(867, 53, 'Zagrebačka', 'ZG', 0),
(868, 54, 'Camaguey', 'CA', 0),
(869, 54, 'Ciego de Avila', 'CD', 0),
(870, 54, 'Cienfuegos', 'CI', 0),
(871, 54, 'Ciudad de La Habana', 'CH', 0),
(872, 54, 'Granma', 'GR', 0),
(873, 54, 'Guantanamo', 'GU', 0),
(874, 54, 'Holguin', 'HO', 0),
(875, 54, 'Isla de la Juventud', 'IJ', 0),
(876, 54, 'La Habana', 'LH', 0),
(877, 54, 'Las Tunas', 'LT', 0),
(878, 54, 'Matanzas', 'MA', 0),
(879, 54, 'Pinar del Rio', 'PR', 0),
(880, 54, 'Sancti Spiritus', 'SS', 0),
(881, 54, 'Santiago de Cuba', 'SC', 0),
(882, 54, 'Villa Clara', 'VC', 0),
(883, 55, 'Famagusta', 'F', 0),
(884, 55, 'Kyrenia', 'K', 0),
(885, 55, 'Larnaca', 'A', 0),
(886, 55, 'Limassol', 'I', 0),
(887, 55, 'Nicosia', 'N', 0),
(888, 55, 'Paphos', 'P', 0),
(889, 56, 'Ústecký', 'U', 0),
(890, 56, 'Jihočeský', 'C', 0),
(891, 56, 'Jihomoravský', 'B', 0),
(892, 56, 'Karlovarský', 'K', 0),
(893, 56, 'Královehradecký', 'H', 0),
(894, 56, 'Liberecký', 'L', 0),
(895, 56, 'Moravskoslezský', 'T', 0),
(896, 56, 'Olomoucký', 'M', 0),
(897, 56, 'Pardubický', 'E', 0),
(898, 56, 'Plzeňský', 'P', 0),
(899, 56, 'Praha', 'A', 0),
(900, 56, 'Středočeský', 'S', 0),
(901, 56, 'Vysočina', 'J', 0),
(902, 56, 'Zlínský', 'Z', 0),
(903, 57, 'Arhus', 'AR', 1),
(904, 57, 'Bornholm', 'BH', 1),
(905, 57, 'Copenhagen', 'CO', 1),
(906, 57, 'Faroe Islands', 'FO', 1),
(907, 57, 'Frederiksborg', 'FR', 1),
(908, 57, 'Fyn', 'FY', 1),
(909, 57, 'Kobenhavn', 'KO', 1),
(910, 57, 'Nordjylland', 'NO', 1),
(911, 57, 'Ribe', 'RI', 1),
(912, 57, 'Ringkobing', 'RK', 1),
(913, 57, 'Roskilde', 'RO', 1),
(914, 57, 'Sonderjylland', 'SO', 1),
(915, 57, 'Storstrom', 'ST', 1),
(916, 57, 'Vejle', 'VK', 1),
(917, 57, 'Vestj&aelig;lland', 'VJ', 1),
(918, 57, 'Viborg', 'VB', 1),
(919, 58, '\'Ali Sabih', 'S', 0),
(920, 58, 'Dikhil', 'K', 0),
(921, 58, 'Djibouti', 'J', 0),
(922, 58, 'Obock', 'O', 0),
(923, 58, 'Tadjoura', 'T', 0),
(924, 59, 'Saint Andrew Parish', 'AND', 0),
(925, 59, 'Saint David Parish', 'DAV', 0),
(926, 59, 'Saint George Parish', 'GEO', 0),
(927, 59, 'Saint John Parish', 'JOH', 0),
(928, 59, 'Saint Joseph Parish', 'JOS', 0),
(929, 59, 'Saint Luke Parish', 'LUK', 0),
(930, 59, 'Saint Mark Parish', 'MAR', 0),
(931, 59, 'Saint Patrick Parish', 'PAT', 0),
(932, 59, 'Saint Paul Parish', 'PAU', 0),
(933, 59, 'Saint Peter Parish', 'PET', 0),
(934, 60, 'Distrito Nacional', 'DN', 0),
(935, 60, 'Azua', 'AZ', 0),
(936, 60, 'Baoruco', 'BC', 0),
(937, 60, 'Barahona', 'BH', 0),
(938, 60, 'Dajabon', 'DJ', 0),
(939, 60, 'Duarte', 'DU', 0),
(940, 60, 'Elias Pina', 'EL', 0),
(941, 60, 'El Seybo', 'SY', 0),
(942, 60, 'Espaillat', 'ET', 0),
(943, 60, 'Hato Mayor', 'HM', 0),
(944, 60, 'Independencia', 'IN', 0),
(945, 60, 'La Altagracia', 'AL', 0),
(946, 60, 'La Romana', 'RO', 0),
(947, 60, 'La Vega', 'VE', 0),
(948, 60, 'Maria Trinidad Sanchez', 'MT', 0),
(949, 60, 'Monsenor Nouel', 'MN', 0),
(950, 60, 'Monte Cristi', 'MC', 0),
(951, 60, 'Monte Plata', 'MP', 0),
(952, 60, 'Pedernales', 'PD', 0),
(953, 60, 'Peravia (Bani)', 'PR', 0),
(954, 60, 'Puerto Plata', 'PP', 0),
(955, 60, 'Salcedo', 'SL', 0),
(956, 60, 'Samana', 'SM', 0),
(957, 60, 'Sanchez Ramirez', 'SH', 0),
(958, 60, 'San Cristobal', 'SC', 0),
(959, 60, 'San Jose de Ocoa', 'JO', 0),
(960, 60, 'San Juan', 'SJ', 0),
(961, 60, 'San Pedro de Macoris', 'PM', 0),
(962, 60, 'Santiago', 'SA', 0),
(963, 60, 'Santiago Rodriguez', 'ST', 0),
(964, 60, 'Santo Domingo', 'SD', 0),
(965, 60, 'Valverde', 'VA', 0),
(966, 61, 'Aileu', 'AL', 0),
(967, 61, 'Ainaro', 'AN', 0),
(968, 61, 'Baucau', 'BA', 0),
(969, 61, 'Bobonaro', 'BO', 0),
(970, 61, 'Cova Lima', 'CO', 0),
(971, 61, 'Dili', 'DI', 0),
(972, 61, 'Ermera', 'ER', 0),
(973, 61, 'Lautem', 'LA', 0),
(974, 61, 'Liquica', 'LI', 0),
(975, 61, 'Manatuto', 'MT', 0),
(976, 61, 'Manufahi', 'MF', 0),
(977, 61, 'Oecussi', 'OE', 0),
(978, 61, 'Viqueque', 'VI', 0),
(979, 62, 'Azuay', 'AZU', 0),
(980, 62, 'Bolivar', 'BOL', 0),
(981, 62, 'Ca&ntilde;ar', 'CAN', 0),
(982, 62, 'Carchi', 'CAR', 0),
(983, 62, 'Chimborazo', 'CHI', 0),
(984, 62, 'Cotopaxi', 'COT', 0),
(985, 62, 'El Oro', 'EOR', 0),
(986, 62, 'Esmeraldas', 'ESM', 0),
(987, 62, 'Gal&aacute;pagos', 'GPS', 0),
(988, 62, 'Guayas', 'GUA', 0),
(989, 62, 'Imbabura', 'IMB', 0),
(990, 62, 'Loja', 'LOJ', 0),
(991, 62, 'Los Rios', 'LRO', 0),
(992, 62, 'Manab&iacute;', 'MAN', 0),
(993, 62, 'Morona Santiago', 'MSA', 0),
(994, 62, 'Napo', 'NAP', 0),
(995, 62, 'Orellana', 'ORE', 0),
(996, 62, 'Pastaza', 'PAS', 0),
(997, 62, 'Pichincha', 'PIC', 0),
(998, 62, 'Sucumb&iacute;os', 'SUC', 0),
(999, 62, 'Tungurahua', 'TUN', 0),
(1000, 62, 'Zamora Chinchipe', 'ZCH', 0),
(1001, 63, 'Ad Daqahliyah', 'DHY', 0),
(1002, 63, 'Al Bahr al Ahmar', 'BAM', 0),
(1003, 63, 'Al Buhayrah', 'BHY', 0),
(1004, 63, 'Al Fayyum', 'FYM', 0),
(1005, 63, 'Al Gharbiyah', 'GBY', 0),
(1006, 63, 'Al Iskandariyah', 'IDR', 0),
(1007, 63, 'Al Isma\'iliyah', 'IML', 0),
(1008, 63, 'Al Jizah', 'JZH', 0),
(1009, 63, 'Al Minufiyah', 'MFY', 0),
(1010, 63, 'Al Minya', 'MNY', 0),
(1011, 63, 'Al Qahirah', 'QHR', 0),
(1012, 63, 'Al Qalyubiyah', 'QLY', 0),
(1013, 63, 'Al Wadi al Jadid', 'WJD', 0),
(1014, 63, 'Ash Sharqiyah', 'SHQ', 0),
(1015, 63, 'As Suways', 'SWY', 0),
(1016, 63, 'Aswan', 'ASW', 0),
(1017, 63, 'Asyut', 'ASY', 0),
(1018, 63, 'Bani Suwayf', 'BSW', 0),
(1019, 63, 'Bur Sa\'id', 'BSD', 0),
(1020, 63, 'Dumyat', 'DMY', 0),
(1021, 63, 'Janub Sina\'', 'JNS', 0),
(1022, 63, 'Kafr ash Shaykh', 'KSH', 0),
(1023, 63, 'Matruh', 'MAT', 0),
(1024, 63, 'Qina', 'QIN', 0),
(1025, 63, 'Shamal Sina\'', 'SHS', 0),
(1026, 63, 'Suhaj', 'SUH', 0),
(1027, 64, 'Ahuachapan', 'AH', 0),
(1028, 64, 'Cabanas', 'CA', 0),
(1029, 64, 'Chalatenango', 'CH', 0),
(1030, 64, 'Cuscatlan', 'CU', 0),
(1031, 64, 'La Libertad', 'LB', 0),
(1032, 64, 'La Paz', 'PZ', 0),
(1033, 64, 'La Union', 'UN', 0),
(1034, 64, 'Morazan', 'MO', 0),
(1035, 64, 'San Miguel', 'SM', 0),
(1036, 64, 'San Salvador', 'SS', 0),
(1037, 64, 'San Vicente', 'SV', 0),
(1038, 64, 'Santa Ana', 'SA', 0),
(1039, 64, 'Sonsonate', 'SO', 0),
(1040, 64, 'Usulutan', 'US', 0),
(1041, 65, 'Provincia Annobon', 'AN', 0),
(1042, 65, 'Provincia Bioko Norte', 'BN', 0),
(1043, 65, 'Provincia Bioko Sur', 'BS', 0),
(1044, 65, 'Provincia Centro Sur', 'CS', 0),
(1045, 65, 'Provincia Kie-Ntem', 'KN', 0),
(1046, 65, 'Provincia Litoral', 'LI', 0),
(1047, 65, 'Provincia Wele-Nzas', 'WN', 0),
(1048, 66, 'Central (Maekel)', 'MA', 0),
(1049, 66, 'Anseba (Keren)', 'KE', 0),
(1050, 66, 'Southern Red Sea (Debub-Keih-Bahri)', 'DK', 0),
(1051, 66, 'Northern Red Sea (Semien-Keih-Bahri)', 'SK', 0),
(1052, 66, 'Southern (Debub)', 'DE', 0),
(1053, 66, 'Gash-Barka (Barentu)', 'BR', 0),
(1054, 67, 'Harjumaa (Tallinn)', 'HA', 0),
(1055, 67, 'Hiiumaa (Kardla)', 'HI', 0),
(1056, 67, 'Ida-Virumaa (Johvi)', 'IV', 0),
(1057, 67, 'Jarvamaa (Paide)', 'JA', 0),
(1058, 67, 'Jogevamaa (Jogeva)', 'JO', 0),
(1059, 67, 'Laane-Virumaa (Rakvere)', 'LV', 0),
(1060, 67, 'Laanemaa (Haapsalu)', 'LA', 0),
(1061, 67, 'Parnumaa (Parnu)', 'PA', 0),
(1062, 67, 'Polvamaa (Polva)', 'PO', 0),
(1063, 67, 'Raplamaa (Rapla)', 'RA', 0),
(1064, 67, 'Saaremaa (Kuessaare)', 'SA', 0),
(1065, 67, 'Tartumaa (Tartu)', 'TA', 0),
(1066, 67, 'Valgamaa (Valga)', 'VA', 0),
(1067, 67, 'Viljandimaa (Viljandi)', 'VI', 0),
(1068, 67, 'Vorumaa (Voru)', 'VO', 0),
(1069, 68, 'Afar', 'AF', 0),
(1070, 68, 'Amhara', 'AH', 0),
(1071, 68, 'Benishangul-Gumaz', 'BG', 0),
(1072, 68, 'Gambela', 'GB', 0),
(1073, 68, 'Hariai', 'HR', 0),
(1074, 68, 'Oromia', 'OR', 0),
(1075, 68, 'Somali', 'SM', 0),
(1076, 68, 'Southern Nations - Nationalities and Peoples Region', 'SN', 0),
(1077, 68, 'Tigray', 'TG', 0),
(1078, 68, 'Addis Ababa', 'AA', 0),
(1079, 68, 'Dire Dawa', 'DD', 0),
(1080, 71, 'Central Division', 'C', 0),
(1081, 71, 'Northern Division', 'N', 0),
(1082, 71, 'Eastern Division', 'E', 0),
(1083, 71, 'Western Division', 'W', 0),
(1084, 71, 'Rotuma', 'R', 0),
(1085, 72, 'Ahvenanmaan lääni', 'AL', 0),
(1086, 72, 'Etelä-Suomen lääni', 'ES', 0),
(1087, 72, 'Itä-Suomen lääni', 'IS', 0),
(1088, 72, 'Länsi-Suomen lääni', 'LS', 0),
(1089, 72, 'Lapin lääni', 'LA', 0),
(1090, 72, 'Oulun lääni', 'OU', 0),
(1114, 74, 'Ain', '01', 0),
(1115, 74, 'Aisne', '02', 0),
(1116, 74, 'Allier', '03', 0),
(1117, 74, 'Alpes de Haute Provence', '04', 0),
(1118, 74, 'Hautes-Alpes', '05', 0),
(1119, 74, 'Alpes Maritimes', '06', 0),
(1120, 74, 'Ard&egrave;che', '07', 0),
(1121, 74, 'Ardennes', '08', 0),
(1122, 74, 'Ari&egrave;ge', '09', 0),
(1123, 74, 'Aube', '10', 0),
(1124, 74, 'Aude', '11', 0),
(1125, 74, 'Aveyron', '12', 0),
(1126, 74, 'Bouches du Rh&ocirc;ne', '13', 0),
(1127, 74, 'Calvados', '14', 0),
(1128, 74, 'Cantal', '15', 0),
(1129, 74, 'Charente', '16', 0),
(1130, 74, 'Charente Maritime', '17', 0),
(1131, 74, 'Cher', '18', 0),
(1132, 74, 'Corr&egrave;ze', '19', 0),
(1133, 74, 'Corse du Sud', '2A', 0),
(1134, 74, 'Haute Corse', '2B', 0),
(1135, 74, 'C&ocirc;te d&#039;or', '21', 0),
(1136, 74, 'C&ocirc;tes d&#039;Armor', '22', 0),
(1137, 74, 'Creuse', '23', 0),
(1138, 74, 'Dordogne', '24', 0),
(1139, 74, 'Doubs', '25', 0),
(1140, 74, 'Dr&ocirc;me', '26', 0),
(1141, 74, 'Eure', '27', 0),
(1142, 74, 'Eure et Loir', '28', 0),
(1143, 74, 'Finist&egrave;re', '29', 0),
(1144, 74, 'Gard', '30', 0),
(1145, 74, 'Haute Garonne', '31', 0),
(1146, 74, 'Gers', '32', 0),
(1147, 74, 'Gironde', '33', 0),
(1148, 74, 'H&eacute;rault', '34', 0),
(1149, 74, 'Ille et Vilaine', '35', 0),
(1150, 74, 'Indre', '36', 0),
(1151, 74, 'Indre et Loire', '37', 0),
(1152, 74, 'Is&eacute;re', '38', 0),
(1153, 74, 'Jura', '39', 0),
(1154, 74, 'Landes', '40', 0),
(1155, 74, 'Loir et Cher', '41', 0),
(1156, 74, 'Loire', '42', 0),
(1157, 74, 'Haute Loire', '43', 0),
(1158, 74, 'Loire Atlantique', '44', 0),
(1159, 74, 'Loiret', '45', 0),
(1160, 74, 'Lot', '46', 0),
(1161, 74, 'Lot et Garonne', '47', 0),
(1162, 74, 'Loz&egrave;re', '48', 0),
(1163, 74, 'Maine et Loire', '49', 0),
(1164, 74, 'Manche', '50', 0),
(1165, 74, 'Marne', '51', 0),
(1166, 74, 'Haute Marne', '52', 0),
(1167, 74, 'Mayenne', '53', 0),
(1168, 74, 'Meurthe et Moselle', '54', 0),
(1169, 74, 'Meuse', '55', 0),
(1170, 74, 'Morbihan', '56', 0),
(1171, 74, 'Moselle', '57', 0),
(1172, 74, 'Ni&egrave;vre', '58', 0),
(1173, 74, 'Nord', '59', 0),
(1174, 74, 'Oise', '60', 0),
(1175, 74, 'Orne', '61', 0),
(1176, 74, 'Pas de Calais', '62', 0),
(1177, 74, 'Puy de D&ocirc;me', '63', 0),
(1178, 74, 'Pyr&eacute;n&eacute;es Atlantiques', '64', 0),
(1179, 74, 'Hautes Pyr&eacute;n&eacute;es', '65', 0),
(1180, 74, 'Pyr&eacute;n&eacute;es Orientales', '66', 0),
(1181, 74, 'Bas Rhin', '67', 0),
(1182, 74, 'Haut Rhin', '68', 0),
(1183, 74, 'Rh&ocirc;ne', '69', 0),
(1184, 74, 'Haute Sa&ocirc;ne', '70', 0),
(1185, 74, 'Sa&ocirc;ne et Loire', '71', 0),
(1186, 74, 'Sarthe', '72', 0),
(1187, 74, 'Savoie', '73', 0),
(1188, 74, 'Haute Savoie', '74', 0),
(1189, 74, 'Paris', '75', 0),
(1190, 74, 'Seine Maritime', '76', 0),
(1191, 74, 'Seine et Marne', '77', 0),
(1192, 74, 'Yvelines', '78', 0),
(1193, 74, 'Deux S&egrave;vres', '79', 0),
(1194, 74, 'Somme', '80', 0),
(1195, 74, 'Tarn', '81', 0),
(1196, 74, 'Tarn et Garonne', '82', 0),
(1197, 74, 'Var', '83', 0),
(1198, 74, 'Vaucluse', '84', 0),
(1199, 74, 'Vend&eacute;e', '85', 0),
(1200, 74, 'Vienne', '86', 0),
(1201, 74, 'Haute Vienne', '87', 0),
(1202, 74, 'Vosges', '88', 0),
(1203, 74, 'Yonne', '89', 0),
(1204, 74, 'Territoire de Belfort', '90', 0),
(1205, 74, 'Essonne', '91', 0),
(1206, 74, 'Hauts de Seine', '92', 0),
(1207, 74, 'Seine St-Denis', '93', 0),
(1208, 74, 'Val de Marne', '94', 0),
(1209, 74, 'Val d\'Oise', '95', 0),
(1210, 76, 'Archipel des Marquises', 'M', 0),
(1211, 76, 'Archipel des Tuamotu', 'T', 0),
(1212, 76, 'Archipel des Tubuai', 'I', 0),
(1213, 76, 'Iles du Vent', 'V', 0),
(1214, 76, 'Iles Sous-le-Vent', 'S', 0),
(1215, 77, 'Iles Crozet', 'C', 0),
(1216, 77, 'Iles Kerguelen', 'K', 0),
(1217, 77, 'Ile Amsterdam', 'A', 0),
(1218, 77, 'Ile Saint-Paul', 'P', 0),
(1219, 77, 'Adelie Land', 'D', 0),
(1220, 78, 'Estuaire', 'ES', 0),
(1221, 78, 'Haut-Ogooue', 'HO', 0),
(1222, 78, 'Moyen-Ogooue', 'MO', 0),
(1223, 78, 'Ngounie', 'NG', 0),
(1224, 78, 'Nyanga', 'NY', 0),
(1225, 78, 'Ogooue-Ivindo', 'OI', 0),
(1226, 78, 'Ogooue-Lolo', 'OL', 0),
(1227, 78, 'Ogooue-Maritime', 'OM', 0),
(1228, 78, 'Woleu-Ntem', 'WN', 0),
(1229, 79, 'Banjul', 'BJ', 0),
(1230, 79, 'Basse', 'BS', 0),
(1231, 79, 'Brikama', 'BR', 0),
(1232, 79, 'Janjangbure', 'JA', 0),
(1233, 79, 'Kanifeng', 'KA', 0),
(1234, 79, 'Kerewan', 'KE', 0),
(1235, 79, 'Kuntaur', 'KU', 0),
(1236, 79, 'Mansakonko', 'MA', 0),
(1237, 79, 'Lower River', 'LR', 0),
(1238, 79, 'Central River', 'CR', 0),
(1239, 79, 'North Bank', 'NB', 0),
(1240, 79, 'Upper River', 'UR', 0),
(1241, 79, 'Western', 'WE', 0),
(1242, 80, 'Abkhazia', 'AB', 0),
(1243, 80, 'Ajaria', 'AJ', 0),
(1244, 80, 'Tbilisi', 'TB', 0),
(1245, 80, 'Guria', 'GU', 0),
(1246, 80, 'Imereti', 'IM', 0),
(1247, 80, 'Kakheti', 'KA', 0),
(1248, 80, 'Kvemo Kartli', 'KK', 0),
(1249, 80, 'Mtskheta-Mtianeti', 'MM', 0),
(1250, 80, 'Racha Lechkhumi and Kvemo Svanet', 'RL', 0),
(1251, 80, 'Samegrelo-Zemo Svaneti', 'SZ', 0),
(1252, 80, 'Samtskhe-Javakheti', 'SJ', 0),
(1253, 80, 'Shida Kartli', 'SK', 0),
(1254, 81, 'Baden-Württemberg', 'BAW', 1),
(1255, 81, 'Bayern', 'BAY', 1),
(1256, 81, 'Berlin', 'BER', 1),
(1257, 81, 'Brandenburg', 'BRG', 1),
(1258, 81, 'Bremen', 'BRE', 1),
(1259, 81, 'Hamburg', 'HAM', 1),
(1260, 81, 'Hessen', 'HES', 1),
(1261, 81, 'Mecklenburg-Vorpommern', 'MEC', 1),
(1262, 81, 'Niedersachsen', 'NDS', 1),
(1263, 81, 'Nordrhein-Westfalen', 'NRW', 1),
(1264, 81, 'Rheinland-Pfalz', 'RHE', 1),
(1265, 81, 'Saarland', 'SAR', 1),
(1266, 81, 'Sachsen', 'SAS', 1),
(1267, 81, 'Sachsen-Anhalt', 'SAC', 1),
(1268, 81, 'Schleswig-Holstein', 'SCN', 1),
(1269, 81, 'Thüringen', 'THE', 1),
(1270, 82, 'Ashanti Region', 'AS', 0),
(1271, 82, 'Brong-Ahafo Region', 'BA', 0),
(1272, 82, 'Central Region', 'CE', 0),
(1273, 82, 'Eastern Region', 'EA', 0),
(1274, 82, 'Greater Accra Region', 'GA', 0),
(1275, 82, 'Northern Region', 'NO', 0),
(1276, 82, 'Upper East Region', 'UE', 0),
(1277, 82, 'Upper West Region', 'UW', 0),
(1278, 82, 'Volta Region', 'VO', 0),
(1279, 82, 'Western Region', 'WE', 0),
(1280, 84, 'Attica', 'AT', 0),
(1281, 84, 'Central Greece', 'CN', 0),
(1282, 84, 'Central Macedonia', 'CM', 0),
(1283, 84, 'Crete', 'CR', 0),
(1284, 84, 'East Macedonia and Thrace', 'EM', 0),
(1285, 84, 'Epirus', 'EP', 0),
(1286, 84, 'Ionian Islands', 'II', 0),
(1287, 84, 'North Aegean', 'NA', 0),
(1288, 84, 'Peloponnesos', 'PP', 0),
(1289, 84, 'South Aegean', 'SA', 0),
(1290, 84, 'Thessaly', 'TH', 0),
(1291, 84, 'West Greece', 'WG', 0),
(1292, 84, 'West Macedonia', 'WM', 0),
(1293, 85, 'Avannaa', 'A', 0),
(1294, 85, 'Tunu', 'T', 0),
(1295, 85, 'Kitaa', 'K', 0),
(1296, 86, 'Saint Andrew', 'A', 0),
(1297, 86, 'Saint David', 'D', 0),
(1298, 86, 'Saint George', 'G', 0),
(1299, 86, 'Saint John', 'J', 0),
(1300, 86, 'Saint Mark', 'M', 0),
(1301, 86, 'Saint Patrick', 'P', 0),
(1302, 86, 'Carriacou', 'C', 0),
(1303, 86, 'Petit Martinique', 'Q', 0),
(1304, 89, 'Alta Verapaz', 'AV', 0),
(1305, 89, 'Baja Verapaz', 'BV', 0),
(1306, 89, 'Chimaltenango', 'CM', 0),
(1307, 89, 'Chiquimula', 'CQ', 0),
(1308, 89, 'El Peten', 'PE', 0),
(1309, 89, 'El Progreso', 'PR', 0),
(1310, 89, 'El Quiche', 'QC', 0),
(1311, 89, 'Escuintla', 'ES', 0),
(1312, 89, 'Guatemala', 'GU', 0),
(1313, 89, 'Huehuetenango', 'HU', 0),
(1314, 89, 'Izabal', 'IZ', 0),
(1315, 89, 'Jalapa', 'JA', 0),
(1316, 89, 'Jutiapa', 'JU', 0),
(1317, 89, 'Quetzaltenango', 'QZ', 0),
(1318, 89, 'Retalhuleu', 'RE', 0),
(1319, 89, 'Sacatepequez', 'ST', 0),
(1320, 89, 'San Marcos', 'SM', 0),
(1321, 89, 'Santa Rosa', 'SR', 0),
(1322, 89, 'Solola', 'SO', 0),
(1323, 89, 'Suchitepequez', 'SU', 0),
(1324, 89, 'Totonicapan', 'TO', 0),
(1325, 89, 'Zacapa', 'ZA', 0),
(1326, 90, 'Conakry', 'CNK', 0),
(1327, 90, 'Beyla', 'BYL', 0),
(1328, 90, 'Boffa', 'BFA', 0),
(1329, 90, 'Boke', 'BOK', 0),
(1330, 90, 'Coyah', 'COY', 0),
(1331, 90, 'Dabola', 'DBL', 0),
(1332, 90, 'Dalaba', 'DLB', 0),
(1333, 90, 'Dinguiraye', 'DGR', 0),
(1334, 90, 'Dubreka', 'DBR', 0),
(1335, 90, 'Faranah', 'FRN', 0),
(1336, 90, 'Forecariah', 'FRC', 0),
(1337, 90, 'Fria', 'FRI', 0),
(1338, 90, 'Gaoual', 'GAO', 0),
(1339, 90, 'Gueckedou', 'GCD', 0),
(1340, 90, 'Kankan', 'KNK', 0),
(1341, 90, 'Kerouane', 'KRN', 0),
(1342, 90, 'Kindia', 'KND', 0),
(1343, 90, 'Kissidougou', 'KSD', 0),
(1344, 90, 'Koubia', 'KBA', 0),
(1345, 90, 'Koundara', 'KDA', 0),
(1346, 90, 'Kouroussa', 'KRA', 0),
(1347, 90, 'Labe', 'LAB', 0),
(1348, 90, 'Lelouma', 'LLM', 0),
(1349, 90, 'Lola', 'LOL', 0),
(1350, 90, 'Macenta', 'MCT', 0),
(1351, 90, 'Mali', 'MAL', 0),
(1352, 90, 'Mamou', 'MAM', 0),
(1353, 90, 'Mandiana', 'MAN', 0),
(1354, 90, 'Nzerekore', 'NZR', 0),
(1355, 90, 'Pita', 'PIT', 0),
(1356, 90, 'Siguiri', 'SIG', 0),
(1357, 90, 'Telimele', 'TLM', 0),
(1358, 90, 'Tougue', 'TOG', 0),
(1359, 90, 'Yomou', 'YOM', 0),
(1360, 91, 'Bafata Region', 'BF', 0),
(1361, 91, 'Biombo Region', 'BB', 0),
(1362, 91, 'Bissau Region', 'BS', 0),
(1363, 91, 'Bolama Region', 'BL', 0),
(1364, 91, 'Cacheu Region', 'CA', 0),
(1365, 91, 'Gabu Region', 'GA', 0),
(1366, 91, 'Oio Region', 'OI', 0),
(1367, 91, 'Quinara Region', 'QU', 0),
(1368, 91, 'Tombali Region', 'TO', 0),
(1369, 92, 'Barima-Waini', 'BW', 0),
(1370, 92, 'Cuyuni-Mazaruni', 'CM', 0),
(1371, 92, 'Demerara-Mahaica', 'DM', 0),
(1372, 92, 'East Berbice-Corentyne', 'EC', 0),
(1373, 92, 'Essequibo Islands-West Demerara', 'EW', 0),
(1374, 92, 'Mahaica-Berbice', 'MB', 0),
(1375, 92, 'Pomeroon-Supenaam', 'PM', 0),
(1376, 92, 'Potaro-Siparuni', 'PI', 0),
(1377, 92, 'Upper Demerara-Berbice', 'UD', 0),
(1378, 92, 'Upper Takutu-Upper Essequibo', 'UT', 0),
(1379, 93, 'Artibonite', 'AR', 0),
(1380, 93, 'Centre', 'CE', 0),
(1381, 93, 'Grand\'Anse', 'GA', 0),
(1382, 93, 'Nord', 'ND', 0),
(1383, 93, 'Nord-Est', 'NE', 0),
(1384, 93, 'Nord-Ouest', 'NO', 0),
(1385, 93, 'Ouest', 'OU', 0),
(1386, 93, 'Sud', 'SD', 0),
(1387, 93, 'Sud-Est', 'SE', 0),
(1388, 94, 'Flat Island', 'F', 0),
(1389, 94, 'McDonald Island', 'M', 0),
(1390, 94, 'Shag Island', 'S', 0),
(1391, 94, 'Heard Island', 'H', 0),
(1392, 95, 'Atlantida', 'AT', 0),
(1393, 95, 'Choluteca', 'CH', 0),
(1394, 95, 'Colon', 'CL', 0),
(1395, 95, 'Comayagua', 'CM', 0),
(1396, 95, 'Copan', 'CP', 0),
(1397, 95, 'Cortes', 'CR', 0),
(1398, 95, 'El Paraiso', 'PA', 0),
(1399, 95, 'Francisco Morazan', 'FM', 0),
(1400, 95, 'Gracias a Dios', 'GD', 0),
(1401, 95, 'Intibuca', 'IN', 0),
(1402, 95, 'Islas de la Bahia (Bay Islands)', 'IB', 0),
(1403, 95, 'La Paz', 'PZ', 0),
(1404, 95, 'Lempira', 'LE', 0),
(1405, 95, 'Ocotepeque', 'OC', 0),
(1406, 95, 'Olancho', 'OL', 0),
(1407, 95, 'Santa Barbara', 'SB', 0),
(1408, 95, 'Valle', 'VA', 0),
(1409, 95, 'Yoro', 'YO', 0),
(1410, 96, 'Central and Western Hong Kong Island', 'HCW', 0),
(1411, 96, 'Eastern Hong Kong Island', 'HEA', 0),
(1412, 96, 'Southern Hong Kong Island', 'HSO', 0),
(1413, 96, 'Wan Chai Hong Kong Island', 'HWC', 0),
(1414, 96, 'Kowloon City Kowloon', 'KKC', 0),
(1415, 96, 'Kwun Tong Kowloon', 'KKT', 0),
(1416, 96, 'Sham Shui Po Kowloon', 'KSS', 0),
(1417, 96, 'Wong Tai Sin Kowloon', 'KWT', 0),
(1418, 96, 'Yau Tsim Mong Kowloon', 'KYT', 0),
(1419, 96, 'Islands New Territories', 'NIS', 0),
(1420, 96, 'Kwai Tsing New Territories', 'NKT', 0),
(1421, 96, 'North New Territories', 'NNO', 0),
(1422, 96, 'Sai Kung New Territories', 'NSK', 0),
(1423, 96, 'Sha Tin New Territories', 'NST', 0),
(1424, 96, 'Tai Po New Territories', 'NTP', 0),
(1425, 96, 'Tsuen Wan New Territories', 'NTW', 0),
(1426, 96, 'Tuen Mun New Territories', 'NTM', 0),
(1427, 96, 'Yuen Long New Territories', 'NYL', 0),
(1467, 98, 'Austurland', 'AL', 0),
(1468, 98, 'Hofuoborgarsvaeoi', 'HF', 0),
(1469, 98, 'Norourland eystra', 'NE', 0),
(1470, 98, 'Norourland vestra', 'NV', 0),
(1471, 98, 'Suourland', 'SL', 0),
(1472, 98, 'Suournes', 'SN', 0),
(1473, 98, 'Vestfiroir', 'VF', 0),
(1474, 98, 'Vesturland', 'VL', 0),
(1475, 99, 'Andaman and Nicobar Islands', 'AN', 0),
(1476, 99, 'Andhra Pradesh', 'AP', 0),
(1477, 99, 'Arunachal Pradesh', 'AR', 0),
(1478, 99, 'Assam', 'AS', 0),
(1479, 99, 'Bihar', 'BI', 0),
(1480, 99, 'Chandigarh', 'CH', 0),
(1481, 99, 'Dadra and Nagar Haveli', 'DA', 0),
(1482, 99, 'Daman and Diu', 'DM', 0),
(1483, 99, 'Delhi', 'DE', 0),
(1484, 99, 'Goa', 'GO', 0),
(1485, 99, 'Gujarat', 'GU', 0),
(1486, 99, 'Haryana', 'HA', 0),
(1487, 99, 'Himachal Pradesh', 'HP', 0),
(1488, 99, 'Jammu and Kashmir', 'JA', 0),
(1489, 99, 'Karnataka', 'KA', 0),
(1490, 99, 'Kerala', 'KE', 0),
(1491, 99, 'Lakshadweep Islands', 'LI', 0),
(1492, 99, 'Madhya Pradesh', 'MP', 0),
(1493, 99, 'Maharashtra', 'MA', 0),
(1494, 99, 'Manipur', 'MN', 0),
(1495, 99, 'Meghalaya', 'ME', 0),
(1496, 99, 'Mizoram', 'MI', 0),
(1497, 99, 'Nagaland', 'NA', 0),
(1498, 99, 'Orissa', 'OR', 0),
(1499, 99, 'Puducherry', 'PO', 0),
(1500, 99, 'Punjab', 'PU', 0),
(1501, 99, 'Rajasthan', 'RA', 0),
(1502, 99, 'Sikkim', 'SI', 0),
(1503, 99, 'Tamil Nadu', 'TN', 0),
(1504, 99, 'Tripura', 'TR', 0),
(1505, 99, 'Uttar Pradesh', 'UP', 0),
(1506, 99, 'West Bengal', 'WB', 0),
(1507, 100, 'Aceh', 'AC', 0),
(1508, 100, 'Bali', 'BA', 0),
(1509, 100, 'Banten', 'BT', 0),
(1510, 100, 'Bengkulu', 'BE', 0),
(1511, 100, 'Kalimantan Utara', 'BD', 0),
(1512, 100, 'Gorontalo', 'GO', 0),
(1513, 100, 'Jakarta', 'JK', 0),
(1514, 100, 'Jambi', 'JA', 0),
(1515, 100, 'Jawa Barat', 'JB', 0),
(1516, 100, 'Jawa Tengah', 'JT', 0),
(1517, 100, 'Jawa Timur', 'JI', 0),
(1518, 100, 'Kalimantan Barat', 'KB', 0),
(1519, 100, 'Kalimantan Selatan', 'KS', 0),
(1520, 100, 'Kalimantan Tengah', 'KT', 0),
(1521, 100, 'Kalimantan Timur', 'KI', 0),
(1522, 100, 'Kepulauan Bangka Belitung', 'BB', 0),
(1523, 100, 'Lampung', 'LA', 0),
(1524, 100, 'Maluku', 'MA', 0),
(1525, 100, 'Maluku Utara', 'MU', 0),
(1526, 100, 'Nusa Tenggara Barat', 'NB', 0),
(1527, 100, 'Nusa Tenggara Timur', 'NT', 0),
(1528, 100, 'Papua', 'PA', 0),
(1529, 100, 'Riau', 'RI', 0),
(1530, 100, 'Sulawesi Selatan', 'SN', 0),
(1531, 100, 'Sulawesi Tengah', 'ST', 0),
(1532, 100, 'Sulawesi Tenggara', 'SG', 0),
(1533, 100, 'Sulawesi Utara', 'SA', 0),
(1534, 100, 'Sumatera Barat', 'SB', 0),
(1535, 100, 'Sumatera Selatan', 'SS', 0),
(1536, 100, 'Sumatera Utara', 'SU', 0),
(1537, 100, 'Yogyakarta', 'YO', 0),
(1538, 101, 'Tehran', 'TEH', 0),
(1539, 101, 'Qom', 'QOM', 0),
(1540, 101, 'Markazi', 'MKZ', 0),
(1541, 101, 'Qazvin', 'QAZ', 0),
(1542, 101, 'Gilan', 'GIL', 0),
(1543, 101, 'Ardabil', 'ARD', 0),
(1544, 101, 'Zanjan', 'ZAN', 0),
(1545, 101, 'East Azarbaijan', 'EAZ', 0),
(1546, 101, 'West Azarbaijan', 'WEZ', 0),
(1547, 101, 'Kurdistan', 'KRD', 0),
(1548, 101, 'Hamadan', 'HMD', 0),
(1549, 101, 'Kermanshah', 'KRM', 0),
(1550, 101, 'Ilam', 'ILM', 0),
(1551, 101, 'Lorestan', 'LRS', 0),
(1552, 101, 'Khuzestan', 'KZT', 0),
(1553, 101, 'Chahar Mahaal and Bakhtiari', 'CMB', 0),
(1554, 101, 'Kohkiluyeh and Buyer Ahmad', 'KBA', 0),
(1555, 101, 'Bushehr', 'BSH', 0),
(1556, 101, 'Fars', 'FAR', 0),
(1557, 101, 'Hormozgan', 'HRM', 0),
(1558, 101, 'Sistan and Baluchistan', 'SBL', 0),
(1559, 101, 'Kerman', 'KRB', 0),
(1560, 101, 'Yazd', 'YZD', 0),
(1561, 101, 'Esfahan', 'EFH', 0),
(1562, 101, 'Semnan', 'SMN', 0),
(1563, 101, 'Mazandaran', 'MZD', 0),
(1564, 101, 'Golestan', 'GLS', 0),
(1565, 101, 'North Khorasan', 'NKH', 0),
(1566, 101, 'Razavi Khorasan', 'RKH', 0),
(1567, 101, 'South Khorasan', 'SKH', 0),
(1568, 102, 'Baghdad', 'BD', 0),
(1569, 102, 'Salah ad Din', 'SD', 0),
(1570, 102, 'Diyala', 'DY', 0),
(1571, 102, 'Wasit', 'WS', 0),
(1572, 102, 'Maysan', 'MY', 0),
(1573, 102, 'Al Basrah', 'BA', 0),
(1574, 102, 'Dhi Qar', 'DQ', 0),
(1575, 102, 'Al Muthanna', 'MU', 0),
(1576, 102, 'Al Qadisyah', 'QA', 0),
(1577, 102, 'Babil', 'BB', 0),
(1578, 102, 'Al Karbala', 'KB', 0),
(1579, 102, 'An Najaf', 'NJ', 0),
(1580, 102, 'Al Anbar', 'AB', 0),
(1581, 102, 'Ninawa', 'NN', 0),
(1582, 102, 'Dahuk', 'DH', 0),
(1583, 102, 'Arbil', 'AL', 0),
(1584, 102, 'At Ta\'mim', 'TM', 0),
(1585, 102, 'As Sulaymaniyah', 'SL', 0),
(1586, 103, 'Carlow', 'CA', 1),
(1587, 103, 'Cavan', 'CV', 1),
(1588, 103, 'Clare', 'CL', 1),
(1589, 103, 'Cork', 'CO', 1),
(1590, 103, 'Donegal', 'DO', 1),
(1591, 103, 'Dublin', 'DU', 1),
(1592, 103, 'Galway', 'GA', 1),
(1593, 103, 'Kerry', 'KE', 1),
(1594, 103, 'Kildare', 'KI', 1),
(1595, 103, 'Kilkenny', 'KL', 1),
(1596, 103, 'Laois', 'LA', 1),
(1597, 103, 'Leitrim', 'LE', 1);
INSERT INTO `oc_zone` (`zone_id`, `country_id`, `name`, `code`, `status`) VALUES
(1598, 103, 'Limerick', 'LI', 1),
(1599, 103, 'Longford', 'LO', 1),
(1600, 103, 'Louth', 'LU', 1),
(1601, 103, 'Mayo', 'MA', 1),
(1602, 103, 'Meath', 'ME', 1),
(1603, 103, 'Monaghan', 'MO', 1),
(1604, 103, 'Offaly', 'OF', 1),
(1605, 103, 'Roscommon', 'RO', 1),
(1606, 103, 'Sligo', 'SL', 1),
(1607, 103, 'Tipperary', 'TI', 1),
(1608, 103, 'Waterford', 'WA', 1),
(1609, 103, 'Westmeath', 'WE', 1),
(1610, 103, 'Wexford', 'WX', 1),
(1611, 103, 'Wicklow', 'WI', 1),
(1612, 104, 'Be\'er Sheva', 'BS', 0),
(1613, 104, 'Bika\'at Hayarden', 'BH', 0),
(1614, 104, 'Eilat and Arava', 'EA', 0),
(1615, 104, 'Galil', 'GA', 0),
(1616, 104, 'Haifa', 'HA', 0),
(1617, 104, 'Jehuda Mountains', 'JM', 0),
(1618, 104, 'Jerusalem', 'JE', 0),
(1619, 104, 'Negev', 'NE', 0),
(1620, 104, 'Semaria', 'SE', 0),
(1621, 104, 'Sharon', 'SH', 0),
(1622, 104, 'Tel Aviv (Gosh Dan)', 'TA', 0),
(3860, 105, 'Caltanissetta', 'CL', 0),
(3842, 105, 'Agrigento', 'AG', 0),
(3843, 105, 'Alessandria', 'AL', 0),
(3844, 105, 'Ancona', 'AN', 0),
(3845, 105, 'Aosta', 'AO', 0),
(3846, 105, 'Arezzo', 'AR', 0),
(3847, 105, 'Ascoli Piceno', 'AP', 0),
(3848, 105, 'Asti', 'AT', 0),
(3849, 105, 'Avellino', 'AV', 0),
(3850, 105, 'Bari', 'BA', 0),
(3851, 105, 'Belluno', 'BL', 0),
(3852, 105, 'Benevento', 'BN', 0),
(3853, 105, 'Bergamo', 'BG', 0),
(3854, 105, 'Biella', 'BI', 0),
(3855, 105, 'Bologna', 'BO', 0),
(3856, 105, 'Bolzano', 'BZ', 0),
(3857, 105, 'Brescia', 'BS', 0),
(3858, 105, 'Brindisi', 'BR', 0),
(3859, 105, 'Cagliari', 'CA', 0),
(1643, 106, 'Clarendon Parish', 'CLA', 0),
(1644, 106, 'Hanover Parish', 'HAN', 0),
(1645, 106, 'Kingston Parish', 'KIN', 0),
(1646, 106, 'Manchester Parish', 'MAN', 0),
(1647, 106, 'Portland Parish', 'POR', 0),
(1648, 106, 'Saint Andrew Parish', 'AND', 0),
(1649, 106, 'Saint Ann Parish', 'ANN', 0),
(1650, 106, 'Saint Catherine Parish', 'CAT', 0),
(1651, 106, 'Saint Elizabeth Parish', 'ELI', 0),
(1652, 106, 'Saint James Parish', 'JAM', 0),
(1653, 106, 'Saint Mary Parish', 'MAR', 0),
(1654, 106, 'Saint Thomas Parish', 'THO', 0),
(1655, 106, 'Trelawny Parish', 'TRL', 0),
(1656, 106, 'Westmoreland Parish', 'WML', 0),
(1657, 107, 'Aichi', 'AI', 0),
(1658, 107, 'Akita', 'AK', 0),
(1659, 107, 'Aomori', 'AO', 0),
(1660, 107, 'Chiba', 'CH', 0),
(1661, 107, 'Ehime', 'EH', 0),
(1662, 107, 'Fukui', 'FK', 0),
(1663, 107, 'Fukuoka', 'FU', 0),
(1664, 107, 'Fukushima', 'FS', 0),
(1665, 107, 'Gifu', 'GI', 0),
(1666, 107, 'Gumma', 'GU', 0),
(1667, 107, 'Hiroshima', 'HI', 0),
(1668, 107, 'Hokkaido', 'HO', 0),
(1669, 107, 'Hyogo', 'HY', 0),
(1670, 107, 'Ibaraki', 'IB', 0),
(1671, 107, 'Ishikawa', 'IS', 0),
(1672, 107, 'Iwate', 'IW', 0),
(1673, 107, 'Kagawa', 'KA', 0),
(1674, 107, 'Kagoshima', 'KG', 0),
(1675, 107, 'Kanagawa', 'KN', 0),
(1676, 107, 'Kochi', 'KO', 0),
(1677, 107, 'Kumamoto', 'KU', 0),
(1678, 107, 'Kyoto', 'KY', 0),
(1679, 107, 'Mie', 'MI', 0),
(1680, 107, 'Miyagi', 'MY', 0),
(1681, 107, 'Miyazaki', 'MZ', 0),
(1682, 107, 'Nagano', 'NA', 0),
(1683, 107, 'Nagasaki', 'NG', 0),
(1684, 107, 'Nara', 'NR', 0),
(1685, 107, 'Niigata', 'NI', 0),
(1686, 107, 'Oita', 'OI', 0),
(1687, 107, 'Okayama', 'OK', 0),
(1688, 107, 'Okinawa', 'ON', 0),
(1689, 107, 'Osaka', 'OS', 0),
(1690, 107, 'Saga', 'SA', 0),
(1691, 107, 'Saitama', 'SI', 0),
(1692, 107, 'Shiga', 'SH', 0),
(1693, 107, 'Shimane', 'SM', 0),
(1694, 107, 'Shizuoka', 'SZ', 0),
(1695, 107, 'Tochigi', 'TO', 0),
(1696, 107, 'Tokushima', 'TS', 0),
(1697, 107, 'Tokyo', 'TK', 0),
(1698, 107, 'Tottori', 'TT', 0),
(1699, 107, 'Toyama', 'TY', 0),
(1700, 107, 'Wakayama', 'WA', 0),
(1701, 107, 'Yamagata', 'YA', 0),
(1702, 107, 'Yamaguchi', 'YM', 0),
(1703, 107, 'Yamanashi', 'YN', 0),
(1704, 108, '\'Amman', 'AM', 0),
(1705, 108, 'Ajlun', 'AJ', 0),
(1706, 108, 'Al \'Aqabah', 'AA', 0),
(1707, 108, 'Al Balqa\'', 'AB', 0),
(1708, 108, 'Al Karak', 'AK', 0),
(1709, 108, 'Al Mafraq', 'AL', 0),
(1710, 108, 'At Tafilah', 'AT', 0),
(1711, 108, 'Az Zarqa\'', 'AZ', 0),
(1712, 108, 'Irbid', 'IR', 0),
(1713, 108, 'Jarash', 'JA', 0),
(1714, 108, 'Ma\'an', 'MA', 0),
(1715, 108, 'Madaba', 'MD', 0),
(1716, 109, 'Almaty', 'AL', 0),
(1717, 109, 'Almaty City', 'AC', 0),
(1718, 109, 'Aqmola', 'AM', 0),
(1719, 109, 'Aqtobe', 'AQ', 0),
(1720, 109, 'Astana City', 'AS', 0),
(1721, 109, 'Atyrau', 'AT', 0),
(1722, 109, 'Batys Qazaqstan', 'BA', 0),
(1723, 109, 'Bayqongyr City', 'BY', 0),
(1724, 109, 'Mangghystau', 'MA', 0),
(1725, 109, 'Ongtustik Qazaqstan', 'ON', 0),
(1726, 109, 'Pavlodar', 'PA', 0),
(1727, 109, 'Qaraghandy', 'QA', 0),
(1728, 109, 'Qostanay', 'QO', 0),
(1729, 109, 'Qyzylorda', 'QY', 0),
(1730, 109, 'Shyghys Qazaqstan', 'SH', 0),
(1731, 109, 'Soltustik Qazaqstan', 'SO', 0),
(1732, 109, 'Zhambyl', 'ZH', 0),
(1733, 110, 'Central', 'CE', 0),
(1734, 110, 'Coast', 'CO', 0),
(1735, 110, 'Eastern', 'EA', 0),
(1736, 110, 'Nairobi Area', 'NA', 0),
(1737, 110, 'North Eastern', 'NE', 0),
(1738, 110, 'Nyanza', 'NY', 0),
(1739, 110, 'Rift Valley', 'RV', 0),
(1740, 110, 'Western', 'WE', 0),
(1741, 111, 'Abaiang', 'AG', 0),
(1742, 111, 'Abemama', 'AM', 0),
(1743, 111, 'Aranuka', 'AK', 0),
(1744, 111, 'Arorae', 'AO', 0),
(1745, 111, 'Banaba', 'BA', 0),
(1746, 111, 'Beru', 'BE', 0),
(1747, 111, 'Butaritari', 'bT', 0),
(1748, 111, 'Kanton', 'KA', 0),
(1749, 111, 'Kiritimati', 'KR', 0),
(1750, 111, 'Kuria', 'KU', 0),
(1751, 111, 'Maiana', 'MI', 0),
(1752, 111, 'Makin', 'MN', 0),
(1753, 111, 'Marakei', 'ME', 0),
(1754, 111, 'Nikunau', 'NI', 0),
(1755, 111, 'Nonouti', 'NO', 0),
(1756, 111, 'Onotoa', 'ON', 0),
(1757, 111, 'Tabiteuea', 'TT', 0),
(1758, 111, 'Tabuaeran', 'TR', 0),
(1759, 111, 'Tamana', 'TM', 0),
(1760, 111, 'Tarawa', 'TW', 0),
(1761, 111, 'Teraina', 'TE', 0),
(1762, 112, 'Chagang-do', 'CHA', 0),
(1763, 112, 'Hamgyong-bukto', 'HAB', 0),
(1764, 112, 'Hamgyong-namdo', 'HAN', 0),
(1765, 112, 'Hwanghae-bukto', 'HWB', 0),
(1766, 112, 'Hwanghae-namdo', 'HWN', 0),
(1767, 112, 'Kangwon-do', 'KAN', 0),
(1768, 112, 'P\'yongan-bukto', 'PYB', 0),
(1769, 112, 'P\'yongan-namdo', 'PYN', 0),
(1770, 112, 'Ryanggang-do (Yanggang-do)', 'YAN', 0),
(1771, 112, 'Rason Directly Governed City', 'NAJ', 0),
(1772, 112, 'P\'yongyang Special City', 'PYO', 0),
(1773, 113, 'Ch\'ungch\'ong-bukto', 'CO', 0),
(1774, 113, 'Ch\'ungch\'ong-namdo', 'CH', 0),
(1775, 113, 'Cheju-do', 'CD', 0),
(1776, 113, 'Cholla-bukto', 'CB', 0),
(1777, 113, 'Cholla-namdo', 'CN', 0),
(1778, 113, 'Inch\'on-gwangyoksi', 'IG', 0),
(1779, 113, 'Kangwon-do', 'KA', 0),
(1780, 113, 'Kwangju-gwangyoksi', 'KG', 0),
(1781, 113, 'Kyonggi-do', 'KD', 0),
(1782, 113, 'Kyongsang-bukto', 'KB', 0),
(1783, 113, 'Kyongsang-namdo', 'KN', 0),
(1784, 113, 'Pusan-gwangyoksi', 'PG', 0),
(1785, 113, 'Soul-t\'ukpyolsi', 'SO', 0),
(1786, 113, 'Taegu-gwangyoksi', 'TA', 0),
(1787, 113, 'Taejon-gwangyoksi', 'TG', 0),
(1788, 114, 'Al \'Asimah', 'AL', 0),
(1789, 114, 'Al Ahmadi', 'AA', 0),
(1790, 114, 'Al Farwaniyah', 'AF', 0),
(1791, 114, 'Al Jahra\'', 'AJ', 0),
(1792, 114, 'Hawalli', 'HA', 0),
(1793, 115, 'Bishkek', 'GB', 0),
(1794, 115, 'Batken', 'B', 0),
(1795, 115, 'Chu', 'C', 0),
(1796, 115, 'Jalal-Abad', 'J', 0),
(1797, 115, 'Naryn', 'N', 0),
(1798, 115, 'Osh', 'O', 0),
(1799, 115, 'Talas', 'T', 0),
(1800, 115, 'Ysyk-Kol', 'Y', 0),
(1801, 116, 'Vientiane', 'VT', 0),
(1802, 116, 'Attapu', 'AT', 0),
(1803, 116, 'Bokeo', 'BK', 0),
(1804, 116, 'Bolikhamxai', 'BL', 0),
(1805, 116, 'Champasak', 'CH', 0),
(1806, 116, 'Houaphan', 'HO', 0),
(1807, 116, 'Khammouan', 'KH', 0),
(1808, 116, 'Louang Namtha', 'LM', 0),
(1809, 116, 'Louangphabang', 'LP', 0),
(1810, 116, 'Oudomxai', 'OU', 0),
(1811, 116, 'Phongsali', 'PH', 0),
(1812, 116, 'Salavan', 'SL', 0),
(1813, 116, 'Savannakhet', 'SV', 0),
(1814, 116, 'Vientiane', 'VI', 0),
(1815, 116, 'Xaignabouli', 'XA', 0),
(1816, 116, 'Xekong', 'XE', 0),
(1817, 116, 'Xiangkhoang', 'XI', 0),
(1818, 116, 'Xaisomboun', 'XN', 0),
(1852, 119, 'Berea', 'BE', 0),
(1853, 119, 'Butha-Buthe', 'BB', 0),
(1854, 119, 'Leribe', 'LE', 0),
(1855, 119, 'Mafeteng', 'MF', 0),
(1856, 119, 'Maseru', 'MS', 0),
(1857, 119, 'Mohale\'s Hoek', 'MH', 0),
(1858, 119, 'Mokhotlong', 'MK', 0),
(1859, 119, 'Qacha\'s Nek', 'QN', 0),
(1860, 119, 'Quthing', 'QT', 0),
(1861, 119, 'Thaba-Tseka', 'TT', 0),
(1862, 120, 'Bomi', 'BI', 0),
(1863, 120, 'Bong', 'BG', 0),
(1864, 120, 'Grand Bassa', 'GB', 0),
(1865, 120, 'Grand Cape Mount', 'CM', 0),
(1866, 120, 'Grand Gedeh', 'GG', 0),
(1867, 120, 'Grand Kru', 'GK', 0),
(1868, 120, 'Lofa', 'LO', 0),
(1869, 120, 'Margibi', 'MG', 0),
(1870, 120, 'Maryland', 'ML', 0),
(1871, 120, 'Montserrado', 'MS', 0),
(1872, 120, 'Nimba', 'NB', 0),
(1873, 120, 'River Cess', 'RC', 0),
(1874, 120, 'Sinoe', 'SN', 0),
(1875, 121, 'Ajdabiya', 'AJ', 0),
(1876, 121, 'Al \'Aziziyah', 'AZ', 0),
(1877, 121, 'Al Fatih', 'FA', 0),
(1878, 121, 'Al Jabal al Akhdar', 'JA', 0),
(1879, 121, 'Al Jufrah', 'JU', 0),
(1880, 121, 'Al Khums', 'KH', 0),
(1881, 121, 'Al Kufrah', 'KU', 0),
(1882, 121, 'An Nuqat al Khams', 'NK', 0),
(1883, 121, 'Ash Shati\'', 'AS', 0),
(1884, 121, 'Awbari', 'AW', 0),
(1885, 121, 'Az Zawiyah', 'ZA', 0),
(1886, 121, 'Banghazi', 'BA', 0),
(1887, 121, 'Darnah', 'DA', 0),
(1888, 121, 'Ghadamis', 'GD', 0),
(1889, 121, 'Gharyan', 'GY', 0),
(1890, 121, 'Misratah', 'MI', 0),
(1891, 121, 'Murzuq', 'MZ', 0),
(1892, 121, 'Sabha', 'SB', 0),
(1893, 121, 'Sawfajjin', 'SW', 0),
(1894, 121, 'Surt', 'SU', 0),
(1895, 121, 'Tarabulus (Tripoli)', 'TL', 0),
(1896, 121, 'Tarhunah', 'TH', 0),
(1897, 121, 'Tubruq', 'TU', 0),
(1898, 121, 'Yafran', 'YA', 0),
(1899, 121, 'Zlitan', 'ZL', 0),
(1900, 122, 'Vaduz', 'V', 0),
(1901, 122, 'Schaan', 'A', 0),
(1902, 122, 'Balzers', 'B', 0),
(1903, 122, 'Triesen', 'N', 0),
(1904, 122, 'Eschen', 'E', 0),
(1905, 122, 'Mauren', 'M', 0),
(1906, 122, 'Triesenberg', 'T', 0),
(1907, 122, 'Ruggell', 'R', 0),
(1908, 122, 'Gamprin', 'G', 0),
(1909, 122, 'Schellenberg', 'L', 0),
(1910, 122, 'Planken', 'P', 0),
(1911, 123, 'Alytus', 'AL', 0),
(1912, 123, 'Kaunas', 'KA', 0),
(1913, 123, 'Klaipeda', 'KL', 0),
(1914, 123, 'Marijampole', 'MA', 0),
(1915, 123, 'Panevezys', 'PA', 0),
(1916, 123, 'Siauliai', 'SI', 0),
(1917, 123, 'Taurage', 'TA', 0),
(1918, 123, 'Telsiai', 'TE', 0),
(1919, 123, 'Utena', 'UT', 0),
(1920, 123, 'Vilnius', 'VI', 0),
(1921, 124, 'Diekirch', 'DD', 0),
(1922, 124, 'Clervaux', 'DC', 0),
(1923, 124, 'Redange', 'DR', 0),
(1924, 124, 'Vianden', 'DV', 0),
(1925, 124, 'Wiltz', 'DW', 0),
(1926, 124, 'Grevenmacher', 'GG', 0),
(1927, 124, 'Echternach', 'GE', 0),
(1928, 124, 'Remich', 'GR', 0),
(1929, 124, 'Luxembourg', 'LL', 0),
(1930, 124, 'Capellen', 'LC', 0),
(1931, 124, 'Esch-sur-Alzette', 'LE', 0),
(1932, 124, 'Mersch', 'LM', 0),
(1933, 125, 'Our Lady Fatima Parish', 'OLF', 0),
(1934, 125, 'St. Anthony Parish', 'ANT', 0),
(1935, 125, 'St. Lazarus Parish', 'LAZ', 0),
(1936, 125, 'Cathedral Parish', 'CAT', 0),
(1937, 125, 'St. Lawrence Parish', 'LAW', 0),
(1938, 127, 'Antananarivo', 'AN', 0),
(1939, 127, 'Antsiranana', 'AS', 0),
(1940, 127, 'Fianarantsoa', 'FN', 0),
(1941, 127, 'Mahajanga', 'MJ', 0),
(1942, 127, 'Toamasina', 'TM', 0),
(1943, 127, 'Toliara', 'TL', 0),
(1944, 128, 'Balaka', 'BLK', 0),
(1945, 128, 'Blantyre', 'BLT', 0),
(1946, 128, 'Chikwawa', 'CKW', 0),
(1947, 128, 'Chiradzulu', 'CRD', 0),
(1948, 128, 'Chitipa', 'CTP', 0),
(1949, 128, 'Dedza', 'DDZ', 0),
(1950, 128, 'Dowa', 'DWA', 0),
(1951, 128, 'Karonga', 'KRG', 0),
(1952, 128, 'Kasungu', 'KSG', 0),
(1953, 128, 'Likoma', 'LKM', 0),
(1954, 128, 'Lilongwe', 'LLG', 0),
(1955, 128, 'Machinga', 'MCG', 0),
(1956, 128, 'Mangochi', 'MGC', 0),
(1957, 128, 'Mchinji', 'MCH', 0),
(1958, 128, 'Mulanje', 'MLJ', 0),
(1959, 128, 'Mwanza', 'MWZ', 0),
(1960, 128, 'Mzimba', 'MZM', 0),
(1961, 128, 'Ntcheu', 'NTU', 0),
(1962, 128, 'Nkhata Bay', 'NKB', 0),
(1963, 128, 'Nkhotakota', 'NKH', 0),
(1964, 128, 'Nsanje', 'NSJ', 0),
(1965, 128, 'Ntchisi', 'NTI', 0),
(1966, 128, 'Phalombe', 'PHL', 0),
(1967, 128, 'Rumphi', 'RMP', 0),
(1968, 128, 'Salima', 'SLM', 0),
(1969, 128, 'Thyolo', 'THY', 0),
(1970, 128, 'Zomba', 'ZBA', 0),
(1971, 129, 'Johor', 'MY-01', 0),
(1972, 129, 'Kedah', 'MY-02', 0),
(1973, 129, 'Kelantan', 'MY-03', 0),
(1974, 129, 'Labuan', 'MY-15', 0),
(1975, 129, 'Melaka', 'MY-04', 0),
(1976, 129, 'Negeri Sembilan', 'MY-05', 0),
(1977, 129, 'Pahang', 'MY-06', 0),
(1978, 129, 'Perak', 'MY-08', 0),
(1979, 129, 'Perlis', 'MY-09', 0),
(1980, 129, 'Pulau Pinang', 'MY-07', 0),
(1981, 129, 'Sabah', 'MY-12', 0),
(1982, 129, 'Sarawak', 'MY-13', 0),
(1983, 129, 'Selangor', 'MY-10', 0),
(1984, 129, 'Terengganu', 'MY-11', 0),
(1985, 129, 'Kuala Lumpur', 'MY-14', 0),
(4035, 129, 'Putrajaya', 'MY-16', 0),
(1986, 130, 'Thiladhunmathi Uthuru', 'THU', 0),
(1987, 130, 'Thiladhunmathi Dhekunu', 'THD', 0),
(1988, 130, 'Miladhunmadulu Uthuru', 'MLU', 0),
(1989, 130, 'Miladhunmadulu Dhekunu', 'MLD', 0),
(1990, 130, 'Maalhosmadulu Uthuru', 'MAU', 0),
(1991, 130, 'Maalhosmadulu Dhekunu', 'MAD', 0),
(1992, 130, 'Faadhippolhu', 'FAA', 0),
(1993, 130, 'Male Atoll', 'MAA', 0),
(1994, 130, 'Ari Atoll Uthuru', 'AAU', 0),
(1995, 130, 'Ari Atoll Dheknu', 'AAD', 0),
(1996, 130, 'Felidhe Atoll', 'FEA', 0),
(1997, 130, 'Mulaku Atoll', 'MUA', 0),
(1998, 130, 'Nilandhe Atoll Uthuru', 'NAU', 0),
(1999, 130, 'Nilandhe Atoll Dhekunu', 'NAD', 0),
(2000, 130, 'Kolhumadulu', 'KLH', 0),
(2001, 130, 'Hadhdhunmathi', 'HDH', 0),
(2002, 130, 'Huvadhu Atoll Uthuru', 'HAU', 0),
(2003, 130, 'Huvadhu Atoll Dhekunu', 'HAD', 0),
(2004, 130, 'Fua Mulaku', 'FMU', 0),
(2005, 130, 'Addu', 'ADD', 0),
(2006, 131, 'Gao', 'GA', 0),
(2007, 131, 'Kayes', 'KY', 0),
(2008, 131, 'Kidal', 'KD', 0),
(2009, 131, 'Koulikoro', 'KL', 0),
(2010, 131, 'Mopti', 'MP', 0),
(2011, 131, 'Segou', 'SG', 0),
(2012, 131, 'Sikasso', 'SK', 0),
(2013, 131, 'Tombouctou', 'TB', 0),
(2014, 131, 'Bamako Capital District', 'CD', 0),
(2015, 132, 'Attard', 'ATT', 0),
(2016, 132, 'Balzan', 'BAL', 0),
(2017, 132, 'Birgu', 'BGU', 0),
(2018, 132, 'Birkirkara', 'BKK', 0),
(2019, 132, 'Birzebbuga', 'BRZ', 0),
(2020, 132, 'Bormla', 'BOR', 0),
(2021, 132, 'Dingli', 'DIN', 0),
(2022, 132, 'Fgura', 'FGU', 0),
(2023, 132, 'Floriana', 'FLO', 0),
(2024, 132, 'Gudja', 'GDJ', 0),
(2025, 132, 'Gzira', 'GZR', 0),
(2026, 132, 'Gargur', 'GRG', 0),
(2027, 132, 'Gaxaq', 'GXQ', 0),
(2028, 132, 'Hamrun', 'HMR', 0),
(2029, 132, 'Iklin', 'IKL', 0),
(2030, 132, 'Isla', 'ISL', 0),
(2031, 132, 'Kalkara', 'KLK', 0),
(2032, 132, 'Kirkop', 'KRK', 0),
(2033, 132, 'Lija', 'LIJ', 0),
(2034, 132, 'Luqa', 'LUQ', 0),
(2035, 132, 'Marsa', 'MRS', 0),
(2036, 132, 'Marsaskala', 'MKL', 0),
(2037, 132, 'Marsaxlokk', 'MXL', 0),
(2038, 132, 'Mdina', 'MDN', 0),
(2039, 132, 'Melliea', 'MEL', 0),
(2040, 132, 'Mgarr', 'MGR', 0),
(2041, 132, 'Mosta', 'MST', 0),
(2042, 132, 'Mqabba', 'MQA', 0),
(2043, 132, 'Msida', 'MSI', 0),
(2044, 132, 'Mtarfa', 'MTF', 0),
(2045, 132, 'Naxxar', 'NAX', 0),
(2046, 132, 'Paola', 'PAO', 0),
(2047, 132, 'Pembroke', 'PEM', 0),
(2048, 132, 'Pieta', 'PIE', 0),
(2049, 132, 'Qormi', 'QOR', 0),
(2050, 132, 'Qrendi', 'QRE', 0),
(2051, 132, 'Rabat', 'RAB', 0),
(2052, 132, 'Safi', 'SAF', 0),
(2053, 132, 'San Giljan', 'SGI', 0),
(2054, 132, 'Santa Lucija', 'SLU', 0),
(2055, 132, 'San Pawl il-Bahar', 'SPB', 0),
(2056, 132, 'San Gwann', 'SGW', 0),
(2057, 132, 'Santa Venera', 'SVE', 0),
(2058, 132, 'Siggiewi', 'SIG', 0),
(2059, 132, 'Sliema', 'SLM', 0),
(2060, 132, 'Swieqi', 'SWQ', 0),
(2061, 132, 'Ta Xbiex', 'TXB', 0),
(2062, 132, 'Tarxien', 'TRX', 0),
(2063, 132, 'Valletta', 'VLT', 0),
(2064, 132, 'Xgajra', 'XGJ', 0),
(2065, 132, 'Zabbar', 'ZBR', 0),
(2066, 132, 'Zebbug', 'ZBG', 0),
(2067, 132, 'Zejtun', 'ZJT', 0),
(2068, 132, 'Zurrieq', 'ZRQ', 0),
(2069, 132, 'Fontana', 'FNT', 0),
(2070, 132, 'Ghajnsielem', 'GHJ', 0),
(2071, 132, 'Gharb', 'GHR', 0),
(2072, 132, 'Ghasri', 'GHS', 0),
(2073, 132, 'Kercem', 'KRC', 0),
(2074, 132, 'Munxar', 'MUN', 0),
(2075, 132, 'Nadur', 'NAD', 0),
(2076, 132, 'Qala', 'QAL', 0),
(2077, 132, 'Victoria', 'VIC', 0),
(2078, 132, 'San Lawrenz', 'SLA', 0),
(2079, 132, 'Sannat', 'SNT', 0),
(2080, 132, 'Xagra', 'ZAG', 0),
(2081, 132, 'Xewkija', 'XEW', 0),
(2082, 132, 'Zebbug', 'ZEB', 0),
(2083, 133, 'Ailinginae', 'ALG', 0),
(2084, 133, 'Ailinglaplap', 'ALL', 0),
(2085, 133, 'Ailuk', 'ALK', 0),
(2086, 133, 'Arno', 'ARN', 0),
(2087, 133, 'Aur', 'AUR', 0),
(2088, 133, 'Bikar', 'BKR', 0),
(2089, 133, 'Bikini', 'BKN', 0),
(2090, 133, 'Bokak', 'BKK', 0),
(2091, 133, 'Ebon', 'EBN', 0),
(2092, 133, 'Enewetak', 'ENT', 0),
(2093, 133, 'Erikub', 'EKB', 0),
(2094, 133, 'Jabat', 'JBT', 0),
(2095, 133, 'Jaluit', 'JLT', 0),
(2096, 133, 'Jemo', 'JEM', 0),
(2097, 133, 'Kili', 'KIL', 0),
(2098, 133, 'Kwajalein', 'KWJ', 0),
(2099, 133, 'Lae', 'LAE', 0),
(2100, 133, 'Lib', 'LIB', 0),
(2101, 133, 'Likiep', 'LKP', 0),
(2102, 133, 'Majuro', 'MJR', 0),
(2103, 133, 'Maloelap', 'MLP', 0),
(2104, 133, 'Mejit', 'MJT', 0),
(2105, 133, 'Mili', 'MIL', 0),
(2106, 133, 'Namorik', 'NMK', 0),
(2107, 133, 'Namu', 'NAM', 0),
(2108, 133, 'Rongelap', 'RGL', 0),
(2109, 133, 'Rongrik', 'RGK', 0),
(2110, 133, 'Toke', 'TOK', 0),
(2111, 133, 'Ujae', 'UJA', 0),
(2112, 133, 'Ujelang', 'UJL', 0),
(2113, 133, 'Utirik', 'UTK', 0),
(2114, 133, 'Wotho', 'WTH', 0),
(2115, 133, 'Wotje', 'WTJ', 0),
(2116, 135, 'Adrar', 'AD', 0),
(2117, 135, 'Assaba', 'AS', 0),
(2118, 135, 'Brakna', 'BR', 0),
(2119, 135, 'Dakhlet Nouadhibou', 'DN', 0),
(2120, 135, 'Gorgol', 'GO', 0),
(2121, 135, 'Guidimaka', 'GM', 0),
(2122, 135, 'Hodh Ech Chargui', 'HC', 0),
(2123, 135, 'Hodh El Gharbi', 'HG', 0),
(2124, 135, 'Inchiri', 'IN', 0),
(2125, 135, 'Tagant', 'TA', 0),
(2126, 135, 'Tiris Zemmour', 'TZ', 0),
(2127, 135, 'Trarza', 'TR', 0),
(2128, 135, 'Nouakchott', 'NO', 0),
(2129, 136, 'Beau Bassin-Rose Hill', 'BR', 0),
(2130, 136, 'Curepipe', 'CU', 0),
(2131, 136, 'Port Louis', 'PU', 0),
(2132, 136, 'Quatre Bornes', 'QB', 0),
(2133, 136, 'Vacoas-Phoenix', 'VP', 0),
(2134, 136, 'Agalega Islands', 'AG', 0),
(2135, 136, 'Cargados Carajos Shoals (Saint Brandon Islands)', 'CC', 0),
(2136, 136, 'Rodrigues', 'RO', 0),
(2137, 136, 'Black River', 'BL', 0),
(2138, 136, 'Flacq', 'FL', 0),
(2139, 136, 'Grand Port', 'GP', 0),
(2140, 136, 'Moka', 'MO', 0),
(2141, 136, 'Pamplemousses', 'PA', 0),
(2142, 136, 'Plaines Wilhems', 'PW', 0),
(2143, 136, 'Port Louis', 'PL', 0),
(2144, 136, 'Riviere du Rempart', 'RR', 0),
(2145, 136, 'Savanne', 'SA', 0),
(2146, 138, 'Baja California Norte', 'BN', 0),
(2147, 138, 'Baja California Sur', 'BS', 0),
(2148, 138, 'Campeche', 'CA', 0),
(2149, 138, 'Chiapas', 'CI', 0),
(2150, 138, 'Chihuahua', 'CH', 0),
(2151, 138, 'Coahuila de Zaragoza', 'CZ', 0),
(2152, 138, 'Colima', 'CL', 0),
(2153, 138, 'Distrito Federal', 'DF', 0),
(2154, 138, 'Durango', 'DU', 0),
(2155, 138, 'Guanajuato', 'GA', 0),
(2156, 138, 'Guerrero', 'GE', 0),
(2157, 138, 'Hidalgo', 'HI', 0),
(2158, 138, 'Jalisco', 'JA', 0),
(2159, 138, 'Mexico', 'ME', 0),
(2160, 138, 'Michoacan de Ocampo', 'MI', 0),
(2161, 138, 'Morelos', 'MO', 0),
(2162, 138, 'Nayarit', 'NA', 0),
(2163, 138, 'Nuevo Leon', 'NL', 0),
(2164, 138, 'Oaxaca', 'OA', 0),
(2165, 138, 'Puebla', 'PU', 0),
(2166, 138, 'Queretaro de Arteaga', 'QA', 0),
(2167, 138, 'Quintana Roo', 'QR', 0),
(2168, 138, 'San Luis Potosi', 'SA', 0),
(2169, 138, 'Sinaloa', 'SI', 0),
(2170, 138, 'Sonora', 'SO', 0),
(2171, 138, 'Tabasco', 'TB', 0),
(2172, 138, 'Tamaulipas', 'TM', 0),
(2173, 138, 'Tlaxcala', 'TL', 0),
(2174, 138, 'Veracruz-Llave', 'VE', 0),
(2175, 138, 'Yucatan', 'YU', 0),
(2176, 138, 'Zacatecas', 'ZA', 0),
(2177, 139, 'Chuuk', 'C', 0),
(2178, 139, 'Kosrae', 'K', 0),
(2179, 139, 'Pohnpei', 'P', 0),
(2180, 139, 'Yap', 'Y', 0),
(2181, 140, 'Gagauzia', 'GA', 0),
(2182, 140, 'Chisinau', 'CU', 0),
(2183, 140, 'Balti', 'BA', 0),
(2184, 140, 'Cahul', 'CA', 0),
(2185, 140, 'Edinet', 'ED', 0),
(2186, 140, 'Lapusna', 'LA', 0),
(2187, 140, 'Orhei', 'OR', 0),
(2188, 140, 'Soroca', 'SO', 0),
(2189, 140, 'Tighina', 'TI', 0),
(2190, 140, 'Ungheni', 'UN', 0),
(2191, 140, 'St‚nga Nistrului', 'SN', 0),
(2192, 141, 'Fontvieille', 'FV', 0),
(2193, 141, 'La Condamine', 'LC', 0),
(2194, 141, 'Monaco-Ville', 'MV', 0),
(2195, 141, 'Monte-Carlo', 'MC', 0),
(2196, 142, 'Ulanbaatar', '1', 0),
(2197, 142, 'Orhon', '035', 0),
(2198, 142, 'Darhan uul', '037', 0),
(2199, 142, 'Hentiy', '039', 0),
(2200, 142, 'Hovsgol', '041', 0),
(2201, 142, 'Hovd', '043', 0),
(2202, 142, 'Uvs', '046', 0),
(2203, 142, 'Tov', '047', 0),
(2204, 142, 'Selenge', '049', 0),
(2205, 142, 'Suhbaatar', '051', 0),
(2206, 142, 'Omnogovi', '053', 0),
(2207, 142, 'Ovorhangay', '055', 0),
(2208, 142, 'Dzavhan', '057', 0),
(2209, 142, 'DundgovL', '059', 0),
(2210, 142, 'Dornod', '061', 0),
(2211, 142, 'Dornogov', '063', 0),
(2212, 142, 'Govi-Sumber', '064', 0),
(2213, 142, 'Govi-Altay', '065', 0),
(2214, 142, 'Bulgan', '067', 0),
(2215, 142, 'Bayanhongor', '069', 0),
(2216, 142, 'Bayan-Olgiy', '071', 0),
(2217, 142, 'Arhangay', '073', 0),
(2218, 143, 'Saint Anthony', 'A', 0),
(2219, 143, 'Saint Georges', 'G', 0),
(2220, 143, 'Saint Peter', 'P', 0),
(2221, 144, 'Agadir', 'AGD', 0),
(2222, 144, 'Al Hoceima', 'HOC', 0),
(2223, 144, 'Azilal', 'AZI', 0),
(2224, 144, 'Beni Mellal', 'BME', 0),
(2225, 144, 'Ben Slimane', 'BSL', 0),
(2226, 144, 'Boulemane', 'BLM', 0),
(2227, 144, 'Casablanca', 'CBL', 0),
(2228, 144, 'Chaouen', 'CHA', 0),
(2229, 144, 'El Jadida', 'EJA', 0),
(2230, 144, 'El Kelaa des Sraghna', 'EKS', 0),
(2231, 144, 'Er Rachidia', 'ERA', 0),
(2232, 144, 'Essaouira', 'ESS', 0),
(2233, 144, 'Fes', 'FES', 0),
(2234, 144, 'Figuig', 'FIG', 0),
(2235, 144, 'Guelmim', 'GLM', 0),
(2236, 144, 'Ifrane', 'IFR', 0),
(2237, 144, 'Kenitra', 'KEN', 0),
(2238, 144, 'Khemisset', 'KHM', 0),
(2239, 144, 'Khenifra', 'KHN', 0),
(2240, 144, 'Khouribga', 'KHO', 0),
(2241, 144, 'Laayoune', 'LYN', 0),
(2242, 144, 'Larache', 'LAR', 0),
(2243, 144, 'Marrakech', 'MRK', 0),
(2244, 144, 'Meknes', 'MKN', 0),
(2245, 144, 'Nador', 'NAD', 0),
(2246, 144, 'Ouarzazate', 'ORZ', 0),
(2247, 144, 'Oujda', 'OUJ', 0),
(2248, 144, 'Rabat-Sale', 'RSA', 0),
(2249, 144, 'Safi', 'SAF', 0),
(2250, 144, 'Settat', 'SET', 0),
(2251, 144, 'Sidi Kacem', 'SKA', 0),
(2252, 144, 'Tangier', 'TGR', 0),
(2253, 144, 'Tan-Tan', 'TAN', 0),
(2254, 144, 'Taounate', 'TAO', 0),
(2255, 144, 'Taroudannt', 'TRD', 0),
(2256, 144, 'Tata', 'TAT', 0),
(2257, 144, 'Taza', 'TAZ', 0),
(2258, 144, 'Tetouan', 'TET', 0),
(2259, 144, 'Tiznit', 'TIZ', 0),
(2260, 144, 'Ad Dakhla', 'ADK', 0),
(2261, 144, 'Boujdour', 'BJD', 0),
(2262, 144, 'Es Smara', 'ESM', 0),
(2263, 145, 'Cabo Delgado', 'CD', 0),
(2264, 145, 'Gaza', 'GZ', 0),
(2265, 145, 'Inhambane', 'IN', 0),
(2266, 145, 'Manica', 'MN', 0),
(2267, 145, 'Maputo (city)', 'MC', 0),
(2268, 145, 'Maputo', 'MP', 0),
(2269, 145, 'Nampula', 'NA', 0),
(2270, 145, 'Niassa', 'NI', 0),
(2271, 145, 'Sofala', 'SO', 0),
(2272, 145, 'Tete', 'TE', 0),
(2273, 145, 'Zambezia', 'ZA', 0),
(2274, 146, 'Ayeyarwady', 'AY', 0),
(2275, 146, 'Bago', 'BG', 0),
(2276, 146, 'Magway', 'MG', 0),
(2277, 146, 'Mandalay', 'MD', 0),
(2278, 146, 'Sagaing', 'SG', 0),
(2279, 146, 'Tanintharyi', 'TN', 0),
(2280, 146, 'Yangon', 'YG', 0),
(2281, 146, 'Chin State', 'CH', 0),
(2282, 146, 'Kachin State', 'KC', 0),
(2283, 146, 'Kayah State', 'KH', 0),
(2284, 146, 'Kayin State', 'KN', 0),
(2285, 146, 'Mon State', 'MN', 0),
(2286, 146, 'Rakhine State', 'RK', 0),
(2287, 146, 'Shan State', 'SH', 0),
(2288, 147, 'Caprivi', 'CA', 0),
(2289, 147, 'Erongo', 'ER', 0),
(2290, 147, 'Hardap', 'HA', 0),
(2291, 147, 'Karas', 'KR', 0),
(2292, 147, 'Kavango', 'KV', 0),
(2293, 147, 'Khomas', 'KH', 0),
(2294, 147, 'Kunene', 'KU', 0),
(2295, 147, 'Ohangwena', 'OW', 0),
(2296, 147, 'Omaheke', 'OK', 0),
(2297, 147, 'Omusati', 'OT', 0),
(2298, 147, 'Oshana', 'ON', 0),
(2299, 147, 'Oshikoto', 'OO', 0),
(2300, 147, 'Otjozondjupa', 'OJ', 0),
(2301, 148, 'Aiwo', 'AO', 0),
(2302, 148, 'Anabar', 'AA', 0),
(2303, 148, 'Anetan', 'AT', 0),
(2304, 148, 'Anibare', 'AI', 0),
(2305, 148, 'Baiti', 'BA', 0),
(2306, 148, 'Boe', 'BO', 0),
(2307, 148, 'Buada', 'BU', 0),
(2308, 148, 'Denigomodu', 'DE', 0),
(2309, 148, 'Ewa', 'EW', 0),
(2310, 148, 'Ijuw', 'IJ', 0),
(2311, 148, 'Meneng', 'ME', 0),
(2312, 148, 'Nibok', 'NI', 0),
(2313, 148, 'Uaboe', 'UA', 0),
(2314, 148, 'Yaren', 'YA', 0),
(2315, 149, 'Bagmati', 'BA', 0),
(2316, 149, 'Bheri', 'BH', 0),
(2317, 149, 'Dhawalagiri', 'DH', 0),
(2318, 149, 'Gandaki', 'GA', 0),
(2319, 149, 'Janakpur', 'JA', 0),
(2320, 149, 'Karnali', 'KA', 0),
(2321, 149, 'Kosi', 'KO', 0),
(2322, 149, 'Lumbini', 'LU', 0),
(2323, 149, 'Mahakali', 'MA', 0),
(2324, 149, 'Mechi', 'ME', 0),
(2325, 149, 'Narayani', 'NA', 0),
(2326, 149, 'Rapti', 'RA', 0),
(2327, 149, 'Sagarmatha', 'SA', 0),
(2328, 149, 'Seti', 'SE', 0),
(2329, 150, 'Drenthe', 'DR', 0),
(2330, 150, 'Flevoland', 'FL', 0),
(2331, 150, 'Friesland', 'FR', 0),
(2332, 150, 'Gelderland', 'GE', 0),
(2333, 150, 'Groningen', 'GR', 0),
(2334, 150, 'Limburg', 'LI', 0),
(2335, 150, 'Noord-Brabant', 'NB', 0),
(2336, 150, 'Noord-Holland', 'NH', 0),
(2337, 150, 'Overijssel', 'OV', 0),
(2338, 150, 'Utrecht', 'UT', 0),
(2339, 150, 'Zeeland', 'ZE', 0),
(2340, 150, 'Zuid-Holland', 'ZH', 0),
(2341, 152, 'Iles Loyaute', 'L', 0),
(2342, 152, 'Nord', 'N', 0),
(2343, 152, 'Sud', 'S', 0),
(2344, 153, 'Auckland', 'AUK', 0),
(2345, 153, 'Bay of Plenty', 'BOP', 0),
(2346, 153, 'Canterbury', 'CAN', 0),
(2347, 153, 'Coromandel', 'COR', 0),
(2348, 153, 'Gisborne', 'GIS', 0),
(2349, 153, 'Fiordland', 'FIO', 0),
(2350, 153, 'Hawke\'s Bay', 'HKB', 0),
(2351, 153, 'Marlborough', 'MBH', 0),
(2352, 153, 'Manawatu-Wanganui', 'MWT', 0),
(2353, 153, 'Mt Cook-Mackenzie', 'MCM', 0),
(2354, 153, 'Nelson', 'NSN', 0),
(2355, 153, 'Northland', 'NTL', 0),
(2356, 153, 'Otago', 'OTA', 0),
(2357, 153, 'Southland', 'STL', 0),
(2358, 153, 'Taranaki', 'TKI', 0),
(2359, 153, 'Wellington', 'WGN', 0),
(2360, 153, 'Waikato', 'WKO', 0),
(2361, 153, 'Wairarapa', 'WAI', 0),
(2362, 153, 'West Coast', 'WTC', 0),
(2363, 154, 'Atlantico Norte', 'AN', 0),
(2364, 154, 'Atlantico Sur', 'AS', 0),
(2365, 154, 'Boaco', 'BO', 0),
(2366, 154, 'Carazo', 'CA', 0),
(2367, 154, 'Chinandega', 'CI', 0),
(2368, 154, 'Chontales', 'CO', 0),
(2369, 154, 'Esteli', 'ES', 0),
(2370, 154, 'Granada', 'GR', 0),
(2371, 154, 'Jinotega', 'JI', 0),
(2372, 154, 'Leon', 'LE', 0),
(2373, 154, 'Madriz', 'MD', 0),
(2374, 154, 'Managua', 'MN', 0),
(2375, 154, 'Masaya', 'MS', 0),
(2376, 154, 'Matagalpa', 'MT', 0),
(2377, 154, 'Nuevo Segovia', 'NS', 0),
(2378, 154, 'Rio San Juan', 'RS', 0),
(2379, 154, 'Rivas', 'RI', 0),
(2380, 155, 'Agadez', 'AG', 0),
(2381, 155, 'Diffa', 'DF', 0),
(2382, 155, 'Dosso', 'DS', 0),
(2383, 155, 'Maradi', 'MA', 0),
(2384, 155, 'Niamey', 'NM', 0),
(2385, 155, 'Tahoua', 'TH', 0),
(2386, 155, 'Tillaberi', 'TL', 0),
(2387, 155, 'Zinder', 'ZD', 0),
(2388, 156, 'Abia', 'AB', 0),
(2389, 156, 'Abuja Federal Capital Territory', 'CT', 0),
(2390, 156, 'Adamawa', 'AD', 0),
(2391, 156, 'Akwa Ibom', 'AK', 0),
(2392, 156, 'Anambra', 'AN', 0),
(2393, 156, 'Bauchi', 'BC', 0),
(2394, 156, 'Bayelsa', 'BY', 0),
(2395, 156, 'Benue', 'BN', 0),
(2396, 156, 'Borno', 'BO', 0),
(2397, 156, 'Cross River', 'CR', 0),
(2398, 156, 'Delta', 'DE', 0),
(2399, 156, 'Ebonyi', 'EB', 0),
(2400, 156, 'Edo', 'ED', 0),
(2401, 156, 'Ekiti', 'EK', 0),
(2402, 156, 'Enugu', 'EN', 0),
(2403, 156, 'Gombe', 'GO', 0),
(2404, 156, 'Imo', 'IM', 0),
(2405, 156, 'Jigawa', 'JI', 0),
(2406, 156, 'Kaduna', 'KD', 0),
(2407, 156, 'Kano', 'KN', 0),
(2408, 156, 'Katsina', 'KT', 0),
(2409, 156, 'Kebbi', 'KE', 0),
(2410, 156, 'Kogi', 'KO', 0),
(2411, 156, 'Kwara', 'KW', 0),
(2412, 156, 'Lagos', 'LA', 0),
(2413, 156, 'Nassarawa', 'NA', 0),
(2414, 156, 'Niger', 'NI', 0),
(2415, 156, 'Ogun', 'OG', 0),
(2416, 156, 'Ondo', 'ONG', 0),
(2417, 156, 'Osun', 'OS', 0),
(2418, 156, 'Oyo', 'OY', 0),
(2419, 156, 'Plateau', 'PL', 0),
(2420, 156, 'Rivers', 'RI', 0),
(2421, 156, 'Sokoto', 'SO', 0),
(2422, 156, 'Taraba', 'TA', 0),
(2423, 156, 'Yobe', 'YO', 0),
(2424, 156, 'Zamfara', 'ZA', 0),
(2425, 159, 'Northern Islands', 'N', 0),
(2426, 159, 'Rota', 'R', 0),
(2427, 159, 'Saipan', 'S', 0),
(2428, 159, 'Tinian', 'T', 0),
(2429, 160, 'Akershus', 'AK', 1),
(2430, 160, 'Aust-Agder', 'AA', 1),
(2431, 160, 'Buskerud', 'BU', 1),
(2432, 160, 'Finnmark', 'FM', 1),
(2433, 160, 'Hedmark', 'HM', 1),
(2434, 160, 'Hordaland', 'HL', 1),
(2435, 160, 'More og Romdal', 'MR', 1),
(2436, 160, 'Nord-Trondelag', 'NT', 1),
(2437, 160, 'Nordland', 'NL', 1),
(2438, 160, 'Ostfold', 'OF', 1),
(2439, 160, 'Oppland', 'OP', 1),
(2440, 160, 'Oslo', 'OL', 1),
(2441, 160, 'Rogaland', 'RL', 1),
(2442, 160, 'Sor-Trondelag', 'ST', 1),
(2443, 160, 'Sogn og Fjordane', 'SJ', 1),
(2444, 160, 'Svalbard', 'SV', 1),
(2445, 160, 'Telemark', 'TM', 1),
(2446, 160, 'Troms', 'TR', 1),
(2447, 160, 'Vest-Agder', 'VA', 1),
(2448, 160, 'Vestfold', 'VF', 1),
(2449, 161, 'Ad Dakhiliyah', 'DA', 0),
(2450, 161, 'Al Batinah', 'BA', 0),
(2451, 161, 'Al Wusta', 'WU', 0),
(2452, 161, 'Ash Sharqiyah', 'SH', 0),
(2453, 161, 'Az Zahirah', 'ZA', 0),
(2454, 161, 'Masqat', 'MA', 0),
(2455, 161, 'Musandam', 'MU', 0),
(2456, 161, 'Zufar', 'ZU', 0),
(2457, 162, 'Balochistan', 'B', 0),
(2458, 162, 'Federally Administered Tribal Areas', 'T', 0),
(2459, 162, 'Islamabad Capital Territory', 'I', 0),
(2460, 162, 'North-West Frontier', 'N', 0),
(2461, 162, 'Punjab', 'P', 0),
(2462, 162, 'Sindh', 'S', 0),
(2463, 163, 'Aimeliik', 'AM', 0),
(2464, 163, 'Airai', 'AR', 0),
(2465, 163, 'Angaur', 'AN', 0),
(2466, 163, 'Hatohobei', 'HA', 0),
(2467, 163, 'Kayangel', 'KA', 0),
(2468, 163, 'Koror', 'KO', 0),
(2469, 163, 'Melekeok', 'ME', 0),
(2470, 163, 'Ngaraard', 'NA', 0),
(2471, 163, 'Ngarchelong', 'NG', 0),
(2472, 163, 'Ngardmau', 'ND', 0),
(2473, 163, 'Ngatpang', 'NT', 0),
(2474, 163, 'Ngchesar', 'NC', 0),
(2475, 163, 'Ngeremlengui', 'NR', 0),
(2476, 163, 'Ngiwal', 'NW', 0),
(2477, 163, 'Peleliu', 'PE', 0),
(2478, 163, 'Sonsorol', 'SO', 0),
(2479, 164, 'Bocas del Toro', 'BT', 0),
(2480, 164, 'Chiriqui', 'CH', 0),
(2481, 164, 'Cocle', 'CC', 0),
(2482, 164, 'Colon', 'CL', 0),
(2483, 164, 'Darien', 'DA', 0),
(2484, 164, 'Herrera', 'HE', 0),
(2485, 164, 'Los Santos', 'LS', 0),
(2486, 164, 'Panama', 'PA', 0),
(2487, 164, 'San Blas', 'SB', 0),
(2488, 164, 'Veraguas', 'VG', 0),
(2489, 165, 'Bougainville', 'BV', 0),
(2490, 165, 'Central', 'CE', 0),
(2491, 165, 'Chimbu', 'CH', 0),
(2492, 165, 'Eastern Highlands', 'EH', 0),
(2493, 165, 'East New Britain', 'EB', 0),
(2494, 165, 'East Sepik', 'ES', 0),
(2495, 165, 'Enga', 'EN', 0),
(2496, 165, 'Gulf', 'GU', 0),
(2497, 165, 'Madang', 'MD', 0),
(2498, 165, 'Manus', 'MN', 0),
(2499, 165, 'Milne Bay', 'MB', 0),
(2500, 165, 'Morobe', 'MR', 0),
(2501, 165, 'National Capital', 'NC', 0),
(2502, 165, 'New Ireland', 'NI', 0),
(2503, 165, 'Northern', 'NO', 0),
(2504, 165, 'Sandaun', 'SA', 0),
(2505, 165, 'Southern Highlands', 'SH', 0),
(2506, 165, 'Western', 'WE', 0),
(2507, 165, 'Western Highlands', 'WH', 0),
(2508, 165, 'West New Britain', 'WB', 0),
(2509, 166, 'Alto Paraguay', 'AG', 0),
(2510, 166, 'Alto Parana', 'AN', 0),
(2511, 166, 'Amambay', 'AM', 0),
(2512, 166, 'Asuncion', 'AS', 0),
(2513, 166, 'Boqueron', 'BO', 0),
(2514, 166, 'Caaguazu', 'CG', 0),
(2515, 166, 'Caazapa', 'CZ', 0),
(2516, 166, 'Canindeyu', 'CN', 0),
(2517, 166, 'Central', 'CE', 0),
(2518, 166, 'Concepcion', 'CC', 0),
(2519, 166, 'Cordillera', 'CD', 0),
(2520, 166, 'Guaira', 'GU', 0),
(2521, 166, 'Itapua', 'IT', 0),
(2522, 166, 'Misiones', 'MI', 0),
(2523, 166, 'Neembucu', 'NE', 0),
(2524, 166, 'Paraguari', 'PA', 0),
(2525, 166, 'Presidente Hayes', 'PH', 0),
(2526, 166, 'San Pedro', 'SP', 0),
(2527, 167, 'Amazonas', 'AM', 0),
(2528, 167, 'Ancash', 'AN', 0),
(2529, 167, 'Apurimac', 'AP', 0),
(2530, 167, 'Arequipa', 'AR', 0),
(2531, 167, 'Ayacucho', 'AY', 0),
(2532, 167, 'Cajamarca', 'CJ', 0),
(2533, 167, 'Callao', 'CL', 0),
(2534, 167, 'Cusco', 'CU', 0),
(2535, 167, 'Huancavelica', 'HV', 0),
(2536, 167, 'Huanuco', 'HO', 0),
(2537, 167, 'Ica', 'IC', 0),
(2538, 167, 'Junin', 'JU', 0),
(2539, 167, 'La Libertad', 'LD', 0),
(2540, 167, 'Lambayeque', 'LY', 0),
(2541, 167, 'Lima', 'LI', 0),
(2542, 167, 'Loreto', 'LO', 0),
(2543, 167, 'Madre de Dios', 'MD', 0),
(2544, 167, 'Moquegua', 'MO', 0),
(2545, 167, 'Pasco', 'PA', 0),
(2546, 167, 'Piura', 'PI', 0),
(2547, 167, 'Puno', 'PU', 0),
(2548, 167, 'San Martin', 'SM', 0),
(2549, 167, 'Tacna', 'TA', 0),
(2550, 167, 'Tumbes', 'TU', 0),
(2551, 167, 'Ucayali', 'UC', 0),
(2552, 168, 'Abra', 'ABR', 0),
(2553, 168, 'Agusan del Norte', 'ANO', 0),
(2554, 168, 'Agusan del Sur', 'ASU', 0),
(2555, 168, 'Aklan', 'AKL', 0),
(2556, 168, 'Albay', 'ALB', 0),
(2557, 168, 'Antique', 'ANT', 0),
(2558, 168, 'Apayao', 'APY', 0),
(2559, 168, 'Aurora', 'AUR', 0),
(2560, 168, 'Basilan', 'BAS', 0),
(2561, 168, 'Bataan', 'BTA', 0),
(2562, 168, 'Batanes', 'BTE', 0),
(2563, 168, 'Batangas', 'BTG', 0),
(2564, 168, 'Biliran', 'BLR', 0),
(2565, 168, 'Benguet', 'BEN', 0),
(2566, 168, 'Bohol', 'BOL', 0),
(2567, 168, 'Bukidnon', 'BUK', 0),
(2568, 168, 'Bulacan', 'BUL', 0),
(2569, 168, 'Cagayan', 'CAG', 0),
(2570, 168, 'Camarines Norte', 'CNO', 0),
(2571, 168, 'Camarines Sur', 'CSU', 0),
(2572, 168, 'Camiguin', 'CAM', 0),
(2573, 168, 'Capiz', 'CAP', 0),
(2574, 168, 'Catanduanes', 'CAT', 0),
(2575, 168, 'Cavite', 'CAV', 0),
(2576, 168, 'Cebu', 'CEB', 0),
(2577, 168, 'Compostela', 'CMP', 0),
(2578, 168, 'Davao del Norte', 'DNO', 0),
(2579, 168, 'Davao del Sur', 'DSU', 0),
(2580, 168, 'Davao Oriental', 'DOR', 0),
(2581, 168, 'Eastern Samar', 'ESA', 0),
(2582, 168, 'Guimaras', 'GUI', 0),
(2583, 168, 'Ifugao', 'IFU', 0),
(2584, 168, 'Ilocos Norte', 'INO', 0),
(2585, 168, 'Ilocos Sur', 'ISU', 0),
(2586, 168, 'Iloilo', 'ILO', 0),
(2587, 168, 'Isabela', 'ISA', 0),
(2588, 168, 'Kalinga', 'KAL', 0),
(2589, 168, 'Laguna', 'LAG', 0),
(2590, 168, 'Lanao del Norte', 'LNO', 0),
(2591, 168, 'Lanao del Sur', 'LSU', 0),
(2592, 168, 'La Union', 'UNI', 0),
(2593, 168, 'Leyte', 'LEY', 0),
(2594, 168, 'Maguindanao', 'MAG', 0),
(2595, 168, 'Marinduque', 'MRN', 0),
(2596, 168, 'Masbate', 'MSB', 0),
(2597, 168, 'Mindoro Occidental', 'MIC', 0),
(2598, 168, 'Mindoro Oriental', 'MIR', 0),
(2599, 168, 'Misamis Occidental', 'MSC', 0),
(2600, 168, 'Misamis Oriental', 'MOR', 0),
(2601, 168, 'Mountain', 'MOP', 0),
(2602, 168, 'Negros Occidental', 'NOC', 0),
(2603, 168, 'Negros Oriental', 'NOR', 0),
(2604, 168, 'North Cotabato', 'NCT', 0),
(2605, 168, 'Northern Samar', 'NSM', 0),
(2606, 168, 'Nueva Ecija', 'NEC', 0),
(2607, 168, 'Nueva Vizcaya', 'NVZ', 0),
(2608, 168, 'Palawan', 'PLW', 0),
(2609, 168, 'Pampanga', 'PMP', 0),
(2610, 168, 'Pangasinan', 'PNG', 0),
(2611, 168, 'Quezon', 'QZN', 0),
(2612, 168, 'Quirino', 'QRN', 0),
(2613, 168, 'Rizal', 'RIZ', 0),
(2614, 168, 'Romblon', 'ROM', 0),
(2615, 168, 'Samar', 'SMR', 0),
(2616, 168, 'Sarangani', 'SRG', 0),
(2617, 168, 'Siquijor', 'SQJ', 0),
(2618, 168, 'Sorsogon', 'SRS', 0),
(2619, 168, 'South Cotabato', 'SCO', 0),
(2620, 168, 'Southern Leyte', 'SLE', 0),
(2621, 168, 'Sultan Kudarat', 'SKU', 0),
(2622, 168, 'Sulu', 'SLU', 0),
(2623, 168, 'Surigao del Norte', 'SNO', 0),
(2624, 168, 'Surigao del Sur', 'SSU', 0),
(2625, 168, 'Tarlac', 'TAR', 0),
(2626, 168, 'Tawi-Tawi', 'TAW', 0),
(2627, 168, 'Zambales', 'ZBL', 0),
(2628, 168, 'Zamboanga del Norte', 'ZNO', 0),
(2629, 168, 'Zamboanga del Sur', 'ZSU', 0),
(2630, 168, 'Zamboanga Sibugay', 'ZSI', 0),
(2631, 170, 'Dolnoslaskie', 'DO', 0),
(2632, 170, 'Kujawsko-Pomorskie', 'KP', 0),
(2633, 170, 'Lodzkie', 'LO', 0),
(2634, 170, 'Lubelskie', 'LL', 0),
(2635, 170, 'Lubuskie', 'LU', 0),
(2636, 170, 'Malopolskie', 'ML', 0),
(2637, 170, 'Mazowieckie', 'MZ', 0),
(2638, 170, 'Opolskie', 'OP', 0),
(2639, 170, 'Podkarpackie', 'PP', 0),
(2640, 170, 'Podlaskie', 'PL', 0),
(2641, 170, 'Pomorskie', 'PM', 0),
(2642, 170, 'Slaskie', 'SL', 0),
(2643, 170, 'Swietokrzyskie', 'SW', 0),
(2644, 170, 'Warminsko-Mazurskie', 'WM', 0),
(2645, 170, 'Wielkopolskie', 'WP', 0),
(2646, 170, 'Zachodniopomorskie', 'ZA', 0),
(2647, 198, 'Saint Pierre', 'P', 0),
(2648, 198, 'Miquelon', 'M', 0),
(2649, 171, 'A&ccedil;ores', 'AC', 0),
(2650, 171, 'Aveiro', 'AV', 0),
(2651, 171, 'Beja', 'BE', 0),
(2652, 171, 'Braga', 'BR', 0),
(2653, 171, 'Bragan&ccedil;a', 'BA', 0),
(2654, 171, 'Castelo Branco', 'CB', 0),
(2655, 171, 'Coimbra', 'CO', 0),
(2656, 171, '&Eacute;vora', 'EV', 0),
(2657, 171, 'Faro', 'FA', 0),
(2658, 171, 'Guarda', 'GU', 0),
(2659, 171, 'Leiria', 'LE', 0),
(2660, 171, 'Lisboa', 'LI', 0),
(2661, 171, 'Madeira', 'ME', 0),
(2662, 171, 'Portalegre', 'PO', 0),
(2663, 171, 'Porto', 'PR', 0),
(2664, 171, 'Santar&eacute;m', 'SA', 0),
(2665, 171, 'Set&uacute;bal', 'SE', 0),
(2666, 171, 'Viana do Castelo', 'VC', 0),
(2667, 171, 'Vila Real', 'VR', 0),
(2668, 171, 'Viseu', 'VI', 0),
(2669, 173, 'Ad Dawhah', 'DW', 0),
(2670, 173, 'Al Ghuwayriyah', 'GW', 0),
(2671, 173, 'Al Jumayliyah', 'JM', 0),
(2672, 173, 'Al Khawr', 'KR', 0),
(2673, 173, 'Al Wakrah', 'WK', 0),
(2674, 173, 'Ar Rayyan', 'RN', 0),
(2675, 173, 'Jarayan al Batinah', 'JB', 0),
(2676, 173, 'Madinat ash Shamal', 'MS', 0),
(2677, 173, 'Umm Sa\'id', 'UD', 0),
(2678, 173, 'Umm Salal', 'UL', 0),
(2679, 175, 'Alba', 'AB', 0),
(2680, 175, 'Arad', 'AR', 0),
(2681, 175, 'Arges', 'AG', 0),
(2682, 175, 'Bacau', 'BC', 0),
(2683, 175, 'Bihor', 'BH', 0),
(2684, 175, 'Bistrita-Nasaud', 'BN', 0),
(2685, 175, 'Botosani', 'BT', 0),
(2686, 175, 'Brasov', 'BV', 0),
(2687, 175, 'Braila', 'BR', 0),
(2688, 175, 'Bucuresti', 'B', 0),
(2689, 175, 'Buzau', 'BZ', 0),
(2690, 175, 'Caras-Severin', 'CS', 0),
(2691, 175, 'Calarasi', 'CL', 0),
(2692, 175, 'Cluj', 'CJ', 0),
(2693, 175, 'Constanta', 'CT', 0),
(2694, 175, 'Covasna', 'CV', 0),
(2695, 175, 'Dimbovita', 'DB', 0),
(2696, 175, 'Dolj', 'DJ', 0),
(2697, 175, 'Galati', 'GL', 0),
(2698, 175, 'Giurgiu', 'GR', 0),
(2699, 175, 'Gorj', 'GJ', 0),
(2700, 175, 'Harghita', 'HR', 0),
(2701, 175, 'Hunedoara', 'HD', 0),
(2702, 175, 'Ialomita', 'IL', 0),
(2703, 175, 'Iasi', 'IS', 0),
(2704, 175, 'Ilfov', 'IF', 0),
(2705, 175, 'Maramures', 'MM', 0),
(2706, 175, 'Mehedinti', 'MH', 0),
(2707, 175, 'Mures', 'MS', 0),
(2708, 175, 'Neamt', 'NT', 0),
(2709, 175, 'Olt', 'OT', 0),
(2710, 175, 'Prahova', 'PH', 0),
(2711, 175, 'Satu-Mare', 'SM', 0),
(2712, 175, 'Salaj', 'SJ', 0),
(2713, 175, 'Sibiu', 'SB', 0),
(2714, 175, 'Suceava', 'SV', 0),
(2715, 175, 'Teleorman', 'TR', 0),
(2716, 175, 'Timis', 'TM', 0),
(2717, 175, 'Tulcea', 'TL', 0),
(2718, 175, 'Vaslui', 'VS', 0),
(2719, 175, 'Valcea', 'VL', 0),
(2720, 175, 'Vrancea', 'VN', 0),
(2721, 176, 'Abakan', 'AB', 0),
(2722, 176, 'Aginskoye', 'AG', 0),
(2723, 176, 'Anadyr', 'AN', 0),
(2724, 176, 'Arkahangelsk', 'AR', 0),
(2725, 176, 'Astrakhan', 'AS', 0),
(2726, 176, 'Barnaul', 'BA', 0),
(2727, 176, 'Belgorod', 'BE', 0),
(2728, 176, 'Birobidzhan', 'BI', 0),
(2729, 176, 'Blagoveshchensk', 'BL', 0),
(2730, 176, 'Bryansk', 'BR', 0),
(2731, 176, 'Cheboksary', 'CH', 0),
(2732, 176, 'Chelyabinsk', 'CL', 0),
(2733, 176, 'Cherkessk', 'CR', 0),
(2734, 176, 'Chita', 'CI', 0),
(2735, 176, 'Dudinka', 'DU', 0),
(2736, 176, 'Elista', 'EL', 0),
(2738, 176, 'Gorno-Altaysk', 'GA', 0),
(2739, 176, 'Groznyy', 'GR', 0),
(2740, 176, 'Irkutsk', 'IR', 0),
(2741, 176, 'Ivanovo', 'IV', 0),
(2742, 176, 'Izhevsk', 'IZ', 0),
(2743, 176, 'Kalinigrad', 'KA', 0),
(2744, 176, 'Kaluga', 'KL', 0),
(2745, 176, 'Kasnodar', 'KS', 0),
(2746, 176, 'Kazan', 'KZ', 0),
(2747, 176, 'Kemerovo', 'KE', 0),
(2748, 176, 'Khabarovsk', 'KH', 0),
(2749, 176, 'Khanty-Mansiysk', 'KM', 0),
(2750, 176, 'Kostroma', 'KO', 0),
(2751, 176, 'Krasnodar', 'KR', 0),
(2752, 176, 'Krasnoyarsk', 'KN', 0),
(2753, 176, 'Kudymkar', 'KU', 0),
(2754, 176, 'Kurgan', 'KG', 0),
(2755, 176, 'Kursk', 'KK', 0),
(2756, 176, 'Kyzyl', 'KY', 0),
(2757, 176, 'Lipetsk', 'LI', 0),
(2758, 176, 'Magadan', 'MA', 0),
(2759, 176, 'Makhachkala', 'MK', 0),
(2760, 176, 'Maykop', 'MY', 0),
(2761, 176, 'Moscow', 'MO', 0),
(2762, 176, 'Murmansk', 'MU', 0),
(2763, 176, 'Nalchik', 'NA', 0),
(2764, 176, 'Naryan Mar', 'NR', 0),
(2765, 176, 'Nazran', 'NZ', 0),
(2766, 176, 'Nizhniy Novgorod', 'NI', 0),
(2767, 176, 'Novgorod', 'NO', 0),
(2768, 176, 'Novosibirsk', 'NV', 0),
(2769, 176, 'Omsk', 'OM', 0),
(2770, 176, 'Orel', 'OR', 0),
(2771, 176, 'Orenburg', 'OE', 0),
(2772, 176, 'Palana', 'PA', 0),
(2773, 176, 'Penza', 'PE', 0),
(2774, 176, 'Perm', 'PR', 0),
(2775, 176, 'Petropavlovsk-Kamchatskiy', 'PK', 0),
(2776, 176, 'Petrozavodsk', 'PT', 0),
(2777, 176, 'Pskov', 'PS', 0),
(2778, 176, 'Rostov-na-Donu', 'RO', 0),
(2779, 176, 'Ryazan', 'RY', 0),
(2780, 176, 'Salekhard', 'SL', 0),
(2781, 176, 'Samara', 'SA', 0),
(2782, 176, 'Saransk', 'SR', 0),
(2783, 176, 'Saratov', 'SV', 0),
(2784, 176, 'Smolensk', 'SM', 0),
(2785, 176, 'St. Petersburg', 'SP', 0),
(2786, 176, 'Stavropol', 'ST', 0),
(2787, 176, 'Syktyvkar', 'SY', 0),
(2788, 176, 'Tambov', 'TA', 0),
(2789, 176, 'Tomsk', 'TO', 0),
(2790, 176, 'Tula', 'TU', 0),
(2791, 176, 'Tura', 'TR', 0),
(2792, 176, 'Tver', 'TV', 0),
(2793, 176, 'Tyumen', 'TY', 0),
(2794, 176, 'Ufa', 'UF', 0),
(2795, 176, 'Ul\'yanovsk', 'UL', 0),
(2796, 176, 'Ulan-Ude', 'UU', 0),
(2797, 176, 'Ust\'-Ordynskiy', 'US', 0),
(2798, 176, 'Vladikavkaz', 'VL', 0),
(2799, 176, 'Vladimir', 'VA', 0),
(2800, 176, 'Vladivostok', 'VV', 0),
(2801, 176, 'Volgograd', 'VG', 0),
(2802, 176, 'Vologda', 'VD', 0),
(2803, 176, 'Voronezh', 'VO', 0),
(2804, 176, 'Vyatka', 'VY', 0),
(2805, 176, 'Yakutsk', 'YA', 0),
(2806, 176, 'Yaroslavl', 'YR', 0),
(2807, 176, 'Yekaterinburg', 'YE', 0),
(2808, 176, 'Yoshkar-Ola', 'YO', 0),
(2809, 177, 'Butare', 'BU', 0),
(2810, 177, 'Byumba', 'BY', 0),
(2811, 177, 'Cyangugu', 'CY', 0),
(2812, 177, 'Gikongoro', 'GK', 0),
(2813, 177, 'Gisenyi', 'GS', 0),
(2814, 177, 'Gitarama', 'GT', 0),
(2815, 177, 'Kibungo', 'KG', 0),
(2816, 177, 'Kibuye', 'KY', 0),
(2817, 177, 'Kigali Rurale', 'KR', 0),
(2818, 177, 'Kigali-ville', 'KV', 0),
(2819, 177, 'Ruhengeri', 'RU', 0),
(2820, 177, 'Umutara', 'UM', 0),
(2821, 178, 'Christ Church Nichola Town', 'CCN', 0),
(2822, 178, 'Saint Anne Sandy Point', 'SAS', 0),
(2823, 178, 'Saint George Basseterre', 'SGB', 0),
(2824, 178, 'Saint George Gingerland', 'SGG', 0),
(2825, 178, 'Saint James Windward', 'SJW', 0),
(2826, 178, 'Saint John Capesterre', 'SJC', 0),
(2827, 178, 'Saint John Figtree', 'SJF', 0),
(2828, 178, 'Saint Mary Cayon', 'SMC', 0),
(2829, 178, 'Saint Paul Capesterre', 'CAP', 0),
(2830, 178, 'Saint Paul Charlestown', 'CHA', 0),
(2831, 178, 'Saint Peter Basseterre', 'SPB', 0),
(2832, 178, 'Saint Thomas Lowland', 'STL', 0),
(2833, 178, 'Saint Thomas Middle Island', 'STM', 0),
(2834, 178, 'Trinity Palmetto Point', 'TPP', 0),
(2835, 179, 'Anse-la-Raye', 'AR', 0),
(2836, 179, 'Castries', 'CA', 0),
(2837, 179, 'Choiseul', 'CH', 0),
(2838, 179, 'Dauphin', 'DA', 0),
(2839, 179, 'Dennery', 'DE', 0),
(2840, 179, 'Gros-Islet', 'GI', 0),
(2841, 179, 'Laborie', 'LA', 0),
(2842, 179, 'Micoud', 'MI', 0),
(2843, 179, 'Praslin', 'PR', 0),
(2844, 179, 'Soufriere', 'SO', 0),
(2845, 179, 'Vieux-Fort', 'VF', 0),
(2846, 180, 'Charlotte', 'C', 0),
(2847, 180, 'Grenadines', 'R', 0),
(2848, 180, 'Saint Andrew', 'A', 0),
(2849, 180, 'Saint David', 'D', 0),
(2850, 180, 'Saint George', 'G', 0),
(2851, 180, 'Saint Patrick', 'P', 0),
(2852, 181, 'A\'ana', 'AN', 0),
(2853, 181, 'Aiga-i-le-Tai', 'AI', 0),
(2854, 181, 'Atua', 'AT', 0),
(2855, 181, 'Fa\'asaleleaga', 'FA', 0),
(2856, 181, 'Gaga\'emauga', 'GE', 0),
(2857, 181, 'Gagaifomauga', 'GF', 0),
(2858, 181, 'Palauli', 'PA', 0),
(2859, 181, 'Satupa\'itea', 'SA', 0),
(2860, 181, 'Tuamasaga', 'TU', 0),
(2861, 181, 'Va\'a-o-Fonoti', 'VF', 0),
(2862, 181, 'Vaisigano', 'VS', 0),
(2863, 182, 'Acquaviva', 'AC', 0),
(2864, 182, 'Borgo Maggiore', 'BM', 0),
(2865, 182, 'Chiesanuova', 'CH', 0),
(2866, 182, 'Domagnano', 'DO', 0),
(2867, 182, 'Faetano', 'FA', 0),
(2868, 182, 'Fiorentino', 'FI', 0),
(2869, 182, 'Montegiardino', 'MO', 0),
(2870, 182, 'Citta di San Marino', 'SM', 0),
(2871, 182, 'Serravalle', 'SE', 0),
(2872, 183, 'Sao Tome', 'S', 0),
(2873, 183, 'Principe', 'P', 0),
(2874, 184, 'Al Bahah', 'BH', 0),
(2875, 184, 'Al Hudud ash Shamaliyah', 'HS', 0),
(2876, 184, 'Al Jawf', 'JF', 0),
(2877, 184, 'Al Madinah', 'MD', 0),
(2878, 184, 'Al Qasim', 'QS', 0),
(2879, 184, 'Ar Riyad', 'RD', 0),
(2880, 184, 'Ash Sharqiyah (Eastern)', 'AQ', 0),
(2881, 184, '\'Asir', 'AS', 0),
(2882, 184, 'Ha\'il', 'HL', 0),
(2883, 184, 'Jizan', 'JZ', 0),
(2884, 184, 'Makkah', 'ML', 0),
(2885, 184, 'Najran', 'NR', 0),
(2886, 184, 'Tabuk', 'TB', 0),
(2887, 185, 'Dakar', 'DA', 0),
(2888, 185, 'Diourbel', 'DI', 0),
(2889, 185, 'Fatick', 'FA', 0),
(2890, 185, 'Kaolack', 'KA', 0),
(2891, 185, 'Kolda', 'KO', 0),
(2892, 185, 'Louga', 'LO', 0),
(2893, 185, 'Matam', 'MA', 0),
(2894, 185, 'Saint-Louis', 'SL', 0),
(2895, 185, 'Tambacounda', 'TA', 0),
(2896, 185, 'Thies', 'TH', 0),
(2897, 185, 'Ziguinchor', 'ZI', 0),
(2898, 186, 'Anse aux Pins', 'AP', 0),
(2899, 186, 'Anse Boileau', 'AB', 0),
(2900, 186, 'Anse Etoile', 'AE', 0),
(2901, 186, 'Anse Louis', 'AL', 0),
(2902, 186, 'Anse Royale', 'AR', 0),
(2903, 186, 'Baie Lazare', 'BL', 0),
(2904, 186, 'Baie Sainte Anne', 'BS', 0),
(2905, 186, 'Beau Vallon', 'BV', 0),
(2906, 186, 'Bel Air', 'BA', 0),
(2907, 186, 'Bel Ombre', 'BO', 0),
(2908, 186, 'Cascade', 'CA', 0),
(2909, 186, 'Glacis', 'GL', 0),
(2910, 186, 'Grand\' Anse (on Mahe)', 'GM', 0),
(2911, 186, 'Grand\' Anse (on Praslin)', 'GP', 0),
(2912, 186, 'La Digue', 'DG', 0),
(2913, 186, 'La Riviere Anglaise', 'RA', 0),
(2914, 186, 'Mont Buxton', 'MB', 0),
(2915, 186, 'Mont Fleuri', 'MF', 0),
(2916, 186, 'Plaisance', 'PL', 0),
(2917, 186, 'Pointe La Rue', 'PR', 0),
(2918, 186, 'Port Glaud', 'PG', 0),
(2919, 186, 'Saint Louis', 'SL', 0),
(2920, 186, 'Takamaka', 'TA', 0),
(2921, 187, 'Eastern', 'E', 0),
(2922, 187, 'Northern', 'N', 0),
(2923, 187, 'Southern', 'S', 0),
(2924, 187, 'Western', 'W', 0),
(2925, 189, 'Banskobystrický', 'BA', 0),
(2926, 189, 'Bratislavský', 'BR', 0),
(2927, 189, 'Košický', 'KO', 0),
(2928, 189, 'Nitriansky', 'NI', 0),
(2929, 189, 'Prešovský', 'PR', 0),
(2930, 189, 'Trenčiansky', 'TC', 0),
(2931, 189, 'Trnavský', 'TV', 0),
(2932, 189, 'Žilinský', 'ZI', 0),
(2933, 191, 'Central', 'CE', 0),
(2934, 191, 'Choiseul', 'CH', 0),
(2935, 191, 'Guadalcanal', 'GC', 0),
(2936, 191, 'Honiara', 'HO', 0),
(2937, 191, 'Isabel', 'IS', 0),
(2938, 191, 'Makira', 'MK', 0),
(2939, 191, 'Malaita', 'ML', 0),
(2940, 191, 'Rennell and Bellona', 'RB', 0),
(2941, 191, 'Temotu', 'TM', 0),
(2942, 191, 'Western', 'WE', 0),
(2943, 192, 'Awdal', 'AW', 0),
(2944, 192, 'Bakool', 'BK', 0),
(2945, 192, 'Banaadir', 'BN', 0),
(2946, 192, 'Bari', 'BR', 0),
(2947, 192, 'Bay', 'BY', 0),
(2948, 192, 'Galguduud', 'GA', 0),
(2949, 192, 'Gedo', 'GE', 0),
(2950, 192, 'Hiiraan', 'HI', 0),
(2951, 192, 'Jubbada Dhexe', 'JD', 0),
(2952, 192, 'Jubbada Hoose', 'JH', 0),
(2953, 192, 'Mudug', 'MU', 0),
(2954, 192, 'Nugaal', 'NU', 0),
(2955, 192, 'Sanaag', 'SA', 0),
(2956, 192, 'Shabeellaha Dhexe', 'SD', 0),
(2957, 192, 'Shabeellaha Hoose', 'SH', 0),
(2958, 192, 'Sool', 'SL', 0),
(2959, 192, 'Togdheer', 'TO', 0),
(2960, 192, 'Woqooyi Galbeed', 'WG', 0),
(2961, 193, 'Eastern Cape', 'EC', 0),
(2962, 193, 'Free State', 'FS', 0),
(2963, 193, 'Gauteng', 'GT', 0),
(2964, 193, 'KwaZulu-Natal', 'KN', 0),
(2965, 193, 'Limpopo', 'LP', 0),
(2966, 193, 'Mpumalanga', 'MP', 0),
(2967, 193, 'North West', 'NW', 0),
(2968, 193, 'Northern Cape', 'NC', 0),
(2969, 193, 'Western Cape', 'WC', 0),
(2970, 195, 'La Coru&ntilde;a', 'CA', 0),
(2971, 195, '&Aacute;lava', 'AL', 0),
(2972, 195, 'Albacete', 'AB', 0),
(2973, 195, 'Alicante', 'AC', 0),
(2974, 195, 'Almeria', 'AM', 0),
(2975, 195, 'Asturias', 'AS', 0),
(2976, 195, '&Aacute;vila', 'AV', 0),
(2977, 195, 'Badajoz', 'BJ', 0),
(2978, 195, 'Baleares', 'IB', 0),
(2979, 195, 'Barcelona', 'BA', 0),
(2980, 195, 'Burgos', 'BU', 0),
(2981, 195, 'C&aacute;ceres', 'CC', 0),
(2982, 195, 'C&aacute;diz', 'CZ', 0),
(2983, 195, 'Cantabria', 'CT', 0),
(2984, 195, 'Castell&oacute;n', 'CL', 0),
(2985, 195, 'Ceuta', 'CE', 0),
(2986, 195, 'Ciudad Real', 'CR', 0),
(2987, 195, 'C&oacute;rdoba', 'CD', 0),
(2988, 195, 'Cuenca', 'CU', 0),
(2989, 195, 'Girona', 'GI', 0),
(2990, 195, 'Granada', 'GD', 0),
(2991, 195, 'Guadalajara', 'GJ', 0),
(2992, 195, 'Guip&uacute;zcoa', 'GP', 0),
(2993, 195, 'Huelva', 'HL', 0),
(2994, 195, 'Huesca', 'HS', 0),
(2995, 195, 'Ja&eacute;n', 'JN', 0),
(2996, 195, 'La Rioja', 'RJ', 0),
(2997, 195, 'Las Palmas', 'PM', 0),
(2998, 195, 'Leon', 'LE', 0),
(2999, 195, 'Lleida', 'LL', 0),
(3000, 195, 'Lugo', 'LG', 0),
(3001, 195, 'Madrid', 'MD', 0),
(3002, 195, 'Malaga', 'MA', 0),
(3003, 195, 'Melilla', 'ML', 0),
(3004, 195, 'Murcia', 'MU', 0),
(3005, 195, 'Navarra', 'NV', 0),
(3006, 195, 'Ourense', 'OU', 0),
(3007, 195, 'Palencia', 'PL', 0),
(3008, 195, 'Pontevedra', 'PO', 0),
(3009, 195, 'Salamanca', 'SL', 0),
(3010, 195, 'Santa Cruz de Tenerife', 'SC', 0),
(3011, 195, 'Segovia', 'SG', 0),
(3012, 195, 'Sevilla', 'SV', 0),
(3013, 195, 'Soria', 'SO', 0),
(3014, 195, 'Tarragona', 'TA', 0),
(3015, 195, 'Teruel', 'TE', 0),
(3016, 195, 'Toledo', 'TO', 0),
(3017, 195, 'Valencia', 'VC', 0),
(3018, 195, 'Valladolid', 'VD', 0),
(3019, 195, 'Vizcaya', 'VZ', 0),
(3020, 195, 'Zamora', 'ZM', 0),
(3021, 195, 'Zaragoza', 'ZR', 0),
(3022, 196, 'Central', 'CE', 0),
(3023, 196, 'Eastern', 'EA', 0),
(3024, 196, 'North Central', 'NC', 0),
(3025, 196, 'Northern', 'NO', 0),
(3026, 196, 'North Western', 'NW', 0),
(3027, 196, 'Sabaragamuwa', 'SA', 0),
(3028, 196, 'Southern', 'SO', 0),
(3029, 196, 'Uva', 'UV', 0),
(3030, 196, 'Western', 'WE', 0),
(3032, 197, 'Saint Helena', 'S', 0),
(3034, 199, 'A\'ali an Nil', 'ANL', 0),
(3035, 199, 'Al Bahr al Ahmar', 'BAM', 0),
(3036, 199, 'Al Buhayrat', 'BRT', 0),
(3037, 199, 'Al Jazirah', 'JZR', 0),
(3038, 199, 'Al Khartum', 'KRT', 0),
(3039, 199, 'Al Qadarif', 'QDR', 0),
(3040, 199, 'Al Wahdah', 'WDH', 0),
(3041, 199, 'An Nil al Abyad', 'ANB', 0),
(3042, 199, 'An Nil al Azraq', 'ANZ', 0),
(3043, 199, 'Ash Shamaliyah', 'ASH', 0),
(3044, 199, 'Bahr al Jabal', 'BJA', 0),
(3045, 199, 'Gharb al Istiwa\'iyah', 'GIS', 0),
(3046, 199, 'Gharb Bahr al Ghazal', 'GBG', 0),
(3047, 199, 'Gharb Darfur', 'GDA', 0),
(3048, 199, 'Gharb Kurdufan', 'GKU', 0),
(3049, 199, 'Janub Darfur', 'JDA', 0),
(3050, 199, 'Janub Kurdufan', 'JKU', 0),
(3051, 199, 'Junqali', 'JQL', 0),
(3052, 199, 'Kassala', 'KSL', 0),
(3053, 199, 'Nahr an Nil', 'NNL', 0),
(3054, 199, 'Shamal Bahr al Ghazal', 'SBG', 0),
(3055, 199, 'Shamal Darfur', 'SDA', 0),
(3056, 199, 'Shamal Kurdufan', 'SKU', 0),
(3057, 199, 'Sharq al Istiwa\'iyah', 'SIS', 0),
(3058, 199, 'Sinnar', 'SNR', 0),
(3059, 199, 'Warab', 'WRB', 0),
(3060, 200, 'Brokopondo', 'BR', 0),
(3061, 200, 'Commewijne', 'CM', 0),
(3062, 200, 'Coronie', 'CR', 0),
(3063, 200, 'Marowijne', 'MA', 0),
(3064, 200, 'Nickerie', 'NI', 0),
(3065, 200, 'Para', 'PA', 0),
(3066, 200, 'Paramaribo', 'PM', 0),
(3067, 200, 'Saramacca', 'SA', 0),
(3068, 200, 'Sipaliwini', 'SI', 0),
(3069, 200, 'Wanica', 'WA', 0),
(3070, 202, 'Hhohho', 'H', 0),
(3071, 202, 'Lubombo', 'L', 0),
(3072, 202, 'Manzini', 'M', 0),
(3073, 202, 'Shishelweni', 'S', 0),
(3074, 203, 'Blekinge', 'K', 0),
(3075, 203, 'Dalarna', 'W', 0),
(3076, 203, 'Gävleborg', 'X', 0),
(3077, 203, 'Gotland', 'I', 0),
(3078, 203, 'Halland', 'N', 0),
(3079, 203, 'Jämtland', 'Z', 0),
(3080, 203, 'Jönköping', 'F', 0),
(3081, 203, 'Kalmar', 'H', 0),
(3082, 203, 'Kronoberg', 'G', 0),
(3083, 203, 'Norrbotten', 'BD', 0),
(3084, 203, 'Örebro', 'T', 0),
(3085, 203, 'Östergötland', 'E', 0),
(3086, 203, 'Sk&aring;ne', 'M', 0),
(3087, 203, 'Södermanland', 'D', 0),
(3088, 203, 'Stockholm', 'AB', 0),
(3089, 203, 'Uppsala', 'C', 0),
(3090, 203, 'Värmland', 'S', 0),
(3091, 203, 'Västerbotten', 'AC', 0),
(3092, 203, 'Västernorrland', 'Y', 0),
(3093, 203, 'Västmanland', 'U', 0),
(3094, 203, 'Västra Götaland', 'O', 0),
(3095, 204, 'Aargau', 'AG', 1),
(3096, 204, 'Appenzell Ausserrhoden', 'AR', 1),
(3097, 204, 'Appenzell Innerrhoden', 'AI', 1),
(3098, 204, 'Basel-Stadt', 'BS', 1),
(3099, 204, 'Basel-Landschaft', 'BL', 1),
(3100, 204, 'Bern', 'BE', 1),
(3101, 204, 'Fribourg', 'FR', 1),
(3102, 204, 'Gen&egrave;ve', 'GE', 1),
(3103, 204, 'Glarus', 'GL', 1),
(3104, 204, 'Graubünden', 'GR', 1),
(3105, 204, 'Jura', 'JU', 1),
(3106, 204, 'Luzern', 'LU', 1),
(3107, 204, 'Neuch&acirc;tel', 'NE', 1),
(3108, 204, 'Nidwald', 'NW', 1),
(3109, 204, 'Obwald', 'OW', 1),
(3110, 204, 'St. Gallen', 'SG', 1),
(3111, 204, 'Schaffhausen', 'SH', 1),
(3112, 204, 'Schwyz', 'SZ', 1),
(3113, 204, 'Solothurn', 'SO', 1),
(3114, 204, 'Thurgau', 'TG', 1),
(3115, 204, 'Ticino', 'TI', 1),
(3116, 204, 'Uri', 'UR', 1),
(3117, 204, 'Valais', 'VS', 1),
(3118, 204, 'Vaud', 'VD', 1),
(3119, 204, 'Zug', 'ZG', 1),
(3120, 204, 'Zürich', 'ZH', 1),
(3121, 205, 'Al Hasakah', 'HA', 0),
(3122, 205, 'Al Ladhiqiyah', 'LA', 0),
(3123, 205, 'Al Qunaytirah', 'QU', 0),
(3124, 205, 'Ar Raqqah', 'RQ', 0),
(3125, 205, 'As Suwayda', 'SU', 0),
(3126, 205, 'Dara', 'DA', 0),
(3127, 205, 'Dayr az Zawr', 'DZ', 0),
(3128, 205, 'Dimashq', 'DI', 0),
(3129, 205, 'Halab', 'HL', 0),
(3130, 205, 'Hamah', 'HM', 0),
(3131, 205, 'Hims', 'HI', 0),
(3132, 205, 'Idlib', 'ID', 0),
(3133, 205, 'Rif Dimashq', 'RD', 0),
(3134, 205, 'Tartus', 'TA', 0),
(3135, 206, 'Chang-hua', 'CH', 0),
(3136, 206, 'Chia-i', 'CI', 0);
INSERT INTO `oc_zone` (`zone_id`, `country_id`, `name`, `code`, `status`) VALUES
(3137, 206, 'Hsin-chu', 'HS', 0),
(3138, 206, 'Hua-lien', 'HL', 0),
(3139, 206, 'I-lan', 'IL', 0),
(3140, 206, 'Kao-hsiung county', 'KH', 0),
(3141, 206, 'Kin-men', 'KM', 0),
(3142, 206, 'Lien-chiang', 'LC', 0),
(3143, 206, 'Miao-li', 'ML', 0),
(3144, 206, 'Nan-t\'ou', 'NT', 0),
(3145, 206, 'P\'eng-hu', 'PH', 0),
(3146, 206, 'P\'ing-tung', 'PT', 0),
(3147, 206, 'T\'ai-chung', 'TG', 0),
(3148, 206, 'T\'ai-nan', 'TA', 0),
(3149, 206, 'T\'ai-pei county', 'TP', 0),
(3150, 206, 'T\'ai-tung', 'TT', 0),
(3151, 206, 'T\'ao-yuan', 'TY', 0),
(3152, 206, 'Yun-lin', 'YL', 0),
(3153, 206, 'Chia-i city', 'CC', 0),
(3154, 206, 'Chi-lung', 'CL', 0),
(3155, 206, 'Hsin-chu', 'HC', 0),
(3156, 206, 'T\'ai-chung', 'TH', 0),
(3157, 206, 'T\'ai-nan', 'TN', 0),
(3158, 206, 'Kao-hsiung city', 'KC', 0),
(3159, 206, 'T\'ai-pei city', 'TC', 0),
(3160, 207, 'Gorno-Badakhstan', 'GB', 0),
(3161, 207, 'Khatlon', 'KT', 0),
(3162, 207, 'Sughd', 'SU', 0),
(3163, 208, 'Arusha', 'AR', 0),
(3164, 208, 'Dar es Salaam', 'DS', 0),
(3165, 208, 'Dodoma', 'DO', 0),
(3166, 208, 'Iringa', 'IR', 0),
(3167, 208, 'Kagera', 'KA', 0),
(3168, 208, 'Kigoma', 'KI', 0),
(3169, 208, 'Kilimanjaro', 'KJ', 0),
(3170, 208, 'Lindi', 'LN', 0),
(3171, 208, 'Manyara', 'MY', 0),
(3172, 208, 'Mara', 'MR', 0),
(3173, 208, 'Mbeya', 'MB', 0),
(3174, 208, 'Morogoro', 'MO', 0),
(3175, 208, 'Mtwara', 'MT', 0),
(3176, 208, 'Mwanza', 'MW', 0),
(3177, 208, 'Pemba North', 'PN', 0),
(3178, 208, 'Pemba South', 'PS', 0),
(3179, 208, 'Pwani', 'PW', 0),
(3180, 208, 'Rukwa', 'RK', 0),
(3181, 208, 'Ruvuma', 'RV', 0),
(3182, 208, 'Shinyanga', 'SH', 0),
(3183, 208, 'Singida', 'SI', 0),
(3184, 208, 'Tabora', 'TB', 0),
(3185, 208, 'Tanga', 'TN', 0),
(3186, 208, 'Zanzibar Central/South', 'ZC', 0),
(3187, 208, 'Zanzibar North', 'ZN', 0),
(3188, 208, 'Zanzibar Urban/West', 'ZU', 0),
(3189, 209, 'Amnat Charoen', 'Amnat Charoen', 0),
(3190, 209, 'Ang Thong', 'Ang Thong', 0),
(3191, 209, 'Ayutthaya', 'Ayutthaya', 0),
(3192, 209, 'Bangkok', 'Bangkok', 0),
(3193, 209, 'Buriram', 'Buriram', 0),
(3194, 209, 'Chachoengsao', 'Chachoengsao', 0),
(3195, 209, 'Chai Nat', 'Chai Nat', 0),
(3196, 209, 'Chaiyaphum', 'Chaiyaphum', 0),
(3197, 209, 'Chanthaburi', 'Chanthaburi', 0),
(3198, 209, 'Chiang Mai', 'Chiang Mai', 0),
(3199, 209, 'Chiang Rai', 'Chiang Rai', 0),
(3200, 209, 'Chon Buri', 'Chon Buri', 0),
(3201, 209, 'Chumphon', 'Chumphon', 0),
(3202, 209, 'Kalasin', 'Kalasin', 0),
(3203, 209, 'Kamphaeng Phet', 'Kamphaeng Phet', 0),
(3204, 209, 'Kanchanaburi', 'Kanchanaburi', 0),
(3205, 209, 'Khon Kaen', 'Khon Kaen', 0),
(3206, 209, 'Krabi', 'Krabi', 0),
(3207, 209, 'Lampang', 'Lampang', 0),
(3208, 209, 'Lamphun', 'Lamphun', 0),
(3209, 209, 'Loei', 'Loei', 0),
(3210, 209, 'Lop Buri', 'Lop Buri', 0),
(3211, 209, 'Mae Hong Son', 'Mae Hong Son', 0),
(3212, 209, 'Maha Sarakham', 'Maha Sarakham', 0),
(3213, 209, 'Mukdahan', 'Mukdahan', 0),
(3214, 209, 'Nakhon Nayok', 'Nakhon Nayok', 0),
(3215, 209, 'Nakhon Pathom', 'Nakhon Pathom', 0),
(3216, 209, 'Nakhon Phanom', 'Nakhon Phanom', 0),
(3217, 209, 'Nakhon Ratchasima', 'Nakhon Ratchasima', 0),
(3218, 209, 'Nakhon Sawan', 'Nakhon Sawan', 0),
(3219, 209, 'Nakhon Si Thammarat', 'Nakhon Si Thammarat', 0),
(3220, 209, 'Nan', 'Nan', 0),
(3221, 209, 'Narathiwat', 'Narathiwat', 0),
(3222, 209, 'Nong Bua Lamphu', 'Nong Bua Lamphu', 0),
(3223, 209, 'Nong Khai', 'Nong Khai', 0),
(3224, 209, 'Nonthaburi', 'Nonthaburi', 0),
(3225, 209, 'Pathum Thani', 'Pathum Thani', 0),
(3226, 209, 'Pattani', 'Pattani', 0),
(3227, 209, 'Phangnga', 'Phangnga', 0),
(3228, 209, 'Phatthalung', 'Phatthalung', 0),
(3229, 209, 'Phayao', 'Phayao', 0),
(3230, 209, 'Phetchabun', 'Phetchabun', 0),
(3231, 209, 'Phetchaburi', 'Phetchaburi', 0),
(3232, 209, 'Phichit', 'Phichit', 0),
(3233, 209, 'Phitsanulok', 'Phitsanulok', 0),
(3234, 209, 'Phrae', 'Phrae', 0),
(3235, 209, 'Phuket', 'Phuket', 0),
(3236, 209, 'Prachin Buri', 'Prachin Buri', 0),
(3237, 209, 'Prachuap Khiri Khan', 'Prachuap Khiri Khan', 0),
(3238, 209, 'Ranong', 'Ranong', 0),
(3239, 209, 'Ratchaburi', 'Ratchaburi', 0),
(3240, 209, 'Rayong', 'Rayong', 0),
(3241, 209, 'Roi Et', 'Roi Et', 0),
(3242, 209, 'Sa Kaeo', 'Sa Kaeo', 0),
(3243, 209, 'Sakon Nakhon', 'Sakon Nakhon', 0),
(3244, 209, 'Samut Prakan', 'Samut Prakan', 0),
(3245, 209, 'Samut Sakhon', 'Samut Sakhon', 0),
(3246, 209, 'Samut Songkhram', 'Samut Songkhram', 0),
(3247, 209, 'Sara Buri', 'Sara Buri', 0),
(3248, 209, 'Satun', 'Satun', 0),
(3249, 209, 'Sing Buri', 'Sing Buri', 0),
(3250, 209, 'Sisaket', 'Sisaket', 0),
(3251, 209, 'Songkhla', 'Songkhla', 0),
(3252, 209, 'Sukhothai', 'Sukhothai', 0),
(3253, 209, 'Suphan Buri', 'Suphan Buri', 0),
(3254, 209, 'Surat Thani', 'Surat Thani', 0),
(3255, 209, 'Surin', 'Surin', 0),
(3256, 209, 'Tak', 'Tak', 0),
(3257, 209, 'Trang', 'Trang', 0),
(3258, 209, 'Trat', 'Trat', 0),
(3259, 209, 'Ubon Ratchathani', 'Ubon Ratchathani', 0),
(3260, 209, 'Udon Thani', 'Udon Thani', 0),
(3261, 209, 'Uthai Thani', 'Uthai Thani', 0),
(3262, 209, 'Uttaradit', 'Uttaradit', 0),
(3263, 209, 'Yala', 'Yala', 0),
(3264, 209, 'Yasothon', 'Yasothon', 0),
(3265, 210, 'Kara', 'K', 0),
(3266, 210, 'Plateaux', 'P', 0),
(3267, 210, 'Savanes', 'S', 0),
(3268, 210, 'Centrale', 'C', 0),
(3269, 210, 'Maritime', 'M', 0),
(3270, 211, 'Atafu', 'A', 0),
(3271, 211, 'Fakaofo', 'F', 0),
(3272, 211, 'Nukunonu', 'N', 0),
(3273, 212, 'Ha\'apai', 'H', 0),
(3274, 212, 'Tongatapu', 'T', 0),
(3275, 212, 'Vava\'u', 'V', 0),
(3276, 213, 'Couva/Tabaquite/Talparo', 'CT', 0),
(3277, 213, 'Diego Martin', 'DM', 0),
(3278, 213, 'Mayaro/Rio Claro', 'MR', 0),
(3279, 213, 'Penal/Debe', 'PD', 0),
(3280, 213, 'Princes Town', 'PT', 0),
(3281, 213, 'Sangre Grande', 'SG', 0),
(3282, 213, 'San Juan/Laventille', 'SL', 0),
(3283, 213, 'Siparia', 'SI', 0),
(3284, 213, 'Tunapuna/Piarco', 'TP', 0),
(3285, 213, 'Port of Spain', 'PS', 0),
(3286, 213, 'San Fernando', 'SF', 0),
(3287, 213, 'Arima', 'AR', 0),
(3288, 213, 'Point Fortin', 'PF', 0),
(3289, 213, 'Chaguanas', 'CH', 0),
(3290, 213, 'Tobago', 'TO', 0),
(3291, 214, 'Ariana', 'AR', 0),
(3292, 214, 'Beja', 'BJ', 0),
(3293, 214, 'Ben Arous', 'BA', 0),
(3294, 214, 'Bizerte', 'BI', 0),
(3295, 214, 'Gabes', 'GB', 0),
(3296, 214, 'Gafsa', 'GF', 0),
(3297, 214, 'Jendouba', 'JE', 0),
(3298, 214, 'Kairouan', 'KR', 0),
(3299, 214, 'Kasserine', 'KS', 0),
(3300, 214, 'Kebili', 'KB', 0),
(3301, 214, 'Kef', 'KF', 0),
(3302, 214, 'Mahdia', 'MH', 0),
(3303, 214, 'Manouba', 'MN', 0),
(3304, 214, 'Medenine', 'ME', 0),
(3305, 214, 'Monastir', 'MO', 0),
(3306, 214, 'Nabeul', 'NA', 0),
(3307, 214, 'Sfax', 'SF', 0),
(3308, 214, 'Sidi', 'SD', 0),
(3309, 214, 'Siliana', 'SL', 0),
(3310, 214, 'Sousse', 'SO', 0),
(3311, 214, 'Tataouine', 'TA', 0),
(3312, 214, 'Tozeur', 'TO', 0),
(3313, 214, 'Tunis', 'TU', 0),
(3314, 214, 'Zaghouan', 'ZA', 0),
(3315, 215, 'Adana', 'ADA', 0),
(3316, 215, 'Adıyaman', 'ADI', 0),
(3317, 215, 'Afyonkarahisar', 'AFY', 0),
(3318, 215, 'Ağrı', 'AGR', 0),
(3319, 215, 'Aksaray', 'AKS', 0),
(3320, 215, 'Amasya', 'AMA', 0),
(3321, 215, 'Ankara', 'ANK', 0),
(3322, 215, 'Antalya', 'ANT', 0),
(3323, 215, 'Ardahan', 'ARD', 0),
(3324, 215, 'Artvin', 'ART', 0),
(3325, 215, 'Aydın', 'AYI', 0),
(3326, 215, 'Balıkesir', 'BAL', 0),
(3327, 215, 'Bartın', 'BAR', 0),
(3328, 215, 'Batman', 'BAT', 0),
(3329, 215, 'Bayburt', 'BAY', 0),
(3330, 215, 'Bilecik', 'BIL', 0),
(3331, 215, 'Bingöl', 'BIN', 0),
(3332, 215, 'Bitlis', 'BIT', 0),
(3333, 215, 'Bolu', 'BOL', 0),
(3334, 215, 'Burdur', 'BRD', 0),
(3335, 215, 'Bursa', 'BRS', 0),
(3336, 215, 'Çanakkale', 'CKL', 0),
(3337, 215, 'Çankırı', 'CKR', 0),
(3338, 215, 'Çorum', 'COR', 0),
(3339, 215, 'Denizli', 'DEN', 0),
(3340, 215, 'Diyarbakır', 'DIY', 0),
(3341, 215, 'Düzce', 'DUZ', 0),
(3342, 215, 'Edirne', 'EDI', 0),
(3343, 215, 'Elazığ', 'ELA', 0),
(3344, 215, 'Erzincan', 'EZC', 0),
(3345, 215, 'Erzurum', 'EZR', 0),
(3346, 215, 'Eskişehir', 'ESK', 0),
(3347, 215, 'Gaziantep', 'GAZ', 0),
(3348, 215, 'Giresun', 'GIR', 0),
(3349, 215, 'Gümüşhane', 'GMS', 0),
(3350, 215, 'Hakkari', 'HKR', 0),
(3351, 215, 'Hatay', 'HTY', 0),
(3352, 215, 'Iğdır', 'IGD', 0),
(3353, 215, 'Isparta', 'ISP', 0),
(3354, 215, 'İstanbul', 'IST', 0),
(3355, 215, 'İzmir', 'IZM', 0),
(3356, 215, 'Kahramanmaraş', 'KAH', 0),
(3357, 215, 'Karabük', 'KRB', 0),
(3358, 215, 'Karaman', 'KRM', 0),
(3359, 215, 'Kars', 'KRS', 0),
(3360, 215, 'Kastamonu', 'KAS', 0),
(3361, 215, 'Kayseri', 'KAY', 0),
(3362, 215, 'Kilis', 'KLS', 0),
(3363, 215, 'Kırıkkale', 'KRK', 0),
(3364, 215, 'Kırklareli', 'KLR', 0),
(3365, 215, 'Kırşehir', 'KRH', 0),
(3366, 215, 'Kocaeli', 'KOC', 0),
(3367, 215, 'Konya', 'KON', 0),
(3368, 215, 'Kütahya', 'KUT', 0),
(3369, 215, 'Malatya', 'MAL', 0),
(3370, 215, 'Manisa', 'MAN', 0),
(3371, 215, 'Mardin', 'MAR', 0),
(3372, 215, 'Mersin', 'MER', 0),
(3373, 215, 'Muğla', 'MUG', 0),
(3374, 215, 'Muş', 'MUS', 0),
(3375, 215, 'Nevşehir', 'NEV', 0),
(3376, 215, 'Niğde', 'NIG', 0),
(3377, 215, 'Ordu', 'ORD', 0),
(3378, 215, 'Osmaniye', 'OSM', 0),
(3379, 215, 'Rize', 'RIZ', 0),
(3380, 215, 'Sakarya', 'SAK', 0),
(3381, 215, 'Samsun', 'SAM', 0),
(3382, 215, 'Şanlıurfa', 'SAN', 0),
(3383, 215, 'Siirt', 'SII', 0),
(3384, 215, 'Sinop', 'SIN', 0),
(3385, 215, 'Şırnak', 'SIR', 0),
(3386, 215, 'Sivas', 'SIV', 0),
(3387, 215, 'Tekirdağ', 'TEL', 0),
(3388, 215, 'Tokat', 'TOK', 0),
(3389, 215, 'Trabzon', 'TRA', 0),
(3390, 215, 'Tunceli', 'TUN', 0),
(3391, 215, 'Uşak', 'USK', 0),
(3392, 215, 'Van', 'VAN', 0),
(3393, 215, 'Yalova', 'YAL', 0),
(3394, 215, 'Yozgat', 'YOZ', 0),
(3395, 215, 'Zonguldak', 'ZON', 0),
(3396, 216, 'Ahal Welayaty', 'A', 0),
(3397, 216, 'Balkan Welayaty', 'B', 0),
(3398, 216, 'Dashhowuz Welayaty', 'D', 0),
(3399, 216, 'Lebap Welayaty', 'L', 0),
(3400, 216, 'Mary Welayaty', 'M', 0),
(3401, 217, 'Ambergris Cays', 'AC', 0),
(3402, 217, 'Dellis Cay', 'DC', 0),
(3403, 217, 'French Cay', 'FC', 0),
(3404, 217, 'Little Water Cay', 'LW', 0),
(3405, 217, 'Parrot Cay', 'RC', 0),
(3406, 217, 'Pine Cay', 'PN', 0),
(3407, 217, 'Salt Cay', 'SL', 0),
(3408, 217, 'Grand Turk', 'GT', 0),
(3409, 217, 'South Caicos', 'SC', 0),
(3410, 217, 'East Caicos', 'EC', 0),
(3411, 217, 'Middle Caicos', 'MC', 0),
(3412, 217, 'North Caicos', 'NC', 0),
(3413, 217, 'Providenciales', 'PR', 0),
(3414, 217, 'West Caicos', 'WC', 0),
(3415, 218, 'Nanumanga', 'NMG', 0),
(3416, 218, 'Niulakita', 'NLK', 0),
(3417, 218, 'Niutao', 'NTO', 0),
(3418, 218, 'Funafuti', 'FUN', 0),
(3419, 218, 'Nanumea', 'NME', 0),
(3420, 218, 'Nui', 'NUI', 0),
(3421, 218, 'Nukufetau', 'NFT', 0),
(3422, 218, 'Nukulaelae', 'NLL', 0),
(3423, 218, 'Vaitupu', 'VAI', 0),
(3424, 219, 'Kalangala', 'KAL', 0),
(3425, 219, 'Kampala', 'KMP', 0),
(3426, 219, 'Kayunga', 'KAY', 0),
(3427, 219, 'Kiboga', 'KIB', 0),
(3428, 219, 'Luwero', 'LUW', 0),
(3429, 219, 'Masaka', 'MAS', 0),
(3430, 219, 'Mpigi', 'MPI', 0),
(3431, 219, 'Mubende', 'MUB', 0),
(3432, 219, 'Mukono', 'MUK', 0),
(3433, 219, 'Nakasongola', 'NKS', 0),
(3434, 219, 'Rakai', 'RAK', 0),
(3435, 219, 'Sembabule', 'SEM', 0),
(3436, 219, 'Wakiso', 'WAK', 0),
(3437, 219, 'Bugiri', 'BUG', 0),
(3438, 219, 'Busia', 'BUS', 0),
(3439, 219, 'Iganga', 'IGA', 0),
(3440, 219, 'Jinja', 'JIN', 0),
(3441, 219, 'Kaberamaido', 'KAB', 0),
(3442, 219, 'Kamuli', 'KML', 0),
(3443, 219, 'Kapchorwa', 'KPC', 0),
(3444, 219, 'Katakwi', 'KTK', 0),
(3445, 219, 'Kumi', 'KUM', 0),
(3446, 219, 'Mayuge', 'MAY', 0),
(3447, 219, 'Mbale', 'MBA', 0),
(3448, 219, 'Pallisa', 'PAL', 0),
(3449, 219, 'Sironko', 'SIR', 0),
(3450, 219, 'Soroti', 'SOR', 0),
(3451, 219, 'Tororo', 'TOR', 0),
(3452, 219, 'Adjumani', 'ADJ', 0),
(3453, 219, 'Apac', 'APC', 0),
(3454, 219, 'Arua', 'ARU', 0),
(3455, 219, 'Gulu', 'GUL', 0),
(3456, 219, 'Kitgum', 'KIT', 0),
(3457, 219, 'Kotido', 'KOT', 0),
(3458, 219, 'Lira', 'LIR', 0),
(3459, 219, 'Moroto', 'MRT', 0),
(3460, 219, 'Moyo', 'MOY', 0),
(3461, 219, 'Nakapiripirit', 'NAK', 0),
(3462, 219, 'Nebbi', 'NEB', 0),
(3463, 219, 'Pader', 'PAD', 0),
(3464, 219, 'Yumbe', 'YUM', 0),
(3465, 219, 'Bundibugyo', 'BUN', 0),
(3466, 219, 'Bushenyi', 'BSH', 0),
(3467, 219, 'Hoima', 'HOI', 0),
(3468, 219, 'Kabale', 'KBL', 0),
(3469, 219, 'Kabarole', 'KAR', 0),
(3470, 219, 'Kamwenge', 'KAM', 0),
(3471, 219, 'Kanungu', 'KAN', 0),
(3472, 219, 'Kasese', 'KAS', 0),
(3473, 219, 'Kibaale', 'KBA', 0),
(3474, 219, 'Kisoro', 'KIS', 0),
(3475, 219, 'Kyenjojo', 'KYE', 0),
(3476, 219, 'Masindi', 'MSN', 0),
(3477, 219, 'Mbarara', 'MBR', 0),
(3478, 219, 'Ntungamo', 'NTU', 0),
(3479, 219, 'Rukungiri', 'RUK', 0),
(3480, 220, 'Cherkas\'ka Oblast\'', '71', 0),
(3481, 220, 'Chernihivs\'ka Oblast\'', '74', 0),
(3482, 220, 'Chernivets\'ka Oblast\'', '77', 0),
(3483, 220, 'Crimea', '43', 0),
(3484, 220, 'Dnipropetrovs\'ka Oblast\'', '12', 0),
(3485, 220, 'Donets\'ka Oblast\'', '14', 0),
(3486, 220, 'Ivano-Frankivs\'ka Oblast\'', '26', 0),
(3487, 220, 'Khersons\'ka Oblast\'', '65', 0),
(3488, 220, 'Khmel\'nyts\'ka Oblast\'', '68', 0),
(3489, 220, 'Kirovohrads\'ka Oblast\'', '35', 0),
(3490, 220, 'Kyiv', '30', 0),
(3491, 220, 'Kyivs\'ka Oblast\'', '32', 0),
(3492, 220, 'Luhans\'ka Oblast\'', '09', 0),
(3493, 220, 'L\'vivs\'ka Oblast\'', '46', 0),
(3494, 220, 'Mykolayivs\'ka Oblast\'', '48', 0),
(3495, 220, 'Odes\'ka Oblast\'', '51', 0),
(3496, 220, 'Poltavs\'ka Oblast\'', '53', 0),
(3497, 220, 'Rivnens\'ka Oblast\'', '56', 0),
(3498, 220, 'Sevastopol\'', '40', 0),
(3499, 220, 'Sums\'ka Oblast\'', '59', 0),
(3500, 220, 'Ternopil\'s\'ka Oblast\'', '61', 0),
(3501, 220, 'Vinnyts\'ka Oblast\'', '05', 0),
(3502, 220, 'Volyns\'ka Oblast\'', '07', 0),
(3503, 220, 'Zakarpats\'ka Oblast\'', '21', 0),
(3504, 220, 'Zaporiz\'ka Oblast\'', '23', 0),
(3505, 220, 'Zhytomyrs\'ka oblast\'', '18', 0),
(3506, 221, 'Abu Dhabi', 'ADH', 0),
(3507, 221, '\'Ajman', 'AJ', 0),
(3508, 221, 'Al Fujayrah', 'FU', 0),
(3509, 221, 'Ash Shariqah', 'SH', 0),
(3510, 221, 'Dubai', 'DU', 0),
(3511, 221, 'R\'as al Khaymah', 'RK', 0),
(3512, 221, 'Umm al Qaywayn', 'UQ', 0),
(3513, 222, 'Aberdeen', 'ABN', 0),
(3514, 222, 'Aberdeenshire', 'ABNS', 0),
(3515, 222, 'Anglesey', 'ANG', 0),
(3516, 222, 'Angus', 'AGS', 0),
(3517, 222, 'Argyll and Bute', 'ARY', 0),
(3518, 222, 'Bedfordshire', 'BEDS', 0),
(3519, 222, 'Berkshire', 'BERKS', 0),
(3520, 222, 'Blaenau Gwent', 'BLA', 0),
(3521, 222, 'Bridgend', 'BRI', 0),
(3522, 222, 'Bristol', 'BSTL', 0),
(3523, 222, 'Buckinghamshire', 'BUCKS', 0),
(3524, 222, 'Caerphilly', 'CAE', 0),
(3525, 222, 'Cambridgeshire', 'CAMBS', 0),
(3526, 222, 'Cardiff', 'CDF', 0),
(3527, 222, 'Carmarthenshire', 'CARM', 0),
(3528, 222, 'Ceredigion', 'CDGN', 0),
(3529, 222, 'Cheshire', 'CHES', 0),
(3530, 222, 'Clackmannanshire', 'CLACK', 0),
(3531, 222, 'Conwy', 'CON', 0),
(3532, 222, 'Cornwall', 'CORN', 0),
(3533, 222, 'Denbighshire', 'DNBG', 0),
(3534, 222, 'Derbyshire', 'DERBY', 0),
(3535, 222, 'Devon', 'DVN', 0),
(3536, 222, 'Dorset', 'DOR', 0),
(3537, 222, 'Dumfries and Galloway', 'DGL', 0),
(3538, 222, 'Dundee', 'DUND', 0),
(3539, 222, 'Durham', 'DHM', 0),
(3540, 222, 'East Ayrshire', 'ARYE', 0),
(3541, 222, 'East Dunbartonshire', 'DUNBE', 0),
(3542, 222, 'East Lothian', 'LOTE', 0),
(3543, 222, 'East Renfrewshire', 'RENE', 0),
(3544, 222, 'East Riding of Yorkshire', 'ERYS', 0),
(3545, 222, 'East Sussex', 'SXE', 0),
(3546, 222, 'Edinburgh', 'EDIN', 0),
(3547, 222, 'Essex', 'ESX', 0),
(3548, 222, 'Falkirk', 'FALK', 0),
(3549, 222, 'Fife', 'FFE', 0),
(3550, 222, 'Flintshire', 'FLINT', 0),
(3551, 222, 'Glasgow', 'GLAS', 0),
(3552, 222, 'Gloucestershire', 'GLOS', 0),
(3553, 222, 'Greater London', 'LDN', 0),
(3554, 222, 'Greater Manchester', 'MCH', 0),
(3555, 222, 'Gwynedd', 'GDD', 0),
(3556, 222, 'Hampshire', 'HANTS', 0),
(3557, 222, 'Herefordshire', 'HWR', 0),
(3558, 222, 'Hertfordshire', 'HERTS', 0),
(3559, 222, 'Highlands', 'HLD', 0),
(3560, 222, 'Inverclyde', 'IVER', 0),
(3561, 222, 'Isle of Wight', 'IOW', 0),
(3562, 222, 'Kent', 'KNT', 0),
(3563, 222, 'Lancashire', 'LANCS', 0),
(3564, 222, 'Leicestershire', 'LEICS', 0),
(3565, 222, 'Lincolnshire', 'LINCS', 0),
(3566, 222, 'Merseyside', 'MSY', 0),
(3567, 222, 'Merthyr Tydfil', 'MERT', 0),
(3568, 222, 'Midlothian', 'MLOT', 0),
(3569, 222, 'Monmouthshire', 'MMOUTH', 0),
(3570, 222, 'Moray', 'MORAY', 0),
(3571, 222, 'Neath Port Talbot', 'NPRTAL', 0),
(3572, 222, 'Newport', 'NEWPT', 0),
(3573, 222, 'Norfolk', 'NOR', 0),
(3574, 222, 'North Ayrshire', 'ARYN', 0),
(3575, 222, 'North Lanarkshire', 'LANN', 0),
(3576, 222, 'North Yorkshire', 'YSN', 0),
(3577, 222, 'Northamptonshire', 'NHM', 0),
(3578, 222, 'Northumberland', 'NLD', 0),
(3579, 222, 'Nottinghamshire', 'NOT', 0),
(3580, 222, 'Orkney Islands', 'ORK', 0),
(3581, 222, 'Oxfordshire', 'OFE', 0),
(3582, 222, 'Pembrokeshire', 'PEM', 0),
(3583, 222, 'Perth and Kinross', 'PERTH', 0),
(3584, 222, 'Powys', 'PWS', 0),
(3585, 222, 'Renfrewshire', 'REN', 0),
(3586, 222, 'Rhondda Cynon Taff', 'RHON', 0),
(3587, 222, 'Rutland', 'RUT', 0),
(3588, 222, 'Scottish Borders', 'BOR', 0),
(3589, 222, 'Shetland Islands', 'SHET', 0),
(3590, 222, 'Shropshire', 'SPE', 0),
(3591, 222, 'Somerset', 'SOM', 0),
(3592, 222, 'South Ayrshire', 'ARYS', 0),
(3593, 222, 'South Lanarkshire', 'LANS', 0),
(3594, 222, 'South Yorkshire', 'YSS', 0),
(3595, 222, 'Staffordshire', 'SFD', 0),
(3596, 222, 'Stirling', 'STIR', 0),
(3597, 222, 'Suffolk', 'SFK', 0),
(3598, 222, 'Surrey', 'SRY', 0),
(3599, 222, 'Swansea', 'SWAN', 0),
(3600, 222, 'Torfaen', 'TORF', 0),
(3601, 222, 'Tyne and Wear', 'TWR', 0),
(3602, 222, 'Vale of Glamorgan', 'VGLAM', 0),
(3603, 222, 'Warwickshire', 'WARKS', 0),
(3604, 222, 'West Dunbartonshire', 'WDUN', 0),
(3605, 222, 'West Lothian', 'WLOT', 0),
(3606, 222, 'West Midlands', 'WMD', 0),
(3607, 222, 'West Sussex', 'SXW', 0),
(3608, 222, 'West Yorkshire', 'YSW', 0),
(3609, 222, 'Western Isles', 'WIL', 0),
(3610, 222, 'Wiltshire', 'WLT', 0),
(3611, 222, 'Worcestershire', 'WORCS', 0),
(3612, 222, 'Wrexham', 'WRX', 0),
(3613, 223, 'Alabama', 'AL', 0),
(3614, 223, 'Alaska', 'AK', 0),
(3615, 223, 'American Samoa', 'AS', 0),
(3616, 223, 'Arizona', 'AZ', 0),
(3617, 223, 'Arkansas', 'AR', 0),
(3618, 223, 'Armed Forces Africa', 'AF', 0),
(3619, 223, 'Armed Forces Americas', 'AA', 0),
(3620, 223, 'Armed Forces Canada', 'AC', 0),
(3621, 223, 'Armed Forces Europe', 'AE', 0),
(3622, 223, 'Armed Forces Middle East', 'AM', 0),
(3623, 223, 'Armed Forces Pacific', 'AP', 0),
(3624, 223, 'California', 'CA', 0),
(3625, 223, 'Colorado', 'CO', 0),
(3626, 223, 'Connecticut', 'CT', 0),
(3627, 223, 'Delaware', 'DE', 0),
(3628, 223, 'District of Columbia', 'DC', 0),
(3629, 223, 'Federated States Of Micronesia', 'FM', 0),
(3630, 223, 'Florida', 'FL', 0),
(3631, 223, 'Georgia', 'GA', 0),
(3632, 223, 'Guam', 'GU', 0),
(3633, 223, 'Hawaii', 'HI', 0),
(3634, 223, 'Idaho', 'ID', 0),
(3635, 223, 'Illinois', 'IL', 0),
(3636, 223, 'Indiana', 'IN', 0),
(3637, 223, 'Iowa', 'IA', 0),
(3638, 223, 'Kansas', 'KS', 0),
(3639, 223, 'Kentucky', 'KY', 0),
(3640, 223, 'Louisiana', 'LA', 0),
(3641, 223, 'Maine', 'ME', 0),
(3642, 223, 'Marshall Islands', 'MH', 0),
(3643, 223, 'Maryland', 'MD', 0),
(3644, 223, 'Massachusetts', 'MA', 0),
(3645, 223, 'Michigan', 'MI', 0),
(3646, 223, 'Minnesota', 'MN', 0),
(3647, 223, 'Mississippi', 'MS', 0),
(3648, 223, 'Missouri', 'MO', 0),
(3649, 223, 'Montana', 'MT', 0),
(3650, 223, 'Nebraska', 'NE', 0),
(3651, 223, 'Nevada', 'NV', 0),
(3652, 223, 'New Hampshire', 'NH', 0),
(3653, 223, 'New Jersey', 'NJ', 0),
(3654, 223, 'New Mexico', 'NM', 0),
(3655, 223, 'New York', 'NY', 0),
(3656, 223, 'North Carolina', 'NC', 0),
(3657, 223, 'North Dakota', 'ND', 0),
(3658, 223, 'Northern Mariana Islands', 'MP', 0),
(3659, 223, 'Ohio', 'OH', 0),
(3660, 223, 'Oklahoma', 'OK', 0),
(3661, 223, 'Oregon', 'OR', 0),
(3662, 223, 'Palau', 'PW', 0),
(3663, 223, 'Pennsylvania', 'PA', 0),
(3664, 223, 'Puerto Rico', 'PR', 0),
(3665, 223, 'Rhode Island', 'RI', 0),
(3666, 223, 'South Carolina', 'SC', 0),
(3667, 223, 'South Dakota', 'SD', 0),
(3668, 223, 'Tennessee', 'TN', 0),
(3669, 223, 'Texas', 'TX', 0),
(3670, 223, 'Utah', 'UT', 0),
(3671, 223, 'Vermont', 'VT', 0),
(3672, 223, 'Virgin Islands', 'VI', 0),
(3673, 223, 'Virginia', 'VA', 0),
(3674, 223, 'Washington', 'WA', 0),
(3675, 223, 'West Virginia', 'WV', 0),
(3676, 223, 'Wisconsin', 'WI', 0),
(3677, 223, 'Wyoming', 'WY', 0),
(3678, 224, 'Baker Island', 'BI', 0),
(3679, 224, 'Howland Island', 'HI', 0),
(3680, 224, 'Jarvis Island', 'JI', 0),
(3681, 224, 'Johnston Atoll', 'JA', 0),
(3682, 224, 'Kingman Reef', 'KR', 0),
(3683, 224, 'Midway Atoll', 'MA', 0),
(3684, 224, 'Navassa Island', 'NI', 0),
(3685, 224, 'Palmyra Atoll', 'PA', 0),
(3686, 224, 'Wake Island', 'WI', 0),
(3687, 225, 'Artigas', 'AR', 0),
(3688, 225, 'Canelones', 'CA', 0),
(3689, 225, 'Cerro Largo', 'CL', 0),
(3690, 225, 'Colonia', 'CO', 0),
(3691, 225, 'Durazno', 'DU', 0),
(3692, 225, 'Flores', 'FS', 0),
(3693, 225, 'Florida', 'FA', 0),
(3694, 225, 'Lavalleja', 'LA', 0),
(3695, 225, 'Maldonado', 'MA', 0),
(3696, 225, 'Montevideo', 'MO', 0),
(3697, 225, 'Paysandu', 'PA', 0),
(3698, 225, 'Rio Negro', 'RN', 0),
(3699, 225, 'Rivera', 'RV', 0),
(3700, 225, 'Rocha', 'RO', 0),
(3701, 225, 'Salto', 'SL', 0),
(3702, 225, 'San Jose', 'SJ', 0),
(3703, 225, 'Soriano', 'SO', 0),
(3704, 225, 'Tacuarembo', 'TA', 0),
(3705, 225, 'Treinta y Tres', 'TT', 0),
(3706, 226, 'Andijon', 'AN', 0),
(3707, 226, 'Buxoro', 'BU', 0),
(3708, 226, 'Farg\'ona', 'FA', 0),
(3709, 226, 'Jizzax', 'JI', 0),
(3710, 226, 'Namangan', 'NG', 0),
(3711, 226, 'Navoiy', 'NW', 0),
(3712, 226, 'Qashqadaryo', 'QA', 0),
(3713, 226, 'Qoraqalpog\'iston Republikasi', 'QR', 0),
(3714, 226, 'Samarqand', 'SA', 0),
(3715, 226, 'Sirdaryo', 'SI', 0),
(3716, 226, 'Surxondaryo', 'SU', 0),
(3717, 226, 'Toshkent City', 'TK', 0),
(3718, 226, 'Toshkent Region', 'TO', 0),
(3719, 226, 'Xorazm', 'XO', 0),
(3720, 227, 'Malampa', 'MA', 0),
(3721, 227, 'Penama', 'PE', 0),
(3722, 227, 'Sanma', 'SA', 0),
(3723, 227, 'Shefa', 'SH', 0),
(3724, 227, 'Tafea', 'TA', 0),
(3725, 227, 'Torba', 'TO', 0),
(3726, 229, 'Amazonas', 'AM', 0),
(3727, 229, 'Anzoategui', 'AN', 0),
(3728, 229, 'Apure', 'AP', 0),
(3729, 229, 'Aragua', 'AR', 0),
(3730, 229, 'Barinas', 'BA', 0),
(3731, 229, 'Bolivar', 'BO', 0),
(3732, 229, 'Carabobo', 'CA', 0),
(3733, 229, 'Cojedes', 'CO', 0),
(3734, 229, 'Delta Amacuro', 'DA', 0),
(3735, 229, 'Dependencias Federales', 'DF', 0),
(3736, 229, 'Distrito Federal', 'DI', 0),
(3737, 229, 'Falcon', 'FA', 0),
(3738, 229, 'Guarico', 'GU', 0),
(3739, 229, 'Lara', 'LA', 0),
(3740, 229, 'Merida', 'ME', 0),
(3741, 229, 'Miranda', 'MI', 0),
(3742, 229, 'Monagas', 'MO', 0),
(3743, 229, 'Nueva Esparta', 'NE', 0),
(3744, 229, 'Portuguesa', 'PO', 0),
(3745, 229, 'Sucre', 'SU', 0),
(3746, 229, 'Tachira', 'TA', 0),
(3747, 229, 'Trujillo', 'TR', 0),
(3748, 229, 'Vargas', 'VA', 0),
(3749, 229, 'Yaracuy', 'YA', 0),
(3750, 229, 'Zulia', 'ZU', 0),
(3751, 230, 'An Giang', 'AG', 0),
(3752, 230, 'Bac Giang', 'BG', 0),
(3753, 230, 'Bac Kan', 'BK', 0),
(3754, 230, 'Bac Lieu', 'BL', 0),
(3755, 230, 'Bac Ninh', 'BC', 0),
(3756, 230, 'Ba Ria-Vung Tau', 'BR', 0),
(3757, 230, 'Ben Tre', 'BN', 0),
(3758, 230, 'Binh Dinh', 'BH', 0),
(3759, 230, 'Binh Duong', 'BU', 0),
(3760, 230, 'Binh Phuoc', 'BP', 0),
(3761, 230, 'Binh Thuan', 'BT', 0),
(3762, 230, 'Ca Mau', 'CM', 0),
(3763, 230, 'Can Tho', 'CT', 0),
(3764, 230, 'Cao Bang', 'CB', 0),
(3765, 230, 'Dak Lak', 'DL', 0),
(3766, 230, 'Dak Nong', 'DG', 0),
(3767, 230, 'Da Nang', 'DN', 0),
(3768, 230, 'Dien Bien', 'DB', 0),
(3769, 230, 'Dong Nai', 'DI', 0),
(3770, 230, 'Dong Thap', 'DT', 0),
(3771, 230, 'Gia Lai', 'GL', 0),
(3772, 230, 'Ha Giang', 'HG', 0),
(3773, 230, 'Hai Duong', 'HD', 0),
(3774, 230, 'Hai Phong', 'HP', 0),
(3775, 230, 'Ha Nam', 'HM', 0),
(3776, 230, 'Ha Noi', 'HI', 0),
(3777, 230, 'Ha Tay', 'HT', 0),
(3778, 230, 'Ha Tinh', 'HH', 0),
(3779, 230, 'Hoa Binh', 'HB', 0),
(3780, 230, 'Ho Chi Minh City', 'HC', 0),
(3781, 230, 'Hau Giang', 'HU', 0),
(3782, 230, 'Hung Yen', 'HY', 0),
(3783, 232, 'Saint Croix', 'C', 0),
(3784, 232, 'Saint John', 'J', 0),
(3785, 232, 'Saint Thomas', 'T', 0),
(3786, 233, 'Alo', 'A', 0),
(3787, 233, 'Sigave', 'S', 0),
(3788, 233, 'Wallis', 'W', 0),
(3789, 235, 'Abyan', 'AB', 0),
(3790, 235, 'Adan', 'AD', 0),
(3791, 235, 'Amran', 'AM', 0),
(3792, 235, 'Al Bayda', 'BA', 0),
(3793, 235, 'Ad Dali', 'DA', 0),
(3794, 235, 'Dhamar', 'DH', 0),
(3795, 235, 'Hadramawt', 'HD', 0),
(3796, 235, 'Hajjah', 'HJ', 0),
(3797, 235, 'Al Hudaydah', 'HU', 0),
(3798, 235, 'Ibb', 'IB', 0),
(3799, 235, 'Al Jawf', 'JA', 0),
(3800, 235, 'Lahij', 'LA', 0),
(3801, 235, 'Ma\'rib', 'MA', 0),
(3802, 235, 'Al Mahrah', 'MR', 0),
(3803, 235, 'Al Mahwit', 'MW', 0),
(3804, 235, 'Sa\'dah', 'SD', 0),
(3805, 235, 'San\'a', 'SN', 0),
(3806, 235, 'Shabwah', 'SH', 0),
(3807, 235, 'Ta\'izz', 'TA', 0),
(3812, 237, 'Bas-Congo', 'BC', 0),
(3813, 237, 'Bandundu', 'BN', 0),
(3814, 237, 'Equateur', 'EQ', 0),
(3815, 237, 'Katanga', 'KA', 0),
(3816, 237, 'Kasai-Oriental', 'KE', 0),
(3817, 237, 'Kinshasa', 'KN', 0),
(3818, 237, 'Kasai-Occidental', 'KW', 0),
(3819, 237, 'Maniema', 'MA', 0),
(3820, 237, 'Nord-Kivu', 'NK', 0),
(3821, 237, 'Orientale', 'OR', 0),
(3822, 237, 'Sud-Kivu', 'SK', 0),
(3823, 238, 'Central', 'CE', 0),
(3824, 238, 'Copperbelt', 'CB', 0),
(3825, 238, 'Eastern', 'EA', 0),
(3826, 238, 'Luapula', 'LP', 0),
(3827, 238, 'Lusaka', 'LK', 0),
(3828, 238, 'Northern', 'NO', 0),
(3829, 238, 'North-Western', 'NW', 0),
(3830, 238, 'Southern', 'SO', 0),
(3831, 238, 'Western', 'WE', 0),
(3832, 239, 'Bulawayo', 'BU', 0),
(3833, 239, 'Harare', 'HA', 0),
(3834, 239, 'Manicaland', 'ML', 0),
(3835, 239, 'Mashonaland Central', 'MC', 0),
(3836, 239, 'Mashonaland East', 'ME', 0),
(3837, 239, 'Mashonaland West', 'MW', 0),
(3838, 239, 'Masvingo', 'MV', 0),
(3839, 239, 'Matabeleland North', 'MN', 0),
(3840, 239, 'Matabeleland South', 'MS', 0),
(3841, 239, 'Midlands', 'MD', 0),
(3861, 105, 'Campobasso', 'CB', 0),
(3862, 105, 'Carbonia-Iglesias', 'CI', 0),
(3863, 105, 'Caserta', 'CE', 0),
(3864, 105, 'Catania', 'CT', 0),
(3865, 105, 'Catanzaro', 'CZ', 0),
(3866, 105, 'Chieti', 'CH', 0),
(3867, 105, 'Como', 'CO', 0),
(3868, 105, 'Cosenza', 'CS', 0),
(3869, 105, 'Cremona', 'CR', 0),
(3870, 105, 'Crotone', 'KR', 0),
(3871, 105, 'Cuneo', 'CN', 0),
(3872, 105, 'Enna', 'EN', 0),
(3873, 105, 'Ferrara', 'FE', 0),
(3874, 105, 'Firenze', 'FI', 0),
(3875, 105, 'Foggia', 'FG', 0),
(3876, 105, 'Forli-Cesena', 'FC', 0),
(3877, 105, 'Frosinone', 'FR', 0),
(3878, 105, 'Genova', 'GE', 0),
(3879, 105, 'Gorizia', 'GO', 0),
(3880, 105, 'Grosseto', 'GR', 0),
(3881, 105, 'Imperia', 'IM', 0),
(3882, 105, 'Isernia', 'IS', 0),
(3883, 105, 'L&#39;Aquila', 'AQ', 0),
(3884, 105, 'La Spezia', 'SP', 0),
(3885, 105, 'Latina', 'LT', 0),
(3886, 105, 'Lecce', 'LE', 0),
(3887, 105, 'Lecco', 'LC', 0),
(3888, 105, 'Livorno', 'LI', 0),
(3889, 105, 'Lodi', 'LO', 0),
(3890, 105, 'Lucca', 'LU', 0),
(3891, 105, 'Macerata', 'MC', 0),
(3892, 105, 'Mantova', 'MN', 0),
(3893, 105, 'Massa-Carrara', 'MS', 0),
(3894, 105, 'Matera', 'MT', 0),
(3895, 105, 'Medio Campidano', 'VS', 0),
(3896, 105, 'Messina', 'ME', 0),
(3897, 105, 'Milano', 'MI', 0),
(3898, 105, 'Modena', 'MO', 0),
(3899, 105, 'Napoli', 'NA', 0),
(3900, 105, 'Novara', 'NO', 0),
(3901, 105, 'Nuoro', 'NU', 0),
(3902, 105, 'Ogliastra', 'OG', 0),
(3903, 105, 'Olbia-Tempio', 'OT', 0),
(3904, 105, 'Oristano', 'OR', 0),
(3905, 105, 'Padova', 'PD', 0),
(3906, 105, 'Palermo', 'PA', 0),
(3907, 105, 'Parma', 'PR', 0),
(3908, 105, 'Pavia', 'PV', 0),
(3909, 105, 'Perugia', 'PG', 0),
(3910, 105, 'Pesaro e Urbino', 'PU', 0),
(3911, 105, 'Pescara', 'PE', 0),
(3912, 105, 'Piacenza', 'PC', 0),
(3913, 105, 'Pisa', 'PI', 0),
(3914, 105, 'Pistoia', 'PT', 0),
(3915, 105, 'Pordenone', 'PN', 0),
(3916, 105, 'Potenza', 'PZ', 0),
(3917, 105, 'Prato', 'PO', 0),
(3918, 105, 'Ragusa', 'RG', 0),
(3919, 105, 'Ravenna', 'RA', 0),
(3920, 105, 'Reggio Calabria', 'RC', 0),
(3921, 105, 'Reggio Emilia', 'RE', 0),
(3922, 105, 'Rieti', 'RI', 0),
(3923, 105, 'Rimini', 'RN', 0),
(3924, 105, 'Roma', 'RM', 0),
(3925, 105, 'Rovigo', 'RO', 0),
(3926, 105, 'Salerno', 'SA', 0),
(3927, 105, 'Sassari', 'SS', 0),
(3928, 105, 'Savona', 'SV', 0),
(3929, 105, 'Siena', 'SI', 0),
(3930, 105, 'Siracusa', 'SR', 0),
(3931, 105, 'Sondrio', 'SO', 0),
(3932, 105, 'Taranto', 'TA', 0),
(3933, 105, 'Teramo', 'TE', 0),
(3934, 105, 'Terni', 'TR', 0),
(3935, 105, 'Torino', 'TO', 0),
(3936, 105, 'Trapani', 'TP', 0),
(3937, 105, 'Trento', 'TN', 0),
(3938, 105, 'Treviso', 'TV', 0),
(3939, 105, 'Trieste', 'TS', 0),
(3940, 105, 'Udine', 'UD', 0),
(3941, 105, 'Varese', 'VA', 0),
(3942, 105, 'Venezia', 'VE', 0),
(3943, 105, 'Verbano-Cusio-Ossola', 'VB', 0),
(3944, 105, 'Vercelli', 'VC', 0),
(3945, 105, 'Verona', 'VR', 0),
(3946, 105, 'Vibo Valentia', 'VV', 0),
(3947, 105, 'Vicenza', 'VI', 0),
(3948, 105, 'Viterbo', 'VT', 0),
(3949, 222, 'County Antrim', 'ANT', 0),
(3950, 222, 'County Armagh', 'ARM', 0),
(3951, 222, 'County Down', 'DOW', 0),
(3952, 222, 'County Fermanagh', 'FER', 0),
(3953, 222, 'County Londonderry', 'LDY', 0),
(3954, 222, 'County Tyrone', 'TYR', 0),
(3955, 222, 'Cumbria', 'CMA', 0),
(3956, 190, 'Pomurska', '1', 0),
(3957, 190, 'Podravska', '2', 0),
(3958, 190, 'Koroška', '3', 0),
(3959, 190, 'Savinjska', '4', 0),
(3960, 190, 'Zasavska', '5', 0),
(3961, 190, 'Spodnjeposavska', '6', 0),
(3962, 190, 'Jugovzhodna Slovenija', '7', 0),
(3963, 190, 'Osrednjeslovenska', '8', 0),
(3964, 190, 'Gorenjska', '9', 0),
(3965, 190, 'Notranjsko-kraška', '10', 0),
(3966, 190, 'Goriška', '11', 0),
(3967, 190, 'Obalno-kraška', '12', 0),
(3968, 33, 'Ruse', '', 0),
(3969, 101, 'Alborz', 'ALB', 0),
(3970, 21, 'Brussels-Capital Region', 'BRU', 0),
(3971, 138, 'Aguascalientes', 'AG', 0),
(3973, 242, 'Andrijevica', '01', 0),
(3974, 242, 'Bar', '02', 0),
(3975, 242, 'Berane', '03', 0),
(3976, 242, 'Bijelo Polje', '04', 0),
(3977, 242, 'Budva', '05', 0),
(3978, 242, 'Cetinje', '06', 0),
(3979, 242, 'Danilovgrad', '07', 0),
(3980, 242, 'Herceg-Novi', '08', 0),
(3981, 242, 'Kolašin', '09', 0),
(3982, 242, 'Kotor', '10', 0),
(3983, 242, 'Mojkovac', '11', 0),
(3984, 242, 'Nikšić', '12', 0),
(3985, 242, 'Plav', '13', 0),
(3986, 242, 'Pljevlja', '14', 0),
(3987, 242, 'Plužine', '15', 0),
(3988, 242, 'Podgorica', '16', 0),
(3989, 242, 'Rožaje', '17', 0),
(3990, 242, 'Šavnik', '18', 0),
(3991, 242, 'Tivat', '19', 0),
(3992, 242, 'Ulcinj', '20', 0),
(3993, 242, 'Žabljak', '21', 0),
(3994, 243, 'Belgrade', '00', 0),
(3995, 243, 'North Bačka', '01', 0),
(3996, 243, 'Central Banat', '02', 0),
(3997, 243, 'North Banat', '03', 0),
(3998, 243, 'South Banat', '04', 0),
(3999, 243, 'West Bačka', '05', 0),
(4000, 243, 'South Bačka', '06', 0),
(4001, 243, 'Srem', '07', 0),
(4002, 243, 'Mačva', '08', 0),
(4003, 243, 'Kolubara', '09', 0),
(4004, 243, 'Podunavlje', '10', 0),
(4005, 243, 'Braničevo', '11', 0),
(4006, 243, 'Šumadija', '12', 0),
(4007, 243, 'Pomoravlje', '13', 0),
(4008, 243, 'Bor', '14', 0),
(4009, 243, 'Zaječar', '15', 0),
(4010, 243, 'Zlatibor', '16', 0),
(4011, 243, 'Moravica', '17', 0),
(4012, 243, 'Raška', '18', 0),
(4013, 243, 'Rasina', '19', 0),
(4014, 243, 'Nišava', '20', 0),
(4015, 243, 'Toplica', '21', 0),
(4016, 243, 'Pirot', '22', 0),
(4017, 243, 'Jablanica', '23', 0),
(4018, 243, 'Pčinja', '24', 0),
(4020, 245, 'Bonaire', 'BO', 0),
(4021, 245, 'Saba', 'SA', 0),
(4022, 245, 'Sint Eustatius', 'SE', 0),
(4023, 248, 'Central Equatoria', 'EC', 0),
(4024, 248, 'Eastern Equatoria', 'EE', 0),
(4025, 248, 'Jonglei', 'JG', 0),
(4026, 248, 'Lakes', 'LK', 0),
(4027, 248, 'Northern Bahr el-Ghazal', 'BN', 0),
(4028, 248, 'Unity', 'UY', 0),
(4029, 248, 'Upper Nile', 'NU', 0),
(4030, 248, 'Warrap', 'WR', 0),
(4031, 248, 'Western Bahr el-Ghazal', 'BW', 0),
(4032, 248, 'Western Equatoria', 'EW', 0),
(4036, 117, 'Ainaži, Salacgrīvas novads', '0661405', 0),
(4037, 117, 'Aizkraukle, Aizkraukles novads', '0320201', 0),
(4038, 117, 'Aizkraukles novads', '0320200', 0),
(4039, 117, 'Aizpute, Aizputes novads', '0640605', 0),
(4040, 117, 'Aizputes novads', '0640600', 0),
(4041, 117, 'Aknīste, Aknīstes novads', '0560805', 0),
(4042, 117, 'Aknīstes novads', '0560800', 0),
(4043, 117, 'Aloja, Alojas novads', '0661007', 0),
(4044, 117, 'Alojas novads', '0661000', 0),
(4045, 117, 'Alsungas novads', '0624200', 0),
(4046, 117, 'Alūksne, Alūksnes novads', '0360201', 0),
(4047, 117, 'Alūksnes novads', '0360200', 0),
(4048, 117, 'Amatas novads', '0424701', 0),
(4049, 117, 'Ape, Apes novads', '0360805', 0),
(4050, 117, 'Apes novads', '0360800', 0),
(4051, 117, 'Auce, Auces novads', '0460805', 0),
(4052, 117, 'Auces novads', '0460800', 0),
(4053, 117, 'Ādažu novads', '0804400', 0),
(4054, 117, 'Babītes novads', '0804900', 0),
(4055, 117, 'Baldone, Baldones novads', '0800605', 0),
(4056, 117, 'Baldones novads', '0800600', 0),
(4057, 117, 'Baloži, Ķekavas novads', '0800807', 0),
(4058, 117, 'Baltinavas novads', '0384400', 0),
(4059, 117, 'Balvi, Balvu novads', '0380201', 0),
(4060, 117, 'Balvu novads', '0380200', 0),
(4061, 117, 'Bauska, Bauskas novads', '0400201', 0),
(4062, 117, 'Bauskas novads', '0400200', 0),
(4063, 117, 'Beverīnas novads', '0964700', 0),
(4064, 117, 'Brocēni, Brocēnu novads', '0840605', 0),
(4065, 117, 'Brocēnu novads', '0840601', 0),
(4066, 117, 'Burtnieku novads', '0967101', 0),
(4067, 117, 'Carnikavas novads', '0805200', 0),
(4068, 117, 'Cesvaine, Cesvaines novads', '0700807', 0),
(4069, 117, 'Cesvaines novads', '0700800', 0),
(4070, 117, 'Cēsis, Cēsu novads', '0420201', 0),
(4071, 117, 'Cēsu novads', '0420200', 0),
(4072, 117, 'Ciblas novads', '0684901', 0),
(4073, 117, 'Dagda, Dagdas novads', '0601009', 0),
(4074, 117, 'Dagdas novads', '0601000', 0),
(4075, 117, 'Daugavpils', '0050000', 0),
(4076, 117, 'Daugavpils novads', '0440200', 0),
(4077, 117, 'Dobele, Dobeles novads', '0460201', 0),
(4078, 117, 'Dobeles novads', '0460200', 0),
(4079, 117, 'Dundagas novads', '0885100', 0),
(4080, 117, 'Durbe, Durbes novads', '0640807', 0),
(4081, 117, 'Durbes novads', '0640801', 0),
(4082, 117, 'Engures novads', '0905100', 0),
(4083, 117, 'Ērgļu novads', '0705500', 0),
(4084, 117, 'Garkalnes novads', '0806000', 0),
(4085, 117, 'Grobiņa, Grobiņas novads', '0641009', 0),
(4086, 117, 'Grobiņas novads', '0641000', 0),
(4087, 117, 'Gulbene, Gulbenes novads', '0500201', 0),
(4088, 117, 'Gulbenes novads', '0500200', 0),
(4089, 117, 'Iecavas novads', '0406400', 0),
(4090, 117, 'Ikšķile, Ikšķiles novads', '0740605', 0),
(4091, 117, 'Ikšķiles novads', '0740600', 0),
(4092, 117, 'Ilūkste, Ilūkstes novads', '0440807', 0),
(4093, 117, 'Ilūkstes novads', '0440801', 0),
(4094, 117, 'Inčukalna novads', '0801800', 0),
(4095, 117, 'Jaunjelgava, Jaunjelgavas novads', '0321007', 0),
(4096, 117, 'Jaunjelgavas novads', '0321000', 0),
(4097, 117, 'Jaunpiebalgas novads', '0425700', 0),
(4098, 117, 'Jaunpils novads', '0905700', 0),
(4099, 117, 'Jelgava', '0090000', 0),
(4100, 117, 'Jelgavas novads', '0540200', 0),
(4101, 117, 'Jēkabpils', '0110000', 0),
(4102, 117, 'Jēkabpils novads', '0560200', 0),
(4103, 117, 'Jūrmala', '0130000', 0),
(4104, 117, 'Kalnciems, Jelgavas novads', '0540211', 0),
(4105, 117, 'Kandava, Kandavas novads', '0901211', 0),
(4106, 117, 'Kandavas novads', '0901201', 0),
(4107, 117, 'Kārsava, Kārsavas novads', '0681009', 0),
(4108, 117, 'Kārsavas novads', '0681000', 0),
(4109, 117, 'Kocēnu novads ,bij. Valmieras)', '0960200', 0),
(4110, 117, 'Kokneses novads', '0326100', 0),
(4111, 117, 'Krāslava, Krāslavas novads', '0600201', 0),
(4112, 117, 'Krāslavas novads', '0600202', 0),
(4113, 117, 'Krimuldas novads', '0806900', 0),
(4114, 117, 'Krustpils novads', '0566900', 0),
(4115, 117, 'Kuldīga, Kuldīgas novads', '0620201', 0),
(4116, 117, 'Kuldīgas novads', '0620200', 0),
(4117, 117, 'Ķeguma novads', '0741001', 0),
(4118, 117, 'Ķegums, Ķeguma novads', '0741009', 0),
(4119, 117, 'Ķekavas novads', '0800800', 0),
(4120, 117, 'Lielvārde, Lielvārdes novads', '0741413', 0),
(4121, 117, 'Lielvārdes novads', '0741401', 0),
(4122, 117, 'Liepāja', '0170000', 0),
(4123, 117, 'Limbaži, Limbažu novads', '0660201', 0),
(4124, 117, 'Limbažu novads', '0660200', 0),
(4125, 117, 'Līgatne, Līgatnes novads', '0421211', 0),
(4126, 117, 'Līgatnes novads', '0421200', 0),
(4127, 117, 'Līvāni, Līvānu novads', '0761211', 0),
(4128, 117, 'Līvānu novads', '0761201', 0),
(4129, 117, 'Lubāna, Lubānas novads', '0701413', 0),
(4130, 117, 'Lubānas novads', '0701400', 0),
(4131, 117, 'Ludza, Ludzas novads', '0680201', 0),
(4132, 117, 'Ludzas novads', '0680200', 0),
(4133, 117, 'Madona, Madonas novads', '0700201', 0),
(4134, 117, 'Madonas novads', '0700200', 0),
(4135, 117, 'Mazsalaca, Mazsalacas novads', '0961011', 0),
(4136, 117, 'Mazsalacas novads', '0961000', 0),
(4137, 117, 'Mālpils novads', '0807400', 0),
(4138, 117, 'Mārupes novads', '0807600', 0),
(4139, 117, 'Mērsraga novads', '0887600', 0),
(4140, 117, 'Naukšēnu novads', '0967300', 0),
(4141, 117, 'Neretas novads', '0327100', 0),
(4142, 117, 'Nīcas novads', '0647900', 0),
(4143, 117, 'Ogre, Ogres novads', '0740201', 0),
(4144, 117, 'Ogres novads', '0740202', 0),
(4145, 117, 'Olaine, Olaines novads', '0801009', 0),
(4146, 117, 'Olaines novads', '0801000', 0),
(4147, 117, 'Ozolnieku novads', '0546701', 0),
(4148, 117, 'Pārgaujas novads', '0427500', 0),
(4149, 117, 'Pāvilosta, Pāvilostas novads', '0641413', 0),
(4150, 117, 'Pāvilostas novads', '0641401', 0),
(4151, 117, 'Piltene, Ventspils novads', '0980213', 0),
(4152, 117, 'Pļaviņas, Pļaviņu novads', '0321413', 0),
(4153, 117, 'Pļaviņu novads', '0321400', 0),
(4154, 117, 'Preiļi, Preiļu novads', '0760201', 0),
(4155, 117, 'Preiļu novads', '0760202', 0),
(4156, 117, 'Priekule, Priekules novads', '0641615', 0),
(4157, 117, 'Priekules novads', '0641600', 0),
(4158, 117, 'Priekuļu novads', '0427300', 0),
(4159, 117, 'Raunas novads', '0427700', 0),
(4160, 117, 'Rēzekne', '0210000', 0),
(4161, 117, 'Rēzeknes novads', '0780200', 0),
(4162, 117, 'Riebiņu novads', '0766300', 0),
(4163, 117, 'Rīga', '0010000', 0),
(4164, 117, 'Rojas novads', '0888300', 0),
(4165, 117, 'Ropažu novads', '0808400', 0),
(4166, 117, 'Rucavas novads', '0648500', 0),
(4167, 117, 'Rugāju novads', '0387500', 0),
(4168, 117, 'Rundāles novads', '0407700', 0),
(4169, 117, 'Rūjiena, Rūjienas novads', '0961615', 0),
(4170, 117, 'Rūjienas novads', '0961600', 0),
(4171, 117, 'Sabile, Talsu novads', '0880213', 0),
(4172, 117, 'Salacgrīva, Salacgrīvas novads', '0661415', 0),
(4173, 117, 'Salacgrīvas novads', '0661400', 0),
(4174, 117, 'Salas novads', '0568700', 0),
(4175, 117, 'Salaspils novads', '0801200', 0),
(4176, 117, 'Salaspils, Salaspils novads', '0801211', 0),
(4177, 117, 'Saldus novads', '0840200', 0),
(4178, 117, 'Saldus, Saldus novads', '0840201', 0),
(4179, 117, 'Saulkrasti, Saulkrastu novads', '0801413', 0),
(4180, 117, 'Saulkrastu novads', '0801400', 0),
(4181, 117, 'Seda, Strenču novads', '0941813', 0),
(4182, 117, 'Sējas novads', '0809200', 0),
(4183, 117, 'Sigulda, Siguldas novads', '0801615', 0),
(4184, 117, 'Siguldas novads', '0801601', 0),
(4185, 117, 'Skrīveru novads', '0328200', 0),
(4186, 117, 'Skrunda, Skrundas novads', '0621209', 0),
(4187, 117, 'Skrundas novads', '0621200', 0),
(4188, 117, 'Smiltene, Smiltenes novads', '0941615', 0),
(4189, 117, 'Smiltenes novads', '0941600', 0),
(4190, 117, 'Staicele, Alojas novads', '0661017', 0),
(4191, 117, 'Stende, Talsu novads', '0880215', 0),
(4192, 117, 'Stopiņu novads', '0809600', 0),
(4193, 117, 'Strenči, Strenču novads', '0941817', 0),
(4194, 117, 'Strenču novads', '0941800', 0),
(4195, 117, 'Subate, Ilūkstes novads', '0440815', 0),
(4196, 117, 'Talsi, Talsu novads', '0880201', 0),
(4197, 117, 'Talsu novads', '0880200', 0),
(4198, 117, 'Tērvetes novads', '0468900', 0),
(4199, 117, 'Tukuma novads', '0900200', 0),
(4200, 117, 'Tukums, Tukuma novads', '0900201', 0),
(4201, 117, 'Vaiņodes novads', '0649300', 0),
(4202, 117, 'Valdemārpils, Talsu novads', '0880217', 0),
(4203, 117, 'Valka, Valkas novads', '0940201', 0),
(4204, 117, 'Valkas novads', '0940200', 0),
(4205, 117, 'Valmiera', '0250000', 0),
(4206, 117, 'Vangaži, Inčukalna novads', '0801817', 0),
(4207, 117, 'Varakļāni, Varakļānu novads', '0701817', 0),
(4208, 117, 'Varakļānu novads', '0701800', 0),
(4209, 117, 'Vārkavas novads', '0769101', 0),
(4210, 117, 'Vecpiebalgas novads', '0429300', 0),
(4211, 117, 'Vecumnieku novads', '0409500', 0),
(4212, 117, 'Ventspils', '0270000', 0),
(4213, 117, 'Ventspils novads', '0980200', 0),
(4214, 117, 'Viesīte, Viesītes novads', '0561815', 0),
(4215, 117, 'Viesītes novads', '0561800', 0),
(4216, 117, 'Viļaka, Viļakas novads', '0381615', 0),
(4217, 117, 'Viļakas novads', '0381600', 0),
(4218, 117, 'Viļāni, Viļānu novads', '0781817', 0),
(4219, 117, 'Viļānu novads', '0781800', 0),
(4220, 117, 'Zilupe, Zilupes novads', '0681817', 0),
(4221, 117, 'Zilupes novads', '0681801', 0),
(4222, 43, 'Arica y Parinacota', 'AP', 0),
(4223, 43, 'Los Rios', 'LR', 0),
(4224, 220, 'Kharkivs\'ka Oblast\'', '63', 0),
(4225, 118, 'Beirut', 'LB-BR', 0),
(4226, 118, 'Bekaa', 'LB-BE', 0),
(4227, 118, 'Mount Lebanon', 'LB-ML', 0),
(4228, 118, 'Nabatieh', 'LB-NB', 0),
(4229, 118, 'North', 'LB-NR', 0),
(4230, 118, 'South', 'LB-ST', 0),
(4231, 99, 'Telangana', 'TS', 0),
(4232, 44, 'Qinghai', 'QH', 0),
(4233, 100, 'Papua Barat', 'PB', 0),
(4234, 100, 'Sulawesi Barat', 'SR', 0),
(4235, 100, 'Kepulauan Riau', 'KR', 0);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `oc_zone_to_geo_zone`
--

DROP TABLE IF EXISTS `oc_zone_to_geo_zone`;
CREATE TABLE `oc_zone_to_geo_zone` (
  `zone_to_geo_zone_id` int(11) NOT NULL,
  `country_id` int(11) NOT NULL,
  `zone_id` int(11) NOT NULL DEFAULT 0,
  `geo_zone_id` int(11) NOT NULL,
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `oc_zone_to_geo_zone`
--

INSERT INTO `oc_zone_to_geo_zone` (`zone_to_geo_zone_id`, `country_id`, `zone_id`, `geo_zone_id`, `date_added`, `date_modified`) VALUES
(307, 160, 0, 4, '2018-06-19 12:21:15', '0000-00-00 00:00:00'),
(298, 33, 0, 8, '2018-06-19 12:15:06', '0000-00-00 00:00:00'),
(304, 103, 0, 7, '2018-06-19 12:16:05', '0000-00-00 00:00:00'),
(285, 57, 0, 3, '2018-06-19 12:09:55', '0000-00-00 00:00:00'),
(292, 190, 0, 5, '2018-06-19 12:11:28', '0000-00-00 00:00:00'),
(294, 14, 0, 6, '2018-06-19 12:13:15', '0000-00-00 00:00:00'),
(284, 21, 0, 3, '2018-06-19 12:09:55', '0000-00-00 00:00:00'),
(291, 53, 0, 5, '2018-06-19 12:11:28', '0000-00-00 00:00:00'),
(286, 74, 0, 3, '2018-06-19 12:09:55', '0000-00-00 00:00:00'),
(287, 150, 0, 3, '2018-06-19 12:09:55', '0000-00-00 00:00:00'),
(288, 170, 0, 3, '2018-06-19 12:09:55', '0000-00-00 00:00:00'),
(289, 56, 0, 3, '2018-06-19 12:09:55', '0000-00-00 00:00:00'),
(290, 124, 0, 3, '2018-06-19 12:09:55', '0000-00-00 00:00:00'),
(293, 189, 0, 5, '2018-06-19 12:11:28', '0000-00-00 00:00:00'),
(295, 72, 0, 6, '2018-06-19 12:13:15', '0000-00-00 00:00:00'),
(296, 203, 0, 6, '2018-06-19 12:13:15', '0000-00-00 00:00:00'),
(297, 105, 0, 6, '2018-06-19 12:13:15', '0000-00-00 00:00:00'),
(299, 67, 0, 8, '2018-06-19 12:15:06', '0000-00-00 00:00:00'),
(300, 117, 0, 8, '2018-06-19 12:15:06', '0000-00-00 00:00:00'),
(301, 123, 0, 8, '2018-06-19 12:15:06', '0000-00-00 00:00:00'),
(302, 97, 0, 8, '2018-06-19 12:15:06', '0000-00-00 00:00:00'),
(303, 175, 0, 8, '2018-06-19 12:15:06', '0000-00-00 00:00:00'),
(305, 171, 0, 7, '2018-06-19 12:16:05', '0000-00-00 00:00:00'),
(306, 195, 0, 7, '2018-06-19 12:16:05', '0000-00-00 00:00:00'),
(308, 204, 0, 4, '2018-06-19 12:21:15', '0000-00-00 00:00:00'),
(309, 81, 0, 9, '2018-06-20 17:45:34', '0000-00-00 00:00:00');

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `oc_address`
--
ALTER TABLE `oc_address`
  ADD PRIMARY KEY (`address_id`),
  ADD KEY `customer_id` (`customer_id`);

--
-- Chỉ mục cho bảng `oc_affiliate`
--
ALTER TABLE `oc_affiliate`
  ADD PRIMARY KEY (`affiliate_id`);

--
-- Chỉ mục cho bảng `oc_affiliate_activity`
--
ALTER TABLE `oc_affiliate_activity`
  ADD PRIMARY KEY (`affiliate_activity_id`);

--
-- Chỉ mục cho bảng `oc_affiliate_login`
--
ALTER TABLE `oc_affiliate_login`
  ADD PRIMARY KEY (`affiliate_login_id`),
  ADD KEY `email` (`email`),
  ADD KEY `ip` (`ip`);

--
-- Chỉ mục cho bảng `oc_affiliate_transaction`
--
ALTER TABLE `oc_affiliate_transaction`
  ADD PRIMARY KEY (`affiliate_transaction_id`);

--
-- Chỉ mục cho bảng `oc_api`
--
ALTER TABLE `oc_api`
  ADD PRIMARY KEY (`api_id`);

--
-- Chỉ mục cho bảng `oc_api_ip`
--
ALTER TABLE `oc_api_ip`
  ADD PRIMARY KEY (`api_ip_id`);

--
-- Chỉ mục cho bảng `oc_api_session`
--
ALTER TABLE `oc_api_session`
  ADD PRIMARY KEY (`api_session_id`);

--
-- Chỉ mục cho bảng `oc_attribute`
--
ALTER TABLE `oc_attribute`
  ADD PRIMARY KEY (`attribute_id`);

--
-- Chỉ mục cho bảng `oc_attribute_description`
--
ALTER TABLE `oc_attribute_description`
  ADD PRIMARY KEY (`attribute_id`,`language_id`);

--
-- Chỉ mục cho bảng `oc_attribute_group`
--
ALTER TABLE `oc_attribute_group`
  ADD PRIMARY KEY (`attribute_group_id`);

--
-- Chỉ mục cho bảng `oc_attribute_group_description`
--
ALTER TABLE `oc_attribute_group_description`
  ADD PRIMARY KEY (`attribute_group_id`,`language_id`);

--
-- Chỉ mục cho bảng `oc_banner`
--
ALTER TABLE `oc_banner`
  ADD PRIMARY KEY (`banner_id`);

--
-- Chỉ mục cho bảng `oc_banner_image`
--
ALTER TABLE `oc_banner_image`
  ADD PRIMARY KEY (`banner_image_id`);

--
-- Chỉ mục cho bảng `oc_cart`
--
ALTER TABLE `oc_cart`
  ADD PRIMARY KEY (`cart_id`),
  ADD KEY `cart_id` (`api_id`,`customer_id`,`session_id`,`product_id`,`recurring_id`);

--
-- Chỉ mục cho bảng `oc_category`
--
ALTER TABLE `oc_category`
  ADD PRIMARY KEY (`category_id`),
  ADD KEY `parent_id` (`parent_id`);

--
-- Chỉ mục cho bảng `oc_category_description`
--
ALTER TABLE `oc_category_description`
  ADD PRIMARY KEY (`category_id`,`language_id`),
  ADD KEY `name` (`name`);

--
-- Chỉ mục cho bảng `oc_category_filter`
--
ALTER TABLE `oc_category_filter`
  ADD PRIMARY KEY (`category_id`,`filter_id`);

--
-- Chỉ mục cho bảng `oc_category_path`
--
ALTER TABLE `oc_category_path`
  ADD PRIMARY KEY (`category_id`,`path_id`);

--
-- Chỉ mục cho bảng `oc_category_to_layout`
--
ALTER TABLE `oc_category_to_layout`
  ADD PRIMARY KEY (`category_id`,`store_id`);

--
-- Chỉ mục cho bảng `oc_category_to_store`
--
ALTER TABLE `oc_category_to_store`
  ADD PRIMARY KEY (`category_id`,`store_id`);

--
-- Chỉ mục cho bảng `oc_country`
--
ALTER TABLE `oc_country`
  ADD PRIMARY KEY (`country_id`);

--
-- Chỉ mục cho bảng `oc_coupon`
--
ALTER TABLE `oc_coupon`
  ADD PRIMARY KEY (`coupon_id`);

--
-- Chỉ mục cho bảng `oc_coupon_category`
--
ALTER TABLE `oc_coupon_category`
  ADD PRIMARY KEY (`coupon_id`,`category_id`);

--
-- Chỉ mục cho bảng `oc_coupon_history`
--
ALTER TABLE `oc_coupon_history`
  ADD PRIMARY KEY (`coupon_history_id`);

--
-- Chỉ mục cho bảng `oc_coupon_product`
--
ALTER TABLE `oc_coupon_product`
  ADD PRIMARY KEY (`coupon_product_id`);

--
-- Chỉ mục cho bảng `oc_currency`
--
ALTER TABLE `oc_currency`
  ADD PRIMARY KEY (`currency_id`);

--
-- Chỉ mục cho bảng `oc_customer`
--
ALTER TABLE `oc_customer`
  ADD PRIMARY KEY (`customer_id`);

--
-- Chỉ mục cho bảng `oc_customer_activity`
--
ALTER TABLE `oc_customer_activity`
  ADD PRIMARY KEY (`customer_activity_id`);

--
-- Chỉ mục cho bảng `oc_customer_group`
--
ALTER TABLE `oc_customer_group`
  ADD PRIMARY KEY (`customer_group_id`);

--
-- Chỉ mục cho bảng `oc_customer_group_description`
--
ALTER TABLE `oc_customer_group_description`
  ADD PRIMARY KEY (`customer_group_id`,`language_id`);

--
-- Chỉ mục cho bảng `oc_customer_history`
--
ALTER TABLE `oc_customer_history`
  ADD PRIMARY KEY (`customer_history_id`);

--
-- Chỉ mục cho bảng `oc_customer_ip`
--
ALTER TABLE `oc_customer_ip`
  ADD PRIMARY KEY (`customer_ip_id`),
  ADD KEY `ip` (`ip`);

--
-- Chỉ mục cho bảng `oc_customer_login`
--
ALTER TABLE `oc_customer_login`
  ADD PRIMARY KEY (`customer_login_id`),
  ADD KEY `email` (`email`),
  ADD KEY `ip` (`ip`);

--
-- Chỉ mục cho bảng `oc_customer_online`
--
ALTER TABLE `oc_customer_online`
  ADD PRIMARY KEY (`ip`);

--
-- Chỉ mục cho bảng `oc_customer_reward`
--
ALTER TABLE `oc_customer_reward`
  ADD PRIMARY KEY (`customer_reward_id`);

--
-- Chỉ mục cho bảng `oc_customer_search`
--
ALTER TABLE `oc_customer_search`
  ADD PRIMARY KEY (`customer_search_id`);

--
-- Chỉ mục cho bảng `oc_customer_transaction`
--
ALTER TABLE `oc_customer_transaction`
  ADD PRIMARY KEY (`customer_transaction_id`);

--
-- Chỉ mục cho bảng `oc_customer_wishlist`
--
ALTER TABLE `oc_customer_wishlist`
  ADD PRIMARY KEY (`customer_id`,`product_id`);

--
-- Chỉ mục cho bảng `oc_custom_field`
--
ALTER TABLE `oc_custom_field`
  ADD PRIMARY KEY (`custom_field_id`);

--
-- Chỉ mục cho bảng `oc_custom_field_customer_group`
--
ALTER TABLE `oc_custom_field_customer_group`
  ADD PRIMARY KEY (`custom_field_id`,`customer_group_id`);

--
-- Chỉ mục cho bảng `oc_custom_field_description`
--
ALTER TABLE `oc_custom_field_description`
  ADD PRIMARY KEY (`custom_field_id`,`language_id`);

--
-- Chỉ mục cho bảng `oc_custom_field_value`
--
ALTER TABLE `oc_custom_field_value`
  ADD PRIMARY KEY (`custom_field_value_id`);

--
-- Chỉ mục cho bảng `oc_custom_field_value_description`
--
ALTER TABLE `oc_custom_field_value_description`
  ADD PRIMARY KEY (`custom_field_value_id`,`language_id`);

--
-- Chỉ mục cho bảng `oc_download`
--
ALTER TABLE `oc_download`
  ADD PRIMARY KEY (`download_id`);

--
-- Chỉ mục cho bảng `oc_download_description`
--
ALTER TABLE `oc_download_description`
  ADD PRIMARY KEY (`download_id`,`language_id`);

--
-- Chỉ mục cho bảng `oc_event`
--
ALTER TABLE `oc_event`
  ADD PRIMARY KEY (`event_id`);

--
-- Chỉ mục cho bảng `oc_extension`
--
ALTER TABLE `oc_extension`
  ADD PRIMARY KEY (`extension_id`);

--
-- Chỉ mục cho bảng `oc_filter`
--
ALTER TABLE `oc_filter`
  ADD PRIMARY KEY (`filter_id`);

--
-- Chỉ mục cho bảng `oc_filter_description`
--
ALTER TABLE `oc_filter_description`
  ADD PRIMARY KEY (`filter_id`,`language_id`);

--
-- Chỉ mục cho bảng `oc_filter_group`
--
ALTER TABLE `oc_filter_group`
  ADD PRIMARY KEY (`filter_group_id`);

--
-- Chỉ mục cho bảng `oc_filter_group_description`
--
ALTER TABLE `oc_filter_group_description`
  ADD PRIMARY KEY (`filter_group_id`,`language_id`);

--
-- Chỉ mục cho bảng `oc_gcrdev_sitemap`
--
ALTER TABLE `oc_gcrdev_sitemap`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `oc_geo_zone`
--
ALTER TABLE `oc_geo_zone`
  ADD PRIMARY KEY (`geo_zone_id`);

--
-- Chỉ mục cho bảng `oc_google_base_category`
--
ALTER TABLE `oc_google_base_category`
  ADD PRIMARY KEY (`google_base_category_id`);

--
-- Chỉ mục cho bảng `oc_google_base_category_to_category`
--
ALTER TABLE `oc_google_base_category_to_category`
  ADD PRIMARY KEY (`google_base_category_id`,`category_id`);

--
-- Chỉ mục cho bảng `oc_information`
--
ALTER TABLE `oc_information`
  ADD PRIMARY KEY (`information_id`);

--
-- Chỉ mục cho bảng `oc_information_description`
--
ALTER TABLE `oc_information_description`
  ADD PRIMARY KEY (`information_id`,`language_id`);

--
-- Chỉ mục cho bảng `oc_information_to_layout`
--
ALTER TABLE `oc_information_to_layout`
  ADD PRIMARY KEY (`information_id`,`store_id`);

--
-- Chỉ mục cho bảng `oc_information_to_store`
--
ALTER TABLE `oc_information_to_store`
  ADD PRIMARY KEY (`information_id`,`store_id`);

--
-- Chỉ mục cho bảng `oc_language`
--
ALTER TABLE `oc_language`
  ADD PRIMARY KEY (`language_id`),
  ADD KEY `name` (`name`);

--
-- Chỉ mục cho bảng `oc_layout`
--
ALTER TABLE `oc_layout`
  ADD PRIMARY KEY (`layout_id`);

--
-- Chỉ mục cho bảng `oc_layout_module`
--
ALTER TABLE `oc_layout_module`
  ADD PRIMARY KEY (`layout_module_id`);

--
-- Chỉ mục cho bảng `oc_layout_route`
--
ALTER TABLE `oc_layout_route`
  ADD PRIMARY KEY (`layout_route_id`);

--
-- Chỉ mục cho bảng `oc_length_class`
--
ALTER TABLE `oc_length_class`
  ADD PRIMARY KEY (`length_class_id`);

--
-- Chỉ mục cho bảng `oc_length_class_description`
--
ALTER TABLE `oc_length_class_description`
  ADD PRIMARY KEY (`length_class_id`,`language_id`);

--
-- Chỉ mục cho bảng `oc_location`
--
ALTER TABLE `oc_location`
  ADD PRIMARY KEY (`location_id`),
  ADD KEY `name` (`name`);

--
-- Chỉ mục cho bảng `oc_manufacturer`
--
ALTER TABLE `oc_manufacturer`
  ADD PRIMARY KEY (`manufacturer_id`);

--
-- Chỉ mục cho bảng `oc_manufacturer_to_store`
--
ALTER TABLE `oc_manufacturer_to_store`
  ADD PRIMARY KEY (`manufacturer_id`,`store_id`);

--
-- Chỉ mục cho bảng `oc_marketing`
--
ALTER TABLE `oc_marketing`
  ADD PRIMARY KEY (`marketing_id`);

--
-- Chỉ mục cho bảng `oc_menu`
--
ALTER TABLE `oc_menu`
  ADD PRIMARY KEY (`menu_id`);

--
-- Chỉ mục cho bảng `oc_menu_description`
--
ALTER TABLE `oc_menu_description`
  ADD PRIMARY KEY (`menu_id`,`language_id`);

--
-- Chỉ mục cho bảng `oc_menu_module`
--
ALTER TABLE `oc_menu_module`
  ADD PRIMARY KEY (`menu_module_id`),
  ADD KEY `menu_id` (`menu_id`);

--
-- Chỉ mục cho bảng `oc_modification`
--
ALTER TABLE `oc_modification`
  ADD PRIMARY KEY (`modification_id`);

--
-- Chỉ mục cho bảng `oc_module`
--
ALTER TABLE `oc_module`
  ADD PRIMARY KEY (`module_id`);

--
-- Chỉ mục cho bảng `oc_newsletter_subscribe`
--
ALTER TABLE `oc_newsletter_subscribe`
  ADD PRIMARY KEY (`newsletter_id`);

--
-- Chỉ mục cho bảng `oc_option`
--
ALTER TABLE `oc_option`
  ADD PRIMARY KEY (`option_id`);

--
-- Chỉ mục cho bảng `oc_option_description`
--
ALTER TABLE `oc_option_description`
  ADD PRIMARY KEY (`option_id`,`language_id`);

--
-- Chỉ mục cho bảng `oc_option_value`
--
ALTER TABLE `oc_option_value`
  ADD PRIMARY KEY (`option_value_id`);

--
-- Chỉ mục cho bảng `oc_option_value_description`
--
ALTER TABLE `oc_option_value_description`
  ADD PRIMARY KEY (`option_value_id`,`language_id`);

--
-- Chỉ mục cho bảng `oc_order`
--
ALTER TABLE `oc_order`
  ADD PRIMARY KEY (`order_id`);

--
-- Chỉ mục cho bảng `oc_order_custom_field`
--
ALTER TABLE `oc_order_custom_field`
  ADD PRIMARY KEY (`order_custom_field_id`);

--
-- Chỉ mục cho bảng `oc_order_history`
--
ALTER TABLE `oc_order_history`
  ADD PRIMARY KEY (`order_history_id`);

--
-- Chỉ mục cho bảng `oc_order_option`
--
ALTER TABLE `oc_order_option`
  ADD PRIMARY KEY (`order_option_id`);

--
-- Chỉ mục cho bảng `oc_order_product`
--
ALTER TABLE `oc_order_product`
  ADD PRIMARY KEY (`order_product_id`);

--
-- Chỉ mục cho bảng `oc_order_recurring`
--
ALTER TABLE `oc_order_recurring`
  ADD PRIMARY KEY (`order_recurring_id`);

--
-- Chỉ mục cho bảng `oc_order_recurring_transaction`
--
ALTER TABLE `oc_order_recurring_transaction`
  ADD PRIMARY KEY (`order_recurring_transaction_id`);

--
-- Chỉ mục cho bảng `oc_order_status`
--
ALTER TABLE `oc_order_status`
  ADD PRIMARY KEY (`order_status_id`,`language_id`);

--
-- Chỉ mục cho bảng `oc_order_total`
--
ALTER TABLE `oc_order_total`
  ADD PRIMARY KEY (`order_total_id`),
  ADD KEY `order_id` (`order_id`);

--
-- Chỉ mục cho bảng `oc_order_voucher`
--
ALTER TABLE `oc_order_voucher`
  ADD PRIMARY KEY (`order_voucher_id`);

--
-- Chỉ mục cho bảng `oc_payengine3cw_customer_contexts`
--
ALTER TABLE `oc_payengine3cw_customer_contexts`
  ADD PRIMARY KEY (`contextId`),
  ADD UNIQUE KEY `customer_id` (`customerId`);

--
-- Chỉ mục cho bảng `oc_payengine3cw_schema_version`
--
ALTER TABLE `oc_payengine3cw_schema_version`
  ADD PRIMARY KEY (`version_id`),
  ADD UNIQUE KEY `version_number` (`version_number`);

--
-- Chỉ mục cho bảng `oc_payengine3cw_storage`
--
ALTER TABLE `oc_payengine3cw_storage`
  ADD PRIMARY KEY (`keyId`),
  ADD UNIQUE KEY `keyName_keySpace` (`keyName`,`keySpace`);

--
-- Chỉ mục cho bảng `oc_payengine3cw_transactions`
--
ALTER TABLE `oc_payengine3cw_transactions`
  ADD PRIMARY KEY (`transactionId`);

--
-- Chỉ mục cho bảng `oc_product`
--
ALTER TABLE `oc_product`
  ADD PRIMARY KEY (`product_id`);

--
-- Chỉ mục cho bảng `oc_product_attribute`
--
ALTER TABLE `oc_product_attribute`
  ADD PRIMARY KEY (`product_id`,`attribute_id`,`language_id`);

--
-- Chỉ mục cho bảng `oc_product_description`
--
ALTER TABLE `oc_product_description`
  ADD PRIMARY KEY (`product_id`,`language_id`),
  ADD KEY `name` (`name`);

--
-- Chỉ mục cho bảng `oc_product_discount`
--
ALTER TABLE `oc_product_discount`
  ADD PRIMARY KEY (`product_discount_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Chỉ mục cho bảng `oc_product_filter`
--
ALTER TABLE `oc_product_filter`
  ADD PRIMARY KEY (`product_id`,`filter_id`);

--
-- Chỉ mục cho bảng `oc_product_image`
--
ALTER TABLE `oc_product_image`
  ADD PRIMARY KEY (`product_image_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Chỉ mục cho bảng `oc_product_option`
--
ALTER TABLE `oc_product_option`
  ADD PRIMARY KEY (`product_option_id`);

--
-- Chỉ mục cho bảng `oc_product_option_value`
--
ALTER TABLE `oc_product_option_value`
  ADD PRIMARY KEY (`product_option_value_id`);

--
-- Chỉ mục cho bảng `oc_product_recurring`
--
ALTER TABLE `oc_product_recurring`
  ADD PRIMARY KEY (`product_id`,`recurring_id`,`customer_group_id`);

--
-- Chỉ mục cho bảng `oc_product_related`
--
ALTER TABLE `oc_product_related`
  ADD PRIMARY KEY (`product_id`,`related_id`);

--
-- Chỉ mục cho bảng `oc_product_reward`
--
ALTER TABLE `oc_product_reward`
  ADD PRIMARY KEY (`product_reward_id`);

--
-- Chỉ mục cho bảng `oc_product_special`
--
ALTER TABLE `oc_product_special`
  ADD PRIMARY KEY (`product_special_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Chỉ mục cho bảng `oc_product_to_category`
--
ALTER TABLE `oc_product_to_category`
  ADD PRIMARY KEY (`product_id`,`category_id`),
  ADD KEY `category_id` (`category_id`);

--
-- Chỉ mục cho bảng `oc_product_to_download`
--
ALTER TABLE `oc_product_to_download`
  ADD PRIMARY KEY (`product_id`,`download_id`);

--
-- Chỉ mục cho bảng `oc_product_to_layout`
--
ALTER TABLE `oc_product_to_layout`
  ADD PRIMARY KEY (`product_id`,`store_id`);

--
-- Chỉ mục cho bảng `oc_product_to_store`
--
ALTER TABLE `oc_product_to_store`
  ADD PRIMARY KEY (`product_id`,`store_id`);

--
-- Chỉ mục cho bảng `oc_recurring`
--
ALTER TABLE `oc_recurring`
  ADD PRIMARY KEY (`recurring_id`);

--
-- Chỉ mục cho bảng `oc_recurring_description`
--
ALTER TABLE `oc_recurring_description`
  ADD PRIMARY KEY (`recurring_id`,`language_id`);

--
-- Chỉ mục cho bảng `oc_return`
--
ALTER TABLE `oc_return`
  ADD PRIMARY KEY (`return_id`);

--
-- Chỉ mục cho bảng `oc_return_action`
--
ALTER TABLE `oc_return_action`
  ADD PRIMARY KEY (`return_action_id`,`language_id`);

--
-- Chỉ mục cho bảng `oc_return_history`
--
ALTER TABLE `oc_return_history`
  ADD PRIMARY KEY (`return_history_id`);

--
-- Chỉ mục cho bảng `oc_return_reason`
--
ALTER TABLE `oc_return_reason`
  ADD PRIMARY KEY (`return_reason_id`,`language_id`);

--
-- Chỉ mục cho bảng `oc_return_status`
--
ALTER TABLE `oc_return_status`
  ADD PRIMARY KEY (`return_status_id`,`language_id`);

--
-- Chỉ mục cho bảng `oc_review`
--
ALTER TABLE `oc_review`
  ADD PRIMARY KEY (`review_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Chỉ mục cho bảng `oc_setting`
--
ALTER TABLE `oc_setting`
  ADD PRIMARY KEY (`setting_id`);

--
-- Chỉ mục cho bảng `oc_stock_status`
--
ALTER TABLE `oc_stock_status`
  ADD PRIMARY KEY (`stock_status_id`,`language_id`);

--
-- Chỉ mục cho bảng `oc_store`
--
ALTER TABLE `oc_store`
  ADD PRIMARY KEY (`store_id`);

--
-- Chỉ mục cho bảng `oc_tax_class`
--
ALTER TABLE `oc_tax_class`
  ADD PRIMARY KEY (`tax_class_id`);

--
-- Chỉ mục cho bảng `oc_tax_rate`
--
ALTER TABLE `oc_tax_rate`
  ADD PRIMARY KEY (`tax_rate_id`);

--
-- Chỉ mục cho bảng `oc_tax_rate_to_customer_group`
--
ALTER TABLE `oc_tax_rate_to_customer_group`
  ADD PRIMARY KEY (`tax_rate_id`,`customer_group_id`);

--
-- Chỉ mục cho bảng `oc_tax_rule`
--
ALTER TABLE `oc_tax_rule`
  ADD PRIMARY KEY (`tax_rule_id`);

--
-- Chỉ mục cho bảng `oc_theme`
--
ALTER TABLE `oc_theme`
  ADD PRIMARY KEY (`theme_id`);

--
-- Chỉ mục cho bảng `oc_translation`
--
ALTER TABLE `oc_translation`
  ADD PRIMARY KEY (`translation_id`);

--
-- Chỉ mục cho bảng `oc_upload`
--
ALTER TABLE `oc_upload`
  ADD PRIMARY KEY (`upload_id`);

--
-- Chỉ mục cho bảng `oc_url_alias`
--
ALTER TABLE `oc_url_alias`
  ADD PRIMARY KEY (`url_alias_id`),
  ADD KEY `query` (`query`),
  ADD KEY `keyword` (`keyword`);

--
-- Chỉ mục cho bảng `oc_user`
--
ALTER TABLE `oc_user`
  ADD PRIMARY KEY (`user_id`);

--
-- Chỉ mục cho bảng `oc_user_group`
--
ALTER TABLE `oc_user_group`
  ADD PRIMARY KEY (`user_group_id`);

--
-- Chỉ mục cho bảng `oc_voucher`
--
ALTER TABLE `oc_voucher`
  ADD PRIMARY KEY (`voucher_id`);

--
-- Chỉ mục cho bảng `oc_voucher_history`
--
ALTER TABLE `oc_voucher_history`
  ADD PRIMARY KEY (`voucher_history_id`);

--
-- Chỉ mục cho bảng `oc_voucher_theme`
--
ALTER TABLE `oc_voucher_theme`
  ADD PRIMARY KEY (`voucher_theme_id`);

--
-- Chỉ mục cho bảng `oc_voucher_theme_description`
--
ALTER TABLE `oc_voucher_theme_description`
  ADD PRIMARY KEY (`voucher_theme_id`,`language_id`);

--
-- Chỉ mục cho bảng `oc_weight_class`
--
ALTER TABLE `oc_weight_class`
  ADD PRIMARY KEY (`weight_class_id`);

--
-- Chỉ mục cho bảng `oc_weight_class_description`
--
ALTER TABLE `oc_weight_class_description`
  ADD PRIMARY KEY (`weight_class_id`,`language_id`);

--
-- Chỉ mục cho bảng `oc_zone`
--
ALTER TABLE `oc_zone`
  ADD PRIMARY KEY (`zone_id`);

--
-- Chỉ mục cho bảng `oc_zone_to_geo_zone`
--
ALTER TABLE `oc_zone_to_geo_zone`
  ADD PRIMARY KEY (`zone_to_geo_zone_id`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `oc_address`
--
ALTER TABLE `oc_address`
  MODIFY `address_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=186;

--
-- AUTO_INCREMENT cho bảng `oc_affiliate`
--
ALTER TABLE `oc_affiliate`
  MODIFY `affiliate_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT cho bảng `oc_affiliate_activity`
--
ALTER TABLE `oc_affiliate_activity`
  MODIFY `affiliate_activity_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `oc_affiliate_login`
--
ALTER TABLE `oc_affiliate_login`
  MODIFY `affiliate_login_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `oc_affiliate_transaction`
--
ALTER TABLE `oc_affiliate_transaction`
  MODIFY `affiliate_transaction_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `oc_api`
--
ALTER TABLE `oc_api`
  MODIFY `api_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `oc_api_ip`
--
ALTER TABLE `oc_api_ip`
  MODIFY `api_ip_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=395;

--
-- AUTO_INCREMENT cho bảng `oc_api_session`
--
ALTER TABLE `oc_api_session`
  MODIFY `api_session_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=838;

--
-- AUTO_INCREMENT cho bảng `oc_attribute`
--
ALTER TABLE `oc_attribute`
  MODIFY `attribute_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=60;

--
-- AUTO_INCREMENT cho bảng `oc_attribute_group`
--
ALTER TABLE `oc_attribute_group`
  MODIFY `attribute_group_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT cho bảng `oc_banner`
--
ALTER TABLE `oc_banner`
  MODIFY `banner_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT cho bảng `oc_banner_image`
--
ALTER TABLE `oc_banner_image`
  MODIFY `banner_image_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=894;

--
-- AUTO_INCREMENT cho bảng `oc_cart`
--
ALTER TABLE `oc_cart`
  MODIFY `cart_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=208;

--
-- AUTO_INCREMENT cho bảng `oc_category`
--
ALTER TABLE `oc_category`
  MODIFY `category_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=250;

--
-- AUTO_INCREMENT cho bảng `oc_country`
--
ALTER TABLE `oc_country`
  MODIFY `country_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=258;

--
-- AUTO_INCREMENT cho bảng `oc_coupon`
--
ALTER TABLE `oc_coupon`
  MODIFY `coupon_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT cho bảng `oc_coupon_history`
--
ALTER TABLE `oc_coupon_history`
  MODIFY `coupon_history_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `oc_coupon_product`
--
ALTER TABLE `oc_coupon_product`
  MODIFY `coupon_product_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `oc_currency`
--
ALTER TABLE `oc_currency`
  MODIFY `currency_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT cho bảng `oc_customer`
--
ALTER TABLE `oc_customer`
  MODIFY `customer_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=149;

--
-- AUTO_INCREMENT cho bảng `oc_customer_activity`
--
ALTER TABLE `oc_customer_activity`
  MODIFY `customer_activity_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `oc_customer_group`
--
ALTER TABLE `oc_customer_group`
  MODIFY `customer_group_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `oc_customer_history`
--
ALTER TABLE `oc_customer_history`
  MODIFY `customer_history_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `oc_customer_ip`
--
ALTER TABLE `oc_customer_ip`
  MODIFY `customer_ip_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=296;

--
-- AUTO_INCREMENT cho bảng `oc_customer_login`
--
ALTER TABLE `oc_customer_login`
  MODIFY `customer_login_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=254;

--
-- AUTO_INCREMENT cho bảng `oc_customer_reward`
--
ALTER TABLE `oc_customer_reward`
  MODIFY `customer_reward_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `oc_customer_search`
--
ALTER TABLE `oc_customer_search`
  MODIFY `customer_search_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `oc_customer_transaction`
--
ALTER TABLE `oc_customer_transaction`
  MODIFY `customer_transaction_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT cho bảng `oc_custom_field`
--
ALTER TABLE `oc_custom_field`
  MODIFY `custom_field_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `oc_custom_field_value`
--
ALTER TABLE `oc_custom_field_value`
  MODIFY `custom_field_value_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `oc_download`
--
ALTER TABLE `oc_download`
  MODIFY `download_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `oc_event`
--
ALTER TABLE `oc_event`
  MODIFY `event_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT cho bảng `oc_extension`
--
ALTER TABLE `oc_extension`
  MODIFY `extension_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=57;

--
-- AUTO_INCREMENT cho bảng `oc_filter`
--
ALTER TABLE `oc_filter`
  MODIFY `filter_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=198;

--
-- AUTO_INCREMENT cho bảng `oc_filter_group`
--
ALTER TABLE `oc_filter_group`
  MODIFY `filter_group_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT cho bảng `oc_gcrdev_sitemap`
--
ALTER TABLE `oc_gcrdev_sitemap`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT cho bảng `oc_geo_zone`
--
ALTER TABLE `oc_geo_zone`
  MODIFY `geo_zone_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT cho bảng `oc_google_base_category`
--
ALTER TABLE `oc_google_base_category`
  MODIFY `google_base_category_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `oc_information`
--
ALTER TABLE `oc_information`
  MODIFY `information_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT cho bảng `oc_language`
--
ALTER TABLE `oc_language`
  MODIFY `language_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT cho bảng `oc_layout`
--
ALTER TABLE `oc_layout`
  MODIFY `layout_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT cho bảng `oc_layout_module`
--
ALTER TABLE `oc_layout_module`
  MODIFY `layout_module_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=486;

--
-- AUTO_INCREMENT cho bảng `oc_layout_route`
--
ALTER TABLE `oc_layout_route`
  MODIFY `layout_route_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=103;

--
-- AUTO_INCREMENT cho bảng `oc_length_class`
--
ALTER TABLE `oc_length_class`
  MODIFY `length_class_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT cho bảng `oc_location`
--
ALTER TABLE `oc_location`
  MODIFY `location_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `oc_manufacturer`
--
ALTER TABLE `oc_manufacturer`
  MODIFY `manufacturer_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=64;

--
-- AUTO_INCREMENT cho bảng `oc_marketing`
--
ALTER TABLE `oc_marketing`
  MODIFY `marketing_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `oc_menu`
--
ALTER TABLE `oc_menu`
  MODIFY `menu_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `oc_modification`
--
ALTER TABLE `oc_modification`
  MODIFY `modification_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `oc_module`
--
ALTER TABLE `oc_module`
  MODIFY `module_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;

--
-- AUTO_INCREMENT cho bảng `oc_newsletter_subscribe`
--
ALTER TABLE `oc_newsletter_subscribe`
  MODIFY `newsletter_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `oc_option`
--
ALTER TABLE `oc_option`
  MODIFY `option_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT cho bảng `oc_option_value`
--
ALTER TABLE `oc_option_value`
  MODIFY `option_value_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- AUTO_INCREMENT cho bảng `oc_order`
--
ALTER TABLE `oc_order`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `oc_order_custom_field`
--
ALTER TABLE `oc_order_custom_field`
  MODIFY `order_custom_field_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `oc_order_history`
--
ALTER TABLE `oc_order_history`
  MODIFY `order_history_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=661;

--
-- AUTO_INCREMENT cho bảng `oc_order_option`
--
ALTER TABLE `oc_order_option`
  MODIFY `order_option_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `oc_order_product`
--
ALTER TABLE `oc_order_product`
  MODIFY `order_product_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=704;

--
-- AUTO_INCREMENT cho bảng `oc_order_recurring`
--
ALTER TABLE `oc_order_recurring`
  MODIFY `order_recurring_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `oc_order_recurring_transaction`
--
ALTER TABLE `oc_order_recurring_transaction`
  MODIFY `order_recurring_transaction_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `oc_order_status`
--
ALTER TABLE `oc_order_status`
  MODIFY `order_status_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT cho bảng `oc_order_total`
--
ALTER TABLE `oc_order_total`
  MODIFY `order_total_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2026;

--
-- AUTO_INCREMENT cho bảng `oc_order_voucher`
--
ALTER TABLE `oc_order_voucher`
  MODIFY `order_voucher_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `oc_payengine3cw_customer_contexts`
--
ALTER TABLE `oc_payengine3cw_customer_contexts`
  MODIFY `contextId` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=115;

--
-- AUTO_INCREMENT cho bảng `oc_payengine3cw_schema_version`
--
ALTER TABLE `oc_payengine3cw_schema_version`
  MODIFY `version_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT cho bảng `oc_payengine3cw_storage`
--
ALTER TABLE `oc_payengine3cw_storage`
  MODIFY `keyId` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `oc_payengine3cw_transactions`
--
ALTER TABLE `oc_payengine3cw_transactions`
  MODIFY `transactionId` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT cho bảng `oc_product`
--
ALTER TABLE `oc_product`
  MODIFY `product_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1318;

--
-- AUTO_INCREMENT cho bảng `oc_product_discount`
--
ALTER TABLE `oc_product_discount`
  MODIFY `product_discount_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=442;

--
-- AUTO_INCREMENT cho bảng `oc_product_image`
--
ALTER TABLE `oc_product_image`
  MODIFY `product_image_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=55925;

--
-- AUTO_INCREMENT cho bảng `oc_product_option`
--
ALTER TABLE `oc_product_option`
  MODIFY `product_option_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=227;

--
-- AUTO_INCREMENT cho bảng `oc_product_option_value`
--
ALTER TABLE `oc_product_option_value`
  MODIFY `product_option_value_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT cho bảng `oc_product_reward`
--
ALTER TABLE `oc_product_reward`
  MODIFY `product_reward_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=546;

--
-- AUTO_INCREMENT cho bảng `oc_product_special`
--
ALTER TABLE `oc_product_special`
  MODIFY `product_special_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=441;

--
-- AUTO_INCREMENT cho bảng `oc_recurring`
--
ALTER TABLE `oc_recurring`
  MODIFY `recurring_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `oc_return`
--
ALTER TABLE `oc_return`
  MODIFY `return_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT cho bảng `oc_return_action`
--
ALTER TABLE `oc_return_action`
  MODIFY `return_action_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT cho bảng `oc_return_history`
--
ALTER TABLE `oc_return_history`
  MODIFY `return_history_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT cho bảng `oc_return_reason`
--
ALTER TABLE `oc_return_reason`
  MODIFY `return_reason_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT cho bảng `oc_return_status`
--
ALTER TABLE `oc_return_status`
  MODIFY `return_status_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT cho bảng `oc_review`
--
ALTER TABLE `oc_review`
  MODIFY `review_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `oc_setting`
--
ALTER TABLE `oc_setting`
  MODIFY `setting_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9569;

--
-- AUTO_INCREMENT cho bảng `oc_stock_status`
--
ALTER TABLE `oc_stock_status`
  MODIFY `stock_status_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT cho bảng `oc_store`
--
ALTER TABLE `oc_store`
  MODIFY `store_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `oc_tax_class`
--
ALTER TABLE `oc_tax_class`
  MODIFY `tax_class_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT cho bảng `oc_tax_rate`
--
ALTER TABLE `oc_tax_rate`
  MODIFY `tax_rate_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=88;

--
-- AUTO_INCREMENT cho bảng `oc_tax_rule`
--
ALTER TABLE `oc_tax_rule`
  MODIFY `tax_rule_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=129;

--
-- AUTO_INCREMENT cho bảng `oc_theme`
--
ALTER TABLE `oc_theme`
  MODIFY `theme_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `oc_translation`
--
ALTER TABLE `oc_translation`
  MODIFY `translation_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `oc_upload`
--
ALTER TABLE `oc_upload`
  MODIFY `upload_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `oc_url_alias`
--
ALTER TABLE `oc_url_alias`
  MODIFY `url_alias_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11209;

--
-- AUTO_INCREMENT cho bảng `oc_user`
--
ALTER TABLE `oc_user`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT cho bảng `oc_user_group`
--
ALTER TABLE `oc_user_group`
  MODIFY `user_group_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT cho bảng `oc_voucher`
--
ALTER TABLE `oc_voucher`
  MODIFY `voucher_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `oc_voucher_history`
--
ALTER TABLE `oc_voucher_history`
  MODIFY `voucher_history_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `oc_voucher_theme`
--
ALTER TABLE `oc_voucher_theme`
  MODIFY `voucher_theme_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT cho bảng `oc_weight_class`
--
ALTER TABLE `oc_weight_class`
  MODIFY `weight_class_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT cho bảng `oc_zone`
--
ALTER TABLE `oc_zone`
  MODIFY `zone_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4236;

--
-- AUTO_INCREMENT cho bảng `oc_zone_to_geo_zone`
--
ALTER TABLE `oc_zone_to_geo_zone`
  MODIFY `zone_to_geo_zone_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=310;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
