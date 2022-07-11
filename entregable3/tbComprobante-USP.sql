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
go
--Vista de Comprobante
create View tb_Comprobante
as
select
	codComprobante ,
	docIdentidad ,	
	nombre,
	apellido,
	fechaEmision ,
	estado ,
	usu_reg ,
	fec_reg ,
	usu_ult_mod ,
	fech_ult_mod 
from tb_Comprobante inner join tb_Cliente
on tb_Comprobante.docIdentidad = tb_Cliente.docIdentidad


--USP para comprobante
--