use vk;

-- ЗАДАЧА 1 в конце
-- Задача 2
select distinct firstname
from users
order by firstname;

-- Задача 3
update profiles 
set is_active = '0'
where birthday > '01.01.2002';

-- Задача 4
delete from messages
where created_at = curdate();

-- ЗАДАЧА 1

-- Generation time: Wed, 12 Feb 2020 21:11:28 +0000
-- Host: mysql.hostinger.ro
-- DB name: u574849695_25
/*!40030 SET NAMES UTF8 */;
/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

DROP TABLE IF EXISTS `communities`;
CREATE TABLE `communities` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `odmen_user_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `odmen_user_id` (`odmen_user_id`),
  CONSTRAINT `communities_ibfk_1` FOREIGN KEY (`odmen_user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `communities` VALUES ('1','amet','1'),
('2','magni','2'),
('3','aut','3'),
('4','voluptate','4'),
('5','vero','5'),
('6','illum','6'),
('7','iure','7'),
('8','facere','8'),
('9','est','9'),
('10','quas','10'),
('11','cupiditate','11'),
('12','repellendus','12'),
('13','harum','13'),
('14','est','14'),
('15','placeat','15'),
('16','voluptatem','16'),
('17','at','17'),
('18','et','18'),
('19','nisi','19'),
('20','suscipit','20'),
('21','modi','21'),
('22','voluptate','22'),
('23','aliquid','23'),
('24','eligendi','24'),
('25','adipisci','25'); 


