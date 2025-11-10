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

