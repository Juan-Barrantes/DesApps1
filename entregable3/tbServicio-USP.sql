use bd_NegocioAutosA1

select * from tb_Servicios

--Crear View de Servicios
--drop view VW_Servicios
create view VW_Servicios
as 
select 
	codServicio,
	tipoServ,
	precio,
	tiempoEst,
	tb_Agencia.direccion
	from tb_Servicios inner join tb_Agencia
		on tb_Servicios.codAgencia = tb_Agencia.codAgencia

--Creamos SP
--Actualizar Servicio
drop procedure usp_ActualizarServicio
select * from tb_Servicios where codServicio=10008

create procedure usp_ActualizarServicio
	@codServicio smallint,
	@tipoServ varchar(50) ,
	@precio money ,
	@tiempoEst int,
	@codAg smallint,
	@usu_ult_mod varchar(20)
	
as 	
	update tb_Servicios
	set
		tipoServ = @tipoServ, precio = @precio, tiempoEst=@tiempoEst, codAgencia= @codAg,
		usu_ult_mod = @usu_ult_mod  ,fec_ult_mod=getdate()
	where codServicio = @codServicio
go
exec usp_ActualizarServicio @codServicio =10008, @tipoServ='Alquiler de Auto - editado',
	@precio=250,@usu_ult_mod='testing2', @tiempoEst=24, @codAg = 5

--Consultar servicio
--drop procedure usp_ConsultarServicio
create procedure usp_ConsultarServicio
	@codServ smallint
as
	select 
	codServicio,
	tipoServ,
	precio,
	tiempoEst,
	direccion
	from VW_Servicios
	where codServicio=@codServ
go
exec usp_ConsultarServicio @codServ=''

--eliminar servicio
create procedure usp_EliminarServicio
	@codServ smallint
as
	delete from tb_Servicios where codServicio=@codServ
go

--insertar servicio
--drop procedure usp_InsertarServicio
create procedure usp_InsertarServicio
	@tipoServ varchar(50) ,
	@precio money ,	
	@tiempoEst int,
	@codAg smallint,
	@usu_reg varchar(20)

as
	declare @codServicio smallint	
	set @codServicio= (select top 1 codServicio from tb_Servicios order by codServicio DESC)+1
	
	insert into tb_Servicios
		(codServicio,tipoServ,precio, tiempoEst, codAgencia  ,usu_reg,fec_reg)
	values
		(@codServicio,@tipoServ,@precio, @tiempoEst,  @codAg,@usu_reg, getdate())
go

exec usp_InsertarServicio @tipoServ='cambio de aceite',@precio=170,@tiempoEst=3, @codAg=20 ,@usu_reg='testing'
go


--drop procedure usp_ListarServicios
create procedure usp_ListarServicios
as
	select 
	codServicio,
	tipoServ,
	precio,
	tiempoEst,
	direccion
	from VW_Servicios
go

exec usp_ListarServicios
go

create procedure usp_ServicioPrecio
as
	select 
	tipoServ,
	precio
	from VW_Servicios
go

exec usp_ServicioPrecio

select * from tb_usuario

select * from tb_Servicios