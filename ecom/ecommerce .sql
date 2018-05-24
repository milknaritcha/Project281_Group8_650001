-- phpMyAdmin SQL Dump
-- version 4.8.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 24, 2018 at 11:46 AM
-- Server version: 10.1.31-MariaDB
-- PHP Version: 5.6.35

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ecommerce`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `creationDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updationDate` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `username`, `password`, `creationDate`, `updationDate`) VALUES
(1, 'admin', '81dc9bdb52d04dc20036dbd8313ed055', '2017-01-24 16:21:18', '25-04-2018 04:03:00 PM');

-- --------------------------------------------------------

--
-- Table structure for table `attributes`
--

CREATE TABLE `attributes` (
  `attr_id` int(11) NOT NULL,
  `pro_id` smallint(6) NOT NULL,
  `attr_name` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `attr_value` varchar(250) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `attributes`
--

INSERT INTO `attributes` (`attr_id`, `pro_id`, `attr_name`, `attr_value`) VALUES
(1, 1, 'Color', 'Red'),
(2, 23, 'à¸ªà¸µ', 'à¹€à¸‚à¸µà¸¢à¸§'),
(3, 23, 'à¸‚à¸™à¸²à¸”', 'à¹ƒà¸«à¸à¹ˆà¸¡à¸²à¸'),
(4, 25, 'à¸ªà¸µ', 'à¸¥à¸²à¸¢à¸—à¸²à¸‡');

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `categoryName` varchar(255) NOT NULL,
  `categoryDescription` longtext NOT NULL,
  `creationDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updationDate` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`id`, `categoryName`, `categoryDescription`, `creationDate`, `updationDate`) VALUES
(3, 'Shirt', 'Fashion', '2017-01-24 19:17:37', '25-04-2018 04:18:39 PM'),
(4, 'Jeans', 'Fashion', '2017-01-24 19:19:32', '25-04-2018 04:18:32 PM'),
(5, 'Bag', 'Fashion', '2017-01-24 19:19:54', '25-04-2018 04:17:16 PM'),
(6, 'Shoes', 'Fashion', '2017-02-20 19:18:52', '25-04-2018 04:18:25 PM');

-- --------------------------------------------------------

--
-- Table structure for table `news`
--

CREATE TABLE `news` (
  `email` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_send` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `news`
--

INSERT INTO `news` (`email`, `last_send`) VALUES
('', '2018-05-14');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `orderid` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `productId` varchar(255) NOT NULL,
  `quantity` int(11) NOT NULL,
  `price` varchar(250) NOT NULL,
  `orderDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `paymentMethod` varchar(50) DEFAULT NULL,
  `orderStatus` varchar(55) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `orderid`, `userId`, `productId`, `quantity`, `price`, `orderDate`, `paymentMethod`, `orderStatus`) VALUES
(38, 2, 3, '3', 1, '11768.93', '2018-05-11 00:28:59', 'Banking', 'success'),
(39, 3, 3, '1', 1, '10.7', '2018-05-11 00:34:05', 'Paypal', 'Success'),
(40, 4, 3, '1', 1, '10.7', '2018-05-11 01:40:50', 'Banking', NULL),
(41, 5, 3, '1', 1, '39590', '2018-05-11 02:14:49', 'Banking', NULL),
(42, 5, 3, '2', 2, '39590', '2018-05-11 02:14:49', 'Banking', 'Success'),
(43, 7, 5, '20', 1, '8655.23', '2018-05-14 11:52:11', 'Paypal', 'Success'),
(44, 7, 5, '21', 4, '8655.23', '2018-05-14 11:52:11', 'Paypal', 'Unsuccessful'),
(45, 9, 5, '21', 5, '5885', '2018-05-14 12:30:08', 'Banking', 'Success'),
(46, 9, 5, '22', 1, '5885', '2018-05-14 12:30:09', 'Banking', NULL),
(47, 11, 5, '2', 1, '39579.3', '2018-05-14 12:42:24', 'Paypal', NULL),
(48, 12, 5, '1', 1, '599.2', '2018-05-14 13:54:18', 'Banking', NULL),
(49, 13, 5, '21', 1, '1166.3', '2018-05-14 13:56:46', 'Paypal', NULL),
(50, 14, 5, '21', 1, '1166.3', '2018-05-14 13:58:01', 'Paypal', NULL),
(51, 15, 5, '21', 1, '1754.8', '2018-05-14 16:01:38', 'Paypal', NULL),
(52, 15, 5, '23', 1, '1754.8', '2018-05-14 16:01:38', 'Paypal', NULL),
(53, 17, 5, '23', 1, '588.5', '2018-05-18 05:32:45', 'Paypal', NULL),
(54, 18, 5, '30', 1, '1615.7', '2018-05-18 05:35:27', 'Banking', 'Success'),
(55, 18, 5, '31', 1, '1615.7', '2018-05-18 05:35:28', 'Banking', NULL),
(56, 20, 5, '26', 1, '577.8', '2018-05-18 06:05:36', 'Paypal', NULL),
(57, 21, 5, '23', 1, '588.5', '2018-05-18 06:24:13', 'Banking', NULL),
(58, 22, 5, '2', 1, '475.2', '2018-05-18 07:20:32', 'Paypal', NULL),
(59, 23, 5, '24', 1, '551.05', '2018-05-18 09:33:08', 'Paypal', NULL),
(60, 24, 5, '23', 1, '588.5', '2018-05-18 09:39:30', NULL, NULL),
(61, 25, 1, '1', 1, '599.2', '2018-05-18 10:03:16', 'Paypal', 'Success'),
(62, 26, 1, '21', 1, '1166.3', '2018-05-18 10:11:44', 'Banking', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `ordertrackhistory`
--

CREATE TABLE `ordertrackhistory` (
  `id` int(11) NOT NULL,
  `orderId` int(11) NOT NULL,
  `status` varchar(255) NOT NULL,
  `remark` mediumtext NOT NULL,
  `postingDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ordertrackhistory`
--

INSERT INTO `ordertrackhistory` (`id`, `orderId`, `status`, `remark`, `postingDate`) VALUES
(1, 3, 'in Process', 'Order has been Shipped.', '2017-03-10 19:36:45'),
(2, 1, 'Delivered', 'Order Has been delivered', '2017-03-10 19:37:31'),
(3, 3, 'Delivered', 'Product delivered successfully', '2017-03-10 19:43:04'),
(4, 4, 'in Process', 'Product ready for Shipping', '2017-03-10 19:50:36');

-- --------------------------------------------------------

--
-- Table structure for table `productreviews`
--

CREATE TABLE `productreviews` (
  `id` int(11) NOT NULL,
  `productId` int(11) NOT NULL,
  `quality` int(11) NOT NULL,
  `price` int(11) NOT NULL,
  `value` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `summary` varchar(255) NOT NULL,
  `review` longtext NOT NULL,
  `reviewDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `productreviews`
--

INSERT INTO `productreviews` (`id`, `productId`, `quality`, `price`, `value`, `name`, `summary`, `review`, `reviewDate`) VALUES
(2, 3, 4, 5, 5, 'Anuj Kumar', 'BEST PRODUCT FOR ME :)', 'BEST PRODUCT FOR ME :)', '2017-02-26 20:43:57'),
(3, 3, 3, 4, 3, 'Sarita pandey', 'Nice Product', 'Value for money', '2017-02-26 20:52:46'),
(4, 3, 3, 4, 3, 'Sarita pandey', 'Nice Product', 'Value for money', '2017-02-26 20:59:19');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `category` int(11) NOT NULL,
  `productName` varchar(255) NOT NULL,
  `productCompany` varchar(255) NOT NULL,
  `productPrice` int(11) NOT NULL,
  `productPriceBeforeDiscount` int(11) NOT NULL,
  `productDescription` longtext NOT NULL,
  `productImage1` varchar(255) NOT NULL,
  `productImage2` varchar(255) NOT NULL,
  `productImage3` varchar(255) NOT NULL,
  `shippingCharge` int(11) NOT NULL,
  `productAvailability` varchar(255) NOT NULL,
  `postingDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updationDate` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `category`, `productName`, `productCompany`, `productPrice`, `productPriceBeforeDiscount`, `productDescription`, `productImage1`, `productImage2`, `productImage3`, `shippingCharge`, `productAvailability`, `postingDate`, `updationDate`) VALUES
