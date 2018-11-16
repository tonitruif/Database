USE Metro
GO
ALTER TABLE StationsT
ADD CONSTRAINT StationsT_PK PRIMARY KEY (StationID)
GO

ALTER TABLE TrainsT
ADD CONSTRAINT TrainsT_PK PRIMARY KEY (TrainID)
GO

ALTER TABLE LinesT
ADD CONSTRAINT LinesT_PK PRIMARY KEY (LineID)
GO


ALTER TABLE LinkerT
	ADD FOREIGN KEY (LineID) 
	REFERENCES LinesT (LineID)
	ON DELETE CASCADE
	ON UPDATE CASCADE;
GO
ALTER TABLE LinkerT
	ADD FOREIGN KEY (StationID) 
	REFERENCES StationsT (StationID)
	ON DELETE CASCADE
	ON UPDATE CASCADE;
GO
ALTER TABLE TrainsT
	ADD FOREIGN KEY (LineID) 
	REFERENCES LinesT (LineID)
	ON DELETE CASCADE
	ON UPDATE CASCADE;
GO

ALTER TABLE LinkerT
ADD CONSTRAINT pass_check CHECK (Passengers > 0)
GO

INSERT INTO LinkerT VALUES (1, -1, 2, 4)
GO