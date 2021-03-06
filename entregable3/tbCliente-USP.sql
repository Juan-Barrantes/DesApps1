use bd_NegocioAutosA1

select * from tb_Cliente
go

--◙◙ Vistas
--drop view VW_VistaClientes
create view VW_VistaClientes
as
select 
	docIdentidad, 
	tipoDocumento,
	apellidos ,
	nombre,
	tb_Ubigeo.Id_Ubigeo ,
	Departamento,
	Provincia,
	Distrito,
	direccion ,
	telefono,
	usu_reg,
	fec_reg,
	usu_ult_mod ,
	fec_ult_mod,
	estado_cli 
from tb_Cliente inner join tb_Ubigeo
	on tb_Cliente.Id_Ubigeo = tb_Ubigeo.Id_Ubigeo
--
select * from VW_VistaClientes
go
--◙◙◙ USP
-- Actualizar Cliente

--drop procedure usp_ActualizarCliente
create procedure usp_ActualizarCliente
	@docIdentidad varchar(15) ,
	@tipoDocumento varchar(25) ,
	@apellidos varchar(35) ,
	@nombre varchar(35),
	@Id_Ubigeo nchar(6) ,
	@direccion varchar(75) ,
	@telefono varchar(25) ,
	@usu_ult_mod varchar(20),	
	@estado_cli int
as
	update tb_Cliente
	set	docIdentidad=@docIdentidad, tipoDocumento=@tipoDocumento, apellidos=@apellidos,
	nombre=@nombre, Id_Ubigeo=@Id_Ubigeo, direccion=@direccion, telefono=@telefono,
	usu_ult_mod=@usu_ult_mod, fec_ult_mod=getdate(), estado_cli=@estado_cli
	where docIdentidad=@docIdentidad
go

exec usp_ActualizarCliente 
	@docIdentidad = '451487945',
	@tipoDocumento ='DNI',
	@apellidos= 'Ruiz Knapp-edit',
	@nombre = 'Viviana-edit',
	@Id_Ubigeo ='140110',
	@direccion = 'Av. Salaverry 1540',
	@telefono = '580404084',
	@usu_ult_mod = 'testing',	
	@estado_cli =1
go


--Consultar Cliente
create procedure usp_ConsultarCliente
	@docIdentidad varchar(15)
as
select 
	docIdentidad, 
	tipoDocumento,
	apellidos ,
	nombre,
	Id_Ubigeo ,
	Departamento,
	Provincia,
	Distrito,
	direccion ,
	telefono,
	usu_reg,
	fec_reg,
	usu_ult_mod ,
	fec_ult_mod,
	estado_cli
	from VW_VistaClientes
	where docIdentidad=@docIdentidad
go
exec usp_ConsultarCliente @docIdentidad = '451487945'

--Eliminar Cliente
create procedure usp_EliminarCliente
	@docIdentidad varchar (15)
as
	delete from tb_Cliente where docIdentidad = @docIdentidad
go

--insertar Cliente
--drop procedure usp_InsertarCliente
create procedure usp_InsertarCliente
	@docIdentidad varchar(15) ,
	@tipoDocumento varchar(25) ,
	@apellidos varchar(35) ,
	@nombre varchar(35),
	@Id_Ubigeo nchar(6) ,
	@direccion varchar(75) ,
	@telefono varchar(25) ,
	@usu_reg varchar(20),	
	
	@estado_cli int
as
	insert into tb_Cliente
	(docIdentidad,tipoDocumento,apellidos,nombre,Id_Ubigeo,direccion,telefono,usu_reg,fec_reg,estado_cli)
	values 
		(@docIdentidad,@tipoDocumento,@apellidos,@nombre,@Id_Ubigeo, @direccion,@telefono,@usu_reg,getdate(), @estado_cli)
go
exec usp_InsertarCliente '3215405411', 'Pasaporte','Ramirez','Jhonatan','140120','calle Carpenter 1501','897654321', 'testing2',1
go

exec usp_InsertarCliente @docIdentidad='73986561', @tipoDocumento='Cedula de Identidad',@apellidos='Helera Aguirre',
	@nombre='Maria', @Id_Ubigeo= '140121',  @direccion='av.rosas 1533', @telefono='654321870', @usu_reg= 'testing2',
	@estado_cli=1
go

create procedure usp_ListarTipoDocs
as
select tipoDocumento from tb_Cliente group by tipoDocumento
go


create procedure usp_EstadoCliente
as
	select
		CASE estado_cli
		when '0' then 'inactivo'
		when '1'then 'activo'
		else 'No encontrado'
		end as 'Estado'
	from tb_cliente
	group by estado_cli	
go

--listar clientes
create procedure usp_ListarClientes
as
	select
	docIdentidad,
	tipoDocumento,
	apellidos,
	nombre,
	tb_Cliente.direccion,
	tb_Ubigeo.Departamento,	
	tb_Ubigeo.Provincia,
	tb_Ubigeo.Distrito

	from tb_Cliente inner join tb_Ubigeo
		on tb_Cliente.Id_Ubigeo= tb_Ubigeo.Id_Ubigeo
go

exec usp_ListarClientes

select * from tb_usuario

create procedure usp_ConsultarClienteTipDoc
@tipoDoc varchar(15)
as
	select 
	docIdentidad,
	tipoDocumento,
	apellidos,
	nombre,
	direccion,
	telefono
	from tb_Cliente

	select * from tb_Comprobante