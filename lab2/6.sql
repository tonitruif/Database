use Metro 

SELECT * 
FROM TrainsT
WHERE MaxPassengers > ALL
(
	SELECT MaxPassengers
	FROM TrainsT
	WHERE Train = 'ќка'
)