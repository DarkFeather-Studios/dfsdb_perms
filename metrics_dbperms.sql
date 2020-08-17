/*
SQLyog Community
MySQL - 10.4.13-MariaDB : Database - essentialmode
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
/*Table structure for table `useraccounts` */

CREATE TABLE `useraccounts` (
  `useraccount_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `discord_id` varchar(32) COLLATE utf8mb4_bin DEFAULT NULL,
  `steam_id` varchar(32) COLLATE utf8mb4_bin DEFAULT NULL,
  `prio_points` bigint(10) DEFAULT 500000000,
  `banned` tinyint(1) DEFAULT 0,
  `banned_reason` varchar(128) COLLATE utf8mb4_bin DEFAULT NULL,
  `banned_until` datetime DEFAULT NULL,
  `permission_level` int(3) NOT NULL DEFAULT 0,
  `whitelisted` tinyint(1) NOT NULL DEFAULT 0,
  `account_created` datetime DEFAULT current_timestamp(),
  PRIMARY KEY (`useraccount_id`)
) ENGINE=InnoDB AUTO_INCREMENT=763 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

/*Table structure for table `metrics_dbperms` */

CREATE TABLE `metrics_dbperms` (
  `metrics_dbperms_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `command` varchar(24) COLLATE utf8mb4_bin NOT NULL,
  `identifier` varchar(48) COLLATE utf8mb4_bin NOT NULL,
  `offense` tinyint(1) NOT NULL DEFAULT 0,
  `timestamp` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`metrics_dbperms_id`)
) ENGINE=InnoDB AUTO_INCREMENT=49962 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
