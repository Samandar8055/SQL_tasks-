--use Lesson12
--Homework Lesson 12
--Task 1
select *from Person
select *from Address

select p.firstName, p.lastName, a.city, a.state
from Person as p
left join Address a
on p.personId = a.personId

--Task 2
select *from Employee

SELECT e.name AS Employee
FROM Employee AS e
JOIN Employee AS m
ON e.managerId = m.id
WHERE e.salary > m.salary;

--Task 3
-- Create and insert data
CREATE TABLE IF NOT EXISTS Person (id INT, email VARCHAR(255));
TRUNCATE TABLE Person;
INSERT INTO Person (id, email)
VALUES 
(1, 'a@b.com'),
(2, 'c@d.com'),
(3, 'a@b.com');

-- Solution
SELECT email AS Email
FROM Person
GROUP BY email
HAVING COUNT(email) > 1;

--Task 4
-- Delete duplicates, keep smallest ID
DELETE FROM Person
WHERE id NOT IN (
    SELECT MIN(id)
    FROM Person
    GROUP BY email
);

--Task 5
-- Tables & data already provided

-- Solution
SELECT g.ParentName
FROM girls g
WHERE g.ParentName NOT IN (
    SELECT DISTINCT ParentName
    FROM boys
);

--task 6
SELECT 
    CustomerID,
    SUM(TotalDue) AS TotalSalesOver50,
    MIN(Freight) AS LeastWeight
FROM Sales.Orders
WHERE Freight > 50
GROUP BY CustomerID;


--task 7 
-- Given tables Cart1 and Cart2

SELECT 
    c1.Item AS [Item Cart 1],
    c2.Item AS [Item Cart 2]
FROM Cart1 c1
FULL OUTER JOIN Cart2 c2
ON c1.Item = c2.Item;

--task 8
-- Given tables Customers and Orders

SELECT c.name AS Customers
FROM Customers c
LEFT JOIN Orders o
ON c.id = o.customerId
WHERE o.customerId IS NULL;

--task 9
-- Given tables Students, Subjects, Examinations

SELECT 
    s.student_id,
    s.student_name,
    sub.subject_name,
    COUNT(e.subject_name) AS attended_exams
FROM Students s
CROSS JOIN Subjects sub
LEFT JOIN Examinations e
    ON s.student_id = e.student_id
   AND sub.subject_name = e.subject_name
GROUP BY s.student_id, s.student_name, sub.subject_name
ORDER BY s.student_id, sub.subject_name;



