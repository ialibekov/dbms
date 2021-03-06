DROP PROCEDURE IF EXISTS add_worker;

DELIMITER $$
CREATE PROCEDURE add_worker(IN _name VARCHAR(50), IN _boss INTEGER)
BEGIN
IF (SELECT COUNT(*) FROM workers WHERE boss = _boss) > 0 THEN
	INSERT INTO workers (name, boss) VALUE (_name, _boss);
ELSE
	SELECT 'Boss ID does not exist' AS 'ERROR';
END IF;
END; $$

DELIMITER ;

--call add_worker('Mike Vazovsky', 13);
--select * from workers order by id desc limit 5;
