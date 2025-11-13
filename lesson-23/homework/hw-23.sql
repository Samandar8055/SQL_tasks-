--Homework Lesson 23
--create database Lesson23 
--use Lesson23

--Pazzle 1
select * from Dates 
select id,Dt, right('0'+cast(month(Dt)as varchar(2)),2) as month
from dates

--Pazzle 2
select *from MyTabel

SELECT 
    COUNT(DISTINCT Id) AS Distinct_Ids,
    rID,
    SUM(MaxVals) AS TotalOfMaxVals
FROM (
    SELECT 
        Id,
        rID,
        MAX(Vals) AS MaxVals
    FROM MyTabel
    GROUP BY Id,rid
) AS t
GROUP BY rID;

--Pazzle 3
select *from TestFixLengths

select id,Vals 
from TestFixLengths
where len(Vals) between 6 and 10;

--Pazzle 4

