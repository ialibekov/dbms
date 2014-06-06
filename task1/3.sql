DROP PROCEDURE IF EXISTS print_dep;

DELIMITER $$
CREATE PROCEDURE print_dep(IN head_id INTEGER)
BEGIN
IF (SELECT COUNT(*) FROM workers WHERE id = head_id) <= 0 THEN
	SELECT 'Head ID does not exist' AS 'ERROR';
ELSE
	SELECT id, name AS 'HEAD' FROM workers WHERE id = head_id;
	SELECT id, name AS 'WORKERS' FROM workers WHERE boss = head_id;
END IF;
END; $$

DELIMITER ;

--call print_dep(9);
