-- QUESTION #1: Write a query to join & denormalize/flatten Product, Category, & Supplier tables. Create a view of the join named EmployeesOrdersCustomers.
-- HINT: You can see the view under CONNECTIONS > SERVERS > localhost > Databases > Northwind > Views.
-- HINT: You may need to refresh the database/views folder.
-- HINT: Once the view has been created, comment out that code & move on to QUESTION #2.

-- Set current database to Northwind. (otherwise the view will be created in System Databases > Master)
USE Northwind 
GO

-- Create view for question #1.
CREATE VIEW EmployeesOrdersCustomers AS 
    SELECT 
        O.OrderID,
        O.CustomerID,
        O.EmployeeID,
        CAST(O.OrderDate AS DATE) AS OrderDate,
        CAST(O.RequiredDate AS DATE) AS RequiredDate,
        CAST(O.ShippedDate AS DATE) AS ShipDate,
        O.ShipVia,
        O.Freight,
        O.ShipName,
        O.ShipAddress,
        O.ShipCity,
        O.ShipRegion,
        
        C.CompanyName,
        C.ContactName,
        C.ContactTitle,
        C.Address AS CustomerAddress,
        C.City AS CustomerCity,
        C.Region AS CustomerRegion,
        C.PostalCode AS CustomerPostalCode,
        C.Country AS CustomerCountry,
        
        E.LastName,
        E.FirstName,
        E.Title,
        E.BirthDate,
        E.HireDate,
        E.Address AS EmployeeAddress,
        E.City AS EmployeeCity,
        E.Region AS EmployeeRegion,
        E.PostalCode AS EmployeePostalCode,
        E.Country AS EmployeeCountry

    FROM 
        [Northwind].[dbo].[Orders] AS O
            LEFT JOIN Customers AS C
            ON O.CustomerID = C.CustomerID
                LEFT JOIN Employees AS E
                ON O.EmployeeID = E.EmployeeID;

-- If needed, delete the EmployeesOrdersCustomers view.
-- DROP VIEW EmployeesOrdersCustomers;

-- SELECT *
-- FROM EmployeesOrdersCustomers;

-- QUESTION #2: How many rows are in the Orders table? How many rows are in the EmployeesOrdersCustomers view?


-- QUESTION #3: Which Customers (CompanyName) placed the most orders in 1998?
-- HINT: Each row is one order.


-- QUESTION #4: Which Employees placed the most Orders?

