ALTER DATABASE Metro SET TRUSTWORTHY ON; 
EXEC sp_configure 'clr enabled' , '1'; 
RECONFIGURE; 

CREATE ASSEMBLY HandWrittenUDF 
FROM 
'C:\Database\lab4\UserDef\UserDef\bin\Debug\UserDef.dll' 
GO 


CREATE FUNCTION GetRandomNumber () 
RETURNS INT 
AS 
EXTERNAL NAME 
HandWrittenUDF.[HandWrittenUDF.UserDefinedFunctions].GetRandomNumber 
GO 

SELECT dbo.GetRandomNumber() AS RandomNumbe 
GO
