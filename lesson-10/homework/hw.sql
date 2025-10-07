--lesson 10 homework
--Homerwork

--task 1
select *from Employees 
select *from Departments 

select e.Name,e.Salary,d.DepartmentName
from Employees as e
left join Departments as d
on e.DepartmentID = d.DepartmentID
where e.Salary > 50000

--Task 2
select *from Customers
select * from Orders

select c.FirstName, c.LastName,o.OrderDate
from Customers as c
left join Orders as o
on c.CustomerID = o.CustomerID
where o.OrderDate like '2023%'

--Task 3
select *from Employees
select *from Departments

select e.Name, d.DepartmentName
from Employees as e
full outer join Departments as d
on e.DepartmentID = d.DepartmentID

--Task 4
select *from Products
select *from Suppliers

select s.SupplierName, p.ProductName
from Suppliers as s
full outer join  Products as p
on s.SupplierID = p.SupplierID

--Task 5
select *from Orders
select *from Payments

select o.OrderID, o.OrderDate, p.PaymentDate, p.Amount
from Orders as o
full outer join Payments as p
on o.OrderID = p.OrderID

--Task 6 
select *from Employees

select e.Name as EmployeeName, m.Name as ManagerName
from Employees as e
left join Employees as m
--on e.EmployeeID = m.ManagerID
on m.EmployeeID = e.ManagerID

--Task 7
select *from Students
select *from Courses
select *from Enrollments

select s.Name, c.CourseName
from Students as s
inner join Enrollments as e
on s.StudentID = e.StudentID
inner join Courses as c
on c.CourseID = e.CourseID
where c.CourseName like 'Math 101'


--task 8 
select *from Customers
select *from Orders

select c.FirstName, c.LastName, o.Quantity
from Customers as c
left join Orders as o
on c.CustomerID = o.CustomerID
where o.Quantity > 3

--Task 9 
select *from  Employees
select *from Departments

select e.Name, d.DepartmentName
from Employees as e
join Departments as d
on e.DepartmentID = d.DepartmentID
where d.DepartmentName like 'Human%'

--Medium_level tasks(9)
--task 10
select *from Employees
select *from Departments

select d.DepartmentName, count(e.Name) as EmployeeCount
from Departments as d
left join Employees as e
on d.DepartmentID = e.DepartmentID
group by d.DepartmentName
having count(e.Name) >5


--Task 11
select *from Products
select *from Sales

select s.ProductID, p.ProductName
from Products as p
full outer join Sales as s
on s.ProductID = p.ProductID
where s.ProductID is null

--Task 12
select *from Customers
select *from Orders

select c.FirstName, c.LastName, o.Quantity as TotalOrders
from Customers as c
left join Orders as o
on c.CustomerID = o.CustomerID
where o.Quantity >=1

--Task 13
select *from Employees
select *from Departments

select e.Name, d.DepartmentName
from Employees as e
right join  Departments as d
on e.DepartmentID = d.DepartmentID

--Task 14------?
select *from Employees

select e.Name as Employee1,m.Name as Employee2,m.ManagerID
from Employees as e
inner join Employees as m
on e.ManagerID = m.EmployeeID

--Task 15
select *from Orders 
select*from Customers

select o.OrderID, o.OrderDate, c.FirstName,c.LastName
from Orders as o
full outer join Customers as c
on o.CustomerID = c.CustomerID
where o.OrderDate like '2022%'

--Task 16
select*from Employees
select *from Departments

select e.Name, e.Salary, d.DepartmentName
from Employees as e
left join Departments as d
on e.DepartmentID = d.DepartmentID
where d.DepartmentName like 'Sales' and e.Salary >= 60000

--Task 17
select *from Orders
select *from Payments

select o.OrderID, o.OrderDate, p.PaymentDate, p.Amount
from Orders as o
right join Payments as p
on o.OrderID = p.OrderID 

--Task 18 ------?
select *from Products
select *from Orders

select p.ProductID,p.ProductName
from Products as p
join Orders as o
on p.ProductID = o.ProductID 

--Hard-Level_tasks
--Task 19
select *from Employees

/*select e.Name, e.Salary, s.DepartmentID
from Employees as e
left join Employees as s
on e.EmployeeID = s.EmployeeID
group by e.DepartmentID
having avg(e.Salary) > s.Salary*/

SELECT e.Name AS EmployeeName,e.Salary
FROM Employees e
WHERE e.Salary > (
    SELECT AVG(e2.Salary)
    FROM Employees e2
    WHERE e2.DepartmentID = e.DepartmentID
);

--Task 20
select *from Orders
select *from Payments

/*select p.OrderID, o.OrderDate
from Orders as o
full outer join Payments as p
on p.OrderID = o.OrderID
where o.OrderDate < '2020-01-01' and p.OrderID is null*/


SELECT 
    o.OrderID,
    o.OrderDate
FROM Orders AS o
LEFT JOIN Payments AS p
    ON o.OrderID = p.OrderID
WHERE 
    o.OrderDate < '2020-01-01'
    AND p.OrderID IS NULL;


--Task 21 
select *from Products
select *from Categories

select p.ProductID,p.ProductName
from Products as p
left join Categories as c
on p.Category = c.CategoryID
where c.CategoryName is null

--Task 22
select *from Employees

select e1.Name as Employee1, e2.Name as Employee2, e1.ManagerID, e1.Salary
from Employees as e1
left join Employees as e2
on 
where e1.Salary >60000











