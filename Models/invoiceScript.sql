-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema test_db
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema test_db
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `test_db` DEFAULT CHARACTER SET utf8 ;
USE `test_db` ;

-- -----------------------------------------------------
-- Table `test_db`.`test_table`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `test_db`.`test_table` (
  `idtest_table` INT NOT NULL AUTO_INCREMENT,
  `fname` VARCHAR(45) NOT NULL,
  `birthday` DATE NULL,
  PRIMARY KEY (`idtest_table`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `test_db`.`invoice`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `test_db`.`invoice` (
  `invoice_id` INT NOT NULL AUTO_INCREMENT,
  `description` VARCHAR(255) NULL,
  `customer_id` INT NULL,
  `invoicecol` VARCHAR(45) NULL DEFAULT '',
  PRIMARY KEY (`invoice_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `test_db`.`invoice_item`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `test_db`.`invoice_item` (
  `invoice_invoice_id` INT NOT NULL,
  PRIMARY KEY (`invoice_invoice_id`),
  CONSTRAINT `fk_invoice_item_invoice`
    FOREIGN KEY (`invoice_invoice_id`)
    REFERENCES `test_db`.`invoice` (`invoice_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
