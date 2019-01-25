CREATE TRIGGER afttrigger 
ON TrainsT AFTER INSERT
AS
BEGIN 
	SELECT * from inserted;
END;
Go

INSERT TrainsT (BuildDate, LineID, MaxPassengers, MaxVagon, Train, TrainID) 
VALUES (1234, 2, 23, 23, 'asf', 45)
GO

INSERT LinesT (Line, LineID, StatusS) 
VALUES ('dfw', 1060, 'asf')
GO

SELECT * 
FROM LinesT
WHERE LineID = 1060
GO

ALTER TRIGGER insttrigger   
ON TrainsT INSTEAD OF INSERT
AS
BEGIN 
	--SELECT * from inserted;
	DELETE  
	FROM LinesT
	WHERE LineID = 1060
END;
Go

INSERT TrainsT (BuildDate, LineID, MaxPassengers, MaxVagon, Train, TrainID) 
VALUES (1234, 2, 23, 23, 'asf', 45)
GO

DELETE FROM TrainsT WHERE BuildDate = 1234 