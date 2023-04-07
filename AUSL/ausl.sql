- phpMyAdmin SQL Dump
-- version 5.1.4deb1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Creato il: Apr 07, 2023 alle 15:46
-- Versione del server: 8.0.32-0ubuntu0.22.10.2
-- Versione PHP: 8.1.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `AUSL`
--

-- --------------------------------------------------------

--
-- Struttura della tabella `AUSL`
--

CREATE TABLE `AUSL` (
  `NomeAUSL` varchar(60) NOT NULL,
  `Descrizione` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dump dei dati per la tabella `AUSL`
--

INSERT INTO `AUSL` (`NomeAUSL`, `Descrizione`) VALUES
('n.01-LâAquila ', NULL),
('n.02-Chieti', NULL),
('n.03-Pescara', NULL),
('n.04-Teramo', NULL);

-- --------------------------------------------------------

--
-- Struttura della tabella `InterventiPerRicoveri`
--

CREATE TABLE `InterventiPerRicoveri` (
  `ID` int NOT NULL,
  `FK_IDIntervento` int NOT NULL,
  `FK_IDRicovero` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Struttura della tabella `Intervento`
--

CREATE TABLE `Intervento` (
  `IDIntervento` int NOT NULL,
  `Descrizione` varchar(100) NOT NULL,
  `Costo` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Struttura della tabella `Paziente`
--

CREATE TABLE `Paziente` (
  `CF` char(16) NOT NULL,
  `Nome` varchar(60) NOT NULL,
  `Cognome` varchar(60) NOT NULL,
  `Indirizzo` varchar(100) NOT NULL,
  `CittÃ ` varchar(60) NOT NULL,
  `Provincia` char(2) NOT NULL,
  `DataNascita` date NOT NULL,
  `Genere` enum('M','F','ND') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Telefono` varchar(13) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dump dei dati per la tabella `Paziente`
--

INSERT INTO `Paziente` (`CF`, `Nome`, `Cognome`, `Indirizzo`, `CittÃ `, `Provincia`, `DataNascita`, `Genere`, `Telefono`) VALUES
('CNTLRD82A02L103V', 'Alfredo', 'Centinaro', 'via villa mosca, 47b', 'Teramo', 'TE', '1982-01-02', 'M', '3493827841');

-- --------------------------------------------------------

--
-- Struttura della tabella `Ricovero`
--

CREATE TABLE `Ricovero` (
  `IDRicovero` int NOT NULL,
  `DataRicovero` date NOT NULL,
  `DataDimissioni` date NOT NULL,
  `Causa` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `FK_IDUnita` varchar(30) NOT NULL,
  `FK_Paziente` char(16) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dump dei dati per la tabella `Ricovero`
--

INSERT INTO `Ricovero` (`IDRicovero`, `DataRicovero`, `DataDimissioni`, `Causa`, `FK_IDUnita`, `FK_Paziente`) VALUES
(1, '2022-03-01', '2022-07-02', 'covid', 'Medicina', 'CNTLRD82A02L103V'),
(2, '2022-07-04', '2022-07-05', 'polmonite', 'Medicina', 'CNTLRD82A02L103V');

-- --------------------------------------------------------

--
-- Struttura della tabella `Struttura`
--

CREATE TABLE `Struttura` (
  `IDStruttura` char(5) NOT NULL,
  `Nome` varchar(60) NOT NULL,
  `Indirizzo` varchar(100) NOT NULL,
  `CittÃ ` varchar(60) NOT NULL,
  `Provincia` char(2) NOT NULL,
  `Tipo` enum('Pubblico','Privato') NOT NULL,
  `FK_NomeAusl` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dump dei dati per la tabella `Struttura`
--

INSERT INTO `Struttura` (`IDStruttura`, `Nome`, `Indirizzo`, `CittÃ `, `Provincia`, `Tipo`, `FK_NomeAusl`) VALUES
('ASL01', 'ASL Teramo', 'circonvallazione ragusa, 1', 'Teramo', 'TE', 'Pubblico', 'n.04-Teramo'),
('GUA01', 'Guardia Medica Turistica Tortoreto', 'via Isonzo, 51', 'Tortoreto Lido', 'TE', 'Pubblico', 'n.04-Teramo'),
('OSP01', 'Ospedale Mazzini', 'via villa mosca, snc', 'Teramo', 'TE', 'Pubblico', 'n.04-Teramo'),
('OSP02', 'Ospedale Santo Spirito', 'via Fonte Romana, 8', 'Pescara', 'PE', 'Pubblico', 'n.03-Pescara'),
('OSP03', 'Villa Letizia', 'Strada Statale 80, 25/b', 'Preturo', 'AQ', 'Privato', 'n.01-LâAquila '),
('OSP04', 'Villa Serena', 'via Leonardo Petruzzi, 42,', 'CittÃ  Sant\'Angelo', 'PE', 'Privato', 'n.03-Pescara'),
('OSP05', 'Villa Dorotea', 'Loc. Macere', 'Scoppito', 'AQ', 'Privato', 'n.01-LâAquila ');

-- --------------------------------------------------------

--
-- Struttura della tabella `UnitaOperativa`
--

CREATE TABLE `UnitaOperativa` (
  `IDUnita` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Descrizione` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dump dei dati per la tabella `UnitaOperativa`
--

INSERT INTO `UnitaOperativa` (`IDUnita`, `Descrizione`) VALUES
('Diabetologia', ''),
('Ematologia', ''),
('Medicina', ''),
('Ostetricia e Ginecologia', ''),
('Terapia intensiva', ''),
('Urologia', '');

-- --------------------------------------------------------

--
-- Struttura della tabella `UnitaOperativePerStrutture`
--

CREATE TABLE `UnitaOperativePerStrutture` (
  `ID` int NOT NULL,
  `FK_IDStruttura` char(5) NOT NULL,
  `FK_IDUnita` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Indici per le tabelle scaricate
--

--
-- Indici per le tabelle `AUSL`
--
ALTER TABLE `AUSL`
  ADD PRIMARY KEY (`NomeAUSL`);

--
-- Indici per le tabelle `InterventiPerRicoveri`
--
ALTER TABLE `InterventiPerRicoveri`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `interventi` (`FK_IDIntervento`),
  ADD KEY `ricoveri` (`FK_IDRicovero`);

--
-- Indici per le tabelle `Intervento`
--
ALTER TABLE `Intervento`
  ADD PRIMARY KEY (`IDIntervento`);

--
-- Indici per le tabelle `Paziente`
--
ALTER TABLE `Paziente`
  ADD PRIMARY KEY (`CF`);

--
-- Indici per le tabelle `Ricovero`
--
ALTER TABLE `Ricovero`
  ADD PRIMARY KEY (`IDRicovero`),
  ADD KEY `Unita` (`FK_IDUnita`),
  ADD KEY `Paziente` (`FK_Paziente`);

--
-- Indici per le tabelle `Struttura`
--
ALTER TABLE `Struttura`
  ADD PRIMARY KEY (`IDStruttura`),
  ADD KEY `AUSL` (`FK_NomeAusl`);

--
-- Indici per le tabelle `UnitaOperativa`
--
ALTER TABLE `UnitaOperativa`
  ADD PRIMARY KEY (`IDUnita`);

--
-- Indici per le tabelle `UnitaOperativePerStrutture`
--
ALTER TABLE `UnitaOperativePerStrutture`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `strutture` (`FK_IDStruttura`),
  ADD KEY `unitaoperative` (`FK_IDUnita`);

--
-- AUTO_INCREMENT per le tabelle scaricate
--

--
-- AUTO_INCREMENT per la tabella `InterventiPerRicoveri`
--
ALTER TABLE `InterventiPerRicoveri`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `Intervento`
--
ALTER TABLE `Intervento`
  MODIFY `IDIntervento` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `Ricovero`
--
ALTER TABLE `Ricovero`
  MODIFY `IDRicovero` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT per la tabella `UnitaOperativePerStrutture`
--
ALTER TABLE `UnitaOperativePerStrutture`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT;

--
-- Limiti per le tabelle scaricate
--

--
-- Limiti per la tabella `InterventiPerRicoveri`
--
ALTER TABLE `InterventiPerRicoveri`
  ADD CONSTRAINT `interventi` FOREIGN KEY (`FK_IDIntervento`) REFERENCES `Intervento` (`IDIntervento`) ON DELETE RESTRICT ON UPDATE CASCADE,
  ADD CONSTRAINT `ricoveri` FOREIGN KEY (`FK_IDRicovero`) REFERENCES `Ricovero` (`IDRicovero`) ON DELETE RESTRICT ON UPDATE CASCADE;

--
-- Limiti per la tabella `Ricovero`
--
ALTER TABLE `Ricovero`
  ADD CONSTRAINT `Paziente` FOREIGN KEY (`FK_Paziente`) REFERENCES `Paziente` (`CF`) ON DELETE RESTRICT ON UPDATE CASCADE,
  ADD CONSTRAINT `Unita` FOREIGN KEY (`FK_IDUnita`) REFERENCES `UnitaOperativa` (`IDUnita`) ON DELETE RESTRICT ON UPDATE CASCADE;

--
-- Limiti per la tabella `Struttura`
--
ALTER TABLE `Struttura`
  ADD CONSTRAINT `AUSL` FOREIGN KEY (`FK_NomeAusl`) REFERENCES `AUSL` (`NomeAUSL`) ON DELETE RESTRICT ON UPDATE CASCADE;

--
-- Limiti per la tabella `UnitaOperativePerStrutture`
--
ALTER TABLE `UnitaOperativePerStrutture`
  ADD CONSTRAINT `strutture` FOREIGN KEY (`FK_IDStruttura`) REFERENCES `Struttura` (`IDStruttura`) ON DELETE RESTRICT ON UPDATE CASCADE,
  ADD CONSTRAINT `unitaoperative` FOREIGN KEY (`FK_IDUnita`) REFERENCES `UnitaOperativa` (`IDUnita`) ON DELETE RESTRICT ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
