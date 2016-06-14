-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Počítač: 127.0.0.1
-- Vytvořeno: Úte 14. čen 2016, 09:23
-- Verze serveru: 10.1.13-MariaDB
-- Verze PHP: 7.0.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Databáze: `db_pepa`
--

-- --------------------------------------------------------

--
-- Struktura tabulky `table_pepa`
--

CREATE TABLE `table_pepa` (
  `id` int(3) NOT NULL,
  `email` char(30) NOT NULL,
  `password` char(30) NOT NULL,
  `status` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Vypisuji data pro tabulku `table_pepa`
--

INSERT INTO `table_pepa` (`id`, `email`, `password`, `status`) VALUES
(1, 'test@email.cz', 'hesloheslo1', 0),
(2, 'test2@email.cz', 'hesloheslo2', 0),
(3, 'josef.vancura@email.cz', 'krasneheslo', 0);

--
-- Klíče pro exportované tabulky
--

--
-- Klíče pro tabulku `table_pepa`
--
ALTER TABLE `table_pepa`
  ADD UNIQUE KEY `id_2` (`id`),
  ADD KEY `id` (`id`);

--
-- AUTO_INCREMENT pro tabulky
--

--
-- AUTO_INCREMENT pro tabulku `table_pepa`
--
ALTER TABLE `table_pepa`
  MODIFY `id` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
