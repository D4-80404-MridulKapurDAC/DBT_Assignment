--1
SELECT COUNT(*) orders_count FROM ORDERS
WHERE ODATE = '1990-10-03';
--2
SELECT COUNT(*) city_count FROM CUSTOMER
WHERE CITY IS NOT NULL;
--3
SELECT Cnum,MIN(amt) minimumOrder 
FROM ORDERS
GROUP BY Cnum;
--4
SELECT MIN(cname) FROM CUSTOMER 
WHERE cname  >= 'G';
--5
SELECT CITY,MAX(RATING)
FROM CUSTOMER
GROUP BY CITY;
--6
SELECT COUNT(DISTINCT(snum)),oDATE 
FROM ORDERS
GROUP BY odate;

QUESTION : 

+--------------+
| orders_count |
+--------------+
|            5 |
+--------------+
1 row in set (0.00 sec)

QUESTION : 

+------------+
| city_count |
+------------+
|          7 |
+------------+
1 row in set (0.00 sec)

QUESTION : 

+------+--------------+
| Cnum | minimumOrder |
+------+--------------+
| 2008 |        18.69 |
| 2001 |       767.19 |
| 2007 |      1900.10 |
| 2003 |      5160.45 |
| 2002 |      1713.23 |
| 2004 |        75.75 |
| 2006 |      4723.00 |
+------+--------------+
7 rows in set (0.00 sec)

QUESTION : 

+------------+
| MIN(cname) |
+------------+
| Giovanni   |
+------------+
1 row in set (0.00 sec)

QUESTION : 

+----------+-------------+
| CITY     | MAX(RATING) |
+----------+-------------+
| London   |         100 |
| Rome     |         200 |
| San Jose |         300 |
| Berlin   |         300 |
+----------+-------------+
4 rows in set (0.01 sec)

QUESTION : 

+-----------------------+------------+
| COUNT(DISTINCT(snum)) | oDATE      |
+-----------------------+------------+
|                     4 | 1990-10-03 |
|                     2 | 1990-10-04 |
|                     1 | 1990-10-05 |
|                     2 | 1990-10-06 |
+-----------------------+------------+
4 rows in set (0.00 sec)
