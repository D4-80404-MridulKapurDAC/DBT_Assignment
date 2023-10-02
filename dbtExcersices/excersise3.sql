--1
SELECT CONCAT(UPPER(SUBSTR(Sname,1,1)),LOWER(SUBSTR(SNAME,2))) res FROM S;
+-------+
| res   |
+-------+
| Smith |
| Jones |
| Blake |
| Clark |
| Adams |
+-------+
5 rows in set (0.00 sec)

--2
SELECT UPPER(Sname) res FROM S;
+-------+
| res   |
+-------+
| SMITH |
| JONES |
| BLAKE |
| CLARK |
| ADAMS |
+-------+
5 rows in set (0.00 sec)

--3
SELECT LOWER(Sname) res FROM S;
+-------+
| res   |
+-------+
| smith |
| jones |
| blake |
| clark |
| adams |
+-------+
5 rows in set (0.00 sec)

--4
SELECT Lpad(Sname,25,'*') res FROM S;
+---------------------------+
| res                       |
+---------------------------+
| ********************Smith |
| ********************Jones |
| ********************Blake |
| ********************Clark |
| ********************Adams |
+---------------------------+
5 rows in set (0.00 sec)

--5
SELECT Replace(Sname,'la','ro') res FROM S;
+-------+
| res   |
+-------+
| Smith |
| Jones |
| Broke |
| Crork |
| Adams |
+-------+
5 rows in set (0.01 sec)

--6
SELECT Replace(Replace(Sname,'l','r'),'a','o') res FROM S;
+-------+
| res   |
+-------+
| Smith |
| Jones |
| Broke |
| Crork |
| Adoms |
+-------+
5 rows in set (0.00 sec)

--7
SELECT Sname,Length(Sname) res FROM S;
+-------+------+
| Sname | res  |
+-------+------+
| Smith |    5 |
| Jones |    5 |
| Blake |    5 |
| Clark |    5 |
| Adams |    5 |
+-------+------+
5 rows in set (0.00 sec)

--8
SELECT Sname res FROM S WHERE soundex(Sname) = Soundex('BLOKE');
+-------+
| res   |
+-------+
| Blake |
+-------+
1 row in set (0.00 sec)

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
+-------+--------+
| Sname | STATUS |
+-------+--------+
| Smith | TWENTY |
| Jones | TEN    |
| Blake | THIRTY |
| Clark | TWENTY |
| Adams | THIRTY |
+-------+--------+
5 rows in set (0.00 sec)

--10
SELECT SYSDATE() res FROM DUAL;
+---------------------+
| res                 |
+---------------------+
| 2023-10-02 20:44:45 |
+---------------------+
1 row in set (0.01 sec)