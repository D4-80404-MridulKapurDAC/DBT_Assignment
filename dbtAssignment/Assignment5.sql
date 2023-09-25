-- SALESPEOPLE Snum int(4),Sname varchar(10),City varchar(10),Comm float(3,2)
-- CUSTOMER Cnum int(4), Cname varchar(10), City varchar(10), Rating int(4), Snum int(4)
-- ORDERS onum int, Amt float, Odate date, Cnum int, Snum int 
--1
SELECT * FROM ORDERS WHERE Amt >= 2000;
--2
SELECT Sname Name,City City FROM SALESPEOPLE WHERE Comm > 0.1
--3
SELECT * FROM CUSTOMER WHERE Rating > 100 OR City='Rome';
--4
Select * from ORDERS
where (amt < 1000 OR
NOT (odate = '1990-10-03'
AND cnum > 2003));
--5
Select * from ORDERS
where NOT ((odate = '1990-10-03' OR snum>1006) AND amt >= 1500);
--6
Select snum, sname, city, comm From SAELESPEOPLE 
WHERE comm BETWEEN .12 AND .14;
