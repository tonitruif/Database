CREATE TABLE [dbo].[TrainsT] (
    [BuildDate]     INT           NOT NULL,
    [LineID]        INT           NOT NULL,
    [MaxPassengers] INT           NOT NULL,
    [MaxVagon]      INT           NOT NULL,
    [Train]         NVARCHAR (20) NOT NULL,
    [TrainID]       INT           NOT NULL,
    CONSTRAINT [TrainsT_PK] PRIMARY KEY CLUSTERED ([TrainID] ASC),
    FOREIGN KEY ([LineID]) REFERENCES [dbo].[LinesT] ([LineID]) ON DELETE CASCADE ON UPDATE CASCADE
);


GO
CREATE TRIGGER afttrigger 
ON TrainsT AFTER INSERT
AS
BEGIN 
	SELECT * from inserted;
END;

GO
CREATE TRIGGER insttrigger   
ON TrainsT INSTEAD OF INSERT
AS
BEGIN 
	--SELECT * from inserted;
	DELETE  
	FROM LinesT
	WHERE LineID = 1060
END;
