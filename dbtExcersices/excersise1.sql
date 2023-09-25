CREATE TABLE SEMP(EMPNO CHAR(4), EMPNAME CHAR(20), BASIC FLOAT, DEPTNO CHAR(2), DEPTHEAD CHAR(4));

CREATE TABLE SDEPT(DEPTNO CHAR(2),DEPTNAME CHAR(15));

INSERT INT SDEPT VALUES
(10, 'Development'),
(20, 'Training');

INSERT INT SEMP VALUES
(0001, 'SUNIL',6000,10),
(0002, 'HIREN', 8000,20),
(0003, 'ALI', 4000, 10),
(0004, 'GEORGE', 6000, 20);

CREATE TABLE S (`S#` CHAR(5), Sname CHAR(20), Status INT, City CHAR(15));

CREATE TABLE P (`P#` CHAR(6), Pname CHAR(20), Color CHAR(6), Weight INT , CITY
CHAR(15));

CREATE TABLE J (`J#` CHAR(4), Jname CHAR(10), City CHAR(15));

CREATE TABLE sp (`S#` CHAR(4), `P#` CHAR(4), `J#` CHAR(4), QTY INT);

INSERT INTO S VALUES
('S1', 'Smith', 20,'London'),
('S2', 'Jones', 10, 'Paris'),
('S3', 'Blake', 30,'Paris'),
('S4', 'Clark', 20,'London'),
('S5', 'Adams', 30,'Athens');

INSERT INTO P VALUES
('P1', 'Nut', 'Red', 12, 'London'),
('P2', 'Bolt', 'Green ', 17, 'Paris'),
('P3', 'Screw', 'Blue', 17, 'Rome'),
('P4', 'Screw', 'Red', 14, 'London'),
('P5', 'Cam', 'Blue', 12, 'Paris'),
('P6', 'Cog', 'Red', 19, 'London');

INSERT INTO J VALUES
('J1', 'Sorter', 'Paris'),
('J2', 'Punch', 'Rome'),
('J3', 'Reader', 'Athens'),
('J4', 'Console ', 'Athens'),
('J5', 'Collator ', 'London'),
('J6', 'Terminal ', 'Oslo'),
('J7', 'Tape', 'London');

INSERT INTO sp VALUES
('S1', 'P1', 'J1', 200),
('S1', 'P1', 'J4', 700),
('S2', 'P3', 'J1', 400),
('S2', 'P3', 'J2', 200),
('S2', 'P3', 'J3', 200),
('S2', 'P3', 'J4', 500),
('S2', 'P3', 'J5', 600),
('S2', 'P3', 'J6', 400),
('S2', 'P3', 'J7', 800),
('S2', 'P5', 'J2', 100),
('S3', 'P3', 'J1', 200),
('S3', 'P4', 'J2', 500),
('S4', 'P6', 'J3', 300),
('S4', 'P6', 'J7', 300),
('S5', 'P2', 'J2', 200),
('S5', 'P2', 'J4', 100),
('S5', 'P5', 'J5', 500),
('S5', 'P5', 'J7', 100),
('S5', 'P6', 'J2', 200),
('S5', 'P1', 'J4', 100),
('S5', 'P3', 'J4', 200),
('S5', 'P4', 'J4', 800),
('S5', 'P5', 'J4', 400),
('S5', 'P6', 'J4', 500);

--5
SELECT * FROM S;
--6
SELECT `S#`, SNAME FROM S;
--7
SELECT PNAME, COLOR FROM P WHERE CITY='London';
--8
SELECT * FROM S WHERE CITY='London';
--9
SELECT * FROM S WHERE CITY='Paris' OR CITY='Athens';
--10
SELECT * FROM J WHERE CITY='Athens';
-- 11
SELECT * FROM P WHERE weight >= 12 AND weight<=14;
SELECT * FROM P WHERE weight BETWEEN 12 AND 14;
--12
SELECT * FROM S WHERE Status>=20;
--13
SELECT * FROM S WHERE CITY!='London';
--14
--15
SELECT Weight*1000 'weight(mg)',Weight*0.001 'wight(Kg)' FROM P;

