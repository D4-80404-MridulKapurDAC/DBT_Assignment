SELECT MIN(STATUS) FROM S;
+-------------+
| MIN(STATUS) |
+-------------+
|          10 |
+-------------+
1 row in set (0.00 sec)


SELECT MAX(Weight) FROM P;
+-------------+
| MAX(Weight) |
+-------------+
|          19 |
+-------------+
1 row in set (0.00 sec)


SELECT AVG(Weight) FROM P;
+-------------+
| AVG(Weight) |
+-------------+
|     15.1667 |
+-------------+
1 row in set (0.00 sec)

SELECT SUM(QTY) FROM sp WHERE `P#` = 'P1';
+----------+
| SUM(QTY) |
+----------+
|     1000 |
+----------+
1 row in set (0.00 sec)


SELECT `P#` ,SUM(QTY) as COUNT
FROM sp 
GROUP BY `P#`;
+------+-------+
| P#   | COUNT |
+------+-------+
| P1   |  1000 |
| P3   |  3500 |
| P5   |  1100 |
| P4   |  1300 |
| P6   |  1300 |
| P2   |   300 |
+------+-------+
6 rows in set (0.00 sec)


SELECT `P#` , AVG(QTY) FROM sp 
GROUP BY `P#`;
+------+----------+
| P#   | AVG(QTY) |
+------+----------+
| P1   | 333.3333 |
| P3   | 388.8889 |
| P5   | 275.0000 |
| P4   | 650.0000 |
| P6   | 325.0000 |
| P2   | 150.0000 |
+------+----------+
6 rows in set (0.00 sec)


SELECT `P#`,MAX(QTY) FROM sp
GROUP BY `P#`
HAVING SUM(QTY) > 800;
+------+----------+
| P#   | MAX(QTY) |
+------+----------+
| P1   |      700 |
| P3   |      800 |
| P5   |      500 |
| P4   |      800 |
| P6   |      500 |
+------+----------+
5 rows in set (0.00 sec)


SELECT Status,COUNT(*) FROM S
GROUP BY Status;
+--------+----------+
| Status | COUNT(*) |
+--------+----------+
|     20 |        2 |
|     10 |        1 |
|     30 |        2 |
+--------+----------+
3 rows in set (0.00 sec)



SELECT COUNT(*),COUNT(Status) FROM S;
+----------+---------------+
| COUNT(*) | COUNT(Status) |
+----------+---------------+
|        5 |             5 |
+----------+---------------+
1 row in set (0.00 sec)


SELECT CASE
WHEN Status=10 THEN 'TEN'
WHEN Status=20 THEN 'TWENTY'
WHEN Status=30 THEN 'THIRTY'
ELSE Status
END AS STATUS,
COUNT(Status)
FROM S
GROUP BY Status; 
+--------+---------------+
| STATUS | COUNT(Status) |
+--------+---------------+
| TWENTY |             2 |
| TEN    |             1 |
| THIRTY |             2 |
+--------+---------------+
3 rows in set, 1 warning (0.00 sec)
