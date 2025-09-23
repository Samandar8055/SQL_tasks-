--Home work Lesson 4
--Filtering and ordering data
--Easy -Level Task(10)

--Task 1
select top 5*
from Employees 
order  by Salary desc;

select *from Employees

--Task 2
select distinct Category
from Products

select *from Products

--Task 3
select *from Products 
where Price>100

--Task 4
select *from Customers where FirstName like 'A%'

select *from Customers 

--Task 5
select *from Products order by Price asc;

select *from Products

--Task 6
select *from Employees 
where Salary >=60000
and DepartmentName='HR';

select *from Employees

--Task 7
select FullName,
 isnull(Emails 'noemail@example.com') as non_email
from Employees

--Task 8
select *from Employees
where Salary between 50 and 100;

select *from Employees

--Task 9
select distinct Category, ProductName
from Products 

select *from Products

--Task 10
select distinct Category, ProductName
from Products 
order by ProductName desc;

--Medium_level Task(10)
--Task 11
select top 10*
from Products
order by Price desc
