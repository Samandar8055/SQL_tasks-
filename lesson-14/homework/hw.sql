--Lesson 14 

-- Date and time functions, practice
--Easy tasks

--Task 1

select *from TestMultipleColumns

SELECT 
    id,
    LEFT(Name, CHARINDEX(',', Name) - 1) AS FirstName,
    LTRIM(RIGHT(Name, LEN(Name) - CHARINDEX(',', Name))) AS LastName
FROM TestMultipleColumns;

--Task 2 
select *from TestPercent

select *
from TestPercent
where Strs like '%[%]%'

--Task 3 non 
select *from Splitter 

--Task 4
select *from testDots

select Vals,
len(Vals) - len(replace(Vals, '.','')) as N_dots
from testDots
where len(Vals) - len(replace(Vals, '.','')) > 2

--Task 5 
select *from CountSpaces 

select texts,
len(texts) - len(replace(texts, ' ', '')) as N_spaces
from CountSpaces  

--task 6 
select *from Employees 

select e.first_name, e.employee_id, m.manager_id, e.salary as Employee_salary, m.salary as Manager_salary
from Employees e
inner join Employees m
on e.manager_id = m.employee_id
where m.salary < e.salary


--Task 7 
select *from Employees

select FIRST_NAME, LAST_NAME, HIRE_DATE, datediff (year,HIRE_DATE, getdate()) as diffyear
from Employees
where datediff (year,HIRE_DATE, getdate())  between 10 and 15

--medium Task 
--task  1
select *from weather 

select 




