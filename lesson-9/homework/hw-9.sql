--homework 9
--easy tasks 

--Task 1
select * from Products 
select *from Suppliers

/*select p.ProductName, s.SupplierName
from Suppliers as s
inner join Products as p
on p.SupplierID = s.supplierID*/

select p.ProductName, s.SupplierName
from Products p
cross join Suppliers s

--Task 2
select * from Departments 
select *from Employees 

select d.DepartmentName, e.Name
from Departments d
cross join Employees e

--Task 3
select *from Products
select *from Suppliers

select s.SupplierName,p.ProductName
from Products as p
inner join Suppliers as s
on p.SupplierID = s.SupplierID

--Task 4
select * from Orders
select * from Customers 

select c.FirstName, o.OrderID
from Orders as o
inner join Customers as c
on o.CustomerID = c.CustomerID

--Task 5
select *from Courses 
select * from Students

select s.Name, c.CourseName
from Courses as c
cross join Students as s

--Task 6
select *from Orders
select *from Products

select p.ProductName, o.OrderID
from Products as p
inner join Orders as o
on p.ProductID = o.ProductID

--Task 7
select *from Departments 
select *from Employees

select e.Name, d.DepartmentName
from Departments as d
inner join Employees as e
on e.DepartmentID = d.DepartmentID 

--Task 8 
select *from Students
select *from Enrollments 

select s.Name, e.EnrollmentID
from Students as s
inner join Enrollments as e
on s.StudentID = e.StudentID

--Task 9 
select * from Payments 
select * from Orders 

select o.OrderID, p.PaymentMethod
from Orders as o
inner join Payments as p
on o.OrderID = p.OrderID

--Task 10
select *from Orders
select *from Products

select o.OrderID,p.ProductName, p.Price
from Orders as o
inner join Products as p
on o.ProductID = p.ProductID
where p.Price>100

--Medium(10 puzzels)
--Task 11
select *from Employees
select *from Departments 

select e.Name, d.DepartmentName
from Employees as e
inner join Departments as d
on e.DepartmentID != d.DepartmentID

--Task 12
select *from Orders
select *from Products

select p.ProductName, o.Quantity,p.StockQuantity
from Orders as o
inner join Products as p
on o.ProductID = p.ProductID
where o.Quantity > p.StockQuantity


--Task 13
select *from Customers
select *from Sales

select c.FirstName, s.ProductID
from Customers as c
inner join Sales as s
on c.CustomerID = s.CustomerID
where s.SaleAmount >500

--Task 14
select *from Courses
select *from Enrollments
select *from Students

select s.Name, c.CourseName, e.EnrollmentID
from Students as s
inner join Enrollments as e
on e.StudentID = s.StudentID
inner join Courses as c
on c.CourseID = e.CourseID

--Task 15
select *from Products
select *from Suppliers

select p.ProductName ,s.SupplierName
from Products as p
inner join Suppliers as s
on p.SupplierID = p.SupplierID
where s.SupplierName like 'Tech%'

--Task 16
select *from Orders
select *from Payments

select o.OrderID, p.PaymentMethod,p.Amount,o.TotalAmount
from Orders as o
inner join Payments as p
on o.OrderID = p.OrderID
where p.Amount < o.TotalAmount

--Task 17 
select *from Employees 
select * from Departments

select e.Name, d.DepartmentName
from Employees as e
inner join Departments as d
on e.DepartmentID = d.DepartmentID

--Task 18 
select *from Products
select *from Categories

select p.ProductName, c.CategoryName
from Products as p
inner join Categories as c
on p.Category = c.CategoryID
where c.CategoryName like 'Electronics' or c.CategoryName like  'Furniture'

--Task 19 
select *from Sales
select *from Customers

select s.SaleID, c.FirstName, c.Country 
from Sales as s
inner join Customers as c 
on s.CustomerID = c.CustomerID
where c.Country like 'USA'

--Task 20
select *from Orders
select *from Customers

select o.OrderID, c.FirstName, c.Country 
from Orders as o
inner join Customers as c
on o.CustomerID = c.CustomerID
where c.Country like 'Germany' and o.OrderID > 100

--Hard Level Task (5)
--Task 21
select *from Employees

SELECT e1.EmployeeID AS Emp1_ID, e1.Name AS Emp1_Name, e1.DepartmentID AS Emp1_Dept,
       e2.EmployeeID AS Emp2_ID, e2.Name AS Emp2_Name, e2.DepartmentID AS Emp2_Dept
FROM Employees e1
CROSS JOIN Employees e2
WHERE e1.EmployeeID < e2.EmployeeID
  AND e1.DepartmentID <> e2.DepartmentID;

--Task 22
select*from Payments
select* from Orders
select *from Products

select pro.ProductName,pa.PaymentMethod,pro.Price
from Payments as pa
inner join Orders as o
on pa.OrderID = o.OrderID
inner join Products as pro
on pro.ProductID = o.ProductID
where pa.Amount != o.Quantity *pro.Price



