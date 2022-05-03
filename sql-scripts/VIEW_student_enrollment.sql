CREATE VIEW `student_enrollment` AS
    SELECT 
        `s`.`id` AS `id`,
        `s`.`first_name` AS `first_name`,
        `s`.`last_name` AS `last_name`,
        `s`.`phone_number` AS `phone_number`,
        `s`.`cpr` AS `cpr`,
        `p`.`name` AS `programme`
    FROM
        (`student` `s`
        JOIN `programme` `p` ON ((`s`.`id` = `p`.`id`)))