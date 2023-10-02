--1
SELECT onum,snum,amt*0.12 comm FROM ORDERS;
+------+------+---------+
| onum | snum | comm    |
+------+------+---------+
| 3001 | 1007 |    2.24 |
| 3003 | 1001 |   92.06 |
| 3002 | 1004 |  228.01 |
| 3005 | 1002 |  619.25 |
| 3006 | 1007 |  131.78 |
| 3009 | 1003 |  205.59 |
| 3007 | 1002 |    9.09 |
| 3008 | 1001 |  566.76 |
| 3010 | 1002 |  157.19 |
| 3011 | 1001 | 1187.03 |
+------+------+---------+
10 rows in set (0.00 sec)

--2
SELECT CONCAT(CONCAT(CONCAT('For the city ' , city),' , the highest rating is : '),MAX(rating)) result
FROM CUSTOMER
GROUP BY city;
+-----------------------------------------------------+
| result                                              |
+-----------------------------------------------------+
| For the city London , the highest rating is : 100   |
| For the city Rome , the highest rating is : 200     |
| For the city San Jose , the highest rating is : 300 |
| For the city Berlin , the highest rating is : 300   |
+-----------------------------------------------------+
4 rows in set (0.00 sec)

--3
SELECT RATING,cname,cnum 
FROM CUSTOMER
ORDER BY rating DESC;
+--------+----------+------+
| RATING | cname    | cnum |
+--------+----------+------+
|    300 | Grass    | 2004 |
|    300 | Cisneros | 2008 |
|    200 | Giovanni | 2002 |
|    200 | Liu      | 2003 |
|    100 | Hoffman  | 2001 |
|    100 | Clemens  | 2006 |
|    100 | Pereira  | 2007 |
+--------+----------+------+
7 rows in set (0.00 sec)

--4
SELECT COUNT(*) , odate
FROM ORDERS
GROUP BY odate
ORDER BY COUNT(*) DESC;
+----------+------------+
| COUNT(*) | odate      |
+----------+------------+
|        5 | 1990-10-03 |
|        2 | 1990-10-04 |
|        2 | 1990-10-06 |
|        1 | 1990-10-05 |
+----------+------------+
4 rows in set (0.00 sec)