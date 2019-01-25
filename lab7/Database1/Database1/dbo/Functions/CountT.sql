CREATE AGGREGATE [dbo].[CountT](@instr INT NULL)
    RETURNS INT
    EXTERNAL NAME [SqlServerUDF].[SqlAggregate1];

