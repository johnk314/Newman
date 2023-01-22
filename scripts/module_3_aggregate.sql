-- Aggregate 
SELECT 
    -- O.*,
    CAST(O.OrderDate AS DATE) AS OrderDate,
    DATEPART(year, O.OrderDate) AS OrderYear,
    DATEPART(month, O.OrderDate) AS OrderMonth,
    O.Freight,
    O.ShipName,
    O.ShipCity,

    P.ProductName,

    OD.OrderID,
    OD.UnitPrice,
    OD.Quantity,
    OD.Discount,

    ROUND((OD.UnitPrice * (1-OD.Discount))*OD.Quantity, 2) AS ExpandedPrice

FROM 
    [Northwind].[dbo].[Orders] AS O
        LEFT JOIN [Northwind].[dbo].[Order Details] AS OD
        ON O.OrderID = OD.OrderID
            LEFT JOIN [Northwind].[dbo].[Products] AS P
            ON OD.ProductID = P.ProductID

ORDER BY OrderDate DESC;