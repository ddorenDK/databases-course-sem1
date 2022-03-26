#SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
#SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
#SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

DROP SCHEMA IF EXISTS `university` ;

CREATE SCHEMA IF NOT EXISTS `university` DEFAULT CHARACTER SET utf8 ;
USE `university` ;

CREATE TABLE IF NOT EXISTS `university`.`programme` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `field` VARCHAR(45) NOT NULL,
  `location` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE)
ENGINE = InnoDB
AUTO_INCREMENT = 8
DEFAULT CHARACTER SET = utf8mb3;


CREATE TABLE IF NOT EXISTS `university`.`teacher` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `first_name` VARCHAR(45) NOT NULL,
  `last_name` VARCHAR(45) NOT NULL,
  `phone_number` VARCHAR(45) NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


CREATE TABLE IF NOT EXISTS `university`.`course` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `duration` VARCHAR(45) NOT NULL,
  `Programme_id` INT NOT NULL,
  `Teacher_id` INT NULL,
  PRIMARY KEY (`id`, `Programme_id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE,
  INDEX `fk_Course_Programme1_idx` (`Programme_id` ASC) VISIBLE,
  INDEX `fk_Course_Teacher1_idx` (`Teacher_id` ASC) VISIBLE,
  CONSTRAINT `fk_Course_Programme1`
    FOREIGN KEY (`Programme_id`)
    REFERENCES `university`.`programme` (`id`)
    ON DELETE RESTRICT,
  CONSTRAINT `fk_Course_Teacher1`
    FOREIGN KEY (`Teacher_id`)
    REFERENCES `university`.`teacher` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;

CREATE TABLE IF NOT EXISTS `university`.`elective` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NULL DEFAULT NULL,
  `Teacher_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE,
  INDEX `fk_Elective_Teacher1_idx` (`Teacher_id` ASC) VISIBLE,
  CONSTRAINT `fk_Elective_Teacher1`
    FOREIGN KEY (`Teacher_id`)
    REFERENCES `university`.`teacher` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;

CREATE TABLE IF NOT EXISTS `university`.`student` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `first_name` VARCHAR(45) NOT NULL,
  `last_name` VARCHAR(45) NOT NULL,
  `birthdate` VARCHAR(10) NOT NULL,
  `cpr` VARCHAR(11) NOT NULL,
  `phone_number` VARCHAR(45) NOT NULL,
  `Programme_id` INT NOT NULL,
  PRIMARY KEY (`id`, `Programme_id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE,
  INDEX `fk_Student_Programme_idx` (`Programme_id` ASC) VISIBLE,
  CONSTRAINT `fk_Student_Programme`
    FOREIGN KEY (`Programme_id`)
    REFERENCES `university`.`programme` (`id`)
    ON DELETE RESTRICT)
ENGINE = InnoDB
AUTO_INCREMENT = 17
DEFAULT CHARACTER SET = utf8mb3;

CREATE TABLE IF NOT EXISTS `university`.`student_has_elective` (
  `Student_Elective_id` INT NOT NULL AUTO_INCREMENT,
  `Student_id` INT NOT NULL,
  `Elective_id` INT NOT NULL,
  INDEX `fk_Student_has_Elective_Student1_idx` (`Student_id` ASC) VISIBLE,
  INDEX `fk_Student_has_Elective_Elective1_idx` (`Elective_id` ASC) VISIBLE,
  PRIMARY KEY (`Student_Elective_id`),
  CONSTRAINT `fk_Student_has_Elective_Elective1`
    FOREIGN KEY (`Elective_id`)
    REFERENCES `university`.`elective` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Student_has_Elective_Student1`
    FOREIGN KEY (`Student_id`)
    REFERENCES `university`.`student` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
