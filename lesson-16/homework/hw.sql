--Lesson-16: CTEs and Derived Tables

--homework Lesson 16

--Easy Level Tasks
--Task 3
select *from employees 

with avrage_Salary as (
select avg(salary) as avg_salary
from employees)
select avg_salary
from avrage_Salary

--Task 6
select *from Sales
select *from Employees 

with Number_sales as (
select e.FirstName, count(s.SalesID) as N_Sales
from Sales s
inner join employees e on s.employeeID = e.EmployeeID
group by e.FirstName
)
select *
from Number_sales
where N_Sales > 5

--Task 7 
select *from Sales
select *from Products 

with Sales_products as (
select p.ProductName, s.SalesAmount 
from sales s 
left join products p on p.productID = s.productid
where s.SalesAmount >500)
select *
from Sales_products

--Task 8
select *from Employees 

with above_avrage as(
select avg(Salary) as avg_Salary
from employees
)
select FirstName, Salary
from employees 
where salary > (select avg_salary from above_avrage)
