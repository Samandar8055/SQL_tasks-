--Homework 6
--Lesson 6 
--Homework

---Puzzel 1
--Finding distinct values 
--Puzzle 1
--method 1
select *from my_table

SELECT DISTINCT 
       LEAST(col1, col2) AS col1,
       GREATEST(col1, col2) AS col2
FROM my_table;

--method 2
SELECT DISTINCT
       CASE WHEN col1 < col2 THEN col1 ELSE col2 END AS col1,
       CASE WHEN col1 < col2 THEN col2 ELSE col1 END AS col2
FROM my_table
ORDER BY col1, col2;

--Puzzle 2
select *from TestMultipleZero 
SELECT *
FROM TestMultipleZero
WHERE NOT (A = 0 AND B = 0 AND C = 0 AND D = 0);

--Pazzle 3
select *from section1
where id % 2 = 1

--Pazzle 4
SELECT top 1 *
FROM section1
ORDER BY id Asc

--Pazzle 5
SELECT top 1 *
FROM section1
ORDER BY id desc

--Pazzle 6 
select *from section1
where name like 'B%'

--Pazzle 7 
select *from ProductCodes

CREATE TABLE ProductCodes (
    Code VARCHAR(20)
);

INSERT INTO ProductCodes (Code) VALUES
('X-123'),
('X_456'),
('X#789'),
('X-001'),
('X%202'),
('X_ABC'),
('X#DEF'),
('X-999');

drop table ProductCodes

SELECT *
FROM ProductCodes
WHERE Code LIKE '%\_%' ESCAPE '\';
