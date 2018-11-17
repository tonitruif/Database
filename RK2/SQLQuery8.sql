use Master 

CREATE DATABASE RK2
GO
use RK2 

CREATE TABLE KrugT
	(KrugID int NOT NULL,
	Name nvarchar(20) NOT NULL,
	Year_Found int NOT NULL,
	Descriptio  nvarchar(100) NOT NULL,
	RukID int NOT NULL
	)
GO

CREATE TABLE RukT
	(RukID int NOT NULL, 
	FIO nvarchar(200) NOT NULL, 
	Year_Birth int NOT NULL, 
	Experience int NOT NULL, 
	Phone nvarchar(20) NOT NULL
	)
GO 

CREATE TABLE PosT
	(PosID int NOT NULL,
	FIO nvarchar(200) NOT NULL,
	Year_Birth int NOT NULL, 
	Adress nvarchar(200) NOT NULL, 
	Email nvarchar(50) NOT NULL
	)
GO

CREATE TABLE LinkerT
	(KrugID int NOT NULL,
	PosID int NOT NULL
	)
GO	

ALTER TABLE KrugT 
ADD CONSTRAINT Krug_PK PRIMARY KEY (KrugID)
GO

ALTER TABLE PosT 
ADD CONSTRAINT Pos_PK PRIMARY KEY (PosID)
GO

ALTER TABLE RukT 
ADD CONSTRAINT Ruk_PK PRIMARY KEY (RukID)
GO

ALTER TABLE LinkerT
ADD CONSTRAINT Krug_FK FOREIGN KEY (KrugID)
REFERENCES KrugT (KrugID) 
ON DELETE CASCADE
ON UPDATE CASCADE
GO

ALTER TABLE LinkerT 
ADD CONSTRAINT Pos_FK FOREIGN KEY (PosID) 
REFERENCES PosT (PosID)
ON DELETE CASCADE
ON UPDATE CASCADE
GO

ALTER TABLE KrugT
ADD CONSTRAINT Ruk_FK FOREIGN KEY (RukID) 
REFERENCES RukT (RukID)
ON DELETE CASCADE
ON UPDATE CASCADE 
GO


INSERT RukT (RukID, FIO, Year_Birth, Experience, Phone)
VALUES (1, 'fsd', 1990, 5, '86543')
INSERT RukT (RukID, FIO, Year_Birth, Experience, Phone)
VALUES (2, 'fdadsd', 1995, 5, '8326543')
INSERT RukT (RukID, FIO, Year_Birth, Experience, Phone)
VALUES (3, 'fdssd', 1990, 5, '8654373')
INSERT RukT (RukID, FIO, Year_Birth, Experience, Phone)
VALUES (4, 'fsgfd', 1998, 3, '8657043')
INSERT RukT (RukID, FIO, Year_Birth, Experience, Phone)
VALUES (5, 'fsjhd', 1987, 5, '865-943')
INSERT RukT (RukID, FIO, Year_Birth, Experience, Phone)
VALUES (6, 'fjlsd', 1990, 9, '8659643')
INSERT RukT (RukID, FIO, Year_Birth, Experience, Phone)
VALUES (7, 'fsrsjd', 1955, 5, '8986543')
INSERT RukT (RukID, FIO, Year_Birth, Experience, Phone)
VALUES (8, 'fshjd', 1998, 5, '8698543')
INSERT RukT (RukID, FIO, Year_Birth, Experience, Phone)
VALUES (9, 'fsdj', 1990, 7, '8657343')
INSERT RukT (RukID, FIO, Year_Birth, Experience, Phone)
VALUES (10, 'fsjhd', 1990, 5, '8627543')



