CREATE DATABASE bd_NegocioAutosA1;

--drop database bd_NegocioAutosA1

Use bd_NegocioAutosA1;
--delete from tb_Ubigeo

create table tb_Ubigeo(
	Id_Ubigeo nchar(6) primary key not null,
	IdDepa varchar(255),
	IdProv varchar(255),
	IdDist varchar(255),
	Departamento varchar(255),
	Provincia varchar(255),
	Distrito varchar(255),
	Cod_Ven char(4)
);


Create Table tb_Agencia(
	codAgencia smallint not null PRIMARY KEY,
	Id_Ubigeo nchar(6) not null FOREIGN KEY REFERENCES tb_Ubigeo ,
	direccion varchar(75) not null,
	telefono varchar(25) not null);

/*
CREATE TABLE tb_Marca(
	codMarca varchar(20) not null PRIMARY KEY,
	nomMarca varchar(20) not null,
	paisOrg varchar(20) not null); */

	--borramos tb servicio, comprobante, detalle_servicio
	select * from tb_Detalle_Servicio	

CREATE TABLE tb_Servicios(
	codServicio smallint not null PRIMARY KEY,
	tipoServ varchar(50) not null,
	precio money not null,
	--editando
	usu_reg varchar(20),
	fec_reg datetime,
	usu_ult_mod varchar(20),
	fec_ult_mod datetime
	);
	

Create Table tb_Cochera( --cochera dentro de una agencia, borramos direccion
	codCochera smallint not null PRIMARY KEY,
	codAgencia smallint not null FOREIGN KEY REFERENCES tb_Agencia,
	--direccion varchar(75) not null,
	capacidad smallint not null);

Create Table tb_Auto(
	placa char(6) not null PRIMARY KEY,
	codCochera smallint not null FOREIGN KEY REFERENCES tb_Cochera,
	marca varchar(20) not null,	
	modelo varchar(20) not null,
	añoFabricacion smallint null,
	precio money not null);

Create Table tb_Cliente(
	docIdentidad varchar(15) not null PRIMARY KEY,
	tipoDocumento varchar(25) not null,
	apellidos varchar(35) not null,
	nombre varchar(35) not null,
	Id_Ubigeo nchar(6) not null FOREIGN KEY REFERENCES tb_Ubigeo ,
	direccion varchar(75) null,
	telefono varchar(25) not null,
	usu_reg varchar(20),
	fec_reg datetime,
	usu_ult_mod varchar(20),
	fec_ult_mod datetime,
	estado_cli int
	);

Create Table tb_Reserva(
	codReserva integer not null PRIMARY KEY,
	codAgencia smallint not null Foreign Key REFERENCES tb_Agencia,
	docIdentidad varchar(15) not null Foreign Key REFERENCES tb_Cliente,
	cantidadAutos tinyint not null,
	fechaInicio datetime not null,
	fechaFinal datetime not null);

--drop table tb_Empleado;
CREATE TABLE tb_Empleado(
	codEmpleado smallint not null PRIMARY KEY,
	codAgencia smallint not null FOREIGN KEY REFERENCES tb_Agencia,
	nomEmpleado varchar (20) not null,
	apeEmpleado varchar (20) not null,
	Id_Ubigeo nchar(6) not null FOREIGN KEY REFERENCES tb_Ubigeo ,
	dirEmpleado varchar(45) not null,
	telefono varchar(25) not null,
	sueldo money,
	fecini datetime not null,
	fecnac datetime not null,
	cargo varchar(20) not null,
	correo varchar(50) not null,
	usu_reg varchar(20),
	fec_reg datetime,
	usu_ult_mod varchar(20),
	fech_ult_mod datetime
	);
	--drop table tb_Comprobante
	
CREATE TABLE tb_Comprobante(
	codComprobante smallint not null PRIMARY KEY,
	docIdentidad varchar(15) not null Foreign Key REFERENCES tb_Cliente,
	--codServicio	smallint not null Foreign Key REFERENCES tb_Servicios,
	fechaEmision datetime not null,
	estado int not null,
	usu_reg varchar(20),
	fec_reg datetime,
	usu_ult_mod varchar(20),
	fech_ult_mod datetime
	);
create table tb_Detalle_Servicio(
	docIdentidad varchar(15) not null Foreign Key REFERENCES tb_Cliente,
	codComprobante smallint not null foreign key references tb_Comprobante,
	codServicio smallint not null foreign key references tb_Servicios,
	);
/*
create table tb_Cliente_Servicio(
	codComprobante smallint not null foreign key references tb_Comprobante,
	codServicio smallint not null foreign key references tb_Servicios,
	docIdentidad varchar(15) not null foreign key references tb_Cliente,
	); */
	
go
--Insertar tb_Ubigeo
--delete tb_Ubigeo

