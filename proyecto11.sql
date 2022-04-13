---- TABLAS _ SQL _ CHECK
--- 1.1 administradora.
--- 1.2 cargo.
--- 1.3 concepto.
--- 1.4 banco.
--- 1.5 cuenta.
--- 1.6 edificio.
--- 1.7 empleado.
--- 1.8 condominio.
--- 1.9 junta_condominio.
--- 1.10 apartamento.
--- 1.11 propietario.
--- 1.12 servicio.
--- 1.13 movimiento.
--- 1.14 telefono_administradora.
--- 1.15 telefono_junta_condominio.
--- 1.16 telefono_servicio.

-- 0) crear base de datos
create database proyecto11;
-- 0.1) activar base de datos
use proyecto11;


--- 1. Crear Tablas.
--- 1.1 administradora.
create table administradora(
	rif int(15) NOT NULL PRIMARY KEY,
	nombre varchar(50) NOT NULL,
	mision varchar(250),
	vision varchar(250),
	capital float NOT NULL,
	añofundacion date NOT NULL,
	fax int(12) NOT NULL,
	correo varchar(30) NOT NULL,
	direccion varchar(30) NOT NULL
)ENGINE=InnoDB;

--- 1.2 cargo.
create table cargo(
	idcargo int(3) NOT NULL PRIMARY KEY,
	nombre varchar(30) NOT NULL
)ENGINE=InnoDB;

--- 1.3 concepto.
create table concepto(
	idconcepto int(3) NOT NULL PRIMARY KEY,
	nomconcepto varchar(100) NOT NULL
)ENGINE=InnoDB;

--- 1.4 banco.
create table banco(
	idbanco int(3) NOT NULL PRIMARY KEY,
	nombanco varchar(50) NOT NULL
)ENGINE=InnoDB;

--- 1.5 cuenta.
create table cuenta(
	nrocuenta int(50) NOT NULL PRIMARY KEY,
	saldo float,
	idbanco int(3) NOT NULL,
	FOREIGN KEY (idbanco) references banco(idbanco)
)ENGINE=InnoDB;

--- 1.6 edificio.
create table edificio(
	idedificio int(10) NOT NULL PRIMARY KEY,
	nomedificio varchar(30) NOT NULL,
	totalpiso int(3) NOT NULL,
	fondoreserva float, 
	tamañototaledif varchar(100),
	nrocuenta int(50) NOT NULL,
	FOREIGN KEY (nrocuenta) references cuenta(nrocuenta)
)ENGINE=InnoDB;

--- 1.7 empleado.
create table empleado(
	ci int(12) NOT NULL PRIMARY KEY,
	prnom varchar(30) NOT NULL,
	sgnom varchar(30) NOT NULL,
	prapell varchar(30) NOT NULL,
	sgapell varchar(30) NOT NULL,
	genero char NOT NULL,
	fechnacimiento date NOT NULL,
	telefono long NOT NULL,
	direccion varchar(30) NOT NULL,
	estadocivil char NOT NULL,
	sueldo float NOT NULL,
	rif int(15) NOT NULL,
	FOREIGN KEY (rif) references administradora(rif)
)ENGINE=InnoDB;

--- 1.8 condominio.
create table condominio(
	idcondominio int(10) NOT NULL PRIMARY KEY,
	rifedificio varchar(30) NOT NULL,
	idedificio int(10) NOT NULL,
	rif int(15) NOT NULL,
	FOREIGN KEY (idedificio) references edificio(idedificio),
	FOREIGN KEY (rif) references administradora(rif)
)ENGINE=InnoDB;


--- 1.9 junta_condominio.
create table junta_condominio(
	ci int(12) NOT NULL PRIMARY KEY,
	nombre varchar(30) NOT NULL,
	apellido varchar(30) NOT NULL,
	idcondominio int(10) NOT NULL,
	idcargo int(3) NOT NULL,
	FOREIGN KEY (idcondominio) references condominio(idcondominio),
	FOREIGN KEY (idcargo) references cargo(idcargo)
)ENGINE=InnoDB;

--- 1.10 apartamento.
create table apartamento(
	nroapartamento varchar(10) NOT NULL PRIMARY KEY,
	tamañoapartamento varchar(30),
	alicuota varchar(50),
	piso int(3) NOT NULL,
	idedificio int(10) NOT NULL,
	FOREIGN KEY (idedificio) references edificio(idedificio)
)ENGINE=InnoDB;

