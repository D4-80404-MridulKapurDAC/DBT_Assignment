CREATE TABLE dept(
    deptno int auto_increment primary key,
    dept_name char(25) NOT NULL,
    loc char(3) check (loc in ('DEL','BOM','CAL'))
);
 
CREATE TABLE emp(
    empno int auto_increment primary key,
    ename varchar(25)  check(ename = upper(ename)),
    sal float default 7000 check (sal BETWEEN 5000 AND 999999),
    deptno int REFERENCES dept(deptno),
    status char(1) default 'T' check (status in ('T','P','R')),
    comm float not null,
    mob char(15) unique,
    check (sal + comm <= 500000)
);

ALTER TABLE emp ADD COLUMN (gender char(2));

INSERT INTO emp(ename,sal,deptno,status,comm,mob)
VALUES ('ADI',10000,1,'T',371,599098),
('MIK',5001,2,'R',371,099098),
('NIKS',5900,3,'R',371,199098),
('KUSH',6000,4,'P',371,299098);

INSERT INTO emp(empno,ename,sal,deptno,status,comm,mob)
VALUES (10,'ADIT',10000,4,'P',314,21741);

CREATE UNIQUE INDEX EMPNO_DEPTNO ON emp (empno,deptno);

DROP INDEX EMPNO_DEPTNO ON emp;