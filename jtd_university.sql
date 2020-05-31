/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 50726
 Source Host           : localhost:3306
 Source Schema         : jtd_university

 Target Server Type    : MySQL
 Target Server Version : 50726
 File Encoding         : 65001

 Date: 31/05/2020 21:16:27
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for jtd_admin_config
-- ----------------------------
DROP TABLE IF EXISTS `jtd_admin_config`;
CREATE TABLE `jtd_admin_config`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `jtd_admin_config_name_unique`(`name`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for jtd_admin_menu
-- ----------------------------
DROP TABLE IF EXISTS `jtd_admin_menu`;
CREATE TABLE `jtd_admin_menu`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) NOT NULL DEFAULT 0,
  `order` int(11) NOT NULL DEFAULT 0,
  `title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `uri` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `permission` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 24 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of jtd_admin_menu
-- ----------------------------
INSERT INTO `jtd_admin_menu` VALUES (1, 8, 11, '仪表板', 'fa-bar-chart', '/', NULL, NULL, '2020-05-31 00:14:38');
INSERT INTO `jtd_admin_menu` VALUES (2, 0, 3, '管理员权限', 'fa-tasks', '', NULL, NULL, '2020-05-31 00:14:38');
INSERT INTO `jtd_admin_menu` VALUES (3, 2, 5, '管理员', 'fa-users', 'auth/users', NULL, NULL, '2020-05-31 00:14:38');
INSERT INTO `jtd_admin_menu` VALUES (4, 2, 6, '角色', 'fa-user', 'auth/roles', NULL, NULL, '2020-05-31 00:14:38');
INSERT INTO `jtd_admin_menu` VALUES (5, 2, 7, '权限', 'fa-ban', 'auth/permissions', NULL, NULL, '2020-05-31 00:14:38');
INSERT INTO `jtd_admin_menu` VALUES (6, 2, 4, '菜单管理', 'fa-bars', 'auth/menu', NULL, NULL, '2020-05-31 00:14:38');
INSERT INTO `jtd_admin_menu` VALUES (7, 8, 19, '操作日志', 'fa-history', 'auth/logs', NULL, NULL, '2020-05-31 00:14:17');
INSERT INTO `jtd_admin_menu` VALUES (8, 0, 10, '开发助手', 'fa-gears', '', NULL, '2020-05-30 21:19:47', '2020-05-31 00:14:38');
INSERT INTO `jtd_admin_menu` VALUES (9, 8, 12, 'Scaffold', 'fa-keyboard-o', 'helpers/scaffold', NULL, '2020-05-30 21:19:47', '2020-05-31 00:14:17');
INSERT INTO `jtd_admin_menu` VALUES (10, 8, 14, '脚手架', 'fa-database', 'helpers/terminal/database', NULL, '2020-05-30 21:19:47', '2020-05-31 00:14:17');
INSERT INTO `jtd_admin_menu` VALUES (11, 8, 15, 'artisan', 'fa-terminal', 'helpers/terminal/artisan', NULL, '2020-05-30 21:19:47', '2020-05-31 00:14:17');
INSERT INTO `jtd_admin_menu` VALUES (12, 8, 13, '路由', 'fa-list-alt', 'helpers/routes', NULL, '2020-05-30 21:19:47', '2020-05-31 00:14:17');
INSERT INTO `jtd_admin_menu` VALUES (13, 8, 16, '日志查看器', 'fa-database', 'logs', NULL, '2020-05-30 21:25:57', '2020-05-31 00:14:17');
INSERT INTO `jtd_admin_menu` VALUES (14, 0, 8, '系统配置', 'fa-toggle-on', 'config', NULL, '2020-05-30 21:28:24', '2020-05-31 00:14:38');
INSERT INTO `jtd_admin_menu` VALUES (15, 0, 9, '媒体管理', 'fa-file', 'media', NULL, '2020-05-30 21:29:42', '2020-05-31 00:14:38');
INSERT INTO `jtd_admin_menu` VALUES (16, 8, 17, 'redis管理', 'fa-database', 'redis', NULL, '2020-05-30 21:33:03', '2020-05-31 00:14:17');
INSERT INTO `jtd_admin_menu` VALUES (22, 0, 1, '系统管理', 'fa-bars', NULL, NULL, '2020-05-31 00:13:46', '2020-05-31 00:14:17');
INSERT INTO `jtd_admin_menu` VALUES (23, 22, 2, 'Banner', 'fa-bars', '/banner', NULL, '2020-05-31 00:14:05', '2020-05-31 00:14:17');
INSERT INTO `jtd_admin_menu` VALUES (20, 8, 18, 'Env管理', 'fa-gears', 'env-manager', NULL, '2020-05-30 22:05:31', '2020-05-31 00:14:17');

-- ----------------------------
-- Table structure for jtd_admin_operation_log
-- ----------------------------
DROP TABLE IF EXISTS `jtd_admin_operation_log`;
CREATE TABLE `jtd_admin_operation_log`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `path` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `method` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `ip` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `input` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `jtd_admin_operation_log_user_id_index`(`user_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of jtd_admin_operation_log
-- ----------------------------
INSERT INTO `jtd_admin_operation_log` VALUES (1, 1, 'admin', 'GET', '127.0.0.1', '[]', '2020-05-30 13:07:20', '2020-05-30 13:07:20');
INSERT INTO `jtd_admin_operation_log` VALUES (2, 1, 'admin', 'GET', '127.0.0.1', '[]', '2020-05-30 21:10:08', '2020-05-30 21:10:08');
INSERT INTO `jtd_admin_operation_log` VALUES (3, 1, 'admin', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-05-30 21:10:13', '2020-05-30 21:10:13');

-- ----------------------------
-- Table structure for jtd_admin_permissions
-- ----------------------------
DROP TABLE IF EXISTS `jtd_admin_permissions`;
CREATE TABLE `jtd_admin_permissions`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `http_method` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `http_path` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `jtd_admin_permissions_name_unique`(`name`) USING BTREE,
  UNIQUE INDEX `jtd_admin_permissions_slug_unique`(`slug`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 11 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of jtd_admin_permissions
-- ----------------------------
INSERT INTO `jtd_admin_permissions` VALUES (1, 'All permission', '*', '', '*', NULL, NULL);
INSERT INTO `jtd_admin_permissions` VALUES (2, 'Dashboard', 'dashboard', 'GET', '/', NULL, NULL);
INSERT INTO `jtd_admin_permissions` VALUES (3, 'Login', 'auth.login', '', '/auth/login\r\n/auth/logout', NULL, NULL);
INSERT INTO `jtd_admin_permissions` VALUES (4, 'User setting', 'auth.setting', 'GET,PUT', '/auth/setting', NULL, NULL);
INSERT INTO `jtd_admin_permissions` VALUES (5, 'Auth management', 'auth.management', '', '/auth/roles\r\n/auth/permissions\r\n/auth/menu\r\n/auth/logs', NULL, NULL);
INSERT INTO `jtd_admin_permissions` VALUES (6, 'Admin helpers', 'ext.helpers', '', '/helpers/*', '2020-05-30 21:19:47', '2020-05-30 21:19:47');
INSERT INTO `jtd_admin_permissions` VALUES (7, 'Logs', 'ext.log-viewer', '', '/logs*', '2020-05-30 21:25:57', '2020-05-30 21:25:57');
INSERT INTO `jtd_admin_permissions` VALUES (8, 'Admin Config', 'ext.config', '', '/config*', '2020-05-30 21:28:24', '2020-05-30 21:28:24');
INSERT INTO `jtd_admin_permissions` VALUES (9, 'Media manager', 'ext.media-manager', '', '/media*', '2020-05-30 21:29:42', '2020-05-30 21:29:42');
INSERT INTO `jtd_admin_permissions` VALUES (10, 'Redis Manager', 'ext.redis-manager', '', '/redis*', '2020-05-30 21:33:03', '2020-05-30 21:33:03');

-- ----------------------------
-- Table structure for jtd_admin_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `jtd_admin_role_menu`;
CREATE TABLE `jtd_admin_role_menu`  (
  `role_id` int(11) NOT NULL,
  `menu_id` int(11) NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  INDEX `jtd_admin_role_menu_role_id_menu_id_index`(`role_id`, `menu_id`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Records of jtd_admin_role_menu
-- ----------------------------
INSERT INTO `jtd_admin_role_menu` VALUES (1, 2, NULL, NULL);

-- ----------------------------
-- Table structure for jtd_admin_role_permissions
-- ----------------------------
DROP TABLE IF EXISTS `jtd_admin_role_permissions`;
CREATE TABLE `jtd_admin_role_permissions`  (
  `role_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  INDEX `jtd_admin_role_permissions_role_id_permission_id_index`(`role_id`, `permission_id`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Records of jtd_admin_role_permissions
-- ----------------------------
INSERT INTO `jtd_admin_role_permissions` VALUES (1, 1, NULL, NULL);

-- ----------------------------
-- Table structure for jtd_admin_role_users
-- ----------------------------
DROP TABLE IF EXISTS `jtd_admin_role_users`;
CREATE TABLE `jtd_admin_role_users`  (
  `role_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  INDEX `jtd_admin_role_users_role_id_user_id_index`(`role_id`, `user_id`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Records of jtd_admin_role_users
-- ----------------------------
INSERT INTO `jtd_admin_role_users` VALUES (1, 1, NULL, NULL);

-- ----------------------------
-- Table structure for jtd_admin_roles
-- ----------------------------
DROP TABLE IF EXISTS `jtd_admin_roles`;
CREATE TABLE `jtd_admin_roles`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `jtd_admin_roles_name_unique`(`name`) USING BTREE,
  UNIQUE INDEX `jtd_admin_roles_slug_unique`(`slug`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of jtd_admin_roles
-- ----------------------------
INSERT INTO `jtd_admin_roles` VALUES (1, 'Administrator', 'administrator', '2020-05-30 12:58:26', '2020-05-30 12:58:26');

-- ----------------------------
-- Table structure for jtd_admin_user_permissions
-- ----------------------------
DROP TABLE IF EXISTS `jtd_admin_user_permissions`;
CREATE TABLE `jtd_admin_user_permissions`  (
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  INDEX `jtd_admin_user_permissions_user_id_permission_id_index`(`user_id`, `permission_id`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Table structure for jtd_admin_users
-- ----------------------------
DROP TABLE IF EXISTS `jtd_admin_users`;
CREATE TABLE `jtd_admin_users`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `username` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `avatar` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `jtd_admin_users_username_unique`(`username`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of jtd_admin_users
-- ----------------------------
INSERT INTO `jtd_admin_users` VALUES (1, 'admin', '$2y$10$vhqWBWI24PNYOETRjRACCuW5EFzDR28Za1lSsNr1hbzlF6xlQd1NW', 'Administrator', NULL, 'vqzK7Qb7qe4bOHIANjK501j1k6v6iUHBaEUC0g02qVAWKaDJWA6KYQNbN7Ze', '2020-05-30 12:58:26', '2020-05-30 12:58:26');

-- ----------------------------
-- Table structure for jtd_banner
-- ----------------------------
DROP TABLE IF EXISTS `jtd_banner`;
CREATE TABLE `jtd_banner`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '标题',
  `img` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '图形地址',
  `description` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '描述',
  `jump_url` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '跳转地址',
  `jump_type` tinyint(1) NOT NULL DEFAULT 1 COMMENT '跳转方式',
  `sorts` tinyint(1) NOT NULL COMMENT '排序',
  `status` tinyint(1) NOT NULL COMMENT '状态',
  `created_at` timestamp(0) NULL DEFAULT NULL COMMENT '创建时间',
  `updated_at` timestamp(0) NULL DEFAULT NULL COMMENT '更新时间',
  `release_at` timestamp(0) NULL DEFAULT NULL COMMENT '发布时间',
  `deleted_at` timestamp(0) NULL DEFAULT NULL COMMENT '软删除时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_status_sort`(`status`, `sorts`) USING BTREE COMMENT '索引'
) ENGINE = MyISAM AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of jtd_banner
-- ----------------------------
INSERT INTO `jtd_banner` VALUES (1, '云互动', 'images/9df1d7bbb4d5a51f8ecd8ac7ea2e60ee.jpg', '移动营销实战神器，极简操作  效果好  费用低', 'https://www.jvtd.cn/wyjhudong/', 0, 1, 1, '2020-05-31 01:04:55', '2020-05-31 03:24:25', '2020-05-31 03:24:25', NULL);
INSERT INTO `jtd_banner` VALUES (2, '云互动2', 'images/9419c016e1899d6f66667e78768f6f39.jpg', '移动营销实战神器，极简操作  效果好  费用低', 'https://www.jvtd.cn/wyjhudong/', 1, 2, 1, '2020-05-31 01:18:51', '2020-05-31 03:25:52', '2020-05-31 03:25:52', NULL);
INSERT INTO `jtd_banner` VALUES (3, '云互动3', 'images/bafd8f363052506f32c9a9d44aabf0c1.jpg', '移动营销实战神器，极简操作  效果好  费用低', 'https://www.jvtd.cn/wyjhudong/', 0, 3, 0, '2020-05-31 01:34:59', '2020-05-31 03:36:03', NULL, '2020-05-31 01:48:53');
INSERT INTO `jtd_banner` VALUES (4, '云互动', 'images/862809e1f653baf19e40a98a9f50dcc2.jpg', '移动营销实战神器，极简操作  效果好  费用低', 'https://www.jvtd.cn/wyjhudong/', 1, 4, 1, '2020-05-31 01:39:21', '2020-05-31 03:25:59', '2020-05-31 03:25:59', NULL);
INSERT INTO `jtd_banner` VALUES (5, '云互动4', 'images/862809e1f653baf19e40a98a9f50dcc2.jpg', '移动营销实战神器，极简操作  效果好  费用低', 'https://www.jvtd.cn/wyjhudong/', 1, 4, 1, '2020-05-31 02:02:58', '2020-05-31 03:25:56', '2020-05-31 03:25:56', NULL);

-- ----------------------------
-- Table structure for jtd_failed_jobs
-- ----------------------------
DROP TABLE IF EXISTS `jtd_failed_jobs`;
CREATE TABLE `jtd_failed_jobs`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `connection` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for jtd_migrations
-- ----------------------------
DROP TABLE IF EXISTS `jtd_migrations`;
CREATE TABLE `jtd_migrations`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `migration` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of jtd_migrations
-- ----------------------------
INSERT INTO `jtd_migrations` VALUES (1, '2014_10_12_000000_create_users_table', 1);
INSERT INTO `jtd_migrations` VALUES (2, '2016_01_04_173148_create_admin_tables', 1);
INSERT INTO `jtd_migrations` VALUES (3, '2019_08_19_000000_create_failed_jobs_table', 1);
INSERT INTO `jtd_migrations` VALUES (4, '2017_07_17_040159_create_config_table', 2);
INSERT INTO `jtd_migrations` VALUES (5, '2020_05_31_000022_create_banner_table', 3);

-- ----------------------------
-- Table structure for jtd_users
-- ----------------------------
DROP TABLE IF EXISTS `jtd_users`;
CREATE TABLE `jtd_users`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp(0) NULL DEFAULT NULL,
  `password` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `jtd_users_email_unique`(`email`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

SET FOREIGN_KEY_CHECKS = 1;
