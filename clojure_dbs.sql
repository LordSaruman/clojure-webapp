/*
SQLyog Ultimate v10.00 Beta1
MySQL - 5.7.22-0ubuntu0.16.04.1 : Database - clojure_dbs
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`clojure_dbs` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `clojure_dbs`;

/*Table structure for table `bank` */

DROP TABLE IF EXISTS `bank`;

CREATE TABLE `bank` (
  `id_bank` int(11) NOT NULL AUTO_INCREMENT,
  `identification_number` int(11) DEFAULT NULL,
  `bank_name` varchar(255) DEFAULT NULL,
  `max_months` int(11) DEFAULT NULL,
  `max_credit` int(11) DEFAULT NULL,
  `administrative_costs` decimal(10,0) DEFAULT NULL,
  `id_euribor` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_bank`),
  KEY `fk_bank_id_euribor` (`id_euribor`),
  CONSTRAINT `fk_bank_id_euribor` FOREIGN KEY (`id_euribor`) REFERENCES `euribor` (`id_euribor`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=latin1;

/*Data for the table `bank` */

insert  into `bank`(`id_bank`,`identification_number`,`bank_name`,`max_months`,`max_credit`,`administrative_costs`,`id_euribor`) values (1,7759231,'BANCA INTESA',360,300000,'0',1),(2,8063818,'ERSTE BANK',240,350000,'0',1),(3,6876366,'KOMERCIJALNA BANKA',360,280000,'400',1),(4,17335600,'RAIFFEISEN BANKA',360,330000,'0',1),(5,7552335,'SOCIETE GENERALE BANKA ',300,500000,'600',1),(6,222,'222',222,222,'222',2);

/*Table structure for table `codebook` */

DROP TABLE IF EXISTS `codebook`;

CREATE TABLE `codebook` (
  `id_codebook` int(11) NOT NULL AUTO_INCREMENT,
  `id_user` int(11) NOT NULL,
  `id_monthly_rate` int(11) NOT NULL,
  `date` date DEFAULT NULL,
  PRIMARY KEY (`id_codebook`,`id_user`,`id_monthly_rate`),
  KEY `fk_codebook_id_monthly_rate` (`id_monthly_rate`),
  KEY `fk_codebook_id_user` (`id_user`),
  CONSTRAINT `fk_codebook_id_monthly_rate` FOREIGN KEY (`id_monthly_rate`) REFERENCES `monthlyrate` (`id_bank`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_codebook_id_user` FOREIGN KEY (`id_user`) REFERENCES `user` (`id_user`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `codebook` */

/*Table structure for table `euribor` */

DROP TABLE IF EXISTS `euribor`;

CREATE TABLE `euribor` (
  `id_euribor` int(11) NOT NULL AUTO_INCREMENT,
  `year` int(4) DEFAULT NULL,
  `quarter` int(1) DEFAULT NULL,
  `value` decimal(21,20) DEFAULT NULL,
  `id_type_euribora` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_euribor`),
  KEY `fk_id_tipeuribor` (`id_type_euribora`),
  CONSTRAINT `fk_id_tipeuribor` FOREIGN KEY (`id_type_euribora`) REFERENCES `typeeuribor` (`id_type_euribor`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=64 DEFAULT CHARSET=latin1;

/*Data for the table `euribor` */

insert  into `euribor`(`id_euribor`,`year`,`quarter`,`value`,`id_type_euribora`) values (1,2018,1,'-0.00772153100000000000',1),(2,2018,2,'-0.00839181400000000000',1),(3,2018,3,'-0.00902974300000000000',1),(4,2018,4,'-0.00797329600000000000',1),(5,2019,1,'-0.01012278300000000000',1),(6,2019,2,'-0.01081325600000000000',1),(7,2019,3,'-0.01145995100000000000',1),(8,2019,4,'-0.00998389800000000000',1),(9,2020,1,'-0.01252403500000000000',1),(10,2020,2,'-0.01323469800000000000',1),(11,2020,3,'-0.01389015800000000000',1),(12,2020,4,'-0.01199450000000000000',1),(13,2021,1,'-0.01492528700000000000',1),(14,2021,2,'-0.01565614000000000000',1),(15,2021,3,'-0.01632036600000000000',1),(16,2021,4,'-0.01400510200000000000',1),(17,2022,1,'-0.01732653900000000000',1),(18,2022,2,'-0.01807758200000000000',1),(19,2022,3,'-0.01875057300000000000',1),(20,2022,4,'-0.01601570400000000000',1),(21,2023,1,'-0.01972779200000000000',1),(22,2023,2,'-0.02049902400000000000',1),(23,2023,3,'-0.02118078100000000000',1),(24,2023,4,'-0.01802630600000000000',1),(25,2024,1,'-0.02212904400000000000',1),(26,2024,2,'-0.02292046600000000000',1),(27,2024,3,'-0.02361098800000000000',1),(28,2024,4,'-0.02003690800000000000',1),(29,2025,1,'-0.02453029600000000000',1),(30,2025,2,'-0.02534190800000000000',1),(50,2025,3,'-0.02604119500000000000',1),(51,2025,4,'-0.02204750900000000000',1),(52,2026,1,'-0.02693154800000000000',1),(53,2026,2,'-0.02776335000000000000',1),(54,2026,3,'-0.02847140300000000000',1),(55,2026,4,'-0.02405811100000000000',1),(56,2027,1,'-0.02933280000000000000',1),(57,2027,2,'-0.03018479200000000000',1),(58,2027,3,'-0.03090161000000000000',1),(59,2027,4,'-0.02606871300000000000',1),(60,2028,1,'-0.03173405300000000000',1),(61,2028,2,'-0.03260623400000000000',1),(62,2028,3,'-0.03333181800000000000',1),(63,2028,4,'-0.02807931500000000000',1);

/*Table structure for table `interest` */

DROP TABLE IF EXISTS `interest`;

CREATE TABLE `interest` (
  `id_interest` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `value` decimal(5,2) DEFAULT NULL,
  `id_typeinterest` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_interest`),
  KEY `fk_id_tipkamate` (`id_typeinterest`),
  CONSTRAINT `fk_id_tipkamate` FOREIGN KEY (`id_typeinterest`) REFERENCES `typeinterest` (`id_typeinterest`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;

/*Data for the table `interest` */

insert  into `interest`(`id_interest`,`name`,`value`,`id_typeinterest`) values (1,'erste','2.49',1),(2,'komercijalna','2.62',1),(3,'unicredit','2.45',1),(4,'raiffesin','2.82',1),(5,'raiffeisen','4.35',2),(6,'societe','3.99',2),(7,'societe','3.25',3),(8,'banca intesa','2.52',1),(9,'banca intesa','3.55',2),(10,'banca intesa','3.66',3);

/*Table structure for table `investment` */

DROP TABLE IF EXISTS `investment`;

CREATE TABLE `investment` (
  `id_investment` int(11) NOT NULL AUTO_INCREMENT,
  `interest` decimal(10,0) DEFAULT NULL,
  `property_value` int(11) DEFAULT NULL,
  `period_amortization` int(11) DEFAULT NULL,
  `id_user` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_investment`),
  KEY `fk_invest_id_user` (`id_user`),
  CONSTRAINT `fk_invest_id_user` FOREIGN KEY (`id_user`) REFERENCES `user` (`id_user`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `investment` */

/*Table structure for table `monthlyrate` */

DROP TABLE IF EXISTS `monthlyrate`;

CREATE TABLE `monthlyrate` (
  `id_bank` int(11) NOT NULL,
  `id_interest` int(11) NOT NULL,
  `id_monthly_rate` int(11) NOT NULL AUTO_INCREMENT,
  `value` decimal(10,8) DEFAULT NULL,
  PRIMARY KEY (`id_bank`,`id_interest`,`id_monthly_rate`),
  KEY `fk_id_interest` (`id_interest`),
  KEY `id_monthly_rate` (`id_monthly_rate`),
  CONSTRAINT `fk_id_bank` FOREIGN KEY (`id_bank`) REFERENCES `bank` (`id_bank`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_id_interest` FOREIGN KEY (`id_interest`) REFERENCES `interest` (`id_interest`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `monthlyrate` */

/*Table structure for table `mortage` */

DROP TABLE IF EXISTS `mortage`;

CREATE TABLE `mortage` (
  `id_mortage` int(11) NOT NULL AUTO_INCREMENT,
  `period_amortization` int(11) DEFAULT NULL,
  `interest_rate` decimal(10,0) DEFAULT NULL,
  `credit_value` int(11) DEFAULT NULL,
  `id_user` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_mortage`),
  KEY `fk_mortage_id_user` (`id_user`),
  CONSTRAINT `fk_mortage_id_user` FOREIGN KEY (`id_user`) REFERENCES `user` (`id_user`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `mortage` */

/*Table structure for table `typeeuribor` */

DROP TABLE IF EXISTS `typeeuribor`;

CREATE TABLE `typeeuribor` (
  `id_type_euribor` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_type_euribor`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

/*Data for the table `typeeuribor` */

insert  into `typeeuribor`(`id_type_euribor`,`name`) values (1,'Quator euribor'),(2,'3-month euribor'),(3,'6-month euribor');

/*Table structure for table `typeinterest` */

DROP TABLE IF EXISTS `typeinterest`;

CREATE TABLE `typeinterest` (
  `id_typeinterest` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_typeinterest`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

/*Data for the table `typeinterest` */

insert  into `typeinterest`(`id_typeinterest`,`name`) values (1,'Fixed'),(2,'Variabled'),(3,'Combined');

/*Table structure for table `user` */

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `id_user` int(11) NOT NULL AUTO_INCREMENT,
  `name_user` varchar(255) DEFAULT NULL,
  `surname_user` varchar(255) DEFAULT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id_user`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

/*Data for the table `user` */

insert  into `user`(`id_user`,`name_user`,`surname_user`,`username`,`password`,`role`) values (1,'Filip','Ivanovic','filip','filip','admin'),(2,'Marko','Markovic','marko','markic','user');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
