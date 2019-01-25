CREATE DATABASE RK3
GO 

use RK3
GO 

CREATE TABLE FilialT
(
	FilialID int,
	NameF nvarchar(50),
	Adress nvarchar(50),
	Phone nvarchar(50)
)

CREATE TABLE SotrT
(
	SotrID int,
	Fio nvarchar(50), 
	Rozhd DATETIME2, 
	Otdel nvarchar(50), 
	FilialID int
)

INSERT FilialT(FilialID,NameF, Adress, Phone)
VALUES(1,'MOS', 'gercen', '12425902' )

INSERT FilialT(FilialID,NameF, Adress, Phone)
VALUES(2,'NOVOSIB', 'Proletars', '1243425902' )
INSERT FilialT(FilialID,NameF, Adress, Phone)
VALUES(3,'SARATOV', 'SHUHOVA', '12425342902' )
INSERT FilialT(FilialID,NameF, Adress, Phone)
VALUES(4,'TOMSK', 'SHEPKIN', '11232425902' )

INSERT SotrT(SotrID, Fio, Rozhd, Otdel, FilialID)
VALUES (1, 'Idsad', '25-09-1990', 'IT', 1)

INSERT SotrT(SotrID, Fio, Rozhd, Otdel, FilialID)
VALUES (2, 'Ihy', '12-11-1987', 'buh', 2)

SELECT *
FROM SotrT AS S JOIN FilialT AS F ON S.FilialID = F.FilialID
WHERE CHARINDEX('7', f.Phone) = 0

SELECT * 
FROM FilialT AS F JOIN 
(	SELECT * 
	FROM SotrT
	WHERE DATEDIFF(year,SYSDATETIME(), Rozhd) = 26 
) AS S ON s.FilialID = f.FilialID 
WHERE COUNT(S.FilialID) > 6 AND COUNT(S.FilialID) < 15

SELECT FilialID
FROM FilialT
GROUP By FilialID

SELECT COUNT(FilialID) 
FROM FilialT
WHERE Adress IN (SELECT value FROM STRING_SPLIT(FilialT.Adress, ','));