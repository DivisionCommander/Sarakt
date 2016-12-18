-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema basic
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema basic
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `basic` DEFAULT CHARACTER SET utf8 ;
USE `basic` ;

-- -----------------------------------------------------
-- Table `basic`.`descriptions`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `basic`.`descriptions` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `description` VARCHAR(45) NOT NULL DEFAULT 'Blank_description',
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `basic`.`mark`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `basic`.`mark` (
  `id` INT NOT NULL,
  `mark` VARCHAR(10) NOT NULL,
  `desc` INT NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC),
  UNIQUE INDEX `mark_UNIQUE` (`mark` ASC),
  INDEX `fk_mark_descriptions1_idx` (`desc` ASC),
  CONSTRAINT `fk_mark_descriptions1`
    FOREIGN KEY (`desc`)
    REFERENCES `basic`.`descriptions` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `basic`.`attributes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `basic`.`attributes` (
  `id` VARCHAR(3) NOT NULL,
  `name` VARCHAR(15) NOT NULL,
  `mark` INT NOT NULL DEFAULT 0,
  `desc` INT NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC),
  INDEX `fk_attributes_descriptions_idx` (`desc` ASC),
  INDEX `fk_attributes_mark1_idx` (`mark` ASC),
  CONSTRAINT `fk_attributes_descriptions`
    FOREIGN KEY (`desc`)
    REFERENCES `basic`.`descriptions` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_attributes_mark1`
    FOREIGN KEY (`mark`)
    REFERENCES `basic`.`mark` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `basic`.`schools`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `basic`.`schools` (
  `id` INT NOT NULL,
  `name` VARCHAR(20) NOT NULL,
  `inherit` INT NULL DEFAULT NULL,
  `desc` INT NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC),
  UNIQUE INDEX `name_UNIQUE` (`name` ASC),
  INDEX `fk_schools_schools1_idx` (`inherit` ASC),
  INDEX `fk_schools_descriptions1_idx` (`desc` ASC),
  CONSTRAINT `fk_schools_schools1`
    FOREIGN KEY (`inherit`)
    REFERENCES `basic`.`schools` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_schools_descriptions1`
    FOREIGN KEY (`desc`)
    REFERENCES `basic`.`descriptions` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
COMMENT = '			';


-- -----------------------------------------------------
-- Table `basic`.`area_of_efect`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `basic`.`area_of_efect` (
  `id` INT NOT NULL,
  `name` VARCHAR(20) NOT NULL,
  `desc` INT NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `idskill_targets_UNIQUE` (`id` ASC),
  UNIQUE INDEX `skill_targetscol_UNIQUE` (`name` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `basic`.`effect_formula`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `basic`.`effect_formula` (
  `id` INT NOT NULL,
  `formula_object` BLOB NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `basic`.`skills`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `basic`.`skills` (
  `id` INT NOT NULL,
  `name` VARCHAR(15) NOT NULL,
  `level` INT NOT NULL DEFAULT 0,
  `inherit` INT NULL DEFAULT NULL,
  `schools` INT NOT NULL DEFAULT 0,
  `area_id` INT NOT NULL DEFAULT 0,
  `formula_id` INT NOT NULL,
  `desc` INT NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `bane_UNIQUE` (`name` ASC),
  INDEX `fk_skills_skills1_idx` (`inherit` ASC),
  INDEX `fk_skills_schools1_idx` (`schools` ASC),
  INDEX `fk_skills_descriptions1_idx` (`desc` ASC),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC),
  INDEX `fk_skills_area_of_efect1_idx` (`area_id` ASC),
  INDEX `fk_skills_effect_formula1_idx` (`formula_id` ASC),
  CONSTRAINT `fk_skills_skills1`
    FOREIGN KEY (`inherit`)
    REFERENCES `basic`.`skills` (`id`)
    ON DELETE SET NULL
    ON UPDATE CASCADE,
  CONSTRAINT `fk_skills_schools1`
    FOREIGN KEY (`schools`)
    REFERENCES `basic`.`schools` (`id`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE,
  CONSTRAINT `fk_skills_descriptions1`
    FOREIGN KEY (`desc`)
    REFERENCES `basic`.`descriptions` (`id`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE,
  CONSTRAINT `fk_skills_area_of_efect1`
    FOREIGN KEY (`area_id`)
    REFERENCES `basic`.`area_of_efect` (`id`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE,
  CONSTRAINT `fk_skills_effect_formula1`
    FOREIGN KEY (`formula_id`)
    REFERENCES `basic`.`effect_formula` (`id`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE)
ENGINE = InnoDB
COMMENT = '	';


-- -----------------------------------------------------
-- Table `basic`.`class_roles`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `basic`.`class_roles` (
  `id` VARCHAR(1) NOT NULL,
  `name` VARCHAR(15) NOT NULL,
  `desc` INT NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`, `name`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC),
  UNIQUE INDEX `name_UNIQUE` (`name` ASC),
  INDEX `fk_class_roles_descriptions1_idx` (`desc` ASC),
  CONSTRAINT `fk_class_roles_descriptions1`
    FOREIGN KEY (`desc`)
    REFERENCES `basic`.`descriptions` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `basic`.`classes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `basic`.`classes` (
  `id` INT NOT NULL,
  `name` VARCHAR(25) NOT NULL DEFAULT 'new_class',
  `level` INT NULL DEFAULT 0,
  `role_main` VARCHAR(1) NOT NULL DEFAULT 0,
  `role_side` VARCHAR(1) NOT NULL DEFAULT 0,
  `desc` INT NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC),
  UNIQUE INDEX `name_UNIQUE` (`name` ASC),
  INDEX `fk_classes_class_roles1_idx` (`role_main` ASC),
  INDEX `fk_classes_class_roles2_idx` (`role_side` ASC),
  INDEX `fk_classes_descriptions1_idx` (`desc` ASC),
  CONSTRAINT `fk_classes_class_roles1`
    FOREIGN KEY (`role_main`)
    REFERENCES `basic`.`class_roles` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_classes_class_roles2`
    FOREIGN KEY (`role_side`)
    REFERENCES `basic`.`class_roles` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_classes_descriptions1`
    FOREIGN KEY (`desc`)
    REFERENCES `basic`.`descriptions` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `basic`.`character_types`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `basic`.`character_types` (
  `id` INT NOT NULL,
  `name` VARCHAR(10) NOT NULL,
  `des` INT NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`, `name`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC),
  UNIQUE INDEX `name_UNIQUE` (`name` ASC),
  INDEX `fk_class_types_descriptions1_idx` (`des` ASC),
  CONSTRAINT `fk_class_types_descriptions1`
    FOREIGN KEY (`des`)
    REFERENCES `basic`.`descriptions` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
