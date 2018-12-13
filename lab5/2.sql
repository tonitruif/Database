DECLARE @idoc int
DECLARE @doc xml
SELECT @doc = c FROM OPENROWSET(BULK 'C:\Database\lab5\try.xml', 
                                SINGLE_BLOB) AS TEMP(c)
EXEC sp_xml_preparedocument @idoc OUTPUT, @doc
  
SELECT    *  
FROM       OPENXML (@idoc, '/ROOT/TrainsT',1)  
WITH (LineID  int,  
                  Line nvarchar(100),
				  StatusS nvarchar(20)); 

