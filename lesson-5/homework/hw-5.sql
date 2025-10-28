--create database Lesson5

--Lesson 5 : Aliases, Unions, and Conditional columns
-- Easy _Level Tasks 

--Task 1 
select ProductName as Name
from Products 

--Task 2
select * from Customers
select CustomerID, FirstName, LastName, Email, Phone, Address, City, State, PostalCode, Country
from Customers as Client

--Task 3
select ProductName from Products
select ProductName from Products_Discounted

--Task 4
select ProductID, ProductName, Price, Category, StockQuantity from Products
intersect
select ProductID, ProductName, Price, Category, StockQuantity from Products_Discounted

--Task 5
select distinct FirstName, Country
from Customers 

--Task 6
select  *from Products

select Price,
  case
  when Price >1000 then 'Hight'
  when Price <=1000 then 'Low'
  end as Results 
from Products

--Task 7
--IFF

select StockQuantity,
  IIF (StockQuantity >1000 , 'yes','No') as  Products_Discounted
 from Products

-- Case 
select StockQuantity,
  case 
  when StockQuantity > 100 then 'Yes'
  else 'NO'
  end as Products_Discounted
  from Products

--Mediu-Level 
--Task 8
select ProductName from Products
union
select ProductName from Products_Discounted

--Task 9
select ProductID, ProductName, Price, Category, StockQuantity from Products
except
select ProductID, ProductName, Price, Category, StockQuantity from Products_Discounted

-- Task 10 
select * from Products

select Price,
iif (Price > 1000, 'Expensive','Affordable') as Result
from Products

--Task 11
select * from Employees 

select * from Employees
where Age >25 or Salary>60000;

--Task 12
update Employees
set Salary = salary * 1.1
where DepartmentName= 'HR' or EmployeeID = 5

--Hard-Level Task
--Task 13
select *from Sales

select SaleAmount, 
case 
when SaleAmount > 500 then 'Top Tier'
when SaleAmount between 200 and 500 then 'Mid Tier'
else 'Low Tier'
end as Result
from Sales

--Task 14
select *from Sales

select CustomerID from Sales
exept
select CustomerID from Sales

--Task 15
select * from Orders

select  CustomerID,Quantity, 
case 
 when Quantity = 1 then '3%'
 when Quantity between 1 and 3 then '5%'
 else '7%'
 end as Discount_Percentage
 from Orders