(1, 4, 'à¸à¸²à¸‡à¹€à¸à¸‡à¸«à¸¥à¸§à¸¡à¸žà¸´à¸¡à¸žà¹Œà¸¥à¸²à¸¢à¸”à¸­à¸à¹„à¸¡à¹‰', 'Micro', 560, 580, '<div class=\"HoUsOy\" style=\"box-sizing: border-box; margin: 0px; padding: 0px 0px 16px; font-size: 18px; white-space: nowrap; line-height: 1.4; color: rgb(33, 33, 33); font-family: Roboto, Arial, sans-serif;\">General</div><ul style=\"box-sizing: border-box; margin-bottom: 0px; margin-left: 0px; color: rgb(33, 33, 33); font-family: Roboto, Arial, sans-serif; font-size: 14px;\"><li class=\"_1KuY3T row\" style=\"box-sizing: border-box; margin: 0px; padding: 0px 0px 16px; list-style: none; display: flex; flex-flow: row wrap; width: 731px;\"><div class=\"vmXPri col col-3-12\" style=\"box-sizing: border-box; margin: 0px; padding: 0px 8px 0px 0px; width: 182.75px; display: inline-block; vertical-align: top; color: rgb(135, 135, 135);\">Sales Package</div><ul class=\"_3dG3ix col col-9-12\" style=\"box-sizing: border-box; margin-left: 0px; width: 548.25px; display: inline-block; vertical-align: top; line-height: 1.4;\"><li class=\"sNqDog\" style=\"box-sizing: border-box; margin: 0px; padding: 0px; list-style: none;\">1 TV Unit, Remote Controller, Battery (For Remote Controller), Quick Installation Guide and User Manual: All in One, Wall Mount Support</li></ul></li><li class=\"_1KuY3T row\" style=\"box-sizing: border-box; margin: 0px; padding: 0px 0px 16px; list-style: none; display: flex; flex-flow: row wrap; width: 731px;\"><div class=\"vmXPri col col-3-12\" style=\"box-sizing: border-box; margin: 0px; padding: 0px 8px 0px 0px; width: 182.75px; display: inline-block; vertical-align: top; color: rgb(135, 135, 135);\">Model Name</div><ul class=\"_3dG3ix col col-9-12\" style=\"box-sizing: border-box; margin-left: 0px; width: 548.25px; display: inline-block; vertical-align: top; line-height: 1.4;\"><li class=\"sNqDog\" style=\"box-sizing: border-box; margin: 0px; padding: 0px; list-style: none;\">32T6175MHD</li></ul></li><li class=\"_1KuY3T row\" style=\"box-sizing: border-box; margin: 0px; padding: 0px 0px 16px; list-style: none; display: flex; flex-flow: row wrap; width: 731px;\"><div class=\"vmXPri col col-3-12\" style=\"box-sizing: border-box; margin: 0px; padding: 0px 8px 0px 0px; width: 182.75px; display: inline-block; vertical-align: top; color: rgb(135, 135, 135);\">Display Size</div><ul class=\"_3dG3ix col col-9-12\" style=\"box-sizing: border-box; margin-left: 0px; width: 548.25px; display: inline-block; vertical-align: top; line-height: 1.4;\"><li class=\"sNqDog\" style=\"box-sizing: border-box; margin: 0px; padding: 0px; list-style: none;\">81 cm (32)</li></ul></li><li class=\"_1KuY3T row\" style=\"box-sizing: border-box; margin: 0px; padding: 0px 0px 16px; list-style: none; display: flex; flex-flow: row wrap; width: 731px;\"><div class=\"vmXPri col col-3-12\" style=\"box-sizing: border-box; margin: 0px; padding: 0px 8px 0px 0px; width: 182.75px; display: inline-block; vertical-align: top; color: rgb(135, 135, 135);\">Screen Type</div><ul class=\"_3dG3ix col col-9-12\" style=\"box-sizing: border-box; margin-left: 0px; width: 548.25px; display: inline-block; vertical-align: top; line-height: 1.4;\"><li class=\"sNqDog\" style=\"box-sizing: border-box; margin: 0px; padding: 0px; list-style: none;\">LED</li></ul></li><li class=\"_1KuY3T row\" style=\"box-sizing: border-box; margin: 0px; padding: 0px 0px 16px; list-style: none; display: flex; flex-flow: row wrap; width: 731px;\"><div class=\"vmXPri col col-3-12\" style=\"box-sizing: border-box; margin: 0px; padding: 0px 8px 0px 0px; width: 182.75px; display: inline-block; vertical-align: top; color: rgb(135, 135, 135);\">HD Technology &amp; Resolutiontest</div><ul class=\"_3dG3ix col col-9-12\" style=\"box-sizing: border-box; margin-left: 0px; width: 548.25px; display: inline-block; vertical-align: top; line-height: 1.4;\"><li class=\"sNqDog\" style=\"box-sizing: border-box; margin: 0px; padding: 0px; list-style: none;\">HD Ready, 1366 x 768</li></ul></li></ul>', '2844174330_2_3_1.jpg', '2844174330_2_5_1.jpg', '2844174330_6_1_1.jpg', 1200, 'In Stock', '2017-01-30 16:54:35', ''),
(2, 4, 'à¸à¸²à¸‡à¹€à¸à¸‡à¸Šà¸²à¸¢à¸­à¹€à¸™à¸à¸›à¸£à¸°à¸ªà¸‡à¸„à¹Œ', 'Zala', 360, 560, '<p class=\"MsoNormal\"><span lang=\"TH\" style=\"font-size:14.0pt;mso-ansi-font-size:\r\n11.0pt;line-height:107%;font-family:&quot;Cordia New&quot;,sans-serif;mso-ascii-font-family:\r\nCalibri;mso-ascii-theme-font:minor-latin;mso-hansi-font-family:Calibri;\r\nmso-hansi-theme-font:minor-latin;mso-bidi-font-family:&quot;Cordia New&quot;;mso-bidi-theme-font:\r\nminor-bidi\">à¸à¸²à¸‡à¹€à¸à¸‡à¸Šà¸²à¸¢à¸­à¹€à¸™à¸à¸›à¸£à¸°à¸ªà¸‡à¸„à¹Œ</span><o:p></o:p></p>\r\n\r\n<br>\r\n\r\n<p class=\"MsoNormal\"><span lang=\"TH\" style=\"font-size:14.0pt;mso-ansi-font-size:\r\n11.0pt;line-height:107%;font-family:&quot;Cordia New&quot;,sans-serif;mso-ascii-font-family:\r\nCalibri;mso-ascii-theme-font:minor-latin;mso-hansi-font-family:Calibri;\r\nmso-hansi-theme-font:minor-latin;mso-bidi-font-family:&quot;Cordia New&quot;;mso-bidi-theme-font:\r\nminor-bidi\">à¸à¸²à¸‡à¹€à¸à¸‡à¸‚à¸²à¸à¸§à¹‰à¸²à¸‡à¹€à¸­à¸§à¸ªà¸¹à¸‡à¸›à¸£à¸±à¸šà¹„à¸”à¹‰à¸”à¹‰à¸§à¸¢à¸£à¸´à¸šà¸šà¸´à¹‰à¸™à¸ªà¸µà¹‚à¸—à¸™à¹€à¸”à¸µà¸¢à¸§à¸à¸±à¸™\r\nà¸¡à¸µà¸à¸£à¸°à¹€à¸›à¹‹à¸²à¹à¸šà¸šà¸›à¸°à¸”à¹‰à¸²à¸™à¸«à¸™à¹‰à¸² à¸Šà¸²à¸¢à¸•à¸´à¸”à¸à¸£à¸°à¸”à¸¸à¸¡à¸•à¸²à¹„à¸à¹ˆà¹€à¸žà¸·à¹ˆà¸­à¸›à¸£à¸±à¸šà¸„à¸§à¸²à¸¡à¸à¸§à¹‰à¸²à¸‡\r\nà¹€à¸›à¸´à¸”à¸›à¸´à¸”à¸”à¹‰à¸²à¸™à¸«à¸™à¹‰à¸²à¸”à¹‰à¸§à¸¢à¸‹à¸´à¸›à¹à¸¥à¸°à¸¡à¸µà¸à¸£à¸°à¸”à¸¸à¸¡à¸ªà¸µà¸•à¸±à¸”</span><br>\r\n<br>\r\n<span lang=\"TH\" style=\"font-size:14.0pt;mso-ansi-font-size:11.0pt;line-height:\r\n107%;font-family:&quot;Cordia New&quot;,sans-serif;mso-ascii-font-family:Calibri;\r\nmso-ascii-theme-font:minor-latin;mso-hansi-font-family:Calibri;mso-hansi-theme-font:\r\nminor-latin;mso-bidi-font-family:&quot;Cordia New&quot;;mso-bidi-theme-font:minor-bidi\">à¸„à¸§à¸²à¸¡à¸ªà¸¹à¸‡à¸‚à¸­à¸‡à¹à¸šà¸š:\r\n</span>178 <span lang=\"TH\" style=\"font-size:14.0pt;mso-ansi-font-size:11.0pt;\r\nline-height:107%;font-family:&quot;Cordia New&quot;,sans-serif;mso-ascii-font-family:\r\nCalibri;mso-ascii-theme-font:minor-latin;mso-hansi-font-family:Calibri;\r\nmso-hansi-theme-font:minor-latin;mso-bidi-font-family:&quot;Cordia New&quot;;mso-bidi-theme-font:\r\nminor-bidi\">à¸‹à¸¡.</span><o:p></o:p></p>\r\n\r\n<p class=\"MsoNormal\"><span lang=\"TH\" style=\"font-size:14.0pt;mso-ansi-font-size:\r\n11.0pt;line-height:107%;font-family:&quot;Cordia New&quot;,sans-serif;mso-ascii-font-family:\r\nCalibri;mso-ascii-theme-font:minor-latin;mso-hansi-font-family:Calibri;\r\nmso-hansi-theme-font:minor-latin;mso-bidi-font-family:&quot;Cordia New&quot;;mso-bidi-theme-font:\r\nminor-bidi\">à¸ªà¹ˆà¸§à¸™à¸›à¸£à¸°à¸à¸­à¸š</span><o:p></o:p></p>\r\n\r\n<p class=\"MsoNormal\"><span lang=\"TH\" style=\"font-size:14.0pt;mso-ansi-font-size:\r\n11.0pt;line-height:107%;font-family:&quot;Cordia New&quot;,sans-serif;mso-ascii-font-family:\r\nCalibri;mso-ascii-theme-font:minor-latin;mso-hansi-font-family:Calibri;\r\nmso-hansi-theme-font:minor-latin;mso-bidi-font-family:&quot;Cordia New&quot;;mso-bidi-theme-font:\r\nminor-bidi\">à¹€à¸›à¸¥à¸·à¸­à¸à¸”à¹‰à¸²à¸™à¸™à¸­à¸</span><o:p></o:p></p>\r\n\r\n<p class=\"MsoNormal\">70<span lang=\"TH\" style=\"mso-bidi-font-size:11.0pt;line-height:\r\n107%;font-family:&quot;Angsana New&quot;,serif;mso-ascii-font-family:Calibri;mso-ascii-theme-font:\r\nminor-latin;mso-hansi-font-family:Calibri;mso-hansi-theme-font:minor-latin\">% </span><span lang=\"TH\" style=\"font-size:14.0pt;mso-ansi-font-size:11.0pt;line-height:107%;\r\nfont-family:&quot;Cordia New&quot;,sans-serif;mso-ascii-font-family:Calibri;mso-ascii-theme-font:\r\nminor-latin;mso-hansi-font-family:Calibri;mso-hansi-theme-font:minor-latin;\r\nmso-bidi-font-family:&quot;Cordia New&quot;;mso-bidi-theme-font:minor-bidi\">à¹€à¸ªà¹‰à¸™à¹ƒà¸¢à¸œà¹‰à¸²à¸à¹‰à¸²à¸¢</span>,\r\n30<span lang=\"TH\" style=\"mso-bidi-font-size:11.0pt;line-height:107%;font-family:\r\n&quot;Angsana New&quot;,serif;mso-ascii-font-family:Calibri;mso-ascii-theme-font:minor-latin;\r\nmso-hansi-font-family:Calibri;mso-hansi-theme-font:minor-latin\">% </span><span lang=\"TH\" style=\"font-size:14.0pt;mso-ansi-font-size:11.0pt;line-height:107%;\r\nfont-family:&quot;Cordia New&quot;,sans-serif;mso-ascii-font-family:Calibri;mso-ascii-theme-font:\r\nminor-latin;mso-hansi-font-family:Calibri;mso-hansi-theme-font:minor-latin;\r\nmso-bidi-font-family:&quot;Cordia New&quot;;mso-bidi-theme-font:minor-bidi\">à¹€à¸ªà¹‰à¸™à¹ƒà¸¢à¸œà¹‰à¸²à¸¥à¸´à¸™à¸´à¸™</span><o:p></o:p></p>', '9632051500_6_1_1.jpg', '9632051500_2_2_1.jpg', '9632051500_1_1_1.jpg', 0, 'In Stock', '2017-01-30 16:59:00', ''),
(21, 3, 'à¹€à¸ªà¸·à¹‰à¸­à¹‚à¸›à¹‚à¸¥à¸¡à¸µà¸œà¸´à¸§à¸ªà¸±à¸¡à¸œà¸±à¸ªà¸£à¸²à¸¢à¸¥à¸°à¹€à¸­à¸µà¸¢à¸”', 'Â©zaera', 1090, 1190, '<p class=\"MsoNormal\"><span lang=\"TH\" style=\"font-size:14.0pt;mso-ansi-font-size:\r\n11.0pt;line-height:107%;font-family:&quot;Cordia New&quot;,sans-serif;mso-ascii-font-family:\r\nCalibri;mso-ascii-theme-font:minor-latin;mso-hansi-font-family:Calibri;\r\nmso-hansi-theme-font:minor-latin;mso-bidi-font-family:&quot;Cordia New&quot;;mso-bidi-theme-font:\r\nminor-bidi\">à¹€à¸ªà¸·à¹‰à¸­à¹‚à¸›à¹‚à¸¥à¸œà¹‰à¸²à¸œà¸´à¸§à¹„à¸¡à¹ˆà¹€à¸£à¸µà¸¢à¸šà¸„à¸­à¸§à¸µà¹à¸‚à¸™à¸ªà¸±à¹‰à¸™ à¹€à¸›à¸´à¸”à¸›à¸´à¸”à¸”à¹‰à¸²à¸™à¸«à¸™à¹‰à¸²à¸”à¹‰à¸§à¸¢à¸à¸£à¸°à¸”à¸¸à¸¡</span><br>\r\n<br>\r\n<span lang=\"TH\" style=\"font-size:14.0pt;mso-ansi-font-size:11.0pt;line-height:\r\n107%;font-family:&quot;Cordia New&quot;,sans-serif;mso-ascii-font-family:Calibri;\r\nmso-ascii-theme-font:minor-latin;mso-hansi-font-family:Calibri;mso-hansi-theme-font:\r\nminor-latin;mso-bidi-font-family:&quot;Cordia New&quot;;mso-bidi-theme-font:minor-bidi\">à¸„à¸§à¸²à¸¡à¸ªà¸¹à¸‡à¸‚à¸­à¸‡à¹à¸šà¸š:\r\n</span>189 <span lang=\"TH\" style=\"font-size:14.0pt;mso-ansi-font-size:11.0pt;\r\nline-height:107%;font-family:&quot;Cordia New&quot;,sans-serif;mso-ascii-font-family:\r\nCalibri;mso-ascii-theme-font:minor-latin;mso-hansi-font-family:Calibri;\r\nmso-hansi-theme-font:minor-latin;mso-bidi-font-family:&quot;Cordia New&quot;;mso-bidi-theme-font:\r\nminor-bidi\">à¸‹à¸¡.</span><o:p></o:p></p>\r\n\r\n<p class=\"MsoNormal\"><span lang=\"TH\" style=\"font-size:14.0pt;mso-ansi-font-size:\r\n11.0pt;line-height:107%;font-family:&quot;Cordia New&quot;,sans-serif;mso-ascii-font-family:\r\nCalibri;mso-ascii-theme-font:minor-latin;mso-hansi-font-family:Calibri;\r\nmso-hansi-theme-font:minor-latin;mso-bidi-font-family:&quot;Cordia New&quot;;mso-bidi-theme-font:\r\nminor-bidi\">à¸ªà¹ˆà¸§à¸™à¸›à¸£à¸°à¸à¸­à¸š</span><o:p></o:p></p>\r\n\r\n<p class=\"MsoNormal\"><span lang=\"TH\" style=\"font-size:14.0pt;mso-ansi-font-size:\r\n11.0pt;line-height:107%;font-family:&quot;Cordia New&quot;,sans-serif;mso-ascii-font-family:\r\nCalibri;mso-ascii-theme-font:minor-latin;mso-hansi-font-family:Calibri;\r\nmso-hansi-theme-font:minor-latin;mso-bidi-font-family:&quot;Cordia New&quot;;mso-bidi-theme-font:\r\nminor-bidi\">à¹€à¸›à¸¥à¸·à¸­à¸à¸”à¹‰à¸²à¸™à¸™à¸­à¸</span><o:p></o:p></p>\r\n\r\n<p class=\"MsoNormal\">100<span lang=\"TH\" style=\"mso-bidi-font-size:11.0pt;\r\nline-height:107%;font-family:&quot;Angsana New&quot;,serif;mso-ascii-font-family:Calibri;\r\nmso-ascii-theme-font:minor-latin;mso-hansi-font-family:Calibri;mso-hansi-theme-font:\r\nminor-latin\">% </span><span lang=\"TH\" style=\"font-size:14.0pt;mso-ansi-font-size:\r\n11.0pt;line-height:107%;font-family:&quot;Cordia New&quot;,sans-serif;mso-ascii-font-family:\r\nCalibri;mso-ascii-theme-font:minor-latin;mso-hansi-font-family:Calibri;\r\nmso-hansi-theme-font:minor-latin;mso-bidi-font-family:&quot;Cordia New&quot;;mso-bidi-theme-font:\r\nminor-bidi\">à¹€à¸ªà¹‰à¸™à¹ƒà¸¢à¸œà¹‰à¸²à¸à¹‰à¸²à¸¢</span><o:p></o:p></p>', '0526413600_2_2_1.jpg', '0526413600_2_3_1.jpg', '0526413600_6_1_1.jpg', 0, 'In Stock', '2018-05-14 11:49:15', ''),
(22, 3, 'Weekly Shonen Jump 50th Anniversary', 'uniqo', 550, 590, '<p class=\"MsoNormal\"><span lang=\"TH\" style=\"font-size:14.0pt;mso-ansi-font-size:\r\n11.0pt;line-height:107%;font-family:&quot;Cordia New&quot;,sans-serif;mso-ascii-font-family:\r\nCalibri;mso-ascii-theme-font:minor-latin;mso-hansi-font-family:Calibri;\r\nmso-hansi-theme-font:minor-latin;mso-bidi-font-family:&quot;Cordia New&quot;;mso-bidi-theme-font:\r\nminor-bidi\">â€œ</span>Weekly Shonen Jump<span lang=\"TH\" style=\"mso-bidi-font-size:\r\n11.0pt;line-height:107%;font-family:&quot;Angsana New&quot;,serif;mso-ascii-font-family:\r\nCalibri;mso-ascii-theme-font:minor-latin;mso-hansi-font-family:Calibri;\r\nmso-hansi-theme-font:minor-latin\">â€ </span><span lang=\"TH\" style=\"font-size:14.0pt;\r\nmso-ansi-font-size:11.0pt;line-height:107%;font-family:&quot;Cordia New&quot;,sans-serif;\r\nmso-ascii-font-family:Calibri;mso-ascii-theme-font:minor-latin;mso-hansi-font-family:\r\nCalibri;mso-hansi-theme-font:minor-latin;mso-bidi-font-family:&quot;Cordia New&quot;;\r\nmso-bidi-theme-font:minor-bidi\">à¸™à¸´à¸•à¸¢à¸ªà¸²à¸£à¸¡à¸±à¸‡à¸‡à¸°à¸£à¸²à¸¢à¸ªà¸±à¸›à¸”à¸²à¸«à¹Œà¹‚à¸”à¸¢ </span>Shueisha <span lang=\"TH\" style=\"font-size:14.0pt;mso-ansi-font-size:11.0pt;line-height:107%;\r\nfont-family:&quot;Cordia New&quot;,sans-serif;mso-ascii-font-family:Calibri;mso-ascii-theme-font:\r\nminor-latin;mso-hansi-font-family:Calibri;mso-hansi-theme-font:minor-latin;\r\nmso-bidi-font-family:&quot;Cordia New&quot;;mso-bidi-theme-font:minor-bidi\">à¸‰à¸¥à¸­à¸‡à¹‚à¸­à¸à¸²à¸ªà¸„à¸£à¸šà¸£à¸­à¸š\r\n50 à¸›à¸µà¹ƒà¸™à¸›à¸µ 2018\r\nà¸žà¸£à¹‰à¸­à¸¡à¸›à¸£à¸°à¸à¸²à¸¨à¸ˆà¸¸à¸”à¸¢à¸·à¸™à¹ƒà¸™à¸à¸²à¸£à¸™à¸³à¹€à¸ªà¸™à¸­à¸„à¸§à¸²à¸¡à¸šà¸±à¸™à¹€à¸—à¸´à¸‡à¹ƒà¸™à¸£à¸¹à¸›à¸‚à¸­à¸‡à¸¡à¸±à¸‡à¸‡à¸°à¹à¸à¹ˆà¸œà¸¹à¹‰à¸„à¸™à¸—à¸±à¹ˆà¸§à¹‚à¸¥à¸à¸­à¸¢à¹ˆà¸²à¸‡à¸•à¹ˆà¸­à¹€à¸™à¸·à¹ˆà¸­à¸‡</span><o:p></o:p></p>\r\n\r\n<p class=\"MsoNormal\"><o:p>&nbsp;</o:p></p>\r\n\r\n<p class=\"MsoNormal\">Â©JUMP <span lang=\"TH\" style=\"font-size:14.0pt;mso-ansi-font-size:\r\n11.0pt;line-height:107%;font-family:&quot;Cordia New&quot;,sans-serif;mso-ascii-font-family:\r\nCalibri;mso-ascii-theme-font:minor-latin;mso-hansi-font-family:Calibri;\r\nmso-hansi-theme-font:minor-latin;mso-bidi-font-family:&quot;Cordia New&quot;;mso-bidi-theme-font:\r\nminor-bidi\">50</span>th Anniversary <o:p></o:p></p>\r\n\r\n<p class=\"MsoNormal\"><o:p>&nbsp;</o:p></p>\r\n\r\n<p class=\"MsoNormal\">Dragon Ball <o:p></o:p></p>\r\n\r\n<p class=\"MsoNormal\"><o:p>&nbsp;</o:p></p>\r\n\r\n<p class=\"MsoNormal\"><span lang=\"TH\" style=\"font-size:14.0pt;mso-ansi-font-size:\r\n11.0pt;line-height:107%;font-family:&quot;Cordia New&quot;,sans-serif;mso-ascii-font-family:\r\nCalibri;mso-ascii-theme-font:minor-latin;mso-hansi-font-family:Calibri;\r\nmso-hansi-theme-font:minor-latin;mso-bidi-font-family:&quot;Cordia New&quot;;mso-bidi-theme-font:\r\nminor-bidi\">à¸œà¸¥à¸‡à¸²à¸™à¸¢à¸­à¸”à¸®à¸´à¸•à¸ˆà¸²à¸ </span>Akira Toriyama <span lang=\"TH\" style=\"font-size:14.0pt;mso-ansi-font-size:11.0pt;line-height:107%;font-family:\r\n&quot;Cordia New&quot;,sans-serif;mso-ascii-font-family:Calibri;mso-ascii-theme-font:\r\nminor-latin;mso-hansi-font-family:Calibri;mso-hansi-theme-font:minor-latin;\r\nmso-bidi-font-family:&quot;Cordia New&quot;;mso-bidi-theme-font:minor-bidi\">à¸•à¸µà¸žà¸´à¸¡à¸žà¹Œà¹ƒà¸™à¸Šà¹ˆà¸§à¸‡à¸›à¸µ\r\n1984 à¸–à¸¶à¸‡ 1995 à¹à¸¥à¸°à¸¢à¸±à¸‡à¸„à¸‡à¹€à¸›à¹‡à¸™à¸—à¸µà¹ˆà¸Šà¸·à¹ˆà¸™à¸Šà¸­à¸šà¸‚à¸­à¸‡à¸œà¸¹à¹‰à¸„à¸™à¸—à¸±à¹ˆà¸§à¹‚à¸¥à¸\r\nà¸ªà¸™à¸¸à¸à¸à¸±à¸šà¸à¸²à¸£à¸œà¸ˆà¸à¸ à¸±à¸¢à¸­à¸±à¸™à¸™à¹ˆà¸²à¸¡à¸«à¸±à¸¨à¸ˆà¸£à¸£à¸¢à¹Œà¸‚à¸­à¸‡ </span>Goku <span lang=\"TH\" style=\"font-size:\r\n14.0pt;mso-ansi-font-size:11.0pt;line-height:107%;font-family:&quot;Cordia New&quot;,sans-serif;\r\nmso-ascii-font-family:Calibri;mso-ascii-theme-font:minor-latin;mso-hansi-font-family:\r\nCalibri;mso-hansi-theme-font:minor-latin;mso-bidi-font-family:&quot;Cordia New&quot;;\r\nmso-bidi-theme-font:minor-bidi\">à¹à¸¥à¸°à¸œà¸­à¸‡à¹€à¸žà¸·à¹ˆà¸­à¸™</span><o:p></o:p></p>\r\n\r\n<p class=\"MsoNormal\"><o:p>&nbsp;</o:p></p>\r\n\r\n<p class=\"MsoNormal\">Â©BIRD STUDIO<span lang=\"TH\" style=\"mso-bidi-font-size:11.0pt;\r\nline-height:107%;font-family:&quot;Angsana New&quot;,serif;mso-ascii-font-family:Calibri;\r\nmso-ascii-theme-font:minor-latin;mso-hansi-font-family:Calibri;mso-hansi-theme-font:\r\nminor-latin\">/</span>SHUEISHA<o:p></o:p></p>\r\n\r\n<p class=\"MsoNormal\"><o:p>&nbsp;</o:p></p>\r\n\r\n<p class=\"MsoNormal\"><span lang=\"TH\" style=\"font-size:14.0pt;mso-ansi-font-size:\r\n11.0pt;line-height:107%;font-family:&quot;Cordia New&quot;,sans-serif;mso-ascii-font-family:\r\nCalibri;mso-ascii-theme-font:minor-latin;mso-hansi-font-family:Calibri;\r\nmso-hansi-theme-font:minor-latin;mso-bidi-font-family:&quot;Cordia New&quot;;mso-bidi-theme-font:\r\nminor-bidi\">à¸œà¸¥à¸´à¸•à¸ˆà¸²à¸ 100% à¸œà¹‰à¸²à¸„à¸­à¸•à¸•à¸­à¸™</span><o:p></o:p></p>\r\n\r\n<p class=\"MsoNormal\"><o:p>&nbsp;</o:p></p>\r\n\r\n<p class=\"MsoNormal\"><span lang=\"TH\" style=\"font-size:14.0pt;mso-ansi-font-size:\r\n11.0pt;line-height:107%;font-family:&quot;Cordia New&quot;,sans-serif;mso-ascii-font-family:\r\nCalibri;mso-ascii-theme-font:minor-latin;mso-hansi-font-family:Calibri;\r\nmso-hansi-theme-font:minor-latin;mso-bidi-font-family:&quot;Cordia New&quot;;mso-bidi-theme-font:\r\nminor-bidi\">à¸à¸²à¸£à¸”à¸¹à¹à¸¥à¸£à¸±à¸à¸©à¸² à¸‹à¸±à¸à¹€à¸„à¸£à¸·à¹ˆà¸­à¸‡ à¸”à¹‰à¸§à¸¢à¸™à¹‰à¸³à¹€à¸¢à¹‡à¸™ à¸•à¸±à¹‰à¸‡à¹‚à¸›à¸£à¹à¸à¸£à¸¡à¹„à¸”à¹‰à¸•à¸²à¸¡à¸•à¹‰à¸­à¸‡à¸à¸²à¸£</span><o:p></o:p></p>', '09_410898.jpg', '410898_sub5.jpg', '410898_sub6.jpg', 0, 'In Stock', '2018-05-14 11:59:31', ''),
(23, 3, 'à¹€à¸ªà¸·à¹‰à¸­à¸à¸±à¹Šà¸à¸¡à¸µà¸Šà¸´à¹‰à¸™à¸œà¹‰à¸²', 'hh', 550, 595, '<p class=\"MsoNormal\"><span lang=\"TH\" style=\"font-size:14.0pt;mso-ansi-font-size:\r\n11.0pt;line-height:107%;font-family:&quot;Cordia New&quot;,sans-serif;mso-ascii-font-family:\r\nCalibri;mso-ascii-theme-font:minor-latin;mso-hansi-font-family:Calibri;\r\nmso-hansi-theme-font:minor-latin;mso-bidi-font-family:&quot;Cordia New&quot;;mso-bidi-theme-font:\r\nminor-bidi\">à¹€à¸ªà¸·à¹‰à¸­à¸à¸±à¹Šà¸à¸›à¸´à¸”à¹„à¸‚à¸§à¹‰à¸„à¸­à¸›à¸à¹à¸‚à¸™à¸à¸¸à¸” à¸Šà¸²à¸¢à¸”à¹‰à¸²à¸™à¸™à¸­à¸à¸¡à¸µà¸Šà¸´à¹‰à¸™à¸œà¹‰à¸²à¸Šà¸™à¸´à¸”à¹€à¸”à¸µà¸¢à¸§à¸à¸±à¸™\r\nà¸à¸£à¸°à¹€à¸›à¹‹à¸²à¸«à¸™à¹‰à¸²à¸¡à¸µà¹à¸–à¸šà¸„à¸¹à¹ˆ à¸›à¸´à¸”à¹„à¸‚à¸§à¹‰à¸”à¹‰à¸²à¸™à¸«à¸™à¹‰à¸²</span><br>\r\n<br>\r\n<span lang=\"TH\" style=\"font-size:14.0pt;mso-ansi-font-size:11.0pt;line-height:\r\n107%;font-family:&quot;Cordia New&quot;,sans-serif;mso-ascii-font-family:Calibri;\r\nmso-ascii-theme-font:minor-latin;mso-hansi-font-family:Calibri;mso-hansi-theme-font:\r\nminor-latin;mso-bidi-font-family:&quot;Cordia New&quot;;mso-bidi-theme-font:minor-bidi\">à¸„à¸§à¸²à¸¡à¸ªà¸¹à¸‡à¸‚à¸­à¸‡à¹à¸šà¸š:\r\n</span>178 <span lang=\"TH\" style=\"font-size:14.0pt;mso-ansi-font-size:11.0pt;\r\nline-height:107%;font-family:&quot;Cordia New&quot;,sans-serif;mso-ascii-font-family:\r\nCalibri;mso-ascii-theme-font:minor-latin;mso-hansi-font-family:Calibri;\r\nmso-hansi-theme-font:minor-latin;mso-bidi-font-family:&quot;Cordia New&quot;;mso-bidi-theme-font:\r\nminor-bidi\">à¸‹à¸¡.</span><o:p></o:p></p><p class=\"MsoNormal\"><span lang=\"TH\" style=\"font-size:14.0pt;mso-ansi-font-size:\r\n11.0pt;line-height:107%;font-family:&quot;Cordia New&quot;,sans-serif;mso-ascii-font-family:\r\nCalibri;mso-ascii-theme-font:minor-latin;mso-hansi-font-family:Calibri;\r\nmso-hansi-theme-font:minor-latin;mso-bidi-font-family:&quot;Cordia New&quot;;mso-bidi-theme-font:\r\nminor-bidi\">à¸ªà¹ˆà¸§à¸™à¸›à¸£à¸°à¸à¸­à¸š</span><o:p></o:p></p><p class=\"MsoNormal\"><span lang=\"TH\" style=\"font-size:14.0pt;mso-ansi-font-size:\r\n11.0pt;line-height:107%;font-family:&quot;Cordia New&quot;,sans-serif;mso-ascii-font-family:\r\nCalibri;mso-ascii-theme-font:minor-latin;mso-hansi-font-family:Calibri;\r\nmso-hansi-theme-font:minor-latin;mso-bidi-font-family:&quot;Cordia New&quot;;mso-bidi-theme-font:\r\nminor-bidi\">à¹€à¸›à¸¥à¸·à¸­à¸à¸”à¹‰à¸²à¸™à¸™à¸­à¸</span><o:p></o:p></p><p class=\"MsoNormal\">93<span lang=\"TH\" style=\"mso-bidi-font-size:11.0pt;line-height:\r\n107%;font-family:&quot;Angsana New&quot;,serif;mso-ascii-font-family:Calibri;mso-ascii-theme-font:\r\nminor-latin;mso-hansi-font-family:Calibri;mso-hansi-theme-font:minor-latin\">% </span><span lang=\"TH\" style=\"font-size:14.0pt;mso-ansi-font-size:11.0pt;line-height:107%;\r\nfont-family:&quot;Cordia New&quot;,sans-serif;mso-ascii-font-family:Calibri;mso-ascii-theme-font:\r\nminor-latin;mso-hansi-font-family:Calibri;mso-hansi-theme-font:minor-latin;\r\nmso-bidi-font-family:&quot;Cordia New&quot;;mso-bidi-theme-font:minor-bidi\">à¹€à¸ªà¹‰à¸™à¹ƒà¸¢à¸ªà¸±à¸‡à¹€à¸„à¸£à¸²à¸°à¸«à¹Œ</span>,\r\n7<span lang=\"TH\" style=\"mso-bidi-font-size:11.0pt;line-height:107%;font-family:\r\n&quot;Angsana New&quot;,serif;mso-ascii-font-family:Calibri;mso-ascii-theme-font:minor-latin;\r\nmso-hansi-font-family:Calibri;mso-hansi-theme-font:minor-latin\">% </span><span lang=\"TH\" style=\"font-size:14.0pt;mso-ansi-font-size:11.0pt;line-height:107%;\r\nfont-family:&quot;Cordia New&quot;,sans-serif;mso-ascii-font-family:Calibri;mso-ascii-theme-font:\r\nminor-latin;mso-hansi-font-family:Calibri;mso-hansi-theme-font:minor-latin;\r\nmso-bidi-font-family:&quot;Cordia New&quot;;mso-bidi-theme-font:minor-bidi\">à¹€à¸ªà¹‰à¸™à¸”à¹‰à¸²à¸¢à¸­à¸µà¸¥à¸²à¸ªà¹€à¸—à¸™</span><o:p></o:p></p><p class=\"MsoNormal\"><span lang=\"TH\" style=\"font-size:14.0pt;mso-ansi-font-size:\r\n11.0pt;line-height:107%;font-family:&quot;Cordia New&quot;,sans-serif;mso-ascii-font-family:\r\nCalibri;mso-ascii-theme-font:minor-latin;mso-hansi-font-family:Calibri;\r\nmso-hansi-theme-font:minor-latin;mso-bidi-font-family:&quot;Cordia New&quot;;mso-bidi-theme-font:\r\nminor-bidi\">à¸‹à¸±à¸šà¹ƒà¸™</span><o:p></o:p></p><p class=\"MsoNormal\">\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n</p><p class=\"MsoNormal\">100<span lang=\"TH\" style=\"mso-bidi-font-size:11.0pt;\r\nline-height:107%;font-family:&quot;Angsana New&quot;,serif;mso-ascii-font-family:Calibri;\r\nmso-ascii-theme-font:minor-latin;mso-hansi-font-family:Calibri;mso-hansi-theme-font:\r\nminor-latin\">% </span><span lang=\"TH\" style=\"font-size:14.0pt;mso-ansi-font-size:\r\n11.0pt;line-height:107%;font-family:&quot;Cordia New&quot;,sans-serif;mso-ascii-font-family:\r\nCalibri;mso-ascii-theme-font:minor-latin;mso-hansi-font-family:Calibri;\r\nmso-hansi-theme-font:minor-latin;mso-bidi-font-family:&quot;Cordia New&quot;;mso-bidi-theme-font:\r\nminor-bidi\">à¹€à¸ªà¹‰à¸™à¹ƒà¸¢à¸­à¸°à¸‹à¸´à¹€à¸•à¸—</span><o:p></o:p></p>\r\n\r\n<p class=\"MsoNormal\"><o:p>&nbsp;</o:p></p>', '8073042505_6_1_1.jpg', '8073042505_2_5_1.jpg', '8073042505_2_3_1.jpg', 0, 'In Stock', '2018-05-14 12:05:17', ''),
(24, 3, 'à¸—à¸µà¹€à¸Šà¸´à¹‰à¸•à¸¥à¸²à¸¢à¸•à¸±à¸§à¸­à¸±à¸à¸©à¸£à¸ªà¸µà¸•à¸±à¸”', '9ty9', 515, 890, '<p class=\"MsoNormal\"><span lang=\"TH\" style=\"font-size:14.0pt;mso-ansi-font-size:\r\n11.0pt;line-height:107%;font-family:&quot;Cordia New&quot;,sans-serif;mso-ascii-font-family:\r\nCalibri;mso-ascii-theme-font:minor-latin;mso-hansi-font-family:Calibri;\r\nmso-hansi-theme-font:minor-latin;mso-bidi-font-family:&quot;Cordia New&quot;;mso-bidi-theme-font:\r\nminor-bidi\">à¸—à¸µà¹€à¸Šà¸´à¹‰à¸•à¸¥à¸²à¸¢à¸•à¸±à¸§à¸­à¸±à¸à¸©à¸£à¸ªà¸µà¸•à¸±à¸”</span><o:p></o:p></p>\r\n\r\n<br>\r\n\r\n<p class=\"MsoNormal\"><span lang=\"TH\" style=\"font-size:14.0pt;mso-ansi-font-size:\r\n11.0pt;line-height:107%;font-family:&quot;Cordia New&quot;,sans-serif;mso-ascii-font-family:\r\nCalibri;mso-ascii-theme-font:minor-latin;mso-hansi-font-family:Calibri;\r\nmso-hansi-theme-font:minor-latin;mso-bidi-font-family:&quot;Cordia New&quot;;mso-bidi-theme-font:\r\nminor-bidi\">à¹€à¸ªà¸·à¹‰à¸­à¸—à¸µà¹€à¸Šà¸´à¹‰à¸•à¸„à¸­à¸à¸¥à¸¡à¹à¸‚à¸™à¸ªà¸±à¹‰à¸™ à¸•à¸±à¸§à¸­à¸±à¸à¸©à¸£à¸žà¸´à¸¡à¸žà¹Œà¸ªà¸µà¸•à¸±à¸”à¸”à¹‰à¸²à¸™à¸«à¸™à¹‰à¸²</span><br>\r\n<br>\r\n<span lang=\"TH\" style=\"font-size:14.0pt;mso-ansi-font-size:11.0pt;line-height:\r\n107%;font-family:&quot;Cordia New&quot;,sans-serif;mso-ascii-font-family:Calibri;\r\nmso-ascii-theme-font:minor-latin;mso-hansi-font-family:Calibri;mso-hansi-theme-font:\r\nminor-latin;mso-bidi-font-family:&quot;Cordia New&quot;;mso-bidi-theme-font:minor-bidi\">à¸„à¸§à¸²à¸¡à¸ªà¸¹à¸‡à¸‚à¸­à¸‡à¹à¸šà¸š:\r\n</span>178 <span lang=\"TH\" style=\"font-size:14.0pt;mso-ansi-font-size:11.0pt;\r\nline-height:107%;font-family:&quot;Cordia New&quot;,sans-serif;mso-ascii-font-family:\r\nCalibri;mso-ascii-theme-font:minor-latin;mso-hansi-font-family:Calibri;\r\nmso-hansi-theme-font:minor-latin;mso-bidi-font-family:&quot;Cordia New&quot;;mso-bidi-theme-font:\r\nminor-bidi\">à¸‹à¸¡.</span><o:p></o:p></p>\r\n\r\n<p class=\"MsoNormal\"><span lang=\"TH\" style=\"font-size:14.0pt;mso-ansi-font-size:\r\n11.0pt;line-height:107%;font-family:&quot;Cordia New&quot;,sans-serif;mso-ascii-font-family:\r\nCalibri;mso-ascii-theme-font:minor-latin;mso-hansi-font-family:Calibri;\r\nmso-hansi-theme-font:minor-latin;mso-bidi-font-family:&quot;Cordia New&quot;;mso-bidi-theme-font:\r\nminor-bidi\">à¸ªà¹ˆà¸§à¸™à¸›à¸£à¸°à¸à¸­à¸š</span><o:p></o:p></p>\r\n\r\n<p class=\"MsoNormal\"><span lang=\"TH\" style=\"font-size:14.0pt;mso-ansi-font-size:\r\n11.0pt;line-height:107%;font-family:&quot;Cordia New&quot;,sans-serif;mso-ascii-font-family:\r\nCalibri;mso-ascii-theme-font:minor-latin;mso-hansi-font-family:Calibri;\r\nmso-hansi-theme-font:minor-latin;mso-bidi-font-family:&quot;Cordia New&quot;;mso-bidi-theme-font:\r\nminor-bidi\">à¹€à¸›à¸¥à¸·à¸­à¸à¸”à¹‰à¸²à¸™à¸™à¸­à¸</span><o:p></o:p></p>\r\n\r\n<p class=\"MsoNormal\">100<span lang=\"TH\" style=\"mso-bidi-font-size:11.0pt;\r\nline-height:107%;font-family:&quot;Angsana New&quot;,serif;mso-ascii-font-family:Calibri;\r\nmso-ascii-theme-font:minor-latin;mso-hansi-font-family:Calibri;mso-hansi-theme-font:\r\nminor-latin\">% </span><span lang=\"TH\" style=\"font-size:14.0pt;mso-ansi-font-size:\r\n11.0pt;line-height:107%;font-family:&quot;Cordia New&quot;,sans-serif;mso-ascii-font-family:\r\nCalibri;mso-ascii-theme-font:minor-latin;mso-hansi-font-family:Calibri;\r\nmso-hansi-theme-font:minor-latin;mso-bidi-font-family:&quot;Cordia New&quot;;mso-bidi-theme-font:\r\nminor-bidi\">à¹€à¸ªà¹‰à¸™à¹ƒà¸¢à¸œà¹‰à¸²à¸à¹‰à¸²à¸¢</span><o:p></o:p></p>', '0085154902_6_1_1.jpg', '0085154902_2_3_1.jpg', '0085154902_2_1_1.jpg', 0, 'In Stock', '2018-05-14 12:07:12', ''),
(25, 3, 'à¹€à¸ªà¸·à¹‰à¸­à¸—à¸µà¹€à¸Šà¸´à¹‰à¸•à¸¥à¸²à¸¢à¸—à¸²à¸‡', 'h&n', 452, 584, '<br>\r\n\r\n<p class=\"MsoNormal\"><span lang=\"TH\" style=\"font-size:14.0pt;mso-ansi-font-size:\r\n11.0pt;line-height:107%;font-family:&quot;Cordia New&quot;,sans-serif;mso-ascii-font-family:\r\nCalibri;mso-ascii-theme-font:minor-latin;mso-hansi-font-family:Calibri;\r\nmso-hansi-theme-font:minor-latin;mso-bidi-font-family:&quot;Cordia New&quot;;mso-bidi-theme-font:\r\nminor-bidi\">à¹€à¸ªà¸·à¹‰à¸­à¸—à¸µà¹€à¸Šà¸´à¹‰à¸•à¸«à¸¥à¸§à¸¡à¸„à¸­à¸à¸¥à¸¡à¹à¸‚à¸™à¸ªà¸±à¹‰à¸™à¸žà¸´à¸¡à¸žà¹Œà¸¥à¸²à¸¢à¸”à¹‰à¸²à¸™à¸«à¸™à¹‰à¸²</span><br>\r\n<br>\r\n<span lang=\"TH\" style=\"font-size:14.0pt;mso-ansi-font-size:11.0pt;line-height:\r\n107%;font-family:&quot;Cordia New&quot;,sans-serif;mso-ascii-font-family:Calibri;\r\nmso-ascii-theme-font:minor-latin;mso-hansi-font-family:Calibri;mso-hansi-theme-font:\r\nminor-latin;mso-bidi-font-family:&quot;Cordia New&quot;;mso-bidi-theme-font:minor-bidi\">à¸„à¸§à¸²à¸¡à¸ªà¸¹à¸‡à¸‚à¸­à¸‡à¹à¸šà¸š:\r\n</span>178 <span lang=\"TH\" style=\"font-size:14.0pt;mso-ansi-font-size:11.0pt;\r\nline-height:107%;font-family:&quot;Cordia New&quot;,sans-serif;mso-ascii-font-family:\r\nCalibri;mso-ascii-theme-font:minor-latin;mso-hansi-font-family:Calibri;\r\nmso-hansi-theme-font:minor-latin;mso-bidi-font-family:&quot;Cordia New&quot;;mso-bidi-theme-font:\r\nminor-bidi\">à¸‹à¸¡.</span><o:p></o:p></p>\r\n\r\n<p class=\"MsoNormal\"><span lang=\"TH\" style=\"font-size:14.0pt;mso-ansi-font-size:\r\n11.0pt;line-height:107%;font-family:&quot;Cordia New&quot;,sans-serif;mso-ascii-font-family:\r\nCalibri;mso-ascii-theme-font:minor-latin;mso-hansi-font-family:Calibri;\r\nmso-hansi-theme-font:minor-latin;mso-bidi-font-family:&quot;Cordia New&quot;;mso-bidi-theme-font:\r\nminor-bidi\">à¸ªà¹ˆà¸§à¸™à¸›à¸£à¸°à¸à¸­à¸š</span><o:p></o:p></p>\r\n\r\n<p class=\"MsoNormal\"><span lang=\"TH\" style=\"font-size:14.0pt;mso-ansi-font-size:\r\n11.0pt;line-height:107%;font-family:&quot;Cordia New&quot;,sans-serif;mso-ascii-font-family:\r\nCalibri;mso-ascii-theme-font:minor-latin;mso-hansi-font-family:Calibri;\r\nmso-hansi-theme-font:minor-latin;mso-bidi-font-family:&quot;Cordia New&quot;;mso-bidi-theme-font:\r\nminor-bidi\">à¹€à¸›à¸¥à¸·à¸­à¸à¸”à¹‰à¸²à¸™à¸™à¸­à¸</span><o:p></o:p></p>\r\n\r\n<p class=\"MsoNormal\">100<span lang=\"TH\" style=\"mso-bidi-font-size:11.0pt;\r\nline-height:107%;font-family:&quot;Angsana New&quot;,serif;mso-ascii-font-family:Calibri;\r\nmso-ascii-theme-font:minor-latin;mso-hansi-font-family:Calibri;mso-hansi-theme-font:\r\nminor-latin\">% </span><span lang=\"TH\" style=\"font-size:14.0pt;mso-ansi-font-size:\r\n11.0pt;line-height:107%;font-family:&quot;Cordia New&quot;,sans-serif;mso-ascii-font-family:\r\nCalibri;mso-ascii-theme-font:minor-latin;mso-hansi-font-family:Calibri;\r\nmso-hansi-theme-font:minor-latin;mso-bidi-font-family:&quot;Cordia New&quot;;mso-bidi-theme-font:\r\nminor-bidi\">à¹€à¸ªà¹‰à¸™à¹ƒà¸¢à¸œà¹‰à¸²à¸à¹‰à¸²à¸¢</span><o:p></o:p></p>', '1165013500_6_1_1.jpg', '1165013500_2_6_1.jpg', '1165013500_2_2_1.jpg', 0, 'In Stock', '2018-05-14 12:08:53', ''),
(26, 3, 'à¹€à¸ªà¸·à¹‰à¸­à¹€à¸­à¸§à¸¥à¸­à¸¢à¸—à¸£à¸‡à¸šà¸­à¸¥à¸¥à¸¹à¸™', 'h&n', 540, 890, '<p class=\"MsoNormal\"><span lang=\"TH\" style=\"font-size:14.0pt;mso-ansi-font-size:\r\n11.0pt;line-height:107%;font-family:&quot;Cordia New&quot;,sans-serif;mso-ascii-font-family:\r\nCalibri;mso-ascii-theme-font:minor-latin;mso-hansi-font-family:Calibri;\r\nmso-hansi-theme-font:minor-latin;mso-bidi-font-family:&quot;Cordia New&quot;;mso-bidi-theme-font:\r\nminor-bidi\">à¸ªà¸µ:</span>&nbsp;<span lang=\"TH\" style=\"font-size:14.0pt;mso-ansi-font-size:\r\n11.0pt;line-height:107%;font-family:&quot;Cordia New&quot;,sans-serif;mso-ascii-font-family:\r\nCalibri;mso-ascii-theme-font:minor-latin;mso-hansi-font-family:Calibri;\r\nmso-hansi-theme-font:minor-latin;mso-bidi-font-family:&quot;Cordia New&quot;;mso-bidi-theme-font:\r\nminor-bidi\">à¸ªà¸µà¸Šà¸¡à¸žà¸¹à¸™à¸¹à¹‰à¸”</span><o:p></o:p></p>\r\n\r\n<p class=\"MsoNormal\"><span lang=\"TH\" style=\"font-size:14.0pt;mso-ansi-font-size:\r\n11.0pt;line-height:107%;font-family:&quot;Cordia New&quot;,sans-serif;mso-ascii-font-family:\r\nCalibri;mso-ascii-theme-font:minor-latin;mso-hansi-font-family:Calibri;\r\nmso-hansi-theme-font:minor-latin;mso-bidi-font-family:&quot;Cordia New&quot;;mso-bidi-theme-font:\r\nminor-bidi\">à¹€à¸ªà¸·à¹‰à¸­à¸ªà¸²à¸¢à¹€à¸”à¸µà¹ˆà¸¢à¸§à¸ˆà¸±à¹Šà¸¡à¸—à¸µà¹ˆà¸Šà¸²à¸¢à¹€à¸ªà¸·à¹‰à¸­</span><br>\r\n<br>\r\n<span lang=\"TH\" style=\"font-size:14.0pt;mso-ansi-font-size:11.0pt;line-height:\r\n107%;font-family:&quot;Cordia New&quot;,sans-serif;mso-ascii-font-family:Calibri;\r\nmso-ascii-theme-font:minor-latin;mso-hansi-font-family:Calibri;mso-hansi-theme-font:\r\nminor-latin;mso-bidi-font-family:&quot;Cordia New&quot;;mso-bidi-theme-font:minor-bidi\">à¸„à¸§à¸²à¸¡à¸ªà¸¹à¸‡à¸‚à¸­à¸‡à¹à¸šà¸š:\r\n</span>177 <span lang=\"TH\" style=\"font-size:14.0pt;mso-ansi-font-size:11.0pt;\r\nline-height:107%;font-family:&quot;Cordia New&quot;,sans-serif;mso-ascii-font-family:\r\nCalibri;mso-ascii-theme-font:minor-latin;mso-hansi-font-family:Calibri;\r\nmso-hansi-theme-font:minor-latin;mso-bidi-font-family:&quot;Cordia New&quot;;mso-bidi-theme-font:\r\nminor-bidi\">à¸‹à¸¡.</span><o:p></o:p></p>\r\n\r\n<p class=\"MsoNormal\"><span lang=\"TH\" style=\"font-size:14.0pt;mso-ansi-font-size:\r\n11.0pt;line-height:107%;font-family:&quot;Cordia New&quot;,sans-serif;mso-ascii-font-family:\r\nCalibri;mso-ascii-theme-font:minor-latin;mso-hansi-font-family:Calibri;\r\nmso-hansi-theme-font:minor-latin;mso-bidi-font-family:&quot;Cordia New&quot;;mso-bidi-theme-font:\r\nminor-bidi\">à¸ªà¹ˆà¸§à¸™à¸›à¸£à¸°à¸à¸­à¸š</span><o:p></o:p></p>\r\n\r\n<p class=\"MsoNormal\"><span lang=\"TH\" style=\"font-size:14.0pt;mso-ansi-font-size:\r\n11.0pt;line-height:107%;font-family:&quot;Cordia New&quot;,sans-serif;mso-ascii-font-family:\r\nCalibri;mso-ascii-theme-font:minor-latin;mso-hansi-font-family:Calibri;\r\nmso-hansi-theme-font:minor-latin;mso-bidi-font-family:&quot;Cordia New&quot;;mso-bidi-theme-font:\r\nminor-bidi\">à¹€à¸›à¸¥à¸·à¸­à¸à¸”à¹‰à¸²à¸™à¸™à¸­à¸</span><o:p></o:p></p>\r\n\r\n<p class=\"MsoNormal\">100<span lang=\"TH\" style=\"mso-bidi-font-size:11.0pt;\r\nline-height:107%;font-family:&quot;Angsana New&quot;,serif;mso-ascii-font-family:Calibri;\r\nmso-ascii-theme-font:minor-latin;mso-hansi-font-family:Calibri;mso-hansi-theme-font:\r\nminor-latin\">% </span><span lang=\"TH\" style=\"font-size:14.0pt;mso-ansi-font-size:\r\n11.0pt;line-height:107%;font-family:&quot;Cordia New&quot;,sans-serif;mso-ascii-font-family:\r\nCalibri;mso-ascii-theme-font:minor-latin;mso-hansi-font-family:Calibri;\r\nmso-hansi-theme-font:minor-latin;mso-bidi-font-family:&quot;Cordia New&quot;;mso-bidi-theme-font:\r\nminor-bidi\">à¹€à¸ªà¹‰à¸™à¹ƒà¸¢à¹„à¸¥à¹‚à¸­à¹€à¸‹à¸¥</span><o:p></o:p></p>', '1165017942_2_1_1.jpg', '1165017942_2_3_1.jpg', '1165017942_6_1_1.jpg', 0, 'In Stock', '2018-05-14 12:10:23', ''),
(27, 3, 'à¹€à¸ªà¸·à¹‰à¸­à¸ªà¸µà¸•à¸±à¸”à¸¡à¸µà¸ªà¸²à¸¢à¹€à¸ªà¹‰à¸™à¹€à¸¥à¹‡à¸à¸£à¸²à¸¢à¸¥à¸°à¹€à¸­à¸µà¸¢à¸”', 'Zala', 750, 890, '<p class=\"MsoNormal\"><span lang=\"TH\" style=\"font-size:14.0pt;mso-ansi-font-size:\r\n11.0pt;line-height:107%;font-family:&quot;Cordia New&quot;,sans-serif;mso-ascii-font-family:\r\nCalibri;mso-ascii-theme-font:minor-latin;mso-hansi-font-family:Calibri;\r\nmso-hansi-theme-font:minor-latin;mso-bidi-font-family:&quot;Cordia New&quot;;mso-bidi-theme-font:\r\nminor-bidi\">à¹€à¸ªà¸·à¹‰à¸­à¸ªà¸²à¸¢à¹€à¸ªà¹‰à¸™à¹€à¸¥à¹‡à¸à¸„à¸­à¸§à¸µ à¸—à¸£à¸‡à¹€à¸­</span><br>\r\n<br>\r\n<span lang=\"TH\" style=\"font-size:14.0pt;mso-ansi-font-size:11.0pt;line-height:\r\n107%;font-family:&quot;Cordia New&quot;,sans-serif;mso-ascii-font-family:Calibri;\r\nmso-ascii-theme-font:minor-latin;mso-hansi-font-family:Calibri;mso-hansi-theme-font:\r\nminor-latin;mso-bidi-font-family:&quot;Cordia New&quot;;mso-bidi-theme-font:minor-bidi\">à¸„à¸§à¸²à¸¡à¸ªà¸¹à¸‡à¸‚à¸­à¸‡à¹à¸šà¸š:\r\n</span>178 <span lang=\"TH\" style=\"font-size:14.0pt;mso-ansi-font-size:11.0pt;\r\nline-height:107%;font-family:&quot;Cordia New&quot;,sans-serif;mso-ascii-font-family:\r\nCalibri;mso-ascii-theme-font:minor-latin;mso-hansi-font-family:Calibri;\r\nmso-hansi-theme-font:minor-latin;mso-bidi-font-family:&quot;Cordia New&quot;;mso-bidi-theme-font:\r\nminor-bidi\">à¸‹à¸¡.</span><o:p></o:p></p>\r\n\r\n<p class=\"MsoNormal\"><span lang=\"TH\" style=\"font-size:14.0pt;mso-ansi-font-size:\r\n11.0pt;line-height:107%;font-family:&quot;Cordia New&quot;,sans-serif;mso-ascii-font-family:\r\nCalibri;mso-ascii-theme-font:minor-latin;mso-hansi-font-family:Calibri;\r\nmso-hansi-theme-font:minor-latin;mso-bidi-font-family:&quot;Cordia New&quot;;mso-bidi-theme-font:\r\nminor-bidi\">à¸ªà¹ˆà¸§à¸™à¸›à¸£à¸°à¸à¸­à¸š</span><o:p></o:p></p>\r\n\r\n<p class=\"MsoNormal\"><span lang=\"TH\" style=\"font-size:14.0pt;mso-ansi-font-size:\r\n11.0pt;line-height:107%;font-family:&quot;Cordia New&quot;,sans-serif;mso-ascii-font-family:\r\nCalibri;mso-ascii-theme-font:minor-latin;mso-hansi-font-family:Calibri;\r\nmso-hansi-theme-font:minor-latin;mso-bidi-font-family:&quot;Cordia New&quot;;mso-bidi-theme-font:\r\nminor-bidi\">à¹€à¸›à¸¥à¸·à¸­à¸à¸”à¹‰à¸²à¸™à¸™à¸­à¸</span><o:p></o:p></p>\r\n\r\n<p class=\"MsoNormal\">61<span lang=\"TH\" style=\"mso-bidi-font-size:11.0pt;line-height:\r\n107%;font-family:&quot;Angsana New&quot;,serif;mso-ascii-font-family:Calibri;mso-ascii-theme-font:\r\nminor-latin;mso-hansi-font-family:Calibri;mso-hansi-theme-font:minor-latin\">% </span><span lang=\"TH\" style=\"font-size:14.0pt;mso-ansi-font-size:11.0pt;line-height:107%;\r\nfont-family:&quot;Cordia New&quot;,sans-serif;mso-ascii-font-family:Calibri;mso-ascii-theme-font:\r\nminor-latin;mso-hansi-font-family:Calibri;mso-hansi-theme-font:minor-latin;\r\nmso-bidi-font-family:&quot;Cordia New&quot;;mso-bidi-theme-font:minor-bidi\">à¹€à¸ªà¹‰à¸™à¹ƒà¸¢à¸ªà¸±à¸‡à¹€à¸„à¸£à¸²à¸°à¸«à¹Œ</span>,\r\n31<span lang=\"TH\" style=\"mso-bidi-font-size:11.0pt;line-height:107%;font-family:\r\n&quot;Angsana New&quot;,serif;mso-ascii-font-family:Calibri;mso-ascii-theme-font:minor-latin;\r\nmso-hansi-font-family:Calibri;mso-hansi-theme-font:minor-latin\">% </span><span lang=\"TH\" style=\"font-size:14.0pt;mso-ansi-font-size:11.0pt;line-height:107%;\r\nfont-family:&quot;Cordia New&quot;,sans-serif;mso-ascii-font-family:Calibri;mso-ascii-theme-font:\r\nminor-latin;mso-hansi-font-family:Calibri;mso-hansi-theme-font:minor-latin;\r\nmso-bidi-font-family:&quot;Cordia New&quot;;mso-bidi-theme-font:minor-bidi\">à¹€à¸ªà¹‰à¸™à¹ƒà¸¢à¸§à¸´à¸ªà¹‚à¸„à¸ª</span>,\r\n8<span lang=\"TH\" style=\"mso-bidi-font-size:11.0pt;line-height:107%;font-family:\r\n&quot;Angsana New&quot;,serif;mso-ascii-font-family:Calibri;mso-ascii-theme-font:minor-latin;\r\nmso-hansi-font-family:Calibri;mso-hansi-theme-font:minor-latin\">% </span><span lang=\"TH\" style=\"font-size:14.0pt;mso-ansi-font-size:11.0pt;line-height:107%;\r\nfont-family:&quot;Cordia New&quot;,sans-serif;mso-ascii-font-family:Calibri;mso-ascii-theme-font:\r\nminor-latin;mso-hansi-font-family:Calibri;mso-hansi-theme-font:minor-latin;\r\nmso-bidi-font-family:&quot;Cordia New&quot;;mso-bidi-theme-font:minor-bidi\">à¹€à¸ªà¹‰à¸™à¸”à¹‰à¸²à¸¢à¸­à¸µà¸¥à¸²à¸ªà¹€à¸—à¸™</span><o:p></o:p></p>', '2891725620_1_1_1.jpg', '2891725620_2_4_1.jpg', '2891725620_6_1_1.jpg', 0, 'In Stock', '2018-05-14 12:12:15', ''),
(28, 6, 'à¸£à¸­à¸‡à¹€à¸—à¹‰à¸²à¹à¸•à¸°à¸ªà¸²à¸¢à¸„à¸²à¸”à¸ªà¸µà¸¡à¸±à¸™à¸§à¸²à¸§', 'Zara', 540, 980, '<p class=\"MsoNormal\"><span lang=\"TH\" style=\"font-size:14.0pt;mso-ansi-font-size:\r\n11.0pt;line-height:107%;font-family:&quot;Cordia New&quot;,sans-serif;mso-ascii-font-family:\r\nCalibri;mso-ascii-theme-font:minor-latin;mso-hansi-font-family:Calibri;\r\nmso-hansi-theme-font:minor-latin;mso-bidi-font-family:&quot;Cordia New&quot;;mso-bidi-theme-font:\r\nminor-bidi\">à¸”à¹‰à¸²à¸™à¸šà¸™</span><o:p></o:p></p>\r\n\r\n<p class=\"MsoNormal\">100<span lang=\"TH\" style=\"mso-bidi-font-size:11.0pt;\r\nline-height:107%;font-family:&quot;Angsana New&quot;,serif;mso-ascii-font-family:Calibri;\r\nmso-ascii-theme-font:minor-latin;mso-hansi-font-family:Calibri;mso-hansi-theme-font:\r\nminor-latin\">% </span><span lang=\"TH\" style=\"font-size:14.0pt;mso-ansi-font-size:\r\n11.0pt;line-height:107%;font-family:&quot;Cordia New&quot;,sans-serif;mso-ascii-font-family:\r\nCalibri;mso-ascii-theme-font:minor-latin;mso-hansi-font-family:Calibri;\r\nmso-hansi-theme-font:minor-latin;mso-bidi-font-family:&quot;Cordia New&quot;;mso-bidi-theme-font:\r\nminor-bidi\">à¹€à¸ªà¹‰à¸™à¹ƒà¸¢à¸ªà¸±à¸‡à¹€à¸„à¸£à¸²à¸°à¸«à¹Œ</span><o:p></o:p></p>\r\n\r\n<p class=\"MsoNormal\"><span lang=\"TH\" style=\"font-size:14.0pt;mso-ansi-font-size:\r\n11.0pt;line-height:107%;font-family:&quot;Cordia New&quot;,sans-serif;mso-ascii-font-family:\r\nCalibri;mso-ascii-theme-font:minor-latin;mso-hansi-font-family:Calibri;\r\nmso-hansi-theme-font:minor-latin;mso-bidi-font-family:&quot;Cordia New&quot;;mso-bidi-theme-font:\r\nminor-bidi\">à¸žà¸·à¹‰à¸™à¸£à¸­à¸‡à¹€à¸—à¹‰à¸²</span><o:p></o:p></p>\r\n\r\n<p class=\"MsoNormal\">100<span lang=\"TH\" style=\"mso-bidi-font-size:11.0pt;\r\nline-height:107%;font-family:&quot;Angsana New&quot;,serif;mso-ascii-font-family:Calibri;\r\nmso-ascii-theme-font:minor-latin;mso-hansi-font-family:Calibri;mso-hansi-theme-font:\r\nminor-latin\">% </span><span lang=\"TH\" style=\"font-size:14.0pt;mso-ansi-font-size:\r\n11.0pt;line-height:107%;font-family:&quot;Cordia New&quot;,sans-serif;mso-ascii-font-family:\r\nCalibri;mso-ascii-theme-font:minor-latin;mso-hansi-font-family:Calibri;\r\nmso-hansi-theme-font:minor-latin;mso-bidi-font-family:&quot;Cordia New&quot;;mso-bidi-theme-font:\r\nminor-bidi\">à¸¢à¸²à¸‡</span><o:p></o:p></p>\r\n\r\n<p class=\"MsoNormal\"><span lang=\"TH\" style=\"font-size:14.0pt;mso-ansi-font-size:\r\n11.0pt;line-height:107%;font-family:&quot;Cordia New&quot;,sans-serif;mso-ascii-font-family:\r\nCalibri;mso-ascii-theme-font:minor-latin;mso-hansi-font-family:Calibri;\r\nmso-hansi-theme-font:minor-latin;mso-bidi-font-family:&quot;Cordia New&quot;;mso-bidi-theme-font:\r\nminor-bidi\">à¸žà¸·à¹‰à¸™à¸£à¸­à¸‡à¹€à¸—à¹‰à¸²à¹à¸•à¸°</span><o:p></o:p></p>\r\n\r\n<p class=\"MsoNormal\">100<span lang=\"TH\" style=\"mso-bidi-font-size:11.0pt;\r\nline-height:107%;font-family:&quot;Angsana New&quot;,serif;mso-ascii-font-family:Calibri;\r\nmso-ascii-theme-font:minor-latin;mso-hansi-font-family:Calibri;mso-hansi-theme-font:\r\nminor-latin\">% </span><span lang=\"TH\" style=\"font-size:14.0pt;mso-ansi-font-size:\r\n11.0pt;line-height:107%;font-family:&quot;Cordia New&quot;,sans-serif;mso-ascii-font-family:\r\nCalibri;mso-ascii-theme-font:minor-latin;mso-hansi-font-family:Calibri;\r\nmso-hansi-theme-font:minor-latin;mso-bidi-font-family:&quot;Cordia New&quot;;mso-bidi-theme-font:\r\nminor-bidi\">à¹€à¸—à¸­à¸£à¹Œà¹‚à¸¡à¸žà¸¥à¸²à¸ªà¸•à¸´à¸à¹‚à¸žà¸¥à¸´à¸¢à¸¹à¸£à¸µà¹€à¸—à¸™</span><o:p></o:p></p>', '2646301040_2_1_1.jpg', '2646301040_2_4_1.jpg', '2646301040_1_1_1.jpg', 0, 'In Stock', '2018-05-14 15:16:38', ''),
(29, 6, 'à¸£à¸­à¸‡à¹€à¸—à¹‰à¸²à¸à¸µà¸¬à¸²à¸¡à¸±à¸™à¸§à¸²à¸§à¸«à¸¥à¸²à¸à¸ªà¸µ', 'Aedo', 750, 850, '<p class=\"MsoNormal\"><span lang=\"TH\" style=\"font-size:14.0pt;mso-ansi-font-size:\r\n11.0pt;line-height:107%;font-family:&quot;Cordia New&quot;,sans-serif;mso-ascii-font-family:\r\nCalibri;mso-ascii-theme-font:minor-latin;mso-hansi-font-family:Calibri;\r\nmso-hansi-theme-font:minor-latin;mso-bidi-font-family:&quot;Cordia New&quot;;mso-bidi-theme-font:\r\nminor-bidi\">à¸”à¹‰à¸²à¸™à¸šà¸™</span><o:p></o:p></p>\r\n\r\n<p class=\"MsoNormal\">70<span lang=\"TH\" style=\"mso-bidi-font-size:11.0pt;line-height:\r\n107%;font-family:&quot;Angsana New&quot;,serif;mso-ascii-font-family:Calibri;mso-ascii-theme-font:\r\nminor-latin;mso-hansi-font-family:Calibri;mso-hansi-theme-font:minor-latin\">% </span><span lang=\"TH\" style=\"font-size:14.0pt;mso-ansi-font-size:11.0pt;line-height:107%;\r\nfont-family:&quot;Cordia New&quot;,sans-serif;mso-ascii-font-family:Calibri;mso-ascii-theme-font:\r\nminor-latin;mso-hansi-font-family:Calibri;mso-hansi-theme-font:minor-latin;\r\nmso-bidi-font-family:&quot;Cordia New&quot;;mso-bidi-theme-font:minor-bidi\">à¹€à¸ªà¹‰à¸™à¹ƒà¸¢à¸ªà¸±à¸‡à¹€à¸„à¸£à¸²à¸°à¸«à¹Œ</span>,\r\n30<span lang=\"TH\" style=\"mso-bidi-font-size:11.0pt;line-height:107%;font-family:\r\n&quot;Angsana New&quot;,serif;mso-ascii-font-family:Calibri;mso-ascii-theme-font:minor-latin;\r\nmso-hansi-font-family:Calibri;mso-hansi-theme-font:minor-latin\">% </span>COTTON<o:p></o:p></p>\r\n\r\n<p class=\"MsoNormal\"><span lang=\"TH\" style=\"font-size:14.0pt;mso-ansi-font-size:\r\n11.0pt;line-height:107%;font-family:&quot;Cordia New&quot;,sans-serif;mso-ascii-font-family:\r\nCalibri;mso-ascii-theme-font:minor-latin;mso-hansi-font-family:Calibri;\r\nmso-hansi-theme-font:minor-latin;mso-bidi-font-family:&quot;Cordia New&quot;;mso-bidi-theme-font:\r\nminor-bidi\">à¸‹à¸±à¸šà¹ƒà¸™</span><o:p></o:p></p>\r\n\r\n<p class=\"MsoNormal\">90<span lang=\"TH\" style=\"mso-bidi-font-size:11.0pt;line-height:\r\n107%;font-family:&quot;Angsana New&quot;,serif;mso-ascii-font-family:Calibri;mso-ascii-theme-font:\r\nminor-latin;mso-hansi-font-family:Calibri;mso-hansi-theme-font:minor-latin\">% </span>COTTON\r\n, 10<span lang=\"TH\" style=\"mso-bidi-font-size:11.0pt;line-height:107%;font-family:\r\n&quot;Angsana New&quot;,serif;mso-ascii-font-family:Calibri;mso-ascii-theme-font:minor-latin;\r\nmso-hansi-font-family:Calibri;mso-hansi-theme-font:minor-latin\">% </span><span lang=\"TH\" style=\"font-size:14.0pt;mso-ansi-font-size:11.0pt;line-height:107%;\r\nfont-family:&quot;Cordia New&quot;,sans-serif;mso-ascii-font-family:Calibri;mso-ascii-theme-font:\r\nminor-latin;mso-hansi-font-family:Calibri;mso-hansi-theme-font:minor-latin;\r\nmso-bidi-font-family:&quot;Cordia New&quot;;mso-bidi-theme-font:minor-bidi\">à¹€à¸ªà¹‰à¸™à¹ƒà¸¢à¸ªà¸±à¸‡à¹€à¸„à¸£à¸²à¸°à¸«à¹Œ</span><o:p></o:p></p>\r\n\r\n<p class=\"MsoNormal\"><span lang=\"TH\" style=\"font-size:14.0pt;mso-ansi-font-size:\r\n11.0pt;line-height:107%;font-family:&quot;Cordia New&quot;,sans-serif;mso-ascii-font-family:\r\nCalibri;mso-ascii-theme-font:minor-latin;mso-hansi-font-family:Calibri;\r\nmso-hansi-theme-font:minor-latin;mso-bidi-font-family:&quot;Cordia New&quot;;mso-bidi-theme-font:\r\nminor-bidi\">à¸žà¸·à¹‰à¸™à¸£à¸­à¸‡à¹€à¸—à¹‰à¸²</span><o:p></o:p></p>\r\n\r\n<p class=\"MsoNormal\">100<span lang=\"TH\" style=\"mso-bidi-font-size:11.0pt;\r\nline-height:107%;font-family:&quot;Angsana New&quot;,serif;mso-ascii-font-family:Calibri;\r\nmso-ascii-theme-font:minor-latin;mso-hansi-font-family:Calibri;mso-hansi-theme-font:\r\nminor-latin\">%</span><o:p></o:p></p>\r\n\r\n<p class=\"MsoNormal\"><span lang=\"TH\" style=\"font-size:14.0pt;mso-ansi-font-size:\r\n11.0pt;line-height:107%;font-family:&quot;Cordia New&quot;,sans-serif;mso-ascii-font-family:\r\nCalibri;mso-ascii-theme-font:minor-latin;mso-hansi-font-family:Calibri;\r\nmso-hansi-theme-font:minor-latin;mso-bidi-font-family:&quot;Cordia New&quot;;mso-bidi-theme-font:\r\nminor-bidi\">à¸žà¸·à¹‰à¸™à¸£à¸­à¸‡à¹€à¸—à¹‰à¸²à¹à¸•à¸°</span><o:p></o:p></p>\r\n\r\n<p class=\"MsoNormal\">100<span lang=\"TH\" style=\"mso-bidi-font-size:11.0pt;\r\nline-height:107%;font-family:&quot;Angsana New&quot;,serif;mso-ascii-font-family:Calibri;\r\nmso-ascii-theme-font:minor-latin;mso-hansi-font-family:Calibri;mso-hansi-theme-font:\r\nminor-latin\">% </span>COTTON<o:p></o:p></p>', '1418301202_2_3_1.jpg', '1418301202_2_1_1.jpg', '1418301202_2_6_1.jpg', 0, 'In Stock', '2018-05-14 15:18:01', '');
INSERT INTO `products` (`id`, `category`, `productName`, `productCompany`, `productPrice`, `productPriceBeforeDiscount`, `productDescription`, `productImage1`, `productImage2`, `productImage3`, `shippingCharge`, `productAvailability`, `postingDate`, `updationDate`) VALUES
(30, 6, 'à¸£à¸­à¸‡à¹€à¸—à¹‰à¸²à¸«à¸™à¸±à¸‡à¹à¸•à¹ˆà¸‡à¸”à¹‰à¸§à¸¢à¸«à¸±à¸§à¹€à¸‚à¹‡à¸¡à¸‚à¸±à¸”à¸ªà¸­à¸‡à¸­à¸±à¸™', 'Zara', 520, 780, '<p class=\"MsoNormal\"><span lang=\"TH\" style=\"font-size:14.0pt;mso-ansi-font-size:\r\n11.0pt;line-height:107%;font-family:&quot;Cordia New&quot;,sans-serif;mso-ascii-font-family:\r\nCalibri;mso-ascii-theme-font:minor-latin;mso-hansi-font-family:Calibri;\r\nmso-hansi-theme-font:minor-latin;mso-bidi-font-family:&quot;Cordia New&quot;;mso-bidi-theme-font:\r\nminor-bidi\">à¸£à¸­à¸‡à¹€à¸—à¹‰à¸²à¸«à¸™à¸±à¸‡ à¸—à¸£à¸‡à¸„à¸­à¸™à¸ªà¸•à¸£à¸±à¸„à¸Šà¸±à¹ˆà¸™ </span>monk <span lang=\"TH\" style=\"font-size:14.0pt;mso-ansi-font-size:11.0pt;line-height:107%;font-family:\r\n&quot;Cordia New&quot;,sans-serif;mso-ascii-font-family:Calibri;mso-ascii-theme-font:\r\nminor-latin;mso-hansi-font-family:Calibri;mso-hansi-theme-font:minor-latin;\r\nmso-bidi-font-family:&quot;Cordia New&quot;;mso-bidi-theme-font:minor-bidi\">à¹€à¸›à¸´à¸”à¸›à¸´à¸”à¸”à¹‰à¸§à¸¢à¸«à¸±à¸§à¹€à¸‚à¹‡à¸¡à¸‚à¸±à¸”à¹€à¸¡à¸—à¸±à¸¥à¸¥à¸´à¸à¸ªà¸­à¸‡à¸­à¸±à¸™\r\nà¹€à¸¢à¹‡à¸šà¸•à¸à¹à¸•à¹ˆà¸‡à¸•à¸£à¸‡à¸‚à¸­à¸š</span><o:p></o:p></p>\r\n\r\n<p class=\"MsoNormal\"><span lang=\"TH\" style=\"font-size:14.0pt;mso-ansi-font-size:\r\n11.0pt;line-height:107%;font-family:&quot;Cordia New&quot;,sans-serif;mso-ascii-font-family:\r\nCalibri;mso-ascii-theme-font:minor-latin;mso-hansi-font-family:Calibri;\r\nmso-hansi-theme-font:minor-latin;mso-bidi-font-family:&quot;Cordia New&quot;;mso-bidi-theme-font:\r\nminor-bidi\">à¸ªà¹ˆà¸§à¸™à¸›à¸£à¸°à¸à¸­à¸š</span><o:p></o:p></p>\r\n\r\n<p class=\"MsoNormal\"><span lang=\"TH\" style=\"font-size:14.0pt;mso-ansi-font-size:\r\n11.0pt;line-height:107%;font-family:&quot;Cordia New&quot;,sans-serif;mso-ascii-font-family:\r\nCalibri;mso-ascii-theme-font:minor-latin;mso-hansi-font-family:Calibri;\r\nmso-hansi-theme-font:minor-latin;mso-bidi-font-family:&quot;Cordia New&quot;;mso-bidi-theme-font:\r\nminor-bidi\">à¸”à¹‰à¸²à¸™à¸šà¸™</span><o:p></o:p></p>\r\n\r\n<p class=\"MsoNormal\">100<span lang=\"TH\" style=\"mso-bidi-font-size:11.0pt;\r\nline-height:107%;font-family:&quot;Angsana New&quot;,serif;mso-ascii-font-family:Calibri;\r\nmso-ascii-theme-font:minor-latin;mso-hansi-font-family:Calibri;mso-hansi-theme-font:\r\nminor-latin\">% </span><span lang=\"TH\" style=\"font-size:14.0pt;mso-ansi-font-size:\r\n11.0pt;line-height:107%;font-family:&quot;Cordia New&quot;,sans-serif;mso-ascii-font-family:\r\nCalibri;mso-ascii-theme-font:minor-latin;mso-hansi-font-family:Calibri;\r\nmso-hansi-theme-font:minor-latin;mso-bidi-font-family:&quot;Cordia New&quot;;mso-bidi-theme-font:\r\nminor-bidi\">à¸«à¸™à¸±à¸‡à¸§à¸±à¸§</span><o:p></o:p></p>\r\n\r\n<p class=\"MsoNormal\"><span lang=\"TH\" style=\"font-size:14.0pt;mso-ansi-font-size:\r\n11.0pt;line-height:107%;font-family:&quot;Cordia New&quot;,sans-serif;mso-ascii-font-family:\r\nCalibri;mso-ascii-theme-font:minor-latin;mso-hansi-font-family:Calibri;\r\nmso-hansi-theme-font:minor-latin;mso-bidi-font-family:&quot;Cordia New&quot;;mso-bidi-theme-font:\r\nminor-bidi\">à¸‹à¸±à¸šà¹ƒà¸™</span><o:p></o:p></p>\r\n\r\n<p class=\"MsoNormal\">50<span lang=\"TH\" style=\"mso-bidi-font-size:11.0pt;line-height:\r\n107%;font-family:&quot;Angsana New&quot;,serif;mso-ascii-font-family:Calibri;mso-ascii-theme-font:\r\nminor-latin;mso-hansi-font-family:Calibri;mso-hansi-theme-font:minor-latin\">% </span>COTTON\r\n, 40<span lang=\"TH\" style=\"mso-bidi-font-size:11.0pt;line-height:107%;font-family:\r\n&quot;Angsana New&quot;,serif;mso-ascii-font-family:Calibri;mso-ascii-theme-font:minor-latin;\r\nmso-hansi-font-family:Calibri;mso-hansi-theme-font:minor-latin\">% </span><span lang=\"TH\" style=\"font-size:14.0pt;mso-ansi-font-size:11.0pt;line-height:107%;\r\nfont-family:&quot;Cordia New&quot;,sans-serif;mso-ascii-font-family:Calibri;mso-ascii-theme-font:\r\nminor-latin;mso-hansi-font-family:Calibri;mso-hansi-theme-font:minor-latin;\r\nmso-bidi-font-family:&quot;Cordia New&quot;;mso-bidi-theme-font:minor-bidi\">à¸«à¸™à¸±à¸‡à¸§à¸±à¸§</span>,\r\n10<span lang=\"TH\" style=\"mso-bidi-font-size:11.0pt;line-height:107%;font-family:\r\n&quot;Angsana New&quot;,serif;mso-ascii-font-family:Calibri;mso-ascii-theme-font:minor-latin;\r\nmso-hansi-font-family:Calibri;mso-hansi-theme-font:minor-latin\">% </span><span lang=\"TH\" style=\"font-size:14.0pt;mso-ansi-font-size:11.0pt;line-height:107%;\r\nfont-family:&quot;Cordia New&quot;,sans-serif;mso-ascii-font-family:Calibri;mso-ascii-theme-font:\r\nminor-latin;mso-hansi-font-family:Calibri;mso-hansi-theme-font:minor-latin;\r\nmso-bidi-font-family:&quot;Cordia New&quot;;mso-bidi-theme-font:minor-bidi\">à¹€à¸ªà¹‰à¸™à¹ƒà¸¢à¸ªà¸±à¸‡à¹€à¸„à¸£à¸²à¸°à¸«à¹Œ</span><o:p></o:p></p>\r\n\r\n<p class=\"MsoNormal\"><span lang=\"TH\" style=\"font-size:14.0pt;mso-ansi-font-size:\r\n11.0pt;line-height:107%;font-family:&quot;Cordia New&quot;,sans-serif;mso-ascii-font-family:\r\nCalibri;mso-ascii-theme-font:minor-latin;mso-hansi-font-family:Calibri;\r\nmso-hansi-theme-font:minor-latin;mso-bidi-font-family:&quot;Cordia New&quot;;mso-bidi-theme-font:\r\nminor-bidi\">à¸žà¸·à¹‰à¸™à¸£à¸­à¸‡à¹€à¸—à¹‰à¸²</span><o:p></o:p></p>\r\n\r\n<p class=\"MsoNormal\">100<span lang=\"TH\" style=\"mso-bidi-font-size:11.0pt;\r\nline-height:107%;font-family:&quot;Angsana New&quot;,serif;mso-ascii-font-family:Calibri;\r\nmso-ascii-theme-font:minor-latin;mso-hansi-font-family:Calibri;mso-hansi-theme-font:\r\nminor-latin\">% </span><span lang=\"TH\" style=\"font-size:14.0pt;mso-ansi-font-size:\r\n11.0pt;line-height:107%;font-family:&quot;Cordia New&quot;,sans-serif;mso-ascii-font-family:\r\nCalibri;mso-ascii-theme-font:minor-latin;mso-hansi-font-family:Calibri;\r\nmso-hansi-theme-font:minor-latin;mso-bidi-font-family:&quot;Cordia New&quot;;mso-bidi-theme-font:\r\nminor-bidi\">à¹€à¸—à¸­à¸£à¹Œà¹‚à¸¡à¸žà¸¥à¸²à¸ªà¸•à¸´à¸à¹‚à¸žà¸¥à¸´à¸¢à¸¹à¸£à¸µà¹€à¸—à¸™</span><o:p></o:p></p>\r\n\r\n<p class=\"MsoNormal\"><span lang=\"TH\" style=\"font-size:14.0pt;mso-ansi-font-size:\r\n11.0pt;line-height:107%;font-family:&quot;Cordia New&quot;,sans-serif;mso-ascii-font-family:\r\nCalibri;mso-ascii-theme-font:minor-latin;mso-hansi-font-family:Calibri;\r\nmso-hansi-theme-font:minor-latin;mso-bidi-font-family:&quot;Cordia New&quot;;mso-bidi-theme-font:\r\nminor-bidi\">à¸žà¸·à¹‰à¸™à¸£à¸­à¸‡à¹€à¸—à¹‰à¸²à¹à¸•à¸°</span><o:p></o:p></p>\r\n\r\n<p class=\"MsoNormal\">100<span lang=\"TH\" style=\"mso-bidi-font-size:11.0pt;\r\nline-height:107%;font-family:&quot;Angsana New&quot;,serif;mso-ascii-font-family:Calibri;\r\nmso-ascii-theme-font:minor-latin;mso-hansi-font-family:Calibri;mso-hansi-theme-font:\r\nminor-latin\">% </span><span lang=\"TH\" style=\"font-size:14.0pt;mso-ansi-font-size:\r\n11.0pt;line-height:107%;font-family:&quot;Cordia New&quot;,sans-serif;mso-ascii-font-family:\r\nCalibri;mso-ascii-theme-font:minor-latin;mso-hansi-font-family:Calibri;\r\nmso-hansi-theme-font:minor-latin;mso-bidi-font-family:&quot;Cordia New&quot;;mso-bidi-theme-font:\r\nminor-bidi\">à¸«à¸™à¸±à¸‡à¸§à¸±à¸§</span><o:p></o:p></p>', '2452302040_2_2_1.jpg', '2452302040_2_1_1.jpg', '2452302040_1_1_1.jpg', 0, 'In Stock', '2018-05-14 15:20:20', ''),
(31, 5, 'à¹€à¸›à¹‰à¸«à¸™à¸±à¸‡à¸ªà¸µà¸”à¸³à¹€à¸›à¸¥à¸µà¹ˆà¸¢à¸™à¸—à¸£à¸‡à¹„à¸”à¹‰', 'Zala', 990, 1990, '<p class=\"MsoNormal\"><span lang=\"TH\" style=\"font-size:14.0pt;mso-ansi-font-size:\r\n11.0pt;line-height:107%;font-family:&quot;Cordia New&quot;,sans-serif;mso-ascii-font-family:\r\nCalibri;mso-ascii-theme-font:minor-latin;mso-hansi-font-family:Calibri;\r\nmso-hansi-theme-font:minor-latin;mso-bidi-font-family:&quot;Cordia New&quot;;mso-bidi-theme-font:\r\nminor-bidi\">à¹€à¸›à¹‰à¸«à¸™à¸±à¸‡à¸ªà¸±à¸•à¸§à¹Œà¹à¸‚à¹‡à¸‡ </span>100<span lang=\"TH\" style=\"mso-bidi-font-size:\r\n11.0pt;line-height:107%;font-family:&quot;Angsana New&quot;,serif;mso-ascii-font-family:\r\nCalibri;mso-ascii-theme-font:minor-latin;mso-hansi-font-family:Calibri;\r\nmso-hansi-theme-font:minor-latin\">% </span><span lang=\"TH\" style=\"font-size:14.0pt;\r\nmso-ansi-font-size:11.0pt;line-height:107%;font-family:&quot;Cordia New&quot;,sans-serif;\r\nmso-ascii-font-family:Calibri;mso-ascii-theme-font:minor-latin;mso-hansi-font-family:\r\nCalibri;mso-hansi-theme-font:minor-latin;mso-bidi-font-family:&quot;Cordia New&quot;;\r\nmso-bidi-theme-font:minor-bidi\">à¹à¸•à¹ˆà¸¥à¸°à¸Šà¸´à¹‰à¸™à¸œà¹ˆà¸²à¸™à¸à¸£à¸°à¸šà¸§à¸™à¸à¸²à¸£à¸—à¸²à¸‡à¸˜à¸£à¸£à¸¡à¸Šà¸²à¸•à¸´à¹à¸¥à¸°à¸—à¸³à¹ƒà¸«à¹‰à¹€à¸à¹ˆà¸²à¸”à¹‰à¸§à¸¢à¸§à¸´à¸˜à¸µà¸à¸²à¸£à¸—à¸µà¹ˆà¹à¸•à¸à¸•à¹ˆà¸²à¸‡\r\nà¸ªà¸µà¸”à¸³ à¸£à¸¹à¸”à¸‹à¸´à¸›à¹€à¸›à¸´à¸”à¸›à¸´à¸”à¸•à¸£à¸‡à¹ƒà¸•à¹‰à¸›à¸ à¸”à¹‰à¸²à¸™à¹ƒà¸™à¸¡à¸µà¸Šà¹ˆà¸­à¸‡à¹ƒà¸ªà¹ˆà¸‚à¸­à¸‡à¸ªà¸­à¸‡à¸Šà¹ˆà¸­à¸‡à¹à¸¥à¸°à¸à¸£à¸°à¹€à¸›à¹‹à¸²à¸•à¸´à¸”à¸‹à¸´à¸›à¸«à¸™à¸¶à¹ˆà¸‡à¸ˆà¸¸à¸”\r\nà¸¡à¸µà¸à¸£à¸°à¹€à¸›à¹‹à¸²à¸”à¹‰à¸²à¸™à¸™à¸­à¸à¸•à¸£à¸‡à¸”à¹‰à¸²à¸™à¸‚à¹‰à¸²à¸‡\r\nà¸ªà¸²à¸¢à¸ªà¸°à¸žà¸²à¸¢à¸–à¸­à¸”à¸­à¸­à¸à¹„à¸”à¹‰à¸¡à¸µà¸«à¸¹à¸«à¸´à¹‰à¸§à¸«à¸™à¸¶à¹ˆà¸‡à¸«à¸¹à¹€à¸žà¸·à¹ˆà¸­à¹ƒà¸«à¹‰à¸ªà¸²à¸¡à¸²à¸£à¸–à¸«à¸´à¹‰à¸§à¹„à¸”à¹‰à¹à¸šà¸šà¹€à¸›à¹‰à¸«à¸£à¸·à¸­à¸à¸£à¸°à¹€à¸›à¹‹à¸²à¹€à¸­à¸à¸ªà¸²à¸£</span>&nbsp;<br>\r\n<br>\r\n<span lang=\"TH\" style=\"font-size:14.0pt;mso-ansi-font-size:11.0pt;line-height:\r\n107%;font-family:&quot;Cordia New&quot;,sans-serif;mso-ascii-font-family:Calibri;\r\nmso-ascii-theme-font:minor-latin;mso-hansi-font-family:Calibri;mso-hansi-theme-font:\r\nminor-latin;mso-bidi-font-family:&quot;Cordia New&quot;;mso-bidi-theme-font:minor-bidi\">à¸ªà¸¹à¸‡\r\n</span>x <span lang=\"TH\" style=\"font-size:14.0pt;mso-ansi-font-size:11.0pt;\r\nline-height:107%;font-family:&quot;Cordia New&quot;,sans-serif;mso-ascii-font-family:\r\nCalibri;mso-ascii-theme-font:minor-latin;mso-hansi-font-family:Calibri;\r\nmso-hansi-theme-font:minor-latin;mso-bidi-font-family:&quot;Cordia New&quot;;mso-bidi-theme-font:\r\nminor-bidi\">à¸à¸§à¹‰à¸²à¸‡ </span>x <span lang=\"TH\" style=\"font-size:14.0pt;mso-ansi-font-size:\r\n11.0pt;line-height:107%;font-family:&quot;Cordia New&quot;,sans-serif;mso-ascii-font-family:\r\nCalibri;mso-ascii-theme-font:minor-latin;mso-hansi-font-family:Calibri;\r\nmso-hansi-theme-font:minor-latin;mso-bidi-font-family:&quot;Cordia New&quot;;mso-bidi-theme-font:\r\nminor-bidi\">à¸¥à¸¶à¸: </span>40 x 35 x 8 <span lang=\"TH\" style=\"font-size:14.0pt;\r\nmso-ansi-font-size:11.0pt;line-height:107%;font-family:&quot;Cordia New&quot;,sans-serif;\r\nmso-ascii-font-family:Calibri;mso-ascii-theme-font:minor-latin;mso-hansi-font-family:\r\nCalibri;mso-hansi-theme-font:minor-latin;mso-bidi-font-family:&quot;Cordia New&quot;;\r\nmso-bidi-theme-font:minor-bidi\">à¸‹à¸¡.</span><o:p></o:p></p>\r\n\r\n<p class=\"MsoNormal\"><span lang=\"TH\" style=\"font-size:14.0pt;mso-ansi-font-size:\r\n11.0pt;line-height:107%;font-family:&quot;Cordia New&quot;,sans-serif;mso-ascii-font-family:\r\nCalibri;mso-ascii-theme-font:minor-latin;mso-hansi-font-family:Calibri;\r\nmso-hansi-theme-font:minor-latin;mso-bidi-font-family:&quot;Cordia New&quot;;mso-bidi-theme-font:\r\nminor-bidi\">à¸ªà¹ˆà¸§à¸™à¸›à¸£à¸°à¸à¸­à¸š</span><o:p></o:p></p>\r\n\r\n<p class=\"MsoNormal\"><span lang=\"TH\" style=\"font-size:14.0pt;mso-ansi-font-size:\r\n11.0pt;line-height:107%;font-family:&quot;Cordia New&quot;,sans-serif;mso-ascii-font-family:\r\nCalibri;mso-ascii-theme-font:minor-latin;mso-hansi-font-family:Calibri;\r\nmso-hansi-theme-font:minor-latin;mso-bidi-font-family:&quot;Cordia New&quot;;mso-bidi-theme-font:\r\nminor-bidi\">à¹€à¸›à¸¥à¸·à¸­à¸à¸”à¹‰à¸²à¸™à¸™à¸­à¸</span><o:p></o:p></p>\r\n\r\n<p class=\"MsoNormal\">100<span lang=\"TH\" style=\"mso-bidi-font-size:11.0pt;\r\nline-height:107%;font-family:&quot;Angsana New&quot;,serif;mso-ascii-font-family:Calibri;\r\nmso-ascii-theme-font:minor-latin;mso-hansi-font-family:Calibri;mso-hansi-theme-font:\r\nminor-latin\">% </span><span lang=\"TH\" style=\"font-size:14.0pt;mso-ansi-font-size:\r\n11.0pt;line-height:107%;font-family:&quot;Cordia New&quot;,sans-serif;mso-ascii-font-family:\r\nCalibri;mso-ascii-theme-font:minor-latin;mso-hansi-font-family:Calibri;\r\nmso-hansi-theme-font:minor-latin;mso-bidi-font-family:&quot;Cordia New&quot;;mso-bidi-theme-font:\r\nminor-bidi\">à¸«à¸™à¸±à¸‡à¸§à¸±à¸§</span><o:p></o:p></p>\r\n\r\n<p class=\"MsoNormal\"><span lang=\"TH\" style=\"font-size:14.0pt;mso-ansi-font-size:\r\n11.0pt;line-height:107%;font-family:&quot;Cordia New&quot;,sans-serif;mso-ascii-font-family:\r\nCalibri;mso-ascii-theme-font:minor-latin;mso-hansi-font-family:Calibri;\r\nmso-hansi-theme-font:minor-latin;mso-bidi-font-family:&quot;Cordia New&quot;;mso-bidi-theme-font:\r\nminor-bidi\">à¸‹à¸±à¸šà¹ƒà¸™</span><o:p></o:p></p>\r\n\r\n<p class=\"MsoNormal\">100<span lang=\"TH\" style=\"mso-bidi-font-size:11.0pt;\r\nline-height:107%;font-family:&quot;Angsana New&quot;,serif;mso-ascii-font-family:Calibri;\r\nmso-ascii-theme-font:minor-latin;mso-hansi-font-family:Calibri;mso-hansi-theme-font:\r\nminor-latin\">% </span>COTTON<o:p></o:p></p>', '3232305040_1_1_1.jpg', '3232305040_2_3_1.jpg', '3232305040_2_20_1.jpg', 0, 'In Stock', '2018-05-14 15:23:46', ''),
(32, 5, 'à¹€à¸›à¹‰à¸ªà¸µà¸à¸£à¸¡à¸—à¹ˆà¸² SOFT', 'Aedo', 780, 988, '<p class=\"MsoNormal\"><span lang=\"TH\" style=\"font-size:14.0pt;mso-ansi-font-size:\r\n11.0pt;line-height:107%;font-family:&quot;Cordia New&quot;,sans-serif;mso-ascii-font-family:\r\nCalibri;mso-ascii-theme-font:minor-latin;mso-hansi-font-family:Calibri;\r\nmso-hansi-theme-font:minor-latin;mso-bidi-font-family:&quot;Cordia New&quot;;mso-bidi-theme-font:\r\nminor-bidi\">à¹€à¸›à¹‰à¸ªà¸µà¸à¸£à¸¡à¸—à¹ˆà¸² </span>soft <span lang=\"TH\" style=\"font-size:14.0pt;\r\nmso-ansi-font-size:11.0pt;line-height:107%;font-family:&quot;Cordia New&quot;,sans-serif;\r\nmso-ascii-font-family:Calibri;mso-ascii-theme-font:minor-latin;mso-hansi-font-family:\r\nCalibri;mso-hansi-theme-font:minor-latin;mso-bidi-font-family:&quot;Cordia New&quot;;\r\nmso-bidi-theme-font:minor-bidi\">à¸«à¸¥à¸²à¸à¸ªà¸µà¸«à¸¥à¸²à¸¢à¸Šà¸™à¸´à¸”\r\nà¹€à¸›à¸´à¸”à¸›à¸´à¸”à¸”à¹‰à¸²à¸™à¸™à¸­à¸à¸”à¹‰à¸§à¸¢à¸«à¸±à¸§à¹€à¸‚à¹‡à¸¡à¸‚à¸±à¸”à¹à¸¥à¸°à¹€à¸›à¸´à¸”à¸›à¸´à¸”à¸”à¹‰à¸§à¸¢à¹€à¸Šà¸·à¸­à¸à¹ƒà¸•à¹‰à¸›à¸\r\nà¸”à¹‰à¸²à¸™à¹ƒà¸™à¸¡à¸µà¸Šà¹ˆà¸­à¸‡à¹ƒà¸ªà¹ˆà¸­à¸¸à¸›à¸à¸£à¸“à¹Œà¸­à¸´à¹€à¸¥à¹‡à¸à¸—à¸£à¸­à¸™à¸´à¸à¸ªà¹Œà¹à¸¥à¸°à¸„à¸­à¸¡à¸žà¸´à¸§à¹€à¸•à¸­à¸£à¹Œà¹‚à¸™à¹‰à¸•à¸šà¸¸à¹Šà¸à¸‚à¸™à¸²à¸”à¹ƒà¸«à¸à¹ˆà¸–à¸¶à¸‡ </span>13\r\n<span lang=\"TH\" style=\"font-size:14.0pt;mso-ansi-font-size:11.0pt;line-height:\r\n107%;font-family:&quot;Cordia New&quot;,sans-serif;mso-ascii-font-family:Calibri;\r\nmso-ascii-theme-font:minor-latin;mso-hansi-font-family:Calibri;mso-hansi-theme-font:\r\nminor-latin;mso-bidi-font-family:&quot;Cordia New&quot;;mso-bidi-theme-font:minor-bidi\">à¸™à¸´à¹‰à¸§\r\n(</span>13<span lang=\"TH\" style=\"mso-bidi-font-size:11.0pt;line-height:107%;\r\nfont-family:&quot;Angsana New&quot;,serif;mso-ascii-font-family:Calibri;mso-ascii-theme-font:\r\nminor-latin;mso-hansi-font-family:Calibri;mso-hansi-theme-font:minor-latin\">\")\r\n</span><span lang=\"TH\" style=\"font-size:14.0pt;mso-ansi-font-size:11.0pt;\r\nline-height:107%;font-family:&quot;Cordia New&quot;,sans-serif;mso-ascii-font-family:\r\nCalibri;mso-ascii-theme-font:minor-latin;mso-hansi-font-family:Calibri;\r\nmso-hansi-theme-font:minor-latin;mso-bidi-font-family:&quot;Cordia New&quot;;mso-bidi-theme-font:\r\nminor-bidi\">à¸¡à¸µà¸Šà¹ˆà¸­à¸‡à¹ƒà¸ªà¹ˆà¸‚à¸­à¸‡à¸ªà¸­à¸‡à¸Šà¹ˆà¸­à¸‡à¹à¸¥à¸°à¸¡à¸µà¸à¸£à¸°à¹€à¸›à¹‹à¸²à¸•à¸´à¸”à¸‹à¸´à¸›à¸«à¸™à¸¶à¹ˆà¸‡à¸ˆà¸¸à¸”\r\nà¸¡à¸µà¸à¸£à¸°à¹€à¸›à¹‹à¸²à¸”à¹‰à¸²à¸™à¸™à¸­à¸à¸ªà¸­à¸‡à¸ˆà¸¸à¸”à¹à¸¥à¸°à¸¡à¸µà¸ªà¸²à¸¢à¸ªà¸°à¸žà¸²à¸¢à¹„à¸«à¸¥à¹ˆà¸›à¸£à¸±à¸šà¸‚à¸™à¸²à¸”à¹„à¸”à¹‰à¸ªà¸­à¸‡à¸ªà¸²à¸¢</span>&nbsp;<br>\r\n<br>\r\n<span lang=\"TH\" style=\"font-size:14.0pt;mso-ansi-font-size:11.0pt;line-height:\r\n107%;font-family:&quot;Cordia New&quot;,sans-serif;mso-ascii-font-family:Calibri;\r\nmso-ascii-theme-font:minor-latin;mso-hansi-font-family:Calibri;mso-hansi-theme-font:\r\nminor-latin;mso-bidi-font-family:&quot;Cordia New&quot;;mso-bidi-theme-font:minor-bidi\">à¸ªà¸¹à¸‡\r\n</span>x <span lang=\"TH\" style=\"font-size:14.0pt;mso-ansi-font-size:11.0pt;\r\nline-height:107%;font-family:&quot;Cordia New&quot;,sans-serif;mso-ascii-font-family:\r\nCalibri;mso-ascii-theme-font:minor-latin;mso-hansi-font-family:Calibri;\r\nmso-hansi-theme-font:minor-latin;mso-bidi-font-family:&quot;Cordia New&quot;;mso-bidi-theme-font:\r\nminor-bidi\">à¸à¸§à¹‰à¸²à¸‡ </span>x <span lang=\"TH\" style=\"font-size:14.0pt;mso-ansi-font-size:\r\n11.0pt;line-height:107%;font-family:&quot;Cordia New&quot;,sans-serif;mso-ascii-font-family:\r\nCalibri;mso-ascii-theme-font:minor-latin;mso-hansi-font-family:Calibri;\r\nmso-hansi-theme-font:minor-latin;mso-bidi-font-family:&quot;Cordia New&quot;;mso-bidi-theme-font:\r\nminor-bidi\">à¸¥à¸¶à¸: </span>43 x 28 x 17 <span lang=\"TH\" style=\"font-size:14.0pt;\r\nmso-ansi-font-size:11.0pt;line-height:107%;font-family:&quot;Cordia New&quot;,sans-serif;\r\nmso-ascii-font-family:Calibri;mso-ascii-theme-font:minor-latin;mso-hansi-font-family:\r\nCalibri;mso-hansi-theme-font:minor-latin;mso-bidi-font-family:&quot;Cordia New&quot;;\r\nmso-bidi-theme-font:minor-bidi\">à¸‹à¸¡.</span><o:p></o:p></p>\r\n\r\n<p class=\"MsoNormal\"><span lang=\"TH\" style=\"font-size:14.0pt;mso-ansi-font-size:\r\n11.0pt;line-height:107%;font-family:&quot;Cordia New&quot;,sans-serif;mso-ascii-font-family:\r\nCalibri;mso-ascii-theme-font:minor-latin;mso-hansi-font-family:Calibri;\r\nmso-hansi-theme-font:minor-latin;mso-bidi-font-family:&quot;Cordia New&quot;;mso-bidi-theme-font:\r\nminor-bidi\">à¸ªà¹ˆà¸§à¸™à¸›à¸£à¸°à¸à¸­à¸š</span><o:p></o:p></p>\r\n\r\n<p class=\"MsoNormal\"><span lang=\"TH\" style=\"font-size:14.0pt;mso-ansi-font-size:\r\n11.0pt;line-height:107%;font-family:&quot;Cordia New&quot;,sans-serif;mso-ascii-font-family:\r\nCalibri;mso-ascii-theme-font:minor-latin;mso-hansi-font-family:Calibri;\r\nmso-hansi-theme-font:minor-latin;mso-bidi-font-family:&quot;Cordia New&quot;;mso-bidi-theme-font:\r\nminor-bidi\">à¹€à¸›à¸¥à¸·à¸­à¸à¸”à¹‰à¸²à¸™à¸™à¸­à¸</span><o:p></o:p></p>\r\n\r\n<p class=\"MsoNormal\"><span lang=\"TH\" style=\"font-size:14.0pt;mso-ansi-font-size:\r\n11.0pt;line-height:107%;font-family:&quot;Cordia New&quot;,sans-serif;mso-ascii-font-family:\r\nCalibri;mso-ascii-theme-font:minor-latin;mso-hansi-font-family:Calibri;\r\nmso-hansi-theme-font:minor-latin;mso-bidi-font-family:&quot;Cordia New&quot;;mso-bidi-theme-font:\r\nminor-bidi\">à¹€à¸ªà¹‰à¸™à¹ƒà¸¢à¸«à¸¥à¸±à¸</span><br>\r\n100<span lang=\"TH\" style=\"mso-bidi-font-size:11.0pt;line-height:107%;font-family:\r\n&quot;Angsana New&quot;,serif;mso-ascii-font-family:Calibri;mso-ascii-theme-font:minor-latin;\r\nmso-hansi-font-family:Calibri;mso-hansi-theme-font:minor-latin\">% </span><span lang=\"TH\" style=\"font-size:14.0pt;mso-ansi-font-size:11.0pt;line-height:107%;\r\nfont-family:&quot;Cordia New&quot;,sans-serif;mso-ascii-font-family:Calibri;mso-ascii-theme-font:\r\nminor-latin;mso-hansi-font-family:Calibri;mso-hansi-theme-font:minor-latin;\r\nmso-bidi-font-family:&quot;Cordia New&quot;;mso-bidi-theme-font:minor-bidi\">à¹€à¸ªà¹‰à¸™à¹ƒà¸¢à¸ªà¸±à¸‡à¹€à¸„à¸£à¸²à¸°à¸«à¹Œ</span><o:p></o:p></p>\r\n\r\n<p class=\"MsoNormal\"><span lang=\"TH\" style=\"font-size:14.0pt;mso-ansi-font-size:\r\n11.0pt;line-height:107%;font-family:&quot;Cordia New&quot;,sans-serif;mso-ascii-font-family:\r\nCalibri;mso-ascii-theme-font:minor-latin;mso-hansi-font-family:Calibri;\r\nmso-hansi-theme-font:minor-latin;mso-bidi-font-family:&quot;Cordia New&quot;;mso-bidi-theme-font:\r\nminor-bidi\">à¸§à¸±à¸ªà¸”à¸¸à¸£à¸­à¸‡</span><br>\r\n100<span lang=\"TH\" style=\"mso-bidi-font-size:11.0pt;line-height:107%;font-family:\r\n&quot;Angsana New&quot;,serif;mso-ascii-font-family:Calibri;mso-ascii-theme-font:minor-latin;\r\nmso-hansi-font-family:Calibri;mso-hansi-theme-font:minor-latin\">% </span><span lang=\"TH\" style=\"font-size:14.0pt;mso-ansi-font-size:11.0pt;line-height:107%;\r\nfont-family:&quot;Cordia New&quot;,sans-serif;mso-ascii-font-family:Calibri;mso-ascii-theme-font:\r\nminor-latin;mso-hansi-font-family:Calibri;mso-hansi-theme-font:minor-latin;\r\nmso-bidi-font-family:&quot;Cordia New&quot;;mso-bidi-theme-font:minor-bidi\">à¹‚à¸žà¸¥à¸´à¸¢à¸¹à¸£à¸´à¹€à¸—à¸™</span>&nbsp;<o:p></o:p></p>\r\n\r\n<p class=\"MsoNormal\"><span lang=\"TH\" style=\"font-size:14.0pt;mso-ansi-font-size:\r\n11.0pt;line-height:107%;font-family:&quot;Cordia New&quot;,sans-serif;mso-ascii-font-family:\r\nCalibri;mso-ascii-theme-font:minor-latin;mso-hansi-font-family:Calibri;\r\nmso-hansi-theme-font:minor-latin;mso-bidi-font-family:&quot;Cordia New&quot;;mso-bidi-theme-font:\r\nminor-bidi\">à¸‹à¸±à¸šà¹ƒà¸™</span><o:p></o:p></p>\r\n\r\n<p class=\"MsoNormal\">100<span lang=\"TH\" style=\"mso-bidi-font-size:11.0pt;\r\nline-height:107%;font-family:&quot;Angsana New&quot;,serif;mso-ascii-font-family:Calibri;\r\nmso-ascii-theme-font:minor-latin;mso-hansi-font-family:Calibri;mso-hansi-theme-font:\r\nminor-latin\">% </span><span lang=\"TH\" style=\"font-size:14.0pt;mso-ansi-font-size:\r\n11.0pt;line-height:107%;font-family:&quot;Cordia New&quot;,sans-serif;mso-ascii-font-family:\r\nCalibri;mso-ascii-theme-font:minor-latin;mso-hansi-font-family:Calibri;\r\nmso-hansi-theme-font:minor-latin;mso-bidi-font-family:&quot;Cordia New&quot;;mso-bidi-theme-font:\r\nminor-bidi\">à¹€à¸ªà¹‰à¸™à¹ƒà¸¢à¸ªà¸±à¸‡à¹€à¸„à¸£à¸²à¸°à¸«à¹Œ</span><o:p></o:p></p>\r\n\r\n<p class=\"MsoNormal\"><o:p>&nbsp;</o:p></p>', '3222305010_2_1_1.jpg', '3222305010_1_1_1.jpg', '3222305010_2_6_1.jpg', 0, 'In Stock', '2018-05-14 15:25:17', ''),
(33, 5, 'à¸à¸£à¸°à¹€à¸›à¹‹à¸²à¸ªà¸°à¸žà¸²à¸¢à¸‚à¹‰à¸²à¸‡à¹à¸•à¹ˆà¸‡à¸¥à¸¹à¸à¸›à¸±à¸”à¸£à¸²à¸¢à¸¥à¸°à¹€à¸­à¸µà¸¢à¸”', 'Aedo', 250, 450, '<p class=\"MsoNormal\"><span lang=\"TH\" style=\"font-size:14.0pt;mso-ansi-font-size:\r\n11.0pt;line-height:107%;font-family:&quot;Cordia New&quot;,sans-serif;mso-ascii-font-family:\r\nCalibri;mso-ascii-theme-font:minor-latin;mso-hansi-font-family:Calibri;\r\nmso-hansi-theme-font:minor-latin;mso-bidi-font-family:&quot;Cordia New&quot;;mso-bidi-theme-font:\r\nminor-bidi\">à¸à¸£à¸°à¹€à¸›à¹‹à¸²à¸ªà¸°à¸žà¸²à¸¢à¸‚à¹‰à¸²à¸‡à¹à¸•à¹ˆà¸‡à¸¥à¸¹à¸à¸›à¸±à¸”à¸£à¸²à¸¢à¸¥à¸°à¹€à¸­à¸µà¸¢à¸”</span><o:p></o:p></p>\r\n\r\n<p class=\"MsoNormal\"><span lang=\"TH\" style=\"font-size:14.0pt;mso-ansi-font-size:\r\n11.0pt;line-height:107%;font-family:&quot;Cordia New&quot;,sans-serif;mso-ascii-font-family:\r\nCalibri;mso-ascii-theme-font:minor-latin;mso-hansi-font-family:Calibri;\r\nmso-hansi-theme-font:minor-latin;mso-bidi-font-family:&quot;Cordia New&quot;;mso-bidi-theme-font:\r\nminor-bidi\">à¸ªà¸µ:</span>&nbsp;<span lang=\"TH\" style=\"font-size:14.0pt;mso-ansi-font-size:\r\n11.0pt;line-height:107%;font-family:&quot;Cordia New&quot;,sans-serif;mso-ascii-font-family:\r\nCalibri;mso-ascii-theme-font:minor-latin;mso-hansi-font-family:Calibri;\r\nmso-hansi-theme-font:minor-latin;mso-bidi-font-family:&quot;Cordia New&quot;;mso-bidi-theme-font:\r\nminor-bidi\">à¸ªà¸µà¸Šà¸¡à¸žà¸¹</span><o:p></o:p></p>\r\n\r\n<p class=\"MsoNormal\"><span lang=\"TH\" style=\"font-size:14.0pt;mso-ansi-font-size:\r\n11.0pt;line-height:107%;font-family:&quot;Cordia New&quot;,sans-serif;mso-ascii-font-family:\r\nCalibri;mso-ascii-theme-font:minor-latin;mso-hansi-font-family:Calibri;\r\nmso-hansi-theme-font:minor-latin;mso-bidi-font-family:&quot;Cordia New&quot;;mso-bidi-theme-font:\r\nminor-bidi\">à¸à¸£à¸°à¹€à¸›à¹‹à¸²à¸Šà¸™à¸´à¸”à¸ªà¸°à¸žà¸²à¸¢à¸‚à¹‰à¸²à¸‡à¸ªà¸µà¸Šà¸¡à¸žà¸¹ à¸•à¸à¹à¸•à¹ˆà¸‡à¸”à¹‰à¸§à¸¢à¸à¸²à¸£à¸ªà¸²à¸™à¸—à¸µà¹ˆà¸£à¸­à¸¢à¸•à¸°à¹€à¸‚à¹‡à¸š\r\nà¸šà¸¸à¸œà¹‰à¸²à¸‹à¸±à¸šà¹ƒà¸™à¹à¸šà¸šà¸¡à¸µà¸Šà¹ˆà¸­à¸‡à¸à¸£à¸°à¹€à¸›à¹‹à¸² à¸ªà¸²à¸¢à¸ªà¸°à¸žà¸²à¸¢à¹‚à¸‹à¹ˆ à¹€à¸›à¸´à¸”à¸›à¸´à¸”à¸”à¹‰à¸§à¸¢à¹à¸¡à¹ˆà¹€à¸«à¸¥à¹‡à¸</span>&nbsp;<br>\r\n<br>\r\n<span lang=\"TH\" style=\"font-size:14.0pt;mso-ansi-font-size:11.0pt;line-height:\r\n107%;font-family:&quot;Cordia New&quot;,sans-serif;mso-ascii-font-family:Calibri;\r\nmso-ascii-theme-font:minor-latin;mso-hansi-font-family:Calibri;mso-hansi-theme-font:\r\nminor-latin;mso-bidi-font-family:&quot;Cordia New&quot;;mso-bidi-theme-font:minor-bidi\">à¸ªà¸¹à¸‡\r\n</span>x <span lang=\"TH\" style=\"font-size:14.0pt;mso-ansi-font-size:11.0pt;\r\nline-height:107%;font-family:&quot;Cordia New&quot;,sans-serif;mso-ascii-font-family:\r\nCalibri;mso-ascii-theme-font:minor-latin;mso-hansi-font-family:Calibri;\r\nmso-hansi-theme-font:minor-latin;mso-bidi-font-family:&quot;Cordia New&quot;;mso-bidi-theme-font:\r\nminor-bidi\">à¸à¸§à¹‰à¸²à¸‡ </span>x <span lang=\"TH\" style=\"font-size:14.0pt;mso-ansi-font-size:\r\n11.0pt;line-height:107%;font-family:&quot;Cordia New&quot;,sans-serif;mso-ascii-font-family:\r\nCalibri;mso-ascii-theme-font:minor-latin;mso-hansi-font-family:Calibri;\r\nmso-hansi-theme-font:minor-latin;mso-bidi-font-family:&quot;Cordia New&quot;;mso-bidi-theme-font:\r\nminor-bidi\">à¸¥à¸¶à¸ </span>14 x 20 x 5 <span lang=\"TH\" style=\"font-size:14.0pt;\r\nmso-ansi-font-size:11.0pt;line-height:107%;font-family:&quot;Cordia New&quot;,sans-serif;\r\nmso-ascii-font-family:Calibri;mso-ascii-theme-font:minor-latin;mso-hansi-font-family:\r\nCalibri;mso-hansi-theme-font:minor-latin;mso-bidi-font-family:&quot;Cordia New&quot;;\r\nmso-bidi-theme-font:minor-bidi\">à¸‹à¸¡.</span><o:p></o:p></p>\r\n\r\n<p class=\"MsoNormal\"><span lang=\"TH\" style=\"font-size:14.0pt;mso-ansi-font-size:\r\n11.0pt;line-height:107%;font-family:&quot;Cordia New&quot;,sans-serif;mso-ascii-font-family:\r\nCalibri;mso-ascii-theme-font:minor-latin;mso-hansi-font-family:Calibri;\r\nmso-hansi-theme-font:minor-latin;mso-bidi-font-family:&quot;Cordia New&quot;;mso-bidi-theme-font:\r\nminor-bidi\">à¸ªà¹ˆà¸§à¸™à¸›à¸£à¸°à¸à¸­à¸š</span><o:p></o:p></p>\r\n\r\n<p class=\"MsoNormal\"><span lang=\"TH\" style=\"font-size:14.0pt;mso-ansi-font-size:\r\n11.0pt;line-height:107%;font-family:&quot;Cordia New&quot;,sans-serif;mso-ascii-font-family:\r\nCalibri;mso-ascii-theme-font:minor-latin;mso-hansi-font-family:Calibri;\r\nmso-hansi-theme-font:minor-latin;mso-bidi-font-family:&quot;Cordia New&quot;;mso-bidi-theme-font:\r\nminor-bidi\">à¹€à¸›à¸¥à¸·à¸­à¸à¸”à¹‰à¸²à¸™à¸™à¸­à¸</span><o:p></o:p></p>\r\n\r\n<p class=\"MsoNormal\"><span lang=\"TH\" style=\"font-size:14.0pt;mso-ansi-font-size:\r\n11.0pt;line-height:107%;font-family:&quot;Cordia New&quot;,sans-serif;mso-ascii-font-family:\r\nCalibri;mso-ascii-theme-font:minor-latin;mso-hansi-font-family:Calibri;\r\nmso-hansi-theme-font:minor-latin;mso-bidi-font-family:&quot;Cordia New&quot;;mso-bidi-theme-font:\r\nminor-bidi\">à¹€à¸ªà¹‰à¸™à¹ƒà¸¢à¸«à¸¥à¸±à¸</span><br>\r\n100<span lang=\"TH\" style=\"mso-bidi-font-size:11.0pt;line-height:107%;font-family:\r\n&quot;Angsana New&quot;,serif;mso-ascii-font-family:Calibri;mso-ascii-theme-font:minor-latin;\r\nmso-hansi-font-family:Calibri;mso-hansi-theme-font:minor-latin\">% </span>COTTON<o:p></o:p></p>\r\n\r\n<p class=\"MsoNormal\"><span lang=\"TH\" style=\"font-size:14.0pt;mso-ansi-font-size:\r\n11.0pt;line-height:107%;font-family:&quot;Cordia New&quot;,sans-serif;mso-ascii-font-family:\r\nCalibri;mso-ascii-theme-font:minor-latin;mso-hansi-font-family:Calibri;\r\nmso-hansi-theme-font:minor-latin;mso-bidi-font-family:&quot;Cordia New&quot;;mso-bidi-theme-font:\r\nminor-bidi\">à¸ªà¸²à¸¢à¸ªà¸°à¸žà¸²à¸¢à¹„à¸«à¸¥à¹ˆ</span><br>\r\n100<span lang=\"TH\" style=\"mso-bidi-font-size:11.0pt;line-height:107%;font-family:\r\n&quot;Angsana New&quot;,serif;mso-ascii-font-family:Calibri;mso-ascii-theme-font:minor-latin;\r\nmso-hansi-font-family:Calibri;mso-hansi-theme-font:minor-latin\">% </span><span lang=\"TH\" style=\"font-size:14.0pt;mso-ansi-font-size:11.0pt;line-height:107%;\r\nfont-family:&quot;Cordia New&quot;,sans-serif;mso-ascii-font-family:Calibri;mso-ascii-theme-font:\r\nminor-latin;mso-hansi-font-family:Calibri;mso-hansi-theme-font:minor-latin;\r\nmso-bidi-font-family:&quot;Cordia New&quot;;mso-bidi-theme-font:minor-bidi\">à¹€à¸«à¸¥à¹‡à¸à¸«à¸¥à¹ˆà¸­</span><o:p></o:p></p>\r\n\r\n<p class=\"MsoNormal\"><span lang=\"TH\" style=\"font-size:14.0pt;mso-ansi-font-size:\r\n11.0pt;line-height:107%;font-family:&quot;Cordia New&quot;,sans-serif;mso-ascii-font-family:\r\nCalibri;mso-ascii-theme-font:minor-latin;mso-hansi-font-family:Calibri;\r\nmso-hansi-theme-font:minor-latin;mso-bidi-font-family:&quot;Cordia New&quot;;mso-bidi-theme-font:\r\nminor-bidi\">à¸‹à¸±à¸šà¹ƒà¸™</span><o:p></o:p></p>\r\n\r\n<p class=\"MsoNormal\">100<span lang=\"TH\" style=\"mso-bidi-font-size:11.0pt;\r\nline-height:107%;font-family:&quot;Angsana New&quot;,serif;mso-ascii-font-family:Calibri;\r\nmso-ascii-theme-font:minor-latin;mso-hansi-font-family:Calibri;mso-hansi-theme-font:\r\nminor-latin\">% </span><span lang=\"TH\" style=\"font-size:14.0pt;mso-ansi-font-size:\r\n11.0pt;line-height:107%;font-family:&quot;Cordia New&quot;,sans-serif;mso-ascii-font-family:\r\nCalibri;mso-ascii-theme-font:minor-latin;mso-hansi-font-family:Calibri;\r\nmso-hansi-theme-font:minor-latin;mso-bidi-font-family:&quot;Cordia New&quot;;mso-bidi-theme-font:\r\nminor-bidi\">à¹€à¸ªà¹‰à¸™à¹ƒà¸¢à¸ªà¸±à¸‡à¹€à¸„à¸£à¸²à¸°à¸«à¹Œ</span><o:p></o:p></p>', '6608304050_2_2_1.jpg', '6608304050_2_1_1.jpg', '6608304050_2_5_1.jpg', 0, 'In Stock', '2018-05-14 15:29:28', ''),
(34, 3, 'a', 'a', 480, 580, 'k.lll', '5.JPG', '5.JPG', '5.JPG', 0, 'In Stock', '2018-05-18 09:57:08', '');

