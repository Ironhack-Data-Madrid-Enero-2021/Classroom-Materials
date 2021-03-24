-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`customers`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`customers` (
  `idcustomers` INT NOT NULL,
  `name` VARCHAR(45) NULL,
  `phone_number` VARCHAR(45) NULL,
  `mail` VARCHAR(45) NULL,
  `adress` VARCHAR(45) NULL,
  `city` VARCHAR(45) NULL,
  `state/province` VARCHAR(45) NULL,
  `country` VARCHAR(45) NULL,
  `zip/postal` BIGINT(20) NULL,
  PRIMARY KEY (`idcustomers`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`SalesPerson`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`SalesPerson` (
  `staff_id` INT NOT NULL,
  `name` VARCHAR(45) NULL,
  `store` VARCHAR(45) NULL,
  PRIMARY KEY (`staff_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Invoices`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Invoices` (
  `idInvoices` INT NOT NULL,
  `number` BIGINT(20) NULL,
  `date` VARCHAR(45) NULL,
  `car` INT(11) NULL,
  `customer` INT(11) NULL,
  `salesperson` VARCHAR(45) NULL,
  `customers_idcustomers` INT NOT NULL,
  `SalesPerson_staff_id` INT NOT NULL,
  PRIMARY KEY (`idInvoices`),
  INDEX `fk_Invoices_customers_idx` (`customers_idcustomers` ASC),
  INDEX `fk_Invoices_SalesPerson1_idx` (`SalesPerson_staff_id` ASC),
  CONSTRAINT `fk_Invoices_customers`
    FOREIGN KEY (`customers_idcustomers`)
    REFERENCES `mydb`.`customers` (`idcustomers`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Invoices_SalesPerson1`
    FOREIGN KEY (`SalesPerson_staff_id`)
    REFERENCES `mydb`.`SalesPerson` (`staff_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`cars`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`cars` (
  `idcars` INT NOT NULL,
  `VIN` VARCHAR(45) NULL,
  `manufacturer` VARCHAR(45) NULL,
  `model` VARCHAR(45) NULL,
  `year` INT(11) NULL,
  `color` VARCHAR(45) NULL,
  `Invoices_idInvoices` INT NOT NULL,
  PRIMARY KEY (`idcars`),
  INDEX `fk_cars_Invoices1_idx` (`Invoices_idInvoices` ASC),
  CONSTRAINT `fk_cars_Invoices1`
    FOREIGN KEY (`Invoices_idInvoices`)
    REFERENCES `mydb`.`Invoices` (`idInvoices`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
