use Northwind;
--1-- Orders Table Exploration & Some Cleaning
select TOP 10 * from Orders
--Date Duration
select max(year(OrderDate)) as MaxDate ,  min(year(ShippedDate)) as MinDate 
from Orders
--MaxDate is 1998 , MinDate is 1996

--Date Span
select (max(year(OrderDate)) - min(year(ShippedDate))) as DateSpan 
from Orders
--The Orders Recorded duration 2 Years

--Orders Count
select count(OrderID) as [Num of orders] from Orders
--Num of Orders is 830

--Customers Count these already Ordered
SELECT COUNT(DISTINCT CustomerID) AS [Num of Customers] 
FROM Orders;
--Num of Customers these already Ordered is 89

--Avg Freight
select round(AVG(o.Freight),0) as Freight 
from Orders o
--Avg Freight is 78$

--Avg shipping time
select avg(DATEDIFF(day ,OrderDate ,ShippedDate)) as [shipping time]
from Orders
--Avg shipping time for orders is 8 days

--how many days difference between the RequiredDate and the shipped.
select avg(DATEDIFF(day ,ShippedDate ,RequiredDate)) as [diff time]
from Orders
--Avg days is 19+ and this is great

Alter Table Orders
add
OrderDate1 NVARCHAR(20),
RequiredDate1 NVARCHAR(20),
ShippedDate1 NVARCHAR(20);

Update Orders
set 
OrderDate1 = format(OrderDate , 'yyyy-MM-dd'),
RequiredDate1 = format(RequiredDate , 'yyyy-MM-dd'),
ShippedDate1 = format(ShippedDate , 'yyyy-MM-dd');

--2--Order Details Table Exploration
select TOP 10 * from [Order Details]

--Avg Discounts
select round(AVG(od.Discount),2) as AvgDiscounts 
from [Order Details] od
--Avg Discounts 6%

--3--Customers Table Exploration
select TOP 10 * from Customers

--Customers Count
select count(Distinct c.CustomerID) as [Num of Customers] 
from Customers c
--We have a 91 Customers
--There are 89 made orders in this data and 2 not

--4--Employees Table Exploration & Some Cleaning
select TOP 10 * from Employees

--Employees Count
select count(Employees.EmployeeID) as [Num of Employees]
from Employees 
--We have a 9 Employees

--Avg Age The Employees
select avg(Employees.Age) as [Age of Employees]
from Employees
--Avg Age The Employees is 42 year

Alter Table Employees
add 
FullName nvarchar(50),
Age int,
EmployeeExp int;

Update Employees
set 
FullName = CONCAT(FirstName,' ',LastName),
Age = DATEDIFF(YEAR,BirthDate,'1998'),
EmployeeExp = DATEDIFF(YEAR,HireDate,'1998');

--Create Proc To make the process easier when come new data
Alter PROCEDURE AgeColumn
AS
BEGIN
    UPDATE Employees
    SET Age = DATEDIFF(YEAR, BirthDate, '1998') - 
              CASE 
                  WHEN DATEADD(YEAR, DATEDIFF(YEAR, BirthDate, GETDATE()), BirthDate) > '1998' 
                  THEN 1 
                  ELSE 0 
              END;
END;

--Create Proc To make the process easier when come new data
Create PROCEDURE ExpColumn
AS
BEGIN
    UPDATE Employees
    SET EmployeeExp = DATEDIFF(YEAR, HireDate, '1998') - 
              CASE 
                  WHEN DATEADD(YEAR, DATEDIFF(YEAR, HireDate, GETDATE()), HireDate) > '1998' 
                  THEN 1 
                  ELSE 0 
              END;
END;

EXEC ExpColumn;
EXEC AgeColumn;

--5--Categories Table Exploration
select TOP 10 * from Categories

--Categories Count
select count(Categories.CategoryID) as [Num of Categories]
from Categories 
--We have a 8 Categories

--6--Products Table Exploration
select TOP 10 * from Products

--Products Count
select count(Products.ProductID) as [Num of Products]
from Products 
--We have a 77 Products

--The num of Products of each Category
select c.CategoryName , count(P.ProductID) as [Num of Products]
from Products p inner join Categories c 
     on p.CategoryID = c.CategoryID
group by c.CategoryName
order by 2 desc
--

--7--Shippers Table Exploration
select TOP 3 * from Shippers 

--Shippers Count
select count(s.ShipperID) as [Num of Shippers]
from Shippers s
--Num of Company Shippers is 3

--8--Suppliers Table Exploration
select TOP 10 * from Suppliers

--Suppliers Count
select count(s.SupplierID) as [Num of Suppliers]
from Suppliers s
--Num of Suppliers is 29

--9--Territories Table Exploration
select TOP 10 * from Territories

--Rename col
EXEC sp_rename 'Territories.TerritoryDescription', 'TerritoryName', 'COLUMN';

--10--Region Table Exploration
select Top 3 * from Region

--Rename col
EXEC sp_rename 'Region.RegionDescription', 'RegionName', 'COLUMN';

--11--EmployeeTerritories Table Exploration
select TOP 10 * from EmployeeTerritories


-- WE ARE DONE WITH EXPLORATION & SOME CLEANING, NOW LET'S DO SOME ANALYSIS FOR REPORTING & BUSINESS --
