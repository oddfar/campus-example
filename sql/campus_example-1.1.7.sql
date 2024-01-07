

SET NAMES utf8;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for campus_category
-- ----------------------------
DROP TABLE IF EXISTS `campus_category`;
CREATE TABLE `campus_category` (
  `category_id` bigint NOT NULL COMMENT '分类主键',
  `category_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '分类名',
  `parent_id` bigint DEFAULT '0' COMMENT '父分类id',
  `order_num` int DEFAULT '0' COMMENT '显示顺序',
  `slug` varchar(30) NOT NULL COMMENT '缩略名',
  `description` varchar(300) DEFAULT NULL COMMENT '描述',
  `type` char(1) DEFAULT 'N' COMMENT '系统内置（Y是 N否）',
  `icon` varchar(100) DEFAULT NULL COMMENT '分类图标\n',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `del_flag` bit(1) DEFAULT b'0' COMMENT '逻辑删除(1:已删除，0:未删除)',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_user` bigint DEFAULT NULL COMMENT '创建人',
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_user` bigint DEFAULT NULL COMMENT '更新人',
  PRIMARY KEY (`category_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Records of campus_category
-- ----------------------------
BEGIN;
INSERT INTO `campus_category` (`category_id`, `category_name`, `parent_id`, `order_num`, `slug`, `description`, `type`, `icon`, `status`, `del_flag`, `create_time`, `create_user`, `update_time`, `update_user`) VALUES (1, '最新墙', 0, 0, 'newest', '最近的墙内容(菜单默认选择这个)', 'Y', 'system', '0', b'0', '2022-12-30 20:11:41', 1, '2023-01-01 22:23:49', 1);
INSERT INTO `campus_category` (`category_id`, `category_name`, `parent_id`, `order_num`, `slug`, `description`, `type`, `icon`, `status`, `del_flag`, `create_time`, `create_user`, `update_time`, `update_user`) VALUES (123, '表白墙', 0, 2, 'friends', '', 'N', 'system', '0', b'0', '2021-10-15 10:32:00', NULL, '2023-04-07 19:30:12', 1);
INSERT INTO `campus_category` (`category_id`, `category_name`, `parent_id`, `order_num`, `slug`, `description`, `type`, `icon`, `status`, `del_flag`, `create_time`, `create_user`, `update_time`, `update_user`) VALUES (1449212758636646402, '表白', 123, 1, 'debunk', '吐槽描述', 'N', 'system', '0', b'0', '2021-10-16 11:17:01', NULL, '2023-01-01 22:26:29', 1);
INSERT INTO `campus_category` (`category_id`, `category_name`, `parent_id`, `order_num`, `slug`, `description`, `type`, `icon`, `status`, `del_flag`, `create_time`, `create_user`, `update_time`, `update_user`) VALUES (1465662542308495361, '分享墙', 0, 3, 'share', '', 'N', 'system', '0', b'0', '2021-11-30 20:42:35', NULL, '2022-12-26 17:57:48', 1);
INSERT INTO `campus_category` (`category_id`, `category_name`, `parent_id`, `order_num`, `slug`, `description`, `type`, `icon`, `status`, `del_flag`, `create_time`, `create_user`, `update_time`, `update_user`) VALUES (1602336520042287105, '日常分享', 1465662542308495361, 2, 'daily_sharing', NULL, 'N', 'system', '0', b'0', '2022-12-13 00:16:11', 1, '2022-12-26 17:57:51', 1);
INSERT INTO `campus_category` (`category_id`, `category_name`, `parent_id`, `order_num`, `slug`, `description`, `type`, `icon`, `status`, `del_flag`, `create_time`, `create_user`, `update_time`, `update_user`) VALUES (1644302032332709889, '交友', 123, 2, 'make_friends', NULL, 'N', 'system', '0', b'0', '2023-04-07 19:32:09', 1, '2023-04-07 19:32:08', 1);
INSERT INTO `campus_category` (`category_id`, `category_name`, `parent_id`, `order_num`, `slug`, `description`, `type`, `icon`, `status`, `del_flag`, `create_time`, `create_user`, `update_time`, `update_user`) VALUES (1644302999660847105, '买卖墙', 0, 4, 'buy_and_sell', NULL, 'N', 'system', '0', b'0', '2023-04-07 19:35:59', 1, '2023-04-07 19:35:59', 1);
INSERT INTO `campus_category` (`category_id`, `category_name`, `parent_id`, `order_num`, `slug`, `description`, `type`, `icon`, `status`, `del_flag`, `create_time`, `create_user`, `update_time`, `update_user`) VALUES (1644303286433800193, '求购', 1644302999660847105, 1, 'want_to_buy', NULL, 'N', 'system', '0', b'0', '2023-04-07 19:37:08', 1, '2023-04-07 19:37:07', 1);
INSERT INTO `campus_category` (`category_id`, `category_name`, `parent_id`, `order_num`, `slug`, `description`, `type`, `icon`, `status`, `del_flag`, `create_time`, `create_user`, `update_time`, `update_user`) VALUES (1644303516352962562, '出售', 1644302999660847105, 2, 'sell', NULL, 'N', 'system', '0', b'0', '2023-04-07 19:38:03', 1, '2023-04-07 19:38:02', 1);
INSERT INTO `campus_category` (`category_id`, `category_name`, `parent_id`, `order_num`, `slug`, `description`, `type`, `icon`, `status`, `del_flag`, `create_time`, `create_user`, `update_time`, `update_user`) VALUES (1644309509791080449, '综合墙', 0, 6, 'synthesize', NULL, 'N', 'system', '0', b'0', '2023-04-07 20:01:52', 1, '2023-04-07 20:01:51', NULL);
INSERT INTO `campus_category` (`category_id`, `category_name`, `parent_id`, `order_num`, `slug`, `description`, `type`, `icon`, `status`, `del_flag`, `create_time`, `create_user`, `update_time`, `update_user`) VALUES (1644309673171804161, '实习兼职', 1644309509791080449, 1, 'Internship_part-time_job', NULL, 'N', 'system', '0', b'0', '2023-04-07 20:02:31', 1, '2023-04-07 20:02:30', 1);
INSERT INTO `campus_category` (`category_id`, `category_name`, `parent_id`, `order_num`, `slug`, `description`, `type`, `icon`, `status`, `del_flag`, `create_time`, `create_user`, `update_time`, `update_user`) VALUES (1644309825320181762, '吐槽', 1644309509791080449, 2, 'roast', NULL, 'N', NULL, '0', b'0', '2023-04-07 20:03:07', 1, '2023-04-07 20:03:06', 1);
COMMIT;

-- ----------------------------
-- Table structure for campus_comment
-- ----------------------------
DROP TABLE IF EXISTS `campus_comment`;
CREATE TABLE `campus_comment` (
  `comment_id` bigint NOT NULL COMMENT '评论主键',
  `parent_id` bigint DEFAULT '0' COMMENT '上级id',
  `one_level_id` bigint DEFAULT NULL COMMENT '所属的一级评论id',
  `user_id` bigint DEFAULT NULL COMMENT '用户id',
  `to_user_id` bigint DEFAULT NULL COMMENT '所回复目标评论的用户id',
  `content_id` bigint DEFAULT NULL COMMENT '内容id',
  `co_content` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '评论内容',
  `ip` varchar(64) DEFAULT NULL COMMENT '评论时的ip',
  `address` varchar(100) DEFAULT NULL COMMENT '评论时的地址',
  `del_flag` bit(1) DEFAULT b'0' COMMENT '逻辑删除(1:已删除，0:未删除)',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_user` bigint DEFAULT NULL COMMENT '创建人',
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_user` bigint DEFAULT NULL COMMENT '更新人',
  PRIMARY KEY (`comment_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Records of campus_comment
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for campus_content
-- ----------------------------
DROP TABLE IF EXISTS `campus_content`;
CREATE TABLE `campus_content` (
  `content_id` bigint NOT NULL COMMENT '内容主键',
  `user_id` bigint DEFAULT NULL COMMENT '用户id',
  `category_id` bigint DEFAULT NULL COMMENT '类别id',
  `content` varchar(700) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '发表的内容',
  `status` tinyint(1) DEFAULT NULL COMMENT '状态：0审核,1正常,2下架,3拒绝（审核不通过）',
  `type` tinyint(1) DEFAULT NULL COMMENT '类型：0文字,1图片,2视频',
  `file_count` int DEFAULT NULL COMMENT '文件数量',
  `love_count` int DEFAULT '0' COMMENT '点赞数量',
  `is_anonymous` tinyint(1) DEFAULT '0' COMMENT '0不匿名，1匿名',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  `del_flag` bit(1) DEFAULT b'0' COMMENT '逻辑删除(1:已删除，0:未删除)',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_user` bigint DEFAULT NULL COMMENT '创建人',
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_user` bigint DEFAULT NULL COMMENT '更新人',
  PRIMARY KEY (`content_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Records of campus_content
-- ----------------------------
BEGIN;
INSERT INTO `campus_content` (`content_id`, `user_id`, `category_id`, `content`, `status`, `type`, `file_count`, `love_count`, `is_anonymous`, `remark`, `del_flag`, `create_time`, `create_user`, `update_time`, `update_user`) VALUES (1, 1, 1449212758636646402, '欢迎使用校园信息墙项目\n开源地址：https://github.com/oddfar/campus\n欢迎大家 Star 和 Fork 支持~', 1, 0, 0, 0, 1, NULL, b'0', '2022-03-05 10:55:04', NULL, '2023-02-26 14:26:33', 1);
INSERT INTO `campus_content` (`content_id`, `user_id`, `category_id`, `content`, `status`, `type`, `file_count`, `love_count`, `is_anonymous`, `remark`, `del_flag`, `create_time`, `create_user`, `update_time`, `update_user`) VALUES (2, 1, 1602336520042287105, 'hello world\nhello world\nhello world\nhello world', 1, 0, 1, 1, 0, NULL, b'0', '2022-12-13 00:01:47', NULL, '2023-12-24 23:53:38', 1);
INSERT INTO `campus_content` (`content_id`, `user_id`, `category_id`, `content`, `status`, `type`, `file_count`, `love_count`, `is_anonymous`, `remark`, `del_flag`, `create_time`, `create_user`, `update_time`, `update_user`) VALUES (3, 1, 1602336520042287105, '你好，welcome\n开源地址：https://github.com/oddfar/campus\n欢迎大家 Star 和 Fork 支持~', 1, 0, 1, 0, 0, NULL, b'0', '2022-12-13 00:01:47', NULL, '2023-12-24 23:53:41', 1);
INSERT INTO `campus_content` (`content_id`, `user_id`, `category_id`, `content`, `status`, `type`, `file_count`, `love_count`, `is_anonymous`, `remark`, `del_flag`, `create_time`, `create_user`, `update_time`, `update_user`) VALUES (1629730419490693121, 1594285543804383234, 1449212758636646402, '你好\n你好\n你好\n你好\n你好\n你好\n你好', 2, 0, 0, 1, 0, NULL, b'1', '2023-02-26 14:29:46', 1594285543804383234, '2023-09-11 11:35:40', 1);
INSERT INTO `campus_content` (`content_id`, `user_id`, `category_id`, `content`, `status`, `type`, `file_count`, `love_count`, `is_anonymous`, `remark`, `del_flag`, `create_time`, `create_user`, `update_time`, `update_user`) VALUES (1635923493036249089, 1594285543804383234, 1449212758636646402, '1232131', 2, 0, 0, 0, 0, NULL, b'1', '2023-03-15 16:38:49', 1594285543804383234, '2023-09-11 11:35:42', 1);
INSERT INTO `campus_content` (`content_id`, `user_id`, `category_id`, `content`, `status`, `type`, `file_count`, `love_count`, `is_anonymous`, `remark`, `del_flag`, `create_time`, `create_user`, `update_time`, `update_user`) VALUES (1635923549986508801, 1594285543804383234, 1602336520042287105, '1111111', 2, 0, 0, 1, 0, NULL, b'1', '2023-03-15 16:39:03', 1594285543804383234, '2023-09-11 11:35:44', 1);
INSERT INTO `campus_content` (`content_id`, `user_id`, `category_id`, `content`, `status`, `type`, `file_count`, `love_count`, `is_anonymous`, `remark`, `del_flag`, `create_time`, `create_user`, `update_time`, `update_user`) VALUES (1644584732895301634, 1594285543804383234, 1449212758636646402, '123', 1, 0, 0, 0, 0, NULL, b'1', '2023-04-08 14:15:30', 1594285543804383234, '2023-04-08 22:26:13', NULL);
INSERT INTO `campus_content` (`content_id`, `user_id`, `category_id`, `content`, `status`, `type`, `file_count`, `love_count`, `is_anonymous`, `remark`, `del_flag`, `create_time`, `create_user`, `update_time`, `update_user`) VALUES (1644638851867873282, 1594285543804383234, 1449212758636646402, '1', 2, 1, 1, 0, 0, NULL, b'1', '2023-04-08 17:50:33', 1594285543804383234, '2023-09-11 11:35:01', 1);
INSERT INTO `campus_content` (`content_id`, `user_id`, `category_id`, `content`, `status`, `type`, `file_count`, `love_count`, `is_anonymous`, `remark`, `del_flag`, `create_time`, `create_user`, `update_time`, `update_user`) VALUES (1644645933589467137, 1594285543804383234, 1449212758636646402, '2', 2, 1, 2, 0, 0, NULL, b'1', '2023-04-08 18:18:41', 1594285543804383234, '2023-09-11 11:35:03', 1);
INSERT INTO `campus_content` (`content_id`, `user_id`, `category_id`, `content`, `status`, `type`, `file_count`, `love_count`, `is_anonymous`, `remark`, `del_flag`, `create_time`, `create_user`, `update_time`, `update_user`) VALUES (1644708092667236354, 1594285543804383234, 1449212758636646402, '3', 2, 1, 3, 0, 0, NULL, b'1', '2023-04-08 22:25:41', 1594285543804383234, '2023-09-11 11:35:04', 1);
INSERT INTO `campus_content` (`content_id`, `user_id`, `category_id`, `content`, `status`, `type`, `file_count`, `love_count`, `is_anonymous`, `remark`, `del_flag`, `create_time`, `create_user`, `update_time`, `update_user`) VALUES (1645955280757866497, 1, 1602336520042287105, '把回忆拼好给你', 1, 2, 1, 2, 0, NULL, b'1', '2023-04-12 09:01:34', 1, '2024-01-07 12:05:07', 1);
INSERT INTO `campus_content` (`content_id`, `user_id`, `category_id`, `content`, `status`, `type`, `file_count`, `love_count`, `is_anonymous`, `remark`, `del_flag`, `create_time`, `create_user`, `update_time`, `update_user`) VALUES (1645961851969748993, 1, 1602336520042287105, '柯基', 1, 2, 1, 1, 0, NULL, b'1', '2023-04-12 09:27:41', 1, '2024-01-07 12:05:09', 1594285543804383234);
INSERT INTO `campus_content` (`content_id`, `user_id`, `category_id`, `content`, `status`, `type`, `file_count`, `love_count`, `is_anonymous`, `remark`, `del_flag`, `create_time`, `create_user`, `update_time`, `update_user`) VALUES (1656224490817863682, 1, 1449212758636646402, '1', 1, 2, 1, 0, 0, NULL, b'1', '2023-05-10 17:07:44', 1, '2024-01-07 12:05:12', 1);
INSERT INTO `campus_content` (`content_id`, `user_id`, `category_id`, `content`, `status`, `type`, `file_count`, `love_count`, `is_anonymous`, `remark`, `del_flag`, `create_time`, `create_user`, `update_time`, `update_user`) VALUES (1674977777075437569, 2, 1602336520042287105, '欢迎大家报考山河大学，我在山河大等你！', 1, 1, 3, 888, 0, NULL, b'1', '2023-07-01 11:26:36', 2, '2024-01-07 12:05:14', 1);
INSERT INTO `campus_content` (`content_id`, `user_id`, `category_id`, `content`, `status`, `type`, `file_count`, `love_count`, `is_anonymous`, `remark`, `del_flag`, `create_time`, `create_user`, `update_time`, `update_user`) VALUES (1674980529281253378, 2, 1602336520042287105, '山河大学@柴柴写字', 2, 1, 1, 666, 0, NULL, b'1', '2023-07-01 11:17:32', 2, '2024-01-07 12:04:59', 1);
INSERT INTO `campus_content` (`content_id`, `user_id`, `category_id`, `content`, `status`, `type`, `file_count`, `love_count`, `is_anonymous`, `remark`, `del_flag`, `create_time`, `create_user`, `update_time`, `update_user`) VALUES (1674988784673964034, 2, 1602336520042287105, '山河大学记录片传奇@不张常', 2, 2, 1, 999, 0, NULL, b'1', '2023-07-01 11:50:21', 2, '2024-01-07 12:04:57', 1);
COMMIT;

-- ----------------------------
-- Table structure for campus_content_love
-- ----------------------------
DROP TABLE IF EXISTS `campus_content_love`;
CREATE TABLE `campus_content_love` (
  `user_id` bigint NOT NULL COMMENT '用户id',
  `content_id` bigint NOT NULL COMMENT '文章id',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`user_id`,`content_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Records of campus_content_love
-- ----------------------------
BEGIN;
INSERT INTO `campus_content_love` (`user_id`, `content_id`, `create_time`) VALUES (2, 1645955280757866497, '2023-12-25 00:20:26');
INSERT INTO `campus_content_love` (`user_id`, `content_id`, `create_time`) VALUES (2, 1674977777075437569, '2023-12-24 23:58:59');
INSERT INTO `campus_content_love` (`user_id`, `content_id`, `create_time`) VALUES (1594285543804383234, 2, '2023-02-26 14:33:17');
INSERT INTO `campus_content_love` (`user_id`, `content_id`, `create_time`) VALUES (1594285543804383234, 1629730419490693121, '2023-03-29 16:29:37');
INSERT INTO `campus_content_love` (`user_id`, `content_id`, `create_time`) VALUES (1594285543804383234, 1635923549986508801, '2023-03-29 16:28:22');
INSERT INTO `campus_content_love` (`user_id`, `content_id`, `create_time`) VALUES (1594285543804383234, 1645955280757866497, '2023-05-09 09:09:29');
INSERT INTO `campus_content_love` (`user_id`, `content_id`, `create_time`) VALUES (1594285543804383234, 1645961851969748993, '2023-05-09 09:09:28');
COMMIT;

-- ----------------------------
-- Table structure for campus_content_tag
-- ----------------------------
DROP TABLE IF EXISTS `campus_content_tag`;
CREATE TABLE `campus_content_tag` (
  `content_id` bigint NOT NULL COMMENT '内容id',
  `tag_id` bigint NOT NULL COMMENT '标签id',
  PRIMARY KEY (`content_id`,`tag_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- ----------------------------
-- Records of campus_content_tag
-- ----------------------------
BEGIN;
INSERT INTO `campus_content_tag` (`content_id`, `tag_id`) VALUES (1, 1);
INSERT INTO `campus_content_tag` (`content_id`, `tag_id`) VALUES (1, 2);
INSERT INTO `campus_content_tag` (`content_id`, `tag_id`) VALUES (1, 3);
INSERT INTO `campus_content_tag` (`content_id`, `tag_id`) VALUES (2, 1);
INSERT INTO `campus_content_tag` (`content_id`, `tag_id`) VALUES (2, 2);
COMMIT;

-- ----------------------------
-- Table structure for campus_file
-- ----------------------------
DROP TABLE IF EXISTS `campus_file`;
CREATE TABLE `campus_file` (
  `file_id` bigint NOT NULL,
  `content_id` bigint DEFAULT NULL COMMENT '文章id',
  `user_id` bigint NOT NULL COMMENT '用户id',
  `url` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '储存url',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`file_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Records of campus_file
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for campus_tag
-- ----------------------------
DROP TABLE IF EXISTS `campus_tag`;
CREATE TABLE `campus_tag` (
  `tag_id` bigint NOT NULL COMMENT '标签主键',
  `tag_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '标签名',
  `description` varchar(300) DEFAULT NULL COMMENT '描述',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `del_flag` bit(1) DEFAULT b'0' COMMENT '逻辑删除(1:已删除，0:未删除)',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_user` bigint DEFAULT NULL COMMENT '创建人',
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_user` bigint DEFAULT NULL COMMENT '更新人',
  PRIMARY KEY (`tag_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Records of campus_tag
-- ----------------------------
BEGIN;
INSERT INTO `campus_tag` (`tag_id`, `tag_name`, `description`, `status`, `del_flag`, `create_time`, `create_user`, `update_time`, `update_user`) VALUES (1, '测试标签', '测试', '0', b'0', '2022-11-29 20:03:08', 1, '2022-12-01 18:16:16', NULL);
INSERT INTO `campus_tag` (`tag_id`, `tag_name`, `description`, `status`, `del_flag`, `create_time`, `create_user`, `update_time`, `update_user`) VALUES (2, '梅西', '利昂内尔·梅西（Lionel Messi）\n全名利昂内尔·安德烈斯·梅西·库西蒂尼（Lionel Andrés Messi Cuccitini）\n昵称莱奥·梅西（Leo Messi）', '0', b'0', '2022-11-29 20:03:28', 1, '2023-01-16 20:38:34', 1);
INSERT INTO `campus_tag` (`tag_id`, `tag_name`, `description`, `status`, `del_flag`, `create_time`, `create_user`, `update_time`, `update_user`) VALUES (3, '蔡徐坤', '中国内地男歌手、演员、原创音乐制作人、MV导演', '0', b'0', '2023-01-16 20:12:20', 1, '2023-01-16 20:13:54', 1);
COMMIT;

-- ----------------------------
-- Table structure for social_user
-- ----------------------------
DROP TABLE IF EXISTS `social_user`;
CREATE TABLE `social_user` (
  `social_user_id` bigint NOT NULL AUTO_INCREMENT COMMENT '社会化用户表id\n',
  `uuid` varchar(255) DEFAULT NULL COMMENT '第三方系统的唯一ID',
  `source` varchar(255) DEFAULT NULL COMMENT '第三方用户来源',
  PRIMARY KEY (`social_user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1738958687858704386 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='社会化用户表\n';


-- ----------------------------
-- Table structure for social_user_auth
-- ----------------------------
DROP TABLE IF EXISTS `social_user_auth`;
CREATE TABLE `social_user_auth` (
  `user_id` bigint DEFAULT NULL,
  `social_user_id` bigint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;


-- ----------------------------
-- Table structure for sys_config
-- ----------------------------
DROP TABLE IF EXISTS `sys_config`;
CREATE TABLE `sys_config` (
  `config_id` bigint NOT NULL AUTO_INCREMENT COMMENT '参数主键',
  `config_name` varchar(100) DEFAULT '' COMMENT '参数名称',
  `config_key` varchar(100) DEFAULT '' COMMENT '参数键名',
  `config_value` varchar(500) DEFAULT '' COMMENT '参数键值',
  `config_type` char(1) DEFAULT 'N' COMMENT '系统内置（Y是 N否）',
  `group_code` varchar(100) DEFAULT NULL COMMENT '所属分类的编码',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  `del_flag` bit(1) DEFAULT b'0' COMMENT '逻辑删除(1:已删除，0:未删除)',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_user` bigint DEFAULT NULL COMMENT '创建人',
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_user` bigint DEFAULT NULL COMMENT '更新人',
  PRIMARY KEY (`config_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1637978359153885187 DEFAULT CHARSET=utf8mb3 COMMENT='参数配置表';

-- ----------------------------
-- Records of sys_config
-- ----------------------------
BEGIN;
INSERT INTO `sys_config` (`config_id`, `config_name`, `config_key`, `config_value`, `config_type`, `group_code`, `remark`, `del_flag`, `create_time`, `create_user`, `update_time`, `update_user`) VALUES (1, 'Mac本地文件路径', 'sys.local.profile.mac', '~/uploadPath', 'Y', 'file_config', NULL, b'0', '2022-11-10 14:06:44', 1, '2022-11-10 14:07:49', NULL);
INSERT INTO `sys_config` (`config_id`, `config_name`, `config_key`, `config_value`, `config_type`, `group_code`, `remark`, `del_flag`, `create_time`, `create_user`, `update_time`, `update_user`) VALUES (2, 'Linux本地文件路径', 'sys.local.profile.linux', '/data/uploadPath', 'Y', 'file_config', NULL, b'0', '2022-01-14 10:59:39', NULL, '2022-01-16 14:11:53', 1);
INSERT INTO `sys_config` (`config_id`, `config_name`, `config_key`, `config_value`, `config_type`, `group_code`, `remark`, `del_flag`, `create_time`, `create_user`, `update_time`, `update_user`) VALUES (3, 'Windows本地文件路径', 'sys.local.profile.win', 'D:\\uploadPath', 'Y', 'file_config', NULL, b'0', '2022-01-14 11:00:39', NULL, '2022-01-16 14:11:53', 1);
INSERT INTO `sys_config` (`config_id`, `config_name`, `config_key`, `config_value`, `config_type`, `group_code`, `remark`, `del_flag`, `create_time`, `create_user`, `update_time`, `update_user`) VALUES (4, '默认存储文件的bucket名称', 'sys.file.default.bucket', 'defaultBucket', 'Y', 'file_config', NULL, b'0', '2022-01-14 11:03:10', NULL, '2022-01-16 14:11:54', NULL);
INSERT INTO `sys_config` (`config_id`, `config_name`, `config_key`, `config_value`, `config_type`, `group_code`, `remark`, `del_flag`, `create_time`, `create_user`, `update_time`, `update_user`) VALUES (5, '文件默认部署的环境地址', 'sys.server.deploy.host', 'http://localhost:8160', 'Y', 'file_config', NULL, b'0', '2022-01-16 14:11:45', NULL, '2022-01-16 14:18:55', NULL);
INSERT INTO `sys_config` (`config_id`, `config_name`, `config_key`, `config_value`, `config_type`, `group_code`, `remark`, `del_flag`, `create_time`, `create_user`, `update_time`, `update_user`) VALUES (6, '文件访问是否用nginx映射', 'sys.file.visit.nginx', 'false', 'Y', 'file_config', 'true真，false假', b'0', '2022-01-16 14:40:00', NULL, '2022-01-16 14:40:20', NULL);
INSERT INTO `sys_config` (`config_id`, `config_name`, `config_key`, `config_value`, `config_type`, `group_code`, `remark`, `del_flag`, `create_time`, `create_user`, `update_time`, `update_user`) VALUES (7, '信息墙删除且对应文件也删除', 'sys.file.is.delete', 'false', 'Y', 'file_config', 'true墙和文件都删除，false文件转移到别的目录', b'0', '2022-01-17 14:29:11', NULL, '2022-01-18 15:02:14', NULL);
INSERT INTO `sys_config` (`config_id`, `config_name`, `config_key`, `config_value`, `config_type`, `group_code`, `remark`, `del_flag`, `create_time`, `create_user`, `update_time`, `update_user`) VALUES (8, '文件默认转移的bucket名称', 'sys.file.move.default.bucket', 'moveBucket', 'Y', 'file_config', NULL, b'0', '2022-01-17 14:31:05', NULL, '2022-01-18 15:09:48', NULL);
INSERT INTO `sys_config` (`config_id`, `config_name`, `config_key`, `config_value`, `config_type`, `group_code`, `remark`, `del_flag`, `create_time`, `create_user`, `update_time`, `update_user`) VALUES (101, '阿里云邮件服务accessKeyId', 'sys.aliyun.mail.accessKeyId', '', 'Y', 'mail_config', NULL, b'0', '2022-01-19 10:04:08', NULL, '2022-01-19 10:49:30', NULL);
INSERT INTO `sys_config` (`config_id`, `config_name`, `config_key`, `config_value`, `config_type`, `group_code`, `remark`, `del_flag`, `create_time`, `create_user`, `update_time`, `update_user`) VALUES (102, '阿里云邮件服务accessKeySecret', 'sys.aliyun.mail.accessKeySecret', '', 'Y', 'mail_config', NULL, b'0', '2022-01-19 10:07:28', NULL, '2022-01-19 10:49:31', NULL);
INSERT INTO `sys_config` (`config_id`, `config_name`, `config_key`, `config_value`, `config_type`, `group_code`, `remark`, `del_flag`, `create_time`, `create_user`, `update_time`, `update_user`) VALUES (113, 'smtp服务器地址', 'sys.email.smtp.host', 'smtp.qq.com', 'Y', 'mail_config', NULL, b'0', '2022-01-19 10:33:50', NULL, '2022-01-24 11:28:13', NULL);
INSERT INTO `sys_config` (`config_id`, `config_name`, `config_key`, `config_value`, `config_type`, `group_code`, `remark`, `del_flag`, `create_time`, `create_user`, `update_time`, `update_user`) VALUES (114, 'smtp服务端口', 'sys.email.smtp.port', '465', 'Y', 'mail_config', NULL, b'0', '2022-01-19 10:35:29', NULL, '2022-01-24 11:28:14', NULL);
INSERT INTO `sys_config` (`config_id`, `config_name`, `config_key`, `config_value`, `config_type`, `group_code`, `remark`, `del_flag`, `create_time`, `create_user`, `update_time`, `update_user`) VALUES (115, '邮箱的发送方邮箱', 'sys.email.send.account', '3066693006@qq.com', 'Y', 'mail_config', NULL, b'0', '2022-01-19 10:38:17', NULL, '2022-01-24 11:28:15', NULL);
INSERT INTO `sys_config` (`config_id`, `config_name`, `config_key`, `config_value`, `config_type`, `group_code`, `remark`, `del_flag`, `create_time`, `create_user`, `update_time`, `update_user`) VALUES (116, '邮箱的密码或者授权码', 'sys.email.password', 'xxxxx', 'Y', 'mail_config', NULL, b'0', '2022-01-19 10:07:31', NULL, '2022-01-19 12:02:57', 1);
INSERT INTO `sys_config` (`config_id`, `config_name`, `config_key`, `config_value`, `config_type`, `group_code`, `remark`, `del_flag`, `create_time`, `create_user`, `update_time`, `update_user`) VALUES (117, '邮箱发送时的用户名', 'sys.email.name', '致远', 'Y', 'mail_config', NULL, b'0', '2022-01-19 11:10:47', NULL, '2022-01-24 11:28:19', NULL);
INSERT INTO `sys_config` (`config_id`, `config_name`, `config_key`, `config_value`, `config_type`, `group_code`, `remark`, `del_flag`, `create_time`, `create_user`, `update_time`, `update_user`) VALUES (202, '用户默认头像', 'sys.user.default.avatar', 'https://img0.baidu.com/it/u=1183896628,1403534286&fm=253&fmt=auto&app=138&f=PNG', 'Y', 'sys_config', NULL, b'0', '2022-02-08 11:35:31', NULL, '2022-02-08 11:40:15', 1);
INSERT INTO `sys_config` (`config_id`, `config_name`, `config_key`, `config_value`, `config_type`, `group_code`, `remark`, `del_flag`, `create_time`, `create_user`, `update_time`, `update_user`) VALUES (206, '用户管理-账号初始密码', 'sys.user.initPassword', '123456', 'Y', 'sys_config', '初始化密码 123456', b'0', '2022-11-09 01:41:52', 1, '2022-11-09 15:42:09', NULL);
INSERT INTO `sys_config` (`config_id`, `config_name`, `config_key`, `config_value`, `config_type`, `group_code`, `remark`, `del_flag`, `create_time`, `create_user`, `update_time`, `update_user`) VALUES (220, '全局日志记录', 'sys.log.global.flag', 'true', 'Y', 'sys_config', '全局日志记录，true则所有请求都将记录日志', b'0', '2023-06-07 21:36:00', 1, '2023-06-08 14:44:00', 1);
INSERT INTO `sys_config` (`config_id`, `config_name`, `config_key`, `config_value`, `config_type`, `group_code`, `remark`, `del_flag`, `create_time`, `create_user`, `update_time`, `update_user`) VALUES (300, '验证码类型', 'sys.login.captchaType', 'math', 'Y', 'sys_config', 'math 数组计算 char 字符验证', b'0', '2022-11-10 09:32:40', 1, '2022-11-30 12:14:30', NULL);
INSERT INTO `sys_config` (`config_id`, `config_name`, `config_key`, `config_value`, `config_type`, `group_code`, `remark`, `del_flag`, `create_time`, `create_user`, `update_time`, `update_user`) VALUES (301, '账号自助-验证码开关', 'sys.account.captchaEnabled', 'true', 'Y', 'sys_config', '是否开启验证码功能（true开启，false关闭）', b'0', '2023-02-01 21:48:05', 1, '2023-02-01 21:48:34', NULL);
INSERT INTO `sys_config` (`config_id`, `config_name`, `config_key`, `config_value`, `config_type`, `group_code`, `remark`, `del_flag`, `create_time`, `create_user`, `update_time`, `update_user`) VALUES (302, '账号自助-是否开启用户注册功能', 'sys.account.registerUser', 'true', 'Y', 'sys_config', '是否开启注册用户功能（true开启，false关闭）', b'0', '2023-02-01 21:47:39', 1, '2023-02-01 21:48:31', NULL);
INSERT INTO `sys_config` (`config_id`, `config_name`, `config_key`, `config_value`, `config_type`, `group_code`, `remark`, `del_flag`, `create_time`, `create_user`, `update_time`, `update_user`) VALUES (1621419076555640833, '绑定邮箱模板', 'campus.mail.bindTemplate', '<h3>您好，#{[userName]}</h3><br />请在#{[expiration]}分内点击以下链接完成邮箱验证<br /><a href=\"#{[url]}\">#{[url]}</a>', 'Y', 'campus_config', '#{[userName]}用户，#{[url]}邮箱验证的链接，#{[expiration]}，有效期', b'0', '2023-02-03 16:03:27', 1, '2023-02-03 16:03:27', 1);
INSERT INTO `sys_config` (`config_id`, `config_name`, `config_key`, `config_value`, `config_type`, `group_code`, `remark`, `del_flag`, `create_time`, `create_user`, `update_time`, `update_user`) VALUES (1621419076555640834, '用户匿名头像', 'campus.user.anonymous.image', 'https://gcore.jsdelivr.net/gh/oddfar/static/campus/image/anonymous.jpeg', 'Y', 'campus_config', NULL, b'0', '2022-02-08 11:36:36', NULL, '2023-02-21 08:33:07', 1);
INSERT INTO `sys_config` (`config_id`, `config_name`, `config_key`, `config_value`, `config_type`, `group_code`, `remark`, `del_flag`, `create_time`, `create_user`, `update_time`, `update_user`) VALUES (1637978152848654338, '微信小程序APPID', 'campus.wxmp.appid', 'XXXXX', 'Y', 'campus_config', NULL, b'0', '2023-03-21 08:43:18', 1, '2023-04-08 23:50:47', 1);
INSERT INTO `sys_config` (`config_id`, `config_name`, `config_key`, `config_value`, `config_type`, `group_code`, `remark`, `del_flag`, `create_time`, `create_user`, `update_time`, `update_user`) VALUES (1637978359153885186, '微信小程序SECRET', 'campus.wxmp.secret', 'XXXXXX', 'Y', 'campus_config', NULL, b'0', '2023-03-21 08:44:08', 1, '2023-04-08 23:50:52', 1);
COMMIT;

-- ----------------------------
-- Table structure for sys_dict_data
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_data`;
CREATE TABLE `sys_dict_data` (
  `dict_code` bigint NOT NULL AUTO_INCREMENT COMMENT '字典编码',
  `dict_sort` int DEFAULT '0' COMMENT '字典排序',
  `dict_label` varchar(100) DEFAULT '' COMMENT '字典标签',
  `dict_value` varchar(100) DEFAULT '' COMMENT '字典键值',
  `dict_type` varchar(100) DEFAULT '' COMMENT '字典类型',
  `css_class` varchar(100) DEFAULT NULL COMMENT '样式属性（其他样式扩展）',
  `list_class` varchar(100) DEFAULT NULL COMMENT '表格回显样式',
  `is_default` char(1) DEFAULT 'N' COMMENT '是否默认（Y是 N否）',
  `status` char(1) DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_user` bigint DEFAULT NULL COMMENT '创建者',
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_user` bigint DEFAULT NULL COMMENT '更新者',
  `del_flag` bit(1) DEFAULT b'0' COMMENT '逻辑删除(1:已删除，0:未删除)',
  PRIMARY KEY (`dict_code`)
) ENGINE=InnoDB AUTO_INCREMENT=1621418087714918402 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='字典数据表';

-- ----------------------------
-- Records of sys_dict_data
-- ----------------------------
BEGIN;
INSERT INTO `sys_dict_data` (`dict_code`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`, `list_class`, `is_default`, `status`, `remark`, `create_time`, `create_user`, `update_time`, `update_user`, `del_flag`) VALUES (1, 1, '男', '0', 'sys_user_sex', NULL, 'default', 'Y', '0', '性别男', NULL, NULL, NULL, NULL, b'0');
INSERT INTO `sys_dict_data` (`dict_code`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`, `list_class`, `is_default`, `status`, `remark`, `create_time`, `create_user`, `update_time`, `update_user`, `del_flag`) VALUES (2, 2, '女', '1', 'sys_user_sex', NULL, 'default', 'N', '0', '性别女', NULL, NULL, NULL, NULL, b'0');
INSERT INTO `sys_dict_data` (`dict_code`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`, `list_class`, `is_default`, `status`, `remark`, `create_time`, `create_user`, `update_time`, `update_user`, `del_flag`) VALUES (3, 1, '是', 'Y', 'sys_yes_no', NULL, 'success', 'N', '0', NULL, '2022-11-06 06:37:31', 1, '2022-11-06 06:39:34', 1, b'0');
INSERT INTO `sys_dict_data` (`dict_code`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`, `list_class`, `is_default`, `status`, `remark`, `create_time`, `create_user`, `update_time`, `update_user`, `del_flag`) VALUES (4, 2, '否', 'N', 'sys_yes_no', NULL, 'danger', 'N', '0', NULL, '2022-11-06 06:37:42', 1, '2022-11-06 06:39:34', 1, b'0');
INSERT INTO `sys_dict_data` (`dict_code`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`, `list_class`, `is_default`, `status`, `remark`, `create_time`, `create_user`, `update_time`, `update_user`, `del_flag`) VALUES (6, 1, '正常', '0', 'sys_normal_disable', NULL, 'primary', 'Y', '0', '正常状态', NULL, NULL, NULL, NULL, b'0');
INSERT INTO `sys_dict_data` (`dict_code`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`, `list_class`, `is_default`, `status`, `remark`, `create_time`, `create_user`, `update_time`, `update_user`, `del_flag`) VALUES (7, 2, '停用', '1', 'sys_normal_disable', NULL, 'danger', 'N', '0', '停用状态', NULL, NULL, NULL, NULL, b'0');
INSERT INTO `sys_dict_data` (`dict_code`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`, `list_class`, `is_default`, `status`, `remark`, `create_time`, `create_user`, `update_time`, `update_user`, `del_flag`) VALUES (41, 1, '显示', '0', 'sys_show_hide', NULL, 'primary', 'N', '0', '显示菜单', '2022-12-26 21:49:47', 1, '2022-12-26 21:49:47', NULL, b'0');
INSERT INTO `sys_dict_data` (`dict_code`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`, `list_class`, `is_default`, `status`, `remark`, `create_time`, `create_user`, `update_time`, `update_user`, `del_flag`) VALUES (42, 2, '隐藏', '1', 'sys_show_hide', NULL, 'danger', 'N', '0', '隐藏菜单', '2022-12-26 21:50:10', 1, '2022-12-26 21:50:10', NULL, b'0');
INSERT INTO `sys_dict_data` (`dict_code`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`, `list_class`, `is_default`, `status`, `remark`, `create_time`, `create_user`, `update_time`, `update_user`, `del_flag`) VALUES (101, 1, '系统配置', 'sys_config', 'sys_config_group', NULL, 'primary', 'N', '0', '配置群组的系统配置', '2022-11-06 19:27:23', NULL, '2022-11-06 06:07:20', 1, b'0');
INSERT INTO `sys_dict_data` (`dict_code`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`, `list_class`, `is_default`, `status`, `remark`, `create_time`, `create_user`, `update_time`, `update_user`, `del_flag`) VALUES (102, 2, '邮件配置', 'mail_config', 'sys_config_group', NULL, 'primary', 'N', '0', NULL, '2022-11-06 05:38:04', 1, '2022-11-06 06:07:20', 1, b'0');
INSERT INTO `sys_dict_data` (`dict_code`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`, `list_class`, `is_default`, `status`, `remark`, `create_time`, `create_user`, `update_time`, `update_user`, `del_flag`) VALUES (103, 3, '文件配置', 'file_config', 'sys_config_group', NULL, 'primary', 'N', '0', NULL, '2022-11-06 06:32:45', 1, '2022-11-06 20:32:44', 1, b'0');
INSERT INTO `sys_dict_data` (`dict_code`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`, `list_class`, `is_default`, `status`, `remark`, `create_time`, `create_user`, `update_time`, `update_user`, `del_flag`) VALUES (1597931830248570882, 1, '审核', '0', 'campus_content_status', NULL, 'warning', 'N', '0', NULL, '2022-11-30 20:33:31', 1, '2022-11-30 20:33:31', 1, b'0');
INSERT INTO `sys_dict_data` (`dict_code`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`, `list_class`, `is_default`, `status`, `remark`, `create_time`, `create_user`, `update_time`, `update_user`, `del_flag`) VALUES (1597931939476635650, 2, '正常', '1', 'campus_content_status', NULL, 'success', 'N', '0', NULL, '2022-11-30 20:33:57', 1, '2022-11-30 20:33:57', 1, b'0');
INSERT INTO `sys_dict_data` (`dict_code`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`, `list_class`, `is_default`, `status`, `remark`, `create_time`, `create_user`, `update_time`, `update_user`, `del_flag`) VALUES (1597932004085694466, 3, '下架', '2', 'campus_content_status', NULL, 'danger', 'N', '0', NULL, '2022-11-30 20:34:13', 1, '2022-11-30 20:34:12', 1, b'0');
INSERT INTO `sys_dict_data` (`dict_code`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`, `list_class`, `is_default`, `status`, `remark`, `create_time`, `create_user`, `update_time`, `update_user`, `del_flag`) VALUES (1597932393732341761, 1, '不匿', '0', 'campus_anonymous', NULL, 'primary', 'N', '0', NULL, '2022-11-30 20:35:45', 1, '2022-11-30 20:35:45', NULL, b'0');
INSERT INTO `sys_dict_data` (`dict_code`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`, `list_class`, `is_default`, `status`, `remark`, `create_time`, `create_user`, `update_time`, `update_user`, `del_flag`) VALUES (1597932469577940994, 2, '匿名', '1', 'campus_anonymous', NULL, 'primary', 'N', '0', NULL, '2022-11-30 20:36:04', 1, '2022-11-30 20:36:03', NULL, b'0');
INSERT INTO `sys_dict_data` (`dict_code`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`, `list_class`, `is_default`, `status`, `remark`, `create_time`, `create_user`, `update_time`, `update_user`, `del_flag`) VALUES (1599392185411743745, 0, '文字', '0', 'campus_content_type', NULL, 'primary', 'N', '0', '', '2022-12-04 21:16:27', 1, '2022-12-04 21:16:26', 1, b'0');
INSERT INTO `sys_dict_data` (`dict_code`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`, `list_class`, `is_default`, `status`, `remark`, `create_time`, `create_user`, `update_time`, `update_user`, `del_flag`) VALUES (1599392255200768001, 2, '图片', '1', 'campus_content_type', NULL, 'success', 'N', '0', NULL, '2022-12-04 21:16:44', 1, '2022-12-04 21:16:43', 1, b'0');
INSERT INTO `sys_dict_data` (`dict_code`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`, `list_class`, `is_default`, `status`, `remark`, `create_time`, `create_user`, `update_time`, `update_user`, `del_flag`) VALUES (1599392552258154497, 3, '视频', '2', 'campus_content_type', NULL, 'info', 'N', '0', NULL, '2022-12-04 21:17:54', 1, '2022-12-04 21:17:54', 1, b'0');
INSERT INTO `sys_dict_data` (`dict_code`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`, `list_class`, `is_default`, `status`, `remark`, `create_time`, `create_user`, `update_time`, `update_user`, `del_flag`) VALUES (1609558539133521922, 4, '拒绝', '3', 'campus_content_status', NULL, 'danger', 'N', '0', '审核不通过', '2023-01-01 22:33:55', 1, '2023-01-01 22:33:54', 1, b'0');
INSERT INTO `sys_dict_data` (`dict_code`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`, `list_class`, `is_default`, `status`, `remark`, `create_time`, `create_user`, `update_time`, `update_user`, `del_flag`) VALUES (1621418087714918401, 10, 'campus配置', 'campus_config', 'sys_config_group', NULL, 'primary', 'N', '0', NULL, '2023-02-03 15:59:31', 1, '2023-02-03 15:59:31', NULL, b'0');
COMMIT;

-- ----------------------------
-- Table structure for sys_dict_type
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_type`;
CREATE TABLE `sys_dict_type` (
  `dict_id` bigint NOT NULL AUTO_INCREMENT COMMENT '字典主键',
  `dict_name` varchar(100) DEFAULT '' COMMENT '字典名称',
  `dict_type` varchar(100) DEFAULT '' COMMENT '字典类型',
  `status` char(1) DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '备注',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_user` bigint DEFAULT NULL COMMENT '创建者',
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_user` bigint DEFAULT NULL COMMENT '更新者',
  `del_flag` bit(1) DEFAULT b'0' COMMENT '逻辑删除(1:已删除，0:未删除)',
  PRIMARY KEY (`dict_id`),
  UNIQUE KEY `dict_type` (`dict_type`)
) ENGINE=InnoDB AUTO_INCREMENT=1607372974271246338 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='字典类型表';

-- ----------------------------
-- Records of sys_dict_type
-- ----------------------------
BEGIN;
INSERT INTO `sys_dict_type` (`dict_id`, `dict_name`, `dict_type`, `status`, `remark`, `create_time`, `create_user`, `update_time`, `update_user`, `del_flag`) VALUES (1, '用户性别', 'sys_user_sex', '0', '用户性别列表', '2023-03-09 17:31:52', NULL, '2022-11-06 01:10:21', 1, b'0');
INSERT INTO `sys_dict_type` (`dict_id`, `dict_name`, `dict_type`, `status`, `remark`, `create_time`, `create_user`, `update_time`, `update_user`, `del_flag`) VALUES (2, '系统是否', 'sys_yes_no', '0', '系统是否列表', '2022-11-06 06:37:05', 1, '2022-11-06 20:37:04', 1, b'0');
INSERT INTO `sys_dict_type` (`dict_id`, `dict_name`, `dict_type`, `status`, `remark`, `create_time`, `create_user`, `update_time`, `update_user`, `del_flag`) VALUES (3, '系统开关', 'sys_normal_disable', '0', '系统开关列表', '2023-03-09 17:31:55', NULL, NULL, NULL, b'0');
INSERT INTO `sys_dict_type` (`dict_id`, `dict_name`, `dict_type`, `status`, `remark`, `create_time`, `create_user`, `update_time`, `update_user`, `del_flag`) VALUES (4, '菜单状态', 'sys_show_hide', '0', '菜单状态列表', '2022-12-26 21:49:15', 1, '2022-12-26 21:49:15', NULL, b'0');
INSERT INTO `sys_dict_type` (`dict_id`, `dict_name`, `dict_type`, `status`, `remark`, `create_time`, `create_user`, `update_time`, `update_user`, `del_flag`) VALUES (101, '配置群组', 'sys_config_group', '0', '配置群组', '2022-11-06 05:32:37', 1, '2022-11-06 19:32:37', 1, b'0');
INSERT INTO `sys_dict_type` (`dict_id`, `dict_name`, `dict_type`, `status`, `remark`, `create_time`, `create_user`, `update_time`, `update_user`, `del_flag`) VALUES (1597931685624774657, '校园墙内容状态', 'campus_content_status', '0', '校园墙内容状态', '2022-11-30 20:32:57', 1, '2022-11-30 20:32:56', NULL, b'0');
INSERT INTO `sys_dict_type` (`dict_id`, `dict_name`, `dict_type`, `status`, `remark`, `create_time`, `create_user`, `update_time`, `update_user`, `del_flag`) VALUES (1597932303005351938, '是否匿名', 'campus_anonymous', '0', '校园信息墙是否匿名', '2022-11-30 20:35:24', 1, '2022-11-30 20:35:23', NULL, b'0');
INSERT INTO `sys_dict_type` (`dict_id`, `dict_name`, `dict_type`, `status`, `remark`, `create_time`, `create_user`, `update_time`, `update_user`, `del_flag`) VALUES (1599392072043900930, '校园内类型', 'campus_content_type', '0', '0文字,1图片,2视频', '2022-12-04 21:16:00', 1, '2022-12-04 21:15:59', NULL, b'0');
COMMIT;

-- ----------------------------
-- Table structure for sys_log_login
-- ----------------------------
DROP TABLE IF EXISTS `sys_log_login`;
CREATE TABLE `sys_log_login` (
  `info_id` bigint NOT NULL AUTO_INCREMENT COMMENT '访问ID',
  `user_id` bigint DEFAULT NULL COMMENT '登录成功的用户id\n',
  `user_name` varchar(255) DEFAULT NULL COMMENT '用户账号',
  `ipaddr` varchar(128) DEFAULT '' COMMENT '登录IP地址',
  `login_location` varchar(255) DEFAULT '' COMMENT '登录地点',
  `browser` varchar(50) DEFAULT '' COMMENT '浏览器类型',
  `os` varchar(50) DEFAULT '' COMMENT '操作系统',
  `status` char(1) DEFAULT '0' COMMENT '登录状态（0成功 1失败）',
  `msg` varchar(255) DEFAULT '' COMMENT '提示消息',
  `login_time` datetime DEFAULT NULL COMMENT '访问时间',
  PRIMARY KEY (`info_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1743181335406579715 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='系统访问记录';

-- ----------------------------
-- Records of sys_log_login
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for sys_log_oper
-- ----------------------------
DROP TABLE IF EXISTS `sys_log_oper`;
CREATE TABLE `sys_log_oper` (
  `oper_id` bigint NOT NULL AUTO_INCREMENT COMMENT '日志主键',
  `app_name` varchar(255) DEFAULT NULL COMMENT '服务名称，一般为spring.application.name',
  `log_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '日志名称',
  `log_content` varchar(255) DEFAULT '0' COMMENT '日志记录内容',
  `method` varchar(100) DEFAULT '' COMMENT '方法名称',
  `request_method` varchar(10) DEFAULT '' COMMENT '请求方式',
  `oper_user_id` bigint DEFAULT NULL COMMENT '操作人员user_id',
  `oper_url` varchar(255) DEFAULT '' COMMENT '请求URL',
  `oper_ip` varchar(128) DEFAULT '' COMMENT '主机地址',
  `oper_param` varchar(2000) DEFAULT '' COMMENT '请求参数',
  `json_result` varchar(2000) DEFAULT '' COMMENT '返回参数',
  `status` int DEFAULT '0' COMMENT '操作状态（0正常 1异常）',
  `error_msg` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '错误消息',
  `oper_time` datetime DEFAULT NULL COMMENT '操作时间',
  PRIMARY KEY (`oper_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1743846829323194370 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='操作日志记录';

-- ----------------------------
-- Records of sys_log_oper
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu` (
  `menu_id` bigint NOT NULL AUTO_INCREMENT COMMENT '菜单ID',
  `menu_name` varchar(50) NOT NULL COMMENT '菜单名称',
  `parent_id` bigint DEFAULT '0' COMMENT '父菜单ID',
  `order_num` int DEFAULT '0' COMMENT '显示顺序',
  `path` varchar(200) DEFAULT '' COMMENT '路由地址',
  `component` varchar(255) DEFAULT NULL COMMENT '组件路径',
  `query` varchar(255) DEFAULT NULL COMMENT '路由参数',
  `is_frame` int DEFAULT '1' COMMENT '是否为外链（0是 1否）',
  `is_cache` int DEFAULT '0' COMMENT '是否缓存（0缓存 1不缓存）',
  `menu_type` char(1) DEFAULT '' COMMENT '菜单类型（M目录 C菜单 F按钮）',
  `visible` char(1) DEFAULT '0' COMMENT '菜单状态（0显示 1隐藏）',
  `status` char(1) DEFAULT '0' COMMENT '菜单状态（0正常 1停用）',
  `perms` varchar(100) DEFAULT NULL COMMENT '权限标识',
  `icon` varchar(100) DEFAULT '#' COMMENT '菜单图标',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '备注',
  `del_flag` bit(1) DEFAULT NULL COMMENT '逻辑删除(1:已删除，0:未删除)',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_user` bigint DEFAULT NULL COMMENT '更新者',
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `create_user` bigint DEFAULT NULL COMMENT '创建者',
  PRIMARY KEY (`menu_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1597931148678365187 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='菜单权限表';

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
BEGIN;
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `remark`, `del_flag`, `create_time`, `update_user`, `update_time`, `create_user`) VALUES (1, '系统管理', 0, 1, 'system', NULL, '', 1, 0, 'M', '0', '0', '', 'system', '系统管理目录', b'0', '2022-10-05 15:28:43', 1, '2022-11-14 14:41:50', NULL);
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `remark`, `del_flag`, `create_time`, `update_user`, `update_time`, `create_user`) VALUES (2, '系统监控', 0, 2, 'monitor', NULL, '', 1, 0, 'M', '0', '0', '', 'monitor', '系统监控目录', b'1', '2022-10-05 15:28:43', NULL, NULL, NULL);
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `remark`, `del_flag`, `create_time`, `update_user`, `update_time`, `create_user`) VALUES (3, '系统工具', 0, 3, 'tool', NULL, '', 1, 0, 'M', '0', '0', '', 'tool', '系统工具目录', b'0', '2022-10-05 15:28:43', NULL, NULL, NULL);
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `remark`, `del_flag`, `create_time`, `update_user`, `update_time`, `create_user`) VALUES (4, '源码地址', 0, 10, 'https://github.com/oddfar/campus-example', NULL, '', 0, 0, 'M', '0', '0', '', 'guide', '若依官网地址', b'0', '2022-10-05 15:28:43', 1, '2022-11-21 17:11:40', NULL);
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `remark`, `del_flag`, `create_time`, `update_user`, `update_time`, `create_user`) VALUES (100, '用户管理', 1, 1, 'user', 'system/user/index', '', 1, 0, 'C', '0', '0', 'system:user:list', 'user', '用户管理菜单', b'0', '2022-10-05 15:28:43', NULL, NULL, NULL);
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `remark`, `del_flag`, `create_time`, `update_user`, `update_time`, `create_user`) VALUES (101, '角色管理', 1, 2, 'role', 'system/role/index', '', 1, 0, 'C', '0', '0', 'system:role:list', 'peoples', '角色管理菜单', b'0', '2022-10-05 15:28:43', NULL, NULL, NULL);
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `remark`, `del_flag`, `create_time`, `update_user`, `update_time`, `create_user`) VALUES (102, '菜单管理', 1, 3, 'menu', 'system/menu/index', '', 1, 0, 'C', '0', '0', 'system:menu:list', 'tree-table', '菜单管理菜单', b'0', '2022-10-05 15:28:43', NULL, NULL, NULL);
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `remark`, `del_flag`, `create_time`, `update_user`, `update_time`, `create_user`) VALUES (103, '部门管理', 1, 4, 'dept', 'system/dept/index', '', 1, 0, 'C', '0', '0', 'system:dept:list', 'tree', '部门管理菜单', b'1', '2022-10-05 15:28:43', NULL, NULL, NULL);
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `remark`, `del_flag`, `create_time`, `update_user`, `update_time`, `create_user`) VALUES (104, '岗位管理', 1, 5, 'post', 'system/post/index', '', 1, 0, 'C', '0', '0', 'system:post:list', 'post', '岗位管理菜单', b'1', '2022-10-05 15:28:43', NULL, NULL, NULL);
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `remark`, `del_flag`, `create_time`, `update_user`, `update_time`, `create_user`) VALUES (105, '字典管理', 1, 6, 'dict', 'system/dict/index', '', 1, 0, 'C', '0', '0', 'system:dict:list', 'dict', '字典管理菜单', b'0', '2022-10-05 15:28:43', NULL, NULL, NULL);
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `remark`, `del_flag`, `create_time`, `update_user`, `update_time`, `create_user`) VALUES (106, '参数设置', 1, 7, 'config', 'system/config/index', '', 1, 0, 'C', '0', '0', 'system:config:list', 'edit', '参数设置菜单', b'0', '2022-10-05 15:28:43', NULL, NULL, NULL);
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `remark`, `del_flag`, `create_time`, `update_user`, `update_time`, `create_user`) VALUES (107, '通知公告', 1, 8, 'notice', 'system/notice/index', '', 1, 0, 'C', '0', '0', 'system:notice:list', 'message', '通知公告菜单', b'1', '2022-10-05 15:28:43', NULL, NULL, NULL);
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `remark`, `del_flag`, `create_time`, `update_user`, `update_time`, `create_user`) VALUES (108, '日志管理', 1, 9, 'log', '', '', 1, 0, 'M', '0', '0', '', 'log', '日志管理菜单', b'0', '2022-10-05 15:28:43', NULL, NULL, NULL);
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `remark`, `del_flag`, `create_time`, `update_user`, `update_time`, `create_user`) VALUES (109, '在线用户', 2, 1, 'online', 'monitor/online/index', '', 1, 0, 'C', '0', '0', 'monitor:online:list', 'online', '在线用户菜单', b'1', '2022-10-05 15:28:43', NULL, NULL, NULL);
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `remark`, `del_flag`, `create_time`, `update_user`, `update_time`, `create_user`) VALUES (110, '定时任务', 2, 2, 'job', 'monitor/job/index', '', 1, 0, 'C', '0', '0', 'monitor:job:list', 'job', '定时任务菜单', b'1', '2022-10-05 15:28:43', NULL, NULL, NULL);
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `remark`, `del_flag`, `create_time`, `update_user`, `update_time`, `create_user`) VALUES (111, '数据监控', 2, 3, 'druid', 'monitor/druid/index', '', 1, 0, 'C', '0', '0', 'monitor:druid:list', 'druid', '数据监控菜单', b'1', '2022-10-05 15:28:43', NULL, NULL, NULL);
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `remark`, `del_flag`, `create_time`, `update_user`, `update_time`, `create_user`) VALUES (112, '服务监控', 2, 4, 'server', 'monitor/server/index', '', 1, 0, 'C', '0', '0', 'monitor:server:list', 'server', '服务监控菜单', b'1', '2022-10-05 15:28:43', NULL, NULL, NULL);
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `remark`, `del_flag`, `create_time`, `update_user`, `update_time`, `create_user`) VALUES (113, '缓存监控', 2, 5, 'cache', 'monitor/cache/index', '', 1, 0, 'C', '0', '0', 'monitor:cache:list', 'redis', '缓存监控菜单', b'1', '2022-10-05 15:28:43', NULL, NULL, NULL);
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `remark`, `del_flag`, `create_time`, `update_user`, `update_time`, `create_user`) VALUES (114, '缓存列表', 2, 6, 'cacheList', 'monitor/cache/list', '', 1, 0, 'C', '0', '0', 'monitor:cache:list', 'redis-list', '缓存列表菜单', b'1', '2022-10-05 15:28:43', NULL, NULL, NULL);
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `remark`, `del_flag`, `create_time`, `update_user`, `update_time`, `create_user`) VALUES (115, '表单构建', 3, 1, 'build', 'tool/build/index', '', 1, 0, 'C', '0', '0', 'tool:build:list', 'build', '表单构建菜单', b'0', '2022-10-05 15:28:43', NULL, NULL, NULL);
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `remark`, `del_flag`, `create_time`, `update_user`, `update_time`, `create_user`) VALUES (116, '代码生成', 3, 2, 'gen', 'tool/gen/index', '', 1, 0, 'C', '0', '0', 'tool:gen:list', 'code', '代码生成菜单', b'1', '2022-10-05 15:28:43', NULL, NULL, NULL);
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `remark`, `del_flag`, `create_time`, `update_user`, `update_time`, `create_user`) VALUES (117, '系统接口', 3, 3, 'swagger', 'tool/swagger/index', '', 1, 0, 'C', '0', '0', 'tool:swagger:list', 'swagger', '系统接口菜单', b'0', '2022-10-05 15:28:43', NULL, NULL, NULL);
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `remark`, `del_flag`, `create_time`, `update_user`, `update_time`, `create_user`) VALUES (500, '操作日志', 108, 1, 'operlog', 'monitor/operlog/index', '', 1, 0, 'C', '0', '0', 'monitor:operlog:list', 'form', '操作日志菜单', b'0', '2022-10-05 15:28:43', NULL, NULL, NULL);
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `remark`, `del_flag`, `create_time`, `update_user`, `update_time`, `create_user`) VALUES (501, '登录日志', 108, 2, 'logininfor', 'monitor/logininfor/index', '', 1, 0, 'C', '0', '0', 'monitor:logininfor:list', 'logininfor', '登录日志菜单', b'0', '2022-10-05 15:28:43', NULL, NULL, NULL);
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `remark`, `del_flag`, `create_time`, `update_user`, `update_time`, `create_user`) VALUES (1000, '用户查询', 100, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:user:query', '#', '', b'0', '2022-10-05 15:28:43', NULL, NULL, NULL);
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `remark`, `del_flag`, `create_time`, `update_user`, `update_time`, `create_user`) VALUES (1001, '用户新增', 100, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:user:add', '#', '', b'0', '2022-10-05 15:28:43', NULL, NULL, NULL);
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `remark`, `del_flag`, `create_time`, `update_user`, `update_time`, `create_user`) VALUES (1002, '用户修改', 100, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:user:edit', '#', '', b'0', '2022-10-05 15:28:43', NULL, NULL, NULL);
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `remark`, `del_flag`, `create_time`, `update_user`, `update_time`, `create_user`) VALUES (1003, '用户删除', 100, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:user:remove', '#', '', b'0', '2022-10-05 15:28:43', NULL, NULL, NULL);
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `remark`, `del_flag`, `create_time`, `update_user`, `update_time`, `create_user`) VALUES (1004, '用户导出', 100, 5, '', '', '', 1, 0, 'F', '0', '0', 'system:user:export', '#', '', b'0', '2022-10-05 15:28:43', NULL, NULL, NULL);
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `remark`, `del_flag`, `create_time`, `update_user`, `update_time`, `create_user`) VALUES (1005, '用户导入', 100, 6, '', '', '', 1, 0, 'F', '0', '0', 'system:user:import', '#', '', b'0', '2022-10-05 15:28:43', NULL, NULL, NULL);
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `remark`, `del_flag`, `create_time`, `update_user`, `update_time`, `create_user`) VALUES (1006, '重置密码', 100, 7, '', '', '', 1, 0, 'F', '0', '0', 'system:user:resetPwd', '#', '', b'0', '2022-10-05 15:28:43', NULL, NULL, NULL);
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `remark`, `del_flag`, `create_time`, `update_user`, `update_time`, `create_user`) VALUES (1007, '角色查询', 101, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:role:query', '#', '', b'0', '2022-10-05 15:28:43', NULL, NULL, NULL);
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `remark`, `del_flag`, `create_time`, `update_user`, `update_time`, `create_user`) VALUES (1008, '角色新增', 101, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:role:add', '#', '', b'0', '2022-10-05 15:28:43', NULL, NULL, NULL);
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `remark`, `del_flag`, `create_time`, `update_user`, `update_time`, `create_user`) VALUES (1009, '角色修改', 101, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:role:edit', '#', '', b'0', '2022-10-05 15:28:43', NULL, NULL, NULL);
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `remark`, `del_flag`, `create_time`, `update_user`, `update_time`, `create_user`) VALUES (1010, '角色删除', 101, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:role:remove', '#', '', b'0', '2022-10-05 15:28:43', NULL, NULL, NULL);
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `remark`, `del_flag`, `create_time`, `update_user`, `update_time`, `create_user`) VALUES (1011, '角色导出', 101, 5, '', '', '', 1, 0, 'F', '0', '0', 'system:role:export', '#', '', b'0', '2022-10-05 15:28:43', NULL, NULL, NULL);
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `remark`, `del_flag`, `create_time`, `update_user`, `update_time`, `create_user`) VALUES (1012, '菜单查询', 102, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:menu:query', '#', '', b'0', '2022-10-05 15:28:43', NULL, NULL, NULL);
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `remark`, `del_flag`, `create_time`, `update_user`, `update_time`, `create_user`) VALUES (1013, '菜单新增', 102, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:menu:add', '#', '', b'0', '2022-10-05 15:28:43', NULL, NULL, NULL);
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `remark`, `del_flag`, `create_time`, `update_user`, `update_time`, `create_user`) VALUES (1014, '菜单修改', 102, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:menu:edit', '#', '', b'0', '2022-10-05 15:28:43', NULL, NULL, NULL);
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `remark`, `del_flag`, `create_time`, `update_user`, `update_time`, `create_user`) VALUES (1015, '菜单删除', 102, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:menu:remove', '#', '', b'0', '2022-10-05 15:28:43', NULL, NULL, NULL);
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `remark`, `del_flag`, `create_time`, `update_user`, `update_time`, `create_user`) VALUES (1016, '部门查询', 103, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:dept:query', '#', '', b'1', '2022-10-05 15:28:43', NULL, NULL, NULL);
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `remark`, `del_flag`, `create_time`, `update_user`, `update_time`, `create_user`) VALUES (1017, '部门新增', 103, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:dept:add', '#', '', b'1', '2022-10-05 15:28:43', NULL, NULL, NULL);
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `remark`, `del_flag`, `create_time`, `update_user`, `update_time`, `create_user`) VALUES (1018, '部门修改', 103, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:dept:edit', '#', '', b'1', '2022-10-05 15:28:43', NULL, NULL, NULL);
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `remark`, `del_flag`, `create_time`, `update_user`, `update_time`, `create_user`) VALUES (1019, '部门删除', 103, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:dept:remove', '#', '', b'1', '2022-10-05 15:28:43', NULL, NULL, NULL);
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `remark`, `del_flag`, `create_time`, `update_user`, `update_time`, `create_user`) VALUES (1020, '岗位查询', 104, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:post:query', '#', '', b'1', '2022-10-05 15:28:43', NULL, NULL, NULL);
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `remark`, `del_flag`, `create_time`, `update_user`, `update_time`, `create_user`) VALUES (1021, '岗位新增', 104, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:post:add', '#', '', b'1', '2022-10-05 15:28:43', NULL, NULL, NULL);
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `remark`, `del_flag`, `create_time`, `update_user`, `update_time`, `create_user`) VALUES (1022, '岗位修改', 104, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:post:edit', '#', '', b'1', '2022-10-05 15:28:43', NULL, NULL, NULL);
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `remark`, `del_flag`, `create_time`, `update_user`, `update_time`, `create_user`) VALUES (1023, '岗位删除', 104, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:post:remove', '#', '', b'1', '2022-10-05 15:28:43', NULL, NULL, NULL);
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `remark`, `del_flag`, `create_time`, `update_user`, `update_time`, `create_user`) VALUES (1024, '岗位导出', 104, 5, '', '', '', 1, 0, 'F', '0', '0', 'system:post:export', '#', '', b'1', '2022-10-05 15:28:43', NULL, NULL, NULL);
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `remark`, `del_flag`, `create_time`, `update_user`, `update_time`, `create_user`) VALUES (1025, '字典查询', 105, 1, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:query', '#', '', b'0', '2022-10-05 15:28:43', NULL, NULL, NULL);
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `remark`, `del_flag`, `create_time`, `update_user`, `update_time`, `create_user`) VALUES (1026, '字典新增', 105, 2, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:add', '#', '', b'0', '2022-10-05 15:28:43', NULL, NULL, NULL);
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `remark`, `del_flag`, `create_time`, `update_user`, `update_time`, `create_user`) VALUES (1027, '字典修改', 105, 3, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:edit', '#', '', b'0', '2022-10-05 15:28:43', NULL, NULL, NULL);
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `remark`, `del_flag`, `create_time`, `update_user`, `update_time`, `create_user`) VALUES (1028, '字典删除', 105, 4, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:remove', '#', '', b'0', '2022-10-05 15:28:43', NULL, NULL, NULL);
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `remark`, `del_flag`, `create_time`, `update_user`, `update_time`, `create_user`) VALUES (1029, '字典导出', 105, 5, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:export', '#', '', b'0', '2022-10-05 15:28:43', NULL, NULL, NULL);
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `remark`, `del_flag`, `create_time`, `update_user`, `update_time`, `create_user`) VALUES (1030, '参数查询', 106, 1, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:query', '#', '', b'0', '2022-10-05 15:28:43', NULL, NULL, NULL);
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `remark`, `del_flag`, `create_time`, `update_user`, `update_time`, `create_user`) VALUES (1031, '参数新增', 106, 2, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:add', '#', '', b'0', '2022-10-05 15:28:43', NULL, NULL, NULL);
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `remark`, `del_flag`, `create_time`, `update_user`, `update_time`, `create_user`) VALUES (1032, '参数修改', 106, 3, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:edit', '#', '', b'0', '2022-10-05 15:28:43', NULL, NULL, NULL);
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `remark`, `del_flag`, `create_time`, `update_user`, `update_time`, `create_user`) VALUES (1033, '参数删除', 106, 4, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:remove', '#', '', b'0', '2022-10-05 15:28:43', NULL, NULL, NULL);
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `remark`, `del_flag`, `create_time`, `update_user`, `update_time`, `create_user`) VALUES (1034, '参数导出', 106, 5, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:export', '#', '', b'0', '2022-10-05 15:28:43', NULL, NULL, NULL);
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `remark`, `del_flag`, `create_time`, `update_user`, `update_time`, `create_user`) VALUES (1035, '公告查询', 107, 1, '#', '', '', 1, 0, 'F', '0', '0', 'system:notice:query', '#', '', b'1', '2022-10-05 15:28:43', NULL, NULL, NULL);
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `remark`, `del_flag`, `create_time`, `update_user`, `update_time`, `create_user`) VALUES (1036, '公告新增', 107, 2, '#', '', '', 1, 0, 'F', '0', '0', 'system:notice:add', '#', '', b'1', '2022-10-05 15:28:43', NULL, NULL, NULL);
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `remark`, `del_flag`, `create_time`, `update_user`, `update_time`, `create_user`) VALUES (1037, '公告修改', 107, 3, '#', '', '', 1, 0, 'F', '0', '0', 'system:notice:edit', '#', '', b'1', '2022-10-05 15:28:43', NULL, NULL, NULL);
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `remark`, `del_flag`, `create_time`, `update_user`, `update_time`, `create_user`) VALUES (1038, '公告删除', 107, 4, '#', '', '', 1, 0, 'F', '0', '0', 'system:notice:remove', '#', '', b'1', '2022-10-05 15:28:43', NULL, NULL, NULL);
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `remark`, `del_flag`, `create_time`, `update_user`, `update_time`, `create_user`) VALUES (1039, '操作查询', 500, 1, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:operlog:query', '#', '', b'0', '2022-10-05 15:28:43', NULL, NULL, NULL);
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `remark`, `del_flag`, `create_time`, `update_user`, `update_time`, `create_user`) VALUES (1040, '操作删除', 500, 2, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:operlog:remove', '#', '', b'0', '2022-10-05 15:28:43', NULL, NULL, NULL);
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `remark`, `del_flag`, `create_time`, `update_user`, `update_time`, `create_user`) VALUES (1041, '日志导出', 500, 3, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:operlog:export', '#', '', b'0', '2022-10-05 15:28:43', NULL, NULL, NULL);
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `remark`, `del_flag`, `create_time`, `update_user`, `update_time`, `create_user`) VALUES (1042, '登录查询', 501, 1, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:query', '#', '', b'0', '2022-10-05 15:28:43', NULL, NULL, NULL);
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `remark`, `del_flag`, `create_time`, `update_user`, `update_time`, `create_user`) VALUES (1043, '登录删除', 501, 2, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:remove', '#', '', b'0', '2022-10-05 15:28:43', NULL, NULL, NULL);
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `remark`, `del_flag`, `create_time`, `update_user`, `update_time`, `create_user`) VALUES (1044, '日志导出', 501, 3, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:export', '#', '', b'0', '2022-10-05 15:28:43', NULL, NULL, NULL);
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `remark`, `del_flag`, `create_time`, `update_user`, `update_time`, `create_user`) VALUES (1045, '账户解锁', 501, 4, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:unlock', '#', '', b'0', '2022-10-05 15:28:43', NULL, NULL, NULL);
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `remark`, `del_flag`, `create_time`, `update_user`, `update_time`, `create_user`) VALUES (1046, '在线查询', 109, 1, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:online:query', '#', '', b'1', '2022-10-05 15:28:43', NULL, NULL, NULL);
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `remark`, `del_flag`, `create_time`, `update_user`, `update_time`, `create_user`) VALUES (1047, '批量强退', 109, 2, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:online:batchLogout', '#', '', b'1', '2022-10-05 15:28:43', NULL, NULL, NULL);
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `remark`, `del_flag`, `create_time`, `update_user`, `update_time`, `create_user`) VALUES (1048, '单条强退', 109, 3, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:online:forceLogout', '#', '', b'1', '2022-10-05 15:28:43', NULL, NULL, NULL);
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `remark`, `del_flag`, `create_time`, `update_user`, `update_time`, `create_user`) VALUES (1049, '任务查询', 110, 1, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:query', '#', '', b'1', '2022-10-05 15:28:43', NULL, NULL, NULL);
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `remark`, `del_flag`, `create_time`, `update_user`, `update_time`, `create_user`) VALUES (1050, '任务新增', 110, 2, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:add', '#', '', b'1', '2022-10-05 15:28:43', NULL, NULL, NULL);
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `remark`, `del_flag`, `create_time`, `update_user`, `update_time`, `create_user`) VALUES (1051, '任务修改', 110, 3, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:edit', '#', '', b'1', '2022-10-05 15:28:43', NULL, NULL, NULL);
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `remark`, `del_flag`, `create_time`, `update_user`, `update_time`, `create_user`) VALUES (1052, '任务删除', 110, 4, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:remove', '#', '', b'1', '2022-10-05 15:28:43', NULL, NULL, NULL);
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `remark`, `del_flag`, `create_time`, `update_user`, `update_time`, `create_user`) VALUES (1053, '状态修改', 110, 5, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:changeStatus', '#', '', b'1', '2022-10-05 15:28:43', NULL, NULL, NULL);
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `remark`, `del_flag`, `create_time`, `update_user`, `update_time`, `create_user`) VALUES (1054, '任务导出', 110, 6, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:export', '#', '', b'1', '2022-10-05 15:28:43', NULL, NULL, NULL);
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `remark`, `del_flag`, `create_time`, `update_user`, `update_time`, `create_user`) VALUES (1055, '生成查询', 116, 1, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:query', '#', '', b'1', '2022-10-05 15:28:43', NULL, NULL, NULL);
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `remark`, `del_flag`, `create_time`, `update_user`, `update_time`, `create_user`) VALUES (1056, '生成修改', 116, 2, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:edit', '#', '', b'1', '2022-10-05 15:28:43', NULL, NULL, NULL);
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `remark`, `del_flag`, `create_time`, `update_user`, `update_time`, `create_user`) VALUES (1057, '生成删除', 116, 3, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:remove', '#', '', b'1', '2022-10-05 15:28:43', NULL, NULL, NULL);
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `remark`, `del_flag`, `create_time`, `update_user`, `update_time`, `create_user`) VALUES (1058, '导入代码', 116, 4, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:import', '#', '', b'1', '2022-10-05 15:28:43', NULL, NULL, NULL);
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `remark`, `del_flag`, `create_time`, `update_user`, `update_time`, `create_user`) VALUES (1059, '预览代码', 116, 5, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:preview', '#', '', b'1', '2022-10-05 15:28:43', NULL, NULL, NULL);
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `remark`, `del_flag`, `create_time`, `update_user`, `update_time`, `create_user`) VALUES (1060, '生成代码', 116, 6, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:code', '#', '', b'1', '2022-10-05 15:28:43', NULL, NULL, NULL);
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `remark`, `del_flag`, `create_time`, `update_user`, `update_time`, `create_user`) VALUES (1597918884311171073, '校园信息墙', 0, 5, 'campus', NULL, NULL, 1, 0, 'M', '0', '0', NULL, 'education', '', b'0', '2022-11-30 19:42:05', NULL, '2022-11-30 19:42:04', 1);
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `remark`, `del_flag`, `create_time`, `update_user`, `update_time`, `create_user`) VALUES (1597929330846040066, '内容管理', 1597918884311171073, 2, 'content', 'campus/content/index', NULL, 1, 0, 'C', '0', '0', 'campus:content:list', 'content', '', b'0', '2022-11-30 20:23:35', 1, '2022-11-30 20:23:35', 1);
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `remark`, `del_flag`, `create_time`, `update_user`, `update_time`, `create_user`) VALUES (1597930331497922562, '评论管理', 1597918884311171073, 6, 'comment', 'campus/comment/index', NULL, 1, 0, 'C', '0', '0', 'campus:comment:list', 'comment', '', b'0', '2022-11-30 20:27:34', 1, '2022-11-30 20:27:33', 1);
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `remark`, `del_flag`, `create_time`, `update_user`, `update_time`, `create_user`) VALUES (1597930928431267841, '类别管理', 1597918884311171073, 3, 'category', 'campus/category/index', NULL, 1, 0, 'C', '0', '0', 'campus:category:list', 'category', '', b'0', '2022-11-30 20:29:56', 1, '2022-11-30 20:29:56', 1);
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `remark`, `del_flag`, `create_time`, `update_user`, `update_time`, `create_user`) VALUES (1597931148678365186, '标签管理', 1597918884311171073, 4, 'tag', 'campus/tag/index', NULL, 1, 0, 'C', '0', '0', 'campus:tag:list', 'tag', '', b'0', '2022-11-30 20:30:49', 1, '2022-11-30 20:30:48', 1);
COMMIT;

