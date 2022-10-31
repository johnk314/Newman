-- Show current database.
-- SELECT DB_NAME() AS current_database;

-- Change database to workspace.
-- USE workspace;

-- Show schemas in workspace database.
-- SELECT 
--     s.name AS schema_name, 
--     s.schema_id,
--     u.name AS schema_owner
-- FROM sys.schemas s
--     INNER JOIN sys.sysusers u
--         ON u.uid = s.principal_id
-- ORDER BY
--     s.name

-- Remove a table.
-- DROP TABLE
--     workspace.dbo.Persons;

