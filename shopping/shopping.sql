-- phpMyAdmin SQL Dump
-- version phpStudy 2014
-- http://www.phpmyadmin.net
--
-- 主机: localhost
-- 生成日期: 2016 年 07 月 14 日 10:59
-- 服务器版本: 5.5.40
-- PHP 版本: 5.3.29

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- 数据库: `shopping`
--

-- --------------------------------------------------------

--
-- 表的结构 `admin`
--

CREATE TABLE IF NOT EXISTS `admin` (
  `uid` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 NOT NULL,
  `pass` varchar(32) CHARACTER SET utf8 NOT NULL,
  PRIMARY KEY (`uid`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM  DEFAULT CHARSET=gbk AUTO_INCREMENT=2 ;

--
-- 转存表中的数据 `admin`
--

INSERT INTO `admin` (`uid`, `name`, `pass`) VALUES
(1, 'admin', '123456');

-- --------------------------------------------------------

--
-- 表的结构 `goods`
--

CREATE TABLE IF NOT EXISTS `goods` (
  `goods_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 NOT NULL,
  `price` float(6,2) NOT NULL,
  `quantity` int(11) NOT NULL,
  `description` text CHARACTER SET utf8 NOT NULL,
  `imagePath` varchar(255) CHARACTER SET utf8 NOT NULL,
  `add_time` date NOT NULL,
  `category_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`goods_id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM  DEFAULT CHARSET=gbk AUTO_INCREMENT=11 ;

--
-- 转存表中的数据 `goods`
--

INSERT INTO `goods` (`goods_id`, `name`, `price`, `quantity`, `description`, `imagePath`, `add_time`, `category_id`) VALUES
(1, '1935-C The Grateful Bet', 1.00, 31, 'lollollollol', '/upload/1467132173185.jpg', '2016-06-29', 1),
(4, '测试中文', 10.00, 50, '测试中文测试中文测试中文', '/upload/1467186649884.jpg', '2016-06-29', 1),
(3, 'llll', 100.00, 123, 'aaaa', '/upload/1467166139571.jpg', '2016-06-29', 1),
(5, '啊哈哈', 1.00, 1, 'aaaa', '/upload/1467188205398.jpg', '2016-06-30', 9),
(6, '测试', 100.00, 11, '测试一下', '/upload/1467342815784.jpg', '2016-07-01', 5),
(7, 'lllll', 1.00, 1, '路径', '/upload/1467344498219.jpg', '2016-07-01', 5),
(8, '测试1', 100.00, 1, '测死', '/upload/1467344563022.jpg', '2016-07-01', 5),
(9, '测死3', 10.00, 2, '测死', '/upload/1467344588976.jpg', '2016-07-01', 5),
(10, '测试一下1', 1.00, 1, '尺寸长', '/upload/1467344613981.jpg', '2016-07-01', 5);

-- --------------------------------------------------------

--
-- 表的结构 `goods_category`
--

CREATE TABLE IF NOT EXISTS `goods_category` (
  `category_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 NOT NULL,
  PRIMARY KEY (`category_id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM  DEFAULT CHARSET=gbk AUTO_INCREMENT=10 ;

--
-- 转存表中的数据 `goods_category`
--

INSERT INTO `goods_category` (`category_id`, `name`) VALUES
(7, '游戏'),
(6, '家电'),
(5, '服装'),
(8, '乐器'),
(9, '手机');

-- --------------------------------------------------------

--
-- 表的结构 `member`
--

CREATE TABLE IF NOT EXISTS `member` (
  `uid` int(11) NOT NULL AUTO_INCREMENT,
  `realname` varchar(255) NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 NOT NULL,
  `pass` varchar(32) CHARACTER SET utf8 NOT NULL,
  `tel` varchar(11) CHARACTER SET utf8 NOT NULL,
  `homesite` varchar(1000) CHARACTER SET utf8 NOT NULL,
  `money` float(50,2) DEFAULT NULL,
  PRIMARY KEY (`uid`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM  DEFAULT CHARSET=gbk AUTO_INCREMENT=6 ;

--
-- 转存表中的数据 `member`
--

INSERT INTO `member` (`uid`, `realname`, `name`, `pass`, `tel`, `homesite`, `money`) VALUES
(1, '柠檬', 'lemon', '123456', '13452014596', '测试测试测试测试测试测试', 8994.00),
(3, '测试', '你好', '123456', '13452014596', '测试测试测试测试测试测试', 9950.00),
(4, '测试啊', '你好BA', '123456', '13452014596', '测试测试测试测试测试测试', 9950.00),
(5, '柠檬', 'DDD', '123456', '13542652158', 'ceshi', 9950.00);

-- --------------------------------------------------------

--
-- 表的结构 `orders`
--

CREATE TABLE IF NOT EXISTS `orders` (
  `order_id` int(11) NOT NULL AUTO_INCREMENT,
  `goods_id` int(11) NOT NULL,
  `order_date` date NOT NULL,
  `processed` varchar(5) DEFAULT NULL,
  `buy_quantity` int(11) NOT NULL,
  `price` float(50,2) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`order_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=gbk AUTO_INCREMENT=11 ;

--
-- 转存表中的数据 `orders`
--

INSERT INTO `orders` (`order_id`, `goods_id`, `order_date`, `processed`, `buy_quantity`, `price`, `name`) VALUES
(1, 9, '2016-07-01', '2', 1, 10.00, 'lemon'),
(4, 5, '2016-07-01', '1', 1, 1.00, 'lemon'),
(3, 5, '2016-07-01', '1', 3, 1.00, 'lemon'),
(5, 7, '2016-07-02', '1', 1, 1.00, 'lemon'),
(6, 7, '2016-07-02', '1', 1, 1.00, 'lemon'),
(7, 5, '2016-07-02', '1', 4, 1.00, 'lemon'),
(8, 8, '2016-07-02', '2', 4, 100.00, 'lemon'),
(9, 6, '2016-07-02', '1', 2, 100.00, 'lemon'),
(10, 8, '2016-07-03', '1', 3, 100.00, 'lemon');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
