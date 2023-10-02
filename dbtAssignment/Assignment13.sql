--1
SELECT cname,city,"HIGH RATING" AS rating FROM CUSTOMER
WHERE rating >= 200
UNION 
SELECT cname,city,"LOW RATING" AS rating FROM CUSTOMER
WHERE rating < 200;
+----------+----------+-------------+
| cname    | city     | rating      |
+----------+----------+-------------+
| Giovanni | Rome     | HIGH RATING |
| Liu      | San Jose | HIGH RATING |
| Grass    | Berlin   | HIGH RATING |
| Cisneros | San Jose | HIGH RATING |
| Hoffman  | London   | LOW RATING  |
| Clemens  | London   | LOW RATING  |
| Pereira  | Rome     | LOW RATING  |
+----------+----------+-------------+
7 rows in set (0.00 sec)

--2
SELECT CUSTOMER.cname as name,CUSTOMER.cnum as num
FROM CUSTOMER,ORDERS
WHERE CUSTOMER.cnum = ORDERS.cnum
GROUP BY cname,CUSTOMER.cnum
HAVING COUNT(CUSTOMER.cnum) > 1
UNION
SELECT SALESPEOPLE.sname as name,SALESPEOPLE.snum as num
FROM SALESPEOPLE,ORDERS
WHERE SALESPEOPLE.snum = SALESPEOPLE.snum
GROUP BY sname,SALESPEOPLE.snum
HAVING COUNT(SALESPEOPLE.snum) > 1;
+----------+------+
| name     | num  |
+----------+------+
| Cisneros | 2008 |
| Grass    | 2004 |
| Clemens  | 2006 |
| Axelrod  | 1003 |
| Rifkin   | 1007 |
| Motika   | 1004 |
| Serres   | 1002 |
| Peel     | 1001 |
+----------+------+
8 rows in set (0.00 sec)

--3
SELECT SALESPEOPLE.snum num FROM SALESPEOPLE WHERE SALESPEOPLE.city = 'San Jose'
UNION(
    SELECT CUSTOMER.cnum num FROM CUSTOMER WHERE CUSTOMER.city = 'San Jose'
    UNION ALL
    SELECT ORDERS.onum FROM ORDERS WHERE ORDERS.odate='1990-10-03'
);
+------+
| num  |
+------+
| 1002 |
| 2003 |
| 2008 |
| 3001 |
| 3003 |
| 3002 |
| 3005 |
| 3006 |
+------+
8 rows in set (0.00 sec)