Create Database FISDB3

Use FISDB3

-- Create a book table with id as primary key and provide the appropriate data type to other attributes. 
-- Isbn number should be unique for each book 
Create Table books
(
	id int Primary Key,
	title Varchar(40),
	author Varchar(30),
	isbn Bigint Unique,
	published_date smalldatetime
)

Insert into books
Values	(1, 'My First SQL book', 'Mary Parker', 981483029127, '2012-02-22 12:08:17'),
		(2, 'My Second SQL book', 'John Mayer', 857300923713, '1972-07-03 09:22:45'),
		(3, 'My Third SQL book', 'Cary Flint', 523120967812, '2015-10-18 14:05:44')

Select * from books

-- Reviews

Create Table Reviews
(
	id int Primary Key,
	book_id int References books(id),
	reviewer_name varchar(30),
	content varchar(40),
	rating int,
	published_date smalldatetime
)

insert into reviews
Values	(1, 1, 'John Smith', 'My First Review', 4, '2017-12-10 05:50:11'),
		(2, 2, 'John Smith', 'My Second Review', 5, '2017-10-13 15:05:12'),
		(3, 2, 'Alice Walker', 'Another Review', 1, '2017-10-22 23:47:10')

Select * from reviews

-- Q1. Write a query to fetch the details of the books written by author whose name ends with er.

Select * 
From books
where author like '%er'

-- Q2. Display the Title, Author and ReviewerName for all the books from the above Table

Select b.title, b.author, r.reviewer_name
From books b
left join reviews r
on b.id = r.book_id

-- Q3. Display the reviewer name who reviewed more than one book

Select reviewer_name, count(book_id) as 'No of Books Reviewed' 
From reviews r 
Group by reviewer_name
having count(book_id) > 1

---------------- New Table --------------------

-- Customer Table

Create Table Customers
(
	ID int Primary Key,
	NAME varchar(20),
	AGE int,
	ADDRESS varchar(30),
	SALARY Decimal(7,2)
)

Insert Into Customers
Values	(1, 'Ramesh', 32, 'Ahmedabad', 2000.00),
		(2, 'Khilan', 25, 'Delhi', 1500.00),
		(3, 'Kaushik', 23, 'Kota', 2000.00),
		(4, 'Chaitali', 25, 'Mumbai', 6500.00),
		(5, 'Hardhik', 27, 'Bhopal', 8500.00),
		(6, 'Komal', 22, 'MP', 4500.00),
		(7, 'Muffy', 24, 'Indore', 10000.00)

Select * from Customers

-- Q4. Display the name for the customer from above customer table who live in same address 
--     which has character 'o' anywhere in address

Select Name as Customer_name, ADDRESS AS Address
From Customers
Where ADDRESS Like '%o%'

-------------- New Table ----------------------

-- Orders Table

Create Table Orders
(
	OID int Primary Key,
	DATE SmallDateTIme,
	CUSTOMER_ID Int references Customers(ID),
	AMOUNT decimal(7,0)
)

Insert Into Orders 
Values	(102, '2009-10-08 00:00:00', 3, 3000),
		(100, '2009-10-08 00:00:00', 3, 1500),
		(101, '2009-11-20 00:00:00', 2, 1560),
		(103, '2008-05-20 00:00:00', 4, 2060)

Select * from orders

-- Q5. Write a query to display the Date, Total no of Customer who placed order on same date.

Select DATE, count(*) as 'TOTAL NO OF CUSTOMERS'
From orders 
Group By DATE

-- Q6. Display the Names of the Employee in Lower Case, whose Salary is Null

----- creating the Employee tabel ( it is the same as the employee table )

Create Table Employee
(
	ID int Primary Key,
	NAME varchar(20),
	AGE int,
	ADDRESS varchar(30),
	SALARY Decimal(7,2)
)

Insert Into Employee
Values	(1, 'Ramesh', 32, 'Ahmedabad', 2000.00),
		(2, 'Khilan', 25, 'Delhi', 1500.00),
		(3, 'Kaushik', 23, 'Kota', 2000.00),
		(4, 'Chaitali', 25, 'Mumbai', 6500.00),
		(5, 'Hardhik', 27, 'Bhopal', 8500.00),
		(6, 'Komal', 22, 'MP', null),
		(7, 'Muffy', 24, 'Indore', null)

Select * from Employee

Select Lower(Name) as NAME, SALARY
From Employee
where SALARY is Null

-- Q7. Write a Sql Server Query to display the Gender, Total no of male and female form the above relation

Create Table Studentdetails
(
	Registerno int Primary Key,
	Name varchar(20),
	Age int,
	Qulaification Varchar(10),
	Mobileno bigint,
	Mail_id varchar(40),
	Location varchar(20),
	Gender char
)

Insert into Studentdetails
Values	(2, 'Sai', 22, 'B.E', 9952836777, 'Sai@gmail.com', 'Chennai', 'M'),
		(3, 'Kumar', 20, 'BSC', 7890125648, 'Kumar@gmail.com', 'Madurai', 'M'),
		(4, 'Selvi', 22, 'B.Tech', 8904567342, 'selvi@gmail.com', 'Selam','F'),
		(5, 'Nisha', 25, 'M.E', 7834672310, 'Nisha@gmail.com', 'Theni', 'F'),
		(6, 'SaiSaran', 21, 'B.A', 7890345678, 'saran@gmail.com', 'Madurai', 'F'),
		(7, 'Tom', 23, 'BCA', 8901234675, 'Tom@gmail.com', 'Pune', 'M')

