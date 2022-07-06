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

CREATE TABLE tb_Empleado(
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

--Cargamos la tabla Empleado:

INSERT INTO tb_Empleado (codEmpleado, codAgencia, nomEmpleado, apeEmpleado, Id_Ubigeo, dirEmpleado, telefono, fecini, fecnac, cargo, correo)

 values 
 (1001, 1, 'Arnaldo', 'Kamall',140101, '30909', '473-582-0605', '23/04/2020' , '19/10/1991', 'Administrador', 'akamall0@wikia.com'),
(1002, 2, 'Thornton', 'Loyns',140102, '03688', '554-388-9604', '07/10/2016' ,'22/10/1995',  'Administrador', 'tloyns1@google.it'),
(1003, 3, 'Garth', 'Jeens',   140103, '03582', '114-233-6956', '27/07/2018' ,'25/12/1992',  'Administrador', 'gjeens2@cbc.ca'),
(1004, 4, 'Moria', 'Cheake',  140104, '77', '185-631-5931',    '15/07/2018' , '10/09/1991', 'Administrador', 'mcheake3@sogou.com'),
(1005, 5, 'Laetitia','Canavan',140105, '8947', '606-286-2726',  '04/10/2019',   '08/11/1998','Administrador', 'lcanavan4@seattletimes.com'),
(1006, 6, 'Fonz', 'Tredgold', 140106, '68466', '850-358-2768', '16/08/2020' ,'16/06/1999',   'Administrador', 'ftredgold5@umn.edu'),
(1007, 7, 'Issi', 'Stollman', 140107, '13611', '567-885-7770', '18/04/2018', '25/12/1990',   'Administrador', 'istollman6@squidoo.com'),
(1008, 8, 'Phyllys', 'Float', 140108, '42', '238-185-7133',    '05/04/2019'  , '09/10/1999', 'Administrador', 'pfloat7@jigsy.com'),
(1009, 9,'Albertine','Walford', 140109, '3', '608-134-5285',     '30/08/2020','12/03/2000',   'Administrador', 'awalford8@google.com'),
(1010, 10, 'Isaak', 'Lethbury', 140110, '8', '451-180-1066', '11/08/2019' ,'09/12/1991',      'Administrador', 'ilethbury9@rambler.ru'),
(1011, 11,'Micheline', 'Jancey',140111, '4', '575-502-7962', '29/12/2018','30/08/1998',       'Administrador', 'mjanceya@mtv.com'),
(1012, 12, 'Craggie', 'Gaydon', 140112, '3', '702-401-2202', '15/11/2018' ,'25/04/1995',      'Administrador', 'cgaydonb@abc.net.au'),
(1013, 13, 'Goddard', 'Huddart',140113, '29286', '885-262-6569', '01/05/2019' , '21/09/1993', 'Administrador', 'ghuddartc@amazonaws.com'),
(1014, 14, 'Pierette','Parmley',140114, '9103', '545-558-7535','05/12/2019','06/09/1990',     'Administrador', 'pparmleyd@acquirethisname.com'),
(1015, 15,'Ardella','Brandsma', 140115, '72911', '680-746-8192', '20/12/2019' , '20/05/1992', 'Administrador', 'abrandsmae@army.mil'),
(1016, 16, 'Denna', 'Durran', 140116, '15', '216-634-1691','27/08/2019', '13/03/1998',        'Administrador', 'ddurranf@a8.net'),
(1017, 17, 'Phillis', 'Mebes',140117, '045', '710-635-2893', '12/07/2018' ,'28/07/1999',      'Administrador', 'pmebesg@theatlantic.com'),
(1018, 18, 'Merl', 'Kilian',140118, '9902', '814-668-4938','21/12/2020','18/02/1991',         'Administrador', 'mkilianh@lulu.com'),
(1019, 19, 'Valeria', 'Flagg',140119, '14', '699-617-7166','05/11/2020' ,'12/06/1995',        'Administrador', 'vflaggi@archive.org'),
(1020, 20, 'Joann', 'Shubotham',140120, '02', '717-813-9941','15/02/2020','14/11/1992',       'Administrador', 'jshubothamj@ameblo.jp'),

(1021, 1, 'Mildrid', 'Gentreau',140121, '4', '486-927-7932', '25/06/2021' , '07/12/1990',     'atención al cliente', 'mgentreauk@ibm.com'),
(1022, 2, 'Callie', 'Norcross', 140122, '66373', '787-622-2684', '30/04/2020','18/06/1996',    'atención al clienteCoordinator', 'cnorcrossl@drupal.org'),
(1023, 3, 'Hamel', 'Stelli', 140123, '5338', '808-971-9101','17/08/2016' ,'27/07/1990',        'atención al cliente', 'hstellim@salon.com'),
(1024, 4, 'Stephi', 'Riall', 140124, '862', '521-984-1845',   '25/07/2019' , '24/05/1998',       'atención al cliente', 'srialln@studiopress.com'),
(1025, 5, 'Sarine', 'Abrahmson', 140125, '1', '993-758-3253',     '09/03/2019','23/04/1995',   'atención al cliente', 'sabrahmsono@hibu.com'),
(1026, 6, 'Kalinda', 'Carabine', 140126, '40', '635-359-7884', '12/10/2018' ,  '21/06/1995',   'atención al cliente', 'kcarabinep@clickbank.net'),
(1027, 7, 'Marline', 'Hosten', 140127, '189', '891-329-9008','15/09/2016'  , '31/08/1996',    'atención al clienteIII', 'mhostenq@ft.com'),
(1028, 8,'Brinna', 'Titterrell', 140128, '38', '642-547-0657', '01/02/2020' , '04/02/1998',   'atención al cliente', 'btitterrellr@rediff.com'),
(1029, 9, 'Bernard', 'Phillis', 140129, '60', '938-465-2809', '12/08/2017'  , '13/12/1998',   'atención al cliente', 'bphilliss@gravatar.com'),
(1030, 10, 'Phillip', 'Orteau', 140130, '0', '281-496-5400',  '09/09/2016'  , '22/10/1998',    'atención al cliente', 'porteaut@seesaa.net'),
(1031, 11,'Federica','Hardware', 140131, '6', '424-776-0635',  '26/01/2020','14/04/2001',     'atención al cliente', 'fhardwareu@altervista.org'),
(1032, 12,'Jasun','Handscombe', 140132, '593', '901-918-2709','06/08/2017','31/05/1992',      'atención al cliente', 'jhandscombev@geocities.jp'),
(1033, 13,'Hasheem','Yurivtsev', 140133, '643', '128-106-8271','15/04/2017' ,  '04/12/1998',  'atención al cliente', 'hyurivtsevw@google.de'),
(1034, 14, 'Wilbert', 'Titley', 140134, '8957', '116-207-6480',  '06/01/2019' ,'10/06/1996',   'atención al cliente', 'wtitleyx@admin.ch'),
(1035, 15,'Binnie','Minchella', 140135, '45716', '555-356-0515', '18/07/2020'  ,'11/06/1995',  'atención al cliente', 'bminchellay@tmall.com'),
(1036, 16, 'Nickolas', 'Frame', 140136, '52363', '850-595-2425', '25/06/2020'  ,'13/04/2000',   'atención al cliente', 'nframez@dyndns.org'),
(1037, 17,'Angel', 'Plackstone', 140137, '4784', '365-831-4620',  '26/04/2020' ,'14/02/1996',   'atención al cliente', 'aplackstone10@epa.gov'),
(1038, 18, 'Renie', 'Chivrall', 140138, '77231', '691-520-8498', '19/01/2018' ,'17/12/1996',    'atención al cliente', 'rchivrall11@weather.com'),
(1039, 19, 'Tiffany', 'Paffett', 140139, '2188', '216-411-7638',  '19/01/2018' , '05/12/1991',   'atención al cliente', 'tpaffett12@umn.edu'),
(1040, 20,'Christoper','Leverage',140140, '4265', '555-670-8448',  '13/09/2020','15/12/1994',   'atención al cliente','cleverage13@chicagotribune.com'),
(1041,1,'Kelci','Bather',140141,'09283','199-333-7067','27/06/2020','10/03/1994',  'atención al cliente','kbather14@google.co.uk'),
(1042,2,'Hercule','Stable',140142,'6','909-273-6612','23/04/2021','01/05/1994',   'atención al cliente','hstable15@ft.com'),
(1043,3,'Nancee','Alesbrook',140143,'91707','212-138-2038','26/07/2020','09/05/1992','atención al cliente','nalesbrook16@illinois.edu'),
(1044,4,'Eldon','Filipchikov',140201,'3','885-570-1632','21/11/2019','14/01/1991',    'atención al cliente','efilipchikov17@weebly.com'),
(1045,5,'Chrissie','Rummer',140205,'8','550-453-2916','09/11/2016','08/03/1999',    'atención al cliente','crummer18@yelp.com'),
(1046,6,'Margeaux','Blenkinship',140206,'5','750-560-7253','26/10/2020','20/10/2000',     'atención al cliente','mblenkinship19@discuz.net'),
(1047,7,'Xylia','Pautot',140207,'31','795-825-5885','03/10/2016','24/06/1998',      'atención al cliente','xpautot1a@about.com'),
(1048,8,'Rogers','Cussen',140208,'7394','998-852-7826','14/12/2020','23/11/1995',   'atención al cliente','rcussen1b@wikimedia.org'),
(1049,9,'Bert','Rankmore',140209,'4700','504-187-9274','18/08/2017','30/11/2000',          'atención al cliente','brankmore1c@ehow.com'),
(1050,10,'Ethel','Bottomley',140210,'376','384-784-5602','22/11/2020','05/08/1996',   'atención al cliente','ebottomley1d@uol.com.br'),
(1051,11,'Valle','Conigsby',140211,'1816','427-182-2062','24/04/2018','29/09/2000',     'atención al cliente','vconigsby1e@fotki.com'),
(1052,12,'Jarred','Corah',140212,'29','639-143-1699','16/11/2019','11/11/1996',                 'atención al cliente','jcorah1f@wisc.edu'),
(1053,13,'Tadd','Pepineaux',140213,'55','684-591-8822','18/03/2018','02/08/1997',                  'atención al cliente','tpepineaux1g@chronoengine.com'),
(1054,14,'Cesya','O`Murtagh',140214,'5','312-915-0599','07/11/2019','20/12/1993',               'atención al cliente','comurtagh1h@slideshare.net'),
(1055,15,'Ddene','Giuroni',140215,'74','466-993-3796','15/09/2016','23/01/1997',                'atención al clienteAssistantManager','dgiuroni1i@moonfruit.com'),
(1056,16,'Tabbatha','Danilyak',140216,'4','330-220-1516','29/05/2019','28/03/2001',             'atención al clienteInternalAuditor','tdanilyak1j@walmart.com'),
(1057,17,'Rafferty','Egginson',140217,'42','229-834-9700','18/06/2018','12/03/1997',               'atención al cliente','regginson1k@ning.com'),
(1058,18,'Lamond','Marushak',140218,'86','162-560-2377','22/07/2018','12/10/1995',              'atención al cliente','lmarushak1l@uol.com.br'),
(1059,19,'Shayne','Noddles',140219,'0305', '390-757-2499',  '21/02/2020',   '21/11/1991',           'atención al cliente', 'snoddles1m@behance.net'),
(1060,  20, 'Bridie', 'Bellay', 140210, '2539', '278-551-5363',  '19/05/2019', '01/06/1999',       'atención al cliente', 'bbellay1n@unicef.org');
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
	@telef varchar (20),
	@sue money,
	@cargo varchar(20),
	@email varchar(50),
	@vUsu_ult_mod varchar(20)
as 
	update tb_Empleado
	set 
		codAgencia = @codAgen, nomEmpleado = @nombre, apeEmpleado = @apellido,
		Id_Ubigeo=@Id_Ubi, dirEmpleado = @direccion, telefono = @telef,
		sueldo = @sue, cargo = @cargo, correo =@email,usu_ult_mod=@vUsu_ult_mod
	where codEmpleado = @cod
go

--consultar
	--drop procedure usp_ConsultarEmpleado
create procedure usp_ConsultarEmpleado
	@cod smallint
as 
	select codEmpleado as 'Codigo Empleado', tb_Agencia.direccion as 'Agencia', 
		tb_Ubigeo.Departamento,tb_Ubigeo.Distrito, tb_Ubigeo.Provincia,
		nomEmpleado as 'Nombre', apeEmpleado as 'Apellido', cargo, sueldo
	from tb_Empleado inner join tb_Agencia
	on tb_Empleado.codAgencia = tb_Agencia.codAgencia
	inner join tb_Ubigeo
	on tb_Empleado.Id_Ubigeo = tb_Ubigeo.Id_Ubigeo
	where codEmpleado=@cod	
go

exec usp_ConsultarEmpleado @cod=1060
go

--Eliminar
	--drop procedure usp_EliminarEmpleado
create procedure usp_EliminarEmpleado
	@cod smallint
as
	delete from tb_Empleado where codEmpleado =@cod
go

--insertar
	--drop procedure usp_InsertEmpleado	
create procedure usp_InsertEmpleado	
	@codEmpl smallint,
	@codAgen smallint,
	@nombre varchar (20),
	@apellido varchar (20),
	@direccion varchar (20),
	@IdUbi nchar(6),
	@telefono varchar (20),
	@sue money,
	@cargo varchar(20),
	@email varchar(50),	
	@usu_reg varchar(20)

as
	set @codEmpl = (select top 1 codEmpleado from tb_Empleado order by codEmpleado DESC) +1
	
	INSERT into tb_Empleado (codEmpleado, codAgencia, nomEmpleado, apeEmpleado, Id_Ubigeo, dirEmpleado, telefono, sueldo, cargo, correo, usu_reg)
	VALUES(@codEmpl ,@codAgen,@nombre,@apellido,@IdUbi,@direccion , @telefono, @sue, @cargo,@email, @usu_reg)
go

--listar
	--drop procedure usp_ListarEmpleados
create procedure usp_ListarEmpleados
as
	select codEmpleado as 'Codigo Empleado', tb_Agencia.direccion as 'Agencia', 
	tb_Ubigeo.Departamento,tb_Ubigeo.Distrito, tb_Ubigeo.Provincia,
	nomEmpleado as 'Nombre', apeEmpleado as 'Apellido', cargo, sueldo
	from tb_Empleado inner join tb_Agencia
	on tb_Empleado.codAgencia = tb_Agencia.codAgencia
	inner join tb_Ubigeo
	on tb_Empleado.Id_Ubigeo = tb_Ubigeo.Id_Ubigeo
go
exec usp_ListarEmpleados



