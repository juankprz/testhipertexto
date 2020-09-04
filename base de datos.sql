-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 04-09-2020 a las 19:02:52
-- Versión del servidor: 10.4.13-MariaDB
-- Versión de PHP: 7.4.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `mydb`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `alumnos`
--

CREATE TABLE `alumnos` (
  `dni` int(11) NOT NULL,
  `nombre` varchar(200) DEFAULT NULL,
  `apellido` varchar(200) DEFAULT NULL,
  `direccion` varchar(45) DEFAULT NULL,
  `telefono` int(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `alumnos`
--

INSERT INTO `alumnos` (`dni`, `nombre`, `apellido`, `direccion`, `telefono`) VALUES
(111, 'Julian', 'Rodriguez', 'calle 9', 2745564),
(1103220136, 'juan', 'perez', 'calle 9', 2745565);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cursos`
--

CREATE TABLE `cursos` (
  `id` int(11) NOT NULL,
  `nombre` varchar(45) DEFAULT NULL,
  `docentes_dni` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `cursos`
--

INSERT INTO `cursos` (`id`, `nombre`, `docentes_dni`) VALUES
(0, 'grado 11', 1102857299),
(2, 'grado 10', 1102857299),
(3, 'grado 9', 1102857299),
(4, 'grado 8', 1102857299);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `docentes`
--

CREATE TABLE `docentes` (
  `dni` int(11) NOT NULL,
  `nombre` varchar(45) DEFAULT NULL,
  `apellido` varchar(45) DEFAULT NULL,
  `telefono` int(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `docentes`
--

INSERT INTO `docentes` (`dni`, `nombre`, `apellido`, `telefono`) VALUES
(1102857299, 'marlys', 'perez', 2812992);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `materias`
--

CREATE TABLE `materias` (
  `id` int(11) NOT NULL,
  `nombre` varchar(45) DEFAULT NULL,
  `cursos_id` int(11) NOT NULL,
  `alumnos_dni` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `materias`
--

INSERT INTO `materias` (`id`, `nombre`, `cursos_id`, `alumnos_dni`) VALUES
(0, 'lenguaje', 0, 1103220136),
(1, 'lenguaje', 2, 111),
(2, 'matematicas', 0, 1103220136),
(3, 'ingles', 2, 1103220136),
(4, 'Biologia', 2, 1103220136),
(5, 'biologia', 0, 1103220136),
(10, 'sociales', 0, 1103220136);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `matriculas`
--

CREATE TABLE `matriculas` (
  `alumnos_dni` int(11) NOT NULL,
  `cursos_id` int(11) NOT NULL,
  `fecha` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `matriculas`
--

INSERT INTO `matriculas` (`alumnos_dni`, `cursos_id`, `fecha`) VALUES
(1103220136, 0, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `notas`
--

CREATE TABLE `notas` (
  `id` int(11) NOT NULL,
  `nota` float DEFAULT NULL,
  `materias_id` int(11) NOT NULL,
  `alumnos_dni` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `notas`
--

INSERT INTO `notas` (`id`, `nota`, `materias_id`, `alumnos_dni`) VALUES
(1, 4.5, 3, 1103220136),
(2, 5, 2, 1103220136),
(3, 3, 3, 111),
(4, 5, 2, 111),
(5, 4, 4, 111),
(6, 2, 4, 1103220136),
(7, 3, 3, 1103220136),
(8, 5, 3, 1103220136),
(9, 5, 3, 1103220136),
(10, 5, 5, 1103220136),
(11, 3, 10, 1103220136),
(12, 4, 10, 1103220136),
(13, 3, 5, 111);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `alumnos`
--
ALTER TABLE `alumnos`
  ADD PRIMARY KEY (`dni`);

--
-- Indices de la tabla `cursos`
--
ALTER TABLE `cursos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_docentes` (`docentes_dni`);

--
-- Indices de la tabla `docentes`
--
ALTER TABLE `docentes`
  ADD PRIMARY KEY (`dni`);

--
-- Indices de la tabla `materias`
--
ALTER TABLE `materias`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_cursos1` (`cursos_id`),
  ADD KEY `fk_alumnos1` (`alumnos_dni`);

--
-- Indices de la tabla `matriculas`
--
ALTER TABLE `matriculas`
  ADD PRIMARY KEY (`alumnos_dni`,`cursos_id`),
  ADD KEY `fk_cursos` (`cursos_id`);

--
-- Indices de la tabla `notas`
--
ALTER TABLE `notas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_materias2` (`materias_id`),
  ADD KEY `fk_alumnos2` (`alumnos_dni`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `docentes`
--
ALTER TABLE `docentes`
  MODIFY `dni` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1102857300;

--
-- AUTO_INCREMENT de la tabla `notas`
--
ALTER TABLE `notas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `cursos`
--
ALTER TABLE `cursos`
  ADD CONSTRAINT `fk_docentes` FOREIGN KEY (`docentes_dni`) REFERENCES `docentes` (`dni`);

--
-- Filtros para la tabla `materias`
--
ALTER TABLE `materias`
  ADD CONSTRAINT `fk_alumnos1` FOREIGN KEY (`alumnos_dni`) REFERENCES `alumnos` (`dni`),
  ADD CONSTRAINT `fk_cursos1` FOREIGN KEY (`cursos_id`) REFERENCES `cursos` (`id`);

--
-- Filtros para la tabla `matriculas`
--
ALTER TABLE `matriculas`
  ADD CONSTRAINT `fk_alumnos` FOREIGN KEY (`alumnos_dni`) REFERENCES `alumnos` (`dni`),
  ADD CONSTRAINT `fk_cursos` FOREIGN KEY (`cursos_id`) REFERENCES `cursos` (`id`);

--
-- Filtros para la tabla `notas`
--
ALTER TABLE `notas`
  ADD CONSTRAINT `fk_alumnos2` FOREIGN KEY (`alumnos_dni`) REFERENCES `alumnos` (`dni`),
  ADD CONSTRAINT `fk_materias2` FOREIGN KEY (`materias_id`) REFERENCES `materias` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
