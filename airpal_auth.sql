CREATE DATABASE IF NOT EXISTS airpal;
CREATE DATABASE IF NOT EXISTS airpal_auth;

USE `airpal_auth`;

DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(100) COLLATE utf8_general_ci NOT NULL,
  `email` varchar(200) COLLATE utf8_general_ci NOT NULL,
  `name` varchar(200) COLLATE utf8_general_ci NOT NULL,
  `password` varchar(100) COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username_UNIQUE` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

LOCK TABLES `user` WRITE;
/* creating admin user with default password */
/* INSERT INTO `user` VALUES (1,'admin','admin@email.com','Admin','defaultpassword'); */
UNLOCK TABLES;

DROP TABLE IF EXISTS `roles`;
CREATE TABLE `roles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role` varchar(50) COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

LOCK TABLES `roles` WRITE;
INSERT INTO `roles` VALUES (1,'admin');
INSERT INTO `roles` VALUES (2,'user');
UNLOCK TABLES;

DROP TABLE IF EXISTS `user_roles`;
CREATE TABLE `user_roles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

LOCK TABLES `user_roles` WRITE;
INSERT INTO `user_roles` VALUES (1,1,1);
UNLOCK TABLES;

DROP TABLE IF EXISTS `permissions`;
CREATE TABLE `permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `permission` varchar(100) COLLATE utf8_general_ci NOT NULL,
  `role_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

LOCK TABLES `permissions` WRITE;
INSERT INTO `permissions` VALUES (1,'access',1);
INSERT INTO `permissions` VALUES (2,'read:*:*',1);
INSERT INTO `permissions` VALUES (3,'write:*:*',1);
INSERT INTO `permissions` VALUES (4,'access',2);
INSERT INTO `permissions` VALUES (5,'read:*:*',2);
UNLOCK TABLES;

CREATE USER 'airpal'@'%' IDENTIFIED BY 'defaultpassword';
GRANT ALL PRIVILEGES ON airpal.* TO 'airpal'@'%';
GRANT ALL PRIVILEGES ON airpal_auth.* TO 'airpal'@'%';
FLUSH PRIVILEGES;