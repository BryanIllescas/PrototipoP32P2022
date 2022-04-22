CREATE SCHEMA IF NOT EXISTS `polideportivo` DEFAULT CHARACTER SET latin1 ;
USE `polideportivo` ;

CREATE TABLE IF NOT EXISTS usuarioTipo (
	idUsuarioTipo INT NOT NULL AUTO_INCREMENT,
	nombreUsuarioTipo VARCHAR(60) NOT NULL,
	status VARCHAR(1) NOT NULL,
    gabacionUsuario VARCHAR(60) NOT NULL,
    gabacionFecha datetime,
    modificacionUsuario VARCHAR(60) NOT NULL,
    modificacionFecha datetime,
	PRIMARY KEY (idUsuarioTipo))
	ENGINE = InnoDB CHARACTER SET = latin1;
    
CREATE TABLE IF NOT EXISTS usuario (
	idUsuario INT NOT NULL AUTO_INCREMENT,
    idUsuarioTipo INT NOT NULL,
	password VARCHAR(60) NOT NULL,
	status VARCHAR(1) NOT NULL,
    gabacionUsuario VARCHAR(60) NOT NULL,
    gabacionFecha datetime,
    modificacionUsuario VARCHAR(60) NOT NULL,
    modificacionFecha datetime,
	PRIMARY KEY (idUsuario),
    FOREIGN KEY (idUsuarioTipo) REFERENCES usuarioTipo (idUsuarioTipo))
	ENGINE = InnoDB CHARACTER SET = latin1;
    
    CREATE TABLE IF NOT EXISTS tipoPuesto (
	idTipoPuesto INT NOT NULL AUTO_INCREMENT,
	nombreTipoPuesto VARCHAR(60) NOT NULL,
    salario double DEFAULT NULL,
	status VARCHAR(1) NOT NULL,
    gabacionUsuario VARCHAR(60) NOT NULL,
    gabacionFecha datetime,
    modificacionUsuario VARCHAR(60) NOT NULL,
    modificacionFecha datetime,
	PRIMARY KEY (idTipoPuesto))
	ENGINE = InnoDB CHARACTER SET = latin1;
    
    CREATE TABLE IF NOT EXISTS trabajador (
	idTrabajador INT NOT NULL AUTO_INCREMENT,
    idUsuario INT NOT NULL,
    idTipoPuesto INT NOT NULL,
	nombre1 VARCHAR(60) NOT NULL,
    nombre2 VARCHAR(60) NOT NULL,
    apellido1 VARCHAR(60) NOT NULL,
    apellido2 VARCHAR(60) NOT NULL,
    apellidoCasada VARCHAR(60),
    correo VARCHAR(60) NOT NULL,
    direccion VARCHAR(60) NOT NULL,
    fechaNacimiento VARCHAR(60) NOT NULL,
    NIT INT(60) NOT NULL,
    DPI INT(60) NOT NULL,
    telefono INT(15) NOT NULL,
	status VARCHAR(1) NOT NULL,
    gabacionUsuario VARCHAR(60) NOT NULL,
    gabacionFecha datetime,
    modificacionUsuario VARCHAR(60) NOT NULL,
    modificacionFecha datetime,
	PRIMARY KEY (idTrabajador),
    FOREIGN KEY (idUsuario) REFERENCES usuario (idUsuario),
    FOREIGN KEY (idTipoPuesto) REFERENCES tipoPuesto (idTipoPuesto))
	ENGINE = InnoDB CHARACTER SET = latin1;
    
    CREATE TABLE IF NOT EXISTS sedePolideportivo (
	idSedePolideportivo INT NOT NULL AUTO_INCREMENT,
	nombreSedePolideportivo VARCHAR(60) NOT NULL,
    capacidad INT (60) NOT NULL,
	status VARCHAR(1) NOT NULL,
    gabacionUsuario VARCHAR(60) NOT NULL,
    gabacionFecha datetime,
    modificacionUsuario VARCHAR(60) NOT NULL,
    modificacionFecha datetime,
	PRIMARY KEY (idSedePolideportivo))
	ENGINE = InnoDB CHARACTER SET = latin1;
    
    CREATE TABLE IF NOT EXISTS campeonato (
	idCampeonato INT NOT NULL AUTO_INCREMENT,
    idSedePolideportivo INT NOT NULL,
    idTipoDeporte INT NOT NULL,
	nombreCampeonato VARCHAR(60) NOT NULL,
    capacidadEquipos INT (10) NOT NULL,
	status VARCHAR(1) NOT NULL,
    gabacionUsuario VARCHAR(60) NOT NULL,
    gabacionFecha datetime,
    modificacionUsuario VARCHAR(60) NOT NULL,
    modificacionFecha datetime,
	PRIMARY KEY (idCampeonato),
    FOREIGN KEY (idSedePolideportivo) REFERENCES sedePolideportivo (idSedePolideportivo),
    FOREIGN KEY (idTipoDeporte) REFERENCES tipoDeporte (idTipoDeporte))
	ENGINE = InnoDB CHARACTER SET = latin1;
    
    CREATE TABLE IF NOT EXISTS tipoDeporte (
	idTipoDeporte INT NOT NULL AUTO_INCREMENT,
	nombreTipoDeporte VARCHAR(60) NOT NULL,
	status VARCHAR(1) NOT NULL,
    gabacionUsuario VARCHAR(60) NOT NULL,
    gabacionFecha datetime,
    modificacionUsuario VARCHAR(60) NOT NULL,
    modificacionFecha datetime,
	PRIMARY KEY (idTipoDeporte))
	ENGINE = InnoDB CHARACTER SET = latin1;
    
    CREATE TABLE IF NOT EXISTS entrenador (
	idEntrenador INT NOT NULL AUTO_INCREMENT,
    idUsuario INT NOT NULL,
	nombre1 VARCHAR(60) NOT NULL,
    nombre2 VARCHAR(60) NOT NULL,
    apellido1 VARCHAR(60) NOT NULL,
    apellido2 VARCHAR(60) NOT NULL,
    apellidoCasada VARCHAR(60),
    fechaNacimiento VARCHAR(60) NOT NULL,
    telefono INT(15) NOT NULL,
	status VARCHAR(1) NOT NULL,
    gabacionUsuario VARCHAR(60) NOT NULL,
    gabacionFecha datetime,
    modificacionUsuario VARCHAR(60) NOT NULL,
    modificacionFecha datetime,
	PRIMARY KEY (idEntrenador),
    FOREIGN KEY (idUsuario) REFERENCES usuario (idUsuario))
	ENGINE = InnoDB CHARACTER SET = latin1;
    
    CREATE TABLE IF NOT EXISTS equipo (
	idEquipo INT NOT NULL AUTO_INCREMENT,
    idTipoDeporte INT NOT NULL,
    idEntrenador INT NOT NULL,
	nombreEquipo VARCHAR(60) NOT NULL,
    TorneosGanados INT (10) NOT NULL,
    partidosGanados INT (10) NOT NULL,
    partidosEmpates INT (10) NOT NULL,
    partidosPerdidos INT (10) NOT NULL,
	status VARCHAR(1) NOT NULL,
    gabacionUsuario VARCHAR(60) NOT NULL,
    gabacionFecha datetime,
    modificacionUsuario VARCHAR(60) NOT NULL,
    modificacionFecha datetime,
	PRIMARY KEY (idEquipo),
    FOREIGN KEY (idTipoDeporte) REFERENCES tipoDeporte (idTipoDeporte),
    FOREIGN KEY (idEntrenador) REFERENCES entrenador (idEntrenador))
	ENGINE = InnoDB CHARACTER SET = latin1;
    
    CREATE TABLE IF NOT EXISTS detallesPartido (
	idDetallesPartido INT NOT NULL AUTO_INCREMENT,
    idCampeonato INT NOT NULL,
    fechaPartido datetime,
    idLocal INT NOT NULL,
    idVisitante INT NOT NULL,
	marcadorPartido VARCHAR(60) NOT NULL,
    idMejorJugardor INT NOT NULL,
    faltas  VARCHAR(60) NOT NULL,
	status VARCHAR(10) NOT NULL,
    gabacionUsuario VARCHAR(60) NOT NULL,
    gabacionFecha datetime,
    modificacionUsuario VARCHAR(60) NOT NULL,
    modificacionFecha datetime,
	PRIMARY KEY (idDetallesPartido),
    FOREIGN KEY (idCampeonato) REFERENCES campeonato (idCampeonato))
	ENGINE = InnoDB CHARACTER SET = latin1;