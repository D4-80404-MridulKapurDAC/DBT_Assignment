--1
SELECT onum,snum,amt*0.12 comm FROM ORDERS;
--2
SELECT CONCAT(CONCAT(CONCAT('For the city ' , city),' , the highest rating is : '),MAX(rating)) 
FROM CUSTOMER
GROUP BY city;
--3
SELECT RATING,cname,cnum 
FROM CUSTOMER
ORDER BY rating DESC;
--4
SELECT COUNT(*) , odate
FROM ORDERS
GROUP BY odate
ORDER BY COUNT(*) DESC;
