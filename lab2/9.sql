SELECT  *,
	CASE StatusS 
	WHEN '��������' THEN '����� ��������' 
	WHEN '��������!' THEN '����� ��������!' 
	ELSE '��������' 
	END AS '�������'
FROM StationsT 