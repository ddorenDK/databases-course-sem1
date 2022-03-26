
#Table needed for Triggers

CREATE TABLE `university`.`totals` (
  `id` INT NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  `amount` INT NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`));
  
  
INSERT INTO `university`.`totals` (`id`, `name`) VALUES ('1', 'students');
INSERT INTO `university`.`totals` (`id`, `name`) VALUES ('2', 'programmes');
INSERT INTO `university`.`totals` (`id`, `name`) VALUES ('3', 'courses');
INSERT INTO `university`.`totals` (`id`, `name`) VALUES ('4', 'electives');
INSERT INTO `university`.`totals` (`id`, `name`) VALUES ('5', 'teachers');
  
DROP TRIGGER IF EXISTS new_student;
CREATE TRIGGER new_student
BEFORE INSERT ON student 
FOR EACH ROW
UPDATE totals 
SET totals.amount = amount + 1 where id = '1';

DROP TRIGGER IF EXISTS student_leaving;
CREATE TRIGGER student_leaving
BEFORE DELETE ON student 
FOR EACH ROW
UPDATE totals 
SET totals.amount = amount - 1 where id = '1';

#The exact same can be done for teachers, courses or electives