-- ----------------------------
-- Table structure for sys_resource
-- ----------------------------
DROP TABLE IF EXISTS `sys_resource`;
CREATE TABLE `sys_resource` (
  `resource_id` bigint NOT NULL COMMENT '资源id',
  `app_code` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '应用编码',
  `resource_code` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '资源编码',
  `resource_name` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '资源名称',
  `class_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '类名称',
  `method_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '方法名称',
  `modular_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '资源模块名称，一般为控制器名称',
  `url` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '资源url',
  `http_method` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT 'http请求方法',
  `resource_biz_type` tinyint DEFAULT '1' COMMENT '资源的业务类型：1-业务类，2-系统类',
  `required_permission_flag` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '是否需要鉴权：Y-是，N-否',
  `del_flag` bit(1) DEFAULT b'0' COMMENT '删除标志（0代表存在 1代表删除）',
  `create_user` bigint DEFAULT NULL COMMENT '创建人',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_user` bigint DEFAULT NULL COMMENT '更新人',
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`resource_id`) USING BTREE,
  KEY `RESOURCE_CODE_URL` (`resource_code`,`url`) USING BTREE COMMENT '资源code和url的联合索引'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci ROW_FORMAT=DYNAMIC COMMENT='需要认证的接口资源controller';

-- ----------------------------
-- Records of sys_resource
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role` (
  `role_id` bigint NOT NULL AUTO_INCREMENT COMMENT '角色ID',
  `role_name` varchar(30) NOT NULL COMMENT '角色名称',
  `role_key` varchar(100) NOT NULL COMMENT '角色权限字符串',
  `role_sort` int NOT NULL COMMENT '显示顺序',
  `menu_check_strictly` tinyint(1) DEFAULT '1' COMMENT '菜单树选择项是否关联显示',
  `status` char(1) NOT NULL COMMENT '角色状态（0正常 1停用）',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '备注',
  `del_flag` bit(1) DEFAULT b'0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_user` bigint DEFAULT NULL COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_user` bigint DEFAULT NULL COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1628997651572027395 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='角色信息表';

-- ----------------------------
-- Records of sys_role
-- ----------------------------
BEGIN;
INSERT INTO `sys_role` (`role_id`, `role_name`, `role_key`, `role_sort`, `menu_check_strictly`, `status`, `remark`, `del_flag`, `create_user`, `create_time`, `update_user`, `update_time`) VALUES (1, '超级管理员', 'admin', 1, 1, '0', '超级管理员', b'0', NULL, '2022-10-05 15:28:43', NULL, NULL);
INSERT INTO `sys_role` (`role_id`, `role_name`, `role_key`, `role_sort`, `menu_check_strictly`, `status`, `remark`, `del_flag`, `create_user`, `create_time`, `update_user`, `update_time`) VALUES (2, '普通角色', 'common', 2, 1, '0', '普通角色', b'0', NULL, '2022-10-05 15:28:43', 1, '2022-12-19 22:13:17');
INSERT INTO `sys_role` (`role_id`, `role_name`, `role_key`, `role_sort`, `menu_check_strictly`, `status`, `remark`, `del_flag`, `create_user`, `create_time`, `update_user`, `update_time`) VALUES (1594285449147330561, '普通用户', 'campus:common', 0, 1, '0', NULL, b'0', 1, '2022-11-20 19:04:06', 1, '2023-02-24 13:14:02');
INSERT INTO `sys_role` (`role_id`, `role_name`, `role_key`, `role_sort`, `menu_check_strictly`, `status`, `remark`, `del_flag`, `create_user`, `create_time`, `update_user`, `update_time`) VALUES (1628997165540274178, '审核员', 'campus:auditor', 0, 1, '0', '审核信息墙内容，可以修改信息墙内容', b'0', 1, '2023-02-24 13:56:04', 1, '2023-02-24 14:11:29');
INSERT INTO `sys_role` (`role_id`, `role_name`, `role_key`, `role_sort`, `menu_check_strictly`, `status`, `remark`, `del_flag`, `create_user`, `create_time`, `update_user`, `update_time`) VALUES (1628997651572027394, '浏览用户', 'campus:glance', 0, 1, '0', '只可浏览信息墙，点赞信息墙，不可发表墙和评论', b'0', 1, '2023-02-24 13:58:00', 1, '2023-02-24 14:10:46');
COMMIT;

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu` (
  `role_id` bigint NOT NULL COMMENT '角色ID',
  `menu_id` bigint NOT NULL COMMENT '菜单ID',
  PRIMARY KEY (`role_id`,`menu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='角色和菜单关联表';

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
BEGIN;
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 1);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 4);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 100);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 101);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 1000);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 1001);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 1002);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 1003);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 1004);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 1005);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 1006);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 1007);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 1008);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 1009);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 1010);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 1011);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 1597918884311171073);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 1597929330846040066);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 1597930331497922562);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 1597930928431267841);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 1597931148678365186);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (1594285449147330561, 4);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (1628997165540274178, 1597918884311171073);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (1628997165540274178, 1597929330846040066);
COMMIT;

-- ----------------------------
-- Table structure for sys_role_resource
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_resource`;
CREATE TABLE `sys_role_resource` (
  `resource_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '资源编码',
  `role_id` bigint NOT NULL COMMENT '角色id',
  PRIMARY KEY (`role_id`,`resource_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci ROW_FORMAT=DYNAMIC COMMENT='角色资源关联';

-- ----------------------------
-- Records of sys_role_resource
-- ----------------------------
BEGIN;
INSERT INTO `sys_role_resource` (`resource_code`, `role_id`) VALUES ('campus.comment_info.del_own_comment', 1594285449147330561);
INSERT INTO `sys_role_resource` (`resource_code`, `role_id`) VALUES ('campus.comment_info.get_own_comment_list', 1594285449147330561);
INSERT INTO `sys_role_resource` (`resource_code`, `role_id`) VALUES ('campus.comment_info.to_comment', 1594285449147330561);
INSERT INTO `sys_role_resource` (`resource_code`, `role_id`) VALUES ('campus.content_info.del_content', 1594285449147330561);
INSERT INTO `sys_role_resource` (`resource_code`, `role_id`) VALUES ('campus.content_info.get_own_love_content', 1594285449147330561);
INSERT INTO `sys_role_resource` (`resource_code`, `role_id`) VALUES ('campus.content_info.own_contents', 1594285449147330561);
INSERT INTO `sys_role_resource` (`resource_code`, `role_id`) VALUES ('campus.content_info.to_content', 1594285449147330561);
INSERT INTO `sys_role_resource` (`resource_code`, `role_id`) VALUES ('campus.user_action.image_upload', 1594285449147330561);
INSERT INTO `sys_role_resource` (`resource_code`, `role_id`) VALUES ('campus.user_action.video_upload', 1594285449147330561);
INSERT INTO `sys_role_resource` (`resource_code`, `role_id`) VALUES ('campus.user_action.zan_content', 1594285449147330561);
INSERT INTO `sys_role_resource` (`resource_code`, `role_id`) VALUES ('campus.content.edit', 1628997165540274178);
INSERT INTO `sys_role_resource` (`resource_code`, `role_id`) VALUES ('campus.content.get_info', 1628997165540274178);
INSERT INTO `sys_role_resource` (`resource_code`, `role_id`) VALUES ('campus.content.page', 1628997165540274178);
INSERT INTO `sys_role_resource` (`resource_code`, `role_id`) VALUES ('campus.content.remove', 1628997165540274178);
INSERT INTO `sys_role_resource` (`resource_code`, `role_id`) VALUES ('campus.content_info.del_content', 1628997651572027394);
INSERT INTO `sys_role_resource` (`resource_code`, `role_id`) VALUES ('campus.content_info.get_own_love_content', 1628997651572027394);
INSERT INTO `sys_role_resource` (`resource_code`, `role_id`) VALUES ('campus.content_info.own_contents', 1628997651572027394);
INSERT INTO `sys_role_resource` (`resource_code`, `role_id`) VALUES ('campus.user_action.zan_content', 1628997651572027394);
COMMIT;

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user` (
  `user_id` bigint NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `user_name` varchar(30) NOT NULL COMMENT '用户账号',
  `nick_name` varchar(30) NOT NULL COMMENT '用户昵称',
  `user_type` varchar(2) DEFAULT '00' COMMENT '用户类型（00系统用户）',
  `email` varchar(50) DEFAULT '' COMMENT '用户邮箱',
  `phonenumber` varchar(11) DEFAULT '' COMMENT '手机号码',
  `sex` char(1) DEFAULT '0' COMMENT '用户性别（0男 1女 2未知）',
  `avatar` varchar(100) DEFAULT '' COMMENT '头像地址',
  `password` varchar(100) DEFAULT '' COMMENT '密码',
  `status` char(1) DEFAULT '0' COMMENT '帐号状态（0正常 1停用）',
  `login_ip` varchar(128) DEFAULT '' COMMENT '最后登录IP',
  `login_date` datetime DEFAULT NULL COMMENT '最后登录时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '备注',
  `create_user` bigint DEFAULT NULL COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_user` bigint DEFAULT NULL COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `del_flag` bit(1) DEFAULT NULL COMMENT '逻辑删除(1:已删除，0:未删除)',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1638913642586238979 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='用户信息表';

-- ----------------------------
-- Records of sys_user
-- ----------------------------
BEGIN;
INSERT INTO `sys_user` (`user_id`, `user_name`, `nick_name`, `user_type`, `email`, `phonenumber`, `sex`, `avatar`, `password`, `status`, `login_ip`, `login_date`, `remark`, `create_user`, `create_time`, `update_user`, `update_time`, `del_flag`) VALUES (1, 'admin', 'admin', '00', 'oddfar@163.com', '15888888888', '0', '/profile/avatar/2023/05/10/blob_20230510172840A002.jpeg', '$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2', '0', '127.0.0.1', '2024-01-07 11:58:57', '管理员', 0, '2022-10-05 15:28:43', 1, '2024-01-07 11:58:57', b'0');
INSERT INTO `sys_user` (`user_id`, `user_name`, `nick_name`, `user_type`, `email`, `phonenumber`, `sex`, `avatar`, `password`, `status`, `login_ip`, `login_date`, `remark`, `create_user`, `create_time`, `update_user`, `update_time`, `del_flag`) VALUES (2, 'zhiyuan', '致远', '00', 'a_zhiyuan@163.com', '15666666666', '1', '/profile/avatar/2023/07/01/blob_20230701101949A001.jpeg', '$2a$10$CgOz7rzHEqUDjPO9h6N0Y.ecwB.1HpIXx4UC9DwZU.NY9zyMJ/meS', '0', '127.0.0.1', '2023-12-25 00:23:54', '测试', 0, '2022-10-05 15:28:43', NULL, '2023-12-25 00:23:54', b'0');
COMMIT;

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role` (
  `user_id` bigint NOT NULL COMMENT '用户ID',
  `role_id` bigint NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`user_id`,`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='用户和角色关联表';

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
BEGIN;
INSERT INTO `sys_user_role` (`user_id`, `role_id`) VALUES (1, 1);
INSERT INTO `sys_user_role` (`user_id`, `role_id`) VALUES (2, 2);
INSERT INTO `sys_user_role` (`user_id`, `role_id`) VALUES (2, 1594285449147330561);
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
