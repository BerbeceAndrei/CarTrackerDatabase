-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema car_trackerdb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema car_trackerdb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `car_trackerdb` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `car_trackerdb` ;

-- -----------------------------------------------------
-- Table `car_trackerdb`.`users`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `car_trackerdb`.`users` ;

CREATE TABLE IF NOT EXISTS `car_trackerdb`.`users` (
  `id` INT(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `first_name` VARCHAR(60) NOT NULL,
  `last_name` VARCHAR(60) NOT NULL,
  `email` VARCHAR(60) NOT NULL,
  `password` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `email_UNIQUE` (`email` ASC))
ENGINE = InnoDB
AUTO_INCREMENT = 7
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `car_trackerdb`.`user_cars`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `car_trackerdb`.`user_cars` ;

CREATE TABLE IF NOT EXISTS `car_trackerdb`.`user_cars` (
  `id` INT(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `id_user` INT(11) UNSIGNED NOT NULL,
  `car_name` VARCHAR(45) NOT NULL,
  `longitude` DOUBLE NULL DEFAULT NULL,
  `latitude` DOUBLE NULL DEFAULT NULL,
  `timestamp` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  INDEX `user_to _car_idx` (`id_user` ASC),
  CONSTRAINT `user_to _car`
    FOREIGN KEY (`id_user`)
    REFERENCES `car_trackerdb`.`users` (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 3
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `car_trackerdb`.`cars_history`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `car_trackerdb`.`cars_history` ;

CREATE TABLE IF NOT EXISTS `car_trackerdb`.`cars_history` (
  `id` INT(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `id_car` INT(11) UNSIGNED NOT NULL,
  `longitude` DOUBLE NULL DEFAULT NULL,
  `latitude` DOUBLE NULL DEFAULT NULL,
  `timestamp` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  INDEX `idcar_history_idx` (`id_car` ASC),
  CONSTRAINT `idcar_history`
    FOREIGN KEY (`id_car`)
    REFERENCES `car_trackerdb`.`user_cars` (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 6
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
