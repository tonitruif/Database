SELECT  *,
	CASE StatusS 
	WHEN '��������' THEN '����� ��������' 
	ELSE '��������' 
	END AS '�������'
FROM StationsT 