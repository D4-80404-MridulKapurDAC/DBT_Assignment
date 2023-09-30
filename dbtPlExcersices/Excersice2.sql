--1
DROP TABLE IF NOT EXISTS input;
CREATE TABLE input(val INT);
INSERT INTO input VALUES(5);
DELIMITER //
DROP PROCEDURE IF EXISTS question2_1;
CREATE PROCEDURE question2_1(LOW INT,HIGH INT)
BEGIN 
    declare X int; 
    DROP TABLE IF EXISTS answer;
    CREATE TABLE answer (result char(20));
    SELECT val INTO X FROM input WHERE val = 5;
    IF x >= LOW AND X<=HIGH THEN
        INSERT INTO answer VALUES('IN RANGE');
    ELSE 
        INSERT INTO answer VALUES('OUT OF RANGE');
    END If;
END; //
DELIMITER ;
call question2_1(2,10);
SELECT * FROM answer;
    
--2
CREATE TABLE triangle(sno int,sides int);
TRUNCATE TABLE triangle;
INSERT INTO triangle VALUES(1,3),(2,2),(3,3);
DELIMITER //
DROP PROCEDURE IF EXISTS question2_2;
CREATE PROCEDURE question2_2()
BEGIN 
    DECLARE s1 INT;
    DECLARE s2 INT;
    DECLARE s3 INT;
    DECLARE mx INT;
    SELECT sides INTO s1 FROM triangle WHERE sno = 1;
    SELECT sides INTO s2 FROM triangle WHERE sno = 2;
    SELECT sides INTO s3 FROM triangle WHERE sno = 3;
    SET mx = GREATEST(s1,s2);
    SET mx = GREATEST(mx,s3);
    DROP TABLE IF EXISTS answer;
    CREATE TABLE answer(TRIANGLE CHAR(20));    
    IF 2*mx >= (s1+s2+s3) THEN
        INSERT INTO answer VALUES("INVALID");
    ELSE 
        INSERT INTO answer VALUES("VALID");
    END IF;
END; //
DELIMITER ;
call question2_2();
SELECT * FROM answer;
--3
CREATE TABLE sample_date(dt date);
TRUNCATE TABLE sample_date;
INSERT INTO sample_date VALUES('2012-01-01'); 
DELIMITER //
DROP PROCEDURE IF EXISTS question2_3;
CREATE PROCEDURE question2_3()
BEGIN     
    DECLARE d DATE;
    DECLARE yr INT;
    DROP TABLE IF EXISTS answer;
    CREATE TABLE answer(ISLEAP CHAR(40));   
    SELECT dt INTO d FROM sample_date;
    set yr = YEAR(d);
    IF MOD(yr,400) = 0 THEN
        INSERT INTO answer VALUES("LEAP");
    ELSEIF MOD(yr,100) = 0 THEN
        INSERT INTO answer VALUES("NOT LEAP");
    ELSEIF MOD(yr,4) = 0 THEN
        INSERT INTO answer VALUES("LEAP");
    ELSE 
        INSERT INTO answer VALUES("NOT LEAP");
    END IF;
END; //
DELIMITER ;
call question2_3();
SELECT * FROM answer;
