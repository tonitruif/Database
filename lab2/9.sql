SELECT  *,
	CASE StatusS 
	WHEN 'Строится' THEN 'Скоро открытие' 
	ELSE 'Работает' 
	END AS 'Стройки'
FROM StationsT 