--1
DELIMITER //
DROP FUNCTION IF EXISTS question4_1;
CREATE FUNCTION question4_1(s1 int,s2 int,s3 int)
RETURNS CHAR(20)
DETERMINISTIC
BEGIN 
    DECLARE mx int;
    SET mx = GREATEST(s1,s2);
    SET mx = GREATEST(mx,s3);  
    IF 2*mx >= (s1+s2+s3) THEN
        RETURN 'INVALID';
    ELSE 
        RETURN 'VALID';
    END IF;
END; //
DELIMITER ;
DROP TABLE IF EXISTS answer;
CREATE TABLE answer(isValid CHAR(20));
INSERT INTO answer VALUES (question4_1(2,2,3));
SELECT * FROM answer;
+---------+
| isValid |
+---------+
| VALID   |
+---------+
1 row in set (0.00 sec)

--2
DELIMITER //
DROP FUNCTION IF EXISTS question4_2;
CREATE FUNCTION question4_2()
RETURNS INT
NO SQL
BEGIN 
    declare x int;
    SET x = SECOND(now());
    RETURN MOD(x,10) + 1;
END; //
DELIMITER ;

DROP PROCEDURE IF EXISTS helper;
DELIMITER //
CREATE PROCEDURE helper()
BEGIN 
    DROP TABLE IF EXISTS answer;
    CREATE TABLE answer(random INT);
    INSERT INTO answer VALUES(question4_2());
END;//
DELIMITER ;

call helper();
SELECT * FROM answer;
+--------+
| random |
+--------+
|      5 |
+--------+
1 row in set (0.00 sec)

--3
DROP FUNCTION IF EXISTS question4_3;
DELIMITER //
CREATE FUNCTION question4_3(inp VARCHAR(255))
RETURNS VARCHAR(255)
DETERMINISTIC
BEGIN
    DECLARE s VARCHAR(255) DEFAULT '';
    DECLARE lef VARCHAR(255) DEFAULT '';
    DECLARE le VARCHAR(255) DEFAULT '';
    DECLARE mid VARCHAR(255) DEFAULT '';
    DECLARE ri VARCHAR(255) DEFAULT '';
    DECLARE rig VARCHAR(255) DEFAULT '';
    DECLARE l INT DEFAULT 1;
    DECLARE r INT DEFAULT length(inp);
    SET s = inp;
    WHILE l <= length(inp) DO
        SET lef = SUBSTR(s,1,LEAST(l,r) - 1);
        SET le = CONCAT(lef,SUBSTR(s,GREATEST(l,r),1));
        SET mid = SUBSTR(s,LEAST(l,r)+1, GREATEST(GREATEST(l,r) - LEAST(l,r) -1,0));
        SET ri = SUBSTR(s,LEAST(l,r),LEAST(ABS(l-r),1));
        SET rig = CONCAT(ri,SUBSTR(s,GREATEST(l,r)+1,length(s)- GREATEST(l,r)));
        SET s = CONCAT(le,CONCAT(mid,rig));
        SET r = r - 1;
        SET l = l + 1;
    END WHILE;
    RETURN s;
END; //
DELIMITER ;

DROP PROCEDURE IF EXISTS helper;
DELIMITER //
CREATE PROCEDURE helper(str VARCHAR(255))
BEGIN 
    DROP TABLE IF EXISTS answer;
    CREATE TABLE answer(Input VARCHAR(255),Output VARCHAR(255));
    INSERT INTO answer VALUES(str , question4_3(str));
END;//
DELIMITER ;

call helper('abcjenoqde');
SELECT * FROM answer;
+------------+------------+
| Input      | Output     |
+------------+------------+
| abcjenoqde | abcjenoqde |
+------------+------------+
1 row in set (0.00 sec)