CREATE DATABASE ORDERDB;
USE ORDERDB;

CREATE TABLE ORD_MST (
    ordNO INT primary key,
    custID CHAR(5),
    status CHAR(2)
);

CREATE TABLE PROD_MST (
    prodCD CHAR(5) primary key,
    prodNAME CHAR(25),
    stock INT NOT NULL,
    booked INT NOT NULL
);

CREATE TABLE ORD_DTL(
    ordNO INT REFERENCES ORD_MST(ordNO),
    prodCD CHAR(5) REFERENCES PROD_MST(prodCD),
    qty INT
);

DELIMITER //
CREATE TRIGGER add_ord
BEFORE INSERT 
ON ORD_DTL FOR EACH ROW
BEGIN 
    UPDATE PROD_MST SET booked = booked + new.qty
    WHERE PROD_MST.prodCD = new.prodCD;
END;//
DELIMITER ;

INSERT INTO PROD_MST VALUES
('P1','Floppies',10000,1000),
('P2','Printers',5000,600),
('P3','Modems',3000,200);

INSERT INTO ORD_MST 
VALUES (1,'C1','P');

INSERT INTO ORD_DTL
VALUES
(1,'P2',200);
SELECT * FROM PROD_MST;

DELIMITER //
CREATE TRIGGER dlt_ord
BEFORE DELETE 
ON ORD_DTL FOR EACH ROW
BEGIN 
    UPDATE PROD_MST SET booked = booked - old.qty
    WHERE PROD_MST.prodCD = old.prodCD;
END;//
DELIMITER ;

DELETE FROM ORD_DTL WHERE
ordNO = 1 AND prodCD = 'P2';

DELIMITER //
CREATE TRIGGER upd_ord
BEFORE UPDATE 
ON ORD_DTL FOR EACH ROW
BEGIN 
    IF new.prodCD <> old.prodCD THEN
        UPDATE PROD_MST SET booked = booked - old.qty
            WHERE PROD_MST.prodCD = old.prodCD;
        UPDATE PROD_MST SET booked = booked + old.qty
            WHERE PROD_MST.prodCD = new.prodCD;
    ELSE
        UPDATE PROD_MST SET booked = booked - old.qty + new.qty
            WHERE PROD_MST.prodCD = old.prodCD;
    END IF;
END;//

DELIMITER ;
UPDATE ORD_DTL 
SET prodCD = 'P2' 
WHERE prodCD = 'P1';
SELECT * FROM PROD_MST;

DROP TRIGGER IF EXISTS stat_ord;
DELIMITER //
CREATE TRIGGER stat_ord
BEFORE UPDATE 
ON ORD_MST FOR EACH ROW
BEGIN 
    DECLARE x INT DEFAULT 1;
    DECLARE code CHAR(2);
    DEClARE quant INT;
    DECLARE c1 CURSOR FOR SELECT prodCD,qty FROM ORD_DTL WHERE ordNO = new.ordNO;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET x = 0;
    OPEN c1;
    IF old.status <> new.status THEN
        FETCH c1 INTO code,quant;
        WHILE x=1 DO
            IF new.status = 'D' THEN
                UPDATE PROD_MST SET stock = stock - quant , booked = booked - quant
                WHERE code = prodCD;
            ELSEIF new.status = 'C' THEN
                DELETE FROM ORD_DTL WHERE ordNO = old.ordNO;
            END IF;
            FETCH c1 INTO code,quant;
        END WHILE;    
    END IF;
    CLOSE c1;
END;//
DELIMITER ;

UPDATE ORD_MST SET status = 'D';
SELECT * FROM PROD_MST;
