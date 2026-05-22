-- phpMyAdmin SQL Dump
-- version 5.2.3
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: May 22, 2026 at 12:55 AM
-- Server version: 8.4.3
-- PHP Version: 8.3.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `opencart-ar4103`
--

-- --------------------------------------------------------

--
-- Table structure for table `oc_event`
--

CREATE TABLE `oc_event` (
  `event_id` int NOT NULL,
  `code` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `trigger` text COLLATE utf8mb4_unicode_ci,
  `action` text COLLATE utf8mb4_unicode_ci,
  `status` tinyint(1) DEFAULT '0',
  `sort_order` int DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `oc_event`
--

INSERT INTO `oc_event` (`event_id`, `code`, `description`, `trigger`, `action`, `status`, `sort_order`) VALUES
(1, 'activity_customer_add', 'Adds new customer entry in the activity log.', 'catalog/model/account/customer.addCustomer/after', 'event/activity.addCustomer', 1, 1),
(2, 'activity_customer_edit', 'Adds edit customer entry in the activity log.', 'catalog/model/account/customer.editCustomer/after', 'event/activity.editCustomer', 1, 1),
(3, 'activity_customer_password', 'Adds edit password entry in the activity log.', 'catalog/model/account/customer.editPassword/after', 'event/activity.editPassword', 1, 1),
(4, 'activity_customer_forgotten', 'Adds forgotten password entry in the activity log.', 'catalog/model/account/customer.addToken/after', 'event/activity.forgotten', 1, 1),
(5, 'activity_customer_login', 'Adds edit customer entry in the activity log.', 'catalog/model/account/customer.deleteLoginAttempts/after', 'event/activity.login', 1, 1),
(6, 'activity_customer_transaction', 'Adds edit customer entry in the activity log.', 'catalog/model/account/customer.addTransaction/after', 'event/activity.addTransaction', 1, 1),
(7, 'activity_address_add', 'Adds new address entry in the activity log.', 'catalog/model/account/address.addAddress/after', 'event/activity.addAddress', 1, 1),
(8, 'activity_address_edit', 'Adds edit address entry in the activity log.', 'catalog/model/account/address.editAddress/after', 'event/activity.editAddress', 1, 1),
(9, 'activity_address_delete', 'Adds delete address entry in the activity log.', 'catalog/model/account/address.deleteAddress/after', 'event/activity.deleteAddress', 1, 1),
(10, 'activity_affiliate_add', 'Adds new affiliate entry in the activity log.', 'catalog/model/account/affiliate.addAffiliate/after', 'event/activity.addAffiliate', 1, 1),
(11, 'activity_affiliate_edit', 'Adds edit affiliate entry in the activity log.', 'catalog/model/account/affiliate.editAffiliate/after', 'event/activity.editAffiliate', 1, 1),
(12, 'activity_order_add', 'Adds new order entry in the activity log.', 'catalog/model/checkout/order.addHistory/before', 'event/activity.addHistory', 1, 1),
(13, 'activity_return_add', 'Adds new return entry in the activity log.', 'catalog/model/account/returns.addReturn/after', 'event/activity.addReturn', 1, 1),
(14, 'mail_customer_add', 'Sends mail to newly registered customers.', 'catalog/model/account/customer.addCustomer/after', 'mail/register', 1, 1),
(15, 'mail_customer_alert', 'Sends alert mail to store owner when a new customer registers.', 'catalog/model/account/customer.addCustomer/after', 'mail/register.alert', 1, 1),
(16, 'mail_customer_transaction', 'Sends mail to the customer when their transaction balance is updated.', 'catalog/model/account/customer.addTransaction/after', 'mail/transaction', 1, 1),
(17, 'mail_customer_forgotten', 'Sends mail to customers who have forgotten their password.', 'catalog/model/account/customer.addToken/after', 'mail/forgotten', 1, 1),
(18, 'mail_customer_authorize', 'Sends mail login code to customers email to authorize login from a new device.', 'catalog/controller/account/authorize.send/after', 'mail/authorize', 1, 1),
(19, 'mail_customer_authorize_reset', 'Sends reset link to user who`s account is locked out after 3 wrong authorize code login attempts.', 'catalog/model/account/customer.addToken/after', 'mail/authorize.reset', 1, 1),
(20, 'mail_affiliate_add', 'Sends mail to newly registered affiliates.', 'catalog/model/account/affiliate.addAffiliate/after', 'mail/affiliate', 1, 1),
(21, 'mail_affiliate_alert', 'Sends mail to new customers.', 'catalog/model/account/affiliate.addAffiliate/after', 'mail/affiliate.alert', 1, 1),
(22, 'mail_order', 'Sends mail to customer when they make an order.', 'catalog/model/checkout/order.addHistory/before', 'mail/order', 1, 1),
(23, 'mail_order_alert', 'Sends alert mail to new store owner when a new order is made.', 'catalog/model/checkout/order.addHistory/before', 'mail/order.alert', 1, 1),
(24, 'mail_gdpr', 'Sends mail to customers who have requested their data exported or deleted.', 'catalog/model/account/gdpr.addGdpr/after', 'mail/gdpr', 1, 1),
(25, 'mail_gdpr_delete', 'Sends mail to customers to let them know their GDPR data has been deleted.', 'catalog/model/account/gdpr.editStatus/after', 'mail/gdpr.remove', 1, 1),
(26, 'mail_review', 'Sends mail to store owner that a new review has been submitted.', 'catalog/model/catalog/review.addReview/after', 'mail/review', 1, 1),
(27, 'mail_subscription', 'Sends mail to store owner that a new subscription has been created.', 'catalog/model/checkout/subscription.addSubscription/after', 'mail/subscription', 1, 1),
(28, 'statistics_review_add', 'Updates review statistics when a new review is added.', 'catalog/model/catalog/review.addReview/after', 'event/statistics.addReview', 1, 1),
(29, 'statistics_return_add', 'Updates return statistics when a new return is added.', 'catalog/model/account/returns.addReturn/after', 'event/statistics.addReturn', 1, 1),
(30, 'statistics_return_delete', 'Updates return statistics when a return is deleted.', 'admin/model/sale/returns.deleteReturn/after', 'event/statistics.deleteReturn', 1, 1),
(31, 'statistics_order_history', 'Updates order status statistics when a order has been updated.', 'catalog/model/checkout/order.addHistory/before', 'event/statistics.addHistory', 1, 1),
(32, 'admin_currency_add', 'Updates currencies when a new currency is added.', 'admin/model/localisation/currency.addCurrency/after', 'event/currency', 1, 1),
(33, 'admin_currency_edit', 'Updates currencies when a currency is edited.', 'admin/model/localisation/currency.editCurrency/after', 'event/currency', 1, 1),
(34, 'admin_currency_setting', 'Updates currencies when settings are saved.', 'admin/model/setting/setting.editSetting/after', 'event/currency', 1, 1),
(35, 'admin_mail_gdpr', 'Sends approval or denial mail to customer who requested GDPR data export or deletion.', 'admin/model/customer/gdpr.editStatus/after', 'mail/gdpr', 1, 1),
(36, 'admin_mail_affiliate_approve', 'Sends mail to the affiliate when their account is approved.', 'admin/model/customer/customer_approval.approveAffiliate/after', 'mail/affiliate.approve', 1, 1),
(37, 'admin_mail_affiliate_deny', 'Sends mail to the affiliate when their account is denied.', 'admin/model/customer/customer_approval.denyAffiliate/after', 'mail/affiliate.deny', 1, 1),
(38, 'admin_mail_customer_approve', 'Sends mail to the customer when their account is approved.', 'admin/model/customer/customer_approval.approveCustomer/after', 'mail/customer.approve', 1, 1),
(39, 'admin_mail_customer_deny', 'Sends mail to the customer when their account is denied.', 'admin/model/customer/customer_approval.denyCustomer/after', 'mail/customer.deny', 1, 1),
(40, 'admin_mail_customer_transaction', 'Sends mail to the customer when their transaction balance is updated.', 'admin/model/customer/customer.addTransaction/after', 'mail/transaction', 1, 1),
(41, 'admin_mail_reward', 'Sends mail to the customer when their reward balance is updated.', 'admin/model/customer/customer.addReward/after', 'mail/reward', 1, 1),
(42, 'admin_mail_return', 'Sends mail to customer when their return status is changed.', 'admin/model/sale/returns.addHistory/after', 'mail/returns', 1, 1),
(43, 'admin_mail_user_forgotten', 'Sends mail to users who have forgotten their password.', 'admin/model/user/user.addToken/after', 'mail/forgotten', 1, 1),
(44, 'admin_mail_user_authorize', 'Sends mail login code to users email to authorize login from a new device.', 'admin/controller/common/authorize.send/after', 'mail/authorize', 1, 1),
(45, 'admin_mail_user_authorize_reset', 'Sends reset link to user who`s account is locked out after 3 wrong authorize code login attempts.', 'admin/model/user/user.addToken/after', 'mail/authorize.reset', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `oc_extension_install`
--

CREATE TABLE `oc_extension_install` (
  `extension_install_id` int NOT NULL,
  `extension_id` int DEFAULT '0',
  `extension_download_id` int DEFAULT '0',
  `name` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `version` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `author` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `link` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) DEFAULT '0',
  `date_added` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `oc_extension_install`
--

INSERT INTO `oc_extension_install` (`extension_install_id`, `extension_id`, `extension_download_id`, `name`, `description`, `code`, `version`, `author`, `link`, `status`, `date_added`) VALUES
(1, 0, 0, 'OpenCart Default Extensions', 'This extension contains all the default extensions for modules, currencies, payment methods, shipping methods, anti-fraud, themes, order totals and reports.', 'opencart', '1.0', 'OpenCart Ltd', 'http://www.opencart.com', 1, '2020-08-29 15:35:39');

-- --------------------------------------------------------

--
-- Table structure for table `oc_extension_path`
--

CREATE TABLE `oc_extension_path` (
  `extension_path_id` int NOT NULL,
  `extension_install_id` int DEFAULT NULL,
  `path` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `oc_extension_path`
--

INSERT INTO `oc_extension_path` (`extension_path_id`, `extension_install_id`, `path`) VALUES
(1, 1, 'opencart'),
(2, 1, 'opencart/admin'),
(3, 1, 'opencart/admin/controller'),
(4, 1, 'opencart/admin/controller/analytics'),
(5, 1, 'opencart/admin/controller/analytics/index.html'),
(6, 1, 'opencart/admin/controller/captcha'),
(7, 1, 'opencart/admin/controller/captcha/basic.php'),
(8, 1, 'opencart/admin/controller/currency'),
(9, 1, 'opencart/admin/controller/currency/ecb.php'),
(10, 1, 'opencart/admin/controller/currency/fixer.php'),
(11, 1, 'opencart/admin/controller/dashboard'),
(12, 1, 'opencart/admin/controller/dashboard/activity.php'),
(13, 1, 'opencart/admin/controller/dashboard/chart.php'),
(14, 1, 'opencart/admin/controller/dashboard/customer.php'),
(15, 1, 'opencart/admin/controller/dashboard/map.php'),
(16, 1, 'opencart/admin/controller/dashboard/online.php'),
(17, 1, 'opencart/admin/controller/dashboard/order.php'),
(18, 1, 'opencart/admin/controller/dashboard/recent.php'),
(19, 1, 'opencart/admin/controller/dashboard/sale.php'),
(20, 1, 'opencart/admin/controller/feed'),
(21, 1, 'opencart/admin/controller/feed/index.html'),
(22, 1, 'opencart/admin/controller/fraud'),
(23, 1, 'opencart/admin/controller/fraud/ip.php'),
(24, 1, 'opencart/admin/controller/module'),
(25, 1, 'opencart/admin/controller/module/account.php'),
(26, 1, 'opencart/admin/controller/module/banner.php'),
(27, 1, 'opencart/admin/controller/module/bestseller.php'),
(28, 1, 'opencart/admin/controller/module/category.php'),
(29, 1, 'opencart/admin/controller/module/featured.php'),
(30, 1, 'opencart/admin/controller/module/filter.php'),
(31, 1, 'opencart/admin/controller/module/html.php'),
(32, 1, 'opencart/admin/controller/module/information.php'),
(33, 1, 'opencart/admin/controller/module/latest.php'),
(34, 1, 'opencart/admin/controller/module/special.php'),
(35, 1, 'opencart/admin/controller/module/store.php'),
(36, 1, 'opencart/admin/controller/payment'),
(37, 1, 'opencart/admin/controller/payment/bank_transfer.php'),
(38, 1, 'opencart/admin/controller/payment/cheque.php'),
(39, 1, 'opencart/admin/controller/payment/cod.php'),
(40, 1, 'opencart/admin/controller/payment/free_checkout.php'),
(41, 1, 'opencart/admin/controller/report'),
(42, 1, 'opencart/admin/controller/report/customer.php'),
(43, 1, 'opencart/admin/controller/report/customer_activity.php'),
(44, 1, 'opencart/admin/controller/report/customer_order.php'),
(45, 1, 'opencart/admin/controller/report/customer_reward.php'),
(46, 1, 'opencart/admin/controller/report/customer_search.php'),
(47, 1, 'opencart/admin/controller/report/subscription.php'),
(48, 1, 'opencart/admin/controller/report/customer_transaction.php'),
(49, 1, 'opencart/admin/controller/report/marketing.php'),
(50, 1, 'opencart/admin/controller/report/product_purchased.php'),
(51, 1, 'opencart/admin/controller/report/product_viewed.php'),
(52, 1, 'opencart/admin/controller/report/sale_coupon.php'),
(53, 1, 'opencart/admin/controller/report/sale_order.php'),
(54, 1, 'opencart/admin/controller/report/sale_return.php'),
(55, 1, 'opencart/admin/controller/report/sale_shipping.php'),
(56, 1, 'opencart/admin/controller/report/sale_tax.php'),
(57, 1, 'opencart/admin/controller/shipping'),
(58, 1, 'opencart/admin/controller/shipping/flat.php'),
(59, 1, 'opencart/admin/controller/shipping/free.php'),
(60, 1, 'opencart/admin/controller/shipping/item.php'),
(61, 1, 'opencart/admin/controller/shipping/pickup.php'),
(62, 1, 'opencart/admin/controller/shipping/weight.php'),
(63, 1, 'opencart/admin/controller/theme'),
(64, 1, 'opencart/admin/controller/theme/basic.php'),
(65, 1, 'opencart/admin/controller/total'),
(66, 1, 'opencart/admin/controller/total/coupon.php'),
(67, 1, 'opencart/admin/controller/total/credit.php'),
(68, 1, 'opencart/admin/controller/total/handling.php'),
(69, 1, 'opencart/admin/controller/total/low_order_fee.php'),
(70, 1, 'opencart/admin/controller/total/reward.php'),
(71, 1, 'opencart/admin/controller/total/shipping.php'),
(72, 1, 'opencart/admin/controller/total/sub_total.php'),
(73, 1, 'opencart/admin/controller/total/tax.php'),
(74, 1, 'opencart/admin/controller/total/total.php'),
(75, 1, 'opencart/admin/language'),
(76, 1, 'opencart/admin/language/en-gb'),
(77, 1, 'opencart/admin/language/en-gb/captcha'),
(78, 1, 'opencart/admin/language/en-gb/captcha/basic.php'),
(79, 1, 'opencart/admin/language/en-gb/currency'),
(80, 1, 'opencart/admin/language/en-gb/currency/ecb.php'),
(81, 1, 'opencart/admin/language/en-gb/currency/fixer.php'),
(82, 1, 'opencart/admin/language/en-gb/dashboard'),
(83, 1, 'opencart/admin/language/en-gb/dashboard/activity.php'),
(84, 1, 'opencart/admin/language/en-gb/dashboard/chart.php'),
(85, 1, 'opencart/admin/language/en-gb/dashboard/customer.php'),
(86, 1, 'opencart/admin/language/en-gb/dashboard/map.php'),
(87, 1, 'opencart/admin/language/en-gb/dashboard/online.php'),
(88, 1, 'opencart/admin/language/en-gb/dashboard/order.php'),
(89, 1, 'opencart/admin/language/en-gb/dashboard/recent.php'),
(90, 1, 'opencart/admin/language/en-gb/dashboard/sale.php'),
(91, 1, 'opencart/admin/language/en-gb/fraud'),
(92, 1, 'opencart/admin/language/en-gb/fraud/ip.php'),
(93, 1, 'opencart/admin/language/en-gb/module'),
(94, 1, 'opencart/admin/language/en-gb/module/account.php'),
(95, 1, 'opencart/admin/language/en-gb/module/banner.php'),
(96, 1, 'opencart/admin/language/en-gb/module/bestseller.php'),
(97, 1, 'opencart/admin/language/en-gb/module/category.php'),
(98, 1, 'opencart/admin/language/en-gb/module/featured.php'),
(99, 1, 'opencart/admin/language/en-gb/module/filter.php'),
(100, 1, 'opencart/admin/language/en-gb/module/html.php'),
(101, 1, 'opencart/admin/language/en-gb/module/information.php'),
(102, 1, 'opencart/admin/language/en-gb/module/latest.php'),
(103, 1, 'opencart/admin/language/en-gb/module/special.php'),
(104, 1, 'opencart/admin/language/en-gb/module/store.php'),
(105, 1, 'opencart/admin/language/en-gb/payment'),
(106, 1, 'opencart/admin/language/en-gb/payment/bank_transfer.php'),
(107, 1, 'opencart/admin/language/en-gb/payment/cheque.php'),
(108, 1, 'opencart/admin/language/en-gb/payment/cod.php'),
(109, 1, 'opencart/admin/language/en-gb/payment/free_checkout.php'),
(110, 1, 'opencart/admin/language/en-gb/report'),
(111, 1, 'opencart/admin/language/en-gb/report/customer.php'),
(112, 1, 'opencart/admin/language/en-gb/report/customer_activity.php'),
(113, 1, 'opencart/admin/language/en-gb/report/customer_order.php'),
(114, 1, 'opencart/admin/language/en-gb/report/customer_reward.php'),
(115, 1, 'opencart/admin/language/en-gb/report/customer_search.php'),
(116, 1, 'opencart/admin/language/en-gb/report/subscription.php'),
(117, 1, 'opencart/admin/language/en-gb/report/customer_transaction.php'),
(118, 1, 'opencart/admin/language/en-gb/report/marketing.php'),
(119, 1, 'opencart/admin/language/en-gb/report/product_purchased.php'),
(120, 1, 'opencart/admin/language/en-gb/report/product_viewed.php'),
(121, 1, 'opencart/admin/language/en-gb/report/sale_coupon.php'),
(122, 1, 'opencart/admin/language/en-gb/report/sale_order.php'),
(123, 1, 'opencart/admin/language/en-gb/report/sale_return.php'),
(124, 1, 'opencart/admin/language/en-gb/report/sale_shipping.php'),
(125, 1, 'opencart/admin/language/en-gb/report/sale_tax.php'),
(126, 1, 'opencart/admin/language/en-gb/shipping'),
(127, 1, 'opencart/admin/language/en-gb/shipping/flat.php'),
(128, 1, 'opencart/admin/language/en-gb/shipping/free.php'),
(129, 1, 'opencart/admin/language/en-gb/shipping/item.php'),
(130, 1, 'opencart/admin/language/en-gb/shipping/pickup.php'),
(131, 1, 'opencart/admin/language/en-gb/shipping/weight.php'),
(132, 1, 'opencart/admin/language/en-gb/theme'),
(133, 1, 'opencart/admin/language/en-gb/theme/basic.php'),
(134, 1, 'opencart/admin/language/en-gb/total'),
(135, 1, 'opencart/admin/language/en-gb/total/coupon.php'),
(136, 1, 'opencart/admin/language/en-gb/total/credit.php'),
(137, 1, 'opencart/admin/language/en-gb/total/handling.php'),
(138, 1, 'opencart/admin/language/en-gb/total/low_order_fee.php'),
(139, 1, 'opencart/admin/language/en-gb/total/reward.php'),
(140, 1, 'opencart/admin/language/en-gb/total/shipping.php'),
(141, 1, 'opencart/admin/language/en-gb/total/sub_total.php'),
(142, 1, 'opencart/admin/language/en-gb/total/tax.php'),
(143, 1, 'opencart/admin/language/en-gb/total/total.php'),
(144, 1, 'opencart/admin/model'),
(145, 1, 'opencart/admin/model/dashboard'),
(146, 1, 'opencart/admin/model/dashboard/map.php'),
(147, 1, 'opencart/admin/model/fraud'),
(148, 1, 'opencart/admin/model/fraud/ip.php'),
(149, 1, 'opencart/admin/model/module'),
(150, 1, 'opencart/admin/model/module/bestseller.php'),
(151, 1, 'opencart/admin/model/report'),
(152, 1, 'opencart/admin/model/report/activity.php'),
(153, 1, 'opencart/admin/model/report/coupon.php'),
(154, 1, 'opencart/admin/model/report/customer.php'),
(155, 1, 'opencart/admin/model/report/subscription.php'),
(156, 1, 'opencart/admin/model/report/customer_transaction.php'),
(157, 1, 'opencart/admin/model/report/marketing.php'),
(158, 1, 'opencart/admin/model/report/product_purchased.php'),
(159, 1, 'opencart/admin/model/report/product_viewed.php'),
(160, 1, 'opencart/admin/model/report/returns.php'),
(161, 1, 'opencart/admin/model/report/sale.php'),
(162, 1, 'opencart/admin/view'),
(163, 1, 'opencart/admin/view/image'),
(164, 1, 'opencart/admin/view/image/basic.png'),
(165, 1, 'opencart/admin/view/template'),
(166, 1, 'opencart/admin/view/template/captcha'),
(167, 1, 'opencart/admin/view/template/captcha/basic.twig'),
(168, 1, 'opencart/admin/view/template/currency'),
(169, 1, 'opencart/admin/view/template/currency/ecb.twig'),
(170, 1, 'opencart/admin/view/template/currency/fixer.twig'),
(171, 1, 'opencart/admin/view/template/dashboard'),
(172, 1, 'opencart/admin/view/template/dashboard/activity_form.twig'),
(173, 1, 'opencart/admin/view/template/dashboard/activity_info.twig'),
(174, 1, 'opencart/admin/view/template/dashboard/chart_form.twig'),
(175, 1, 'opencart/admin/view/template/dashboard/chart_info.twig'),
(176, 1, 'opencart/admin/view/template/dashboard/customer_form.twig'),
(177, 1, 'opencart/admin/view/template/dashboard/customer_info.twig'),
(178, 1, 'opencart/admin/view/template/dashboard/map_form.twig'),
(179, 1, 'opencart/admin/view/template/dashboard/map_info.twig'),
(180, 1, 'opencart/admin/view/template/dashboard/online_form.twig'),
(181, 1, 'opencart/admin/view/template/dashboard/online_info.twig'),
(182, 1, 'opencart/admin/view/template/dashboard/order_form.twig'),
(183, 1, 'opencart/admin/view/template/dashboard/order_info.twig'),
(184, 1, 'opencart/admin/view/template/dashboard/recent_form.twig'),
(185, 1, 'opencart/admin/view/template/dashboard/recent_info.twig'),
(186, 1, 'opencart/admin/view/template/dashboard/sale_form.twig'),
(187, 1, 'opencart/admin/view/template/dashboard/sale_info.twig'),
(188, 1, 'opencart/admin/view/template/fraud'),
(189, 1, 'opencart/admin/view/template/fraud/ip.twig'),
(190, 1, 'opencart/admin/view/template/fraud/ip_ip.twig'),
(191, 1, 'opencart/admin/view/template/module'),
(192, 1, 'opencart/admin/view/template/module/account.twig'),
(193, 1, 'opencart/admin/view/template/module/banner.twig'),
(194, 1, 'opencart/admin/view/template/module/bestseller.twig'),
(195, 1, 'opencart/admin/view/template/module/bestseller_report.twig'),
(196, 1, 'opencart/admin/view/template/module/category.twig'),
(197, 1, 'opencart/admin/view/template/module/featured.twig'),
(198, 1, 'opencart/admin/view/template/module/filter.twig'),
(199, 1, 'opencart/admin/view/template/module/html.twig'),
(200, 1, 'opencart/admin/view/template/module/information.twig'),
(201, 1, 'opencart/admin/view/template/module/latest.twig'),
(202, 1, 'opencart/admin/view/template/module/special.twig'),
(203, 1, 'opencart/admin/view/template/module/store.twig'),
(204, 1, 'opencart/admin/view/template/payment'),
(205, 1, 'opencart/admin/view/template/payment/bank_transfer.twig'),
(206, 1, 'opencart/admin/view/template/payment/cheque.twig'),
(207, 1, 'opencart/admin/view/template/payment/cod.twig'),
(208, 1, 'opencart/admin/view/template/payment/free_checkout.twig'),
(209, 1, 'opencart/admin/view/template/payment/order.twig'),
(210, 1, 'opencart/admin/view/template/report'),
(211, 1, 'opencart/admin/view/template/report/affiliate.twig'),
(212, 1, 'opencart/admin/view/template/report/affiliate_form.twig'),
(213, 1, 'opencart/admin/view/template/report/customer.twig'),
(214, 1, 'opencart/admin/view/template/report/customer_activity.twig'),
(215, 1, 'opencart/admin/view/template/report/customer_activity_form.twig'),
(216, 1, 'opencart/admin/view/template/report/customer_activity_list.twig'),
(217, 1, 'opencart/admin/view/template/report/customer_form.twig'),
(218, 1, 'opencart/admin/view/template/report/customer_list.twig'),
(219, 1, 'opencart/admin/view/template/report/customer_order.twig'),
(220, 1, 'opencart/admin/view/template/report/customer_order_form.twig'),
(221, 1, 'opencart/admin/view/template/report/customer_order_list.twig'),
(222, 1, 'opencart/admin/view/template/report/customer_reward.twig'),
(223, 1, 'opencart/admin/view/template/report/customer_reward_form.twig'),
(224, 1, 'opencart/admin/view/template/report/customer_reward_list.twig'),
(225, 1, 'opencart/admin/view/template/report/customer_search.twig'),
(226, 1, 'opencart/admin/view/template/report/customer_search_form.twig'),
(227, 1, 'opencart/admin/view/template/report/customer_search_list.twig'),
(228, 1, 'opencart/admin/view/template/report/subscription.twig'),
(229, 1, 'opencart/admin/view/template/report/subscription_form.twig'),
(230, 1, 'opencart/admin/view/template/report/subscription_list.twig'),
(231, 1, 'opencart/admin/view/template/report/customer_transaction.twig'),
(232, 1, 'opencart/admin/view/template/report/customer_transaction_form.twig'),
(233, 1, 'opencart/admin/view/template/report/customer_transaction_list.twig'),
(234, 1, 'opencart/admin/view/template/report/marketing.twig'),
(235, 1, 'opencart/admin/view/template/report/marketing_form.twig'),
(236, 1, 'opencart/admin/view/template/report/marketing_list.twig'),
(237, 1, 'opencart/admin/view/template/report/product_purchased.twig'),
(238, 1, 'opencart/admin/view/template/report/product_purchased_form.twig'),
(239, 1, 'opencart/admin/view/template/report/product_purchased_list.twig'),
(240, 1, 'opencart/admin/view/template/report/product_viewed.twig'),
(241, 1, 'opencart/admin/view/template/report/product_viewed_form.twig'),
(242, 1, 'opencart/admin/view/template/report/product_viewed_list.twig'),
(243, 1, 'opencart/admin/view/template/report/sale_coupon.twig'),
(244, 1, 'opencart/admin/view/template/report/sale_coupon_form.twig'),
(245, 1, 'opencart/admin/view/template/report/sale_coupon_list.twig'),
(246, 1, 'opencart/admin/view/template/report/sale_order.twig'),
(247, 1, 'opencart/admin/view/template/report/sale_order_form.twig'),
(248, 1, 'opencart/admin/view/template/report/sale_order_list.twig'),
(249, 1, 'opencart/admin/view/template/report/sale_return.twig'),
(250, 1, 'opencart/admin/view/template/report/sale_return_form.twig'),
(251, 1, 'opencart/admin/view/template/report/sale_return_list.twig'),
(252, 1, 'opencart/admin/view/template/report/sale_shipping.twig'),
(253, 1, 'opencart/admin/view/template/report/sale_shipping_form.twig'),
(254, 1, 'opencart/admin/view/template/report/sale_shipping_list.twig'),
(255, 1, 'opencart/admin/view/template/report/sale_tax.twig'),
(256, 1, 'opencart/admin/view/template/report/sale_tax_form.twig'),
(257, 1, 'opencart/admin/view/template/report/sale_tax_list.twig'),
(258, 1, 'opencart/admin/view/template/shipping'),
(259, 1, 'opencart/admin/view/template/shipping/flat.twig'),
(260, 1, 'opencart/admin/view/template/shipping/free.twig'),
(261, 1, 'opencart/admin/view/template/shipping/item.twig'),
(262, 1, 'opencart/admin/view/template/shipping/pickup.twig'),
(263, 1, 'opencart/admin/view/template/shipping/weight.twig'),
(264, 1, 'opencart/admin/view/template/theme'),
(265, 1, 'opencart/admin/view/template/theme/basic.twig'),
(266, 1, 'opencart/admin/view/template/total'),
(267, 1, 'opencart/admin/view/template/total/coupon.twig'),
(268, 1, 'opencart/admin/view/template/total/credit.twig'),
(269, 1, 'opencart/admin/view/template/total/handling.twig'),
(270, 1, 'opencart/admin/view/template/total/low_order_fee.twig'),
(271, 1, 'opencart/admin/view/template/total/reward.twig'),
(272, 1, 'opencart/admin/view/template/total/shipping.twig'),
(273, 1, 'opencart/admin/view/template/total/sub_total.twig'),
(274, 1, 'opencart/admin/view/template/total/tax.twig'),
(275, 1, 'opencart/admin/view/template/total/total.twig'),
(276, 1, 'opencart/catalog'),
(277, 1, 'opencart/catalog/controller'),
(278, 1, 'opencart/catalog/controller/captcha'),
(279, 1, 'opencart/catalog/controller/captcha/basic.php'),
(280, 1, 'opencart/catalog/controller/currency'),
(281, 1, 'opencart/catalog/controller/currency/ecb.php'),
(282, 1, 'opencart/catalog/controller/currency/fixer.php'),
(283, 1, 'opencart/catalog/controller/module'),
(284, 1, 'opencart/catalog/controller/module/account.php'),
(285, 1, 'opencart/catalog/controller/module/banner.php'),
(286, 1, 'opencart/catalog/controller/module/bestseller.php'),
(287, 1, 'opencart/catalog/controller/module/category.php'),
(288, 1, 'opencart/catalog/controller/module/featured.php'),
(289, 1, 'opencart/catalog/controller/module/filter.php'),
(290, 1, 'opencart/catalog/controller/module/html.php'),
(291, 1, 'opencart/catalog/controller/module/information.php'),
(292, 1, 'opencart/catalog/controller/module/latest.php'),
(293, 1, 'opencart/catalog/controller/module/special.php'),
(294, 1, 'opencart/catalog/controller/module/store.php'),
(295, 1, 'opencart/catalog/controller/payment'),
(296, 1, 'opencart/catalog/controller/payment/bank_transfer.php'),
(297, 1, 'opencart/catalog/controller/payment/cheque.php'),
(298, 1, 'opencart/catalog/controller/payment/cod.php'),
(299, 1, 'opencart/catalog/controller/payment/free_checkout.php'),
(300, 1, 'opencart/catalog/controller/total'),
(301, 1, 'opencart/catalog/controller/total/coupon.php'),
(302, 1, 'opencart/catalog/controller/total/reward.php'),
(303, 1, 'opencart/catalog/controller/total/shipping.php'),
(304, 1, 'opencart/catalog/language'),
(305, 1, 'opencart/catalog/language/de-de'),
(306, 1, 'opencart/catalog/language/de-de/module'),
(307, 1, 'opencart/catalog/language/de-de/module/featured.php'),
(308, 1, 'opencart/catalog/language/de-de/payment'),
(309, 1, 'opencart/catalog/language/de-de/payment/cod.php'),
(310, 1, 'opencart/catalog/language/en-gb'),
(311, 1, 'opencart/catalog/language/en-gb/captcha'),
(312, 1, 'opencart/catalog/language/en-gb/captcha/basic.php'),
(313, 1, 'opencart/catalog/language/en-gb/module'),
(314, 1, 'opencart/catalog/language/en-gb/module/account.php'),
(315, 1, 'opencart/catalog/language/en-gb/module/bestseller.php'),
(316, 1, 'opencart/catalog/language/en-gb/module/category.php'),
(317, 1, 'opencart/catalog/language/en-gb/module/featured.php'),
(318, 1, 'opencart/catalog/language/en-gb/module/filter.php'),
(319, 1, 'opencart/catalog/language/en-gb/module/information.php'),
(320, 1, 'opencart/catalog/language/en-gb/module/latest.php'),
(321, 1, 'opencart/catalog/language/en-gb/module/special.php'),
(322, 1, 'opencart/catalog/language/en-gb/module/store.php'),
(323, 1, 'opencart/catalog/language/en-gb/payment'),
(324, 1, 'opencart/catalog/language/en-gb/payment/bank_transfer.php'),
(325, 1, 'opencart/catalog/language/en-gb/payment/cheque.php'),
(326, 1, 'opencart/catalog/language/en-gb/payment/cod.php'),
(327, 1, 'opencart/catalog/language/en-gb/payment/free_checkout.php'),
(328, 1, 'opencart/catalog/language/en-gb/shipping'),
(329, 1, 'opencart/catalog/language/en-gb/shipping/flat.php'),
(330, 1, 'opencart/catalog/language/en-gb/shipping/free.php'),
(331, 1, 'opencart/catalog/language/en-gb/shipping/item.php'),
(332, 1, 'opencart/catalog/language/en-gb/shipping/pickup.php'),
(333, 1, 'opencart/catalog/language/en-gb/shipping/weight.php'),
(334, 1, 'opencart/catalog/language/en-gb/total'),
(335, 1, 'opencart/catalog/language/en-gb/total/coupon.php'),
(336, 1, 'opencart/catalog/language/en-gb/total/credit.php'),
(337, 1, 'opencart/catalog/language/en-gb/total/handling.php'),
(338, 1, 'opencart/catalog/language/en-gb/total/low_order_fee.php'),
(339, 1, 'opencart/catalog/language/en-gb/total/reward.php'),
(340, 1, 'opencart/catalog/language/en-gb/total/shipping.php'),
(341, 1, 'opencart/catalog/language/en-gb/total/sub_total.php'),
(342, 1, 'opencart/catalog/language/en-gb/total/total.php'),
(343, 1, 'opencart/catalog/model'),
(344, 1, 'opencart/catalog/model/fraud'),
(345, 1, 'opencart/catalog/model/fraud/ip.php'),
(346, 1, 'opencart/catalog/model/module'),
(347, 1, 'opencart/catalog/model/module/bestseller.php'),
(348, 1, 'opencart/catalog/model/module/latest.php'),
(349, 1, 'opencart/catalog/model/payment'),
(350, 1, 'opencart/catalog/model/payment/bank_transfer.php'),
(351, 1, 'opencart/catalog/model/payment/cheque.php'),
(352, 1, 'opencart/catalog/model/payment/cod.php'),
(353, 1, 'opencart/catalog/model/payment/free_checkout.php'),
(354, 1, 'opencart/catalog/model/shipping'),
(355, 1, 'opencart/catalog/model/shipping/flat.php'),
(356, 1, 'opencart/catalog/model/shipping/free.php'),
(357, 1, 'opencart/catalog/model/shipping/item.php'),
(358, 1, 'opencart/catalog/model/shipping/pickup.php'),
(359, 1, 'opencart/catalog/model/shipping/weight.php'),
(360, 1, 'opencart/catalog/model/total'),
(361, 1, 'opencart/catalog/model/total/coupon.php'),
(362, 1, 'opencart/catalog/model/total/credit.php'),
(363, 1, 'opencart/catalog/model/total/handling.php'),
(364, 1, 'opencart/catalog/model/total/low_order_fee.php'),
(365, 1, 'opencart/catalog/model/total/reward.php'),
(366, 1, 'opencart/catalog/model/total/shipping.php'),
(367, 1, 'opencart/catalog/model/total/sub_total.php'),
(368, 1, 'opencart/catalog/model/total/tax.php'),
(369, 1, 'opencart/catalog/model/total/total.php'),
(370, 1, 'opencart/catalog/view'),
(371, 1, 'opencart/catalog/view/template'),
(372, 1, 'opencart/catalog/view/template/captcha'),
(373, 1, 'opencart/catalog/view/template/captcha/basic.twig'),
(374, 1, 'opencart/catalog/view/template/module'),
(375, 1, 'opencart/catalog/view/template/module/account.twig'),
(376, 1, 'opencart/catalog/view/template/module/banner.twig'),
(377, 1, 'opencart/catalog/view/template/module/bestseller.twig'),
(378, 1, 'opencart/catalog/view/template/module/category.twig'),
(379, 1, 'opencart/catalog/view/template/module/featured.twig'),
(380, 1, 'opencart/catalog/view/template/module/filter.twig'),
(381, 1, 'opencart/catalog/view/template/module/html.twig'),
(382, 1, 'opencart/catalog/view/template/module/information.twig'),
(383, 1, 'opencart/catalog/view/template/module/latest.twig'),
(384, 1, 'opencart/catalog/view/template/module/special.twig'),
(385, 1, 'opencart/catalog/view/template/module/store.twig'),
(386, 1, 'opencart/catalog/view/template/payment'),
(387, 1, 'opencart/catalog/view/template/payment/bank_transfer.twig'),
(388, 1, 'opencart/catalog/view/template/payment/cheque.twig'),
(389, 1, 'opencart/catalog/view/template/payment/cod.twig'),
(390, 1, 'opencart/catalog/view/template/payment/free_checkout.twig'),
(391, 1, 'opencart/catalog/view/template/total'),
(392, 1, 'opencart/catalog/view/template/total/coupon.twig'),
(393, 1, 'opencart/catalog/view/template/total/reward.twig'),
(394, 1, 'opencart/catalog/view/template/total/shipping.twig'),
(395, 1, 'opencart/install.json');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `oc_event`
--
ALTER TABLE `oc_event`
  ADD PRIMARY KEY (`event_id`);

--
-- Indexes for table `oc_extension_install`
--
ALTER TABLE `oc_extension_install`
  ADD PRIMARY KEY (`extension_install_id`);

--
-- Indexes for table `oc_extension_path`
--
ALTER TABLE `oc_extension_path`
  ADD PRIMARY KEY (`extension_path_id`),
  ADD KEY `path` (`path`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `oc_event`
--
ALTER TABLE `oc_event`
  MODIFY `event_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

--
-- AUTO_INCREMENT for table `oc_extension_install`
--
ALTER TABLE `oc_extension_install`
  MODIFY `extension_install_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `oc_extension_path`
--
ALTER TABLE `oc_extension_path`
  MODIFY `extension_path_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=396;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
