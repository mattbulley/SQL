-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema QAConsultingAcademy_DB
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema QAConsultingAcademy_DB
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `QAConsultingAcademy_DB` ;
USE `QAConsultingAcademy_DB` ;

-- -----------------------------------------------------
-- Table `QAConsultingAcademy_DB`.`Rooms`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `QAConsultingAcademy_DB`.`Rooms` (
  `roomID` BIGINT(13) NOT NULL AUTO_INCREMENT,
  `vacant` TINYINT(1) NULL,
  PRIMARY KEY (`roomID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `QAConsultingAcademy_DB`.`Courses`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `QAConsultingAcademy_DB`.`Courses` (
  `courseID` BIGINT(20) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(225) NOT NULL,
  `start` DATETIME NOT NULL,
  `end` DATETIME NOT NULL,
  `Room_roomID` BIGINT(13) NOT NULL,
  `Rooms_roomID` BIGINT(13) NOT NULL,
  PRIMARY KEY (`courseID`, `Rooms_roomID`),
  INDEX `fk_Courses_Rooms1_idx` (`Rooms_roomID` ASC),
  CONSTRAINT `fk_Courses_Rooms1`
    FOREIGN KEY (`Rooms_roomID`)
    REFERENCES `QAConsultingAcademy_DB`.`Rooms` (`roomID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `QAConsultingAcademy_DB`.`Clients`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `QAConsultingAcademy_DB`.`Clients` (
  `clientID` BIGINT(20) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`clientID`),
  UNIQUE INDEX `clientID_UNIQUE` (`clientID` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `QAConsultingAcademy_DB`.`Consultants`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `QAConsultingAcademy_DB`.`Consultants` (
  `consultantID` BIGINT(10) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(255) NOT NULL,
  `clientName` VARCHAR(255) NULL,
  `Client_clientID` BIGINT(20) NOT NULL,
  PRIMARY KEY (`consultantID`, `Client_clientID`),
  UNIQUE INDEX `clientName_UNIQUE` (`clientName` ASC),
  INDEX `fk_Consultant_Client1_idx` (`Client_clientID` ASC),
  UNIQUE INDEX `consultantID_UNIQUE` (`consultantID` ASC),
  CONSTRAINT `fk_Consultant_Client1`
    FOREIGN KEY (`Client_clientID`)
    REFERENCES `QAConsultingAcademy_DB`.`Clients` (`clientID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `QAConsultingAcademy_DB`.`Trainers`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `QAConsultingAcademy_DB`.`Trainers` (
  `trainerID` BIGINT(20) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(255) NULL,
  `Courses_courseID` BIGINT(20) NOT NULL,
  `Courses_Rooms_roomID` BIGINT(13) NOT NULL,
  PRIMARY KEY (`trainerID`),
  INDEX `fk_Trainers_Courses1_idx` (`Courses_courseID` ASC, `Courses_Rooms_roomID` ASC),
  CONSTRAINT `fk_Trainers_Courses1`
    FOREIGN KEY (`Courses_courseID` , `Courses_Rooms_roomID`)
    REFERENCES `QAConsultingAcademy_DB`.`Courses` (`courseID` , `Rooms_roomID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `QAConsultingAcademy_DB`.`CompletedCourses`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `QAConsultingAcademy_DB`.`CompletedCourses` (
  `consultantID` BIGINT(10) NOT NULL,
  `courseName` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`consultantID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `QAConsultingAcademy_DB`.`Consultant_has_CompletedCourses`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `QAConsultingAcademy_DB`.`Consultant_has_CompletedCourses` (
  `Consultant_consultantID` BIGINT(10) NOT NULL,
  `CompletedCourses_consultantID` BIGINT(10) NOT NULL,
  PRIMARY KEY (`Consultant_consultantID`, `CompletedCourses_consultantID`),
  INDEX `fk_Consultant_has_CompletedCourses_CompletedCourses1_idx` (`CompletedCourses_consultantID` ASC),
  INDEX `fk_Consultant_has_CompletedCourses_Consultant1_idx` (`Consultant_consultantID` ASC),
  CONSTRAINT `fk_Consultant_has_CompletedCourses_Consultant1`
    FOREIGN KEY (`Consultant_consultantID`)
    REFERENCES `QAConsultingAcademy_DB`.`Consultants` (`consultantID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Consultant_has_CompletedCourses_CompletedCourses1`
    FOREIGN KEY (`CompletedCourses_consultantID`)
    REFERENCES `QAConsultingAcademy_DB`.`CompletedCourses` (`consultantID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `QAConsultingAcademy_DB`.`Consultants_has_Courses`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `QAConsultingAcademy_DB`.`Consultants_has_Courses` (
  `Consultants_consultantID` BIGINT(10) NOT NULL,
  `Consultants_Client_clientID` BIGINT(20) NOT NULL,
  `Courses_courseID` BIGINT(20) NOT NULL,
  `Courses_Rooms_roomID` BIGINT(13) NOT NULL,
  PRIMARY KEY (`Consultants_consultantID`, `Consultants_Client_clientID`, `Courses_courseID`, `Courses_Rooms_roomID`),
  INDEX `fk_Consultants_has_Courses_Courses1_idx` (`Courses_courseID` ASC, `Courses_Rooms_roomID` ASC),
  INDEX `fk_Consultants_has_Courses_Consultants1_idx` (`Consultants_consultantID` ASC, `Consultants_Client_clientID` ASC),
  CONSTRAINT `fk_Consultants_has_Courses_Consultants1`
    FOREIGN KEY (`Consultants_consultantID` , `Consultants_Client_clientID`)
    REFERENCES `QAConsultingAcademy_DB`.`Consultants` (`consultantID` , `Client_clientID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Consultants_has_Courses_Courses1`
    FOREIGN KEY (`Courses_courseID` , `Courses_Rooms_roomID`)
    REFERENCES `QAConsultingAcademy_DB`.`Courses` (`courseID` , `Rooms_roomID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
