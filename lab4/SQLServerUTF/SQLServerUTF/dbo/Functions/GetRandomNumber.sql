CREATE FUNCTION [dbo].[GetRandomNumber]
( )
RETURNS INT
AS
 EXTERNAL NAME [HandWrittenUDF].[HandWrittenUDF.UserDefinedFunctions].[GetRandomNumber]

