--1
SELECT * 
FROM ORDERS
WHERE ORDERS.cnum = 
(SELECT cnum FROM CUSTOMER WHERE lower(cname) = 'cisneros');
+------+---------+------------+------+------+
| Onum | Amt     | Odate      | Cnum | Snum |
+------+---------+------------+------+------+
| 3001 |   18.69 | 1990-10-03 | 2008 | 1007 |
| 3006 | 1098.16 | 1990-10-03 | 2008 | 1007 |
+------+---------+------------+------+------+
2 rows in set (0.00 sec)


--2A
SELECT DISTINCT cname,rating 
FROM CUSTOMER,ORDERS
WHERE CUSTOMER.cnum = ORDERS.cnum
AND AMT > (
    SELECT AVG(AMT) FROM ORDERS
);
+---------+--------+
| cname   | rating |
+---------+--------+
| Liu     |    200 |
| Clemens |    100 |
+---------+--------+
2 rows in set (0.00 sec)

--2B
SELECT cname,rating 
FROM CUSTOMER
WHERE cnum IN (
    SELECT cnum 
    FROM  ORDERS
    WHERE AMT > (
    SELECT AVG(AMT) FROM ORDERS
    ));
+---------+--------+
| cname   | rating |
+---------+--------+
| Liu     |    200 |
| Clemens |    100 |
+---------+--------+
2 rows in set (0.00 sec)

--3
SELECT snum,SUM(AMT) 
FROM ORDERS
GROUP BY snum
HAVING SUM(AMT) > 
(SELECT MAX(AMT) FROM ORDERS);
+------+----------+
| snum | SUM(AMT) |
+------+----------+
| 1001 | 15382.07 |
+------+----------+
1 row in set (0.00 sec)