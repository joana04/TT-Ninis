drop database vinculacionLaboral;
create database vinculacionLaboral;

use vinculacionLaboral;
/* MODULO USUARIO (CATALOGO Y TABLAS) */
/* TABLAS */
create table usuario(
	idUsuario int not null auto_increment primary key,
	nombreUsuario varchar(20) not null,
	correo varchar(60) not null,
	rol varchar(20) not null,
	contrasena varchar(20) not null 
);

/* INSERT TABLA USUARIO */
insert into usuario (nombreUsuario,correo,rol,contrasena) values
	("usuario1","correo1@gmail.com","Administrador","contra1"),
	("usuario2","correo2@gmail.com","Empresa","contra2"),
	("usuario3","correo3@gmail.com","Empresa","contra3"),
	("usuario4","correo4@gmail.com","Empresa","contra4"),
	("usuario5","correo5@gmail.com","Becario","contra5"),
	("usuario6","correo6@gmail.com","Becario","contra6"),
	("usuario7","correo7@gmail.com","Empresa","contra7"),
	("usuario8","correo8@gmail.com","Empresa","contra8"),
	("usuario9","correo9@gmail.com","Empresa","contra9");
/* TERMINA INSERT TABLA USUARIO */

create table direccion(
	idDireccion int not null auto_increment primary key,
	calle varchar(60) not null,
	numeroExterior varchar(10) not null,
	numeroInterior varchar(10),
	colonia varchar(50) not null,
	municipioDelegacion varchar(50) not null,
	entidadFederal varchar(50) not null,
	codigoPostal char(5) not null
);

/* INSERT TABLA DIRECCION */
insert into direccion (calle,numeroExterior,colonia,municipioDelegacion,entidadFederal,codigoPostal) values
	("Calle Ejemplo","10","Colonia","municipio","México","55232"),
	("Calle Ejemplo2","10","Colonia2","municipio2","México","55232"),
	("Calle Ejemplo3","10","Colonia3","municipio3","México","55232"),
	("Calle Ejemplo4","10","Colonia4","municipio4","México","55232"),
	("Calle Ejemplo5","10","Colonia5","municipio5","México","55232");



/* TERMINA INSERT TABLA DIRECCION */
/* TERMINA MODULO USUARIO (CATALOGO Y TABLAS) */

/* MODULO EMPRESA (CATALOGO Y TABLAS) */
/* CATALOGOS EMPRESA*/
create table giroEmpresarial(
	idGiroEmpresarial int not null auto_increment primary key,
	nombreGiroEmpresarial varchar(60) not null,
	descripcionGiroEmpresarial varchar(60)
);

/* INSERT GIRO EMPRESARIAL */
insert into giroEmpresarial (nombreGiroEmpresarial) values 
	("Comercio al por menor"),
	("Comercio al por mayor"),
	("Servicio de hotelería"),
	("Servicios educativos"),
	("Servicios de salud y asistencia social"),
	("Servicios inmobiliarios y de alquieler de bienes inmuebles"),
	("Servicios profesionales, científicos y técnicos"),
	("Servicios financieros y de seguros"),
	("Servicio de apoyo a los negocios y manejo de residuos"),
	("Servicios de esparcimiento cultural y deportivo"),
	("Construcción de inmuebles"),
	("Industria manufacturera"),
	("Transporte, correos y almacenamiento"),
	("Información de medios masivos"),
	("Electricidad, suministro de agua y de gas"),
	("Agricultura, cría de animales, pesca y caza"),
	("Minería"),
	("Otra actividad");
/* TERMINA INSERT GIRO EMPRESARIAL */

create table tipoEmpresa(
	idTipoEmpresa int not null primary key auto_increment,
	nombreTipoEmpresa varchar(20) not null,
	descripcionTipoEmpresa varchar(60)
);
/* INSERT TIPO EMPRESA */
insert into tipoEmpresa (nombreTipoEmpresa) values
	("Persona física"),
	("Persona moral");
/* TERMINA INSERT TIPO EMPRESA */
/* TERMINA CATALOGOS EMPRESA */

/* TABLAS EMPRESA */
create table responsableEmpresa(
	idResponsableEmpresa int not null auto_increment primary key,
	nombreResponsable varchar(60) not null,
	paternoResponsable varchar(60) not null,
	maternoResponsable varchar(60) not null,
	cargo varchar(60) not null,
	telefono varchar(10) not null, 
	celular varchar(10)
);
/* INSERT RESPONSABLE EMPRESA */
insert into responsableEmpresa (nombreResponsable,paternoResponsable,maternoResponsable,cargo,telefono) values
	("Juan","Pérez","López","Jefe de departamento","5512345678"),
	("Luis","López","Pérez","Líder de departamento","5512345678"),
	("Jose","López","López","Análista de datos","5512345678"),
	("Fernando","Pérez","Pérez","Encargado","5512345678"),
	("Rodrigo","Morales","Lozano","Dueño","5512345678");


