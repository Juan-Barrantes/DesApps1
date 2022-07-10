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

