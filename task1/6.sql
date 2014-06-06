DROP PROCEDURE IF EXISTS number_of_workers;

DELIMITER $$
CREATE PROCEDURE number_of_workers(IN dep_id INTEGER)
BEGIN
SELECT COUNT(*) AS 'Number of workers' FROM workers WHERE boss = dep_id;
END; $$

DELIMITER ;

--call number_of_workers(9);
