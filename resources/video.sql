DROP TABLE IF EXISTS `video`;
CREATE TABLE `video`(
  `id` bigint(11) NOT NULL COMMENT '视频主键ID',
  `member_id` bigint(11) NOT NULL COMMENT '会员ID',
  `member_nickname` varchar(100) NOT NULL DEFAULT '' COMMENT '会员昵称',
  `member_avatar` varchar(200) NOT NULL DEFAULT '' COMMENT '会员头像',
  `video_text` varchar(140) NOT NULL COMMENT '文字内容',
  `video_cover` varchar(300) NOT NULL COMMENT '视频封面',
  `video_url` varchar(300) NOT NULL COMMENT '视频文件地址',
  `video_seconds` float(6,2) DEFAULT NULL COMMENT '视频秒数',
  `video_width` int(6) DEFAULT NULL COMMENT '视频宽度',
  `video_height` int(6) DEFAULT NULL COMMENT '视频高度',
  `watch_count` bigint(11) NOT NULL DEFAULT 0 COMMENT '浏览数',
  `like_count` bigint(11) NOT NULL DEFAULT 0 COMMENT '点赞数',
  `comment_count` bigint(11) DEFAULT 0 NOT NULL COMMENT '评论数',
  `channel` varchar(10) NOT NULL DEFAULT '' COMMENT '来自什么渠道',
  `address` varchar(100) NOT NULL DEFAULT '' COMMENT '定位地址',
  `ip` varchar(30) NOT NULL DEFAULT '' COMMENT 'ip地址',
  `status` tinyint(1) DEFAULT 1 COMMENT '状态(0：无效 1：有效)',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE = InnoDB CHARSET = utf8mb4 COMMENT '视频表';

DROP TABLE IF EXISTS `video_comment`;
CREATE TABLE `video_comment`(
  `id` bigint(11) NOT NULL COMMENT '评论主键ID',
  `video_id` bigint(11) NOT NULL COMMENT '视频ID',
  `member_id` bigint(11) NOT NULL COMMENT '会员ID',
  `member_nickname` varchar(100) NOT NULL COMMENT '会员昵称',
  `member_avatar` varchar(200) NOT NULL COMMENT '会员头像',
  `comment_text` varchar(140) NOT NULL COMMENT '评论内容',
  `comment_imgs` varchar(150) NOT NULL COMMENT '评论图片',
  `at` varchar(150) NOT NULL DEFAULT '' COMMENT '@了谁，下划线分割',
  `like` bigint(11) NOT NULL COMMENT '点赞数',
  `parent_id` bigint(11) NOT NULL DEFAULT 0 COMMENT '评论父ID，为0则是主评论',
  `status` tinyint(1) DEFAULT 1 COMMENT '状态(0：无效 1：有效)',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE = InnoDB CHARSET = utf8mb4 COMMENT '视频评论表';

DROP TABLE IF EXISTS `video_search_history`;
CREATE TABLE `video_search_history`(
  `id` bigint(11) NOT NULL COMMENT '主键ID',
  `member_id` bigint(11) NOT NULL COMMENT '会员ID',
  `search_content` varchar(140) NOT NULL COMMENT '搜索内容',
  `status` tinyint(1) DEFAULT 1 COMMENT '状态(0：无效 1：有效)',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE = InnoDB CHARSET = utf8mb4 COMMENT '搜索历史表';

DROP TABLE IF EXISTS `video_watch_history`;
CREATE TABLE `video_watch_history`(
  `id` bigint(11) NOT NULL COMMENT '主键ID',
  `member_id` bigint(11) NOT NULL COMMENT '会员ID',
  `video_id` bigint(11) NOT NULL COMMENT '视频ID',
  `video_cover` varchar(300) NOT NULL COMMENT '视频封面',
  `status` tinyint(1) DEFAULT 1 COMMENT '状态(0：无效 1：有效)',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE = InnoDB CHARSET = utf8mb4 COMMENT '浏览历史表';

DROP TABLE IF EXISTS `video_like`;
CREATE TABLE `video_like`(
  `id` bigint(18) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `video_id` bigint(11) NOT NULL COMMENT '视频ID',
  `member_id` bigint(11) NOT NULL COMMENT '会员ID',
  `like_status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '喜欢状态：0:无操作 1:喜欢 2:不喜欢',
  `like_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '操作时间',
  PRIMARY KEY (`id`),
  INDEX `idx_member_id` (`member_id`)
) ENGINE = InnoDB CHARSET = utf8mb4 COMMENT '视频点赞表';

DROP TABLE IF EXISTS `video_comment_like`;
CREATE TABLE `video_comment_like`(
  `id` bigint(18) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `comment_id` bigint(11) NOT NULL COMMENT '评论ID',
  `member_id` bigint(11) NOT NULL COMMENT '会员ID',
  `like_status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '喜欢状态：0:无操作 1:喜欢 2:不喜欢',
  `like_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '操作时间',
  PRIMARY KEY (`id`),
  INDEX `idx_member_id` (`member_id`)
) ENGINE = InnoDB CHARSET = utf8mb4 COMMENT '评论点赞表';


DROP TABLE IF EXISTS `bgmusic`;
CREATE TABLE `bgmusic`(
  `id` bigint(11) NOT NULL COMMENT '背景音乐主键ID',
  `music_name` varchar(100) NOT NULL COMMENT '音乐名',
  `music_composer` varchar(100) NOT NULL COMMENT '作曲者',
  `music_lyricist` varchar(100) NOT NULL COMMENT '作词者',
  `music_copyright` varchar(300) NOT NULL COMMENT '音乐版权',
  `status` tinyint(1) DEFAULT 1 COMMENT '状态(0：无效 1：有效)',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE = InnoDB CHARSET = utf8mb4 COMMENT '背景音乐表';

DROP TABLE IF EXISTS `topic`;
CREATE TABLE `topic`(
  `id` bigint(11) NOT NULL COMMENT '主题主键ID',
  `title` varchar(100) NOT NULL COMMENT '主题标题',
  `watch` int(12) NOT NULL COMMENT '阅读数',
  `count` bigint(11) NOT NULL COMMENT '讨论数',
  `status` tinyint(1) DEFAULT 1 COMMENT '状态(0：无效 1：有效)',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE = InnoDB CHARSET = utf8mb4 COMMENT '视频主题表';






DROP TABLE IF EXISTS `member`;
CREATE TABLE `member`(
    `id` bigint(11) NOT NULL COMMENT '主键ID',
    `username` varchar(16) NOT NULL COMMENT '会员名',
    `password` varchar(100) NOT NULL COMMENT '密码',
    `avatar` varchar(200) NOT NULL COMMENT '头像',
    `nickname` varchar(100) DEFAULT '' COMMENT '昵称',
    `google_key` varchar(32) DEFAULT '' COMMENT '谷歌验证码',
    `google_status` int(1) DEFAULT '0' COMMENT '谷歌验证码是否开启，默认0不开启, 1开启',
    `real_name` varchar(16) DEFAULT '' COMMENT '真实姓名',
    `email` varchar(50) DEFAULT '' COMMENT '邮箱',
    `phone` varchar(16) DEFAULT '' COMMENT '手机',
    `online` tinyint(2) DEFAULT 1 COMMENT '是否在线(0：离线 1：在线)',
    `status` tinyint(2) DEFAULT 1 COMMENT '状态(0：无效 1：有效)',
    `created_at` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    PRIMARY KEY (`id`),
    UNIQUE KEY `uni_idx_username` (`username`),
    UNIQUE KEY `uni_idx_phone` (`phone`),
    INDEX `idx_nickname_phone` (`nickname`, `phone`)
) ENGINE = InnoDB CHARSET = utf8mb4 COMMENT '会员表';


DROP TABLE IF EXISTS `member_info`;
CREATE TABLE `member_info`(
    `member_id` bigint(11) NOT NULL COMMENT '用户ID',
    `gender` tinyint(1) DEFAULT 0 COMMENT '性别(0:未知 1:男；2:女)',
    `birthday` datetime DEFAULT NULL COMMENT '生日',
    `country_code` varchar(5) DEFAULT '' COMMENT '国家码',
    `country` varchar(100) DEFAULT '' COMMENT '国家',
    `province` varchar(100) DEFAULT '' COMMENT '省份',
    `city` varchar(30) DEFAULT '' COMMENT '城市',
    `district` varchar(200) DEFAULT '' COMMENT '区域',
    `grade_level` varchar(255) DEFAULT '' COMMENT '会员等级',
    `login_count` bigint(11) NOT NULL DEFAULT 0 COMMENT '会员登录次数',
    `login_error_count` bigint(11) NOT NULL DEFAULT 0 COMMENT '会员登录错误次数',
    `last_login` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '最后登录',
    `created_at` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    PRIMARY KEY (`member_id`)
) ENGINE = InnoDB CHARSET = utf8mb4 COMMENT '会员详情表';


DROP TABLE IF EXISTS `member_relation`;
CREATE TABLE `member_relation`(
    `id` bigint(11) NOT NULL COMMENT '主键ID',
    `from_member_id` bigint(11) NOT NULL COMMENT 'from用户ID',
    `to_member_id` bigint(11) NOT NULL COMMENT 'to用户ID',
    `relation` tinyint(1) NOT NULL COMMENT '关系：1 to是from的粉丝， 2 from是to的粉丝， 3 from和to互关',
    `to_nickname` varchar(100) DEFAULT '' COMMENT 'to方昵称',
    `to_intro` varchar(100) DEFAULT '' COMMENT 'to方简介',
    `created_at` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    PRIMARY KEY (`id`)
) ENGINE = InnoDB CHARSET = utf8mb4 COMMENT '会员关系表';


DROP TABLE IF EXISTS `member_report`;
CREATE TABLE `member_report`(
    `id` bigint(11) NOT NULL COMMENT '主键ID',
    `member_id` bigint(11) NOT NULL COMMENT '举报人的用户ID',
    `report_member_id` bigint(11) NOT NULL COMMENT '被举报的用户ID',
    `report_video_id` bigint(11) NOT NULL COMMENT '被举报的视频ID',
    `report_comment_id` bigint(11) NOT NULL COMMENT '被举报的评论ID',
    `title` varchar(100) NOT NULL COMMENT '举报标题',
    `content` varchar(200) NOT NULL COMMENT '举报内容',
    `created_at` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    PRIMARY KEY (`id`)
) ENGINE = InnoDB CHARSET = utf8mb4 COMMENT '会员举报表';



DROP TABLE IF EXISTS `video_banner`;
CREATE TABLE `video_banner` (
    `id`                        int(10) NOT NULL AUTO_INCREMENT COMMENT '自增主键ID',
    `name`                      varchar(100) DEFAULT '' COMMENT '轮播图名称',
    `type`                      tinyint(1) DEFAULT '0' COMMENT '轮播位置：0->PC首页轮播；1->app首页轮播 2->app导航小组件',
    `pic`                       varchar(500) DEFAULT '' COMMENT '图片地址',
    `status`                    int(1) DEFAULT '1' COMMENT '上下线状态：0->下线；1->上线',
    `click_count`               int(11) DEFAULT '0' COMMENT '点击数',
    `url`                       varchar(500) DEFAULT '' COMMENT '链接地址',
    `note`                      varchar(500) DEFAULT '' COMMENT '备注',
    `sort`                      int(3) DEFAULT '0' COMMENT '排序',
    `created_at`                datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `updated_at`                datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
	PRIMARY KEY (`id`)
) ENGINE = InnoDB CHARSET = utf8mb4 COMMENT '首页视频轮播表';