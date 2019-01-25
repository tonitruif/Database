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


CREATE Procedure  GetPassengers ( @Pass int )
As
External Name
SqlServerUDF.[StoredProcedures].GetPassengers
GO

DROP PROCEDURE GetPassengers
GO
Exec dbo.GetPassengers 1000
GO