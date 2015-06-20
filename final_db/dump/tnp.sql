/*
SQLyog Community Edition- MySQL GUI v6.56
MySQL - 5.0.67-community-nt : Database - training_and_placement
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
  `job_designation` varchar(500) default NULL,
  `job_description` varchar(1000) default NULL,
  `location_of_posting` varchar(200) default NULL,
  `basic` int(10) default NULL,
  `hra` int(10) default NULL,
  `gross` int(10) default NULL,
  `others` int(10) default NULL,
  `take_home` int(10) default NULL,
  `ctc` int(10) default NULL,
  `accomodation` int(1) default NULL,
  `bond` int(1) default NULL,
  `bond_duration` int(3) default NULL,
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
  `agency_address` varchar(1000) default NULL,
  `agency_phone` varchar(50) default NULL,
  `agency_fax` varchar(50) default NULL,
  `agency_mobile` varchar(15) default NULL,
  `final_agency_date` date default NULL,
  `agency_year` int(4) default NULL,
  PRIMARY KEY  (`agency_id`),
  UNIQUE KEY `agency_id` (`agency_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC COMMENT='InnoDB free: 10240 kB';

/*Data for the table `agency` */

insert  into `agency`(`agency_id`,`agency_name`,`nature_business`,`agency_website`,`agency_profile`,`job_designation`,`job_description`,`location_of_posting`,`basic`,`hra`,`gross`,`others`,`take_home`,`ctc`,`accomodation`,`bond`,`bond_duration`,`preferred_date_1`,`preferred_date_2`,`no_of_executive`,`shortlist`,`cpi`,`ppt`,`lcd`,`laptop`,`ohp`,`aptitude_test`,`aptitude_duration`,`gd`,`interview`,`no_of_rounds`,`no_of_rooms`,`immediate_result_declaration`,`date_of_result`,`joining_date`,`agency_person`,`agency_email`,`agency_address`,`agency_phone`,`agency_fax`,`agency_mobile`,`final_agency_date`,`agency_year`) values (1,'tcs','it','tcs.com','IT','jk','jkh','jl',NULL,NULL,NULL,NULL,NULL,NULL,1,0,NULL,'2009-06-18','2009-06-19',22,0,22,0,1,0,0,0,22,1,1,22,22,1,'2009-06-25','2009-06-26','asa','utkarsh@gmail.com','sfdas','1231213','2414141','123213414','2009-06-18',2009),(2,'nikon','awesome','www.micro.com','Management','ada','ads','asda',33,33,33,33,33,33,1,1,NULL,'2009-06-23','2009-06-25',33,1,NULL,1,0,0,0,1,NULL,1,1,33,33,1,'2009-06-18','2009-06-25','asd','utkarsh@gmail.com','asda','1234','3131','1234','2009-06-29',NULL),(3,'yahoo','tafri','yahoo.com','IT','asdad','dasd','asdadf',44,44,444,44,44,44,1,0,NULL,'2009-06-16','2009-06-26',44,0,44,0,1,0,0,0,44,1,1,44,44,1,'2009-06-25','2009-06-26','sad','sad@has,com','safaf','21','21','21','2009-06-23',NULL);

/*Table structure for table `appearance` */

DROP TABLE IF EXISTS `appearance`;

