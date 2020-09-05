CREATE DATABASE  IF NOT EXISTS `aviteca`;
USE `aviteca`;
--
-- Estructura para la tabla `aeropuerto`
--

DROP TABLE IF EXISTS `aeropuerto`;

CREATE TABLE `aeropuerto` (
  `Codigo` varchar(30) NOT NULL,
  `Nombre` varchar(45) NOT NULL,
  `Localidad` varchar(60) NOT NULL,
  `Pais` varchar(45) NOT NULL,
  PRIMARY KEY (`Codigo`)
) ;

--
-- Estructura para la tabla `avion`
--

DROP TABLE IF EXISTS `avion`;

CREATE TABLE `avion` (
  `codigo` varchar(30) NOT NULL,
  PRIMARY KEY (`codigo`)
);

--
-- Estructura para la tabla `clase`
--

DROP TABLE IF EXISTS `clase`;

CREATE TABLE `clase` (
  `Codigo` varchar(30) NOT NULL,
  `Nombre` varchar(45) NOT NULL,
  PRIMARY KEY (`Codigo`)
);

--
-- Estructura para la tabla `piso`
--

DROP TABLE IF EXISTS `piso`;

CREATE TABLE `piso` (
  `Codigo` varchar(30) NOT NULL,
  `n_filas` int(11) NOT NULL,
  `n_columnas` int(11) NOT NULL,
  `Codigo_avion` varchar(30) NOT NULL,
  PRIMARY KEY (`Codigo`),
  KEY `avionsPiso_FK` (`Codigo_avion`),
  CONSTRAINT `avionsPiso_FK` FOREIGN KEY (`Codigo_avion`) REFERENCES `avion` (`codigo`) ON DELETE CASCADE ON UPDATE CASCADE
) ;

--
-- Estructura para la tabla `asiento`
--

DROP TABLE IF EXISTS `asiento`;

CREATE TABLE `asiento` (
  `Codigo` varchar(30) NOT NULL,
  `fila` varchar(45) NOT NULL,
  `columna` varchar(45) NOT NULL,
  `Codigo_piso` varchar(30) NOT NULL,
  `Codigo_clase` varchar(30) NOT NULL,
  PRIMARY KEY (`Codigo`),
  KEY `asientoPiso_fk` (`Codigo_piso`),
  KEY `asientoClase_fk` (`Codigo_clase`),
  CONSTRAINT `asientoClase_fk` FOREIGN KEY (`Codigo_clase`) REFERENCES `clase` (`Codigo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `asientoPiso_fk` FOREIGN KEY (`Codigo_piso`) REFERENCES `piso` (`Codigo`) ON DELETE CASCADE ON UPDATE CASCADE
);

--
-- Estructura para la tabla `avion_clase`
--

DROP TABLE IF EXISTS `avion_clase`;

CREATE TABLE `avion_clase` (
  `Codigo` varchar(30) NOT NULL,
  `Cantidad_asientos` int(11) NOT NULL,
  `Codigo_clase` varchar(45) NOT NULL,
  `Codigo_avion` varchar(45) NOT NULL,
  PRIMARY KEY (`Codigo`),
  KEY `claseClaseAvion_fk` (`Codigo_clase`),
  KEY `avionClase_fk` (`Codigo_avion`),
  CONSTRAINT `avionClase_fk` FOREIGN KEY (`Codigo_avion`) REFERENCES `avion` (`codigo`) ON UPDATE CASCADE,
  CONSTRAINT `claseClaseAvion_fk` FOREIGN KEY (`Codigo_clase`) REFERENCES `clase` (`Codigo`) ON UPDATE CASCADE
);

--
-- Estructura para la tabla `cliente`
--

DROP TABLE IF EXISTS `cliente`;

CREATE TABLE `cliente` (
  `DPI` varchar(45) NOT NULL,
  `Nombre` varchar(45) NOT NULL,
  `Apellido` varchar(45) NOT NULL,
  `Direccion` varchar(90) NOT NULL,
  `Telefono` varchar(45) NOT NULL,
  `Tarjeta` varchar(45),
  PRIMARY KEY (`DPI`)
) ;

--
-- Estructura para la tabla `vuelo`
--

DROP TABLE IF EXISTS `vuelo`;

CREATE TABLE `vuelo` (
  `Codigo` varchar(35) NOT NULL,
  `Fecha_vuelo` date NOT NULL,
  `Hora_salida` varchar(20) NOT NULL,
  `Hora_entrada` varchar(20) NOT NULL,
  `Aeropuerto_entrada` varchar(30) NOT NULL,
  `Aeropuerto_salida` varchar(30) NOT NULL,
  `Codigo_Avion` varchar(30) NOT NULL,
  PRIMARY KEY (`Codigo`),
  KEY `aeropuertoEntradaVuelo_FK` (`Aeropuerto_entrada`),
  KEY `aeropuertoSalidaVuelo_FK` (`Aeropuerto_salida`),
  KEY `avionVuelo_FK` (`Codigo_Avion`),
  CONSTRAINT `aeropuertoEntradaVuelo_FK` FOREIGN KEY (`Aeropuerto_entrada`) REFERENCES `aeropuerto` (`Codigo`) ON UPDATE CASCADE,
  CONSTRAINT `aeropuertoSalidaVuelo_FK` FOREIGN KEY (`Aeropuerto_salida`) REFERENCES `aeropuerto` (`Codigo`) ON UPDATE CASCADE,
  CONSTRAINT `avionVuelo_FK` FOREIGN KEY (`Codigo_Avion`) REFERENCES `avion` (`codigo`) ON UPDATE CASCADE
);

--
-- Estructura para la tabla `tarjeta_embarque`
--

DROP TABLE IF EXISTS `tarjeta_embarque`;

CREATE TABLE `tarjeta_embarque` (
  `ID` int(11) NOT NULL,
  `Tipo_pago` varchar(45) NOT NULL,
  `DPI_cliente` varchar(45) NOT NULL,
  `Codigo_vuelo` varchar(35) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `tarjetaCliente_FK` (`DPI_cliente`),
  KEY `tarjetaVuelo_FK` (`Codigo_vuelo`),
  CONSTRAINT `tarjetaCliente_FK` FOREIGN KEY (`DPI_cliente`) REFERENCES `cliente` (`DPI`) ON UPDATE CASCADE,
  CONSTRAINT `tarjetaVuelo_FK` FOREIGN KEY (`Codigo_vuelo`) REFERENCES `vuelo` (`Codigo`) ON UPDATE CASCADE
);

--
-- Estructura para la tabla `reserva_viaje`
--

DROP TABLE IF EXISTS `reserva_viaje`;

CREATE TABLE `reserva_viaje` (
  `No_reserva` int(11) NOT NULL AUTO_INCREMENT,
  `Codigo_asiento` varchar(30) NOT NULL,
  `Codigo_tarjeta` int(11) NOT NULL,
  `Fecha_reserva` date DEFAULT NULL,
  PRIMARY KEY (`No_reserva`),
  KEY `asientoReserva_fk` (`Codigo_asiento`),
  KEY `tarjetaReserva_fk` (`Codigo_tarjeta`),
  CONSTRAINT `asientoReserva_fk` FOREIGN KEY (`Codigo_asiento`) REFERENCES `asiento` (`Codigo`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `tarjetaReserva_fk` FOREIGN KEY (`Codigo_tarjeta`) REFERENCES `tarjeta_embarque` (`ID`) ON DELETE NO ACTION ON UPDATE CASCADE
);