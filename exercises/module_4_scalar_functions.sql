-- QUESTION #1: Using the Order Details table, how would you calculate the expanded price of an order?
-- HINT: Expanded Price = [Unit Price * (1 - Discount)] * Quantity
-- HINT: Use the ERD provided.
-- HINT: Give the calculated field an alias. Ex: SUM(UnitPrice) AS TotalPrice or AVG(Discount) AS AvgDiscount.
SELECT 
    OD.OrderID,
    OD.UnitPrice,
    OD.Quantity,
    OD.Discount

    -- Calculate ExpandedPrice here.

FROM [Northwinds].[dbo].[Order Details] AS OD;


-- QUESTION #2: Write a query that includes the fields & calculations from Order Details in QUESTION #1 but also has OrderDate, ShipName, ShipCity, & Product Name attributes for the ExpandedPrice.
-- HINT: Use the ERD provided to determine which tables should be included in the query.
-- HINT: Start with Orders & LEFT JOIN the Order Details & Products tables separately using the appropriate keys.
-- HINT: Give each table an alias. Ex: FROM [Order Details] AS OD.

SELECT 
    OD.OrderID,
    OD.UnitPrice,
    OD.Quantity,
    OD.Discount

    -- Calculate ExpandedPrice here.

FROM [Northwinds].[dbo].[Order Details] AS OD
    -- LEFT JOIN additional tables here.
