-- Example of how to filter for Employees from London.
SELECT
    [EmployeeID]
    ,[LastName]
    ,[FirstName]
    ,[City]
    ,[Title]
FROM [Northwind].[dbo].[Employees] AS E
WHERE [City] = 'London';


-- QUESTION #1: Which Orders were placed by Employees who live in (City) London?
SELECT 
    [OrderID]
    ,[CustomerID]
    ,[EmployeeID]
    ,CAST([OrderDate] AS DATE) AS OrderDate
    ,CAST([RequiredDate] AS DATE) AS RequiredDate
    ,CAST([ShippedDate] AS DATE) AS ShippedDate
    ,[ShipVia]
    ,[Freight]
    ,[ShipName]
    ,[ShipAddress]
    ,[ShipCity]
    ,[ShipRegion]
    ,[ShipPostalCode]
    ,[ShipCountry]

FROM [Northwind].[dbo].[Orders] AS O
WHERE O.[EmployeeID] IN(10248); -- Use a sub-query to filter for Orders placed by Londoners.


-- QUESTION #2: Which Orders were placed by Employees who are Sales Representitives (Title)?
SELECT O.*
FROM [Northwind].[dbo].[Orders] AS O;
