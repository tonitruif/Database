--USE master
--GO

--CREATE DATABASE RK2
--GO

use RK2
GO

--DROP TABLE RabotaT

--DROP TABLE IspoT
--DROP TABLE ZakazhT

CREATE TABLE RabotaT
	(RabotaID int PRIMARY KEY,
	NameRabota nvarchar (40),
	Trydovatr nvarchar (50), 
	Oboryd nvarchar(50),
	)

CREATE TABLE IspoT
	(IspoID int PRIMARY KEY, 
	Fio nvarchar (50),
	GodRozhd int,
	stazh int, 
	phone nvarchar (20))


CREATE TABLE ZakazhT
	(
	ZakazhID int PRIMARY KEY, 
	Fio nvarchar (20),
	GodRozhd int, 
	Stazh int, 
	phone nvarchar(20)
	)

CREATE TABLE LinkRI
	(
	RabotaID int,
	IspoID int
	)

CREATE TABLE LinkRZ
	(
	RabotaID int,
	ZakazhID int
	)

CREATE TABLE LinkZI
	(
	ZakazhID int,
	IspoID int
	)


ALTER TABLE LinkZI
	ADD FOREIGN KEY (ZakazhID) 
	REFERENCES ZakazhT (ZakazhID)
	ON DELETE CASCADE
	ON UPDATE CASCADE;
GO

ALTER TABLE LinkRZ
	ADD FOREIGN KEY (ZakazhID) 
	REFERENCES ZakazhT (ZakazhID)
	ON DELETE CASCADE
	ON UPDATE CASCADE;
GO

ALTER TABLE LinkZI
	ADD FOREIGN KEY (IspoID) 
	REFERENCES IspoT (IspoID)
	ON DELETE CASCADE
	ON UPDATE CASCADE;
GO

ALTER TABLE LinkRI
	ADD FOREIGN KEY (IspoID) 
	REFERENCES IspoT (IspoID)
	ON DELETE CASCADE
	ON UPDATE CASCADE;
GO

ALTER TABLE LinkRI
	ADD FOREIGN KEY (RabotaID) 
	REFERENCES RabotaT (RabotaID)
	ON DELETE CASCADE
	ON UPDATE CASCADE;
GO

ALTER TABLE LinkRZ
	ADD FOREIGN KEY (RabotaID) 
	REFERENCES RabotaT (RabotaID)
	ON DELETE CASCADE
	ON UPDATE CASCADE;
GO

INSERT RabotaT(RabotaID, NameRabota, Trydovatr, Oboryd)
VALUES (1,'sdf', 'asf','shas')
INSERT RabotaT(RabotaID, NameRabota, Trydovatr, Oboryd)
VALUES (2,'sdsdgf', 'asf','ssah')
INSERT RabotaT(RabotaID, NameRabota, Trydovatr, Oboryd)
VALUES (3,'sdasdf', 'assdgf','sasdh')
INSERT RabotaT(RabotaID, NameRabota, Trydovatr, Oboryd)
VALUES (4,'sdsdgf', 'asf','ssah')
INSERT RabotaT(RabotaID, NameRabota, Trydovatr, Oboryd)
VALUES (5,'sdasdf', 'assdgf','sasdh')
INSERT RabotaT(RabotaID, NameRabota, Trydovatr, Oboryd)
VALUES (6,'sdf', 'asf','shas')
INSERT RabotaT(RabotaID, NameRabota, Trydovatr, Oboryd)
VALUES (7,'sdsdgf', 'asf','ssah')
INSERT RabotaT(RabotaID, NameRabota, Trydovatr, Oboryd)
VALUES (8,'sdasdf', 'assdgf','sasdh')
INSERT RabotaT(RabotaID, NameRabota, Trydovatr, Oboryd)
VALUES (9,'sdsdgf', 'asf','ssah')
INSERT RabotaT(RabotaID, NameRabota, Trydovatr, Oboryd)
VALUES (10,'sdasdf', 'assdgf','sasdh')

