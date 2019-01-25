CREATE TABLE [dbo].[BuildStations] (
    [StationName] NVARCHAR (50) NULL,
    [BuildYear]   INT           NULL,
    [Train]       NVARCHAR (50) NULL,
    [StationID]   INT           NOT NULL,
    CONSTRAINT [PK_BuildStationsID] PRIMARY KEY CLUSTERED ([StationID] ASC)
);

