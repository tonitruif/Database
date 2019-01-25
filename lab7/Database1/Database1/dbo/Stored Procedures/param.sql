CREATE PROCEDURE param @count int
AS
SELECT Train, MaxPassengers
FROM TrainsT
WHERE MaxPassengers > @count