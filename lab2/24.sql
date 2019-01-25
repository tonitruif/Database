SELECT StationsT.StationID, StationsT.Station, LinkerT.Passangers, LinkerT.LineID, 
AVG(LinkerT.Passangers) OVER(PARTITION BY StationsT.StationID, StationsT.Station) AS AVGPassangers,
MIN(LinkerT.Passangers) OVER(PARTITION BY StationsT.StationID, StationsT.Station) AS MINPassangers,
MAX(LinkerT.Passangers) OVER(PARTITION BY StationsT.StationID, StationsT.Station) AS MAXPassangers
FROM StationsT JOIN LinkerT ON StationsT.StationID = LinkerT.StationID