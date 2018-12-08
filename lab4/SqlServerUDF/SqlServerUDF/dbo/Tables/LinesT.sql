CREATE TABLE [dbo].[LinesT] (
    [Line]    NVARCHAR (100) NOT NULL,
    [LineID]  INT            NOT NULL,
    [StatusS] NVARCHAR (25)  NOT NULL,
    CONSTRAINT [LinesT_PK] PRIMARY KEY CLUSTERED ([LineID] ASC)
);

