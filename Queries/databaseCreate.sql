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
  `vacant` TINYINT(1) NULL DEFAULT 1,
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
  `Rooms_roomID` BIGINT(13) NULL DEFAULT NULL,
  PRIMARY KEY (`courseID`),
  INDEX `fk_Courses_Rooms1_idx` (`Rooms_roomID` ASC),
  UNIQUE INDEX `Rooms_roomID_UNIQUE` (`Rooms_roomID` ASC),
  CONSTRAINT `fk_Courses_Rooms1`
    FOREIGN KEY (`Rooms_roomID`)
    REFERENCES `QAConsultingAcademy_DB`.`Rooms` (`roomID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `QAConsultingAcademy_DB`.`Consultants`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `QAConsultingAcademy_DB`.`Consultants` (
  `consultantID` BIGINT(10) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(255) NOT NULL DEFAULT 'test',
  PRIMARY KEY (`consultantID`),
  UNIQUE INDEX `consultantID_UNIQUE` (`consultantID` ASC),
  UNIQUE INDEX `name_UNIQUE` (`name` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `QAConsultingAcademy_DB`.`Trainers`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `QAConsultingAcademy_DB`.`Trainers` (
  `trainerID` BIGINT(20) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(255) NOT NULL DEFAULT 'test',
  PRIMARY KEY (`trainerID`),
  UNIQUE INDEX `name_UNIQUE` (`name` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `QAConsultingAcademy_DB`.`CompletedCourses`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `QAConsultingAcademy_DB`.`CompletedCourses` (
  `Consultants_consultantID` BIGINT(10) NOT NULL,
  `courseName` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`Consultants_consultantID`, `courseName`),
  INDEX `fk_CompletedCourses_Consultants1_idx` (`Consultants_consultantID` ASC),
  CONSTRAINT `fk_CompletedCourses_Consultants1`
    FOREIGN KEY (`Consultants_consultantID`)
    REFERENCES `QAConsultingAcademy_DB`.`Consultants` (`consultantID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `QAConsultingAcademy_DB`.`Clients`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `QAConsultingAcademy_DB`.`Clients` (
  `Consultants_consultantID` BIGINT(10) NOT NULL,
  `client` VARCHAR(225) NULL DEFAULT 'null',
  PRIMARY KEY (`Consultants_consultantID`),
  INDEX `fk_Clients_Consultants1_idx` (`Consultants_consultantID` ASC),
  CONSTRAINT `fk_Clients_Consultants1`
    FOREIGN KEY (`Consultants_consultantID`)
    REFERENCES `QAConsultingAcademy_DB`.`Consultants` (`consultantID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `QAConsultingAcademy_DB`.`Enrolls`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `QAConsultingAcademy_DB`.`Enrolls` (
  `Consultants_consultantID` BIGINT(10) NOT NULL,
  `courseName` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`Consultants_consultantID`, `courseName`),
  INDEX `fk_CompletedCourses_Consultants1_idx` (`Consultants_consultantID` ASC),
  CONSTRAINT `fk_CompletedCourses_Consultants10`
    FOREIGN KEY (`Consultants_consultantID`)
    REFERENCES `QAConsultingAcademy_DB`.`Consultants` (`consultantID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `QAConsultingAcademy_DB`.`TrainersCourses`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `QAConsultingAcademy_DB`.`TrainersCourses` (
  `Courses_courseID` BIGINT(20) NOT NULL,
  `trainerID` BIGINT(20) NOT NULL,
  PRIMARY KEY (`Courses_courseID`),
  INDEX `fk_TrainersCourses_Courses1_idx` (`Courses_courseID` ASC),
  UNIQUE INDEX `Courses_courseID_UNIQUE` (`Courses_courseID` ASC),
  CONSTRAINT `fk_TrainersCourses_Courses1`
    FOREIGN KEY (`Courses_courseID`)
    REFERENCES `QAConsultingAcademy_DB`.`Courses` (`courseID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