COMMENT = '	';


-- -----------------------------------------------------
-- Table `basic`.`parenthood`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `basic`.`parenthood` (
  `parent_id` INT NOT NULL,
  `children_id` INT NOT NULL,
  PRIMARY KEY (`parent_id`, `children_id`),
  UNIQUE INDEX `idparenthood_UNIQUE` (`parent_id` ASC),
  INDEX `fk_parenthood_classes2_idx` (`children_id` ASC),
  CONSTRAINT `fk_parenthood_classes1`
    FOREIGN KEY (`parent_id`)
    REFERENCES `basic`.`classes` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_parenthood_classes2`
    FOREIGN KEY (`children_id`)
    REFERENCES `basic`.`classes` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `basic`.`attribute_requrement`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `basic`.`attribute_requrement` (
  `id` INT NOT NULL,
  `attribute_id` VARCHAR(3) NOT NULL DEFAULT 0,
  `required_value` DOUBLE NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC),
  INDEX `fk_attribute_requrement_attributes1_idx` (`attribute_id` ASC),
  CONSTRAINT `fk_attribute_requrement_attributes1`
    FOREIGN KEY (`attribute_id`)
    REFERENCES `basic`.`attributes` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `basic`.`skill_has_requirment`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `basic`.`skill_has_requirment` (
  `skill_id` INT NOT NULL DEFAULT 0,
  `requirement_id` INT NOT NULL,
  PRIMARY KEY (`skill_id`, `requirement_id`),
  INDEX `fk_skill_has_requirment_attribute_requrement1_idx` (`requirement_id` ASC),
  CONSTRAINT `fk_skill_has_requirment_skills1`
    FOREIGN KEY (`skill_id`)
    REFERENCES `basic`.`skills` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_skill_has_requirment_attribute_requrement1`
    FOREIGN KEY (`requirement_id`)
    REFERENCES `basic`.`attribute_requrement` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
