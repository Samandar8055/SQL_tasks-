--Homework Lesson-3

--Easy_level_10

--Task 1 
--Bulk insert nima? 'Bulk' so'zi ommaviy deb hajimga nisbatan ishlatiladi yanni malumotlarni ommaviy ravishda manbadan tortib olib kerakli manbaga joylashtirish uchun ishlatilinadi. SQL sever ichiga malumot kiritmoxchi bo'lganda bu usuldan foydalansa bo'ladi.

--Task 2
--SQl serverga quydagi malumot file turlarini yuklasak bo'ladi bular: Exel, CSV, Text(TXT),XML (Extensible Markup Language)

--Task 3
-- im using database Lesson1
create table Products(
   ProductID int Primary key,
   ProductName varchar(50),
   Price decimal(10,2)
   );

select *from Products

--Task 4
insert into Products values
  (1, 'Apple', 3000.00),
  (2, 'Banana', 12000.00),
  (3, 'Aprikos', 7000.00);
  
--Task 5
--NULL va NOT NULL larni biz SQL serverda malumotlarni jadvalga kirityatkanda va malumot turi berilgandan kegin unga shart qo'yilyatkanda ishlatamiz.
--yanni NULL bu - bir malumotni ixtiyoriy maydonlar uchun ishlatamiz, Bu maydonlar bo‘sh qolishi mumkin, shuning uchun NULL
--Qachon ishlatiladi:
--Ma’lumot bo‘lmasligi mumkin bo‘lgan ustunlarda
--Foydalanuvchi keyinroq to‘ldirishi mumkin bo‘lgan joylarda
--Misollar:
--Telefon raqami
---Profil rasmi

--NOT NULL
--majburiy maydonlar uchun
--Qachon ishlatiladi:
--Har doim qiymat bo‘lishi shart bo‘lgan ustunlarda
--Jadvaldagi asosiy (muhim) ma’lumotlarda
--Misollar:
--Ism (Name)
--Narx (Price)
--Login (Username)
--Bular bo‘sh qolsa, qatorni saqlab bo‘lmaydi → NOT NULL


select *from Products
--Task 6
alter table Products 
add constraint uni_Product_name unique (ProductName)
-- Task 7
-- SQL da comment yozish ikkita chiziq bilan boshlanadi '--'. bu bizga xode ishida documentatasa ava boshqa maqsadlarda kerak bo'ladi
/* bu comment yozishni ikkinchi usuli , yanni ko'p qatorli comment yozish uchun b=mo'ljalangan*/

-- Task 8
alter table  Products  
add CategoryID int;

-- Task 9 
create table Categories
  (CategoryID  int Primary key,
  CategoryName varchar(50) Unique);

select *from Categories

--Task 10
-- Identity jadvalga sarlovha kirityatganda qo'laymiz, ko'pincha product ID, product qanchaligi va boshqa maqsadda ishlatilinadi
--Uning asosiy maqsadi developerga qulaylik yaratib son letma ketligini qayta yozmasdan , uni sozlab ketma ket yozishga undasa bo'ladi

--Medium_level_Task(10)
--Task 11

--truncate table Products

BULK INSERT Products
FROM 'C:\Users\Acer\Downloads\Products.txt'
WITH (
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n',
    FIRSTROW = 2
);

select *from Products

--drop table Products
--email.txt is uploaded , database is Lesson1
--select*from emails

--Task 12
alter table Products
add constraint FK_Products_categories
foreign key (CategoryID)
references Categories(CategoryID);

select *from Products
select *from Categories

--Task 13
--Primark key va unique key larning asosiy farqi quydagila:
/* Asosiy farqi —

PRIMARY KEY jadvaldagi asosiy identifikator
UNIQUE KEY esa shunchaki noyob qiymatlarni saqlash uchun*/

--Task 14
--ALTER TABLE Products
--ALTER COLUMN Price DECIMAL(10,2);

alter table Products
add constraint check_price
check (Price > 0)

--Task 15 
alter table Products
add Stock int not null default 0; 