D4_80404_mridul>_CREATE TABLE P (`P#` CHAR(6), Pname CHAR(20), Color CHAR(6), Weight INT , CITY
    -> CHAR(15));
Query OK, 0 rows affected (0.02 sec)

D4_80404_mridul>_CREATE TABLE P (`P#` CHAR(6), Pname CHAR(20), Color CHAR(6), Weight INT , CITY CHAR(15));
Query OK, 0 rows affected (0.02 sec)

D4_80404_mridul>_CREATE TABLE J (`J#` CHAR(4), Jname CHAR(10), City CHAR(15));
Query OK, 0 rows affected (0.02 sec)

D4_80404_mridul>_CREATE TABLE sp (`S#` CHAR(4), `P#` CHAR(4), `J#` CHAR(4), QTY INT);
Query OK, 0 rows affected (0.02 sec)

D4_80404_mridul>_INSERT INTO P VALUES
    -> ('P1', 'Nut', 'Red', 12, 'London'),
    -> ('P2', 'Bolt', 'Green ', 17, 'Paris'),
    -> ('P3', 'Screw', 'Blue', 17, 'Rome'),
    -> ('P4', 'Screw', 'Red', 14, 'London'),
    -> ('P5', 'Cam', 'Blue', 12, 'Paris'),
    -> ('P6', 'Cog', 'Red', 19, 'London');
Query OK, 6 rows affected (0.03 sec)
Records: 6  Duplicates: 0  Warnings: 0

D4_80404_mridul>_INSERT INTO S VALUES
    -> ('S1', 'Smith', 20,'London'),
    -> ('S2', 'Jones', 10, 'Paris'),
    -> ('S3', 'Blake', 30,'Paris'),
    -> ('S4', 'Clark', 20,'London'),
    -> ('S5', 'Adams', 30,'Athens');
Query OK, 5 rows affected (0.03 sec)
Records: 5  Duplicates: 0  Warnings: 0

D4_80404_mridul>_INSERT INTO J VALUES
    -> ('J1', 'Sorter', 'Paris'),
    -> ('J2', 'Punch', 'Rome'),
    -> ('J3', 'Reader', 'Athens'),
    -> ('J4', 'Console ', 'Athens'),
    -> ('J5', 'Collator ', 'London'),
    -> ('J6', 'Terminal ', 'Oslo'),
    -> ('J7', 'Tape', 'London');
Query OK, 7 rows affected (0.00 sec)
Records: 7  Duplicates: 0  Warnings: 0

D4_80404_mridul>_INSERT INTO sp VALUES
    -> ('S1', 'P1', 'J1', 200),
    -> ('S1', 'P1', 'J4', 700),
    -> ('S2', 'P3', 'J1', 400),
    -> ('S2', 'P3', 'J2', 200),
    -> ('S2', 'P3', 'J3', 200),
    -> ('S2', 'P3', 'J4', 500),
    -> ('S2', 'P3', 'J5', 600),
    -> ('S2', 'P3', 'J6', 400),
    -> ('S2', 'P3', 'J7', 800),
    -> ('S2', 'P5', 'J2', 100),
    -> ('S3', 'P3', 'J1', 200),
    -> ('S3', 'P4', 'J2', 500),
    -> ('S4', 'P6', 'J3', 300),
    -> ('S4', 'P6', 'J7', 300),
    -> ('S5', 'P2', 'J2', 200),
    -> ('S5', 'P2', 'J4', 100),
    -> ('S5', 'P5', 'J5', 500),
    -> ('S5', 'P5', 'J7', 100),
    -> ('S5', 'P6', 'J2', 200),
    -> ('S5', 'P1', 'J4', 100),
    -> ('S5', 'P3', 'J4', 200),
    -> ('S5', 'P4', 'J4', 800),
    -> ('S5', 'P5', 'J4', 400),
    -> ('S5', 'P6', 'J4', 500);
Query OK, 24 rows affected (0.01 sec)
Records: 24  Duplicates: 0  Warnings: 0

D4_80404_mridul>_SELECT * FROM S;
+------+-------+--------+--------+
| S#   | Sname | Status | City   |
+------+-------+--------+--------+
| S1   | Smith |     20 | London |
| S2   | Jones |     10 | Paris  |
| S3   | Blake |     30 | Paris  |
| S4   | Clark |     20 | London |
| S5   | Adams |     30 | Athens |
+------+-------+--------+--------+
5 rows in set (0.00 sec)

