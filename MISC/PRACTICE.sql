 CREATE TABLE dept(
    deptno int auto_increment primary key,
    dept_name char(25) NOT NULL,
    loc char(3) check (loc in ('DEL','BOM','CAL'))
 );
 
CREATE TABLE emp(
    empno int auto_increment primary key,
    ename varchar(25)  check(ename = upper(ename)),
    sal float default 7000 check (sal BETWEEN 5000 AND 999999),
    deptno FOREIGN KEY REFERENCES dept(deptno),
    status char(1) default('T') check (status in ('T','P','R')),
    comm float not null,
    mob char(15) unique
    check (sal + comm <= 500000)
);