INSERT KrugT (KrugID, Name, Year_Found, Descriptio, RukID)
VALUES (1, 'ABC', 2005, 'KP', 1)
INSERT KrugT (KrugID, Name, Year_Found, Descriptio, RukID)
VALUES (2, 'dfABC', 2005, 'KP', 1)
INSERT KrugT (KrugID, Name, Year_Found, Descriptio, RukID)
VALUES (3, 'AdfBC', 2005, 'KP', 2)
INSERT KrugT (KrugID, Name, Year_Found, Descriptio, RukID)
VALUES (4, 'AfhBC', 2005, 'KP', 3)
INSERT KrugT (KrugID, Name, Year_Found, Descriptio, RukID)
VALUES (5, 'ABghC', 2005, 'KP', 3)
INSERT KrugT (KrugID, Name, Year_Found, Descriptio, RukID)
VALUES (6, 'ABjhC', 2005, 'KP', 4)
INSERT KrugT (KrugID, Name, Year_Found, Descriptio, RukID)
VALUES (7, 'AjhBC', 2005, 'KP', 5)
INSERT KrugT (KrugID, Name, Year_Found, Descriptio, RukID)
VALUES (8, 'ABCjh', 2005, 'KP', 6)
INSERT KrugT (KrugID, Name, Year_Found, Descriptio, RukID)
VALUES (9, 'ABhjC', 2005, 'KP', 7)
INSERT KrugT (KrugID, Name, Year_Found, Descriptio, RukID)
VALUES (10, 'ABhjC', 2005, 'KP', 8)
INSERT KrugT (KrugID, Name, Year_Found, Descriptio, RukID)
VALUES (11, 'AghBC', 2005, 'KP', 9)
INSERT KrugT (KrugID, Name, Year_Found, Descriptio, RukID)
VALUES (12, 'A56BC', 2005, 'KP', 10)

INSERT PosT (PosID, FIO, Year_Birth, Adress, Email)
VALUES (1, 'AfdBC', 2005, 'KgfP', 'gG@gmail.com')
INSERT PosT (PosID, FIO, Year_Birth, Adress, Email)
VALUES (2, 'AfddaBC', 2005, 'KsdP', 'dsG@gmail.com')
INSERT PosT (PosID, FIO, Year_Birth, Adress, Email)
VALUES (3, 'AadfdBC', 2006, 'fsfKP', 'gsAGFDBG@gmail.com')
INSERT PosT (PosID, FIO, Year_Birth, Adress, Email)
VALUES (4, 'AfdBGFSC', 1990, 'KSDP', 'FSgG@gmail.com')
INSERT PosT (PosID, FIO, Year_Birth, Adress, Email)
VALUES (5, 'AfdDFAFDBC', 2005, 'KdfsP', 'gGgsh@gmail.com')
INSERT PosT (PosID, FIO, Year_Birth, Adress, Email)
VALUES (6, 'AfdDFFDFBC', 2004, 'KsfaP', 'gasgwgG@gmail.com')
INSERT PosT (PosID, FIO, Year_Birth, Adress, Email)
VALUES (7, 'AfdBDAC', 1990, 'KsdadsaP', 'gGdsf@gmail.com')
INSERT PosT (PosID, FIO, Year_Birth, Adress, Email)
VALUES (8, 'AfDFSDSFdBC', 1995, 'KfsdP', 'gdsgG@gmail.com')
INSERT PosT (PosID, FIO, Year_Birth, Adress, Email)
VALUES (9, 'AfdBdfC', 2008, 'KsgP', 'gsfsdgsdG@gmail.com')
INSERT PosT (PosID, FIO, Year_Birth, Adress, Email)
VALUES (10, 'AfdBdfdsC', 2009, 'KdsfP', 'ggshG@gmail.com')

INSERT LinkerT (KrugID, PosID)
VALUES (1,1)
INSERT LinkerT (KrugID, PosID)
VALUES (1,2)
INSERT LinkerT (KrugID, PosID)
VALUES (1,3)
INSERT LinkerT (KrugID, PosID)
VALUES (1,4)
INSERT LinkerT (KrugID, PosID)
VALUES (1,5)
INSERT LinkerT (KrugID, PosID)
VALUES (2,2)
INSERT LinkerT (KrugID, PosID)
VALUES (3,2)
INSERT LinkerT (KrugID, PosID)
VALUES (1,6)
INSERT LinkerT (KrugID, PosID)
VALUES (1,7)
INSERT LinkerT (KrugID, PosID)
VALUES (3,6)
INSERT LinkerT (KrugID, PosID)
VALUES (5,8)
INSERT LinkerT (KrugID, PosID)
VALUES (9,3)
INSERT LinkerT (KrugID, PosID)
VALUES (4,6)
INSERT LinkerT (KrugID, PosID)
VALUES (5,6)

SELECT Adress,
	CASE Adress
	WHEN 'KsdP' THEN 'JK'
	ELSE 'GHJ'
	END AS 'AdressD'
FROM PosT
GO

SELECT RukID
FROM RukT
GROUP BY RukID
HAVING AVG(Year_Birth) > 
(	SELECT AVG(Year_Birth) 
	FROM RukT
	)
	GO