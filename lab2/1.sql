  use Metro 

SELECT Train, MaxVagon, MaxPassengers 
FROM TrainsT 
WHERE (MaxPassengers > 1100) AND Train = 'ќка'
GO