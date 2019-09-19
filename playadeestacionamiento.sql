-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 23-12-2018 a las 01:07:08
-- Versión del servidor: 10.1.37-MariaDB
-- Versión de PHP: 7.3.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `playadeestacionamiento`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `abono`
--

CREATE TABLE `abono` (
  `idAbono` int(11) NOT NULL,
  `MontoDisponible` double DEFAULT NULL,
  `MontoAcreditado` double DEFAULT NULL,
  `FechaHora` datetime NOT NULL,
  `NroTicket` int(11) DEFAULT NULL,
  `Usuario_idUsuario` int(11) NOT NULL,
  `Propietario_DNI` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `abono`
--

INSERT INTO `abono` (`idAbono`, `MontoDisponible`, `MontoAcreditado`, `FechaHora`, `NroTicket`, `Usuario_idUsuario`, `Propietario_DNI`) VALUES
(1, 50, 40, '2018-12-19 13:00:00', 123, 3, 25982654),
(2, 50, 80, '2018-12-22 10:00:00', 124, 1, 29364542),
(3, 20, 50, '2018-12-22 09:00:00', 125, 1, 37426745),
(4, 0, 80, '2018-12-17 14:00:00', 126, 2, 32462724),
(5, 0, 90, '2018-12-25 14:00:00', 126, 2, 93726253),
(6, 21, 100, '2018-11-19 16:00:00', 127, 1, 30111746),
(7, 30, 80, '2018-11-19 15:00:00', 128, 3, 28114956);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `buenos_clientes`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `buenos_clientes` (
`apellido` varchar(100)
,`nombre` varchar(100)
,`MontoAcreditado` double
);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ingreso`
--

CREATE TABLE `ingreso` (
  `CodIngreso` int(11) NOT NULL,
  `FechaHoraIngreso` datetime NOT NULL,
  `FechaHoraSalida` datetime NOT NULL,
  `NroTicket` int(11) DEFAULT NULL,
  `Monto` double DEFAULT NULL,
  `CodBarra` int(11) DEFAULT NULL,
  `Usuario_idUsuario` int(11) NOT NULL,
  `Abono_idAbono` int(11) NOT NULL,
  `Porton_idPorton` int(11) NOT NULL,
  `Tarifa_idTarifa` int(11) NOT NULL,
  `Vehiculo_idVehiculo` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `ingreso`
--

INSERT INTO `ingreso` (`CodIngreso`, `FechaHoraIngreso`, `FechaHoraSalida`, `NroTicket`, `Monto`, `CodBarra`, `Usuario_idUsuario`, `Abono_idAbono`, `Porton_idPorton`, `Tarifa_idTarifa`, `Vehiculo_idVehiculo`) VALUES
(1, '2018-10-10 10:00:00', '2018-10-10 19:00:00', 1, 25, 1791234567, 2, 1, 1, 1, 8),
(2, '2018-10-10 10:00:00', '2018-10-10 18:00:00', 2, 50, 1791234568, 1, 2, 2, 2, 1),
(3, '2018-12-22 05:00:00', '2018-12-22 17:00:00', 3, 50, 1791234510, 1, 1, 1, 3, 2),
(4, '2018-12-22 04:00:00', '2018-12-22 19:00:00', 4, 50, 179123411, 1, 1, 1, 21, 7),
(5, '2018-12-22 06:00:00', '2018-12-22 20:00:00', 5, 25, 179123411, 3, 2, 2, 17, 7),
(6, '2018-12-22 06:00:00', '2018-12-22 19:00:00', 6, 25, 179123412, 3, 3, 2, 15, 9),
(7, '2018-12-22 09:00:00', '2018-12-22 00:53:00', 7, 25, 179123413, 3, 2, 1, 16, 7),
(8, '2018-12-22 05:00:00', '2018-12-22 19:00:00', 8, 25, 179123415, 2, 1, 1, 17, 8),
(9, '2018-12-22 05:00:00', '2018-12-22 20:00:00', 9, 50, 179123416, 3, 1, 1, 15, 8),
(10, '2018-12-22 03:00:00', '2018-12-22 19:00:00', 10, 50, 179123417, 2, 2, 1, 16, 7),
(11, '2018-12-22 04:00:00', '2018-12-22 16:00:00', 11, 50, 179123418, 1, 3, 1, 16, 7),
(12, '2018-12-22 05:00:00', '2018-12-22 16:00:00', 12, 50, 179123419, 3, 3, 1, 19, 6),
(13, '2018-12-22 06:00:00', '2018-12-22 15:00:00', 13, 50, 179123420, 1, 5, 1, 14, 2),
(14, '2018-12-22 05:00:00', '2018-12-22 17:00:00', 14, 25, 179123426, 3, 1, 1, 21, 8),
(15, '2018-12-22 07:00:00', '2018-12-22 17:00:00', 15, 50, 179123421, 1, 2, 1, 18, 7),
(16, '2018-12-22 09:00:00', '2018-12-22 21:00:00', 16, 50, 179123423, 3, 2, 1, 2, 3),
(17, '2018-12-22 07:00:00', '2018-12-22 18:00:00', 17, 25, 179123430, 1, 2, 1, 17, 6),
(18, '2018-12-22 05:00:00', '2018-12-22 21:00:00', 18, 25, 179123429, 1, 3, 1, 16, 7),
(19, '2018-12-22 05:00:00', '2018-12-22 22:00:00', 19, 25, 179123428, 1, 2, 1, 15, 9),
(20, '2018-12-22 06:00:00', '2018-12-22 22:00:00', 20, 25, 179123427, 3, 3, 1, 17, 7),
(21, '2018-12-22 09:00:00', '2018-12-22 19:00:00', 21, 50, 179123431, 3, 2, 1, 14, 8),
(22, '2018-12-22 08:00:00', '2018-12-22 19:00:00', 22, 25, 179123433, 2, 4, 1, 17, 3),
(23, '2018-12-22 18:00:00', '2018-12-22 22:00:00', 23, 25, 179123432, 1, 1, 1, 17, 5);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `marca`
--

CREATE TABLE `marca` (
  `idMarca` int(11) NOT NULL,
  `Nombre` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `marca`
--

INSERT INTO `marca` (`idMarca`, `Nombre`) VALUES
(10, 'Fiat'),
(12, 'Toyota'),
(13, 'Ford'),
(14, 'Mercedes-Benz'),
(15, 'Hyundai'),
(16, 'Honda'),
(17, 'Kawasaki');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `modelo`
--

CREATE TABLE `modelo` (
  `idModelo` int(11) NOT NULL,
  `Nombre` varchar(45) DEFAULT NULL,
  `Marca_idMarca` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `modelo`
--

INSERT INTO `modelo` (`idModelo`, `Nombre`, `Marca_idMarca`) VALUES
(1, 'Uno Way', 10),
(2, 'Fiat Cronos', 10),
(3, '500', 10),
(4, 'Etios', 12),
(5, 'Corolla', 12),
(6, 'Hilux', 12),
(7, 'Ka', 13),
(8, 'Fiesta', 13),
(9, 'Focus', 13),
(10, 'Tuckson', 15),
(11, 'Grandi10', 15),
(12, 'Grand Santa Fe', 15),
(13, 'Sedán', 14),
(14, 'Coupé', 14),
(15, 'GLA', 14),
(16, 'Wave110S', 16),
(17, 'CBTWISTER', 16),
(18, 'CG150', 16),
(19, 'J300', 17),
(20, 'KX250F', 17),
(21, 'KX85', 17);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `porton`
--

CREATE TABLE `porton` (
  `idPorton` int(11) NOT NULL,
  `Nombre` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `porton`
--

INSERT INTO `porton` (`idPorton`, `Nombre`) VALUES
(1, 'Portón Almagro'),
(2, 'Portón Av. Perón');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `propietario`
--

CREATE TABLE `propietario` (
  `DNI` int(11) NOT NULL,
  `Nombre` varchar(100) DEFAULT NULL,
  `Apellido` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `propietario`
--

INSERT INTO `propietario` (`DNI`, `Nombre`, `Apellido`) VALUES
(25982654, 'Romina', 'Prieto'),
(28114956, 'Mariano', 'Rosales'),
(29364542, 'Facundo', 'Rodriguez'),
(30111746, 'Juan', 'Gomez'),
(32462724, 'Julia', 'Ocampo'),
(33753416, 'Sofia', 'Martinez'),
(37426745, 'karen', 'Tello'),
(93726253, 'Roberto', 'Campos');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tarifa`
--

CREATE TABLE `tarifa` (
  `idTarifa` int(11) NOT NULL,
  `Abonado` varchar(2) DEFAULT NULL,
  `IngresoSinSaldo` int(2) DEFAULT NULL,
  `Precio` double DEFAULT NULL,
  `FechaHora` datetime DEFAULT NULL,
  `TipoVehiculo_idTipoVehiculo` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `tarifa`
--

INSERT INTO `tarifa` (`idTarifa`, `Abonado`, `IngresoSinSaldo`, `Precio`, `FechaHora`, `TipoVehiculo_idTipoVehiculo`) VALUES
(1, 'SI', 0, 25, '2018-12-03 08:00:00', 1),
(2, 'NO', 0, 50, '2018-10-10 10:00:00', 1),
(3, 'SI', 1, 25, '2018-10-10 10:00:00', 1),
(4, 'SI', 2, 25, '2018-12-22 09:00:00', 1),
(5, 'SI', 0, 25, '2018-12-11 07:00:00', 1),
(6, 'SI', 0, 25, '2018-12-18 09:00:00', 2),
(7, 'SI', 0, 25, '2018-11-15 08:00:00', 1),
(8, 'SI', 0, 25, '2018-11-14 09:00:00', 1),
(9, 'SI', 0, 25, '2018-11-15 07:00:00', 2),
(10, 'NO', 0, 50, '2018-11-22 09:00:00', 2),
(11, 'NO', 0, 50, '2018-11-21 08:00:00', 1),
(12, 'NO', 0, 50, '2018-11-13 08:00:00', 2),
(13, 'NO', 0, 50, '2018-12-19 08:00:00', 1),
(14, 'NO', 0, 50, '2018-12-11 00:00:00', 1),
(15, 'NO', 0, 50, '2018-12-05 08:00:00', 1),
(16, 'SI', 25, 25, '2018-11-14 06:00:00', 2),
(17, 'SI', 0, 25, '2018-11-21 08:00:00', 2),
(18, 'NO', 0, 50, '2018-12-20 15:00:00', 2),
(19, 'SI', 0, 25, '2018-12-04 12:00:00', 1),
(20, 'SI', 1, 25, '2018-12-19 12:00:00', 1),
(21, 'SI', 1, 50, '2018-11-21 11:00:00', 2),
(22, 'SI', 0, 25, '2018-12-14 10:00:00', 1),
(23, 'NO', 0, 50, '2018-11-22 08:00:00', 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipovehiculo`
--

CREATE TABLE `tipovehiculo` (
  `idTipoVehiculo` int(11) NOT NULL,
  `Nombre` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `tipovehiculo`
--

INSERT INTO `tipovehiculo` (`idTipoVehiculo`, `Nombre`) VALUES
(1, 'Auto'),
(2, 'Moto');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `idUsuario` int(11) NOT NULL,
  `NombreUsuario` varchar(100) NOT NULL,
  `Contraseña` varchar(45) NOT NULL,
  `Nombre` varchar(100) NOT NULL,
  `Apellido` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`idUsuario`, `NombreUsuario`, `Contraseña`, `Nombre`, `Apellido`) VALUES
(1, 'juan.r', 'juanor123', 'Juan', 'Rosa'),
(2, 'edita.rt', 'editar123', 'Edith', 'Lopez'),
(3, 'Mario.j', 'marioj123', 'Mario', 'Pintos');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `vehiculo`
--

CREATE TABLE `vehiculo` (
  `idVehiculo` int(11) NOT NULL,
  `dominio` varchar(9) NOT NULL,
  `Modelo_idModelo` int(11) NOT NULL,
  `Propietario_DNI` int(11) NOT NULL,
  `TipoVehiculo_idTipoVehiculo` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `vehiculo`
--

INSERT INTO `vehiculo` (`idVehiculo`, `dominio`, `Modelo_idModelo`, `Propietario_DNI`, `TipoVehiculo_idTipoVehiculo`) VALUES
(1, 'AB 231 DC', 3, 29364542, 1),
(2, 'AB 432 DC', 5, 30111746, 1),
(3, 'AB 543 DC', 4, 32462724, 1),
(4, 'AB 546 DC', 12, 37426745, 1),
(5, 'CD 654 AB', 17, 28114956, 2),
(6, 'CD 765 AB', 20, 93726253, 2),
(7, 'CD 879 AB', 21, 25982654, 2),
(8, 'AB 026 DC', 6, 25982654, 1),
(9, 'AB 329 DC', 2, 33753416, 1);

--
-- Disparadores `vehiculo`
--
DELIMITER $$
CREATE TRIGGER `vehiculo_agregado` AFTER INSERT ON `vehiculo` FOR EACH ROW INSERT INTO vehiculo_insert(codVehiculo, dominio, modeloVehiculo,propietarioVehiculo,tipo,insertado, usuario_nombre) VALUES(new.idVehiculo, new.dominio,new.Modelo_idModelo, new.Propietario_DNI,new.TipoVehiculo_idTipoVehiculo,now(),CURRENT_USER())
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `vehiculo_borrado` AFTER DELETE ON `vehiculo` FOR EACH ROW INSERT INTO vehiculo_eliminado(IdVehiculo, dominio, modelo,propietario,tipo,eliminado, usuario) VALUES(old.idVehiculo,old.dominio,old.Modelo_idModelo,old.Propietario_DNI,old.TipoVehiculo_idTipoVehiculo,now(),CURRENT_USER())
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `vehiculo_modificado` BEFORE UPDATE ON `vehiculo` FOR EACH ROW INSERT INTO vehiculo_modif(anteriorIdVehiculo, anteriorDominio, anteriorModelo,anteriorPropietario,ateriorTipo,nuevoIdVehiculo,nuevoDominio,nuevoModelo,nuevoPropietario,nuevoTipo,modificado, usuario) VALUES(old.idVehiculo,old.dominio,old.Modelo_idModelo,old.Propietario_DNI,old.TipoVehiculo_idTipoVehiculo,new.idVehiculo, new.dominio,new.Modelo_idModelo, new.Propietario_DNI,new.TipoVehiculo_idTipoVehiculo,now(),CURRENT_USER())
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `vehiculo_eliminado`
--

CREATE TABLE `vehiculo_eliminado` (
  `idVehiculo` int(25) DEFAULT NULL,
  `dominio` varchar(20) DEFAULT NULL,
  `modelo` varchar(50) DEFAULT NULL,
  `tipo` int(10) DEFAULT NULL,
  `propietario` int(10) DEFAULT NULL,
  `eliminado` datetime DEFAULT NULL,
  `usuario` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `vehiculo_insert`
--

CREATE TABLE `vehiculo_insert` (
  `codVehiculo` int(25) DEFAULT NULL,
  `dominio` varchar(15) DEFAULT NULL,
  `modeloVehiculo` varchar(45) DEFAULT NULL,
  `tipo` int(10) DEFAULT NULL,
  `propietarioVehiculo` varchar(100) DEFAULT NULL,
  `insertado` datetime DEFAULT NULL,
  `usuario_nombre` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `vehiculo_modif`
--

CREATE TABLE `vehiculo_modif` (
  `anteriorIdVehiculo` int(25) DEFAULT NULL,
  `anteriorDominio` varchar(20) DEFAULT NULL,
  `anteriorModelo` varchar(50) DEFAULT NULL,
  `ateriorTipo` int(10) DEFAULT NULL,
  `anteriorPropietario` int(10) DEFAULT NULL,
  `nuevoIdVehiculo` int(25) NOT NULL,
  `nuevoDominio` varchar(25) NOT NULL,
  `nuevoModelo` varchar(45) NOT NULL,
  `nuevoTipo` int(10) NOT NULL,
  `nuevoPropietario` int(25) NOT NULL,
  `Modificado` datetime DEFAULT NULL,
  `usuario` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vista_usuario`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `vista_usuario` (
`MontoDisponible` double
,`dominio` varchar(9)
,`idvehiculo` int(11)
,`modelo_idmodelo` int(11)
,`Propietario_DNI` int(11)
,`tipovehiculo_idtipovehiculo` int(11)
,`total_ingreso` bigint(21)
);

-- --------------------------------------------------------

--
-- Estructura para la vista `buenos_clientes`
--
DROP TABLE IF EXISTS `buenos_clientes`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `buenos_clientes`  AS  select `propietario`.`Apellido` AS `apellido`,`propietario`.`Nombre` AS `nombre`,`abono`.`MontoAcreditado` AS `MontoAcreditado` from (`propietario` join `abono` on((`propietario`.`DNI` = `abono`.`Propietario_DNI`))) where (select (sum(`abono`.`MontoAcreditado`) > 200)) ;

-- --------------------------------------------------------

--
-- Estructura para la vista `vista_usuario`
--
DROP TABLE IF EXISTS `vista_usuario`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vista_usuario`  AS  select `abono`.`MontoDisponible` AS `MontoDisponible`,`vehiculo`.`dominio` AS `dominio`,`vehiculo`.`idVehiculo` AS `idvehiculo`,`vehiculo`.`Modelo_idModelo` AS `modelo_idmodelo`,`vehiculo`.`Propietario_DNI` AS `Propietario_DNI`,`vehiculo`.`TipoVehiculo_idTipoVehiculo` AS `tipovehiculo_idtipovehiculo`,count(`ingreso`.`CodIngreso`) AS `total_ingreso` from ((`abono` join `vehiculo`) join `ingreso`) where (month(`ingreso`.`FechaHoraIngreso`) = now()) ;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `abono`
--
ALTER TABLE `abono`
  ADD PRIMARY KEY (`idAbono`),
  ADD KEY `fk_Abono_Usuario1_idx` (`Usuario_idUsuario`),
  ADD KEY `fk_Abono_Propietario1_idx` (`Propietario_DNI`);

--
-- Indices de la tabla `ingreso`
--
ALTER TABLE `ingreso`
  ADD PRIMARY KEY (`CodIngreso`),
  ADD KEY `fk_Ingreso_Usuario1_idx` (`Usuario_idUsuario`),
  ADD KEY `fk_Ingreso_Abono1_idx` (`Abono_idAbono`),
  ADD KEY `fk_Ingreso_Porton1_idx` (`Porton_idPorton`),
  ADD KEY `fk_Ingreso_Tarifa1_idx` (`Tarifa_idTarifa`),
  ADD KEY `fk_Ingreso_Vehiculo1_idx` (`Vehiculo_idVehiculo`);

--
-- Indices de la tabla `marca`
--
ALTER TABLE `marca`
  ADD PRIMARY KEY (`idMarca`);

--
-- Indices de la tabla `modelo`
--
ALTER TABLE `modelo`
  ADD PRIMARY KEY (`idModelo`),
  ADD KEY `fk_Modelo_Marca1_idx` (`Marca_idMarca`);

--
-- Indices de la tabla `porton`
--
ALTER TABLE `porton`
  ADD PRIMARY KEY (`idPorton`);

--
-- Indices de la tabla `propietario`
--
ALTER TABLE `propietario`
  ADD PRIMARY KEY (`DNI`);

--
-- Indices de la tabla `tarifa`
--
ALTER TABLE `tarifa`
  ADD PRIMARY KEY (`idTarifa`),
  ADD KEY `fk_Tarifa_TipoVehiculo1_idx` (`TipoVehiculo_idTipoVehiculo`);

--
-- Indices de la tabla `tipovehiculo`
--
ALTER TABLE `tipovehiculo`
  ADD PRIMARY KEY (`idTipoVehiculo`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`idUsuario`);

--
-- Indices de la tabla `vehiculo`
--
ALTER TABLE `vehiculo`
  ADD PRIMARY KEY (`idVehiculo`),
  ADD KEY `fk_Vehiculo_Modelo1_idx` (`Modelo_idModelo`),
  ADD KEY `fk_Vehiculo_Propietario1_idx` (`Propietario_DNI`),
  ADD KEY `fk_Vehiculo_TipoVehiculo1_idx` (`TipoVehiculo_idTipoVehiculo`);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `abono`
--
ALTER TABLE `abono`
  ADD CONSTRAINT `fk_Abono_Propietario1` FOREIGN KEY (`Propietario_DNI`) REFERENCES `propietario` (`DNI`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Abono_Usuario1` FOREIGN KEY (`Usuario_idUsuario`) REFERENCES `usuario` (`idUsuario`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `ingreso`
--
ALTER TABLE `ingreso`
  ADD CONSTRAINT `fk_Ingreso_Abono1` FOREIGN KEY (`Abono_idAbono`) REFERENCES `abono` (`idAbono`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Ingreso_Porton1` FOREIGN KEY (`Porton_idPorton`) REFERENCES `porton` (`idPorton`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Ingreso_Tarifa1` FOREIGN KEY (`Tarifa_idTarifa`) REFERENCES `tarifa` (`idTarifa`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Ingreso_Usuario1` FOREIGN KEY (`Usuario_idUsuario`) REFERENCES `usuario` (`idUsuario`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Ingreso_Vehiculo1` FOREIGN KEY (`Vehiculo_idVehiculo`) REFERENCES `vehiculo` (`idVehiculo`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `modelo`
--
ALTER TABLE `modelo`
  ADD CONSTRAINT `fk_Modelo_Marca1` FOREIGN KEY (`Marca_idMarca`) REFERENCES `marca` (`idMarca`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `tarifa`
--
ALTER TABLE `tarifa`
  ADD CONSTRAINT `fk_Tarifa_TipoVehiculo1` FOREIGN KEY (`TipoVehiculo_idTipoVehiculo`) REFERENCES `tipovehiculo` (`idTipoVehiculo`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `vehiculo`
--
ALTER TABLE `vehiculo`
  ADD CONSTRAINT `fk_Vehiculo_Modelo1` FOREIGN KEY (`Modelo_idModelo`) REFERENCES `modelo` (`idModelo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Vehiculo_Propietario1` FOREIGN KEY (`Propietario_DNI`) REFERENCES `propietario` (`DNI`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Vehiculo_TipoVehiculo1` FOREIGN KEY (`TipoVehiculo_idTipoVehiculo`) REFERENCES `tipovehiculo` (`idTipoVehiculo`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
