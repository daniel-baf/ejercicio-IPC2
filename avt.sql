CREATE DATABASE  IF NOT EXISTS `aviateca`;
USE `aviateca`;
--
-- Table structure for table `aeropuerto`
--

DROP TABLE IF EXISTS `aeropuerto`;

CREATE TABLE `aeropuerto` (
  `Codigo` varchar(30) NOT NULL,
  `Nombre` varchar(45) NOT NULL,
  `Localidad` varchar(60) NOT NULL,
  `Pais` varchar(45) NOT NULL,
  PRIMARY KEY (`Codigo`)
);

--
-- Table structure for table `avion`
--

DROP TABLE IF EXISTS `avion`;

CREATE TABLE `avion` (
  `codigo` varchar(30) NOT NULL,
  PRIMARY KEY (`codigo`)
);

--
-- Table structure for table `clase`
--

DROP TABLE IF EXISTS `clase`;

CREATE TABLE `clase` (
  `Codigo` varchar(30) NOT NULL,
  `Nombre` varchar(45) NOT NULL,
  PRIMARY KEY (`Codigo`)
);

--
-- Table structure for table `piso`
--

DROP TABLE IF EXISTS `piso`;

CREATE TABLE `piso` (
  `Codigo` varchar(30) NOT NULL,
  `n_filas` int NOT NULL,
  `n_columnas` int NOT NULL,
  `Codigo_avion` varchar(30) NOT NULL,
  PRIMARY KEY (`Codigo`),
  KEY `avionsPiso_FK` (`Codigo_avion`),
  CONSTRAINT `avionsPiso_FK` FOREIGN KEY (`Codigo_avion`) REFERENCES `avion` (`codigo`) ON DELETE CASCADE ON UPDATE CASCADE
);

--
-- Table structure for table `asiento`
--

DROP TABLE IF EXISTS `asiento`;

CREATE TABLE `asiento` (
  `Codigo` varchar(30) NOT NULL,
  `fila` varchar(45) DEFAULT NULL,
  `columna` varchar(45) DEFAULT NULL,
  `Codigo_piso` varchar(45) DEFAULT NULL,
  `Codigo_clase` VARCHAR (30) NOT NULL
  PRIMARY KEY (`Codigo`),
  KEY `asientoPiso_fk` (`Codigo_piso`),
  CONSTRAINT `asientoPiso_fk` FOREIGN KEY (`Codigo_piso`) REFERENCES `piso` (`Codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `asientoClase_fk` FOREIGN KEY (`Codigo_clase`) REFERENCES `clase` (`Codigo`) ON DELETE CASCADE ON UPDATE NO ACTION;
);

--
-- Table structure for table `avion_clase`
--

DROP TABLE IF EXISTS `avion_clase`;

CREATE TABLE `avion_clase` (
  `Codigo` varchar(30) NOT NULL,
  `Cantidad_asientos` int NOT NULL,
  `Codigo_clase` varchar(45) NOT NULL,
  `Codigo_avion` varchar(45) NOT NULL,
  PRIMARY KEY (`Codigo`),
  KEY `claseClaseAvion_fk` (`Codigo_clase`),
  KEY `avionClase_fk` (`Codigo_avion`),
  CONSTRAINT `avionClase_fk` FOREIGN KEY (`Codigo_avion`) REFERENCES `avion` (`codigo`) ON UPDATE CASCADE,
  CONSTRAINT `claseClaseAvion_fk` FOREIGN KEY (`Codigo_clase`) REFERENCES `clase` (`Codigo`) ON UPDATE CASCADE
);

--
-- Table structure for table `cliente`
--

DROP TABLE IF EXISTS `cliente`;

CREATE TABLE `cliente` (
  `DPI` varchar(45) NOT NULL,
  `Nombre` varchar(45) NOT NULL,
  `Apellido` varchar(45) NOT NULL,
  `Direccion` varchar(90) NOT NULL,
  `Telefono` varchar(45) NOT NULL,
  `Tarjeta` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`DPI`)
);

--
-- Table structure for table `vuelo`
--

DROP TABLE IF EXISTS `vuelo`;

CREATE TABLE `vuelo` (
  `Codigo` varchar(35) NOT NULL,
  `Fecha_vuelo` date NOT NULL,
  `Hora_salida` varchar(20) NOT NULL,
  `Hora_entrada` varchar(20) NOT NULL,
  `Aeropuerto_entrada` varchar(30) DEFAULT NULL,
  `Aeropuerto_salida` varchar(30) DEFAULT NULL,
  `Codigo_Avion` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`Codigo`),
  KEY `aeropuertoEntradaVuelo_FK` (`Aeropuerto_entrada`),
  KEY `aeropuertoSalidaVuelo_FK` (`Aeropuerto_salida`),
  KEY `avionVuelo_FK` (`Codigo_Avion`),
  CONSTRAINT `aeropuertoEntradaVuelo_FK` FOREIGN KEY (`Aeropuerto_entrada`) REFERENCES `aeropuerto` (`Codigo`) ON UPDATE CASCADE,
  CONSTRAINT `aeropuertoSalidaVuelo_FK` FOREIGN KEY (`Aeropuerto_salida`) REFERENCES `aeropuerto` (`Codigo`) ON UPDATE CASCADE,
  CONSTRAINT `avionVuelo_FK` FOREIGN KEY (`Codigo_Avion`) REFERENCES `avion` (`codigo`) ON UPDATE CASCADE
);

--
-- Table structure for table `tarjeta_embarque`
--

DROP TABLE IF EXISTS `tarjeta_embarque`;

CREATE TABLE `tarjeta_embarque` (
  `ID` int NOT NULL,
  `Tipo_pago` varchar(45) NOT NULL,
  `DPI_cliente` varchar(45) NOT NULL,
  `Codigo_vuelo` varchar(35) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `tarjetaCliente_FK` (`DPI_cliente`),
  KEY `tarjetaVuelo_FK` (`Codigo_vuelo`),
  CONSTRAINT `tarjetaCliente_FK` FOREIGN KEY (`DPI_cliente`) REFERENCES `cliente` (`DPI`) ON UPDATE CASCADE,
  CONSTRAINT `tarjetaVuelo_FK` FOREIGN KEY (`Codigo_vuelo`) REFERENCES `vuelo` (`Codigo`) ON UPDATE CASCADE
);

--
-- Table structure for table `reserva_viaje`
--

DROP TABLE IF EXISTS `reserva_viaje`;

CREATE TABLE `reserva_viaje` (
  `No_reserva` int NOT NULL AUTO_INCREMENT,
  `Codigo_asiento` varchar(30) NOT NULL,
  `Codigo_tarjeta` int NOT NULL,
  `Fecha_reserva` date DEFAULT NULL,
  PRIMARY KEY (`No_reserva`),
  KEY `asientoReserva_fk` (`Codigo_asiento`),
  KEY `claseReserva_fk` (`Clase`),
  KEY `tarjetaReserva_fk` (`Codigo_tarjeta`),
  CONSTRAINT `asientoReserva_fk` FOREIGN KEY (`Codigo_asiento`) REFERENCES `asiento` (`Codigo`) ON UPDATE CASCADE,
  CONSTRAINT `tarjetaReserva_fk` FOREIGN KEY (`Codigo_tarjeta`) REFERENCES `tarjeta_embarque` (`ID`) ON UPDATE CASCADE
);