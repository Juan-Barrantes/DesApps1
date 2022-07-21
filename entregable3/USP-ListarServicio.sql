use bd_NegocioAutosA1

select  value from String_Split('lavar auto, cambio aceite, alquilar auto,', ',')

select  ROW_NUMBER() OVER(order by value desc) as indice,
value 
from String_Split('lavar auto, cambio aceite, alquilar auto,', ',')
go

--drop view VW_ArrayServicios
create view VW_ArrayServicios
as
	select  ROW_NUMBER() OVER(order by value desc) as indice,
	value 
	from String_Split('lavar auto, cambio aceite, alquilar auto,', ',')		
go
select value
from VW_ArrayServicios
where indice=2

with tab1 as (
	select  ROW_NUMBER() OVER(order by value desc) as indice,
	value 
	from String_Split('lavar auto, cambio aceite, alquilar auto,', ',')			
)

select value 
from tab1
where indice=2
	
go
	with tab1 as (
		select  ROW_NUMBER() OVER(order by value desc) as indice,
		value 
		from String_Split('lavar auto, cambio aceite, alquilar auto,', ',')			
		)
		select value 
		from tab1
		where indice=3		
		
go


create procedure usp_InsertarListaServiciosxCliente
	@docIdente varchar(15),
	@listaServ varchar(500)	
as
	--obtenemos cantidad de vueltas para el while (que hará de for)
	declare @cantVueltas int
	set @cantVueltas = ( select count(*) value from String_Split(  @listaServ , ','))-1
	
	--hacemos una tabla en memoria y e iteramos por cada elemento	
	declare @i int = 1
	declare @ItemServicio varchar(50)	
	--iteramos:
	declare @cnt int = 0
	while @cnt < @cantVueltas
	begin
		set @ItemServicio = 
			(
				SELECT  q1.value
				from (
					select  ROW_NUMBER() OVER(order by value desc) as indice,
					value 
					from String_Split(@listaServ, ',')	
				) as q1
				where indice =@i
			)
		exec usp_InsertarDetalle_Servicio @docIdent=@docIdente,@tipoServ=@ItemServicio

		set @cnt = @cnt+1;
		set @i = @i+1;
	end
go

declare @listServ table (indice int , itemServicio varchar(50))
insert into @listServ
values
(1, 'lavado')
select * from @listServ

set @nada = (
	--select top 1 nombre from tb_cliente 
	with tab1 as (
		select  ROW_NUMBER() OVER(order by value desc) as indice,
		value 
		from String_Split('lavar auto, cambio aceite, alquilar auto,', ',')			
		)
		select value 
		from tab1
		where indice=3
	);
print @nada

go

DECLARE @ListOWeekDays TABLE(DyNumber INT,DayAbb VARCHAR(40) , WeekName VARCHAR(40))
 
INSERT INTO @ListOWeekDays
VALUES 
(1,'Mon','Monday')  ,
(2,'Tue','Tuesday') ,
(3,'Wed','Wednesday') ,
(4,'Thu','Thursday'),
(5,'Fri','Friday'),
(6,'Sat','Saturday'),
(7,'Sun','Sunday')	
SELECT * FROM @ListOWeekDays
go



------------------------------
CREATE FUNCTION [dbo].[fnSplitString] 
( 
    @string NVARCHAR(MAX), 
    @delimiter CHAR(1) 
) 
RETURNS @output TABLE(splitdata NVARCHAR(MAX) 
) 
BEGIN 
    DECLARE @start INT, @end INT 
    SELECT @start = 1, @end = CHARINDEX(@delimiter, @string) 
    WHILE @start < LEN(@string) + 1 BEGIN 
        IF @end = 0  
            SET @end = LEN(@string) + 1

        INSERT INTO @output (splitdata)  
        VALUES(SUBSTRING(@string, @start, @end - @start)) 
        SET @start = @end + 1 
        SET @end = CHARINDEX(@delimiter, @string, @start)

    END 
    RETURN 
END



