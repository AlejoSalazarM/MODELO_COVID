-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema COVID_19
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema COVID_19
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `COVID_19` DEFAULT CHARACTER SET utf8 ;
USE `COVID_19` ;

-- -----------------------------------------------------
-- Table `COVID_19`.`paises`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `COVID_19`.`paises` (
  `idpaises` INT NOT NULL,
  `País` VARCHAR(45) NULL,
  `codigo_pais` INT NULL,
  PRIMARY KEY (`idpaises`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `COVID_19`.`provincia`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `COVID_19`.`provincia` (
  `id_provincia` INT NOT NULL,
  `provincia` VARCHAR(45) NULL,
  `codigo_pais` INT NULL,
  PRIMARY KEY (`id_provincia`),
  INDEX `codigo_pais_idx` (`codigo_pais` ASC) VISIBLE,
  CONSTRAINT `codigo_pais`
    FOREIGN KEY (`codigo_pais`)
    REFERENCES `COVID_19`.`paises` (`codigo_pais`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `COVID_19`.`casos_diarios`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `COVID_19`.`casos_diarios` (
  `idcasos_diarios` INT NOT NULL,
  `fecha` DATETIME(45) NULL,
  `Active` INT(15) NULL,
  `Case_Fatality_Ratio` DECIMAL NULL,
  `Confirmed` INT(15) NULL,
  `Deaths` INT(15) NULL,
  `Incidence_Rate` DECIMAL NULL,
  `Latitude` DECIMAL NULL,
  `Longitude` DECIMAL NULL,
  `Province_State` INT NULL,
  `Recovered` INT NULL,
  PRIMARY KEY (`idcasos_diarios`),
  INDEX `Province_State_idx` (`Province_State` ASC) VISIBLE,
  CONSTRAINT `Province_State`
    FOREIGN KEY (`Province_State`)
    REFERENCES `COVID_19`.`provincia` (`id_provincia`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `COVID_19`.`años`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `COVID_19`.`años` (
  `idaños` INT NOT NULL,
  `codigo_pais` INT NULL,
  `año` INT NULL,
  PRIMARY KEY (`idaños`),
  INDEX `codigo_pais_idx` (`codigo_pais` ASC) VISIBLE,
  CONSTRAINT `codigo_pais`
    FOREIGN KEY (`codigo_pais`)
    REFERENCES `COVID_19`.`paises` (`codigo_pais`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `COVID_19`.`datos_macro`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `COVID_19`.`datos_macro` (
  `iddatos_macro` INT NOT NULL,
  `codigo_pais` INT NULL,
  `health_index` DECIMAL(4) NULL,
  `obese_rate` DECIMAL(4) NULL,
  `suicide_rate` DECIMAL(4) NULL,
  `democracies` DECIMAL(4) NULL,
  `hdr_rate` DECIMAL(4) NULL,
  `life_Exp` DECIMAL(4) NULL,
  `gpi` DECIMAL(4) NULL,
  `iq_rate` DECIMAL(4) NULL,
  `Deaths per 1,000 live births` DECIMAL(4) NULL,
  `gdp_usd` INT NULL,
  `Ipc` DECIMAL(4) NULL,
  PRIMARY KEY (`iddatos_macro`),
  INDEX `codigo_pais_idx` (`codigo_pais` ASC) VISIBLE,
  CONSTRAINT `codigo_pais`
    FOREIGN KEY (`codigo_pais`)
    REFERENCES `COVID_19`.`paises` (`codigo_pais`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