/* TERMINA INSERT RESPONSABLE EMPRESA */
create table empresa(
	rfc char(13) not null primary key,
	nombreEmpresa varchar(60) not null,
	telefono char(10) not null, 
	numeroEmpleados int not null,
	numeroBecariosACapacitar int not null,
	numeroBecariosCapacitando int,
	numeroBecariosCapacitados int,
	idUsuario int not null,
	tipoEmpresa int not null,
	giroEmpresa int not null,
	idDireccion int,
	idResponsableEmpresa int,
	foreign key(idUsuario) references usuario(idUsuario)
	on update cascade on delete cascade,
	foreign key(tipoEmpresa) references tipoEmpresa(idTipoEmpresa)
	on update cascade on delete cascade,
	foreign key(giroEmpresa) references giroEmpresarial(idGiroEmpresarial)
	on update cascade on delete cascade,
	foreign key(idDireccion) references direccion(idDireccion)
	on update cascade on delete cascade,
	foreign key(idResponsableEmpresa) references responsableEmpresa(idResponsableEmpresa)
	on update cascade on delete cascade
);


/* TERMINA MODULO EMPRESA (CATALOGO Y TABLAS) */

/* INSERT MODULO EMPRESA PRUEBAS */
/* INSERT TABLA EMPRESA */
/*       CURP,          NOMBRE,    TELEFONO,   E   AC C CP USUARIO,TIPO,GIRO,DIRECCION,RESPONSABLE */
insert into empresa values
	("1234567890--1","Empresa 1","5512345678",100,10,0,0,				2,1,3,1,null),	/*Empresa fisica*/
	("1234567890--2","Empresa 2","5512345678",10,1,0,0,			3,1,6,2,null),	 	/*Empresa fisica*/
	("1234567890--3","Empresa 3","5512345678",1000,25,0,0,			4,1,9,3,null),	/*Empresa fisica*/
	("1234567890--4","Empresa 4","5512345678",7,1,0,0,			7,2,1,4,1),		/*Empresa moral*/
	("1234567890--5","Empresa 5","5512345678",150,10,0,0,			8,2,2,5,2),	/*Empresa moral*/
	("1234567890--6","Empresa 6","5512345678",25,3,0,0,			9,2,4,1,3);		/*Empresa moral*/
/* TERMINA INSERT TABLA EMPRESA */
/* TERMINA INSERT MODULO EMPRESA PRUEBAS */


/* CATALOGOS BECARIOS */
create table discapacidades(
	idDiscapacidad int not null auto_increment primary key,
	nombreDiscapacidad  varchar(60) not null,
	descripcionDiscapacidad varchar(60) 
);
/* INSERT TABLA DISCAPACIDADES */
insert into discapacidades (nombreDiscapacidad) values
	("Discapacidad sensorial"),
	("Discapacidad motriz"),
	("Discapacidad mental"),
	("Discapacidad multiple");
/* TERMINA INSERT TABLA DISCAPACIDADES */

create table gradoEstudios(
	idGradoEstudios int primary key auto_increment not null,
	nombreGradoEstudios varchar(20) not null,
	descripcionGradoEstudios varchar(60)
);
/* INSERT TABLA GRADO DE ESTUDIOS */
insert into gradoEstudios (nombreGradoEstudios) values
	("Primaria"),
	("Secundaria"),
	("Bachillerato"),
	("Carerra técnica"),
	("Licenciatura"),
	("Maestria"),
	("Doctorado");
/* TERMINA INSERT TABLA GRADO DE ESTUDIOS */

/* TERMINA CATALOGOS BECARIOS */
create table becario(
	curp char(18) not null primary key,
	nombreBecario varchar(60) not null,
	paternoBecario varchar(60) not null,
	maternoBecario varchar(60) not null,
	edad int not null,
	numeroSeguridadSocial char(10),
	telefono varchar(20) not null,
	celular varchar(20),
	idGradoEstudios int not null,
	certificado boolean not null,
	idUsuario int not null
);

/* INSERT TABLA BECARIOS */
insert into becario (curp,nombreBecario,paternoBecario,maternoBecario,edad,telefono,idGradoEstudios,certificado,idUsuario) values
	("XXXX123456XXXXXX11","Becario1","Perez","Lopez",20,"5512345678",1,true,4),
	("XXXX123456XXXXXX12","Becario2","Lopez","Perez",21,"5512345678",2,true,5),
	("XXXX123456XXXXXX13","Becario3","Lopez","Lopez",22,"5512345678",3,false,6);
/* TERMINA INSERT TABLA BECARIOS */
/* TERMINA TABLAS */
