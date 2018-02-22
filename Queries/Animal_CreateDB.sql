-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema AnimalAdoptionService
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema AnimalAdoptionService
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `AnimalAdoptionService` DEFAULT CHARACTER SET utf8 ;
USE `AnimalAdoptionService` ;

-- -----------------------------------------------------
-- Table `AnimalAdoptionService`.`Animals`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `AnimalAdoptionService`.`Animals` (
  `animalID` BIGINT(20) NOT NULL AUTO_INCREMENT,
  `type` VARCHAR(255) NOT NULL,
  `name` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`animalID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `AnimalAdoptionService`.`NeuteredAnimals`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `AnimalAdoptionService`.`NeuteredAnimals` (
  `Animals_animalID` BIGINT(20) NOT NULL AUTO_INCREMENT,
  `neutered` TINYINT(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`Animals_animalID`),
  INDEX `fk_NeuteredAnimals_Animals_idx` (`Animals_animalID` ASC),
  CONSTRAINT `fk_NeuteredAnimals_Animals`
    FOREIGN KEY (`Animals_animalID`)
    REFERENCES `AnimalAdoptionService`.`Animals` (`animalID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `AnimalAdoptionService`.`LengthOfStay`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `AnimalAdoptionService`.`LengthOfStay` (
  `Animals_animalID` BIGINT(20) NOT NULL,
  `LengthOfStay` BIGINT(20) NOT NULL DEFAULT -1,
  PRIMARY KEY (`Animals_animalID`),
  INDEX `fk_LengthOfStay_Animals1_idx` (`Animals_animalID` ASC),
  UNIQUE INDEX `Animals_animalID_UNIQUE` (`Animals_animalID` ASC),
  CONSTRAINT `fk_LengthOfStay_Animals1`
    FOREIGN KEY (`Animals_animalID`)
    REFERENCES `AnimalAdoptionService`.`Animals` (`animalID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `AnimalAdoptionService`.`Criteria`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `AnimalAdoptionService`.`Criteria` (
  `Animals_animalID` BIGINT(20) NOT NULL,
  `species` VARCHAR(255) NOT NULL,
  `breed` VARCHAR(255) NOT NULL,
  `age` BIGINT(20) NOT NULL,
  `colour` VARCHAR(255) NOT NULL,
  `gender` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`Animals_animalID`),
  INDEX `fk_Criteria_Animals1_idx` (`Animals_animalID` ASC),
  CONSTRAINT `fk_Criteria_Animals1`
    FOREIGN KEY (`Animals_animalID`)
    REFERENCES `AnimalAdoptionService`.`Animals` (`animalID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
