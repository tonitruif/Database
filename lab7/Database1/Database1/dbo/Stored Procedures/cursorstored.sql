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
