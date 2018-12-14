CREATE TABLE nLines
( 
	LineID int, 
	Line nvarchar(50)
) 
GO


DECLARE @idoc int
DECLARE @doc xml
SELECT @doc = c FROM OPENROWSET(BULK 'C:\Database\lab5\try1.xml', SINGLE_BLOB) AS TEMP(c)
EXEC sp_xml_preparedocument @idoc OUTPUT, @doc
 
 
--INSERT INTO nLines(LineID, Line) 
SELECT LineID, Line
FROM OPENXML (@idoc, 'Lines/row',2)
WITH (LineID int, Line nvarchar(50))
GO

SELECT *
FROM nLines