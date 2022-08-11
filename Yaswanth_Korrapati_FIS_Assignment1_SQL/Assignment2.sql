CREATE Database FISDB
use FISDB

create table DEPT
(
DEPTNO int Primary Key,
DNAME varchar(20),
LOC varchar(20)
)

Insert into DEPT Values (10, 'ACCOUNTING', 'NEW YORK'),
						(20, 'RESEARCH', 'DALLAS'),
						(30, 'SALES', 'CHICAGO'),
						(40, 'OPERATIONS', 'BOSTON')

Select * from DEPT
-- Drop Table DEPT

create table EMP
(
	EMPNO int Primary key,
	ENAME varchar(20),
	JOB varchar(20),
	mgrid float,
	HIREDATE DATE,
	Sal float,
	COMM FLOAT,
	DEPTNO int references DEPT(DEPTNO)
)
  Drop table EMP

INSERT INTO EMP VALUES   (7369, 'SMITH', 'CLERK', 7902, '1980-12-17',800,NULL,20),
						(7499, 'ALLEN', 'SALESMAN', 7698, '1981-02-20',1600,300,30),
						(7521, 'WARD', 'SALESMAN', 7698, '1981-02-22',1250,500,30),
						(7566, 'JONES', 'MANAGER', 7839, '1981-04-02',2975,NULL,20),
						(7654, 'MARTIN', 'SALESMAN', 7698, '1981-09-28', 1250,1400,30),
						(7698, 'BLAKE', 'MANAGER', 7839,'1981-05-01',2850, NULL, 30),
						(7782, 'CLARK', 'MANAGER', 7839, '1981-06-09', 2450,NULL,10),
						(7788, 'SCOTT','ANALYST', 7566, '1987-04-19', 3000,NULL,20),
						(7839, 'KING', 'PRESIDENT', NULL, '1981-11-17',5000,null,10),
						(7844, 'TURNER', 'SALESMAN', 7698,'1981-09-08',1500,0,30),
						(7876, 'ADAMS','CLERK',7788,'1987-05-23',1100,NULL,20),
						(7900,'JAMES','CLERK',7698,'1981-12-03',950,NULL,30),
						(7902,'FORD','ANALYST',7566,'1981-12-03',3000,NULL,20),
						(7934,'MILLER','CLERK',7782,'1982-01-23',1300,NULL,10)

SELECT * FROM EMP

-- Q1. Retrieve a list of MANAGERS.

--  with JOB as the manager reff

Select EMPNO, ENAME
From EMP 
Where JOB = 'MANAGER'

-- with mgrid as the job riff -- the result members act as a manager of atleast one person.

Select DISTINCT(E1.ENAME) as MANAGER_NAME
FROM EMP E1 join EMP E2 
on E1.EMPNO = E2.mgrid


-- Q2. Find out the names and salaries of all employees earning more than 1000 per month.

Select ENAME, Sal 
From EMP
Where Sal > 1000

-- Q3. Display the names and salaries of all employees except JAMES. 

Select ENAME, Sal
From EMP
where ENAME != 'JAMES'

-- Q4. Find out the details of employees whose names begin with ‘S’. 

Select * 
From EMP
where ENAME like 'S%'

-- Q5. Find out the names of all employees that have ‘A’ anywhere in their name. 

Select ENAME
From EMP
where ENAME like '%A%'

-- Q6. Find out the names of all employees that have ‘L’ as their third character in their name. 

Select ENAME 
From EMP
Where ENAME like '__L%'

-- Q7. Compute daily salary of JONES. 
--   ( Daily rate of pay for a monthly rated employee is calculated using below formula )
--   ( Day pay = Emp Monthly pay / 26 days )

Select ENAME, Sal as MONTHLY_SALARY, Sal/26 as DAILY_SALARY
From EMP
Where ENAME = 'JONES'

-- Q8. Calculate the total monthly salary of all employees. 

Select Count(*) as TOTAL_NO_OF_EMPLOYEES, Sum(Sal) As TOTAL_MONTLY_SAL_OF_EMP
From EMP

-- Q9. Print the average annual salary . 

Select Avg(Sal * 12) As AVG_ANNUAL_SAL
From EMP 

-- Q10. Select the name, job, salary, department number of all employees except SALESMAN from department number 30.

Select ENAME, JOB, Sal, DEPTNO 
From EMP
where JOB NOT LIKE 'SALESMAN' and DEPTNO = 30

-- Q11. List unique departments of the EMP table. 

Select Distinct(DEPT.DNAME) as Department 
From DEPT Join EMP
ON DEPT.DEPTNO = EMP.DEPTNO

-- Q12. List the name and salary of employees who earn more than 1500 and are in department 10 or 30. 
--      Label the columns Employee and Monthly Salary respectively.

Select ENAME as Employee, Sal as 'Monthly Salary'
From EMP
where Sal > 1500 and DEPTNO in(10,30)

-- Q13. Display the name, job, and salary of all the employees whose job is MANAGER or 
--      ANALYST and their salary is not equal to 1000, 3000, or 5000. 

Select ENAME, JOB, Sal AS SALARY 
From EMP
Where JOB IN('MANAGER', 'ANALYST') AND Sal NOT in (1000, 3000, 5000)

-- Q14. Display the name, salary and commission for all employees whose commission 
--      amount is greater than their salary increased by 10%. 

Select ENAME, Sal as SALARY, COMM as COMMISSION 
From EMP 
Where COMM > Sal * 1.10

-- Q15. Display the name of all employees who have two Ls in their name and are in department 30 or their manager is 7782. 

Select ENAME As Employee
From EMP
Where ENAME like '%L%L%' And (DEPTNO = 30 or mgrid = 7782)

-- Q16. Display the names of employees with experience of over 10 years and under 20 yrs. Count the total number of employees. 

-- There are no employees who have exp between 10 and 20

Select ENAME as EMP_NAME, YEAR(GETDATE()) - YEAR(HIREDATE) AS EXPERIENCE_IN_YEARS
From EMP
Where ( YEAR(GETDATE()) - YEAR(HIREDATE)) between 10 and 20

-- Q17. Retrieve the names of departments in ascending order and their employees in descending order. 

Select DEPT.DNAME as DEPT_NAME, EMP.ENAME as EMP_NAME
From DEPT JOIN EMP
on DEPT.DEPTNO = EMP.DEPTNO
Order by DEPT.DNAME ASC, EMP.ENAME DESC

-- Q18. Find out experience of MILLER. 

Select YEAR(GETDATE()) - YEAR(HIREDATE) AS EXPERIENCE_IN_YEARS
From EMP
where Ename = 'MILLER'

