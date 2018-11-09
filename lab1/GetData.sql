USE Metro
GO

BULK INSERT StationsT
FROM 'C:\Database\lab1\stations.csv'
WITH
    (
		FIRSTROW = 2,
		DATAFILETYPE = 'char',
		FIELDTERMINATOR = ',',
		ROWTERMINATOR = '0x0A'
    )
GO

BULK INSERT TrainsT
FROM 'C:\Database\lab1\Train.csv'
WITH
    (
		FIRSTROW = 2,
		DATAFILETYPE = 'char',
		FIELDTERMINATOR = ',',
		ROWTERMINATOR = '0x0A'
    )
GO

BULK INSERT LinkerT
FROM 'C:\Database\lab1\out.csv'
WITH
    (
		FIRSTROW = 2,
		DATAFILETYPE = 'char',
		FIELDTERMINATOR = ',',
		ROWTERMINATOR = '0x0A'
    )
GO

BULK INSERT LinesT
FROM 'C:\Database\lab1\lines.csv'
WITH
    (
		FIRSTROW = 2,
		DATAFILETYPE = 'char',
		FIELDTERMINATOR = ',',
		ROWTERMINATOR = '0x0A'
    )
GO
