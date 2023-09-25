CREATE TABLE S (`S#` CHAR(5), Sname CHAR(20), Status INT, City CHAR(15));

CREATE TABLE P (`P#` CHAR(6), Pname CHAR(20), Color CHAR(6), Weight INT , CITY
CHAR(15));

CREATE TABLE J (`J#` CHAR(4), Jname CHAR(10), City CHAR(15));

--1
SELECT CONCAT(UPPER(SUBSTR(Sname,1,1)),LOWER(SUBSTR(SNAME,2))) FROM S;
--2
SELECT UPPER(Sname) FROM S;
--3
SELECT LOWER(Sname) FROM S;
--4
SELECT Lpad(Sname,25,'*') c FROM S;
--5
SELECT Replace(Sname,'la','ro') FROM S;
--6
SELECT Replace(Replace(Sname,'l','r'),'a','o') FROM S;
--7
SELECT Sname,Length(Sname) FROM S;
--8
SELECT Sname FROM S WHERE soundex(Sname) = Soundex('BLOKE');
--9
SELECT Sname ,
CASE
WHEN Status=10 THEN 'TEN'
WHEN Status=20 THEN 'TWENTY'
WHEN Status=30 THEN 'THIRTY'
WHEN Status=40 THEN 'FORTY'
WHEN Status=50 THEN 'FIFTY'
WHEN Status=60 THEN 'SIXTY'
ELSE Status
END AS STATUS
    FROM S; 
--10
SELECT SYSDATE() FROM DUAL;