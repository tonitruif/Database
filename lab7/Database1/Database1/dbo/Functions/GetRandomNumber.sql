CREATE FUNCTION [dbo].[GetRandomNumber]
( )
RETURNS INT
AS
 EXTERNAL NAME [SqlServerUDF].[SqlServerUDF].[GetRandomNumber]

