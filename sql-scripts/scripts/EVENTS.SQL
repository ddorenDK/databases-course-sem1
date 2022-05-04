#Adding rows for Events

ALTER TABLE `university`.`student` 
ADD COLUMN `graduation` DATE NOT NULL AFTER `Programme_id`;

UPDATE `university`.`student` SET `graduation` = '2022-01-01' WHERE (`id` = '1') and (`Programme_id` = '1');
UPDATE `university`.`student` SET `graduation` = '2022-01-01' WHERE (`id` = '2') and (`Programme_id` = '1');
UPDATE `university`.`student` SET `graduation` = '2022-01-01' WHERE (`id` = '3') and (`Programme_id` = '2');
UPDATE `university`.`student` SET `graduation` = '2023-01-01' WHERE (`id` = '4') and (`Programme_id` = '2');
UPDATE `university`.`student` SET `graduation` = '2023-01-01' WHERE (`id` = '5') and (`Programme_id` = '3');
UPDATE `university`.`student` SET `graduation` = '2024-01-01' WHERE (`id` = '6') and (`Programme_id` = '3');
UPDATE `university`.`student` SET `graduation` = '2024-01-01' WHERE (`id` = '7') and (`Programme_id` = '4');

DROP EVENT IF EXISTS student_graduation;
CREATE EVENT student_graduation 
	ON schedule
		every 1 year starts '2022-01-01'
	DO 
		DELETE FROM student
        WHERE graduation < CURDATE();