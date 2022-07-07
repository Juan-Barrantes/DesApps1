-- USP Ubigeo
go
---- 1
use bd_NegocioAutosA1
create procedure usp_Ubigeo_Departamentos
as
SELECT DISTINCT IDDEPA,DEPARTAMENTO 
  FROM TB_UBIGEO
  ORDER BY Departamento 
go
exec usp_Ubigeo_Departamentos
go

--- 2
create procedure usp_Ubigeo_ProvinciasDepartamento
@IdDepartamento char(2)
as
SELECT  DISTINCT IDPROV,PROVINCIA
FROM TB_UBIGEO
WHERE IDDEPA=@IdDepartamento
ORDER BY Provincia 
go
exec usp_Ubigeo_ProvinciasDepartamento @IdDepartamento='01'

--- 3------------
--drop procedure usp_Ubigeo_DistritosProvinciaDepartamento
create procedure usp_Ubigeo_DistritosProvinciaDepartamento
	@IdDepartamento char(2),
@IdProvincia char(2)
as
SELECT  IDDIST,DISTRITO
FROM TB_UBIGEO
WHERE IDDEPA=@IdDepartamento AND IDPROV=@IdProvincia
ORDER BY Distrito 
go
exec usp_Ubigeo_DistritosProvinciaDepartamento @IdDepartamento='01'  ,@IdProvincia='01'
go