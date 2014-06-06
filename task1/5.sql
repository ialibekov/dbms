set max_sp_recursion_depth=100;

DROP TABLE IF EXISTS h_temp;
CREATE TABLE h_temp (id INTEGER);

DROP PROCEDURE IF exists hierarchy;
DELIMITER $$
CREATE PROCEDURE hierarchy (IN worker_id INTEGER)   
BEGIN
DECLARE temp INTEGER;
INSERT into h_temp values(worker_id);
SELECT boss FROM workers WHERE id = worker_id INTO temp;
IF temp != -1 THEN
	CALL hierarchy(temp);
ELSE
	SELECT * FROM workers WHERE id IN (SELECT * FROM h_temp);
END IF;   
END; $$

DELIMITER ;

--call hierarchy(989);
