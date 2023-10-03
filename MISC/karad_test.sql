--1
SElECT DEPARTMENT_ID,DEPARTMENT_NAME 
FROM departments 
WHERE LOCATION_ID = (
    SELECT LOCATION_ID 
    FROM departments
    WHERE DEPARTMENT_ID = 90
);
--2
SELECT * FROM employees
WHERE SALARY = (
    SELECT A.SALARY
    FROM (SELECT DISTINCT SALARY FROM employees) A,(SELECT DISTINCT SALARY FROM employees) B
    WHERE A.SALARY <= B.SALARY
    GROUP BY A.SALARY
    HAVING COUNT(*) = 3
);
--3
SELECT CONCAT(employees.FIRST_NAME,' ',employees.LAST_NAME) name,employees.EMPLOYEE_ID,job_history.EMPLOYEE_ID,jobs.JOB_TITLE
FROM employees,jobs,job_history
WHERE jobs.JOB_ID = job_history.JOB_ID 
AND job_history.EMPLOYEE_ID = employees.EMPLOYEE_ID
AND DATE_ADD(job_history.START_DATE,INTERVAL 6 MONTH) > job_history.END_DATE;
--4
SELECT jobs.*,employees.FIRST_NAME,employees.SALARY
FROM jobs,employees
WHERE jobs.JOB_ID = employees.JOB_ID
AND employees.SALARY > 12000;
--5
SELECT CONCAT(employees.FIRST_NAME,' ',employees.LAST_NAME) name, SALARY,
SALARY * 15 /100 as PF FROM employees;
--6
SELECT MONTH(employees.HIRE_DATE),COUNT(*)
FROM employees
WHERE YEAR(employees.HIRE_DATE) = YEAR('1987-01-01')
GROUP BY MONTH(employees.HIRE_DATE);
--7
SELECT JOB_ID, COUNT(*),SUM(SALARY),MAX(SALARY) - MIN(SALARY)
FROM employees
GROUP BY JOB_ID;
--8
SELECT * FROM employees
WHERE COMMISSION_PCT = 0.00 
AND SALARY BETWEEN 5000 AND 10000
AND DEPARTMENT_ID = 30;
--9
USE SALESDB;
SELECT Lpad(cname,10 ,'*') padded_value FROM CUSTOMER;
--10
SELECT LENGTH(FIRST_NAME),LAST_NAME FROM employees
WHERE LAST_NAME LIKE '___%b%';

--11
DROP FUNCTION IF EXISTS numJobs;
DELIMITER //
CREATE FUNCTION numJobs(id int)
RETURNS int
NO SQL
BEGIN
    DECLARE x int;
    SELECT COUNT(*) INTO x FROM job_history WHERE EMPLOYEE_ID = id;  
    RETURN x;
END;//
DELIMITER ;
SELECT numJobs(102);

--12
DROP PROCEDURE IF EXISTS serviced;
DELIMITER //
CREATE PROCEDURE serviced(id int)
BEGIN 
    DECLARE x int DEFAULT 0;
    DECLARE snu int DEFAULT 0;
    DECLARE cnae varchar(10) DEFAULT '';
    DECLARE res varchar(255) DEFAULT '';
    DECLARE c1 CURSOR FOR SELECT DISTINCT cname,snum FROM CUSTOMER;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET x = 1;
    OPEN c1;
    FETCH C1 INTO cnae,snu;
    WHILE x = 0 DO
        IF snu = id THEN
            IF res = '' THEN
                SET res = cnae;
            ELSE 
                SET res = CONCAT(res,', ',cnae);
            END IF;
        END IF;
        FETCH C1 INTO cnae,snu;
    END WHILE;
    SELECT res;
END;//
DELIMITER ;
call serviced(1004);