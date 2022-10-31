-- Show date range.
SELECT
    MIN([DATE]) AS min_date,
    MAX([DATE]) AS max_date
FROM
    [workspace].[dbo].[FRED - Unemployment];
    

-- Clear moving average table.
TRUNCATE TABLE [workspace].[dbo].[FRED_unemployment_moving_average];

-- Calculate the moving 5-month average unemployment rate.
SELECT
    [DATE],
    [UNRATE],
    AVG([UNRATE]) OVER (
        ORDER BY [DATE]
        ROWS BETWEEN 2 PRECEDING AND 7 FOLLOWING) AS [AverageUnrateFiveYearMoving]

INTO [FRED_unemployment_moving_average]
    
FROM 
    [workspace].[dbo].[FRED - Unemployment];


-- Clear dateparts table.
TRUNCATE TABLE [workspace].[dbo].[FRED_unemployment_month_year_dateparts];


-- Show unemployment rate by month & year.
SELECT
    DATEPART(year, [DATE]) AS YEAR,
    DATEPART(month, [DATE]) AS MONTH,
    [UNRATE]

INTO [FRED_unemployment_month_year_dateparts]

FROM
    [workspace].[dbo].[FRED - Unemployment]

WHERE
    DATEPART(year, [DATE]) >= 1950;
