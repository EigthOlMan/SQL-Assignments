--Henry Dykhuizen 

--05/10/2022

----------------Conceptual Questions-----------------------------
--1. CRUD stands for Create, Read, Update, Delete
--2. The System Databases are master, model, msdb, tempdb 
--   They are important databases that the DBMS needs to 
--   operate.
--3. OLAP is Online Analytic Process, and they deal with m ore
--   memory and handle analytics on large datasets and histories.
--   OLTP is  Online Transaction Process, and they deal with the tranascation 
--   that are less memory intensive than the needs of an OLAP.
--4. The difference of between Data Definition Language
--   and Data Maintenance Language is that DDL establishes the
--   DB schema and DML is used to access or modify the data.
--5. The Like keyword is used with wildcards to
--	 access records tha match a specified pattern
--6. The wild cards available to the like keyword are
--		% zero or more characters
--		_ single character
--		[] single character in the brackets
--		^ any character not in brackets
--		- single character within the range of
--7. The difference between the left join and inner join
--	 is that the inner join only shows records with corrisponding 
--	 datum in both tables, while left join will show all records of
--	 the left table regardless if it has a corresponding record in
--   the right.


-------------------------Queries----------------------------------

--1.

Use AdventureWorks2019

Go

Select ProductID, Name, Color, ListPrice
From Production.Product

Go

--2.

Select ProductID, Name, Color, ListPrice
From Production.Product
Where ListPrice <> 0

--3.

Select ProductID, Name, Color, ListPrice
From Production.Product
Where Color Is Not NULL

--4.

Select ProductID, Name, Color, ListPrice
From Production.Product
Where ListPrice > 0 and Color Is Not NULL

--5.
Select Name + ' '+ Color as [Name Color]
From Production.Product
Where Color Is Not NULL

--6.

Select Name, Color
From Production.Product
Where Name Like '%Crankarm' Or Name like '%Chainring%'
Order By Name Desc

--7.

Select ProductID, Name
From Production.Product
Where ProductID between 400 and 500

--8.

Select ProductID, Name, Color
From Production.Product
Where Color in ('Black','Blue')

--9.

Select *
From Production.Product
Where Name like 'S%'

--10.

Select Top 5 Name, ListPrice
From Production.Product
Where Name like 'A%' or Name like 'S%'
Order By Name ASC

--11.

Select *
From Production.Product
Where Name like 'Spo[^k]%'
Order By Name 

--12.

Select Distinct ProductSubcategoryID, Color
From Production.Product
Where ProductSubcategoryID is not NULL AND
	  Color is not Null