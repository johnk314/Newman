-- QUESTION #1: Write a query to join & denormalize/flatten Product, Category, & Supplier tables. Create a view of the query named EmployeesOrdersCustomers.
-- HINT: You can see the view under CONNECTIONS > SERVERS > localhost > Databases > Northwind > Views.
-- HINT: Once the view has been created, comment out that code & move on to QUESTION #2.

CREATE VIEW EmployeesOrdersCustomers AS 
    SELECT 
        *
    FROM 
        [Northwind].[dbo].[Orders] AS O
        -- LEFT JOIN Customers AS C
        -- LEFT JOIN Employees AS E


-- QUESTION #2: Which Employees placed Orders for the most Customers?
-- SELECT *
-- FROM EmployeesOrdersCustomers;

    -- SELECT 
    --     O.OrderID
    --     ,O.
    --     ,S.*

    -- FROM [Northwind].[dbo].[Orders] AS O
    -- LEFT JOIN [Northwind].[dbo].[Shippers] AS S
    --     ON O.ShipVia = S.ShipperID;

-- SELECT *
-- FROM ExampleCTE;

-- WITH  AS (
    

