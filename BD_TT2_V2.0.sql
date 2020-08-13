create database vinculacionLaboral;

use vinculacionLaboral;
/* MODULO USUARIO (CATALOGO Y TABLAS) */
/* TABLAS */
create table rolUsuario(
	idUsuario int not null primary key auto_increment,
	nombreRolUsuario varchar(60) not null,
	descripcionRol varchar(60)
);

insert into rolUsuario (nombreRolUsuario) values ("Administrador"),("Empresa"),("Becario");

create table usuario(
	correo varchar(60) not null primary key,
	idRolUsuario int not null,
	contrasena varchar(20) not null,
	activo boolean not null default false,
	foreign key(idRolUsuario) references rolUsuario(idUsuario)
	on update cascade on delete cascade
);

/* INSERT TABLA USUARIO */
insert into usuario values
	("correo1@gmail.com",1,"contra1",true);
/* TERMINA INSERT TABLA USUARIO */

create table direccion(
	idDireccion int not null auto_increment primary key,
	calle varchar(60) not null,
	numeroExterior varchar(10) not null,
	numeroInterior varchar(10),
	colonia varchar(50) not null,
	municipioDelegacion varchar(50) not null,
	entidadFederal varchar(50) not null,
	codigoPostal char(5) not null,
	coordX varchar(10),
	coorY varchar(10)
);

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

