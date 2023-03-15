-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 15-03-2023 a las 01:37:25
-- Versión del servidor: 10.4.27-MariaDB
-- Versión de PHP: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `colegio`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `huella`
--

CREATE TABLE `huella` (
  `ID_HUELLA` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ingresos`
--

CREATE TABLE `ingresos` (
  `ID_INGRESO` int(10) NOT NULL,
  `ID_USUARIO` int(10) DEFAULT NULL,
  `FECHA` datetime DEFAULT current_timestamp(),
  `ESTADO` int(10) DEFAULT 1,
  `TIPO_INGRESO` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `ingresos`
--

INSERT INTO `ingresos` (`ID_INGRESO`, `ID_USUARIO`, `FECHA`, `ESTADO`, `TIPO_INGRESO`) VALUES
(1, 1, '2023-03-02 00:00:00', 1, 1),
(2, 2, '2023-03-03 00:00:00', 1, 1),
(3, 3, '2023-03-03 00:00:00', 1, 1),
(4, 4, '2023-03-03 00:00:00', 1, 1),
(5, 5, '2023-03-04 20:53:26', 1, 0),
(6, 6, '2023-03-04 20:53:22', 1, 1),
(7, 7, '2023-03-04 20:53:20', 1, 0),
(8, 1, '2023-03-04 00:00:00', 1, 1),
(9, 2, '2023-03-04 20:50:45', 1, 0),
(10, 3, '2023-03-04 20:50:41', 1, 1),
(11, 4, '2023-03-10 11:34:56', 1, 1),
(12, 5, '2023-03-10 11:35:16', 1, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `id` int(10) NOT NULL,
  `username` varchar(20) DEFAULT NULL,
  `password` char(102) DEFAULT NULL,
  `NOMBRES` varchar(30) DEFAULT NULL,
  `APELLIDOS` varchar(30) DEFAULT NULL,
  `EDAD` int(2) DEFAULT NULL,
  `GRADO` int(2) DEFAULT NULL,
  `ROL` varchar(30) DEFAULT NULL,
  `ID_HUELLA` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`id`, `username`, `password`, `NOMBRES`, `APELLIDOS`, `EDAD`, `GRADO`, `ROL`, `ID_HUELLA`) VALUES
(1, 'jeospino', '+Mf0*eWKYZX+G2u0BPnrhzL9olw==*IKTK1l7/6Hbp9qOB7zNqjg==*c5AU7Oc55Ts+oOACfO3/ZA==', 'Jesly Paola', 'Ospino Porras', 20, 0, 'ADMINISTRADOR', NULL),
(2, 'mjortiz', 'J5z/*mKkan29BV04UF/AyMtD8HQ==*mTG2HLwqxBwd0dzLD/5HnA==*l1h2UV1XAR9Cswb4J6hPBA==', 'MIGUEL JOSE', 'ORTIZ ORTIZ', 13, 6, 'ESTUDIANTE', NULL),
(3, 'magonzalo', '/zBe*tw5pCE8fRuSLVRSn9fVJUQ==*xoBNNMMbdVxcDWJDCeI35w==*pv4iSE9U+bEC8+YCW4gaHg==', 'marco', 'GONZALO', 15, 9, 'ESTUDIANTE', NULL),
(4, 'bavillanueva', 'hf4R*eFg3afeMbJ3XaDMAC15+RA==*wiOPw6Tb5q0no1WhoRFsHg==*qZuXK+PjVXDUtAHq9mfAuw==', 'Bryan Alfonso', 'VILLANUEVA RIVAS', 18, 11, 'ESTUDIANTE', NULL),
(5, 'elepalza', 'zljJ*jayfAbw/YrAkEU41bLoAcQ==*JHcGLEa1vknsm1QMBhRJDg==*ARDS8SLCgwczhE7YzCaZwQ==', 'EDUARDO LORA', 'EPALZA OSPINO', 16, 10, 'ESTUDIANTE', NULL),
(6, 'jaepalza', 's63M*bGdOKoa89wAxKfDyKkS6Bg==*eZ41/O5ZGl+2HTq6q6x70w==*Sm1eM3EcfaSoSz55cRSTXA==', 'JHOSTIN ALEXANDER', 'EPALZA MANJARREZ', 20, 0, 'ADMINISTRADOR', NULL),
(7, 'jomarco', 'p4Jq*jYPeRtb3PflPJ4jkXZ+DCw==*D/y2r1g9KAFczHVMPi2Klg==*Tl/z3OCofVMjasNXcGMfDg==', 'JOSE JOSE', 'MARCO FABIAN', 20, 10, 'ESTUDIANTE', NULL),
(8, 'kepalza', '+gbY*BOeXMUgr0zkz8T4r1wEKsA==*Ez7S/VY2CdWlmwZO7GOwcQ==*ojYyV8KF/C2fd+60R1m/tw==', 'KEWIN JESUS', 'EPALZA MANJARREZ', 17, 0, 'EGRESADO', NULL),
(9, 'wemanjarrez', 'W8FU*ITrhGlf7PXwPFXRnwZMq8w==*ryaz9hGpb4Kb5eWn+wLB9g==*E9Q21HBKK0aqPoz0ff3qTA==', 'WENDY JOHANA', 'MANJARREZ NOVOA', 41, 0, 'ACUDIENTE', NULL),
(10, 'prueba1', 'giHE*d/R5TATIMixUFhEABgwqQg==*FRn1fQVzw0dKHMDAJBZYXg==*quqmxSuw3KZ4iwSGnK7eRw==', 'prueba1', 'prueba1', 20, 10, 'ESTUDIANTE', NULL),
(11, 'prueba2', 'hZmV*IjjGYLx8OtVWzyOnbPU3Iw==*fnbtk04Q9zNtKJOjt5x3gg==*Naj+jYnBHstr51rDe3IveQ==', 'prueba2', 'prueba2', 20, 10, 'ESTUDIANTE', NULL),
(12, 'prueba2', 'QYS0*a4oauzHiN9TYI/n63fqxkQ==*yPTw0QfjhMxiALc51Wv4ZA==*Ly3/rZxbgeeEsf3q1iw3YQ==', 'prueba2', 'prueba2', 20, 10, 'ESTUDIANTE', NULL),
(13, 'prueba3', 'nQ2C*aHpVNT+44RXTRrSawFRqBg==*LJBbjR5+8WGV9iAlq+bM2Q==*UC+VQDECNCZxnt1YM1fvfQ==', 'prueba3', 'prueba3', 69, 69, 'estudiante', NULL),
(14, 'prueba3', '3eyC*72zHcIRJjKTermUyu9QdHQ==*Hlj2tGM6Paw3DCmz20m9tw==*FAfYXFev/qQahfCr1mvliA==', 'prueba3', 'prueba3', 69, 69, 'estudiante', NULL),
(15, 'prueba3', '8fFz*sy5Y2DNIwv91dY/4Hbk8VA==*fMldDGkE/Q+X+8xYPicNuw==*cEtQJwbOTVu9U1XxU6i2tw==', 'prueba3', 'prueba3', 69, 69, 'estudiante', NULL),
(16, 'prueba3', 'AnWL*ML7Y5AE3PVjCf5LKyL/EvQ==*l1Qn756boNYhNv+RtnphxQ==*TSwpVHFQueLfwkYHTkCcyg==', 'prueba3', 'prueba3', 69, 69, 'estudiante', NULL),
(17, 'prueba3', 'tlvQ*ReEvwAoms5i+Ijqwbv7xXA==*LfDDEspKIEeIuRUfzm1+XQ==*EODkpsoifc8154vzUuG+wA==', 'prueba3', 'prueba3', 69, 69, 'estudiante', NULL),
(18, 'prueba3', 'RVZ0*zOGJavdsn0pO7dlWQMQAsg==*ZmNHPydzVGpopoxSayjNNA==*CbpZYFkHygC1XiybmRM2Cg==', 'prueba3', 'prueba3', 69, 69, 'estudiante', NULL),
(19, 'prueba3', 'pVec*0nh86E4fMpJG8W5c76HoFA==*oP5jZx+LdxSTyhul+a6OGw==*ATNViFAAVxEnykSSZO/JAg==', 'prueba3', 'prueba3', 69, 69, 'estudiante', NULL),
(20, 'prueba4', '2YgO*SJ9F9jNAZJTw3aeV2GtZxA==*XOB1sN7B3cgT8OvH1yPKEg==*NC/qwRFBR0XnQFIMUFcbpQ==', 'prueba4', 'prueba4', 23, 23, 'estudiante', NULL),
(21, 'prueba5', 'Ck5N*018auEHHcEI5Ri+AH6Duxg==*UhNnTbl6Iydxh+eEkMgvBA==*HpNPQHUCro1358ygbUcPew==', 'prueba5', 'prueba5', 56, 56, 'estudiante', NULL),
(22, 'prueba6', 'JGkf*qdeZRKoAJ2wfbQf84K5Zxw==*sfGYK8gf4SwokfFw2ST64g==*LGV1lKOftoNKIaGyZvS8Gw==', 'prueba6', 'prueba6', 56, 56, 'estudiante', NULL),
(23, 'prueba6', '2Y1J*dREjYAoYQpDZx0qOvlOweg==*CNKhe5clV11y23SsALNAcQ==*y+F4w5Icdj1cwvPJQC6xEQ==', 'prueba6', 'prueba6', 56, 56, 'estudiante', NULL),
(24, 'prueba6', 'o85C*OE9QaLs+v2MM905KltrAiw==*SQoGqjA1itKFNMLFXR4Whg==*ymxkTHUGZh6oiq0GAoUXRA==', 'prueba6', 'prueba6', 23, 45, 'estudiante', NULL),
(25, 'prueba7', 'J4Vm*RDbCIctl9W9RfhqSjhEE5Q==*uPKi+nlfGtTqnKMKGlOZLQ==*8qmj2pRxyuQv7cB0kRuV9A==', 'prueba7', 'prueba7', 6, 76, 'estudiante', NULL),
(26, 'prueba7', '0n8Y*O9CBb6GIY73Yp7plBBbmDw==*wnEX/MllaoeNOd1Gn6vHtg==*QUP2u3KSGf0vGDCrNbR4HA==', 'prueba7', 'prueba7', 6, 76, 'estudiante', NULL),
(27, 'prueba20', 'pFhS*okf7V2knO1XE7rHp5x8Asw==*UVsY2pcNjZOieuvsaCsMww==*6yTRw1+GjvvZRQw4EqFs3g==', 'prueba', '20', 15, 8, 'estudiante', NULL);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `huella`
--
ALTER TABLE `huella`
  ADD PRIMARY KEY (`ID_HUELLA`);

--
-- Indices de la tabla `ingresos`
--
ALTER TABLE `ingresos`
  ADD PRIMARY KEY (`ID_INGRESO`),
  ADD KEY `ID_USUARIO` (`ID_USUARIO`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ID_HUELLA` (`ID_HUELLA`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `ingresos`
--
ALTER TABLE `ingresos`
  MODIFY `ID_INGRESO` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `ingresos`
--
ALTER TABLE `ingresos`
  ADD CONSTRAINT `ingresos_ibfk_1` FOREIGN KEY (`ID_USUARIO`) REFERENCES `usuario` (`id`);

--
-- Filtros para la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD CONSTRAINT `usuario_ibfk_1` FOREIGN KEY (`ID_HUELLA`) REFERENCES `huella` (`ID_HUELLA`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
