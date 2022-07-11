use bd_NegocioAutosA1

select * from tb_Servicios

--Crear View de Servicios
create view VW_Servicios
as 
select 
	codServicio,
	tipoServ,
	precio
	from tb_Servicios

--Creamos SP
--Actualizar Servicio
create procedure usp_ActualizarServicio
	@codServicio smallint,
	@tipoServ varchar(50) ,
	@precio money ,
	@usu_ult_mod varchar(20)
	
as 
	
	update tb_Servicios
	set
		tipoServ = @tipoServ, precio = @precio, 
		usu_ult_mod = @usu_ult_mod, fec_ult_mod=getdate()
	where codServicio = @codServicio
go
exec usp_ActualizarServicio @codServicio =10005, @tipoServ='Alquiler de Auto - editado',
	@precio=250,@usu_ult_mod='testing2'

--Consultar servicio
create procedure usp_ConsultarServicio
	@codServ smallint
as
	select 
	codServicio,
	tipoServ,
	precio
	from VW_Servicios
	where codServicio=@codServ
go
exec usp_ConsultarServicio @codServ=10005

--eliminar servicio
create procedure usp_EliminarServicio
	@codServ smallint
as
	delete from tb_Servicios where codServicio=@codServ
go

--insertar servicio
create procedure usp_InsertarServicio
	@tipoServ varchar(50) ,
	@precio money ,	
	@usu_reg varchar(20)
as
	declare @codServicio smallint	
	set @codServicio= (select top 1 codServicio from tb_Servicios order by codServicio DESC)+1
	
	insert into tb_Servicios
		(codServicio,tipoServ,precio, usu_reg,fec_reg)
	values
		(@codServicio,@tipoServ,@precio,@usu_reg, getdate())
go

exec usp_InsertarServicio @tipoServ='cambio de aceite',@precio=170, @usu_reg='testing'
go

create procedure usp_ListarServicios
as
	select 
	codServicio,
	tipoServ,
	precio
	from VW_Servicios
go

select * from tb_Servicios