--Lesson-2 Homework
--Basic-Level Tasks(10)

--Task N1
use Lesson2
go

create table Employees(
   EmpID int,
   Nmae varchar (50),
   Salary decimal (10,2)
   );
   
   select * from Employees
--Adding new column 
alter table Employees 
add IDNumber int identity (20,1);

--Task N2
--method 1
insert into Employees(EmpID,Nmae,Salary)
values (1,'Sama', 20.22)
--methods 2
insert into Employees(EmpID,Nmae,Salary)
select 2, 'Alex', 16.99

--Task 3
update Employees
set Salary=7000
where EmpID=1

select *from Employees

--Task 4
delete Employees
where EmpID=2

--Task 5
-- delete - bu jadval ichidagi belgilangan malumotni bir qismini o'chirish uchun ishlatilinadi, (FAQAT BELGILANGAN QATORNI O'CHIRADI)
--Truncate - esa JADVALNI hamma  qatorini teza o'chiradi , ammo jadvalni strukturasini qoldiradi
--Drop- esa jadvalni ham va jadvalni strukturasini ham malumotlarga qo'shib o'chirib yuvoradi

exec sp_rename 'Employees.Nmae','Name', 'COLUMN'

--Task 6 
alter table Employees
alter column Name varchar(100);

--Task 7 
alter table Employees
add Department varchar(50)

select *from Employees 

--Task 8
alter table Employees 
alter column Salary float

--Tasks 9 
create table Department (
  DepartmentID int,
  DepartmentName varchar(50)
  );

--Task 10
truncate table Employees;

--Intermediate-Level Tasks (6)

--Task 11
--Task 11
insert into Department(DepartmentName)
select 'HR'
insert into Department(DepartmentName)
select 'Finance'
insert into Department(DepartmentName)
select 'IT'
insert into Department(DepartmentName)
select 'Marketing'
insert into Department(DepartmentName)
select 'Sales'

select *from Employees

--Task 12
update Employees
set Department = 'Management'
where Salary >5000

select *from Employees

--Task 13
truncate table Employees;

--Task 14
alter table Employees
drop column Department

--Task 15
exec sp_rename 'Employees','StaffMembers'

--Task 16
drop table Department

--Advanced-Level Tasks(9)
--Task 17
create table Products (
  ProductID int identity(1,1) primary key,
  ProductName varchar (40),
  Category varchar (40),
  Price decimal (10,2)
  );

select *from Products

--Task 18
alter table Products
add constraint check_price_positive
check(price >0);

select * from Products

--Task 19
--Task 19
alter table Products 
add StockQuantity int default 50;

--Task 20
exec sp_rename 'Products.Category', 'ProductCategory','COLUMN'

--Task 21 
insert into Products values ('Apple', 'Fruit',5000,10), 
   ('Banana', 'Fruit',10000,10),
   ('Mnago', 'Fruit',15000,70),
   ('Dragonfruit', 'Fruit',55000,10),
   ('Pineapple', 'Fruit',5000,10)

insert into Products(ProductName,ProductCategory, StockQuantity)
values ('Papaya', 'Fruit' ,10);

--Task 22
select *
into Products_Backup
from Products

select * from Products_Backup

--Task 23
exec sp_rename 'Products', 'Inventory';

SELECT * FROM Inventory 

-- Task 24
ALTER TABLE Inventory
ALTER COLUMN Price FLOAT;

--tASK 25
alter table Inventory
add ProductCode int identity(1000,5)
