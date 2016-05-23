# Host: localhost  (Version: 5.6.24)
# Date: 2015-12-30 21:15:58
# Generator: MySQL-Front 5.3  (Build 4.214)

/*!40101 SET NAMES utf8 */;

#
# Structure for table "bookmark"
#

DROP TABLE IF EXISTS `bookmark`;
CREATE TABLE `bookmark` (
  `bid` int(10) NOT NULL AUTO_INCREMENT,
  `bname` varchar(50) DEFAULT 'Sam书签',
  `burl` varchar(255) NOT NULL DEFAULT '',
  `bclass` varchar(50) DEFAULT 'default',
  `uname` varchar(20) NOT NULL DEFAULT '',
  PRIMARY KEY (`bid`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8;

#
# Data for table "bookmark"
#

INSERT INTO `bookmark` VALUES (1,'51cto','www.51cto.com','教育网站','sam'),(3,'必应','www.bing.com','搜索引擎','sam'),(4,'谷歌','www.google.com','搜索引擎','sam'),(5,'百度谷歌一起搜','www.baigooledu.com','搜索引擎','sam'),(6,'慕课网','www.imooc.com','教育网站','sam'),(7,'网易云课堂','study.163.com','教育网站','sam'),(8,'GitHub','www.github.com','代码托管平台','sam'),(9,'Git@OSC','git.oschina.net','代码托管平台','sam'),(10,'4399小游戏','www.4399.com','网页游戏','游戏玩家'),(11,'7k7k小游戏','www.7k7k.com','网页游戏','游戏玩家'),(12,'英雄联盟','lol.qq.com','网络游戏','游戏玩家'),(13,'逆战','nz.qq.com','网络游戏','游戏玩家'),(14,'地下城与勇士','dnf.qq.com','网络游戏','游戏玩家'),(15,'新浪游戏【新闻】','games.sina.com.cn/new','游戏新闻','游戏玩家'),(16,'腾讯游戏【新闻】','games.qq.com','游戏新闻','游戏玩家'),(17,'中国教育和科研计算机网','www.edu.cn','教育网站','教师'),(18,'高考资源网','www.ks5u.com','教育网站','教师'),(19,'英语周报','www.ew.com.cn','学英语','教师'),(20,'无忧论文网','www.51lw.com','论文网站','教师'),(21,'论文帝国','www.papersempire.com','论文网站','教师'),(22,'论文在线','www.lwzx.net','论文网站','教师'),(23,'易起论文网','www.17net.net','论文网站','教师'),(24,'百度音乐','mp3.baidu.com','音乐','sam'),(25,'QQ音乐','music.qq.com','音乐','sam'),(26,'酷狗音乐','www.kugou.com','音乐','sam'),(27,'W3school','www.W3school.com.cn','教育网站','sam'),(28,'chinatex','www.chinatex.org','TeX','sam'),(29,'淘宝','www.taobao.com','网购平台','sam'),(30,'京东','www.jd.com','网购平台','sam'),(31,'遍历list中存放的map集合(未用)','zhidao.baidu.com/link?url=XCkTeEb_v8wt7MFbpIoXgzpKgWdhFbZVzbdOj4sX1bHxTRLlwGr4KZmOyLa8JUigd4uKeghypr8-NxpS34pSe_','JSP大作业参考文献','sam'),(32,'JDBC查询数据库返回集合','jingyan.baidu.com/article/6525d4b156c07cac7c2e9452.html','JSP大作业参考文献','sam'),(33,'JSTL和EL表达式遍历List<Map>','zhidao.baidu.com/link?url=ajU8_n4oQ9cwx_2C1qA8Gy3ouAn9iJlrf9SEn1cLQA_3qQzBpQoLAB8u3EZE-qSGxW8Aqth1S77nxz8kZ6UjKZnoj64Oablga9tgY8JUhjC','JSP大作业参考文献','sam'),(34,'监听器','www.2cto.com/kf/201501/370504.html','JSP大作业参考文献','sam'),(35,'监听器2','blog.csdn.net/cilen/article/details/6846152','JSP大作业参考文献','sam'),(36,'过滤器','www.cnblogs.com/lanxuezaipiao/archive/2012/08/05/2623547.html','JSP大作业参考文献','sam'),(37,'数据库乱码解决办法','blog.163.com/sunjinke0213@126/blog/static/8655680320101081179649','JSP大作业参考文献','sam'),(38,'百度','www.baidu.com','搜索引擎','sam'),(39,'ggg','ggg','sss','sam');

#
# Structure for table "user"
#

DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `uid` int(10) NOT NULL AUTO_INCREMENT,
  `uname` varchar(20) NOT NULL DEFAULT '',
  `upass` varchar(20) NOT NULL DEFAULT '',
  `uemail` varchar(20) DEFAULT NULL,
  `uadmin` int(1) DEFAULT '2',
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

#
# Data for table "user"
#

INSERT INTO `user` VALUES (1,'javaee','javaee',NULL,1),(2,'sam','123','',2),(3,'游戏玩家','123','',2),(4,'教师','123','',2),(5,'123','123','',2);
