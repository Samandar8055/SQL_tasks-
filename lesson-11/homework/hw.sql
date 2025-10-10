--Homework Lesson 11
--Lesson 11

--Task 1
select *from Orders
select *from Customers

select o.OrderID, c.FirstName, o.OrderDate
from Orders as o
inner join Customers as c on o.CustomerID = c.CustomerID
where o.OrderDate >'2022-01-01'

--Task 2
select *from Employees
select *from Departments

select e.Name, d.DepartmentName
from Employees e
inner join Departments d
on d.DepartmentID= e.DepartmentID
where d.DepartmentName = 'Sales' or
d.DepartmentName = 'Marketing' 



--Task 3
select *from Employees
select *from Departments

select d.DepartmentName, max(e.Salary) as MaxSalary
from Employees e
left join Departments d
on e.DepartmentID = d.DepartmentID
group by d.DepartmentName

--Task 4
select *from Customers 
select *from Orders

select c.FirstName, o.OrderID, o.OrderDate
from Customers c
join Orders o
on c.CustomerID = o.CustomerID
where c.Country = 'USA' and 
o.OrderDate between '2023-01-01' and '2023-12-31'

--Task 5
select *from Orders
select *from Customers

select c.FirstName, count(o.OrderID) as TotalOrders
from Orders o 
left join Customers c
on o.CustomerID = c.CustomerID
group by c.FirstName

--Task 6
select *from Products
select *from Suppliers

select p.ProductName, s.SupplierName
from Products  p
inner join Suppliers s
on p.SupplierID = s.SupplierID
where s.SupplierName = 'Gadget Supplies' or
s.SupplierName = 'Clothing Mart'

--Task 7
select *from Customers
select *from Orders

select c.FirstName, o.OrderDate
from Customers c
full outer join Orders o
on c.CustomerID = o.CustomerID
where o.OrderID is null 
order by o.OrderDate desc

--Medium Level
--Task 8
select *from Orders
select *from Customers

select c.FirstName, o.TotalAmount
from Orders o 
inner join Customers c
on o.CustomerID = c.CustomerID
where o.TotalAmount >500

--Task 9
select *from Products
select *from Sales

select p.ProductName,s.SaleDate,s.SaleAmount
from Products p
full outer join Sales s
on p.ProductID = s.ProductID
where s.SaleDate between '2022-01-01' and '2022-12-31'
or s.SaleAmount >400

--Task 10
select *from Sales
select *from Products

select p.ProductName, sum(s.SaleAmount) as TotalSaleAmount 
from Sales s
left join Products p
on s.ProductID =p.ProductID
group by p.ProductName

--Task 11
select *from Employees
select *from Departments

select e.Name, d.DepartmentName, e.Salary
from Employees e
left join Departments d
on e.DepartmentID = d.DepartmentID
where d.DepartmentName = 'Human Resources' and
e.Salary > 60000

--Task 12
select *from Products
select *from Sales

select p.ProductName, s.SaleDate, p.StockQuantity
from Products p
left join Sales s
on p.ProductID = s.ProductID
where s.SaleDate between '2023-01-01' and '2023-12-31'
and p.StockQuantity >100

--Task 13
select *from Employees
select *from Departments

select e.Name,d.departmentName, e.HireDate
from Employees e
left join Departments d
on e.DepartmentID = d.DepartmentID
where d.DepartmentName like 'Sales' or
e.HireDate > '2020-01-01'

--Hard Level task
--Task 14
select *from Customers
select *from Orders

select c.FirstName, o.OrderID, c.Address, o.OrderDate
from Customers c
join Orders o
on c.CustomerID= o.CustomerID
where c.Country like 'USA' and
c.Address like '[0-9][0-9][0-9][0-9]%'

--Task 15
select *from Products
select *from Sales
select *from Categories

select p.ProductName, p.Category, s.SaleAmount
from Products p
left join Sales s
on p.ProductID =s.ProductID
inner join Categories c
on c.CategoryID = s.CustomerID
where s.SaleAmount >350 or
c.CategoryName = 'Electronics'

--Task 16
select *from Products
select *from Categories

select c.CategoryName, p.StockQuantity as ProductCount
from Products p
inner join Categories c
on p.Category = c.CategoryID

--Task 17
select *from Customers
select *from Orders

select c.FirstName, c.City, o.OrderID, o.TotalAmount
from Customers c
inner join Orders as o
on c.CustomerID = o.CustomerID
where c.City = 'Los Angeles' and
o.TotalAmount > 300

--Task 18
select 