D4_80404_mridul>_SELECT `S#`, SNAME FROM S;
+------+-------+
| S#   | SNAME |
+------+-------+
| S1   | Smith |
| S2   | Jones |
| S3   | Blake |
| S4   | Clark |
| S5   | Adams |
+------+-------+
5 rows in set (0.00 sec)

D4_80404_mridul>_SELECT PNAME, COLOR FROM P WHERE CITY='London';
+-------+-------+
| PNAME | COLOR |
+-------+-------+
| Nut   | Red   |
| Screw | Red   |
| Cog   | Red   |
+-------+-------+
3 rows in set (0.00 sec)

D4_80404_mridul>_SELECT * FROM S WHERE CITY='London';
+------+-------+--------+--------+
| S#   | Sname | Status | City   |
+------+-------+--------+--------+
| S1   | Smith |     20 | London |
| S4   | Clark |     20 | London |
+------+-------+--------+--------+
2 rows in set (0.00 sec)

D4_80404_mridul>_SELECT * FROM S WHERE CITY='Paris' OR CITY='Athens';
+------+-------+--------+--------+
| S#   | Sname | Status | City   |
+------+-------+--------+--------+
| S2   | Jones |     10 | Paris  |
| S3   | Blake |     30 | Paris  |
| S5   | Adams |     30 | Athens |
+------+-------+--------+--------+
3 rows in set (0.00 sec)

D4_80404_mridul>_SELECT * FROM J WHERE CITY='Athens';
+------+---------+--------+
| J#   | Jname   | City   |
+------+---------+--------+
| J3   | Reader  | Athens |
| J4   | Console | Athens |
+------+---------+--------+
2 rows in set (0.00 sec)

D4_80404_mridul>_SELECT * FROM P WHERE weight >= 12 AND weight<=14;
+------+-------+-------+--------+--------+
| P#   | Pname | Color | Weight | CITY   |
+------+-------+-------+--------+--------+
| P1   | Nut   | Red   |     12 | London |
| P4   | Screw | Red   |     14 | London |
| P5   | Cam   | Blue  |     12 | Paris  |
+------+-------+-------+--------+--------+
3 rows in set (0.00 sec)

D4_80404_mridul>_SELECT * FROM P WHERE weight BETWEEN 12 AND 14;
+------+-------+-------+--------+--------+
| P#   | Pname | Color | Weight | CITY   |
+------+-------+-------+--------+--------+
| P1   | Nut   | Red   |     12 | London |
| P4   | Screw | Red   |     14 | London |
| P5   | Cam   | Blue  |     12 | Paris  |
+------+-------+-------+--------+--------+
3 rows in set (0.00 sec)

D4_80404_mridul>_SELECT * FROM S WHERE Status>=20;
+------+-------+--------+--------+
| S#   | Sname | Status | City   |
+------+-------+--------+--------+
| S1   | Smith |     20 | London |
| S3   | Blake |     30 | Paris  |
| S4   | Clark |     20 | London |
| S5   | Adams |     30 | Athens |
+------+-------+--------+--------+
4 rows in set (0.01 sec)

D4_80404_mridul>_SELECT * FROM S WHERE CITY!='London';
+------+-------+--------+--------+
| S#   | Sname | Status | City   |
+------+-------+--------+--------+
| S2   | Jones |     10 | Paris  |
| S3   | Blake |     30 | Paris  |
| S5   | Adams |     30 | Athens |
+------+-------+--------+--------+
3 rows in set (0.00 sec)

D4_80404_mridul>_SELECT Weight*1000 'weight(mg)',Weight*0.001 'wight(Kg)' FROM P;
+------------+-----------+
| weight(mg) | wight(Kg) |
+------------+-----------+
|      12000 |     0.012 |
|      17000 |     0.017 |
|      17000 |     0.017 |
|      14000 |     0.014 |
|      12000 |     0.012 |
|      19000 |     0.019 |
+------------+-----------+
6 rows in set (0.00 sec)
