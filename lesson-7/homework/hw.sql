--Homework Lesson 7
--Topic
--Aggregate Functions (MIN, MAX, COUNT, AVG, SUM)
--Filtering Aggregated Data with HAVING

--Easy-Level Tasks (10)

--Homework lesson 7 

--task 1
select *from Products 

select ProductName, min(Price) as min_price 
from Products 
group by ProductName

--Task 2
select *from Employees

select FirstName, max(Salary) as Max_Salary
from Employees
group  by FirstName

--Task 3 
select *from Customers 

select count(Firstname) as Row_number 
from Customers

--Task 4
select *from Products 

select count(distinct Category) as number_of_Category
from Products 

--Task 5
select *from Sales

select sum(SaleAmount) 
from Sales
where SaleID = 7;

-- Task 6
select * from Employees

select avg(Age) as AvgAge_Employees 
from Employees

--Task 7
select *from Employees

select DepartmentName, count(DepartmentName) as N_Employees
from Employees
group by DepartmentName

--Task 8
select *from Products

select Category,  min(Price) as min_price, max(Price) as max_price
from Products
group by Category

--Task 9
select *from Sales

select CustomerID, sum(SaleAmount) as Sum_amount
from Sales
group by CustomerID

--Task 10
select *from Employees

select DepartmentName, Count(*) as N_Employees
from Employees
group by DepartmentName
having Count(*)>5;

--Medium_Level Task(9)
--Task 11
--no database

--Task 12
select *from Employees

--Task 13
select *from Employees

select DepartmentName, min(Salary) as Low_salary, max(Salary) as heightest_salary
from Employees
group by DepartmentName;

--Task 14
select DepartmentName, avg(Salary) as avgsalary
from Employees
group by DepartmentName

--Task 15
select *from Employees

select DepartmentName, avg(Salary) as avgsalary, count(*) as N_Employees
from Employees
group by DepartmentName

--Task 16
select *from Products

select Category, avg(Price) as avgprice
from Products
group by Category;

--Task 17
select *from Sales

select SaleDate, sum(SaleAmount) as Sum_Year
from Sales
group by SaleDate

--Task 18
select customerID, count(*) as N_Sale
from Sales
group by CustomerID
having count(*)> 3

--Task 19
select *from Employees

select DepartmentName, avg(Salary) as AvgSalary
from Employees
group by DepartmentName
having avg(Salary) > 60000

--Hard_Level Task(6)
--Task 20
select *from Products

select Category, avg(Price) as AvgPrice
from Products
group by Category
having avg(Price) >150

--Task 21
select *from Sales

select CustomerID, sum(SaleAmount) as Sum_Amount
from Sales
group by CustomerID
having sum(SaleAmount) > 1500;

--Task 22
select *from Employees

select DepartmentName, sum(Salary) as Total_Salary, avg(Salary) as Avg_Salary 
from Employees
group by  DepartmentName
having avg(Salary) > 65000;

--Task 23
