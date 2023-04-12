-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema RailwaySystemDB
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `RailwaySystemDB` DEFAULT CHARACTER SET utf8 ;
USE `RailwaySystemDB` ;

-- -----------------------------------------------------
-- Table `RailwaySystemDB`.`General User`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `RailwaySystemDB`.`General User` (
  `general_user_id` INT(9) UNSIGNED NOT NULL,
  `username` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`general_user_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `RailwaySystemDB`.`Registered User`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `RailwaySystemDB`.`Registered User` (
  `registered_user_id` INT(9) UNSIGNED NOT NULL,
  `username` VARCHAR(45) NOT NULL,
  `email_address` VARCHAR(45) NOT NULL,
  `password` VARCHAR(45) NOT NULL,
  `contact_details` VARCHAR(45) NOT NULL,
  `travel_history` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`registered_user_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `RailwaySystemDB`.`Role`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `RailwaySystemDB`.`Role` (
  `role_id` INT(9) UNSIGNED NOT NULL,
  `role_name` VARCHAR(45) NOT NULL,
  `user_role` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`role_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `RailwaySystemDB`.`Account`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `RailwaySystemDB`.`Account` (
  `General User` INT(9) UNSIGNED NOT NULL,
  `Registered User` INT(9) UNSIGNED NOT NULL,
  `account_id` TINYINT(1) NOT NULL AUTO_INCREMENT,
  `Role` INT(9) UNSIGNED NULL,
  PRIMARY KEY (`account_id`),
  INDEX `FK_Account_GeneralUser_idx` (`General User` ASC) VISIBLE,
  INDEX `FK_Account_RegisteredUser_idx` (`Registered User` ASC) VISIBLE,
  INDEX `FK_Account_Role_idx` (`Role` ASC) VISIBLE,
  CONSTRAINT `FK_Account_GeneralUser`
    FOREIGN KEY (`General User`)
    REFERENCES `RailwaySystemDB`.`General User` (`general_user_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `FK_Account_RegisteredUser`
    FOREIGN KEY (`Registered User`)
    REFERENCES `RailwaySystemDB`.`Registered User` (`registered_user_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `FK_Account_Role`
    FOREIGN KEY (`Role`)
    REFERENCES `RailwaySystemDB`.`Role` (`role_id`)
    ON DELETE CASCADE
    ON UPDATE SET NULL)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `RailwaySystemDB`.`Route`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `RailwaySystemDB`.`Route` (
  `route_id` INT(9) UNSIGNED NOT NULL,
  `distance` VARCHAR(45) NOT NULL,
  `duration` DATETIME NOT NULL,
  PRIMARY KEY (`route_id`),
  CONSTRAINT `FK_Route_Train`
    FOREIGN KEY (`route_id`)
    REFERENCES `RailwaySystemDB`.`Train` (`train_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `RailwaySystemDB`.`Train Station`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `RailwaySystemDB`.`Train Station` (
  `station_id` INT(9) UNSIGNED NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  `location` VARCHAR(45) NOT NULL,
  `address` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`station_id`),
  CONSTRAINT `FK_TrainStation_Route`
    FOREIGN KEY (`station_id`)
    REFERENCES `RailwaySystemDB`.`Route` (`route_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `RailwaySystemDB`.`Passenger`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `RailwaySystemDB`.`Passenger` (
  `passenger_id` INT(9) UNSIGNED NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  `contact_details` VARCHAR(45) NOT NULL,
  `train_id` INT UNSIGNED NULL,
  PRIMARY KEY (`passenger_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `RailwaySystemDB`.`Train`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `RailwaySystemDB`.`Train` (
  `train_id` INT UNSIGNED NOT NULL,
  `schedule` INT(9) UNSIGNED NULL,
  `route` INT(9) UNSIGNED NOT NULL,
  `capacity` VARCHAR(45) NOT NULL,
  `current_speed` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`train_id`),
  INDEX `FK_Train_TrainStation_idx` (`route` ASC) VISIBLE,
  INDEX `schedule_index` (`schedule` ASC) VISIBLE,
  CONSTRAINT `FK_Train_TrainStation`
    FOREIGN KEY (`route`)
    REFERENCES `RailwaySystemDB`.`Train Station` (`station_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `FK_Train_Passenger`
    FOREIGN KEY (`train_id`)
    REFERENCES `RailwaySystemDB`.`Passenger` (`passenger_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `RailwaySystemDB`.`Train Schedule`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `RailwaySystemDB`.`Train Schedule` (
  `schedule_id` INT(9) UNSIGNED NOT NULL,
  `departure_time` DATETIME NOT NULL,
  `arrival_time` DATETIME NOT NULL,
  `origin_station` VARCHAR(45) NOT NULL,
  `destination` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`schedule_id`),
  INDEX `FK_TrainSchedule_train_idx` (`destination` ASC) VISIBLE,
  CONSTRAINT `FK_TrainSchedule_schedule`
    FOREIGN KEY (`schedule_id`)
    REFERENCES `RailwaySystemDB`.`Train` (`train_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `FK_TrainSchedule_train`
    FOREIGN KEY (`destination`)
    REFERENCES `RailwaySystemDB`.`Train` (`train_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `RailwaySystemDB`.`Carriage`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `RailwaySystemDB`.`Carriage` (
  `carriage_id` INT UNSIGNED NOT NULL,
  `maximum_capacity` VARCHAR(45) NOT NULL,
  `maintenance_records` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`carriage_id`),
  CONSTRAINT `FK_Carriage_Train`
    FOREIGN KEY (`carriage_id`)
    REFERENCES `RailwaySystemDB`.`Train` (`train_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `RailwaySystemDB`.`Employee`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `RailwaySystemDB`.`Employee` (
  `employee_id` INT UNSIGNED NULL,
  `name` INT(10) UNSIGNED NOT NULL,
  `phone_number` VARCHAR(45) NOT NULL,
  `job_title` VARCHAR(45) NOT NULL,
  `salary` VARCHAR(45) NOT NULL,
  INDEX `employee_id_index` (`employee_id` ASC) VISIBLE,
  CONSTRAINT `FK_Employee_Train`
    FOREIGN KEY (`employee_id`)
    REFERENCES `RailwaySystemDB`.`Train` (`schedule`)
    ON DELETE SET NULL
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `RailwaySystemDB`.`Maintenance`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `RailwaySystemDB`.`Maintenance` (
  `maintenance_id` INT UNSIGNED NOT NULL,
  `train_number` TINYINT(3) NOT NULL,
  `start_date` DATETIME NOT NULL,
  `end_date` DATETIME NOT NULL,
  `description` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`maintenance_id`),
  CONSTRAINT `FK_Maintenance_Train`
    FOREIGN KEY (`maintenance_id`)
    REFERENCES `RailwaySystemDB`.`Train` (`train_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `RailwaySystemDB`.`Seat`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `RailwaySystemDB`.`Seat` (
  `seat_id` TINYINT(1) UNSIGNED NOT NULL,
  `class` VARCHAR(45) NULL,
  `train_id` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`seat_id`),
  CONSTRAINT `FK_Seat_Train`
    FOREIGN KEY (`train_id`)
    REFERENCES `RailwaySystemDB`.`Train` (`train_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `RailwaySystemDB`.`Payment`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `RailwaySystemDB`.`Payment` (
  `payment_id` INT(9) UNSIGNED NOT NULL,
  `ticket_id` VARCHAR(45) NOT NULL,
  `payment_method` VARCHAR(45) NOT NULL,
  `amount` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`payment_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `RailwaySystemDB`.`Ticket`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `RailwaySystemDB`.`Ticket` (
  `ticket_id` INT UNSIGNED NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  `train` INT(9) UNSIGNED NOT NULL,
  `seat` TINYINT(1) UNSIGNED NOT NULL,
  `validity_period` DATETIME NOT NULL,
  `ticket_number` TINYINT(1) NOT NULL,
  `payment_id` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`ticket_id`),
  INDEX `FK_Ticket_seat_idx` (`seat` ASC) VISIBLE,
  INDEX `FK_Ticket_Train_idx` (`train` ASC) VISIBLE,
  INDEX `FK_Ticket_Account_idx` (`ticket_number` ASC) VISIBLE,
  CONSTRAINT `FK_Ticket_Seat`
    FOREIGN KEY (`seat`)
    REFERENCES `RailwaySystemDB`.`Seat` (`seat_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `FK_Ticket_Train`
    FOREIGN KEY (`train`)
    REFERENCES `RailwaySystemDB`.`Train Schedule` (`schedule_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `FK_Ticket_Payment`
    FOREIGN KEY (`payment_id`)
    REFERENCES `RailwaySystemDB`.`Payment` (`payment_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `FK_Ticket_Account`
    FOREIGN KEY (`ticket_number`)
    REFERENCES `RailwaySystemDB`.`Account` (`account_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
