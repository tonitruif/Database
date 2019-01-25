CREATE PROCEDURE storedRecurs(@i int)
AS 
BEGIN 
	DECLARE @current int;
	SELECT @current = LineID 
	FROM LinkerT
	WHERE LineID = @current
	If @current < @i
		begin 
		print @current
		set @i = @i-1
		exec storedRecurs @i;
		end;
END;
