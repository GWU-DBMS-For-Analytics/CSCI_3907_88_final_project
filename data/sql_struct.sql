/*
Navicat MySQL Data Transfer

Source Server         : ali-metro
Source Server Version : 50733
Source Host           : 8.130.53.81:3306
Source Database       : CSCI_3907

Target Server Type    : MYSQL
Target Server Version : 50733
File Encoding         : 65001

Date: 2021-04-19 14:26:58
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for country_code
-- ----------------------------
DROP TABLE IF EXISTS `country_code`;
CREATE TABLE `country_code` (
  `﻿country_code` int(11) NOT NULL,
  `country` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`﻿country_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for zomato
-- ----------------------------
DROP TABLE IF EXISTS `zomato`;
CREATE TABLE `zomato` (
  `restaurant_id` int(11) NOT NULL,
  `restaurant_name` varchar(255) CHARACTER SET utf8mb4 DEFAULT NULL,
  `country_code` int(11) DEFAULT NULL,
  `city` varchar(255) CHARACTER SET utf8mb4 DEFAULT NULL,
  `address` varchar(255) CHARACTER SET utf8mb4 DEFAULT NULL,
  `locality` varchar(255) CHARACTER SET utf8mb4 DEFAULT NULL,
  `locality_verbose` varchar(255) CHARACTER SET utf8mb4 DEFAULT NULL,
  `longitude` varchar(255) CHARACTER SET utf8mb4 DEFAULT NULL,
  `latitude` varchar(255) CHARACTER SET utf8mb4 DEFAULT NULL,
  `cuisines` varchar(255) CHARACTER SET utf8mb4 DEFAULT NULL,
  `average_cost_for_two` int(11) DEFAULT NULL,
  `currency` varchar(255) CHARACTER SET utf8mb4 DEFAULT NULL,
  `has_table_booking` tinyint(1) DEFAULT NULL,
  `has_online_delivery` tinyint(1) DEFAULT NULL,
  `is_delivering_now` tinyint(1) DEFAULT NULL,
  `switch_to_order_menu` tinyint(1) DEFAULT NULL,
  `price_range` int(11) DEFAULT NULL,
  `aggregate_rating` decimal(10,0) DEFAULT NULL,
  `rating_color` varchar(255) CHARACTER SET utf8mb4 DEFAULT NULL,
  `rating_text` varchar(255) CHARACTER SET utf8mb4 DEFAULT NULL,
  `votes` int(11) DEFAULT NULL,
  PRIMARY KEY (`restaurant_id`),
  KEY `restaurant_id` (`restaurant_id`) USING BTREE,
  KEY `country_code` (`country_code`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
