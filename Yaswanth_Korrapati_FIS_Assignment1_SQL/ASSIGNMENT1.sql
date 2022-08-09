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

-- Q1. List all Employees whose name begins with 'A'?

Select ENAME As Employee_Name 
From EMP
Where ENAME Like 'A%'

-- Q2. All Emoployees who Dont have a Manager? (Listing out the employees whose job isn't a manager)

Select ENAME As EMP_NOT_A_MANAGER
From EMP
Where JOB != 'MANAGER'

-- Q3. List employee name, number and salary for those employees who earn in range 1200 to 1400?

Select ENAME, EMPNO, Sal 
From EMP
where Sal between 1200 and 1400

-- Q4. Give all the employees in the Research department a 10% pay rise verify that this has been done by listing all their details before and after the rise?

Select ENAME, DEPTNO, Sal as SALARY_BEFORE_RISE, Sal * 1.10 as SALARY_AFTER_RISE 
from EMP 
where DEPTNO = 20

-- Q5. Find the number of CLERKS Employed. Give it a descriptive heading?

Select count(*) As Number_of_Clerks_Employed
From EMP
Where JOB = 'CLERK'

-- Q6. Find the Average salary for each jobtype and number of people employed in each job?

Select JOB, AVG(Sal) As AVG_SALARY, Count(*) As NO_OF_EMP_IN_THIS_ROLE
fROM EMP
GROUP BY JOB

-- Q7. List the Employees with lowest and highest salary? (I am using subquery)

Select ENAME, Sal as SAL_LOWEST_HIGHEST
From EMP
Where Sal = (Select Max(Sal) From EMP) or Sal = (Select Min(Sal) From EMP)

-- or
Select ENAME , Sal As HIGHEST_SALARY
From EMP
Where sal = (Select Max(Sal) From EMP)

Select ENAME , Sal As LOWEST_SALARY
From EMP
Where sal = (Select MIN(Sal) From EMP)

-- Q8. List full details of departments that dont have employees?

Select DEPTNO,DNAME as DEPT_WITH_NO_EMPLOYEES, LOC
From DEPT
where DEPTNO NOT IN (Select DEPTNO From EMP)

-- Q9. Get the Names and salaries of all the analysts earning more than 1200 who are based in department 20. sort the order by ascending order of name?

Select ENAME, Sal as SALARY 
From EMP
Where sal > 1200 and DEPTNO = 20
order by ENAME ASC

-- Q10. For each Department. List its name and number together with the total salary paid to employees in the department?

Select DEPT.DNAME, DEPT.DEPTNO,EMP_TABLE_SAL.TOTAL_SAL
From DEPT,
	(select EMP.DEPTNO, Sum(EMP.Sal) as TOTAL_SAL 
		from EMP
		Group by EMP.DEPTNO
	) EMP_TABLE_SAL
where EMP_TABLE_SAL.DEPTNO = DEPT.DEPTNO

-- Q11. Find out salary of both Miller and Smith?

Select ENAME, Sal as SALARY 
From EMP
Where ENAME = 'MILLER' or ENAME = 'SMITH'

-- Q12. FInd out the names of the employees whose name begins with 'A' or 'M'?

Select ENAME AS NAME_STARTING_WITH_A_OR_M
From EMP
Where ENAME Like '[AM]%'

-- Q13. Compute yearly salary of SMITH ?

Select ENAME, Sal AS MONTHLY_SALARY, Sal * 12 as YEARLY_SALARY
From EMP
Where ENAME = 'SMITH'

-- Q14. List the name and salary for all employees whose salary is not in range of 1500 and 2850?

Select ENAME, Sal as SALARY 
From EMP
where Sal Not Between 1500 and 2850
