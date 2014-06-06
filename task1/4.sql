DROP PROCEDURE IF EXISTS print_leaves;

DELIMITER $$
CREATE PROCEDURE print_leaves()
BEGIN
SELECT * FROM workers WHERE id NOT IN (SELECT boss FROM workers);
END; $$

DELIMITER ;

--call print_leaves();
