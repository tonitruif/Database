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

CREATE TRIGGER insttrigger   
ON TrainsT INSTEAD OF INSERT
AS
BEGIN 
	SELECT * from inserted;
	INSERT LinkerT(StationID,LineID,Vagons,Passangers)
	VALUES(NULL,NULL,NULL,NULL)--исправить запрос таблица инсерт
END;
Go

INSERT TrainsT (BuildDate, LineID, MaxPassengers, MaxVagon, Train, TrainID) 
VALUES (1234, 2, 23, 23, 'asf', 45)
GO

DELETE FROM TrainsT WHERE BuildDate = 1234 --триггер на создание таблицы