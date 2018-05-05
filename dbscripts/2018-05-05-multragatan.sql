-- phpMyAdmin SQL Dump
-- version 4.0.10.18
-- https://www.phpmyadmin.net
--
-- Host: localhost:3306
-- Generation Time: May 05, 2018 at 03:19 PM
-- Server version: 5.6.39-cll-lve
-- PHP Version: 5.6.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `multragatan`
--

-- --------------------------------------------------------

--
-- Table structure for table `wp_ab_appointments`
--

CREATE TABLE IF NOT EXISTS `wp_ab_appointments` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `series_id` int(10) unsigned DEFAULT NULL,
  `location_id` int(10) unsigned DEFAULT NULL,
  `staff_id` int(10) unsigned NOT NULL,
  `staff_any` tinyint(1) NOT NULL DEFAULT '0',
  `service_id` int(10) unsigned DEFAULT NULL,
  `custom_service_name` varchar(255) DEFAULT NULL,
  `custom_service_price` decimal(10,2) DEFAULT NULL,
  `start_date` datetime NOT NULL,
  `end_date` datetime NOT NULL,
  `google_event_id` varchar(255) DEFAULT NULL,
  `extras_duration` int(11) NOT NULL DEFAULT '0',
  `internal_note` text,
  PRIMARY KEY (`id`),
  KEY `series_id` (`series_id`),
  KEY `staff_id` (`staff_id`),
  KEY `service_id` (`service_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `wp_ab_appointments`
--

INSERT INTO `wp_ab_appointments` (`id`, `series_id`, `location_id`, `staff_id`, `staff_any`, `service_id`, `custom_service_name`, `custom_service_price`, `start_date`, `end_date`, `google_event_id`, `extras_duration`, `internal_note`) VALUES
(1, NULL, NULL, 1, 0, 1, NULL, NULL, '2018-05-02 09:15:00', '2018-05-02 10:45:00', NULL, 0, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `wp_ab_categories`
--

CREATE TABLE IF NOT EXISTS `wp_ab_categories` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `position` int(11) NOT NULL DEFAULT '9999',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `wp_ab_customers`
--

CREATE TABLE IF NOT EXISTS `wp_ab_customers` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `wp_user_id` bigint(20) unsigned DEFAULT NULL,
  `full_name` varchar(255) NOT NULL DEFAULT '',
  `first_name` varchar(255) NOT NULL DEFAULT '',
  `last_name` varchar(255) NOT NULL DEFAULT '',
  `phone` varchar(255) NOT NULL DEFAULT '',
  `email` varchar(255) NOT NULL DEFAULT '',
  `notes` text NOT NULL,
  `birthday` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `wp_ab_customers`
--

INSERT INTO `wp_ab_customers` (`id`, `wp_user_id`, `full_name`, `first_name`, `last_name`, `phone`, `email`, `notes`, `birthday`) VALUES
(1, NULL, 'a', 'a', '', '+46765894321', 'zensalong@gmail.com', '', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `wp_ab_customer_appointments`
--

CREATE TABLE IF NOT EXISTS `wp_ab_customer_appointments` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `package_id` int(10) unsigned DEFAULT NULL,
  `customer_id` int(10) unsigned NOT NULL,
  `appointment_id` int(10) unsigned NOT NULL,
  `payment_id` int(10) unsigned DEFAULT NULL,
  `number_of_persons` int(10) unsigned NOT NULL DEFAULT '1',
  `notes` text,
  `extras` text,
  `custom_fields` text,
  `status` enum('pending','approved','cancelled','rejected','waitlisted') NOT NULL DEFAULT 'approved',
  `status_changed_at` datetime DEFAULT NULL,
  `token` varchar(255) DEFAULT NULL,
  `time_zone` varchar(255) DEFAULT NULL,
  `time_zone_offset` int(11) DEFAULT NULL,
  `locale` varchar(8) DEFAULT NULL,
  `compound_service_id` int(10) unsigned DEFAULT NULL,
  `compound_token` varchar(255) DEFAULT NULL,
  `created_from` enum('frontend','backend') NOT NULL DEFAULT 'frontend',
  `created` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `customer_id` (`customer_id`),
  KEY `appointment_id` (`appointment_id`),
  KEY `payment_id` (`payment_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `wp_ab_customer_appointments`
--

INSERT INTO `wp_ab_customer_appointments` (`id`, `package_id`, `customer_id`, `appointment_id`, `payment_id`, `number_of_persons`, `notes`, `extras`, `custom_fields`, `status`, `status_changed_at`, `token`, `time_zone`, `time_zone_offset`, `locale`, `compound_service_id`, `compound_token`, `created_from`, `created`) VALUES
(1, NULL, 1, 1, 1, 1, 'KFLdfajdljfladjfladfjaldjflajdfa', '[]', '[]', 'approved', NULL, '2011d2401111aa9dacb6e0b39df30f11', NULL, NULL, NULL, NULL, NULL, 'frontend', '2018-04-29 15:50:42');

-- --------------------------------------------------------

--
-- Table structure for table `wp_ab_holidays`
--

CREATE TABLE IF NOT EXISTS `wp_ab_holidays` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `staff_id` int(10) unsigned DEFAULT NULL,
  `parent_id` int(10) unsigned DEFAULT NULL,
  `date` date NOT NULL,
  `repeat_event` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `staff_id` (`staff_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `wp_ab_messages`
--

CREATE TABLE IF NOT EXISTS `wp_ab_messages` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `message_id` int(10) unsigned NOT NULL,
  `type` varchar(255) NOT NULL,
  `subject` text,
  `body` text,
  `seen` tinyint(1) NOT NULL DEFAULT '0',
  `created` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `wp_ab_notifications`
--

CREATE TABLE IF NOT EXISTS `wp_ab_notifications` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `gateway` enum('email','sms') NOT NULL DEFAULT 'email',
  `type` varchar(255) NOT NULL DEFAULT '',
  `active` tinyint(1) NOT NULL DEFAULT '0',
  `subject` varchar(255) NOT NULL DEFAULT '',
  `message` text,
  `to_staff` tinyint(1) NOT NULL DEFAULT '0',
  `to_customer` tinyint(1) NOT NULL DEFAULT '0',
  `to_admin` tinyint(1) NOT NULL DEFAULT '0',
  `attach_ics` tinyint(1) NOT NULL DEFAULT '0',
  `settings` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=37 ;

--
-- Dumping data for table `wp_ab_notifications`
--

INSERT INTO `wp_ab_notifications` (`id`, `gateway`, `type`, `active`, `subject`, `message`, `to_staff`, `to_customer`, `to_admin`, `attach_ics`, `settings`) VALUES
(1, 'email', 'client_pending_appointment', 0, 'Your appointment information', '<p>Dear {client_name}.</p>\n<p>This is a confirmation that you have booked {service_name}.</p>\n<p>We are waiting you at {company_address} on {appointment_date} at {appointment_time}.</p>\n<p>Thank you for choosing our company.</p>\n<p>{company_name}<br />\n{company_phone}<br />\n{company_website}</p>\n', 0, 0, 0, 0, '[]'),
(2, 'email', 'client_pending_appointment_cart', 0, 'Your appointment information', '<p>Dear {client_name}.</p>\n<p>This is a confirmation that you have booked the following items:</p>\n<p>{cart_info}</p>\n<p>Thank you for choosing our company.</p>\n<p>{company_name}<br />\n{company_phone}<br />\n{company_website}</p>\n', 0, 0, 0, 0, '[]'),
(3, 'email', 'staff_pending_appointment', 0, 'New booking information', '<p>Hello.</p>\n<p>You have a new booking.</p>\n<p>Service: {service_name}<br />\nDate: {appointment_date}<br />\nTime: {appointment_time}<br />\nClient name: {client_name}<br />\nClient phone: {client_phone}<br />\nClient email: {client_email}</p>\n', 0, 0, 0, 0, '[]'),
(4, 'email', 'client_approved_appointment', 0, 'Your appointment information', '<p>Dear {client_name}.</p>\n<p>This is a confirmation that you have booked {service_name}.</p>\n<p>We are waiting you at {company_address} on {appointment_date} at {appointment_time}.</p>\n<p>Thank you for choosing our company.</p>\n<p>{company_name}<br />\n{company_phone}<br />\n{company_website}</p>\n', 0, 0, 0, 0, '[]'),
(5, 'email', 'client_approved_appointment_cart', 0, 'Your appointment information', '<p>Dear {client_name}.</p>\n<p>This is a confirmation that you have booked the following items:</p>\n<p>{cart_info}</p>\n<p>Thank you for choosing our company.</p>\n<p>{company_name}<br />\n{company_phone}<br />\n{company_website}</p>\n', 0, 0, 0, 0, '[]'),
(6, 'email', 'staff_approved_appointment', 0, 'New booking information', '<p>Hello.</p>\n<p>You have a new booking.</p>\n<p>Service: {service_name}<br />\nDate: {appointment_date}<br />\nTime: {appointment_time}<br />\nClient name: {client_name}<br />\nClient phone: {client_phone}<br />\nClient email: {client_email}</p>\n', 0, 0, 0, 0, '[]'),
(7, 'email', 'client_cancelled_appointment', 0, 'Booking cancellation', '<p>Dear {client_name}.</p>\n<p>You have cancelled your booking of {service_name} on {appointment_date} at {appointment_time}.</p>\n<p>Thank you for choosing our company.</p>\n<p>{company_name}<br />\n{company_phone}<br />\n{company_website}</p>\n', 0, 0, 0, 0, '[]'),
(8, 'email', 'staff_cancelled_appointment', 0, 'Booking cancellation', '<p>Hello.</p>\n<p>The following booking has been cancelled.</p>\n<p>Service: {service_name}<br />\nDate: {appointment_date}<br />\nTime: {appointment_time}<br />\nClient name: {client_name}<br />\nClient phone: {client_phone}<br />\nClient email: {client_email}</p>\n', 0, 0, 0, 0, '[]'),
(9, 'email', 'client_rejected_appointment', 0, 'Booking rejection', '<p>Dear {client_name}.</p>\n<p>Your booking of {service_name} on {appointment_date} at {appointment_time} has been rejected.</p>\n<p>Reason: {cancellation_reason}</p>\n<p>Thank you for choosing our company.</p>\n<p>{company_name}<br />\n{company_phone}<br />\n{company_website}</p>\n', 0, 0, 0, 0, '[]'),
(10, 'email', 'staff_rejected_appointment', 0, 'Booking rejection', '<p>Hello.</p>\n<p>The following booking has been rejected.</p>\n<p>Reason: {cancellation_reason}</p>\n<p>Service: {service_name}<br />\nDate: {appointment_date}<br />\nTime: {appointment_time}<br />\nClient name: {client_name}<br />\nClient phone: {client_phone}<br />\nClient email: {client_email}</p>\n', 0, 0, 0, 0, '[]'),
(11, 'email', 'client_new_wp_user', 0, 'New customer', '<p>Hello.</p>\n<p>An account was created for you at {site_address}</p>\n<p>Your user details:<br />\nuser: {new_username}<br />\npassword: {new_password}</p>\n<p>Thanks.</p>\n', 0, 0, 0, 0, '[]'),
(12, 'email', 'client_reminder', 0, 'Your appointment at {company_name}', '<p>Dear {client_name}.</p>\n<p>We would like to remind you that you have booked {service_name} tomorrow at {appointment_time}. We are waiting for you at {company_address}.</p>\n<p>Thank you for choosing our company.</p>\n<p>{company_name}<br />\n{company_phone}<br />\n{company_website}</p>\n', 0, 0, 0, 0, '[]'),
(13, 'email', 'client_reminder_1st', 0, 'Your appointment at {company_name}', '<p>Dear {client_name}.</p>\n<p>We would like to remind you that you have booked {service_name} on {appointment_date} at {appointment_time}. We are waiting for you at {company_address}.</p>\n<p>Thank you for choosing our company.</p>\n<p>{company_name}<br />\n{company_phone}<br />\n{company_website}</p>\n', 0, 0, 0, 0, '[]'),
(14, 'email', 'client_reminder_2nd', 0, 'Your appointment at {company_name}', '<p>Dear {client_name}.</p>\n<p>We would like to remind you that you have booked {service_name} on {appointment_date} at {appointment_time}. We are waiting for you at {company_address}.</p>\n<p>Thank you for choosing our company.</p>\n<p>{company_name}<br />\n{company_phone}<br />\n{company_website}</p>\n', 0, 0, 0, 0, '[]'),
(15, 'email', 'client_reminder_3rd', 0, 'Your appointment at {company_name}', '<p>Dear {client_name}.</p>\n<p>We would like to remind you that you have booked {service_name} on {appointment_date} at {appointment_time}. We are waiting for you at {company_address}.</p>\n<p>Thank you for choosing our company.</p>\n<p>{company_name}<br />\n{company_phone}<br />\n{company_website}</p>\n', 0, 0, 0, 0, '[]'),
(16, 'email', 'client_follow_up', 0, 'Your visit to {company_name}', '<p>Dear {client_name}.</p>\n<p>Thank you for choosing {company_name}. We hope you were satisfied with your {service_name}.</p>\n<p>Thank you and we look forward to seeing you again soon.</p>\n<p>{company_name}<br />\n{company_phone}<br />\n{company_website}</p>\n', 0, 0, 0, 0, '[]'),
(17, 'email', 'client_birthday_greeting', 0, 'Happy Birthday!', '<p>Dear {client_name},</p>\n<p>Happy birthday!<br />\nWe wish you all the best.<br />\nMay you and your family be happy and healthy.</p>\n<p>Thank you for choosing our company.</p>\n<p>{company_name}<br />\n{company_phone}<br />\n{company_website}</p>\n', 0, 0, 0, 0, '[]'),
(18, 'email', 'staff_agenda', 0, 'Your agenda for {tomorrow_date}', '<p>Hello.</p>\n<p>Your agenda for tomorrow is:</p>\n<p>{next_day_agenda}</p>\n', 0, 0, 0, 0, '[]'),
(19, 'sms', 'client_pending_appointment', 1, '', 'Dear {client_name}.\nThis is a confirmation that you have booked {service_name}.\nWe are waiting you at {company_address} on {appointment_date} at {appointment_time}.\nThank you for choosing our company.\n{company_name}\n{company_phone}\n{company_website}', 0, 0, 0, 0, '[]'),
(20, 'sms', 'client_pending_appointment_cart', 1, '', 'Dear {client_name}.\nThis is a confirmation that you have booked the following items:\n{cart_info}\nThank you for choosing our company.\n{company_name}\n{company_phone}\n{company_website}', 0, 0, 0, 0, '[]'),
(21, 'sms', 'staff_pending_appointment', 1, '', 'Hello.\nYou have a new booking.\nService: {service_name}\nDate: {appointment_date}\nTime: {appointment_time}\nClient name: {client_name}\nClient phone: {client_phone}\nClient email: {client_email}', 0, 0, 0, 0, '[]'),
(22, 'sms', 'client_approved_appointment', 1, '', 'Dear {client_name}.\nThis is a confirmation that you have booked {service_name}.\nWe are waiting you at {company_address} on {appointment_date} at {appointment_time}.\nThank you for choosing our company.\n{company_name}\n{company_phone}\n{company_website}', 0, 0, 0, 0, '[]'),
(23, 'sms', 'client_approved_appointment_cart', 1, '', 'Dear {client_name}.\nThis is a confirmation that you have booked the following items:\n{cart_info}\nThank you for choosing our company.\n{company_name}\n{company_phone}\n{company_website}', 0, 0, 0, 0, '[]'),
(24, 'sms', 'staff_approved_appointment', 1, '', 'Hello.\nYou have a new booking.\nService: {service_name}\nDate: {appointment_date}\nTime: {appointment_time}\nClient name: {client_name}\nClient phone: {client_phone}\nClient email: {client_email}', 0, 0, 0, 0, '[]'),
(25, 'sms', 'client_cancelled_appointment', 1, '', 'Dear {client_name}.\nYou have cancelled your booking of {service_name} on {appointment_date} at {appointment_time}.\nThank you for choosing our company.\n{company_name}\n{company_phone}\n{company_website}', 0, 0, 0, 0, '[]'),
(26, 'sms', 'staff_cancelled_appointment', 1, '', 'Hello.\nThe following booking has been cancelled.\nService: {service_name}\nDate: {appointment_date}\nTime: {appointment_time}\nClient name: {client_name}\nClient phone: {client_phone}\nClient email: {client_email}', 0, 0, 0, 0, '[]'),
(27, 'sms', 'client_rejected_appointment', 1, '', 'Dear {client_name}.\nYour booking of {service_name} on {appointment_date} at {appointment_time} has been rejected.\nReason: {cancellation_reason}\nThank you for choosing our company.\n{company_name}\n{company_phone}\n{company_website}', 0, 0, 0, 0, '[]'),
(28, 'sms', 'staff_rejected_appointment', 1, '', 'Hello.\nThe following booking has been rejected.\nReason: {cancellation_reason}\nService: {service_name}\nDate: {appointment_date}\nTime: {appointment_time}\nClient name: {client_name}\nClient phone: {client_phone}\nClient email: {client_email}', 0, 0, 0, 0, '[]'),
(29, 'sms', 'client_new_wp_user', 1, '', 'Hello.\nAn account was created for you at {site_address}\nYour user details:\nuser: {new_username}\npassword: {new_password}\n\nThanks.', 0, 0, 0, 0, '[]'),
(30, 'sms', 'client_reminder', 0, '', 'Dear {client_name}.\nWe would like to remind you that you have booked {service_name} tomorrow at {appointment_time}. We are waiting for you at {company_address}.\nThank you for choosing our company.\n{company_name}\n{company_phone}\n{company_website}', 0, 0, 0, 0, '[]'),
(31, 'sms', 'client_reminder_1st', 0, '', 'Dear {client_name}.\nWe would like to remind you that you have booked {service_name} on {appointment_date} at {appointment_time}. We are waiting for you at {company_address}.\nThank you for choosing our company.\n{company_name}\n{company_phone}\n{company_website}', 0, 0, 0, 0, '[]'),
(32, 'sms', 'client_reminder_2nd', 0, '', 'Dear {client_name}.\nWe would like to remind you that you have booked {service_name} on {appointment_date} at {appointment_time}. We are waiting for you at {company_address}.\nThank you for choosing our company.\n{company_name}\n{company_phone}\n{company_website}', 0, 0, 0, 0, '[]'),
(33, 'sms', 'client_reminder_3rd', 0, '', 'Dear {client_name}.\nWe would like to remind you that you have booked {service_name} on {appointment_date} at {appointment_time}. We are waiting for you at {company_address}.\nThank you for choosing our company.\n{company_name}\n{company_phone}\n{company_website}', 0, 0, 0, 0, '[]'),
(34, 'sms', 'client_follow_up', 0, '', 'Dear {client_name}.\nThank you for choosing {company_name}. We hope you were satisfied with your {service_name}.\nThank you and we look forward to seeing you again soon.\n{company_name}\n{company_phone}\n{company_website}', 0, 0, 0, 0, '[]'),
(35, 'sms', 'client_birthday_greeting', 0, '', 'Dear {client_name},\nHappy birthday!\nWe wish you all the best.\nMay you and your family be happy and healthy.\nThank you for choosing our company.\n{company_name}\n{company_phone}\n{company_website}', 0, 0, 0, 0, '[]'),
(36, 'sms', 'staff_agenda', 0, '', 'Hello.\nYour agenda for tomorrow is:\n{next_day_agenda}', 0, 0, 0, 0, '[]');

-- --------------------------------------------------------

--
-- Table structure for table `wp_ab_payments`
--

CREATE TABLE IF NOT EXISTS `wp_ab_payments` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `type` enum('local','coupon','paypal','authorize_net','stripe','2checkout','payu_latam','payson','mollie','woocommerce') NOT NULL DEFAULT 'local',
  `total` decimal(10,2) NOT NULL DEFAULT '0.00',
  `paid` decimal(10,2) NOT NULL DEFAULT '0.00',
  `paid_type` enum('in_full','deposit') NOT NULL DEFAULT 'in_full',
  `status` enum('pending','completed') NOT NULL DEFAULT 'completed',
  `details` text,
  `created` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `wp_ab_payments`
--

INSERT INTO `wp_ab_payments` (`id`, `type`, `total`, `paid`, `paid_type`, `status`, `details`, `created`) VALUES
(1, 'local', '899.00', '0.00', 'in_full', 'pending', '{"items":[{"ca_id":1,"appointment_date":"2018-05-02 09:15:00","service_name":"Nytt set volymfransar","service_price":899,"deposit":"100%","number_of_persons":"1","staff_name":"Jenny Le","extras":[]}],"coupon":null,"customer":"a"}', '2018-04-29 15:50:42');

-- --------------------------------------------------------

--
-- Table structure for table `wp_ab_schedule_item_breaks`
--

CREATE TABLE IF NOT EXISTS `wp_ab_schedule_item_breaks` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `staff_schedule_item_id` int(10) unsigned NOT NULL,
  `start_time` time DEFAULT NULL,
  `end_time` time DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `staff_schedule_item_id` (`staff_schedule_item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `wp_ab_sent_notifications`
--

CREATE TABLE IF NOT EXISTS `wp_ab_sent_notifications` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ref_id` int(10) unsigned NOT NULL,
  `notification_id` int(10) unsigned NOT NULL,
  `created` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ref_id_idx` (`ref_id`),
  KEY `notification_id` (`notification_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `wp_ab_series`
--

CREATE TABLE IF NOT EXISTS `wp_ab_series` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `repeat` varchar(255) DEFAULT NULL,
  `token` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `wp_ab_services`
--

CREATE TABLE IF NOT EXISTS `wp_ab_services` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `category_id` int(10) unsigned DEFAULT NULL,
  `title` varchar(255) DEFAULT '',
  `duration` int(11) NOT NULL DEFAULT '900',
  `price` decimal(10,2) NOT NULL DEFAULT '0.00',
  `color` varchar(255) NOT NULL DEFAULT '#FFFFFF',
  `capacity_min` int(11) NOT NULL DEFAULT '1',
  `capacity_max` int(11) NOT NULL DEFAULT '1',
  `padding_left` int(11) NOT NULL DEFAULT '0',
  `padding_right` int(11) NOT NULL DEFAULT '0',
  `info` text,
  `start_time_info` varchar(255) DEFAULT '',
  `end_time_info` varchar(255) DEFAULT '',
  `type` enum('simple','compound','package') NOT NULL DEFAULT 'simple',
  `package_life_time` int(11) DEFAULT NULL,
  `package_size` int(11) DEFAULT NULL,
  `appointments_limit` int(11) DEFAULT NULL,
  `limit_period` enum('off','day','week','month','year') NOT NULL DEFAULT 'off',
  `staff_preference` enum('order','least_occupied','most_occupied','least_expensive','most_expensive') NOT NULL DEFAULT 'most_expensive',
  `recurrence_enabled` tinyint(1) NOT NULL DEFAULT '1',
  `recurrence_frequencies` set('daily','weekly','biweekly','monthly') NOT NULL DEFAULT 'daily,weekly,biweekly,monthly',
  `visibility` enum('public','private') NOT NULL DEFAULT 'public',
  `position` int(11) NOT NULL DEFAULT '9999',
  PRIMARY KEY (`id`),
  KEY `category_id` (`category_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `wp_ab_services`
--

INSERT INTO `wp_ab_services` (`id`, `category_id`, `title`, `duration`, `price`, `color`, `capacity_min`, `capacity_max`, `padding_left`, `padding_right`, `info`, `start_time_info`, `end_time_info`, `type`, `package_life_time`, `package_size`, `appointments_limit`, `limit_period`, `staff_preference`, `recurrence_enabled`, `recurrence_frequencies`, `visibility`, `position`) VALUES
(1, NULL, 'Nytt set volymfransar', 5400, '899.00', '#34BA7A', 1, 1, 0, 900, '', '', '', 'simple', NULL, NULL, NULL, 'off', 'most_expensive', 1, 'daily,weekly,biweekly,monthly', 'public', 9999);

-- --------------------------------------------------------

--
-- Table structure for table `wp_ab_staff`
--

CREATE TABLE IF NOT EXISTS `wp_ab_staff` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `wp_user_id` bigint(20) unsigned DEFAULT NULL,
  `attachment_id` int(10) unsigned DEFAULT NULL,
  `full_name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `info` text,
  `google_data` text,
  `google_calendar_id` varchar(255) DEFAULT NULL,
  `visibility` enum('public','private') NOT NULL DEFAULT 'public',
  `position` int(11) NOT NULL DEFAULT '9999',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `wp_ab_staff`
--

INSERT INTO `wp_ab_staff` (`id`, `wp_user_id`, `attachment_id`, `full_name`, `email`, `phone`, `info`, `google_data`, `google_calendar_id`, `visibility`, `position`) VALUES
(1, 0, 0, 'Jenny Le', 'info@zensalon.se', '', '', NULL, NULL, 'public', 9999);

-- --------------------------------------------------------

--
-- Table structure for table `wp_ab_staff_preference_orders`
--

CREATE TABLE IF NOT EXISTS `wp_ab_staff_preference_orders` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `service_id` int(10) unsigned NOT NULL,
  `staff_id` int(10) unsigned NOT NULL,
  `position` int(11) NOT NULL DEFAULT '9999',
  PRIMARY KEY (`id`),
  KEY `service_id` (`service_id`),
  KEY `staff_id` (`staff_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `wp_ab_staff_schedule_items`
--

CREATE TABLE IF NOT EXISTS `wp_ab_staff_schedule_items` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `staff_id` int(10) unsigned NOT NULL,
  `day_index` int(10) unsigned NOT NULL,
  `start_time` time DEFAULT NULL,
  `end_time` time DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_ids_idx` (`staff_id`,`day_index`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=8 ;

--
-- Dumping data for table `wp_ab_staff_schedule_items`
--

INSERT INTO `wp_ab_staff_schedule_items` (`id`, `staff_id`, `day_index`, `start_time`, `end_time`) VALUES
(1, 1, 1, '08:00:00', '18:00:00'),
(2, 1, 2, '08:00:00', '18:00:00'),
(3, 1, 3, '08:00:00', '18:00:00'),
(4, 1, 4, '08:00:00', '18:00:00'),
(5, 1, 5, '08:00:00', '18:00:00'),
(6, 1, 6, '08:00:00', '18:00:00'),
(7, 1, 7, '08:00:00', '18:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `wp_ab_staff_services`
--

CREATE TABLE IF NOT EXISTS `wp_ab_staff_services` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `staff_id` int(10) unsigned NOT NULL,
  `service_id` int(10) unsigned NOT NULL,
  `price` decimal(10,2) NOT NULL DEFAULT '0.00',
  `deposit` varchar(100) NOT NULL DEFAULT '100%',
  `capacity_min` int(11) NOT NULL DEFAULT '1',
  `capacity_max` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_ids_idx` (`staff_id`,`service_id`),
  KEY `service_id` (`service_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `wp_ab_staff_services`
--

INSERT INTO `wp_ab_staff_services` (`id`, `staff_id`, `service_id`, `price`, `deposit`, `capacity_min`, `capacity_max`) VALUES
(1, 1, 1, '899.00', '100%', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `wp_ab_stats`
--

CREATE TABLE IF NOT EXISTS `wp_ab_stats` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `value` text,
  `created` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `wp_ab_sub_services`
--

CREATE TABLE IF NOT EXISTS `wp_ab_sub_services` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `type` enum('service','spare_time') NOT NULL DEFAULT 'service',
  `service_id` int(10) unsigned NOT NULL,
  `sub_service_id` int(10) unsigned DEFAULT NULL,
  `duration` int(11) DEFAULT NULL,
  `position` int(11) NOT NULL DEFAULT '9999',
  PRIMARY KEY (`id`),
  KEY `service_id` (`service_id`),
  KEY `sub_service_id` (`sub_service_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `wp_commentmeta`
--

CREATE TABLE IF NOT EXISTS `wp_commentmeta` (
  `meta_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `comment_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_520_ci,
  PRIMARY KEY (`meta_id`),
  KEY `comment_id` (`comment_id`),
  KEY `meta_key` (`meta_key`(191))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `wp_comments`
--

CREATE TABLE IF NOT EXISTS `wp_comments` (
  `comment_ID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `comment_post_ID` bigint(20) unsigned NOT NULL DEFAULT '0',
  `comment_author` tinytext COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `comment_author_email` varchar(100) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `comment_author_url` varchar(200) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `comment_author_IP` varchar(100) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `comment_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `comment_date_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `comment_content` text COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `comment_karma` int(11) NOT NULL DEFAULT '0',
  `comment_approved` varchar(20) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '1',
  `comment_agent` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `comment_type` varchar(20) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `comment_parent` bigint(20) unsigned NOT NULL DEFAULT '0',
  `user_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`comment_ID`),
  KEY `comment_post_ID` (`comment_post_ID`),
  KEY `comment_approved_date_gmt` (`comment_approved`,`comment_date_gmt`),
  KEY `comment_date_gmt` (`comment_date_gmt`),
  KEY `comment_parent` (`comment_parent`),
  KEY `comment_author_email` (`comment_author_email`(10))
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci AUTO_INCREMENT=2 ;

--
-- Dumping data for table `wp_comments`
--

INSERT INTO `wp_comments` (`comment_ID`, `comment_post_ID`, `comment_author`, `comment_author_email`, `comment_author_url`, `comment_author_IP`, `comment_date`, `comment_date_gmt`, `comment_content`, `comment_karma`, `comment_approved`, `comment_agent`, `comment_type`, `comment_parent`, `user_id`) VALUES
(1, 1, 'A WordPress Commenter', 'wapuu@wordpress.example', 'https://wordpress.org/', '', '2018-04-24 22:13:22', '2018-04-24 22:13:22', 'Hi, this is a comment.\nTo get started with moderating, editing, and deleting comments, please visit the Comments screen in the dashboard.\nCommenter avatars come from <a href="https://gravatar.com">Gravatar</a>.', 0, '1', '', '', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `wp_links`
--

CREATE TABLE IF NOT EXISTS `wp_links` (
  `link_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `link_url` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `link_name` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `link_image` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `link_target` varchar(25) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `link_description` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `link_visible` varchar(20) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'Y',
  `link_owner` bigint(20) unsigned NOT NULL DEFAULT '1',
  `link_rating` int(11) NOT NULL DEFAULT '0',
  `link_updated` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `link_rel` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `link_notes` mediumtext COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `link_rss` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`link_id`),
  KEY `link_visible` (`link_visible`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `wp_options`
--

CREATE TABLE IF NOT EXISTS `wp_options` (
  `option_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `option_name` varchar(191) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `option_value` longtext COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `autoload` varchar(20) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'yes',
  PRIMARY KEY (`option_id`),
  UNIQUE KEY `option_name` (`option_name`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci AUTO_INCREMENT=465 ;

--
-- Dumping data for table `wp_options`
--

INSERT INTO `wp_options` (`option_id`, `option_name`, `option_value`, `autoload`) VALUES
(1, 'siteurl', 'http://www.zensalon.se', 'yes'),
(2, 'home', 'http://www.zensalon.se', 'yes'),
(3, 'blogname', 'Zen salon', 'yes'),
(4, 'blogdescription', 'Franzéngatan 44, 112 16 Stockholm  076 086 44 17', 'yes'),
(5, 'users_can_register', '0', 'yes'),
(6, 'admin_email', 'zensalong@gmail.com', 'yes'),
(7, 'start_of_week', '1', 'yes'),
(8, 'use_balanceTags', '0', 'yes'),
(9, 'use_smilies', '1', 'yes'),
(10, 'require_name_email', '1', 'yes'),
(11, 'comments_notify', '1', 'yes'),
(12, 'posts_per_rss', '10', 'yes'),
(13, 'rss_use_excerpt', '0', 'yes'),
(14, 'mailserver_url', 'mail.example.com', 'yes'),
(15, 'mailserver_login', 'login@example.com', 'yes'),
(16, 'mailserver_pass', 'password', 'yes'),
(17, 'mailserver_port', '110', 'yes'),
(18, 'default_category', '1', 'yes'),
(19, 'default_comment_status', 'open', 'yes'),
(20, 'default_ping_status', 'open', 'yes'),
(21, 'default_pingback_flag', '1', 'yes'),
(22, 'posts_per_page', '10', 'yes'),
(23, 'date_format', 'F j, Y', 'yes'),
(24, 'time_format', 'g:i a', 'yes'),
(25, 'links_updated_date_format', 'F j, Y g:i a', 'yes'),
(26, 'comment_moderation', '0', 'yes'),
(27, 'moderation_notify', '1', 'yes'),
(28, 'permalink_structure', '/%year%/%monthnum%/%day%/%postname%/', 'yes'),
(29, 'rewrite_rules', 'a:108:{s:11:"^wp-json/?$";s:22:"index.php?rest_route=/";s:14:"^wp-json/(.*)?";s:33:"index.php?rest_route=/$matches[1]";s:21:"^index.php/wp-json/?$";s:22:"index.php?rest_route=/";s:24:"^index.php/wp-json/(.*)?";s:33:"index.php?rest_route=/$matches[1]";s:47:"category/(.+?)/feed/(feed|rdf|rss|rss2|atom)/?$";s:52:"index.php?category_name=$matches[1]&feed=$matches[2]";s:42:"category/(.+?)/(feed|rdf|rss|rss2|atom)/?$";s:52:"index.php?category_name=$matches[1]&feed=$matches[2]";s:23:"category/(.+?)/embed/?$";s:46:"index.php?category_name=$matches[1]&embed=true";s:35:"category/(.+?)/page/?([0-9]{1,})/?$";s:53:"index.php?category_name=$matches[1]&paged=$matches[2]";s:17:"category/(.+?)/?$";s:35:"index.php?category_name=$matches[1]";s:44:"tag/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:42:"index.php?tag=$matches[1]&feed=$matches[2]";s:39:"tag/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:42:"index.php?tag=$matches[1]&feed=$matches[2]";s:20:"tag/([^/]+)/embed/?$";s:36:"index.php?tag=$matches[1]&embed=true";s:32:"tag/([^/]+)/page/?([0-9]{1,})/?$";s:43:"index.php?tag=$matches[1]&paged=$matches[2]";s:14:"tag/([^/]+)/?$";s:25:"index.php?tag=$matches[1]";s:45:"type/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:50:"index.php?post_format=$matches[1]&feed=$matches[2]";s:40:"type/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:50:"index.php?post_format=$matches[1]&feed=$matches[2]";s:21:"type/([^/]+)/embed/?$";s:44:"index.php?post_format=$matches[1]&embed=true";s:33:"type/([^/]+)/page/?([0-9]{1,})/?$";s:51:"index.php?post_format=$matches[1]&paged=$matches[2]";s:15:"type/([^/]+)/?$";s:33:"index.php?post_format=$matches[1]";s:42:"portfolio-item/[^/]+/attachment/([^/]+)/?$";s:32:"index.php?attachment=$matches[1]";s:52:"portfolio-item/[^/]+/attachment/([^/]+)/trackback/?$";s:37:"index.php?attachment=$matches[1]&tb=1";s:72:"portfolio-item/[^/]+/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:67:"portfolio-item/[^/]+/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:67:"portfolio-item/[^/]+/attachment/([^/]+)/comment-page-([0-9]{1,})/?$";s:50:"index.php?attachment=$matches[1]&cpage=$matches[2]";s:48:"portfolio-item/[^/]+/attachment/([^/]+)/embed/?$";s:43:"index.php?attachment=$matches[1]&embed=true";s:31:"portfolio-item/([^/]+)/embed/?$";s:42:"index.php?portfolio=$matches[1]&embed=true";s:35:"portfolio-item/([^/]+)/trackback/?$";s:36:"index.php?portfolio=$matches[1]&tb=1";s:43:"portfolio-item/([^/]+)/page/?([0-9]{1,})/?$";s:49:"index.php?portfolio=$matches[1]&paged=$matches[2]";s:50:"portfolio-item/([^/]+)/comment-page-([0-9]{1,})/?$";s:49:"index.php?portfolio=$matches[1]&cpage=$matches[2]";s:39:"portfolio-item/([^/]+)(?:/([0-9]+))?/?$";s:48:"index.php?portfolio=$matches[1]&page=$matches[2]";s:31:"portfolio-item/[^/]+/([^/]+)/?$";s:32:"index.php?attachment=$matches[1]";s:41:"portfolio-item/[^/]+/([^/]+)/trackback/?$";s:37:"index.php?attachment=$matches[1]&tb=1";s:61:"portfolio-item/[^/]+/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:56:"portfolio-item/[^/]+/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:56:"portfolio-item/[^/]+/([^/]+)/comment-page-([0-9]{1,})/?$";s:50:"index.php?attachment=$matches[1]&cpage=$matches[2]";s:37:"portfolio-item/[^/]+/([^/]+)/embed/?$";s:43:"index.php?attachment=$matches[1]&embed=true";s:12:"robots\\.txt$";s:18:"index.php?robots=1";s:48:".*wp-(atom|rdf|rss|rss2|feed|commentsrss2)\\.php$";s:18:"index.php?feed=old";s:20:".*wp-app\\.php(/.*)?$";s:19:"index.php?error=403";s:18:".*wp-register.php$";s:23:"index.php?register=true";s:32:"feed/(feed|rdf|rss|rss2|atom)/?$";s:27:"index.php?&feed=$matches[1]";s:27:"(feed|rdf|rss|rss2|atom)/?$";s:27:"index.php?&feed=$matches[1]";s:8:"embed/?$";s:21:"index.php?&embed=true";s:20:"page/?([0-9]{1,})/?$";s:28:"index.php?&paged=$matches[1]";s:27:"comment-page-([0-9]{1,})/?$";s:39:"index.php?&page_id=26&cpage=$matches[1]";s:41:"comments/feed/(feed|rdf|rss|rss2|atom)/?$";s:42:"index.php?&feed=$matches[1]&withcomments=1";s:36:"comments/(feed|rdf|rss|rss2|atom)/?$";s:42:"index.php?&feed=$matches[1]&withcomments=1";s:17:"comments/embed/?$";s:21:"index.php?&embed=true";s:44:"search/(.+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:40:"index.php?s=$matches[1]&feed=$matches[2]";s:39:"search/(.+)/(feed|rdf|rss|rss2|atom)/?$";s:40:"index.php?s=$matches[1]&feed=$matches[2]";s:20:"search/(.+)/embed/?$";s:34:"index.php?s=$matches[1]&embed=true";s:32:"search/(.+)/page/?([0-9]{1,})/?$";s:41:"index.php?s=$matches[1]&paged=$matches[2]";s:14:"search/(.+)/?$";s:23:"index.php?s=$matches[1]";s:47:"author/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:50:"index.php?author_name=$matches[1]&feed=$matches[2]";s:42:"author/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:50:"index.php?author_name=$matches[1]&feed=$matches[2]";s:23:"author/([^/]+)/embed/?$";s:44:"index.php?author_name=$matches[1]&embed=true";s:35:"author/([^/]+)/page/?([0-9]{1,})/?$";s:51:"index.php?author_name=$matches[1]&paged=$matches[2]";s:17:"author/([^/]+)/?$";s:33:"index.php?author_name=$matches[1]";s:69:"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/feed/(feed|rdf|rss|rss2|atom)/?$";s:80:"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&feed=$matches[4]";s:64:"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/(feed|rdf|rss|rss2|atom)/?$";s:80:"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&feed=$matches[4]";s:45:"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/embed/?$";s:74:"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&embed=true";s:57:"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/page/?([0-9]{1,})/?$";s:81:"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&paged=$matches[4]";s:39:"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/?$";s:63:"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]";s:56:"([0-9]{4})/([0-9]{1,2})/feed/(feed|rdf|rss|rss2|atom)/?$";s:64:"index.php?year=$matches[1]&monthnum=$matches[2]&feed=$matches[3]";s:51:"([0-9]{4})/([0-9]{1,2})/(feed|rdf|rss|rss2|atom)/?$";s:64:"index.php?year=$matches[1]&monthnum=$matches[2]&feed=$matches[3]";s:32:"([0-9]{4})/([0-9]{1,2})/embed/?$";s:58:"index.php?year=$matches[1]&monthnum=$matches[2]&embed=true";s:44:"([0-9]{4})/([0-9]{1,2})/page/?([0-9]{1,})/?$";s:65:"index.php?year=$matches[1]&monthnum=$matches[2]&paged=$matches[3]";s:26:"([0-9]{4})/([0-9]{1,2})/?$";s:47:"index.php?year=$matches[1]&monthnum=$matches[2]";s:43:"([0-9]{4})/feed/(feed|rdf|rss|rss2|atom)/?$";s:43:"index.php?year=$matches[1]&feed=$matches[2]";s:38:"([0-9]{4})/(feed|rdf|rss|rss2|atom)/?$";s:43:"index.php?year=$matches[1]&feed=$matches[2]";s:19:"([0-9]{4})/embed/?$";s:37:"index.php?year=$matches[1]&embed=true";s:31:"([0-9]{4})/page/?([0-9]{1,})/?$";s:44:"index.php?year=$matches[1]&paged=$matches[2]";s:13:"([0-9]{4})/?$";s:26:"index.php?year=$matches[1]";s:58:"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/attachment/([^/]+)/?$";s:32:"index.php?attachment=$matches[1]";s:68:"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/attachment/([^/]+)/trackback/?$";s:37:"index.php?attachment=$matches[1]&tb=1";s:88:"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:83:"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:83:"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/attachment/([^/]+)/comment-page-([0-9]{1,})/?$";s:50:"index.php?attachment=$matches[1]&cpage=$matches[2]";s:64:"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/attachment/([^/]+)/embed/?$";s:43:"index.php?attachment=$matches[1]&embed=true";s:53:"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/([^/]+)/embed/?$";s:91:"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&name=$matches[4]&embed=true";s:57:"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/([^/]+)/trackback/?$";s:85:"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&name=$matches[4]&tb=1";s:77:"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:97:"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&name=$matches[4]&feed=$matches[5]";s:72:"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:97:"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&name=$matches[4]&feed=$matches[5]";s:65:"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/([^/]+)/page/?([0-9]{1,})/?$";s:98:"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&name=$matches[4]&paged=$matches[5]";s:72:"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/([^/]+)/comment-page-([0-9]{1,})/?$";s:98:"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&name=$matches[4]&cpage=$matches[5]";s:61:"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/([^/]+)(?:/([0-9]+))?/?$";s:97:"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&name=$matches[4]&page=$matches[5]";s:47:"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/([^/]+)/?$";s:32:"index.php?attachment=$matches[1]";s:57:"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/([^/]+)/trackback/?$";s:37:"index.php?attachment=$matches[1]&tb=1";s:77:"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:72:"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:72:"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/([^/]+)/comment-page-([0-9]{1,})/?$";s:50:"index.php?attachment=$matches[1]&cpage=$matches[2]";s:53:"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/([^/]+)/embed/?$";s:43:"index.php?attachment=$matches[1]&embed=true";s:64:"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/comment-page-([0-9]{1,})/?$";s:81:"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&cpage=$matches[4]";s:51:"([0-9]{4})/([0-9]{1,2})/comment-page-([0-9]{1,})/?$";s:65:"index.php?year=$matches[1]&monthnum=$matches[2]&cpage=$matches[3]";s:38:"([0-9]{4})/comment-page-([0-9]{1,})/?$";s:44:"index.php?year=$matches[1]&cpage=$matches[2]";s:27:".?.+?/attachment/([^/]+)/?$";s:32:"index.php?attachment=$matches[1]";s:37:".?.+?/attachment/([^/]+)/trackback/?$";s:37:"index.php?attachment=$matches[1]&tb=1";s:57:".?.+?/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:52:".?.+?/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:52:".?.+?/attachment/([^/]+)/comment-page-([0-9]{1,})/?$";s:50:"index.php?attachment=$matches[1]&cpage=$matches[2]";s:33:".?.+?/attachment/([^/]+)/embed/?$";s:43:"index.php?attachment=$matches[1]&embed=true";s:16:"(.?.+?)/embed/?$";s:41:"index.php?pagename=$matches[1]&embed=true";s:20:"(.?.+?)/trackback/?$";s:35:"index.php?pagename=$matches[1]&tb=1";s:40:"(.?.+?)/feed/(feed|rdf|rss|rss2|atom)/?$";s:47:"index.php?pagename=$matches[1]&feed=$matches[2]";s:35:"(.?.+?)/(feed|rdf|rss|rss2|atom)/?$";s:47:"index.php?pagename=$matches[1]&feed=$matches[2]";s:28:"(.?.+?)/page/?([0-9]{1,})/?$";s:48:"index.php?pagename=$matches[1]&paged=$matches[2]";s:35:"(.?.+?)/comment-page-([0-9]{1,})/?$";s:48:"index.php?pagename=$matches[1]&cpage=$matches[2]";s:24:"(.?.+?)(?:/([0-9]+))?/?$";s:47:"index.php?pagename=$matches[1]&page=$matches[2]";}', 'yes'),
(30, 'hack_file', '0', 'yes'),
(31, 'blog_charset', 'UTF-8', 'yes'),
(32, 'moderation_keys', '', 'no'),
(33, 'active_plugins', 'a:2:{i:0;s:51:"bookly-responsive-appointment-booking-tool/main.php";i:1;s:25:"genericond/genericons.php";}', 'yes'),
(34, 'category_base', '', 'yes'),
(35, 'ping_sites', 'http://rpc.pingomatic.com/', 'yes'),
(36, 'comment_max_links', '2', 'yes'),
(37, 'gmt_offset', '0', 'yes'),
(38, 'default_email_category', '1', 'yes'),
(39, 'recently_edited', 'a:5:{i:0;s:53:"/var/www/html/wp-content/themes/zeebizzcard/style.css";i:1;s:58:"/var/www/html/wp-content/plugins/genericond/genericons.php";i:2;s:52:"/var/www/html/wp-content/plugins/akismet/akismet.php";i:3;s:57:"/var/www/html/wp-content/themes/twentyseventeen/style.css";i:4;s:61:"/var/www/html/wp-content/themes/twentyseventeen/functions.php";}', 'no'),
(40, 'template', 'zeebizzcard', 'yes'),
(41, 'stylesheet', 'zeebizzcard', 'yes'),
(42, 'comment_whitelist', '1', 'yes'),
(43, 'blacklist_keys', '', 'no'),
(44, 'comment_registration', '0', 'yes'),
(45, 'html_type', 'text/html', 'yes'),
(46, 'use_trackback', '0', 'yes'),
(47, 'default_role', 'subscriber', 'yes'),
(48, 'db_version', '38590', 'yes'),
(49, 'uploads_use_yearmonth_folders', '1', 'yes'),
(50, 'upload_path', '', 'yes'),
(51, 'blog_public', '1', 'yes'),
(52, 'default_link_category', '2', 'yes'),
(53, 'show_on_front', 'page', 'yes'),
(54, 'tag_base', '', 'yes'),
(55, 'show_avatars', '1', 'yes'),
(56, 'avatar_rating', 'G', 'yes'),
(57, 'upload_url_path', '', 'yes'),
(58, 'thumbnail_size_w', '150', 'yes'),
(59, 'thumbnail_size_h', '150', 'yes'),
(60, 'thumbnail_crop', '1', 'yes'),
(61, 'medium_size_w', '300', 'yes'),
(62, 'medium_size_h', '300', 'yes'),
(63, 'avatar_default', 'mystery', 'yes'),
(64, 'large_size_w', '1024', 'yes'),
(65, 'large_size_h', '1024', 'yes'),
(66, 'image_default_link_type', 'none', 'yes'),
(67, 'image_default_size', '', 'yes'),
(68, 'image_default_align', '', 'yes'),
(69, 'close_comments_for_old_posts', '0', 'yes'),
(70, 'close_comments_days_old', '14', 'yes'),
(71, 'thread_comments', '1', 'yes'),
(72, 'thread_comments_depth', '5', 'yes'),
(73, 'page_comments', '0', 'yes'),
(74, 'comments_per_page', '50', 'yes'),
(75, 'default_comments_page', 'newest', 'yes'),
(76, 'comment_order', 'asc', 'yes'),
(77, 'sticky_posts', 'a:0:{}', 'yes'),
(78, 'widget_categories', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(79, 'widget_text', 'a:5:{i:2;a:4:{s:5:"title";s:7:"Find Us";s:4:"text";s:168:"<strong>Address</strong>\n123 Main Street\nNew York, NY 10001\n\n<strong>Hours</strong>\nMonday&mdash;Friday: 9:00AM&ndash;5:00PM\nSaturday &amp; Sunday: 11:00AM&ndash;3:00PM";s:6:"filter";b:1;s:6:"visual";b:1;}i:3;a:4:{s:5:"title";s:15:"About This Site";s:4:"text";s:85:"This may be a good place to introduce yourself and your site or include some credits.";s:6:"filter";b:1;s:6:"visual";b:1;}i:4;a:4:{s:5:"title";s:7:"Find Us";s:4:"text";s:168:"<strong>Address</strong>\n123 Main Street\nNew York, NY 10001\n\n<strong>Hours</strong>\nMonday&mdash;Friday: 9:00AM&ndash;5:00PM\nSaturday &amp; Sunday: 11:00AM&ndash;3:00PM";s:6:"filter";b:1;s:6:"visual";b:1;}i:5;a:4:{s:5:"title";s:15:"About This Site";s:4:"text";s:85:"This may be a good place to introduce yourself and your site or include some credits.";s:6:"filter";b:1;s:6:"visual";b:1;}s:12:"_multiwidget";i:1;}', 'yes'),
(80, 'widget_rss', 'a:2:{i:1;a:0:{}s:12:"_multiwidget";i:1;}', 'yes'),
(81, 'uninstall_plugins', 'a:1:{s:51:"bookly-responsive-appointment-booking-tool/main.php";a:2:{i:0;s:21:"BooklyLite\\Lib\\Plugin";i:1;s:9:"uninstall";}}', 'no'),
(82, 'timezone_string', '', 'yes'),
(84, 'page_on_front', '26', 'yes'),
(85, 'default_post_format', '0', 'yes'),
(86, 'link_manager_enabled', '0', 'yes'),
(87, 'finished_splitting_shared_terms', '1', 'yes'),
(88, 'site_icon', '0', 'yes'),
(89, 'medium_large_size_w', '768', 'yes'),
(90, 'medium_large_size_h', '0', 'yes'),
(91, 'initial_db_version', '38590', 'yes'),
(92, 'wp_user_roles', 'a:5:{s:13:"administrator";a:2:{s:4:"name";s:13:"Administrator";s:12:"capabilities";a:61:{s:13:"switch_themes";b:1;s:11:"edit_themes";b:1;s:16:"activate_plugins";b:1;s:12:"edit_plugins";b:1;s:10:"edit_users";b:1;s:10:"edit_files";b:1;s:14:"manage_options";b:1;s:17:"moderate_comments";b:1;s:17:"manage_categories";b:1;s:12:"manage_links";b:1;s:12:"upload_files";b:1;s:6:"import";b:1;s:15:"unfiltered_html";b:1;s:10:"edit_posts";b:1;s:17:"edit_others_posts";b:1;s:20:"edit_published_posts";b:1;s:13:"publish_posts";b:1;s:10:"edit_pages";b:1;s:4:"read";b:1;s:8:"level_10";b:1;s:7:"level_9";b:1;s:7:"level_8";b:1;s:7:"level_7";b:1;s:7:"level_6";b:1;s:7:"level_5";b:1;s:7:"level_4";b:1;s:7:"level_3";b:1;s:7:"level_2";b:1;s:7:"level_1";b:1;s:7:"level_0";b:1;s:17:"edit_others_pages";b:1;s:20:"edit_published_pages";b:1;s:13:"publish_pages";b:1;s:12:"delete_pages";b:1;s:19:"delete_others_pages";b:1;s:22:"delete_published_pages";b:1;s:12:"delete_posts";b:1;s:19:"delete_others_posts";b:1;s:22:"delete_published_posts";b:1;s:20:"delete_private_posts";b:1;s:18:"edit_private_posts";b:1;s:18:"read_private_posts";b:1;s:20:"delete_private_pages";b:1;s:18:"edit_private_pages";b:1;s:18:"read_private_pages";b:1;s:12:"delete_users";b:1;s:12:"create_users";b:1;s:17:"unfiltered_upload";b:1;s:14:"edit_dashboard";b:1;s:14:"update_plugins";b:1;s:14:"delete_plugins";b:1;s:15:"install_plugins";b:1;s:13:"update_themes";b:1;s:14:"install_themes";b:1;s:11:"update_core";b:1;s:10:"list_users";b:1;s:12:"remove_users";b:1;s:13:"promote_users";b:1;s:18:"edit_theme_options";b:1;s:13:"delete_themes";b:1;s:6:"export";b:1;}}s:6:"editor";a:2:{s:4:"name";s:6:"Editor";s:12:"capabilities";a:34:{s:17:"moderate_comments";b:1;s:17:"manage_categories";b:1;s:12:"manage_links";b:1;s:12:"upload_files";b:1;s:15:"unfiltered_html";b:1;s:10:"edit_posts";b:1;s:17:"edit_others_posts";b:1;s:20:"edit_published_posts";b:1;s:13:"publish_posts";b:1;s:10:"edit_pages";b:1;s:4:"read";b:1;s:7:"level_7";b:1;s:7:"level_6";b:1;s:7:"level_5";b:1;s:7:"level_4";b:1;s:7:"level_3";b:1;s:7:"level_2";b:1;s:7:"level_1";b:1;s:7:"level_0";b:1;s:17:"edit_others_pages";b:1;s:20:"edit_published_pages";b:1;s:13:"publish_pages";b:1;s:12:"delete_pages";b:1;s:19:"delete_others_pages";b:1;s:22:"delete_published_pages";b:1;s:12:"delete_posts";b:1;s:19:"delete_others_posts";b:1;s:22:"delete_published_posts";b:1;s:20:"delete_private_posts";b:1;s:18:"edit_private_posts";b:1;s:18:"read_private_posts";b:1;s:20:"delete_private_pages";b:1;s:18:"edit_private_pages";b:1;s:18:"read_private_pages";b:1;}}s:6:"author";a:2:{s:4:"name";s:6:"Author";s:12:"capabilities";a:10:{s:12:"upload_files";b:1;s:10:"edit_posts";b:1;s:20:"edit_published_posts";b:1;s:13:"publish_posts";b:1;s:4:"read";b:1;s:7:"level_2";b:1;s:7:"level_1";b:1;s:7:"level_0";b:1;s:12:"delete_posts";b:1;s:22:"delete_published_posts";b:1;}}s:11:"contributor";a:2:{s:4:"name";s:11:"Contributor";s:12:"capabilities";a:5:{s:10:"edit_posts";b:1;s:4:"read";b:1;s:7:"level_1";b:1;s:7:"level_0";b:1;s:12:"delete_posts";b:1;}}s:10:"subscriber";a:2:{s:4:"name";s:10:"Subscriber";s:12:"capabilities";a:2:{s:4:"read";b:1;s:7:"level_0";b:1;}}}', 'yes'),
(93, 'fresh_site', '0', 'yes'),
(94, 'widget_search', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(95, 'widget_recent-posts', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(96, 'widget_recent-comments', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(97, 'widget_archives', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(98, 'widget_meta', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(99, 'sidebars_widgets', 'a:4:{s:19:"wp_inactive_widgets";a:4:{i:0;s:6:"text-2";i:1;s:6:"text-3";i:2;s:6:"text-4";i:3;s:6:"text-5";}s:12:"sidebar-blog";a:0:{}s:13:"sidebar-pages";a:0:{}s:13:"array_version";i:3;}', 'yes'),
(100, 'widget_pages', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(101, 'widget_calendar', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(102, 'widget_media_audio', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(103, 'widget_media_image', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(104, 'widget_media_gallery', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(105, 'widget_media_video', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(106, 'widget_tag_cloud', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(107, 'widget_nav_menu', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(108, 'widget_custom_html', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(109, 'cron', 'a:5:{i:1525515202;a:3:{s:16:"wp_version_check";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:10:"twicedaily";s:4:"args";a:0:{}s:8:"interval";i:43200;}}s:17:"wp_update_plugins";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:10:"twicedaily";s:4:"args";a:0:{}s:8:"interval";i:43200;}}s:16:"wp_update_themes";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:10:"twicedaily";s:4:"args";a:0:{}s:8:"interval";i:43200;}}}i:1525533888;a:1:{s:20:"bookly_daily_routine";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:5:"daily";s:4:"args";a:0:{}s:8:"interval";i:86400;}}}i:1525558475;a:2:{s:19:"wp_scheduled_delete";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:5:"daily";s:4:"args";a:0:{}s:8:"interval";i:86400;}}s:25:"delete_expired_transients";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:5:"daily";s:4:"args";a:0:{}s:8:"interval";i:86400;}}}i:1525569048;a:1:{s:30:"wp_scheduled_auto_draft_delete";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:5:"daily";s:4:"args";a:0:{}s:8:"interval";i:86400;}}}s:7:"version";i:2;}', 'yes'),
(110, 'theme_mods_twentyseventeen', 'a:8:{s:18:"custom_css_post_id";i:-1;s:18:"nav_menu_locations";a:2:{s:3:"top";i:4;s:6:"social";i:3;}s:7:"panel_1";i:29;s:7:"panel_2";i:0;s:7:"panel_3";i:0;s:7:"panel_4";i:0;s:11:"page_layout";s:10:"one-column";s:16:"sidebars_widgets";a:2:{s:4:"time";i:1525014728;s:4:"data";a:4:{s:19:"wp_inactive_widgets";a:0:{}s:9:"sidebar-1";a:0:{}s:9:"sidebar-2";a:0:{}s:9:"sidebar-3";a:0:{}}}}', 'yes'),
(114, '_site_transient_update_core', 'O:8:"stdClass":4:{s:7:"updates";a:1:{i:0;O:8:"stdClass":10:{s:8:"response";s:6:"latest";s:8:"download";s:59:"https://downloads.wordpress.org/release/wordpress-4.9.5.zip";s:6:"locale";s:5:"en_US";s:8:"packages";O:8:"stdClass":5:{s:4:"full";s:59:"https://downloads.wordpress.org/release/wordpress-4.9.5.zip";s:10:"no_content";s:70:"https://downloads.wordpress.org/release/wordpress-4.9.5-no-content.zip";s:11:"new_bundled";s:71:"https://downloads.wordpress.org/release/wordpress-4.9.5-new-bundled.zip";s:7:"partial";b:0;s:8:"rollback";b:0;}s:7:"current";s:5:"4.9.5";s:7:"version";s:5:"4.9.5";s:11:"php_version";s:5:"5.2.4";s:13:"mysql_version";s:3:"5.0";s:11:"new_bundled";s:3:"4.7";s:15:"partial_version";s:0:"";}}s:12:"last_checked";i:1525474448;s:15:"version_checked";s:5:"4.9.5";s:12:"translations";a:0:{}}', 'no'),
(125, 'can_compress_scripts', '0', 'no'),
(153, 'nav_menu_options', 'a:1:{s:8:"auto_add";a:0:{}}', 'yes'),
(191, 'page_for_posts', '0', 'yes'),
(242, 'recently_activated', 'a:0:{}', 'yes'),
(246, '_site_transient_update_themes', 'O:8:"stdClass":4:{s:12:"last_checked";i:1525474449;s:7:"checked";a:4:{s:13:"twentyfifteen";s:3:"1.9";s:15:"twentyseventeen";s:3:"1.5";s:13:"twentysixteen";s:3:"1.4";s:11:"zeebizzcard";s:3:"1.4";}s:8:"response";a:0:{}s:12:"translations";a:0:{}}', 'no'),
(248, 'current_theme', 'zeeBizzCard', 'yes'),
(249, 'theme_mods_zeebizzcard', 'a:12:{i:0;b:0;s:18:"nav_menu_locations";a:1:{s:9:"main_navi";i:4;}s:18:"custom_css_post_id";i:-1;s:12:"header_image";s:72:"http://127.0.0.1/wp-content/uploads/2018/04/cropped-zensalon_profile.jpg";s:17:"header_image_data";O:8:"stdClass":5:{s:13:"attachment_id";i:121;s:3:"url";s:72:"http://127.0.0.1/wp-content/uploads/2018/04/cropped-zensalon_profile.jpg";s:13:"thumbnail_url";s:72:"http://127.0.0.1/wp-content/uploads/2018/04/cropped-zensalon_profile.jpg";s:6:"height";i:300;s:5:"width";i:280;}s:16:"background_image";s:84:"http://127.0.0.1/wp-content/uploads/2018/04/Screen-Shot-2018-04-25-at-01.02.21-1.jpg";s:17:"background_preset";s:4:"fill";s:21:"background_position_x";s:5:"right";s:21:"background_position_y";s:6:"bottom";s:15:"background_size";s:5:"cover";s:17:"background_repeat";s:9:"no-repeat";s:21:"background_attachment";s:5:"fixed";}', 'yes'),
(250, 'theme_switched', '', 'yes'),
(251, 'widget_themezee_ads', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(252, 'widget_theme_socialmedia', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(256, '_site_transient_update_plugins', 'O:8:"stdClass":5:{s:12:"last_checked";i:1525512786;s:7:"checked";a:6:{s:19:"akismet/akismet.php";s:5:"4.0.3";s:51:"bookly-responsive-appointment-booking-tool/main.php";s:6:"14.5.1";s:25:"genericond/genericons.php";s:5:"4.0.1";s:9:"hello.php";s:3:"1.7";s:45:"limit-login-attempts/limit-login-attempts.php";s:5:"1.7.1";s:29:"wp-easy-mode/wp-easy-mode.php";s:5:"2.3.5";}s:8:"response";a:0:{}s:12:"translations";a:0:{}s:9:"no_update";a:5:{s:19:"akismet/akismet.php";O:8:"stdClass":9:{s:2:"id";s:21:"w.org/plugins/akismet";s:4:"slug";s:7:"akismet";s:6:"plugin";s:19:"akismet/akismet.php";s:11:"new_version";s:5:"4.0.3";s:3:"url";s:38:"https://wordpress.org/plugins/akismet/";s:7:"package";s:56:"https://downloads.wordpress.org/plugin/akismet.4.0.3.zip";s:5:"icons";a:2:{s:2:"2x";s:59:"https://ps.w.org/akismet/assets/icon-256x256.png?rev=969272";s:2:"1x";s:59:"https://ps.w.org/akismet/assets/icon-128x128.png?rev=969272";}s:7:"banners";a:1:{s:2:"1x";s:61:"https://ps.w.org/akismet/assets/banner-772x250.jpg?rev=479904";}s:11:"banners_rtl";a:0:{}}s:51:"bookly-responsive-appointment-booking-tool/main.php";O:8:"stdClass":9:{s:2:"id";s:56:"w.org/plugins/bookly-responsive-appointment-booking-tool";s:4:"slug";s:42:"bookly-responsive-appointment-booking-tool";s:6:"plugin";s:51:"bookly-responsive-appointment-booking-tool/main.php";s:11:"new_version";s:6:"14.5.1";s:3:"url";s:73:"https://wordpress.org/plugins/bookly-responsive-appointment-booking-tool/";s:7:"package";s:92:"https://downloads.wordpress.org/plugin/bookly-responsive-appointment-booking-tool.14.5.1.zip";s:5:"icons";a:1:{s:2:"1x";s:95:"https://ps.w.org/bookly-responsive-appointment-booking-tool/assets/icon-128x128.png?rev=1005009";}s:7:"banners";a:2:{s:2:"2x";s:98:"https://ps.w.org/bookly-responsive-appointment-booking-tool/assets/banner-1544x500.png?rev=1726755";s:2:"1x";s:97:"https://ps.w.org/bookly-responsive-appointment-booking-tool/assets/banner-772x250.png?rev=1726755";}s:11:"banners_rtl";a:0:{}}s:25:"genericond/genericons.php";O:8:"stdClass":9:{s:2:"id";s:24:"w.org/plugins/genericond";s:4:"slug";s:10:"genericond";s:6:"plugin";s:25:"genericond/genericons.php";s:11:"new_version";s:5:"4.0.1";s:3:"url";s:41:"https://wordpress.org/plugins/genericond/";s:7:"package";s:59:"https://downloads.wordpress.org/plugin/genericond.4.0.1.zip";s:5:"icons";a:2:{s:2:"2x";s:63:"https://ps.w.org/genericond/assets/icon-256x256.png?rev=1036942";s:2:"1x";s:63:"https://ps.w.org/genericond/assets/icon-128x128.png?rev=1036942";}s:7:"banners";a:2:{s:2:"2x";s:65:"https://ps.w.org/genericond/assets/banner-1544x500.png?rev=676981";s:2:"1x";s:64:"https://ps.w.org/genericond/assets/banner-772x250.png?rev=676981";}s:11:"banners_rtl";a:0:{}}s:9:"hello.php";O:8:"stdClass":9:{s:2:"id";s:25:"w.org/plugins/hello-dolly";s:4:"slug";s:11:"hello-dolly";s:6:"plugin";s:9:"hello.php";s:11:"new_version";s:3:"1.6";s:3:"url";s:42:"https://wordpress.org/plugins/hello-dolly/";s:7:"package";s:58:"https://downloads.wordpress.org/plugin/hello-dolly.1.6.zip";s:5:"icons";a:2:{s:2:"2x";s:63:"https://ps.w.org/hello-dolly/assets/icon-256x256.jpg?rev=969907";s:2:"1x";s:63:"https://ps.w.org/hello-dolly/assets/icon-128x128.jpg?rev=969907";}s:7:"banners";a:1:{s:2:"1x";s:65:"https://ps.w.org/hello-dolly/assets/banner-772x250.png?rev=478342";}s:11:"banners_rtl";a:0:{}}s:45:"limit-login-attempts/limit-login-attempts.php";O:8:"stdClass":9:{s:2:"id";s:34:"w.org/plugins/limit-login-attempts";s:4:"slug";s:20:"limit-login-attempts";s:6:"plugin";s:45:"limit-login-attempts/limit-login-attempts.php";s:11:"new_version";s:5:"1.7.1";s:3:"url";s:51:"https://wordpress.org/plugins/limit-login-attempts/";s:7:"package";s:69:"https://downloads.wordpress.org/plugin/limit-login-attempts.1.7.1.zip";s:5:"icons";a:1:{s:7:"default";s:64:"https://s.w.org/plugins/geopattern-icon/limit-login-attempts.svg";}s:7:"banners";a:0:{}s:11:"banners_rtl";a:0:{}}}}', 'no'),
(257, 'bookly_data_loaded', '1', 'yes'),
(258, 'bookly_db_version', '14.5.1', 'yes'),
(259, 'bookly_installation_time', '1525015489', 'yes'),
(260, 'bookly_grace_start', '1530632545', 'yes'),
(261, 'bookly_envato_purchase_code', '', 'yes'),
(262, 'bookly_enabled', '1', 'yes'),
(263, 'bookly_admin_preferred_language', '', 'yes'),
(264, 'bookly_api_server_error_time', '0', 'yes'),
(265, 'bookly_app_color', '#f4662f', 'yes'),
(266, 'bookly_app_custom_styles', '', 'yes'),
(267, 'bookly_app_required_employee', '0', 'yes'),
(268, 'bookly_app_service_name_with_duration', '0', 'yes'),
(269, 'bookly_app_show_blocked_timeslots', '0', 'yes'),
(270, 'bookly_app_show_calendar', '0', 'yes'),
(271, 'bookly_app_show_day_one_column', '0', 'yes'),
(272, 'bookly_app_show_login_button', '0', 'yes'),
(273, 'bookly_app_show_notes', '1', 'yes'),
(274, 'bookly_app_show_progress_tracker', '1', 'yes'),
(275, 'bookly_app_staff_name_with_price', '1', 'yes'),
(276, 'bookly_l10n_button_apply', 'Apply', 'yes'),
(277, 'bookly_l10n_button_back', 'Back', 'yes'),
(278, 'bookly_l10n_button_book_more', 'Book More', 'yes'),
(279, 'bookly_l10n_info_cart_step', 'Below you can find a list of services selected for booking.\nClick BOOK MORE if you want to add more services.', 'yes'),
(280, 'bookly_l10n_info_complete_step', 'Thank you! Your booking is complete. An email with details of your booking has been sent to you.', 'yes'),
(281, 'bookly_l10n_info_complete_step_limit_error', 'You are trying to use the service too often. Please contact us to make a booking.', 'yes'),
(282, 'bookly_l10n_info_complete_step_processing', 'Your payment has been accepted for processing.', 'yes'),
(283, 'bookly_l10n_info_details_step', 'You selected a booking for {service_name} by {staff_name} at {service_time} on {service_date}. The price for the service is {service_price}.\nPlease provide your details in the form below to proceed with booking.', 'yes'),
(284, 'bookly_l10n_info_details_step_guest', '', 'yes'),
(285, 'bookly_l10n_info_payment_step_single_app', 'Please tell us how you would like to pay: ', 'yes'),
(286, 'bookly_l10n_info_payment_step_several_apps', 'Please tell us how you would like to pay: ', 'yes'),
(287, 'bookly_l10n_info_service_step', 'Please select service: ', 'yes'),
(288, 'bookly_l10n_info_time_step', 'Below you can find a list of available time slots for {service_name} by {staff_name}.\nClick on a time slot to proceed with booking.', 'yes'),
(289, 'bookly_l10n_label_category', 'Category', 'yes'),
(290, 'bookly_l10n_label_ccard_code', 'Card Security Code', 'yes'),
(291, 'bookly_l10n_label_ccard_expire', 'Expiration Date', 'yes'),
(292, 'bookly_l10n_label_ccard_number', 'Credit Card Number', 'yes'),
(293, 'bookly_l10n_label_email', 'Email', 'yes'),
(294, 'bookly_l10n_label_employee', 'Employee', 'yes'),
(295, 'bookly_l10n_label_finish_by', 'Finish by', 'yes'),
(296, 'bookly_l10n_label_name', 'Name', 'yes'),
(297, 'bookly_l10n_label_first_name', 'First name', 'yes'),
(298, 'bookly_l10n_label_last_name', 'Last name', 'yes'),
(299, 'bookly_l10n_label_notes', 'Notes', 'yes'),
(300, 'bookly_l10n_label_number_of_persons', 'Number of persons', 'yes'),
(301, 'bookly_l10n_label_pay_ccard', 'I will pay now with Credit Card', 'yes'),
(302, 'bookly_l10n_label_pay_locally', 'I will pay locally', 'yes'),
(303, 'bookly_l10n_label_pay_mollie', 'I will pay now with Mollie', 'yes'),
(304, 'bookly_l10n_label_pay_paypal', 'I will pay now with PayPal', 'yes'),
(305, 'bookly_l10n_label_phone', 'Phone', 'yes'),
(306, 'bookly_l10n_label_select_date', 'I''m available on or after', 'yes'),
(307, 'bookly_l10n_label_service', 'Service', 'yes'),
(308, 'bookly_l10n_label_start_from', 'Start from', 'yes'),
(309, 'bookly_l10n_option_category', 'Select category', 'yes'),
(310, 'bookly_l10n_option_employee', 'Any', 'yes'),
(311, 'bookly_l10n_option_service', 'Select service', 'yes'),
(312, 'bookly_l10n_required_email', 'Please tell us your email', 'yes'),
(313, 'bookly_l10n_required_employee', 'Please select an employee', 'yes'),
(314, 'bookly_l10n_required_name', 'Please tell us your name', 'yes'),
(315, 'bookly_l10n_required_first_name', 'Please tell us your first name', 'yes'),
(316, 'bookly_l10n_required_last_name', 'Please tell us your last name', 'yes'),
(317, 'bookly_l10n_required_phone', 'Please tell us your phone', 'yes'),
(318, 'bookly_l10n_required_service', 'Please select a service', 'yes'),
(319, 'bookly_l10n_step_service', 'Service', 'yes'),
(320, 'bookly_l10n_step_time', 'Time', 'yes'),
(321, 'bookly_l10n_step_time_slot_not_available', 'The selected time is not available anymore. Please, choose another time slot.', 'yes'),
(322, 'bookly_l10n_step_cart', 'Cart', 'yes'),
(323, 'bookly_l10n_step_cart_slot_not_available', 'The highlighted time is not available anymore. Please, choose another time slot.', 'yes'),
(324, 'bookly_l10n_step_details', 'Details', 'yes'),
(325, 'bookly_l10n_step_details_button_login', 'Login', 'yes'),
(326, 'bookly_l10n_step_payment', 'Payment', 'yes'),
(327, 'bookly_l10n_step_done', 'Done', 'yes'),
(328, 'bookly_l10n_step_service_button_next', 'Next', 'yes'),
(329, 'bookly_l10n_step_service_mobile_button_next', 'Next', 'yes'),
(330, 'bookly_l10n_step_cart_button_next', 'Next', 'yes'),
(331, 'bookly_l10n_step_details_button_next', 'Next', 'yes'),
(332, 'bookly_l10n_step_payment_button_next', 'Next', 'yes'),
(333, 'bookly_cart_enabled', '0', 'yes'),
(334, 'bookly_cart_show_columns', 'a:6:{s:7:"service";a:1:{s:4:"show";i:1;}s:4:"date";a:1:{s:4:"show";i:1;}s:4:"time";a:1:{s:4:"show";i:1;}s:8:"employee";a:1:{s:4:"show";i:1;}s:5:"price";a:1:{s:4:"show";i:1;}s:7:"deposit";a:1:{s:4:"show";i:1;}}', 'yes'),
(335, 'bookly_cal_one_participant', '{service_name}\n{client_name}\n{client_phone}\n{client_email}\n{total_price} {payment_type} {payment_status}\nStatus: {status}\nSigned up: {signed_up}\nCapacity: {service_capacity}', 'yes'),
(336, 'bookly_cal_many_participants', '{service_name}\nSigned up: {signed_up}\nCapacity: {service_capacity}', 'yes'),
(337, 'bookly_co_logo_attachment_id', '', 'yes'),
(338, 'bookly_co_name', '', 'yes'),
(339, 'bookly_co_address', '', 'yes'),
(340, 'bookly_co_phone', '', 'yes'),
(341, 'bookly_co_website', '', 'yes'),
(342, 'bookly_cst_cancel_action', 'cancel', 'yes'),
(343, 'bookly_cst_combined_notifications', '0', 'yes'),
(344, 'bookly_cst_create_account', '0', 'yes'),
(345, 'bookly_cst_default_country_code', '', 'yes'),
(346, 'bookly_cst_new_account_role', 'subscriber', 'yes'),
(347, 'bookly_cst_phone_default_country', 'auto', 'yes'),
(348, 'bookly_cst_remember_in_cookie', '0', 'yes'),
(349, 'bookly_cst_show_update_details_dialog', '1', 'yes'),
(350, 'bookly_cst_first_last_name', '0', 'yes'),
(351, 'bookly_cst_required_phone', '1', 'yes'),
(352, 'bookly_email_sender', 'zensalong@gmail.com', 'yes'),
(353, 'bookly_email_sender_name', 'Zen Salon', 'yes'),
(354, 'bookly_email_send_as', 'html', 'yes'),
(355, 'bookly_email_reply_to_customers', '1', 'yes'),
(356, 'bookly_gc_client_id', '', 'yes'),
(357, 'bookly_gc_client_secret', '', 'yes'),
(358, 'bookly_gc_event_title', '{service_name}', 'yes'),
(359, 'bookly_gc_limit_events', '50', 'yes'),
(360, 'bookly_gc_two_way_sync', '1', 'yes'),
(361, 'bookly_gen_lite_uninstall_remove_bookly_data', '0', 'yes'),
(362, 'bookly_gen_time_slot_length', '15', 'yes'),
(363, 'bookly_gen_service_duration_as_slot_length', '0', 'yes'),
(364, 'bookly_gen_default_appointment_status', 'approved', 'yes'),
(365, 'bookly_gen_min_time_prior_booking', '0', 'yes'),
(366, 'bookly_gen_min_time_prior_cancel', '0', 'yes'),
(367, 'bookly_gen_max_days_for_booking', '365', 'yes'),
(368, 'bookly_gen_use_client_time_zone', '0', 'yes'),
(369, 'bookly_gen_allow_staff_edit_profile', '1', 'yes'),
(370, 'bookly_gen_link_assets_method', 'enqueue', 'yes'),
(371, 'bookly_gen_collect_stats', '0', 'yes'),
(372, 'bookly_url_approve_page_url', 'http://127.0.0.1', 'yes'),
(373, 'bookly_url_approve_denied_page_url', 'http://127.0.0.1', 'yes'),
(374, 'bookly_url_cancel_page_url', 'http://127.0.0.1', 'yes'),
(375, 'bookly_url_cancel_denied_page_url', 'http://127.0.0.1', 'yes'),
(376, 'bookly_url_cancel_confirm_page_url', 'http://127.0.0.1', 'yes'),
(377, 'bookly_url_reject_page_url', 'http://127.0.0.1', 'yes'),
(378, 'bookly_url_reject_denied_page_url', 'http://127.0.0.1', 'yes'),
(379, 'bookly_url_final_step_url', '', 'yes'),
(380, 'bookly_cron_reminder_times', 'a:7:{s:16:"client_follow_up";i:21;s:15:"client_reminder";i:18;s:24:"client_birthday_greeting";i:9;s:12:"staff_agenda";i:18;s:19:"client_reminder_1st";i:1;s:19:"client_reminder_2nd";i:2;s:19:"client_reminder_3rd";i:3;}', 'yes'),
(381, 'bookly_reminder_data', 'a:3:{i:0;s:168:"SW1wb3J0YW50ISBJdCBsb29rcyBsaWtlIHlvdSBhcmUgdXNpbmcgYW4gaWxsZWdhbCBjb3B5IG9mIEJvb2tseSDigJMgaXQgbWF5IGNvbnRhaW4gYSBtYWxpY2lvdXMgY29kZSwgYSB0cm9qYW4gb3IgYSBiYWNrZG9vci4=";i:1;s:280:"VGhlIGxlZ2FsIGNvcHkgb2YgQm9va2x5IGluY2x1ZGVzIGFsbCBmZWF0dXJlcywgbGlmZXRpbWUgZnJlZSB1cGRhdGVzLCBhbmQgMjQvNyBzdXBwb3J0LiBCeSBidXlpbmcgYSBsZWdhbCBjb3B5IG9mIEJvb2tseSBhdCBhIHNwZWNpYWwgZGlzY291bnRlZCBwcmljZSwgeW91IG1heSBiZW5lZml0IGZyb20gb3VyIHBhcnRuZXLigJlzIGV4Y2x1c2l2ZSBkaXNjb3VudHMh";i:2;s:142:"PGEgaHJlZj0iaHR0cHM6Ly93d3cuYm9va2luZy13cC1wbHVnaW4uY29tL2JlY29tZS1sZWdhbC8iIHRhcmdldD0iX2JsYW5rIj5DbGljayBoZXJlIHRvIGxlYXJuIG1vcmUgPj4+PC9hPg";}', 'yes'),
(382, 'bookly_lic_repeat_time', '1533224545', 'yes'),
(383, 'bookly_grace_notifications', 'a:3:{s:6:"bookly";s:1:"0";s:7:"add-ons";i:0;s:4:"sent";s:1:"0";}', 'yes'),
(384, 'bookly_grace_hide_admin_notice_time', '0', 'yes'),
(385, 'bookly_sms_token', '', 'yes'),
(386, 'bookly_sms_administrator_phone', '', 'yes'),
(387, 'bookly_sms_notify_low_balance', '1', 'yes'),
(388, 'bookly_sms_notify_weekly_summary', '1', 'yes'),
(389, 'bookly_sms_notify_weekly_summary_sent', '17', 'yes'),
(390, 'bookly_wc_enabled', '0', 'yes'),
(391, 'bookly_wc_product', '', 'yes'),
(392, 'bookly_l10n_wc_cart_info_name', 'Appointment', 'yes'),
(393, 'bookly_l10n_wc_cart_info_value', 'Date: {appointment_date}\nTime: {appointment_time}\nService: {service_name}', 'yes'),
(394, 'bookly_bh_monday_start', '08:00', 'yes'),
(395, 'bookly_bh_monday_end', '18:00', 'yes'),
(396, 'bookly_bh_tuesday_start', '08:00', 'yes'),
(397, 'bookly_bh_tuesday_end', '18:00', 'yes'),
(398, 'bookly_bh_wednesday_start', '08:00', 'yes'),
(399, 'bookly_bh_wednesday_end', '18:00', 'yes'),
(400, 'bookly_bh_thursday_end', '18:00', 'yes'),
(401, 'bookly_bh_thursday_start', '08:00', 'yes'),
(402, 'bookly_bh_friday_start', '08:00', 'yes'),
(403, 'bookly_bh_friday_end', '18:00', 'yes'),
(404, 'bookly_bh_saturday_start', '', 'yes'),
(405, 'bookly_bh_saturday_end', '', 'yes'),
(406, 'bookly_bh_sunday_start', '', 'yes'),
(407, 'bookly_bh_sunday_end', '', 'yes'),
(408, 'bookly_pmt_currency', 'SEK', 'yes'),
(409, 'bookly_pmt_price_format', '{symbol}{price|2}', 'yes'),
(410, 'bookly_pmt_local', '1', 'yes'),
(411, 'bookly_paypal_enabled', '0', 'yes'),
(412, 'bookly_paypal_sandbox', '0', 'yes'),
(413, 'bookly_paypal_api_password', '', 'yes'),
(414, 'bookly_paypal_api_signature', '', 'yes'),
(415, 'bookly_paypal_api_username', '', 'yes'),
(416, 'bookly_paypal_id', '', 'yes'),
(417, 'bookly_ntf_processing_interval', '2', 'yes'),
(437, '_site_transient_timeout_browser_959e2b5b923f70cca34ca0f786ddfb9b', '1525993624', 'no'),
(438, '_site_transient_browser_959e2b5b923f70cca34ca0f786ddfb9b', 'a:10:{s:4:"name";s:6:"Safari";s:7:"version";s:6:"11.0.1";s:8:"platform";s:9:"Macintosh";s:10:"update_url";s:29:"https://www.apple.com/safari/";s:7:"img_src";s:43:"http://s.w.org/images/browsers/safari.png?1";s:11:"img_src_ssl";s:44:"https://s.w.org/images/browsers/safari.png?1";s:15:"current_version";s:2:"11";s:7:"upgrade";b:0;s:8:"insecure";b:0;s:6:"mobile";b:0;}', 'no'),
(452, '_transient_update_plugins', 'O:8:"stdClass":1:{s:12:"last_checked";i:0;}', 'yes'),
(453, '_transient_update_themes', 'O:8:"stdClass":1:{s:12:"last_checked";i:0;}', 'yes'),
(463, '_site_transient_timeout_theme_roots', '1525514587', 'no'),
(464, '_site_transient_theme_roots', 'a:4:{s:13:"twentyfifteen";s:7:"/themes";s:15:"twentyseventeen";s:7:"/themes";s:13:"twentysixteen";s:7:"/themes";s:11:"zeebizzcard";s:7:"/themes";}', 'no');

-- --------------------------------------------------------

--
-- Table structure for table `wp_postmeta`
--

CREATE TABLE IF NOT EXISTS `wp_postmeta` (
  `meta_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `post_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_520_ci,
  PRIMARY KEY (`meta_id`),
  KEY `post_id` (`post_id`),
  KEY `meta_key` (`meta_key`(191))
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci AUTO_INCREMENT=358 ;

--
-- Dumping data for table `wp_postmeta`
--

INSERT INTO `wp_postmeta` (`meta_id`, `post_id`, `meta_key`, `meta_value`) VALUES
(55, 22, '_wp_attached_file', '2018/04/espresso-3.jpg'),
(56, 22, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:2000;s:6:"height";i:1200;s:4:"file";s:22:"2018/04/espresso-3.jpg";s:5:"sizes";a:5:{s:9:"thumbnail";a:4:{s:4:"file";s:22:"espresso-3-150x150.jpg";s:5:"width";i:150;s:6:"height";i:150;s:9:"mime-type";s:10:"image/jpeg";}s:6:"medium";a:4:{s:4:"file";s:22:"espresso-3-300x180.jpg";s:5:"width";i:300;s:6:"height";i:180;s:9:"mime-type";s:10:"image/jpeg";}s:12:"medium_large";a:4:{s:4:"file";s:22:"espresso-3-768x461.jpg";s:5:"width";i:768;s:6:"height";i:461;s:9:"mime-type";s:10:"image/jpeg";}s:5:"large";a:4:{s:4:"file";s:23:"espresso-3-1024x614.jpg";s:5:"width";i:1024;s:6:"height";i:614;s:9:"mime-type";s:10:"image/jpeg";}s:32:"twentyseventeen-thumbnail-avatar";a:4:{s:4:"file";s:22:"espresso-3-100x100.jpg";s:5:"width";i:100;s:6:"height";i:100;s:9:"mime-type";s:10:"image/jpeg";}}s:10:"image_meta";a:12:{s:8:"aperture";s:1:"0";s:6:"credit";s:0:"";s:6:"camera";s:0:"";s:7:"caption";s:0:"";s:17:"created_timestamp";s:1:"0";s:9:"copyright";s:0:"";s:12:"focal_length";s:1:"0";s:3:"iso";s:1:"0";s:13:"shutter_speed";s:1:"0";s:5:"title";s:0:"";s:11:"orientation";s:1:"0";s:8:"keywords";a:0:{}}}'),
(57, 22, '_starter_content_theme', 'twentyseventeen'),
(59, 23, '_wp_attached_file', '2018/04/sandwich-3.jpg'),
(60, 23, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:2000;s:6:"height";i:1200;s:4:"file";s:22:"2018/04/sandwich-3.jpg";s:5:"sizes";a:5:{s:9:"thumbnail";a:4:{s:4:"file";s:22:"sandwich-3-150x150.jpg";s:5:"width";i:150;s:6:"height";i:150;s:9:"mime-type";s:10:"image/jpeg";}s:6:"medium";a:4:{s:4:"file";s:22:"sandwich-3-300x180.jpg";s:5:"width";i:300;s:6:"height";i:180;s:9:"mime-type";s:10:"image/jpeg";}s:12:"medium_large";a:4:{s:4:"file";s:22:"sandwich-3-768x461.jpg";s:5:"width";i:768;s:6:"height";i:461;s:9:"mime-type";s:10:"image/jpeg";}s:5:"large";a:4:{s:4:"file";s:23:"sandwich-3-1024x614.jpg";s:5:"width";i:1024;s:6:"height";i:614;s:9:"mime-type";s:10:"image/jpeg";}s:32:"twentyseventeen-thumbnail-avatar";a:4:{s:4:"file";s:22:"sandwich-3-100x100.jpg";s:5:"width";i:100;s:6:"height";i:100;s:9:"mime-type";s:10:"image/jpeg";}}s:10:"image_meta";a:12:{s:8:"aperture";s:1:"0";s:6:"credit";s:0:"";s:6:"camera";s:0:"";s:7:"caption";s:0:"";s:17:"created_timestamp";s:1:"0";s:9:"copyright";s:0:"";s:12:"focal_length";s:1:"0";s:3:"iso";s:1:"0";s:13:"shutter_speed";s:1:"0";s:5:"title";s:0:"";s:11:"orientation";s:1:"0";s:8:"keywords";a:0:{}}}'),
(61, 23, '_starter_content_theme', 'twentyseventeen'),
(63, 24, '_wp_attached_file', '2018/04/coffee-3.jpg'),
(64, 24, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:2000;s:6:"height";i:1200;s:4:"file";s:20:"2018/04/coffee-3.jpg";s:5:"sizes";a:5:{s:9:"thumbnail";a:4:{s:4:"file";s:20:"coffee-3-150x150.jpg";s:5:"width";i:150;s:6:"height";i:150;s:9:"mime-type";s:10:"image/jpeg";}s:6:"medium";a:4:{s:4:"file";s:20:"coffee-3-300x180.jpg";s:5:"width";i:300;s:6:"height";i:180;s:9:"mime-type";s:10:"image/jpeg";}s:12:"medium_large";a:4:{s:4:"file";s:20:"coffee-3-768x461.jpg";s:5:"width";i:768;s:6:"height";i:461;s:9:"mime-type";s:10:"image/jpeg";}s:5:"large";a:4:{s:4:"file";s:21:"coffee-3-1024x614.jpg";s:5:"width";i:1024;s:6:"height";i:614;s:9:"mime-type";s:10:"image/jpeg";}s:32:"twentyseventeen-thumbnail-avatar";a:4:{s:4:"file";s:20:"coffee-3-100x100.jpg";s:5:"width";i:100;s:6:"height";i:100;s:9:"mime-type";s:10:"image/jpeg";}}s:10:"image_meta";a:12:{s:8:"aperture";s:1:"0";s:6:"credit";s:0:"";s:6:"camera";s:0:"";s:7:"caption";s:0:"";s:17:"created_timestamp";s:1:"0";s:9:"copyright";s:0:"";s:12:"focal_length";s:1:"0";s:3:"iso";s:1:"0";s:13:"shutter_speed";s:1:"0";s:5:"title";s:0:"";s:11:"orientation";s:1:"0";s:8:"keywords";a:0:{}}}'),
(65, 24, '_starter_content_theme', 'twentyseventeen'),
(71, 26, '_customize_changeset_uuid', 'e09ab8bf-7972-4e41-8703-e60ed4ef6c43'),
(80, 29, '_customize_changeset_uuid', 'e09ab8bf-7972-4e41-8703-e60ed4ef6c43'),
(121, 41, '_menu_item_type', 'custom'),
(122, 41, '_menu_item_menu_item_parent', '0'),
(123, 41, '_menu_item_object_id', '41'),
(124, 41, '_menu_item_object', 'custom'),
(125, 41, '_menu_item_target', ''),
(126, 41, '_menu_item_classes', 'a:1:{i:0;s:0:"";}'),
(127, 41, '_menu_item_xfn', ''),
(128, 41, '_menu_item_url', 'https://www.facebook.com/wordpress'),
(137, 43, '_menu_item_type', 'custom'),
(138, 43, '_menu_item_menu_item_parent', '0'),
(139, 43, '_menu_item_object_id', '43'),
(140, 43, '_menu_item_object', 'custom'),
(141, 43, '_menu_item_target', ''),
(142, 43, '_menu_item_classes', 'a:1:{i:0;s:0:"";}'),
(143, 43, '_menu_item_xfn', ''),
(144, 43, '_menu_item_url', 'https://www.instagram.com/explore/tags/wordcamp/'),
(145, 44, '_menu_item_type', 'custom'),
(146, 44, '_menu_item_menu_item_parent', '0'),
(147, 44, '_menu_item_object_id', '44'),
(148, 44, '_menu_item_object', 'custom'),
(149, 44, '_menu_item_target', ''),
(150, 44, '_menu_item_classes', 'a:1:{i:0;s:0:"";}'),
(151, 44, '_menu_item_xfn', ''),
(152, 44, '_menu_item_url', 'mailto:wordpress@example.com'),
(153, 30, '_wp_trash_meta_status', 'publish'),
(154, 30, '_wp_trash_meta_time', '1524786860'),
(157, 45, '_wp_attached_file', '2018/04/Screen-Shot-2018-04-25-at-01.02.21-1.jpg'),
(158, 45, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:2880;s:6:"height";i:1800;s:4:"file";s:48:"2018/04/Screen-Shot-2018-04-25-at-01.02.21-1.jpg";s:5:"sizes";a:6:{s:9:"thumbnail";a:4:{s:4:"file";s:48:"Screen-Shot-2018-04-25-at-01.02.21-1-150x150.jpg";s:5:"width";i:150;s:6:"height";i:150;s:9:"mime-type";s:10:"image/jpeg";}s:6:"medium";a:4:{s:4:"file";s:48:"Screen-Shot-2018-04-25-at-01.02.21-1-300x188.jpg";s:5:"width";i:300;s:6:"height";i:188;s:9:"mime-type";s:10:"image/jpeg";}s:12:"medium_large";a:4:{s:4:"file";s:48:"Screen-Shot-2018-04-25-at-01.02.21-1-768x480.jpg";s:5:"width";i:768;s:6:"height";i:480;s:9:"mime-type";s:10:"image/jpeg";}s:5:"large";a:4:{s:4:"file";s:49:"Screen-Shot-2018-04-25-at-01.02.21-1-1024x640.jpg";s:5:"width";i:1024;s:6:"height";i:640;s:9:"mime-type";s:10:"image/jpeg";}s:30:"twentyseventeen-featured-image";a:4:{s:4:"file";s:50:"Screen-Shot-2018-04-25-at-01.02.21-1-2000x1200.jpg";s:5:"width";i:2000;s:6:"height";i:1200;s:9:"mime-type";s:10:"image/jpeg";}s:32:"twentyseventeen-thumbnail-avatar";a:4:{s:4:"file";s:48:"Screen-Shot-2018-04-25-at-01.02.21-1-100x100.jpg";s:5:"width";i:100;s:6:"height";i:100;s:9:"mime-type";s:10:"image/jpeg";}}s:10:"image_meta";a:12:{s:8:"aperture";s:1:"0";s:6:"credit";s:0:"";s:6:"camera";s:0:"";s:7:"caption";s:0:"";s:17:"created_timestamp";s:1:"0";s:9:"copyright";s:0:"";s:12:"focal_length";s:1:"0";s:3:"iso";s:1:"0";s:13:"shutter_speed";s:1:"0";s:5:"title";s:0:"";s:11:"orientation";s:1:"1";s:8:"keywords";a:0:{}}}'),
(160, 47, '_wp_attached_file', '2018/04/cropped-Screen-Shot-2018-04-25-at-01.02.21-1.jpg'),
(161, 47, '_wp_attachment_context', 'custom-header'),
(162, 47, '_wp_attachment_metadata', 'a:6:{s:5:"width";i:2000;s:6:"height";i:1200;s:4:"file";s:56:"2018/04/cropped-Screen-Shot-2018-04-25-at-01.02.21-1.jpg";s:5:"sizes";a:5:{s:9:"thumbnail";a:4:{s:4:"file";s:56:"cropped-Screen-Shot-2018-04-25-at-01.02.21-1-150x150.jpg";s:5:"width";i:150;s:6:"height";i:150;s:9:"mime-type";s:10:"image/jpeg";}s:6:"medium";a:4:{s:4:"file";s:56:"cropped-Screen-Shot-2018-04-25-at-01.02.21-1-300x180.jpg";s:5:"width";i:300;s:6:"height";i:180;s:9:"mime-type";s:10:"image/jpeg";}s:12:"medium_large";a:4:{s:4:"file";s:56:"cropped-Screen-Shot-2018-04-25-at-01.02.21-1-768x461.jpg";s:5:"width";i:768;s:6:"height";i:461;s:9:"mime-type";s:10:"image/jpeg";}s:5:"large";a:4:{s:4:"file";s:57:"cropped-Screen-Shot-2018-04-25-at-01.02.21-1-1024x614.jpg";s:5:"width";i:1024;s:6:"height";i:614;s:9:"mime-type";s:10:"image/jpeg";}s:32:"twentyseventeen-thumbnail-avatar";a:4:{s:4:"file";s:56:"cropped-Screen-Shot-2018-04-25-at-01.02.21-1-100x100.jpg";s:5:"width";i:100;s:6:"height";i:100;s:9:"mime-type";s:10:"image/jpeg";}}s:10:"image_meta";a:12:{s:8:"aperture";s:1:"0";s:6:"credit";s:0:"";s:6:"camera";s:0:"";s:7:"caption";s:0:"";s:17:"created_timestamp";s:1:"0";s:9:"copyright";s:0:"";s:12:"focal_length";s:1:"0";s:3:"iso";s:1:"0";s:13:"shutter_speed";s:1:"0";s:5:"title";s:0:"";s:11:"orientation";s:1:"0";s:8:"keywords";a:0:{}}s:17:"attachment_parent";i:45;}'),
(163, 47, '_wp_attachment_custom_header_last_used_twentyseventeen', '1524787036'),
(164, 47, '_wp_attachment_is_custom_header', 'twentyseventeen'),
(166, 48, '_wp_trash_meta_status', 'publish'),
(167, 48, '_wp_trash_meta_time', '1524787494'),
(168, 49, '_wp_trash_meta_status', 'publish'),
(169, 49, '_wp_trash_meta_time', '1524787632'),
(170, 50, '_edit_lock', '1524787697:1'),
(171, 50, '_wp_trash_meta_status', 'publish'),
(172, 50, '_wp_trash_meta_time', '1524787717'),
(173, 26, '_edit_lock', '1525389062:1'),
(174, 26, '_edit_last', '1'),
(175, 51, '_wp_trash_meta_status', 'publish'),
(176, 51, '_wp_trash_meta_time', '1524787841'),
(177, 52, '_edit_lock', '1524787895:1'),
(178, 52, '_wp_trash_meta_status', 'publish'),
(179, 52, '_wp_trash_meta_time', '1524787939'),
(180, 53, '_wp_trash_meta_status', 'publish'),
(181, 53, '_wp_trash_meta_time', '1524787993'),
(195, 55, '_wp_trash_meta_status', 'publish'),
(196, 55, '_wp_trash_meta_time', '1524788176'),
(199, 1, '_edit_lock', '1524791913:1'),
(200, 29, '_edit_lock', '1525389090:1'),
(201, 29, '_edit_last', '1'),
(210, 58, '_wp_trash_meta_status', 'publish'),
(211, 58, '_wp_trash_meta_time', '1524788453'),
(215, 76, '_wp_trash_meta_status', 'publish'),
(216, 76, '_wp_trash_meta_time', '1524789574'),
(217, 77, '_edit_lock', '1524789637:1'),
(218, 77, '_wp_trash_meta_status', 'publish'),
(219, 77, '_wp_trash_meta_time', '1524789645'),
(220, 78, '_wp_trash_meta_status', 'publish'),
(221, 78, '_wp_trash_meta_time', '1524789667'),
(222, 79, '_wp_trash_meta_status', 'publish'),
(223, 79, '_wp_trash_meta_time', '1524790170'),
(224, 80, '_edit_lock', '1524790219:1'),
(225, 80, '_wp_trash_meta_status', 'publish'),
(226, 80, '_wp_trash_meta_time', '1524790236'),
(227, 1, '_edit_last', '1'),
(230, 82, '_wp_trash_meta_status', 'publish'),
(231, 82, '_wp_trash_meta_time', '1524791349'),
(232, 83, '_wp_trash_meta_status', 'publish'),
(233, 83, '_wp_trash_meta_time', '1524791380'),
(236, 86, '_wp_trash_meta_status', 'publish'),
(237, 86, '_wp_trash_meta_time', '1524791493'),
(238, 87, '_wp_trash_meta_status', 'publish'),
(239, 87, '_wp_trash_meta_time', '1524791694'),
(240, 88, '_wp_trash_meta_status', 'publish'),
(241, 88, '_wp_trash_meta_time', '1524791746'),
(242, 89, '_wp_trash_meta_status', 'publish'),
(243, 89, '_wp_trash_meta_time', '1524791828'),
(249, 91, '_wp_trash_meta_status', 'publish'),
(250, 91, '_wp_trash_meta_time', '1524792107'),
(267, 95, '_menu_item_type', 'post_type'),
(268, 95, '_menu_item_menu_item_parent', '0'),
(269, 95, '_menu_item_object_id', '29'),
(270, 95, '_menu_item_object', 'page'),
(271, 95, '_menu_item_target', ''),
(272, 95, '_menu_item_classes', 'a:1:{i:0;s:0:"";}'),
(273, 95, '_menu_item_xfn', ''),
(274, 95, '_menu_item_url', ''),
(275, 92, '_wp_trash_meta_status', 'publish'),
(276, 92, '_wp_trash_meta_time', '1524792211'),
(277, 96, '_edit_lock', '1524792232:1'),
(278, 96, '_wp_trash_meta_status', 'publish'),
(279, 96, '_wp_trash_meta_time', '1524792240'),
(280, 97, '_wp_trash_meta_status', 'publish'),
(281, 97, '_wp_trash_meta_time', '1524792272'),
(282, 98, '_wp_trash_meta_status', 'publish'),
(283, 98, '_wp_trash_meta_time', '1524792305'),
(284, 99, '_wp_trash_meta_status', 'publish'),
(285, 99, '_wp_trash_meta_time', '1524792379'),
(294, 100, '_wp_trash_meta_status', 'publish'),
(295, 100, '_wp_trash_meta_time', '1524792426'),
(296, 103, '_menu_item_type', 'custom'),
(297, 103, '_menu_item_menu_item_parent', '0'),
(298, 103, '_menu_item_object_id', '103'),
(299, 103, '_menu_item_object', 'custom'),
(300, 103, '_menu_item_target', ''),
(301, 103, '_menu_item_classes', 'a:1:{i:0;s:0:"";}'),
(302, 103, '_menu_item_xfn', ''),
(303, 103, '_menu_item_url', 'http://zensalon.se/services'),
(304, 102, '_wp_trash_meta_status', 'publish'),
(305, 102, '_wp_trash_meta_time', '1524792488'),
(306, 104, '_edit_lock', '1524792550:1'),
(307, 104, '_wp_trash_meta_status', 'publish'),
(308, 104, '_wp_trash_meta_time', '1524792557'),
(309, 105, '_wp_trash_meta_status', 'publish'),
(310, 105, '_wp_trash_meta_time', '1524792567'),
(311, 106, '_edit_last', '1'),
(312, 106, '_edit_lock', '1525389241:1'),
(313, 108, '_wp_trash_meta_status', 'publish'),
(314, 108, '_wp_trash_meta_time', '1524792752'),
(315, 110, '_wp_trash_meta_status', 'publish'),
(316, 110, '_wp_trash_meta_time', '1524793192'),
(317, 111, '_wp_trash_meta_status', 'publish'),
(318, 111, '_wp_trash_meta_time', '1524793234'),
(319, 112, '_wp_trash_meta_status', 'publish'),
(320, 112, '_wp_trash_meta_time', '1524793252'),
(321, 113, '_wp_trash_meta_status', 'publish'),
(322, 113, '_wp_trash_meta_time', '1524793306'),
(325, 120, '_wp_attached_file', '2018/04/zensalon_profile.jpg'),
(326, 120, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:719;s:6:"height";i:759;s:4:"file";s:28:"2018/04/zensalon_profile.jpg";s:5:"sizes";a:2:{s:9:"thumbnail";a:4:{s:4:"file";s:28:"zensalon_profile-150x150.jpg";s:5:"width";i:150;s:6:"height";i:150;s:9:"mime-type";s:10:"image/jpeg";}s:6:"medium";a:4:{s:4:"file";s:28:"zensalon_profile-284x300.jpg";s:5:"width";i:284;s:6:"height";i:300;s:9:"mime-type";s:10:"image/jpeg";}}s:10:"image_meta";a:12:{s:8:"aperture";s:1:"0";s:6:"credit";s:0:"";s:6:"camera";s:0:"";s:7:"caption";s:0:"";s:17:"created_timestamp";s:1:"0";s:9:"copyright";s:0:"";s:12:"focal_length";s:1:"0";s:3:"iso";s:1:"0";s:13:"shutter_speed";s:1:"0";s:5:"title";s:0:"";s:11:"orientation";s:1:"0";s:8:"keywords";a:0:{}}}'),
(327, 121, '_wp_attached_file', '2018/04/cropped-zensalon_profile.jpg'),
(328, 121, '_wp_attachment_context', 'custom-header'),
(329, 121, '_wp_attachment_metadata', 'a:6:{s:5:"width";i:280;s:6:"height";i:300;s:4:"file";s:36:"2018/04/cropped-zensalon_profile.jpg";s:5:"sizes";a:2:{s:9:"thumbnail";a:4:{s:4:"file";s:36:"cropped-zensalon_profile-150x150.jpg";s:5:"width";i:150;s:6:"height";i:150;s:9:"mime-type";s:10:"image/jpeg";}s:6:"medium";a:4:{s:4:"file";s:36:"cropped-zensalon_profile-280x300.jpg";s:5:"width";i:280;s:6:"height";i:300;s:9:"mime-type";s:10:"image/jpeg";}}s:10:"image_meta";a:12:{s:8:"aperture";s:1:"0";s:6:"credit";s:0:"";s:6:"camera";s:0:"";s:7:"caption";s:0:"";s:17:"created_timestamp";s:1:"0";s:9:"copyright";s:0:"";s:12:"focal_length";s:1:"0";s:3:"iso";s:1:"0";s:13:"shutter_speed";s:1:"0";s:5:"title";s:0:"";s:11:"orientation";s:1:"0";s:8:"keywords";a:0:{}}s:17:"attachment_parent";i:120;}'),
(330, 121, '_wp_attachment_custom_header_last_used_zeebizzcard', '1525015067'),
(331, 121, '_wp_attachment_is_custom_header', 'zeebizzcard'),
(332, 122, '_wp_trash_meta_status', 'publish'),
(333, 122, '_wp_trash_meta_time', '1525015067'),
(334, 29, '_wp_page_template', 'default'),
(335, 129, '_edit_lock', '1525017145:1'),
(336, 129, '_wp_trash_meta_status', 'publish'),
(337, 129, '_wp_trash_meta_time', '1525017183'),
(338, 26, '_wp_page_template', 'default'),
(339, 106, '_wp_page_template', 'default'),
(340, 142, '_menu_item_type', 'custom'),
(341, 142, '_menu_item_menu_item_parent', '0'),
(342, 142, '_menu_item_object_id', '142'),
(343, 142, '_menu_item_object', 'custom'),
(344, 142, '_menu_item_target', ''),
(345, 142, '_menu_item_classes', 'a:1:{i:0;s:0:"";}'),
(346, 142, '_menu_item_xfn', ''),
(347, 142, '_menu_item_url', 'http://zensalon.se'),
(348, 141, '_wp_trash_meta_status', 'publish'),
(349, 141, '_wp_trash_meta_time', '1525021467'),
(351, 45, '_wp_attachment_is_custom_background', 'zeebizzcard'),
(352, 153, '_edit_lock', '1525022662:1'),
(353, 153, '_wp_trash_meta_status', 'publish'),
(354, 153, '_wp_trash_meta_time', '1525022665'),
(355, 26, '_thumbnail_id', '120'),
(356, 29, '_thumbnail_id', '120'),
(357, 106, '_thumbnail_id', '120');

-- --------------------------------------------------------

--
-- Table structure for table `wp_posts`
--

CREATE TABLE IF NOT EXISTS `wp_posts` (
  `ID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `post_author` bigint(20) unsigned NOT NULL DEFAULT '0',
  `post_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_date_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_content` longtext COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `post_title` text COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `post_excerpt` text COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `post_status` varchar(20) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'publish',
  `comment_status` varchar(20) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'open',
  `ping_status` varchar(20) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'open',
  `post_password` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `post_name` varchar(200) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `to_ping` text COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `pinged` text COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `post_modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_modified_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_content_filtered` longtext COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `post_parent` bigint(20) unsigned NOT NULL DEFAULT '0',
  `guid` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `menu_order` int(11) NOT NULL DEFAULT '0',
  `post_type` varchar(20) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'post',
  `post_mime_type` varchar(100) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `comment_count` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `post_name` (`post_name`(191)),
  KEY `type_status_date` (`post_type`,`post_status`,`post_date`,`ID`),
  KEY `post_parent` (`post_parent`),
  KEY `post_author` (`post_author`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci AUTO_INCREMENT=155 ;

--
-- Dumping data for table `wp_posts`
--

INSERT INTO `wp_posts` (`ID`, `post_author`, `post_date`, `post_date_gmt`, `post_content`, `post_title`, `post_excerpt`, `post_status`, `comment_status`, `ping_status`, `post_password`, `post_name`, `to_ping`, `pinged`, `post_modified`, `post_modified_gmt`, `post_content_filtered`, `post_parent`, `guid`, `menu_order`, `post_type`, `post_mime_type`, `comment_count`) VALUES
(1, 1, '2018-04-24 22:13:22', '2018-04-24 22:13:22', 'xxxxxxxxxxxxxxxxxxxxxx', 'Hello world!', '', 'publish', 'open', 'open', '', 'hello-world', '', '', '2018-04-27 01:20:47', '2018-04-27 01:20:47', '', 0, 'http://127.0.0.1/?p=1', 0, 'post', '', 1),
(22, 1, '2018-04-26 23:54:20', '2018-04-26 23:54:20', '', 'Espresso', '', 'inherit', 'open', 'closed', '', 'espresso', '', '', '2018-04-26 23:54:20', '2018-04-26 23:54:20', '', 0, 'http://127.0.0.1/wp-content/uploads/2018/04/espresso-3.jpg', 0, 'attachment', 'image/jpeg', 0),
(23, 1, '2018-04-26 23:54:20', '2018-04-26 23:54:20', '', 'Sandwich', '', 'inherit', 'open', 'closed', '', 'sandwich', '', '', '2018-04-26 23:54:20', '2018-04-26 23:54:20', '', 0, 'http://127.0.0.1/wp-content/uploads/2018/04/sandwich-3.jpg', 0, 'attachment', 'image/jpeg', 0),
(24, 1, '2018-04-26 23:54:20', '2018-04-26 23:54:20', '', 'Coffee', '', 'inherit', 'open', 'closed', '', 'coffee', '', '', '2018-04-26 23:54:20', '2018-04-26 23:54:20', '', 0, 'http://127.0.0.1/wp-content/uploads/2018/04/coffee-3.jpg', 0, 'attachment', 'image/jpeg', 0),
(26, 1, '2018-04-26 23:54:20', '2018-04-26 23:54:20', '<span style="color: #0000ff;"><strong>Öppettider</strong></span>\r\nMån-Fre : 10.00-19.00\r\nLör: 10.00 - 16.00\r\nSöndag : endasttidsbokning\r\n<h3 style="text-align: center;"><span style="color: #ff0000;">ERBJUDANDE</span>\r\n<span style="color: #ff0000;">20% rabatt för ögonfransförlängning, lashlift</span></h3>\r\n<p style="text-align: center;"><a href="www.facebook.com">[genericon icon=facebook size=4x color=blue]</a><a href="www.facebook.com">[genericon icon=instagram size=4x color=pink]</a></p>', '', '', 'publish', 'closed', 'closed', '', 'about', '', '', '2018-05-03 23:11:01', '2018-05-03 23:11:01', '', 0, 'http://127.0.0.1/?page_id=26', 0, 'page', '', 0),
(29, 1, '2018-04-26 23:54:20', '2018-04-26 23:54:20', '[bookly-form service_id="1" staff_member_id="1" hide="categories,staff_members,date,week_days,time_range"]', 'Boka tid', '', 'publish', 'closed', 'closed', '', 'booking', '', '', '2018-05-03 23:11:29', '2018-05-03 23:11:29', '', 0, 'http://127.0.0.1/?page_id=29', 0, 'page', '', 0),
(30, 1, '2018-04-26 23:54:20', '2018-04-26 23:54:20', '{\n    "widget_text[6]": {\n        "starter_content": true,\n        "value": {\n            "encoded_serialized_instance": "YTo0OntzOjU6InRpdGxlIjtzOjc6IkZpbmQgVXMiO3M6NDoidGV4dCI7czoxNjg6IjxzdHJvbmc+QWRkcmVzczwvc3Ryb25nPgoxMjMgTWFpbiBTdHJlZXQKTmV3IFlvcmssIE5ZIDEwMDAxCgo8c3Ryb25nPkhvdXJzPC9zdHJvbmc+Ck1vbmRheSZtZGFzaDtGcmlkYXk6IDk6MDBBTSZuZGFzaDs1OjAwUE0KU2F0dXJkYXkgJmFtcDsgU3VuZGF5OiAxMTowMEFNJm5kYXNoOzM6MDBQTSI7czo2OiJmaWx0ZXIiO2I6MTtzOjY6InZpc3VhbCI7YjoxO30=",\n            "title": "Find Us",\n            "is_widget_customizer_js_value": true,\n            "instance_hash_key": "6b39a8d2b448a6e91a2232a0975972f0"\n        },\n        "type": "option",\n        "user_id": 1,\n        "date_modified_gmt": "2018-04-26 23:50:20"\n    },\n    "widget_search[3]": {\n        "starter_content": true,\n        "value": {\n            "encoded_serialized_instance": "YToxOntzOjU6InRpdGxlIjtzOjY6IlNlYXJjaCI7fQ==",\n            "title": "Search",\n            "is_widget_customizer_js_value": true,\n            "instance_hash_key": "2f966ad418f673b53368f9248bd16028"\n        },\n        "type": "option",\n        "user_id": 1,\n        "date_modified_gmt": "2018-04-26 23:50:20"\n    },\n    "widget_text[7]": {\n        "starter_content": true,\n        "value": {\n            "encoded_serialized_instance": "YTo0OntzOjU6InRpdGxlIjtzOjE1OiJBYm91dCBUaGlzIFNpdGUiO3M6NDoidGV4dCI7czo4NToiVGhpcyBtYXkgYmUgYSBnb29kIHBsYWNlIHRvIGludHJvZHVjZSB5b3Vyc2VsZiBhbmQgeW91ciBzaXRlIG9yIGluY2x1ZGUgc29tZSBjcmVkaXRzLiI7czo2OiJmaWx0ZXIiO2I6MTtzOjY6InZpc3VhbCI7YjoxO30=",\n            "title": "About This Site",\n            "is_widget_customizer_js_value": true,\n            "instance_hash_key": "f51d1c6fb6491599ba5cc35259287a1e"\n        },\n        "type": "option",\n        "user_id": 1,\n        "date_modified_gmt": "2018-04-26 23:50:20"\n    },\n    "sidebars_widgets[sidebar-1]": {\n        "starter_content": true,\n        "value": [\n            "text-6",\n            "search-3",\n            "text-7"\n        ],\n        "type": "option",\n        "user_id": 1,\n        "date_modified_gmt": "2018-04-26 23:50:20"\n    },\n    "widget_text[8]": {\n        "starter_content": true,\n        "value": {\n            "encoded_serialized_instance": "YTo0OntzOjU6InRpdGxlIjtzOjc6IkZpbmQgVXMiO3M6NDoidGV4dCI7czoxNjg6IjxzdHJvbmc+QWRkcmVzczwvc3Ryb25nPgoxMjMgTWFpbiBTdHJlZXQKTmV3IFlvcmssIE5ZIDEwMDAxCgo8c3Ryb25nPkhvdXJzPC9zdHJvbmc+Ck1vbmRheSZtZGFzaDtGcmlkYXk6IDk6MDBBTSZuZGFzaDs1OjAwUE0KU2F0dXJkYXkgJmFtcDsgU3VuZGF5OiAxMTowMEFNJm5kYXNoOzM6MDBQTSI7czo2OiJmaWx0ZXIiO2I6MTtzOjY6InZpc3VhbCI7YjoxO30=",\n            "title": "Find Us",\n            "is_widget_customizer_js_value": true,\n            "instance_hash_key": "6b39a8d2b448a6e91a2232a0975972f0"\n        },\n        "type": "option",\n        "user_id": 1,\n        "date_modified_gmt": "2018-04-26 23:50:20"\n    },\n    "sidebars_widgets[sidebar-2]": {\n        "starter_content": true,\n        "value": [\n            "text-8"\n        ],\n        "type": "option",\n        "user_id": 1,\n        "date_modified_gmt": "2018-04-26 23:50:20"\n    },\n    "widget_text[9]": {\n        "starter_content": true,\n        "value": {\n            "encoded_serialized_instance": "YTo0OntzOjU6InRpdGxlIjtzOjE1OiJBYm91dCBUaGlzIFNpdGUiO3M6NDoidGV4dCI7czo4NToiVGhpcyBtYXkgYmUgYSBnb29kIHBsYWNlIHRvIGludHJvZHVjZSB5b3Vyc2VsZiBhbmQgeW91ciBzaXRlIG9yIGluY2x1ZGUgc29tZSBjcmVkaXRzLiI7czo2OiJmaWx0ZXIiO2I6MTtzOjY6InZpc3VhbCI7YjoxO30=",\n            "title": "About This Site",\n            "is_widget_customizer_js_value": true,\n            "instance_hash_key": "f51d1c6fb6491599ba5cc35259287a1e"\n        },\n        "type": "option",\n        "user_id": 1,\n        "date_modified_gmt": "2018-04-26 23:50:20"\n    },\n    "widget_search[4]": {\n        "starter_content": true,\n        "value": {\n            "encoded_serialized_instance": "YToxOntzOjU6InRpdGxlIjtzOjY6IlNlYXJjaCI7fQ==",\n            "title": "Search",\n            "is_widget_customizer_js_value": true,\n            "instance_hash_key": "2f966ad418f673b53368f9248bd16028"\n        },\n        "type": "option",\n        "user_id": 1,\n        "date_modified_gmt": "2018-04-26 23:50:20"\n    },\n    "sidebars_widgets[sidebar-3]": {\n        "starter_content": true,\n        "value": [\n            "text-9",\n            "search-4"\n        ],\n        "type": "option",\n        "user_id": 1,\n        "date_modified_gmt": "2018-04-26 23:50:20"\n    },\n    "nav_menus_created_posts": {\n        "starter_content": true,\n        "value": [\n            22,\n            23,\n            24,\n            25,\n            26,\n            27,\n            28,\n            29\n        ],\n        "type": "option",\n        "user_id": 1,\n        "date_modified_gmt": "2018-04-26 23:50:20"\n    },\n    "nav_menu[-1]": {\n        "value": {\n            "name": "Top Menu",\n            "description": "",\n            "parent": 0,\n            "auto_add": false\n        },\n        "type": "nav_menu",\n        "user_id": 1,\n        "date_modified_gmt": "2018-04-26 23:54:20"\n    },\n    "nav_menu_item[-1]": {\n        "value": {\n            "object_id": 0,\n            "object": "",\n            "menu_item_parent": 0,\n            "position": 0,\n            "type": "custom",\n            "title": "Home",\n            "url": "http://127.0.0.1/",\n            "target": "",\n            "attr_title": "",\n            "description": "",\n            "classes": "",\n            "xfn": "",\n            "status": "publish",\n            "original_title": "",\n            "nav_menu_term_id": -1,\n            "_invalid": false,\n            "type_label": "Custom Link"\n        },\n        "type": "nav_menu_item",\n        "user_id": 1,\n        "date_modified_gmt": "2018-04-26 23:54:20"\n    },\n    "nav_menu_item[-2]": {\n        "value": {\n            "object_id": 26,\n            "object": "page",\n            "menu_item_parent": 0,\n            "position": 1,\n            "type": "post_type",\n            "title": "About",\n            "url": "",\n            "target": "",\n            "attr_title": "",\n            "description": "",\n            "classes": "",\n            "xfn": "",\n            "status": "publish",\n            "original_title": "About",\n            "nav_menu_term_id": -1,\n            "_invalid": false,\n            "type_label": "Page"\n        },\n        "type": "nav_menu_item",\n        "user_id": 1,\n        "date_modified_gmt": "2018-04-26 23:54:20"\n    },\n    "nav_menu_item[-3]": {\n        "value": {\n            "object_id": 28,\n            "object": "page",\n            "menu_item_parent": 0,\n            "position": 2,\n            "type": "post_type",\n            "title": "Blog",\n            "url": "",\n            "target": "",\n            "attr_title": "",\n            "description": "",\n            "classes": "",\n            "xfn": "",\n            "status": "publish",\n            "original_title": "Blog",\n            "nav_menu_term_id": -1,\n            "_invalid": false,\n            "type_label": "Page"\n        },\n        "type": "nav_menu_item",\n        "user_id": 1,\n        "date_modified_gmt": "2018-04-26 23:54:20"\n    },\n    "nav_menu_item[-4]": {\n        "value": {\n            "object_id": 27,\n            "object": "page",\n            "menu_item_parent": 0,\n            "position": 3,\n            "type": "post_type",\n            "title": "Contact",\n            "url": "",\n            "target": "",\n            "attr_title": "",\n            "description": "",\n            "classes": "",\n            "xfn": "",\n            "status": "publish",\n            "original_title": "Contact",\n            "nav_menu_term_id": -1,\n            "_invalid": false,\n            "type_label": "Page"\n        },\n        "type": "nav_menu_item",\n        "user_id": 1,\n        "date_modified_gmt": "2018-04-26 23:54:20"\n    },\n    "twentyseventeen::nav_menu_locations[top]": {\n        "starter_content": true,\n        "value": -1,\n        "type": "theme_mod",\n        "user_id": 1,\n        "date_modified_gmt": "2018-04-26 23:50:20"\n    },\n    "nav_menu[-5]": {\n        "value": {\n            "name": "Social Links Menu",\n            "description": "",\n            "parent": 0,\n            "auto_add": false\n        },\n        "type": "nav_menu",\n        "user_id": 1,\n        "date_modified_gmt": "2018-04-26 23:54:20"\n    },\n    "nav_menu_item[-5]": {\n        "value": {\n            "object_id": 0,\n            "object": "",\n            "menu_item_parent": 0,\n            "position": 0,\n            "type": "custom",\n            "title": "Yelp",\n            "url": "https://www.yelp.com",\n            "target": "",\n            "attr_title": "",\n            "description": "",\n            "classes": "",\n            "xfn": "",\n            "status": "publish",\n            "original_title": "",\n            "nav_menu_term_id": -5,\n            "_invalid": false,\n            "type_label": "Custom Link"\n        },\n        "type": "nav_menu_item",\n        "user_id": 1,\n        "date_modified_gmt": "2018-04-26 23:54:20"\n    },\n    "nav_menu_item[-6]": {\n        "value": {\n            "object_id": 0,\n            "object": "",\n            "menu_item_parent": 0,\n            "position": 1,\n            "type": "custom",\n            "title": "Facebook",\n            "url": "https://www.facebook.com/wordpress",\n            "target": "",\n            "attr_title": "",\n            "description": "",\n            "classes": "",\n            "xfn": "",\n            "status": "publish",\n            "original_title": "",\n            "nav_menu_term_id": -5,\n            "_invalid": false,\n            "type_label": "Custom Link"\n        },\n        "type": "nav_menu_item",\n        "user_id": 1,\n        "date_modified_gmt": "2018-04-26 23:54:20"\n    },\n    "nav_menu_item[-7]": {\n        "value": {\n            "object_id": 0,\n            "object": "",\n            "menu_item_parent": 0,\n            "position": 2,\n            "type": "custom",\n            "title": "Twitter",\n            "url": "https://twitter.com/wordpress",\n            "target": "",\n            "attr_title": "",\n            "description": "",\n            "classes": "",\n            "xfn": "",\n            "status": "publish",\n            "original_title": "",\n            "nav_menu_term_id": -5,\n            "_invalid": false,\n            "type_label": "Custom Link"\n        },\n        "type": "nav_menu_item",\n        "user_id": 1,\n        "date_modified_gmt": "2018-04-26 23:54:20"\n    },\n    "nav_menu_item[-8]": {\n        "value": {\n            "object_id": 0,\n            "object": "",\n            "menu_item_parent": 0,\n            "position": 3,\n            "type": "custom",\n            "title": "Instagram",\n            "url": "https://www.instagram.com/explore/tags/wordcamp/",\n            "target": "",\n            "attr_title": "",\n            "description": "",\n            "classes": "",\n            "xfn": "",\n            "status": "publish",\n            "original_title": "",\n            "nav_menu_term_id": -5,\n            "_invalid": false,\n            "type_label": "Custom Link"\n        },\n        "type": "nav_menu_item",\n        "user_id": 1,\n        "date_modified_gmt": "2018-04-26 23:54:20"\n    },\n    "nav_menu_item[-9]": {\n        "value": {\n            "object_id": 0,\n            "object": "",\n            "menu_item_parent": 0,\n            "position": 4,\n            "type": "custom",\n            "title": "Email",\n            "url": "mailto:wordpress@example.com",\n            "target": "",\n            "attr_title": "",\n            "description": "",\n            "classes": "",\n            "xfn": "",\n            "status": "publish",\n            "original_title": "",\n            "nav_menu_term_id": -5,\n            "_invalid": false,\n            "type_label": "Custom Link"\n        },\n        "type": "nav_menu_item",\n        "user_id": 1,\n        "date_modified_gmt": "2018-04-26 23:54:20"\n    },\n    "twentyseventeen::nav_menu_locations[social]": {\n        "starter_content": true,\n        "value": -5,\n        "type": "theme_mod",\n        "user_id": 1,\n        "date_modified_gmt": "2018-04-26 23:50:20"\n    },\n    "show_on_front": {\n        "starter_content": true,\n        "value": "page",\n        "type": "option",\n        "user_id": 1,\n        "date_modified_gmt": "2018-04-26 23:50:20"\n    },\n    "page_on_front": {\n        "starter_content": true,\n        "value": 25,\n        "type": "option",\n        "user_id": 1,\n        "date_modified_gmt": "2018-04-26 23:50:20"\n    },\n    "page_for_posts": {\n        "starter_content": true,\n        "value": 28,\n        "type": "option",\n        "user_id": 1,\n        "date_modified_gmt": "2018-04-26 23:50:20"\n    },\n    "twentyseventeen::panel_1": {\n        "starter_content": true,\n        "value": 29,\n        "type": "theme_mod",\n        "user_id": 1,\n        "date_modified_gmt": "2018-04-26 23:50:20"\n    },\n    "twentyseventeen::panel_2": {\n        "starter_content": true,\n        "value": 26,\n        "type": "theme_mod",\n        "user_id": 1,\n        "date_modified_gmt": "2018-04-26 23:50:20"\n    },\n    "twentyseventeen::panel_3": {\n        "starter_content": true,\n        "value": 28,\n        "type": "theme_mod",\n        "user_id": 1,\n        "date_modified_gmt": "2018-04-26 23:50:20"\n    },\n    "twentyseventeen::panel_4": {\n        "starter_content": true,\n        "value": 27,\n        "type": "theme_mod",\n        "user_id": 1,\n        "date_modified_gmt": "2018-04-26 23:50:20"\n    }\n}', '', '', 'trash', 'closed', 'closed', '', 'e09ab8bf-7972-4e41-8703-e60ed4ef6c43', '', '', '2018-04-26 23:54:20', '2018-04-26 23:54:20', '', 0, 'http://127.0.0.1/?p=30', 0, 'customize_changeset', '', 0),
(32, 1, '2018-04-26 23:54:20', '2018-04-26 23:54:20', 'You might be an artist who would like to introduce yourself and your work here or maybe you&rsquo;re a business with a mission to describe.', 'About', '', 'inherit', 'closed', 'closed', '', '26-revision-v1', '', '', '2018-04-26 23:54:20', '2018-04-26 23:54:20', '', 26, 'http://127.0.0.1/2018/04/26/26-revision-v1/', 0, 'revision', '', 0),
(35, 1, '2018-04-26 23:54:20', '2018-04-26 23:54:20', 'This is an example of a homepage section. Homepage sections can be any page other than the homepage itself, including the page that shows your latest blog posts.', 'A homepage section', '', 'inherit', 'closed', 'closed', '', '29-revision-v1', '', '', '2018-04-26 23:54:20', '2018-04-26 23:54:20', '', 29, 'http://127.0.0.1/2018/04/26/29-revision-v1/', 0, 'revision', '', 0),
(41, 1, '2018-04-26 23:54:20', '2018-04-26 23:54:20', '', 'Facebook', '', 'publish', 'closed', 'closed', '', 'facebook', '', '', '2018-04-26 23:54:20', '2018-04-26 23:54:20', '', 0, 'http://127.0.0.1/2018/04/26/facebook/', 1, 'nav_menu_item', '', 0),
(43, 1, '2018-04-26 23:54:20', '2018-04-26 23:54:20', '', 'Instagram', '', 'publish', 'closed', 'closed', '', 'instagram', '', '', '2018-04-26 23:54:20', '2018-04-26 23:54:20', '', 0, 'http://127.0.0.1/2018/04/26/instagram/', 3, 'nav_menu_item', '', 0),
(44, 1, '2018-04-26 23:54:20', '2018-04-26 23:54:20', '', 'Email', '', 'publish', 'closed', 'closed', '', 'email', '', '', '2018-04-26 23:54:20', '2018-04-26 23:54:20', '', 0, 'http://127.0.0.1/2018/04/26/email/', 4, 'nav_menu_item', '', 0),
(45, 1, '2018-04-26 23:57:03', '2018-04-26 23:57:03', '', 'Screen Shot 2018-04-25 at 01.02.21', '', 'inherit', 'open', 'closed', '', 'screen-shot-2018-04-25-at-01-02-21', '', '', '2018-04-26 23:57:03', '2018-04-26 23:57:03', '', 0, 'http://127.0.0.1/wp-content/uploads/2018/04/Screen-Shot-2018-04-25-at-01.02.21-1.jpg', 0, 'attachment', 'image/jpeg', 0),
(47, 1, '2018-04-26 23:57:16', '2018-04-26 23:57:16', '', 'cropped-Screen-Shot-2018-04-25-at-01.02.21-1.jpg', '', 'inherit', 'open', 'closed', '', 'cropped-screen-shot-2018-04-25-at-01-02-21-1-jpg', '', '', '2018-04-26 23:57:16', '2018-04-26 23:57:16', '', 0, 'http://127.0.0.1/wp-content/uploads/2018/04/cropped-Screen-Shot-2018-04-25-at-01.02.21-1.jpg', 0, 'attachment', 'image/jpeg', 0),
(48, 1, '2018-04-27 00:04:53', '2018-04-27 00:04:53', '{\n    "nav_menu[3]": {\n        "value": {\n            "name": "Social Links Menu",\n            "description": "",\n            "parent": 0,\n            "auto_add": false\n        },\n        "type": "nav_menu",\n        "user_id": 1,\n        "date_modified_gmt": "2018-04-27 00:04:53"\n    },\n    "nav_menu_item[40]": {\n        "value": false,\n        "type": "nav_menu_item",\n        "user_id": 1,\n        "date_modified_gmt": "2018-04-27 00:04:53"\n    },\n    "nav_menu_item[42]": {\n        "value": false,\n        "type": "nav_menu_item",\n        "user_id": 1,\n        "date_modified_gmt": "2018-04-27 00:04:53"\n    }\n}', '', '', 'trash', 'closed', 'closed', '', 'f63506ac-a28c-4ebc-bafd-2d88e3d5b5fb', '', '', '2018-04-27 00:04:53', '2018-04-27 00:04:53', '', 0, 'http://127.0.0.1/2018/04/27/f63506ac-a28c-4ebc-bafd-2d88e3d5b5fb/', 0, 'customize_changeset', '', 0),
(49, 1, '2018-04-27 00:07:12', '2018-04-27 00:07:12', '{\n    "nav_menu_item[39]": {\n        "value": false,\n        "type": "nav_menu_item",\n        "user_id": 1,\n        "date_modified_gmt": "2018-04-27 00:07:12"\n    }\n}', '', '', 'trash', 'closed', 'closed', '', '66c655f1-3bde-4fef-ae2d-3a185f02e65f', '', '', '2018-04-27 00:07:12', '2018-04-27 00:07:12', '', 0, 'http://127.0.0.1/2018/04/27/66c655f1-3bde-4fef-ae2d-3a185f02e65f/', 0, 'customize_changeset', '', 0),
(50, 1, '2018-04-27 00:08:37', '2018-04-27 00:08:37', '{\n    "twentyseventeen::nav_menu_locations[top]": {\n        "value": 2,\n        "type": "theme_mod",\n        "user_id": 1,\n        "date_modified_gmt": "2018-04-27 00:08:17"\n    },\n    "twentyseventeen::page_layout": {\n        "value": "one-column",\n        "type": "theme_mod",\n        "user_id": 1,\n        "date_modified_gmt": "2018-04-27 00:08:37"\n    }\n}', '', '', 'trash', 'closed', 'closed', '', 'bba2fe2c-b6e2-4a09-8864-5a8eb2006f42', '', '', '2018-04-27 00:08:37', '2018-04-27 00:08:37', '', 0, 'http://127.0.0.1/?p=50', 0, 'customize_changeset', '', 0),
(51, 1, '2018-04-27 00:10:41', '2018-04-27 00:10:41', '{\n    "nav_menu_item[36]": {\n        "value": false,\n        "type": "nav_menu_item",\n        "user_id": 1,\n        "date_modified_gmt": "2018-04-27 00:10:41"\n    }\n}', '', '', 'trash', 'closed', 'closed', '', '011fbf0b-eb39-446f-950e-1b053005183c', '', '', '2018-04-27 00:10:41', '2018-04-27 00:10:41', '', 0, 'http://127.0.0.1/2018/04/27/011fbf0b-eb39-446f-950e-1b053005183c/', 0, 'customize_changeset', '', 0),
(52, 1, '2018-04-27 00:12:19', '2018-04-27 00:12:19', '{\n    "show_on_front": {\n        "value": "posts",\n        "type": "option",\n        "user_id": 1,\n        "date_modified_gmt": "2018-04-27 00:11:35"\n    }\n}', '', '', 'trash', 'closed', 'closed', '', 'ffe3d99e-a2f2-4709-81ef-14d06d643420', '', '', '2018-04-27 00:12:19', '2018-04-27 00:12:19', '', 0, 'http://127.0.0.1/?p=52', 0, 'customize_changeset', '', 0),
(53, 1, '2018-04-27 00:13:13', '2018-04-27 00:13:13', '{\n    "show_on_front": {\n        "value": "page",\n        "type": "option",\n        "user_id": 1,\n        "date_modified_gmt": "2018-04-27 00:13:13"\n    },\n    "page_on_front": {\n        "value": "26",\n        "type": "option",\n        "user_id": 1,\n        "date_modified_gmt": "2018-04-27 00:13:13"\n    }\n}', '', '', 'trash', 'closed', 'closed', '', 'b42c2f17-afad-49ca-92f2-cd74cfa59110', '', '', '2018-04-27 00:13:13', '2018-04-27 00:13:13', '', 0, 'http://127.0.0.1/2018/04/27/b42c2f17-afad-49ca-92f2-cd74cfa59110/', 0, 'customize_changeset', '', 0),
(55, 1, '2018-04-27 00:16:16', '2018-04-27 00:16:16', '{\n    "show_on_front": {\n        "value": "posts",\n        "type": "option",\n        "user_id": 1,\n        "date_modified_gmt": "2018-04-27 00:16:16"\n    }\n}', '', '', 'trash', 'closed', 'closed', '', 'fabee647-f55c-4bb6-a532-5e4fe997c313', '', '', '2018-04-27 00:16:16', '2018-04-27 00:16:16', '', 0, 'http://127.0.0.1/2018/04/27/fabee647-f55c-4bb6-a532-5e4fe997c313/', 0, 'customize_changeset', '', 0),
(56, 1, '2018-04-27 00:17:34', '2018-04-27 00:17:34', 'You might be an artist who would like to introduce yourself and your work here or maybe you&rsquo;re a business with a mission to describe.', 'Services - Prices', '', 'inherit', 'closed', 'closed', '', '26-revision-v1', '', '', '2018-04-27 00:17:34', '2018-04-27 00:17:34', '', 26, 'http://127.0.0.1/2018/04/27/26-revision-v1/', 0, 'revision', '', 0),
(58, 1, '2018-04-27 00:20:53', '2018-04-27 00:20:53', '{\n    "nav_menu_item[38]": {\n        "value": false,\n        "type": "nav_menu_item",\n        "user_id": 1,\n        "date_modified_gmt": "2018-04-27 00:20:53"\n    },\n    "nav_menu_item[-5782908890729627000]": {\n        "value": {\n            "object_id": 29,\n            "object": "page",\n            "menu_item_parent": 0,\n            "position": 2,\n            "type": "post_type",\n            "title": "A homepage section",\n            "url": "http://127.0.0.1/a-homepage-section/",\n            "target": "",\n            "attr_title": "",\n            "description": "",\n            "classes": "",\n            "xfn": "",\n            "status": "publish",\n            "original_title": "A homepage section",\n            "nav_menu_term_id": 2,\n            "_invalid": false,\n            "type_label": "Page"\n        },\n        "type": "nav_menu_item",\n        "user_id": 1,\n        "date_modified_gmt": "2018-04-27 00:20:53"\n    }\n}', '', '', 'trash', 'closed', 'closed', '', 'ba508b43-82cc-4f56-8551-54be2900ae30', '', '', '2018-04-27 00:20:53', '2018-04-27 00:20:53', '', 0, 'http://127.0.0.1/2018/04/27/ba508b43-82cc-4f56-8551-54be2900ae30/', 0, 'customize_changeset', '', 0),
(60, 1, '2018-04-27 00:21:30', '2018-04-27 00:21:30', 'This is an example of a homepage section. Homepage sections can be any page other than the homepage itself, including the page that shows your latest blog posts.', 'Boka-tid', '', 'inherit', 'closed', 'closed', '', '29-revision-v1', '', '', '2018-04-27 00:21:30', '2018-04-27 00:21:30', '', 29, 'http://127.0.0.1/2018/04/27/29-revision-v1/', 0, 'revision', '', 0),
(61, 1, '2018-04-27 00:22:52', '2018-04-27 00:22:52', '<div style="width: 30%; padding: 0 10px 0 0; float: left;">Your content for your column #1\r\nYour content for your column #1\r\nYour content for your column #1</div>\r\n<div style="width: 30%; padding: 0 10px 0 0; float: left;">Your content for your column #2\r\nYour content for your column #2\r\nYour content for your column #2</div>\r\n<div style="width: 30%; padding: 0 10px 0 0; float: right;">Your content for your column #3\r\nYour content for your column #3\r\nYour content for your column #3</div>\r\n<div style="”clear: both;"></div>', 'Services - Prices', '', 'inherit', 'closed', 'closed', '', '26-revision-v1', '', '', '2018-04-27 00:22:52', '2018-04-27 00:22:52', '', 26, 'http://127.0.0.1/2018/04/27/26-revision-v1/', 0, 'revision', '', 0),
(62, 1, '2018-04-27 00:23:56', '2018-04-27 00:23:56', '<div style="width:40%;padding:0 10px 0 0;float:left;">\r\nYour content for your column #1\r\nYour content for your column #1\r\nYour content for your column #1</div>\r\n \r\n<div style="width:40%;padding:0 10px 0 0;float:right;">\r\nYour content for your column #2\r\nYour content for your column #2\r\nYour content for your column #2\r\n</div>\r\n \r\n<div style="clear:both;"></div>', 'Services - Prices', '', 'inherit', 'closed', 'closed', '', '26-revision-v1', '', '', '2018-04-27 00:23:56', '2018-04-27 00:23:56', '', 26, 'http://127.0.0.1/2018/04/27/26-revision-v1/', 0, 'revision', '', 0),
(63, 1, '2018-04-27 00:24:28', '2018-04-27 00:24:28', '<div style="width:40%;padding:0 10px 0 0;float:left;">\r\n<h6>Fransar</h6>\r\nYour content for your column #1\r\nYour content for your column #1\r\nYour content for your column #1</div>\r\n \r\n<div style="width:40%;padding:0 10px 0 0;float:right;">\r\nYour content for your column #2\r\nYour content for your column #2\r\nYour content for your column #2\r\n</div>\r\n \r\n<div style="clear:both;"></div>', 'Services - Prices', '', 'inherit', 'closed', 'closed', '', '26-revision-v1', '', '', '2018-04-27 00:24:28', '2018-04-27 00:24:28', '', 26, 'http://127.0.0.1/2018/04/27/26-revision-v1/', 0, 'revision', '', 0),
(64, 1, '2018-04-27 00:25:07', '2018-04-27 00:25:07', '<div style="width:40%;padding:0 10px 0 0;float:left;">\r\n<h6>Fransar</h6>\r\nYour content for your column #1\r\nYour content for your column #1\r\nYour content for your column #1\r\n\r\n<h6>Färgning</h6>\r\nYour content for your column #1\r\nYour content for your column #1\r\nYour content for your column #1\r\n</div>\r\n \r\n<div style="width:40%;padding:0 10px 0 0;float:right;">\r\nYour content for your column #2\r\nYour content for your column #2\r\nYour content for your column #2\r\n</div>\r\n \r\n<div style="clear:both;"></div>', 'Services - Prices', '', 'inherit', 'closed', 'closed', '', '26-revision-v1', '', '', '2018-04-27 00:25:07', '2018-04-27 00:25:07', '', 26, 'http://127.0.0.1/2018/04/27/26-revision-v1/', 0, 'revision', '', 0),
(65, 1, '2018-04-27 00:25:33', '2018-04-27 00:25:33', '<div style="width:40%;padding:0 10px 0 0;float:left;">\r\n<h6>Fransar</h6>\r\nYour content for your column #1\r\nYour content for your column #1\r\nYour content for your column #1\r\n\r\n<h6>Färgning</h6>\r\nYour content for your column #1\r\nYour content for your column #1\r\nYour content for your column #1\r\n</div>\r\n \r\n<div style="width:40%;padding:0 10px 0 0;float:right;">\r\n<h6>Växning</h6>\r\nYour content for your column #1\r\nYour content for your column #1\r\nYour content for your column #1\r\n</div>\r\n \r\n<div style="clear:both;"></div>', 'Services - Prices', '', 'inherit', 'closed', 'closed', '', '26-revision-v1', '', '', '2018-04-27 00:25:33', '2018-04-27 00:25:33', '', 26, 'http://127.0.0.1/2018/04/27/26-revision-v1/', 0, 'revision', '', 0),
(66, 1, '2018-04-27 00:26:06', '2018-04-27 00:26:06', '<div style="width:40%;padding:0 10px 0 0;float:left;">\r\n<h6>Fransar</h6>\r\nNytt set volymfransar       899 kr\r\nca 90 - 120 minuter\r\nÅterbesök volymfransar   699 kr\r\nca 90 minuter\r\nÅterbesök volymfransar   499 kr\r\nca 60 minuter\r\nNytt set singelfransar       799 kr\r\nca 90 - 120 minuter\r\nÅterbesök singelfransar   599 kr\r\nca 90 minuter\r\nÅterbesök singelfransar.   399 kr\r\nca 60 minuter\r\nBorttagning av fransar.     199 kr\r\n\r\n\r\n\r\n\r\n<h6>Färgning</h6>\r\nYour content for your column #1\r\nYour content for your column #1\r\nYour content for your column #1\r\n</div>\r\n \r\n<div style="width:40%;padding:0 10px 0 0;float:right;">\r\n<h6>Växning</h6>\r\nYour content for your column #1\r\nYour content for your column #1\r\nYour content for your column #1\r\n</div>\r\n \r\n<div style="clear:both;"></div>', 'Services - Prices', '', 'inherit', 'closed', 'closed', '', '26-revision-v1', '', '', '2018-04-27 00:26:06', '2018-04-27 00:26:06', '', 26, 'http://127.0.0.1/2018/04/27/26-revision-v1/', 0, 'revision', '', 0),
(67, 1, '2018-04-29 17:15:19', '2018-04-29 17:15:19', '<span style="color: #0000ff;"><strong>Öppettider</strong></span>\nMån-Fre : 10.00-19.00\nLör: 10.00 - 16.00\nSöndag : endasttidsbokning\n<h3 style="text-align: center;"><span style="color: #ff0000;">ERBJUDANDE</span>\n<span style="color: #ff0000;">20% rabatt för ögonfransförlängning, lashlift</span></h3>\n\n<hr />\n<p style="text-align: center;"><a href="www.facebook.com">[genericon icon=facebook size=4x color=blue]</a><a href="www.facebook.com">[genericon icon=instagram size=4x color=pink]</a></p>', '', '', 'inherit', 'closed', 'closed', '', '26-autosave-v1', '', '', '2018-04-29 17:15:19', '2018-04-29 17:15:19', '', 26, 'http://127.0.0.1/2018/04/27/26-autosave-v1/', 0, 'revision', '', 0),
(68, 1, '2018-04-27 00:27:54', '2018-04-27 00:27:54', '<div style="width: 40%; padding: 0 10px 0 0; float: left;">\r\n<h6>Fransar</h6>\r\nNytt set volymfransar 899 kr\r\n<em>ca 90 - 120 minuter</em>\r\nÅterbesök volymfransar 699 kr\r\n<em>ca 90 minuter</em>\r\nÅterbesök volymfransar 499 kr\r\n<em>ca 60 minuter</em>\r\nNytt set singelfransar 799 kr\r\n<em>ca 90 - 120 minuter</em>\r\nÅterbesök singelfransar 599 kr\r\n<em>ca 90 minuter</em>\r\nÅterbesök singelfransar. 399 kr\r\n<em>ca 60 minuter</em>\r\nBorttagning av fransar. 199 kr\r\n<h6>Färgning</h6>\r\nYour content for your column #1\r\nYour content for your column #1\r\nYour content for your column #1\r\n\r\n</div>\r\n<div style="width: 40%; padding: 0 10px 0 0; float: right;">\r\n<h6>Växning</h6>\r\nYour content for your column #1\r\nYour content for your column #1\r\nYour content for your column #1\r\n\r\n</div>\r\n<div style="clear: both;"></div>', 'Services - Prices', '', 'inherit', 'closed', 'closed', '', '26-revision-v1', '', '', '2018-04-27 00:27:54', '2018-04-27 00:27:54', '', 26, 'http://127.0.0.1/2018/04/27/26-revision-v1/', 0, 'revision', '', 0),
(69, 1, '2018-04-27 00:28:56', '2018-04-27 00:28:56', '<div style="width: 40%; padding: 0 10px 0 0; float: left;">\r\n<h6>Fransar</h6>\r\nNytt set volymfransar 899 kr\r\n<em>ca 90 - 120 minuter</em>\r\nÅterbesök volymfransar 699 kr\r\n<em>ca 90 minuter</em>\r\nÅterbesök volymfransar 499 kr\r\n<em>ca 60 minuter</em>\r\nNytt set singelfransar 799 kr\r\n<em>ca 90 - 120 minuter</em>\r\nÅterbesök singelfransar 599 kr\r\n<em>ca 90 minuter</em>\r\nÅterbesök singelfransar. 399 kr\r\n<em>ca 60 minuter</em>\r\nBorttagning av fransar. 199 kr\r\n\r\n<strong>Färgning</strong>\r\nYour content for your column #1\r\nYour content for your column #1\r\nYour content for your column #1\r\n\r\n</div>\r\n<div style="width: 40%; padding: 0 10px 0 0; float: right;">\r\n<h6>Växning</h6>\r\nYour content for your column #1\r\nYour content for your column #1\r\nYour content for your column #1\r\n\r\n</div>\r\n<div style="clear: both;"></div>', 'Services - Prices', '', 'inherit', 'closed', 'closed', '', '26-revision-v1', '', '', '2018-04-27 00:28:56', '2018-04-27 00:28:56', '', 26, 'http://127.0.0.1/2018/04/27/26-revision-v1/', 0, 'revision', '', 0),
(70, 1, '2018-04-27 00:29:33', '2018-04-27 00:29:33', '<div style="width: 40%; padding: 0 10px 0 0; float: left;">\r\n<h6>Fransar</h6>\r\nNytt set volymfransar 899 kr\r\n<em>ca 90 - 120 minuter</em>\r\nÅterbesök volymfransar 699 kr\r\n<em>ca 90 minuter</em>\r\nÅterbesök volymfransar 499 kr\r\n<em>ca 60 minuter</em>\r\nNytt set singelfransar 799 kr\r\n<em>ca 90 - 120 minuter</em>\r\nÅterbesök singelfransar 599 kr\r\n<em>ca 90 minuter</em>\r\nÅterbesök singelfransar. 399 kr\r\n<em>ca 60 minuter</em>\r\nBorttagning av fransar. 199 kr\r\n\r\n<strong>Färgning</strong>\r\nFärgning av bryn 150 kr\r\nFärgning av fransar 150 kr\r\nPlockning av bryn. 100 kr\r\nFärgning av bryn 350 kr\r\nmed henna färg\r\n</div>\r\n<div style="width: 40%; padding: 0 10px 0 0; float: right;">\r\n<h6>Växning</h6>\r\nYour content for your column #1\r\nYour content for your column #1\r\nYour content for your column #1\r\n\r\n</div>\r\n<div style="clear: both;"></div>', 'Services - Prices', '', 'inherit', 'closed', 'closed', '', '26-revision-v1', '', '', '2018-04-27 00:29:33', '2018-04-27 00:29:33', '', 26, 'http://127.0.0.1/2018/04/27/26-revision-v1/', 0, 'revision', '', 0),
(71, 1, '2018-04-27 00:33:01', '2018-04-27 00:33:01', '<div style="width: 40%; padding: 0 10px 0 0; float: left;">\r\n<h6>Fransar</h6>\r\nNytt set volymfransar.......899 kr\r\n<em>ca 90 - 120 minuter</em>\r\nÅterbesök volymfransar......699 kr\r\n<em>ca 90 minuter</em>\r\nÅterbesök volymfransar......499 kr\r\n<em>ca 60 minuter</em>\r\nNytt set singelfransar......799 kr\r\n<em>ca 90 - 120 minuter</em>\r\nÅterbesök singelfransar.....599 kr\r\n<em>ca 90 minuter</em>\r\nÅterbesök singelfransar.....399 kr\r\n<em>ca 60 minuter</em>\r\nBorttagning av fransar......199 kr\r\n\r\n<strong>Färgning</strong>\r\nFärgning av bryn............150 kr\r\nFärgning av fransar.........150 kr\r\nPlockning av bryn...........100 kr\r\nFärgning av bryn............350 kr\r\nmed henna färg\r\n</div>\r\n<div style="width: 40%; padding: 0 10px 0 0; float: right;">\r\n<h6>Växning</h6>\r\nVaxa hela ben...............499 kr\r\nVaxa halva ben..............375 kr\r\nVaxning axill...............250 kr\r\nVaxa hela armar.............350 kr\r\nVaxa halva armar............299 kr\r\n</div>\r\n<div style="clear: both;"></div>', 'Services - Prices', '', 'inherit', 'closed', 'closed', '', '26-revision-v1', '', '', '2018-04-27 00:33:01', '2018-04-27 00:33:01', '', 26, 'http://127.0.0.1/2018/04/27/26-revision-v1/', 0, 'revision', '', 0),
(72, 1, '2018-04-27 00:35:50', '2018-04-27 00:35:50', '<div style="width: 50%; padding: 0 10px 0 0; float: left;">\r\n<h6>Fransar</h6>\r\nNytt set volymfransar.........899 kr\r\n<em>ca 90 - 120 minuter</em>\r\nÅterbesök volymfransar....699 kr\r\n<em>ca 90 minuter</em>\r\nÅterbesök volymfransar.....499 kr\r\n<em>ca 60 minuter</em>\r\nNytt set singelfransar..........799 kr\r\n<em>ca 90 - 120 minuter</em>\r\nÅterbesök singelfransar.....599 kr\r\n<em>ca 90 minuter</em>\r\nÅterbesök singelfransar.....399 kr\r\n<em>ca 60 minuter</em>\r\nBorttagning av fransar.........199 kr\r\n\r\n<strong>Färgning</strong>\r\nFärgning av bryn.....................150 kr\r\nFärgning av fransar...............150 kr\r\nPlockning av bryn...................100 kr\r\nFärgning av bryn......................350 kr\r\nmed henna färg\r\n\r\n</div>\r\n<div style="width: 40%; padding: 0 10px 0 0; float: right;">\r\n<h6>Växning</h6>\r\nVaxa hela ben....................499 kr\r\nVaxa halva ben.................375 kr\r\nVaxning axill.......................250 kr\r\nVaxa hela armar...............350 kr\r\nVaxa halva armar.............299 kr\r\n\r\n</div>', 'Services - Prices', '', 'inherit', 'closed', 'closed', '', '26-revision-v1', '', '', '2018-04-27 00:35:50', '2018-04-27 00:35:50', '', 26, 'http://127.0.0.1/2018/04/27/26-revision-v1/', 0, 'revision', '', 0),
(73, 1, '2018-04-27 00:36:19', '2018-04-27 00:36:19', '<div style="width: 50%; padding: 0 10px 0 0; float: left;">\r\n<h6>Fransar</h6>\r\nNytt set volymfransar.........899 kr\r\n<em>ca 90 - 120 minuter</em>\r\nÅterbesök volymfransar....699 kr\r\n<em>ca 90 minuter</em>\r\nÅterbesök volymfransar.....499 kr\r\n<em>ca 60 minuter</em>\r\nNytt set singelfransar..........799 kr\r\n<em>ca 90 - 120 minuter</em>\r\nÅterbesök singelfransar.....599 kr\r\n<em>ca 90 minuter</em>\r\nÅterbesök singelfransar.....399 kr\r\n<em>ca 60 minuter</em>\r\nBorttagning av fransar.........199 kr\r\n\r\n<strong>Färgning</strong>\r\nFärgning av bryn.....................150 kr\r\nFärgning av fransar...............150 kr\r\nPlockning av bryn...................100 kr\r\nFärgning av bryn......................350 kr\r\nmed henna färg\r\n\r\n</div>\r\n<div style="width: 40%; padding: 0 10px 0 0; float: right;">\r\n<h6>Växning</h6>\r\nVaxa hela ben....................499 kr\r\nVaxa halva ben.................375 kr\r\nVaxning axill.......................250 kr\r\nVaxa hela armar...............350 kr\r\nVaxa halva armar.............299 kr\r\n\r\n</div>', 'Services', '', 'inherit', 'closed', 'closed', '', '26-revision-v1', '', '', '2018-04-27 00:36:19', '2018-04-27 00:36:19', '', 26, 'http://127.0.0.1/2018/04/27/26-revision-v1/', 0, 'revision', '', 0),
(74, 1, '2018-04-27 00:37:33', '2018-04-27 00:37:33', '<div style="width: 50%; padding: 0 10px 0 0; float: left;">\r\n<h6>Fransar</h6>\r\nNytt set volymfransar.........899 kr\r\n<em>ca 90 - 120 minuter</em>\r\nÅterbesök volymfransar....699 kr\r\n<em>ca 90 minuter</em>\r\nÅterbesök volymfransar.....499 kr\r\n<em>ca 60 minuter</em>\r\nNytt set singelfransar..........799 kr\r\n<em>ca 90 - 120 minuter</em>\r\nÅterbesök singelfransar.....599 kr\r\n<em>ca 90 minuter</em>\r\nÅterbesök singelfransar.....399 kr\r\n<em>ca 60 minuter</em>\r\nBorttagning av fransar.........199 kr\r\n\r\n&nbsp;\r\n\r\n</div>\r\n<div style="width: 40%; padding: 0 10px 0 0; float: right;">\r\n<h6>Växning</h6>\r\nVaxa hela ben....................499 kr\r\nVaxa halva ben.................375 kr\r\nVaxning axill.......................250 kr\r\nVaxa hela armar...............350 kr\r\nVaxa halva armar.............299 kr\r\n\r\n<strong>Färgning</strong>\r\nFärgning av bryn...............150 kr\r\nFärgning av fransar.........150 kr\r\nPlockning av bryn.............100 kr\r\nFärgning av bryn...............350 kr\r\nmed henna färg\r\n\r\n</div>', 'Services', '', 'inherit', 'closed', 'closed', '', '26-revision-v1', '', '', '2018-04-27 00:37:33', '2018-04-27 00:37:33', '', 26, 'http://127.0.0.1/2018/04/27/26-revision-v1/', 0, 'revision', '', 0),
(75, 1, '2018-04-27 00:38:22', '2018-04-27 00:38:22', '<div style="width: 50%; padding: 0 10px 0 0; float: left;">\r\n<strong>Fransar</strong>\r\nNytt set volymfransar.........899 kr\r\n<em>ca 90 - 120 minuter</em>\r\nÅterbesök volymfransar....699 kr\r\n<em>ca 90 minuter</em>\r\nÅterbesök volymfransar.....499 kr\r\n<em>ca 60 minuter</em>\r\nNytt set singelfransar..........799 kr\r\n<em>ca 90 - 120 minuter</em>\r\nÅterbesök singelfransar.....599 kr\r\n<em>ca 90 minuter</em>\r\nÅterbesök singelfransar.....399 kr\r\n<em>ca 60 minuter</em>\r\nBorttagning av fransar.........199 kr\r\n\r\n&nbsp;\r\n\r\n</div>\r\n<div style="width: 40%; padding: 0 10px 0 0; float: right;">\r\n<strong>Växning</strong>\r\nVaxa hela ben....................499 kr\r\nVaxa halva ben.................375 kr\r\nVaxning axill.......................250 kr\r\nVaxa hela armar...............350 kr\r\nVaxa halva armar.............299 kr\r\n\r\n<strong>Färgning</strong>\r\nFärgning av bryn...............150 kr\r\nFärgning av fransar.........150 kr\r\nPlockning av bryn.............100 kr\r\nFärgning av bryn...............350 kr\r\nmed henna färg\r\n\r\n</div>', 'Services', '', 'inherit', 'closed', 'closed', '', '26-revision-v1', '', '', '2018-04-27 00:38:22', '2018-04-27 00:38:22', '', 26, 'http://127.0.0.1/2018/04/27/26-revision-v1/', 0, 'revision', '', 0),
(76, 1, '2018-04-27 00:39:34', '2018-04-27 00:39:34', '{\n    "blogdescription": {\n        "value": "Another beautiful you",\n        "type": "option",\n        "user_id": 1,\n        "date_modified_gmt": "2018-04-27 00:39:34"\n    }\n}', '', '', 'trash', 'closed', 'closed', '', 'cfdf04dc-b366-42c5-b7d8-a546f0798e83', '', '', '2018-04-27 00:39:34', '2018-04-27 00:39:34', '', 0, 'http://127.0.0.1/2018/04/27/cfdf04dc-b366-42c5-b7d8-a546f0798e83/', 0, 'customize_changeset', '', 0),
(77, 1, '2018-04-27 00:40:45', '2018-04-27 00:40:45', '{\n    "show_on_front": {\n        "value": "page",\n        "type": "option",\n        "user_id": 1,\n        "date_modified_gmt": "2018-04-27 00:40:37"\n    },\n    "page_for_posts": {\n        "value": "29",\n        "type": "option",\n        "user_id": 1,\n        "date_modified_gmt": "2018-04-27 00:40:45"\n    }\n}', '', '', 'trash', 'closed', 'closed', '', 'f7f818f8-0f21-4322-97fa-ce7f7cbb94d7', '', '', '2018-04-27 00:40:45', '2018-04-27 00:40:45', '', 0, 'http://127.0.0.1/?p=77', 0, 'customize_changeset', '', 0),
(78, 1, '2018-04-27 00:41:07', '2018-04-27 00:41:07', '{\n    "show_on_front": {\n        "value": "posts",\n        "type": "option",\n        "user_id": 1,\n        "date_modified_gmt": "2018-04-27 00:41:07"\n    }\n}', '', '', 'trash', 'closed', 'closed', '', '9f6c87c3-6011-461a-905b-bf08a5b90063', '', '', '2018-04-27 00:41:07', '2018-04-27 00:41:07', '', 0, 'http://127.0.0.1/2018/04/27/9f6c87c3-6011-461a-905b-bf08a5b90063/', 0, 'customize_changeset', '', 0),
(79, 1, '2018-04-27 00:49:29', '2018-04-27 00:49:29', '{\n    "show_on_front": {\n        "value": "page",\n        "type": "option",\n        "user_id": 1,\n        "date_modified_gmt": "2018-04-27 00:49:29"\n    },\n    "page_for_posts": {\n        "value": "0",\n        "type": "option",\n        "user_id": 1,\n        "date_modified_gmt": "2018-04-27 00:49:29"\n    }\n}', '', '', 'trash', 'closed', 'closed', '', 'b8b424d9-32f1-4df1-b2fd-72d8d4a44445', '', '', '2018-04-27 00:49:29', '2018-04-27 00:49:29', '', 0, 'http://127.0.0.1/2018/04/27/b8b424d9-32f1-4df1-b2fd-72d8d4a44445/', 0, 'customize_changeset', '', 0),
(80, 1, '2018-04-27 00:50:36', '2018-04-27 00:50:36', '{\n    "page_for_posts": {\n        "value": "26",\n        "type": "option",\n        "user_id": 1,\n        "date_modified_gmt": "2018-04-27 00:49:48"\n    },\n    "show_on_front": {\n        "value": "posts",\n        "type": "option",\n        "user_id": 1,\n        "date_modified_gmt": "2018-04-27 00:50:36"\n    }\n}', '', '', 'trash', 'closed', 'closed', '', '24d6bc99-1c94-4faf-b4c8-18bff8e770e1', '', '', '2018-04-27 00:50:36', '2018-04-27 00:50:36', '', 0, 'http://127.0.0.1/?p=80', 0, 'customize_changeset', '', 0),
(81, 1, '2018-04-27 01:07:35', '2018-04-27 01:07:35', '<div style="width: 50%; padding: 0 10px 0 0; float: left;">\r\n<strong>Fransar</strong>\r\nNytt set volymfransar.........899 kr\r\n<em>ca 90 - 120 minuter</em>\r\nÅterbesök volymfransar....699 kr\r\n<em>ca 90 minuter</em>\r\nÅterbesök volymfransar.....499 kr\r\n<em>ca 60 minuter</em>\r\nNytt set singelfransar..........799 kr\r\n<em>ca 90 - 120 minuter</em>\r\nÅterbesök singelfransar.....599 kr\r\n<em>ca 90 minuter</em>\r\nÅterbesök singelfransar.....399 kr\r\n<em>ca 60 minuter</em>\r\nBorttagning av fransar.........199 kr\r\n\r\n&nbsp;\r\n\r\n</div>\r\n<div style="width: 40%; padding: 0 10px 0 0; float: right;">\r\n<strong>Växning</strong>\r\nVaxa hela ben....................499 kr\r\nVaxa halva ben.................375 kr\r\nVaxning axill.......................250 kr\r\nVaxa hela armar...............350 kr\r\nVaxa halva armar.............299 kr\r\n\r\n<strong>Färgning</strong>\r\nFärgning av bryn...............150 kr\r\nFärgning av fransar.........150 kr\r\nPlockning av bryn.............100 kr\r\nFärgning av bryn...............350 kr\r\nmed henna färg\r\n\r\n</div>', 'Hello world!', '', 'inherit', 'closed', 'closed', '', '1-revision-v1', '', '', '2018-04-27 01:07:35', '2018-04-27 01:07:35', '', 1, 'http://127.0.0.1/2018/04/27/1-revision-v1/', 0, 'revision', '', 0),
(82, 1, '2018-04-27 01:09:09', '2018-04-27 01:09:09', '{\n    "twentyseventeen::nav_menu_locations[top]": {\n        "value": 0,\n        "type": "theme_mod",\n        "user_id": 1,\n        "date_modified_gmt": "2018-04-27 01:09:09"\n    }\n}', '', '', 'trash', 'closed', 'closed', '', 'c92b93c9-8171-42df-ac42-d6497217acbf', '', '', '2018-04-27 01:09:09', '2018-04-27 01:09:09', '', 0, 'http://127.0.0.1/2018/04/27/c92b93c9-8171-42df-ac42-d6497217acbf/', 0, 'customize_changeset', '', 0),
(83, 1, '2018-04-27 01:09:40', '2018-04-27 01:09:40', '{\n    "twentyseventeen::nav_menu_locations[top]": {\n        "value": 2,\n        "type": "theme_mod",\n        "user_id": 1,\n        "date_modified_gmt": "2018-04-27 01:09:40"\n    }\n}', '', '', 'trash', 'closed', 'closed', '', 'c9fc9429-2c50-4731-8b36-df99de2c9eaa', '', '', '2018-04-27 01:09:40', '2018-04-27 01:09:40', '', 0, 'http://127.0.0.1/2018/04/27/c9fc9429-2c50-4731-8b36-df99de2c9eaa/', 0, 'customize_changeset', '', 0),
(86, 1, '2018-04-27 01:11:33', '2018-04-27 01:11:33', '{\n    "show_on_front": {\n        "value": "page",\n        "type": "option",\n        "user_id": 1,\n        "date_modified_gmt": "2018-04-27 01:11:33"\n    },\n    "page_for_posts": {\n        "value": "84",\n        "type": "option",\n        "user_id": 1,\n        "date_modified_gmt": "2018-04-27 01:11:33"\n    }\n}', '', '', 'trash', 'closed', 'closed', '', '4e00ae0f-81bc-4ad0-9ca5-3831901549d7', '', '', '2018-04-27 01:11:33', '2018-04-27 01:11:33', '', 0, 'http://127.0.0.1/2018/04/27/4e00ae0f-81bc-4ad0-9ca5-3831901549d7/', 0, 'customize_changeset', '', 0),
(87, 1, '2018-04-27 01:14:54', '2018-04-27 01:14:54', '{\n    "twentyseventeen::page_layout": {\n        "value": "one-column",\n        "type": "theme_mod",\n        "user_id": 1,\n        "date_modified_gmt": "2018-04-27 01:14:54"\n    },\n    "twentyseventeen::panel_1": {\n        "value": "26",\n        "type": "theme_mod",\n        "user_id": 1,\n        "date_modified_gmt": "2018-04-27 01:14:54"\n    },\n    "twentyseventeen::panel_2": {\n        "value": "0",\n        "type": "theme_mod",\n        "user_id": 1,\n        "date_modified_gmt": "2018-04-27 01:14:54"\n    }\n}', '', '', 'trash', 'closed', 'closed', '', '11070899-ebfb-474a-b886-c00f8524eaa9', '', '', '2018-04-27 01:14:54', '2018-04-27 01:14:54', '', 0, 'http://127.0.0.1/2018/04/27/11070899-ebfb-474a-b886-c00f8524eaa9/', 0, 'customize_changeset', '', 0),
(88, 1, '2018-04-27 01:15:46', '2018-04-27 01:15:46', '{\n    "twentyseventeen::page_layout": {\n        "value": "one-column",\n        "type": "theme_mod",\n        "user_id": 1,\n        "date_modified_gmt": "2018-04-27 01:15:46"\n    }\n}', '', '', 'trash', 'closed', 'closed', '', '4f490bf3-2fa9-4109-8e4a-4bba51ee2253', '', '', '2018-04-27 01:15:46', '2018-04-27 01:15:46', '', 0, 'http://127.0.0.1/2018/04/27/4f490bf3-2fa9-4109-8e4a-4bba51ee2253/', 0, 'customize_changeset', '', 0),
(89, 1, '2018-04-27 01:17:08', '2018-04-27 01:17:08', '{\n    "page_for_posts": {\n        "value": "29",\n        "type": "option",\n        "user_id": 1,\n        "date_modified_gmt": "2018-04-27 01:17:08"\n    }\n}', '', '', 'trash', 'closed', 'closed', '', 'ba69021d-d8b9-4f50-b0f1-8f98c6d018d1', '', '', '2018-04-27 01:17:08', '2018-04-27 01:17:08', '', 0, 'http://127.0.0.1/2018/04/27/ba69021d-d8b9-4f50-b0f1-8f98c6d018d1/', 0, 'customize_changeset', '', 0),
(90, 1, '2018-04-27 01:20:47', '2018-04-27 01:20:47', 'xxxxxxxxxxxxxxxxxxxxxx', 'Hello world!', '', 'inherit', 'closed', 'closed', '', '1-revision-v1', '', '', '2018-04-27 01:20:47', '2018-04-27 01:20:47', '', 1, 'http://127.0.0.1/2018/04/27/1-revision-v1/', 0, 'revision', '', 0),
(91, 1, '2018-04-27 01:21:47', '2018-04-27 01:21:47', '{\n    "page_for_posts": {\n        "value": "0",\n        "type": "option",\n        "user_id": 1,\n        "date_modified_gmt": "2018-04-27 01:21:47"\n    }\n}', '', '', 'trash', 'closed', 'closed', '', '37865f1c-1867-4bbd-a532-ab0bc3d7eba1', '', '', '2018-04-27 01:21:47', '2018-04-27 01:21:47', '', 0, 'http://127.0.0.1/2018/04/27/37865f1c-1867-4bbd-a532-ab0bc3d7eba1/', 0, 'customize_changeset', '', 0);
INSERT INTO `wp_posts` (`ID`, `post_author`, `post_date`, `post_date_gmt`, `post_content`, `post_title`, `post_excerpt`, `post_status`, `comment_status`, `ping_status`, `post_password`, `post_name`, `to_ping`, `pinged`, `post_modified`, `post_modified_gmt`, `post_content_filtered`, `post_parent`, `guid`, `menu_order`, `post_type`, `post_mime_type`, `comment_count`) VALUES
(92, 1, '2018-04-27 01:23:31', '2018-04-27 01:23:31', '{\n    "twentyseventeen::nav_menu_locations[top]": {\n        "value": -7711730667681911000,\n        "type": "theme_mod",\n        "user_id": 1,\n        "date_modified_gmt": "2018-04-27 01:23:31"\n    },\n    "nav_menu[-7711730667681911000]": {\n        "value": {\n            "name": "TopMenu",\n            "description": "",\n            "parent": 0,\n            "auto_add": false\n        },\n        "type": "nav_menu",\n        "user_id": 1,\n        "date_modified_gmt": "2018-04-27 01:23:31"\n    },\n    "nav_menu_item[-5740187815528447000]": {\n        "value": {\n            "object_id": 0,\n            "object": "",\n            "menu_item_parent": 0,\n            "position": 1,\n            "type": "custom",\n            "title": "Home",\n            "url": "http://127.0.0.1/about",\n            "target": "",\n            "attr_title": "",\n            "description": "",\n            "classes": "",\n            "xfn": "",\n            "status": "publish",\n            "original_title": "Home",\n            "nav_menu_term_id": -7711730667681911000,\n            "_invalid": false,\n            "type_label": "Custom Link"\n        },\n        "type": "nav_menu_item",\n        "user_id": 1,\n        "date_modified_gmt": "2018-04-27 01:23:31"\n    },\n    "nav_menu_item[-2654459563849746400]": {\n        "value": false,\n        "type": "nav_menu_item",\n        "user_id": 1,\n        "date_modified_gmt": "2018-04-27 01:23:31"\n    },\n    "nav_menu_item[-3202185757838272500]": {\n        "value": {\n            "object_id": 26,\n            "object": "page",\n            "menu_item_parent": 0,\n            "position": 2,\n            "type": "post_type",\n            "title": "Services",\n            "url": "http://127.0.0.1/",\n            "target": "",\n            "attr_title": "",\n            "description": "",\n            "classes": "",\n            "xfn": "",\n            "status": "publish",\n            "original_title": "Services",\n            "nav_menu_term_id": -7711730667681911000,\n            "_invalid": false,\n            "type_label": "Page"\n        },\n        "type": "nav_menu_item",\n        "user_id": 1,\n        "date_modified_gmt": "2018-04-27 01:23:31"\n    },\n    "nav_menu_item[-6655847616265021000]": {\n        "value": {\n            "object_id": 29,\n            "object": "page",\n            "menu_item_parent": 0,\n            "position": 3,\n            "type": "post_type",\n            "title": "Boka-tid",\n            "url": "http://127.0.0.1/booking/",\n            "target": "",\n            "attr_title": "",\n            "description": "",\n            "classes": "",\n            "xfn": "",\n            "status": "publish",\n            "original_title": "Boka-tid",\n            "nav_menu_term_id": -7711730667681911000,\n            "_invalid": false,\n            "type_label": "Page"\n        },\n        "type": "nav_menu_item",\n        "user_id": 1,\n        "date_modified_gmt": "2018-04-27 01:23:31"\n    }\n}', '', '', 'trash', 'closed', 'closed', '', '7dbb408e-bd85-45e4-8207-897a679e43e3', '', '', '2018-04-27 01:23:31', '2018-04-27 01:23:31', '', 0, 'http://127.0.0.1/2018/04/27/7dbb408e-bd85-45e4-8207-897a679e43e3/', 0, 'customize_changeset', '', 0),
(95, 1, '2018-04-27 01:23:31', '2018-04-27 01:23:31', ' ', '', '', 'publish', 'closed', 'closed', '', '95', '', '', '2018-05-03 23:07:59', '2018-05-03 23:07:59', '', 0, 'http://127.0.0.1/2018/04/27/95/', 3, 'nav_menu_item', '', 0),
(96, 1, '2018-04-27 01:24:00', '2018-04-27 01:24:00', '{\n    "twentyseventeen::panel_1": {\n        "value": "0",\n        "type": "theme_mod",\n        "user_id": 1,\n        "date_modified_gmt": "2018-04-27 01:23:51"\n    },\n    "twentyseventeen::panel_3": {\n        "value": "0",\n        "type": "theme_mod",\n        "user_id": 1,\n        "date_modified_gmt": "2018-04-27 01:24:00"\n    },\n    "twentyseventeen::panel_4": {\n        "value": "0",\n        "type": "theme_mod",\n        "user_id": 1,\n        "date_modified_gmt": "2018-04-27 01:24:00"\n    }\n}', '', '', 'trash', 'closed', 'closed', '', '8e35eb97-e0fa-4d34-a308-243d6e6f96b5', '', '', '2018-04-27 01:24:00', '2018-04-27 01:24:00', '', 0, 'http://127.0.0.1/?p=96', 0, 'customize_changeset', '', 0),
(97, 1, '2018-04-27 01:24:32', '2018-04-27 01:24:32', '{\n    "twentyseventeen::panel_1": {\n        "value": "29",\n        "type": "theme_mod",\n        "user_id": 1,\n        "date_modified_gmt": "2018-04-27 01:24:32"\n    }\n}', '', '', 'trash', 'closed', 'closed', '', '78a6a386-4509-4f10-b69f-78ddb21e15b3', '', '', '2018-04-27 01:24:32', '2018-04-27 01:24:32', '', 0, 'http://127.0.0.1/2018/04/27/78a6a386-4509-4f10-b69f-78ddb21e15b3/', 0, 'customize_changeset', '', 0),
(98, 1, '2018-04-27 01:25:05', '2018-04-27 01:25:05', '{\n    "nav_menu_item[93]": {\n        "value": false,\n        "type": "nav_menu_item",\n        "user_id": 1,\n        "date_modified_gmt": "2018-04-27 01:25:05"\n    }\n}', '', '', 'trash', 'closed', 'closed', '', 'e0e119df-746a-4700-8488-5980388e2164', '', '', '2018-04-27 01:25:05', '2018-04-27 01:25:05', '', 0, 'http://127.0.0.1/2018/04/27/e0e119df-746a-4700-8488-5980388e2164/', 0, 'customize_changeset', '', 0),
(99, 1, '2018-04-27 01:26:19', '2018-04-27 01:26:19', '{\n    "nav_menu_item[94]": {\n        "value": false,\n        "type": "nav_menu_item",\n        "user_id": 1,\n        "date_modified_gmt": "2018-04-27 01:26:19"\n    }\n}', '', '', 'trash', 'closed', 'closed', '', 'cd201f92-b4dc-4684-9b50-8682a46d20ae', '', '', '2018-04-27 01:26:19', '2018-04-27 01:26:19', '', 0, 'http://127.0.0.1/2018/04/27/cd201f92-b4dc-4684-9b50-8682a46d20ae/', 0, 'customize_changeset', '', 0),
(100, 1, '2018-04-27 01:27:06', '2018-04-27 01:27:06', '{\n    "nav_menu_item[95]": {\n        "value": {\n            "menu_item_parent": 0,\n            "object_id": 29,\n            "object": "page",\n            "type": "post_type",\n            "type_label": "Page",\n            "url": "http://127.0.0.1/booking/",\n            "title": "",\n            "target": "",\n            "attr_title": "",\n            "description": "",\n            "classes": "",\n            "xfn": "",\n            "nav_menu_term_id": 4,\n            "position": 4,\n            "status": "publish",\n            "original_title": "Boka-tid",\n            "_invalid": false\n        },\n        "type": "nav_menu_item",\n        "user_id": 1,\n        "date_modified_gmt": "2018-04-27 01:27:06"\n    },\n    "nav_menu_item[-4383495624828014600]": {\n        "value": {\n            "object_id": 26,\n            "object": "page",\n            "menu_item_parent": 0,\n            "position": 3,\n            "type": "post_type",\n            "title": "Services",\n            "url": "http://127.0.0.1/",\n            "target": "",\n            "attr_title": "",\n            "description": "",\n            "classes": "",\n            "xfn": "",\n            "status": "publish",\n            "original_title": "Services",\n            "nav_menu_term_id": 4,\n            "_invalid": false,\n            "type_label": "Page"\n        },\n        "type": "nav_menu_item",\n        "user_id": 1,\n        "date_modified_gmt": "2018-04-27 01:27:06"\n    }\n}', '', '', 'trash', 'closed', 'closed', '', '8a9fa5ac-2bb5-4d13-81e7-2f122ba40203', '', '', '2018-04-27 01:27:06', '2018-04-27 01:27:06', '', 0, 'http://127.0.0.1/2018/04/27/8a9fa5ac-2bb5-4d13-81e7-2f122ba40203/', 0, 'customize_changeset', '', 0),
(102, 1, '2018-04-27 01:28:08', '2018-04-27 01:28:08', '{\n    "nav_menu_item[101]": {\n        "value": false,\n        "type": "nav_menu_item",\n        "user_id": 1,\n        "date_modified_gmt": "2018-04-27 01:28:08"\n    },\n    "nav_menu_item[-7063814829192765000]": {\n        "value": {\n            "object_id": 0,\n            "object": "",\n            "menu_item_parent": 0,\n            "position": 5,\n            "type": "custom",\n            "title": "Services",\n            "url": "http://127.0.0.1/about",\n            "target": "",\n            "attr_title": "",\n            "description": "",\n            "classes": "",\n            "xfn": "",\n            "status": "publish",\n            "original_title": "Home",\n            "nav_menu_term_id": 4,\n            "_invalid": false,\n            "type_label": "Custom Link"\n        },\n        "type": "nav_menu_item",\n        "user_id": 1,\n        "date_modified_gmt": "2018-04-27 01:28:08"\n    }\n}', '', '', 'trash', 'closed', 'closed', '', 'd67ed558-bdb1-49aa-bb56-08708da22dc0', '', '', '2018-04-27 01:28:08', '2018-04-27 01:28:08', '', 0, 'http://127.0.0.1/2018/04/27/d67ed558-bdb1-49aa-bb56-08708da22dc0/', 0, 'customize_changeset', '', 0),
(103, 1, '2018-04-27 01:28:08', '2018-04-27 01:28:08', '', 'Services', '', 'publish', 'closed', 'closed', '', 'services', '', '', '2018-05-03 23:07:59', '2018-05-03 23:07:59', '', 0, 'http://127.0.0.1/2018/04/27/services/', 2, 'nav_menu_item', '', 0),
(104, 1, '2018-04-27 01:29:17', '2018-04-27 01:29:17', '{\n    "nav_menu_item[103]": {\n        "value": {\n            "object_id": 0,\n            "object": "",\n            "menu_item_parent": 0,\n            "position": 5,\n            "type": "custom",\n            "title": "Services",\n            "url": "http://127.0.0.1/services",\n            "target": "",\n            "attr_title": "",\n            "description": "",\n            "classes": "",\n            "xfn": "",\n            "status": "publish",\n            "original_title": "Home",\n            "nav_menu_term_id": 4,\n            "_invalid": false,\n            "type_label": "Custom Link"\n        },\n        "type": "nav_menu_item",\n        "user_id": 1,\n        "date_modified_gmt": "2018-04-27 01:29:17"\n    }\n}', '', '', 'trash', 'closed', 'closed', '', '37c463ba-1d4e-4142-8dc9-f4b80f19183f', '', '', '2018-04-27 01:29:17', '2018-04-27 01:29:17', '', 0, 'http://127.0.0.1/?p=104', 0, 'customize_changeset', '', 0),
(105, 1, '2018-04-27 01:29:27', '2018-04-27 01:29:27', '{\n    "nav_menu_item[95]": {\n        "value": {\n            "menu_item_parent": 0,\n            "object_id": 29,\n            "object": "page",\n            "type": "post_type",\n            "type_label": "Page",\n            "url": "http://127.0.0.1/booking/",\n            "title": "",\n            "target": "",\n            "attr_title": "",\n            "description": "",\n            "classes": "",\n            "xfn": "",\n            "nav_menu_term_id": 4,\n            "position": 5,\n            "status": "publish",\n            "original_title": "Boka-tid",\n            "_invalid": false\n        },\n        "type": "nav_menu_item",\n        "user_id": 1,\n        "date_modified_gmt": "2018-04-27 01:29:27"\n    },\n    "nav_menu_item[103]": {\n        "value": {\n            "object_id": 0,\n            "object": "",\n            "menu_item_parent": 0,\n            "position": 4,\n            "type": "custom",\n            "title": "Services",\n            "url": "http://127.0.0.1/services",\n            "target": "",\n            "attr_title": "",\n            "description": "",\n            "classes": "",\n            "xfn": "",\n            "status": "publish",\n            "original_title": "Home",\n            "nav_menu_term_id": 4,\n            "_invalid": false,\n            "type_label": "Custom Link"\n        },\n        "type": "nav_menu_item",\n        "user_id": 1,\n        "date_modified_gmt": "2018-04-27 01:29:27"\n    }\n}', '', '', 'trash', 'closed', 'closed', '', '2e868ba9-102e-4dd1-b3ba-72053c5a928b', '', '', '2018-04-27 01:29:27', '2018-04-27 01:29:27', '', 0, 'http://127.0.0.1/2018/04/27/2e868ba9-102e-4dd1-b3ba-72053c5a928b/', 0, 'customize_changeset', '', 0),
(106, 1, '2018-04-27 01:30:42', '2018-04-27 01:30:42', '<h3>Services</h3>\r\n<div style="width: 50%; padding: 0 10px 0 0; float: left;"><strong>Fransar</strong>\r\nNytt set volymfransar.........899 kr\r\n<em>ca 90 - 120 minuter</em>\r\nÅterbesök volymfransar....699 kr\r\n<em>ca 90 minuter</em>\r\nÅterbesök volymfransar.....499 kr\r\n<em>ca 60 minuter</em>\r\nNytt set singelfransar..........799 kr\r\n<em>ca 90 - 120 minuter</em>\r\nÅterbesök singelfransar.....599 kr\r\n<em>ca 90 minuter</em>\r\nÅterbesök singelfransar.....399 kr\r\n<em>ca 60 minuter</em>\r\nBorttagning av fransar.........199 kr</div>\r\n<div style="width: 40%; padding: 0 10px 0 0; float: right;"><strong>Växning</strong>\r\nVaxa hela ben....................499 kr\r\nVaxa halva ben.................375 kr\r\nVaxning axill.......................250 kr\r\nVaxa hela armar...............350 kr\r\nVaxa halva armar.............299 kr\r\n<strong>Färgning</strong>\r\nFärgning av bryn...............150 kr\r\nFärgning av fransar.........150 kr\r\nPlockning av bryn.............100 kr\r\nFärgning av bryn...............350 kr\r\nmed henna färg</div>', '', '', 'publish', 'closed', 'closed', '', 'services', '', '', '2018-05-03 23:11:41', '2018-05-03 23:11:41', '', 0, 'http://127.0.0.1/?page_id=106', 0, 'page', '', 0),
(107, 1, '2018-04-27 01:30:42', '2018-04-27 01:30:42', '<div style="width: 50%; padding: 0 10px 0 0; float: left;">\r\n<strong>Fransar</strong>\r\nNytt set volymfransar.........899 kr\r\n<em>ca 90 - 120 minuter</em>\r\nÅterbesök volymfransar....699 kr\r\n<em>ca 90 minuter</em>\r\nÅterbesök volymfransar.....499 kr\r\n<em>ca 60 minuter</em>\r\nNytt set singelfransar..........799 kr\r\n<em>ca 90 - 120 minuter</em>\r\nÅterbesök singelfransar.....599 kr\r\n<em>ca 90 minuter</em>\r\nÅterbesök singelfransar.....399 kr\r\n<em>ca 60 minuter</em>\r\nBorttagning av fransar.........199 kr\r\n\r\n&nbsp;\r\n\r\n</div>\r\n<div style="width: 40%; padding: 0 10px 0 0; float: right;">\r\n<strong>Växning</strong>\r\nVaxa hela ben....................499 kr\r\nVaxa halva ben.................375 kr\r\nVaxning axill.......................250 kr\r\nVaxa hela armar...............350 kr\r\nVaxa halva armar.............299 kr\r\n\r\n<strong>Färgning</strong>\r\nFärgning av bryn...............150 kr\r\nFärgning av fransar.........150 kr\r\nPlockning av bryn.............100 kr\r\nFärgning av bryn...............350 kr\r\nmed henna färg\r\n\r\n</div>', 'Services', '', 'inherit', 'closed', 'closed', '', '106-revision-v1', '', '', '2018-04-27 01:30:42', '2018-04-27 01:30:42', '', 106, 'http://127.0.0.1/2018/04/27/106-revision-v1/', 0, 'revision', '', 0),
(108, 1, '2018-04-27 01:32:32', '2018-04-27 01:32:32', '{\n    "twentyseventeen::nav_menu_locations[top]": {\n        "value": 4,\n        "type": "theme_mod",\n        "user_id": 1,\n        "date_modified_gmt": "2018-04-27 01:32:32"\n    },\n    "nav_menu_item[-3547311868512560000]": {\n        "value": false,\n        "type": "nav_menu_item",\n        "user_id": 1,\n        "date_modified_gmt": "2018-04-27 01:32:32"\n    }\n}', '', '', 'trash', 'closed', 'closed', '', '5a2c2571-bee6-403f-8883-7a222d40164e', '', '', '2018-04-27 01:32:32', '2018-04-27 01:32:32', '', 0, 'http://127.0.0.1/2018/04/27/5a2c2571-bee6-403f-8883-7a222d40164e/', 0, 'customize_changeset', '', 0),
(109, 1, '2018-04-27 01:38:42', '2018-04-27 01:38:42', '<ul>\r\n 	<li><span style="color: #333399;">Öppettider</span> :\r\nMån-Fre : 10.00-19.00\r\nLör: 10.00 - 16.00\r\nSöndag : endast tidsbokning</li>\r\n 	<li><span style="color: #333399;">Boka tid</span>\r\n076 086 4417</li>\r\n</ul>\r\n<div style="width: 50%; padding: 0 10px 0 0; float: left;"><strong>Fransar</strong>\r\nNytt set volymfransar.........899 kr\r\n<em>ca 90 - 120 minuter</em>\r\nÅterbesök volymfransar....699 kr\r\n<em>ca 90 minuter</em>\r\nÅterbesök volymfransar.....499 kr\r\n<em>ca 60 minuter</em>\r\nNytt set singelfransar..........799 kr\r\n<em>ca 90 - 120 minuter</em>\r\nÅterbesök singelfransar.....599 kr\r\n<em>ca 90 minuter</em>\r\nÅterbesök singelfransar.....399 kr\r\n<em>ca 60 minuter</em>\r\nBorttagning av fransar.........199 kr&nbsp;\r\n\r\n</div>\r\n<div style="width: 40%; padding: 0 10px 0 0; float: right;"><strong>Växning</strong>\r\nVaxa hela ben....................499 kr\r\nVaxa halva ben.................375 kr\r\nVaxning axill.......................250 kr\r\nVaxa hela armar...............350 kr\r\nVaxa halva armar.............299 kr<strong>Färgning</strong>\r\nFärgning av bryn...............150 kr\r\nFärgning av fransar.........150 kr\r\nPlockning av bryn.............100 kr\r\nFärgning av bryn...............350 kr\r\nmed henna färg\r\n\r\n</div>', 'Services', '', 'inherit', 'closed', 'closed', '', '26-revision-v1', '', '', '2018-04-27 01:38:42', '2018-04-27 01:38:42', '', 26, 'http://127.0.0.1/2018/04/27/26-revision-v1/', 0, 'revision', '', 0),
(110, 1, '2018-04-27 01:39:52', '2018-04-27 01:39:52', '{\n    "blogdescription": {\n        "value": "Another beautiful you - Franz\\u00e9ngatan 44, 112 16 Stockholm",\n        "type": "option",\n        "user_id": 1,\n        "date_modified_gmt": "2018-04-27 01:39:52"\n    }\n}', '', '', 'trash', 'closed', 'closed', '', '8fbd37b0-a5b8-4f19-a0ba-0aa5a4ca004e', '', '', '2018-04-27 01:39:52', '2018-04-27 01:39:52', '', 0, 'http://127.0.0.1/2018/04/27/8fbd37b0-a5b8-4f19-a0ba-0aa5a4ca004e/', 0, 'customize_changeset', '', 0),
(111, 1, '2018-04-27 01:40:34', '2018-04-27 01:40:34', '{\n    "blogdescription": {\n        "value": "Franz\\u00e9ngatan 44, 112 16 Stockholm",\n        "type": "option",\n        "user_id": 1,\n        "date_modified_gmt": "2018-04-27 01:40:34"\n    }\n}', '', '', 'trash', 'closed', 'closed', '', '4d199c1e-1852-4409-8464-b76a9eab56c2', '', '', '2018-04-27 01:40:34', '2018-04-27 01:40:34', '', 0, 'http://127.0.0.1/2018/04/27/4d199c1e-1852-4409-8464-b76a9eab56c2/', 0, 'customize_changeset', '', 0),
(112, 1, '2018-04-27 01:40:52', '2018-04-27 01:40:52', '{\n    "blogname": {\n        "value": "Zen Salon",\n        "type": "option",\n        "user_id": 1,\n        "date_modified_gmt": "2018-04-27 01:40:52"\n    }\n}', '', '', 'trash', 'closed', 'closed', '', 'd6717bbc-bc7c-4e80-92a2-9a99a9cfdd43', '', '', '2018-04-27 01:40:52', '2018-04-27 01:40:52', '', 0, 'http://127.0.0.1/2018/04/27/d6717bbc-bc7c-4e80-92a2-9a99a9cfdd43/', 0, 'customize_changeset', '', 0),
(113, 1, '2018-04-27 01:41:46', '2018-04-27 01:41:46', '{\n    "blogdescription": {\n        "value": "Franz\\u00e9ngatan 44, 112 16 Stockholm || 0760864417 || info@zensalon.se",\n        "type": "option",\n        "user_id": 1,\n        "date_modified_gmt": "2018-04-27 01:41:46"\n    }\n}', '', '', 'trash', 'closed', 'closed', '', '80da596a-1dcc-46a5-81d4-2b4e921c1c86', '', '', '2018-04-27 01:41:46', '2018-04-27 01:41:46', '', 0, 'http://127.0.0.1/2018/04/27/80da596a-1dcc-46a5-81d4-2b4e921c1c86/', 0, 'customize_changeset', '', 0),
(114, 1, '2018-04-27 01:42:01', '2018-04-27 01:42:01', '<ul>\r\n 	<li><span style="color: #333399;">Öppettider</span> :\r\nMån-Fre : 10.00-19.00\r\nLör: 10.00 - 16.00\r\nSöndag : endast tidsbokning</li>\r\n 	<li><span style="color: #333399;">Boka tid</span>\r\n076 086 4417</li>\r\n</ul>\r\n<div style="width: 50%; padding: 0 10px 0 0; float: left;"><strong>Fransar</strong>\r\nNytt set volymfransar.........899 kr\r\n<em>ca 90 - 120 minuter</em>\r\nÅterbesök volymfransar....699 kr\r\n<em>ca 90 minuter</em>\r\nÅterbesök volymfransar.....499 kr\r\n<em>ca 60 minuter</em>\r\nNytt set singelfransar..........799 kr\r\n<em>ca 90 - 120 minuter</em>\r\nÅterbesök singelfransar.....599 kr\r\n<em>ca 90 minuter</em>\r\nÅterbesök singelfransar.....399 kr\r\n<em>ca 60 minuter</em>\r\nBorttagning av fransar.........199 kr</div>\r\n<div style="width: 40%; padding: 0 10px 0 0; float: right;"><strong>Växning</strong>\r\nVaxa hela ben....................499 kr\r\nVaxa halva ben.................375 kr\r\nVaxning axill.......................250 kr\r\nVaxa hela armar...............350 kr\r\nVaxa halva armar.............299 kr<strong>Färgning</strong>\r\nFärgning av bryn...............150 kr\r\nFärgning av fransar.........150 kr\r\nPlockning av bryn.............100 kr\r\nFärgning av bryn...............350 kr\r\nmed henna färg</div>', 'Services', '', 'inherit', 'closed', 'closed', '', '26-revision-v1', '', '', '2018-04-27 01:42:01', '2018-04-27 01:42:01', '', 26, 'http://127.0.0.1/2018/04/27/26-revision-v1/', 0, 'revision', '', 0),
(115, 1, '2018-04-27 01:42:32', '2018-04-27 01:42:32', '<ul>\r\n 	<li>Öppettider :\r\nMån-Fre : 10.00-19.00\r\nLör: 10.00 - 16.00\r\nSöndag : endast tidsbokning</li>\r\n 	<li>Boka tid\r\n076 086 4417</li>\r\n</ul>\r\n<div><strong>Fransar</strong>\r\nNytt set volymfransar.........899 kr\r\n<em>ca 90 - 120 minuter</em>\r\nÅterbesök volymfransar....699 kr\r\n<em>ca 90 minuter</em>\r\nÅterbesök volymfransar.....499 kr\r\n<em>ca 60 minuter</em>\r\nNytt set singelfransar..........799 kr\r\n<em>ca 90 - 120 minuter</em>\r\nÅterbesök singelfransar.....599 kr\r\n<em>ca 90 minuter</em>\r\nÅterbesök singelfransar.....399 kr\r\n<em>ca 60 minuter</em>\r\nBorttagning av fransar.........199 kr</div>\r\n<div><strong>Växning</strong>\r\nVaxa hela ben....................499 kr\r\nVaxa halva ben.................375 kr\r\nVaxning axill.......................250 kr\r\nVaxa hela armar...............350 kr\r\nVaxa halva armar.............299 kr<strong>Färgning</strong>\r\nFärgning av bryn...............150 kr\r\nFärgning av fransar.........150 kr\r\nPlockning av bryn.............100 kr\r\nFärgning av bryn...............350 kr\r\nmed henna färg</div>', 'Services', '', 'inherit', 'closed', 'closed', '', '106-revision-v1', '', '', '2018-04-27 01:42:32', '2018-04-27 01:42:32', '', 106, 'http://127.0.0.1/2018/04/27/106-revision-v1/', 0, 'revision', '', 0),
(116, 1, '2018-04-27 01:43:18', '2018-04-27 01:43:18', '<ul>\r\n 	<li><span style="color: #333399;">Öppettider</span> :\r\nMån-Fre : 10.00-19.00\r\nLör: 10.00 - 16.00\r\nSöndag : endast tidsbokning</li>\r\n 	<li><span style="color: #333399;">Boka tid</span>\r\n076 086 4417</li>\r\n</ul>\r\n<div style="width: 50%; padding: 0 10px 0 0; float: left;"><strong>Fransar</strong>\r\nNytt set volymfransar.........899 kr\r\n<em>ca 90 - 120 minuter</em>\r\nÅterbesök volymfransar....699 kr\r\n<em>ca 90 minuter</em>\r\nÅterbesök volymfransar.....499 kr\r\n<em>ca 60 minuter</em>\r\nNytt set singelfransar..........799 kr\r\n<em>ca 90 - 120 minuter</em>\r\nÅterbesök singelfransar.....599 kr\r\n<em>ca 90 minuter</em>\r\nÅterbesök singelfransar.....399 kr\r\n<em>ca 60 minuter</em>\r\nBorttagning av fransar.........199 kr</div>\r\n<div style="width: 40%; padding: 0 10px 0 0; float: right;"><strong>Växning</strong>\r\nVaxa hela ben....................499 kr\r\nVaxa halva ben.................375 kr\r\nVaxning axill.......................250 kr\r\nVaxa hela armar...............350 kr\r\nVaxa halva armar.............299 kr<strong>Färgning</strong>\r\nFärgning av bryn...............150 kr\r\nFärgning av fransar.........150 kr\r\nPlockning av bryn.............100 kr\r\nFärgning av bryn...............350 kr\r\nmed henna färg</div>', 'Services', '', 'inherit', 'closed', 'closed', '', '106-revision-v1', '', '', '2018-04-27 01:43:18', '2018-04-27 01:43:18', '', 106, 'http://127.0.0.1/2018/04/27/106-revision-v1/', 0, 'revision', '', 0),
(117, 1, '2018-04-27 01:44:54', '2018-04-27 01:44:54', '<ul>\r\n 	<li><span style="color: #333399;">Öppettider</span> :\r\nMån-Fre : 10.00-19.00\r\nLör: 10.00 - 16.00\r\nSöndag : endast tidsbokning</li>\r\n 	<li><span style="color: #333399;">Boka tid</span>\r\n076 086 4417</li>\r\n</ul>\r\n<div style="width: 50%; padding: 0 10px 0 0; float: left;"><strong>Fransar</strong>\r\nNytt set volymfransar.........899 kr\r\n<em>ca 90 - 120 minuter</em>\r\nÅterbesök volymfransar....699 kr\r\n<em>ca 90 minuter</em>\r\nÅterbesök volymfransar.....499 kr\r\n<em>ca 60 minuter</em>\r\nNytt set singelfransar..........799 kr\r\n<em>ca 90 - 120 minuter</em>\r\nÅterbesök singelfransar.....599 kr\r\n<em>ca 90 minuter</em>\r\nÅterbesök singelfransar.....399 kr\r\n<em>ca 60 minuter</em>\r\nBorttagning av fransar.........199 kr</div>\r\n<div style="width: 40%; padding: 0 10px 0 0; float: right;"><strong>Växning</strong>\r\nVaxa hela ben....................499 kr\r\nVaxa halva ben.................375 kr\r\nVaxning axill.......................250 kr\r\nVaxa hela armar...............350 kr\r\nVaxa halva armar.............299 kr\r\n<strong>Färgning</strong>\r\nFärgning av bryn...............150 kr\r\nFärgning av fransar.........150 kr\r\nPlockning av bryn.............100 kr\r\nFärgning av bryn...............350 kr\r\nmed henna färg</div>', 'Services', '', 'inherit', 'closed', 'closed', '', '106-revision-v1', '', '', '2018-04-27 01:44:54', '2018-04-27 01:44:54', '', 106, 'http://127.0.0.1/2018/04/27/106-revision-v1/', 0, 'revision', '', 0),
(118, 1, '2018-04-27 01:45:19', '2018-04-27 01:45:19', '<ul>\r\n 	<li><span style="color: #333399;">Öppettider</span> :\r\nMån-Fre : 10.00-19.00\r\nLör: 10.00 - 16.00\r\nSöndag : endast tidsbokning</li>\r\n 	<li><span style="color: #333399;">Boka tid</span>\r\n076 086 4417</li>\r\n</ul>\r\n<div style="width: 50%; padding: 0 10px 0 0; float: left;"><strong>Fransar</strong>\r\nNytt set volymfransar.........899 kr\r\n<em>ca 90 - 120 minuter</em>\r\nÅterbesök volymfransar....699 kr\r\n<em>ca 90 minuter</em>\r\nÅterbesök volymfransar.....499 kr\r\n<em>ca 60 minuter</em>\r\nNytt set singelfransar..........799 kr\r\n<em>ca 90 - 120 minuter</em>\r\nÅterbesök singelfransar.....599 kr\r\n<em>ca 90 minuter</em>\r\nÅterbesök singelfransar.....399 kr\r\n<em>ca 60 minuter</em>\r\nBorttagning av fransar.........199 kr</div>\r\n<div style="width: 40%; padding: 0 10px 0 0; float: right;"><strong>Växning</strong>\r\nVaxa hela ben....................499 kr\r\nVaxa halva ben.................375 kr\r\nVaxning axill.......................250 kr\r\nVaxa hela armar...............350 kr\r\nVaxa halva armar.............299 kr\r\n<strong>Färgning</strong>\r\nFärgning av bryn...............150 kr\r\nFärgning av fransar.........150 kr\r\nPlockning av bryn.............100 kr\r\nFärgning av bryn...............350 kr\r\nmed henna färg</div>', 'Services', '', 'inherit', 'closed', 'closed', '', '26-revision-v1', '', '', '2018-04-27 01:45:19', '2018-04-27 01:45:19', '', 26, 'http://127.0.0.1/2018/04/27/26-revision-v1/', 0, 'revision', '', 0),
(120, 1, '2018-04-29 15:17:34', '2018-04-29 15:17:34', '', 'zensalon_profile', '', 'inherit', 'open', 'closed', '', 'zensalon_profile', '', '', '2018-04-29 15:17:34', '2018-04-29 15:17:34', '', 0, 'http://127.0.0.1/wp-content/uploads/2018/04/zensalon_profile.jpg', 0, 'attachment', 'image/jpeg', 0),
(121, 1, '2018-04-29 15:17:43', '2018-04-29 15:17:43', '', 'cropped-zensalon_profile.jpg', '', 'inherit', 'open', 'closed', '', 'cropped-zensalon_profile-jpg', '', '', '2018-04-29 15:17:43', '2018-04-29 15:17:43', '', 0, 'http://127.0.0.1/wp-content/uploads/2018/04/cropped-zensalon_profile.jpg', 0, 'attachment', 'image/jpeg', 0),
(122, 1, '2018-04-29 15:17:47', '2018-04-29 15:17:47', '{\n    "zeebizzcard::header_image": {\n        "value": "http://127.0.0.1/wp-content/uploads/2018/04/cropped-zensalon_profile.jpg",\n        "type": "theme_mod",\n        "user_id": 1,\n        "date_modified_gmt": "2018-04-29 15:17:47"\n    },\n    "zeebizzcard::header_image_data": {\n        "value": {\n            "url": "http://127.0.0.1/wp-content/uploads/2018/04/cropped-zensalon_profile.jpg",\n            "thumbnail_url": "http://127.0.0.1/wp-content/uploads/2018/04/cropped-zensalon_profile.jpg",\n            "timestamp": 1525015063872,\n            "attachment_id": 121,\n            "width": 280,\n            "height": 300\n        },\n        "type": "theme_mod",\n        "user_id": 1,\n        "date_modified_gmt": "2018-04-29 15:17:47"\n    }\n}', '', '', 'trash', 'closed', 'closed', '', 'd67ca662-feec-4df2-8124-0e331eb34d59', '', '', '2018-04-29 15:17:47', '2018-04-29 15:17:47', '', 0, 'http://127.0.0.1/2018/04/29/d67ca662-feec-4df2-8124-0e331eb34d59/', 0, 'customize_changeset', '', 0),
(123, 1, '2018-04-29 15:25:03', '2018-04-29 15:25:03', 'This is an example of a homepage section. Homepage sections can be any page other than the homepage itself, including the page that shows your latest blog posts.', 'Boka tid', '', 'inherit', 'closed', 'closed', '', '29-revision-v1', '', '', '2018-04-29 15:25:03', '2018-04-29 15:25:03', '', 29, 'http://127.0.0.1/2018/04/29/29-revision-v1/', 0, 'revision', '', 0),
(124, 1, '2018-04-29 15:37:48', '2018-04-29 15:37:48', '', 'Boka tid', '', 'inherit', 'closed', 'closed', '', '29-autosave-v1', '', '', '2018-04-29 15:37:48', '2018-04-29 15:37:48', '', 29, 'http://127.0.0.1/2018/04/29/29-autosave-v1/', 0, 'revision', '', 0),
(125, 1, '2018-04-29 15:35:09', '2018-04-29 15:35:09', '[bookly-form service_id="1" staff_member_id="1" hide="categories"]', 'Boka tid', '', 'inherit', 'closed', 'closed', '', '29-revision-v1', '', '', '2018-04-29 15:35:09', '2018-04-29 15:35:09', '', 29, 'http://127.0.0.1/2018/04/29/29-revision-v1/', 0, 'revision', '', 0),
(126, 1, '2018-04-29 15:35:59', '2018-04-29 15:35:59', '', 'Boka tid', '', 'inherit', 'closed', 'closed', '', '29-revision-v1', '', '', '2018-04-29 15:35:59', '2018-04-29 15:35:59', '', 29, 'http://127.0.0.1/2018/04/29/29-revision-v1/', 0, 'revision', '', 0),
(127, 1, '2018-04-29 15:36:43', '2018-04-29 15:36:43', '[bookly-form service_id="1" staff_member_id="1" hide="categories,date,week_days,time_range"]', 'Boka tid', '', 'inherit', 'closed', 'closed', '', '29-revision-v1', '', '', '2018-04-29 15:36:43', '2018-04-29 15:36:43', '', 29, 'http://127.0.0.1/2018/04/29/29-revision-v1/', 0, 'revision', '', 0),
(128, 1, '2018-04-29 15:37:57', '2018-04-29 15:37:57', '[bookly-form service_id="1" staff_member_id="1" hide="categories,staff_members,date,week_days,time_range"]', 'Boka tid', '', 'inherit', 'closed', 'closed', '', '29-revision-v1', '', '', '2018-04-29 15:37:57', '2018-04-29 15:37:57', '', 29, 'http://127.0.0.1/2018/04/29/29-revision-v1/', 0, 'revision', '', 0),
(129, 1, '2018-04-29 15:53:03', '2018-04-29 15:53:03', '{\n    "blogname": {\n        "value": "Zen salon",\n        "type": "option",\n        "user_id": 1,\n        "date_modified_gmt": "2018-04-29 15:53:03"\n    },\n    "blogdescription": {\n        "value": "Franz\\u00e9ngatan 44, 112 16 Stockholm  076 086 44 17",\n        "type": "option",\n        "user_id": 1,\n        "date_modified_gmt": "2018-04-29 15:52:25"\n    }\n}', '', '', 'trash', 'closed', 'closed', '', '3792be00-bfa6-4cb7-a2b9-afec39e25bee', '', '', '2018-04-29 15:53:03', '2018-04-29 15:53:03', '', 0, 'http://127.0.0.1/?p=129', 0, 'customize_changeset', '', 0),
(130, 1, '2018-04-29 16:02:35', '2018-04-29 16:02:35', '<h5><span style="color: #ff0000;">ERBJUDANDE</span>\r\n50% rabatt för ögonfransförlängning, lashlift</h5>\r\n&nbsp;\r\n<ul>\r\n 	<li><span style="color: #333399;">Öppettider</span> :\r\nMån-Fre : 10.00-19.00\r\nLör: 10.00 - 16.00\r\nSöndag : endast tidsbokning</li>\r\n 	<li><span style="color: #333399;">Boka tid</span>\r\n076 086 4417</li>\r\n</ul>\r\n<div style="width: 50%; padding: 0 10px 0 0; float: left;"><strong>Fransar</strong>\r\nNytt set volymfransar.........899 kr\r\n<em>ca 90 - 120 minuter</em>\r\nÅterbesök volymfransar....699 kr\r\n<em>ca 90 minuter</em>\r\nÅterbesök volymfransar.....499 kr\r\n<em>ca 60 minuter</em>\r\nNytt set singelfransar..........799 kr\r\n<em>ca 90 - 120 minuter</em>\r\nÅterbesök singelfransar.....599 kr\r\n<em>ca 90 minuter</em>\r\nÅterbesök singelfransar.....399 kr\r\n<em>ca 60 minuter</em>\r\nBorttagning av fransar.........199 kr</div>\r\n<div style="width: 40%; padding: 0 10px 0 0; float: right;"><strong>Växning</strong>\r\nVaxa hela ben....................499 kr\r\nVaxa halva ben.................375 kr\r\nVaxning axill.......................250 kr\r\nVaxa hela armar...............350 kr\r\nVaxa halva armar.............299 kr\r\n<strong>Färgning</strong>\r\nFärgning av bryn...............150 kr\r\nFärgning av fransar.........150 kr\r\nPlockning av bryn.............100 kr\r\nFärgning av bryn...............350 kr\r\nmed henna färg</div>', 'Services', '', 'inherit', 'closed', 'closed', '', '26-revision-v1', '', '', '2018-04-29 16:02:35', '2018-04-29 16:02:35', '', 26, 'http://127.0.0.1/2018/04/29/26-revision-v1/', 0, 'revision', '', 0),
(131, 1, '2018-04-29 16:03:42', '2018-04-29 16:03:42', '<h5><span style="color: #ff0000;">ERBJUDANDE</span>\r\n<span style="color: #ff0000;">20% rabatt för ögonfransförlängning, lashlift</span></h5>\r\n&nbsp;\r\n<ul>\r\n 	<li><span style="color: #333399;">Öppettider</span> :\r\nMån-Fre : 10.00-19.00\r\nLör: 10.00 - 16.00\r\nSöndag : endast tidsbokning</li>\r\n 	<li><span style="color: #333399;">Boka tid</span>\r\n076 086 4417</li>\r\n</ul>\r\n<div style="width: 50%; padding: 0 10px 0 0; float: left;"><strong>Fransar</strong>\r\nNytt set volymfransar.........899 kr\r\n<em>ca 90 - 120 minuter</em>\r\nÅterbesök volymfransar....699 kr\r\n<em>ca 90 minuter</em>\r\nÅterbesök volymfransar.....499 kr\r\n<em>ca 60 minuter</em>\r\nNytt set singelfransar..........799 kr\r\n<em>ca 90 - 120 minuter</em>\r\nÅterbesök singelfransar.....599 kr\r\n<em>ca 90 minuter</em>\r\nÅterbesök singelfransar.....399 kr\r\n<em>ca 60 minuter</em>\r\nBorttagning av fransar.........199 kr</div>\r\n<div style="width: 40%; padding: 0 10px 0 0; float: right;"><strong>Växning</strong>\r\nVaxa hela ben....................499 kr\r\nVaxa halva ben.................375 kr\r\nVaxning axill.......................250 kr\r\nVaxa hela armar...............350 kr\r\nVaxa halva armar.............299 kr\r\n<strong>Färgning</strong>\r\nFärgning av bryn...............150 kr\r\nFärgning av fransar.........150 kr\r\nPlockning av bryn.............100 kr\r\nFärgning av bryn...............350 kr\r\nmed henna färg</div>', 'Services', '', 'inherit', 'closed', 'closed', '', '26-revision-v1', '', '', '2018-04-29 16:03:42', '2018-04-29 16:03:42', '', 26, 'http://127.0.0.1/2018/04/29/26-revision-v1/', 0, 'revision', '', 0),
(132, 1, '2018-04-29 16:27:05', '2018-04-29 16:27:05', '<h5 style="text-align: center;"><span style="color: #ff0000;">ERBJUDANDE</span>\r\n<span style="color: #ff0000;">20% rabatt för ögonfransförlängning, lashlift</span></h5>\r\n<span style="color: #333399;">Öppettider</span>\r\nMån-Fre : 10.00-19.00\r\nLör: 10.00 - 16.00\r\nSöndag : endast tidsbokning\r\n<div style="width: 50%; padding: 0 10px 0 0; float: left;"><strong>Fransar</strong>\r\nNytt set volymfransar.........899 kr\r\n<em>ca 90 - 120 minuter</em>\r\nÅterbesök volymfransar....699 kr\r\n<em>ca 90 minuter</em>\r\nÅterbesök volymfransar.....499 kr\r\n<em>ca 60 minuter</em>\r\nNytt set singelfransar..........799 kr\r\n<em>ca 90 - 120 minuter</em>\r\nÅterbesök singelfransar.....599 kr\r\n<em>ca 90 minuter</em>\r\nÅterbesök singelfransar.....399 kr\r\n<em>ca 60 minuter</em>\r\nBorttagning av fransar.........199 kr</div>\r\n<div style="width: 40%; padding: 0 10px 0 0; float: right;"><strong>Växning</strong>\r\nVaxa hela ben....................499 kr\r\nVaxa halva ben.................375 kr\r\nVaxning axill.......................250 kr\r\nVaxa hela armar...............350 kr\r\nVaxa halva armar.............299 kr\r\n<strong>Färgning</strong>\r\nFärgning av bryn...............150 kr\r\nFärgning av fransar.........150 kr\r\nPlockning av bryn.............100 kr\r\nFärgning av bryn...............350 kr\r\nmed henna färg</div>', 'Services', '', 'inherit', 'closed', 'closed', '', '26-revision-v1', '', '', '2018-04-29 16:27:05', '2018-04-29 16:27:05', '', 26, 'http://127.0.0.1/2018/04/29/26-revision-v1/', 0, 'revision', '', 0),
(133, 1, '2018-04-29 16:27:41', '2018-04-29 16:27:41', '<h5 style="text-align: center;"><span style="color: #ff0000;">ERBJUDANDE</span>\r\n<span style="color: #ff0000;">20% rabatt för ögonfransförlängning, lashlift</span></h5>\r\n<span style="color: #333399;">Öppettider</span>\r\nMån-Fre : 10.00-19.00\r\nLör: 10.00 - 16.00\r\nSöndag : endast tidsbokning\r\n\r\n<hr />\r\n\r\n<div style="width: 50%; padding: 0 10px 0 0; float: left;"><strong>Fransar</strong>\r\nNytt set volymfransar.........899 kr\r\n<em>ca 90 - 120 minuter</em>\r\nÅterbesök volymfransar....699 kr\r\n<em>ca 90 minuter</em>\r\nÅterbesök volymfransar.....499 kr\r\n<em>ca 60 minuter</em>\r\nNytt set singelfransar..........799 kr\r\n<em>ca 90 - 120 minuter</em>\r\nÅterbesök singelfransar.....599 kr\r\n<em>ca 90 minuter</em>\r\nÅterbesök singelfransar.....399 kr\r\n<em>ca 60 minuter</em>\r\nBorttagning av fransar.........199 kr</div>\r\n<div style="width: 40%; padding: 0 10px 0 0; float: right;"><strong>Växning</strong>\r\nVaxa hela ben....................499 kr\r\nVaxa halva ben.................375 kr\r\nVaxning axill.......................250 kr\r\nVaxa hela armar...............350 kr\r\nVaxa halva armar.............299 kr\r\n<strong>Färgning</strong>\r\nFärgning av bryn...............150 kr\r\nFärgning av fransar.........150 kr\r\nPlockning av bryn.............100 kr\r\nFärgning av bryn...............350 kr\r\nmed henna färg</div>', 'Services', '', 'inherit', 'closed', 'closed', '', '26-revision-v1', '', '', '2018-04-29 16:27:41', '2018-04-29 16:27:41', '', 26, 'http://127.0.0.1/2018/04/29/26-revision-v1/', 0, 'revision', '', 0),
(134, 1, '2018-04-29 16:30:09', '2018-04-29 16:30:09', '[genericon icon=facebook][genericon icon=instagram]\r\n<h5 style="text-align: center;"><span style="color: #ff0000;">ERBJUDANDE</span>\r\n<span style="color: #ff0000;">20% rabatt för ögonfransförlängning, lashlift</span></h5>\r\n<span style="color: #333399;">Öppettider</span>\r\nMån-Fre : 10.00-19.00\r\nLör: 10.00 - 16.00\r\nSöndag : endast tidsbokning\r\n<hr />\r\n<div style="width: 50%; padding: 0 10px 0 0; float: left;"><strong>Fransar</strong>\r\nNytt set volymfransar.........899 kr\r\n<em>ca 90 - 120 minuter</em>\r\nÅterbesök volymfransar....699 kr\r\n<em>ca 90 minuter</em>\r\nÅterbesök volymfransar.....499 kr\r\n<em>ca 60 minuter</em>\r\nNytt set singelfransar..........799 kr\r\n<em>ca 90 - 120 minuter</em>\r\nÅterbesök singelfransar.....599 kr\r\n<em>ca 90 minuter</em>\r\nÅterbesök singelfransar.....399 kr\r\n<em>ca 60 minuter</em>\r\nBorttagning av fransar.........199 kr</div>\r\n<div style="width: 40%; padding: 0 10px 0 0; float: right;"><strong>Växning</strong>\r\nVaxa hela ben....................499 kr\r\nVaxa halva ben.................375 kr\r\nVaxning axill.......................250 kr\r\nVaxa hela armar...............350 kr\r\nVaxa halva armar.............299 kr\r\n<strong>Färgning</strong>\r\nFärgning av bryn...............150 kr\r\nFärgning av fransar.........150 kr\r\nPlockning av bryn.............100 kr\r\nFärgning av bryn...............350 kr\r\nmed henna färg</div>', 'Services', '', 'inherit', 'closed', 'closed', '', '26-revision-v1', '', '', '2018-04-29 16:30:09', '2018-04-29 16:30:09', '', 26, 'http://127.0.0.1/2018/04/29/26-revision-v1/', 0, 'revision', '', 0),
(135, 1, '2018-04-29 16:32:08', '2018-04-29 16:32:08', '[genericon icon=facebook size=32 size=2x][genericon icon=instagram size=2x]\r\n<h5 style="text-align: center;"><span style="color: #ff0000;">ERBJUDANDE</span>\r\n<span style="color: #ff0000;">20% rabatt för ögonfransförlängning, lashlift</span></h5>\r\n<span style="color: #333399;">Öppettider</span>\r\nMån-Fre : 10.00-19.00\r\nLör: 10.00 - 16.00\r\nSöndag : endast tidsbokning\r\n<hr />\r\n<div style="width: 50%; padding: 0 10px 0 0; float: left;"><strong>Fransar</strong>\r\nNytt set volymfransar.........899 kr\r\n<em>ca 90 - 120 minuter</em>\r\nÅterbesök volymfransar....699 kr\r\n<em>ca 90 minuter</em>\r\nÅterbesök volymfransar.....499 kr\r\n<em>ca 60 minuter</em>\r\nNytt set singelfransar..........799 kr\r\n<em>ca 90 - 120 minuter</em>\r\nÅterbesök singelfransar.....599 kr\r\n<em>ca 90 minuter</em>\r\nÅterbesök singelfransar.....399 kr\r\n<em>ca 60 minuter</em>\r\nBorttagning av fransar.........199 kr</div>\r\n<div style="width: 40%; padding: 0 10px 0 0; float: right;"><strong>Växning</strong>\r\nVaxa hela ben....................499 kr\r\nVaxa halva ben.................375 kr\r\nVaxning axill.......................250 kr\r\nVaxa hela armar...............350 kr\r\nVaxa halva armar.............299 kr\r\n<strong>Färgning</strong>\r\nFärgning av bryn...............150 kr\r\nFärgning av fransar.........150 kr\r\nPlockning av bryn.............100 kr\r\nFärgning av bryn...............350 kr\r\nmed henna färg</div>', 'Services', '', 'inherit', 'closed', 'closed', '', '26-revision-v1', '', '', '2018-04-29 16:32:08', '2018-04-29 16:32:08', '', 26, 'http://127.0.0.1/2018/04/29/26-revision-v1/', 0, 'revision', '', 0),
(136, 1, '2018-04-29 16:39:49', '2018-04-29 16:39:49', '[genericon icon=facebook size=32 size=2x][genericon icon=instagram size=2x]\r\n<h5 style="text-align: center;"><span style="color: #ff0000;">ERBJUDANDE</span>\r\n<span style="color: #ff0000;">20% rabatt för ögonfransförlängning, lashlift</span></h5>\r\n<span style="color: #333399;">Öppettider</span>\r\nMån-Fre : 10.00-19.00\r\nLör: 10.00 - 16.00\r\nSöndag : endast tidsbokning\r\n<hr />\r\n<div style="width: 50%; padding: 0 10px 0 0; float: left;"><strong>Fransar</strong>\r\nNytt set volymfransar.........899 kr\r\n<em>ca 90 - 120 minuter</em>\r\nÅterbesök volymfransar....699 kr\r\n<em>ca 90 minuter</em>\r\nÅterbesök volymfransar.....499 kr\r\n<em>ca 60 minuter</em>\r\nNytt set singelfransar..........799 kr\r\n<em>ca 90 - 120 minuter</em>\r\nÅterbesök singelfransar.....599 kr\r\n<em>ca 90 minuter</em>\r\nÅterbesök singelfransar.....399 kr\r\n<em>ca 60 minuter</em>\r\nBorttagning av fransar.........199 kr</div>\r\n<div style="width: 40%; padding: 0 10px 0 0; float: right;"><strong>Växning</strong>\r\nVaxa hela ben....................499 kr\r\nVaxa halva ben.................375 kr\r\nVaxning axill.......................250 kr\r\nVaxa hela armar...............350 kr\r\nVaxa halva armar.............299 kr\r\n<strong>Färgning</strong>\r\nFärgning av bryn...............150 kr\r\nFärgning av fransar.........150 kr\r\nPlockning av bryn.............100 kr\r\nFärgning av bryn...............350 kr\r\nmed henna färg</div>', 'Services', '', 'inherit', 'closed', 'closed', '', '106-revision-v1', '', '', '2018-04-29 16:39:49', '2018-04-29 16:39:49', '', 106, 'http://127.0.0.1/2018/04/29/106-revision-v1/', 0, 'revision', '', 0),
(137, 1, '2018-04-29 16:44:19', '2018-04-29 16:44:19', '<p style="text-align: left; padding-left: 450px;"><span style="color: #333399;">Öppettider</span>\r\nMån-Fre : 10.00-19.00\r\nLör: 10.00 - 16.00\r\nSöndag : endasttidsbokning</p>\r\n\r\n<h5 style="text-align: center;"><span style="color: #ff0000;">ERBJUDANDE</span>\r\n<span style="color: #ff0000;">20% rabatt för ögonfransförlängning, lashlift</span></h5>\r\n\r\n<hr />\r\n\r\n[genericon icon=facebook size=32 size=2x][genericon icon=instagram size=2x]', 'Services', '', 'inherit', 'closed', 'closed', '', '26-revision-v1', '', '', '2018-04-29 16:44:19', '2018-04-29 16:44:19', '', 26, 'http://127.0.0.1/2018/04/29/26-revision-v1/', 0, 'revision', '', 0),
(138, 1, '2018-04-29 16:44:52', '2018-04-29 16:44:52', 'Öppettider\r\nMån-Fre : 10.00-19.00\r\nLör: 10.00 - 16.00\r\nSöndag : endasttidsbokning\r\n<h5 style="text-align: center;"><span style="color: #ff0000;">ERBJUDANDE</span>\r\n<span style="color: #ff0000;">20% rabatt för ögonfransförlängning, lashlift</span></h5>\r\n\r\n<hr />\r\n\r\n[genericon icon=facebook size=32 size=2x][genericon icon=instagram size=2x]', 'Services', '', 'inherit', 'closed', 'closed', '', '26-revision-v1', '', '', '2018-04-29 16:44:52', '2018-04-29 16:44:52', '', 26, 'http://127.0.0.1/2018/04/29/26-revision-v1/', 0, 'revision', '', 0),
(139, 1, '2018-04-29 16:46:58', '2018-04-29 16:46:58', 'Öppettider\r\nMån-Fre : 10.00-19.00\r\nLör: 10.00 - 16.00\r\nSöndag : endasttidsbokning\r\n<h5 style="text-align: center;"><span style="color: #ff0000;">ERBJUDANDE</span>\r\n<span style="color: #ff0000;">20% rabatt för ögonfransförlängning, lashlift</span></h5>\r\n\r\n<hr />\r\n\r\n[genericon icon=facebook size=32 size=2x][genericon icon=instagram size=2x]', '', '', 'inherit', 'closed', 'closed', '', '26-revision-v1', '', '', '2018-04-29 16:46:58', '2018-04-29 16:46:58', '', 26, 'http://127.0.0.1/2018/04/29/26-revision-v1/', 0, 'revision', '', 0),
(140, 1, '2018-04-29 16:47:35', '2018-04-29 16:47:35', '<span style="color: #0000ff;"><strong>Öppettider</strong></span>\r\nMån-Fre : 10.00-19.00\r\nLör: 10.00 - 16.00\r\nSöndag : endasttidsbokning\r\n<h5 style="text-align: center;"><span style="color: #ff0000;">ERBJUDANDE</span>\r\n<span style="color: #ff0000;">20% rabatt för ögonfransförlängning, lashlift</span></h5>\r\n\r\n<hr />\r\n\r\n[genericon icon=facebook size=32 size=2x][genericon icon=instagram size=2x]', '', '', 'inherit', 'closed', 'closed', '', '26-revision-v1', '', '', '2018-04-29 16:47:35', '2018-04-29 16:47:35', '', 26, 'http://127.0.0.1/2018/04/29/26-revision-v1/', 0, 'revision', '', 0),
(141, 1, '2018-04-29 17:04:27', '2018-04-29 17:04:27', '{\n    "nav_menu_item[103]": {\n        "value": {\n            "menu_item_parent": 0,\n            "object_id": 103,\n            "object": "custom",\n            "type": "custom",\n            "type_label": "Custom Link",\n            "title": "Services",\n            "url": "http://127.0.0.1/services",\n            "target": "",\n            "attr_title": "",\n            "description": "",\n            "classes": "",\n            "xfn": "",\n            "nav_menu_term_id": 4,\n            "position": 2,\n            "status": "publish",\n            "original_title": "",\n            "_invalid": false\n        },\n        "type": "nav_menu_item",\n        "user_id": 1,\n        "date_modified_gmt": "2018-04-29 17:04:27"\n    },\n    "nav_menu_item[95]": {\n        "value": {\n            "menu_item_parent": 0,\n            "object_id": 29,\n            "object": "page",\n            "type": "post_type",\n            "type_label": "Page",\n            "url": "http://127.0.0.1/booking/",\n            "title": "",\n            "target": "",\n            "attr_title": "",\n            "description": "",\n            "classes": "",\n            "xfn": "",\n            "nav_menu_term_id": 4,\n            "position": 3,\n            "status": "publish",\n            "original_title": "Boka tid",\n            "_invalid": false\n        },\n        "type": "nav_menu_item",\n        "user_id": 1,\n        "date_modified_gmt": "2018-04-29 17:04:27"\n    },\n    "nav_menu_item[-8277216870255475000]": {\n        "value": {\n            "object_id": 0,\n            "object": "",\n            "menu_item_parent": 0,\n            "position": 1,\n            "type": "custom",\n            "title": "Home",\n            "url": "http://127.0.0.1",\n            "target": "",\n            "attr_title": "",\n            "description": "",\n            "classes": "",\n            "xfn": "",\n            "status": "publish",\n            "original_title": "Home",\n            "nav_menu_term_id": 4,\n            "_invalid": false,\n            "type_label": "Custom Link"\n        },\n        "type": "nav_menu_item",\n        "user_id": 1,\n        "date_modified_gmt": "2018-04-29 17:04:27"\n    }\n}', '', '', 'trash', 'closed', 'closed', '', 'b265cbb5-aec3-4d78-b84d-f5abb24b029b', '', '', '2018-04-29 17:04:27', '2018-04-29 17:04:27', '', 0, 'http://127.0.0.1/2018/04/29/b265cbb5-aec3-4d78-b84d-f5abb24b029b/', 0, 'customize_changeset', '', 0),
(142, 1, '2018-04-29 17:04:27', '2018-04-29 17:04:27', '', 'Home', '', 'publish', 'closed', 'closed', '', 'home', '', '', '2018-05-03 23:07:59', '2018-05-03 23:07:59', '', 0, 'http://127.0.0.1/2018/04/29/home/', 1, 'nav_menu_item', '', 0),
(143, 1, '2018-04-29 17:05:01', '2018-04-29 17:05:01', '<hr />\r\n\r\n<div style="width: 50%; padding: 0 10px 0 0; float: left;"><strong>Fransar</strong>\r\nNytt set volymfransar.........899 kr\r\n<em>ca 90 - 120 minuter</em>\r\nÅterbesök volymfransar....699 kr\r\n<em>ca 90 minuter</em>\r\nÅterbesök volymfransar.....499 kr\r\n<em>ca 60 minuter</em>\r\nNytt set singelfransar..........799 kr\r\n<em>ca 90 - 120 minuter</em>\r\nÅterbesök singelfransar.....599 kr\r\n<em>ca 90 minuter</em>\r\nÅterbesök singelfransar.....399 kr\r\n<em>ca 60 minuter</em>\r\nBorttagning av fransar.........199 kr</div>\r\n<div style="width: 40%; padding: 0 10px 0 0; float: right;"><strong>Växning</strong>\r\nVaxa hela ben....................499 kr\r\nVaxa halva ben.................375 kr\r\nVaxning axill.......................250 kr\r\nVaxa hela armar...............350 kr\r\nVaxa halva armar.............299 kr\r\n<strong>Färgning</strong>\r\nFärgning av bryn...............150 kr\r\nFärgning av fransar.........150 kr\r\nPlockning av bryn.............100 kr\r\nFärgning av bryn...............350 kr\r\nmed henna färg</div>', 'Services', '', 'inherit', 'closed', 'closed', '', '106-revision-v1', '', '', '2018-04-29 17:05:01', '2018-04-29 17:05:01', '', 106, 'http://127.0.0.1/2018/04/29/106-revision-v1/', 0, 'revision', '', 0);
INSERT INTO `wp_posts` (`ID`, `post_author`, `post_date`, `post_date_gmt`, `post_content`, `post_title`, `post_excerpt`, `post_status`, `comment_status`, `ping_status`, `post_password`, `post_name`, `to_ping`, `pinged`, `post_modified`, `post_modified_gmt`, `post_content_filtered`, `post_parent`, `guid`, `menu_order`, `post_type`, `post_mime_type`, `comment_count`) VALUES
(144, 1, '2018-04-29 17:05:20', '2018-04-29 17:05:20', '<hr />\r\n\r\n<div style="width: 50%; padding: 0 10px 0 0; float: left;"><strong>Fransar</strong>\r\nNytt set volymfransar.........899 kr\r\n<em>ca 90 - 120 minuter</em>\r\nÅterbesök volymfransar....699 kr\r\n<em>ca 90 minuter</em>\r\nÅterbesök volymfransar.....499 kr\r\n<em>ca 60 minuter</em>\r\nNytt set singelfransar..........799 kr\r\n<em>ca 90 - 120 minuter</em>\r\nÅterbesök singelfransar.....599 kr\r\n<em>ca 90 minuter</em>\r\nÅterbesök singelfransar.....399 kr\r\n<em>ca 60 minuter</em>\r\nBorttagning av fransar.........199 kr</div>\r\n<div style="width: 40%; padding: 0 10px 0 0; float: right;"><strong>Växning</strong>\r\nVaxa hela ben....................499 kr\r\nVaxa halva ben.................375 kr\r\nVaxning axill.......................250 kr\r\nVaxa hela armar...............350 kr\r\nVaxa halva armar.............299 kr\r\n<strong>Färgning</strong>\r\nFärgning av bryn...............150 kr\r\nFärgning av fransar.........150 kr\r\nPlockning av bryn.............100 kr\r\nFärgning av bryn...............350 kr\r\nmed henna färg</div>', '', '', 'inherit', 'closed', 'closed', '', '106-revision-v1', '', '', '2018-04-29 17:05:20', '2018-04-29 17:05:20', '', 106, 'http://127.0.0.1/2018/04/29/106-revision-v1/', 0, 'revision', '', 0),
(145, 1, '2018-04-29 17:05:54', '2018-04-29 17:05:54', '<h3>Services</h3>\r\n<div style="width: 50%; padding: 0 10px 0 0; float: left;"><strong>Fransar</strong>\r\nNytt set volymfransar.........899 kr\r\n<em>ca 90 - 120 minuter</em>\r\nÅterbesök volymfransar....699 kr\r\n<em>ca 90 minuter</em>\r\nÅterbesök volymfransar.....499 kr\r\n<em>ca 60 minuter</em>\r\nNytt set singelfransar..........799 kr\r\n<em>ca 90 - 120 minuter</em>\r\nÅterbesök singelfransar.....599 kr\r\n<em>ca 90 minuter</em>\r\nÅterbesök singelfransar.....399 kr\r\n<em>ca 60 minuter</em>\r\nBorttagning av fransar.........199 kr</div>\r\n<div style="width: 40%; padding: 0 10px 0 0; float: right;"><strong>Växning</strong>\r\nVaxa hela ben....................499 kr\r\nVaxa halva ben.................375 kr\r\nVaxning axill.......................250 kr\r\nVaxa hela armar...............350 kr\r\nVaxa halva armar.............299 kr\r\n<strong>Färgning</strong>\r\nFärgning av bryn...............150 kr\r\nFärgning av fransar.........150 kr\r\nPlockning av bryn.............100 kr\r\nFärgning av bryn...............350 kr\r\nmed henna färg</div>', '', '', 'inherit', 'closed', 'closed', '', '106-revision-v1', '', '', '2018-04-29 17:05:54', '2018-04-29 17:05:54', '', 106, 'http://127.0.0.1/2018/04/29/106-revision-v1/', 0, 'revision', '', 0),
(146, 1, '2018-04-29 17:06:27', '2018-04-29 17:06:27', '<span style="color: #0000ff;"><strong>Öppettider</strong></span>\r\nMån-Fre : 10.00-19.00\r\nLör: 10.00 - 16.00\r\nSöndag : endasttidsbokning\r\n<h3 style="text-align: center;"><span style="color: #ff0000;">ERBJUDANDE</span>\r\n<span style="color: #ff0000;">20% rabatt för ögonfransförlängning, lashlift</span></h3>\r\n\r\n<hr />\r\n\r\n[genericon icon=facebook size=32 size=2x][genericon icon=instagram size=2x]', '', '', 'inherit', 'closed', 'closed', '', '26-revision-v1', '', '', '2018-04-29 17:06:27', '2018-04-29 17:06:27', '', 26, 'http://127.0.0.1/2018/04/29/26-revision-v1/', 0, 'revision', '', 0),
(147, 1, '2018-04-29 17:08:52', '2018-04-29 17:08:52', '<span style="color: #0000ff;"><strong>Öppettider</strong></span>\r\nMån-Fre : 10.00-19.00\r\nLör: 10.00 - 16.00\r\nSöndag : endasttidsbokning\r\n<h3 style="text-align: center;"><span style="color: #ff0000;">ERBJUDANDE</span>\r\n<span style="color: #ff0000;">20% rabatt för ögonfransförlängning, lashlift</span></h3>\r\n\r\n<hr />\r\n\r\n <a href="www.facebook.com">[genericon icon=facebook size=32 size=2x]</a><a href="www.facebook.com">[genericon icon=instagram size=32 size=2x]</a>', '', '', 'inherit', 'closed', 'closed', '', '26-revision-v1', '', '', '2018-04-29 17:08:52', '2018-04-29 17:08:52', '', 26, 'http://127.0.0.1/2018/04/29/26-revision-v1/', 0, 'revision', '', 0),
(148, 1, '2018-04-29 17:10:55', '2018-04-29 17:10:55', '<span style="color: #0000ff;"><strong>Öppettider</strong></span>\r\nMån-Fre : 10.00-19.00\r\nLör: 10.00 - 16.00\r\nSöndag : endasttidsbokning\r\n<h3 style="text-align: center;"><span style="color: #ff0000;">ERBJUDANDE</span>\r\n<span style="color: #ff0000;">20% rabatt för ögonfransförlängning, lashlift</span></h3>\r\n\r\n<hr />\r\n\r\n <a href="www.facebook.com">[genericon icon=facebook size=4x]</a><a href="www.facebook.com">[genericon icon=instagram size=4x]</a>', '', '', 'inherit', 'closed', 'closed', '', '26-revision-v1', '', '', '2018-04-29 17:10:55', '2018-04-29 17:10:55', '', 26, 'http://127.0.0.1/2018/04/29/26-revision-v1/', 0, 'revision', '', 0),
(149, 1, '2018-04-29 17:13:48', '2018-04-29 17:13:48', '<span style="color: #0000ff;"><strong>Öppettider</strong></span>\r\nMån-Fre : 10.00-19.00\r\nLör: 10.00 - 16.00\r\nSöndag : endasttidsbokning\r\n<h3 style="text-align: center;"><span style="color: #ff0000;">ERBJUDANDE</span>\r\n<span style="color: #ff0000;">20% rabatt för ögonfransförlängning, lashlift</span></h3>\r\n\r\n<hr />\r\n\r\n <a href="www.facebook.com">[genericon icon=facebook size=4x color=blue]</a><a href="www.facebook.com">[genericon icon=instagram size=4x]</a>', '', '', 'inherit', 'closed', 'closed', '', '26-revision-v1', '', '', '2018-04-29 17:13:48', '2018-04-29 17:13:48', '', 26, 'http://127.0.0.1/2018/04/29/26-revision-v1/', 0, 'revision', '', 0),
(150, 1, '2018-04-29 17:14:17', '2018-04-29 17:14:17', '<span style="color: #0000ff;"><strong>Öppettider</strong></span>\r\nMån-Fre : 10.00-19.00\r\nLör: 10.00 - 16.00\r\nSöndag : endasttidsbokning\r\n<h3 style="text-align: center;"><span style="color: #ff0000;">ERBJUDANDE</span>\r\n<span style="color: #ff0000;">20% rabatt för ögonfransförlängning, lashlift</span></h3>\r\n\r\n<hr />\r\n\r\n <a href="www.facebook.com">[genericon icon=facebook size=4x color=blue]</a><a href="www.facebook.com">[genericon icon=instagram size=4x color=pink]</a>', '', '', 'inherit', 'closed', 'closed', '', '26-revision-v1', '', '', '2018-04-29 17:14:17', '2018-04-29 17:14:17', '', 26, 'http://127.0.0.1/2018/04/29/26-revision-v1/', 0, 'revision', '', 0),
(151, 1, '2018-04-29 17:15:23', '2018-04-29 17:15:23', '<span style="color: #0000ff;"><strong>Öppettider</strong></span>\r\nMån-Fre : 10.00-19.00\r\nLör: 10.00 - 16.00\r\nSöndag : endasttidsbokning\r\n<h3 style="text-align: center;"><span style="color: #ff0000;">ERBJUDANDE</span>\r\n<span style="color: #ff0000;">20% rabatt för ögonfransförlängning, lashlift</span></h3>\r\n\r\n<hr />\r\n<p style="text-align: center;"><a href="www.facebook.com">[genericon icon=facebook size=4x color=blue]</a><a href="www.facebook.com">[genericon icon=instagram size=4x color=pink]</a></p>', '', '', 'inherit', 'closed', 'closed', '', '26-revision-v1', '', '', '2018-04-29 17:15:23', '2018-04-29 17:15:23', '', 26, 'http://127.0.0.1/2018/04/29/26-revision-v1/', 0, 'revision', '', 0),
(152, 1, '2018-04-29 17:17:28', '2018-04-29 17:17:28', '<span style="color: #0000ff;"><strong>Öppettider</strong></span>\r\nMån-Fre : 10.00-19.00\r\nLör: 10.00 - 16.00\r\nSöndag : endasttidsbokning\r\n<h3 style="text-align: center;"><span style="color: #ff0000;">ERBJUDANDE</span>\r\n<span style="color: #ff0000;">20% rabatt för ögonfransförlängning, lashlift</span></h3>\r\n<p style="text-align: center;"><a href="www.facebook.com">[genericon icon=facebook size=4x color=blue]</a><a href="www.facebook.com">[genericon icon=instagram size=4x color=pink]</a></p>', '', '', 'inherit', 'closed', 'closed', '', '26-revision-v1', '', '', '2018-04-29 17:17:28', '2018-04-29 17:17:28', '', 26, 'http://127.0.0.1/2018/04/29/26-revision-v1/', 0, 'revision', '', 0),
(153, 1, '2018-04-29 17:24:25', '2018-04-29 17:24:25', '{\n    "zeebizzcard::background_image": {\n        "value": "http://127.0.0.1/wp-content/uploads/2018/04/Screen-Shot-2018-04-25-at-01.02.21-1.jpg",\n        "type": "theme_mod",\n        "user_id": 1,\n        "date_modified_gmt": "2018-04-29 17:23:39"\n    },\n    "zeebizzcard::background_preset": {\n        "value": "fill",\n        "type": "theme_mod",\n        "user_id": 1,\n        "date_modified_gmt": "2018-04-29 17:24:25"\n    },\n    "zeebizzcard::background_position_x": {\n        "value": "right",\n        "type": "theme_mod",\n        "user_id": 1,\n        "date_modified_gmt": "2018-04-29 17:24:25"\n    },\n    "zeebizzcard::background_position_y": {\n        "value": "bottom",\n        "type": "theme_mod",\n        "user_id": 1,\n        "date_modified_gmt": "2018-04-29 17:24:25"\n    },\n    "zeebizzcard::background_size": {\n        "value": "cover",\n        "type": "theme_mod",\n        "user_id": 1,\n        "date_modified_gmt": "2018-04-29 17:24:25"\n    },\n    "zeebizzcard::background_repeat": {\n        "value": "no-repeat",\n        "type": "theme_mod",\n        "user_id": 1,\n        "date_modified_gmt": "2018-04-29 17:24:25"\n    },\n    "zeebizzcard::background_attachment": {\n        "value": "fixed",\n        "type": "theme_mod",\n        "user_id": 1,\n        "date_modified_gmt": "2018-04-29 17:24:25"\n    }\n}', '', '', 'trash', 'closed', 'closed', '', 'bb78a002-66f9-451e-b20a-a365111dd6ac', '', '', '2018-04-29 17:24:25', '2018-04-29 17:24:25', '', 0, 'http://127.0.0.1/?p=153', 0, 'customize_changeset', '', 0),
(154, 1, '2018-05-03 23:07:04', '0000-00-00 00:00:00', '', 'Auto Draft', '', 'auto-draft', 'open', 'open', '', '', '', '', '2018-05-03 23:07:04', '0000-00-00 00:00:00', '', 0, 'http://www.zensalon.se/?p=154', 0, 'post', '', 0);

-- --------------------------------------------------------

--
-- Table structure for table `wp_termmeta`
--

CREATE TABLE IF NOT EXISTS `wp_termmeta` (
  `meta_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `term_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_520_ci,
  PRIMARY KEY (`meta_id`),
  KEY `term_id` (`term_id`),
  KEY `meta_key` (`meta_key`(191))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `wp_terms`
--

CREATE TABLE IF NOT EXISTS `wp_terms` (
  `term_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(200) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `slug` varchar(200) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `term_group` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`term_id`),
  KEY `slug` (`slug`(191)),
  KEY `name` (`name`(191))
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci AUTO_INCREMENT=5 ;

--
-- Dumping data for table `wp_terms`
--

INSERT INTO `wp_terms` (`term_id`, `name`, `slug`, `term_group`) VALUES
(1, 'Uncategorized', 'uncategorized', 0),
(3, 'Social Links Menu', 'social-links-menu', 0),
(4, 'TopMenu', 'topmenu', 0);

-- --------------------------------------------------------

--
-- Table structure for table `wp_term_relationships`
--

CREATE TABLE IF NOT EXISTS `wp_term_relationships` (
  `object_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `term_taxonomy_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `term_order` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`object_id`,`term_taxonomy_id`),
  KEY `term_taxonomy_id` (`term_taxonomy_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Dumping data for table `wp_term_relationships`
--

INSERT INTO `wp_term_relationships` (`object_id`, `term_taxonomy_id`, `term_order`) VALUES
(1, 1, 0),
(41, 3, 0),
(43, 3, 0),
(44, 3, 0),
(95, 4, 0),
(103, 4, 0),
(142, 4, 0);

-- --------------------------------------------------------

--
-- Table structure for table `wp_term_taxonomy`
--

CREATE TABLE IF NOT EXISTS `wp_term_taxonomy` (
  `term_taxonomy_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `term_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `taxonomy` varchar(32) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `description` longtext COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `parent` bigint(20) unsigned NOT NULL DEFAULT '0',
  `count` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`term_taxonomy_id`),
  UNIQUE KEY `term_id_taxonomy` (`term_id`,`taxonomy`),
  KEY `taxonomy` (`taxonomy`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci AUTO_INCREMENT=5 ;

--
-- Dumping data for table `wp_term_taxonomy`
--

INSERT INTO `wp_term_taxonomy` (`term_taxonomy_id`, `term_id`, `taxonomy`, `description`, `parent`, `count`) VALUES
(1, 1, 'category', '', 0, 1),
(3, 3, 'nav_menu', '', 0, 3),
(4, 4, 'nav_menu', '', 0, 3);

-- --------------------------------------------------------

--
-- Table structure for table `wp_usermeta`
--

CREATE TABLE IF NOT EXISTS `wp_usermeta` (
  `umeta_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_520_ci,
  PRIMARY KEY (`umeta_id`),
  KEY `user_id` (`user_id`),
  KEY `meta_key` (`meta_key`(191))
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci AUTO_INCREMENT=26 ;

--
-- Dumping data for table `wp_usermeta`
--

INSERT INTO `wp_usermeta` (`umeta_id`, `user_id`, `meta_key`, `meta_value`) VALUES
(1, 1, 'nickname', 'zenda'),
(2, 1, 'first_name', ''),
(3, 1, 'last_name', ''),
(4, 1, 'description', ''),
(5, 1, 'rich_editing', 'true'),
(6, 1, 'syntax_highlighting', 'true'),
(7, 1, 'comment_shortcuts', 'false'),
(8, 1, 'admin_color', 'fresh'),
(9, 1, 'use_ssl', '0'),
(10, 1, 'show_admin_bar_front', 'true'),
(11, 1, 'locale', ''),
(12, 1, 'wp_capabilities', 'a:1:{s:13:"administrator";b:1;}'),
(13, 1, 'wp_user_level', '10'),
(14, 1, 'dismissed_wp_pointers', 'theme_editor_notice,plugin_editor_notice'),
(15, 1, 'show_welcome_panel', '1'),
(16, 1, 'session_tokens', 'a:3:{s:64:"387f65105f73155e09994a67ae15f1fb34bf1833f7236a0c017a00a4d9bdcfcf";a:4:{s:10:"expiration";i:1525817672;s:2:"ip";s:9:"127.0.0.1";s:2:"ua";s:76:"Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:59.0) Gecko/20100101 Firefox/59.0";s:5:"login";i:1524608072;}s:64:"badf0d842067382f51373353cfc56eeff52e8204d8faa7ba23a158bc67aca9ed";a:4:{s:10:"expiration";i:1525561623;s:2:"ip";s:14:"213.89.195.141";s:2:"ua";s:117:"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_1) AppleWebKit/604.3.5 (KHTML, like Gecko) Version/11.0.1 Safari/604.3.5";s:5:"login";i:1525388823;}s:64:"6f4c2c12f9312bb5a84d0bb3f856cec623874fb651bc589807e173cad3e3d1de";a:4:{s:10:"expiration";i:1525563128;s:2:"ip";s:14:"213.89.195.141";s:2:"ua";s:76:"Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:59.0) Gecko/20100101 Firefox/59.0";s:5:"login";i:1525390328;}}'),
(17, 1, 'wp_dashboard_quick_press_last_post_id', '154'),
(18, 1, 'community-events-location', 'a:1:{s:2:"ip";s:12:"213.89.195.0";}'),
(19, 1, 'wp_user-settings', 'libraryContent=browse&editor=html&hidetb=1'),
(20, 1, 'wp_user-settings-time', '1525021727'),
(21, 1, 'managenav-menuscolumnshidden', 'a:5:{i:0;s:11:"link-target";i:1;s:11:"css-classes";i:2;s:3:"xfn";i:3;s:11:"description";i:4;s:15:"title-attribute";}'),
(22, 1, 'metaboxhidden_nav-menus', 'a:2:{i:0;s:12:"add-post_tag";i:1;s:15:"add-post_format";}'),
(23, 1, 'nav_menu_recently_edited', '4'),
(24, 1, 'bookly_filter_appointments_list', 'a:5:{s:2:"id";s:0:"";s:5:"staff";s:0:"";s:8:"customer";s:0:"";s:7:"service";s:0:"";s:6:"status";s:0:"";}'),
(25, 1, 'bookly_dismiss_contact_us_notice', '1');

-- --------------------------------------------------------

--
-- Table structure for table `wp_users`
--

CREATE TABLE IF NOT EXISTS `wp_users` (
  `ID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_login` varchar(60) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `user_pass` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `user_nicename` varchar(50) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `user_email` varchar(100) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `user_url` varchar(100) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `user_registered` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `user_activation_key` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `user_status` int(11) NOT NULL DEFAULT '0',
  `display_name` varchar(250) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`ID`),
  KEY `user_login_key` (`user_login`),
  KEY `user_nicename` (`user_nicename`),
  KEY `user_email` (`user_email`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci AUTO_INCREMENT=2 ;

--
-- Dumping data for table `wp_users`
--

INSERT INTO `wp_users` (`ID`, `user_login`, `user_pass`, `user_nicename`, `user_email`, `user_url`, `user_registered`, `user_activation_key`, `user_status`, `display_name`) VALUES
(1, 'zenda', '$P$BdIn0dKQF14h/c4oSiv3tXUgvpuqsW.', 'zenda', 'zensalong@gmail.com', '', '2018-04-24 22:13:22', '', 0, 'zenda');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `wp_ab_appointments`
--
ALTER TABLE `wp_ab_appointments`
  ADD CONSTRAINT `wp_ab_appointments_ibfk_1` FOREIGN KEY (`series_id`) REFERENCES `wp_ab_series` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `wp_ab_appointments_ibfk_2` FOREIGN KEY (`staff_id`) REFERENCES `wp_ab_staff` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `wp_ab_appointments_ibfk_3` FOREIGN KEY (`service_id`) REFERENCES `wp_ab_services` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `wp_ab_customer_appointments`
--
ALTER TABLE `wp_ab_customer_appointments`
  ADD CONSTRAINT `wp_ab_customer_appointments_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `wp_ab_customers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `wp_ab_customer_appointments_ibfk_2` FOREIGN KEY (`appointment_id`) REFERENCES `wp_ab_appointments` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `wp_ab_customer_appointments_ibfk_3` FOREIGN KEY (`payment_id`) REFERENCES `wp_ab_payments` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `wp_ab_holidays`
--
ALTER TABLE `wp_ab_holidays`
  ADD CONSTRAINT `wp_ab_holidays_ibfk_1` FOREIGN KEY (`staff_id`) REFERENCES `wp_ab_staff` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `wp_ab_schedule_item_breaks`
--
ALTER TABLE `wp_ab_schedule_item_breaks`
  ADD CONSTRAINT `wp_ab_schedule_item_breaks_ibfk_1` FOREIGN KEY (`staff_schedule_item_id`) REFERENCES `wp_ab_staff_schedule_items` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `wp_ab_sent_notifications`
--
ALTER TABLE `wp_ab_sent_notifications`
  ADD CONSTRAINT `wp_ab_sent_notifications_ibfk_1` FOREIGN KEY (`notification_id`) REFERENCES `wp_ab_notifications` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `wp_ab_services`
--
ALTER TABLE `wp_ab_services`
  ADD CONSTRAINT `wp_ab_services_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `wp_ab_categories` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `wp_ab_staff_preference_orders`
--
ALTER TABLE `wp_ab_staff_preference_orders`
  ADD CONSTRAINT `wp_ab_staff_preference_orders_ibfk_1` FOREIGN KEY (`service_id`) REFERENCES `wp_ab_services` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `wp_ab_staff_preference_orders_ibfk_2` FOREIGN KEY (`staff_id`) REFERENCES `wp_ab_staff` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `wp_ab_staff_schedule_items`
--
ALTER TABLE `wp_ab_staff_schedule_items`
  ADD CONSTRAINT `wp_ab_staff_schedule_items_ibfk_1` FOREIGN KEY (`staff_id`) REFERENCES `wp_ab_staff` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `wp_ab_staff_services`
--
ALTER TABLE `wp_ab_staff_services`
  ADD CONSTRAINT `wp_ab_staff_services_ibfk_1` FOREIGN KEY (`staff_id`) REFERENCES `wp_ab_staff` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `wp_ab_staff_services_ibfk_2` FOREIGN KEY (`service_id`) REFERENCES `wp_ab_services` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `wp_ab_sub_services`
--
ALTER TABLE `wp_ab_sub_services`
  ADD CONSTRAINT `wp_ab_sub_services_ibfk_1` FOREIGN KEY (`service_id`) REFERENCES `wp_ab_services` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `wp_ab_sub_services_ibfk_2` FOREIGN KEY (`sub_service_id`) REFERENCES `wp_ab_services` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
