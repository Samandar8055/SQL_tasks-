--use Lesson18
--Lesson 18 Homer work 
--Easy Level Tasks
--- Task 1

select *from sales 
select *from Products 

create table #MonthlySales(
ProductName varchar(50),
Quantity int,
Total_rev decimal(10,2)
);


insert into #MonthlySales
select p.ProductName,s.Quantity, (s.Quantity * p.Price) as Total_rev
from Sales s
inner join Products p
on s.ProductID = p.ProductID
where s.SaleDate between '2025-10-01' and '2025-10-31'

select *from #MonthlySales

--Task 2
select *from sales 
select *from Products

select *from vw_ProductSalesSummary

create view vw_ProductSalesSummary as
select
   
    p.ProductName, 
    p.Category, 
    p.Price, 
    (s.Quantity * p.Price) as Total_rev
from Sales s
inner join Products p
    on p.ProductID = s.ProductID;


--Task 3
select *from Products 
select *from Sales 


create or alter function fn_GetTotalRevenueForProduct(@ProductId int)
returns decimal(10,2)
as 
begin 
    declare @TotalRevenue decimal(10,2);

    select 
        @TotalRevenue = sum(s.Quantity * p.Price)
    from Products p
    inner join Sales s
        on p.ProductID = s.ProductID
    where p.ProductID = @ProductId;

    return @TotalRevenue;
end;
go

-- Test the function
select dbo.fn_GetTotalRevenueForProduct(1) as totalrevenue;

--Task 4
select *from Products 
select *from Sales 

create or alter function fn_GetSalesByCategory(@Category varchar (50))
returns table
as 
return 
(
select p.ProductName, 
sum(s.Quantity) as TotalQuantity,
sum(s.Quantity * p.Price) as TotalRevenu
from Sales s
inner join Products p 
on P.ProductID = s.ProductID
where p.Category = @Category
group by p.ProductName
);
go

select *from dbo.fn_GetSalesByCategory('Electronics')
--use Lesson18
--Task 5
CREATE OR ALTER FUNCTION dbo.fn_IsPrime(@Number INT)
RETURNS VARCHAR(3)
AS
BEGIN
    DECLARE @i INT = 2;
    DECLARE @IsPrime BIT = 1;

    -- Handle edge cases
    IF @Number < 2
        SET @IsPrime = 0;
    ELSE
    BEGIN
        WHILE @i <= SQRT(@Number)
        BEGIN
            IF @Number % @i = 0
            BEGIN
                SET @IsPrime = 0;
                BREAK;
            END
            SET @i = @i + 1;
        END
    END

    RETURN CASE WHEN @IsPrime = 1 THEN 'Yes' ELSE 'No' END;
END;
GO

SELECT dbo.fn_IsPrime(7)  AS Result;  -- Output: Yes
SELECT dbo.fn_IsPrime(10) AS Result;  -- Output: No
SELECT dbo.fn_IsPrime(1)  AS Result;  -- Output: N0

--Task 6
CREATE OR ALTER FUNCTION fn_GetNumbersBetween(@Start INT, @End INT)
RETURNS @Numbers TABLE (Number INT)
AS
BEGIN
    DECLARE @Current INT = @Start;

    WHILE @Current <= @End
    BEGIN
        INSERT INTO @Numbers VALUES (@Current);
        SET @Current = @Current + 1;
    END

    RETURN;
END;
GO

SELECT * FROM dbo.fn_GetNumbersBetween(5, 10);

--Task 7
CREATE OR ALTER FUNCTION fn_GetNthHighestSalary(@N INT)
RETURNS INT
AS
BEGIN
    DECLARE @Result INT;

    SELECT @Result = MIN(salary)
    FROM (
        SELECT DISTINCT salary
        FROM Employee
        ORDER BY salary DESC
        OFFSET (@N - 1) ROWS
        FETCH NEXT 1 ROWS ONLY
    ) AS NthSalary;

    RETURN @Result;
END;
GO


SELECT dbo.fn_GetNthHighestSalary(2) AS HighestNSalary;
SELECT dbo.fn_GetNthHighestSalary(2) AS HighestNSalary;













