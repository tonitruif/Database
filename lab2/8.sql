SELECT *,
(	SELECT AVG(Passangers)
	FROM LinkerT
) AS AVPAS
FROM LinkerT JOIN TrainsT ON LinkerT.LineID = TrainsT.LineID 
WHERE Passangers > 500

