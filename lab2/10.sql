SELECT *,
CASE
	WHEN Passangers < 300 THEN 'Malo'
	WHEN Passangers < 600 THEN 'Sredne'
	WHEN Passangers < 800 THEN 'Mnogo'
	ELSE 'Ochen mnogp'
END AS 'Nagruzka'
FROM LinkerT