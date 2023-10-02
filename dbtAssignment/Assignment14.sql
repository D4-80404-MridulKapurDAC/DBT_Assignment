--1
INSERT INTO SALESPEOPLE(city,sname,snum)
VALUES ('San Jose', 'Blanco',1100);
SELECT * FROM SALESPEOPLE;
+------+---------+-----------+------+
| Snum | Sname   | City      | Comm |
+------+---------+-----------+------+
| 1001 | Peel    | London    | 0.12 |
| 1002 | Serres  | San Jose  | 0.13 |
| 1004 | Motika  | London    | 0.11 |
| 1007 | Rifkin  | Barcelona | 0.15 |
| 1003 | Axelrod | New York  | 0.10 |
| 1100 | Blanco  | San Jose  | NULL |
+------+---------+-----------+------+

--2
DELETE FROM ORDERS 
WHERE cnum IN 
(SELECT cnum FROM CUSTOMER WHERE cname = 'Clemens');
SELECT * FROM ORDERS;
+------+---------+------------+------+------+
| Onum | Amt     | Odate      | Cnum | Snum |
+------+---------+------------+------+------+
| 3001 |   18.69 | 1990-10-03 | 2008 | 1007 |
| 3003 |  767.19 | 1990-10-03 | 2001 | 1001 |
| 3002 | 1900.10 | 1990-10-03 | 2007 | 1004 |
| 3005 | 5160.45 | 1990-10-03 | 2003 | 1002 |
| 3006 | 1098.16 | 1990-10-03 | 2008 | 1007 |
| 3009 | 1713.23 | 1990-10-04 | 2002 | 1003 |
| 3007 |   75.75 | 1990-10-04 | 2004 | 1002 |
| 3010 | 1309.95 | 1990-10-06 | 2004 | 1002 |
+------+---------+------------+------+------+
8 rows in set (0.00 sec)

--3
UPDATE CUSTOMER SET rating =  rating +100 
WHERE CUSTOMER.city = 'Rome';
SELECT * FROM CUSTOMER;
+------+----------+----------+--------+------+
| Cnum | Cname    | City     | Rating | Snum |
+------+----------+----------+--------+------+
| 2001 | Hoffman  | London   |    100 | 1001 |
| 2002 | Giovanni | Rome     |    300 | 1003 |
| 2003 | Liu      | San Jose |    200 | 1002 |
| 2004 | Grass    | Berlin   |    300 | 1002 |
| 2006 | Clemens  | London   |    100 | 1001 |
| 2008 | Cisneros | San Jose |    300 | 1007 |
| 2007 | Pereira  | Rome     |    200 | 1004 |
+------+----------+----------+--------+------+
7 rows in set (0.00 sec)

--4
UPDATE CUSTOMER SET snum = 
(SELECT snum FROM SALESPEOPLE WHERE sname = 'Motika')
WHERE snum = (SELECT snum FROM SALESPEOPLE WHERE sname = 'Serres');
SELECT * FROM CUSTOMER;
+------+----------+----------+--------+------+
| Cnum | Cname    | City     | Rating | Snum |
+------+----------+----------+--------+------+
| 2001 | Hoffman  | London   |    100 | 1001 |
| 2002 | Giovanni | Rome     |    300 | 1003 |
| 2003 | Liu      | San Jose |    200 | 1004 |
| 2004 | Grass    | Berlin   |    300 | 1004 |
| 2006 | Clemens  | London   |    100 | 1001 |
| 2008 | Cisneros | San Jose |    300 | 1007 |
| 2007 | Pereira  | Rome     |    200 | 1004 |
+------+----------+----------+--------+------+
7 rows in set (0.00 sec)


--RESET TABLE
TRUNCATE TABLE CUSTOMER;
TRUNCATE TABLE SALESPEOPLE;
TRUNCATE TABLE ORDERS;
INSERT INTO SALESPEOPLE (SNUM,SNAME,CITY,COMM) VALUES
(1001,'Peel','London',.12),
(1002,'Serres','San Jose',.13),
(1004,'Motika','London',.11),
(1007,'Rifkin','Barcelona',.15),
(1003,'Axelrod','New York',.10);

INSERT INTO CUSTOMER (CNUM,CNAME,CITY,RATING,SNUM) values
(2001,'Hoffman','London', 100,1001),
(2002,'Giovanni','Rome', 200,1003),
(2003,'Liu','San Jose', 200,1002),
(2004,'Grass','Berlin', 300,1002),
(2006,'Clemens','London', 100,1001),
(2008,'Cisneros','San Jose', 300,1007),
(2007,'Pereira','Rome', 100,1004);

INSERT INTO ORDERS(onum,amt,odate,cnum,snum) VALUES
(3001,18.69 ,'1990-10-03',2008,1007),
(3003,767.19 ,'1990-10-03',2001,1001),
(3002,1900.10 ,'1990-10-03',2007,1004),
(3005,5160.45 ,'1990-10-03',2003,1002),
(3006,1098.16 ,'1990-10-03',2008,1007),
(3009,1713.23 ,'1990-10-04',2002,1003),
(3007,75.75 ,'1990-10-04',2004,1002),
(3008,4723.00 ,'1990-10-05',2006,1001),
(3010,1309.95 ,'1990-10-06',2004,1002),
(3011,9891.88 ,'1990-10-06',2006,1001);