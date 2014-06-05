DROP PROCEDURE IF EXISTS change_boss;

DELIMITER $$
CREATE PROCEDURE change_boss(IN worker_id INTEGER, IN new_boss_id INTEGER)
BEGIN
IF (SELECT COUNT(*) FROM workers WHERE id = worker_id) <= 0 THEN
	SELECT 'Worker ID does not exist' AS 'ERROR';
ELSEIF (SELECT COUNT(*) FROM workers WHERE boss = new_boss_id) <= 0 THEN
	SELECT 'Boss ID does not exist' AS 'ERROR';
ELSE
	UPDATE workers SET boss = new_boss_id WHERE id = worker_id;
END IF;
END; $$

DELIMITER ;
