CREATE FUNCTION recurs(@i int)
RETURNS int 
AS 
BEGIN 
	DECLARE @count int; 
	SELECT @count = MaxPassengers
	FROM TrainsT
	
	If @count > @i 
		set @i = dbo.recurs(@count)
	return @count
END;
