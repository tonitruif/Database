CREATE PROCEDURE metadata @tablename nvarchar(50)
AS 
SELECT *
FROM sys.objects
WHERE name = @tablename