DROP TABLE IF EXISTS `friend_requess`;
CREATE TABLE `friend_requess` (
  `initiator_user_id` bigint(20) unsigned NOT NULL,
  `target_user_id` bigint(20) unsigned NOT NULL,
  `status` enum('requested','approved','unfriended','declined') COLLATE utf8_unicode_ci DEFAULT NULL,
  `requested_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL ON UPDATE current_timestamp(),
  PRIMARY KEY (`initiator_user_id`,`target_user_id`),
  KEY `initiator_user_id` (`initiator_user_id`),
  KEY `target_user_id` (`target_user_id`),
  CONSTRAINT `friend_requess_ibfk_1` FOREIGN KEY (`initiator_user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `friend_requess_ibfk_2` FOREIGN KEY (`target_user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `friend_requess` VALUES ('1','1','','1983-01-11 23:29:04','1981-03-29 21:22:30'),
('2','2','','1972-06-12 17:18:26','1999-01-18 01:36:54'),
('3','3','','1997-09-04 19:57:46','1978-01-30 11:55:35'),
('4','4','','1999-01-11 09:11:37','1989-09-23 11:34:08'),
('5','5','','2017-08-08 15:34:33','2015-03-30 11:10:07'),
('6','6','','1994-03-22 21:40:58','2004-08-10 16:57:13'),
('7','7','','1994-10-27 06:22:44','2018-06-09 11:49:40'),
('8','8','','1998-12-02 10:06:37','2006-02-19 15:39:28'),
('9','9','','1995-12-17 08:26:47','1997-12-28 08:09:44'),
('10','10','','1996-11-12 01:12:08','1976-12-15 12:33:43'),
('11','11','','2002-03-10 11:13:40','1976-09-10 19:46:31'),
('12','12','','1980-05-19 18:36:51','1998-04-05 11:55:50'),
('13','13','','1992-08-06 18:30:35','2010-04-24 08:46:30'),
('14','14','','2018-11-04 13:42:37','2017-06-27 18:58:07'),
('15','15','','1998-08-14 03:29:53','1994-10-16 11:34:52'),
('16','16','','2001-06-08 01:47:43','1995-06-21 20:04:28'),
('17','17','','1992-11-02 07:08:54','1978-03-28 15:36:04'),
('18','18','','2016-06-24 04:16:40','2012-01-31 23:27:14'),
('19','19','','1978-10-07 11:55:10','1984-03-30 05:21:12'),
('20','20','','1973-06-24 13:04:05','2017-03-28 01:21:07'),
('21','21','','1973-07-08 14:53:27','2005-05-03 13:23:16'),
('22','22','','2013-05-25 08:37:57','1975-11-14 03:07:53'),
('23','23','','1989-08-13 07:36:03','2009-02-08 10:15:10'),
('24','24','','1973-10-04 22:48:34','1994-10-28 16:27:37'),
('25','25','','1984-10-09 20:18:16','1983-12-05 02:10:34'); 


DROP TABLE IF EXISTS `likes`;
CREATE TABLE `likes` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL,
  `media_id` bigint(20) unsigned NOT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `likes` VALUES ('1','1','1','1972-09-04 07:58:30'),
('2','2','2','1987-09-21 06:30:16'),
('3','3','3','2004-04-04 03:10:34'),
('4','4','4','1973-08-03 20:35:34'),
('5','5','5','1991-09-08 03:46:03'),
('6','6','6','1987-09-03 18:24:10'),
('7','7','7','2015-07-21 14:34:36'),
('8','8','8','1971-08-01 04:57:55'),
('9','9','9','1995-07-06 17:57:22'),
('10','10','10','1994-04-10 05:18:49'),
('11','11','11','1970-06-01 13:08:36'),
('12','12','12','2011-11-26 17:08:34'),
('13','13','13','2017-11-04 07:38:41'),
('14','14','14','1980-09-02 06:33:23'),
('15','15','15','2007-05-28 17:00:51'),
('16','16','16','2016-11-30 21:17:06'),
('17','17','17','1992-11-30 16:14:33'),
('18','18','18','1995-05-10 03:49:21'),
('19','19','19','2001-01-06 04:23:27'),
('20','20','20','1976-11-27 03:31:03'),
('21','21','21','2014-11-23 23:00:26'),
('22','22','22','2013-08-17 00:49:48'),
('23','23','23','1974-07-26 20:23:14'),
('24','24','24','2006-12-10 13:40:46'),
('25','25','25','2006-12-06 00:09:10'); 


DROP TABLE IF EXISTS `media`;
CREATE TABLE `media` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `media_type_id` bigint(20) unsigned NOT NULL,
  `user_id` bigint(20) unsigned NOT NULL,
  `body` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `filename` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `size` int(11) DEFAULT NULL,
  `metadata` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `media_type_id` (`media_type_id`),
  CONSTRAINT `media_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `media_ibfk_2` FOREIGN KEY (`media_type_id`) REFERENCES `media_types` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `media` VALUES ('1','1','1','Et consequatur vitae doloribus magni. Aperiam quod quod iure sed soluta facilis necessitatibus. Consequatur occaecati hic dolor consectetur similique.','rerum','33510718',NULL,'1982-11-30 23:19:42'),
('2','2','2','Ut quas et aut. Eligendi laudantium quia qui eius ratione deleniti.','repellendus','46561134',NULL,'2012-09-10 20:46:50'),
('3','3','3','Ut non unde dolore vel. Nisi consequatur dolores reiciendis laborum dolor ipsum. Delectus officia necessitatibus fuga error in.','in','0',NULL,'1981-12-19 11:42:07'),
('4','4','4','Officiis eligendi accusantium est. Veniam fugiat voluptate commodi omnis. Tenetur hic enim incidunt voluptatem consequatur dolorum tenetur architecto.','possimus','0',NULL,'2013-09-28 12:16:46'),
('5','5','5','Similique quibusdam dicta minus distinctio reprehenderit numquam rerum quae. Optio cupiditate quasi sunt et magnam. Ea rem quia at vel quaerat ipsa ipsum. Voluptatem perspiciatis a autem.','aspernatur','98',NULL,'2018-11-09 03:00:43'),
('6','6','6','Voluptates voluptatem tenetur necessitatibus voluptate dolorem ratione dolores fugit. Et accusantium optio accusamus culpa vel officiis consectetur. Pariatur qui quia sed est aperiam quis.','exercitationem','797989080',NULL,'1992-12-30 02:11:04'),
('7','7','7','Facilis eum quia assumenda ut quia natus. Cum ut consequatur quia architecto iure maiores esse. Ut sunt mollitia maiores accusantium ad eum dolores.','nisi','2311',NULL,'2010-08-15 18:21:55'),
('8','8','8','Odit officia occaecati eius consequatur omnis et nisi temporibus. Inventore dolorem ad est sapiente. Quo quisquam voluptas error aut porro. Omnis voluptas nulla est et soluta distinctio dolores.','eaque','4256',NULL,'1989-03-31 17:52:49'),
('9','9','9','Omnis qui praesentium ea voluptas. Eius autem sunt inventore eligendi quia. Aliquam ipsum mollitia sed sit corporis libero perspiciatis. Placeat id nostrum quos odio.','sunt','6560130',NULL,'2016-09-07 20:14:39'),
('10','10','10','Similique adipisci incidunt occaecati in vel. In qui sit quas sit eos. Rerum autem et iusto quis deleniti ea quos.','vitae','853893530',NULL,'1988-10-10 10:17:35'),
('11','11','11','Eum necessitatibus voluptatem expedita amet sapiente. Aperiam hic eos voluptates voluptates numquam iste commodi. Dolor enim qui velit itaque labore sunt illum. Cum rerum recusandae labore eligendi voluptatem.','asperiores','448978',NULL,'2017-11-24 15:15:29'),
('12','12','12','Eveniet cumque exercitationem sit et ab non qui. Perspiciatis et nulla tempore ut sed voluptatibus.','ratione','1470501',NULL,'1996-03-21 08:47:07'),
('13','13','13','Tempora odit nemo omnis. Quae tenetur sit quod reiciendis repellat. Dolorem ipsam amet dolorem consequatur fuga aliquam nulla inventore. Enim id et et tempora ad quia.','sed','976229',NULL,'1988-08-07 20:46:38'),
('14','14','14','Hic laudantium veniam id amet consequatur sit. Molestiae laborum omnis excepturi sed quae rerum sint repellendus. Voluptatem voluptates debitis error aperiam exercitationem tenetur. Reprehenderit consequatur maxime animi omnis est impedit placeat ut.','unde','1418',NULL,'1975-01-31 02:33:12'),
('15','15','15','Consequatur voluptatum debitis tempore rerum repellendus enim beatae. Quibusdam itaque porro beatae architecto amet expedita corrupti. Eum in harum non earum inventore eius. Labore unde necessitatibus perferendis officiis doloremque assumenda. Qui voluptas assumenda modi eum hic ut suscipit quibusdam.','est','74889425',NULL,'1987-04-02 11:36:40'),
('16','16','16','Quasi ut qui nam repellendus est odio est. Animi voluptatibus ut nobis fugiat. Soluta et sint exercitationem hic aut cupiditate voluptates vel.','sunt','94737',NULL,'1985-09-23 20:03:42'),
('17','17','17','Excepturi modi omnis rerum ea. Eum cum dolore sed sit a esse. Minus nesciunt et eveniet consectetur et assumenda consequatur.','quisquam','14',NULL,'1977-03-19 18:19:58'),
('18','18','18','Illo fuga et sit est in. Consequatur omnis unde laborum quia veniam suscipit quos distinctio. Consequatur modi excepturi quo aut cum ea.','maiores','25052',NULL,'2001-09-08 20:06:22'),
('19','19','19','Eligendi qui autem deleniti beatae dolor sed autem. Maxime vero repudiandae sed dignissimos quibusdam dolore ut. Iste id et non ea dicta ullam. Ut consequatur atque quas.','laudantium','93914',NULL,'2001-09-27 11:44:20'),
('20','20','20','Eligendi et tenetur quod autem impedit possimus. Dolorem dolores consequatur in est consequatur.','quia','567',NULL,'1986-09-26 02:23:23'),
('21','21','21','Quos repellendus dolore aliquam aut necessitatibus accusamus. Est ipsa earum dicta aliquid nemo blanditiis inventore. Dolores id placeat fuga sit.','laudantium','82390',NULL,'1989-06-09 23:25:28'),
('22','22','22','Doloremque harum enim enim illo error cumque autem. A omnis omnis aspernatur eum dolor illo nobis. Dolor ea animi dolores sed repellendus. Ipsum consequuntur quisquam sunt laboriosam eos. Ratione repellat harum mollitia aliquam.','eos','672',NULL,'1982-02-26 05:17:20'),
('23','23','23','Et sunt mollitia optio ut. Voluptate dolores quisquam labore facere magni. Cupiditate possimus sed et maiores libero dolores. Ipsum et expedita corporis autem dolorem.','qui','434',NULL,'1993-02-23 05:10:23'),
('24','24','24','Minus repudiandae voluptatem voluptatem adipisci qui facilis quis sed. Non vero enim quas rerum voluptate nesciunt voluptas eos. Debitis qui non harum aliquid molestiae ut perferendis. Quod est debitis tempore ab culpa.','natus','85349',NULL,'2010-09-15 09:29:53'),
('25','25','25','Impedit sit consequatur nemo consequatur nesciunt. Similique natus sed error iusto dolorum natus vero. Omnis vel molestiae atque explicabo quia ullam ducimus. Quod in exercitationem pariatur reiciendis.','provident','3',NULL,'1979-10-25 09:17:55'); 


DROP TABLE IF EXISTS `media_types`;
CREATE TABLE `media_types` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `media_types` VALUES ('1','nisi'),
('2','qui'),
('3','rerum'),
('4','consequuntur'),
('5','velit'),
('6','earum'),
('7','natus'),
('8','et'),
('9','tempora'),
('10','rem'),
('11','nostrum'),
('12','provident'),
('13','necessitatibus'),
('14','accusantium'),
('15','odit'),
('16','delectus'),
('17','repellat'),
('18','molestias'),
('19','necessitatibus'),
('20','itaque'),
('21','et'),
('22','minima'),
('23','animi'),
('24','iusto'),
('25','dicta'); 


DROP TABLE IF EXISTS `messages`;
CREATE TABLE `messages` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `from_user_id` bigint(20) unsigned NOT NULL,
  `to_user_id` bigint(20) unsigned NOT NULL,
  `body` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `from_user_id` (`from_user_id`),
  KEY `to_user_id` (`to_user_id`),
  CONSTRAINT `messages_ibfk_1` FOREIGN KEY (`from_user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `messages_ibfk_2` FOREIGN KEY (`to_user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `messages` VALUES ('1','1','1','Et esse est molestiae ut ipsam repudiandae nesciunt. Magni et in non qui ipsum qui deleniti. Et dolorem non in esse quae.','1999-12-22 03:05:37'),
('2','2','2','Velit non temporibus quis quia provident possimus. Dolor delectus dolores cum totam fugit. Laborum et ex aspernatur neque consequatur doloremque. Eveniet consequatur quasi suscipit.','1982-01-06 04:57:29'),
('3','3','3','Qui quasi dolorum fugiat nemo. Provident veritatis aut omnis magnam veniam officiis. Qui dignissimos quis aut cum veritatis.','2013-09-04 06:44:50'),
('4','4','4','Quis deleniti qui aliquid sint dolores et. Et numquam quisquam dolor tenetur sunt. Et aut fugit ipsa voluptas veniam. Voluptatem laboriosam sequi veritatis sequi.','1982-08-03 22:33:12'),
('5','5','5','Aut doloribus dolor deleniti consequatur. Officiis ut earum quia et aut. Exercitationem aperiam minus repellat maxime autem neque vel. Et non magnam quod est rerum ea et aut.','2016-11-02 06:00:08'),
('6','6','6','Labore assumenda ut quam. Qui animi est et aspernatur quod expedita qui. Consequatur illo libero magnam perferendis nostrum.','1978-06-22 11:54:44'),
('7','7','7','Fuga aspernatur laborum occaecati natus laudantium. Ab accusamus mollitia sint. Voluptates nobis cumque nulla.','2001-05-12 11:04:39'),
('8','8','8','Corporis quo omnis modi est maxime laudantium. Laboriosam itaque deserunt quidem pariatur aperiam. Quos laborum voluptas at nam molestiae.','1996-02-18 01:11:50'),
('9','9','9','Dolorem veritatis quasi excepturi enim eligendi voluptatem. Ratione quidem doloribus aut quia dignissimos et.','2011-05-18 03:05:12'),
('10','10','10','Excepturi recusandae ut occaecati quae ut beatae doloribus natus. Perferendis voluptatum quibusdam vel molestiae. Voluptatibus nihil omnis cupiditate nisi nesciunt.','1985-07-01 15:40:47'),
('11','11','11','At amet ea deserunt explicabo. Rerum quibusdam deleniti adipisci aspernatur. Placeat dolorum nam ea sapiente repudiandae accusantium.','2010-05-03 02:12:12'),
('12','12','12','Amet sed vel qui. Commodi sed pariatur dolorem magnam officia laudantium aliquid. Est quia veniam voluptas aperiam et. Sit eaque velit dolore quasi aperiam quae est.','1982-06-18 22:52:43'),
('13','13','13','Odio architecto quam nisi velit optio ex facilis nesciunt. Officia non cum laboriosam voluptatibus dignissimos iusto et. Et quaerat qui exercitationem rerum.','1985-11-10 13:42:55'),
('14','14','14','Natus quisquam odio vel magnam iure. Qui atque voluptatibus omnis quia architecto ut ut. Consequatur excepturi qui nesciunt.','2002-07-09 11:55:16'),
('15','15','15','Ipsa perferendis et eum et. Voluptatem rerum distinctio aperiam qui error laboriosam. Corporis laboriosam possimus ut deserunt.','1992-11-07 10:42:03'),
('16','16','16','Ut nihil voluptatibus laborum dignissimos. Et laboriosam similique et eius quisquam laborum. Fugiat aut iure saepe. Illo quisquam voluptatem optio non.','1979-12-25 11:26:36'),
('17','17','17','Cumque aut dolor sit dolore. Ut qui sint et fuga reprehenderit ut.','1984-06-19 06:31:24'),
('18','18','18','Maiores perspiciatis sapiente quo amet vitae necessitatibus. Accusamus velit occaecati ipsum vel placeat voluptas aut. Vero accusantium vel esse repudiandae. Necessitatibus ea deserunt cum ab quia unde. Est eum consequatur numquam ut et eligendi natus.','2018-02-12 18:58:05'),
('19','19','19','Dignissimos ut aliquam voluptatibus eligendi. Non tempore ut eos et minus enim accusamus.','1980-07-03 18:24:07'),
('20','20','20','Aut qui nihil porro reprehenderit qui quibusdam. Tenetur ratione beatae optio sequi voluptatem iusto provident quas. Beatae commodi ut et omnis harum voluptatum. Non rerum velit et quae consequatur sunt earum.','1978-01-26 10:22:37'),
('21','21','21','Qui et in sit et rerum et possimus. Soluta enim autem sequi. Ut corrupti sunt accusamus velit.','1977-12-10 17:27:29'),
('22','22','22','Labore odio harum minus cumque. Ipsa voluptatem rem vitae quasi omnis reprehenderit consequatur voluptatem. Atque exercitationem ipsam qui facere error quia incidunt. Voluptatem et eos veniam.','1989-12-22 03:06:33'),
('23','23','23','Magnam et quia fuga minima praesentium omnis rerum. Sit quibusdam sint ea ullam aut sapiente quis ducimus. Quod quas tempora id sint explicabo. Praesentium hic qui autem tempore et reprehenderit.','1994-02-18 16:46:59'),
('24','24','24','Cupiditate fugiat sint aut qui. Deserunt rerum consequuntur eveniet qui et ducimus natus. Quidem mollitia repudiandae sed fuga dolorem qui sed. Minima voluptas excepturi earum voluptas quod libero.','1993-03-09 19:20:42'),
('25','25','25','Rerum quis aliquam qui quaerat aperiam sed non provident. Nobis odio officia rerum reiciendis voluptates. Ut quas molestiae id sunt quisquam expedita maxime. Fugit ut eius dolores maiores ut incidunt.','1990-08-20 09:59:38'); 


DROP TABLE IF EXISTS `profiles`;
CREATE TABLE `profiles` (
  `user_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `gender` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `birthday` date DEFAULT NULL,
  `photo_id` bigint(20) unsigned DEFAULT NULL,
  `hometown` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  PRIMARY KEY (`user_id`),
  CONSTRAINT `fk_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `profiles` VALUES ('1',NULL,'1999-07-28','6',NULL,'1979-09-26 15:21:18'),
('2',NULL,'1984-02-01','9',NULL,'1987-10-04 18:37:25'),
('3',NULL,'1980-04-03','5',NULL,'2019-11-20 22:58:38'),
('4',NULL,'2020-01-04','9',NULL,'1981-03-19 13:08:36'),
('5',NULL,'2017-09-21','7',NULL,'2000-10-07 05:13:13'),
('6',NULL,'1971-01-16','5',NULL,'2018-12-23 18:47:56'),
('7',NULL,'2012-03-24','9',NULL,'2008-06-10 21:41:34'),
('8',NULL,'1976-05-24','8',NULL,'1973-09-03 05:37:39'),
('9',NULL,'2002-11-26','7',NULL,'1994-04-17 08:06:51'),
('10',NULL,'2004-10-25','5',NULL,'2013-12-22 03:10:43'),
('11',NULL,'2000-03-05','0',NULL,'2015-10-01 15:15:54'),
('12',NULL,'2008-09-20','2',NULL,'2013-02-24 02:41:27'),
('13',NULL,'2001-10-17','1',NULL,'2017-08-03 04:17:37'),
('14',NULL,'2001-03-03','2',NULL,'1990-08-02 12:24:38'),
('15',NULL,'2010-12-22','7',NULL,'1979-02-10 10:57:15'),
('16',NULL,'2009-04-01','9',NULL,'2014-01-23 15:59:04'),
('17',NULL,'1984-08-30','2',NULL,'1987-10-11 18:02:20'),
('18',NULL,'1975-11-10','3',NULL,'2015-12-17 19:50:22'),
('19',NULL,'1983-04-13','0',NULL,'1982-04-06 23:04:42'),
('20',NULL,'1992-10-05','2',NULL,'1979-12-22 01:16:52'),
('21',NULL,'1991-10-12','8',NULL,'1972-08-08 21:50:24'),
('22',NULL,'2001-04-07','2',NULL,'1980-05-06 04:21:08'),
('23',NULL,'2007-05-12','3',NULL,'2012-04-06 05:49:08'),
('24',NULL,'1996-08-21','1',NULL,'1970-09-06 16:18:57'),
('25',NULL,'1981-06-08','1',NULL,'2011-06-14 13:35:46'); 


DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `firstname` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `lastname` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `password_hash` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone` varchar(12) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`),
  KEY `users_phone_idx` (`phone`),
  KEY `firstname` (`firstname`,`lastname`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `users` VALUES ('1','Crystal','Spinka','simonis.kamren@example.org','af2a636a527d9e829a332a217c64e6fe01862ef2','892-583-2060'),
('2','Ronaldo','Little','kertzmann.vernice@example.org','f78bc51a2997b69d6258e9694f180bab8e5324e3','789-990-4429'),
('3','Quentin','Leuschke','orie39@example.net','f65c7e1768fcbca1550e4aba5abcc994482fd913','604-265-8915'),
('4','Dayna','Haley','maryam.dach@example.com','a642f78fd3d6522563adb91bc093f0bbb77c7869','544.989.2575'),
('5','Ole','Goldner','brooklyn.kunze@example.org','450b286b7d31e5b0cab434d86a49575692762726','(490)508-025'),
('6','Karolann','Donnelly','gregory.dooley@example.com','25879e7bcf70171eb6e2802df8fd07c002e43d47','1-484-847-73'),
('7','Coleman','Hansen','qschmeler@example.com','dfd1df76592fa41be181208084779ba58564dedb','029.908.4549'),
('8','Marisa','Bartoletti','rstark@example.net','5e3aa8436ca3bf47587828ec9361512cbbd7410f','1-532-826-40'),
('9','Hilma','Streich','emily20@example.com','637a4e8df93cdbe9053028ab87b06ab0df467904','(062)604-530'),
('10','Rashawn','Price','vidal62@example.net','6bbef19438fb000fc9619415cf6f6c8d46a92bff','859-678-1829'),
('11','Trever','Sanford','rosella63@example.com','4b9b3979b13ca9b67eb03a8533a86cbe53a7dd50','107.510.0061'),
('12','Maurice','Considine','ibrown@example.net','06f4f15c035f085b47a3ce489ec58a2e5fbed97c','(698)082-556'),
('13','Nathen','Lowe','jordon.kunde@example.org','b76a64ffcba708c9f731439fb1739aaa7aa3eae4','(696)520-963'),
('14','Lynn','Gutkowski','mohr.zechariah@example.org','c9e6cc8f54aedeb9cf890a427fd4007e05fa6a15','+96(5)850436'),
('15','Walton','Heidenreich','jewell.smith@example.com','d7b24a3ca425133df74c91c9dc684cce32249bc4','(035)439-194'),
('16','Otis','Hickle','hgreenfelder@example.net','c7344106ef6cbdcb7c1dd34614d7a9be7c66eb33','+05(3)515759'),
('17','Brooks','Romaguera','enrique29@example.net','ba009859d686862551b2082e1bcd4d0fb7f262cd','1-667-524-77'),
('18','Trudie','Dietrich','vern16@example.com','1c5b8ae3b230b42b396f06e232ccbcb94e0ee018','644-447-3011'),
('19','Ebony','Moen','samanta65@example.net','1172ea484f754976c1492aa2408b9eaba1d33dd6','1-319-516-78'),
('20','Serenity','Moen','lockman.morton@example.net','450b4b156eba81db31cf46ce8f5cfcaa94a12fe7','511-819-5209'),
('21','Maegan','Altenwerth','marjory58@example.net','285746458f83b964edc92a5af7a8f30aa567b2fe','466-078-0646'),
('22','Bart','Friesen','presley23@example.net','2955c4f6683d3a018be3e785f548026172a3c82f','744.374.3077'),
('23','Van','Hahn','simonis.gideon@example.net','07c4a398d4654a87f3e952b66f3a27b2b10615e8','969.247.0213'),
('24','Chaim','Kuvalis','amparo.o\'connell@example.com','3f7b3394aabb5e8730c2821d7682091786019622','342-325-8505'),
('25','Rebeka','Rempel','prosenbaum@example.net','a9a7c0dff1014e9d399fde2591205cf069ed7ae5','+17(9)809974'),
('26','Kiara','Kuvalis','helena34@example.net','00bcfd5d079bf4c30334abd82b9ea776dacb5a8d','488-254-4793'),
('27','Cassandre','Prohaska','qturner@example.com','7b421c389a0f3da0e2de14275df137860b859111','649.505.6750'),
('28','Gregory','Abshire','qcasper@example.org','2612f72d29fb6bed35ea31b18a6e058bb599538c','+07(4)229726'),
('29','Collin','Crist','roob.orin@example.com','e9b173784c935c21766cf391d5569031282fe7ef','942.175.0684'),
('30','Emiliano','Corwin','quentin.fritsch@example.org','10f9b36af9202e033cdd12ef529cec37557a44dc','1-843-440-25'),
('31','Rosalee','Cassin','jessie23@example.net','e9356566a0d20cc9cea23dfc1de6fd3537b23424','212-693-3098'),
('32','Skylar','Gorczany','rolfson.brooke@example.org','54487001cd75477e83ce6f2d6724940772168bf4','(014)164-652'),
('33','Alexandra','Kunze','fkassulke@example.com','d9244170d8edc0b4c80a3e04d8b4a38a5063da41','1-626-583-52'),
('34','Macie','Langworth','claudine86@example.net','224b623a42ed912f8170d6d45680ea19facde6d3','(143)170-154'),
('35','Velda','Kautzer','hahn.robin@example.org','1c872d0908d13d5e063a36e06adf3168a57062af','354-560-6510'),
('36','Josefa','Dach','orie.dicki@example.net','686e2a14639f6facd85a15e5dd075afeb6e066df','574.410.9780'),
('37','Marianne','Koss','una.effertz@example.org','d857279c0f8e49d33e5e11d96334b63a1900820b','(164)863-358'),
('38','Stephany','Boehm','kane.buckridge@example.com','2ab1bd312500b1cf3482b4e7f0f93c516b4498f5','243.476.7957'),
('39','Manuel','Rutherford','javonte.hudson@example.org','14176851fcd6cdf8c56cc4657515b8d84e3ede22','642-624-7706'),
('40','Monique','Bernhard','akuphal@example.com','5e2e401cfd5fc3410da166b15a0ec65e087b0b65','1-807-942-07'),
('41','Kariane','Parisian','okuneva.jamil@example.net','a98e40c7c8a7e4569111c003fb1fb98008b4d655','736.892.8489'),
('42','Waylon','Hartmann','gladyce.heller@example.com','4c2ef283028de463acfd603d47e425b7cc97d47f','+48(5)259967'),
('43','Melody','Keebler','jrippin@example.org','9bb38fe725b67547cdb4c18439638339edab2ac8','333-620-1874'),
('44','Kian','Balistreri','maverick00@example.net','b0f3b5314b7142ce672389e278cdd690589326ca','1-145-433-59'),
('45','Domenic','Nikolaus','leta53@example.net','c673d1de8b161d4f3b2755540de7231e125f3146','766-593-0072'),
('46','Mariela','Mertz','sylvester.ullrich@example.net','9f111e22fc48bd37e7ded6581786536cdb9f1ec5','112.704.6036'),
('47','Brisa','Green','schaden.mellie@example.net','d6c1c03611ce3bbbf357716944fafde5d31c59d7','004-445-0294'),
('48','Edwardo','Gislason','margarita.schuppe@example.com','7c376f77d6761ddb8380d7b4f81baef0daa183c4','076-541-5965'),
('49','Lacy','Osinski','whuels@example.org','5329b19fb40eaf428047a547afdd08ccbfb6b302','1-115-872-35'),
('50','Emmy','Nicolas','max86@example.net','e5ef6258bda6dd34013557e40392a210d12cdfa0','(201)056-753'),
('51','Kamron','Hand','dhagenes@example.net','1e630065a0357f0a18121136ddbdab6a05287dc1','093.171.1742'),
('52','Greta','Heaney','bauch.frederic@example.net','8f147c94c5c5adc2bd502969bff0e4a77b1579ef','(165)071-730'),
('53','Nakia','Schmidt','dbarrows@example.org','81fdef2f18eaf5e5dfb60cdd78c873447c51cfd1','110.184.0292'),
('54','Esmeralda','Morissette','letitia.erdman@example.com','a6ca6a3a0cc363cab5c0fbac6072478cc9a316d5','+58(3)776181'),
('55','Kenneth','Olson','ora.lebsack@example.com','dce7d48da494dc6fc63cb589b46f55f0587b4934','(800)040-076'),
('56','Dameon','Sanford','ygottlieb@example.net','3521855fd91bdd74e63165f88f2b1ec71fb5a8d0','(154)152-520'),
('57','Stewart','Kohler','wilfred.kassulke@example.org','eb1104861b6bfc3e3e91dca435f4133c8b816f12','(557)641-147'),
('58','Pattie','Connelly','martina13@example.com','ff8f7f88d418f2ad73bcbafa7470c83a63261132','1-187-769-25'),
('59','Christiana','Toy','sienna.cormier@example.com','944d6780ff0542cb2e9714e7196c78a707099f97','1-809-069-58'),
('60','Delta','Macejkovic','block.gaylord@example.com','ea79343991886949793c134520877883541c7bcc','(961)931-512'),
('61','Jovan','Lehner','peter66@example.org','2d25f440c0afd316659e93a822a5d303bb10e615','(778)845-889'),
('62','Chanelle','West','wschaefer@example.com','1bf0aaacf898bb0ef984557e9e0c8baa951c86e9','722.820.8005'),
('63','Rogers','Macejkovic','fwunsch@example.org','5e805df12705452235ed797b0d7f9fdf7198eadd','895-704-0165'),
('64','Domenic','Langworth','alfredo.bode@example.org','e76d92b9c390f5ffd13506758fd285b2f6e1874d','571-450-3925'),
('65','Domenica','Goyette','annalise.mayert@example.com','39d96ba9e894e492023c86f19bc339779660d557','(539)128-623'),
('66','Freida','Smitham','benny69@example.org','ce59a3fe955c7dace607ee7e13ee18a977dafd00','(184)955-965'),
('67','Dorothy','O\'Conner','zschulist@example.net','d8ec12a9e9d5e6b1ff1e1db7649dd47ad829d25d','689.560.4162'),
('68','Sammie','Thompson','braulio.kling@example.net','2d933353bba6e8b0c5bc3f245b51ef9ac9646180','077-983-8422'),
('69','Zella','Sporer','josue88@example.org','437d862caabb86bf61e2b8b3cf7cc5c5ca37d895','1-890-789-27'),
('70','Charlotte','Aufderhar','lemke.shyann@example.org','cb93d253319d08828a96978680414ac0f44e45d2','09689693591'),
('71','Oleta','Ward','lamont20@example.com','df77c5170bb810364bd54105ac0be7f78af9effc','557-163-3587'),
('72','Jeffry','Haag','spagac@example.org','b1e8e749384a3aa14e84beaa499250cea881a73b','821-135-7426'),
('73','Joey','Jaskolski','auer.addison@example.com','2e5f02f27d7cd566dab8f7404110c487975ef516','+61(4)391194'),
('74','Arvilla','Zieme','gayle46@example.com','736b90c99495c8b528d0787e16bf433008023c98','+63(8)763830'),
('75','Retta','Fritsch','pschimmel@example.com','7c3f6d1d3bdb6374c9babbc80b385e1b47009c51','307-978-1788'),
('76','Ashton','Herman','koepp.yasmine@example.net','48b4ba9416746589b99323a91022eb15c077a299','+29(0)122428'),
('77','Darius','Langosh','twiza@example.net','175b167f28026c0aef50ee2810ecb627c97bddef','336-473-3685'),
('78','Lavon','Wiegand','noe.blick@example.com','376e42e97f838fb98a6b55f08a078b4448501c78','632-460-4842'),
('79','Cameron','Hilpert','qbarrows@example.com','3b37b23c629df53bf447aa1b80bfaa8158f18813','(537)254-861'),
('80','Yesenia','Kozey','hwhite@example.net','5ce709972f36a5f23331b632acb378f9c1fed114','1-275-043-84'),
('81','Mozell','Reynolds','eryn.luettgen@example.net','e1b939a3b99be0e100a2efacb67ffa128c2a2319','(005)238-219'),
('82','Dessie','Schmeler','hegmann.katlyn@example.com','54bf97e7ff65a3cdc291d32f5c3320031e95c055','(279)238-803'),
('83','Felicity','Mohr','ziemann.kole@example.org','6500e0140f81c733dfe016e1c7d5892dd2ceb86f','(779)594-502'),
('84','Mazie','Gaylord','dusty.rodriguez@example.net','126a898dbcd18141452d534d51c5a5bdb813d3ce','(430)660-521'),
('85','Abner','Gutkowski','shaniya19@example.org','f1d83b5134a9b1cd23c3837799f0af242efb71ff','935-297-1301'),
('86','Agustina','Funk','mcdermott.marlene@example.net','0d1cd231b79a34afe5edcbfb9b93e63a49ff03d6','1-415-064-71'),
('87','Aditya','Considine','elva84@example.org','45e12e7a18a6abb7544940e67c2d785103b1555d','1-413-328-59'),
('88','Nathanial','Satterfield','olson.carson@example.net','dd23f4cbfc3bc071407f536cab6eab5ca3a58ab8','03887185042'),
('89','Cielo','Parisian','wfahey@example.org','cbf073ed2b146f184b26c35809fdbcb400d74b92','(490)531-401'),
('90','Carissa','Hackett','buddy39@example.net','8d1eb53f21ae08a69299afd230b42654a1dd9448','+97(5)980613'),
('91','Glennie','Beier','arden14@example.net','9560b908e1997bba7e47b6bbbf8aaff59de22a1f','1-764-069-79'),
('92','Bernadine','Hansen','janet.walsh@example.net','9d1f3dc9cde14cabe320ddf2b5ef36dd18071090','+31(7)156022'),
('93','Keanu','Willms','johns.raven@example.org','9825c45c612a0f7a4b7acb83c7abce1b6c49cc72','680-244-4154'),
('94','Jesus','Kautzer','gerlach.hailee@example.com','fa618e6b2e48245a03731f62d0055f4545b075a1','+78(7)186908'),
('95','Elta','Casper','d\'amore.kenyon@example.com','e5fc00f97df02f57234131953564d9641dfb3760','787-317-0951'),
('96','Adrian','Lind','okuneva.lavinia@example.com','ad638a2b87eefef480200d62ab8b6f503b64039f','334.805.7118'),
('97','Keyon','Runte','skiles.eldridge@example.org','c648d621f1c96f7e6aaf6e6c4a1b0feb779c5c83','454.262.2021'),
('98','Armani','Gislason','kovacek.estell@example.com','72221b63697566368dbdc796d9089f02394f0b40','+77(4)266114'),
('99','Britney','Jacobi','lturner@example.org','ab93f2997a688dcd5cd31492637ed557ee47056f','108-302-9033'),
('100','Bette','Weimann','elroy.rolfson@example.org','071ed59de19fd77077d1ba08ee1dd5302b564139','1-083-822-66'); 


DROP TABLE IF EXISTS `users_communities`;
CREATE TABLE `users_communities` (
  `user_id` bigint(20) unsigned NOT NULL,
  `community_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`user_id`,`community_id`),
  KEY `community_id` (`community_id`),
  CONSTRAINT `users_communities_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `users_communities_ibfk_2` FOREIGN KEY (`community_id`) REFERENCES `communities` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `users_communities` VALUES ('1','1'),
('2','2'),
('3','3'),
('4','4'),
('5','5'),
('6','6'),
('7','7'),
('8','8'),
('9','9'),
('10','10'),
('11','11'),
('12','12'),
('13','13'),
('14','14'),
('15','15'),
('16','16'),
('17','17'),
('18','18'),
('19','19'),
('20','20'),
('21','21'),
('22','22'),
('23','23'),
('24','24'),
('25','25'),
('26','1'),
('27','2'),
('28','3'),
('29','4'),
('30','5'),
('31','6'),
('32','7'),
('33','8'),
('34','9'),
('35','10'),
('36','11'),
('37','12'),
('38','13'),
('39','14'),
('40','15'),
('41','16'),
('42','17'),
('43','18'),
('44','19'),
('45','20'),
('46','21'),
('47','22'),
('48','23'),
('49','24'),
('50','25'),
('51','1'),
('52','2'),
('53','3'),
('54','4'),
('55','5'),
('56','6'),
('57','7'),
('58','8'),
('59','9'),
('60','10'),
('61','11'),
('62','12'),
('63','13'),
('64','14'),
('65','15'),
('66','16'),
('67','17'),
('68','18'),
('69','19'),
('70','20'),
('71','21'),
('72','22'),
('73','23'),
('74','24'),
('75','25'),
('76','1'),
('77','2'),
('78','3'),
('79','4'),
('80','5'),
('81','6'),
('82','7'),
('83','8'),
('84','9'),
('85','10'),
('86','11'),
('87','12'),
('88','13'),
('89','14'),
('90','15'),
('91','16'),
('92','17'),
('93','18'),
('94','19'),
('95','20'),
('96','21'),
('97','22'),
('98','23'),
('99','24'),
('100','25'); 




/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;


