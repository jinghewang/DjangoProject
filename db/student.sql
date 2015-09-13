/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50617
Source Host           : localhost:3306
Source Database       : student

Target Server Type    : MYSQL
Target Server Version : 50617
File Encoding         : 65001

Date: 2015-09-14 00:37:33
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for auth_group
-- ----------------------------
DROP TABLE IF EXISTS `auth_group`;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_group
-- ----------------------------

-- ----------------------------
-- Table structure for auth_group_permissions
-- ----------------------------
DROP TABLE IF EXISTS `auth_group_permissions`;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `group_id` (`group_id`,`permission_id`),
  KEY `auth_group_permissi_permission_id_23962d04_fk_auth_permission_id` (`permission_id`),
  CONSTRAINT `auth_group_permissions_group_id_58c48ba9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_group_permissi_permission_id_23962d04_fk_auth_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_group_permissions
-- ----------------------------

-- ----------------------------
-- Table structure for auth_permission
-- ----------------------------
DROP TABLE IF EXISTS `auth_permission`;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `content_type_id` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permissi_content_type_id_51277a81_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_permission
-- ----------------------------
INSERT INTO `auth_permission` VALUES ('1', 'Can add log entry', '1', 'add_logentry');
INSERT INTO `auth_permission` VALUES ('2', 'Can change log entry', '1', 'change_logentry');
INSERT INTO `auth_permission` VALUES ('3', 'Can delete log entry', '1', 'delete_logentry');
INSERT INTO `auth_permission` VALUES ('4', 'Can add permission', '2', 'add_permission');
INSERT INTO `auth_permission` VALUES ('5', 'Can change permission', '2', 'change_permission');
INSERT INTO `auth_permission` VALUES ('6', 'Can delete permission', '2', 'delete_permission');
INSERT INTO `auth_permission` VALUES ('7', 'Can add group', '3', 'add_group');
INSERT INTO `auth_permission` VALUES ('8', 'Can change group', '3', 'change_group');
INSERT INTO `auth_permission` VALUES ('9', 'Can delete group', '3', 'delete_group');
INSERT INTO `auth_permission` VALUES ('10', 'Can add user', '4', 'add_user');
INSERT INTO `auth_permission` VALUES ('11', 'Can change user', '4', 'change_user');
INSERT INTO `auth_permission` VALUES ('12', 'Can delete user', '4', 'delete_user');
INSERT INTO `auth_permission` VALUES ('13', 'Can add content type', '5', 'add_contenttype');
INSERT INTO `auth_permission` VALUES ('14', 'Can change content type', '5', 'change_contenttype');
INSERT INTO `auth_permission` VALUES ('15', 'Can delete content type', '5', 'delete_contenttype');
INSERT INTO `auth_permission` VALUES ('16', 'Can add session', '6', 'add_session');
INSERT INTO `auth_permission` VALUES ('17', 'Can change session', '6', 'change_session');
INSERT INTO `auth_permission` VALUES ('18', 'Can delete session', '6', 'delete_session');
INSERT INTO `auth_permission` VALUES ('19', 'Can add student', '7', 'add_student');
INSERT INTO `auth_permission` VALUES ('20', 'Can change student', '7', 'change_student');
INSERT INTO `auth_permission` VALUES ('21', 'Can delete student', '7', 'delete_student');
INSERT INTO `auth_permission` VALUES ('22', 'Can add book', '8', 'add_book');
INSERT INTO `auth_permission` VALUES ('23', 'Can change book', '8', 'change_book');
INSERT INTO `auth_permission` VALUES ('24', 'Can delete book', '8', 'delete_book');
INSERT INTO `auth_permission` VALUES ('25', 'Can add question', '9', 'add_question');
INSERT INTO `auth_permission` VALUES ('26', 'Can change question', '9', 'change_question');
INSERT INTO `auth_permission` VALUES ('27', 'Can delete question', '9', 'delete_question');
INSERT INTO `auth_permission` VALUES ('28', 'Can add choice', '10', 'add_choice');
INSERT INTO `auth_permission` VALUES ('29', 'Can change choice', '10', 'change_choice');
INSERT INTO `auth_permission` VALUES ('30', 'Can delete choice', '10', 'delete_choice');
INSERT INTO `auth_permission` VALUES ('31', 'Can add account', '11', 'add_account');
INSERT INTO `auth_permission` VALUES ('32', 'Can change account', '11', 'change_account');
INSERT INTO `auth_permission` VALUES ('33', 'Can delete account', '11', 'delete_account');

-- ----------------------------
-- Table structure for auth_user
-- ----------------------------
DROP TABLE IF EXISTS `auth_user`;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(30) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_user
-- ----------------------------
INSERT INTO `auth_user` VALUES ('1', 'pbkdf2_sha256$20000$9QDtUwyuIsix$ASstLHt2zw8HMPB8+2qur1dPG2RRs7c+TP8rTMmXuHg=', '2015-09-13 16:08:53', '1', 'admin', '', '', 'admin@vive.net.cn', '1', '1', '2015-09-10 06:38:52');

-- ----------------------------
-- Table structure for auth_user_groups
-- ----------------------------
DROP TABLE IF EXISTS `auth_user_groups`;
CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_30a071c9_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_30a071c9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_24702650_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_user_groups
-- ----------------------------

-- ----------------------------
-- Table structure for auth_user_user_permissions
-- ----------------------------
DROP TABLE IF EXISTS `auth_user_user_permissions`;
CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`,`permission_id`),
  KEY `auth_user_user_perm_permission_id_3d7071f0_fk_auth_permission_id` (`permission_id`),
  CONSTRAINT `auth_user_user_permissions_user_id_7cd7acb6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `auth_user_user_perm_permission_id_3d7071f0_fk_auth_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_user_user_permissions
