--1
SELECT * FROM S 
WHERE S.status = 
(SELECT status FROM S WHERE UPPER(S.sname) = 'CLARK');
+------+-------+--------+--------+
| S#   | Sname | Status | City   |
+------+-------+--------+--------+
| S1   | Smith |     20 | London |
| S4   | Clark |     20 | London |
+------+-------+--------+--------+
2 rows in set (0.00 sec)

--2
SELECT * FROM emp
WHERE emp.deptno = 
(SELECT deptno FROM emp WHERE UPPER(emp.ename) = 'MILLER');
+-------+--------+-----------+------+------------+---------+------+--------+
| empno | ename  | job       | mgr  | hire       | sal     | comm | deptno |
+-------+--------+-----------+------+------------+---------+------+--------+
|  7782 | CLARK  | MANAGER   | 7839 | 1981-06-09 | 2450.00 | NULL |     10 |
|  7839 | KING   | PRESIDENT | NULL | 1981-11-17 | 5000.00 | NULL |     10 |
|  7934 | MILLER | CLERK     | 7782 | 1982-01-23 | 1300.00 | NULL |     10 |
+-------+--------+-----------+------+------------+---------+------+--------+
3 rows in set (0.00 sec)

--3
SELECT * FROM P
WHERE P.Weight > all(
    SELECT Weight FROM P WHERE P.color = 'RED'
);
Empty set (0.00 sec)

--4
SELECT * FROM J
WHERE J.city = 
(SELECT city FROM J WHERE J.Jname = 'TAPE');
+------+----------+--------+
| J#   | Jname    | City   |
+------+----------+--------+
| J5   | Collator | London |
| J7   | Tape     | London |
+------+----------+--------+
2 rows in set (0.00 sec)

--5
SELECT * FROM P
WHERE P.Weight < all(
    SELECT Weight FROM P WHERE P.color = 'GREEN'
);
+------+-------+-------+--------+--------+
| P#   | Pname | Color | Weight | CITY   |
+------+-------+-------+--------+--------+
| P1   | Nut   | Red   |     12 | London |
| P4   | Screw | Red   |     14 | London |
| P5   | Cam   | Blue  |     12 | Paris  |
+------+-------+-------+--------+--------+
3 rows in set (0.00 sec)

--6
SELECT S.Sname FROM S
WHERE S.`S#` = ANY (
    SELECT sp.`S#` 
    FROM sp
    WHERE sp.QTY = (
        SELECT MAX(QTY) FROM sp
    )
);
+-------+
| Sname |
+-------+
| Jones |
| Adams |
+-------+
2 rows in set (0.00 sec)

--7A
SELECT ename FROM emp
WHERE emp.sal = (
    SELECT MAX(sal) FROM emp
);
+-------+
| ename |
+-------+
| KING  |
+-------+
1 row in set (0.01 sec)

--7B
SELECT a.ename 
FROM emp a left outer join emp b
on a.sal > b.sal
WHERE b.sal IS NULL;
+-------+
| ename |
+-------+
| SMITH |
+-------+
1 row in set (0.00 sec)

--8
SELECT S.Sname FROM S
WHERE S.`S#` = ANY (
    SELECT sp.`S#` 
    FROM sp
    GROUP BY sp.`S#`
    HAVING SUM(QTY) >= ALL(
        SELECT SUM(QTY) as sum FROM sp GROUP BY `S#`
    )
);

SELECT S.Sname FROM S
WHERE S.`S#` = (
    SELECT sp.`S#` 
    FROM sp
    GROUP BY sp.`S#`
    HAVING SUM(QTY) = (
        SELECT MAX(TOT) FROM (
            SELECT SUM(QTY) as TOT FROM sp GROUP BY `S#`
        ) as TEMP
    )
);

SELECT S.Sname 
FROM sp,S
WHERE S.`S#` = sp.`S#`
GROUP BY sp.`S#`,S.Sname
HAVING SUM(QTY) >= ALL (
    SELECT SUM(QTY) FROM sp GROUP BY `S#`
);

SELECT S.Sname 
FROM sp,S
WHERE S.`S#` = sp.`S#`
GROUP BY sp.`S#`,S.Sname
HAVING SUM(QTY) = (
    SELECT MAX(TOT) FROM (
        SELECT SUM(QTY) as TOT FROM sp GROUP BY `S#`
    ) as TEMP
);

+-------+
| Sname |
+-------+
| Jones |
+-------+
1 row in set (0.01 sec)

--9
SELECT dname FROM dept,emp
WHERE dept.deptno = emp.deptno
GROUP BY dept.deptno,dname
HAVING COUNT(*) >= ALL(
    SELECT COUNT(*) FROM emp GROUP BY deptno
);
+-------+
| dname |
+-------+
| SALES |
+-------+
1 row in set (0.00 sec)