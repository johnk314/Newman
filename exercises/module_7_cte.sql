-- An example Common Table Expression (CTE).
-- Run the query as-is to see the results of the example.
WITH OrdersShippers AS (
    SELECT 
        O.OrderID

        ,S.CompanyName AS ShipperName

        ,CAST(O.OrderDate AS DATE) AS OrderDate
        ,CAST(O.ShippedDate AS DATE) AS ShippedDate
        ,O.Freight
        ,O.ShipName
        ,O.ShipAddress
        ,O.ShipCity
        ,O.ShipPostalCode
        
    FROM [Northwind].[dbo].[Orders] AS O
    LEFT JOIN [Northwind].[dbo].[Shippers] AS S
        ON O.ShipVia = S.ShipperID
)

-- EXAMPLE QUESTION: Which shipper has carried the most orders each year?
SELECT 
    DATEPART(year, OS.ShippedDate) AS ShippedYear
    ,COUNT(*) AS ShipCount
    ,OS.ShipperName
    
FROM 
    OrdersShippers as OS
GROUP BY 
    OS.ShipperName,
    DATEPART(year, OS.ShippedDate)
ORDER BY 
    DATEPART(year, OS.ShippedDate) DESC
    ,COUNT(*) DESC;


-- QUESTION #1: Create a CTE to relate Customers to Employees using the Orders table as a common element.
-- WITH EmployeesOrdersCustomers AS (
-- SELECT 
--     *
    

-- FROM
--     [Northwind].[dbo].[Orders] AS O
--     -- LEFT JOIN Customers AS C
--     -- LEFT JOIN Employees AS E
-- )

-- QUESTION #1: Which Employees placed Orders for the most Customers?
-- HINT: We're interested in the number of orders, not the dollar-value.
-- HINT: We're interest in total orders, not by year.
-- SELECT *
-- FROM EmployeesOrdersCustomers;