-- QUESTION #1: Write a query to join & denormalize/flatten Product, Category, & Supplier tables. Create a view of the query named EmployeesOrdersCustomers.
-- HINT: Once created successfully, you'll see the view to the left under Connections > Servers > localhost > Databases > Northwind > Views. Try refreshing the views folder.
-- HINT: If you need to delete the view to start over, un-comment the DROP VIEW statement below.
-- HINT: Once the view has been created, comment out that code & move on to QUESTION #2.

CREATE VIEW EmployeesOrdersCustomers AS 
    SELECT 
        *
    FROM 
        [Northwind].[dbo].[Orders] AS O
        -- LEFT JOIN Customers AS C
        -- LEFT JOIN Employees AS E

-- DROP VIEW IF EXISTS EmployeesOrdersCustomers;


-- QUESTION #2: Which suppliers have the most Products in Northwind's catalog?
-- HINT: We're interested in the number of Orders, not the dollar-value.
-- HINT: We're interest in total Orders, not by year, etc.

-- SELECT *
-- FROM EmployeesOrdersCustomers;



-- QUESTION #3: Which categories have more products in 1998 than 1997?
-- HINT: Try using EmployeesOrdersCustomers in a sub-query.

-- SELECT *
-- FROM EmployeesOrdersCustomers;
