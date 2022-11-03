-- Show date range.
SELECT
    MIN([DATE]) AS min_date,
    MAX([DATE]) AS max_date
FROM
    [workspace].[dbo].[FRED - Unemployment];
    

-- Clear moving average table.
-- TRUNCATE TABLE [workspace].[dbo].[FRED_unemployment_moving_average];
DROP TABLE [workspace].[dbo].[FRED_unemployment_moving_average];


-- Use 5-month moving window to generate time-series average & standard deviation unemployment rate.
SELECT
    [DATE],
    [UNRATE],
    AVG([UNRATE]) OVER (
        ORDER BY [DATE]
        ROWS BETWEEN 2 PRECEDING AND 7 FOLLOWING) AS [AverageUnrateFiveYearMoving],
    STDEV([UNRATE]) OVER (
        ORDER BY [DATE]
        ROWS BETWEEN 2 PRECEDING AND 7 FOLLOWING) AS [StdDevUnrateFiveYearsMoving]

INTO [FRED_unemployment_moving_average]
    
FROM 
    [workspace].[dbo].[FRED - Unemployment];


-- Clear dateparts table.
-- TRUNCATE TABLE [workspace].[dbo].[FRED_unemployment_month_year_dateparts];
DROP TABLE [workspace].[dbo].[FRED_unemployment_month_year_dateparts];


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
