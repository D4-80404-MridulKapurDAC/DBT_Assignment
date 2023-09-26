--1
SELECT S.Sname , SUM(QTY) Total
FROM S, sp
WHERE S.`S#` = sp.`S#`
GROUP BY S.`S#`,S.Sname;
--2
SELECT P.Pname , SUM(QTY) Total
FROM P, sp
WHERE P.`P#` = sp.`P#`
GROUP BY P.`P#`,P.Pname;
--3
SELECT J.Jname , SUM(QTY) Total
FROM J, sp
WHERE J.`J#` = sp.`J#`
GROUP BY J.`J#`,J.Jname;
--4
SELECT S.Sname,P.Pname,J.Jname , SUM(QTY) Total
SELECT COUNT(*) 
FROM S,P,J, sp
WHERE J.`J#` = sp.`J#` AND S.`S#` = sp.`S#` AND P.`P#` = sp.`P#`
GROUP BY J.`J#`,J.Jname,P.`P#`,P.Pname,S.`S#`,S.Sname;
--5
SELECT S.Sname 
FROM S,J,sp
WHERE J.`J#` = sp.`J#` AND  S.`S#` = sp.`S#` 
;
--6
SELECT P.Pname , SUM(QTY)
FROM P,sp
WHERE P.color = 'RED'
AND P.`P#` = sp.`P#`
GROUP BY P.`P#`,P.Pname;
--7
SELECT SUM(QTY) 
FROM S,sp
WHERE S.status = 20
AND S.`S#` = sp.`S#`;
--8 
SELECT P.Pname ,
