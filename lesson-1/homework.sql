--Easy Lesson_1
--Tasks N1
--*Malumot(Data)- malumot va ular turli bo'lishi mumkun (msdslsn idim, don vs boshqa ko'rinishda)
--*Ma'lumotlar bazasi(Database)- O'zaro malumotlar toplami bolib, turli malumotlarni saqlaydi va malumotlarni tartiblangan holda saqlaydi.
--*Relatsion ma'lumotlar bazasi(Relation Database)- Ma'limotlarni(datani) jadval(table) ko'rinishida saqlaydi va jadvallarni(tables) ni o'zaro bog'laydigon malumot bazasi turi,
--*Jadval(Table)- malumotlarni bazasida tartibliy holda yani ustun (column) va qator (row) ko'rinishida saqlovchi tuzulma

--Task N2
--Yuqori xavfsizlik – Ma’lumotlarni himoya qilish uchun autentifikatsiya va shifrlash imkoniyatlari mavjud.
--Ma’lumotlarni zaxiralash va tiklash – Ma’lumotlar yo‘qolganida ularni tiklash imkonini beradi.
--Yuqori ishlash tezligi – Katta hajmdagi ma’lumotlar bilan ham tez ishlaydi.
--Ko‘p foydalanuvchili ishlash – Bir vaqtning o‘zida ko‘p foydalanuvchilar ishlay oladi.
--SSMS orqali boshqarish – Grafik interfeys yordamida ma’lumotlar bazasini oson boshqarish mumkin.

--Task N3
--1. Windows autentifikatsiyasi

--SQL Server’ga kirishda Windows foydalanuvchi hisobini ishlatadi.
--Alohida login va parol kiritish shart emas — kompyuterga kirishda ishlatilgan hisobdan foydalanadi.
--Bu usul xavfsizroq, chunki Windows’ning xavfsizlik tizimini ishlatadi.
--2. SQL Server autentifikatsiyasi
--SQL Server ichida yaratilgan alohida login va parol yordamida tizimga kiriladi.
--Har safar ulanishda foydalanuvchi nomi va parolni qo‘lda kiritish kerak bo‘ladi.
--Bu usul, ayniqsa, Windows tarmog‘iga kirmagan foydalanuvchilar uchun foydali.


--Medium Lesson_1
--Task N4 and 5

CREATE DATABASE SchoolDB

CREATE TABLE Students (StudentID int,Name varchar(50),Age int);

select *from Students

----Task N6
--SQL (Structured Query Language)
--Bu ma’lumotlar bilan ishlash tili.
--Ma’lumotlarni yaratish, o‘zgartirish, o‘chirish va qidirish uchun ishlatiladi.
--Masalan: SELECT, INSERT, UPDATE, DELETE kabi buyruqlar.
--SQL Server
--Bu ma’lumotlar bazasini boshqarish tizimi (DBMS).
--Unda ma’lumotlar saqlanadi va ular ustida amallar bajariladi.
--SQL bu yerda ishlatiladigan til, SQL Server esa uni bajaradigan dastur.
--SSMS (SQL Server Management Studio)
--Bu SQL Server bilan ishlash uchun grafik dastur.
--SQL kodini yozish, ishga tushirish, ma’lumotlar bazasini boshqarish va sozlash imkonini beradi.
--SQL Server’ni boshqarishni vizual interfeys orqali osonlashtiradi.

--Hard
--Task 7

--🔵DQL (Data Query Language) — Ma’lumotlarni so‘rash
--Vazifasi: Ma’lumotlarni bazadan qidirish va olish
--Asosiy buyruq: SELECT

--Misol:
--SELECT * FROM Students;
--(Barcha talabalarni ko‘rsatadi)

--🔵 DML (Data Manipulation Language) — Ma’lumotlar bilan ishlash
--Vazifasi: Ma’lumotlarni qo‘shish, yangilash, o‘chirish
--Asosiy buyruqlar: INSERT, UPDATE, DELETE

--Misollar:
--INSERT INTO Students (Name, Age) VALUES ('Ali', 20);
--UPDATE Students SET Age = 21 WHERE Name = 'Ali';
--DELETE FROM Students WHERE Name = 'Ali';

--🔵 DDL (Data Definition Language) — Ma’lumotlar tuzilmasini yaratish
--Vazifasi: Jadval va bazalar tuzilmasini yaratish, o‘zgartirish, o‘chirish
--Asosiy buyruqlar: CREATE, ALTER, DROP

--Misollar:
--CREATE TABLE Students (ID INT, Name VARCHAR(50));
--ALTER TABLE Students ADD Age INT;
--DROP TABLE Students;

--🔵 DCL (Data Control Language) — Huquqlarni boshqarish
--Vazifasi: Foydalanuvchilarga ruxsat berish yoki bekor qilish
--Asosiy buyruqlar: GRANT, REVOKE

--Misollar:
--GRANT SELECT ON Students TO User1;
--REVOKE SELECT ON Students FROM User1;

--🔵 TCL (Transaction Control Language) — Tranzaksiyalarni boshqarish
--Vazifasi: Ma’lumotlar bazasidagi tranzaksiyalarni nazorat qilish
--Asosiy buyruqlar: COMMIT, ROLLBACK, SAVEPOINT

--Misollar:
--BEGIN TRANSACTION;
--DELETE FROM Students WHERE ID = 1;
--ROLLBACK; -- o‘zgarishni bekor qiladi
--COMMIT; -- o‘zgarishni saqlaydi


--Esda saqlash:
--DQL – So‘rash
--DML – Ma’lumotni o‘zgartirish
--DDL – Tuzilma yaratish
--DCL – Ruxsatlarni boshqarish
--TCL – Tranzaksiyalarni boshqarish
