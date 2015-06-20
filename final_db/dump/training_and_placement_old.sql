/*
SQLyog Community Edition- MySQL GUI v6.56
MySQL - 5.0.51a-community-nt-log : Database - training_and_placement
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

CREATE DATABASE /*!32312 IF NOT EXISTS*/`training_and_placement` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `training_and_placement`;

/*Table structure for table `agency` */

DROP TABLE IF EXISTS `agency`;

CREATE TABLE `agency` (
  `agency_id` int(11) NOT NULL auto_increment,
  `agency_name` varchar(100) default NULL,
  `nature_business` varchar(100) default NULL,
  `agency_website` varchar(100) default NULL,
  `agency_profile` varchar(1000) default NULL,
  `preferred_date_1` date default NULL,
  `preferred_date_2` date default NULL,
  `no_of_executive` int(2) default NULL,
  `shortlist` int(1) default NULL,
  `cpi` float default NULL,
  `ppt` int(1) default NULL,
  `lcd` int(1) default NULL,
  `laptop` int(1) default NULL,
  `ohp` int(1) default NULL,
  `aptitude_test` int(1) default NULL,
  `aptitude_duration` float default NULL,
  `gd` int(1) default NULL,
  `interview` int(1) default NULL,
  `no_of_rounds` int(2) default NULL,
  `no_of_rooms` int(2) default NULL,
  `immediate_result_declaration` int(1) default NULL,
  `date_of_result` date default NULL,
  `joining_date` date default NULL,
  `agency_person` varchar(100) default NULL,
  `agency_email` varchar(200) default NULL,
  `agency_address` varchar(100) default NULL,
  `agency_phone` varchar(50) default NULL,
  `agency_fax` varchar(50) default NULL,
  `agency_mobile` varchar(15) default NULL,
  `final_agency_date` date default NULL,
  `username` varchar(200) default NULL,
  `password` varchar(200) default NULL,
  `technical_test` int(1) default NULL,
  `technical_duration` int(2) default NULL,
  `file_name` varchar(20) default NULL,
  PRIMARY KEY  (`agency_id`),
  UNIQUE KEY `agency_id` (`agency_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC COMMENT='InnoDB free: 10240 kB';

/*Data for the table `agency` */

insert  into `agency`(`agency_id`,`agency_name`,`nature_business`,`agency_website`,`agency_profile`,`preferred_date_1`,`preferred_date_2`,`no_of_executive`,`shortlist`,`cpi`,`ppt`,`lcd`,`laptop`,`ohp`,`aptitude_test`,`aptitude_duration`,`gd`,`interview`,`no_of_rounds`,`no_of_rooms`,`immediate_result_declaration`,`date_of_result`,`joining_date`,`agency_person`,`agency_email`,`agency_address`,`agency_phone`,`agency_fax`,`agency_mobile`,`final_agency_date`,`username`,`password`,`technical_test`,`technical_duration`,`file_name`) values (2,'nikon','awesome','www.micro.com','Management','2009-06-23','2009-06-25',33,1,2,1,0,0,0,1,NULL,1,1,33,33,1,'2009-06-18','2009-06-25','asd','utkarsh@gmail.com','asda','1234','3131','1234','2009-06-29','nikon','nikon',NULL,NULL,NULL),(3,'yahoo','tafri','yahoo.com','IT','2009-06-16','2009-06-26',44,0,2,0,1,0,0,0,44,1,1,44,44,1,'2009-06-25','2009-06-26','sad','sad@has,com','safaf','21','21','21','2009-06-24','yahoo','yahoo',NULL,NULL,NULL),(4,'tcs','jhandu','tcs.in','IT','2009-06-24','2009-06-25',2,0,1,0,1,0,0,0,21,1,1,2,2,1,'2009-06-26','2009-06-29','tcs','tcs@tcs.com','blaah blaah','1234','1234','1234',NULL,'tcs','tcs',NULL,NULL,NULL),(6,'microsoft',NULL,'microsoft.com','Core(Technical)',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'me','menuw @yahoo.com',NULL,'12345','12345','12345',NULL,'microsoft','microsoft',NULL,NULL,NULL),(7,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'E0105.pdf'),(8,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'E0105.pdf'),(9,'ranu',NULL,'ranu.com','1345',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'ranu','ranu@ranu.com',NULL,'1234','1234','1234',NULL,'null','null',NULL,NULL,NULL);

/*Table structure for table `appearance` */

DROP TABLE IF EXISTS `appearance`;

CREATE TABLE `appearance` (
  `student_id` int(11) default NULL,
  `agency_id` int(11) default NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `appearance` */

insert  into `appearance`(`student_id`,`agency_id`) values (1,3),(2,3),(3,3),(2,2),(4,3);

/*Table structure for table `company_literature` */

DROP TABLE IF EXISTS `company_literature`;

CREATE TABLE `company_literature` (
  `agency_id` int(2) NOT NULL,
  `file_name` varchar(300) default NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Data for the table `company_literature` */

insert  into `company_literature`(`agency_id`,`file_name`) values (3,'GURUGOBINDSINGHINDRAPRASTHAUNIVERSIT.pdf'),(3,'download - Copy.pdf'),(3,'admmodality.pdf'),(6,'REPORT.pdf');

/*Table structure for table `company_ppt` */

DROP TABLE IF EXISTS `company_ppt`;

CREATE TABLE `company_ppt` (
  `agency_name` varchar(200) NOT NULL,
  `file_name` varchar(300) default NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Data for the table `company_ppt` */

insert  into `company_ppt`(`agency_name`,`file_name`) values ('L09-asr.pdf','L09-asr.pdf');

/*Table structure for table `date_requests` */

DROP TABLE IF EXISTS `date_requests`;

CREATE TABLE `date_requests` (
  `agency_id` int(1) NOT NULL,
  `date_request` date NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Data for the table `date_requests` */

insert  into `date_requests`(`agency_id`,`date_request`) values (3,'2009-06-27');

/*Table structure for table `department_record` */

DROP TABLE IF EXISTS `department_record`;

CREATE TABLE `department_record` (
  `department_id` int(10) unsigned NOT NULL auto_increment,
  `department_name` varchar(100) NOT NULL,
  PRIMARY KEY  (`department_id`),
  UNIQUE KEY `department_name` (`department_name`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;

/*Data for the table `department_record` */

insert  into `department_record`(`department_id`,`department_name`) values (6,'Biotechnology'),(13,'Centre for Energy'),(14,'Centre for Environment'),(15,'Centre for Nanotechnology'),(7,'Chemical Engineering'),(10,'Chemistry'),(4,'Civil Engineering'),(1,'Computer Science and Engineering'),(5,'Design'),(2,'Electronics and Communication'),(11,'Humanities and Social Sciences'),(8,'Mathematics'),(3,'Mechanical Engineering'),(9,'Physics'),(12,'Preparatory');

/*Table structure for table `equipments` */

DROP TABLE IF EXISTS `equipments`;

CREATE TABLE `equipments` (
  `agency_id` int(11) default NULL,
  `lcd` int(1) default NULL,
  `laptop` int(1) default NULL,
  `ohp` int(1) default NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `equipments` */

insert  into `equipments`(`agency_id`,`lcd`,`laptop`,`ohp`) values (5,1,0,1),(6,0,1,1),(7,1,1,0),(9,1,0,0),(10,0,0,1);

/*Table structure for table `login` */

DROP TABLE IF EXISTS `login`;

CREATE TABLE `login` (
  `username` varchar(100) default NULL,
  `password` varchar(100) default NULL,
  `role_id` int(10) default NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `login` */

insert  into `login`(`username`,`password`,`role_id`) values ('student','student',2),('administrator','administrator',0),('yahoo','yahoo',1),('tcs','tcs',1),('nikon','nikon',1),('microsoft','microsoft',1),('null','null',1);

/*Table structure for table `package_details` */

DROP TABLE IF EXISTS `package_details`;

CREATE TABLE `package_details` (
  `package_id` int(2) NOT NULL auto_increment,
  `package_name` varchar(200) default NULL,
  `agency_id` int(11) default NULL,
  `department_id` int(2) default NULL,
  `programme_id` int(2) default NULL,
  `vacancy` int(5) default NULL,
  `basic` double default NULL,
  `hra` double default NULL,
  `others` double default NULL,
  `gross` double default NULL,
  `take_home` double default NULL,
  `ctc` double default NULL,
  `accomodation` int(1) default NULL,
  `bond` int(1) default NULL,
  `bond_duration` int(1) default NULL,
  `location_of_posting` varchar(200) default NULL,
  `job_designation` varchar(200) default NULL,
  `job_description` varchar(200) default NULL,
  PRIMARY KEY  (`package_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

/*Data for the table `package_details` */

insert  into `package_details`(`package_id`,`package_name`,`agency_id`,`department_id`,`programme_id`,`vacancy`,`basic`,`hra`,`others`,`gross`,`take_home`,`ctc`,`accomodation`,`bond`,`bond_duration`,`location_of_posting`,`job_designation`,`job_description`) values (1,'hurray',2,1,1,NULL,9999,9999,9999,9999,9999,9999,1,0,21,'hong kong','wow','wow'),(4,'tcs-Btech cs',4,1,1,12,231,213,213,231,241,214,1,0,12,'ny','mnew','new'),(9,'yahoooooooooooohhh',3,1,1,NULL,10000,10000,10000,10000,10000,10000,1,0,2,'ny','hr','fydn'),(10,'yahoo-lolipop',3,1,1,10,10000,10000,10000,10000,10000,10000,1,0,2,'ny','hr','fydn');

/*Table structure for table `permission` */

DROP TABLE IF EXISTS `permission`;

CREATE TABLE `permission` (
  `page_name` varchar(200) NOT NULL,
  `role_id` tinyint(2) NOT NULL,
  `access` int(1) NOT NULL,
  PRIMARY KEY  (`page_name`,`role_id`,`access`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `permission` */

insert  into `permission`(`page_name`,`role_id`,`access`) values ('agecny/agency_date/dates.jsp',0,0),('agecny/agency_date/dates.jsp',1,1),('agecny/agency_date/dates.jsp',2,0),('agecny/change_final_date/change_final_date.jsp',0,0),('agecny/change_final_date/change_final_date.jsp',1,1),('agecny/change_final_date/change_final_date.jsp',2,0),('agency/agency_details/cp.jsp',0,0),('agency/agency_details/cp.jsp',2,0),('agency/agency_details/cp.jsp',101,1),('root/attendance/placement_record.jsp',0,1),('root/attendance/placement_record.jsp',1,0),('root/attendance/placement_record.jsp',2,0),('root/download_agency/download_agency.jsp',0,1),('root/download_agency/download_agency.jsp',1,0),('root/download_agency/download_agency.jsp',2,0),('root/download_student/download_student.jsp',0,1),('root/download_student/download_student.jsp',1,0),('root/download_student/download_student.jsp',2,0),('root/drop_agency/drop.jsp',0,1),('root/drop_agency/drop.jsp',1,0),('root/drop_agency/drop.jsp',2,0),('root/placement_record/record.jsp',0,1),('root/placement_record/record.jsp',1,0),('root/placement_record/record.jsp',2,0),('root/queries/average_package/average_package.jsp',0,1),('root/queries/average_package/average_package.jsp',1,0),('root/queries/average_package/average_package.jsp',2,0),('root/queries/personal_details/placement_query.jsp',0,1),('root/queries/personal_details/placement_query.jsp',1,0),('root/queries/personal_details/placement_query.jsp',2,0),('root/queries/placement_query/placement_query.jsp',0,1),('root/queries/placement_query/placement_query.jsp',1,0),('root/queries/placement_query/placement_query.jsp',2,0),('root/queries/placement_query1/placement_query1.jsp',0,1),('root/queries/placement_query1/placement_query1.jsp',1,0),('root/queries/placement_query1/placement_query1.jsp',2,0),('root/queries/second_card/queries/agency_date/agency_date.jsp',0,1),('root/queries/second_card/queries/agency_date/agency_date.jsp',1,0),('root/queries/second_card/queries/agency_date/agency_date.jsp',2,0),('root/queries/second_card/queries/eligibility_query/eligibility_query.jsp',0,1),('root/queries/second_card/queries/eligibility_query/eligibility_query.jsp',1,0),('root/queries/second_card/queries/eligibility_query/eligibility_query.jsp',2,0),('root/queries/second_card/second_card.jsp',0,1),('root/queries/second_card/second_card.jsp',1,0),('root/queries/second_card/second_card.jsp',2,0),('root/queries/temporary_query/placement_query.jsp',0,1),('root/queries/temporary_query/placement_query.jsp',1,0),('root/queries/temporary_query/placement_query.jsp',2,0),('root/web/read/index_single_upload.jsp',0,1),('root/web/read/index_single_upload.jsp',1,0),('root/web/read/index_single_upload.jsp',2,0),('student/student_registration/student_registration.jsp',0,0),('student/student_registration/student_registration.jsp',1,0),('student/student_registration/student_registration.jsp',2,1);

/*Table structure for table `placement_record` */

DROP TABLE IF EXISTS `placement_record`;

CREATE TABLE `placement_record` (
  `package_id` int(11) default NULL,
  `student_id` int(11) default NULL,
  `location_of_posting` varchar(200) default NULL,
  `remarks` varchar(1000) default NULL,
  `confirmation` int(1) default NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `placement_record` */

insert  into `placement_record`(`package_id`,`student_id`,`location_of_posting`,`remarks`,`confirmation`) values (1,1,'ghy','ghy?????????\r\nbad!!!!!!!',1),(10,1,'ny','sad',1),(10,4,'ny','wow!!',1),(4,6,'ny','woooooooo',1),(9,5,'ny','good',1);

/*Table structure for table `profile` */

DROP TABLE IF EXISTS `profile`;

CREATE TABLE `profile` (
  `profile_id` int(2) NOT NULL auto_increment,
  `profile_name` varchar(200) default NULL,
  PRIMARY KEY  (`profile_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

/*Data for the table `profile` */

insert  into `profile`(`profile_id`,`profile_name`) values (1,'IT'),(2,'Management'),(3,'Govt Sector'),(4,'Core'),(5,'D Company'),(6,'My Own Company');

/*Table structure for table `programme_record` */

DROP TABLE IF EXISTS `programme_record`;

CREATE TABLE `programme_record` (
  `programme_id` int(10) unsigned NOT NULL auto_increment,
  `programme_name` varchar(100) NOT NULL,
  `programme_duration` int(10) unsigned NOT NULL,
  PRIMARY KEY  (`programme_id`),
  UNIQUE KEY `programme_name` (`programme_name`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;

/*Data for the table `programme_record` */

insert  into `programme_record`(`programme_id`,`programme_name`,`programme_duration`) values (1,'B.Tech',4),(2,'M.Tech',2),(3,'Phd',0),(4,'M.Sc',2),(5,'Preparatory',1),(6,'Integrated Msc',5),(7,'B.Des',4),(8,'M.Tech-VLSI',2),(9,'M.Tech-DSP',2),(10,'M.Tech-Machine Design',2),(11,'M.Tech Fluids and Thermal Engineering',2),(12,'M.Tech Structural Engineering',2),(13,'M.Tech Geotechnical Engineering',2),(14,'M.Tech Water Resources: Utilisation and Environmental Engineering',2),(15,'M.Tech Petroleum Refinery Engineering',2),(16,'M.Tech Information Security',2);

/*Table structure for table `role` */

DROP TABLE IF EXISTS `role`;

CREATE TABLE `role` (
  `role_id` tinyint(2) unsigned NOT NULL auto_increment,
  `role_name` varchar(30) default NULL,
  PRIMARY KEY  (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

/*Data for the table `role` */

insert  into `role`(`role_id`,`role_name`) values (0,'administrator'),(1,'google'),(2,'student');

/*Table structure for table `schedule` */

DROP TABLE IF EXISTS `schedule`;

CREATE TABLE `schedule` (
  `schedule_id` int(2) NOT NULL auto_increment,
  `recurring` varchar(1) NOT NULL default 'F',
  `month` varchar(2) NOT NULL,
  `day` varchar(2) NOT NULL,
  `year` varchar(4) NOT NULL,
  `starting_time` varchar(10) NOT NULL,
  `end_time` varchar(10) NOT NULL,
  `company_name` varchar(50) default NULL,
  `description` varchar(50) default NULL,
  PRIMARY KEY  (`schedule_id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

/*Data for the table `schedule` */

insert  into `schedule`(`schedule_id`,`recurring`,`month`,`day`,`year`,`starting_time`,`end_time`,`company_name`,`description`) values (3,'Y','07','03','2009','10:00 AM','11:00 PM','microsoft','interviews'),(2,'Y','07','03','2009','11:00 AM','12:05 PM','Tcs','recruitment');

/*Table structure for table `session` */

DROP TABLE IF EXISTS `session`;

CREATE TABLE `session` (
  `username` varchar(100) default NULL,
  `session_id` varchar(100) default NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `session` */

insert  into `session`(`username`,`session_id`) values ('tcs','09a7a0213435ac50d122eaaccd33'),('microsoft','e70517bc6ce6902c6050d3fcb820'),('student','e70a766594c9d0d75f80d22207bf'),('test','fc4a9ce70ccb0085e30e5fa173f5'),('yahoo','02a4fb7f8e65a067245866abe6a1'),('administrator','43d50fc179bb1c33e2ab32a58a52');

/*Table structure for table `student_record` */

DROP TABLE IF EXISTS `student_record`;

CREATE TABLE `student_record` (
  `student_id` int(11) NOT NULL auto_increment,
  `student_roll_number` int(9) default NULL,
  `student_name` varchar(100) default NULL,
  `date_of_birth` date default NULL,
  `sex` varchar(8) default NULL,
  `category` varchar(10) default NULL,
  `department_id` int(1) default NULL,
  `programme_id` int(1) default NULL,
  `jee_rank` int(10) default NULL,
  `hostel` varchar(20) default NULL,
  `room_no` int(8) default NULL,
  `email` varchar(200) default NULL,
  `email_alternative` varchar(200) default NULL,
  `contact_number` int(100) default NULL,
  `contact_number2` int(100) default NULL,
  `permanent_address` varchar(1000) default NULL,
  `pin` int(10) default NULL,
  `home_contact_number` int(100) default NULL,
  `x_board` varchar(200) default NULL,
  `x_medium` varchar(200) default NULL,
  `x_percentage` float default NULL,
  `x_pass_year` int(4) default NULL,
  `xii_board` varchar(200) default NULL,
  `xii_medium` varchar(200) default NULL,
  `xii_percentage` float default NULL,
  `xii_pass_year` int(4) default NULL,
  `gap_in_study` int(2) default NULL,
  `gap_reason` varchar(200) default NULL,
  `cpi_6sem` double default NULL,
  `backlog` int(4) default NULL,
  `spi_1sem` double default NULL,
  `spi_2sem` double default NULL,
  `spi_3sem` double default NULL,
  `spi_4sem` double default NULL,
  `spi_5sem` double default NULL,
  `spi_6sem` double default NULL,
  `spi_7sem` double default NULL,
  `core_sector` int(1) default NULL,
  `govt_sector` int(1) default NULL,
  `it_sector` int(1) default NULL,
  `management_sector` int(1) default NULL,
  `dream_company` varchar(1000) default NULL,
  PRIMARY KEY  (`student_id`),
  UNIQUE KEY `agency_id` (`student_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

/*Data for the table `student_record` */

insert  into `student_record`(`student_id`,`student_roll_number`,`student_name`,`date_of_birth`,`sex`,`category`,`department_id`,`programme_id`,`jee_rank`,`hostel`,`room_no`,`email`,`email_alternative`,`contact_number`,`contact_number2`,`permanent_address`,`pin`,`home_contact_number`,`x_board`,`x_medium`,`x_percentage`,`x_pass_year`,`xii_board`,`xii_medium`,`xii_percentage`,`xii_pass_year`,`gap_in_study`,`gap_reason`,`cpi_6sem`,`backlog`,`spi_1sem`,`spi_2sem`,`spi_3sem`,`spi_4sem`,`spi_5sem`,`spi_6sem`,`spi_7sem`,`core_sector`,`govt_sector`,`it_sector`,`management_sector`,`dream_company`) values (1,7010101,'aatish','2009-06-30','1','sc',1,1,1111,'manas',12,'aaa@aa.com','sadas@asa.com',12,12,'12sdada',1212334,123123,'as','as',12,12,'a','sad',12,12,1,NULL,1,1,1,1,1,1,1,1,1,1,2,3,4,'sadsa'),(4,7010148,'ted mosby','2009-06-22','1','gen',1,1,1,'dihing',472,'u.srivastava','utkarsh101@gmail.com',12322,12322,'ssss',271201,23221,'icse','eng',100,2004,'cbse','eng',100,2006,1,'null',8.8,0,9,8,9,9,9,9,9,1,2,3,4,'google'),(5,7010146,'sumit','2005-06-07','1','gen',1,1,822,'dihing',45,'s.tomer','sktt@gmail.com',123,123,'up',271201,234,'icse','eng',92,2004,'cbse','eng',84,2006,1,'null',8.8,0,9,8,9,9,9,9,9,1,2,3,4,'google'),(6,7010239,'piyush jain','2009-06-07','0','gen',2,1,1243,'Dihing',49,'asda@gmail.com','ahsaf@gmail.com',4545,4554,'sad',123456,154465,'icse','english',92,2004,'cbse','english',84,2006,1,'null',8.8,0,7.59,8,7.11,6.11,9.1,9.3,9.2,1,2,3,4,'asdasf'),(9,7010237,'asdad','2009-06-14','1','gen',6,7,522,'dihing',21,'sad@sad.com','sad@sad.com',123,123,'sad',247512,123,'asdf','asf',21,2001,'cbse','eng',84,1231,1,'null',2,0,5,1,1,1,1,1,6,2,3,1,4,'ff'),(10,7010219,'asdad','2009-06-14','1','gen',6,7,522,'dihing',21,'sad@sad.com','sad@sad.com',1234567890,1234567890,'sad',247512,123,'asdf','asf',21,2001,'cbse','eng',84,1231,1,NULL,1,0,5,1,1,1,1,1,6,2,3,1,4,'ff');

/*Table structure for table `temporary_agency` */

DROP TABLE IF EXISTS `temporary_agency`;

CREATE TABLE `temporary_agency` (
  `agency_id` int(11) unsigned zerofill NOT NULL auto_increment,
  `agency_name` varchar(100) default NULL,
  `agency_website` varchar(100) default NULL,
  `agency_person` varchar(100) default NULL,
  `agency_email` varchar(200) default NULL,
  `agency_phone` varchar(50) default NULL,
  `agency_fax` varchar(50) default NULL,
  `agency_profile` varchar(20) default NULL,
  `agency_mobile` varchar(15) default NULL,
  `username` varchar(20) default NULL,
  `password` varchar(20) default NULL,
  PRIMARY KEY  (`agency_id`),
  UNIQUE KEY `agency_id` (`agency_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `temporary_agency` */

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
