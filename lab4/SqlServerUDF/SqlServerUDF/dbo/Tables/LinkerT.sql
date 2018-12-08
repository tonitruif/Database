CREATE TABLE [dbo].[LinkerT] (
    [StationID]  INT NOT NULL,
    [LineID]     INT NOT NULL,
    [Vagons]     INT NOT NULL,
    [Passangers] INT NOT NULL,
    FOREIGN KEY ([LineID]) REFERENCES [dbo].[LinesT] ([LineID]) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY ([StationID]) REFERENCES [dbo].[StationsT] ([StationID]) ON DELETE CASCADE ON UPDATE CASCADE
);

