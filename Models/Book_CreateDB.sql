-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema BookPublishingCompany
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema BookPublishingCompany
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `BookPublishingCompany` DEFAULT CHARACTER SET utf8 ;
USE `BookPublishingCompany` ;

-- -----------------------------------------------------
-- Table `BookPublishingCompany`.`Authors`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `BookPublishingCompany`.`Authors` (
  `authorsID` BIGINT(10) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`authorsID`),
  UNIQUE INDEX `authorsID_UNIQUE` (`authorsID` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `BookPublishingCompany`.`Earnings`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `BookPublishingCompany`.`Earnings` (
  `Authors_authorsID` BIGINT(10) NOT NULL,
  `earnings` BIGINT(20) NULL DEFAULT 0,
  INDEX `fk_Earnings_Authors_idx` (`Authors_authorsID` ASC),
  PRIMARY KEY (`Authors_authorsID`),
  CONSTRAINT `fk_Earnings_Authors`
    FOREIGN KEY (`Authors_authorsID`)
    REFERENCES `BookPublishingCompany`.`Authors` (`authorsID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `BookPublishingCompany`.`Genres`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `BookPublishingCompany`.`Genres` (
  `Authors_authorsID` BIGINT(10) NOT NULL,
  `genre` VARCHAR(255) NULL DEFAULT 'null',
  `rating` FLOAT NULL DEFAULT NULL,
  INDEX `fk_Genres_Authors1_idx` (`Authors_authorsID` ASC),
  CONSTRAINT `fk_Genres_Authors1`
    FOREIGN KEY (`Authors_authorsID`)
    REFERENCES `BookPublishingCompany`.`Authors` (`authorsID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
