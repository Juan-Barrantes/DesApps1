use bd_NegocioAutosA1;


select * from tb_Empleado
/*
Eliminaremos la tabla Tratante y la cambiaremos por Tabla Empleado
esto sería fácil ya que la tabla tratante (empleado) no está conectada
a nada
*/

--eliminamos la tabla Empleado de ahora y crearemos otra nueva
select * from tb_Empleado
-- drop table tb_Empleado

--CREATE TABLE tb_Empleado(
	codEmpleado smallint not null PRIMARY KEY,
	codAgencia smallint not null FOREIGN KEY REFERENCES tb_Agencia,
	nomEmpleado varchar (20) not null,
	apeEmpleado varchar (20) not null,
	Id_Ubigeo nchar(6) not null FOREIGN KEY REFERENCES tb_Ubigeo ,
	dirEmpleado varchar(45) not null,
	telefono varchar(25) not null,
	sueldo money,
	fecini date not null,
	fecnac date not null,
	cargo varchar(20) not null,
	correo varchar(50) not null,
	usu_reg varchar(20),
	fec_reg datetime,
	usu_ult_mod varchar(20),
	fech_ult_mod datetime
	);
go



 -- ======================================================================================================================================

 -- ======================================================================================================================================

--Eliminamos los StoreProcedures de tb_Tratante

--actualizar
	--drop procedure usp_ActualizarEmpleado
create procedure usp_ActualizarEmpleado
	@cod smallint,
	@codAgen smallint,
	@nombre varchar (20),
	@apellido varchar (20),
	@Id_Ubi nchar(6),
	@direccion varchar (20),
	@telef varchar (20), --	
	@cargo varchar(20),
	@email varchar(50)
as 
	DECLARE 
	@sue money
	if (@cargo='Administrador')
	begin
		set @sue=3000
	end
	if (@cargo='atención al cliente')
	begin
		set @sue=1200
	end

	update tb_Empleado
	set 
		codAgencia = @codAgen, nomEmpleado = @nombre, apeEmpleado = @apellido,
		Id_Ubigeo=@Id_Ubi, dirEmpleado = @direccion, telefono = @telef,
		sueldo = @sue, cargo = @cargo, correo =@email,fech_ult_mod=getdate()
	where codEmpleado = @cod
go

exec usp_ActualizarEmpleado @cod=1060  , @codAgen=5   ,@nombre='Bridie', @apellido='Bellay Herrera', @Id_Ubi='140120', @direccion='jr Palma 1401',
	@telef='654321' , @cargo='atención al cliente', @email='Bridie@gmail.com'

select * from tb_Empleado where codEmpleado=1060
--consultar
go
	--drop procedure usp_ConsultarEmpleado
create procedure usp_ConsultarEmpleado
	@cod smallint
as 
	select codEmpleado,
		nomEmpleado,
		apeEmpleado,
		dirEmpleado,
		telefono,		
		cargo, 	
		correo,

		codAgencia,		
		--direccion , 
		Id_Ubigeo,
		Departamento,
		Distrito, 
		Provincia,
		fec_reg,
		usu_reg,
		fech_ult_mod,
		usu_ult_mod	
	from VW_VistaEmpleados 
	where codEmpleado=@cod	
go

exec usp_ConsultarEmpleado @cod=1001
go

--Eliminar
	--drop procedure usp_EliminarEmpleado
create procedure usp_EliminarEmpleado
	@cod smallint
as
	delete from tb_Empleado where codEmpleado =@cod
go
exec usp_EliminarEmpleado @cod=1064

--insertar
	--drop procedure usp_InsertEmpleado	
create procedure usp_InsertEmpleado		
	@codAgen smallint,
	@nombre varchar (20),
	@apellido varchar (20),
	@direccion varchar (20),
	@IdUbi nchar(6),
	@telefono varchar (20),	
	@fecini date ,
	@fecnac date ,
	@cargo varchar(20),
	@email varchar(50),
	@usu_reg varchar(20)
