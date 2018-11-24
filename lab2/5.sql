use Metro 

SELECT *
FROM (LinkerT JOIN TrainsT ON TrainsT.LineID = LinkerT.LineID) 
WHERE EXISTS
(
	SELECT TrainsT.Train
	FROM TrainsT 
	WHERE Train IS NULL
)
GO