use bd_NegocioAutosA1
-- presionar siguiente
-- insertar comprobante
	-- mensaje, comprobante F001 generado
--inserta la tabla Detalle_Servicio
/*	F001 con los servicios referenciados
	comprobante | codigo servicio
	F001			1001
	F001			1002
*/

-- se va a la pantalla de pago y actualiza tb_Comprobante
select * from tb_Comprobante
select * from tb_Cliente
go
--Vista de Comprobante
--drop view VW_Comprobante
create View VW_Comprobante
as
select
	codComprobante ,
	tb_Cliente.docIdentidad ,	
	tb_Cliente.nombre,
	tb_Cliente.apellidos,
	fechaEmision ,
	estado ,
	tb_Comprobante.usu_reg,
	tb_Comprobante.fec_reg ,
	tb_Comprobante.usu_ult_mod ,
	tb_Comprobante.fech_ult_mod 
from tb_Comprobante inner join tb_Cliente
on tb_Comprobante.docIdentidad = tb_Cliente.docIdentidad
go
--select * from VW_Comprobante

--USP para comprobante
--insertamos o generamos un comprobante
--drop procedure usp_InsertarComprobante
create procedure usp_InsertarComprobante
	@docIdentidad varchar(15),
	--@nombre varchar(20),
	--@apellido varchar(20),	
	--estado ,
	@usu_reg varchar(20)
	
as	
	declare @codComprobante smallint	
	IF((select top 1 codComprobante from tb_Comprobante ORDER BY  codComprobante ASC)='')
		BEGIN
			set @codComprobante = 1001;
		END
	ELSE
		BEGIN
			set @codComprobante =(select top 1 codComprobante from tb_Comprobante order by codComprobante DESC)+1;
		END
	
	insert into tb_Comprobante
		(codComprobante,docIdentidad,fechaEmision, estado, usu_reg,fec_reg  )
	values
		(@codComprobante, @docIdentidad, getdate(), 0, @usu_reg, getdate())
go

insert into tb_Comprobante 
	(codComprobante,docIdentidad,fechaEmision, estado, usu_reg,fec_reg  )
	values	
	(1000, '451487945', getdate(), 0 , 'testing', getdate())

exec usp_InsertarComprobante @docIdentidad='451487945', @usu_reg='testing'
go
--Detalle servicio
--USP
--drop procedure usp_InsertarDetalle_Servicio
create procedure usp_InsertarDetalle_Servicio
  --@codComprob smallint,
	@docIdent varchar(15),
	@codServ smallint
as
	declare @codComprob smallint
	set @codComprob = (select top 1 codComprobante from tb_Comprobante order by codComprobante DESC)
	insert into tb_Detalle_Servicio
		(docIdentidad, codComprobante, codServicio)
	values
		(@docIdent, @codComprob, @codServ)
go
exec usp_InsertarDetalle_Servicio @docIdent='451487945', @codServ=10005

select * from tb_Detalle_Servicio
select * from tb_Comprobante
go

--drop view VW_Comprobante_Cliente_Servicio
create view VW_Comprobante_Cliente_Servicio
as
select tb_Comprobante.docIdentidad, tb_Comprobante.codComprobante, 
	tb_Comprobante.estado,
	tb_Detalle_Servicio.codServicio, 
	tb_Servicios.tipoServ,
	tb_Servicios.precio
from tb_Detalle_Servicio inner join tb_Comprobante
	on tb_Detalle_Servicio.codComprobante = tb_Comprobante.codComprobante
	inner join tb_Servicios
	on tb_Detalle_Servicio.codServicio = tb_Servicios.codServicio
go
select * from VW_Comprobante_Cliente_Servicio
go

--drop procedure usp_Comprobante_Cliente_Servicio
create procedure usp_ListarComprobante_Cliente_Servicio
as
	select docIdentidad,
			codComprobante,
			estado
			codServicio,
			tipoServ,
			precio
	from VW_Comprobante_Cliente_Servicio
go
exec usp_ListarComprobante_Cliente_Servicio
go

--actualizar comprobante
create procedure usp_ActualizarComprobante
	@codComprob smallint,
	@estado int,
	@usu_ult_mod varchar(20)
as
	update tb_Comprobante
	set
		estado=@estado, fech_ult_mod=getdate()
	where codComprobante=@codComprob
go
exec usp_ActualizarComprobante @codComprob=1001, @estado=1,@usu_ult_mod='testing2'
go

--consultar comprobante
create procedure usp_ConsultarComprobante
	@codCompr smallint,
	@estado int
as
	select
	codComprobante,
	docIdentidad,
	nombre,
	apellidos,
	fechaEmision,
	estado
	from VW_Comprobante
	where codComprobante=@codCompr and estado=@estado
go
exec usp_ConsultarComprobante @codCompr=1001, @estado=1

create trigger tg_ComprobanteDetalle
on tb_Detalle_Servicio after update
as
