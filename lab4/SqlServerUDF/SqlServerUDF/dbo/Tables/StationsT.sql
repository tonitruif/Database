CREATE TABLE [dbo].[StationsT] (
    [Station]   NVARCHAR (100) NOT NULL,
    [Admarea]   NVARCHAR (100) NOT NULL,
    [District]  NVARCHAR (100) NOT NULL,
    [StatusS]   NVARCHAR (40)  NOT NULL,
    [StationID] INT            NOT NULL,
    CONSTRAINT [StationsT_PK] PRIMARY KEY CLUSTERED ([StationID] ASC)
);

