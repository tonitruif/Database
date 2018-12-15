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

CREATE TRIGGER triq
ON LinkerT
INSTEAD OF INSERT
AS
EXTERNAL NAME
SqlServerUDF.[Triggers].SqlTrigger1
GO

INSERT LinkerT(StationID, LineID, Vagons, Passengers) 
VALUES(1999,432,23445,2345)

SELECT * 
FROM LinkerT 
WHERE StationID = 1999