CREATE TABLE `appearance` (
  `student_id` int(11) NOT NULL auto_increment,
  `agency_id` int(11) default NULL,
  PRIMARY KEY  (`student_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

/*Data for the table `appearance` */

insert  into `appearance`(`student_id`,`agency_id`) values (3,3);

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

/*Table structure for table `login` */

DROP TABLE IF EXISTS `login`;

CREATE TABLE `login` (
  `username` varchar(100) default NULL,
  `password` varchar(100) default NULL,
  `role_id` int(10) default NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `login` */

insert  into `login`(`username`,`password`,`role_id`) values ('student','student',2),('administrator','administrator',0),('google','google',1);

/*Table structure for table `package_details` */

DROP TABLE IF EXISTS `package_details`;

CREATE TABLE `package_details` (
  `agency_id` int(11) default NULL,
  `department_id` int(2) default NULL,
  `program_id` int(2) default NULL,
  `basic` double default NULL,
  `hra` double default NULL,
  `others` double default NULL,
  `gross` double default NULL,
  `take_home` double default NULL,
  `ctc` double default NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `package_details` */

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
  `agency_id` int(11) default NULL,
  `student_id` int(11) default NULL,
  `location_of_posting` varchar(200) default NULL,
  `basic` double default NULL,
  `hra` double default NULL,
  `others` double default NULL,
  `gross` double default NULL,
  `take_home` double default NULL,
  `ctc` double default NULL,
  `remarks` varchar(1000) default NULL,
  `confirmation` int(1) default NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `placement_record` */

insert  into `placement_record`(`agency_id`,`student_id`,`location_of_posting`,`basic`,`hra`,`others`,`gross`,`take_home`,`ctc`,`remarks`,`confirmation`) values (4,5,'lok',463,346,67,457,457,756,'gfjh',0),(4,5,'gfl,kj',35870,38957,574,457,457,7876,'hfgflg.kj;',0),(4,5,'gfl,kj',35870,38957,574,457,457,7876,'hfgflg.kj;',0),(3,45,'egtrt',35870,25,56,456,235222,22222235,'wetre',1),(2,2,'786',4365,345,3454,5,565,56877,'htiyhuyt',1),(1,2,'gfjgf',6346,43656,2524,3532,32523,5,'ryrey',1),(1,4,'egtrt',35870,324,2524,3532,235222,325,'yuyiti',1),(3,3,'gfl,kj',1237,324,25,235,235222,325,'jyh',1),(2,1,NULL,NULL,NULL,NULL,NULL,NULL,800,NULL,NULL),(4,4,'gjf',4335,123,12123,235,346,345,'fhdt',1),(4,4,'gjf',4335,123,12123,235,346,345,'fhdt',1),(4,3,'45',364,433,4337634,45363,57,576,'gfj',0),(1,7,'68',12,346,145,3462,121,121,'dfd',1),(4,6,'dsav',1231,214,241,214,214,214,'vadsvf',1),(5,6,'sfaf',213,213,2124,2142,214,241,'sdgfsdg',1),(7,1,'1242142',21124,124141,12414,124141,1241241,1241241,'asfsf',1);

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

/*Table structure for table `session` */

DROP TABLE IF EXISTS `session`;

CREATE TABLE `session` (
  `username` varchar(100) default NULL,
  `session_id` varchar(100) default NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `session` */

insert  into `session`(`username`,`session_id`) values ('administrator','1aa37c71c449352078e21f1330c2');

/*Table structure for table `spi_cpi_record` */

DROP TABLE IF EXISTS `spi_cpi_record`;

CREATE TABLE `spi_cpi_record` (
  `student_id` int(10) unsigned NOT NULL,
  `year` int(10) unsigned NOT NULL,
  `semester` int(10) unsigned NOT NULL,
  `spi` float NOT NULL,
  `cpi` float NOT NULL,
  PRIMARY KEY  (`student_id`,`year`,`semester`),
  CONSTRAINT `spi_cpi_record_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `main_student_record` (`student_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `spi_cpi_record` */

/*Table structure for table `student` */

DROP TABLE IF EXISTS `student`;

CREATE TABLE `student` (
  `student_id` int(11) NOT NULL auto_increment,
  `student_roll_number` varchar(11) default NULL,
  `final_agency_id` int(11) default NULL,
  `student_year` int(4) default NULL,
  PRIMARY KEY  (`student_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

/*Data for the table `student` */

insert  into `student`(`student_id`,`student_roll_number`,`final_agency_id`,`student_year`) values (1,'05010116',7,NULL),(2,'05010111',4,NULL),(3,'05010112',5,NULL),(4,'05010113',NULL,2009),(5,'05010114',NULL,2009),(6,'05010119',5,2009),(7,'05010110',NULL,2007);

/*Table structure for table `student_record` */

DROP TABLE IF EXISTS `student_record`;

CREATE TABLE `student_record` (
  `student_id` int(11) NOT NULL auto_increment,
  `student_roll_number` int(9) default NULL,
  `student_name` varchar(100) default NULL,
  `date_of_birth` date default NULL,
  `sex` varchar(8) default NULL,
  `category` varchar(10) default NULL,
  `department_name` varchar(50) default NULL,
  `program_name` varchar(50) default NULL,
  `jee_rank` int(10) default NULL,
  `hostel` varchar(20) default NULL,
  `room_no` int(8) default NULL,
  `email` varchar(200) default NULL,
  `email_alternative` varchar(200) default NULL,
  `contact_number` int(12) default NULL,
  `contact_number2` int(12) default NULL,
  `permanent_address` varchar(1000) default NULL,
  `pin` int(10) default NULL,
  `home_contact_number` int(12) default NULL,
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

/*Data for the table `student_record` */

insert  into `student_record`(`student_id`,`student_roll_number`,`student_name`,`date_of_birth`,`sex`,`category`,`department_name`,`program_name`,`jee_rank`,`hostel`,`room_no`,`email`,`email_alternative`,`contact_number`,`contact_number2`,`permanent_address`,`pin`,`home_contact_number`,`x_board`,`x_medium`,`x_percentage`,`x_pass_year`,`xii_board`,`xii_medium`,`xii_percentage`,`xii_pass_year`,`gap_in_study`,`gap_reason`,`cpi_6sem`,`backlog`,`spi_1sem`,`spi_2sem`,`spi_3sem`,`spi_4sem`,`spi_5sem`,`spi_6sem`,`spi_7sem`,`core_sector`,`govt_sector`,`it_sector`,`management_sector`,`dream_company`) values (1,7010101,'aatish','2009-06-30','1','sc',NULL,NULL,1111,'manas',12,'aaa@aa.com','sadas@asa.com',12,12,'12sdada',1212334,123123,'as','as',12,12,'a','sad',12,12,1,'null',1,1,1,1,1,1,1,1,1,1,2,3,4,'sadsa'),(2,111,'adsada','2009-06-07','1','asd',NULL,NULL,122,'sde',21,'aaa@aa.com','asa',1221,122,'21',12111,12111,'2asd','sda',121,2112,'asd','sad',122,211,NULL,'null',5,4,5,5,5,5,5,5,5,1,2,3,4,'sad'),(3,2222,'menme','2009-06-09','1','sda','Centre for Energy','B.Tech',122,'as',231,'aaa@aa.com','sadas@asa.com',2,2,'12',211,211,'as','as',12,21,'as','as',21,21,NULL,'null',8,8,8,8,8,8,8,8,8,1,2,3,4,'d ');

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
  `average_package` int(4) default NULL,
  `agency_mobile` varchar(15) default NULL,
  PRIMARY KEY  (`agency_id`),
  UNIQUE KEY `agency_id` (`agency_id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=latin1;

/*Data for the table `temporary_agency` */

insert  into `temporary_agency`(`agency_id`,`agency_name`,`agency_website`,`agency_person`,`agency_email`,`agency_phone`,`agency_fax`,`average_package`,`agency_mobile`) values (00000000014,'ranu','ranu.com','ranu','ranu@ranu.com','1234','1234',1345,'1234'),(00000000015,'suppo','suppo','suppo','suppo@suppo.com','1234567','1234567',123456789,'123456'),(00000000018,'suppo','suppo','suppo','suppo@suppo.com','1234','12333333333333',123456789,'12333333333333'),(00000000019,'suppo','suppo','suppo','suppo@suppo.com','1234','12333333333333',123456789,'12333333333333'),(00000000021,'google','www.google.com','utkarsh','utkarsh@gmail.com','0123456789','1357908642',100000,'9876543210');

/*Table structure for table `vacancies` */

DROP TABLE IF EXISTS `vacancies`;

CREATE TABLE `vacancies` (
  `agency_id` int(11) NOT NULL,
  `programme_id` int(2) default NULL,
  `department_id` int(2) default NULL,
  `no_of_vacancies` int(3) default NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `vacancies` */

insert  into `vacancies`(`agency_id`,`programme_id`,`department_id`,`no_of_vacancies`) values (9,NULL,99,5),(10,NULL,99,3);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