--- 1.11 propietario.
create table propietario(
	ci int(12) NOT NULL PRIMARY KEY,
	nombre varchar(30) NOT NULL,
	apellido varchar(30) NOT NULL,
	contraacceso varchar(60) NOT NULL,
	estadcuenta char NOT NULL,
	correo varchar(50) NOT NULL,
	tipo char NOT NULL,
	nroapartamento varchar(10) NOT NULL,
	cicondociminio int(12) NOT NULL,
	rif int(15) NOT NULL,
	nrocuenta int(50) NOT NULL,
	FOREIGN KEY (nroapartamento) references apartamento(nroapartamento),
	FOREIGN KEY (cicondociminio) references junta_condominio(ci),
	FOREIGN KEY (rif) references administradora(rif),
	FOREIGN KEY (nrocuenta) references cuenta(nrocuenta)
)ENGINE=InnoDB;

--- 1.12 servicio.
create table servicio(
	idservicio int(10) NOT NULL PRIMARY KEY,
	nombservicio varchar(30) NOT NULL,
	correo varchar(50) NOT NULL,
	nrocuenta int(50) NOT NULL,
	FOREIGN KEY (nrocuenta) references cuenta(nrocuenta)
)ENGINE=InnoDB;

--- 1.13 movimiento.
create table movimiento(
	idmovimiento int(10) NOT NULL PRIMARY KEY,
	monto float NOT NULL,
	tipomonto char NOT NULL,
	idedificio int(10) NOT NULL,
	idconcepto int(3) NOT NULL,
	idservicio int(10) NOT NULL,
	FOREIGN KEY (idedificio) references edificio(idedificio),
	FOREIGN KEY (idconcepto) references concepto(idconcepto),
	FOREIGN KEY (idservicio) references servicio(idservicio)
)ENGINE=InnoDB; 

--- 1.14 telefono_administradora.
create table telefono_administradora(
	telefono long NOT NULL,
	rif int(15) NOT NULL,
	FOREIGN KEY (rif) references administradora(rif)
)ENGINE=InnoDB;

--- 1.15 telefono_junta_condominio.
create table telefono_junta_condominio(
	telefono long NOT NULL,
	ci int(12) NOT NULL,
	FOREIGN KEY (ci) references junta_condominio(ci)
)ENGINE=InnoDB;

--- 1.16 telefono_servicio.
create table telefono_servicio(
	telefono long NOT NULL,
	idservicio int(10) NOT NULL,
	FOREIGN KEY (idservicio) references servicio(idservicio)
)ENGINE=InnoDB;


---------------------------------------------------------------------------------------------
--- 2. Insertar Datos.
--- 2.1 administradora.
insert into administradora values(351336296, "Administradora Bolivariana VV C.A",
"Brindar un servicio integral de calidad que garantice el buen funcionamiento de la comunidad, generando seguridad y confianza de nuestros clientes",
"Ser reconocidos como un empresa de administración de condominios eficiente y confiable",
250.00, "2002-06-13", 15654321, "adminsitradorabvv@gmail.com", "Caracas");

--- 2.2 cargo.
insert into cargo values(1, "Presidente");
insert into cargo values(2, "Vicepresidente");
insert into cargo values(3, "Secretaria");

--- 2.3 concepto.
insert into concepto values(001, "Pago De Pieza De Ascensor");
insert into concepto values(002, "Préstamo de Banco");
insert into concepto values(003, "Pago De Productos De Limpieza y Bolsas");
insert into concepto values(004, "Pago de La Bomba de Agua");

--- 2.4 banco.
insert into banco values(1, "Banco De Venezuela");
insert into banco values(2, "Banco Mercantil");
insert into banco values(3, "Banco Banesco");
insert into banco values(4, "Banco Del Tesoro");

