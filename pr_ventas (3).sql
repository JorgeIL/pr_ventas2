-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1:3306
-- Tiempo de generación: 20-10-2021 a las 15:37:44
-- Versión del servidor: 5.7.31
-- Versión de PHP: 7.3.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `pr_ventas`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente`
--

DROP TABLE IF EXISTS `cliente`;
CREATE TABLE IF NOT EXISTS `cliente` (
  `id_cliente` varchar(20) COLLATE latin1_spanish_ci NOT NULL,
  `Nombre_cliente` varchar(20) COLLATE latin1_spanish_ci NOT NULL,
  PRIMARY KEY (`id_cliente`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

--
-- Volcado de datos para la tabla `cliente`
--

INSERT INTO `cliente` (`id_cliente`, `Nombre_cliente`) VALUES
('1010101', 'Daniel Perez'),
('20202020', 'Sofia castro'),
('30303030', 'andres castro'),
('4040404', 'juan arias');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `compra_de_equipos`
--

DROP TABLE IF EXISTS `compra_de_equipos`;
CREATE TABLE IF NOT EXISTS `compra_de_equipos` (
  `Id_producto` varchar(20) COLLATE latin1_spanish_ci NOT NULL,
  `Id_proveedor` varchar(20) COLLATE latin1_spanish_ci NOT NULL,
  `id_empleado` varchar(20) COLLATE latin1_spanish_ci NOT NULL,
  `factura_` varchar(20) COLLATE latin1_spanish_ci NOT NULL,
  `fecha_entrada` date NOT NULL,
  `v_entrada_t` decimal(10,0) NOT NULL,
  PRIMARY KEY (`factura_`),
  KEY `Id_producto` (`Id_producto`),
  KEY `Id_proveedor` (`Id_proveedor`),
  KEY `id_empleado` (`id_empleado`),
  KEY `v_entrada_t` (`v_entrada_t`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

--
-- Volcado de datos para la tabla `compra_de_equipos`
--

INSERT INTO `compra_de_equipos` (`Id_producto`, `Id_proveedor`, `id_empleado`, `factura_`, `fecha_entrada`, `v_entrada_t`) VALUES
('0001', '31313131', '11111', '0000001', '2021-10-19', '300000'),
('0007', '31313131', '11111', '0000002', '2021-10-19', '600000'),
('0003', '32323232', '22222', '0000003', '2021-10-19', '4000000'),
('0004', '34343434', '33333', '0000004', '2021-10-19', '5000000');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empleado`
--

