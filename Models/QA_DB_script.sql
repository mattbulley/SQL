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
-- Table `QAConsultingAcademy_DB`.`Room`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `QAConsultingAcademy_DB`.`Room` (
  `roomID` BIGINT(13) NOT NULL AUTO_INCREMENT,
  `vacant` TINYINT(1) NULL,
  PRIMARY KEY (`roomID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `QAConsultingAcademy_DB`.`Course`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `QAConsultingAcademy_DB`.`Course` (
  `courseID` BIGINT(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(225) NOT NULL,
  `start` DATETIME NOT NULL,
  `end` DATETIME NOT NULL,
  `Room_roomID` BIGINT(13) NOT NULL,
  PRIMARY KEY (`courseID`, `Room_roomID`),
  INDEX `fk_Course_Room_idx` (`Room_roomID` ASC),
  UNIQUE INDEX `courseID_UNIQUE` (`courseID` ASC),
  CONSTRAINT `fk_Course_Room`
    FOREIGN KEY (`Room_roomID`)
    REFERENCES `QAConsultingAcademy_DB`.`Room` (`roomID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `QAConsultingAcademy_DB`.`Consultant`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `QAConsultingAcademy_DB`.`Consultant` (
  `consultantID` BIGINT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(255) NOT NULL,
  `clientName` VARCHAR(255) NULL,
  PRIMARY KEY (`consultantID`),
  UNIQUE INDEX `clientName_UNIQUE` (`clientName` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `QAConsultingAcademy_DB`.`Consultant_has_Course`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `QAConsultingAcademy_DB`.`Consultant_has_Course` (
  `Consultant_consultantID` BIGINT(10) NOT NULL,
  `Course_courseID` BIGINT(20) NOT NULL,
  `Course_Room_roomID` BIGINT(13) NOT NULL,
  PRIMARY KEY (`Consultant_consultantID`, `Course_courseID`, `Course_Room_roomID`),
  INDEX `fk_Consultant_has_Course_Course1_idx` (`Course_courseID` ASC, `Course_Room_roomID` ASC),
  INDEX `fk_Consultant_has_Course_Consultant1_idx` (`Consultant_consultantID` ASC),
  CONSTRAINT `fk_Consultant_has_Course_Consultant1`
    FOREIGN KEY (`Consultant_consultantID`)
    REFERENCES `QAConsultingAcademy_DB`.`Consultant` (`consultantID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Consultant_has_Course_Course1`
    FOREIGN KEY (`Course_courseID` , `Course_Room_roomID`)
    REFERENCES `QAConsultingAcademy_DB`.`Course` (`courseID` , `Room_roomID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `QAConsultingAcademy_DB`.`Trainer`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `QAConsultingAcademy_DB`.`Trainer` (
  `trainerID` BIGINT(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(255) NULL,
  `Course_courseID` BIGINT(20) NOT NULL,
  `Course_Room_roomID` BIGINT(13) NOT NULL,
  PRIMARY KEY (`trainerID`, `Course_courseID`, `Course_Room_roomID`),
  INDEX `fk_Trainer_Course1_idx` (`Course_courseID` ASC, `Course_Room_roomID` ASC),
  CONSTRAINT `fk_Trainer_Course1`
    FOREIGN KEY (`Course_courseID` , `Course_Room_roomID`)
    REFERENCES `QAConsultingAcademy_DB`.`Course` (`courseID` , `Room_roomID`)
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
    REFERENCES `QAConsultingAcademy_DB`.`Consultant` (`consultantID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Consultant_has_CompletedCourses_CompletedCourses1`
    FOREIGN KEY (`CompletedCourses_consultantID`)
    REFERENCES `QAConsultingAcademy_DB`.`CompletedCourses` (`consultantID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `QAConsultingAcademy_DB`.`Client`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `QAConsultingAcademy_DB`.`Client` (
  `clientID` BIGINT(20) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(255) NOT NULL,
  `Consultant_consultantID` BIGINT(10) UNSIGNED NOT NULL,
  PRIMARY KEY (`clientID`, `Consultant_consultantID`),
  UNIQUE INDEX `clientID_UNIQUE` (`clientID` ASC),
  INDEX `fk_Client_Consultant1_idx` (`Consultant_consultantID` ASC),
  CONSTRAINT `fk_Client_Consultant1`
    FOREIGN KEY (`Consultant_consultantID`)
    REFERENCES `QAConsultingAcademy_DB`.`Consultant` (`consultantID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