-- --------------------------------------------------------

--
-- Table structure for table `transactionbank`
--

CREATE TABLE `transactionbank` (
  `id` int(11) NOT NULL,
  `orderid` int(11) NOT NULL,
  `userid` int(11) NOT NULL,
  `date` date NOT NULL,
  `time` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `transactionbank`
--

INSERT INTO `transactionbank` (`id`, `orderid`, `userid`, `date`, `time`) VALUES
(3, 2, 3, '2018-05-10', '13:16:22'),
(4, 5, 3, '2018-05-23', '13:16:22'),
(5, 9, 5, '2018-05-24', '10:12:12'),
(6, 18, 5, '2018-05-18', '12:35:29');

-- --------------------------------------------------------

--
-- Table structure for table `transactionpaypal`
--

CREATE TABLE `transactionpaypal` (
  `id` int(11) NOT NULL,
  `orderid` int(11) NOT NULL,
  `userid` int(11) NOT NULL,
  `tran` varchar(250) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `transactionpaypal`
--

INSERT INTO `transactionpaypal` (`id`, `orderid`, `userid`, `tran`) VALUES
(9, 3, 3, '9NJ05787XR138100S'),
(10, 7, 5, '131545132135354'),
(11, 25, 1, '1234');

-- --------------------------------------------------------

--
-- Table structure for table `userlog`
--

CREATE TABLE `userlog` (
  `id` int(11) NOT NULL,
  `userEmail` varchar(255) NOT NULL,
  `userip` binary(16) NOT NULL,
  `loginTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `logout` varchar(255) NOT NULL,
  `status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `userlog`
--

INSERT INTO `userlog` (`id`, `userEmail`, `userip`, `loginTime`, `logout`, `status`) VALUES
(1, 'anuj.lpu1@gmail.com', 0x3a3a3100000000000000000000000000, '2017-02-26 11:18:50', '', 1),
(2, 'anuj.lpu1@gmail.com', 0x3a3a3100000000000000000000000000, '2017-02-26 11:29:33', '', 1),
(3, 'anuj.lpu1@gmail.com', 0x3a3a3100000000000000000000000000, '2017-02-26 11:30:11', '', 1),
(4, 'anuj.lpu1@gmail.com', 0x3a3a3100000000000000000000000000, '2017-02-26 15:00:23', '26-02-2017 11:12:06 PM', 1),
(5, 'anuj.lpu1@gmail.com', 0x3a3a3100000000000000000000000000, '2017-02-26 18:08:58', '', 0),
(6, 'anuj.lpu1@gmail.com', 0x3a3a3100000000000000000000000000, '2017-02-26 18:09:41', '', 0),
(7, 'anuj.lpu1@gmail.com', 0x3a3a3100000000000000000000000000, '2017-02-26 18:10:04', '', 0),
(8, 'anuj.lpu1@gmail.com', 0x3a3a3100000000000000000000000000, '2017-02-26 18:10:31', '', 0),
(9, 'anuj.lpu1@gmail.com', 0x3a3a3100000000000000000000000000, '2017-02-26 18:13:43', '', 1),
(10, 'anuj.lpu1@gmail.com', 0x3a3a3100000000000000000000000000, '2017-02-27 18:52:58', '', 0),
(11, 'anuj.lpu1@gmail.com', 0x3a3a3100000000000000000000000000, '2017-02-27 18:53:07', '', 1),
(12, 'anuj.lpu1@gmail.com', 0x3a3a3100000000000000000000000000, '2017-03-03 18:00:09', '', 0),
(13, 'anuj.lpu1@gmail.com', 0x3a3a3100000000000000000000000000, '2017-03-03 18:00:15', '', 1),
(14, 'anuj.lpu1@gmail.com', 0x3a3a3100000000000000000000000000, '2017-03-06 18:10:26', '', 1),
(15, 'anuj.lpu1@gmail.com', 0x3a3a3100000000000000000000000000, '2017-03-07 12:28:16', '', 1),
(16, 'anuj.lpu1@gmail.com', 0x3a3a3100000000000000000000000000, '2017-03-07 18:43:27', '', 1),
(17, 'anuj.lpu1@gmail.com', 0x3a3a3100000000000000000000000000, '2017-03-07 18:55:33', '', 1),
(18, 'anuj.lpu1@gmail.com', 0x3a3a3100000000000000000000000000, '2017-03-07 19:44:29', '', 1),
(19, 'anuj.lpu1@gmail.com', 0x3a3a3100000000000000000000000000, '2017-03-08 19:21:15', '', 1),
(20, 'anuj.lpu1@gmail.com', 0x3a3a3100000000000000000000000000, '2017-03-15 17:19:38', '', 1),
(21, 'anuj.lpu1@gmail.com', 0x3a3a3100000000000000000000000000, '2017-03-15 17:20:36', '15-03-2017 10:50:39 PM', 1),
(22, 'anuj.lpu1@gmail.com', 0x3a3a3100000000000000000000000000, '2017-03-16 01:13:57', '', 1),
(23, 'bank.cs1996@gmail.com', 0x3a3a3100000000000000000000000000, '2018-04-25 09:42:06', '25-04-2018 03:33:55 PM', 1),
(24, 'bank.cs1996@gmail.com', 0x3a3a3100000000000000000000000000, '2018-04-25 10:04:14', '25-04-2018 05:37:08 PM', 1),
(25, 'bank.cs1996@gmail.com', 0x3a3a3100000000000000000000000000, '2018-05-09 09:21:50', '09-05-2018 03:10:01 PM', 1),
(26, 'bank.cs1996@gmail.com', 0x3a3a3100000000000000000000000000, '2018-05-09 09:40:11', '', 1),
(27, 'bank.cs1996@gmail.com', 0x3a3a3100000000000000000000000000, '2018-05-09 10:54:20', '', 1),
(28, 'bank.cs1996@gmail.com', 0x3a3a3100000000000000000000000000, '2018-05-09 11:18:01', '', 1),
(29, 'bank.cs1996@gmail.com', 0x3a3a3100000000000000000000000000, '2018-05-09 11:19:54', '', 1),
(30, 'bank.cs1996@gmail.com', 0x3a3a3100000000000000000000000000, '2018-05-09 21:18:47', '11-05-2018 06:22:52 AM', 1),
(31, 'bank.cs1996@gmail.com', 0x3a3a3100000000000000000000000000, '2018-05-11 00:54:24', '11-05-2018 06:25:18 AM', 1),
(32, 'bank.cs1996@gmail.com', 0x3a3a3100000000000000000000000000, '2018-05-11 01:28:25', '11-05-2018 07:44:58 AM', 1),
(33, 'bank.cs1996@gmail.com', 0x3a3a3100000000000000000000000000, '2018-05-11 02:18:40', '14-05-2018 05:08:21 PM', 1),
(34, 'naritchamilk83@gmail.com', 0x3a3a3100000000000000000000000000, '2018-05-14 11:51:01', '', 0),
(35, 'naritchamilk83@gmail.com', 0x3a3a3100000000000000000000000000, '2018-05-14 11:51:10', '', 0),
(36, 'naritchamilk83@gmail.com', 0x3a3a3100000000000000000000000000, '2018-05-14 11:52:08', '14-05-2018 09:22:02 PM', 1),
(37, 'Prasong-prasong@hotmail.com', 0x3a3a3100000000000000000000000000, '2018-05-14 15:55:44', '14-05-2018 09:26:14 PM', 1),
(38, 'naritchamilk83@gmail.com', 0x3a3a3100000000000000000000000000, '2018-05-14 15:59:51', '', 0),
(39, 'naritchamilk83@gmail.com', 0x3a3a3100000000000000000000000000, '2018-05-14 15:59:56', '', 1),
(40, 'naritchamilk83@gmail.com', 0x3a3a3100000000000000000000000000, '2018-05-18 05:31:40', '18-05-2018 03:17:38 PM', 1),
(41, 'naritchamilk83@gmail.com', 0x3a3a3100000000000000000000000000, '2018-05-18 09:49:06', '18-05-2018 03:19:25 PM', 1),
(42, 'Methicha@hotmail.com', 0x3a3a3100000000000000000000000000, '2018-05-18 09:50:45', '', 1);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `contactno` bigint(11) NOT NULL,
  `password` varchar(255) NOT NULL,
  `shippingAddress` longtext NOT NULL,
  `shippingState` varchar(255) NOT NULL,
  `shippingCity` varchar(255) NOT NULL,
  `shippingPincode` int(11) NOT NULL,
  `billingAddress` longtext NOT NULL,
  `billingState` varchar(255) NOT NULL,
  `billingCity` varchar(255) NOT NULL,
  `billingPincode` int(11) NOT NULL,
  `regDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updationDate` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `contactno`, `password`, `shippingAddress`, `shippingState`, `shippingCity`, `shippingPincode`, `billingAddress`, `billingState`, `billingCity`, `billingPincode`, `regDate`, `updationDate`) VALUES
(1, 'Anuj Kumar', 'anuj.lpu1@gmail.com', 9009857868, 'f925916e2754e5e03f75dd58a5733251', 'CS New Delhi', 'New Delhi', 'Delhi', 110001, 'New Delhi', 'New Delhi', 'Delhi', 110092, '2017-02-04 19:30:50', ''),
(2, 'Amit ', 'amit@gmail.com', 8285703355, '5c428d8875d2948607f3e3fe134d71b4', '', '', '', 0, '', '', '', 0, '2017-03-15 17:21:22', ''),
(3, 'sorawich khemthong', 'bank.cs1996@gmail.com', 0, '81dc9bdb52d04dc20036dbd8313ed055', '', '', '', 0, '', '', '', 0, '2018-04-25 09:41:50', ''),
(4, 'milk melody', 'naritchamilk83@gmail', 863903374, '81dc9bdb52d04dc20036dbd8313ed055', '', '', '', 0, '', '', '', 0, '2018-05-14 11:51:35', ''),
(5, 'milk melody', 'naritchamilk83@gmail.com', 863903374, '81dc9bdb52d04dc20036dbd8313ed055', '', '', '', 0, '', '', '', 0, '2018-05-14 11:51:59', ''),
(6, 'jdadt', 'Prasong-prasong@hotmail.com', 925695333, '81dc9bdb52d04dc20036dbd8313ed055', '', '', '', 0, '', '', '', 0, '2018-05-14 15:55:08', ''),
(7, 'Methicha', 'Methicha@hotmail.com', 809083801, '81dc9bdb52d04dc20036dbd8313ed055', '', '', '', 0, '', '', '', 0, '2018-05-18 09:50:23', '');

-- --------------------------------------------------------

--
-- Table structure for table `wishlist`
--

CREATE TABLE `wishlist` (
  `id` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `productId` int(11) NOT NULL,
  `postingDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `wishlist`
--

INSERT INTO `wishlist` (`id`, `userId`, `productId`, `postingDate`) VALUES
(1, 1, 0, '2017-02-27 18:53:17'),
(6, 1, 15, '2018-04-25 11:54:10'),
(7, 1, 16, '2018-04-25 11:55:32'),
(8, 5, 26, '2018-05-14 16:00:04'),
(9, 1, 31, '2018-05-18 10:12:58');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `attributes`
--
ALTER TABLE `attributes`
  ADD PRIMARY KEY (`attr_id`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ordertrackhistory`
--
ALTER TABLE `ordertrackhistory`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `productreviews`
--
ALTER TABLE `productreviews`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `transactionbank`
--
ALTER TABLE `transactionbank`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `transactionpaypal`
--
ALTER TABLE `transactionpaypal`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `userlog`
--
ALTER TABLE `userlog`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wishlist`
--
ALTER TABLE `wishlist`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `attributes`
--
ALTER TABLE `attributes`
  MODIFY `attr_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=63;

--
-- AUTO_INCREMENT for table `ordertrackhistory`
--
ALTER TABLE `ordertrackhistory`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `productreviews`
--
ALTER TABLE `productreviews`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT for table `transactionbank`
--
ALTER TABLE `transactionbank`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `transactionpaypal`
--
ALTER TABLE `transactionpaypal`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `userlog`
--
ALTER TABLE `userlog`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `wishlist`
--
ALTER TABLE `wishlist`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
