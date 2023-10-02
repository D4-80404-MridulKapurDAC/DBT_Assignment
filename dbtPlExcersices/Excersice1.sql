--1
DELIMITER //
DROP PROCEDURE IF EXISTS question1_1;
CREATE PROCEDURE question1_1(LEN INT,WIDTH INT)
BEGIN 
    DROP TABLE IF EXISTS answer;
    CREATE TABLE answer (area int, perimeter int);
    INSERT INTO answer VALUES(LEN+WIDTH,2*(LEN*WIDTH));
END; //
DELIMITER ;
call question1_1(5,2);
SELECT * FROM answer;
+------+-----------+
| area | perimeter |
+------+-----------+
|    7 |        20 |
+------+-----------+
1 row in set (0.00 sec)

--2
DELIMITER //
DROP PROCEDURE IF EXISTS question1_2;
CREATE PROCEDURE question1_2(TEMP FLOAT,OPT INT)
BEGIN 
    DROP TABLE IF EXISTS answer;
    CREATE TABLE answer(TEMP CHAR(20));    
    IF OPT = 1 THEN
        INSERT INTO answer VALUES(CONCAT((TEMP - 32)*5/9, " CELCIUS . "));
    ELSE 
        INSERT INTO answer VALUES(CONCAT((TEMP * 9/5 )+ 32, " FAHRENHEIT . "));
    END IF;
END; //
DELIMITER ;
call question1_2(5,2);
SELECT * FROM answer;
+-----------------+
| TEMP            |
+-----------------+
| 41 FAHRENHEIT . |
+-----------------+
1 row in set (0.00 sec)

--3
DELIMITER //
DROP PROCEDURE IF EXISTS question1_3;
CREATE PROCEDURE question1_3(val INT)
BEGIN 
    DROP TABLE IF EXISTS answer;
    CREATE TABLE answer(TEMP CHAR(40));   
    if MOD(val,5) = 0 THEN
        INSERT INTO answer VALUES("THIS IS DIVISIBLE BY 5");
    ELSE 
        INSERT INTO answer VALUES("THIS IS NOT DIVISIBLE BY 5");
    END IF;
END; //
DELIMITER ;
call question1_3(41);
SELECT * FROM answer;

+----------------------------+
| TEMP                       |
+----------------------------+
| THIS IS NOT DIVISIBLE BY 5 |
+----------------------------+
1 row in set (0.00 sec)
