--1
SELECT * FROM S ORDER BY CITY DESC;
+------+-------+--------+--------+
| S#   | Sname | Status | City   |
+------+-------+--------+--------+
| S2   | Jones |     10 | Paris  |
| S3   | Blake |     30 | Paris  |
| S1   | Smith |     20 | London |
| S4   | Clark |     20 | London |
| S5   | Adams |     30 | Athens |
+------+-------+--------+--------+
5 rows in set (0.00 sec)

--2
SELECT * FROM S ORDER BY CITY , SNAME ASC;
+------+-------+--------+--------+
| S#   | Sname | Status | City   |
+------+-------+--------+--------+
| S5   | Adams |     30 | Athens |
| S4   | Clark |     20 | London |
| S1   | Smith |     20 | London |
| S3   | Blake |     30 | Paris  |
| S2   | Jones |     10 | Paris  |
+------+-------+--------+--------+
5 rows in set (0.00 sec)

--3
SELECT * FROM S WHERE Status BETWEEN 10 AND 20;
+------+-------+--------+--------+
| S#   | Sname | Status | City   |
+------+-------+--------+--------+
| S1   | Smith |     20 | London |
| S2   | Jones |     10 | Paris  |
| S4   | Clark |     20 | London |
+------+-------+--------+--------+
3 rows in set (0.00 sec)

SELECT * FROM S WHERE Status>=10 AND Status<=20;
+------+-------+--------+--------+
| S#   | Sname | Status | City   |
+------+-------+--------+--------+
| S1   | Smith |     20 | London |
| S2   | Jones |     10 | Paris  |
| S4   | Clark |     20 | London |
+------+-------+--------+--------+
3 rows in set (0.01 sec)

--4
SELECT Pname , Weight FROM P WHERE Weight NOT BETWEEN 10 AND 15;
+-------+--------+
| Pname | Weight |
+-------+--------+
| Bolt  |     17 |
| Screw |     17 |
| Cog   |     19 |
+-------+--------+
3 rows in set (0.00 sec)

--5
SELECT * FROM P WHERE upper(Pname)>='S' AND upper(Pname)<'T';
+------+-------+-------+--------+--------+
| P#   | Pname | Color | Weight | CITY   |
+------+-------+-------+--------+--------+
| P3   | Screw | Blue  |     17 | Rome   |
| P4   | Screw | Red   |     14 | London |
+------+-------+-------+--------+--------+
2 rows in set (0.00 sec)

SELECT * FROM P WHERE upper(Pname) LIKE 'S%';
+------+-------+-------+--------+--------+
| P#   | Pname | Color | Weight | CITY   |
+------+-------+-------+--------+--------+
| P3   | Screw | Blue  |     17 | Rome   |
| P4   | Screw | Red   |     14 | London |
+------+-------+-------+--------+--------+
2 rows in set (0.00 sec)

--6
SELECT * FROM S WHERE CITY LIKE 'L%';
+------+-------+--------+--------+
| S#   | Sname | Status | City   |
+------+-------+--------+--------+
| S1   | Smith |     20 | London |
| S4   | Clark |     20 | London |
+------+-------+--------+--------+
2 rows in set (0.00 sec)

--7
SELECT * FROM J WHERE Jname LIKE '__n%';
+------+---------+--------+
| J#   | Jname   | City   |
+------+---------+--------+
| J2   | Punch   | Rome   |
| J4   | Console | Athens |
+------+---------+--------+
2 rows in set (0.00 sec)