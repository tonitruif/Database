create function countpass(@LineID int)
returns int
as
begin
	declare @count int;
	select @count = count(Passangers)
	from LinkerT
	where Passangers > 400 AND LineID=@LineID
	return @count;
end;
