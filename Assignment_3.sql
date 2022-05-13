--1.

Create View view_product_order_dykhuizen as
Select p.ProductName, sum(od.Quantity) [Quantity]
From Products p join [Order Details] od on od.ProductID = p.ProductID
Group By p.ProductName
go

--2.

Create Procedure sp_product_order_quantity_dykhuizen
@prodID int
as
select sum(od.Quantity)
from [Order Details] od
where od.productID = @prodID
go

exec sp_product_order_quantity_dykhuizen @prodID = 2
go
--3.

Create Procedure sp_product_order_city_dykhuizen
@prodNom varchar(15)
as
select top 5 o.ShipCity, sum(od.Quantity) [quantity]
from Orders o join [Order Details] od on od.OrderID = o.OrderID join Products p on od.ProductID = p.ProductID
where p.ProductName = @prodNom
Group by o.ShipCity
order by [quantity] desc

go

exec sp_product_order_city_dykhuizen @prodNom =  'Chai'
go
--4.

Create Table people_dykhuizen (
ID int Primary Key,
name varchar(30),
city int
)
Create Table cities_dykhuizen(
id int Primary Key,
city varchar(30)
)


Insert into people_dykhuizen values (1, 'Aaron Rodgers', 2)
Insert into people_dykhuizen values (2, 'Russell Wilson', 1)
Insert into people_dykhuizen values (3, 'Jody Nelson', 2)
Insert into cities_dykhuizen values (2, 'Green Bay')
Insert into cities_dykhuizen values (1, 'Seattle')

select * from people_dykhuizen
select * from cities_dykhuizen

update cities_dykhuizen set city = 'Madison' where city = 'Seattle'
go

Create View Packers_dykhuizen
as(
select p.name
from people_dykhuizen p join cities_dykhuizen c on p.city = c.id
where c.city = 'Green Bay'
)

go

Drop Table cities_dykhuizen
Drop Table people_dykhuizen

drop View Packers_dykhuizen

go

--5.



















