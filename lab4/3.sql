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

CREATE FUNCTION NameToAscii (@InputName NVARCHAR(4000))
RETURNS TABLE
(
	charpart NCHAR,
	intpart INT
)
AS
EXTERNAL NAME
SqlServerUDF.[SqlServerTVF.UserDefinedFunctions].NameToAscii
GO

SELECT * FROM dbo.NameToAscii ('Test string' )
GO