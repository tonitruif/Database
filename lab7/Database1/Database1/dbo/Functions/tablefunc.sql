create function tablefunc()
returns table
as
return 
(
	select LineID, Passangers, Vagons
	from LinkerT
	where Passangers > 400
)
