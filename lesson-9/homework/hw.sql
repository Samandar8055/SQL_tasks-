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



