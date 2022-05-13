--Henry Dykhuizen 

--05/12/2022

----------------Conceptual Questions-----------------------------

--1. The Difference between Where and having is that Having must be used in conjunction 
--   with Group By because having implements a column operation, Where implements a row 
--   operation. Having can also be used with aggragate functions, Where can not.
--2. Dense_Rank() is different from Rank() in the fact that When 2 or more records
--   have the same value, both functions will repeat the rank, but Rank() will skip to the
--   row number of the next rank, but dense_Rank() will go to the next chronological number.
--3. A correlated subquery is a query within a query that is executed for every row of the 
--   outer query.
--4. The criteria for Union are that every Selecthas the same number of 
--   rows, have similar data types, and be in the same order.
--   For Union All it is the same.
--5. The difference between Union and Union All is that Union All
--   includes duplicates.
--6. The differnce between union and Join is that the join adds columns
--   horizontally, while Union joins rows vertically.

-----------------------------------------------------------------------

--1.

Select cr.Name [Country] , sp.Name [Province]
From Person.CountryRegion cr 
join Person.StateProvince sp on cr.CountryRegionCode = sp.CountryRegionCode

--2.

Select cr.Name [Country] , sp.Name [Province]
From Person.CountryRegion cr 
join Person.StateProvince sp on cr.CountryRegionCode = sp.CountryRegionCode
where cr.name in ('Germany', 'Canada')

--3.
Select p.ProductName, sum(od.Quantity) [quantity]
from  Products p join [Order Details] od on p.ProductID = od.ProductId join Orders o on od.OrderID = o.OrderID
where DateADD(year,-25, getDate()) > o.OrderDate
Group by p.ProductName
having sum(od.quantity) > 0

--4.

Select top 5 o.ShipPostalCode, sum(od.Quantity) [quantity]
from   Orders o join [Order Details] od on  od.OrderID = o.OrderID
where DateADD(year,-25, getDate()) > o.OrderDate
Group by o.ShipPostalCode
order by quantity desc

--5.

Select o.ShipCity, count(distinct o.CustomerID) [Num Cus]
from   Orders o
Group by o.ShipCity
order by [Num Cus] desc

--6.

Select o.ShipCity, count(distinct o.CustomerID) [Num Cus]
from   Orders o
Group by o.ShipCity
having count(distinct o.CustomerID) > 2
order by [Num Cus] desc

--7.

Select c.ContactName , sum(od.Quantity) [Num of items]
From Customers c join Orders o on c.CustomerID = o.CustomerID join [Order Details] od on o.OrderID = od.OrderID
Group By c.ContactName

--8.

Select c.ContactName , sum(od.Quantity) [Num of items]
From Customers c join Orders o on c.CustomerID = o.CustomerID join [Order Details] od on o.OrderID = od.OrderID
Group By c.ContactName
having sum(od.Quantity) > 100

--9.

Select s.CompanyName [Supplier Name], p.CompanyName [Shipper Name]
From Suppliers s join Shippers p on 1=1

--10.

Select o.OrderDate, p.ProductName
From Orders o join [Order Details] od on o.OrderID = od.OrderID join Products p on od.ProductID = p.ProductID
order By o.OrderDate desc

--11.

Select e1.FirstName + ' ' + e1.LastName, e2.FirstName+ ' ' + e2.LastName
From Employees e1 join Employees e2 on e1.Title = e2.Title
where e1.FirstName <> e2.FirstName and e1.LastName <> e2.LastName

--12.


with cte
as
(
select e1.EmployeeID [id] , count(e2.ReportsTo) [count]
from Employees e1 join Employees e2 on e2.ReportsTo = e1.EmployeeID
Group by e1.EmployeeID
having count(e2.ReportsTo) > 1
)
select *
From Employees e join cte c on c.id = e.EmployeeID
where e.title like '%Manager'

--13.

Select City, CompanyName, ContactName, 'Customer' [Type]
From Customers
union 
Select City, CompanyName, ContactName, 'Supplier' [Type]
from Suppliers

--14.

Select distinct City
from Employees
where City in (Select City from Customers)

--15.


































































































































