CREATE FUNCTION countpass(@LineID int)
RETURNS INT
AS
BEGIN
	DECLARE @count int;
	SELECT @count = count(Passangers)
	FROM LinkerT
	WHERE Passangers > 400 AND LineID=@LineID
	RETURN @count;
END;
GO

print(dbo.countpass(2))
GO

CREATE FUNCTION tablefunc()
RETURNS TABLE
AS
RETURN
(
	SELECT LineID, Passangers, Vagons
	from LinkerT
	where Passangers > 400
)
GO

select * 
from tablefunc()
GO


CREATE FUNCTION tablemult()
RETURNS @Res TABLE
(
	LineID int, 
	Train nvarchar(30),
	Passangers int	
)
AS
BEGIN
	INSERT INTO @Res
	SELECT LinkerT.LineID, Train, Passangers
	FROM LinkerT JOIN TrainsT ON TrainsT.LineID = LinkerT.LineID 
	WHERE Passangers > 300 
RETURN 
END
GO

SELECT * 
FROM tablemult()
GO

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
GO

print(dbo.recurs(1080))