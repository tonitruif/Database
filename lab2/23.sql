CREATE TABLE BuildStations
(
	StationName nvarchar(50),
	BuildYear int,
	Train nvarchar(50),
	StationID int,
	CONSTRAINT PK_BuildStationsID PRIMARY KEY CLUSTERED (StationID  ASC)
)
GO

--DROP TABLE BuildStations
--GO

INSERT INTO BuildStations VALUES ('asf', 2020, 'dsf', 1)
GO
INSERT INTO BuildStations VALUES ('asf', 2020, NULL, 2)
GO

WITH WPassengers(StationId) 
AS
( 
	SELECT StationsT.StationId
	FROM StationsT
	WHERE StationID BETWEEN 10 AND 2
	UNION ALL
	SELECT BuildStations.StationId
	FROM StationsT JOIN BuildStations ON StationsT.StationID = BuildStations.StationID
	WHERE BuildStations.BuildYear > 2019
)
SELECT * 
FROM  WPassengers