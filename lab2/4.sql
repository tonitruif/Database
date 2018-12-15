use Metro 

SELECT *
FROM LinkerT JOIN TrainsT ON TrainsT.LineID = LinkerT.LineID
WHERE Vagons IN
(
	SELECT Vagons
	FROM LinkerT
	WHERE Vagons > 5
)
GO