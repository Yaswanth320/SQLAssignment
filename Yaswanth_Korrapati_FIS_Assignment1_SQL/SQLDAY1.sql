create database FISDB
use FISDB

create table tblDepartment
(
 DeptId int primary key,
 DeptName varchar(20),
 DeptLocation varchar(30)
)

-- COLUMN LEVEL CONSTRAINTS
create table tblEmployee
(
Empid int primary key,
EmpName varchar(30),
Gender char(7) not null,
salary float,
Did int references tbldepartment(deptid),
)

-- TABLE LEVEL REFERENCE
create table tblTEST
(
Empid int,
EmpName varchar(30),
Gender char(7) not null,
salary float,
Did int,
city varchar(25) default 'Delhi',
PRIMARY KEY(Empid),
constraint fkdept foreign key(Did) references tblDepartment(deptid),
constraint salchk check(salary >= 10000)
)


sp_help tblemployee

insert into tblDepartment values(20, 'Sales', 'Mumbai'), (30, 'Accounts', 'Banglore'), (40, 'Admin', 'Chennai')

alter table tblEmployee
add Phone int not null

alter table tblEmployee
add constraint chksalary check(Salary >= 15000)

insert into tblEmployee(Empid, EmpName, Gender, Salary, DId, Phone)
values(9, 'ajay', 'Male', 16000, 30, 4567888)

Select * from tblDepartment
Select * from tblEmployee

alter table tblEmployee
add city varchar(20)

alter table tblEmployee
add constraint defcity default 'Delhi' for City

-- to remove a cloumn we need to remove the constraint on it first
alter table tbltest
Drop Constraint DF__tblTEST__city__32E0915F


-- drop column
alter table tbltest
drop column City

--enabling or disabilingcheck constraint
insert into tbltest values(21,'aaaa','m',60000,20,'lucknow')
alter table tbltest nocheck constraint salchk -- disabiling the constraint
alter table tbltest check constraint salchk -- enabiling constraint

-- update

select * from tblEmployee

update tblemployee
set city = 'hyderabad' where empid = 8

update tblemployee
set city = 'Mumbai', phone = 55555 where empid = 9


-- unique constraint
truncate table tbltest
delete from tbltest where empid  = 11

alter table tbltest add Email varchar(20) unique

select * from tbltest

select top 2 Empname from tblEmployee

select top 2 * from tblemployee

select top 2 percent * from tblemployee

