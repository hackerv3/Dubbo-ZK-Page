/*
 Navicat Premium Data Transfer

 Source Server         : TXCentos
 Source Server Type    : MySQL
 Source Server Version : 50645
 Source Host           : xxx:3306
 Source Schema         : test

 Target Server Type    : MySQL
 Target Server Version : 50645
 File Encoding         : 65001

 Date: 30/09/2019 09:35:24
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for tb_customer
-- ----------------------------
DROP TABLE IF EXISTS `tb_customer`;
CREATE TABLE `tb_customer`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `telephone` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `address` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `remark` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 19 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of tb_customer
-- ----------------------------
INSERT INTO `tb_customer` VALUES (1, '涂陌', '123456789', '你猜', '不想写备注');
INSERT INTO `tb_customer` VALUES (2, '逗瓜', '123456789', '你猜', '不想写备注');
INSERT INTO `tb_customer` VALUES (3, '愤青', '123456789', '你猜', '不想写备注');
INSERT INTO `tb_customer` VALUES (4, '咸鱼', '123456789', '你猜', '不想写备注');
INSERT INTO `tb_customer` VALUES (5, '小白', '123456789', '你猜', '不想写备注');
INSERT INTO `tb_customer` VALUES (6, '菜鸡', '123456789', '你猜', '不想写备注');
INSERT INTO `tb_customer` VALUES (7, '2涂陌', '123456789', '你猜', '不想写备注');
INSERT INTO `tb_customer` VALUES (8, '2逗瓜', '123456789', '你猜', '不想写备注');
INSERT INTO `tb_customer` VALUES (9, '2愤青', '123456789', '你猜', '不想写备注');
INSERT INTO `tb_customer` VALUES (10, '2咸鱼', '123456789', '你猜', '不想写备注');
INSERT INTO `tb_customer` VALUES (11, '2小白', '123456789', '你猜', '不想写备注');
INSERT INTO `tb_customer` VALUES (12, '2菜鸡', '123456789', '你猜', '不想写备注');
INSERT INTO `tb_customer` VALUES (13, '3涂陌', '123456789', '你猜', '不想写备注');
INSERT INTO `tb_customer` VALUES (14, '3逗瓜', '123456789', '你猜', '不想写备注');
INSERT INTO `tb_customer` VALUES (15, '3愤青', '123456789', '你猜', '不想写备注');
INSERT INTO `tb_customer` VALUES (16, '3咸鱼', '123456789', '你猜', '不想写备注');
INSERT INTO `tb_customer` VALUES (17, '3小白', '123456789', '你猜', '不想写备注');
INSERT INTO `tb_customer` VALUES (18, '3菜鸡', '123456789', '你猜', '不想写备注');

-- ----------------------------
-- Table structure for tb_user
-- ----------------------------
DROP TABLE IF EXISTS `tb_user`;
CREATE TABLE `tb_user`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `password` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of tb_user
-- ----------------------------
INSERT INTO `tb_user` VALUES (1, 'admin', 'admin');

SET FOREIGN_KEY_CHECKS = 1;
