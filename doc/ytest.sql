/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 50623
 Source Host           : localhost
 Source Database       : ytest

 Target Server Type    : MySQL
 Target Server Version : 50623
 File Encoding         : utf-8

 Date: 09/21/2016 19:14:53 PM
*/

SET NAMES utf8;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
--  Table structure for `g2_function`
-- ----------------------------
DROP TABLE IF EXISTS `g2_function`;
CREATE TABLE `g2_function` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(50) NOT NULL,
  `second_name` varchar(50) NOT NULL,
  `role` varchar(50) NOT NULL,
  `status` varchar(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `g2_function`
-- ----------------------------
BEGIN;
INSERT INTO `g2_function` VALUES ('1', '首页', '首页', 'summary', '1'), ('2', '后台设置', '账号管理', 'systemUser', '1'), ('3', '后台设置', '操作记录', 'systemLogger', '1'), ('33', '功能控制', '礼品码', 'functionGiftCode', '1'), ('34', '功能控制', '登录公告', 'functionLogin', '1'), ('35', '功能控制', '邮件管理', 'functionEmail', '1'), ('36', '功能控制', '系统广播', 'functionBroadCast', '1'), ('37', '功能控制', '黑名单管理', 'functionBlackList', '1'), ('38', '信息监控', '服务器状态', 'monitorServer', '1'), ('39', '信息监控', '游戏配置', 'monitorGameConfig', '1'), ('40', '信息监控', '意见反馈', 'monitorIssues', '1'), ('41', '数据查询', '基本指标', 'dataBasic', '1'), ('42', '数据查询', '留存率', 'dataRetention', '1'), ('43', '数据查询', '等级分布', 'dataRank', '1'), ('44', '数据查询', '关卡分布', 'dataLevel', '1'), ('45', '数据查询', '付费点', 'dataPayPoint', '1'), ('46', '数据查询', '钻石消费', 'dataDiamond', '1'), ('47', '数据查询', '商城消费', 'dataMall', '1');
COMMIT;

-- ----------------------------
--  Table structure for `g2_plat_form`
-- ----------------------------
DROP TABLE IF EXISTS `g2_plat_form`;
CREATE TABLE `g2_plat_form` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `cr_date` datetime DEFAULT NULL,
  `upd_date` datetime DEFAULT NULL,
  `status` int(1) DEFAULT NULL,
  `pf_id` varchar(100) DEFAULT NULL,
  `pf_name` varchar(100) DEFAULT NULL,
  `server_zone_id` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `g2_plat_form`
-- ----------------------------
BEGIN;
INSERT INTO `g2_plat_form` VALUES ('14', '2016-07-22 17:23:53', '2016-07-22 17:23:53', '1', 'test1', 'test1', '1'), ('15', '2016-07-22 17:24:08', '2016-07-22 17:24:08', '1', 'test2', 'test2', '2'), ('16', '2016-07-22 17:24:16', '2016-07-22 17:24:16', '1', 'test3', 'test3', '3'), ('17', '2016-07-22 17:24:25', '2016-07-22 17:24:25', '1', 'test4', 'test4', '4');
COMMIT;

-- ----------------------------
--  Table structure for `g2_server`
-- ----------------------------
DROP TABLE IF EXISTS `g2_server`;
CREATE TABLE `g2_server` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `cr_date` datetime DEFAULT NULL,
  `upd_date` datetime DEFAULT NULL,
  `status` int(1) DEFAULT NULL,
  `server_id` varchar(20) DEFAULT NULL,
  `ip` varchar(100) DEFAULT NULL,
  `store_id` bigint(20) DEFAULT NULL,
  `server_zone_id` bigint(20) DEFAULT NULL,
  `port` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `g2_server`
-- ----------------------------
BEGIN;
INSERT INTO `g2_server` VALUES ('1', '2016-07-25 16:06:44', '2016-07-25 16:06:44', '1', 'xyj_1', null, '4', '1', null), ('2', '2016-07-25 16:09:29', '2016-07-25 16:09:29', '1', 'kds_1', null, '3', '1', null), ('3', '2016-07-25 16:09:58', '2016-07-25 16:09:58', '1', 'kun_1', null, '2', '1', null), ('4', '2016-07-25 16:10:14', '2016-07-25 16:10:14', '1', 'fb_1', null, '1', '1', null);
COMMIT;

-- ----------------------------
--  Table structure for `g2_server_zone`
-- ----------------------------
DROP TABLE IF EXISTS `g2_server_zone`;
CREATE TABLE `g2_server_zone` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `server_name` varchar(50) DEFAULT NULL,
  `cr_date` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `upd_date` timestamp NULL DEFAULT NULL,
  `status` int(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `g2_server_zone`
-- ----------------------------
BEGIN;
INSERT INTO `g2_server_zone` VALUES ('1', 'IOS官方', '2016-07-22 16:04:52', null, '1'), ('2', 'IOS越狱', '2016-07-22 16:05:01', null, '1'), ('3', '安卓官方', '2016-07-22 16:05:11', null, '1'), ('4', '安卓滚服', '2016-07-22 16:05:23', null, '1');
COMMIT;

-- ----------------------------
--  Table structure for `g2_stores`
-- ----------------------------
DROP TABLE IF EXISTS `g2_stores`;
CREATE TABLE `g2_stores` (
  `store_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `cr_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `upd_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `status` int(1) DEFAULT NULL,
  PRIMARY KEY (`store_id`)
) ENGINE=MyISAM AUTO_INCREMENT=33 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `g2_stores`
-- ----------------------------
BEGIN;
INSERT INTO `g2_stores` VALUES ('1', 'FB', '2016-07-25 12:11:38', '2016-07-25 12:11:38', '1'), ('21', 'tes', '2016-07-25 15:38:45', '2016-07-25 14:28:29', '0'), ('2', 'KUN', '2016-07-25 15:41:14', '2016-07-25 15:41:14', '1'), ('3', 'KDS', '2016-07-25 15:41:28', '2016-07-25 15:41:28', '1'), ('4', 'XYJ', '2016-07-25 15:42:34', '2016-07-25 15:42:34', '1');
COMMIT;

-- ----------------------------
--  Table structure for `g2_user`
-- ----------------------------
DROP TABLE IF EXISTS `g2_user`;
CREATE TABLE `g2_user` (
  `store_id` bigint(20) DEFAULT NULL,
  `login_name` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `salt` varchar(255) DEFAULT NULL,
  `roles` varchar(2000) NOT NULL,
  `register_date` date DEFAULT NULL,
  `upd_date` date DEFAULT NULL,
  `status` int(1) DEFAULT NULL,
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `server_zone` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=37 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `g2_user`
-- ----------------------------
BEGIN;
INSERT INTO `g2_user` VALUES ('0', 'admin', 'admin', 'admin', 'f06f94b88f4f317f6a211914080e21dc33c1ea2f', '8b8a7e2d406fe25a', 'admin', '2014-04-04', '2014-04-15', '1', '1', '1'), ('3', 'test2', 'test2', null, 'a755c9dba9f6e6d8275ea545ea92db1ce0579dc1', 'e4ae90706c0a6fc7', 'systemUser,systemStore,systemWatcher,summary,playerNew,playActive,playerRetention,playerConvertion,playerChurned,playerBehavior,playerDivice,concurrent,levelDetail,levelDistribute,levelSchedule,tasks,revenueIncomeData,revenuePayPermeate,revenueNewPlayerValue,revenuePayHabit,virtualEconomyVirtualCoin,virtualEconomyConsumeAnalysis,virtualEconomyConsumePoint,whaleWhaleUser', '2016-07-26', null, '1', '36', '1,2,3,4'), ('1', 'test1', 'test1', null, 'b28ee6f63d5cab95bde98d5bc20ddd6a72bf617c', '26d132c978e87d97', 'systemUser,systemStore,systemWatcher,summary,playerNew,concurrent,levelDetail,tasks,whaleWhaleUser', '2016-07-25', null, '1', '35', '1,2');
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
