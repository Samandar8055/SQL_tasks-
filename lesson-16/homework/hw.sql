--homework Lesson 16

--Easy Level Tasks
--Task 1
with recursive Numbers as (
select 1 as n
union all
select n+1
from Numbers 
where n < 1000
)
select n
from Numbers;

--Task 2
select *from Sales
select *from employees 


SELECT 
    e.EmployeeID,
    e.FirstName,
    e.LastName,
    s.TotalSales
FROM Employees e
JOIN (
    SELECT 
        EmployeeID,
        SUM(SalesAmount) AS TotalSales
    FROM Sales
    GROUP BY EmployeeID
) AS s
ON e.EmployeeID = s.EmployeeID;


--Task 3
select *from employees 

with avrage_Salary as (
select avg(salary) as avg_salary
from employees)
select avg_salary
from avrage_Salary

--Task 4
select *from Sales
select  *from Products 

SELECT 
    p.ProductID,
    p.ProductName,
    s.MaxSale
FROM Products AS p
JOIN (
    SELECT 
        ProductID,
        MAX(SalesAmount) AS MaxSale
    FROM Sales
    GROUP BY ProductID
) AS s
ON p.ProductID = s.ProductID;

--Task 5 

WITH MaxValue AS (
    SELECT 1 AS n      -- Start from 1
    UNION ALL
    SELECT n * 2       -- Double the number each step
    FROM MaxValue
    WHERE n * 2 < 1000000  -- Stop before 1,000,000
)
SELECT n
FROM MaxValue
OPTION (MAXRECURSION 0);  -- Allows more than 100 recursive steps


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


--Medium Tasks
--task 1
select *from employees 
select *from Sales

select top 5 e.EmployeeID, e.FirstName, s.N_Products
from Employees e
join (select EmployeeID,count(ProductID) as N_Products
from Sales 
group by EmployeeID ) as s
on e.EmployeeID= s.EmployeeID
order by N_Products desc

--Task 2
select *from Sales 
select *from Products 

SELECT 
    p.CategoryID,
    SUM(s.TotalAmount) AS TotalSalesPerCategory
FROM Products AS p
INNER JOIN (
    SELECT 
        ProductID,
        SUM(SalesAmount) AS TotalAmount
    FROM Sales
    GROUP BY ProductID
) AS s
ON p.ProductID = s.ProductID
GROUP BY p.CategoryID;

--Task 3
select *from Numbers1


with math as (
select 1 id , 1 fact
union all 
select id+1 , fact*(id+1)
from math 
where id <10)
select *from math 

--Task 4
select *from Sales
select *from Products

select p.ProductName, s.MaxSales
from Products p
inner join (select productID, max(SalesAmount) as MaxSales
from Sales
group by PRODUCTid) s
on s.ProductID = p.ProductID
order by s.MaxSales desc


--Task 5

Select *from sales

WITH MonthlySales AS (
    SELECT 
        YEAR(SaleDate) AS SaleYear,
        MONTH(SaleDate) AS SaleMonth,
        SUM(SalesAmount) AS TotalSales
    FROM Sales
    GROUP BY YEAR(SaleDate), MONTH(SaleDate)
)
SELECT 
    curr.SaleYear,
    curr.SaleMonth,
    curr.TotalSales AS CurrentMonthSales,
    prev.TotalSales AS PreviousMonthSales,
    (curr.TotalSales - prev.TotalSales) AS SalesDifference
FROM MonthlySales curr
LEFT JOIN MonthlySales prev
    ON curr.SaleYear = prev.SaleYear
   AND curr.SaleMonth = prev.SaleMonth + 1
ORDER BY curr.SaleYear, curr.SaleMonth;

--Task 6 
select *from sales 
select *from employees 

SELECT 
    e.EmployeeID,
    e.FirstName,
    e.LastName,
    qtr.TotalSales,
    qtr.Quarter
FROM Employees e
JOIN (
    SELECT 
        EmployeeID,
        CONCAT('Q', DATEPART(QUARTER, SaleDate)) AS Quarter,
        SUM(SalesAmount) AS TotalSales
    FROM Sales
    GROUP BY EmployeeID, DATEPART(QUARTER, SaleDate)
    HAVING SUM(SalesAmount) > 45000
) AS qtr
ON e.EmployeeID = qtr.EmployeeID
ORDER BY e.EmployeeID, qtr.Quarter;