INSERT INTO tb_Ubigeo(Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('010101', '01', '01', '01', 'AMAZONAS', 'CHACHAPOYAS', 'CHACHAPOYAS');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('010102', '01', '01', '02', 'AMAZONAS', 'CHACHAPOYAS', 'ASUNCION');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('010103', '01', '01', '03', 'AMAZONAS', 'CHACHAPOYAS', 'BALSAS');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('010104', '01', '01', '04', 'AMAZONAS', 'CHACHAPOYAS', 'CHETO');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('010105', '01', '01', '05', 'AMAZONAS', 'CHACHAPOYAS', 'CHILIQUIN');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('010106', '01', '01', '06', 'AMAZONAS', 'CHACHAPOYAS', 'CHUQUIBAMBA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('010107', '01', '01', '07', 'AMAZONAS', 'CHACHAPOYAS', 'GRANADA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('010108', '01', '01', '08', 'AMAZONAS', 'CHACHAPOYAS', 'HUANCAS');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('010109', '01', '01', '09', 'AMAZONAS', 'CHACHAPOYAS', 'LA JALCA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('010110', '01', '01', '10', 'AMAZONAS', 'CHACHAPOYAS', 'LEIMEBAMBA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('010111', '01', '01', '11', 'AMAZONAS', 'CHACHAPOYAS', 'LEVANTO');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('010112', '01', '01', '12', 'AMAZONAS', 'CHACHAPOYAS', 'MAGDALENA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('010113', '01', '01', '13', 'AMAZONAS', 'CHACHAPOYAS', 'MARISCAL CASTILLA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('010114', '01', '01', '14', 'AMAZONAS', 'CHACHAPOYAS', 'MOLINOPAMPA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('010115', '01', '01', '15', 'AMAZONAS', 'CHACHAPOYAS', 'MONTEVIDEO');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('010116', '01', '01', '16', 'AMAZONAS', 'CHACHAPOYAS', 'OLLEROS');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('010117', '01', '01', '17', 'AMAZONAS', 'CHACHAPOYAS', 'QUINJALCA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('010118', '01', '01', '18', 'AMAZONAS', 'CHACHAPOYAS', 'SAN FRANCISCO DE DAGUAS');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('010119', '01', '01', '19', 'AMAZONAS', 'CHACHAPOYAS', 'SAN ISIDRO DE MAINO');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('010120', '01', '01', '20', 'AMAZONAS', 'CHACHAPOYAS', 'SOLOCO');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('010121', '01', '01', '21', 'AMAZONAS', 'CHACHAPOYAS', 'SONCHE');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('010201', '01', '02', '01', 'AMAZONAS', 'BAGUA', 'LA PECA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('010202', '01', '02', '02', 'AMAZONAS', 'BAGUA', 'ARAMANGO');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('010203', '01', '02', '03', 'AMAZONAS', 'BAGUA', 'COPALLIN');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('010204', '01', '02', '04', 'AMAZONAS', 'BAGUA', 'EL PARCO');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('010205', '01', '02', '05', 'AMAZONAS', 'BAGUA', 'BAGUA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('010206', '01', '02', '06', 'AMAZONAS', 'BAGUA', 'IMAZA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('010301', '01', '03', '01', 'AMAZONAS', 'BONGARA', 'JUMBILLA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('010302', '01', '03', '02', 'AMAZONAS', 'BONGARA', 'COROSHA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('010303', '01', '03', '03', 'AMAZONAS', 'BONGARA', 'CUISPES');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('010304', '01', '03', '04', 'AMAZONAS', 'BONGARA', 'CHISQUILLA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('010305', '01', '03', '05', 'AMAZONAS', 'BONGARA', 'CHURUJA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('010306', '01', '03', '06', 'AMAZONAS', 'BONGARA', 'FLORIDA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('010307', '01', '03', '07', 'AMAZONAS', 'BONGARA', 'RECTA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('010308', '01', '03', '08', 'AMAZONAS', 'BONGARA', 'SAN CARLOS');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('010309', '01', '03', '09', 'AMAZONAS', 'BONGARA', 'SHIPASBAMBA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('010310', '01', '03', '10', 'AMAZONAS', 'BONGARA', 'VALERA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('010311', '01', '03', '11', 'AMAZONAS', 'BONGARA', 'YAMBRASBAMBA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('010312', '01', '03', '12', 'AMAZONAS', 'BONGARA', 'JAZAN');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('010401', '01', '04', '01', 'AMAZONAS', 'LUYA', 'LAMUD');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('010402', '01', '04', '02', 'AMAZONAS', 'LUYA', 'CAMPORREDONDO');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('010403', '01', '04', '03', 'AMAZONAS', 'LUYA', 'COCABAMBA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('010404', '01', '04', '04', 'AMAZONAS', 'LUYA', 'COLCAMAR');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('010405', '01', '04', '05', 'AMAZONAS', 'LUYA', 'CONILA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('010406', '01', '04', '06', 'AMAZONAS', 'LUYA', 'INGUILPATA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('010407', '01', '04', '07', 'AMAZONAS', 'LUYA', 'LONGUITA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('010408', '01', '04', '08', 'AMAZONAS', 'LUYA', 'LONYA CHICO');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('010409', '01', '04', '09', 'AMAZONAS', 'LUYA', 'LUYA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('010410', '01', '04', '10', 'AMAZONAS', 'LUYA', 'LUYA VIEJO');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('010411', '01', '04', '11', 'AMAZONAS', 'LUYA', 'MARIA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('010412', '01', '04', '12', 'AMAZONAS', 'LUYA', 'OCALLI');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('010413', '01', '04', '13', 'AMAZONAS', 'LUYA', 'OCUMAL');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('010414', '01', '04', '14', 'AMAZONAS', 'LUYA', 'PISUQUIA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('010415', '01', '04', '15', 'AMAZONAS', 'LUYA', 'SAN CRISTOBAL');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('010416', '01', '04', '16', 'AMAZONAS', 'LUYA', 'SAN FRANCISCO DE YESO');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('010417', '01', '04', '17', 'AMAZONAS', 'LUYA', 'SAN JERONIMO');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('010418', '01', '04', '18', 'AMAZONAS', 'LUYA', 'SAN JUAN DE LOPECANCHA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('010419', '01', '04', '19', 'AMAZONAS', 'LUYA', 'SANTA CATALINA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('010420', '01', '04', '20', 'AMAZONAS', 'LUYA', 'SANTO TOMAS');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('010421', '01', '04', '21', 'AMAZONAS', 'LUYA', 'TINGO');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('010422', '01', '04', '22', 'AMAZONAS', 'LUYA', 'TRITA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('010423', '01', '04', '23', 'AMAZONAS', 'LUYA', 'PROVIDENCIA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('010501', '01', '05', '01', 'AMAZONAS', 'RODRIGUEZ DE MENDOZA', 'SAN NICOLAS');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('010502', '01', '05', '02', 'AMAZONAS', 'RODRIGUEZ DE MENDOZA', 'COCHAMAL');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('010503', '01', '05', '03', 'AMAZONAS', 'RODRIGUEZ DE MENDOZA', 'CHIRIMOTO');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('010504', '01', '05', '04', 'AMAZONAS', 'RODRIGUEZ DE MENDOZA', 'HUAMBO');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('010505', '01', '05', '05', 'AMAZONAS', 'RODRIGUEZ DE MENDOZA', 'LIMABAMBA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('010506', '01', '05', '06', 'AMAZONAS', 'RODRIGUEZ DE MENDOZA', 'LONGAR');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('010507', '01', '05', '07', 'AMAZONAS', 'RODRIGUEZ DE MENDOZA', 'MILPUCC');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('010508', '01', '05', '08', 'AMAZONAS', 'RODRIGUEZ DE MENDOZA', 'MARISCAL BENAVIDES');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('010509', '01', '05', '09', 'AMAZONAS', 'RODRIGUEZ DE MENDOZA', 'OMIA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('010510', '01', '05', '10', 'AMAZONAS', 'RODRIGUEZ DE MENDOZA', 'SANTA ROSA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('010511', '01', '05', '11', 'AMAZONAS', 'RODRIGUEZ DE MENDOZA', 'TOTORA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('010512', '01', '05', '12', 'AMAZONAS', 'RODRIGUEZ DE MENDOZA', 'VISTA ALEGRE');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('010601', '01', '06', '01', 'AMAZONAS', 'CONDORCANQUI', 'NIEVA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('010602', '01', '06', '02', 'AMAZONAS', 'CONDORCANQUI', 'RIO SANTIAGO');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('010603', '01', '06', '03', 'AMAZONAS', 'CONDORCANQUI', 'EL CENEPA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('010701', '01', '07', '01', 'AMAZONAS', 'UTCUBAMBA', 'BAGUA GRANDE');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('010702', '01', '07', '02', 'AMAZONAS', 'UTCUBAMBA', 'CAJARURO');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('010703', '01', '07', '03', 'AMAZONAS', 'UTCUBAMBA', 'CUMBA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('010704', '01', '07', '04', 'AMAZONAS', 'UTCUBAMBA', 'EL MILAGRO');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('010705', '01', '07', '05', 'AMAZONAS', 'UTCUBAMBA', 'JAMALCA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('010706', '01', '07', '06', 'AMAZONAS', 'UTCUBAMBA', 'LONYA GRANDE');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('010707', '01', '07', '07', 'AMAZONAS', 'UTCUBAMBA', 'YAMON');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('020101', '02', '01', '01', 'ANCASH', 'HUARAZ', 'HUARAZ');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('020102', '02', '01', '02', 'ANCASH', 'HUARAZ', 'INDEPENDENCIA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('020103', '02', '01', '03', 'ANCASH', 'HUARAZ', 'COCHABAMBA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('020104', '02', '01', '04', 'ANCASH', 'HUARAZ', 'COLCABAMBA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('020105', '02', '01', '05', 'ANCASH', 'HUARAZ', 'HUANCHAY');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('020106', '02', '01', '06', 'ANCASH', 'HUARAZ', 'JANGAS');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('020107', '02', '01', '07', 'ANCASH', 'HUARAZ', 'LA LIBERTAD');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('020108', '02', '01', '08', 'ANCASH', 'HUARAZ', 'OLLEROS');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('020109', '02', '01', '09', 'ANCASH', 'HUARAZ', 'PAMPAS GRANDE');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('020110', '02', '01', '10', 'ANCASH', 'HUARAZ', 'PARIACOTO');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('020111', '02', '01', '11', 'ANCASH', 'HUARAZ', 'PIRA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('020112', '02', '01', '12', 'ANCASH', 'HUARAZ', 'TARICA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('020201', '02', '02', '01', 'ANCASH', 'AIJA', 'AIJA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('020203', '02', '02', '03', 'ANCASH', 'AIJA', 'CORIS');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('020205', '02', '02', '05', 'ANCASH', 'AIJA', 'HUACLLAN');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('020206', '02', '02', '06', 'ANCASH', 'AIJA', 'LA MERCED');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('020208', '02', '02', '08', 'ANCASH', 'AIJA', 'SUCCHA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('020301', '02', '03', '01', 'ANCASH', 'BOLOGNESI', 'CHIQUIAN');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('020302', '02', '03', '02', 'ANCASH', 'BOLOGNESI', 'ABELARDO PARDO LEZAMETA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('020304', '02', '03', '04', 'ANCASH', 'BOLOGNESI', 'AQUIA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('020305', '02', '03', '05', 'ANCASH', 'BOLOGNESI', 'CAJACAY');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('020310', '02', '03', '10', 'ANCASH', 'BOLOGNESI', 'HUAYLLACAYAN');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('020311', '02', '03', '11', 'ANCASH', 'BOLOGNESI', 'HUASTA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('020313', '02', '03', '13', 'ANCASH', 'BOLOGNESI', 'MANGAS');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('020315', '02', '03', '15', 'ANCASH', 'BOLOGNESI', 'PACLLON');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('020317', '02', '03', '17', 'ANCASH', 'BOLOGNESI', 'SAN MIGUEL DE CORPANQUI');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('020320', '02', '03', '20', 'ANCASH', 'BOLOGNESI', 'TICLLOS');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('020321', '02', '03', '21', 'ANCASH', 'BOLOGNESI', 'ANTONIO RAIMONDI');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('020322', '02', '03', '22', 'ANCASH', 'BOLOGNESI', 'CANIS');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('020323', '02', '03', '23', 'ANCASH', 'BOLOGNESI', 'COLQUIOC');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('020324', '02', '03', '24', 'ANCASH', 'BOLOGNESI', 'LA PRIMAVERA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('020325', '02', '03', '25', 'ANCASH', 'BOLOGNESI', 'HUALLANCA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('020401', '02', '04', '01', 'ANCASH', 'CARHUAZ', 'CARHUAZ');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('020402', '02', '04', '02', 'ANCASH', 'CARHUAZ', 'ACOPAMPA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('020403', '02', '04', '03', 'ANCASH', 'CARHUAZ', 'AMASHCA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('020404', '02', '04', '04', 'ANCASH', 'CARHUAZ', 'ANTA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('020405', '02', '04', '05', 'ANCASH', 'CARHUAZ', 'ATAQUERO');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('020406', '02', '04', '06', 'ANCASH', 'CARHUAZ', 'MARCARA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('020407', '02', '04', '07', 'ANCASH', 'CARHUAZ', 'PARIAHUANCA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('020408', '02', '04', '08', 'ANCASH', 'CARHUAZ', 'SAN MIGUEL DE ACO');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('020409', '02', '04', '09', 'ANCASH', 'CARHUAZ', 'SHILLA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('020410', '02', '04', '10', 'ANCASH', 'CARHUAZ', 'TINCO');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('020411', '02', '04', '11', 'ANCASH', 'CARHUAZ', 'YUNGAR');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('020501', '02', '05', '01', 'ANCASH', 'CASMA', 'CASMA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('020502', '02', '05', '02', 'ANCASH', 'CASMA', 'BUENA VISTA ALTA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('020503', '02', '05', '03', 'ANCASH', 'CASMA', 'COMANDANTE NOEL');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('020505', '02', '05', '05', 'ANCASH', 'CASMA', 'YAUTAN');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('020601', '02', '06', '01', 'ANCASH', 'CORONGO', 'CORONGO');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('020602', '02', '06', '02', 'ANCASH', 'CORONGO', 'ACO');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('020603', '02', '06', '03', 'ANCASH', 'CORONGO', 'BAMBAS');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('020604', '02', '06', '04', 'ANCASH', 'CORONGO', 'CUSCA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('020605', '02', '06', '05', 'ANCASH', 'CORONGO', 'LA PAMPA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('020606', '02', '06', '06', 'ANCASH', 'CORONGO', 'YANAC');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('020607', '02', '06', '07', 'ANCASH', 'CORONGO', 'YUPAN');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('020701', '02', '07', '01', 'ANCASH', 'HUAYLAS', 'CARAZ');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('020702', '02', '07', '02', 'ANCASH', 'HUAYLAS', 'HUALLANCA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('020703', '02', '07', '03', 'ANCASH', 'HUAYLAS', 'HUATA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('020704', '02', '07', '04', 'ANCASH', 'HUAYLAS', 'HUAYLAS');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('020705', '02', '07', '05', 'ANCASH', 'HUAYLAS', 'MATO');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('020706', '02', '07', '06', 'ANCASH', 'HUAYLAS', 'PAMPAROMAS');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('020707', '02', '07', '07', 'ANCASH', 'HUAYLAS', 'PUEBLO LIBRE');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('020708', '02', '07', '08', 'ANCASH', 'HUAYLAS', 'SANTA CRUZ');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('020709', '02', '07', '09', 'ANCASH', 'HUAYLAS', 'YURACMARCA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('020710', '02', '07', '10', 'ANCASH', 'HUAYLAS', 'SANTO TORIBIO');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('020801', '02', '08', '01', 'ANCASH', 'HUARI', 'HUARI');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('020802', '02', '08', '02', 'ANCASH', 'HUARI', 'CAJAY');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('020803', '02', '08', '03', 'ANCASH', 'HUARI', 'CHAVIN DE HUANTAR');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('020804', '02', '08', '04', 'ANCASH', 'HUARI', 'HUACACHI');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('020805', '02', '08', '05', 'ANCASH', 'HUARI', 'HUACHIS');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('020806', '02', '08', '06', 'ANCASH', 'HUARI', 'HUACCHIS');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('020807', '02', '08', '07', 'ANCASH', 'HUARI', 'HUANTAR');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('020808', '02', '08', '08', 'ANCASH', 'HUARI', 'MASIN');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('020809', '02', '08', '09', 'ANCASH', 'HUARI', 'PAUCAS');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('020810', '02', '08', '10', 'ANCASH', 'HUARI', 'PONTO');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('020811', '02', '08', '11', 'ANCASH', 'HUARI', 'RAHUAPAMPA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('020812', '02', '08', '12', 'ANCASH', 'HUARI', 'RAPAYAN');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('020813', '02', '08', '13', 'ANCASH', 'HUARI', 'SAN MARCOS');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('020814', '02', '08', '14', 'ANCASH', 'HUARI', 'SAN PEDRO DE CHANA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('020815', '02', '08', '15', 'ANCASH', 'HUARI', 'UCO');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('020816', '02', '08', '16', 'ANCASH', 'HUARI', 'ANRA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('020901', '02', '09', '01', 'ANCASH', 'MARISCAL LUZURIAGA', 'PISCOBAMBA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('020902', '02', '09', '02', 'ANCASH', 'MARISCAL LUZURIAGA', 'CASCA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('020903', '02', '09', '03', 'ANCASH', 'MARISCAL LUZURIAGA', 'LUCMA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('020904', '02', '09', '04', 'ANCASH', 'MARISCAL LUZURIAGA', 'FIDEL OLIVAS ESCUDERO');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('020905', '02', '09', '05', 'ANCASH', 'MARISCAL LUZURIAGA', 'LLAMA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('020906', '02', '09', '06', 'ANCASH', 'MARISCAL LUZURIAGA', 'LLUMPA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('020907', '02', '09', '07', 'ANCASH', 'MARISCAL LUZURIAGA', 'MUSGA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('020908', '02', '09', '08', 'ANCASH', 'MARISCAL LUZURIAGA', 'ELEAZAR GUZMAN BARRON');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('021001', '02', '10', '01', 'ANCASH', 'PALLASCA', 'CABANA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('021002', '02', '10', '02', 'ANCASH', 'PALLASCA', 'BOLOGNESI');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('021003', '02', '10', '03', 'ANCASH', 'PALLASCA', 'CONCHUCOS');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('021004', '02', '10', '04', 'ANCASH', 'PALLASCA', 'HUACASCHUQUE');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('021005', '02', '10', '05', 'ANCASH', 'PALLASCA', 'HUANDOVAL');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('021006', '02', '10', '06', 'ANCASH', 'PALLASCA', 'LACABAMBA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('021007', '02', '10', '07', 'ANCASH', 'PALLASCA', 'LLAPO');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('021008', '02', '10', '08', 'ANCASH', 'PALLASCA', 'PALLASCA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('021009', '02', '10', '09', 'ANCASH', 'PALLASCA', 'PAMPAS');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('021010', '02', '10', '10', 'ANCASH', 'PALLASCA', 'SANTA ROSA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('021011', '02', '10', '11', 'ANCASH', 'PALLASCA', 'TAUCA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('021101', '02', '11', '01', 'ANCASH', 'POMABAMBA', 'POMABAMBA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('021102', '02', '11', '02', 'ANCASH', 'POMABAMBA', 'HUAYLLAN');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('021103', '02', '11', '03', 'ANCASH', 'POMABAMBA', 'PAROBAMBA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('021104', '02', '11', '04', 'ANCASH', 'POMABAMBA', 'QUINUABAMBA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('021201', '02', '12', '01', 'ANCASH', 'RECUAY', 'RECUAY');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('021202', '02', '12', '02', 'ANCASH', 'RECUAY', 'COTAPARACO');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('021203', '02', '12', '03', 'ANCASH', 'RECUAY', 'HUAYLLAPAMPA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('021204', '02', '12', '04', 'ANCASH', 'RECUAY', 'MARCA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('021205', '02', '12', '05', 'ANCASH', 'RECUAY', 'PAMPAS CHICO');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('021206', '02', '12', '06', 'ANCASH', 'RECUAY', 'PARARIN');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('021207', '02', '12', '07', 'ANCASH', 'RECUAY', 'TAPACOCHA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('021208', '02', '12', '08', 'ANCASH', 'RECUAY', 'TICAPAMPA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('021209', '02', '12', '09', 'ANCASH', 'RECUAY', 'LLACLLIN');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('021210', '02', '12', '10', 'ANCASH', 'RECUAY', 'CATAC');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('021301', '02', '13', '01', 'ANCASH', 'SANTA', 'CHIMBOTE');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('021302', '02', '13', '02', 'ANCASH', 'SANTA', 'CACERES DEL PERU');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('021303', '02', '13', '03', 'ANCASH', 'SANTA', 'MACATE');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('021304', '02', '13', '04', 'ANCASH', 'SANTA', 'MORO');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('021305', '02', '13', '05', 'ANCASH', 'SANTA', 'NEPEÑA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('021306', '02', '13', '06', 'ANCASH', 'SANTA', 'SAMANCO');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('021307', '02', '13', '07', 'ANCASH', 'SANTA', 'SANTA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('021308', '02', '13', '08', 'ANCASH', 'SANTA', 'COISHCO');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('021309', '02', '13', '09', 'ANCASH', 'SANTA', 'NUEVO CHIMBOTE');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('021401', '02', '14', '01', 'ANCASH', 'SIHUAS', 'SIHUAS');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('021402', '02', '14', '02', 'ANCASH', 'SIHUAS', 'ALFONSO UGARTE');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('021403', '02', '14', '03', 'ANCASH', 'SIHUAS', 'CHINGALPO');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('021404', '02', '14', '04', 'ANCASH', 'SIHUAS', 'HUAYLLABAMBA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('021405', '02', '14', '05', 'ANCASH', 'SIHUAS', 'QUICHES');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('021406', '02', '14', '06', 'ANCASH', 'SIHUAS', 'SICSIBAMBA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('021407', '02', '14', '07', 'ANCASH', 'SIHUAS', 'ACOBAMBA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('021408', '02', '14', '08', 'ANCASH', 'SIHUAS', 'CASHAPAMPA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('021409', '02', '14', '09', 'ANCASH', 'SIHUAS', 'RAGASH');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('021410', '02', '14', '10', 'ANCASH', 'SIHUAS', 'SAN JUAN');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('021501', '02', '15', '01', 'ANCASH', 'YUNGAY', 'YUNGAY');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('021502', '02', '15', '02', 'ANCASH', 'YUNGAY', 'CASCAPARA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('021503', '02', '15', '03', 'ANCASH', 'YUNGAY', 'MANCOS');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('021504', '02', '15', '04', 'ANCASH', 'YUNGAY', 'MATACOTO');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('021505', '02', '15', '05', 'ANCASH', 'YUNGAY', 'QUILLO');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('021506', '02', '15', '06', 'ANCASH', 'YUNGAY', 'RANRAHIRCA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('021507', '02', '15', '07', 'ANCASH', 'YUNGAY', 'SHUPLUY');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('021508', '02', '15', '08', 'ANCASH', 'YUNGAY', 'YANAMA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('021601', '02', '16', '01', 'ANCASH', 'ANTONIO RAIMONDI', 'LLAMELLIN');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('021602', '02', '16', '02', 'ANCASH', 'ANTONIO RAIMONDI', 'ACZO');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('021603', '02', '16', '03', 'ANCASH', 'ANTONIO RAIMONDI', 'CHACCHO');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('021604', '02', '16', '04', 'ANCASH', 'ANTONIO RAIMONDI', 'CHINGAS');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('021605', '02', '16', '05', 'ANCASH', 'ANTONIO RAIMONDI', 'MIRGAS');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('021606', '02', '16', '06', 'ANCASH', 'ANTONIO RAIMONDI', 'SAN JUAN DE RONTOY');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('021701', '02', '17', '01', 'ANCASH', 'CARLOS FERMIN FITZCARRALD', 'SAN LUIS');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('021702', '02', '17', '02', 'ANCASH', 'CARLOS FERMIN FITZCARRALD', 'YAUYA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('021703', '02', '17', '03', 'ANCASH', 'CARLOS FERMIN FITZCARRALD', 'SAN NICOLAS');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('021801', '02', '18', '01', 'ANCASH', 'ASUNCION', 'CHACAS');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('021802', '02', '18', '02', 'ANCASH', 'ASUNCION', 'ACOCHACA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('021901', '02', '19', '01', 'ANCASH', 'HUARMEY', 'HUARMEY');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('021902', '02', '19', '02', 'ANCASH', 'HUARMEY', 'COCHAPETI');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('021903', '02', '19', '03', 'ANCASH', 'HUARMEY', 'HUAYAN');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('021904', '02', '19', '04', 'ANCASH', 'HUARMEY', 'MALVAS');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('021905', '02', '19', '05', 'ANCASH', 'HUARMEY', 'CULEBRAS');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('022001', '02', '20', '01', 'ANCASH', 'OCROS', 'ACAS');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('022002', '02', '20', '02', 'ANCASH', 'OCROS', 'CAJAMARQUILLA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('022003', '02', '20', '03', 'ANCASH', 'OCROS', 'CARHUAPAMPA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('022004', '02', '20', '04', 'ANCASH', 'OCROS', 'COCHAS');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('022005', '02', '20', '05', 'ANCASH', 'OCROS', 'CONGAS');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('022006', '02', '20', '06', 'ANCASH', 'OCROS', 'LLIPA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('022007', '02', '20', '07', 'ANCASH', 'OCROS', 'OCROS');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('022008', '02', '20', '08', 'ANCASH', 'OCROS', 'SAN CRISTOBAL DE RAJAN');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('022009', '02', '20', '09', 'ANCASH', 'OCROS', 'SAN PEDRO');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('022010', '02', '20', '10', 'ANCASH', 'OCROS', 'SANTIAGO DE CHILCAS');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('030101', '03', '01', '01', 'APURIMAC', 'ABANCAY', 'ABANCAY');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('030102', '03', '01', '02', 'APURIMAC', 'ABANCAY', 'CIRCA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('030103', '03', '01', '03', 'APURIMAC', 'ABANCAY', 'CURAHUASI');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('030104', '03', '01', '04', 'APURIMAC', 'ABANCAY', 'CHACOCHE');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('030105', '03', '01', '05', 'APURIMAC', 'ABANCAY', 'HUANIPACA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('030106', '03', '01', '06', 'APURIMAC', 'ABANCAY', 'LAMBRAMA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('030107', '03', '01', '07', 'APURIMAC', 'ABANCAY', 'PICHIRHUA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('030108', '03', '01', '08', 'APURIMAC', 'ABANCAY', 'SAN PEDRO DE CACHORA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('030109', '03', '01', '09', 'APURIMAC', 'ABANCAY', 'TAMBURCO');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('030201', '03', '02', '01', 'APURIMAC', 'AYMARAES', 'CHALHUANCA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('030202', '03', '02', '02', 'APURIMAC', 'AYMARAES', 'CAPAYA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('030203', '03', '02', '03', 'APURIMAC', 'AYMARAES', 'CARAYBAMBA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('030204', '03', '02', '04', 'APURIMAC', 'AYMARAES', 'COLCABAMBA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('030205', '03', '02', '05', 'APURIMAC', 'AYMARAES', 'COTARUSE');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('030206', '03', '02', '06', 'APURIMAC', 'AYMARAES', 'CHAPIMARCA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('030207', '03', '02', '07', 'APURIMAC', 'AYMARAES', 'HUAYLLO');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('030208', '03', '02', '08', 'APURIMAC', 'AYMARAES', 'LUCRE');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('030209', '03', '02', '09', 'APURIMAC', 'AYMARAES', 'POCOHUANCA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('030210', '03', '02', '10', 'APURIMAC', 'AYMARAES', 'SAÑAYCA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('030211', '03', '02', '11', 'APURIMAC', 'AYMARAES', 'SORAYA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('030212', '03', '02', '12', 'APURIMAC', 'AYMARAES', 'TAPAIRIHUA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('030213', '03', '02', '13', 'APURIMAC', 'AYMARAES', 'TINTAY');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('030214', '03', '02', '14', 'APURIMAC', 'AYMARAES', 'TORAYA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('030215', '03', '02', '15', 'APURIMAC', 'AYMARAES', 'YANACA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('030216', '03', '02', '16', 'APURIMAC', 'AYMARAES', 'SAN JUAN DE CHACÑA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('030217', '03', '02', '17', 'APURIMAC', 'AYMARAES', 'JUSTO APU SAHUARAURA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('030301', '03', '03', '01', 'APURIMAC', 'ANDAHUAYLAS', 'ANDAHUAYLAS');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('030302', '03', '03', '02', 'APURIMAC', 'ANDAHUAYLAS', 'ANDARAPA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('030303', '03', '03', '03', 'APURIMAC', 'ANDAHUAYLAS', 'CHIARA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('030304', '03', '03', '04', 'APURIMAC', 'ANDAHUAYLAS', 'HUANCARAMA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('030305', '03', '03', '05', 'APURIMAC', 'ANDAHUAYLAS', 'HUANCARAY');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('030306', '03', '03', '06', 'APURIMAC', 'ANDAHUAYLAS', 'KISHUARA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('030307', '03', '03', '07', 'APURIMAC', 'ANDAHUAYLAS', 'PACOBAMBA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('030308', '03', '03', '08', 'APURIMAC', 'ANDAHUAYLAS', 'PAMPACHIRI');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('030309', '03', '03', '09', 'APURIMAC', 'ANDAHUAYLAS', 'SAN ANTONIO DE CACHI');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('030310', '03', '03', '10', 'APURIMAC', 'ANDAHUAYLAS', 'SAN JERONIMO');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('030311', '03', '03', '11', 'APURIMAC', 'ANDAHUAYLAS', 'TALAVERA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('030312', '03', '03', '12', 'APURIMAC', 'ANDAHUAYLAS', 'TURPO');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('030313', '03', '03', '13', 'APURIMAC', 'ANDAHUAYLAS', 'PACUCHA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('030314', '03', '03', '14', 'APURIMAC', 'ANDAHUAYLAS', 'POMACOCHA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('030315', '03', '03', '15', 'APURIMAC', 'ANDAHUAYLAS', 'SANTA MARIA DE CHICMO');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('030316', '03', '03', '16', 'APURIMAC', 'ANDAHUAYLAS', 'TUMAY HUARACA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('030317', '03', '03', '17', 'APURIMAC', 'ANDAHUAYLAS', 'HUAYANA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('030318', '03', '03', '18', 'APURIMAC', 'ANDAHUAYLAS', 'SAN MIGUEL DE CHACCRAMPA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('030319', '03', '03', '19', 'APURIMAC', 'ANDAHUAYLAS', 'KAQUIABAMBA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('030401', '03', '04', '01', 'APURIMAC', 'ANTABAMBA', 'ANTABAMBA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('030402', '03', '04', '02', 'APURIMAC', 'ANTABAMBA', 'EL ORO');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('030403', '03', '04', '03', 'APURIMAC', 'ANTABAMBA', 'HUAQUIRCA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('030404', '03', '04', '04', 'APURIMAC', 'ANTABAMBA', 'JUAN ESPINOZA MEDRANO');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('030405', '03', '04', '05', 'APURIMAC', 'ANTABAMBA', 'OROPESA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('030406', '03', '04', '06', 'APURIMAC', 'ANTABAMBA', 'PACHACONAS');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('030407', '03', '04', '07', 'APURIMAC', 'ANTABAMBA', 'SABAINO');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('030501', '03', '05', '01', 'APURIMAC', 'COTABAMBAS', 'TAMBOBAMBA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('030502', '03', '05', '02', 'APURIMAC', 'COTABAMBAS', 'COYLLURQUI');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('030503', '03', '05', '03', 'APURIMAC', 'COTABAMBAS', 'COTABAMBAS');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('030504', '03', '05', '04', 'APURIMAC', 'COTABAMBAS', 'HAQUIRA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('030505', '03', '05', '05', 'APURIMAC', 'COTABAMBAS', 'MARA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('030506', '03', '05', '06', 'APURIMAC', 'COTABAMBAS', 'CHALLHUAHUACHO');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('030601', '03', '06', '01', 'APURIMAC', 'GRAU', 'CHUQUIBAMBILLA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('030602', '03', '06', '02', 'APURIMAC', 'GRAU', 'CURPAHUASI');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('030603', '03', '06', '03', 'APURIMAC', 'GRAU', 'HUAILLATI');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('030604', '03', '06', '04', 'APURIMAC', 'GRAU', 'MAMARA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('030605', '03', '06', '05', 'APURIMAC', 'GRAU', 'MARISCAL GAMARRA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('030606', '03', '06', '06', 'APURIMAC', 'GRAU', 'MICAELA BASTIDAS');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('030607', '03', '06', '07', 'APURIMAC', 'GRAU', 'PROGRESO');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('030608', '03', '06', '08', 'APURIMAC', 'GRAU', 'PATAYPAMPA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('030609', '03', '06', '09', 'APURIMAC', 'GRAU', 'SAN ANTONIO');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('030610', '03', '06', '10', 'APURIMAC', 'GRAU', 'TURPAY');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('030611', '03', '06', '11', 'APURIMAC', 'GRAU', 'VILCABAMBA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('030612', '03', '06', '12', 'APURIMAC', 'GRAU', 'VIRUNDO');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('030613', '03', '06', '13', 'APURIMAC', 'GRAU', 'SANTA ROSA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('030614', '03', '06', '14', 'APURIMAC', 'GRAU', 'CURASCO');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('030701', '03', '07', '01', 'APURIMAC', 'CHINCHEROS', 'CHINCHEROS');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('030702', '03', '07', '02', 'APURIMAC', 'CHINCHEROS', 'ONGOY');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('030703', '03', '07', '03', 'APURIMAC', 'CHINCHEROS', 'OCOBAMBA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('030704', '03', '07', '04', 'APURIMAC', 'CHINCHEROS', 'COCHARCAS');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('030705', '03', '07', '05', 'APURIMAC', 'CHINCHEROS', 'ANCO HUALLO');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('030706', '03', '07', '06', 'APURIMAC', 'CHINCHEROS', 'HUACCANA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('030707', '03', '07', '07', 'APURIMAC', 'CHINCHEROS', 'URANMARCA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('030708', '03', '07', '08', 'APURIMAC', 'CHINCHEROS', 'RANRACANCHA');

INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito,Cod_Ven) VALUES ('040101', '04', '01', '01', 'AREQUIPA', 'AREQUIPA', 'AREQUIPA', 'V64');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito,Cod_Ven) VALUES ('040102', '04', '01', '02', 'AREQUIPA', 'AREQUIPA', 'CAYMA', 'V56');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito,Cod_Ven) VALUES ('040103', '04', '01', '03', 'AREQUIPA', 'AREQUIPA', 'CERRO COLORADO', 'V61');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito,Cod_Ven) VALUES ('040104', '04', '01', '04', 'AREQUIPA', 'AREQUIPA', 'CHARACATO', 'V63');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito,Cod_Ven) VALUES ('040105', '04', '01', '05', 'AREQUIPA', 'AREQUIPA', 'CHIGUATA', 'V47');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito,Cod_Ven) VALUES ('040106', '04', '01', '06', 'AREQUIPA', 'AREQUIPA', 'LA JOYA', 'V55');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito,Cod_Ven) VALUES ('040107', '04', '01', '07', 'AREQUIPA', 'AREQUIPA', 'MIRAFLORES', 'V69');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito,Cod_Ven) VALUES ('040108', '04', '01', '08', 'AREQUIPA', 'AREQUIPA', 'MOLLEBAYA', 'V54');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito,Cod_Ven) VALUES ('040109', '04', '01', '09', 'AREQUIPA', 'AREQUIPA', 'PAUCARPATA', 'V64');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito,Cod_Ven) VALUES ('040110', '04', '01', '10', 'AREQUIPA', 'AREQUIPA', 'POCSI', 'V63');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito,Cod_Ven) VALUES ('040111', '04', '01', '11', 'AREQUIPA', 'AREQUIPA', 'POLOBAYA', 'V57');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito,Cod_Ven) VALUES ('040112', '04', '01', '12', 'AREQUIPA', 'AREQUIPA', 'QUEQUEÑA', 'V71');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito,Cod_Ven) VALUES ('040113', '04', '01', '13', 'AREQUIPA', 'AREQUIPA', 'SABANDIA', 'V50');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito,Cod_Ven) VALUES ('040114', '04', '01', '14', 'AREQUIPA', 'AREQUIPA', 'SACHACA', 'V68');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito,Cod_Ven) VALUES ('040115', '04', '01', '15', 'AREQUIPA', 'AREQUIPA', 'SAN JUAN DE SIGUAS', 'V60');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito,Cod_Ven) VALUES ('040116', '04', '01', '16', 'AREQUIPA', 'AREQUIPA', 'SAN JUAN DE TARUCANI', 'V61');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito,Cod_Ven) VALUES ('040117', '04', '01', '17', 'AREQUIPA', 'AREQUIPA', 'SANTA ISABEL DE SIGUAS', 'V70');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito,Cod_Ven) VALUES ('040118', '04', '01', '18', 'AREQUIPA', 'AREQUIPA', 'SANTA RITA DE SIHUAS', 'V52');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito,Cod_Ven) VALUES ('040119', '04', '01', '19', 'AREQUIPA', 'AREQUIPA', 'SOCABAYA', 'V52');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito,Cod_Ven) VALUES ('040120', '04', '01', '20', 'AREQUIPA', 'AREQUIPA', 'TIABAYA', 'V55');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito,Cod_Ven) VALUES ('040121', '04', '01', '21', 'AREQUIPA', 'AREQUIPA', 'UCHUMAYO', 'V51');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito,Cod_Ven) VALUES ('040122', '04', '01', '22', 'AREQUIPA', 'AREQUIPA', 'VITOR', 'V71');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito,Cod_Ven) VALUES ('040123', '04', '01', '23', 'AREQUIPA', 'AREQUIPA', 'YANAHUARA', 'V55');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito,Cod_Ven) VALUES ('040124', '04', '01', '24', 'AREQUIPA', 'AREQUIPA', 'YARABAMBA', 'V48');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito,Cod_Ven) VALUES ('040125', '04', '01', '25', 'AREQUIPA', 'AREQUIPA', 'YURA', 'V72');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito,Cod_Ven) VALUES ('040126', '04', '01', '26', 'AREQUIPA', 'AREQUIPA', 'MARIANO MELGAR', 'V54');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito,Cod_Ven) VALUES ('040127', '04', '01', '27', 'AREQUIPA', 'AREQUIPA', 'JACOBO HUNTER', 'V67');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito,Cod_Ven) VALUES ('040128', '04', '01', '28', 'AREQUIPA', 'AREQUIPA', 'ALTO SELVA ALEGRE', 'V70');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito,Cod_Ven) VALUES ('040129', '04', '01', '29', 'AREQUIPA', 'AREQUIPA', 'JOSE LUIS BUSTAMANTE Y RIVERO', 'V59');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito,Cod_Ven) VALUES ('040201', '04', '02', '01', 'AREQUIPA', 'CAYLLOMA', 'CHIVAY', 'V63');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito,Cod_Ven) VALUES ('040202', '04', '02', '02', 'AREQUIPA', 'CAYLLOMA', 'ACHOMA', 'V50');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito,Cod_Ven) VALUES ('040203', '04', '02', '03', 'AREQUIPA', 'CAYLLOMA', 'CABANACONDE', 'V63');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito,Cod_Ven) VALUES ('040204', '04', '02', '04', 'AREQUIPA', 'CAYLLOMA', 'CAYLLOMA', 'V63');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito,Cod_Ven) VALUES ('040205', '04', '02', '05', 'AREQUIPA', 'CAYLLOMA', 'CALLALLI', 'V62');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito,Cod_Ven) VALUES ('040206', '04', '02', '06', 'AREQUIPA', 'CAYLLOMA', 'COPORAQUE', 'V59');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito,Cod_Ven) VALUES ('040207', '04', '02', '07', 'AREQUIPA', 'CAYLLOMA', 'HUAMBO', 'V63');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito,Cod_Ven) VALUES ('040208', '04', '02', '08', 'AREQUIPA', 'CAYLLOMA', 'HUANCA', 'V63');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito,Cod_Ven) VALUES ('040209', '04', '02', '09', 'AREQUIPA', 'CAYLLOMA', 'ICHUPAMPA', 'V64');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito,Cod_Ven) VALUES ('040210', '04', '02', '10', 'AREQUIPA', 'CAYLLOMA', 'LARI', 'V67');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito,Cod_Ven) VALUES ('040211', '04', '02', '11', 'AREQUIPA', 'CAYLLOMA', 'LLUTA', 'V75');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito,Cod_Ven) VALUES ('040212', '04', '02', '12', 'AREQUIPA', 'CAYLLOMA', 'MACA', 'V61');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito,Cod_Ven) VALUES ('040213', '04', '02', '13', 'AREQUIPA', 'CAYLLOMA', 'MADRIGAL', 'V70');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito,Cod_Ven) VALUES ('040214', '04', '02', '14', 'AREQUIPA', 'CAYLLOMA', 'SAN ANTONIO DE CHUCA', 'V68');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito,Cod_Ven) VALUES ('040215', '04', '02', '15', 'AREQUIPA', 'CAYLLOMA', 'SIBAYO', 'V67');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito,Cod_Ven) VALUES ('040216', '04', '02', '16', 'AREQUIPA', 'CAYLLOMA', 'TAPAY', 'V65');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito,Cod_Ven) VALUES ('040217', '04', '02', '17', 'AREQUIPA', 'CAYLLOMA', 'TISCO', 'V49');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito,Cod_Ven) VALUES ('040218', '04', '02', '18', 'AREQUIPA', 'CAYLLOMA', 'TUTI', 'V49');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito,Cod_Ven) VALUES ('040219', '04', '02', '19', 'AREQUIPA', 'CAYLLOMA', 'YANQUE', 'V72');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito,Cod_Ven) VALUES ('040220', '04', '02', '20', 'AREQUIPA', 'CAYLLOMA', 'MAJES', 'V66');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito,Cod_Ven) VALUES ('040301', '04', '03', '01', 'AREQUIPA', 'CAMANA', 'CAMANA', 'V59');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito,Cod_Ven) VALUES ('040302', '04', '03', '02', 'AREQUIPA', 'CAMANA', 'JOSE MARIA QUIMPER', 'V63');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito,Cod_Ven) VALUES ('040303', '04', '03', '03', 'AREQUIPA', 'CAMANA', 'MARIANO NICOLAS VALCARCEL', 'V62');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito,Cod_Ven) VALUES ('040304', '04', '03', '04', 'AREQUIPA', 'CAMANA', 'MARISCAL CACERES', 'V53');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito,Cod_Ven) VALUES ('040305', '04', '03', '05', 'AREQUIPA', 'CAMANA', 'NICOLAS DE PIEROLA', 'V56');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito,Cod_Ven) VALUES ('040306', '04', '03', '06', 'AREQUIPA', 'CAMANA', 'OCOÑA', 'V73');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito,Cod_Ven) VALUES ('040307', '04', '03', '07', 'AREQUIPA', 'CAMANA', 'QUILCA', 'V73');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito,Cod_Ven) VALUES ('040308', '04', '03', '08', 'AREQUIPA', 'CAMANA', 'SAMUEL PASTOR', 'V61');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('040401', '04', '04', '01', 'AREQUIPA', 'CARAVELI', 'CARAVELI');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('040402', '04', '04', '02', 'AREQUIPA', 'CARAVELI', 'ACARI');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('040403', '04', '04', '03', 'AREQUIPA', 'CARAVELI', 'ATICO');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('040404', '04', '04', '04', 'AREQUIPA', 'CARAVELI', 'ATIQUIPA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('040405', '04', '04', '05', 'AREQUIPA', 'CARAVELI', 'BELLA UNION');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('040406', '04', '04', '06', 'AREQUIPA', 'CARAVELI', 'CAHUACHO');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('040407', '04', '04', '07', 'AREQUIPA', 'CARAVELI', 'CHALA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('040408', '04', '04', '08', 'AREQUIPA', 'CARAVELI', 'CHAPARRA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('040409', '04', '04', '09', 'AREQUIPA', 'CARAVELI', 'HUANUHUANU');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('040410', '04', '04', '10', 'AREQUIPA', 'CARAVELI', 'JAQUI');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('040411', '04', '04', '11', 'AREQUIPA', 'CARAVELI', 'LOMAS');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('040412', '04', '04', '12', 'AREQUIPA', 'CARAVELI', 'QUICACHA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('040413', '04', '04', '13', 'AREQUIPA', 'CARAVELI', 'YAUCA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('040501', '04', '05', '01', 'AREQUIPA', 'CASTILLA', 'APLAO');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('040502', '04', '05', '02', 'AREQUIPA', 'CASTILLA', 'ANDAGUA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('040503', '04', '05', '03', 'AREQUIPA', 'CASTILLA', 'AYO');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('040504', '04', '05', '04', 'AREQUIPA', 'CASTILLA', 'CHACHAS');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('040505', '04', '05', '05', 'AREQUIPA', 'CASTILLA', 'CHILCAYMARCA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('040506', '04', '05', '06', 'AREQUIPA', 'CASTILLA', 'CHOCO');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('040507', '04', '05', '07', 'AREQUIPA', 'CASTILLA', 'HUANCARQUI');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('040508', '04', '05', '08', 'AREQUIPA', 'CASTILLA', 'MACHAGUAY');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('040509', '04', '05', '09', 'AREQUIPA', 'CASTILLA', 'ORCOPAMPA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('040510', '04', '05', '10', 'AREQUIPA', 'CASTILLA', 'PAMPACOLCA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('040511', '04', '05', '11', 'AREQUIPA', 'CASTILLA', 'TIPAN');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('040512', '04', '05', '12', 'AREQUIPA', 'CASTILLA', 'URACA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('040513', '04', '05', '13', 'AREQUIPA', 'CASTILLA', 'UÑON');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('040514', '04', '05', '14', 'AREQUIPA', 'CASTILLA', 'VIRACO');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('040601', '04', '06', '01', 'AREQUIPA', 'CONDESUYOS', 'CHUQUIBAMBA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('040602', '04', '06', '02', 'AREQUIPA', 'CONDESUYOS', 'ANDARAY');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('040603', '04', '06', '03', 'AREQUIPA', 'CONDESUYOS', 'CAYARANI');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('040604', '04', '06', '04', 'AREQUIPA', 'CONDESUYOS', 'CHICHAS');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('040605', '04', '06', '05', 'AREQUIPA', 'CONDESUYOS', 'IRAY');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('040606', '04', '06', '06', 'AREQUIPA', 'CONDESUYOS', 'SALAMANCA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('040607', '04', '06', '07', 'AREQUIPA', 'CONDESUYOS', 'YANAQUIHUA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('040608', '04', '06', '08', 'AREQUIPA', 'CONDESUYOS', 'RIO GRANDE');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('040701', '04', '07', '01', 'AREQUIPA', 'ISLAY', 'MOLLENDO');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('040702', '04', '07', '02', 'AREQUIPA', 'ISLAY', 'COCACHACRA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('040703', '04', '07', '03', 'AREQUIPA', 'ISLAY', 'DEAN VALDIVIA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('040704', '04', '07', '04', 'AREQUIPA', 'ISLAY', 'ISLAY');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('040705', '04', '07', '05', 'AREQUIPA', 'ISLAY', 'MEJIA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('040706', '04', '07', '06', 'AREQUIPA', 'ISLAY', 'PUNTA DE BOMBON');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('040801', '04', '08', '01', 'AREQUIPA', 'LA UNION', 'COTAHUASI');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('040802', '04', '08', '02', 'AREQUIPA', 'LA UNION', 'ALCA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('040803', '04', '08', '03', 'AREQUIPA', 'LA UNION', 'CHARCANA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('040804', '04', '08', '04', 'AREQUIPA', 'LA UNION', 'HUAYNACOTAS');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('040805', '04', '08', '05', 'AREQUIPA', 'LA UNION', 'PAMPAMARCA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('040806', '04', '08', '06', 'AREQUIPA', 'LA UNION', 'PUYCA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('040807', '04', '08', '07', 'AREQUIPA', 'LA UNION', 'QUECHUALLA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('040808', '04', '08', '08', 'AREQUIPA', 'LA UNION', 'SAYLA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('040809', '04', '08', '09', 'AREQUIPA', 'LA UNION', 'TAURIA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('040810', '04', '08', '10', 'AREQUIPA', 'LA UNION', 'TOMEPAMPA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('040811', '04', '08', '11', 'AREQUIPA', 'LA UNION', 'TORO');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('050101', '05', '01', '01', 'AYACUCHO', 'HUAMANGA', 'AYACUCHO');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('050102', '05', '01', '02', 'AYACUCHO', 'HUAMANGA', 'ACOS VINCHOS');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('050103', '05', '01', '03', 'AYACUCHO', 'HUAMANGA', 'CARMEN ALTO');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('050104', '05', '01', '04', 'AYACUCHO', 'HUAMANGA', 'CHIARA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('050105', '05', '01', '05', 'AYACUCHO', 'HUAMANGA', 'QUINUA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('050106', '05', '01', '06', 'AYACUCHO', 'HUAMANGA', 'SAN JOSE DE TICLLAS');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('050107', '05', '01', '07', 'AYACUCHO', 'HUAMANGA', 'SAN JUAN BAUTISTA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('050108', '05', '01', '08', 'AYACUCHO', 'HUAMANGA', 'SANTIAGO DE PISCHA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('050109', '05', '01', '09', 'AYACUCHO', 'HUAMANGA', 'VINCHOS');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('050110', '05', '01', '10', 'AYACUCHO', 'HUAMANGA', 'TAMBILLO');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('050111', '05', '01', '11', 'AYACUCHO', 'HUAMANGA', 'ACOCRO');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('050112', '05', '01', '12', 'AYACUCHO', 'HUAMANGA', 'SOCOS');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('050113', '05', '01', '13', 'AYACUCHO', 'HUAMANGA', 'OCROS');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('050114', '05', '01', '14', 'AYACUCHO', 'HUAMANGA', 'PACAYCASA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('050115', '05', '01', '15', 'AYACUCHO', 'HUAMANGA', 'JESUS NAZARENO');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('050201', '05', '02', '01', 'AYACUCHO', 'CANGALLO', 'CANGALLO');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('050204', '05', '02', '04', 'AYACUCHO', 'CANGALLO', 'CHUSCHI');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('050206', '05', '02', '06', 'AYACUCHO', 'CANGALLO', 'LOS MOROCHUCOS');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('050207', '05', '02', '07', 'AYACUCHO', 'CANGALLO', 'PARAS');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('050208', '05', '02', '08', 'AYACUCHO', 'CANGALLO', 'TOTOS');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('050211', '05', '02', '11', 'AYACUCHO', 'CANGALLO', 'MARIA PARADO DE BELLIDO');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('050301', '05', '03', '01', 'AYACUCHO', 'HUANTA', 'HUANTA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('050302', '05', '03', '02', 'AYACUCHO', 'HUANTA', 'AYAHUANCO');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('050303', '05', '03', '03', 'AYACUCHO', 'HUANTA', 'HUAMANGUILLA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('050304', '05', '03', '04', 'AYACUCHO', 'HUANTA', 'IGUAIN');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('050305', '05', '03', '05', 'AYACUCHO', 'HUANTA', 'LURICOCHA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('050307', '05', '03', '07', 'AYACUCHO', 'HUANTA', 'SANTILLANA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('050308', '05', '03', '08', 'AYACUCHO', 'HUANTA', 'SIVIA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('050309', '05', '03', '09', 'AYACUCHO', 'HUANTA', 'LLOCHEGUA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('050401', '05', '04', '01', 'AYACUCHO', 'LA MAR', 'SAN MIGUEL');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('050402', '05', '04', '02', 'AYACUCHO', 'LA MAR', 'ANCO');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('050403', '05', '04', '03', 'AYACUCHO', 'LA MAR', 'AYNA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('050404', '05', '04', '04', 'AYACUCHO', 'LA MAR', 'CHILCAS');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('050405', '05', '04', '05', 'AYACUCHO', 'LA MAR', 'CHUNGUI');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('050406', '05', '04', '06', 'AYACUCHO', 'LA MAR', 'TAMBO');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('050407', '05', '04', '07', 'AYACUCHO', 'LA MAR', 'LUIS CARRANZA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('050408', '05', '04', '08', 'AYACUCHO', 'LA MAR', 'SANTA ROSA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('050409', '05', '04', '09', 'AYACUCHO', 'LA MAR', 'SAMUGARI');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('050501', '05', '05', '01', 'AYACUCHO', 'LUCANAS', 'PUQUIO');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('050502', '05', '05', '02', 'AYACUCHO', 'LUCANAS', 'AUCARA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('050503', '05', '05', '03', 'AYACUCHO', 'LUCANAS', 'CABANA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('050504', '05', '05', '04', 'AYACUCHO', 'LUCANAS', 'CARMEN SALCEDO');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('050506', '05', '05', '06', 'AYACUCHO', 'LUCANAS', 'CHAVIÑA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('050508', '05', '05', '08', 'AYACUCHO', 'LUCANAS', 'CHIPAO');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('050510', '05', '05', '10', 'AYACUCHO', 'LUCANAS', 'HUAC-HUAS');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('050511', '05', '05', '11', 'AYACUCHO', 'LUCANAS', 'LARAMATE');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('050512', '05', '05', '12', 'AYACUCHO', 'LUCANAS', 'LEONCIO PRADO');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('050513', '05', '05', '13', 'AYACUCHO', 'LUCANAS', 'LUCANAS');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('050514', '05', '05', '14', 'AYACUCHO', 'LUCANAS', 'LLAUTA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('050516', '05', '05', '16', 'AYACUCHO', 'LUCANAS', 'OCAÑA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('050517', '05', '05', '17', 'AYACUCHO', 'LUCANAS', 'OTOCA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('050520', '05', '05', '20', 'AYACUCHO', 'LUCANAS', 'SANCOS');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('050521', '05', '05', '21', 'AYACUCHO', 'LUCANAS', 'SAN JUAN');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('050522', '05', '05', '22', 'AYACUCHO', 'LUCANAS', 'SAN PEDRO');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('050524', '05', '05', '24', 'AYACUCHO', 'LUCANAS', 'SANTA ANA DE HUAYCAHUACHO');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('050525', '05', '05', '25', 'AYACUCHO', 'LUCANAS', 'SANTA LUCIA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('050529', '05', '05', '29', 'AYACUCHO', 'LUCANAS', 'SAISA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('050531', '05', '05', '31', 'AYACUCHO', 'LUCANAS', 'SAN PEDRO DE PALCO');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('050532', '05', '05', '32', 'AYACUCHO', 'LUCANAS', 'SAN CRISTOBAL');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('050601', '05', '06', '01', 'AYACUCHO', 'PARINACOCHAS', 'CORACORA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('050604', '05', '06', '04', 'AYACUCHO', 'PARINACOCHAS', 'CORONEL CASTAÑEDA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('050605', '05', '06', '05', 'AYACUCHO', 'PARINACOCHAS', 'CHUMPI');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('050608', '05', '06', '08', 'AYACUCHO', 'PARINACOCHAS', 'PACAPAUSA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('050611', '05', '06', '11', 'AYACUCHO', 'PARINACOCHAS', 'PULLO');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('050612', '05', '06', '12', 'AYACUCHO', 'PARINACOCHAS', 'PUYUSCA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('050615', '05', '06', '15', 'AYACUCHO', 'PARINACOCHAS', 'SAN FRANCISCO DE RAVACAYCO');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('050616', '05', '06', '16', 'AYACUCHO', 'PARINACOCHAS', 'UPAHUACHO');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('050701', '05', '07', '01', 'AYACUCHO', 'VICTOR FAJARDO', 'HUANCAPI');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('050702', '05', '07', '02', 'AYACUCHO', 'VICTOR FAJARDO', 'ALCAMENCA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('050703', '05', '07', '03', 'AYACUCHO', 'VICTOR FAJARDO', 'APONGO');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('050704', '05', '07', '04', 'AYACUCHO', 'VICTOR FAJARDO', 'CANARIA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('050706', '05', '07', '06', 'AYACUCHO', 'VICTOR FAJARDO', 'CAYARA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('050707', '05', '07', '07', 'AYACUCHO', 'VICTOR FAJARDO', 'COLCA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('050708', '05', '07', '08', 'AYACUCHO', 'VICTOR FAJARDO', 'HUALLA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('050709', '05', '07', '09', 'AYACUCHO', 'VICTOR FAJARDO', 'HUAMANQUIQUIA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('050710', '05', '07', '10', 'AYACUCHO', 'VICTOR FAJARDO', 'HUANCARAYLLA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('050713', '05', '07', '13', 'AYACUCHO', 'VICTOR FAJARDO', 'SARHUA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('050714', '05', '07', '14', 'AYACUCHO', 'VICTOR FAJARDO', 'VILCANCHOS');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('050715', '05', '07', '15', 'AYACUCHO', 'VICTOR FAJARDO', 'ASQUIPATA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('050801', '05', '08', '01', 'AYACUCHO', 'HUANCA SANCOS', 'SANCOS');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('050802', '05', '08', '02', 'AYACUCHO', 'HUANCA SANCOS', 'SACSAMARCA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('050803', '05', '08', '03', 'AYACUCHO', 'HUANCA SANCOS', 'SANTIAGO DE LUCANAMARCA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('050804', '05', '08', '04', 'AYACUCHO', 'HUANCA SANCOS', 'CARAPO');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('050901', '05', '09', '01', 'AYACUCHO', 'VILCAS HUAMAN', 'VILCAS HUAMAN');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('050902', '05', '09', '02', 'AYACUCHO', 'VILCAS HUAMAN', 'VISCHONGO');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('050903', '05', '09', '03', 'AYACUCHO', 'VILCAS HUAMAN', 'ACCOMARCA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('050904', '05', '09', '04', 'AYACUCHO', 'VILCAS HUAMAN', 'CARHUANCA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('050905', '05', '09', '05', 'AYACUCHO', 'VILCAS HUAMAN', 'CONCEPCION');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('050906', '05', '09', '06', 'AYACUCHO', 'VILCAS HUAMAN', 'HUAMBALPA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('050907', '05', '09', '07', 'AYACUCHO', 'VILCAS HUAMAN', 'SAURAMA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('050908', '05', '09', '08', 'AYACUCHO', 'VILCAS HUAMAN', 'INDEPENDENCIA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('051001', '05', '10', '01', 'AYACUCHO', 'PAUCAR DEL SARA SARA', 'PAUSA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('051002', '05', '10', '02', 'AYACUCHO', 'PAUCAR DEL SARA SARA', 'COLTA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('051003', '05', '10', '03', 'AYACUCHO', 'PAUCAR DEL SARA SARA', 'CORCULLA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('051004', '05', '10', '04', 'AYACUCHO', 'PAUCAR DEL SARA SARA', 'LAMPA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('051005', '05', '10', '05', 'AYACUCHO', 'PAUCAR DEL SARA SARA', 'MARCABAMBA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('051006', '05', '10', '06', 'AYACUCHO', 'PAUCAR DEL SARA SARA', 'OYOLO');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('051007', '05', '10', '07', 'AYACUCHO', 'PAUCAR DEL SARA SARA', 'PARARCA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('051008', '05', '10', '08', 'AYACUCHO', 'PAUCAR DEL SARA SARA', 'SAN JAVIER DE ALPABAMBA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('051009', '05', '10', '09', 'AYACUCHO', 'PAUCAR DEL SARA SARA', 'SAN JOSE DE USHUA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('051010', '05', '10', '10', 'AYACUCHO', 'PAUCAR DEL SARA SARA', 'SARA SARA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('051101', '05', '11', '01', 'AYACUCHO', 'SUCRE', 'QUEROBAMBA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('051102', '05', '11', '02', 'AYACUCHO', 'SUCRE', 'BELEN');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('051103', '05', '11', '03', 'AYACUCHO', 'SUCRE', 'CHALCOS');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('051104', '05', '11', '04', 'AYACUCHO', 'SUCRE', 'SAN SALVADOR DE QUIJE');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('051105', '05', '11', '05', 'AYACUCHO', 'SUCRE', 'PAICO');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('051106', '05', '11', '06', 'AYACUCHO', 'SUCRE', 'SANTIAGO DE PAUCARAY');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('051107', '05', '11', '07', 'AYACUCHO', 'SUCRE', 'SAN PEDRO DE LARCAY');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('051108', '05', '11', '08', 'AYACUCHO', 'SUCRE', 'SORAS');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('051109', '05', '11', '09', 'AYACUCHO', 'SUCRE', 'HUACAÑA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('051110', '05', '11', '10', 'AYACUCHO', 'SUCRE', 'CHILCAYOC');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('051111', '05', '11', '11', 'AYACUCHO', 'SUCRE', 'MORCOLLA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('060101', '06', '01', '01', 'CAJAMARCA', 'CAJAMARCA', 'CAJAMARCA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('060102', '06', '01', '02', 'CAJAMARCA', 'CAJAMARCA', 'ASUNCION');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('060103', '06', '01', '03', 'CAJAMARCA', 'CAJAMARCA', 'COSPAN');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('060104', '06', '01', '04', 'CAJAMARCA', 'CAJAMARCA', 'CHETILLA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('060105', '06', '01', '05', 'CAJAMARCA', 'CAJAMARCA', 'ENCAÑADA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('060106', '06', '01', '06', 'CAJAMARCA', 'CAJAMARCA', 'JESUS');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('060107', '06', '01', '07', 'CAJAMARCA', 'CAJAMARCA', 'LOS BAÑOS DEL INCA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('060108', '06', '01', '08', 'CAJAMARCA', 'CAJAMARCA', 'LLACANORA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('060109', '06', '01', '09', 'CAJAMARCA', 'CAJAMARCA', 'MAGDALENA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('060110', '06', '01', '10', 'CAJAMARCA', 'CAJAMARCA', 'MATARA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('060111', '06', '01', '11', 'CAJAMARCA', 'CAJAMARCA', 'NAMORA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('060112', '06', '01', '12', 'CAJAMARCA', 'CAJAMARCA', 'SAN JUAN');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('060201', '06', '02', '01', 'CAJAMARCA', 'CAJABAMBA', 'CAJABAMBA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('060202', '06', '02', '02', 'CAJAMARCA', 'CAJABAMBA', 'CACHACHI');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('060203', '06', '02', '03', 'CAJAMARCA', 'CAJABAMBA', 'CONDEBAMBA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('060205', '06', '02', '05', 'CAJAMARCA', 'CAJABAMBA', 'SITACOCHA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('060301', '06', '03', '01', 'CAJAMARCA', 'CELENDIN', 'CELENDIN');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('060302', '06', '03', '02', 'CAJAMARCA', 'CELENDIN', 'CORTEGANA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('060303', '06', '03', '03', 'CAJAMARCA', 'CELENDIN', 'CHUMUCH');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('060304', '06', '03', '04', 'CAJAMARCA', 'CELENDIN', 'HUASMIN');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('060305', '06', '03', '05', 'CAJAMARCA', 'CELENDIN', 'JORGE CHAVEZ');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('060306', '06', '03', '06', 'CAJAMARCA', 'CELENDIN', 'JOSE GALVEZ');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('060307', '06', '03', '07', 'CAJAMARCA', 'CELENDIN', 'MIGUEL IGLESIAS');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('060308', '06', '03', '08', 'CAJAMARCA', 'CELENDIN', 'OXAMARCA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('060309', '06', '03', '09', 'CAJAMARCA', 'CELENDIN', 'SOROCHUCO');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('060310', '06', '03', '10', 'CAJAMARCA', 'CELENDIN', 'SUCRE');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('060311', '06', '03', '11', 'CAJAMARCA', 'CELENDIN', 'UTCO');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('060312', '06', '03', '12', 'CAJAMARCA', 'CELENDIN', 'LA LIBERTAD DE PALLAN');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('060401', '06', '04', '01', 'CAJAMARCA', 'CONTUMAZA', 'CONTUMAZA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('060403', '06', '04', '03', 'CAJAMARCA', 'CONTUMAZA', 'CHILETE');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('060404', '06', '04', '04', 'CAJAMARCA', 'CONTUMAZA', 'GUZMANGO');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('060405', '06', '04', '05', 'CAJAMARCA', 'CONTUMAZA', 'SAN BENITO');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('060406', '06', '04', '06', 'CAJAMARCA', 'CONTUMAZA', 'CUPISNIQUE');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('060407', '06', '04', '07', 'CAJAMARCA', 'CONTUMAZA', 'TANTARICA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('060408', '06', '04', '08', 'CAJAMARCA', 'CONTUMAZA', 'YONAN');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('060409', '06', '04', '09', 'CAJAMARCA', 'CONTUMAZA', 'SANTA CRUZ DE TOLED');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('060501', '06', '05', '01', 'CAJAMARCA', 'CUTERVO', 'CUTERVO');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('060502', '06', '05', '02', 'CAJAMARCA', 'CUTERVO', 'CALLAYUC');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('060503', '06', '05', '03', 'CAJAMARCA', 'CUTERVO', 'CUJILLO');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('060504', '06', '05', '04', 'CAJAMARCA', 'CUTERVO', 'CHOROS');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('060505', '06', '05', '05', 'CAJAMARCA', 'CUTERVO', 'LA RAMADA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('060506', '06', '05', '06', 'CAJAMARCA', 'CUTERVO', 'PIMPINGOS');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('060507', '06', '05', '07', 'CAJAMARCA', 'CUTERVO', 'QUEROCOTILLO');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('060508', '06', '05', '08', 'CAJAMARCA', 'CUTERVO', 'SAN ANDRES DE CUTERVO');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('060509', '06', '05', '09', 'CAJAMARCA', 'CUTERVO', 'SAN JUAN DE CUTERVO');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('060510', '06', '05', '10', 'CAJAMARCA', 'CUTERVO', 'SAN LUIS DE LUCMA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('060511', '06', '05', '11', 'CAJAMARCA', 'CUTERVO', 'SANTA CRUZ');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('060512', '06', '05', '12', 'CAJAMARCA', 'CUTERVO', 'SANTO DOMINGO DE LA CAPILLA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('060513', '06', '05', '13', 'CAJAMARCA', 'CUTERVO', 'SANTO TOMAS');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('060514', '06', '05', '14', 'CAJAMARCA', 'CUTERVO', 'SOCOTA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('060515', '06', '05', '15', 'CAJAMARCA', 'CUTERVO', 'TORIBIO CASANOVA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('060601', '06', '06', '01', 'CAJAMARCA', 'CHOTA', 'CHOTA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('060602', '06', '06', '02', 'CAJAMARCA', 'CHOTA', 'ANGUIA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('060603', '06', '06', '03', 'CAJAMARCA', 'CHOTA', 'COCHABAMBA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('060604', '06', '06', '04', 'CAJAMARCA', 'CHOTA', 'CONCHAN');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('060605', '06', '06', '05', 'CAJAMARCA', 'CHOTA', 'CHADIN');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('060606', '06', '06', '06', 'CAJAMARCA', 'CHOTA', 'CHIGUIRIP');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('060607', '06', '06', '07', 'CAJAMARCA', 'CHOTA', 'CHIMBAN');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('060608', '06', '06', '08', 'CAJAMARCA', 'CHOTA', 'HUAMBOS');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('060609', '06', '06', '09', 'CAJAMARCA', 'CHOTA', 'LAJAS');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('060610', '06', '06', '10', 'CAJAMARCA', 'CHOTA', 'LLAMA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('060611', '06', '06', '11', 'CAJAMARCA', 'CHOTA', 'MIRACOSTA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('060612', '06', '06', '12', 'CAJAMARCA', 'CHOTA', 'PACCHA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('060613', '06', '06', '13', 'CAJAMARCA', 'CHOTA', 'PION');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('060614', '06', '06', '14', 'CAJAMARCA', 'CHOTA', 'QUEROCOTO');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('060615', '06', '06', '15', 'CAJAMARCA', 'CHOTA', 'TACABAMBA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('060616', '06', '06', '16', 'CAJAMARCA', 'CHOTA', 'TOCMOCHE');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('060617', '06', '06', '17', 'CAJAMARCA', 'CHOTA', 'SAN JUAN DE LICUPIS');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('060618', '06', '06', '18', 'CAJAMARCA', 'CHOTA', 'CHOROPAMPA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('060619', '06', '06', '19', 'CAJAMARCA', 'CHOTA', 'CHALAMARCA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('060701', '06', '07', '01', 'CAJAMARCA', 'HUALGAYOC', 'BAMBAMARCA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('060702', '06', '07', '02', 'CAJAMARCA', 'HUALGAYOC', 'CHUGUR');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('060703', '06', '07', '03', 'CAJAMARCA', 'HUALGAYOC', 'HUALGAYOC');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('060801', '06', '08', '01', 'CAJAMARCA', 'JAEN', 'JAEN');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('060802', '06', '08', '02', 'CAJAMARCA', 'JAEN', 'BELLAVISTA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('060803', '06', '08', '03', 'CAJAMARCA', 'JAEN', 'COLASAY');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('060804', '06', '08', '04', 'CAJAMARCA', 'JAEN', 'CHONTALI');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('060805', '06', '08', '05', 'CAJAMARCA', 'JAEN', 'POMAHUACA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('060806', '06', '08', '06', 'CAJAMARCA', 'JAEN', 'PUCARA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('060807', '06', '08', '07', 'CAJAMARCA', 'JAEN', 'SALLIQUE');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('060808', '06', '08', '08', 'CAJAMARCA', 'JAEN', 'SAN FELIPE');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('060809', '06', '08', '09', 'CAJAMARCA', 'JAEN', 'SAN JOSE DEL ALTO');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('060810', '06', '08', '10', 'CAJAMARCA', 'JAEN', 'SANTA ROSA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('060811', '06', '08', '11', 'CAJAMARCA', 'JAEN', 'LAS PIRIAS');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('060812', '06', '08', '12', 'CAJAMARCA', 'JAEN', 'HUABAL');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('060901', '06', '09', '01', 'CAJAMARCA', 'SANTA CRUZ', 'SANTA CRUZ');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('060902', '06', '09', '02', 'CAJAMARCA', 'SANTA CRUZ', 'CATACHE');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('060903', '06', '09', '03', 'CAJAMARCA', 'SANTA CRUZ', 'CHANCAYBAÑOS');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('060904', '06', '09', '04', 'CAJAMARCA', 'SANTA CRUZ', 'LA ESPERANZA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('060905', '06', '09', '05', 'CAJAMARCA', 'SANTA CRUZ', 'NINABAMBA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('060906', '06', '09', '06', 'CAJAMARCA', 'SANTA CRUZ', 'PULAN');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('060907', '06', '09', '07', 'CAJAMARCA', 'SANTA CRUZ', 'SEXI');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('060908', '06', '09', '08', 'CAJAMARCA', 'SANTA CRUZ', 'UTICYACU');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('060909', '06', '09', '09', 'CAJAMARCA', 'SANTA CRUZ', 'YAUYUCAN');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('060910', '06', '09', '10', 'CAJAMARCA', 'SANTA CRUZ', 'ANDABAMBA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('060911', '06', '09', '11', 'CAJAMARCA', 'SANTA CRUZ', 'SAUCEPAMPA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('061001', '06', '10', '01', 'CAJAMARCA', 'SAN MIGUEL', 'SAN MIGUEL');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('061002', '06', '10', '02', 'CAJAMARCA', 'SAN MIGUEL', 'CALQUIS');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('061003', '06', '10', '03', 'CAJAMARCA', 'SAN MIGUEL', 'LA FLORIDA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('061004', '06', '10', '04', 'CAJAMARCA', 'SAN MIGUEL', 'LLAPA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('061005', '06', '10', '05', 'CAJAMARCA', 'SAN MIGUEL', 'NANCHOC');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('061006', '06', '10', '06', 'CAJAMARCA', 'SAN MIGUEL', 'NIEPOS');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('061007', '06', '10', '07', 'CAJAMARCA', 'SAN MIGUEL', 'SAN GREGORIO');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('061008', '06', '10', '08', 'CAJAMARCA', 'SAN MIGUEL', 'SAN SILVESTRE DE COCHAN');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('061009', '06', '10', '09', 'CAJAMARCA', 'SAN MIGUEL', 'EL PRADO');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('061010', '06', '10', '10', 'CAJAMARCA', 'SAN MIGUEL', 'UNION AGUA BLANCA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('061011', '06', '10', '11', 'CAJAMARCA', 'SAN MIGUEL', 'TONGOD');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('061012', '06', '10', '12', 'CAJAMARCA', 'SAN MIGUEL', 'CATILLUC');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('061013', '06', '10', '13', 'CAJAMARCA', 'SAN MIGUEL', 'BOLIVAR');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('061101', '06', '11', '01', 'CAJAMARCA', 'SAN IGNACIO', 'SAN IGNACIO');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('061102', '06', '11', '02', 'CAJAMARCA', 'SAN IGNACIO', 'CHIRINOS');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('061103', '06', '11', '03', 'CAJAMARCA', 'SAN IGNACIO', 'HUARANGO');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('061104', '06', '11', '04', 'CAJAMARCA', 'SAN IGNACIO', 'NAMBALLE');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('061105', '06', '11', '05', 'CAJAMARCA', 'SAN IGNACIO', 'LA COIPA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('061106', '06', '11', '06', 'CAJAMARCA', 'SAN IGNACIO', 'SAN JOSE DE LOURDES');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('061107', '06', '11', '07', 'CAJAMARCA', 'SAN IGNACIO', 'TABACONAS');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('061201', '06', '12', '01', 'CAJAMARCA', 'SAN MARCOS', 'PEDRO GALVEZ');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('061202', '06', '12', '02', 'CAJAMARCA', 'SAN MARCOS', 'ICHOCAN');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('061203', '06', '12', '03', 'CAJAMARCA', 'SAN MARCOS', 'GREGORIO PITA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('061204', '06', '12', '04', 'CAJAMARCA', 'SAN MARCOS', 'JOSE MANUEL QUIROZ');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('061205', '06', '12', '05', 'CAJAMARCA', 'SAN MARCOS', 'EDUARDO VILLANUEVA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('061206', '06', '12', '06', 'CAJAMARCA', 'SAN MARCOS', 'JOSE SABOGAL');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('061207', '06', '12', '07', 'CAJAMARCA', 'SAN MARCOS', 'CHANCAY');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('061301', '06', '13', '01', 'CAJAMARCA', 'SAN PABLO', 'SAN PABLO');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('061302', '06', '13', '02', 'CAJAMARCA', 'SAN PABLO', 'SAN BERNARDINO');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('061303', '06', '13', '03', 'CAJAMARCA', 'SAN PABLO', 'SAN LUIS');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('061304', '06', '13', '04', 'CAJAMARCA', 'SAN PABLO', 'TUMBADEN');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('070101', '07', '01', '01', 'CUSCO', 'CUSCO', 'CUSCO');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('070102', '07', '01', '02', 'CUSCO', 'CUSCO', 'CCORCA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('070103', '07', '01', '03', 'CUSCO', 'CUSCO', 'POROY');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('070104', '07', '01', '04', 'CUSCO', 'CUSCO', 'SAN JERONIMO');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('070105', '07', '01', '05', 'CUSCO', 'CUSCO', 'SAN SEBASTIAN');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('070106', '07', '01', '06', 'CUSCO', 'CUSCO', 'SANTIAGO');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('070107', '07', '01', '07', 'CUSCO', 'CUSCO', 'SAYLLA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('070108', '07', '01', '08', 'CUSCO', 'CUSCO', 'WANCHAQ');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('070201', '07', '02', '01', 'CUSCO', 'ACOMAYO', 'ACOMAYO');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('070202', '07', '02', '02', 'CUSCO', 'ACOMAYO', 'ACOPIA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('070203', '07', '02', '03', 'CUSCO', 'ACOMAYO', 'ACOS');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('070204', '07', '02', '04', 'CUSCO', 'ACOMAYO', 'POMACANCHI');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('070205', '07', '02', '05', 'CUSCO', 'ACOMAYO', 'RONDOCAN');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('070206', '07', '02', '06', 'CUSCO', 'ACOMAYO', 'SANGARARA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('070207', '07', '02', '07', 'CUSCO', 'ACOMAYO', 'MOSOC LLACTA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('070301', '07', '03', '01', 'CUSCO', 'ANTA', 'ANTA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('070302', '07', '03', '02', 'CUSCO', 'ANTA', 'CHINCHAYPUJIO');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('070303', '07', '03', '03', 'CUSCO', 'ANTA', 'HUAROCONDO');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('070304', '07', '03', '04', 'CUSCO', 'ANTA', 'LIMATAMBO');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('070305', '07', '03', '05', 'CUSCO', 'ANTA', 'MOLLEPATA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('070306', '07', '03', '06', 'CUSCO', 'ANTA', 'PUCYURA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('070307', '07', '03', '07', 'CUSCO', 'ANTA', 'ZURITE');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('070308', '07', '03', '08', 'CUSCO', 'ANTA', 'CACHIMAYO');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('070309', '07', '03', '09', 'CUSCO', 'ANTA', 'ANCAHUASI');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('070401', '07', '04', '01', 'CUSCO', 'CALCA', 'CALCA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('070402', '07', '04', '02', 'CUSCO', 'CALCA', 'COYA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('070403', '07', '04', '03', 'CUSCO', 'CALCA', 'LAMAY');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('070404', '07', '04', '04', 'CUSCO', 'CALCA', 'LARES');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('070405', '07', '04', '05', 'CUSCO', 'CALCA', 'PISAC');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('070406', '07', '04', '06', 'CUSCO', 'CALCA', 'SAN SALVADOR');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('070407', '07', '04', '07', 'CUSCO', 'CALCA', 'TARAY');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('070408', '07', '04', '08', 'CUSCO', 'CALCA', 'YANATILE');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('070501', '07', '05', '01', 'CUSCO', 'CANAS', 'YANAOCA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('070502', '07', '05', '02', 'CUSCO', 'CANAS', 'CHECCA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('070503', '07', '05', '03', 'CUSCO', 'CANAS', 'KUNTURKANKI');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('070504', '07', '05', '04', 'CUSCO', 'CANAS', 'LANGUI');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('070505', '07', '05', '05', 'CUSCO', 'CANAS', 'LAYO');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('070506', '07', '05', '06', 'CUSCO', 'CANAS', 'PAMPAMARCA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('070507', '07', '05', '07', 'CUSCO', 'CANAS', 'QUEHUE');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('070508', '07', '05', '08', 'CUSCO', 'CANAS', 'TUPAC AMARU');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('070601', '07', '06', '01', 'CUSCO', 'CANCHIS', 'SICUANI');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('070602', '07', '06', '02', 'CUSCO', 'CANCHIS', 'COMBAPATA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('070603', '07', '06', '03', 'CUSCO', 'CANCHIS', 'CHECACUPE');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('070604', '07', '06', '04', 'CUSCO', 'CANCHIS', 'MARANGANI');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('070605', '07', '06', '05', 'CUSCO', 'CANCHIS', 'PITUMARCA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('070606', '07', '06', '06', 'CUSCO', 'CANCHIS', 'SAN PABLO');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('070607', '07', '06', '07', 'CUSCO', 'CANCHIS', 'SAN PEDRO');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('070608', '07', '06', '08', 'CUSCO', 'CANCHIS', 'TINTA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('070701', '07', '07', '01', 'CUSCO', 'CHUMBIVILCAS', 'SANTO TOMAS');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('070702', '07', '07', '02', 'CUSCO', 'CHUMBIVILCAS', 'CAPACMARCA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('070703', '07', '07', '03', 'CUSCO', 'CHUMBIVILCAS', 'COLQUEMARCA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('070704', '07', '07', '04', 'CUSCO', 'CHUMBIVILCAS', 'CHAMACA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('070705', '07', '07', '05', 'CUSCO', 'CHUMBIVILCAS', 'LIVITACA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('070706', '07', '07', '06', 'CUSCO', 'CHUMBIVILCAS', 'LLUSCO');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('070707', '07', '07', '07', 'CUSCO', 'CHUMBIVILCAS', 'QUIÑOTA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('070708', '07', '07', '08', 'CUSCO', 'CHUMBIVILCAS', 'VELILLE');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('070801', '07', '08', '01', 'CUSCO', 'ESPINAR', 'ESPINAR');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('070802', '07', '08', '02', 'CUSCO', 'ESPINAR', 'CONDOROMA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('070803', '07', '08', '03', 'CUSCO', 'ESPINAR', 'COPORAQUE');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('070804', '07', '08', '04', 'CUSCO', 'ESPINAR', 'OCORURO');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('070805', '07', '08', '05', 'CUSCO', 'ESPINAR', 'PALLPATA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('070806', '07', '08', '06', 'CUSCO', 'ESPINAR', 'PICHIGUA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('070807', '07', '08', '07', 'CUSCO', 'ESPINAR', 'SUYCKUTAMBO');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('070808', '07', '08', '08', 'CUSCO', 'ESPINAR', 'ALTO PICHIGUA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('070901', '07', '09', '01', 'CUSCO', 'LA CONVENCION', 'SANTA ANA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('070902', '07', '09', '02', 'CUSCO', 'LA CONVENCION', 'ECHARATE');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('070903', '07', '09', '03', 'CUSCO', 'LA CONVENCION', 'HUAYOPATA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('070904', '07', '09', '04', 'CUSCO', 'LA CONVENCION', 'MARANURA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('070905', '07', '09', '05', 'CUSCO', 'LA CONVENCION', 'OCOBAMBA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('070906', '07', '09', '06', 'CUSCO', 'LA CONVENCION', 'SANTA TERESA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('070907', '07', '09', '07', 'CUSCO', 'LA CONVENCION', 'VILCABAMBA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('070908', '07', '09', '08', 'CUSCO', 'LA CONVENCION', 'QUELLOUNO');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('070909', '07', '09', '09', 'CUSCO', 'LA CONVENCION', 'KIMBIRI');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('070910', '07', '09', '10', 'CUSCO', 'LA CONVENCION', 'PICHARI');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('071001', '07', '10', '01', 'CUSCO', 'PARURO', 'PARURO');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('071002', '07', '10', '02', 'CUSCO', 'PARURO', 'ACCHA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('071003', '07', '10', '03', 'CUSCO', 'PARURO', 'CCAPI');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('071004', '07', '10', '04', 'CUSCO', 'PARURO', 'COLCHA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('071005', '07', '10', '05', 'CUSCO', 'PARURO', 'HUANOQUITE');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('071006', '07', '10', '06', 'CUSCO', 'PARURO', 'OMACHA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('071007', '07', '10', '07', 'CUSCO', 'PARURO', 'YAURISQUE');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('071008', '07', '10', '08', 'CUSCO', 'PARURO', 'PACCARITAMBO');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('071009', '07', '10', '09', 'CUSCO', 'PARURO', 'PILLPINTO');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('071101', '07', '11', '01', 'CUSCO', 'PAUCARTAMBO', 'PAUCARTAMBO');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('071102', '07', '11', '02', 'CUSCO', 'PAUCARTAMBO', 'CAICAY');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('071103', '07', '11', '03', 'CUSCO', 'PAUCARTAMBO', 'COLQUEPATA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('071104', '07', '11', '04', 'CUSCO', 'PAUCARTAMBO', 'CHALLABAMBA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('071105', '07', '11', '05', 'CUSCO', 'PAUCARTAMBO', 'KOSÑIPATA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('071106', '07', '11', '06', 'CUSCO', 'PAUCARTAMBO', 'HUANCARANI');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('071201', '07', '12', '01', 'CUSCO', 'QUISPICANCHI', 'URCOS');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('071202', '07', '12', '02', 'CUSCO', 'QUISPICANCHI', 'ANDAHUAYLILLAS');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('071203', '07', '12', '03', 'CUSCO', 'QUISPICANCHI', 'CAMANTI');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('071204', '07', '12', '04', 'CUSCO', 'QUISPICANCHI', 'CCARHUAYO');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('071205', '07', '12', '05', 'CUSCO', 'QUISPICANCHI', 'CCATCA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('071206', '07', '12', '06', 'CUSCO', 'QUISPICANCHI', 'CUSIPATA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('071207', '07', '12', '07', 'CUSCO', 'QUISPICANCHI', 'HUARO');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('071208', '07', '12', '08', 'CUSCO', 'QUISPICANCHI', 'LUCRE');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('071209', '07', '12', '09', 'CUSCO', 'QUISPICANCHI', 'MARCAPATA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('071210', '07', '12', '10', 'CUSCO', 'QUISPICANCHI', 'OCONGATE');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('071211', '07', '12', '11', 'CUSCO', 'QUISPICANCHI', 'OROPESA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('071212', '07', '12', '12', 'CUSCO', 'QUISPICANCHI', 'QUIQUIJANA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('071301', '07', '13', '01', 'CUSCO', 'URUBAMBA', 'URUBAMBA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('071302', '07', '13', '02', 'CUSCO', 'URUBAMBA', 'CHINCHERO');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('071303', '07', '13', '03', 'CUSCO', 'URUBAMBA', 'HUAYLLABAMBA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('071304', '07', '13', '04', 'CUSCO', 'URUBAMBA', 'MACHUPICCHU');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('071305', '07', '13', '05', 'CUSCO', 'URUBAMBA', 'MARAS');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('071306', '07', '13', '06', 'CUSCO', 'URUBAMBA', 'OLLANTAYTAMBO');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('071307', '07', '13', '07', 'CUSCO', 'URUBAMBA', 'YUCAY');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('080101', '08', '01', '01', 'HUANCAVELICA', 'HUANCAVELICA', 'HUANCAVELICA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('080102', '08', '01', '02', 'HUANCAVELICA', 'HUANCAVELICA', 'ACOBAMBILLA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('080103', '08', '01', '03', 'HUANCAVELICA', 'HUANCAVELICA', 'ACORIA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('080104', '08', '01', '04', 'HUANCAVELICA', 'HUANCAVELICA', 'CONAYCA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('080105', '08', '01', '05', 'HUANCAVELICA', 'HUANCAVELICA', 'CUENCA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('080106', '08', '01', '06', 'HUANCAVELICA', 'HUANCAVELICA', 'HUACHOCOLPA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('080108', '08', '01', '08', 'HUANCAVELICA', 'HUANCAVELICA', 'HUAYLLAHUARA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('080109', '08', '01', '09', 'HUANCAVELICA', 'HUANCAVELICA', 'IZCUCHACA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('080110', '08', '01', '10', 'HUANCAVELICA', 'HUANCAVELICA', 'LARIA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('080111', '08', '01', '11', 'HUANCAVELICA', 'HUANCAVELICA', 'MANTA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('080112', '08', '01', '12', 'HUANCAVELICA', 'HUANCAVELICA', 'MARISCAL CACERES');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('080113', '08', '01', '13', 'HUANCAVELICA', 'HUANCAVELICA', 'MOYA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('080114', '08', '01', '14', 'HUANCAVELICA', 'HUANCAVELICA', 'NUEVO OCCORO');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('080115', '08', '01', '15', 'HUANCAVELICA', 'HUANCAVELICA', 'PALCA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('080116', '08', '01', '16', 'HUANCAVELICA', 'HUANCAVELICA', 'PILCHACA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('080117', '08', '01', '17', 'HUANCAVELICA', 'HUANCAVELICA', 'VILCA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('080118', '08', '01', '18', 'HUANCAVELICA', 'HUANCAVELICA', 'YAULI');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('080119', '08', '01', '19', 'HUANCAVELICA', 'HUANCAVELICA', 'ASCENSION');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('080120', '08', '01', '20', 'HUANCAVELICA', 'HUANCAVELICA', 'HUANDO');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('080201', '08', '02', '01', 'HUANCAVELICA', 'ACOBAMBA', 'ACOBAMBA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('080202', '08', '02', '02', 'HUANCAVELICA', 'ACOBAMBA', 'ANTA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('080203', '08', '02', '03', 'HUANCAVELICA', 'ACOBAMBA', 'ANDABAMBA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('080204', '08', '02', '04', 'HUANCAVELICA', 'ACOBAMBA', 'CAJA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('080205', '08', '02', '05', 'HUANCAVELICA', 'ACOBAMBA', 'MARCAS');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('080206', '08', '02', '06', 'HUANCAVELICA', 'ACOBAMBA', 'PAUCARA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('080207', '08', '02', '07', 'HUANCAVELICA', 'ACOBAMBA', 'POMACOCHA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('080208', '08', '02', '08', 'HUANCAVELICA', 'ACOBAMBA', 'ROSARIO');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('080301', '08', '03', '01', 'HUANCAVELICA', 'ANGARAES', 'LIRCAY');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('080302', '08', '03', '02', 'HUANCAVELICA', 'ANGARAES', 'ANCHONGA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('080303', '08', '03', '03', 'HUANCAVELICA', 'ANGARAES', 'CALLANMARCA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('080304', '08', '03', '04', 'HUANCAVELICA', 'ANGARAES', 'CONGALLA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('080305', '08', '03', '05', 'HUANCAVELICA', 'ANGARAES', 'CHINCHO');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('080306', '08', '03', '06', 'HUANCAVELICA', 'ANGARAES', 'HUALLAY-GRANDE');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('080307', '08', '03', '07', 'HUANCAVELICA', 'ANGARAES', 'HUANCA-HUANCA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('080308', '08', '03', '08', 'HUANCAVELICA', 'ANGARAES', 'JULCAMARCA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('080309', '08', '03', '09', 'HUANCAVELICA', 'ANGARAES', 'SAN ANTONIO DE ANTAPARCO');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('080310', '08', '03', '10', 'HUANCAVELICA', 'ANGARAES', 'SANTO TOMAS DE PATA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('080311', '08', '03', '11', 'HUANCAVELICA', 'ANGARAES', 'SECCLLA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('080312', '08', '03', '12', 'HUANCAVELICA', 'ANGARAES', 'CCOCHACCASA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('080401', '08', '04', '01', 'HUANCAVELICA', 'CASTROVIRREYNA', 'CASTROVIRREYNA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('080402', '08', '04', '02', 'HUANCAVELICA', 'CASTROVIRREYNA', 'ARMA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('080403', '08', '04', '03', 'HUANCAVELICA', 'CASTROVIRREYNA', 'AURAHUA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('080405', '08', '04', '05', 'HUANCAVELICA', 'CASTROVIRREYNA', 'CAPILLAS');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('080406', '08', '04', '06', 'HUANCAVELICA', 'CASTROVIRREYNA', 'COCAS');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('080408', '08', '04', '08', 'HUANCAVELICA', 'CASTROVIRREYNA', 'CHUPAMARCA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('080409', '08', '04', '09', 'HUANCAVELICA', 'CASTROVIRREYNA', 'HUACHOS');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('080410', '08', '04', '10', 'HUANCAVELICA', 'CASTROVIRREYNA', 'HUAMATAMBO');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('080414', '08', '04', '14', 'HUANCAVELICA', 'CASTROVIRREYNA', 'MOLLEPAMPA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('080422', '08', '04', '22', 'HUANCAVELICA', 'CASTROVIRREYNA', 'SAN JUAN');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('080427', '08', '04', '27', 'HUANCAVELICA', 'CASTROVIRREYNA', 'TANTARA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('080428', '08', '04', '28', 'HUANCAVELICA', 'CASTROVIRREYNA', 'TICRAPO');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('080429', '08', '04', '29', 'HUANCAVELICA', 'CASTROVIRREYNA', 'SANTA ANA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('080501', '08', '05', '01', 'HUANCAVELICA', 'TAYACAJA', 'PAMPAS');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('080502', '08', '05', '02', 'HUANCAVELICA', 'TAYACAJA', 'ACOSTAMBO');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('080503', '08', '05', '03', 'HUANCAVELICA', 'TAYACAJA', 'ACRAQUIA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('080504', '08', '05', '04', 'HUANCAVELICA', 'TAYACAJA', 'AHUAYCHA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('080506', '08', '05', '06', 'HUANCAVELICA', 'TAYACAJA', 'COLCABAMBA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('080509', '08', '05', '09', 'HUANCAVELICA', 'TAYACAJA', 'DANIEL HERNANDEZ');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('080511', '08', '05', '11', 'HUANCAVELICA', 'TAYACAJA', 'HUACHOCOLPA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('080512', '08', '05', '12', 'HUANCAVELICA', 'TAYACAJA', 'HUARIBAMBA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('080515', '08', '05', '15', 'HUANCAVELICA', 'TAYACAJA', 'ÑAHUIMPUQUIO');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('080517', '08', '05', '17', 'HUANCAVELICA', 'TAYACAJA', 'PAZOS');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('080518', '08', '05', '18', 'HUANCAVELICA', 'TAYACAJA', 'QUISHUAR');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('080519', '08', '05', '19', 'HUANCAVELICA', 'TAYACAJA', 'SALCABAMBA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('080520', '08', '05', '20', 'HUANCAVELICA', 'TAYACAJA', 'SAN MARCOS DE ROCCHAC');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('080523', '08', '05', '23', 'HUANCAVELICA', 'TAYACAJA', 'SURCUBAMBA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('080525', '08', '05', '25', 'HUANCAVELICA', 'TAYACAJA', 'TINTAY PUNCU');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('080526', '08', '05', '26', 'HUANCAVELICA', 'TAYACAJA', 'SALCAHUASI');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('080601', '08', '06', '01', 'HUANCAVELICA', 'HUAYTARA', 'AYAVI');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('080602', '08', '06', '02', 'HUANCAVELICA', 'HUAYTARA', 'CORDOVA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('080603', '08', '06', '03', 'HUANCAVELICA', 'HUAYTARA', 'HUAYACUNDO ARMA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('080604', '08', '06', '04', 'HUANCAVELICA', 'HUAYTARA', 'HUAYTARA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('080605', '08', '06', '05', 'HUANCAVELICA', 'HUAYTARA', 'LARAMARCA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('080606', '08', '06', '06', 'HUANCAVELICA', 'HUAYTARA', 'OCOYO');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('080607', '08', '06', '07', 'HUANCAVELICA', 'HUAYTARA', 'PILPICHACA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('080608', '08', '06', '08', 'HUANCAVELICA', 'HUAYTARA', 'QUERCO');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('080609', '08', '06', '09', 'HUANCAVELICA', 'HUAYTARA', 'QUITO ARMA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('080610', '08', '06', '10', 'HUANCAVELICA', 'HUAYTARA', 'SAN ANTONIO DE CUSICANCHA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('080611', '08', '06', '11', 'HUANCAVELICA', 'HUAYTARA', 'SAN FRANCISCO DE SANGAYAICO');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('080612', '08', '06', '12', 'HUANCAVELICA', 'HUAYTARA', 'SAN ISIDRO');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('080613', '08', '06', '13', 'HUANCAVELICA', 'HUAYTARA', 'SANTIAGO DE CHOCORVOS');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('080614', '08', '06', '14', 'HUANCAVELICA', 'HUAYTARA', 'SANTIAGO DE QUIRAHUARA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('080615', '08', '06', '15', 'HUANCAVELICA', 'HUAYTARA', 'SANTO DOMINGO DE CAPILLAS');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('080616', '08', '06', '16', 'HUANCAVELICA', 'HUAYTARA', 'TAMBO');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('080701', '08', '07', '01', 'HUANCAVELICA', 'CHURCAMPA', 'CHURCAMPA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('080702', '08', '07', '02', 'HUANCAVELICA', 'CHURCAMPA', 'ANCO');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('080703', '08', '07', '03', 'HUANCAVELICA', 'CHURCAMPA', 'CHINCHIHUASI');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('080704', '08', '07', '04', 'HUANCAVELICA', 'CHURCAMPA', 'EL CARMEN');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('080705', '08', '07', '05', 'HUANCAVELICA', 'CHURCAMPA', 'LA MERCED');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('080706', '08', '07', '06', 'HUANCAVELICA', 'CHURCAMPA', 'LOCROJA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('080707', '08', '07', '07', 'HUANCAVELICA', 'CHURCAMPA', 'PAUCARBAMBA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('080708', '08', '07', '08', 'HUANCAVELICA', 'CHURCAMPA', 'SAN MIGUEL DE MAYOCC');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('080709', '08', '07', '09', 'HUANCAVELICA', 'CHURCAMPA', 'SAN PEDRO DE CORIS');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('080710', '08', '07', '10', 'HUANCAVELICA', 'CHURCAMPA', 'PACHAMARCA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('080711', '08', '07', '11', 'HUANCAVELICA', 'CHURCAMPA', 'COSME');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('090101', '09', '01', '01', 'HUANUCO', 'HUANUCO', 'HUANUCO');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('090102', '09', '01', '02', 'HUANUCO', 'HUANUCO', 'CHINCHAO');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('090103', '09', '01', '03', 'HUANUCO', 'HUANUCO', 'CHURUBAMBA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('090104', '09', '01', '04', 'HUANUCO', 'HUANUCO', 'MARGOS');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('090105', '09', '01', '05', 'HUANUCO', 'HUANUCO', 'QUISQUI');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('090106', '09', '01', '06', 'HUANUCO', 'HUANUCO', 'SAN FRANCISCO DE CAYRAN');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('090107', '09', '01', '07', 'HUANUCO', 'HUANUCO', 'SAN PEDRO DE CHAULAN');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('090108', '09', '01', '08', 'HUANUCO', 'HUANUCO', 'SANTA MARIA DEL VALLE');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('090109', '09', '01', '09', 'HUANUCO', 'HUANUCO', 'YARUMAYO');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('090110', '09', '01', '10', 'HUANUCO', 'HUANUCO', 'AMARILIS');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('090111', '09', '01', '11', 'HUANUCO', 'HUANUCO', 'PILLCO MARCA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('090112', '09', '01', '12', 'HUANUCO', 'HUANUCO', 'YACUS');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('090201', '09', '02', '01', 'HUANUCO', 'AMBO', 'AMBO');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('090202', '09', '02', '02', 'HUANUCO', 'AMBO', 'CAYNA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('090203', '09', '02', '03', 'HUANUCO', 'AMBO', 'COLPAS');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('090204', '09', '02', '04', 'HUANUCO', 'AMBO', 'CONCHAMARCA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('090205', '09', '02', '05', 'HUANUCO', 'AMBO', 'HUACAR');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('090206', '09', '02', '06', 'HUANUCO', 'AMBO', 'SAN FRANCISCO');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('090207', '09', '02', '07', 'HUANUCO', 'AMBO', 'SAN RAFAEL');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('090208', '09', '02', '08', 'HUANUCO', 'AMBO', 'TOMAY-KICHWA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('090301', '09', '03', '01', 'HUANUCO', 'DOS DE MAYO', 'LA UNION');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('090307', '09', '03', '07', 'HUANUCO', 'DOS DE MAYO', 'CHUQUIS');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('090312', '09', '03', '12', 'HUANUCO', 'DOS DE MAYO', 'MARIAS');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('090314', '09', '03', '14', 'HUANUCO', 'DOS DE MAYO', 'PACHAS');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('090316', '09', '03', '16', 'HUANUCO', 'DOS DE MAYO', 'QUIVILLA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('090317', '09', '03', '17', 'HUANUCO', 'DOS DE MAYO', 'RIPAN');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('090321', '09', '03', '21', 'HUANUCO', 'DOS DE MAYO', 'SHUNQUI');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('090322', '09', '03', '22', 'HUANUCO', 'DOS DE MAYO', 'SILLAPATA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('090323', '09', '03', '23', 'HUANUCO', 'DOS DE MAYO', 'YANAS');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('090401', '09', '04', '01', 'HUANUCO', 'HUAMALIES', 'LLATA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('090402', '09', '04', '02', 'HUANUCO', 'HUAMALIES', 'ARANCAY');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('090403', '09', '04', '03', 'HUANUCO', 'HUAMALIES', 'CHAVIN DE PARIARCA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('090404', '09', '04', '04', 'HUANUCO', 'HUAMALIES', 'JACAS GRANDE');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('090405', '09', '04', '05', 'HUANUCO', 'HUAMALIES', 'JIRCAN');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('090406', '09', '04', '06', 'HUANUCO', 'HUAMALIES', 'MIRAFLORES');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('090407', '09', '04', '07', 'HUANUCO', 'HUAMALIES', 'MONZON');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('090408', '09', '04', '08', 'HUANUCO', 'HUAMALIES', 'PUNCHAO');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('090409', '09', '04', '09', 'HUANUCO', 'HUAMALIES', 'PUÑOS');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('090410', '09', '04', '10', 'HUANUCO', 'HUAMALIES', 'SINGA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('090411', '09', '04', '11', 'HUANUCO', 'HUAMALIES', 'TANTAMAYO');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('090501', '09', '05', '01', 'HUANUCO', 'MARAÑON', 'HUACRACHUCO');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('090502', '09', '05', '02', 'HUANUCO', 'MARAÑON', 'CHOLON');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('090505', '09', '05', '05', 'HUANUCO', 'MARAÑON', 'SAN BUENAVENTURA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('090601', '09', '06', '01', 'HUANUCO', 'LEONCIO PRADO', 'RUPA-RUPA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('090602', '09', '06', '02', 'HUANUCO', 'LEONCIO PRADO', 'DANIEL ALOMIA ROBLES');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('090603', '09', '06', '03', 'HUANUCO', 'LEONCIO PRADO', 'HERMILIO VALDIZAN');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('090604', '09', '06', '04', 'HUANUCO', 'LEONCIO PRADO', 'LUYANDO');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('090605', '09', '06', '05', 'HUANUCO', 'LEONCIO PRADO', 'MARIANO DAMASO BERAUN');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('090606', '09', '06', '06', 'HUANUCO', 'LEONCIO PRADO', 'JOSE CRESPO Y CASTILLO');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('090701', '09', '07', '01', 'HUANUCO', 'PACHITEA', 'PANAO');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('090702', '09', '07', '02', 'HUANUCO', 'PACHITEA', 'CHAGLLA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('090704', '09', '07', '04', 'HUANUCO', 'PACHITEA', 'MOLINO');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('090706', '09', '07', '06', 'HUANUCO', 'PACHITEA', 'UMARI');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('090801', '09', '08', '01', 'HUANUCO', 'PUERTO INCA', 'HONORIA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('090802', '09', '08', '02', 'HUANUCO', 'PUERTO INCA', 'PUERTO INCA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('090803', '09', '08', '03', 'HUANUCO', 'PUERTO INCA', 'CODO DEL POZUZO');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('090804', '09', '08', '04', 'HUANUCO', 'PUERTO INCA', 'TOURNAVISTA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('090805', '09', '08', '05', 'HUANUCO', 'PUERTO INCA', 'YUYAPICHIS');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('090901', '09', '09', '01', 'HUANUCO', 'HUACAYBAMBA', 'HUACAYBAMBA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('090902', '09', '09', '02', 'HUANUCO', 'HUACAYBAMBA', 'PINRA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('090903', '09', '09', '03', 'HUANUCO', 'HUACAYBAMBA', 'CANCHABAMBA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('090904', '09', '09', '04', 'HUANUCO', 'HUACAYBAMBA', 'COCHABAMBA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('091001', '09', '10', '01', 'HUANUCO', 'LAURICOCHA', 'JESUS');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('091002', '09', '10', '02', 'HUANUCO', 'LAURICOCHA', 'BAÑOS');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('091003', '09', '10', '03', 'HUANUCO', 'LAURICOCHA', 'SAN FRANCISCO DE ASIS');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('091004', '09', '10', '04', 'HUANUCO', 'LAURICOCHA', 'QUEROPALCA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('091005', '09', '10', '05', 'HUANUCO', 'LAURICOCHA', 'SAN MIGUEL DE CAURI');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('091006', '09', '10', '06', 'HUANUCO', 'LAURICOCHA', 'RONDOS');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('091007', '09', '10', '07', 'HUANUCO', 'LAURICOCHA', 'JIVIA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('091101', '09', '11', '01', 'HUANUCO', 'YAROWILCA', 'CHAVINILLO');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('091102', '09', '11', '02', 'HUANUCO', 'YAROWILCA', 'APARICIO POMARES');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('091103', '09', '11', '03', 'HUANUCO', 'YAROWILCA', 'CAHUAC');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('091104', '09', '11', '04', 'HUANUCO', 'YAROWILCA', 'CHACABAMBA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('091105', '09', '11', '05', 'HUANUCO', 'YAROWILCA', 'JACAS CHICO');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('091106', '09', '11', '06', 'HUANUCO', 'YAROWILCA', 'OBAS');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('091107', '09', '11', '07', 'HUANUCO', 'YAROWILCA', 'PAMPAMARCA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('091108', '09', '11', '08', 'HUANUCO', 'YAROWILCA', 'CHORAS');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('100101', '10', '01', '01', 'ICA', 'ICA', 'ICA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('100102', '10', '01', '02', 'ICA', 'ICA', 'LA TINGUIÑA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('100103', '10', '01', '03', 'ICA', 'ICA', 'LOS AQUIJES');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('100104', '10', '01', '04', 'ICA', 'ICA', 'PARCONA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('100105', '10', '01', '05', 'ICA', 'ICA', 'PUEBLO NUEVO');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('100106', '10', '01', '06', 'ICA', 'ICA', 'SALAS');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('100107', '10', '01', '07', 'ICA', 'ICA', 'SAN JOSE DE LOS MOLINOS');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('100108', '10', '01', '08', 'ICA', 'ICA', 'SAN JUAN BAUTISTA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('100109', '10', '01', '09', 'ICA', 'ICA', 'SANTIAGO');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('100110', '10', '01', '10', 'ICA', 'ICA', 'SUBTANJALLA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('100111', '10', '01', '11', 'ICA', 'ICA', 'YAUCA DEL ROSARIO');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('100112', '10', '01', '12', 'ICA', 'ICA', 'TATE');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('100113', '10', '01', '13', 'ICA', 'ICA', 'PACHACUTEC');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('100114', '10', '01', '14', 'ICA', 'ICA', 'OCUCAJE');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('100201', '10', '02', '01', 'ICA', 'CHINCHA', 'CHINCHA ALTA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('100202', '10', '02', '02', 'ICA', 'CHINCHA', 'CHAVIN');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('100203', '10', '02', '03', 'ICA', 'CHINCHA', 'CHINCHA BAJA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('100204', '10', '02', '04', 'ICA', 'CHINCHA', 'EL CARMEN');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('100205', '10', '02', '05', 'ICA', 'CHINCHA', 'GROCIO PRADO');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('100206', '10', '02', '06', 'ICA', 'CHINCHA', 'SAN PEDRO DE HUACARPANA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('100207', '10', '02', '07', 'ICA', 'CHINCHA', 'SUNAMPE');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('100208', '10', '02', '08', 'ICA', 'CHINCHA', 'TAMBO DE MORA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('100209', '10', '02', '09', 'ICA', 'CHINCHA', 'ALTO LARAN');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('100210', '10', '02', '10', 'ICA', 'CHINCHA', 'PUEBLO NUEVO');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('100211', '10', '02', '11', 'ICA', 'CHINCHA', 'SAN JUAN DE YANAC');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('100301', '10', '03', '01', 'ICA', 'NAZCA', 'NAZCA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('100302', '10', '03', '02', 'ICA', 'NAZCA', 'CHANGUILLO');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('100303', '10', '03', '03', 'ICA', 'NAZCA', 'EL INGENIO');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('100304', '10', '03', '04', 'ICA', 'NAZCA', 'MARCONA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('100305', '10', '03', '05', 'ICA', 'NAZCA', 'VISTA ALEGRE');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('100401', '10', '04', '01', 'ICA', 'PISCO', 'PISCO');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('100402', '10', '04', '02', 'ICA', 'PISCO', 'HUANCANO');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('100403', '10', '04', '03', 'ICA', 'PISCO', 'HUMAY');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('100404', '10', '04', '04', 'ICA', 'PISCO', 'INDEPENDENCIA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('100405', '10', '04', '05', 'ICA', 'PISCO', 'PARACAS');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('100406', '10', '04', '06', 'ICA', 'PISCO', 'SAN ANDRES');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('100407', '10', '04', '07', 'ICA', 'PISCO', 'SAN CLEMENTE');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('100408', '10', '04', '08', 'ICA', 'PISCO', 'TUPAC AMARU INCA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('100501', '10', '05', '01', 'ICA', 'PALPA', 'PALPA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('100502', '10', '05', '02', 'ICA', 'PALPA', 'LLIPATA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('100503', '10', '05', '03', 'ICA', 'PALPA', 'RIO GRANDE');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('100504', '10', '05', '04', 'ICA', 'PALPA', 'SANTA CRUZ');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('100505', '10', '05', '05', 'ICA', 'PALPA', 'TIBILLO');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('110101', '11', '01', '01', 'JUNIN', 'HUANCAYO', 'HUANCAYO');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('110103', '11', '01', '03', 'JUNIN', 'HUANCAYO', 'CARHUACALLANGA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('110104', '11', '01', '04', 'JUNIN', 'HUANCAYO', 'COLCA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('110105', '11', '01', '05', 'JUNIN', 'HUANCAYO', 'CULLHUAS');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('110106', '11', '01', '06', 'JUNIN', 'HUANCAYO', 'CHACAPAMPA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('110107', '11', '01', '07', 'JUNIN', 'HUANCAYO', 'CHICCHE');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('110108', '11', '01', '08', 'JUNIN', 'HUANCAYO', 'CHILCA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('110109', '11', '01', '09', 'JUNIN', 'HUANCAYO', 'CHONGOS ALTO');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('110112', '11', '01', '12', 'JUNIN', 'HUANCAYO', 'CHUPURO');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('110113', '11', '01', '13', 'JUNIN', 'HUANCAYO', 'EL TAMBO');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('110114', '11', '01', '14', 'JUNIN', 'HUANCAYO', 'HUACRAPUQUIO');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('110116', '11', '01', '16', 'JUNIN', 'HUANCAYO', 'HUALHUAS');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('110118', '11', '01', '18', 'JUNIN', 'HUANCAYO', 'HUANCAN');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('110119', '11', '01', '19', 'JUNIN', 'HUANCAYO', 'HUASICANCHA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('110120', '11', '01', '20', 'JUNIN', 'HUANCAYO', 'HUAYUCACHI');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('110121', '11', '01', '21', 'JUNIN', 'HUANCAYO', 'INGENIO');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('110122', '11', '01', '22', 'JUNIN', 'HUANCAYO', 'PARIAHUANCA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('110123', '11', '01', '23', 'JUNIN', 'HUANCAYO', 'PILCOMAYO');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('110124', '11', '01', '24', 'JUNIN', 'HUANCAYO', 'PUCARA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('110125', '11', '01', '25', 'JUNIN', 'HUANCAYO', 'QUICHUAY');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('110126', '11', '01', '26', 'JUNIN', 'HUANCAYO', 'QUILCAS');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('110127', '11', '01', '27', 'JUNIN', 'HUANCAYO', 'SAN AGUSTIN');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('110128', '11', '01', '28', 'JUNIN', 'HUANCAYO', 'SAN JERONIMO DE TUNAN');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('110131', '11', '01', '31', 'JUNIN', 'HUANCAYO', 'SANTO DOMINGO DE ACOBAMBA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('110132', '11', '01', '32', 'JUNIN', 'HUANCAYO', 'SAÑO');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('110133', '11', '01', '33', 'JUNIN', 'HUANCAYO', 'SAPALLANGA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('110134', '11', '01', '34', 'JUNIN', 'HUANCAYO', 'SICAYA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('110136', '11', '01', '36', 'JUNIN', 'HUANCAYO', 'VIQUES');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('110201', '11', '02', '01', 'JUNIN', 'CONCEPCION', 'CONCEPCION');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('110202', '11', '02', '02', 'JUNIN', 'CONCEPCION', 'ACO');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('110203', '11', '02', '03', 'JUNIN', 'CONCEPCION', 'ANDAMARCA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('110204', '11', '02', '04', 'JUNIN', 'CONCEPCION', 'COMAS');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('110205', '11', '02', '05', 'JUNIN', 'CONCEPCION', 'COCHAS');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('110206', '11', '02', '06', 'JUNIN', 'CONCEPCION', 'CHAMBARA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('110207', '11', '02', '07', 'JUNIN', 'CONCEPCION', 'HEROINAS TOLEDO');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('110208', '11', '02', '08', 'JUNIN', 'CONCEPCION', 'MANZANARES');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('110209', '11', '02', '09', 'JUNIN', 'CONCEPCION', 'MARISCAL CASTILLA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('110210', '11', '02', '10', 'JUNIN', 'CONCEPCION', 'MATAHUASI');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('110211', '11', '02', '11', 'JUNIN', 'CONCEPCION', 'MITO');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('110212', '11', '02', '12', 'JUNIN', 'CONCEPCION', 'NUEVE DE JULIO');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('110213', '11', '02', '13', 'JUNIN', 'CONCEPCION', 'ORCOTUNA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('110214', '11', '02', '14', 'JUNIN', 'CONCEPCION', 'SANTA ROSA DE OCOPA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('110215', '11', '02', '15', 'JUNIN', 'CONCEPCION', 'SAN JOSE DE QUERO');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('110301', '11', '03', '01', 'JUNIN', 'JAUJA', 'JAUJA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('110302', '11', '03', '02', 'JUNIN', 'JAUJA', 'ACOLLA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('110303', '11', '03', '03', 'JUNIN', 'JAUJA', 'APATA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('110304', '11', '03', '04', 'JUNIN', 'JAUJA', 'ATAURA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('110305', '11', '03', '05', 'JUNIN', 'JAUJA', 'CANCHAYLLO');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('110306', '11', '03', '06', 'JUNIN', 'JAUJA', 'EL MANTARO');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('110307', '11', '03', '07', 'JUNIN', 'JAUJA', 'HUAMALI');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('110308', '11', '03', '08', 'JUNIN', 'JAUJA', 'HUARIPAMPA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('110309', '11', '03', '09', 'JUNIN', 'JAUJA', 'HUERTAS');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('110310', '11', '03', '10', 'JUNIN', 'JAUJA', 'JANJAILLO');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('110311', '11', '03', '11', 'JUNIN', 'JAUJA', 'JULCAN');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('110312', '11', '03', '12', 'JUNIN', 'JAUJA', 'LEONOR ORDOÑEZ');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('110313', '11', '03', '13', 'JUNIN', 'JAUJA', 'LLOCLLAPAMPA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('110314', '11', '03', '14', 'JUNIN', 'JAUJA', 'MARCO');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('110315', '11', '03', '15', 'JUNIN', 'JAUJA', 'MASMA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('110316', '11', '03', '16', 'JUNIN', 'JAUJA', 'MOLINOS');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('110317', '11', '03', '17', 'JUNIN', 'JAUJA', 'MONOBAMBA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('110318', '11', '03', '18', 'JUNIN', 'JAUJA', 'MUQUI');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('110319', '11', '03', '19', 'JUNIN', 'JAUJA', 'MUQUIYAUYO');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('110320', '11', '03', '20', 'JUNIN', 'JAUJA', 'PACA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('110321', '11', '03', '21', 'JUNIN', 'JAUJA', 'PACCHA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('110322', '11', '03', '22', 'JUNIN', 'JAUJA', 'PANCAN');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('110323', '11', '03', '23', 'JUNIN', 'JAUJA', 'PARCO');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('110324', '11', '03', '24', 'JUNIN', 'JAUJA', 'POMACANCHA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('110325', '11', '03', '25', 'JUNIN', 'JAUJA', 'RICRAN');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('110326', '11', '03', '26', 'JUNIN', 'JAUJA', 'SAN LORENZO');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('110327', '11', '03', '27', 'JUNIN', 'JAUJA', 'SAN PEDRO DE CHUNAN');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('110328', '11', '03', '28', 'JUNIN', 'JAUJA', 'SINCOS');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('110329', '11', '03', '29', 'JUNIN', 'JAUJA', 'TUNAN MARCA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('110330', '11', '03', '30', 'JUNIN', 'JAUJA', 'YAULI');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('110331', '11', '03', '31', 'JUNIN', 'JAUJA', 'CURICACA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('110332', '11', '03', '32', 'JUNIN', 'JAUJA', 'MASMA CHICCHE');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('110333', '11', '03', '33', 'JUNIN', 'JAUJA', 'SAUSA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('110334', '11', '03', '34', 'JUNIN', 'JAUJA', 'YAUYOS');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('110401', '11', '04', '01', 'JUNIN', 'JUNIN', 'JUNIN');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('110402', '11', '04', '02', 'JUNIN', 'JUNIN', 'CARHUAMAYO');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('110403', '11', '04', '03', 'JUNIN', 'JUNIN', 'ONDORES');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('110404', '11', '04', '04', 'JUNIN', 'JUNIN', 'ULCUMAYO');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('110501', '11', '05', '01', 'JUNIN', 'TARMA', 'TARMA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('110502', '11', '05', '02', 'JUNIN', 'TARMA', 'ACOBAMBA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('110503', '11', '05', '03', 'JUNIN', 'TARMA', 'HUARICOLCA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('110504', '11', '05', '04', 'JUNIN', 'TARMA', 'HUASAHUASI');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('110505', '11', '05', '05', 'JUNIN', 'TARMA', 'LA UNION');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('110506', '11', '05', '06', 'JUNIN', 'TARMA', 'PALCA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('110507', '11', '05', '07', 'JUNIN', 'TARMA', 'PALCAMAYO');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('110508', '11', '05', '08', 'JUNIN', 'TARMA', 'SAN PEDRO DE CAJAS');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('110509', '11', '05', '09', 'JUNIN', 'TARMA', 'TAPO');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('110601', '11', '06', '01', 'JUNIN', 'YAULI', 'LA OROYA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('110602', '11', '06', '02', 'JUNIN', 'YAULI', 'CHACAPALPA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('110603', '11', '06', '03', 'JUNIN', 'YAULI', 'HUAY HUAY');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('110604', '11', '06', '04', 'JUNIN', 'YAULI', 'MARCAPOMACOCHA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('110605', '11', '06', '05', 'JUNIN', 'YAULI', 'MOROCOCHA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('110606', '11', '06', '06', 'JUNIN', 'YAULI', 'PACCHA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('110607', '11', '06', '07', 'JUNIN', 'YAULI', 'SANTA BARBARA DE CARHUACAYAN');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('110608', '11', '06', '08', 'JUNIN', 'YAULI', 'SUITUCANCHA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('110609', '11', '06', '09', 'JUNIN', 'YAULI', 'YAULI');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('110610', '11', '06', '10', 'JUNIN', 'YAULI', 'SANTA ROSA DE SACCO');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('110701', '11', '07', '01', 'JUNIN', 'SATIPO', 'SATIPO');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('110702', '11', '07', '02', 'JUNIN', 'SATIPO', 'COVIRIALI');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('110703', '11', '07', '03', 'JUNIN', 'SATIPO', 'LLAYLLA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('110704', '11', '07', '04', 'JUNIN', 'SATIPO', 'MAZAMARI');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('110705', '11', '07', '05', 'JUNIN', 'SATIPO', 'PAMPA HERMOSA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('110706', '11', '07', '06', 'JUNIN', 'SATIPO', 'PANGOA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('110707', '11', '07', '07', 'JUNIN', 'SATIPO', 'RIO NEGRO');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('110708', '11', '07', '08', 'JUNIN', 'SATIPO', 'RIO TAMBO');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('110801', '11', '08', '01', 'JUNIN', 'CHANCHAMAYO', 'CHANCHAMAYO');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('110802', '11', '08', '02', 'JUNIN', 'CHANCHAMAYO', 'SAN RAMON');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('110803', '11', '08', '03', 'JUNIN', 'CHANCHAMAYO', 'VITOC');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('110804', '11', '08', '04', 'JUNIN', 'CHANCHAMAYO', 'SAN LUIS DE SHUARO');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('110805', '11', '08', '05', 'JUNIN', 'CHANCHAMAYO', 'PICHANAQUI');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('110806', '11', '08', '06', 'JUNIN', 'CHANCHAMAYO', 'PERENE');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('110901', '11', '09', '01', 'JUNIN', 'CHUPACA', 'CHUPACA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('110902', '11', '09', '02', 'JUNIN', 'CHUPACA', 'AHUAC');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('110903', '11', '09', '03', 'JUNIN', 'CHUPACA', 'CHONGOS BAJO');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('110904', '11', '09', '04', 'JUNIN', 'CHUPACA', 'HUACHAC');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('110905', '11', '09', '05', 'JUNIN', 'CHUPACA', 'HUAMANCACA CHICO');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('110906', '11', '09', '06', 'JUNIN', 'CHUPACA', 'SAN JUAN DE YSCOS');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('110907', '11', '09', '07', 'JUNIN', 'CHUPACA', 'SAN JUAN DE JARPA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('110908', '11', '09', '08', 'JUNIN', 'CHUPACA', 'TRES DE DICIEMBRE');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('110909', '11', '09', '09', 'JUNIN', 'CHUPACA', 'YANACANCHA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito,Cod_Ven) VALUES ('120101', '12', '01', '01', 'LA LIBERTAD', 'TRUJILLO', 'TRUJILLO', 'V42');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito,Cod_Ven) VALUES ('120102', '12', '01', '02', 'LA LIBERTAD', 'TRUJILLO', 'HUANCHACO', 'V41');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito,Cod_Ven) VALUES ('120103', '12', '01', '03', 'LA LIBERTAD', 'TRUJILLO', 'LAREDO', 'V45');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito,Cod_Ven) VALUES ('120104', '12', '01', '04', 'LA LIBERTAD', 'TRUJILLO', 'MOCHE', 'V40');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito,Cod_Ven) VALUES ('120105', '12', '01', '05', 'LA LIBERTAD', 'TRUJILLO', 'SALAVERRY', 'V39');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito,Cod_Ven) VALUES ('120106', '12', '01', '06', 'LA LIBERTAD', 'TRUJILLO', 'SIMBAL', 'V36');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito,Cod_Ven) VALUES ('120107', '12', '01', '07', 'LA LIBERTAD', 'TRUJILLO', 'VICTOR LARCO HERRERA', 'V41');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito,Cod_Ven) VALUES ('120109', '12', '01', '09', 'LA LIBERTAD', 'TRUJILLO', 'POROTO', 'V45');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito,Cod_Ven) VALUES ('120110', '12', '01', '10', 'LA LIBERTAD', 'TRUJILLO', 'EL PORVENIR', 'V36');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito,Cod_Ven) VALUES ('120111', '12', '01', '11', 'LA LIBERTAD', 'TRUJILLO', 'LA ESPERANZA', 'V45');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito,Cod_Ven) VALUES ('120112', '12', '01', '12', 'LA LIBERTAD', 'TRUJILLO', 'FLORENCIA DE MORA', 'V39');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito,Cod_Ven) VALUES ('120201', '12', '02', '01', 'LA LIBERTAD', 'BOLIVAR', 'BOLIVAR', 'V38');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito,Cod_Ven) VALUES ('120202', '12', '02', '02', 'LA LIBERTAD', 'BOLIVAR', 'BAMBAMARCA', 'V38');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito,Cod_Ven) VALUES ('120203', '12', '02', '03', 'LA LIBERTAD', 'BOLIVAR', 'CONDORMARCA', 'V36');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito,Cod_Ven) VALUES ('120204', '12', '02', '04', 'LA LIBERTAD', 'BOLIVAR', 'LONGOTEA', 'V38');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito,Cod_Ven) VALUES ('120205', '12', '02', '05', 'LA LIBERTAD', 'BOLIVAR', 'UCUNCHA', 'V42');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito,Cod_Ven) VALUES ('120206', '12', '02', '06', 'LA LIBERTAD', 'BOLIVAR', 'UCHUMARCA', 'V42');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito,Cod_Ven) VALUES ('120301', '12', '03', '01', 'LA LIBERTAD', 'SANCHEZ CARRION', 'HUAMACHUCO', 'V36');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito,Cod_Ven) VALUES ('120302', '12', '03', '02', 'LA LIBERTAD', 'SANCHEZ CARRION', 'COCHORCO', 'V41');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito,Cod_Ven) VALUES ('120303', '12', '03', '03', 'LA LIBERTAD', 'SANCHEZ CARRION', 'CURGOS', 'V36');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito,Cod_Ven) VALUES ('120304', '12', '03', '04', 'LA LIBERTAD', 'SANCHEZ CARRION', 'CHUGAY', 'V43');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito,Cod_Ven) VALUES ('120305', '12', '03', '05', 'LA LIBERTAD', 'SANCHEZ CARRION', 'MARCABAL', 'V41');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito,Cod_Ven) VALUES ('120306', '12', '03', '06', 'LA LIBERTAD', 'SANCHEZ CARRION', 'SANAGORAN', 'V45');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito,Cod_Ven) VALUES ('120307', '12', '03', '07', 'LA LIBERTAD', 'SANCHEZ CARRION', 'SARIN', 'V40');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito,Cod_Ven) VALUES ('120308', '12', '03', '08', 'LA LIBERTAD', 'SANCHEZ CARRION', 'SARTIMBAMBA', 'V39');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('120401', '12', '04', '01', 'LA LIBERTAD', 'OTUZCO', 'OTUZCO');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('120402', '12', '04', '02', 'LA LIBERTAD', 'OTUZCO', 'AGALLPAMPA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('120403', '12', '04', '03', 'LA LIBERTAD', 'OTUZCO', 'CHARAT');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('120404', '12', '04', '04', 'LA LIBERTAD', 'OTUZCO', 'HUARANCHAL');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('120405', '12', '04', '05', 'LA LIBERTAD', 'OTUZCO', 'LA CUESTA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('120408', '12', '04', '08', 'LA LIBERTAD', 'OTUZCO', 'PARANDAY');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('120409', '12', '04', '09', 'LA LIBERTAD', 'OTUZCO', 'SALPO');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('120410', '12', '04', '10', 'LA LIBERTAD', 'OTUZCO', 'SINSICAP');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('120411', '12', '04', '11', 'LA LIBERTAD', 'OTUZCO', 'USQUIL');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('120413', '12', '04', '13', 'LA LIBERTAD', 'OTUZCO', 'MACHE');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('120501', '12', '05', '01', 'LA LIBERTAD', 'PACASMAYO', 'SAN PEDRO DE LLOC');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('120503', '12', '05', '03', 'LA LIBERTAD', 'PACASMAYO', 'GUADALUPE');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('120504', '12', '05', '04', 'LA LIBERTAD', 'PACASMAYO', 'JEQUETEPEQUE');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('120506', '12', '05', '06', 'LA LIBERTAD', 'PACASMAYO', 'PACASMAYO');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('120508', '12', '05', '08', 'LA LIBERTAD', 'PACASMAYO', 'SAN JOSE');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('120601', '12', '06', '01', 'LA LIBERTAD', 'PATAZ', 'TAYABAMBA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('120602', '12', '06', '02', 'LA LIBERTAD', 'PATAZ', 'BULDIBUYO');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('120603', '12', '06', '03', 'LA LIBERTAD', 'PATAZ', 'CHILLIA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('120604', '12', '06', '04', 'LA LIBERTAD', 'PATAZ', 'HUAYLILLAS');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('120605', '12', '06', '05', 'LA LIBERTAD', 'PATAZ', 'HUANCASPATA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('120606', '12', '06', '06', 'LA LIBERTAD', 'PATAZ', 'HUAYO');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('120607', '12', '06', '07', 'LA LIBERTAD', 'PATAZ', 'ONGON');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('120608', '12', '06', '08', 'LA LIBERTAD', 'PATAZ', 'PARCOY');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('120609', '12', '06', '09', 'LA LIBERTAD', 'PATAZ', 'PATAZ');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('120610', '12', '06', '10', 'LA LIBERTAD', 'PATAZ', 'PIAS');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('120611', '12', '06', '11', 'LA LIBERTAD', 'PATAZ', 'TAURIJA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('120612', '12', '06', '12', 'LA LIBERTAD', 'PATAZ', 'URPAY');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('120613', '12', '06', '13', 'LA LIBERTAD', 'PATAZ', 'SANTIAGO DE CHALLAS');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('120701', '12', '07', '01', 'LA LIBERTAD', 'SANTIAGO DE CHUCO', 'SANTIAGO DE CHUCO');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('120702', '12', '07', '02', 'LA LIBERTAD', 'SANTIAGO DE CHUCO', 'CACHICADAN');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('120703', '12', '07', '03', 'LA LIBERTAD', 'SANTIAGO DE CHUCO', 'MOLLEBAMBA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('120704', '12', '07', '04', 'LA LIBERTAD', 'SANTIAGO DE CHUCO', 'MOLLEPATA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('120705', '12', '07', '05', 'LA LIBERTAD', 'SANTIAGO DE CHUCO', 'QUIRUVILCA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('120706', '12', '07', '06', 'LA LIBERTAD', 'SANTIAGO DE CHUCO', 'SANTA CRUZ DE CHUCA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('120707', '12', '07', '07', 'LA LIBERTAD', 'SANTIAGO DE CHUCO', 'SITABAMBA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('120708', '12', '07', '08', 'LA LIBERTAD', 'SANTIAGO DE CHUCO', 'ANGASMARCA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('120801', '12', '08', '01', 'LA LIBERTAD', 'ASCOPE', 'ASCOPE');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('120802', '12', '08', '02', 'LA LIBERTAD', 'ASCOPE', 'CHICAMA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('120803', '12', '08', '03', 'LA LIBERTAD', 'ASCOPE', 'CHOCOPE');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('120804', '12', '08', '04', 'LA LIBERTAD', 'ASCOPE', 'SANTIAGO DE CAO');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('120805', '12', '08', '05', 'LA LIBERTAD', 'ASCOPE', 'MAGDALENA DE CAO');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('120806', '12', '08', '06', 'LA LIBERTAD', 'ASCOPE', 'PAIJAN');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('120807', '12', '08', '07', 'LA LIBERTAD', 'ASCOPE', 'RAZURI');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('120808', '12', '08', '08', 'LA LIBERTAD', 'ASCOPE', 'CASA GRANDE');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('120901', '12', '09', '01', 'LA LIBERTAD', 'CHEPEN', 'CHEPEN');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('120902', '12', '09', '02', 'LA LIBERTAD', 'CHEPEN', 'PACANGA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('120903', '12', '09', '03', 'LA LIBERTAD', 'CHEPEN', 'PUEBLO NUEVO');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('121001', '12', '10', '01', 'LA LIBERTAD', 'JULCAN', 'JULCAN');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('121002', '12', '10', '02', 'LA LIBERTAD', 'JULCAN', 'CARABAMBA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('121003', '12', '10', '03', 'LA LIBERTAD', 'JULCAN', 'CALAMARCA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('121004', '12', '10', '04', 'LA LIBERTAD', 'JULCAN', 'HUASO');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('121101', '12', '11', '01', 'LA LIBERTAD', 'GRAN CHIMU', 'CASCAS');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('121102', '12', '11', '02', 'LA LIBERTAD', 'GRAN CHIMU', 'LUCMA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('121103', '12', '11', '03', 'LA LIBERTAD', 'GRAN CHIMU', 'MARMOT');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('121104', '12', '11', '04', 'LA LIBERTAD', 'GRAN CHIMU', 'SAYAPULLO');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('121201', '12', '12', '01', 'LA LIBERTAD', 'VIRU', 'VIRU');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('121202', '12', '12', '02', 'LA LIBERTAD', 'VIRU', 'CHAO');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('121203', '12', '12', '03', 'LA LIBERTAD', 'VIRU', 'GUADALUPITO');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('130101', '13', '01', '01', 'LAMBAYEQUE', 'CHICLAYO', 'CHICLAYO');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('130102', '13', '01', '02', 'LAMBAYEQUE', 'CHICLAYO', 'CHONGOYAPE');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('130103', '13', '01', '03', 'LAMBAYEQUE', 'CHICLAYO', 'ETEN');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('130104', '13', '01', '04', 'LAMBAYEQUE', 'CHICLAYO', 'ETEN PUERTO');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('130105', '13', '01', '05', 'LAMBAYEQUE', 'CHICLAYO', 'LAGUNAS');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('130106', '13', '01', '06', 'LAMBAYEQUE', 'CHICLAYO', 'MONSEFU');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('130107', '13', '01', '07', 'LAMBAYEQUE', 'CHICLAYO', 'NUEVA ARICA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('130108', '13', '01', '08', 'LAMBAYEQUE', 'CHICLAYO', 'OYOTUN');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('130109', '13', '01', '09', 'LAMBAYEQUE', 'CHICLAYO', 'PICSI');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('130110', '13', '01', '10', 'LAMBAYEQUE', 'CHICLAYO', 'PIMENTEL');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('130111', '13', '01', '11', 'LAMBAYEQUE', 'CHICLAYO', 'REQUE');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('130112', '13', '01', '12', 'LAMBAYEQUE', 'CHICLAYO', 'JOSE LEONARDO ORTIZ');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('130113', '13', '01', '13', 'LAMBAYEQUE', 'CHICLAYO', 'SANTA ROSA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('130114', '13', '01', '14', 'LAMBAYEQUE', 'CHICLAYO', 'SAÑA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('130115', '13', '01', '15', 'LAMBAYEQUE', 'CHICLAYO', 'LA VICTORIA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('130116', '13', '01', '16', 'LAMBAYEQUE', 'CHICLAYO', 'CAYALTI');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('130117', '13', '01', '17', 'LAMBAYEQUE', 'CHICLAYO', 'PATAPO');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('130118', '13', '01', '18', 'LAMBAYEQUE', 'CHICLAYO', 'POMALCA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('130119', '13', '01', '19', 'LAMBAYEQUE', 'CHICLAYO', 'PUCALA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('130120', '13', '01', '20', 'LAMBAYEQUE', 'CHICLAYO', 'TUMAN');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('130201', '13', '02', '01', 'LAMBAYEQUE', 'FERREÑAFE', 'FERREÑAFE');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('130202', '13', '02', '02', 'LAMBAYEQUE', 'FERREÑAFE', 'INCAHUASI');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('130203', '13', '02', '03', 'LAMBAYEQUE', 'FERREÑAFE', 'CAÑARIS');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('130204', '13', '02', '04', 'LAMBAYEQUE', 'FERREÑAFE', 'PITIPO');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('130205', '13', '02', '05', 'LAMBAYEQUE', 'FERREÑAFE', 'PUEBLO NUEVO');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('130206', '13', '02', '06', 'LAMBAYEQUE', 'FERREÑAFE', 'MANUEL ANTONIO MESONES MURO');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('130301', '13', '03', '01', 'LAMBAYEQUE', 'LAMBAYEQUE', 'LAMBAYEQUE');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('130302', '13', '03', '02', 'LAMBAYEQUE', 'LAMBAYEQUE', 'CHOCHOPE');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('130303', '13', '03', '03', 'LAMBAYEQUE', 'LAMBAYEQUE', 'ILLIMO');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('130304', '13', '03', '04', 'LAMBAYEQUE', 'LAMBAYEQUE', 'JAYANCA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('130305', '13', '03', '05', 'LAMBAYEQUE', 'LAMBAYEQUE', 'MOCHUMI');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('130306', '13', '03', '06', 'LAMBAYEQUE', 'LAMBAYEQUE', 'MORROPE');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('130307', '13', '03', '07', 'LAMBAYEQUE', 'LAMBAYEQUE', 'MOTUPE');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('130308', '13', '03', '08', 'LAMBAYEQUE', 'LAMBAYEQUE', 'OLMOS');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('130309', '13', '03', '09', 'LAMBAYEQUE', 'LAMBAYEQUE', 'PACORA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('130310', '13', '03', '10', 'LAMBAYEQUE', 'LAMBAYEQUE', 'SALAS');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('130311', '13', '03', '11', 'LAMBAYEQUE', 'LAMBAYEQUE', 'SAN JOSE');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('130312', '13', '03', '12', 'LAMBAYEQUE', 'LAMBAYEQUE', 'TUCUME');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito,Cod_Ven) VALUES ('140101', '14', '01', '01', 'LIMA', 'LIMA', 'LIMA', 'V03');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito,Cod_Ven) VALUES ('140102', '14', '01', '02', 'LIMA', 'LIMA', 'ANCON', 'V22');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito,Cod_Ven) VALUES ('140103', '14', '01', '03', 'LIMA', 'LIMA', 'ATE', 'V31');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito,Cod_Ven) VALUES ('140104', '14', '01', '04', 'LIMA', 'LIMA', 'BREÑA', 'V24');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito,Cod_Ven) VALUES ('140105', '14', '01', '05', 'LIMA', 'LIMA', 'CARABAYLLO', 'V26');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito,Cod_Ven) VALUES ('140106', '14', '01', '06', 'LIMA', 'LIMA', 'COMAS', 'V14');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito,Cod_Ven) VALUES ('140107', '14', '01', '07', 'LIMA', 'LIMA', 'CHACLACAYO', 'V27');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito,Cod_Ven) VALUES ('140108', '14', '01', '08', 'LIMA', 'LIMA', 'CHORRILLOS', 'V12');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito,Cod_Ven) VALUES ('140109', '14', '01', '09', 'LIMA', 'LIMA', 'LA VICTORIA', 'V24');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito,Cod_Ven) VALUES ('140110', '14', '01', '10', 'LIMA', 'LIMA', 'LA MOLINA', 'V24');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito,Cod_Ven) VALUES ('140111', '14', '01', '11', 'LIMA', 'LIMA', 'LINCE', 'V03');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito,Cod_Ven) VALUES ('140112', '14', '01', '12', 'LIMA', 'LIMA', 'LURIGANCHO', 'V33');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito,Cod_Ven) VALUES ('140113', '14', '01', '13', 'LIMA', 'LIMA', 'LURIN', 'V35');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito,Cod_Ven) VALUES ('140114', '14', '01', '14', 'LIMA', 'LIMA', 'MAGDALENA DEL MAR', 'V09');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito,Cod_Ven) VALUES ('140115', '14', '01', '15', 'LIMA', 'LIMA', 'MIRAFLORES', 'V16');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito,Cod_Ven) VALUES ('140116', '14', '01', '16', 'LIMA', 'LIMA', 'PACHACAMAC', 'V06');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito,Cod_Ven) VALUES ('140117', '14', '01', '17', 'LIMA', 'LIMA', 'PUEBLO LIBRE', 'V05');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito,Cod_Ven) VALUES ('140118', '14', '01', '18', 'LIMA', 'LIMA', 'PUCUSANA', 'V11');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito,Cod_Ven) VALUES ('140119', '14', '01', '19', 'LIMA', 'LIMA', 'PUENTE PIEDRA', 'V12');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito,Cod_Ven) VALUES ('140120', '14', '01', '20', 'LIMA', 'LIMA', 'PUNTA HERMOSA', 'V11');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito,Cod_Ven) VALUES ('140121', '14', '01', '21', 'LIMA', 'LIMA', 'PUNTA NEGRA', 'V19');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito,Cod_Ven) VALUES ('140122', '14', '01', '22', 'LIMA', 'LIMA', 'RIMAC', 'V10');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito,Cod_Ven) VALUES ('140123', '14', '01', '23', 'LIMA', 'LIMA', 'SAN BARTOLO', 'V35');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito,Cod_Ven) VALUES ('140124', '14', '01', '24', 'LIMA', 'LIMA', 'SAN ISIDRO', 'V35');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito,Cod_Ven) VALUES ('140125', '14', '01', '25', 'LIMA', 'LIMA', 'BARRANCO', 'V35');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito,Cod_Ven) VALUES ('140126', '14', '01', '26', 'LIMA', 'LIMA', 'SAN MARTIN DE PORRES', 'V07');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito,Cod_Ven) VALUES ('140127', '14', '01', '27', 'LIMA', 'LIMA', 'SAN MIGUEL', 'V14');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito,Cod_Ven) VALUES ('140128', '14', '01', '28', 'LIMA', 'LIMA', 'SANTA MARIA DEL MAR', 'V11');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito,Cod_Ven) VALUES ('140129', '14', '01', '29', 'LIMA', 'LIMA', 'SANTA ROSA', 'V34');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito,Cod_Ven) VALUES ('140130', '14', '01', '30', 'LIMA', 'LIMA', 'SANTIAGO DE SURCO', 'V05');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito,Cod_Ven) VALUES ('140131', '14', '01', '31', 'LIMA', 'LIMA', 'SURQUILLO', 'V05');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito,Cod_Ven) VALUES ('140132', '14', '01', '32', 'LIMA', 'LIMA', 'VILLA MARIA DEL TRIUNFO', 'V22');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito,Cod_Ven) VALUES ('140133', '14', '01', '33', 'LIMA', 'LIMA', 'JESUS MARIA', 'V16');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito,Cod_Ven) VALUES ('140134', '14', '01', '34', 'LIMA', 'LIMA', 'INDEPENDENCIA', 'V35');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito,Cod_Ven) VALUES ('140135', '14', '01', '35', 'LIMA', 'LIMA', 'EL AGUSTINO', 'V24');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito,Cod_Ven) VALUES ('140136', '14', '01', '36', 'LIMA', 'LIMA', 'SAN JUAN DE MIRAFLORES', 'V20');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito,Cod_Ven) VALUES ('140137', '14', '01', '37', 'LIMA', 'LIMA', 'SAN JUAN DE LURIGANCHO', 'V01');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito,Cod_Ven) VALUES ('140138', '14', '01', '38', 'LIMA', 'LIMA', 'SAN LUIS', 'V18');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito,Cod_Ven) VALUES ('140139', '14', '01', '39', 'LIMA', 'LIMA', 'CIENEGUILLA', 'V16');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito,Cod_Ven) VALUES ('140140', '14', '01', '40', 'LIMA', 'LIMA', 'SAN BORJA', 'V16');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito,Cod_Ven) VALUES ('140141', '14', '01', '41', 'LIMA', 'LIMA', 'VILLA EL SALVADOR', 'V28');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito,Cod_Ven) VALUES ('140142', '14', '01', '42', 'LIMA', 'LIMA', 'LOS OLIVOS', 'V26');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito,Cod_Ven) VALUES ('140143', '14', '01', '43', 'LIMA', 'LIMA', 'SANTA ANITA', 'V25');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('140201', '14', '02', '01', 'LIMA', 'CAJATAMBO', 'CAJATAMBO');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('140205', '14', '02', '05', 'LIMA', 'CAJATAMBO', 'COPA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('140206', '14', '02', '06', 'LIMA', 'CAJATAMBO', 'GORGOR');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('140207', '14', '02', '07', 'LIMA', 'CAJATAMBO', 'HUANCAPON');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('140208', '14', '02', '08', 'LIMA', 'CAJATAMBO', 'MANAS');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('140301', '14', '03', '01', 'LIMA', 'CANTA', 'CANTA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('140302', '14', '03', '02', 'LIMA', 'CANTA', 'ARAHUAY');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('140303', '14', '03', '03', 'LIMA', 'CANTA', 'HUAMANTANGA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('140304', '14', '03', '04', 'LIMA', 'CANTA', 'HUAROS');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('140305', '14', '03', '05', 'LIMA', 'CANTA', 'LACHAQUI');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('140306', '14', '03', '06', 'LIMA', 'CANTA', 'SAN BUENAVENTURA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('140307', '14', '03', '07', 'LIMA', 'CANTA', 'SANTA ROSA DE QUIVES');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('140401', '14', '04', '01', 'LIMA', 'CAÑETE', 'SAN VICENTE DE CAÑETE');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('140402', '14', '04', '02', 'LIMA', 'CAÑETE', 'CALANGO');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('140403', '14', '04', '03', 'LIMA', 'CAÑETE', 'CERRO AZUL');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('140404', '14', '04', '04', 'LIMA', 'CAÑETE', 'COAYLLO');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('140405', '14', '04', '05', 'LIMA', 'CAÑETE', 'CHILCA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('140406', '14', '04', '06', 'LIMA', 'CAÑETE', 'IMPERIAL');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('140407', '14', '04', '07', 'LIMA', 'CAÑETE', 'LUNAHUANA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('140408', '14', '04', '08', 'LIMA', 'CAÑETE', 'MALA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('140409', '14', '04', '09', 'LIMA', 'CAÑETE', 'NUEVO IMPERIAL');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('140410', '14', '04', '10', 'LIMA', 'CAÑETE', 'PACARAN');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('140411', '14', '04', '11', 'LIMA', 'CAÑETE', 'QUILMANA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('140412', '14', '04', '12', 'LIMA', 'CAÑETE', 'SAN ANTONIO');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('140413', '14', '04', '13', 'LIMA', 'CAÑETE', 'SAN LUIS');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('140414', '14', '04', '14', 'LIMA', 'CAÑETE', 'SANTA CRUZ DE FLORES');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('140415', '14', '04', '15', 'LIMA', 'CAÑETE', 'ZUÑIGA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('140416', '14', '04', '16', 'LIMA', 'CAÑETE', 'ASIA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('140501', '14', '05', '01', 'LIMA', 'HUAURA', 'HUACHO');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('140502', '14', '05', '02', 'LIMA', 'HUAURA', 'AMBAR');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('140504', '14', '05', '04', 'LIMA', 'HUAURA', 'CALETA DE CARQUIN');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('140505', '14', '05', '05', 'LIMA', 'HUAURA', 'CHECRAS');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('140506', '14', '05', '06', 'LIMA', 'HUAURA', 'HUALMAY');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('140507', '14', '05', '07', 'LIMA', 'HUAURA', 'HUAURA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('140508', '14', '05', '08', 'LIMA', 'HUAURA', 'LEONCIO PRADO');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('140509', '14', '05', '09', 'LIMA', 'HUAURA', 'PACCHO');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('140511', '14', '05', '11', 'LIMA', 'HUAURA', 'SANTA LEONOR');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('140512', '14', '05', '12', 'LIMA', 'HUAURA', 'SANTA MARIA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('140513', '14', '05', '13', 'LIMA', 'HUAURA', 'SAYAN');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('140516', '14', '05', '16', 'LIMA', 'HUAURA', 'VEGUETA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('140601', '14', '06', '01', 'LIMA', 'HUAROCHIRI', 'MATUCANA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('140602', '14', '06', '02', 'LIMA', 'HUAROCHIRI', 'ANTIOQUIA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('140603', '14', '06', '03', 'LIMA', 'HUAROCHIRI', 'CALLAHUANCA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('140604', '14', '06', '04', 'LIMA', 'HUAROCHIRI', 'CARAMPOMA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('140605', '14', '06', '05', 'LIMA', 'HUAROCHIRI', 'CASTA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('140606', '14', '06', '06', 'LIMA', 'HUAROCHIRI', 'SAN JOSE DE LOS CHORRILLOS');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('140607', '14', '06', '07', 'LIMA', 'HUAROCHIRI', 'CHICLA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('140608', '14', '06', '08', 'LIMA', 'HUAROCHIRI', 'HUANZA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('140609', '14', '06', '09', 'LIMA', 'HUAROCHIRI', 'HUAROCHIRI');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('140610', '14', '06', '10', 'LIMA', 'HUAROCHIRI', 'LAHUAYTAMBO');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('140611', '14', '06', '11', 'LIMA', 'HUAROCHIRI', 'LANGA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('140612', '14', '06', '12', 'LIMA', 'HUAROCHIRI', 'MARIATANA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('140613', '14', '06', '13', 'LIMA', 'HUAROCHIRI', 'RICARDO PALMA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('140614', '14', '06', '14', 'LIMA', 'HUAROCHIRI', 'SAN ANDRES DE TUPICOCHA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('140615', '14', '06', '15', 'LIMA', 'HUAROCHIRI', 'SAN ANTONIO');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('140616', '14', '06', '16', 'LIMA', 'HUAROCHIRI', 'SAN BARTOLOME');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('140617', '14', '06', '17', 'LIMA', 'HUAROCHIRI', 'SAN DAMIAN');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('140618', '14', '06', '18', 'LIMA', 'HUAROCHIRI', 'SANGALLAYA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('140619', '14', '06', '19', 'LIMA', 'HUAROCHIRI', 'SAN JUAN DE TANTARANCHE');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('140620', '14', '06', '20', 'LIMA', 'HUAROCHIRI', 'SAN LORENZO DE QUINTI');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('140621', '14', '06', '21', 'LIMA', 'HUAROCHIRI', 'SAN MATEO');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('140622', '14', '06', '22', 'LIMA', 'HUAROCHIRI', 'SAN MATEO DE OTAO');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('140623', '14', '06', '23', 'LIMA', 'HUAROCHIRI', 'SAN PEDRO DE HUANCAYRE');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('140624', '14', '06', '24', 'LIMA', 'HUAROCHIRI', 'SANTA CRUZ DE COCACHACRA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('140625', '14', '06', '25', 'LIMA', 'HUAROCHIRI', 'SANTA EULALIA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('140626', '14', '06', '26', 'LIMA', 'HUAROCHIRI', 'SANTIAGO DE ANCHUCAYA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('140627', '14', '06', '27', 'LIMA', 'HUAROCHIRI', 'SANTIAGO DE TUNA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('140628', '14', '06', '28', 'LIMA', 'HUAROCHIRI', 'SANTO DOMINGO DE LOS OLLEROS');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('140629', '14', '06', '29', 'LIMA', 'HUAROCHIRI', 'SURCO');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('140630', '14', '06', '30', 'LIMA', 'HUAROCHIRI', 'HUACHUPAMPA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('140631', '14', '06', '31', 'LIMA', 'HUAROCHIRI', 'LARAOS');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('140632', '14', '06', '32', 'LIMA', 'HUAROCHIRI', 'SAN JUAN DE IRIS');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('140701', '14', '07', '01', 'LIMA', 'YAUYOS', 'YAUYOS');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('140702', '14', '07', '02', 'LIMA', 'YAUYOS', 'ALIS');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('140703', '14', '07', '03', 'LIMA', 'YAUYOS', 'ALLAUCA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('140704', '14', '07', '04', 'LIMA', 'YAUYOS', 'AYAVIRI');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('140705', '14', '07', '05', 'LIMA', 'YAUYOS', 'AZANGARO');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('140706', '14', '07', '06', 'LIMA', 'YAUYOS', 'CACRA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('140707', '14', '07', '07', 'LIMA', 'YAUYOS', 'CARANIA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('140708', '14', '07', '08', 'LIMA', 'YAUYOS', 'COCHAS');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('140709', '14', '07', '09', 'LIMA', 'YAUYOS', 'COLONIA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('140710', '14', '07', '10', 'LIMA', 'YAUYOS', 'CHOCOS');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('140711', '14', '07', '11', 'LIMA', 'YAUYOS', 'HUAMPARA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('140712', '14', '07', '12', 'LIMA', 'YAUYOS', 'HUANCAYA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('140713', '14', '07', '13', 'LIMA', 'YAUYOS', 'HUANGASCAR');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('140714', '14', '07', '14', 'LIMA', 'YAUYOS', 'HUANTAN');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('140715', '14', '07', '15', 'LIMA', 'YAUYOS', 'HUAÑEC');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('140716', '14', '07', '16', 'LIMA', 'YAUYOS', 'LARAOS');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('140717', '14', '07', '17', 'LIMA', 'YAUYOS', 'LINCHA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('140718', '14', '07', '18', 'LIMA', 'YAUYOS', 'MIRAFLORES');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('140719', '14', '07', '19', 'LIMA', 'YAUYOS', 'OMAS');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('140720', '14', '07', '20', 'LIMA', 'YAUYOS', 'QUINCHES');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('140721', '14', '07', '21', 'LIMA', 'YAUYOS', 'QUINOCAY');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('140722', '14', '07', '22', 'LIMA', 'YAUYOS', 'SAN JOAQUIN');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('140723', '14', '07', '23', 'LIMA', 'YAUYOS', 'SAN PEDRO DE PILAS');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('140724', '14', '07', '24', 'LIMA', 'YAUYOS', 'TANTA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('140725', '14', '07', '25', 'LIMA', 'YAUYOS', 'TAURIPAMPA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('140726', '14', '07', '26', 'LIMA', 'YAUYOS', 'TUPE');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('140727', '14', '07', '27', 'LIMA', 'YAUYOS', 'TOMAS');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('140728', '14', '07', '28', 'LIMA', 'YAUYOS', 'VIÑAC');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('140729', '14', '07', '29', 'LIMA', 'YAUYOS', 'VITIS');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('140730', '14', '07', '30', 'LIMA', 'YAUYOS', 'HONGOS');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('140731', '14', '07', '31', 'LIMA', 'YAUYOS', 'MADEAN');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('140732', '14', '07', '32', 'LIMA', 'YAUYOS', 'PUTINZA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('140733', '14', '07', '33', 'LIMA', 'YAUYOS', 'CATAHUASI');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('140801', '14', '08', '01', 'LIMA', 'HUARAL', 'HUARAL');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('140802', '14', '08', '02', 'LIMA', 'HUARAL', 'ATAVILLOS ALTO');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('140803', '14', '08', '03', 'LIMA', 'HUARAL', 'ATAVILLOS BAJO');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('140804', '14', '08', '04', 'LIMA', 'HUARAL', 'AUCALLAMA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('140805', '14', '08', '05', 'LIMA', 'HUARAL', 'CHANCAY');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('140806', '14', '08', '06', 'LIMA', 'HUARAL', 'IHUARI');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('140807', '14', '08', '07', 'LIMA', 'HUARAL', 'LAMPIAN');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('140808', '14', '08', '08', 'LIMA', 'HUARAL', 'PACARAOS');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('140809', '14', '08', '09', 'LIMA', 'HUARAL', 'SAN MIGUEL DE ACOS');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('140810', '14', '08', '10', 'LIMA', 'HUARAL', 'VEINTISIETE DE NOVIEMBRE');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('140811', '14', '08', '11', 'LIMA', 'HUARAL', 'SANTA CRUZ DE ANDAMARCA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('140812', '14', '08', '12', 'LIMA', 'HUARAL', 'SUMBILCA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('140901', '14', '09', '01', 'LIMA', 'BARRANCA', 'BARRANCA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('140902', '14', '09', '02', 'LIMA', 'BARRANCA', 'PARAMONGA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('140903', '14', '09', '03', 'LIMA', 'BARRANCA', 'PATIVILCA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('140904', '14', '09', '04', 'LIMA', 'BARRANCA', 'SUPE');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('140905', '14', '09', '05', 'LIMA', 'BARRANCA', 'SUPE PUERTO');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('141001', '14', '10', '01', 'LIMA', 'OYON', 'OYON');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('141002', '14', '10', '02', 'LIMA', 'OYON', 'NAVAN');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('141003', '14', '10', '03', 'LIMA', 'OYON', 'CAUJUL');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('141004', '14', '10', '04', 'LIMA', 'OYON', 'ANDAJES');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('141005', '14', '10', '05', 'LIMA', 'OYON', 'PACHANGARA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('141006', '14', '10', '06', 'LIMA', 'OYON', 'COCHAMARCA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('141101', '14', '11', '01', 'LIMA', 'CALLAO', 'CALLAO');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('141102', '14', '11', '02', 'LIMA', 'CALLAO', 'BELLAVISTA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('141103', '14', '11', '03', 'LIMA', 'CALLAO', 'LA PUNTA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('141104', '14', '11', '04', 'LIMA', 'CALLAO', 'CARMEN DE LA LEGUA-REYNOSO');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('141105', '14', '11', '05', 'LIMA', 'CALLAO', 'LA PERLA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('141106', '14', '11', '06', 'LIMA', 'CALLAO', 'VENTANILLA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('150101', '15', '01', '01', 'LORETO', 'MAYNAS', 'IQUITOS');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('150102', '15', '01', '02', 'LORETO', 'MAYNAS', 'ALTO NANAY');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('150103', '15', '01', '03', 'LORETO', 'MAYNAS', 'FERNANDO LORES');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('150104', '15', '01', '04', 'LORETO', 'MAYNAS', 'LAS AMAZONAS');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('150105', '15', '01', '05', 'LORETO', 'MAYNAS', 'MAZAN');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('150106', '15', '01', '06', 'LORETO', 'MAYNAS', 'NAPO');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('150107', '15', '01', '07', 'LORETO', 'MAYNAS', 'PUTUMAYO');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('150108', '15', '01', '08', 'LORETO', 'MAYNAS', 'TORRES CAUSANA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('150110', '15', '01', '10', 'LORETO', 'MAYNAS', 'INDIANA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('150111', '15', '01', '11', 'LORETO', 'MAYNAS', 'PUNCHANA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('150112', '15', '01', '12', 'LORETO', 'MAYNAS', 'BELEN');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('150113', '15', '01', '13', 'LORETO', 'MAYNAS', 'SAN JUAN BAUTISTA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('150114', '15', '01', '14', 'LORETO', 'MAYNAS', 'TENIENTE MANUEL CLAVERO');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('150201', '15', '02', '01', 'LORETO', 'ALTO AMAZONAS', 'YURIMAGUAS');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('150202', '15', '02', '02', 'LORETO', 'ALTO AMAZONAS', 'BALSAPUERTO');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('150205', '15', '02', '05', 'LORETO', 'ALTO AMAZONAS', 'JEBEROS');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('150206', '15', '02', '06', 'LORETO', 'ALTO AMAZONAS', 'LAGUNAS');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('150210', '15', '02', '10', 'LORETO', 'ALTO AMAZONAS', 'SANTA CRUZ');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('150211', '15', '02', '11', 'LORETO', 'ALTO AMAZONAS', 'TENIENTE CESAR LOPEZ ROJAS');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('150301', '15', '03', '01', 'LORETO', 'LORETO', 'NAUTA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('150302', '15', '03', '02', 'LORETO', 'LORETO', 'PARINARI');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('150303', '15', '03', '03', 'LORETO', 'LORETO', 'TIGRE');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('150304', '15', '03', '04', 'LORETO', 'LORETO', 'URARINAS');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('150305', '15', '03', '05', 'LORETO', 'LORETO', 'TROMPETEROS');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('150401', '15', '04', '01', 'LORETO', 'REQUENA', 'REQUENA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('150402', '15', '04', '02', 'LORETO', 'REQUENA', 'ALTO TAPICHE');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('150403', '15', '04', '03', 'LORETO', 'REQUENA', 'CAPELO');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('150404', '15', '04', '04', 'LORETO', 'REQUENA', 'EMILIO SAN MARTIN');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('150405', '15', '04', '05', 'LORETO', 'REQUENA', 'MAQUIA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('150406', '15', '04', '06', 'LORETO', 'REQUENA', 'PUINAHUA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('150407', '15', '04', '07', 'LORETO', 'REQUENA', 'SAQUENA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('150408', '15', '04', '08', 'LORETO', 'REQUENA', 'SOPLIN');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('150409', '15', '04', '09', 'LORETO', 'REQUENA', 'TAPICHE');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('150410', '15', '04', '10', 'LORETO', 'REQUENA', 'JENARO HERRERA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('150411', '15', '04', '11', 'LORETO', 'REQUENA', 'YAQUERANA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('150501', '15', '05', '01', 'LORETO', 'UCAYALI', 'CONTAMANA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('150502', '15', '05', '02', 'LORETO', 'UCAYALI', 'VARGAS GUERRA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('150503', '15', '05', '03', 'LORETO', 'UCAYALI', 'PADRE MARQUEZ');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('150504', '15', '05', '04', 'LORETO', 'UCAYALI', 'PAMPA HERMOSA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('150505', '15', '05', '05', 'LORETO', 'UCAYALI', 'SARAYACU');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('150506', '15', '05', '06', 'LORETO', 'UCAYALI', 'INAHUAYA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('150601', '15', '06', '01', 'LORETO', 'MARISCAL RAMON CASTILLA', 'RAMON CASTILLA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('150602', '15', '06', '02', 'LORETO', 'MARISCAL RAMON CASTILLA', 'PEBAS');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('150603', '15', '06', '03', 'LORETO', 'MARISCAL RAMON CASTILLA', 'YAVARI');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('150604', '15', '06', '04', 'LORETO', 'MARISCAL RAMON CASTILLA', 'SAN PABLO');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('150701', '15', '07', '01', 'LORETO', 'DATEM DEL MARAÑON', 'BARRANCA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('150702', '15', '07', '02', 'LORETO', 'DATEM DEL MARAÑON', 'ANDOAS');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('150703', '15', '07', '03', 'LORETO', 'DATEM DEL MARAÑON', 'CAHUAPANAS');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('150704', '15', '07', '04', 'LORETO', 'DATEM DEL MARAÑON', 'MANSERICHE');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('150705', '15', '07', '05', 'LORETO', 'DATEM DEL MARAÑON', 'MORONA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('150706', '15', '07', '06', 'LORETO', 'DATEM DEL MARAÑON', 'PASTAZA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('160101', '16', '01', '01', 'MADRE DE DIOS', 'TAMBOPATA', 'TAMBOPATA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('160102', '16', '01', '02', 'MADRE DE DIOS', 'TAMBOPATA', 'INAMBARI');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('160103', '16', '01', '03', 'MADRE DE DIOS', 'TAMBOPATA', 'LAS PIEDRAS');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('160104', '16', '01', '04', 'MADRE DE DIOS', 'TAMBOPATA', 'LABERINTO');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('160201', '16', '02', '01', 'MADRE DE DIOS', 'MANU', 'MANU');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('160202', '16', '02', '02', 'MADRE DE DIOS', 'MANU', 'FITZCARRALD');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('160203', '16', '02', '03', 'MADRE DE DIOS', 'MANU', 'MADRE DE DIOS');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('160204', '16', '02', '04', 'MADRE DE DIOS', 'MANU', 'HUEPETUHE');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('160301', '16', '03', '01', 'MADRE DE DIOS', 'TAHUAMANU', 'IÑAPARI');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('160302', '16', '03', '02', 'MADRE DE DIOS', 'TAHUAMANU', 'IBERIA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('160303', '16', '03', '03', 'MADRE DE DIOS', 'TAHUAMANU', 'TAHUAMANU');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('170101', '17', '01', '01', 'MOQUEGUA', 'MARISCAL NIETO', 'MOQUEGUA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('170102', '17', '01', '02', 'MOQUEGUA', 'MARISCAL NIETO', 'CARUMAS');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('170103', '17', '01', '03', 'MOQUEGUA', 'MARISCAL NIETO', 'CUCHUMBAYA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('170104', '17', '01', '04', 'MOQUEGUA', 'MARISCAL NIETO', 'SAN CRISTOBAL');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('170105', '17', '01', '05', 'MOQUEGUA', 'MARISCAL NIETO', 'TORATA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('170106', '17', '01', '06', 'MOQUEGUA', 'MARISCAL NIETO', 'SAMEGUA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('170201', '17', '02', '01', 'MOQUEGUA', 'GENERAL SANCHEZ CERRO', 'OMATE');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('170202', '17', '02', '02', 'MOQUEGUA', 'GENERAL SANCHEZ CERRO', 'COALAQUE');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('170203', '17', '02', '03', 'MOQUEGUA', 'GENERAL SANCHEZ CERRO', 'CHOJATA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('170204', '17', '02', '04', 'MOQUEGUA', 'GENERAL SANCHEZ CERRO', 'ICHUÑA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('170205', '17', '02', '05', 'MOQUEGUA', 'GENERAL SANCHEZ CERRO', 'LA CAPILLA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('170206', '17', '02', '06', 'MOQUEGUA', 'GENERAL SANCHEZ CERRO', 'LLOQUE');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('170207', '17', '02', '07', 'MOQUEGUA', 'GENERAL SANCHEZ CERRO', 'MATALAQUE');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('170208', '17', '02', '08', 'MOQUEGUA', 'GENERAL SANCHEZ CERRO', 'PUQUINA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('170209', '17', '02', '09', 'MOQUEGUA', 'GENERAL SANCHEZ CERRO', 'QUINISTAQUILLAS');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('170210', '17', '02', '10', 'MOQUEGUA', 'GENERAL SANCHEZ CERRO', 'UBINAS');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('170211', '17', '02', '11', 'MOQUEGUA', 'GENERAL SANCHEZ CERRO', 'YUNGA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('170301', '17', '03', '01', 'MOQUEGUA', 'ILO', 'ILO');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('170302', '17', '03', '02', 'MOQUEGUA', 'ILO', 'EL ALGARROBAL');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('170303', '17', '03', '03', 'MOQUEGUA', 'ILO', 'PACOCHA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('180101', '18', '01', '01', 'PASCO', 'PASCO', 'CHAUPIMARCA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('180103', '18', '01', '03', 'PASCO', 'PASCO', 'HUACHON');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('180104', '18', '01', '04', 'PASCO', 'PASCO', 'HUARIACA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('180105', '18', '01', '05', 'PASCO', 'PASCO', 'HUAYLLAY');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('180106', '18', '01', '06', 'PASCO', 'PASCO', 'NINACACA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('180107', '18', '01', '07', 'PASCO', 'PASCO', 'PALLANCHACRA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('180108', '18', '01', '08', 'PASCO', 'PASCO', 'PAUCARTAMBO');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('180109', '18', '01', '09', 'PASCO', 'PASCO', 'SAN FCO DE ASIS DE YARUSYACAN');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('180110', '18', '01', '10', 'PASCO', 'PASCO', 'SIMON BOLIVAR');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('180111', '18', '01', '11', 'PASCO', 'PASCO', 'TICLACAYAN');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('180112', '18', '01', '12', 'PASCO', 'PASCO', 'TINYAHUARCO');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('180113', '18', '01', '13', 'PASCO', 'PASCO', 'VICCO');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('180114', '18', '01', '14', 'PASCO', 'PASCO', 'YANACANCHA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('180201', '18', '02', '01', 'PASCO', 'DANIEL ALCIDES CARRION', 'YANAHUANCA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('180202', '18', '02', '02', 'PASCO', 'DANIEL ALCIDES CARRION', 'CHACAYAN');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('180203', '18', '02', '03', 'PASCO', 'DANIEL ALCIDES CARRION', 'GOYLLARISQUIZGA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('180204', '18', '02', '04', 'PASCO', 'DANIEL ALCIDES CARRION', 'PAUCAR');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('180205', '18', '02', '05', 'PASCO', 'DANIEL ALCIDES CARRION', 'SAN PEDRO DE PILLAO');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('180206', '18', '02', '06', 'PASCO', 'DANIEL ALCIDES CARRION', 'SANTA ANA DE TUSI');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('180207', '18', '02', '07', 'PASCO', 'DANIEL ALCIDES CARRION', 'TAPUC');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('180208', '18', '02', '08', 'PASCO', 'DANIEL ALCIDES CARRION', 'VILCABAMBA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('180301', '18', '03', '01', 'PASCO', 'OXAPAMPA', 'OXAPAMPA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('180302', '18', '03', '02', 'PASCO', 'OXAPAMPA', 'CHONTABAMBA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('180303', '18', '03', '03', 'PASCO', 'OXAPAMPA', 'HUANCABAMBA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('180304', '18', '03', '04', 'PASCO', 'OXAPAMPA', 'PUERTO BERMUDEZ');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('180305', '18', '03', '05', 'PASCO', 'OXAPAMPA', 'VILLA RICA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('180306', '18', '03', '06', 'PASCO', 'OXAPAMPA', 'POZUZO');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('180307', '18', '03', '07', 'PASCO', 'OXAPAMPA', 'PALCAZU');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('180308', '18', '03', '08', 'PASCO', 'OXAPAMPA', 'CONSTITUCION');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('190101', '19', '01', '01', 'PIURA', 'PIURA', 'PIURA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('190103', '19', '01', '03', 'PIURA', 'PIURA', 'CASTILLA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('190104', '19', '01', '04', 'PIURA', 'PIURA', 'CATACAOS');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('190105', '19', '01', '05', 'PIURA', 'PIURA', 'LA ARENA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('190106', '19', '01', '06', 'PIURA', 'PIURA', 'LA UNION');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('190107', '19', '01', '07', 'PIURA', 'PIURA', 'LAS LOMAS');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('190109', '19', '01', '09', 'PIURA', 'PIURA', 'TAMBO GRANDE');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('190113', '19', '01', '13', 'PIURA', 'PIURA', 'CURA MORI');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('190114', '19', '01', '14', 'PIURA', 'PIURA', 'EL TALLAN');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('190115', '19', '01', '15', 'PIURA', 'PIURA', 'VEINTISEIS DE OCTUBRE');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('190201', '19', '02', '01', 'PIURA', 'AYABACA', 'AYABACA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('190202', '19', '02', '02', 'PIURA', 'AYABACA', 'FRIAS');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('190203', '19', '02', '03', 'PIURA', 'AYABACA', 'LAGUNAS');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('190204', '19', '02', '04', 'PIURA', 'AYABACA', 'MONTERO');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('190205', '19', '02', '05', 'PIURA', 'AYABACA', 'PACAIPAMPA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('190206', '19', '02', '06', 'PIURA', 'AYABACA', 'SAPILLICA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('190207', '19', '02', '07', 'PIURA', 'AYABACA', 'SICCHEZ');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('190208', '19', '02', '08', 'PIURA', 'AYABACA', 'SUYO');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('190209', '19', '02', '09', 'PIURA', 'AYABACA', 'JILILI');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('190210', '19', '02', '10', 'PIURA', 'AYABACA', 'PAIMAS');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('190301', '19', '03', '01', 'PIURA', 'HUANCABAMBA', 'HUANCABAMBA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('190302', '19', '03', '02', 'PIURA', 'HUANCABAMBA', 'CANCHAQUE');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('190303', '19', '03', '03', 'PIURA', 'HUANCABAMBA', 'HUARMACA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('190304', '19', '03', '04', 'PIURA', 'HUANCABAMBA', 'SONDOR');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('190305', '19', '03', '05', 'PIURA', 'HUANCABAMBA', 'SONDORILLO');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('190306', '19', '03', '06', 'PIURA', 'HUANCABAMBA', 'EL CARMEN DE LA FRONTERA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('190307', '19', '03', '07', 'PIURA', 'HUANCABAMBA', 'SAN MIGUEL DE EL FAIQUE');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('190308', '19', '03', '08', 'PIURA', 'HUANCABAMBA', 'LALAQUIZ');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('190401', '19', '04', '01', 'PIURA', 'MORROPON', 'CHULUCANAS');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('190402', '19', '04', '02', 'PIURA', 'MORROPON', 'BUENOS AIRES');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('190403', '19', '04', '03', 'PIURA', 'MORROPON', 'CHALACO');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('190404', '19', '04', '04', 'PIURA', 'MORROPON', 'MORROPON');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('190405', '19', '04', '05', 'PIURA', 'MORROPON', 'SALITRAL');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('190406', '19', '04', '06', 'PIURA', 'MORROPON', 'SANTA CATALINA DE MOSSA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('190407', '19', '04', '07', 'PIURA', 'MORROPON', 'SANTO DOMINGO');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('190408', '19', '04', '08', 'PIURA', 'MORROPON', 'LA MATANZA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('190409', '19', '04', '09', 'PIURA', 'MORROPON', 'YAMANGO');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('190410', '19', '04', '10', 'PIURA', 'MORROPON', 'SAN JUAN DE BIGOTE');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('190501', '19', '05', '01', 'PIURA', 'PAITA', 'PAITA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('190502', '19', '05', '02', 'PIURA', 'PAITA', 'AMOTAPE');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('190503', '19', '05', '03', 'PIURA', 'PAITA', 'ARENAL');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('190504', '19', '05', '04', 'PIURA', 'PAITA', 'LA HUACA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('190505', '19', '05', '05', 'PIURA', 'PAITA', 'COLAN');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('190506', '19', '05', '06', 'PIURA', 'PAITA', 'TAMARINDO');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('190507', '19', '05', '07', 'PIURA', 'PAITA', 'VICHAYAL');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('190601', '19', '06', '01', 'PIURA', 'SULLANA', 'SULLANA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('190602', '19', '06', '02', 'PIURA', 'SULLANA', 'BELLAVISTA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('190603', '19', '06', '03', 'PIURA', 'SULLANA', 'LANCONES');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('190604', '19', '06', '04', 'PIURA', 'SULLANA', 'MARCAVELICA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('190605', '19', '06', '05', 'PIURA', 'SULLANA', 'MIGUEL CHECA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('190606', '19', '06', '06', 'PIURA', 'SULLANA', 'QUERECOTILLO');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('190607', '19', '06', '07', 'PIURA', 'SULLANA', 'SALITRAL');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('190608', '19', '06', '08', 'PIURA', 'SULLANA', 'IGNACIO ESCUDERO');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('190701', '19', '07', '01', 'PIURA', 'TALARA', 'PARIÑAS');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('190702', '19', '07', '02', 'PIURA', 'TALARA', 'EL ALTO');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('190703', '19', '07', '03', 'PIURA', 'TALARA', 'LA BREA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('190704', '19', '07', '04', 'PIURA', 'TALARA', 'LOBITOS');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('190705', '19', '07', '05', 'PIURA', 'TALARA', 'MANCORA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('190706', '19', '07', '06', 'PIURA', 'TALARA', 'LOS ORGANOS');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('190801', '19', '08', '01', 'PIURA', 'SECHURA', 'SECHURA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('190802', '19', '08', '02', 'PIURA', 'SECHURA', 'VICE');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('190803', '19', '08', '03', 'PIURA', 'SECHURA', 'BERNAL');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('190804', '19', '08', '04', 'PIURA', 'SECHURA', 'BELLAVISTA DE LA UNION');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('190805', '19', '08', '05', 'PIURA', 'SECHURA', 'CRISTO NOS VALGA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('190806', '19', '08', '06', 'PIURA', 'SECHURA', 'RINCONADA-LLICUAR');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('200101', '20', '01', '01', 'PUNO', 'PUNO', 'PUNO');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('200102', '20', '01', '02', 'PUNO', 'PUNO', 'ACORA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('200103', '20', '01', '03', 'PUNO', 'PUNO', 'ATUNCOLLA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('200104', '20', '01', '04', 'PUNO', 'PUNO', 'CAPACHICA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('200105', '20', '01', '05', 'PUNO', 'PUNO', 'COATA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('200106', '20', '01', '06', 'PUNO', 'PUNO', 'CHUCUITO');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('200107', '20', '01', '07', 'PUNO', 'PUNO', 'HUATA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('200108', '20', '01', '08', 'PUNO', 'PUNO', 'MAÑAZO');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('200109', '20', '01', '09', 'PUNO', 'PUNO', 'PAUCARCOLLA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('200110', '20', '01', '10', 'PUNO', 'PUNO', 'PICHACANI');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('200111', '20', '01', '11', 'PUNO', 'PUNO', 'SAN ANTONIO');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('200112', '20', '01', '12', 'PUNO', 'PUNO', 'TIQUILLACA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('200113', '20', '01', '13', 'PUNO', 'PUNO', 'VILQUE');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('200114', '20', '01', '14', 'PUNO', 'PUNO', 'PLATERIA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('200115', '20', '01', '15', 'PUNO', 'PUNO', 'AMANTANI');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('200201', '20', '02', '01', 'PUNO', 'AZANGARO', 'AZANGARO');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('200202', '20', '02', '02', 'PUNO', 'AZANGARO', 'ACHAYA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('200203', '20', '02', '03', 'PUNO', 'AZANGARO', 'ARAPA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('200204', '20', '02', '04', 'PUNO', 'AZANGARO', 'ASILLO');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('200205', '20', '02', '05', 'PUNO', 'AZANGARO', 'CAMINACA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('200206', '20', '02', '06', 'PUNO', 'AZANGARO', 'CHUPA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('200207', '20', '02', '07', 'PUNO', 'AZANGARO', 'JOSE DOMINGO CHOQUEHUANCA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('200208', '20', '02', '08', 'PUNO', 'AZANGARO', 'MUÑANI');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('200210', '20', '02', '10', 'PUNO', 'AZANGARO', 'POTONI');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('200212', '20', '02', '12', 'PUNO', 'AZANGARO', 'SAMAN');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('200213', '20', '02', '13', 'PUNO', 'AZANGARO', 'SAN ANTON');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('200214', '20', '02', '14', 'PUNO', 'AZANGARO', 'SAN JOSE');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('200215', '20', '02', '15', 'PUNO', 'AZANGARO', 'SAN JUAN DE SALINAS');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('200216', '20', '02', '16', 'PUNO', 'AZANGARO', 'SANTIAGO DE PUPUJA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('200217', '20', '02', '17', 'PUNO', 'AZANGARO', 'TIRAPATA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('200301', '20', '03', '01', 'PUNO', 'CARABAYA', 'MACUSANI');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('200302', '20', '03', '02', 'PUNO', 'CARABAYA', 'AJOYANI');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('200303', '20', '03', '03', 'PUNO', 'CARABAYA', 'AYAPATA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('200304', '20', '03', '04', 'PUNO', 'CARABAYA', 'COASA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('200305', '20', '03', '05', 'PUNO', 'CARABAYA', 'CORANI');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('200306', '20', '03', '06', 'PUNO', 'CARABAYA', 'CRUCERO');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('200307', '20', '03', '07', 'PUNO', 'CARABAYA', 'ITUATA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('200308', '20', '03', '08', 'PUNO', 'CARABAYA', 'OLLACHEA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('200309', '20', '03', '09', 'PUNO', 'CARABAYA', 'SAN GABAN');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('200310', '20', '03', '10', 'PUNO', 'CARABAYA', 'USICAYOS');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('200401', '20', '04', '01', 'PUNO', 'CHUCUITO', 'JULI');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('200402', '20', '04', '02', 'PUNO', 'CHUCUITO', 'DESAGUADERO');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('200403', '20', '04', '03', 'PUNO', 'CHUCUITO', 'HUACULLANI');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('200406', '20', '04', '06', 'PUNO', 'CHUCUITO', 'PISACOMA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('200407', '20', '04', '07', 'PUNO', 'CHUCUITO', 'POMATA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('200410', '20', '04', '10', 'PUNO', 'CHUCUITO', 'ZEPITA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('200412', '20', '04', '12', 'PUNO', 'CHUCUITO', 'KELLUYO');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('200501', '20', '05', '01', 'PUNO', 'HUANCANE', 'HUANCANE');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('200502', '20', '05', '02', 'PUNO', 'HUANCANE', 'COJATA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('200504', '20', '05', '04', 'PUNO', 'HUANCANE', 'INCHUPALLA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('200506', '20', '05', '06', 'PUNO', 'HUANCANE', 'PUSI');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('200507', '20', '05', '07', 'PUNO', 'HUANCANE', 'ROSASPATA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('200508', '20', '05', '08', 'PUNO', 'HUANCANE', 'TARACO');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('200509', '20', '05', '09', 'PUNO', 'HUANCANE', 'VILQUE CHICO');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('200511', '20', '05', '11', 'PUNO', 'HUANCANE', 'HUATASANI');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('200601', '20', '06', '01', 'PUNO', 'LAMPA', 'LAMPA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('200602', '20', '06', '02', 'PUNO', 'LAMPA', 'CABANILLA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('200603', '20', '06', '03', 'PUNO', 'LAMPA', 'CALAPUJA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('200604', '20', '06', '04', 'PUNO', 'LAMPA', 'NICASIO');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('200605', '20', '06', '05', 'PUNO', 'LAMPA', 'OCUVIRI');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('200606', '20', '06', '06', 'PUNO', 'LAMPA', 'PALCA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('200607', '20', '06', '07', 'PUNO', 'LAMPA', 'PARATIA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('200608', '20', '06', '08', 'PUNO', 'LAMPA', 'PUCARA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('200609', '20', '06', '09', 'PUNO', 'LAMPA', 'SANTA LUCIA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('200610', '20', '06', '10', 'PUNO', 'LAMPA', 'VILAVILA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('200701', '20', '07', '01', 'PUNO', 'MELGAR', 'AYAVIRI');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('200702', '20', '07', '02', 'PUNO', 'MELGAR', 'ANTAUTA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('200703', '20', '07', '03', 'PUNO', 'MELGAR', 'CUPI');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('200704', '20', '07', '04', 'PUNO', 'MELGAR', 'LLALLI');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('200705', '20', '07', '05', 'PUNO', 'MELGAR', 'MACARI');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('200706', '20', '07', '06', 'PUNO', 'MELGAR', 'NUÑOA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('200707', '20', '07', '07', 'PUNO', 'MELGAR', 'ORURILLO');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('200708', '20', '07', '08', 'PUNO', 'MELGAR', 'SANTA ROSA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('200709', '20', '07', '09', 'PUNO', 'MELGAR', 'UMACHIRI');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('200801', '20', '08', '01', 'PUNO', 'SANDIA', 'SANDIA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('200803', '20', '08', '03', 'PUNO', 'SANDIA', 'CUYOCUYO');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('200804', '20', '08', '04', 'PUNO', 'SANDIA', 'LIMBANI');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('200805', '20', '08', '05', 'PUNO', 'SANDIA', 'PHARA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('200806', '20', '08', '06', 'PUNO', 'SANDIA', 'PATAMBUCO');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('200807', '20', '08', '07', 'PUNO', 'SANDIA', 'QUIACA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('200808', '20', '08', '08', 'PUNO', 'SANDIA', 'SAN JUAN DEL ORO');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('200810', '20', '08', '10', 'PUNO', 'SANDIA', 'YANAHUAYA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('200811', '20', '08', '11', 'PUNO', 'SANDIA', 'ALTO INAMBARI');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('200812', '20', '08', '12', 'PUNO', 'SANDIA', 'SAN PEDRO DE PUTINA PUNCO');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('200901', '20', '09', '01', 'PUNO', 'SAN ROMAN', 'JULIACA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('200902', '20', '09', '02', 'PUNO', 'SAN ROMAN', 'CABANA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('200903', '20', '09', '03', 'PUNO', 'SAN ROMAN', 'CABANILLAS');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('200904', '20', '09', '04', 'PUNO', 'SAN ROMAN', 'CARACOTO');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('201001', '20', '10', '01', 'PUNO', 'YUNGUYO', 'YUNGUYO');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('201002', '20', '10', '02', 'PUNO', 'YUNGUYO', 'UNICACHI');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('201003', '20', '10', '03', 'PUNO', 'YUNGUYO', 'ANAPIA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('201004', '20', '10', '04', 'PUNO', 'YUNGUYO', 'COPANI');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('201005', '20', '10', '05', 'PUNO', 'YUNGUYO', 'CUTURAPI');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('201006', '20', '10', '06', 'PUNO', 'YUNGUYO', 'OLLARAYA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('201007', '20', '10', '07', 'PUNO', 'YUNGUYO', 'TINICACHI');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('201101', '20', '11', '01', 'PUNO', 'SAN ANTONIO DE PUTINA', 'PUTINA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('201102', '20', '11', '02', 'PUNO', 'SAN ANTONIO DE PUTINA', 'PEDRO VILCA APAZA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('201103', '20', '11', '03', 'PUNO', 'SAN ANTONIO DE PUTINA', 'QUILCAPUNCU');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('201104', '20', '11', '04', 'PUNO', 'SAN ANTONIO DE PUTINA', 'ANANEA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('201105', '20', '11', '05', 'PUNO', 'SAN ANTONIO DE PUTINA', 'SINA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('201201', '20', '12', '01', 'PUNO', 'EL COLLAO', 'ILAVE');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('201202', '20', '12', '02', 'PUNO', 'EL COLLAO', 'PILCUYO');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('201203', '20', '12', '03', 'PUNO', 'EL COLLAO', 'SANTA ROSA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('201204', '20', '12', '04', 'PUNO', 'EL COLLAO', 'CAPASO');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('201205', '20', '12', '05', 'PUNO', 'EL COLLAO', 'CONDURIRI');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('201301', '20', '13', '01', 'PUNO', 'MOHO', 'MOHO');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('201302', '20', '13', '02', 'PUNO', 'MOHO', 'CONIMA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('201303', '20', '13', '03', 'PUNO', 'MOHO', 'TILALI');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('201304', '20', '13', '04', 'PUNO', 'MOHO', 'HUAYRAPATA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('210101', '21', '01', '01', 'SAN MARTIN', 'MOYOBAMBA', 'MOYOBAMBA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('210102', '21', '01', '02', 'SAN MARTIN', 'MOYOBAMBA', 'CALZADA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('210103', '21', '01', '03', 'SAN MARTIN', 'MOYOBAMBA', 'HABANA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('210104', '21', '01', '04', 'SAN MARTIN', 'MOYOBAMBA', 'JEPELACIO');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('210105', '21', '01', '05', 'SAN MARTIN', 'MOYOBAMBA', 'SORITOR');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('210106', '21', '01', '06', 'SAN MARTIN', 'MOYOBAMBA', 'YANTALO');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('210201', '21', '02', '01', 'SAN MARTIN', 'HUALLAGA', 'SAPOSOA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('210202', '21', '02', '02', 'SAN MARTIN', 'HUALLAGA', 'PISCOYACU');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('210203', '21', '02', '03', 'SAN MARTIN', 'HUALLAGA', 'SACANCHE');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('210204', '21', '02', '04', 'SAN MARTIN', 'HUALLAGA', 'TINGO DE SAPOSOA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('210205', '21', '02', '05', 'SAN MARTIN', 'HUALLAGA', 'ALTO SAPOSOA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('210206', '21', '02', '06', 'SAN MARTIN', 'HUALLAGA', 'EL ESLABON');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('210301', '21', '03', '01', 'SAN MARTIN', 'LAMAS', 'LAMAS');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('210303', '21', '03', '03', 'SAN MARTIN', 'LAMAS', 'BARRANQUITA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('210304', '21', '03', '04', 'SAN MARTIN', 'LAMAS', 'CAYNARACHI');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('210305', '21', '03', '05', 'SAN MARTIN', 'LAMAS', 'CUÑUMBUQUI');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('210306', '21', '03', '06', 'SAN MARTIN', 'LAMAS', 'PINTO RECODO');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('210307', '21', '03', '07', 'SAN MARTIN', 'LAMAS', 'RUMISAPA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('210311', '21', '03', '11', 'SAN MARTIN', 'LAMAS', 'SHANAO');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('210313', '21', '03', '13', 'SAN MARTIN', 'LAMAS', 'TABALOSOS');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('210314', '21', '03', '14', 'SAN MARTIN', 'LAMAS', 'ZAPATERO');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('210315', '21', '03', '15', 'SAN MARTIN', 'LAMAS', 'ALONSO DE ALVARADO');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('210316', '21', '03', '16', 'SAN MARTIN', 'LAMAS', 'SAN ROQUE DE CUMBAZA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('210401', '21', '04', '01', 'SAN MARTIN', 'MARISCAL CACERES', 'JUANJUI');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('210402', '21', '04', '02', 'SAN MARTIN', 'MARISCAL CACERES', 'CAMPANILLA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('210403', '21', '04', '03', 'SAN MARTIN', 'MARISCAL CACERES', 'HUICUNGO');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('210404', '21', '04', '04', 'SAN MARTIN', 'MARISCAL CACERES', 'PACHIZA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('210405', '21', '04', '05', 'SAN MARTIN', 'MARISCAL CACERES', 'PAJARILLO');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('210501', '21', '05', '01', 'SAN MARTIN', 'RIOJA', 'RIOJA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('210502', '21', '05', '02', 'SAN MARTIN', 'RIOJA', 'POSIC');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('210503', '21', '05', '03', 'SAN MARTIN', 'RIOJA', 'YORONGOS');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('210504', '21', '05', '04', 'SAN MARTIN', 'RIOJA', 'YURACYACU');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('210505', '21', '05', '05', 'SAN MARTIN', 'RIOJA', 'NUEVA CAJAMARCA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('210506', '21', '05', '06', 'SAN MARTIN', 'RIOJA', 'ELIAS SOPLIN VARGAS');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('210507', '21', '05', '07', 'SAN MARTIN', 'RIOJA', 'SAN FERNANDO');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('210508', '21', '05', '08', 'SAN MARTIN', 'RIOJA', 'PARDO MIGUEL');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('210509', '21', '05', '09', 'SAN MARTIN', 'RIOJA', 'AWAJUN');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('210601', '21', '06', '01', 'SAN MARTIN', 'SAN MARTIN', 'TARAPOTO');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('210602', '21', '06', '02', 'SAN MARTIN', 'SAN MARTIN', 'ALBERTO LEVEAU');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('210604', '21', '06', '04', 'SAN MARTIN', 'SAN MARTIN', 'CACATACHI');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('210606', '21', '06', '06', 'SAN MARTIN', 'SAN MARTIN', 'CHAZUTA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('210607', '21', '06', '07', 'SAN MARTIN', 'SAN MARTIN', 'CHIPURANA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('210608', '21', '06', '08', 'SAN MARTIN', 'SAN MARTIN', 'EL PORVENIR');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('210609', '21', '06', '09', 'SAN MARTIN', 'SAN MARTIN', 'HUIMBAYOC');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('210610', '21', '06', '10', 'SAN MARTIN', 'SAN MARTIN', 'JUAN GUERRA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('210611', '21', '06', '11', 'SAN MARTIN', 'SAN MARTIN', 'MORALES');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('210612', '21', '06', '12', 'SAN MARTIN', 'SAN MARTIN', 'PAPAPLAYA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('210616', '21', '06', '16', 'SAN MARTIN', 'SAN MARTIN', 'SAN ANTONIO');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('210619', '21', '06', '19', 'SAN MARTIN', 'SAN MARTIN', 'SAUCE');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('210620', '21', '06', '20', 'SAN MARTIN', 'SAN MARTIN', 'SHAPAJA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('210621', '21', '06', '21', 'SAN MARTIN', 'SAN MARTIN', 'LA BANDA DE SHILCAYO');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('210701', '21', '07', '01', 'SAN MARTIN', 'BELLAVISTA', 'BELLAVISTA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('210702', '21', '07', '02', 'SAN MARTIN', 'BELLAVISTA', 'SAN RAFAEL');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('210703', '21', '07', '03', 'SAN MARTIN', 'BELLAVISTA', 'SAN PABLO');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('210704', '21', '07', '04', 'SAN MARTIN', 'BELLAVISTA', 'ALTO BIAVO');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('210705', '21', '07', '05', 'SAN MARTIN', 'BELLAVISTA', 'HUALLAGA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('210706', '21', '07', '06', 'SAN MARTIN', 'BELLAVISTA', 'BAJO BIAVO');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('210801', '21', '08', '01', 'SAN MARTIN', 'TOCACHE', 'TOCACHE');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('210802', '21', '08', '02', 'SAN MARTIN', 'TOCACHE', 'NUEVO PROGRESO');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('210803', '21', '08', '03', 'SAN MARTIN', 'TOCACHE', 'POLVORA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('210804', '21', '08', '04', 'SAN MARTIN', 'TOCACHE', 'SHUNTE');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('210805', '21', '08', '05', 'SAN MARTIN', 'TOCACHE', 'UCHIZA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('210901', '21', '09', '01', 'SAN MARTIN', 'PICOTA', 'PICOTA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('210902', '21', '09', '02', 'SAN MARTIN', 'PICOTA', 'BUENOS AIRES');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('210903', '21', '09', '03', 'SAN MARTIN', 'PICOTA', 'CASPIZAPA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('210904', '21', '09', '04', 'SAN MARTIN', 'PICOTA', 'PILLUANA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('210905', '21', '09', '05', 'SAN MARTIN', 'PICOTA', 'PUCACACA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('210906', '21', '09', '06', 'SAN MARTIN', 'PICOTA', 'SAN CRISTOBAL');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('210907', '21', '09', '07', 'SAN MARTIN', 'PICOTA', 'SAN HILARION');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('210908', '21', '09', '08', 'SAN MARTIN', 'PICOTA', 'TINGO DE PONASA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('210909', '21', '09', '09', 'SAN MARTIN', 'PICOTA', 'TRES UNIDOS');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('210910', '21', '09', '10', 'SAN MARTIN', 'PICOTA', 'SHAMBOYACU');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('211001', '21', '10', '01', 'SAN MARTIN', 'EL DORADO', 'SAN JOSE DE SISA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('211002', '21', '10', '02', 'SAN MARTIN', 'EL DORADO', 'AGUA BLANCA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('211003', '21', '10', '03', 'SAN MARTIN', 'EL DORADO', 'SHATOJA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('211004', '21', '10', '04', 'SAN MARTIN', 'EL DORADO', 'SAN MARTIN');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('211005', '21', '10', '05', 'SAN MARTIN', 'EL DORADO', 'SANTA ROSA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('220101', '22', '01', '01', 'TACNA', 'TACNA', 'TACNA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('220102', '22', '01', '02', 'TACNA', 'TACNA', 'CALANA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('220104', '22', '01', '04', 'TACNA', 'TACNA', 'INCLAN');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('220107', '22', '01', '07', 'TACNA', 'TACNA', 'PACHIA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('220108', '22', '01', '08', 'TACNA', 'TACNA', 'PALCA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('220109', '22', '01', '09', 'TACNA', 'TACNA', 'POCOLLAY');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('220110', '22', '01', '10', 'TACNA', 'TACNA', 'SAMA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('220111', '22', '01', '11', 'TACNA', 'TACNA', 'ALTO DE LA ALIANZA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('220112', '22', '01', '12', 'TACNA', 'TACNA', 'CIUDAD NUEVA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('220113', '22', '01', '13', 'TACNA', 'TACNA', 'CORONEL GREGORIO ALBARRACIN L.');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('220201', '22', '02', '01', 'TACNA', 'TARATA', 'TARATA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('220205', '22', '02', '05', 'TACNA', 'TARATA', 'HEROES ALBARRACIN');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('220206', '22', '02', '06', 'TACNA', 'TARATA', 'ESTIQUE');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('220207', '22', '02', '07', 'TACNA', 'TARATA', 'ESTIQUE PAMPA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('220210', '22', '02', '10', 'TACNA', 'TARATA', 'SITAJARA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('220211', '22', '02', '11', 'TACNA', 'TARATA', 'SUSAPAYA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('220212', '22', '02', '12', 'TACNA', 'TARATA', 'TARUCACHI');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('220213', '22', '02', '13', 'TACNA', 'TARATA', 'TICACO');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('220301', '22', '03', '01', 'TACNA', 'JORGE BASADRE', 'LOCUMBA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('220302', '22', '03', '02', 'TACNA', 'JORGE BASADRE', 'ITE');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('220303', '22', '03', '03', 'TACNA', 'JORGE BASADRE', 'ILABAYA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('220401', '22', '04', '01', 'TACNA', 'CANDARAVE', 'CANDARAVE');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('220402', '22', '04', '02', 'TACNA', 'CANDARAVE', 'CAIRANI');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('220403', '22', '04', '03', 'TACNA', 'CANDARAVE', 'CURIBAYA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('220404', '22', '04', '04', 'TACNA', 'CANDARAVE', 'HUANUARA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('220405', '22', '04', '05', 'TACNA', 'CANDARAVE', 'QUILAHUANI');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('220406', '22', '04', '06', 'TACNA', 'CANDARAVE', 'CAMILACA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('230101', '23', '01', '01', 'TUMBES', 'TUMBES', 'TUMBES');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('230102', '23', '01', '02', 'TUMBES', 'TUMBES', 'CORRALES');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('230103', '23', '01', '03', 'TUMBES', 'TUMBES', 'LA CRUZ');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('230104', '23', '01', '04', 'TUMBES', 'TUMBES', 'PAMPAS DE HOSPITAL');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('230105', '23', '01', '05', 'TUMBES', 'TUMBES', 'SAN JACINTO');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('230106', '23', '01', '06', 'TUMBES', 'TUMBES', 'SAN JUAN DE LA VIRGEN');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('230201', '23', '02', '01', 'TUMBES', 'CONTRALMIRANTE VILLAR', 'ZORRITOS');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('230202', '23', '02', '02', 'TUMBES', 'CONTRALMIRANTE VILLAR', 'CASITAS');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('230203', '23', '02', '03', 'TUMBES', 'CONTRALMIRANTE VILLAR', 'CANOAS DE PUNTA SAL');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('230301', '23', '03', '01', 'TUMBES', 'ZARUMILLA', 'ZARUMILLA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('230302', '23', '03', '02', 'TUMBES', 'ZARUMILLA', 'MATAPALO');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('230303', '23', '03', '03', 'TUMBES', 'ZARUMILLA', 'PAPAYAL');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('230304', '23', '03', '04', 'TUMBES', 'ZARUMILLA', 'AGUAS VERDES');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('250101', '25', '01', '01', 'UCAYALI', 'CORONEL PORTILLO', 'CALLERIA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('250102', '25', '01', '02', 'UCAYALI', 'CORONEL PORTILLO', 'YARINACOCHA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('250103', '25', '01', '03', 'UCAYALI', 'CORONEL PORTILLO', 'MASISEA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('250104', '25', '01', '04', 'UCAYALI', 'CORONEL PORTILLO', 'CAMPOVERDE');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('250105', '25', '01', '05', 'UCAYALI', 'CORONEL PORTILLO', 'IPARIA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('250106', '25', '01', '06', 'UCAYALI', 'CORONEL PORTILLO', 'NUEVA REQUENA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('250107', '25', '01', '07', 'UCAYALI', 'CORONEL PORTILLO', 'MANANTAY');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('250201', '25', '02', '01', 'UCAYALI', 'PADRE ABAD', 'PADRE ABAD');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('250202', '25', '02', '02', 'UCAYALI', 'PADRE ABAD', 'IRAZOLA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('250203', '25', '02', '03', 'UCAYALI', 'PADRE ABAD', 'CURIMANA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('250301', '25', '03', '01', 'UCAYALI', 'ATALAYA', 'RAIMONDI');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('250302', '25', '03', '02', 'UCAYALI', 'ATALAYA', 'TAHUANIA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('250303', '25', '03', '03', 'UCAYALI', 'ATALAYA', 'YURUA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('250304', '25', '03', '04', 'UCAYALI', 'ATALAYA', 'SEPAHUA');
INSERT INTO tb_Ubigeo (Id_Ubigeo,IdDepa,IdProv,IdDist,Departamento,Provincia,Distrito) VALUES ('250401', '25', '04', '01', 'UCAYALI', 'PURUS', 'PURUS');

go

--insertar Agencia
Insert Into tb_Agencia
	Values
	(1,'140101','Av. Naciones Unidas 1741, Cercado de Lima','994852123'),
	(2,'140105','Av. Brasil 1215, Jesús María','985263159'),
	(3,'140108','Av. Lima 3151, San Martin de Porres','944789523'),
	(4,'140112' ,'Av. Javier Prado Este 2638, San Borja','977852698'),
	(5,'140116' ,'Av. José Larco 497, Miraflores','945017245'),
	(6,'021210' ,'Av. Herreros 1450','654321'),
	(7,'040506' ,'Av. José 1519','98765432'),
	(8,'040808' ,'Av. De las Casas 4455','15975345'),
	(9,'050211' ,'Av. Santiago 333','120542'),
	(10,'050303' ,'Av. Santaigo 453 ','65201'),
	(11,'050512' ,'Av. Estrada 1120','951040'),
	(12,'060405' ,'Av. Cajas 654 ','9514531'),
	(13,'060606' ,'Av. Ferrera 321 ','7896150'),
	(14,'060903' ,'Av. Tampopata 332 ','945017245'),
	(15,'061104' ,'Av. Ande 250 ','2310654'),
	(16,'070101' ,'Av. Cardenas 654 ','87065'),
	(17,'070401' ,'Av. Pilco 450 ','560104'),
	(18,'071204' ,'Av. Manco 450 ','785020'),
	(19,'080118' ,'Av. Martin 654 ','8975043'),
	(20,'080408' ,'Av. Campo alto 540','6540340');

select * from tb_Agencia
go


	
Insert Into tb_Cliente (docIdentidad,tipoDocumento,apellidos, nombre, Id_Ubigeo, direccion, telefono)
	Values
		/*('465789639','Cedula de identidad', 'Carrillo Malla','Piero','Av.Los Mangos','255913230'),
	('485639741','Cedula de identidad', 'Solomon Hancock','Juan','Antone Loaf','840417329'),
	('515151283','DNI', 'Deacon Griffin','Jhezmain','Yasmine Lock','115870771'),
	('554558984','Pasaporte de Extranjeria', 'Keiko West','Jenifer','Jarrod Park','101242084'),
	('963454871','DNI', 'Allistair Conrad','Nahely','Kassulke Canyon','175666999'),
	('548123841','DNI', 'Bernard Thompson','Pedro','Wehner Viaduct','601298275'),
	('796214562','Cedula de identidad', 'Glasc Conrad','Renata','Elisa Loaf','464599797'),
	('456221546','Cedula de identidad', 'Vaughan Koch','Jaime',' Roob Run','989445035'),
	('155154151','Pasaporte de Extranjeria', 'Aguirre Ayers','John','Esperanza Isle','321440267'),
	('145194948','Pasaporte de Extranjeria', 'Preston Schmidt','Facundo','Brenda Fork','014473452'),
	('651691487','Pasaporte de Extranjeria', 'Brock Ellison','Margarita','Franco Street','710764378'),
	('457894125','DNI', 'Beasley Galvan','Felipe','Brakus Garden','710964081'),
	('456478941','DNI', 'Yu Morrison','Pablo','Landen Estate','619067402'),
	('518748474','Cedula de identidad', 'Marks Patel','Eduardo','Margaret Via','299275702'),
	('215698489','Cedula de identidad', 'Sims Caldwell','Joseph',' Rutherford Valley','807903302'),
	('549498494','Pasaporte de Extranjeria', 'Shelton Alvarez','Abelardo','Geoffrey Ville','896793444'),
	('548744425','Pasaporte de Extranjeria', 'Rivers Evans','Joaquín','Thompson Ports','176093574'),
	('944987487','Pasaporte de Extranjeria', 'Mathews Rice','Mayra','Tomasa Streets','229020450'),
	('451487944','Cedula de identidad', 'Archer Levine','Nicolle','Kyra Square','186766110'), */

	('451487945','DNI', 'Ruiz Knapp','Viviana','140101' ,'Av. Salaverry 1542','580404084');
select * from tb_Cliente	
	go


-----------------------------------------------------------------------------------------------------------------

	CREATE PROCEDURE usp_Cliente
		@docIdentidad varchar(15),
		@tipoDocumento varchar(25)=null,
		@apellidos varchar(35)=null,
		@nombre varchar(35)=null,
		@direccion varchar(75)=null,
		@telefono varchar(25)=null,
		@modo char(1)
	AS

		IF @modo='I'
		BEGIN
			INSERT tb_Cliente VALUES(@docIdentidad,@tipoDocumento,@apellidos,@nombre,@direccion,@telefono)

		END

		IF @modo='U'
		BEGIN
			UPDATE tb_Cliente SET tipoDocumento=@tipoDocumento, apellidos=@apellidos, nombre=@nombre, 
				direccion=@direccion, telefono=@telefono 
			WHERE docIdentidad = @docIdentidad
		END

		IF @modo = 'D'
		BEGIN
			DELETE FROM tb_Cliente WHERE docIdentidad = @docIdentidad
		END;
		GO

/*INSERT */
EXECUTE usp_Cliente @modo= 'I', @docIdentidad='98765412' , @tipoDocumento='DNI',@apellidos='Torres Campos',
	@nombre= 'Juan Pedro',@direccion='Av.Las Palmeras',@telefono='994132657';

	select * from tb_Cliente
	select * from tb_Comprobante
/* UPDATE */
EXECUTE usp_Cliente @modo = 'U' , @docIdentidad='98765412' , @tipoDocumento='DNI',@apellidos='Murillo Gutierrez',
	@nombre= 'Jose ',@direccion='Av.Chavin',@telefono='994132657';

/*DELETE */
EXECUTE usp_Cliente @modo = 'D', @docIdentidad ='98765412';

go	



Insert Into tb_Servicios (codServicio,tipoServ,precio)
	Values('10001','Servicio Completo de Afinación','3000'),
	('10002','Carrocería y Pintura','545'),
	('10003','Cambiar Líquido de Tranmisión','320'),
	('10004','Servicio de Dirección Asistida','275'),
	(10005,'Alquiler de Auto','200');
go

Insert Into tb_Cochera
	Values
	(101,1,8),
	(102,1,8),
	(103,2,8),
	(104,2,5),
	(105,3,5),
	(106,3,5),
	(107,4,6),
	(108,4,6),
	(109,5,6),
	(110,5,6),
	(111,6,6),
	(112,6,6),
	(113,7,5),
	(114,7,5),
	(115,8,8),
	(116,8,8),
	(117,9,10),
	(118,9,10),
	(119,10,8),
	(120,10,8),
	(121,11,10),
	(122,11,10),
	(123,12,10),
	(124,12,10),
	(125,13,10),
	(126,13,10),
	(127,14,10),
	(128,14,10),
	(129,15,10),
	(130,15,10),
	(131,16,10),
	(132,16,10),
	(133,17,10),
	(134,17,10),
	(135,18,10),
	(136,18,10),
	(137,19,10),
	(138,19,10),
	(139,20,10),
	(140,20,10);
	select * from tb_Cochera	
go


Insert Into tb_Auto
	values
('UDM10',103,'Hyndai', 'Onix Turbo',2019,5400),
('OZC21',104,'Mercedes Benz', 'Titanium',2021,9400),
('QCV651',105,'MAZDA ', 'Civic Sport',2020,8600),
('HKL321',101,'TOYOTA ','Vantage',2005,12300),
('EBN714',102,'PORSCHE ','Ghibli',2013,9900),
('IYS101',103,'SUBARU ', 'Huracán',2016,15500),
('KTO105',104,'KIA ','X-Trail',2022,7800),
('GVC952',105,'HONDA ','Ioniq Hibrido',2016,8700);

	select * from tb_Auto
go
	

------------------
INSERT INTO tb_Empleado (codEmpleado, codAgencia, nomEmpleado, apeEmpleado, Id_Ubigeo, dirEmpleado, telefono, sueldo,fecini, fecnac, cargo, correo)
    values 
    (1001, 1, 'Arnaldo', 'Kamall',  '140101', '30909', '473-582-0605',     3000, '2020-04-23','1991-10-19', 'Administrador', 'akamall0@wikia.com'),
    (1002, 2, 'Thornton', 'Loyns',  '140102', '03688', '554-388-9604', 3000, '2016-10-07','1995-10-22',  'Administrador', 'tloyns1@google.it'),
    (1003, 3, 'Garth', 'Jeens',     '140103', '03582', '114-233-6956', 3000,  '2018-07-27','1992-12-25',  'Administrador', 'gjeens2@cbc.ca'),
    (1004, 4, 'Moria', 'Cheake',    '140104', '77', '185-631-5931',    3000,  '2018-07-15','1991-09-10', 'Administrador', 'mcheake3@sogou.com'),
    (1005, 5, 'Laetitia','Canavan', '140105', '8947', '606-286-2726',  3000, '2019-10-04','1998-11-08','Administrador', 'lcanavan4@seattletimes.com'),
    (1006, 6, 'Fonz', 'Tredgold',   '140106', '68466', '850-358-2768', 3000, '2020-08-16','1999-06-16',   'Administrador', 'ftredgold5@umn.edu'),
    (1007, 7, 'Issi', 'Stollman',   '140107', '13611', '567-885-7770', 3000, '2018-04-18','1990-12-25',   'Administrador', 'istollman6@squidoo.com'),
    (1008, 8, 'Phyllys', 'Float',   '140108', '42', '238-185-7133',    3000, '2019-04-05','1999-10-09', 'Administrador', 'pfloat7@jigsy.com'),
    (1009, 9,'Albertine','Walford', '140109', '3', '608-134-5285',     3000, '2020-08-30','2000-03-12',   'Administrador', 'awalford8@google.com'),
    (1010, 10, 'Isaak', 'Lethbury', '140110', '8', '451-180-1066',     3000, '2019-08-11','1991-12-09',      'Administrador', 'ilethbury9@rambler.ru'),
    (1011, 11,'Micheline', 'Jancey','140111', '4', '575-502-7962',     3000, '2018-12-29','1998-08-30',       'Administrador', 'mjanceya@mtv.com'),
    (1012, 12, 'Craggie', 'Gaydon', '140112', '3', '702-401-2202',     3000, '2018-11-15','1995-04-25',      'Administrador', 'cgaydonb@abc.net.au'),
    (1013, 13, 'Goddard', 'Huddart','140113', '29286','885-262-6569',  3000, '2019-05-01','1993-09-21', 'Administrador', 'ghuddartc@amazonaws.com'),
    (1014, 14, 'Pierette','Parmley','140114', '9103', '545-558-7535',  3000, '2019-12-05','1990-09-06',     'Administrador', 'pparmleyd@acquirethisname.com'),
    (1015, 15,'Ardella','Brandsma', '140115', '72911','680-746-8192',  3000, '2019-12-20','1992-05-20', 'Administrador', 'abrandsmae@army.mil'),
    (1016, 16, 'Denna', 'Durran',   '140116', '15', '216-634-1691',    3000,  '2019-08-27','1998-03-13',        'Administrador', 'ddurranf@a8.net'),
    (1017, 17, 'Phillis', 'Mebes',  '140117', '045', '710-635-2893',   3000,  '2018-07-12','1999-07-28',      'Administrador', 'pmebesg@theatlantic.com'),
    (1018, 18, 'Merl', 'Kilian',    '140118', '9902', '814-668-4938',  3000,  '2020-12-21','1991-02-18',         'Administrador', 'mkilianh@lulu.com'),
    (1019, 19, 'Valeria', 'Flagg',  '140119', '14', '699-617-7166',    3000,  '2020-11-05','1995-06-12',        'Administrador', 'vflaggi@archive.org'),
    (1020, 20, 'Joann', 'Shubotham','140120', '02', '717-813-9941',    3000, '2020-02-15','1992-11-14',       'Administrador', 'jshubothamj@ameblo.jp'),

    (1021, 1, 'Mildrid', 'Gentreau','140121', '4', '486-927-7932',     1200, '2021-06-25','1990-12-07',     'atención al cliente', 'mgentreauk@ibm.com'),
    (1022, 2, 'Callie', 'Norcross', '140122', '66373','787-622-2684',  1200, '2020-04-30','1996-06-18',    'atención al cliente', 'cnorcrossl@drupal.org'),
    (1023, 3, 'Hamel', 'Stelli',    '140123', '5338', '808-971-9101',  1200, '2016-08-17','1990-07-27',        'atención al cliente', 'hstellim@salon.com'),
    (1024, 4, 'Stephi', 'Riall',    '140124', '862', '521-984-1845',   1200, '2019-07-25','1998-05-24',       'atención al cliente', 'srialln@studiopress.com'),
    (1025, 5, 'Sarine', 'Abrahmson','140125', '1', '993-758-3253',     1200, '2019-03-09','1995-04-23',   'atención al cliente', 'sabrahmsono@hibu.com'),
    (1026, 6, 'Kalinda', 'Carabine','140126', '40', '635-359-7884',    1200, '2018-10-12','1995-06-21',   'atención al cliente', 'kcarabinep@clickbank.net'),
    (1027, 7, 'Marline', 'Hosten',  '140127', '189', '891-329-9008',   1200, '2016-09-15','1996-08-31',    'atención al cliente', 'mhostenq@ft.com'),
    (1028, 8,'Brinna', 'Titterrell','140128', '38', '642-547-0657',    1200, '2020-02-01','1998-02-04',   'atención al cliente', 'btitterrellr@rediff.com'),
    (1029, 9, 'Bernard', 'Phillis', '140129', '60', '938-465-2809',    1200, '2017-08-12','1998-12-13',   'atención al cliente', 'bphilliss@gravatar.com'),
    (1030, 10, 'Phillip', 'Orteau', '140130', '0', '281-496-5400',     1200, '2016-09-09','1998-10-22',    'atención al cliente', 'porteaut@seesaa.net'),
    (1031, 11,'Federica','Hardware','140131', '6', '424-776-0635',     1200, '2020-01-26','2001-04-14',     'atención al cliente', 'fhardwareu@altervista.org'),
    (1032, 12,'Jasun','Handscombe', '140132', '593', '901-918-2709',   1200, '2017-08-06','1992-05-31',      'atención al cliente', 'jhandscombev@geocities.jp'),
    (1033, 13,'Hasheem','Yurivtsev','140133', '643', '128-106-8271',   1200, '2017-04-15','1998-12-04',  'atención al cliente', 'hyurivtsevw@google.de'),
    (1034, 14, 'Wilbert', 'Titley', '140134', '8957', '116-207-6480',  1200, '2019-01-06','1996-06-10',   'atención al cliente', 'wtitleyx@admin.ch'),
    (1035, 15,'Binnie','Minchella', '140135', '45716','555-356-0515',  1200, '2020-07-18','1995-06-11',  'atención al cliente', 'bminchellay@tmall.com'),
    (1036, 16, 'Nickolas', 'Frame', '140136', '52363','850-595-2425',  1200, '2020-06-25','2000-04-13',   'atención al cliente', 'nframez@dyndns.org'),
    (1037, 17,'Angel', 'Plackstone','140137', '4784','365-831-4620',   1200, '2020-04-26','1996-02-14',   'atención al cliente', 'aplackstone10@epa.gov'),
    (1038, 18, 'Renie', 'Chivrall', '140138', '77231','691-520-8498',  1200, '2018-01-19','1996-12-17',    'atención al cliente', 'rchivrall11@weather.com'),
    (1039, 19, 'Tiffany', 'Paffett','140139', '2188','216-411-7638',   1200, '2018-01-19','1991-12-05',   'atención al cliente', 'tpaffett12@umn.edu'),
	(1040, 20,'Christoper','Leverage','140140','4265','555-670-8448',  1200, '2020-09-13','1994-12-15',   'atención al cliente','cleverage13@chicagotribune.com'),
   (1041,1,'Kelci','Bather',        '140141','09283','199-333-7067',   1200, '2020-06-27','1994-03-10',  'atención al cliente','kbather14@google.co.uk'),
    (1042,2,'Hercule','Stable', '140142','6','909-273-6612',           1200, '2021-04-23','1994-05-01',   'atención al cliente','hstable15@ft.com'),
    (1043,3,'Nancee','Alesbrook',   '140143','91707','212-138-2038',   1200, '2020-07-26','1992-05-09','atención al cliente','nalesbrook16@illinois.edu'),
    (1044,4,'Eldon','Filipchikov',  '140201','3','885-570-1632',       1200, '2019-11-21','1991-01-14',    'atención al cliente','efilipchikov17@weebly.com'),
    (1045,5,'Chrissie','Rummer',    '140205','8','550-453-2916',       1200,  '2016-11-09','1999-03-08',    'atención al cliente','crummer18@yelp.com'),
(1046,6,'Margeaux','Blenkinship',   '140206','5','750-560-7253',       1200, '2020-10-26','2000-10-20',     'atención al cliente','mblenkinship19@discuz.net'),
    (1047,7,'Xylia','Pautot',       '140207','31','795-825-5885',      1200,  '2016-10-03','1998-06-24',      'atención al cliente','xpautot1a@about.com'),
    (1048,8,'Rogers','Cussen',      '140208','7394','998-852-7826',    1200,  '2020-12-14','1995-11-23',   'atención al cliente','rcussen1b@wikimedia.org'),
	(1049,9,'Bert','Rankmore',      '080509','3','885-570-1632',       1200,'2019-11-21','1991-01-14',    'atención al cliente','brankmore1c@ehow.com'),	
    (1050,10,'Ethel','Bottomley',   '020708','376','384-784-5602',     1200,'2020-11-22','1996-08-05',   'atención al cliente','ebottomley1d@uol.com.br'),
    (1051,11,'Valle','Conigsby',    '021201','1816','427-182-2062',    1200,'2018-04-24','2000-09-29',     'atención al cliente','vconigsby1e@fotki.com'),
    (1052,12,'Jarred','Corah',      '021606','29451','639-143-1699',   1200,'2019-11-16','1996-11-11','atención al cliente','jcorah1f@wisc.edu'),
    (1053,13,'Tadd','Pepineaux',    '030304','55951','684-591-8822',   1200,'2018-03-18','1997-08-02',  'atención al cliente','tpepineaux1g@chronoengine.com'),
    (1054,14,'Cesya','O`Murtagh',   '040101','5658','312-915-0599',    1200,'2019-11-07','1993-12-20',  'atención al cliente','comurtagh1h@slideshare.net'),
    (1055,15,'Ddene','Giuroni',     '040202','74650','466-993-3796',   1200,'2016-09-15','1997-01-23',  'atención al cliente','dgiuroni1i@moonfruit.com'),
    (1056,16,'Tabbatha','Danilyak', '040505','4404','330-220-1516',    1200,'2019-05-29','2001-03-28','atención al cliente','tdanilyak1j@walmart.com'),
    (1057,17,'Rafferty','Egginson', '050309','46522','229-834-9700',   1200,'2018-06-18','1997-03-12',   'atención al cliente','regginson1k@ning.com'),
    (1058,18,'Lamond','Marushak',   '060604','86652','162-560-2377',   1200,'2018-07-22','1995-10-12',   'atención al cliente','lmarushak1l@uol.com.br'),
    (1059,19,'Shayne','Noddles',    '070804','0305', '390-757-2499',   1200,'2020-02-21','1991-11-21',  'atención al cliente', 'snoddles1m@behance.net'),
    (1060,20, 'Bridie', 'Bellay',   '080206', '2539', '278-551-5363',  1200, '2019-05-19','1999-06-01', 'atención al cliente', 'bbellay1n@unicef.org');
  select * from tb_Empleado
 go



-- USP Empleados












-------------Trigger------------------

drop trigger tg_GenerarComprobante

CREATE TRIGGER tg_GenerarComprobante
ON tb_Cliente_Servicio  AFTER INSERT
AS
declare  @docIdentidad varchar(15),@codServicio smallint;
declare @codFact smallint;
	declare @correlativo char(4)
	set @correlativo = '1000';
declare @fecha date;

	--Asignacion de valores a variables
set @fecha = CAST( GETDATE() AS Date ) ;

IF((select top 1 codComprobante from tb_Comprobante)='')
	BEGIN
		set @codFact =CAST(@correlativo as smallint)+1;
	END
ELSE
	BEGIN
		set @codFact =(select top 1 codComprobante from tb_Comprobante order by codComprobante DESC)+1;
	END

set @docIdentidad = (select top 1 docIdentidad
				from tb_Cliente _Servicio
				order by docIdentidad DESC)

set @codServicio = (select top 1 codServicio
				from tb_Cliente_Servicio
				order by docIdentidad DESC)

insert into tb_Comprobante
	values (@codFact, @docIdentidad, @codServicio,@fecha);
go

---test trigger ----
insert into tb_Cliente_Servicio
values ('515151283','10004'),
('548123841','10005');

select * from tb_Cliente_Servicio


--TEST 2 ----
insert into tb_Cliente_Servicio
values ('456478941','10004');

select * from tb_Comprobante


-- 14/05/22 -- test
select * from tb_Cliente_Servicio


--TEST 2 ----
insert into tb_Cliente_Servicio
values ('456478941','10003');

select * from tb_Comprobante
--delete from tb_Comprobante
go


--Creamos tabla usuario
 --drop table tb_usuario
create table tb_usuario (
	usu_name varchar(20) not null primary key,
	usu_pass varchar(20) not null,
	usu_nivel int not null,
	codEmpleado smallint not null FOREIGN KEY REFERENCES tb_Empleado,
	fech_reg datetime,
	usu_reg varchar(20)
);
--delete tb_usuario
insert into tb_usuario (usu_name, usu_pass, usu_nivel,fech_reg ,codEmpleado)
values 
 ('1001Arnaldo','1001Arnaldo', 1, '2022-07-08'  ,1001 ),
 ('1002Thornton','1002Thornton',1,'2022-07-08'  ,1002),
 ('1003Garth','1003Garth',1, '2022-07-08'  ,1003),
 ('1021Mildrid','1021Mildrid',2, '2022-07-08' ,1021);
 select * from tb_usuario
 go
 --SP de Usuarios:
 --Consultar Usuario
 --drop procedure usp_ConsultarUsuario
 create procedure usp_ConsultarUsuario
	@usu_name varchar(20)
 as
 select 
		usu_name,
		usu_pass,
		usu_nivel,	
		--tb_Empleado.codEmpleado,
		fech_reg,
		tb_usuario.usu_reg
		
 from tb_usuario inner join tb_Empleado
 on tb_usuario.codEmpleado = tb_Empleado.codEmpleado
 where usu_name=@usu_name

 exec usp_ConsultarUsuario @usu_name='1021Mildrid'