--- 2.5 cuenta.
--Edificio
insert into cuenta values(205034902, 30.00, 1);
insert into cuenta values(204054909, 45.00, 1);
insert into cuenta values(567396108, 25.00, 2);
insert into cuenta values(567350102, 70.00, 3);
insert into cuenta values(567370800, 30.00, 3);
insert into cuenta values(567340501, 50.00, 1);
insert into cuenta values(567310234, 55.00, 2);
insert into cuenta values(567310354, 23.00, 3);
insert into cuenta values(567350643, 26.00, 4);
--Propietario
insert into cuenta values(394821093, 30.00, 1);
insert into cuenta values(328409238, 45.00, 1);
insert into cuenta values(948230984, 25.00, 2);
insert into cuenta values(495894385, 70.00, 3);
insert into cuenta values(102983092, 30.00, 3);
insert into cuenta values(394829308, 50.00, 1);
insert into cuenta values(850493852, 55.00, 2);
insert into cuenta values(390248093, 23.00, 3);
insert into cuenta values(390248320, 26.00, 4);
--Servicio
insert into cuenta values(902834092, 30.00, 4);
insert into cuenta values(390489032, 45.00, 4);
insert into cuenta values(934892038, 25.00, 1);
insert into cuenta values(394803928, 70.00, 2);
insert into cuenta values(398409238, 30.00, 2);
insert into cuenta values(320842932, 50.00, 1);

--- 2.6 edificio.
insert into edificio values(1, "El Cielo Azul", 5, 100.00, "132mt2", 205034902);
insert into edificio values(2, "El Castillo", 3, 120.00, "1,132mt2", 204054909);
insert into edificio values(3, "El Coste", 3, 140.00, "232mt2", 567396108);
insert into edificio values(4, "Embajador II", 5, 140.00, "332mt2", 567350102);
insert into edificio values(5, "Floresta", 5, 120.00, "102mt2", 567370800);
insert into edificio values(6, "La Comunidad", 4, 200.00, "232mt2", 567340501);
insert into edificio values(7, "La Costera", 7, 200.00, "1,132mt2", 567310234);
insert into edificio values(8, "Los Valles", 10, 320.00, "2,132mt2", 567350643);

--- 2.7 empleado.
insert into empleado values(111, "Juan", "Carlos", "Perez", "Rojas", "M", "1976-05-03", 4262788976, "La California", "C", 20.00, 351336296);
insert into empleado values(222, "Luis", "David", "Diaz", "Castillo", "M", "1970-01-11", 4160561011, "Petare", "S", 19.00, 351336296);
insert into empleado values(333, "Isis", "Maria", "Bella", "Flor", "F", "1999-12-15", 4121112021, "Propatia", "C", 25.00, 351336296);
insert into empleado values(444, "Maruana", "Gabriela", "Hernandez", "Blanco", "F", "2001-09-13", 4261273027, "Catía", "S", 15.00, 351336296);
insert into empleado values(555, "Fausto", "Ricardo", "Torres", "Fariñez", "M", "2001-03-28", 4168504267, "La Bandera", "S", 22.00, 351336296);

--- 2.8 condominio.
insert into condominio values(1, 6731204230, 1, 351336296);
insert into condominio values(2, 1029382019, 2, 351336296);
insert into condominio values(3, 3904802932, 3, 351336296);
insert into condominio values(4, 9304823902, 4, 351336296);
insert into condominio values(5, 1932042349, 5, 351336296);
insert into condominio values(6, 2032594809, 6, 351336296);

--- 2.9 junta_condominio.
insert into junta_condominio values(111, "Juan", "Hernandez", 1, 1);
insert into junta_condominio values(222, "Hector", "Gutierrez", 1, 2);
insert into junta_condominio values(333, "Juliana", "Baul", 1, 3);

insert into junta_condominio values(444, "Victor", "Hernandez", 2, 1);
insert into junta_condominio values(555, "Manuel", "Gutierrez", 2, 2);
insert into junta_condominio values(666, "Maria", "Baul", 2, 3);

insert into junta_condominio values(777, "Hector", "Hernandez", 3, 1);
insert into junta_condominio values(888, "Rances", "Gutierrez", 3, 2);
insert into junta_condominio values(999, "Julieta", "Baul", 3, 3);

--- 2.10 apartamento.
insert into apartamento values("H17", "33mt2", 10.00, 2, 2);
insert into apartamento values("A36", "79mt2", 12.00, 1, 1);
insert into apartamento values("E46", "33mt2", 08.00, 5, 2);
insert into apartamento values("T27", "44mt2", 11.00, 2, 3);
insert into apartamento values("Y25", "79mt2", 30.00, 3, 3);
insert into apartamento values("F10", "29mt2", 20.00, 2, 4);
insert into apartamento values("F20", "35mt2", 11.00, 1, 5);
insert into apartamento values("F30", "22mt2", 08.00, 2, 6);
insert into apartamento values("F12", "40mt2", 06.00, 3, 3);

