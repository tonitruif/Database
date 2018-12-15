sp_configure 'show advanced options', 1
GO
RECONFIGURE
GO
sp_configure 'clr enabled', 1
GO
RECONFIGURE
GO

--DROP ASSEMBLY SqlServerUDF

ALTER ASSEMBLY SqlServerUDF
FROM 'C:\Database\lab4\SqlServerUDF\SqlServerUDF\bin\Debug\SqlServerUDF.dll'

CREATE AGGREGATE CountT( @instr int )
RETURNS INT
EXTERNAL NAME
SqlServerUDF.[SqlAggregate1]
GO

SELECT dbo.CountT (LinkerT.Passangers) AS Pass
FROM LinkerT
GO