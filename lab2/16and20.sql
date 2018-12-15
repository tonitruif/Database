INSERT StationsT (Station, Admarea, District, StatusS, StationID)
VALUES ('Donut', 'kl', 'fdfsfw', '6 pieces', 999)

SELECT *
FROM StationsT
WHERE StationID = 999

UPDATE StationsT
SET StationID = 888
WHERE StationID = 999

SELECT *
FROM StationsT
WHERE StationID = 888

DELETE StationsT
WHERE StationID = 888