--- 2.11 propietario.
insert into propietario values(111, "Juan", "Hernandez", "password", "S", "juan@gmail.com", "C", "H17", 111, 351336296, 394821093);
insert into propietario values(222, "Hector", "Gutierrez", "password", "D", "hector@gmail.com", "P", "A36", 222, 351336296, 328409238);
insert into propietario values(333, "Juliana", "Baul", "password", "S", "juliana@gmail.com", "C", "E46", 333, 351336296, 948230984);

insert into propietario values(444, "Victor", "Hernandez", "password", "S", "victor@gmail.com", "C", "T27", 444, 351336296, 495894385);
insert into propietario values(555, "Manuel", "Gutierrez", "password", "S", "manuel@gmail.com", "P", "Y25", 555, 351336296, 102983092);
insert into propietario values(666, "Maria", "Baul", "password", "D", "maria@gmail.com", "P", "F10", 666, 351336296, 394829308);

insert into propietario values(777, "Hector", "Hernandez", "password", "D", "hector2@gmail.com", "P", "F20", 777, 351336296, 850493852);
insert into propietario values(888, "Rances", "Gutierrez", "password", "S", "rances@gmail.com", "P", "F30", 888, 351336296, 390248093);
insert into propietario values(999, "Julieta", "Baul", "password", "D", "julieta@gmail.com", "C", "F12", 999, 351336296, 390248320);

--- 2.12 servicio.
insert into servicio values(1, "Coorpoelec", "coorpoelect@gmail.com", 902834092);
insert into servicio values(2, "Cadafe", "Cadafe@gmail.com", 390489032);
insert into servicio values(3, "Hidrocapital", "Hidrocapital@gmail.com", 934892038);
insert into servicio values(4, "Hidroven", "Hidroven@gmail.com", 394803928);
insert into servicio values(5, "Cantv", "Cantv@gmail.com", 398409238);
insert into servicio values(6, "Digitel", "Digitel@gmail.com", 320842932);

--- 2.13 movimiento.
insert into movimiento values(01, 10.00, "S", 1, 1, 1);
insert into movimiento values(02, 12.00, "E", 2, 2, 2);
insert into movimiento values(03, 20.00, "S", 1, 2, 3);
insert into movimiento values(04, 12.00, "S", 2, 2, 4);
insert into movimiento values(05, 08.00, "E", 3, 3, 3);
insert into movimiento values(06, 12.00, "S", 2, 3, 2);
insert into movimiento values(07, 114.00, "E", 3, 4, 5);
insert into movimiento values(08, 110.00, "S", 4, 4, 5);
insert into movimiento values(09, 10.00, "S", 2, 1, 6);
insert into movimiento values(10, 123.00, "E", 2, 2, 1);
insert into movimiento values(11, 20.00, "E", 1, 4, 1);
insert into movimiento values(12, 22.00, "S", 3, 1, 1);

--- 2.14 telefono_administradora.
insert into telefono_administradora values(4160124050, 351336296);
insert into telefono_administradora values(4160122000, 351336296);
insert into telefono_administradora values(4120203034, 351336296);

--- 2.15 telefono_junta_condominio.
insert into telefono_junta_condominio values(4161234050, 111);
insert into telefono_junta_condominio values(4162938409, 111);
insert into telefono_junta_condominio values(4164398493, 222);
insert into telefono_junta_condominio values(4164893284, 222);
insert into telefono_junta_condominio values(4163904823, 333);
insert into telefono_junta_condominio values(4163904822, 333);
insert into telefono_junta_condominio values(4163094833, 444);
insert into telefono_junta_condominio values(4163904832, 444);

--- 2.16 telefono_servicio.
insert into telefono_servicio values(4241234050, 1);
insert into telefono_servicio values(4243984029, 1);
insert into telefono_servicio values(4243924830, 2);
insert into telefono_servicio values(4240923841, 2);
insert into telefono_servicio values(4243908429, 3);
insert into telefono_servicio values(4243029482, 3);
insert into telefono_servicio values(4242109809, 4);
insert into telefono_servicio values(4240219832, 4);
insert into telefono_servicio values(4243902584, 5);
insert into telefono_servicio values(4240293849, 5);
insert into telefono_servicio values(4242093842, 6);
insert into telefono_servicio values(4242930842, 6);