-- Task 16
SELECT 
    ProductID,
    ProductName,
    ISNULL(Price, 0) AS Price,
    CategoryID
FROM Products;
--Task 17
/*
FOREIGN KEY cheklovining maqsadi va ishlatilishi (SQL Server)

FOREIGN KEY — bu bir jadvaldagi ustun qiymatlari boshqa jadvaldagi qiymatlar bilan bogʻlangan bo‘lishini ta’minlaydigan cheklovdir.

📌 Maqsadi:
- Ma’lumotlar bazasida bogʻlanish (relationship) o‘rnatadi.
- Referensial yaxlitlikni (referential integrity) ta’minlaydi — ya’ni bolalar jadvalidagi qiymatlar faqat ota jadvalda mavjud bo‘lsa saqlanishi mumkin. 
💡 Ishlatilishi:
- Masalan, Products jadvalida CategoryID ustuni mavjud.
- Categories jadvalida esa barcha to‘g‘ri CategoryID lar saqlanadi.
- Products.CategoryID ustuniga FOREIGN KEY cheklovi qo‘ysangiz:
    ✅ Faqat Categories jadvalida mavjud bo‘lgan CategoryID qiymatlari kiritiladi.
    ❌ Categories jadvalidan hali ishlatilayotgan CategoryID ni o‘chirib bo‘lmaydi (avval Products dagi bogʻlangan qatorlar o‘chirilishi kerak).

📝 Qisqacha:
FOREIGN KEY — bu ikki jadval orasida bogʻlanishni o‘rnatadi va noto‘g‘ri (mos kelmaydigan) ma’lumot kiritilishini oldini oladi.
*/

--Hard-Level task(10)
-- Task 18
create table Customers(
  Age int,
  constraint aga_check
  check (Age>=18)
  );

 --Task 19
 create table TssJobs(
   JobOfferceID int identity(100,10)
   );
--Task 20 
create table OrderDetails(
  OrderID int,
  ProductID int
  Primary key (OrderID, ProductID)
  );

--Task 21
-- 🧩 ISNULL va COALESCE funksiyalari (NULL qiymatlarni boshqarish uchun)

-- 📌 ISNULL
-- ISNULL(expression, replacement_value)
-- Agar expression NULL bo‘lsa, replacement_value ni qaytaradi
-- Faqat 2 ta argument qabul qiladi
-- SQL Server’ga xos
-- Misol:
-- SELECT ISNULL(Price, 0) AS NewPrice FROM Products;

-- 📌 COALESCE
-- COALESCE(expr1, expr2, expr3, ...)
-- Berilgan bir nechta qiymatlardan birinchi NULL bo‘lmaganini qaytaradi
-- Bir nechta argument qabul qiladi
-- Standart SQL funksiyasi (ko‘p DBMS-larda ishlaydi)
-- Misol:
-- SELECT COALESCE(Price, DiscountPrice, 0) AS FinalPrice FROM Products;

-- 📌 Farqi:
-- ISNULL faqat 2 qiymat bilan ishlaydi, COALESCE esa bir nechta qiymatni tekshiradi.
-- ISNULL SQL Server’ga xos, COALESCE esa umumiy SQL standarti.

--Task 22
create table Employees(
  EmpID int primary key,
  Email varchar(50) Unique
  );

--Task23
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,          -- Asosiy kalit (har bir buyurtmani noyob qiladi)
    CustomerID INT,                   -- Mijoz identifikatori
    FOREIGN KEY (CustomerID)          -- Tashqi kalit (FOREIGN KEY)
        REFERENCES Customers(CustomerID) -- Customers jadvalidagi CustomerID ga bogʻlanadi
        ON DELETE CASCADE                 -- Agar Customers jadvalidan mijoz o‘chirilsа, uning Orders dagi barcha buyurtmalari ham avtomatik o‘chadi
        ON UPDATE CASCADE                 -- Agar Customers jadvalidagi CustomerID o‘zgarsa, Orders dagi tegishli CustomerID lar ham avtomatik yangilanadi
);



