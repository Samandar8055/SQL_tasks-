--homer worl lesson 21
--use Lesson21
--window functions

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

from ProductSales

