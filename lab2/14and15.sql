SELECT Passangers, Vagons, LineID
FROM LinkerT
WHERE Vagons > 3
GROUP BY LineID, Passangers, Vagons
ORDER BY Passangers DESC	


SELECT Passangers, Vagons, LineID
FROM LinkerT
WHERE Vagons > 3
GROUP BY LineID, Passangers, Vagons
HAVING Passangers > 400

