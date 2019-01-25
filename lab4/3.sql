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
	Vagons INT,
	Pass INT
)
AS
EXTERNAL NAME
SqlServerUDF.UserDefinedFunctions.getPass
GO


select Vagons, Passangers 
                from LinkerT
                where Passangers > 500


DROP FUNCTION AvPass
GO

SELECT * FROM dbo.AvPass()
GO