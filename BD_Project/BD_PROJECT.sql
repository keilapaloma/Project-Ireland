
CREATE SCHEMA `BD_PROJECT`;

use BD_PROJECT;

CREATE TABLE `TB_ADMIN` (
  `ADMIN_code` INT NOT NUll  AUTO_INCREMENT,
  `ADMIN_login` varchar(10) DEFAULT NULL,
  `ADMIN_password` varchar(10) DEFAULT NULL,
  `ADMIN_type` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`ADMIN_code`)
);

CREATE  TABLE `TB_CLIENT` (

  `CLIENT_code` INT NOT NUll  AUTO_INCREMENT,
  `CLIENT_name` VARCHAR(100) NULL,
  `CLIENT_email` VARCHAR(45) NULL,
  `CLIENT_password` VARCHAR(12) NULL,
  `CLIENT_type` VARCHAR(15) NULL,
  PRIMARY KEY (`CLIENT_code`)
  );

CREATE  TABLE `TB_OWNER` (

  `OWNER_code` INT NOT NUll  AUTO_INCREMENT,
  `OWNER_name` VARCHAR(100) NULL,
  `OWNER_phone` VARCHAR(20) NULL,
  `OWNER_email` VARCHAR(45) NULL,
  `OWNER_password` VARCHAR(12) NULL,
  `OWNER_status` INT(1) NULL,
  `OWNER_type` VARCHAR(15) NULL,
  PRIMARY KEY (`OWNER_code`)
  );
  
CREATE TABLE `TB_BUSINESS` (
  `BUSINESS_code` INT NOT NUll  AUTO_INCREMENT,
  `BUSINESS_owner_code` int(11) DEFAULT NULL,
  `BUSSINESS_name` varchar(100) DEFAULT NULL,
  `BUSSINESS_type` varchar(15) DEFAULT NULL,
  `BUSSINESS_country` varchar(20) DEFAULT NULL,
  `BUSSINESS_address` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`BUSINESS_code`),
  KEY `BUSINESS_owner_code_idx` (`BUSINESS_owner_code`),
  CONSTRAINT `BUSINESS_owner_code` FOREIGN KEY (`BUSINESS_owner_code`) REFERENCES `tb_owner` (`OWNER_code`) ON DELETE NO ACTION ON UPDATE NO ACTION
);

CREATE TABLE `TB_SERVICES` (
  `SERVICES_code` INT NOT NUll  AUTO_INCREMENT,
  `SERVICES_business_code` int(11) DEFAULT NULL,
  `SERVICES_name` varchar(100) DEFAULT NULL,
  `SERVICES_value` varchar(12) DEFAULT NULL,
  PRIMARY KEY (`SERVICES_code`),
  KEY `SERVICES_business_code_idx` (`SERVICES_business_code`),
  CONSTRAINT `SERVICES_business_code` FOREIGN KEY (`SERVICES_business_code`) REFERENCES `tb_business` (`BUSINESS_code`) ON DELETE NO ACTION ON UPDATE NO ACTION
);

CREATE TABLE `TB_SCHEDULE` (
  `SCHEDULE_code` INT NOT NUll  AUTO_INCREMENT,
  `SCHEDULE_services_code` int(11) DEFAULT NULL,
  `SCHEDULE_business_code` int(11) DEFAULT NULL,
  `SCHEDULE_client_code` int(11) DEFAULT NULL,
  `SCHEDULE_date` datetime,
  `SCHEDULE_status` int(2) DEFAULT NULL,
  PRIMARY KEY (`SCHEDULE_code`),
  KEY `SCHEDULE_services_code_idx` (`SCHEDULE_services_code`),
  KEY `SCHEDULE_business_code_idx` (`SCHEDULE_business_code`),
  KEY `SCHEDULE_client_code_idx` (`SCHEDULE_client_code`),
  CONSTRAINT `SCHEDULE_services_code` FOREIGN KEY (`SCHEDULE_services_code`) REFERENCES `tb_services` (`SERVICES_code`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `SCHEDULE_business_code` FOREIGN KEY (`SCHEDULE_business_code`) REFERENCES `tb_business` (`BUSINESS_code`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `SCHEDULE_client_code` FOREIGN KEY (`SCHEDULE_client_code`) REFERENCES `tb_client` (`CLIENT_code`) ON DELETE NO ACTION ON UPDATE NO ACTION
);

CREATE TABLE `TB_CENTRAL` (
  `CENTRAL_code` INT NOT NUll  AUTO_INCREMENT,
  `CENTRAL_type` varchar(15) DEFAULT NULL,
  `CENTRAL_description` varchar(500) DEFAULT NULL,
  `CENTRAL_schedule_code` int(11) DEFAULT NULL,
  `CENTRAL_business_code` int(11) DEFAULT NULL,
  `CENTRAL_client_code` int(11) DEFAULT NULL,
   `CENTRAL_admin_code` int(11) DEFAULT NULL,
  `CENTRAL_date_input` datetime,
  `CENTRAL_status` int(2) DEFAULT NULL,
  PRIMARY KEY (`CENTRAL_code`),
  KEY `CENTRAL_schedule_code_idx` (`CENTRAL_schedule_code`),
  KEY `CENTRAL_business_code_idx` (`CENTRAL_business_code`),
  KEY `CENTRAL_client_code_idx` (`CENTRAL_client_code`),
  KEY `CENTRAL_admin_code_idx` (`CENTRAL_admin_code`),
  CONSTRAINT `CENTRAL_schedule_code` FOREIGN KEY (`CENTRAL_schedule_code`) REFERENCES `tb_schedule` (`SCHEDULE_code`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `CENTRAL_business_code` FOREIGN KEY (`CENTRAL_business_code`) REFERENCES `tb_business` (`BUSINESS_code`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `CENTRAL_client_code` FOREIGN KEY (`CENTRAL_client_code`) REFERENCES `tb_client` (`CLIENT_code`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `CENTRAL_admin_code` FOREIGN KEY (`CENTRAL_admin_code`) REFERENCES `tb_admin` (`ADMIN_code`) ON DELETE NO ACTION ON UPDATE NO ACTION
);



