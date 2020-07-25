/*
Navicat MySQL Data Transfer

Source Server         : MySQL
Source Server Version : 80016
Source Host           : localhost:3306
Source Database       : test

Target Server Type    : MYSQL
Target Server Version : 80016
File Encoding         : 65001

Date: 2020-07-25 18:10:59
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for stu_best_friend
-- ----------------------------
DROP TABLE IF EXISTS `stu_best_friend`;
CREATE TABLE `stu_best_friend` (
  `id` int(11) NOT NULL,
  `name` varchar(10) NOT NULL,
  `friend_name` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of stu_best_friend
-- ----------------------------
INSERT INTO `stu_best_friend` VALUES ('1', 'Sam', 'Tim');
INSERT INTO `stu_best_friend` VALUES ('2', 'Bob', 'Sam');
INSERT INTO `stu_best_friend` VALUES ('3', 'Haris', 'Rookie');
INSERT INTO `stu_best_friend` VALUES ('7', 'Kitty', 'Miffy');
INSERT INTO `stu_best_friend` VALUES ('8', 'Green', null);
INSERT INTO `stu_best_friend` VALUES ('9', 'Oriana', null);
INSERT INTO `stu_best_friend` VALUES ('10', 'JiNitaimei', null);

-- ----------------------------
-- Table structure for stu_grade
-- ----------------------------
DROP TABLE IF EXISTS `stu_grade`;
CREATE TABLE `stu_grade` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(10) NOT NULL,
  `chinese` int(11) DEFAULT '0',
  `math` int(11) DEFAULT '0',
  `english` int(11) DEFAULT '0',
  `grade` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of stu_grade
-- ----------------------------
INSERT INTO `stu_grade` VALUES ('1', 'Sam', '120', '145', '145', '410');
INSERT INTO `stu_grade` VALUES ('2', 'Bob', '88', '98', '95', '278');
INSERT INTO `stu_grade` VALUES ('3', 'Steven', '130', '108', '135', '373');
INSERT INTO `stu_grade` VALUES ('4', 'Amy', '120', '120', '120', '360');
INSERT INTO `stu_grade` VALUES ('5', 'Eleven', '130', '130', '140', '400');
INSERT INTO `stu_grade` VALUES ('6', 'Miffy', '125', '145', '135', '405');
INSERT INTO `stu_grade` VALUES ('7', 'Smith', '100', '100', '100', '300');

-- ----------------------------
-- Table structure for stu_info
-- ----------------------------
DROP TABLE IF EXISTS `stu_info`;
CREATE TABLE `stu_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(10) NOT NULL,
  `age` int(11) NOT NULL,
  `birthday` datetime NOT NULL DEFAULT '2000-01-01 13:00:00',
  `email` varchar(20) DEFAULT NULL,
  `country` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of stu_info
-- ----------------------------
INSERT INTO `stu_info` VALUES ('1', 'Sam', '21', '1999-05-04 08:00:00', '123456789@qq.com', 'China');
INSERT INTO `stu_info` VALUES ('2', 'Bob', '35', '1985-12-03 09:34:20', 'bobbob@gmail.com', 'USA');
INSERT INTO `stu_info` VALUES ('3', 'Steven', '25', '1995-03-03 06:17:30', 'steven521@gmail.com', 'UK');
INSERT INTO `stu_info` VALUES ('4', 'Amy', '20', '2000-01-01 13:00:00', 'amy20205205@163.com', 'China');
INSERT INTO `stu_info` VALUES ('5', 'Eleven', '19', '2001-07-02 21:30:00', '11more11@163.com', 'China');
INSERT INTO `stu_info` VALUES ('6', 'Miffy', '20', '2000-08-10 12:00:00', 'miffy521@126.com', 'Japan');
INSERT INTO `stu_info` VALUES ('7', 'HHH', '1', '2020-07-25 18:08:58', 'hhhhhh@hhh.com', 'China');

-- ----------------------------
-- Table structure for stu_login
-- ----------------------------
DROP TABLE IF EXISTS `stu_login`;
CREATE TABLE `stu_login` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `stu_id` int(11) NOT NULL,
  `web_url` varchar(30) NOT NULL,
  `count` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of stu_login
-- ----------------------------
INSERT INTO `stu_login` VALUES ('1', '1', 'www.baidu.com', '25');
INSERT INTO `stu_login` VALUES ('2', '2', 'www.baidu.com', '100');
INSERT INTO `stu_login` VALUES ('3', '3', 'www.csdn.net', '40');
INSERT INTO `stu_login` VALUES ('4', '4', 'www.luogu.org.cn', '33');
INSERT INTO `stu_login` VALUES ('5', '1', 'www.baidu.com', '1');
INSERT INTO `stu_login` VALUES ('6', '2', 'www.csdn.net', '9');
INSERT INTO `stu_login` VALUES ('7', '6', 'www.jslint.com', '14');
INSERT INTO `stu_login` VALUES ('8', '3', 'www.baidu.com', '3');

-- ----------------------------
-- Table structure for user_login
-- ----------------------------
DROP TABLE IF EXISTS `user_login`;
CREATE TABLE `user_login` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(20) NOT NULL,
  `password` varchar(20) NOT NULL,
  `telephone` varchar(15) DEFAULT NULL,
  `vip` bit(1) NOT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `uu` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=10013 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_login
-- ----------------------------
INSERT INTO `user_login` VALUES ('10000', 'TheShy', '123456', '11111111111', '');
INSERT INTO `user_login` VALUES ('10001', 'Ning', '1234567', '22222222222', '');
INSERT INTO `user_login` VALUES ('10002', 'Rookie', '12345678', '33333333333', '');
INSERT INTO `user_login` VALUES ('10003', 'Puff', '123456789', '44444444444', '');
INSERT INTO `user_login` VALUES ('10004', 'Southwind', '1234567890', '55555555555', '');
INSERT INTO `user_login` VALUES ('10005', 'PigPig', '12123', '12123', '');
INSERT INTO `user_login` VALUES ('10006', 'HengHeng', '12123', '12123', '\0');
INSERT INTO `user_login` VALUES ('10007', 'XiaoWangBa', '12123', '12123', '\0');
INSERT INTO `user_login` VALUES ('10008', 'XiaoHu', '12123', '12123', '\0');
INSERT INTO `user_login` VALUES ('10009', 'XiaoLaJiao', '12123', '12123', '\0');
INSERT INTO `user_login` VALUES ('10010', 'XiaoCaiJi', '12123', '12123', '\0');
INSERT INTO `user_login` VALUES ('10011', 'TheBug              ', '12123', '3333333', '\0');

-- ----------------------------
-- Procedure structure for insert_new_student
-- ----------------------------
DROP PROCEDURE IF EXISTS `insert_new_student`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `insert_new_student`(IN studentName VARCHAR(255), IN studentAge INT, IN studentBirthday DATETIME, IN studentEmail VARCHAR(255), IN studentCountry VARCHAR(255))
BEGIN
    # 定义变量 插入前最大ID
    DECLARE maxId INT;
    # 定义变量 插入后最大ID 用于比较
    DECLARE newId INT;
    # 定义变量 执行后的结果
    DECLARE state VARCHAR(255);
    # 这里的一个细节是：可以对Age和Birthday的关系进行一个judge，我觉得太麻烦不想写……
    # 获取插入信息前的最大ID（ID为主键且自增1）
    SELECT MAX(id) INTO maxId FROM stu_info;
    # 插入新的一条学生信息
    INSERT INTO stu_info VALUES (NULL, studentName, studentAge, studentBirthday, studentEmail, studentCountry);
    # 获取插入信息后的最大ID
    SELECT MAX(id) INTO newId FROM stu_info;
    # 通过ID判断是否插入成功
    IF maxId+1 = newId THEN
        SET state = '新增学生信息成功';
    ELSE
        SET state = '新增学生信息失败';
    # END IF必须有
    END IF;
# 存储过程结束
END
;;
DELIMITER ;