/* TERMINA INSERT RESPONSABLE EMPRESA */
create table empresa(
	rfc char(13) not null primary key,
	nombreEmpresa varchar(60) not null,
	telefono char(10) not null, 
	numeroEmpleados int not null,
	numeroBecariosACapacitar int not null,
	numeroBecariosCapacitando int,
	numeroBecariosCapacitados int,
	correo varchar(60) not null,
	tipoEmpresa int not null,
	giroEmpresa int not null,
	idDireccion int,
	idResponsableEmpresa int,
	foreign key(correo) references usuario(correo)
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
	("Discapacidad multiple"),("Ninguna"),("Discapacidad visual"),("Discapacidad auditiva"),("Discapacidad del habla");
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
	("Posgrado");
/* TERMINA INSERT TABLA GRADO DE ESTUDIOS */

/* TERMINA CATALOGOS BECARIOS */
create table becario(
	curp char(18) not null primary key,
	nombreBecario varchar(60) not null,
	paternoBecario varchar(60) not null,
	maternoBecario varchar(60) not null,
	edad int not null,
	numeroSeguridadSocial char(11),
	telefono varchar(20) not null,
	celular varchar(20),
	idGradoEstudios int not null,
	certificado boolean not null,
	correo varchar(60) not null,
	idDiscapacidad int,
	idDireccion int,
	foreign key(idGradoEstudios) references gradoEstudios(idGradoEstudios)
	on update cascade on delete cascade,
	foreign key(idDiscapacidad) references discapacidades(idDiscapacidad)
	on update cascade on delete cascade,
	foreign key(correo) references usuario(correo)
	on update cascade on delete cascade,
	foreign key(idDireccion) references direccion(idDireccion)
	on update cascade on delete cascade
);

alter table becario add perfilLaboral int;


create table escolaridadBecario(
	idGradoEstudios int not null,
	curp char(18) not null,
	certificado boolean,
	foreign key(idGradoEstudios) references gradoEstudios(idGradoEstudios)
	on update cascade on delete cascade,
	foreign key(curp) references becario(curp)
	on update cascade on delete cascade,
	primary key (idGradoEstudios,curp)
);
/* TERMINA TABLAS */

create table vacante(
	idVacante int not null auto_increment primary key,
	nombreVacante varchar(60) not null,
	descripcionVacante varchar(60) not null,
	rfc char(13),
	fechaRegistro date,
	activa boolean,
	numeroDeVacantes int not null,
	numeroVacantesOcupadas int not null,
	foreign key(rfc) references empresa(rfc)
	on update cascade on delete cascade
);


create table vacanteBecario(
	idVacante int not null,
	curp char(18) not null,
	estado varchar(30) not null,
	fechaRegistro date,
	fechaDespido date,
	foreign key(idVacante) references vacante(idVacante)
	on update cascade on delete cascade,
	foreign key(curp) references becario(curp)
	on update cascade on delete cascade,
	primary key (idVacante,curp) 
);

create table caracteristica(
	idCaracteristica int not null auto_increment primary key,
	nombre varchar(60) not null,
	descripcion varchar(100),
	tipoCaracteristica int not null
);

create table vacanteCaracteristica(
	idVacanteCaracteristica int not null primary key auto_increment,
	idCaracteristica int not null,
	idVacante int not null,
	foreign key(idVacante) references vacante(idVacante)
	on update cascade on delete cascade,
	foreign key(idCaracteristica) references caracteristica(idCaracteristica)
	on update cascade on delete cascade
);

create table becarioCaracteristica(
	idBecarioCaracteristica int not null primary key auto_increment,
	idCaracteristica int not null,
	curp char(18) not null,
	foreign key(curp) references becario(curp)
	on update cascade on delete cascade,
	foreign key(idCaracteristica) references caracteristica(idCaracteristica)
	on update cascade on delete cascade
);

create table perfilLaboral(
	idPerfilLaboral int not null auto_increment primary key,
	nombrePerfilLaboral varchar(60) not null,
	descripcionPerfilLaboral varchar(100)
);

alter table becario add foreign key (perfilLaboral) references perfillaboral(idPerfilLaboral)  
on update cascade on delete cascade;

create table perfilLaboralCaracteristica(
	idPerfilLaboral int not null,
	idCaracteristica int not null,
	foreign key(idPerfilLaboral) references perfilLaboral(idPerfilLaboral)
	on update cascade on delete cascade,
	foreign key (idCaracteristica) references caracteristica(idCaracteristica)
	on update cascade on delete cascade,
	primary key(idPerfilLaboral,idCaracteristica)
);

alter table vacante add perfilLaboral int not null;
alter table vacante add foreign key (perfilLaboral) references perfillaboral(idPerfilLaboral)  
on update cascade on delete cascade;

alter table vacanteCaracteristica add ponderacion int not null;
alter table becarioCaracteristica add ponderacion int not null;

alter table becario add giroEmpresarial int;
alter table becario add estadoLaboral varchar(40);


insert into caracteristica values (null,"Ética","",1);
insert into caracteristica values (null,"Responsabilidad","",1);
insert into caracteristica values (null,"Empatía","",1);
insert into caracteristica values (null,"Sociabilidad","",1);
insert into caracteristica values (null,"Comunicación efectiva","",1);
insert into caracteristica values (null,"Escucha activa","",1);
insert into caracteristica values (null,"Trabajo en equipo","",1);
insert into caracteristica values (null,"Adaptación al cambio","",1);
insert into caracteristica values (null,"Creatividad","",1);
insert into caracteristica values (null,"Resolutivo","",1);

alter table perfillaboral modify descripcionPerfilLaboral varchar(200);

insert into perfillaboral values
	(1,"Asistente/Auxiliar/Ayudante","Persona que asiste o ayuda a otra, complementa o suple a alguien o a algo"),
	(2,"Chófer","Persona que maneja un vehículo automotor."),
	(3,"Asesor/Ejecutivo","Persona que asesora a alguien en algún asunto específico"),
	(4,"Inspector","Persona que se ocupa de la revisión cuidadosa de algo, de acuerdo con ciertas normas o reglas, para verificar que se cumpla con ellas"),
	(5,"Telefonista","Persona que se encarga de atender las llamadas en una central telefónica"),
	(6,"Recepcionista","Persona que trabaja en la recepción"),
	(7,"Guardia","Persona que vigila algo o a alguien"),
	(8,"Cajero","Persona encargada de cobrar y pagar el dinero"),
	(9,"Operador","Persona que se encarga de hacer funcionar un aparato o una máquina"),
	(10,"Supervisor","Persona o institución encargada de dirigir y vigilar determinada actividad"),
	(11,"Otro","Sin descripción");

insert into caracteristica values 
	(11,"Paquetes computacionales","",2),
	(12,"Facturación","",2),
	(13,"Conducción de automovil","",2),
	(14,"Manejo de equipo de cómputo","",2),
	(15,"Control de inventarios","",2),
	(16,"Auditoria de procesos y productos","",2),
	(17,"Conocimiento de Normas oficiales","",2),
	(18,"Levantamiento de no conformidades","",2),
	(19,"Elaboración de reportes","",2),
	(20,"Facilidad de captura","",2),
	(21,"Manejo de terminales bancarias","",2),
	(22,"Manejo de sistemas ERP","",2),
	(23,"Hábilidades númericas","",2),
	(24,"Manejo de maquinaria","",2);

insert into perfilLaboralCaracteristica values 
	(1,11),
	(1,12),
	(2,13),
	(3,14),
	(3,11),
	(4,15),
	(4,16),
	(4,17),
	(4,18),
	(4,19),
	(5,20),
	(5,11),
	(5,14),
	(6,14),
	(8,11),
	(8,20),
	(8,21),
	(8,22),
	(8,23),
	(9,14),
	(9,23),
	(10,14);

/* Agregar nombre de la empresa a la vacante */
insert into usuario values
	('becario1@mail.com',3,'becario',1),
	('becario2@mail.com',3,'becario',1),
	('becario3@mail.com',3,'becario',1),
	('becario4@mail.com',3,'becario',1),
	('empresa1@mail.com',2,'empresa',1),
	('empresa2@mail.com',2,'empresa',1),
	('empresa3@mail.com',2,'empresa',1),
	('empresa4@mail.com',2,'empresa',1),
	('b@b.com',3,'b',1),
	('e@e.com',2,'e',1)
	;

insert into becario values
	('XXXX123456XXXXXX00','Luis','Pérez','Pérez',21,null,'5512345678',null,1,0,'becario1@mail.com',6,null,null,0,null),
	('XXXX123456XXXXXX01','Juan','Carreño','Rocha',22,null,'5512345678',null,2,0,'becario2@mail.com',6,null,null,0,null),
	('XXXX123456XXXXXX02','Rodrigo','Zamora','Escamilla',23,null,'5512345678',null,3,0,'becario3@mail.com',6,null,null,0,null),
	('XXXX123456XXXXXX03','Leonardo','Osorio','Dominguez',24,null,'5512345678',null,4,0,'becario4@mail.com',6,null,null,0,null),
	('XXXX123456XXXXXX04','Leonardo','Osorio','Dominguez',24,null,'5512345678',null,4,0,'b@b.com',6,null,null,0,null)
	;

insert into responsableEmpresa values
	(1,'Luis','Alvarado','Lózada','Encargado','1234567890',null),
	(2,'Juan','Lózada','Gómez','Dueño','1234567890',null),
	(3,'José','Muller','Pérez','Jefe','1234567890',null),
	(4,'Arturo','´Castillo','Alvarado','Ejecutivo','1234567890',null)
	;

insert into empresa values
	('XXX123456HM1','Tienda de autoservicio MARTE','1234567890',3,0,null,null,'empresa1@mail.com',2,1,null,1),
	('XXX123456HM2','Papelería Express','1234567890',3,0,null,null,'empresa2@mail.com',2,1,null,2),
	('XXX123456HM3','Call Center Centro','1234567890',3,0,null,null,'empresa3@mail.com',2,7,null,3),
	('XXX123456HM4','Oficinas corporativas Santa Fé','1234567890',3,0,null,null,'empresa4@mail.com',2,6,null,4),
	('XXX123456HM5','Oficinas corporativas Santa Fé','1234567890',3,0,null,null,'e@e.com',2,6,null,4)
	;

alter table vacanteBecario add descripcionEstado varchar(40);

