SELECT J.LineID, Passangers, Vagons
FROM	TrainsT JOIN (
		SELECT TOP 10 Passangers, Vagons, LineID
		FROM LinkerT
		WHERE Vagons > 3
		GROUP BY LineID, Passangers, Vagons
		ORDER BY Passangers DESC	
	) AS J ON J.LineID = TrainsT.LineID



SELECT *
FROM TrainsT JOIN LinkerT ON LinkerT.LineID = TrainsT.LineID
WHERE Passangers > 
	(
	SELECT AVG(Passangers) 
	FROM 
		(
		SELECT Passangers
		FROM TrainsT JOIN LinkerT ON LinkerT.LineID = TrainsT.LineID
		WHERE Passangers > 800
		) as a
	)


