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
select * from tb_usuario
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
	IF((select top 1 codComprobante from tb_Comprobante ORDER BY  codComprobante ASC)=null)
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

insert into tb_Comprobante (codComprobante, docIdentidad, fechaEmision, estado)
values (1000, 73986561, getdate(),0)

exec usp_InsertarComprobante @docIdentidad='32165487' ,   @usu_reg='testing'

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
	@tipoServ varchar(20)
	--@codServ smallint
as
	declare @codComprob smallint
	set @codComprob = (select top 1 codComprobante from tb_Comprobante order by codComprobante DESC)

	declare @codServ smallint
	set @codServ = (select codServicio from tb_Servicios where tipoServ=@tipoServ)

	insert into tb_Detalle_Servicio
		(docIdentidad, codComprobante, codServicio)
	values
		(@docIdent, @codComprob, @codServ)
go
exec usp_InsertarDetalle_Servicio @docIdent='32165487', @codServ=10015

select * from tb_Detalle_Servicio  where docIdentidad=3215405411
select * from tb_Comprobante
select * from tb_Cliente
select * from tb_Servicios
select * from tb_usuario
go



create procedure usp_ultFactura
as
	select top 1 codComprobante
	from tb_Comprobante order by codComprobante DeSC
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

create procedure usp_ListarServicios_ClienteComprob
	@docIdent varchar(15),
	@codComprob smallint
as
	select docIdentidad,codComprobante,tipoServ,precio,
	estado
	 from VW_Comprobante_Cliente_Servicio
	 where estado=0
	 where docIdentidad=@docIdent and codComprobante=@codComprob
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
exec usp_ActualizarComprobante @codComprob=1000, @estado=1,@usu_ult_mod='testing2'
go

--consultar comprobante
--drop procedure usp_ConsultarComprobante
create procedure usp_ConsultarComprobante
	@codCompr smallint
	--@estado int
as
	select
	codComprobante,
	docIdentidad,
	nombre,
	apellidos,
	fechaEmision,
	estado
	from VW_Comprobante
	where codComprobante=@codCompr 
go
exec usp_ConsultarComprobante @codCompr=1001

create trigger tg_ComprobanteDetalle
on tb_Detalle_Servicio after update
as



--USP pantallas web
--drop view vw_VistaFacturas1
CREATE VIEW vw_VistaFacturas1
AS
select tb_Comprobante.codComprobante, tb_Cliente.docIdentidad, tb_Detalle_Servicio.codServicio,
	tb_Servicios.tipoServ , precio,
		CASE WHEN estado = '0' THEN 'Pendiente' WHEN estado = '1' 
		THEN 'Cancelada' END AS EstadoActual
from tb_Comprobante inner join tb_Cliente
	on tb_Comprobante.docIdentidad = tb_Cliente.docIdentidad
	inner join tb_Detalle_Servicio
	on tb_Cliente.docIdentidad = tb_Detalle_Servicio.docIdentidad
	inner join tb_Servicios
	on tb_Detalle_Servicio.codServicio = tb_Servicios.codServicio
go
select * from vw_VistaFacturas1

select tb_Comprobante.codComprobante, tb_Cliente.docIdentidad, tb_Detalle_Servicio.codServicio,
	tb_Servicios.tipoServ
	, 
		CASE WHEN estado = '0' THEN 'Pendiente' WHEN estado = '1' 
		THEN 'Cancelada' END AS EstadoActual
from tb_Comprobante inner join tb_Cliente
	on tb_Comprobante.docIdentidad = tb_Cliente.docIdentidad
	inner join tb_Detalle_Servicio
	on tb_Cliente.docIdentidad = tb_Detalle_Servicio.docIdentidad
	inner join tb_Servicios
	on tb_Detalle_Servicio.codServicio = tb_Servicios.codServicio

select * from tb_Detalle_Servicio

select * from tb_Comprobante
select * from vw_VistaFacturas1
go
--SP
--drop procedure usp_ListarFacturas_Paginacion
CREATE  PROCEDURE usp_ListarFacturas_Paginacion
@docIdentidad varchar(10),
@estado varchar(10),
@NumPag int
AS
DECLARE @NUMREG INT
DECLARE @PAGESIZE INT
SET @PAGESIZE=10 --Tamaño de pagina

