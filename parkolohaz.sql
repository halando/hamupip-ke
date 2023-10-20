-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Gép: 127.0.0.1
-- Létrehozás ideje: 2023. Sze 12. 17:14
-- Kiszolgáló verziója: 10.4.28-MariaDB
-- PHP verzió: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Adatbázis: `parkolohaz`
--
CREATE DATABASE IF NOT EXISTS `parkolohaz` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `parkolohaz`;

DELIMITER $$
--
-- Eljárások
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `veletlen_rendszam` ()   BEGIN
    	SELECT "Király Péter (c) 2023."
AS szoveg;
SELECT CHAR(65+FLOOR(RAND()*26)) AS veletlenszam;
    END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `auto`
--

CREATE TABLE `auto` (
  `rendszam` varchar(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `parkolasok`
--

CREATE TABLE `parkolasok` (
  `sorszam` int(10) UNSIGNED NOT NULL,
  `kezdete` datetime NOT NULL,
  `vege` datetime DEFAULT NULL,
  `rendszam` varchar(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Indexek a kiírt táblákhoz
--

--
-- A tábla indexei `auto`
--
ALTER TABLE `auto`
  ADD PRIMARY KEY (`rendszam`);

--
-- A tábla indexei `parkolasok`
--
ALTER TABLE `parkolasok`
  ADD PRIMARY KEY (`sorszam`),
  ADD KEY `rendszam` (`rendszam`);

--
-- A kiírt táblák AUTO_INCREMENT értéke
--

--
-- AUTO_INCREMENT a táblához `parkolasok`
--
ALTER TABLE `parkolasok`
  MODIFY `sorszam` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Megkötések a kiírt táblákhoz
--

--
-- Megkötések a táblához `parkolasok`
--
ALTER TABLE `parkolasok`
  ADD CONSTRAINT `parkolasok_ibfk_1` FOREIGN KEY (`rendszam`) REFERENCES `auto` (`rendszam`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
