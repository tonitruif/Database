use Metro 

SELECT *
FROM (LinkerT JOIN LinesT ON LinesT.LineID = LinkerT.LineID) 
WHERE StatusS LIKE '%���������%'
GO