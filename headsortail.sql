-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 26-10-2020 a las 06:26:23
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
-- Base de datos: `headsortail`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `historygames`
--

CREATE TABLE `historygames` (
  `id_historygames` int(11) NOT NULL,
  `fullname` varchar(255) NOT NULL,
  `playplayer` varchar(255) NOT NULL,
  `playcomputer` varchar(255) NOT NULL,
  `winner` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `historygames`
--

INSERT INTO `historygames` (`id_historygames`, `fullname`, `playplayer`, `playcomputer`, `winner`) VALUES
(10, 'pedro', 'Heads', 'Tails', 'Tails'),
(11, 'pedro', 'Heads', 'Tails', 'Tails'),
(12, 'pedro', 'Tails', 'Heads', 'Heads'),
(13, 'pedro', 'Tails', 'Heads', 'Tails'),
(14, 'pedro', 'Heads', 'Tails', 'Tails');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `userdata`
--

CREATE TABLE `userdata` (
  `fullname` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `userdata`
--

INSERT INTO `userdata` (`fullname`, `email`, `password`) VALUES
('carlitos', 'carlito33@hotmail.com', '8193213'),
('el capo 33', 'dasdas@gmail.com', 'caps'),
('el capo22', '', ''),
('jorge', 'asd', '4'),
('pedro', 'pedorasdas@gmail.com', '12'),
('pedro el capo', 'perdo32@gmail.com', '1234556678');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `historygames`
--
ALTER TABLE `historygames`
  ADD PRIMARY KEY (`id_historygames`);

--
-- Indices de la tabla `userdata`
--
ALTER TABLE `userdata`
  ADD PRIMARY KEY (`fullname`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `historygames`
--
ALTER TABLE `historygames`
  MODIFY `id_historygames` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
