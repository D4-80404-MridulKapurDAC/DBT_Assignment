--1
DELIMITER //
DROP PROCEDURE IF EXISTS question3_1;
CREATE PROCEDURE question3_1()
BEGIN 
    declare I int DEFAULT 1;  
    DROP TABLE IF EXISTS answer;
    CREATE TABLE answer (result int);
    WHILE I<=1000 DO
        IF MOD(I,100) = 0 THEN
            INSERT INTO answer VALUES(i);
        END IF;
        SET I = I+1; 
    END WHIlE;
END; //
DELIMITER ;
call question3_1();
SELECT * FROM answer;
    
--2
CREATE TABLE list(val int);
TRUNCATE TABLE list;
INSERT INTO list VALUES(1),(7),(5),(6),(12),(10);
DELIMITER //
DROP PROCEDURE IF EXISTS question3_2;
CREATE PROCEDURE question3_2()
BEGIN 
    DECLARE lower INT;
    DECLARE upper INT;
    DECLARE itr INT;
    SELECT MIN(val) INTO lower FROM list;
    SELECT MAX(val) INTO upper FROM list;
    SET itr = lower;
    DROP TABLE IF EXISTS answer;
    CREATE TABLE answer(peri FLOAT,area FLOAT,vol FLOAT);    
    WHILE itr <= upper DO
        INSERT INTO answer VALUES(2*3.14*itr,3.14*itr*itr,4/3*3.14*itr*itr*itr);
        SET itr = itr + 1;
    END WHILE;
END; //
DELIMITER ;
call question3_2();
SELECT * FROM answer;
--3
CREATE TABLE sample_str(sno int,pal char(5));
TRUNCATE TABLE sample_str;
INSERT INTO sample_str VALUES(1,'alala'),(2,'sfafq'),(3,'apfaa'); 
DELIMITER //
DROP PROCEDURE IF EXISTS question3_3;
CREATE PROCEDURE question3_3(idx INT)
BEGIN
    DECLARE s char(5);
    DECLARE itr INT DEFAULT 1;
    DECLARE res boolean DEFAULT TRUE; 
    DROP TABLE IF EXISTS answer;
    CREATE TABLE answer(isPal CHAR(40));   
    SELECT pal INTO s FROM sample_str WHERE sno = idx;
    WHILE itr < 3 DO
        IF SUBSTR(s,itr,1) != SUBSTR(s,4-itr,1) THEN
            INSERT INTO answer VALUES(SUBSTR(s,itr,itr+1));
            SET res = FALSE;
        END IF;    
        SET itr = itr + 1;
    END WHILE;
    IF res THEN
        INSERT INTO answer VALUES ("Palindrome");
    ELSE 
        INSERT INTO answer VALUES ("Not Palindrome");
    END IF;
END; //
DELIMITER ;
call question3_3(1);
SELECT * FROM answer;
