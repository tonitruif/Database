INSERT TrainsT (BuildDate, LineID, MaxPassengers, MaxVagon, Train, TrainID)
SELECT (
	SELECT AVG(BuildDate)
	FROM TrainsT
	),2, MaxPassengers, 40, 'TG',50
FROM TrainsT
WHERE MaxPassengers = 1074

DELETE TrainsT
WHERE TrainID = 50


