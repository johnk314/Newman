-- An example Common Table Expression (CTE) to show the syntax.
-- Run the query as-is to see the results of the example.
WITH OrdersShippers AS (
    SELECT 
        O.OrderID

        ,S.CompanyName AS ShipperName

        ,CAST(O.OrderDate AS DATE) AS OrderDate -- Keep only date, remove time detail.
        ,CAST(O.ShippedDate AS DATE) AS ShippedDate -- Keep only date, remove time detail.
        ,O.Freight
        ,O.ShipName
        ,O.ShipAddress
        ,O.ShipCity
        ,O.ShipPostalCode
        
    FROM [Northwinds].[dbo].[Orders] AS O
    LEFT JOIN [Northwinds].[dbo].[Shippers] AS S
        ON O.ShipVia = S.ShipperID
    )

-- EXAMPLE QUESTION: Which Shipper has carried the most Orders?
SELECT 
    OS.ShipperName
    ,COUNT(*) AS ShipCount
    
FROM 
    OrdersShippers as OS
GROUP BY 
    OS.ShipperName
ORDER BY 
    COUNT(*) DESC;
----------------------------------------------------------------------------------------------------


-- QUESTION #1: Create a CTE & Select query to show the number of orders each Shipper carried each month of each year.
-- HINT: You will write 2 queries for this question, just like the example.
-- HINT: Use DATEPART() function to identify the month & year of each ShippedDate. Google "TSQL Datepart" for help.
-- HINT: You will have to use the DATEPART() function in the SELECT, GROUP BY, & ORDER BY clauses.
