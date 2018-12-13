CREATE PROCEDURE param @count int
AS
SELECT Train, MaxPassengers
FROM TrainsT
WHERE MaxPassengers > @count

EXEC param 800
GO

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
GO

exec storedRecurs 4
GO

CREATE PROCEDURE cursorstored @i int
AS
BEGIN
	DECLARE  @pass int, @train nvarchar(40)
	DECLARE cur CURSOR FOR
		SELECT  Train, MaxPassengers 
		FROM TrainsT
		WHERE LineID > @i;
	OPEN cur;
	FETCH cur INTO @train, @pass;
	WHILE @@FETCH_STATUS = 0 
	BEGIN 
		print ' ' + @train + ' ' + str(@pass);
		fetch cur into @train, @pass
	END; 
	CLOSE cur;
	DEALLOCATE cur;
END;
GO

EXEC cursorstored 5
GO 

SELECT *
FROM sys.objects
GO

CREATE PROCEDURE metadata @tablename nvarchar(50)
AS 
SELECT *
FROM sys.objects
WHERE name = @tablename
GO

EXEC metadata TrainsT