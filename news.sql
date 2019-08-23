-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- 主机： localhost
-- 生成日期： 2019-08-12 12:54:03
-- 服务器版本： 8.0.12
-- PHP 版本： 7.3.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- 数据库： `news`
--

-- --------------------------------------------------------

--
-- 表的结构 `comment`
--

CREATE TABLE `comment` (
  `cid` int(11) NOT NULL,
  `uid` int(11) DEFAULT NULL,
  `username` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户名',
  `content` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '评论内容',
  `time` datetime DEFAULT NULL COMMENT '评论时间'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `comment`
--

INSERT INTO `comment` (`cid`, `uid`, `username`, `content`, `time`) VALUES
(43, 2, '312', '我来登录了', '2019-08-12 12:46:45'),
(31, 1, '12', '12', '2019-08-12 11:44:00'),
(32, 1, '12', '23', '2019-08-12 11:44:02'),
(33, 1, '12', '34', '2019-08-12 11:44:05'),
(38, 1, '12', '45', '2019-08-12 11:44:35'),
(42, 2, '312', '我是312', '2019-08-12 12:46:26');

-- --------------------------------------------------------

--
-- 表的结构 `user`
--

CREATE TABLE `user` (
  `cid` int(11) NOT NULL,
  `username` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户名',
  `password` char(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '密码',
  `utime` datetime DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `user`
--

INSERT INTO `user` (`cid`, `username`, `password`, `utime`) VALUES
(1, '12', '1231', NULL),
(2, '312', '123123', '2019-08-09 14:34:54'),
(3, '1234', '123123', '2019-08-09 14:35:43'),
(4, '123', '123123', '2019-08-09 14:36:31'),
(5, '21312', '123123', '2019-08-09 14:37:31'),
(6, '123123', '123123123', '2019-08-09 14:37:35'),
(7, '12312', '123123', '2019-08-09 14:38:02'),
(8, 'adba', 'b23423423', '2019-08-12 08:18:09'),
(9, '123123123', '213123123', '2019-08-12 09:47:36'),
(10, '123124', '123123123', '2019-08-12 10:12:24');

--
-- 转储表的索引
--

--
-- 表的索引 `comment`
--
ALTER TABLE `comment`
  ADD PRIMARY KEY (`cid`);

--
-- 表的索引 `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`cid`);

--
-- 在导出的表使用AUTO_INCREMENT
--

--
-- 使用表AUTO_INCREMENT `comment`
--
ALTER TABLE `comment`
  MODIFY `cid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;

--
-- 使用表AUTO_INCREMENT `user`
--
ALTER TABLE `user`
  MODIFY `cid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
