WITH quer(LineID,Line, Passengers, Vagons) 
AS
	(
		SELECT LinesT.LineID, Line,  Passangers, Vagons
		FROM LinesT JOIN LinkerT ON LinkerT.LineID = LinesT.LineID
	)
SELECT *
FROM quer