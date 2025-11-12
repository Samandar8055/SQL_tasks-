--Homework Lesson 22
--use Lesson22

--Task 1
select *from sales_data
 
select Customer_name, Total_amount, sum(Total_amount)over(partition by Customer_name order by Order_date  rows unbounded preceding) as running_totoal
from sales_data

--task 2
select *from sales_data

select Product_category, sum(Quantity_sold)over(partition by Product_category) as N_Orders
from sales_data

--Task 3
select *from sales_data

select Product_category, max(Total_amount)over(partition by Product_category)as Max_Amount
from sales_data

--task 4
select Product_category, min(Total_amount)over(partition by Product_category)as Min_Amount
from sales_data

--Task 5
select Customer_Name, Product_category, Total_amount,
avg(Total_amount)over(partition by Product_category order by Order_date  rows between 1 preceding and 1 following) as Moving_avg
from sales_data

--Task 6
select *from sales_data

select region, Total_amount, 
sum(Total_amount)over(partition by region) as Sum_region
from sales_data

--Task 7
select customer_Name,
sum(Total_amount)over(partition by Customer_name ) as Total_Amount_per_C,
dense_RANK()over( order by Customer_name  ) as ranked
from sales_data

--Task 8
select *from sales_data

select Customer_Name, 
lag(unit_price)over(order by Order_date) as previous_sale,
lead(unit_price)over(order by Order_date) as next_sale,
unit_price -
lead(unit_price)over(order by Order_date) as diff_sale
from sales_data

--Task 9
select  Product_Name,Product_category, Unit_price
from(

select Product_Name,Product_category, Unit_price,
dense_rank()over(partition by Product_category order by unit_price desc) as ranked
from sales_data) as t
where ranked <=3
order by product_category, unit_price desc;


--Task 10
select *from sales_data

select Region, Order_date, Total_amount, 
sum(Total_amount)over(partition by Region order by Order_date rows unbounded preceding) runnig_total
from sales_data

--MEDUM LEVEL QUESTIONS
--task 11
select *from sales_data

select Product_category, Total_amount, 
sum(Total_amount)over(partition by Product_category order by order_date rows unbounded preceding)as Running_total
from sales_data

--Task 12 
create table id_number (
id int);
insert into id_number values(1),(2),(3),(4),(5);

select*from id_number

select id, sum(id)over(order by id rows unbounded preceding) as SumPreValues
from id_number

--Task 13
select * from OneColumn 

--method 1
select Value, lag(Value)over(order by Value) + Value as Sum_Of_Previous
from OneColumn 

--method 2
SELECT 
    Value,
    Value + COALESCE(LAG(Value) OVER (ORDER BY Value), 0) AS Sum_Of_Previous
FROM OneColumn;

--Task 14
select *from sales_data

select Customer_name , Product_category ,N_Category
from(

select Customer_name , Product_category , 
count(Product_category)over(partition by Customer_name) as N_Category
from sales_data) as t
where N_Category >=2

--Task 15 non
select *from sales_data


select Customer_name, total_amount, avg(Total_amount)over(partition by Region) as AVG_region
from sales_data

--Task 16
select*from sales_data

select Customer_name, Total_amount, Region,
dense_rank()over(partition by Region order by Total_amount desc ) as ranked
from sales_data

--Task 17
select *from sales_data

select Customer_Name, Total_amount , Order_date,
sum(Total_amount)over(partition by Customer_Id order by Order_date rows unbounded preceding) Running_totoal
from sales_data

--Task 18 non
select Product_Category, Total_amount,
sum(Total_amount)over(partition by Product_category order by Order_date) as sum_total,
order_date
from sales_data

--Task 19
select *from sales_data

select Customer_name, lag(Total_amount)over(partition by Customer_id order by order_date) as prious_sale,
order_date
from sales_data
where total_amount > lag(Total_amount)over(partition by Customer_id order by order_date);

--Task 20
select Product_name,
unit_price,
avg_price
from(

select Product_name, unit_price,
avg(unit_price)over(partition by Product_category) as avg_price
from sales_data) as t
where unit_price > avg_price

--Task 21
select *from Mydata

SELECT
    Id,
    Grp,
    Val1,
    Val2,
    CASE 
        WHEN ROW_NUMBER() OVER (PARTITION BY Grp ORDER BY Id) = 1
        THEN SUM(Val1 + Val2) OVER (PARTITION BY Grp)
        ELSE NULL
    END AS Tot
FROM MyData
ORDER BY Id;

--method 2
select * ,
case
when row_number()over(partition by grp order by id)=1
then sum(Val1 + Val2) over(partition by grp)
else Null
end as total
from myData

--Task 22
select *from TheSumPuzzle

select ID, sum(Cost) as Cost, sum(Quantity) as Quantity
from theSumPuzzle
group by ID

--Task 23
select *from Seats 

WITH SeatGaps AS (
    SELECT
        SeatNumber,
        LAG(SeatNumber, 1, 0) OVER (ORDER BY SeatNumber) AS PrevSeat
    FROM Seats
)
SELECT
    PrevSeat + 1 AS GapStart,
    SeatNumber - 1 AS GapEnd
FROM SeatGaps
WHERE SeatNumber - PrevSeat > 1
ORDER BY GapStart;
