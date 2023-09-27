--1
SELECT * FROM S 
WHERE S.status = 
(SELECT status FROM S WHERE UPPER(S.sname) = 'CLARK');
--2
SELECT * FROM emp
WHERE emp.deptno = 
(SELECT deptno FROM emp WHERE UPPER(emp.ename) = 'MILLER');
--3
SELECT * FROM P
WHERE P.Weight > all(
    SELECT Weight FROM P WHERE P.color = 'RED'
);
--4
SELECT * FROM J
WHERE J.city = 
(SELECT city FROM J WHERE J.Jname = 'TAPE');
--5
SELECT * FROM P
WHERE P.Weight < all(
    SELECT Weight FROM P WHERE P.color = 'GREEN'
);
--6
SELECT S.Sname FROM S
WHERE S.`S#` = ANY (
    SELECT sp.`S#` 
    FROM sp
    WHERE sp.QTY = (
        SELECT MAX(QTY) FROM sp
    )
);
--7
SELECT ename FROM emp
WHERE emp.sal = (
    SELECT MAX(sal) FROM emp
);
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
--9
SELECT dname FROM dept,emp
WHERE dept.deptno = emp.deptno
GROUP BY dept.deptno,dname
HAVING COUNT(*) >= ALL(
    SELECT COUNT(*) FROM emp GROUP BY deptno
);