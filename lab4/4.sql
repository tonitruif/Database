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

Create Procedure GetConcatenatedNames ( @Role NVARCHAR(4000) )
As
External Name
SqlServerUDF.[StoredProcedures].GetConcatenatedNames
GO

Exec dbo.GetConcatenatedNames 'Reviewer'
GO