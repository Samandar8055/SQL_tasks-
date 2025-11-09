--homer worl lesson 21
--use Lesson21

--Task 1
select *from productSales

select ProductName, SaleDate,
row_number()over(partition by ProductName order by SaleDate) as row_number_by_product
from productSales

--Task 2
select *from ProductSales

SELECT 
    ProductName,
    TotalQuantity,
    DENSE_RANK() OVER (ORDER BY TotalQuantity DESC) AS RankByQuantity
FROM (
    SELECT 
        ProductName,
        SUM(Quantity) AS TotalQuantity
    FROM ProductSales
    GROUP BY ProductName
) AS TotalSales;

--Task 3
select *from ProductSales

select ProductName, max(SaleAmount) over (partition by ProductName) as Max_Amount
from productSales

--Task 4
select saleDate,SaleAmount, lead(SaleAmount)over(order by Saledate) as next_amounts
from ProductSales

--Task 5
select Saledate, SaleAmount, lag(SaleAmount)over(order by SaleDate) as priouse_amunts
from ProductSales

--Task 6 
select *from ProductSales

SELECT *
FROM (
    SELECT 
        SaleID,
        ProductName,
        SaleDate,
        SaleAmount,
        LAG(SaleAmount) OVER (ORDER BY SaleDate) AS PrevSaleAmount
    FROM ProductSales
) AS t
WHERE SaleAmount > PrevSaleAmount;

--Task 7 
select ProductName, SaleAmount,
saleAmount -
lag(SaleAmount)over(order by Saledate) as diff
from ProductSales

--Task 8 
select *from ProductSales

SELECT 
    SaleID,
    ProductName,
    SaleDate,
    SaleAmount,
    LEAD(SaleAmount) OVER (ORDER BY SaleDate) AS NextSaleAmount,
    ROUND(
        ((LEAD(SaleAmount) OVER (ORDER BY SaleDate) - SaleAmount) / SaleAmount) * 100, 
        2
    ) AS PercentageChange
FROM ProductSales;

--Task 9 
select *from ProductSales

select ProductName, SaleAmount,
(SaleAmount / (lag(SaleAmount)over(order by SaleDate))) as Ratio
from ProductSales

--Task 10
select ProductName, SaleAmount, SaleDate,
FIRST_VALUE(SaleAmount)over(partition by ProductName order by SaleDate) as FirstSale,
(SaleAmount - FIRST_VALUE(SaleAmount)over(partition by ProductName order by SaleDate))as diff
from ProductSales

--Task 11
select 
ProductName, SaleAmount,PriousSale
from(
select ProductName, SaleAmount, SaleDate,
lag(SaleAmount)over(partition by ProductName order by SaleDate) as PriousSale
from ProductSales
) as t
where SaleAmount> PriousSale

--Task 12
select ProductName,
saleDate,
SaleAmount,
sum(SaleAmount)over(partition by ProductName order by SaleDate) as closingBalance
from ProductSales
order by productName, SaleDate

--Task 13
select *from ProductSales

select ProductName,
saleDate,
SaleAmount,
round(avg(SaleAmount)over(partition by ProductName order by Saledate rows between 2 preceding and current row),2)
as movingAVGLastthree
from ProductSales
order by ProductName, SaleDate

--Task 14
select ProductName,SaleAmount, avg(SaleAmount)over(Partition by ProductName) as avg_sale,
SaleAmount -  avg(SaleAmount)over(Partition by ProductName) as diff
from ProductSales

--Task 15 Employees1 table n0n
select *from Employees1

SELECT 
    EmployeeID,
    Name,
    Department,
    Salary
FROM Employees1
WHERE Salary IN (
    SELECT Salary
    FROM Employees1
    GROUP BY Salary
    HAVING COUNT(*) > 1
)
ORDER BY Salary DESC;

--Task 16
select Name, 
Department ,
Salary
from(
select
Name, 
Department ,
Salary,
dense_rank()over(partition by department order by Salary desc) as rank_salary
from Employees1) as rank
where rank_salary <=2

--Task 17
select *from Employees1

select Name, 
department,
Salary
from(

select Name, 
department,
Salary,
dense_rank()over(partition by DEpartment order by Salary) as rankSalary
from Employees1
) as ranked
where rankSalary <=1

--Task 18
select *from Employees1

select Name, Department,Salary, sum(salary)over(partition by Department order by Hiredate rows unbounded preceding) as running_total
from Employees1
order by Department, HireDate

--Task 19
select Name, Department,Salary,sum(Salary)over(partition by Department) as total_salary
from Employees1

--Task 20
select Name, Department,Salary,avg(Salary)over(partition by Department) as avg_salary
from Employees1

--Task 21
select Name, Department,Salary, 
Salary - avg(Salary)over(partition by department) as diff
from Employees1

--Task 22

select Name, Department, Salary,Hiredate,
avg(Salary)over(order by HireDate rows between 1 preceding and 1 following) as MovingAvg
from Employees1
order by HireDate

--Task 23
select Name, Department,Salary,
sum(Salary)over () as SumTop3
from
(select Name, Department,Salary,Hiredate,
DENSE_RANK()over (order by Hiredate desc) as ranked
from Employees1) as ranked_table
where ranked between 1 and 3;