DROP TABLE IF EXISTS `empleado`;
CREATE TABLE IF NOT EXISTS `empleado` (
  `Id_empleado` varchar(20) COLLATE latin1_spanish_ci NOT NULL,
  `Nombre` varchar(20) COLLATE latin1_spanish_ci NOT NULL,
  `edad` int(11) NOT NULL,
  `celular` varchar(20) COLLATE latin1_spanish_ci NOT NULL,
  PRIMARY KEY (`Id_empleado`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

--
-- Volcado de datos para la tabla `empleado`
--

INSERT INTO `empleado` (`Id_empleado`, `Nombre`, `edad`, `celular`) VALUES
('11111', 'Daniel Pedraza', 61, ' 311 5054672'),
('22222', 'Jorge Leguizamon', 48, '301 3968979'),
('33333', 'Profe Gerald', 19, '3204569045');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `equipos`
--

DROP TABLE IF EXISTS `equipos`;
CREATE TABLE IF NOT EXISTS `equipos` (
  `Id_producto` varchar(20) COLLATE latin1_spanish_ci NOT NULL,
  `Nombre_producto` varchar(20) COLLATE latin1_spanish_ci NOT NULL,
  `Cantidad` decimal(10,0) NOT NULL,
  `Valor_entrada_unitario` decimal(10,0) NOT NULL,
  `Valor_salida_unitario` decimal(10,0) NOT NULL,
  PRIMARY KEY (`Id_producto`),
  KEY `Cantidad` (`Cantidad`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

--
-- Volcado de datos para la tabla `equipos`
--

INSERT INTO `equipos` (`Id_producto`, `Nombre_producto`, `Cantidad`, `Valor_entrada_unitario`, `Valor_salida_unitario`) VALUES
('0001', 'Lenovo ', '300', '200000', '400000'),
('0002', 'celular 1', '100', '100000', '300000'),
('0003', 'silla de masajes 1', '50000', '500000', '800000'),
('0004', 'celular 2', '30', '80000', '140000'),
('0005', 'hp', '27', '5000000', '8000000'),
('0006', 'silla de masajes  2', '1000', '800000', '1000000'),
('0007', 'celular 3', '250', '100000', '300000'),
('0008', 'microhondas', '500', '200000', '280000'),
('0009', 'silla de masajes  3', '2000', '400000', '600000'),
('0010', 'celular 4', '98', '450000', '600000');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `inventario`
--

DROP TABLE IF EXISTS `inventario`;
CREATE TABLE IF NOT EXISTS `inventario` (
  `cantidad` decimal(10,0) NOT NULL,
  `cantidad_venta` decimal(10,0) NOT NULL,
  KEY `cantidad` (`cantidad`,`cantidad_venta`),
  KEY `cantidad_venta` (`cantidad_venta`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

--
-- Volcado de datos para la tabla `inventario`
--

INSERT INTO `inventario` (`cantidad`, `cantidad_venta`) VALUES
('30', '150'),
('250', '14'),
('300', '100'),
('50000', '123');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proveedor`
--

DROP TABLE IF EXISTS `proveedor`;
CREATE TABLE IF NOT EXISTS `proveedor` (
  `Id_proveedor` varchar(20) COLLATE latin1_spanish_ci NOT NULL,
  `nombre_vendedor` varchar(20) COLLATE latin1_spanish_ci NOT NULL,
  `Celular` varchar(20) COLLATE latin1_spanish_ci NOT NULL,
  `Email` varchar(20) COLLATE latin1_spanish_ci NOT NULL,
  PRIMARY KEY (`Id_proveedor`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

--
-- Volcado de datos para la tabla `proveedor`
--

INSERT INTO `proveedor` (`Id_proveedor`, `nombre_vendedor`, `Celular`, `Email`) VALUES
('31313131', 'proveedor1.s.a', '3214567893', 'proveedor1@gmail.com'),
('32323232', 'proveedor2.s.a', '3118943784', 'proveedor2@gmail.com'),
('34343434', 'proveedor3.s.a', '3205469087', 'proveedor3@gmail.com');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `venta_de_equipos`
--

DROP TABLE IF EXISTS `venta_de_equipos`;
CREATE TABLE IF NOT EXISTS `venta_de_equipos` (
  `Id_producto` varchar(20) COLLATE latin1_spanish_ci NOT NULL,
  `factura` varchar(5) COLLATE latin1_spanish_ci NOT NULL,
  `ID_empleado` varchar(20) COLLATE latin1_spanish_ci NOT NULL,
  `Fecha` date NOT NULL,
  `Valor_salida` decimal(10,0) NOT NULL,
  `id_cliente` varchar(20) COLLATE latin1_spanish_ci NOT NULL,
  `cantidad_venta` decimal(10,0) NOT NULL,
  PRIMARY KEY (`factura`,`Valor_salida`),
  KEY `Id_producto` (`Id_producto`),
  KEY `ID_empleado` (`ID_empleado`),
  KEY `id_cliente` (`id_cliente`),
  KEY `cantidad_venta` (`cantidad_venta`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

--
-- Volcado de datos para la tabla `venta_de_equipos`
--

INSERT INTO `venta_de_equipos` (`Id_producto`, `factura`, `ID_empleado`, `Fecha`, `Valor_salida`, `id_cliente`, `cantidad_venta`) VALUES
('0001', '1000', '11111', '2021-10-19', '400000', '1010101', '100'),
('0004', '2000', '33333', '2021-10-19', '500000', '30303030', '150'),
('0003', '3000', '22222', '2021-10-19', '5000000', '4040404', '123'),
('0007', '4000', '33333', '2021-10-19', '6000000', '20202020', '14');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ver_cantidad`
--

DROP TABLE IF EXISTS `ver_cantidad`;
CREATE TABLE IF NOT EXISTS `ver_cantidad` (
  `Id_producto` varchar(20) DEFAULT NULL,
  `Nombre_producto` varchar(20) DEFAULT NULL,
  `Cantidad` decimal(10,0) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ver_compra`
--

DROP TABLE IF EXISTS `ver_compra`;
CREATE TABLE IF NOT EXISTS `ver_compra` (
  `factura_` varchar(20) DEFAULT NULL,
  `v_entrada_t` decimal(10,0) DEFAULT NULL,
  `fecha_entrada` date DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ver_venta`
--

DROP TABLE IF EXISTS `ver_venta`;
CREATE TABLE IF NOT EXISTS `ver_venta` (
  `factura` varchar(5) DEFAULT NULL,
  `Fecha` date DEFAULT NULL,
  `Valor_salida` decimal(10,0) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `compra_de_equipos`
--
ALTER TABLE `compra_de_equipos`
  ADD CONSTRAINT `compra_de_equipos_ibfk_1` FOREIGN KEY (`Id_proveedor`) REFERENCES `proveedor` (`Id_proveedor`) ON UPDATE CASCADE,
  ADD CONSTRAINT `compra_de_equipos_ibfk_2` FOREIGN KEY (`Id_producto`) REFERENCES `equipos` (`Id_producto`) ON UPDATE CASCADE,
  ADD CONSTRAINT `compra_de_equipos_ibfk_3` FOREIGN KEY (`id_empleado`) REFERENCES `empleado` (`Id_empleado`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `inventario`
--
ALTER TABLE `inventario`
  ADD CONSTRAINT `inventario_ibfk_1` FOREIGN KEY (`cantidad_venta`) REFERENCES `venta_de_equipos` (`cantidad_venta`) ON UPDATE CASCADE,
  ADD CONSTRAINT `inventario_ibfk_2` FOREIGN KEY (`cantidad`) REFERENCES `equipos` (`Cantidad`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `venta_de_equipos`
--
ALTER TABLE `venta_de_equipos`
  ADD CONSTRAINT `venta_de_equipos_ibfk_1` FOREIGN KEY (`Id_producto`) REFERENCES `equipos` (`Id_producto`) ON UPDATE CASCADE,
  ADD CONSTRAINT `venta_de_equipos_ibfk_2` FOREIGN KEY (`ID_empleado`) REFERENCES `empleado` (`Id_empleado`) ON UPDATE CASCADE,
  ADD CONSTRAINT `venta_de_equipos_ibfk_3` FOREIGN KEY (`id_cliente`) REFERENCES `cliente` (`id_cliente`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
