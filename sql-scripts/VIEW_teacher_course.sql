CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `root`@`localhost` 
    SQL SECURITY DEFINER
VIEW `teacher-course` AS
    SELECT 
        `t`.`id` AS `id`,
        `t`.`first_name` AS `first_name`,
        `t`.`last_name` AS `last_name`,
        `t`.`email` AS `email`,
        `c`.`name` AS `name`
    FROM
        (`teacher` `t`
        JOIN `course` `c` ON ((`t`.`id` = `c`.`Teacher_id`)))