SELECT LineID, AVG(Passangers) AS AVER
INTO #THISDAY
FROM LinkerT
GROUP BY LineID

SELECT *
FROM #THISDAY
