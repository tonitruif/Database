USE Metro 
GO

CREATE TABLE StationsT
	(Station nvarchar(100) NOT NULL,
	Line nvarchar(100) NOT NULL,
	Admarea nvarchar(100) NOT NULL,
	global_id int NOT NULL,
	District nvarchar(100) NOT NULL,
	Status nvarchar (40) NOT NULL,
	Id int NOT NULL)
GO
--BuildDate;LineID;MaxPassengers;MaxVagon;Train
--1993;1;1054;12;Ока
CREATE TABLE TrainsT
	(BuildDate int NOT NULL,
	LineID int NOT NULL, 
	MaxPassengers int NOT NULL,
	MaxVagon int NOT NULL,
	Train nvarchar(15) NOT NULL)
GO


--Line;LineID;Passangers;Vagons
--Сокольническая линия;1;122;2
CREATE TABLE LinkerT
	(Line nvarchar(100) NOT NULL,
	LineID int NOT NULL, 
	Passengers int NOT NULL,
	Vagons int NOT NULL)
GO

--Line;LineID;global_id;Status;
--Сокольническая линия;1;62921363;действует;

CREATE TABLE LinesT
	(Line nvarchar(100) NOT NULL,
	LineID int NOT NULL,
	global_id int NOT NULL,
	Status nvarchar(25) NOT NULL)
GO