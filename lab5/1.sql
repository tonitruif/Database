SELECT Train, LinesT.LineID, Line, StatusS
FROM TrainsT JOIN LinesT ON LinesT.LineID =TrainsT.LineID
FOR XML AUTO

SELECT Train, LinesT.LineID, Line, StatusS
FROM TrainsT JOIN LinesT ON LinesT.LineID =TrainsT.LineID
FOR XML RAW

SELECT Train, LinesT.LineID, Line, StatusS
FROM TrainsT JOIN LinesT ON LinesT.LineID =TrainsT.LineID
FOR XML PATH

SELECT Train, BuildDate, TrainID
FROM TrainsT 
FOR XML PATH

	
SELECT
        1              AS tag,
        NULL           AS parent,
        LineID         AS [Line!1!ID!element],
        Line		   AS [Line!1!LineName!element]
FROM LinesT
WHERE LineID < 8
FOR XML EXPLICIT, ROOT('Line'); 

SELECT LineID, Line
FROM LinesT
FOR XML PATH, ROOT ('Lines')