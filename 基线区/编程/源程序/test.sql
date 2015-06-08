/*
MySQL Data Transfer
Source Host: localhost
Source Database: test
Target Host: localhost
Target Database: test
Date: 2015/6/8 16:52:30
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for books
-- ----------------------------
DROP TABLE IF EXISTS `books`;
CREATE TABLE `books` (
  `bookName` varchar(200) CHARACTER SET utf8 NOT NULL,
  `bookNumber` varchar(45) DEFAULT NULL,
  `bookAuthor` varchar(100) DEFAULT NULL,
  `bookPublicHouse` varchar(45) DEFAULT NULL,
  `bookShelf` varchar(500) DEFAULT NULL,
  `bookInfo` text,
  `bookState` int(11) DEFAULT NULL,
  `username` varchar(45) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`bookName`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

-- ----------------------------
-- Table structure for records
-- ----------------------------
DROP TABLE IF EXISTS `records`;
CREATE TABLE `records` (
  `rid` int(11) NOT NULL AUTO_INCREMENT,
  `bookName` varchar(45) DEFAULT NULL,
  `username` varchar(45) DEFAULT NULL,
  `time` varchar(45) DEFAULT NULL,
  `state` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`rid`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=gbk;

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `username` varchar(20) CHARACTER SET utf8 NOT NULL,
  `password` varchar(20) DEFAULT NULL,
  `identity` varchar(20) DEFAULT NULL,
  `name` varchar(45) DEFAULT NULL,
  `birthday` varchar(45) DEFAULT NULL,
  `major` varchar(45) DEFAULT NULL,
  `teacherTitle` varchar(20) DEFAULT NULL,
  `id` varchar(45) DEFAULT NULL,
  `address` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

-- ----------------------------
-- Records 
-- ----------------------------
INSERT INTO `books` VALUES ('Android 4编程入门经典', 'Android 4编程入门经典', '李伟梦 ', '清华大学出版社', 'TCPAn169.23', 'Android4的问世，标志着Google将Android操作系统的大旗插到了智能手机和平板电脑的阵营中。这本指南书将教会您成功开发Android应用程序所需的一切', '0', '1234567');
INSERT INTO `books` VALUES ('HTML5程序设计(第2版)', '9787115278715', '[荷]Peter Lubbers [美]Brian Albers [美]Frank Salim 著', '人民邮电出版社', 'TCPHt239.1', '《深入HTML5编程(第2版)》首先介绍了HTML5的历史背景、新的语义标签及与以往HTML版本相比的根本变化，同时揭示了HTML5背后的设计原理。本书在上一版的基础上新增了SVG和拖放API相关内容，并对部分内容进行了更新。从第2章起，分别围绕构建令人神往的富Web 应用，逐一讨论了HTML5的Canvas、Geolocation、Communication、WebSocket、Forms、WebWorkers、Storage等API的使用，辅以直观明了的客户端和服务器端示例代码，让开发人员能够迅速理解和掌握新一代Web标准所涵盖的核心技术。《深入HTML5编程(第2版)》最后探索了离线Web应用并展望了HTML5未来的发展前景。　　《深入HTML5编程(第2版)》面向有一定经验的Web应用开发人员，对HTML5及未来Web应用技术发展有浓厚兴趣的读者也可以学习参考。', '1', null);
INSERT INTO `books` VALUES ('NODEJS实战', '9787121226762', '实战 赵坤,寸志,吴中骅,雷宗民', '电子工业出版社', 'TCPja134.1', '介绍了node.js的一些基本概念', '1', null);
INSERT INTO `books` VALUES ('Ruby on Rail程序设计技术详解（配光盘）', '9787302223153', '许勇，王黎，张丽莉', '清华大学出版社', 'TCPRu320.14', 'ruby on rails是近10年来最重要的开源项目，通过ruby on rails可以让开发人员很轻松地开发网络应用程序。本书基于ruby on rails，详细讲述web开发中所涉及的各个主要环节，包括ruby语言基础，rails框架相关知识，基于rails框架的mvc知识。本书最后提供了两个典型案例，读者可以从整体上掌握ruby on rails开发技术。配书光盘提供了视频教学文件和实例完整源代码。 　　本书适合准备学习ruby语言和rails框架的开发人员学习使用，也可以作为在校师生学习ror编程知识的参考读物。', '0', 'chenquanbao');
INSERT INTO `books` VALUES ('Swift 权威指南', '9787115368478', '李宁', '人民邮电出版社', 'TCPSw568.2', '本书共分20章，专门介绍了Swift的基础语法及进行应用和游戏开发的技术。主要内容包括运算符、字符串、集合类、控制流、函数、枚举类型、类、结构体、属性、方法、下标、泛型、扩展、协议等内容，以及使用Swift语言开发iOS平台的应用和游戏。最后给出了一个Flappybird游戏综合案例，让读者了解使用Swift语言开发游戏的完整步骤。 　　本书适合iOS程序员、Swift初学者学习用书，也可作为大专院校及培训学校的教学用书。', '0', 'shibowen');
INSERT INTO `books` VALUES ('TCP/IP 详解(卷1:协议)', '9787111075660', '（美）史蒂文斯（W.Richard Stevens） ', '机械工业出版社', 'TCPcp231.0', '《TCP/IP详解，卷1：协议》是一本完整而详细的TCP/IP协议指南。描述了属于每一层的各个协议以及它们如何在不同操作系统中运行。作者用Lawrence Berkeley实验室的tcpdump程序来捕获不同操作系统和TCP/IP实现之间传输的不同分组。对tcpdump输出的研究可以帮助理解不同协议如何工作。 本书适合作为计算机专业学生学习网络的教材和教师参考书。也适用于研究网络的技术人员。', '1', null);
INSERT INTO `books` VALUES ('TCP/IP详解 卷3：TCP事务协议、HTTP、NNTP和UNIX域协议', '9787111075684', '[美]史蒂文斯（Stevens,W.R.）', '机械工业出版社', 'TCPcp231.2', '本书是“TCP/IP详解系列”的延续。主要内容包括：TCP事务协议，即T/TCP，这是对TCP的扩展，使客户-服务器事务更快、更高效和更可靠；TCP/IP应用，主要是HTTP和NNTP；UNIX域协议，这些协议提供了进程之间通信的一种手段。当客户与服务器进程在同一台主机上时，UNIX域协议通常要比TCP/IP快一倍。本书同样采用了大量的实例和实现细节，并参考引用了卷2中的大量源程序。适用于希望理解TCP/IP如何工作的人，包括编写网络应用程序的程序员以及利用TCP/IP维护计算机网络的系统管理员', '1', null);
INSERT INTO `books` VALUES ('TCP/IP详解（卷2）：实现', '9787111075677', '（美）莱特，（美）史蒂文斯', '机械工业出版社', 'TCPcp231.1', '本书完整而详细地介绍了TCP/IP协议是如何实现的。书中给出了约500个图例，15 000行实际操作的C代码，采用举例教学的方法帮助你掌握TCP/IP实现。本书不仅说明了插口API和协议族的关系以及主机实现与路由器实现的差别。还介绍了4.4BSD-Lite版的新的特点，如多播、长肥管道支持、窗口缩放、时间戳选项以及其他主题等等。读者阅读本书时，应当具备卷1中阐述的关于TCP/IP的基本知识。', '0', '1234567');
INSERT INTO `books` VALUES ('Web信息架构——设计大型网站（第3版）', '9787121215339', 'Peter Morville(彼得·莫维尔)，Louis Rosenfeld(路易斯·罗森菲尔德)', '电子工业出版社', 'TCPweb67.4', '　在由Wiki、Folksonomy及Mashup所构成的后Ajax化的Web 2．0世界中，精心设计的信息架构显得格外重要。你该如何向众人展现大量的信息，从而使他们能迅速找到所需的信息呢?这本经典之作将教导信息架构师、设计师及网站开发人员建立大型网站，使网站能够被管理，充满魅力，并且易于用户浏览。', '0', 'chenquanbao');
INSERT INTO `books` VALUES ('云计算与分布式系统：从并行处理到物联网', '9787111410652', '（美）黄铠，（美）福克斯，（美）唐加拉', '机械工业出版社', 'TCPComC78.4', '随着信息技术的广泛应用和快速发展，云计算作为一种新兴的商业计算模型日益受到人们的广泛关注。《云计算与分布式系统：从并行处理到物联网》是一本完整讲述云计算与分布式系统基本理论及其应用的教材。书中从现代分布式模型概述开始，介绍了并行、分布式与云计算系统的设计原理、系统体系结构和创新应用，并通过开源应用和商业应用例子，阐述了如何为科研、电子商务、社会网络和超级计算等创建高性能、可扩展、可靠的系统。', '1', null);
INSERT INTO `books` VALUES ('人月神话', '9787302392644', '(美) 布鲁克斯(Brooks, F. P.)', '清华大学出版社', 'TCPry231.4', '在软件领域，很少能有像《人月神话》一样具有深远影响力和畅销不衰的著作。Brooks博士为人们管理复杂项目提供了最具洞察力的见解，既有很多发人深省的观点，又有大量软件工程的实践。本书内容来自Brooks博士在IBM公司SYSTEM／360家族和OS／360中的项目管理经验，该项目堪称软件开发项目管理的典范。该书英文原版一经面世，即引起业内人士的强烈反响，后又译为德、法、日、俄、中、韩等多种文字，全球销售数百万册。确立了其在行业内的经典地位。 在《人月神话》第一次出版40年后的今天，我们重新整理了Brooks博士的经典内容，并将国内软件开发领域先行者们对《人月神话》中的实践及系统理论的使用经验和心得集结成册免费赠与大家共享，更使本书成为国内从业者的必读经典之一。 本书读者包括：软件开发人员、软件项目经理、系统分析师等IT从业者。', '1', null);
INSERT INTO `books` VALUES ('复变函数与积分变换（第三版）', '9787030369130', '包革军、邢宇明、盖云英', '科学出版社', 'TCPMAS34.2', '本书是国家工科数学教学基地之一的哈尔滨工业大学数学系根据教育部数学基础课程教学指导分委员会最新修订的《工科类本科数学基础课程教学基本要求（修订稿）》的精神和原则，结合多年的教学实践和研究而编写的系列教材之一。全书共8章，包括复数与复变函数、解析函数、复变函数的积分、级数、留数、保形映射、傅里叶变换、拉普拉斯变换等内容。每章后进行了简明的总结，便于学生深入掌握该章知识，并且精心设计了相应梯度的、适量的习题，在书后附有参考答案。书末附有傅氏变换和拉氏变换简表，便于读者查阅使用。书中标有*号部分供读者选学使用。 本书可作为高等工科院校各专业本科生的复变函数与积分变换课程教材，也可供有关工程技术人员参考。', '1', null);
INSERT INTO `books` VALUES ('操作系统', '23213213123', '谭浩强', '人民出版社', 'TCPOA13.2', '这本书包括了基本操作知识', '0', '1234567');
INSERT INTO `books` VALUES ('数字信号处理(MATLAB版)(第3版)(国外名校最新教材精选）', '9787560552101', ']维纳?K?英格尔（Vinay K. Ingle）', '西安交通大学出版社', 'TCPSi123.90', '数字信号处理（MATLAB版）（第3版）将MATLAB作为一种计算工具，深入探讨了传统DSP的各种论题，并通过解答例题方式,让读者获得更多的领悟。这就大大扩展了例题的选择范围和复杂程度，使得学生能够高效地学习这门课程。由于DSP应用主要是在DSP处理器上实现的各种算法或软件，因此需要相当的编程工作量。借助于像MATLAB这样的交互式软件可使得学生将精力主要放在学习新的和困难的概念上，而不是算法编程实现上。书中还讨论了若干生动实际的例题，剖析了一些有用的论题。本书适合于一切从事信号处理课程教学、学习和实际工作的教师、学生和工程技术人员参考使用', '1', null);
INSERT INTO `books` VALUES ('数字信号处理（第三版）', '9787121176128', 'Richard G. Lyons （理查德 G. 莱昂斯）', '电子工业出版社', 'TCPNDDA102.1', '本书全面讨论了数字信号处理的基本概念、原理和应用。全书共13章，主要包括离散序列和系统、离散傅里叶变换和其快速算法、有限和无限脉冲响应的滤波器的设计基本原理的基本数字信号处理内容，另外包括数字网络和滤波器、离散希尔伯特变换、抽样率的变换和信号平均、信号数字化及其影响的专业信号处理内容。给出了多年总结出的数字信号处理的一些技巧，包括如何进行复数的快速乘法、实序列的FFT变换、使用FFT的FIR滤波器设计等。附录对数字信号处理涉及的数学知识和术语给出了详细介绍和总结。相比于前版，本书每章都新增了部分内容，并附了习题，便于读者的自学。', '1', null);
INSERT INTO `books` VALUES ('数据挖掘：概念与技术', '9787111391401', '韩家炜', '机械工业出版社', 'TCPDF583.12', '本书完整全面地讲述数据挖掘的概念、方法、技术和最新研究进展。本书对前两版做了全面修订，加强和重新组织了全书的技术内容，重点论述了数据预处理、频繁模式挖掘、分类和聚类等的内容，还全面讲述了OLAP和离群点检测，并研讨了挖掘网络、复杂数据类型以及重要应用领域', '1', null);
INSERT INTO `books` VALUES ('计算机组成原理 ', '9787040223903', '唐朔飞 ', '高等教育出版社', 'TCP4.56', '介绍计算机的组成原理', '1', null);
INSERT INTO `books` VALUES ('计算机网络', '9787121201677', '谢希仁', '电子工业出版社', 'TCP3.45', '介绍网络的经典著作', '0', '1234567');
INSERT INTO `books` VALUES ('鸟哥的Linux私房菜 基础学习篇(第三版)', '9787115226266', '鸟哥 ', '人民邮电出版社', 'TCPLi199.23', '本书是最具知名度的Linux入门书《鸟哥的Linux私房菜基础学习篇》的最新版，全面而详细地介绍了Linux操作系统。全书分为5个部分：第一部分着重说明Linux的起源及功能，如何规划和安装Linux主机；第二部分介绍Linux的文件系统、文件、目录与磁盘的管理；第三部分介绍文字模式接口shell和管理系统的好帮手shell脚本，另外还介绍了文字编辑器vi和vim的使用方法；第四部分介绍了对于系统安全非常重要的Linux账号的管理，以及主机系统与程序的管理，如查看进程、任务分配和作业管理；第五部分介绍了系统管理员(root)的管理事项，如了解系统运行状况、系统服务，针对登录文件进行解析，对系统进行备份以及核心的管理等。　　本书内容丰富全面，基本概念的讲解非常细致，深入浅出。各种功能和命令的介绍，都配以大量的实例操作和详尽的解析。本书是初学者学习Linux不可多得的一本入门好书。', '1', null);
INSERT INTO `records` VALUES ('12', '数据挖掘：概念与技术', 'chenquanbao', '2015-06-07 19:41:22', 'borrow');
INSERT INTO `records` VALUES ('13', '数字信号处理（第三版）', 'chenquanbao', '2015-06-07 19:45:39', 'borrow');
INSERT INTO `records` VALUES ('14', '数字信号处理(MATLAB版)(第3版)(国外名校最新教材精选）', 'chenquanbao', '2015-06-07 19:45:52', 'borrow');
INSERT INTO `records` VALUES ('15', '操作系统', 'chenquanbao', '2015-06-07 19:45:57', 'borrow');
INSERT INTO `records` VALUES ('16', '复变函数与积分变换（第三版）', 'chenquanbao', '2015-06-07 19:46:01', 'borrow');
INSERT INTO `records` VALUES ('17', '人月神话', 'chenquanbao', '2015-06-07 19:46:05', 'borrow');
INSERT INTO `records` VALUES ('18', '云计算与分布式系统：从并行处理到物联网', 'chenquanbao', '2015-06-07 19:46:09', 'borrow');
INSERT INTO `records` VALUES ('19', 'Web信息架构——设计大型网站（第3版）', 'chenquanbao', '2015-06-07 19:46:14', 'borrow');
INSERT INTO `records` VALUES ('20', 'TCP/IP详解（卷2）：实现', 'chenquanbao', '2015-06-07 19:46:18', 'borrow');
INSERT INTO `records` VALUES ('21', 'TCP/IP详解 卷3：TCP事务协议、HTTP、NNTP和UNIX域协议', 'chenquanbao', '2015-06-07 19:46:25', 'borrow');
INSERT INTO `records` VALUES ('22', 'TCP/IP详解 卷3：TCP事务协议、HTTP、NNTP和UNIX域协议', 'chenquanbao', '2015-06-07 19:46:47', 'return');
INSERT INTO `records` VALUES ('23', '数字信号处理(MATLAB版)(第3版)(国外名校最新教材精选）', 'chenquanbao', '2015-06-07 19:47:34', 'return');
INSERT INTO `records` VALUES ('24', '操作系统', 'chenquanbao', '2015-06-07 19:47:40', 'return');
INSERT INTO `records` VALUES ('25', '数据挖掘：概念与技术', 'chenquanbao', '2015-06-07 19:47:44', 'return');
INSERT INTO `records` VALUES ('26', 'TCP/IP详解（卷2）：实现', 'chenquanbao', '2015-06-07 19:47:49', 'return');
INSERT INTO `records` VALUES ('27', 'Web信息架构——设计大型网站（第3版）', 'chenquanbao', '2015-06-07 19:47:52', 'return');
INSERT INTO `records` VALUES ('28', '复变函数与积分变换（第三版）', 'chenquanbao', '2015-06-07 19:47:56', 'return');
INSERT INTO `records` VALUES ('29', '数字信号处理（第三版）', 'chenquanbao', '2015-06-07 19:47:59', 'return');
INSERT INTO `records` VALUES ('30', '云计算与分布式系统：从并行处理到物联网', 'chenquanbao', '2015-06-07 19:48:03', 'return');
INSERT INTO `records` VALUES ('31', '人月神话', 'chenquanbao', '2015-06-07 19:48:07', 'return');
INSERT INTO `records` VALUES ('32', 'Swift 权威指南', 'shibowen', '2015-06-07 19:49:19', 'borrow');
INSERT INTO `records` VALUES ('33', 'Ruby on Rail程序设计技术详解（配光盘）', 'chenquanbao', '2015-06-07 21:34:36', 'borrow');
INSERT INTO `records` VALUES ('34', 'Ruby on Rail程序设计技术详解（配光盘）', 'chenquanbao', '2015-06-07 21:35:12', 'return');
INSERT INTO `records` VALUES ('35', 'HTML5程序设计(第2版)', 'chenquanbao', '2015-06-07 21:52:59', 'borrow');
INSERT INTO `records` VALUES ('36', 'Ruby on Rail程序设计技术详解（配光盘）', 'chenquanbao', '2015-06-07 21:53:07', 'borrow');
INSERT INTO `records` VALUES ('37', 'HTML5程序设计(第2版)', 'chenquanbao', '2015-06-07 21:53:44', 'return');
INSERT INTO `records` VALUES ('38', 'Android 4编程入门经典', '1234567', '2015-06-08 00:11:36', 'borrow');
INSERT INTO `records` VALUES ('39', 'Android 4编程入门经典', '1234567', '2015-06-08 00:11:43', 'return');
INSERT INTO `records` VALUES ('40', '操作系统', '1234567', '2015-06-08 00:11:56', 'borrow');
INSERT INTO `records` VALUES ('41', 'TCP/IP详解（卷2）：实现', '1234567', '2015-06-08 00:12:08', 'borrow');
INSERT INTO `records` VALUES ('42', 'Android 4编程入门经典', '1234567', '2015-06-08 00:12:17', 'borrow');
INSERT INTO `records` VALUES ('43', '计算机网络', '1234567', '2015-06-08 00:12:31', 'borrow');
INSERT INTO `records` VALUES ('44', 'Web信息架构——设计大型网站（第3版）', 'chenquanbao', '2015-06-08 00:18:17', 'borrow');
INSERT INTO `users` VALUES ('1234567', 'asd', 'Student', 'cqb', '930827', 'SSE', 'null', '1208023', 'Beijing');
INSERT INTO `users` VALUES ('chenquanbao', '12080123', 'Student', '陈全保', '19930826', '软件工程', 'null', '12080123', '软件学院');
INSERT INTO `users` VALUES ('ken', 'wsx', 'Admin', 'cqb', '19930826', 'SSE', 'null', '12080123', 'software engineer');
INSERT INTO `users` VALUES ('shibowen', '12080209', 'OtherPeople', '史博文', '930302', '软件工程', 'null', '12080209', '软件学院');
INSERT INTO `users` VALUES ('wangyang', '12080112', 'Student', '王洋', '19930118', '计算技术与科学', 'null', '12080112', '计算机学院');
INSERT INTO `users` VALUES ('xiaguilin', '12080125', 'Admin', '夏桂林', '19930412', '嵌入式', 'null', '12080125', '软件学院');
INSERT INTO `users` VALUES ('yanshuo', '12080208', 'Teacher', '闫硕', '19940419', '数字与媒体', 'null', '12080208', '软件学院');
