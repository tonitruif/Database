UPDATE TrainsT
SET MaxPassengers = 
(
	SELECT Min(Passangers)
	FROM LinkerT
)
WHERE LineID = 2