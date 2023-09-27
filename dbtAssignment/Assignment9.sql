--1
SELECT ORDERS.onum orderID, cname customer FROM CUSTOMER, ORDERS
WHERE ORDERS.cnum =CUSTOMER.cnum;
--2
SELECT ORDERS.onum oderID, cname customer , sname salesman
FROM CUSTOMER, ORDERS, SALESPEOPLE
WHERE ORDERS.cnum =CUSTOMER.cnum 
AND SALESPEOPLE.snum = ORDERS.snum;
--3
SELECT DISTINCT cname Customer,sname Salesman , comm Commmission 
FROM CUSTOMER, SALESPEOPLE
WHERE SALESPEOPLE.snum = CUSTOMER.snum 
AND comm > 0.12;
--4
SELECT SALESPEOPLE.sname Salesman, ORDERS.Amt*SALESPEOPLE.comm as CommmissionAmnt
FROM CUSTOMER, ORDERS, SALESPEOPLE
WHERE SALESPEOPLE.snum = ORDERS.snum 
AND CUSTOMER.cnum =ORDERS.cnum
AND CUSTOMER.rating > 100 ;