/*
MySQL Data Transfer
Source Host: localhost
Source Database: test
Target Host: localhost
Target Database: test
Date: 2015/6/2 20:49:49
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for books
-- ----------------------------
DROP TABLE IF EXISTS `books`;
CREATE TABLE `books` (
  `bookName` varchar(45) CHARACTER SET utf8 NOT NULL,
  `bookNumber` varchar(45) DEFAULT NULL,
  `bookAuthor` varchar(45) DEFAULT NULL,
  `bookPublicHouse` varchar(45) DEFAULT NULL,
  `bookShelf` varchar(45) DEFAULT NULL,
  `bookInfo` varchar(45) DEFAULT NULL,
  `bookState` int(11) DEFAULT NULL,
  PRIMARY KEY (`bookName`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

-- ----------------------------
-- Table structure for records
-- ----------------------------
DROP TABLE IF EXISTS `records`;
CREATE TABLE `records` (
  `rid` int(11) NOT NULL AUTO_INCREMENT,
  `bookName` varchar(45) DEFAULT NULL,
  `username` varchar(45) DEFAULT NULL,
  `time` varchar(45) DEFAULT NULL,
  `state` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`rid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=gbk;

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `username` varchar(20) CHARACTER SET utf8 NOT NULL,
  `password` varchar(20) DEFAULT NULL,
  `identity` varchar(20) DEFAULT NULL,
  `name` varchar(45) DEFAULT NULL,
  `birthday` varchar(45) DEFAULT NULL,
  `major` varchar(45) DEFAULT NULL,
  `teacherTitle` varchar(20) DEFAULT NULL,
  `id` varchar(45) DEFAULT NULL,
  `address` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

-- ----------------------------
-- Records 
-- ----------------------------
INSERT INTO `books` VALUES ('JAVA', '789123210', '霍金', '人民出版社', 'TCP131.9', 'java课程入门', '1');
INSERT INTO `books` VALUES ('计算机组成原理 ', '9787040223903', '唐朔飞 ', '高等教育出版社', 'TCP4.56', '介绍计算机的组成原理', '1');
INSERT INTO `books` VALUES ('计算机网络', '9787121201677', '谢希仁', '电子工业出版社', 'TCP3.45', '介绍网络的经典著作', '1');
INSERT INTO `records` VALUES ('1', 'C++', 'sbw', '2014-2-17 3:00', 'return');
INSERT INTO `users` VALUES ('ssdrtt', '456FGHvbn', 'student', '陈全保', '1993-8-26', '软件工程', null, '12080123', '软件学院');
