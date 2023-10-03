--1
SELECT S.Sname , SUM(QTY) Total
FROM S, sp
WHERE S.`S#` = sp.`S#`
GROUP BY S.`S#`,S.Sname;
+-------+-------+
| Sname | Total |
+-------+-------+
| Smith |   900 |
| Jones |  3200 |
| Blake |   700 |
| Clark |   600 |
| Adams |  3100 |
+-------+-------+
5 rows in set (0.00 sec)

--2
SELECT P.Pname , SUM(QTY) Total
FROM P, sp
WHERE P.`P#` = sp.`P#`
GROUP BY P.`P#`,P.Pname;
+-------+-------+
| Pname | Total |
+-------+-------+
| Nut   |  1000 |
| Screw |  3500 |
| Cam   |  1100 |
| Screw |  1300 |
| Cog   |  1300 |
| Bolt  |   300 |
+-------+-------+
6 rows in set (0.00 sec)

--3
SELECT J.Jname , SUM(QTY) Total
FROM J, sp
WHERE J.`J#` = sp.`J#`
GROUP BY J.`J#`,J.Jname;
+----------+-------+
| Jname    | Total |
+----------+-------+
| Sorter   |   800 |
| Console  |  3300 |
| Punch    |  1200 |
| Reader   |   500 |
| Collator |  1100 |
| Terminal |   400 |
| Tape     |  1200 |
+----------+-------+
7 rows in set (0.00 sec)

--4
SELECT S.Sname,P.Pname,J.Jname , SUM(QTY) Total
FROM S,P,J, sp
WHERE J.`J#` = sp.`J#` AND S.`S#` = sp.`S#` AND P.`P#` = sp.`P#`
GROUP BY J.`J#`,J.Jname,P.`P#`,P.Pname,S.`S#`,S.Sname;
+-------+-------+----------+-------+
| Sname | Pname | Jname    | Total |
+-------+-------+----------+-------+
| Adams | Cog   | Punch    |   200 |
| Jones | Cam   | Punch    |   100 |
| Blake | Screw | Punch    |   500 |
| Jones | Screw | Punch    |   200 |
| Adams | Bolt  | Punch    |   200 |
| Clark | Cog   | Reader   |   300 |
| Jones | Screw | Reader   |   200 |
| Adams | Cog   | Console  |   500 |
| Adams | Cam   | Console  |   400 |
| Adams | Screw | Console  |   800 |
| Jones | Screw | Console  |   500 |
| Adams | Screw | Console  |   200 |
| Adams | Bolt  | Console  |   100 |
| Smith | Nut   | Console  |   700 |
| Adams | Nut   | Console  |   100 |
| Adams | Cam   | Collator |   500 |
| Jones | Screw | Collator |   600 |
| Jones | Screw | Terminal |   400 |
| Clark | Cog   | Tape     |   300 |
| Adams | Cam   | Tape     |   100 |
| Jones | Screw | Tape     |   800 |
| Jones | Screw | Sorter   |   400 |
| Blake | Screw | Sorter   |   200 |
| Smith | Nut   | Sorter   |   200 |
+-------+-------+----------+-------+
24 rows in set (0.00 sec)

--5
SELECT S.Sname
FROM S,P,J,sp
WHERE J.`J#` = sp.`J#` AND  S.`S#` = sp.`S#` AND P.`P#` = sp.`P#`
AND J.city = S.city AND S.city = P.city ;
+-------+
| Sname |
+-------+
| Clark |
+-------+
1 row in set (0.00 sec)


--6
SELECT P.Pname , SUM(QTY)
FROM P,sp
WHERE P.color = 'RED'
AND P.`P#` = sp.`P#`
GROUP BY P.`P#`,P.Pname;
+-------+----------+
| Pname | SUM(QTY) |
+-------+----------+
| Nut   |     1000 |
| Screw |     1300 |
| Cog   |     1300 |
+-------+----------+
3 rows in set (0.00 sec)

--7
SELECT SUM(QTY) 
FROM S,sp
WHERE S.status = 20
AND S.`S#` = sp.`S#`;
+----------+
| SUM(QTY) |
+----------+
|     1500 |
+----------+
1 row in set (0.01 sec)

--8
SELECT P.Pname ,SUM(QTY) 
FROM P,sp
WHERE P.`P#` = sp.`P#`
AND P.WEIGHT > 14
GROUP BY P.`P#`,P.Pname;
+-------+----------+
| Pname | SUM(QTY) |
+-------+----------+
| Screw |     3500 |
| Cog   |     1300 |
| Bolt  |      300 |
+-------+----------+
3 rows in set (0.00 sec)

--9
SELECT J.Jname ,J.city 
FROM J,sp
WHERE J.`J#` = sp.`J#`
GROUP BY J.Jname , J.city
HAVING SUM(sp.QTY) > 500;
+----------+--------+
| Jname    | city   |
+----------+--------+
| Sorter   | Paris  |
| Console  | Athens |
| Punch    | Rome   |
| Collator | London |
| Tape     | London |
+----------+--------+
5 rows in set (0.00 sec)

--10
SELECT P.Pname ,SUM(QTY) 
FROM P,sp
WHERE P.`P#` = sp.`P#`
AND P.WEIGHT < 15
GROUP BY P.`P#`,P.Pname;
+-------+----------+
| Pname | SUM(QTY) |
+-------+----------+
| Nut   |     1000 |
| Cam   |     1100 |
| Screw |     1300 |
+-------+----------+
3 rows in set (0.00 sec)

--11
USE testdb;
SELECT a.ename as EMPLOYEE , b.ename as MANAGER
FROM emp a LEFT OUTER JOIN emp b
ON a.mgr = b.empno;
+----------+---------+
| EMPLOYEE | MANAGER |
+----------+---------+
| SMITH    | FORD    |
| ALLEN    | BLAKE   |
| WARD     | BLAKE   |
| JONES    | KING    |
| MARTIN   | BLAKE   |
| BLAKE    | KING    |
| CLARK    | KING    |
| SCOTT    | JONES   |
| KING     | NULL    |
| TURNER   | BLAKE   |
| ADAMS    | SCOTT   |
| JAMES    | BLAKE   |
| FORD     | JONES   |
| MILLER   | CLARK   |
+----------+---------+
14 rows in set (0.00 sec)