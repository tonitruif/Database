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
WHERE LinkerT.LineID IN
	(	
		SELECT LineID
		FROM TrainsT 
		GROUP BY LineID
		HAVING SUM(MaxPassengers) < 
		(
			SELECT MAX(MP) 
			FROM 
				(
					SELECT SUM(MaxPassengers) as MP
					FROM TrainsT 
					WHERE MaxPassengers > 200
					GROUP BY LineID
				) as a
		) 
	)


