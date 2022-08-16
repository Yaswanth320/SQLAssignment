Create Database FISDB2
Use FISDB2

-- Drop Database FISDB2

-- I have used Int and bigint in place of Number() with no of bytes in mind We can also use Numeric() but i thought int and bigint will be sufficient

Create Table Clients
(
	Client_ID int Primary Key,
	Cname varchar(40) Not Null,
	Address varchar(30),
	Email varchar(30) Unique,
	Phone bigint,
	Business varchar(20) Not Null
)

Create Table Departments
(
	Deptno int Primary Key,
	Dname varchar(15) Not Null,
	Loc varchar(20)
)


Create Table Employees
(
	Empno int Primary Key,
	Ename Varchar(20) Not Null,
	Job Varchar(15),
	Salary int Check(Salary > 0),
	Deptno int References Departments(Deptno)
)

Create Table Projects
(
	Project_ID int Primary Key,
	Descr varchar(30) Not Null,
	Start_date Date,
	Planned_End_date Date,
	Actual_End_date Date,
	Budget int check(Budget > 0),
	Client_ID int References CLients(Client_ID),
	Constraint Chk_Date Check(Actual_End_date > Planned_End_date)
)

Create Table EmpProjectTasks
(
	Project_ID int,
	Empno int,
	Start_date Date,
	End_date Date,
	Task Varchar(25) Not Null,
	Status Varchar(15) Not Null,
	Primary key(Project_ID, Empno),  -- Composite Primary Key
	Foreign Key(Project_ID) References Projects(Project_ID),
	Foreign Key(Empno) References Employees(Empno)
)

-- Inserting data into Tables

-- Clients
Insert into Clients 
Values	(1001, 'ACME Utilities', 'Noida', 'contact@acmeutil.com', 9567880032, 'Manufacturing'),
		(1002, 'Trackon Consultants', 'Mumbai', 'consult@trackon.com', 8734210090, 'Consultant'),
		(1003, 'MoneySaver Distributors', 'Kolkata', 'save@moneysaver.com', 7799886655, 'Reseller'),
		(1004, 'Lawful Corp', 'Chennai', 'justice@lawful.com', 9210342219, 'Professional')

-- Departments
Insert into Departments
Values	(10, 'Design', 'Pune'),
		(20, 'Development', 'Pune'),
		(30, 'Testing', 'Mumbai'),
		(40, 'Document', 'Mumbai')

-- Employees
Insert into Employees
Values	(7001, 'Sandeep', 'Analyst', 25000, 10),
		(7002, 'Rajesh', 'Designer', 30000, 10),
		(7003, 'Madhav', 'Developer', 40000, 20),
		(7004, 'Manoj', 'Developer', 40000, 20),
		(7005, 'Abhay', 'Designer', 35000, 10),
		(7006, 'Uma', 'Tester', 30000, 30),
		(7007, 'Gita', 'Tech. Writer', 30000, 40),
		(7008, 'Priya', 'Tester', 35000, 30),
		(7009, 'Nutan', 'Developer', 45000, 20),
		(7010, 'Smita', 'Analyst', 20000, 10),
		(7011, 'Anand', 'Project Mgr', 65000, 10)

-- Projects
-- Assuming date is in 2000's
Insert into Projects
Values	(401, 'Inventory','2011-04-01', '2011-10-01', '2011-10-31', 150000, 1001),
		(402, 'Accounting', '2011-08-01', '2012-01-01', Null,500000, 1002),
		(403, 'Payroll', '2011-10-01', '2011-12-31', Null, 75000,1003),
		(404, 'Contact Mgmt', '2011-11-01', '2011-12-31', Null, 50000, 1004)

--EmpProjectTasks
Insert into EmpProjectTasks
Values	(401, 7001, '2011-04-01', '2011-04-20', 'System Analysis', 'Completed'),
		(401, 7002, '2011-04-21', '2011-05-30', 'System Design', 'Completed'),
		(401, 7003, '2011-06-01', '2011-07-15', 'Coding', 'Completed' ),
		(401, 7004, '2011-07-18', '2011-09-01', 'Coding', 'Completed'),
		(401, 7006, '2011-09-03', '2011-09-15', 'Testing', 'Completed'),
		(401, 7009, '2011-09-18', '2011-10-05', 'Code Change', 'Completed'),
		(401, 7008, '2011-10-06', '2011-10-16', 'Testing', 'Completed'),
		(401, 7007, '2011-10-06', '2011-10-22', 'Documentation', 'Completed'),
		(401, 7011, '2011-10-22', '2011-10-31', 'Sign off', 'Completed'),
		(402, 7010, '2011-08-01', '2011-08-20', 'System Analysis', 'Completed'),
		(402, 7002, '2011-08-22', '2011-09-30', 'System Design', 'Completed'),
		(402, 7004, '2011-10-01', Null, 'Coding', 'In Progress')




-- Select Statements

Select * from Clients
Select * from Employees
Select * from Projects
Select * from Departments
Select * from EmpProjectTasks