Select * from Studentdetails

-- query

Select coalesce(Gender, 'Total male and Female') as Gender, Count(Name) AS NoofStudents
From Studentdetails
Group by  RollUP (Gender)

-- Q8. Retrieve the COurseName and the number of students registered for each course between 2018-01-02
--     and 2018-02-28 and arrange the result by courseid in descending order.

Create Table Coursedetails
(
	C_id varchar(10) Primary Key,
	C_Name varchar(20),
	Start_date Date,
	End_date date,
	Fee bigint
)

Insert into Coursedetails
Values	('DN003', 'DotNet', '2018-02-01', '2018-02-28', 15000),
		('DV004', 'Data Visualization', '2018-03-01', '2018-04-15', 15000),
		('JA002', 'AdvancedJava', '2018-01-02',	'2018-01-20', 10000),
		('JC001', 'CoreJava', '2018-01-02', '2018-01-12', 3000)

Select * from Coursedetails

Create Table CourseRegistration
(
	RegisterNo int References Studentdetails(RegisterNo),
	C_id Varchar(10) References Coursedetails(C_id),
	Batch char(2)
)

Insert Into CourseRegistration
Values	(2, 'DN003', 'FN'),
		(3, 'DV004', 'AN'),
		(4, 'JA002', 'FN'),
		(2, 'JA002', 'AN'),
		(5, 'JC001', 'FN')

Select * from CourseRegistration

-- Query

-- I have taken Start date for the time period of Stu Registration cause there is no registration date available
-- So i have retreived the coursedetails, that start between 2018-01-02 and 2018-02-28 

Select d.C_Name,d.C_id, Count(r.RegisterNo) as 'No of students registered'
From Coursedetails d
join CourseRegistration r
on d.C_id = r.C_id
where d.Start_date between '2018-01-02' AND '2018-02-28' 
Group by d.C_id, d.C_Name								
Order by d.C_id Desc	

-- Q9. Display the FirstName and lastName of the customers who have placed exactly 2 orders.

Create table Customer
(
	customer_id int Primary Key,
	first_name varchar(20),
	last_name varchar(20)
)

Insert into Customer
Values	(1, 'George', 'Washington'),
		(2, 'John', 'Adams'),
		(3, 'Thomas', 'Jefferson'),
		(4, 'James' , 'Madison'),
		(5, 'James' , 'Monroe')

Select * From Customer

Create Table Order_tbl
(
	order_id int Primary Key,
	order_date date,
	amount Decimal(5,2),
	customer_id int -- references Customer(Customer_id) -- Cannot add reff cause CUST_ID 10 and 9 arent part of Customer table
)

insert into Order_tbl
Values	(1, '1776-07-04', 234.56, 1),
		(2, '1760-03-14', 78.50, 3),
		(3, '1784-05-23', 124.00, 2),
		(4, '1790-09-03', 65.50, 3),
		(5, '1795-07-21', 25.50, 10),
		(6, '1787-11-27', 14.40, 9)

Select * from Order_tbl

-- Query

Select c.first_name, c.last_name
From Customer c
Join Order_tbl o
on c.customer_id = o.customer_id
Group by c.first_name, c.last_name
having count(o.order_id) = 2

-- Q10. Display all the student name in reverse order and Capitalize all the characterd in Location

---- Table Before query application

Select * From Studentdetails

----- Query

Select REVERSE(Name) as Name_in_Reverse_order, Upper(Location) as UpperCase_Location
From Studentdetails

-- if the question meant desc order (reverse order) of name

Select Name,  Upper(Location) as UpperCase_Location
From Studentdetails
order by Name desc

-- Q11. Create a View Table to display the ProductName, ordered Quantity and OrderNumber
--      From the above relations

Create Table Order_11
(
	id int primary Key,
	orderdate date,
	ordernumber int,
	customerID int,
	totalamount bigint
)

Create Table OrderItem
(
	id int Primary Key,
	Orderid int References Order_11(id),
	ProductID int References Product(id),
	UnitPrice int,
	Quantity int
)

Create Table Product
(
	id int Primary Key,
	ProductName varchar(20),
	SupplierId bigint,
	Unitprice int not null,
	Package int,
	IsDiscontinued varchar(10)
)

Select * From Order_11
Select * From OrderItem
Select * From Product

-- Query

CREATE VIEW vwOrderdetails
AS
Select P.ProductName, Oi.Quantity, o.ordernumber
From OrderItem Oi
Join Product P
ON Oi.ProductID = P.id
Join Order_11 o
ON Oi.Orderid = o.id

Select * from vwOrderdetails

-- Q12. Display the Course Name Registered by student Nisha

Select * from Studentdetails

Select sd.Name, cd.C_name as Course_Name 
From CourseRegistration cr
join Studentdetails sd
on cr.RegisterNo = sd.Registerno
join Coursedetails cd
on cr.C_id = cd.C_id
where sd.Name like 'Nisha' 