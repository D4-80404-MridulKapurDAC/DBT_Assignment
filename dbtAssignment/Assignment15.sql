--1
DROP TABLE IF EXISTS MULTICUST;
CREATE TABLE MULTICUST
as 
SELECT * FROM SALESPEOPLE 
WHERE Snum in (
    SELECT Snum FROM CUSTOMER GROUP BY Snum HAVING COUNT(*) > 1
);
SELECT * FROM MULTICUST;
+------+--------+--------+------+
| Snum | Sname  | City   | Comm |
+------+--------+--------+------+
| 1001 | Peel   | London | 0.12 |
| 1004 | Motika | London | 0.11 |
+------+--------+--------+------+
2 rows in set (0.00 sec)

--2
DELETE FROM CUSTOMER 
WHERE Cnum NOT IN (SELECT Cnum FROM ORDERS);
+------+----------+----------+--------+------+
| Cnum | Cname    | City     | Rating | Snum |
+------+----------+----------+--------+------+
| 2001 | Hoffman  | London   |    100 | 1001 |
| 2002 | Giovanni | Rome     |    300 | 1003 |
| 2003 | Liu      | San Jose |    200 | 1004 |
| 2004 | Grass    | Berlin   |    300 | 1004 |
| 2008 | Cisneros | San Jose |    300 | 1007 |
| 2007 | Pereira  | Rome     |    200 | 1004 |
+------+----------+----------+--------+------+
6 rows in set (0.00 sec)

--3
UPDATE SALESPEOPLE SET comm = comm + 0.20
WHERE Snum IN (SELECT Snum FROM ORDERS GROUP BY Snum HAVING SUM(amt) > 3000);
SELECT * FROM SALESPEOPLE;
+------+---------+-----------+------+
| Snum | Sname   | City      | Comm |
+------+---------+-----------+------+
| 1001 | Peel    | London    | 0.12 |
| 1002 | Serres  | San Jose  | 0.33 |
| 1004 | Motika  | London    | 0.11 |
| 1007 | Rifkin  | Barcelona | 0.15 |
| 1003 | Axelrod | New York  | 0.10 |
| 1100 | Blanco  | San Jose  | NULL |
+------+---------+-----------+------+
6 rows in set (0.00 sec)