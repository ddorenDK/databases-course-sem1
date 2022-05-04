DROP SCHEMA IF EXISTS `university` ;
CREATE SCHEMA IF NOT EXISTS `university` DEFAULT CHARACTER SET utf8 ;
USE `university` ;

# Programme Table
CREATE TABLE IF NOT EXISTS `university`.`programme` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `field` VARCHAR(45) NOT NULL,
  `location` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC))
AUTO_INCREMENT = 8;


# Teacher Table
CREATE TABLE IF NOT EXISTS `university`.`teacher` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `first_name` VARCHAR(45) NOT NULL,
  `last_name` VARCHAR(45) NOT NULL,
  `phone_number` VARCHAR(45) NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC));


# Course Table
CREATE TABLE IF NOT EXISTS `university`.`course` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `duration` VARCHAR(45) NOT NULL,
  `Programme_id` INT NOT NULL,
  `Teacher_id` INT NULL,
  PRIMARY KEY (`id`, `Programme_id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC),
  INDEX `fk_Course_Programme1_idx` (`Programme_id` ASC),
  INDEX `fk_Course_Teacher1_idx` (`Teacher_id` ASC),
  CONSTRAINT `fk_Course_Programme1`
    FOREIGN KEY (`Programme_id`)
    REFERENCES `university`.`programme` (`id`)
    ON DELETE RESTRICT,
  CONSTRAINT `fk_Course_Teacher1`
    FOREIGN KEY (`Teacher_id`)
    REFERENCES `university`.`teacher` (`id`));


# Elective Table
CREATE TABLE IF NOT EXISTS `university`.`elective` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NULL DEFAULT NULL,
  `Teacher_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC),
  INDEX `fk_Elective_Teacher1_idx` (`Teacher_id` ASC),
  CONSTRAINT `fk_Elective_Teacher1`
    FOREIGN KEY (`Teacher_id`)
    REFERENCES `university`.`teacher` (`id`));


# Student Table
CREATE TABLE IF NOT EXISTS `university`.`student` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `first_name` VARCHAR(45) NOT NULL,
  `last_name` VARCHAR(45) NOT NULL,
  `birthdate` VARCHAR(10) NOT NULL,
  `cpr` VARCHAR(11) NOT NULL,
  `phone_number` VARCHAR(45) NOT NULL,
  `graduation_date` DATE NULL,
  `Programme_id` INT NOT NULL,
  PRIMARY KEY (`id`, `Programme_id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC),
  INDEX `fk_Student_Programme_idx` (`Programme_id` ASC),
  CONSTRAINT `fk_Student_Programme`
    FOREIGN KEY (`Programme_id`)
    REFERENCES `university`.`programme` (`id`)
    ON DELETE RESTRICT)
AUTO_INCREMENT = 17;


# Elective Table
CREATE TABLE IF NOT EXISTS `university`.`student_has_elective` (
  `Student_Elective_id` INT NOT NULL AUTO_INCREMENT,
  `Student_id` INT NOT NULL,
  `Elective_id` INT NOT NULL,
  INDEX `fk_Student_has_Elective_Student1_idx` (`Student_id` ASC),
  INDEX `fk_Student_has_Elective_Elective1_idx` (`Elective_id` ASC),
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
    ON UPDATE CASCADE);


# Grade Table
CREATE TABLE IF NOT EXISTS `university`.`grade` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `date` DATE NOT NULL,
  `grade` INT NOT NULL,
  `student_id` INT NOT NULL,
  `course_id` INT NOT NULL,
  `teacher_id` INT NOT NULL,
  PRIMARY KEY (`id`, `teacher_id`, `course_id`, `student_id`),
  INDEX `student_id_grade_idx` (`student_id` ASC),
  INDEX `course_id_grade_idx` (`course_id` ASC),
  INDEX `teacher_id_grade_idx` (`teacher_id` ASC),
  CONSTRAINT `student_id_grade`
    FOREIGN KEY (`student_id`)
    REFERENCES `university`.`student` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `course_id_grade`
    FOREIGN KEY (`course_id`)
    REFERENCES `university`.`course` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `teacher_id_grade`
    FOREIGN KEY (`teacher_id`)
    REFERENCES `university`.`teacher` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE);