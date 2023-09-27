CREATE DATABASE INTERVIEW;
USE INTERVIEW;

CREATE TABLE nlarge (num int);


INSERT INTO nlarge VALUES
(8000),
(7000),
(6000),
(5000),
(10000),
(9000),
(4000),
(8000),
(7000);

SELECT MAX(e.num) 
FROM nlarge a,nlarge b,nlarge c,nlarge d,nlarge e 
WHERE a.num > b.num AND b.num > c.num AND c.num > d.num AND d.num > e.num ;

SELECT a.num as LARGEST , MAX(b.num) as SECOND
FROM nlarge a,nlarge b
WHERE a.num = (SELECT MAX(nlarge.num) FROM nlarge)
AND a.num > b.num
GROUP BY a.num;

CREATE TABLE EMP(EMPNO int);

INSERT INTO EMP VALUES
(5),
(9),
(1),
(14),
(25),
(20);

SELECT concat(concat(b.EMPNO+1,'-'),min(a.EMPNO-1)) as ans
FROM EMP a, EMP b
WHERE a.EMPNO NOT IN
(SELECT a.EMPNO FROM EMP a, EMP b WHERE a.EMPNO = b.EMPNO+1)
AND b.EMPNO NOT IN 
(SELECT a.EMPNO FROM EMP a, EMP b WHERE a.EMPNO = b.EMPNO-1)
AND a.EMPNO > b.EMPNO
GROUP BY b.EMPNO
ORDER BY b.EMPNO;
-- AND b.num NOT IN
-- (SELECT a.num FROM nlarge a, nlarge b WHERE a.num = b.num-1)
-- AND a.num > b.num;
-- GROUP BY a.num;

CREATE TABLE BANK (sno int, dep int,withd int);

INSERT INTO BANK VALUES 
(1,5000,3000),
(2,6000,5000),
(3,2000,5000),
(4,5000,5000),
(5,6000,2000),
(6,7000,1000),
(7,4000,2000);

SELECT SUM(b.dep - b.withd)
FROM BANK a, BANK b
WHERE a.sno >= b.sno
GROUP BY a.sno 
ORDER BY a.sno;

CREATE TABLE BANK2 (dep int,withd int);

INSERT INTO BANK2 VALUES 
(5000,3000),
(6000,5000),
(2000,5000),
(5000,5000);

SELECT SUM(b.dep - b.withd)
FROM BANK a, BANK b
WHERE a.sno >= b.sno
GROUP BY a.sno 
ORDER BY a.sno;

