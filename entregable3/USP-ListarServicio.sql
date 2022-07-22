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

--drop procedure usp_InsertarListaServiciosxCliente
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

exec usp_InsertarListaServiciosxCliente @docIdente=72446128 , @listaServ='Nivelar la batería,Revision de luces,'



select * from tb_Detalle_Servicio order by codComprobante DESC
select * from tb_Servicios
--
SELECT tipoServ,
       count(*) AS c
FROM tb_Servicios
GROUP BY tipoServ
HAVING c > 1
ORDER BY c DESC


select * from tb_Cliente
select * from tb_Comprobante
select * from tb_usuario

--select para ver comprobante, cliente, servicios, precio
select C.codComprobante, D.docIdentidad, S.codServicio,
tipoServ, S.precio, C.estado
from tb_Comprobante as C inner join tb_Detalle_Servicio as D
	on C.codComprobante=D.codComprobante
	inner join tb_Servicios as S
	on D.codServicio = S.codServicio
where C.codComprobante=1012 and D.docIdentidad='72446128'
---------
select C.codComprobante, D.docIdentidad,Cl.nombre+', '+Cl.apellidos as cliente,
	SUM(S.precio) as precio, C.estado
from tb_Comprobante as C inner join tb_Detalle_Servicio as D
	on C.codComprobante=D.codComprobante
	inner join tb_Servicios as S
	on D.codServicio = S.codServicio
	inner join tb_Cliente as Cl
	on D.docIdentidad=Cl.docIdentidad
--where C.codComprobante=1012 and D.docIdentidad='72446128'  and C.estado=0
where C.estado=0
group by  C.codComprobante, D.docIdentidad,Cl.nombre,Cl.apellidos,C.estado
order by C.estado
go

--drop procedure usp_ListarFacturasPendientes
create procedure usp_ListarFacturasPendientes
as
	select C.codComprobante, D.docIdentidad,Cl.nombre+', '+Cl.apellidos as cliente,
		SUM(S.precio) as precio
	from tb_Comprobante as C inner join tb_Detalle_Servicio as D
		on C.codComprobante=D.codComprobante
		inner join tb_Servicios as S
		on D.codServicio = S.codServicio
		inner join tb_Cliente as Cl
		on D.docIdentidad=Cl.docIdentidad
	--where C.codComprobante=1012 and D.docIdentidad='72446128'  and C.estado=0
	where C.estado=0
	group by  C.codComprobante, D.docIdentidad,Cl.nombre,Cl.apellidos,C.estado
	order by C.estado
go
exec usp_ListarFacturasPendientes
go

--drop procedure usp_ConsultarFacturasPendientes
create procedure usp_ConsultarFacturasPendientes
	@docIdent varchar(15),
	@codFact smallint
as
	select C.codComprobante, D.docIdentidad,Cl.nombre+', '+Cl.apellidos as cliente,
		SUM(S.precio) as precio
	from tb_Comprobante as C inner join tb_Detalle_Servicio as D
		on C.codComprobante=D.codComprobante
		inner join tb_Servicios as S
		on D.codServicio = S.codServicio
		inner join tb_Cliente as Cl
		on D.docIdentidad=Cl.docIdentidad
	--where C.codComprobante=1012 and D.docIdentidad='72446128'  and C.estado=0
	where C.estado=0 and D.docIdentidad=@docIdent and C.codComprobante=@codFact
	group by  C.codComprobante, D.docIdentidad,Cl.nombre,Cl.apellidos,C.estado
	order by C.estado
go
exec usp_ConsultarFacturasPendientes @docIdent='72346051', @codFact=1010


exec usp_ActualizarComprobante @codComprob=1012,@usu_ult_mod='testing2'



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


select * from tb_usuario