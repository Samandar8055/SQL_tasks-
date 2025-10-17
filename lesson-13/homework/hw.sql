
--Leson 13

--Easy Tasks 
--Task 1

select *from Employees

select CONCAT(Employee_ID,'-', first_name,'-', Last_name)
from Employees

--Task 2
select *from Employees

select phone_number,replace(phone_number, '124', '999') as NewPhone_Number
from Employees
where phone_number like '%124%'

--Task 3
select *from Employees 

select first_name, len(first_name) as len_of_Name
from Employees
where first_name like 'A%' or first_name like 'J%' or first_name like 'M%' 
order by first_name 

--Task 4
select *from Employees

select manager_id, sum(salary) as Total_Salary
from Employees 
group by manager_id

--task 5
select *from TestMax

SELECT year1,
       GREATEST(Max1, Max2, Max3) AS HighestValue
FROM TestMax;


--Task 6
select *from cinema
where id % 2 = 1
and description <> 'boring'

--Task 7 
select *from SingleOrder

SELECT *
FROM  SingleOrder
ORDER BY (CASE WHEN Id = 0 THEN 1 ELSE 0 END), Id;

--Task 8
select *from person

SELECT Id,
       COALESCE(SSN, passportid, ITIN) AS person
FROM person;
 

 --medium task 
 --task 1 (9)
select *from Students

SELECT  
  PARSENAME(REPLACE(FullName, ' ', '.'), 3) AS FirstName,
  PARSENAME(REPLACE(FullName, ' ', '.'), 2) AS MiddleName,
  PARSENAME(REPLACE(FullName, ' ', '.'), 1) AS LastName
FROM Students;

--Task 2 (10) no
select *from Orders

--Task 3 (11) no
select *from DMLTable

SELECT 
    STRING_AGG(String, ', ') AS ProductList
FROM DMLTable
group by SequenceNumber


--Task 4 (12)
select *from Employees 

select First_Name, Last_Name,(First_Name + ' '+ Last_Name ) as Full_Name
from Employees
where len(lower(First_Name + ' '+ Last_Name)) - len(replace(lower(First_Name + Last_Name), 'a', '')) >=3

--Task 5 (13)
select *from Employees

select department_id ,count(First_Name) as N_employees 
from Employees
where datediff(year, hire_date, getdate()) > 3
group by department_id 

--Hard task\
--Task 1
select *from Students

--Task 2
select *from Student 

SELECT 
    birthday,
    STRING_AGG(StudentName, ', ') AS StudentsWithSameBirthday
FROM Student
GROUP BY birthday
HAVING COUNT(*) > 1;

--Task 3 noon
select *from PlayerScores

--Task 4 noon
