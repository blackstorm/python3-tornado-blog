/*
Navicat MySQL Data Transfer

Source Server         : Local
Source Server Version : 50505
Source Host           : 127.0.0.1:3306
Source Database       : blog

Target Server Type    : MYSQL
Target Server Version : 50505
File Encoding         : 65001

Date: 2015-11-11 00:46:28
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for article
-- ----------------------------
DROP TABLE IF EXISTS `article`;
CREATE TABLE `article` (
  `aid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `url` varchar(200) NOT NULL,
  `title` varchar(200) DEFAULT NULL,
  `created` date DEFAULT NULL,
  `content` text,
  `type` varchar(16) DEFAULT 'post',
  `status` varchar(16) DEFAULT 'public',
  `allowComment` char(1) DEFAULT '0',
  PRIMARY KEY (`aid`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of article
-- ----------------------------
INSERT INTO `article` VALUES ('1', 'hello-world!-my-blog-frist-post', '你好世界！我的博客第一条数据。', '2015-11-03', '<p>唉！！</p>', 'code', 'public', '0');
INSERT INTO `article` VALUES ('2', 'javascript-frress', 'javascript各种框架实在令人心碎', '2015-11-03', '<p>javascript的各种框架实在太多太多，完全跟不上更新的速度，希望能学好javascript。弥补自己的不足。</p>\n\n<p>目标，学好JS重写我的小论坛项目，当一个项目写到瓶颈的时候再回头看那些代码实在惨不忍睹。</p>\n\n<p>决定重构了。OK！</p>\n', 'life', 'public', '0');
INSERT INTO `article` VALUES ('3', 'GoDaddy', 'GoDaddy域名转出攻略', '2015-11-09', '<p>目前在国内有很多家域名商，想要转移域名的时候会受到种种阻拦，要你提供各种材料，否则就不给转移。Godaddy虽然是国外的域名商，但是作为全球域名商的老大，它的域名转出还是比较容易的，下面笔者就给大家介绍一下Godaddy域名转出教程。</p>\n\n<p>登录到GoDaddy账户，在“DOMAIN”一栏里选择自己想要转移的域名，点击后面的“Launch”。</p>\n\n<p>返回到Domain信息后台找到：Authorization Code选项，点击“Email my code”，点击“send”按钮，获得转移码。</p>\n\n<p>向Godaddy官方索要转移码。转移码是域名商转移域名最重要的凭证，之后会收到一封标题是“<em>*</em>*&gt;&gt;Infomation You Requested”的邮件，其中Authorization Info后面的就是转移码，去域名接收方使用。</p>\n', 'post', 'public', '0');

-- ----------------------------
-- Table structure for comments
-- ----------------------------
DROP TABLE IF EXISTS `comments`;
CREATE TABLE `comments` (
  `cid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `aid` int(11) unsigned DEFAULT '0',
  `content` text,
  `created` date DEFAULT NULL,
  `author` varchar(200) DEFAULT NULL,
  `authorId` int(10) unsigned DEFAULT '0',
  `ownerId` int(10) unsigned DEFAULT '0',
  `mail` varchar(200) DEFAULT NULL,
  `ip` varchar(64) DEFAULT NULL,
  `agent` varchar(200) DEFAULT NULL,
  `status` varchar(16) DEFAULT 'public',
  `parent` int(10) unsigned DEFAULT '0',
  PRIMARY KEY (`cid`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of comments
-- ----------------------------
INSERT INTO `comments` VALUES ('1', '1', '第一条评论', '2015-11-09', 'admin', '1', '1', '976873727@qq.com', '172.20.102.35', 'phone', 'public', '0');
INSERT INTO `comments` VALUES ('2', '1', '第二条', '2015-11-09', 'admin', '1', '1', '25@qq.copm', '127.0.0.1', 'pc', 'public', '0');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `uid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(32) DEFAULT NULL,
  `password` varchar(64) DEFAULT NULL,
  `screenName` varchar(32) DEFAULT NULL,
  `created` date DEFAULT NULL,
  `group` varchar(16) DEFAULT 'visitor',
  PRIMARY KEY (`uid`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', 'f2-in', 'b\'$2b$12$yXdCE9lf3GpjjT1FRS7sBOBpfnzEmy2BSY7NvucQkp2fUqOZrVynm\'', '浩子', '2015-11-03', 'admin');
