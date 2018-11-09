USE Metro 
GO

CREATE TABLE StationsT
	(Station nvarchar(50) NOT NULL,
	Line nvarchar(70) NOT NULL,
	Admarea nvarchar(70) NOT NULL,
	global_id int NOT NULL,
	District nvarchar(70) NOT NULL,
	Status nvarchar (20) NOT NULL,
	Id int NOT NULL)
GO