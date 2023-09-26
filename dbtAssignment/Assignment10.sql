--1
SELECT a.sname , b.sname , a.city
FROM SALESPEOPLE as a , SALESPEOPLE as b
WHERE a.Snum < b.Snum
AND a.city = b.city;
--2
SELECT a.Cname,a.city 
FROM CUSTOMER a, CUSTOMER b
WHERE Lower(b.Cname) = 'hoffman'
AND a.rating = b.rating ;
