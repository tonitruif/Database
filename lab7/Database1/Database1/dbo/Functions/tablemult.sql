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