IF @docIdentidad=''  AND  @estado='' 
    BEGIN
            -- Si los valores de los parametros son cadenas en blanco , se obtienen los primeros 50 registros
               SELECT top 10  codComprobante,docIdentidad,codServicio, tipoServ, EstadoActual
                FROM vw_VistaFacturas1
               ORDER BY codComprobante DESC

    END
ELSE
   BEGIN
    -- En caso contrario se analizan los parametros pasados
             IF @docIdentidad=''
                     SET @docIdentidad='%'

             IF @docIdentidad=''
                     SET @docIdentidad='%'

             IF @docIdentidad=''
                     SET @docIdentidad='%'


               SELECT top 10 codComprobante,docIdentidad,codServicio, tipoServ, EstadoActual
               from

         ( SELECT codComprobante,docIdentidad,codServicio, tipoServ, EstadoActual,
                ROW_NUMBER() OVER (ORDER BY codComprobante DESC) AS NumOrden 
                from vw_VistaFacturas1
                where 
                     docIdentidad like '%' + @docIdentidad + '%'
                 and EstadoActual like  '%' + @estado + '%'

            ) AS CONSULTAPAGINADA 
            WHERE NumOrden BETWEEN @PageSize * @NUMPAG + 1 AND @PageSize * (@NUMPAG + 1)
                ORDER BY codComprobante desc 
END
go
---
select * from tb_Comprobante

exec usp_ListarFacturas_Paginacion @docIdentidad='', @estado='Cancelada', @NumPag=0

--drop procedure usp_NumPag_ListarFacturas_Paginacion
CREATE  PROCEDURE usp_NumPag_ListarFacturas_Paginacion
@docIdentidad varchar(20),
@estado varchar(10),
@NUMREG    INT OUTPUT
AS
-- OBTIENE EL NUMERO DE REGITROS DEL usp_ListarFacturas_Paginacion
    IF @docIdentidad=''  AND  @estado='' 
       -- Si no hay valores significativos en los parametros devuelve 50 o si la cantidad de registeos
       -- que existan 
        BEGIN
        DECLARE @CONTADOR INT
        SET @CONTADOR=(SELECT COUNT (*)   from vw_VistaFacturas1)
        IF  @CONTADOR>=2
            SET @NUMREG=2
        ELSE
            SET @NUMREG=@CONTADOR
        END
    ELSE
        BEGIN
              -- En caso contrario se analizan los parametros pasados y se obtiene el numero de registros que cumplen
            -- las condiciones de filtrado
             IF @docIdentidad=''
                     SET @docIdentidad='%'
             IF @estado=''
                     SET @estado='%'

            SET @NUMREG=
            (    SELECT COUNT (*)  from vw_VistaFacturas1
                where 
                     docIdentidad like '%' + @docIdentidad + '%'
                 and EstadoActual like  '%' + @estado + '%')
        END
GO

declare @registros int
execute usp_NumPag_ListarFacturas_Paginacion '','Cancelada',@registros output
Print @registros
go

--
-- usp
--drop procedure usp_ListarFacturasClienteFechas
create procedure usp_ListarFacturasClienteFechas
@docIdentidad varchar(15),
@fecIni smalldatetime,
@fecFin smalldatetime
as
	select tb_Comprobante.codComprobante, tb_Comprobante.fechaEmision, fech_ult_mod , tb_Cliente.docIdentidad,
	case when estado=0 then 'Pendiente'
	when estado=1 then 'Cancelado' end as Estado,
	precio
	from tb_Comprobante inner join tb_Cliente
	on tb_Comprobante.docIdentidad = tb_Cliente.docIdentidad
	inner join tb_Detalle_Servicio
	on tb_Comprobante.codComprobante = tb_Detalle_Servicio.codComprobante
	inner join tb_Servicios on tb_Servicios.codServicio = tb_Detalle_Servicio.codServicio

	where tb_Cliente.docIdentidad=@docIdentidad and tb_Comprobante.fechaEmision between @fecIni and @fecFin
	order by codComprobante
go
exec usp_ListarFacturasClienteFechas @docIdentidad='32165487', @fecIni='2022-07-12'   ,@fecFin='2022-08-13 02:30:00.283'

select * from tb_Comprobante

select * from tb_Cliente

exec usp_ListarClientes

select * from tb_Cliente
select * from tb_usuario