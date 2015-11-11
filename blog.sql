/*
Navicat MySQL Data Transfer

Source Server         : Local
Source Server Version : 50505
Source Host           : 127.0.0.1:3306
Source Database       : blog

Target Server Type    : MYSQL
Target Server Version : 50505
File Encoding         : 65001

Date: 2015-11-11 21:32:38
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
INSERT INTO `article` VALUES ('1', 'hello-world!-my-blog-frist-post', '你好世界！我的博客第一条数据。', '2015-11-03', '<p>作者：NovaDNG</p> \r\n <p> 来源： <a href=\"http://zhuanlan.zhihu.com/thoughts-dng/20333663\" rel=\"nofollow,noindex\">http://zhuanlan.zhihu.com/thoughts-dng/20333663</a> </p> \r\n <p>废话不说, 直接上图. 虽然目前的 Apple Music for Android 并不能说是一款非常优秀的 Android 应用, 但是考虑到目前它还处于 beta 阶段, 在正式版里可能会有进一步改进.</p> \r\n <p>0. 首屏</p> \r\n <figure contenteditable=\"false\"> \r\n  <img src=\"http://img2.tuicool.com/Y3ima2.png\" class=\"alignCenter\" /> \r\n </figure> \r\n <p>很容易就能注意到的区别是两者采用了截然不同的导航方式——tab bar for iOS, Drawer for Android. Apple Music 引以为傲的智能推荐让用户能够一整天都遨游在 For You 这个模块中, 相比起这个模块, 其它功能都并不是那么重要. Android 版将其他模块藏入 Drawer, 也很好地凸显 For You 对于 Apple Music 的重要性. 另外, 两个版本的横幅展示也采用了不太相同的设计 (而有趣的是, 很多情况下, Android 这边的辨识度甚至要高于 iOS 端).</p> \r\n <p>1. Drawer</p> \r\n <figure contenteditable=\"false\"> \r\n  <img src=\"http://img1.tuicool.com/z6JvQzj.png\" class=\"alignCenter\" /> \r\n </figure> \r\n <p>比起 iOS 版本的 tab bar, drawer 的 空间更加充裕, 于是播放列表便有了自己的一席之地 (iOS 版本中, 播放列表被归进了 My Music, 需要在 My Music 中再点击顶部才能从曲库切换到播放列表), 用户的头像也能得以展示 (我一直不明白为什么 iOS 版本左上角不显示用户头像...).</p> \r\n <p>2. Playlist</p> \r\n <figure contenteditable=\"false\"> \r\n  <img src=\"http://img2.tuicool.com/qQN3yu.png\" class=\"alignCenter\" /> \r\n </figure> \r\n <p>很明显可以看出来的是, 在不同的版本中, Apple 将图标换成了符合各自平台含义的版本, 最明显的就是分享图标. 整个页面的布局也有所调整.</p> \r\n <p>3. 播放器 &amp; nbsp;</p> \r\n <figure contenteditable=\"false\"> \r\n  <img src=\"http://img0.tuicool.com/YbQbAr.png\" class=\"alignCenter\" /> \r\n </figure> \r\n <p>Android 版本去掉了音量滑块, 同时和上条中提到的相同, 分享图标以及菜单图标的样式也有所调整. Android 版的收起按钮还加上了富有 Material Design 特色的阴影 (虽然投影的方向很奇怪...). 再看看某劫持 Android 音量界面做成 iOS 音量调整窗口的国产应用...</p> \r\n <p>4. 上下文菜单</p> \r\n <figure contenteditable=\"false\"> \r\n  <img src=\"http://img1.tuicool.com/aamI3mY.png\" class=\"alignCenter\" /> \r\n </figure> \r\n <p>对比依旧非常明显. Android 版本的上下文菜单采用了 Bottom Sheet, 同时因为有返回键的存在, Cancel 键便没有意义.</p> \r\n <p>5. 分享</p> \r\n <figure contenteditable=\"false\"> \r\n  <img src=\"http://img2.tuicool.com/uaQnIbm.png\" class=\"alignCenter\" /> \r\n </figure> \r\n <p>当用户选择分享时, 更大的区别就体现出来了. 两个版本的 Apple Music 都选择了调用系统分享, 所以在 Android 6.0 上便可以使用 Direct Share 分享给不同应用的联系人, 5.0 以上的系统中还能通过用户的分享习惯智能排序分享列表里应用出现的顺序. 而 iOS 版本也可以选择直接用 AirDrop 进行分享. 这一点比起国内大部分应用那所谓 ｢构建闭环｣ 的残废分享, 简直不知道好到哪里去.</p> \r\n <p>6. 锁屏</p> \r\n <figure contenteditable=\"false\"> \r\n  <img src=\"http://img0.tuicool.com/VBNBBzZ.png\" class=\"alignCenter\" /> \r\n </figure> \r\n <p>音乐控制两个版本都采用了原生的锁屏音乐控制——而不是像某些国产音乐播放器那样, 硬生生的画一个锁屏覆盖在原生锁屏上. 实际上, iOS 版本的锁屏提供了更多的操作, 也可以查看专辑封面的大图, 单就音乐方面而言比起 Android 版还是好上不少的.</p> \r\n <p>简单的对比就做这些, 实际上你会发现几乎每个页面两者间都有或细微或显著的区别, Apple Music for Android 中还是可以看得出一些用心的痕迹. 至少, 比起那些完全照搬 iOS 逻辑和视觉的国产安卓应用还是高出了不少. 强烈建议国内那些负责安卓产品的设计师也好产品经理也好仔细研究研究 Apple 的做法, 用正确的姿势在 Android 上做充满果味的应用.</p> ', 'code', 'public', '0');
INSERT INTO `article` VALUES ('2', 'javascript-frress', 'javascript各种框架实在令人心碎', '2015-11-03', '<p> <img src=\"http://img1.tuicool.com/aIbaam7.jpg\" class=\"alignCenter\" /> </p> \r\n <p>GameLook报道/芬兰手游大厂Supercell的代表作《部落冲突》已经在世界规模中获得了巨大的成功，长期排在全球手游收入榜的首位。对于取得如此成绩的一款游戏，其游戏制作的背后究竟有着怎样的成功秘诀，日本媒体对CoC的设计师Jonas Collaros进行了采访。在采访中Jonas Collaros表示在游戏制作中首要考虑的是游戏玩家的感受，任何游戏内容的增加都会考虑到玩家能否获得游戏乐趣。并通过积极吸收玩家的意见，对游戏做出更好的改进。</p> \r\n <h4>以下为采访实录，有删节：</h4> \r\n <p> <img src=\"http://img2.tuicool.com/INJve2.jpg\" class=\"alignCenter\" /> </p> \r\n <p> Jonas <strong>：</strong> 事实上，我是在CoC上架时才进入了制作团队，从过去的员工得知，当初在研发CoC的时候，我们的首要目标是在移动平台上打造拥有顶级画面的产品，并通过改进游戏的玩法而使其更受欢迎，但是没想到游戏已经上线便突然火爆起来。 </p> \r\n <p>首先能亲眼见证CoC从上架到成功，我非常的高兴。不过我们制作团队还并没有满足于这样的成绩，我们总是考虑着如何把游戏做的更好。因为CoC还存在很多的改进空间，所以我们并不能满足于现状，同时随着时间的推移我们感觉这款游戏有许多地方需要不断完善。</p> \r\n <p>虽然我们对现在的游戏成绩很满意，但是对游戏内容却并不满意。对此我们抱着一种矛盾的心情，但正是这样一种心情，对于游戏开发者而言是非常重要的，因为它能不断促进开发者向前进。</p> \r\n <p> 不断吸取玩家意见 <strong>持续对游戏改进</strong> </p> \r\n <p>关于CoC为何能获得如此巨大的成功，这个问题我经常被别人问道，每次都觉得很难回答。所以我经常逆向思考，如何开发一款能让玩家带来安稳的游戏体验，同时能让玩家在游戏中获得乐趣的作品？</p> \r\n <p>答案就呼之欲出了，那是因为我们非常了解玩家想要什么，增加怎么样的玩法能让他们感到兴奋。特别是考虑游戏更新内容时我们都会优先考虑玩家。所以我们成功的秘诀是：不断吸取玩家意见，并持续对游戏进行优化，在运营的方向上没有偏差。</p> \r\n <p>故此，不仅在我们官方的论坛，还有Facebook、Twitter、Instagram、YouTube等，我们都会有专门的工作人员从许多地方吸取玩家意见。归纳整理后再交由开发团队对游戏进行改进。我认为对于游戏制作来说，最重要的便是要重视玩家的需求。</p> \r\n <p>相较于市面上的其他游戏，CoC的用户主要是以免费玩家为主，不过正是由于这些玩家构成了我们的基础玩家群，能让更多的玩家加入了进来，所以我们也一直在维持免费玩家的生态。</p> \r\n <p>平心而论，由于游戏中玩家层间的落差较大，所以对游戏整体平衡度的调整会显得非常困难。对此，我们选择根据玩家的不同层级进行相对应的调整，如对重度玩家来说，我们会增加新的游戏功能，而对于轻度玩家我们则加入更便捷的功能，让他们能更加轻松的体验到游戏乐趣。</p> \r\n <p> 集思广益 <strong>全员一同参与游戏设计</strong> </p> \r\n <p>CoC原本核心的研发人员大概有15人左右。最近有2~3人转到了《卡通农场》的项目中去了。在Supercell看来，对于游戏的设计师而言，他们对于自己着手开发的游戏有着很强的责任感，所以关于设计师的去留问题，我们会尊重开发人员的意思。</p> \r\n <p>游戏的研发团队的工作方式非常民主。当有人提出了一个新的设计，整个团队都会提出自己的意见。怎么样做才更有趣，玩家是否能从中感受到乐趣，集思广益最终来决定是否加入到游戏中去。当然，这只是CoC团队的做法，公司的其他团队或许会有所不同，但是这一切都是由团队自己来决定，公司并不会多加干涉。</p> \r\n <p>虽然在游戏开发的时候，我们团队有提出了很多的方案，但最终只有很少的一部分加入到游戏中来。所以每次提出新的方案，我们都会尽最大努力，对其进行改善。例如在加入了某个功能后，从玩家这得到的意见是“使用不方便”，“不能使用”，我们会对其不断调整，一直到所有人满意为止。我们也想提供给玩家最好的游戏内容，然而在摸索中我们花了非常多的时间，同时也花了更多的时间来制作。</p> \r\n <p>我们认为，如果要成立新的项目组，首先不要把团队的规模做的过大，即使是小团队也是可以的。重要的是能有3～4名既有热情又能提出巧妙创意的核心人员，之后根据游戏的规模再增加员工就行了。在进行大型的游戏测试时自然需要更多的人手，到这个时候再补充员工。</p> \r\n <p>《部落冲突》在开发初期就是以PVP为基础来考虑的，但不会让游戏过于的核心。和需要玩家拼命练习的PVP类游戏不同，我们希望能让玩家感受到游戏的乐趣，并且让更多的玩家加入到我们的游戏中去。</p> \r\n <p>作为一款手机平台的免费游戏，能够让玩家持续很长的游戏时间，所以觉得很适合PVP这种游戏方式。</p> \r\n <p>如果是PVE和单人模式的话，我们必须提供给玩家更多的游戏内容。但是PVP的话，只要存在玩家双方能使得游戏变得更加白热化，让玩家在互相战斗中体验到游戏乐趣。</p> \r\n <p>我们希望能带给玩家有趣的游戏体验，玩家在反复玩同一款游戏后多少会感到厌烦，所以重要的是要让游戏内容能够经常变化，并增加新的内容以带来新鲜感。</p> \r\n <p>我们经常会考虑什么样的游戏内容能让玩家愉快。“这真是玩家所需要的吗？”、“这个是否会影响到游戏平衡？”对于这些问题我们会反复思考，在正式添加之前还会进行多次探讨。</p> ', 'life', 'public', '0');
INSERT INTO `article` VALUES ('3', 'GoDaddy', 'GoDaddy域名转出攻略', '2015-11-09', '<p>第一步、打开<a href=\"http://go.idcspy.com/www.godaddy.com\" target=\"_blank\">Godaddy官网</a>，登录Godaddy账户，然后点击页面右侧的My Account,进入账号管理界面。</p>\r\n<p>&nbsp;</p>\r\n<p>第二步、点击Products——Domains，然后选择域名右侧的Launch，进入域名管理面板，如下图所示：</p>\r\n<p><a href=\"http://godaddy.idcspy.com/wp-content/uploads/2014/02/进入域名管理.jpg\"><img class=\"alignnone  wp-image-2641\" src=\"http://godaddy.idcspy.com/wp-content/uploads/2014/02/进入域名管理.jpg\" alt=\"进入Godaddy域名管理界面\" width=\"476\" height=\"308\" /></a></p>\r\n<p>第三步、进入域名管理面板，点击Locked后面的Manage解锁，如下图所示：</p>\r\n<p><a href=\"http://godaddy.idcspy.com/wp-content/uploads/2014/02/解除绑定.jpg\"><img class=\"alignnone  wp-image-2640\" src=\"http://godaddy.idcspy.com/wp-content/uploads/2014/02/解除绑定.jpg\" alt=\"解除域名绑定\" width=\"367\" height=\"338\" /></a></p>\r\n<p>弹出一个提示框，选择off，点击“save”保存。</p>\r\n<p><a href=\"http://godaddy.idcspy.com/wp-content/uploads/2014/02/确认解除.jpg\"><img class=\"alignnone  wp-image-2643\" src=\"http://godaddy.idcspy.com/wp-content/uploads/2014/02/确认解除.jpg\" alt=\"确认域名解除操作\" width=\"388\" height=\"212\" /></a></p>\r\n<p>第四步、发送godaddy域名转出转移码，点击Authorization Code后面的Email by code，如下图所示：</p>\r\n<p><a href=\"http://godaddy.idcspy.com/wp-content/uploads/2014/02/发送转出邮件.jpg\"><img class=\"alignnone  wp-image-2639\" src=\"http://godaddy.idcspy.com/wp-content/uploads/2014/02/发送转出邮件.jpg\" alt=\"发送Godaddy域名转出码\" width=\"389\" height=\"398\" /></a></p>\r\n<p>弹出提示，确认godaddy域名转出邮箱，点击send。</p>\r\n<p><a href=\"http://godaddy.idcspy.com/wp-content/uploads/2014/02/邮箱发送转移码.jpg\"><img class=\"alignnone  wp-image-2644\" src=\"http://godaddy.idcspy.com/wp-content/uploads/2014/02/邮箱发送转移码.jpg\" alt=\"godaddy域名转出邮箱确实\" width=\"371\" height=\"176\" /></a></p>\r\n<p>接下来，就是检查你的域名whois邮箱，等待Godaddy发送的Authorization Code。</p>\r\n<p>第五步、到你要转入的域名注册商那里申请转入。转入后，Godaddy会发邮件给你问你是否同意转出。<br />\r\n如下图所示，点击transfer，可以看到准备要转出的域名。</p>\r\n<p><a href=\"http://godaddy.idcspy.com/wp-content/uploads/2012/06/gdymzc81.jpg\" class=\"cboxElement\" rel=\"example_group\"1179><img class=\"wp-image-3810 aligncenter\" src=\"http://godaddy.idcspy.com/wp-content/uploads/2012/06/gdymzc81.jpg\" alt=\"查看转出域名\" width=\"500\" height=\"192\" /></a></p>\r\n<p>看到你要转出的域名，选中，然后点击accept/decline，点击accept同意转出即可。</p>\r\n<p><a href=\"http://godaddy.idcspy.com/wp-content/uploads/2012/06/gdymzc9.jpg\" class=\"cboxElement\" rel=\"example_group\"1179><img class=\"aligncenter wp-image-3811 size-full\" src=\"http://godaddy.idcspy.com/wp-content/uploads/2012/06/gdymzc9.jpg\" alt=\"同意转出\" width=\"510\" height=\"282\" /></a></p>\r\n<p><span style=\"color: #ff0000;\">需要注意的是，在转移之前，如果你的域名有whois隐藏，请取消，否则不能将Authorization Code发送到你的域名邮箱，则这样你的域名也就无法转移</span>。</p>', 'post', 'public', '0');

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
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of comments
-- ----------------------------
INSERT INTO `comments` VALUES ('1', '1', '第一条评论', '2015-11-09', 'admin', '1', '1', 'sadasdas@qq.com', '172.20.102.35', 'phone', 'public', '0');
INSERT INTO `comments` VALUES ('2', '1', '第二条', '2015-11-09', 'admin', '1', '1', '25@qq.copm', '127.0.0.1', 'pc', 'public', '0');
INSERT INTO `comments` VALUES ('3', '3', '测试评论', '2015-11-11', 'heelo', '0', '0', '0010@qq.com', '127.0.0.1', 'pc', 'public', '0');

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
INSERT INTO `user` VALUES ('1', 'admin', 'b\'$2b$10$3yMMZvlcsvPSZ/rf3mqkOu7K.rWTVy1VI7mH2T/u8vn51/XuVCyeS\'', 'admin', '2015-11-03', 'admin');