-- ----------------------------

-- ----------------------------
-- Table structure for bussinesses
-- ----------------------------
DROP TABLE IF EXISTS `bussinesses`;
CREATE TABLE `bussinesses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `business_email` varchar(254) NOT NULL,
  `business_password` varchar(20) NOT NULL,
  `contact_first_name` varchar(30) NOT NULL,
  `contact_last_name` varchar(30) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bussinesses
-- ----------------------------
INSERT INTO `bussinesses` VALUES ('1', 'admin@vive.net.cn', 'admin', 'w', 'jh', '1');

-- ----------------------------
-- Table structure for django_admin_log
-- ----------------------------
DROP TABLE IF EXISTS `django_admin_log`;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin__content_type_id_5151027a_fk_django_content_type_id` (`content_type_id`),
  KEY `django_admin_log_user_id_1c5f563_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_user_id_1c5f563_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `django_admin__content_type_id_5151027a_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of django_admin_log
-- ----------------------------
INSERT INTO `django_admin_log` VALUES ('1', '2015-09-11 14:04:40', '1', 'Book object', '1', '', '8', '1');
INSERT INTO `django_admin_log` VALUES ('2', '2015-09-11 14:08:26', '1', 'Question object', '1', '', '9', '1');
INSERT INTO `django_admin_log` VALUES ('3', '2015-09-11 14:09:24', '2', 'Question object', '1', '', '9', '1');
INSERT INTO `django_admin_log` VALUES ('4', '2015-09-11 14:12:09', '1', 'Choice object', '1', '', '10', '1');
INSERT INTO `django_admin_log` VALUES ('5', '2015-09-11 14:12:25', '2', 'Choice object', '1', '', '10', '1');
INSERT INTO `django_admin_log` VALUES ('6', '2015-09-11 14:12:42', '3', 'Choice object', '1', '', '10', '1');
INSERT INTO `django_admin_log` VALUES ('7', '2015-09-11 14:12:56', '4', 'Choice object', '1', '', '10', '1');
INSERT INTO `django_admin_log` VALUES ('8', '2015-09-11 14:39:08', '2', 'Question object', '2', 'Changed question_text. Added choice \"Choice object\". Changed choice_text for choice \"Choice object\". Changed choice_text for choice \"Choice object\".', '9', '1');
INSERT INTO `django_admin_log` VALUES ('9', '2015-09-11 14:40:10', '1', 'Question object', '2', 'Changed question_text. Added choice \"Choice object\". Added choice \"Choice object\". Added choice \"Choice object\". Added choice \"Choice object\". Changed choice_text for choice \"Choice object\". Changed choice_text for choice \"Choice object\".', '9', '1');

-- ----------------------------
-- Table structure for django_content_type
-- ----------------------------
DROP TABLE IF EXISTS `django_content_type`;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_3ec8c61c_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of django_content_type
-- ----------------------------
INSERT INTO `django_content_type` VALUES ('1', 'admin', 'logentry');
INSERT INTO `django_content_type` VALUES ('3', 'auth', 'group');
INSERT INTO `django_content_type` VALUES ('2', 'auth', 'permission');
INSERT INTO `django_content_type` VALUES ('4', 'auth', 'user');
INSERT INTO `django_content_type` VALUES ('5', 'contenttypes', 'contenttype');
INSERT INTO `django_content_type` VALUES ('6', 'sessions', 'session');
INSERT INTO `django_content_type` VALUES ('11', 'student', 'account');
INSERT INTO `django_content_type` VALUES ('8', 'student', 'book');
INSERT INTO `django_content_type` VALUES ('10', 'student', 'choice');
INSERT INTO `django_content_type` VALUES ('9', 'student', 'question');
INSERT INTO `django_content_type` VALUES ('7', 'student', 'student');

