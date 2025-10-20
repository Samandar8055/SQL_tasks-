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

--lesson 14
--medium level task s
--task 1

select *from weather 


--Task 2
select *from Activity

select player_id, min(event_date) as First_date
from Activity
group by player_id

--task 3
select *from fruits 

select fruit_list,
substring (fruit_list, 14, 6)
from fruits

--task 4
select *from Employees

SELECT 
    FIRST_NAME,
    DATEDIFF(YEAR, HIRE_DATE, GETDATE()) AS YEARS,
    CASE
        WHEN DATEDIFF(YEAR, HIRE_DATE, GETDATE()) < 1 THEN 'New hire'
        WHEN DATEDIFF(YEAR, HIRE_DATE, GETDATE()) BETWEEN 1 AND 5 THEN 'Junior'
        WHEN DATEDIFF(YEAR, HIRE_DATE, GETDATE()) BETWEEN 5 AND 10 THEN 'Mid_level'
        WHEN DATEDIFF(YEAR, HIRE_DATE, GETDATE()) BETWEEN 10 AND 20 THEN 'Senior'
        WHEN DATEDIFF(YEAR, HIRE_DATE, GETDATE()) > 20 THEN 'Veteran'
        ELSE 'Unknown'
    END AS Status_emp
FROM Employees;

--Task 5
select *from Getlntegers 









