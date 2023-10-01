--1
DELIMITER //
DROP PROCEDURE IF EXISTS question5_1;
CREATE PROCEDURE question5_1(p int,r float,t int)
BEGIN 
    DECLARE I float;
    DROP TABLE IF EXISTS tempp;
    CREATE TABLE tempp(interest float,Total float);
    SET I = p*(1+r)*t - p;
    INSERT INTO tempp VALUES(I,p+I);
END;//
DELIMITER ;
call question5_1(100,0.1,1);
SELECT * FROM tempp;
--2
CREATE TABLE date_data(dt date);
TRUNCATE TABLE date_data;
INSERT INTO date_data VALUES
('2001-11-27'),
('2002-05-23'),
('2001-01-30'),
('2001-01-18');

DROP FUNCTION IF EXISTS question5_2;
DELIMITER //
CREATE FUNCTION question5_2(dob date)
RETURNS INT
NO SQL
BEGIN 
    DECLARE AGE INT;
    SET AGE = YEAR(now()) - YEAR(dob);
    IF date_add(dob, INTERVAL (YEAR(now()) - YEAR(dob)) YEAR) > now() THEN
        SET AGE = AGE -1;
    END IF;
    RETURN AGE;
END;//
DELIMITER ;

DROP PROCEDURE IF EXISTS helper;
DELIMITER //
CREATE PROCEDURE helper()
BEGIN 
    DECLARE c DATE;
    DECLARE x INT DEFAULT 0;
    DECLARE t1 CURSOR FOR SELECT dt FROM date_data;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET x = 1;
    OPEN t1;
    WHILE x = 0 DO 
        FETCH t1 INTO c;
        INSERT INTO answer VALUES (question5_2(c));
    END WHILE;
END;//
DELIMITER ;

TRUNCATE answer;
call helper();
SELECT * FROM answer;