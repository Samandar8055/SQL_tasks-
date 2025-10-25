--Homework Lesson- 15

--Lesson -15 homework 

--Easy Task 
--Task 1
select *from employees

select *from employees 
where salary = (select min(salary) as minSalary from Employees)

--Task 2
select *from products 

select *from products 
where price > (select avg(price) from products)

--Task 3
--drop table employees 

select *from Departments
select *from Employees 

select name from Employees
where department_id = (select id from departments 
where department_name = 'Sales')

--task 4
select *from customers
select *from orders 

--select Name
--from Customers c
--where exists 
--(select 1
--from orders o
--where c.customer_id= o.customer_id)

select name 
from customers c
where not exists 
(select 1
from orders o
where o.customer_id = c.customer_id)

--task 5
select *from products 

select product_name 
from products p
where price = (select max(price) as MaxPrice 
from products
where p.category_id = category_id)

--Task 6 non
select *from  departments 
select *from Employees

SELECT department_name
FROM departments
WHERE id = (
    SELECT department_id
    FROM employees
    GROUP BY department_id
    ORDER BY AVG(salary) DESC
);


--Task 7 
select *from employees 

select *
from employees e
where salary > (select avg(Salary) as AVRsalary
from employees 
where e.department_id = department_id)

--task 8 
 
select *from students
select *from grades 

SELECT s.name, g.course_id, g.grade
FROM students s
JOIN grades g ON s.student_id = g.student_id
WHERE g.grade = (
    SELECT MAX(grade)
    FROM grades
    WHERE course_id = g.course_id
);