as
	DECLARE 
	@sue money,
	@nivel_usu int
	if (@cargo='Administrador')
	begin
		set @sue=3000
		set @nivel_usu =1
	end
	if (@cargo='atención al cliente')
	begin
		set @sue=1200
		set @nivel_usu=2
	end
	DECLARE @codEmpl smallint
	set @codEmpl = (select top 1 codEmpleado from tb_Empleado order by codEmpleado DESC) +1
	
	INSERT into tb_Empleado 
		(codEmpleado, codAgencia, nomEmpleado, apeEmpleado, Id_Ubigeo, dirEmpleado, telefono, sueldo,fecini, fecnac, cargo, correo, fec_reg,usu_reg)
	VALUES(@codEmpl ,@codAgen,@nombre,@apellido,@IdUbi,@direccion , @telefono, @sue,@fecini,@fecnac , @cargo,@email,getdate(), @usu_reg)

	INSERT into tb_usuario 
		(usu_name, usu_pass,usu_nivel,codEmpleado, fech_reg, usu_reg )
	values( cast(@codEmpl as varchar(20))+@nombre, cast(@codEmpl as varchar(20))+@nombre, @nivel_usu,@codEmpl, getdate(),@usu_reg )
go

exec usp_InsertEmpleado @codAgen=10,@nombre='Maria',@apellido='Hernandez', @direccion='jr Bayobar 513',@IdUbi='140121',@telefono='987653020',
	@fecini='2022-08-06',@fecnac='1996-08-10'  ,@cargo='atención al cliente',@email='mariHer@gmail.com', @usu_reg='testing'
go
select * from tb_Empleado order by codEmpleado DESC
--listar
	--drop procedure usp_ListarEmpleados
create procedure usp_ListarEmpleados
as
	select codEmpleado as 'Codigo Empleado',
	nomEmpleado as 'Nombre', apeEmpleado as 'Apellido', correo,cargo, sueldo,
	tb_Agencia.direccion as 'Agencia', 
	tb_Ubigeo.Departamento,tb_Ubigeo.Distrito, tb_Ubigeo.Provincia
	from tb_Empleado inner join tb_Agencia
	on tb_Empleado.codAgencia = tb_Agencia.codAgencia
	inner join tb_Ubigeo
	on tb_Empleado.Id_Ubigeo = tb_Ubigeo.Id_Ubigeo
go
exec usp_ListarEmpleados
go


-- Creamos vistas 
--drop view [VW_VistaEmpleados]
create view [VW_VistaEmpleados]
as
select codEmpleado,
		nomEmpleado,
		apeEmpleado,
		correo,
		cargo, 		
		tb_Agencia.codAgencia,
		tb_Agencia.direccion , 
		tb_Ubigeo.Id_Ubigeo,
		tb_Ubigeo.Departamento,
		tb_Ubigeo.Distrito, 
		tb_Ubigeo.Provincia,
		fec_reg,
		usu_reg,
		fech_ult_mod,
		usu_ult_mod

from tb_Empleado inner join tb_Agencia
	on tb_Empleado.codAgencia = tb_Agencia.codAgencia
	inner join tb_Ubigeo
	on tb_Empleado.Id_Ubigeo = tb_Ubigeo.Id_Ubigeo

	select codEmpleado,nomEmpleado, apeEmpleado, dirEmpleado,correo,codAgencia from VW_VistaEmpleados where codEmpleado=1060
	go

--SP para Agencia y asi cargar la lista de agencias y sus direcciones
create procedure usp_Agencia_Direccion
as
	select codAgencia, direccion from tb_Agencia

exec usp_Agencia_Direccion
go

alter view [VW_VistaEmpleados] as
select codEmpleado,
		nomEmpleado,
		apeEmpleado,
		correo,
		cargo,
		dirEmpleado,
		tb_Empleado.telefono,
		
		tb_Agencia.codAgencia,		
		tb_Ubigeo.Id_Ubigeo,
		tb_Ubigeo.Departamento,
		tb_Ubigeo.Distrito, 
		tb_Ubigeo.Provincia,
		fec_reg,
		usu_reg,
		fech_ult_mod,
		usu_ult_mod

from tb_Empleado inner join tb_Agencia
	on tb_Empleado.codAgencia = tb_Agencia.codAgencia
	inner join tb_Ubigeo
	on tb_Empleado.Id_Ubigeo = tb_Ubigeo.Id_Ubigeo

select * from VW_VistaEmpleados


-- Borramos los guiones en los numeros telefonicos
UPDATE tb_Empleado SET telefono = REPLACE(telefono, '-', '')
go


create procedure usp_ListarEmpleadoCod
@codEmp smallint
as
	select codEmpleado,
	nomEmpleado,
	apeEmpleado,
	dirEmpleado,
	telefono,
	cargo,
	correo
	from tb_Empleado
	where codEmpleado = @codEmp
go

select * from tb_Cliente