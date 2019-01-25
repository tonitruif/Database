CREATE PROCEDURE [dbo].[GetPassengers]
@Pass INT NULL
AS EXTERNAL NAME [SqlServerUDF].[StoredProcedures].[GetPassengers]