INSERT IspoT(IspoID, Fio, GodRozhd,stazh,phone)
VALUES (1,'fdg', 1990, 5,'45366')
INSERT IspoT(IspoID, Fio, GodRozhd,stazh,phone)
VALUES (2,'fdfdg', 1990, 2,'45366')
INSERT IspoT(IspoID, Fio, GodRozhd,stazh,phone)
VALUES (3,'fdfgsg', 1967, 5,'4543366')
INSERT IspoT(IspoID, Fio, GodRozhd,stazh,phone)
VALUES (4,'fdg', 1987, 6,'453346566')
INSERT IspoT(IspoID, Fio, GodRozhd,stazh,phone)
VALUES (5,'fdfgfdg', 1990, 4,'4533466')
INSERT IspoT(IspoID, Fio, GodRozhd,stazh,phone)
VALUES (6,'fddfgg', 1994, 5,'4536566')
INSERT IspoT(IspoID, Fio, GodRozhd,stazh,phone)
VALUES (7,'fdgdf', 1945, 7,'4536766')
INSERT IspoT(IspoID, Fio, GodRozhd,stazh,phone)
VALUES (8,'fdsdfg', 1976, 10,'4538766')
INSERT IspoT(IspoID, Fio, GodRozhd,stazh,phone)
VALUES (9,'fdsdgfg', 1934, 6,'4536986')

INSERT ZakazhT (ZakazhID, Fio, GodRozhd,Stazh,phone)
VALUES (1,'ewg', 1990, 4,'82345')
INSERT ZakazhT (ZakazhID, Fio, GodRozhd,Stazh,phone)
VALUES (2,'ewg', 1990, 4,'82345')
INSERT ZakazhT (ZakazhID, Fio, GodRozhd,Stazh,phone)
VALUES (3,'ewg', 1990, 4,'82345')
INSERT ZakazhT (ZakazhID, Fio, GodRozhd,Stazh,phone)
VALUES (4,'ewg', 1990, 4,'82345')
INSERT ZakazhT (ZakazhID, Fio, GodRozhd,Stazh,phone)
VALUES (5,'ewg', 1990, 4,'82345')
INSERT ZakazhT (ZakazhID, Fio, GodRozhd,Stazh,phone)
VALUES (6,'ewg', 1990, 4,'82345')
INSERT ZakazhT (ZakazhID, Fio, GodRozhd,Stazh,phone)
VALUES (7,'ewg', 1990, 4,'82345')
INSERT ZakazhT (ZakazhID, Fio, GodRozhd,Stazh,phone)
VALUES (8,'ewg', 1990, 4,'82345')
INSERT ZakazhT (ZakazhID, Fio, GodRozhd,Stazh,phone)
VALUES (9,'ewg', 1990, 4,'82345')
INSERT ZakazhT (ZakazhID, Fio, GodRozhd,Stazh,phone)
VALUES (10,'ewg', 1990, 4,'82345')

INSERT LinkRI(RabotaID, IspoID)
VALUES(1,4)
INSERT LinkRI(RabotaID, IspoID)
VALUES(1,5)
INSERT LinkRI(RabotaID, IspoID)
VALUES(4,4)
INSERT LinkRI(RabotaID, IspoID)
VALUES(2,4)

INSERT LinkRZ(RabotaID,ZakazhID)
VALUES(5,3)
INSERT LinkRZ(RabotaID,ZakazhID)
VALUES(5,4)
INSERT LinkRZ(RabotaID,ZakazhID)
VALUES(5,6)
INSERT LinkRZ(RabotaID,ZakazhID)
VALUES(4,3)

INSERT LinkZI(ZakazhID,IspoID)
VALUES(3,5)
INSERT LinkZI(ZakazhID,IspoID)
VALUES(4,5)
INSERT LinkZI(ZakazhID,IspoID)
VALUES(3,6)
INSERT LinkZI(ZakazhID,IspoID)
VALUES(3,9)

SELECT *
From IspoT
WHERE stazh > ALL (
	SELECT stazh
	From ZakazhT
	Where GodRozhd > 1950)

SELECT AVG(stazh) AS AVStazh
FROM IspoT

SELECT * INTO ResTable
FROM IspoT
WHERE stazh >4

SELECT *
FROM ResTable
GO

ALTER PROCEDURE cursorstored 
AS
BEGIN
	DECLARE  @count int = 0, @stazh int
	DECLARE cur CURSOR FOR
		SELECT stazh
		FROM IspoT
		WHERE stazh > 2;
	OPEN cur;
	FETCH cur INTO @stazh;
	WHILE @@FETCH_STATUS = 0 
	BEGIN 
		If (@stazh = 5)
		BEGIN
		delete from IspoT where current of cur
		SELECT @count = @count + 1;
		print ' ' + @count + ' ';
		END
		fetch cur into @stazh
	END; 
	CLOSE cur;
	DEALLOCATE cur;
	print @count
END;
GO

EXEC cursorstored
GO