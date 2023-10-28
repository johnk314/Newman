-- Set up query for questions below. Please read entire script & run as-is before beginning questions.

-- Create a common-table expression (CTE).
-- NOTE: Makes "OrdersProducts" available to query below.
-- Sum product orders for all avilable time-frames (1996-1998).
-- Deconstruct datetime into year, month, & week.
WITH OrdersProducts AS (
SELECT 
    -- Orders
    CAST(O.OrderDate AS DATE) AS OrderDate,
    DATEPART(year, O.OrderDate) AS OrderYear,
    DATEPART(month, O.OrderDate) AS OrderMonth,
    DATEPART(week, O.OrderDate) AS OrderWeek,
    O.ShipName,
    O.ShipCity,

    -- Product
    P.ProductName,

    -- Order Details
    OD.OrderID,
    OD.UnitPrice,
    OD.Quantity,
    OD.Discount,

    ROUND((OD.UnitPrice * (1 - OD.Discount)) * OD.Quantity, 2) AS ExpandedPrice

FROM 
    [Northwinds].[dbo].[Orders] AS O
        LEFT JOIN [Northwinds].[dbo].[Order Details] AS OD
        ON O.OrderID = OD.OrderID
            LEFT JOIN [Northwinds].[dbo].[Products] AS P
            ON OD.ProductID = P.ProductID
)

-- NOTE: When using CTE's (WITH <TABLE> AS ...), as above, only a single SELECT statement can follow. Use comments to enable/disable code below.


-- EXAMPLE QUESTION: What cities (ShipCity) received the greatest number of products (ProductName) in 1997?
-- SELECT TOP(10)
--     ShipName,
--     ProductName,
--     SUM(ExpandedPrice) AS ExpandedPrice,
--     SUM(Quantity) AS ProductQuantity,
--     COUNT(*) AS OrderCount -- Count all rows.
-- FROM OrdersProducts
-- WHERE OrderYear = 1997
-- GROUP BY ShipName, ProductName
-- HAVING COUNT(*) >= 2
-- ORDER BY COUNT(*) DESC;

-- QUESTION #1: Who are the top 10 customers (ShipName) by total sales (ExpandedPrice) by year (OrderYear)?
SELECT *
FROM OrdersProducts;

-- QUESTION #2: What are the best-selling products (ProductName) by total sales (ExpandedPrice) each year (OrderYear)?
-- SELECT *
-- FROM OrdersProducts;
