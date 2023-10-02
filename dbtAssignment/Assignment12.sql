--1
SELECT * FROM CUSTOMER
WHERE 
rating >= any(
    SELECT rating FROM CUSTOMER,SALESPEOPLE 
    WHERE CUSTOMER.snum = SALESPEOPLE.snum
    AND LOWER(SALESPEOPLE.sname) = 'serres'
);
+------+----------+----------+--------+------+
| Cnum | Cname    | City     | Rating | Snum |
+------+----------+----------+--------+------+
| 2002 | Giovanni | Rome     |    200 | 1003 |
| 2003 | Liu      | San Jose |    200 | 1002 |
| 2004 | Grass    | Berlin   |    300 | 1002 |
| 2008 | Cisneros | San Jose |    300 | 1007 |
+------+----------+----------+--------+------+
4 rows in set (0.00 sec)

--2A
SELECT Sname 
FROM SALESPEOPLE
WHERE LOWER(city) != ALL
(SElECT LOWER(city) FROM CUSTOMER);
+---------+
| Sname   |
+---------+
| Rifkin  |
| Axelrod |
+---------+
2 rows in set (0.00 sec)

--2B
SELECT Sname 
FROM SALESPEOPLE
WHERE LOWER(city) != ANY
(SElECT LOWER(city) FROM CUSTOMER);
+---------+
| Sname   |
+---------+
| Peel    |
| Serres  |
| Motika  |
| Rifkin  |
| Axelrod |
+---------+
5 rows in set (0.00 sec)

--3
SELECT * FROM ORDERS
WHERE amt > Any (
    SELECT amt FROM ORDERS,CUSTOMER
    WHERE ORDERS.cnum = CUSTOMER.cnum
    AND CUSTOMER.city  = 'London'
);
+------+---------+------------+------+------+
| Onum | Amt     | Odate      | Cnum | Snum |
+------+---------+------------+------+------+
| 3002 | 1900.10 | 1990-10-03 | 2007 | 1004 |
| 3005 | 5160.45 | 1990-10-03 | 2003 | 1002 |
| 3006 | 1098.16 | 1990-10-03 | 2008 | 1007 |
| 3009 | 1713.23 | 1990-10-04 | 2002 | 1003 |
| 3008 | 4723.00 | 1990-10-05 | 2006 | 1001 |
| 3010 | 1309.95 | 1990-10-06 | 2004 | 1002 |
| 3011 | 9891.88 | 1990-10-06 | 2006 | 1001 |
+------+---------+------------+------+------+
7 rows in set (0.00 sec)

--4
SELECT * FROM ORDERS
WHERE amt > Any (
    SELECT MIN(amt) FROM ORDERS,CUSTOMER
    WHERE ORDERS.cnum = CUSTOMER.cnum
    AND CUSTOMER.city  = 'London'
);
+------+---------+------------+------+------+
| Onum | Amt     | Odate      | Cnum | Snum |
+------+---------+------------+------+------+
| 3002 | 1900.10 | 1990-10-03 | 2007 | 1004 |
| 3005 | 5160.45 | 1990-10-03 | 2003 | 1002 |
| 3006 | 1098.16 | 1990-10-03 | 2008 | 1007 |
| 3009 | 1713.23 | 1990-10-04 | 2002 | 1003 |
| 3008 | 4723.00 | 1990-10-05 | 2006 | 1001 |
| 3010 | 1309.95 | 1990-10-06 | 2004 | 1002 |
| 3011 | 9891.88 | 1990-10-06 | 2006 | 1001 |
+------+---------+------------+------+------+
7 rows in set (0.01 sec)