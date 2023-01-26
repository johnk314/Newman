-- Create View... Not CTE

WITH ExampleCTE AS (
    SELECT 
        O.OrderID
        ,O.
        ,S.*

    FROM [Northwind].[dbo].[Orders] AS O
    LEFT JOIN [Northwind].[dbo].[Shippers] AS S
        ON O.ShipVia = S.ShipperID
)

SELECT *
FROM ExampleCTE;

-- WITH EmployeesOrdersCustomers AS (
-- SELECT 
--     *
    

-- FROM
--     [Northwind].[dbo].[Orders] AS O
--     -- LEFT JOIN Customers AS C
--     -- LEFT JOIN Employees AS E
-- )

-- -- QUESTION #1: Which Employees placed Orders for the most Customers?
-- SELECT *
-- FROM EmployeesOrdersCustomers;