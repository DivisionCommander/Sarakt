-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema character_db
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema character_db
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `character_db` DEFAULT CHARACTER SET utf8 ;
-- -----------------------------------------------------
-- Schema game
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema game
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `game` DEFAULT CHARACTER SET utf8 ;
USE `character_db` ;

-- -----------------------------------------------------
-- Table `character_db`.`description`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `character_db`.`description` (
  `id` INT NOT NULL,
  `desctription` VARCHAR(45) NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `character_db`.`character_type`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `character_db`.`character_type` (
  `id` INT NOT NULL,
  `name` VARCHAR(10) NOT NULL,
  `description_id` INT NOT NULL,
  PRIMARY KEY (`id`, `description_id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC),
  UNIQUE INDEX `name_UNIQUE` (`name` ASC),
  INDEX `fk_character_type_description1_idx` (`description_id` ASC),
  CONSTRAINT `fk_character_type_description1`
    FOREIGN KEY (`description_id`)
    REFERENCES `character_db`.`description` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `character_db`.`class_role`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `character_db`.`class_role` (
  `id` INT NOT NULL,
  `role` VARCHAR(10) NOT NULL,
  `description_id` INT NOT NULL,
  PRIMARY KEY (`id`, `description_id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC),
  UNIQUE INDEX `role_UNIQUE` (`role` ASC),
  INDEX `fk_class_role_description1_idx` (`description_id` ASC),
  CONSTRAINT `fk_class_role_description1`
    FOREIGN KEY (`description_id`)
    REFERENCES `character_db`.`description` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `character_db`.`character_class`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `character_db`.`character_class` (
  `id` INT NOT NULL,
  `class_name` VARCHAR(45) NOT NULL DEFAULT 'unknown_class',
  `main_role_id` INT NOT NULL,
  `secondary_role_id` INT NOT NULL,
  `description_id` INT NOT NULL,
  PRIMARY KEY (`id`, `main_role_id`, `secondary_role_id`, `description_id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC),
  UNIQUE INDEX `class_name_UNIQUE` (`class_name` ASC),
  INDEX `fk_character_class_class_role1_idx` (`main_role_id` ASC),
  INDEX `fk_character_class_class_role2_idx` (`secondary_role_id` ASC),
  INDEX `fk_character_class_description1_idx` (`description_id` ASC),
  CONSTRAINT `fk_character_class_class_role1`
    FOREIGN KEY (`main_role_id`)
    REFERENCES `character_db`.`class_role` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_character_class_class_role2`
    FOREIGN KEY (`secondary_role_id`)
    REFERENCES `character_db`.`class_role` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_character_class_description1`
    FOREIGN KEY (`description_id`)
    REFERENCES `character_db`.`description` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `character_db`.`characters`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `character_db`.`characters` (
  `id` INT NOT NULL,
  `name` VARCHAR(20) NOT NULL DEFAULT 'unnamed_enemy',
  `type_id` INT NOT NULL DEFAULT 0,
  `class_id` INT NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`, `name`, `class_id`, `type_id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC),
  INDEX `fk_characters_character_type_idx` (`type_id` ASC),
  UNIQUE INDEX `name_UNIQUE` (`name` ASC),
  INDEX `fk_characters_character_class1_idx` (`class_id` ASC),
  CONSTRAINT `fk_characters_character_type`
    FOREIGN KEY (`type_id`)
    REFERENCES `character_db`.`character_type` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_characters_character_class1`
    FOREIGN KEY (`class_id`)
    REFERENCES `character_db`.`character_class` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `character_db`.`attributes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `character_db`.`attributes` (
  `id` INT NOT NULL,
  `attribute_name` VARCHAR(15) NOT NULL,
  `description_id` INT NOT NULL,
  PRIMARY KEY (`id`, `attribute_name`, `description_id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC),
  UNIQUE INDEX `attribute_name_UNIQUE` (`attribute_name` ASC),
  INDEX `fk_attributes_description1_idx` (`description_id` ASC),
  CONSTRAINT `fk_attributes_description1`
    FOREIGN KEY (`description_id`)
    REFERENCES `character_db`.`description` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `character_db`.`skills`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `character_db`.`skills` (
  `id` INT NOT NULL,
  `name` VARCHAR(45) NOT NULL DEFAULT 'blank_skill',
  `description_id` INT NOT NULL,
  PRIMARY KEY (`id`, `description_id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC),
  INDEX `fk_skills_description1_idx` (`description_id` ASC),
  CONSTRAINT `fk_skills_description1`
    FOREIGN KEY (`description_id`)
    REFERENCES `character_db`.`description` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `character_db`.`characters_has_attributes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `character_db`.`characters_has_attributes` (
  `id` INT NOT NULL,
  `attributes_id` INT NOT NULL,
  `value` INT NULL,
  PRIMARY KEY (`id`, `attributes_id`),
  INDEX `fk_characters_has_attributes_attributes1_idx` (`attributes_id` ASC),
  INDEX `fk_characters_has_attributes_characters1_idx` (`id` ASC),
  CONSTRAINT `fk_characters_has_attributes_characters1`
    FOREIGN KEY (`id`)
    REFERENCES `character_db`.`characters` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_characters_has_attributes_attributes1`
    FOREIGN KEY (`attributes_id`)
    REFERENCES `character_db`.`attributes` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `character_db`.`characters_has_skill`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `character_db`.`characters_has_skill` (
  `characters_id` INT NOT NULL,
  `skills_id` INT NOT NULL,
  PRIMARY KEY (`characters_id`, `skills_id`),
  INDEX `fk_characters_has_skills_skills1_idx` (`skills_id` ASC),
  INDEX `fk_characters_has_skills_characters1_idx` (`characters_id` ASC),
  CONSTRAINT `fk_characters_has_skills_characters1`
    FOREIGN KEY (`characters_id`)
    REFERENCES `character_db`.`characters` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_characters_has_skills_skills1`
    FOREIGN KEY (`skills_id`)
    REFERENCES `character_db`.`skills` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `character_db`.`skill_type`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `character_db`.`skill_type` (
  `id` INT NOT NULL,
  `type_name` VARCHAR(10) NOT NULL DEFAULT 'default',
  `description_id` INT NOT NULL,
  PRIMARY KEY (`id`, `description_id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC),
  INDEX `fk_skill_type_description1_idx` (`description_id` ASC),
  CONSTRAINT `fk_skill_type_description1`
    FOREIGN KEY (`description_id`)
    REFERENCES `character_db`.`description` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `character_db`.`skills_has_skill_type`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `character_db`.`skills_has_skill_type` (
  `skills_id` INT NOT NULL,
  `type_id` INT NOT NULL,
  PRIMARY KEY (`skills_id`, `type_id`),
  INDEX `fk_skills_has_skill_type_skill_type1_idx` (`type_id` ASC),
  INDEX `fk_skills_has_skill_type_skills1_idx` (`skills_id` ASC),
  CONSTRAINT `fk_skills_has_skill_type_skills1`
    FOREIGN KEY (`skills_id`)
    REFERENCES `character_db`.`skills` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_skills_has_skill_type_skill_type1`
    FOREIGN KEY (`type_id`)
    REFERENCES `character_db`.`skill_type` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

USE `game` ;

-- -----------------------------------------------------
-- Table `game`.`descriptions`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `game`.`descriptions` (
  `id` INT NOT NULL,
  `description` VARCHAR(45) NOT NULL DEFAULT '#',
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `game`.`abilities`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `game`.`abilities` (
  `id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `ability_name` VARCHAR(10) NOT NULL,
  `mark` VARCHAR(10) NOT NULL DEFAULT 'none',
  `description_id` INT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `ability_name_UNIQUE` (`ability_name` ASC),
  INDEX `fk_abilities_descriptions1_idx` (`description_id` ASC),
  CONSTRAINT `fk_abilities_descriptions1`
    FOREIGN KEY (`description_id`)
    REFERENCES `game`.`descriptions` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `game`.`class_types`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `game`.`class_types` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `class_type` VARCHAR(10) NOT NULL,
  `description_id` INT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `class_type_UNIQUE` (`class_type` ASC),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC),
  INDEX `fk_class_types_descriptions1_idx` (`description_id` ASC),
  CONSTRAINT `fk_class_types_descriptions1`
    FOREIGN KEY (`description_id`)
    REFERENCES `game`.`descriptions` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `game`.`character_classes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `game`.`character_classes` (
  `id_classes` INT(11) NOT NULL,
  `class_name` VARCHAR(45) NOT NULL,
  `descriptions_id` INT NULL,
  `class_types_id` INT(11) NOT NULL,
  PRIMARY KEY (`id_classes`),
  UNIQUE INDEX `id_classes_UNIQUE` (`id_classes` ASC),
  UNIQUE INDEX `class_name_UNIQUE` (`class_name` ASC),
  INDEX `fk_character_classes_descriptions1_idx` (`descriptions_id` ASC),
  INDEX `fk_character_classes_class_types1_idx` (`class_types_id` ASC),
  CONSTRAINT `fk_character_classes_descriptions1`
    FOREIGN KEY (`descriptions_id`)
    REFERENCES `game`.`descriptions` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_character_classes_class_types1`
    FOREIGN KEY (`class_types_id`)
    REFERENCES `game`.`class_types` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `game`.`character_types`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `game`.`character_types` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `character_type` VARCHAR(20) NOT NULL,
  `description_id` INT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC),
  UNIQUE INDEX `character_type_UNIQUE` (`character_type` ASC),
  INDEX `fk_character_types_descriptions1_idx` (`description_id` ASC),
  CONSTRAINT `fk_character_types_descriptions1`
    FOREIGN KEY (`description_id`)
    REFERENCES `game`.`descriptions` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `game`.`character`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `game`.`character` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `type` INT(11) NOT NULL,
  `class` INT(11) NOT NULL,
  PRIMARY KEY (`id`, `name`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC),
  INDEX `fk_character_character_types_idx` (`type` ASC),
  INDEX `fk_character_character_classes1_idx` (`class` ASC),
  CONSTRAINT `fk_character_character_classes1`
    FOREIGN KEY (`class`)
    REFERENCES `game`.`character_classes` (`id_classes`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_character_character_types`
    FOREIGN KEY (`type`)
    REFERENCES `game`.`character_types` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `game`.`character_has_abilities`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `game`.`character_has_abilities` (
  `character_id` INT(11) NOT NULL,
  `abilities_id` INT(10) UNSIGNED NOT NULL,
  `value` INT(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`character_id`, `abilities_id`),
  INDEX `fk_character_has_abilities_abilities1_idx` (`abilities_id` ASC),
  INDEX `fk_character_has_abilities_character1_idx` (`character_id` ASC),
  CONSTRAINT `fk_character_has_abilities_abilities1`
    FOREIGN KEY (`abilities_id`)
    REFERENCES `game`.`abilities` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_character_has_abilities_character1`
    FOREIGN KEY (`character_id`)
    REFERENCES `game`.`character` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `game`.`skills`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `game`.`skills` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `skill_name` VARCHAR(45) NOT NULL,
  `description_id` INT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `skill_name_UNIQUE` (`skill_name` ASC),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC),
  INDEX `fk_skills_descriptions1_idx` (`description_id` ASC),
  CONSTRAINT `fk_skills_descriptions1`
    FOREIGN KEY (`description_id`)
    REFERENCES `game`.`descriptions` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `game`.`character_has_skills`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `game`.`character_has_skills` (
  `character_id` INT(11) NOT NULL,
  `skills_id` INT(11) NOT NULL,
  PRIMARY KEY (`character_id`, `skills_id`),
  INDEX `fk_character_has_character_skills_character_skills1_idx` (`skills_id` ASC),
  INDEX `fk_character_has_character_skills_character1_idx` (`character_id` ASC),
  CONSTRAINT `fk_character_has_character_skills_character1`
    FOREIGN KEY (`character_id`)
    REFERENCES `game`.`character` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_character_has_character_skills_character_skills1`
    FOREIGN KEY (`skills_id`)
    REFERENCES `game`.`skills` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `game`.`children_classes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `game`.`children_classes` (
  `id_current` INT(11) NOT NULL,
  `id_children` INT(11) NULL,
  INDEX `fk_parent_classes_character_classes2_idx` (`id_children` ASC),
  PRIMARY KEY (`id_current`),
  CONSTRAINT `fk_parent_classes_character_classes10`
    FOREIGN KEY (`id_current`)
    REFERENCES `game`.`character_classes` (`id_classes`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_parent_classes_character_classes20`
    FOREIGN KEY (`id_children`)
    REFERENCES `game`.`character_classes` (`id_classes`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `game`.`parent_classes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `game`.`parent_classes` (
  `id_current` INT(11) NOT NULL,
  `id_parrent` INT(11) NULL,
  PRIMARY KEY (`id_current`),
  INDEX `fk_parent_classes_character_classes2_idx` (`id_parrent` ASC),
  CONSTRAINT `fk_parent_classes_character_classes1`
    FOREIGN KEY (`id_current`)
    REFERENCES `game`.`character_classes` (`id_classes`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_parent_classes_character_classes2`
    FOREIGN KEY (`id_parrent`)
    REFERENCES `game`.`character_classes` (`id_classes`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
