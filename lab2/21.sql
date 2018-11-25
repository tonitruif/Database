INSERT TrainsT (BuildDate, LineID, MaxPassengers, MaxVagon, Train, TrainID)
VALUES (1987,2, 1074, 40, 'TG',50)

SELECT *
FROM TrainsT
WHERE Train = 'TG'

DELETE FROM TrainsT
WHERE LineID IN
(
	SELECT LineID
	FROM TrainsT 
	WHERE MaxPassengers = 1074
)