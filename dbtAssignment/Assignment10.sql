--1
SELECT a.sname , b.sname , a.city
FROM SALESPEOPLE as a , SALESPEOPLE as b
WHERE a.Snum < b.Snum
AND a.city = b.city;
+-------+--------+--------+
| sname | sname  | city   |
+-------+--------+--------+
| Peel  | Motika | London |
+-------+--------+--------+
1 row in set (0.00 sec)

--2
SELECT a.Cname,a.city 
FROM CUSTOMER a, CUSTOMER b
WHERE Lower(b.Cname) = 'hoffman'
AND a.rating = b.rating ;
+---------+--------+
| Cname   | city   |
+---------+--------+
| Pereira | Rome   |
| Clemens | London |
| Hoffman | London |
+---------+--------+
3 rows in set (0.00 sec)