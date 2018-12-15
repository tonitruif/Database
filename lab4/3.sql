sp_configure 'show advanced options', 1
GO
RECONFIGURE
GO
sp_configure 'clr enabled', 1
GO
RECONFIGURE
GO

ALTER ASSEMBLY SqlServerUDF
FROM 'C:\Database\lab4\SqlServerUDF\SqlServerUDF\bin\Debug\SqlServerUDF.dll'
GO

CREATE FUNCTION AvPass()
RETURNS TABLE
(
	vagon int,
	passangers int
)
AS
EXTERNAL NAME
SqlServerUDF.[UserDefinedFunctions].fillPass
GO

SELECT * FROM dbo.AvPass()
GO