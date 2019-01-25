UPDATE TrainsT
SET MaxPassengers = 
(
	SELECT Max(Passangers)
	FROM LinkerT
)
WHERE LineID = 3

SELECT *
FROM TrainsT