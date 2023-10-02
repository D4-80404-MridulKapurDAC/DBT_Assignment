--1
SELECT ORDERS.onum orderID, cname customer FROM CUSTOMER, ORDERS
WHERE ORDERS.cnum =CUSTOMER.cnum;
+---------+----------+
| orderID | customer |
+---------+----------+
|    3001 | Cisneros |
|    3003 | Hoffman  |
|    3002 | Pereira  |
|    3005 | Liu      |
|    3006 | Cisneros |
|    3009 | Giovanni |
|    3007 | Grass    |
|    3008 | Clemens  |
|    3010 | Grass    |
|    3011 | Clemens  |
+---------+----------+
10 rows in set (0.00 sec)

--2
SELECT ORDERS.onum oderID, cname customer , sname salesman
FROM CUSTOMER, ORDERS, SALESPEOPLE
WHERE ORDERS.cnum =CUSTOMER.cnum 
AND SALESPEOPLE.snum = ORDERS.snum;
+--------+----------+----------+
| oderID | customer | salesman |
+--------+----------+----------+
|   3003 | Hoffman  | Peel     |
|   3009 | Giovanni | Axelrod  |
|   3005 | Liu      | Serres   |
|   3010 | Grass    | Serres   |
|   3007 | Grass    | Serres   |
|   3011 | Clemens  | Peel     |
|   3008 | Clemens  | Peel     |
|   3006 | Cisneros | Rifkin   |
|   3001 | Cisneros | Rifkin   |
|   3002 | Pereira  | Motika   |
+--------+----------+----------+
10 rows in set (0.01 sec)

--3
SELECT DISTINCT cname Customer,sname Salesman , comm Commmission 
FROM CUSTOMER, SALESPEOPLE
WHERE SALESPEOPLE.snum = CUSTOMER.snum 
AND comm > 0.12;
+----------+----------+-------------+
| Customer | Salesman | Commmission |
+----------+----------+-------------+
| Liu      | Serres   |        0.13 |
| Grass    | Serres   |        0.13 |
| Cisneros | Rifkin   |        0.15 |
+----------+----------+-------------+
3 rows in set (0.00 sec)

--4
SELECT SALESPEOPLE.sname Salesman, ORDERS.Amt*SALESPEOPLE.comm as CommmissionAmnt
FROM CUSTOMER, ORDERS, SALESPEOPLE
WHERE SALESPEOPLE.snum = ORDERS.snum 
AND CUSTOMER.cnum =ORDERS.cnum
AND CUSTOMER.rating > 100 ;
+----------+-----------------+
| Salesman | CommmissionAmnt |
+----------+-----------------+
| Serres   |          170.29 |
| Serres   |            9.85 |
| Serres   |          670.86 |
| Rifkin   |          164.72 |
| Rifkin   |            2.80 |
| Axelrod  |          171.32 |
+----------+-----------------+
6 rows in set (0.01 sec)