-- ----------------------------
-- Table structure for django_migrations
-- ----------------------------
DROP TABLE IF EXISTS `django_migrations`;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of django_migrations
-- ----------------------------
INSERT INTO `django_migrations` VALUES ('1', 'contenttypes', '0001_initial', '2015-09-10 06:37:31');
INSERT INTO `django_migrations` VALUES ('2', 'auth', '0001_initial', '2015-09-10 06:37:39');
INSERT INTO `django_migrations` VALUES ('3', 'admin', '0001_initial', '2015-09-10 06:37:41');
INSERT INTO `django_migrations` VALUES ('4', 'contenttypes', '0002_remove_content_type_name', '2015-09-10 06:37:43');
INSERT INTO `django_migrations` VALUES ('5', 'auth', '0002_alter_permission_name_max_length', '2015-09-10 06:37:43');
INSERT INTO `django_migrations` VALUES ('6', 'auth', '0003_alter_user_email_max_length', '2015-09-10 06:37:44');
INSERT INTO `django_migrations` VALUES ('7', 'auth', '0004_alter_user_username_opts', '2015-09-10 06:37:44');
INSERT INTO `django_migrations` VALUES ('8', 'auth', '0005_alter_user_last_login_null', '2015-09-10 06:37:45');
INSERT INTO `django_migrations` VALUES ('9', 'auth', '0006_require_contenttypes_0002', '2015-09-10 06:37:45');
INSERT INTO `django_migrations` VALUES ('10', 'sessions', '0001_initial', '2015-09-10 06:37:45');
INSERT INTO `django_migrations` VALUES ('11', 'student', '0001_initial', '2015-09-10 07:00:31');
INSERT INTO `django_migrations` VALUES ('12', 'student', '0002_student_age', '2015-09-10 07:09:07');
INSERT INTO `django_migrations` VALUES ('13', 'student', '0003_book', '2015-09-11 01:10:29');
INSERT INTO `django_migrations` VALUES ('14', 'student', '0004_auto_20150911_2147', '2015-09-11 13:48:59');
INSERT INTO `django_migrations` VALUES ('15', 'student', '0005_account', '2015-09-13 15:58:56');

-- ----------------------------
-- Table structure for django_session
-- ----------------------------
DROP TABLE IF EXISTS `django_session`;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_de54fa62` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of django_session
-- ----------------------------
INSERT INTO `django_session` VALUES ('ryypdyfirfwr3zkkfjv34qhjdl0b95xo', 'YjUzNzdjOGE2MmNhMzMwYjMzNGYwYTUzZTk2YWNmZTRmNjBjYmYwMDp7Im5hbWUiOiJ3amgifQ==', '2015-09-27 16:36:52');

-- ----------------------------
-- Table structure for student_book
-- ----------------------------
DROP TABLE IF EXISTS `student_book`;
CREATE TABLE `student_book` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `pub_date` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of student_book
-- ----------------------------
INSERT INTO `student_book` VALUES ('1', '世界末日', '2015-09-11');

-- ----------------------------
-- Table structure for student_choice
-- ----------------------------
DROP TABLE IF EXISTS `student_choice`;
CREATE TABLE `student_choice` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `choice_text` varchar(200) NOT NULL,
  `votes` int(11) NOT NULL,
  `question_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `student_choice_7aa0f6ee` (`question_id`),
  CONSTRAINT `student_choice_question_id_1bd82ec9_fk_student_question_id` FOREIGN KEY (`question_id`) REFERENCES `student_question` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of student_choice
-- ----------------------------
INSERT INTO `student_choice` VALUES ('1', '北京', '4', '1');
INSERT INTO `student_choice` VALUES ('2', '上海', '4', '1');
INSERT INTO `student_choice` VALUES ('3', '音乐', '1', '2');
INSERT INTO `student_choice` VALUES ('4', '足球', '2', '2');
INSERT INTO `student_choice` VALUES ('5', '跑步', '0', '2');
INSERT INTO `student_choice` VALUES ('6', '云南', '3', '1');
INSERT INTO `student_choice` VALUES ('7', '大理', '4', '1');
INSERT INTO `student_choice` VALUES ('8', '昆明', '2', '1');
INSERT INTO `student_choice` VALUES ('9', '三亚', '3', '1');

-- ----------------------------
-- Table structure for student_question
-- ----------------------------
DROP TABLE IF EXISTS `student_question`;
CREATE TABLE `student_question` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `question_text` varchar(200) NOT NULL,
  `pub_date` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of student_question
-- ----------------------------
INSERT INTO `student_question` VALUES ('1', '你最想去的地方？', '2015-09-11 14:08:24');
INSERT INTO `student_question` VALUES ('2', '你的爱好是什么？', '2015-09-11 14:09:21');

-- ----------------------------
-- Table structure for student_student
-- ----------------------------
DROP TABLE IF EXISTS `student_student`;
CREATE TABLE `student_student` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `age` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of student_student
-- ----------------------------
INSERT INTO `student_student` VALUES ('1', 'wjh', '28');
INSERT INTO `student_student` VALUES ('2', 'lht', '25');
INSERT INTO `student_student` VALUES ('3', 'lvkui', '24');
