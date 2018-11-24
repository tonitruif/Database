USE Metro 
GO

CREATE TABLE StationsT
	(Station nvarchar(100) NOT NULL,
	Admarea nvarchar(100) NOT NULL,
	District nvarchar(100) NOT NULL,
	StatusS nvarchar (40) NOT NULL,
	StationID int NOT NULL)

--BuildDate;LineID;MaxPassengers;MaxVagon;Train
--1993;1;1054;12;Ока
CREATE TABLE TrainsT
	(BuildDate int NOT NULL,
	LineID int NOT NULL, 
	MaxPassengers int NOT NULL,
	MaxVagon int NOT NULL,
	Train nvarchar(20) NOT NULL,
	TrainID int NOT NULL,)

--Line;LineID;Passangers;Vagons
--Сокольническая линия;1;122;2
CREATE TABLE LinkerT
	(StationID int NOT NULL,
	LineID int NOT NULL,
	Vagons int NOT NULL,
	Passangers int NOT NULL)


--Line;LineID;global_id;Status;
--Сокольническая линия;1;62921363;действует;

CREATE TABLE LinesT
	(Line nvarchar(100) NOT NULL,
	LineID int NOT NULL,
	StatusS nvarchar(25) NOT NULL)
GO