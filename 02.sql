/**INSERIMENTO DEI TIPI OPERAZIONI*/
INSERT INTO `train_booking`.`tipo_operazione` (`KID`, `DESCRIZIONE`) VALUES ('1', 'Inserimento');
INSERT INTO `train_booking`.`tipo_operazione` (`KID`, `DESCRIZIONE`) VALUES ('2', 'Aggiorna');
INSERT INTO `train_booking`.`tipo_operazione` (`KID`, `DESCRIZIONE`) VALUES ('3', 'Elimina');
COMMIT;

/**INSERIMENTO DELLE CITTA*/
INSERT INTO `train_booking`.`citta` (`KID`, `DESCRIZIONE`) VALUES ('1', 'Roma');
INSERT INTO `train_booking`.`citta` (`KID`, `DESCRIZIONE`) VALUES ('2', 'Milano');
INSERT INTO `train_booking`.`citta` (`KID`, `DESCRIZIONE`) VALUES ('3', 'Torino');
INSERT INTO `train_booking`.`citta` (`KID`, `DESCRIZIONE`) VALUES ('4', 'Firenze');
INSERT INTO `train_booking`.`citta` (`KID`, `DESCRIZIONE`) VALUES ('5', 'Lecce');
INSERT INTO `train_booking`.`citta` (`KID`, `DESCRIZIONE`) VALUES ('6', 'Reggio Calabria');
INSERT INTO `train_booking`.`citta` (`KID`, `DESCRIZIONE`) VALUES ('7', 'Bologna');
INSERT INTO `train_booking`.`citta` (`KID`, `DESCRIZIONE`) VALUES ('8', 'Napoli');
INSERT INTO `train_booking`.`citta` (`KID`, `DESCRIZIONE`) VALUES ('9', 'Genova');
INSERT INTO `train_booking`.`citta` (`KID`, `DESCRIZIONE`) VALUES ('10', 'Verona');
COMMIT;

/**INSERIMENTO DELLE STAZIONI*/
INSERT INTO `train_booking`.`stazioni` (`KID`, `DESCRIZIONE`, `ID_CITTA`) VALUES ('1', 'Roma Termini', '1');
INSERT INTO `train_booking`.`stazioni` (`KID`, `DESCRIZIONE`, `ID_CITTA`) VALUES ('2', 'Roma Tiburtina', '1');
INSERT INTO `train_booking`.`stazioni` (`KID`, `DESCRIZIONE`, `ID_CITTA`) VALUES ('3', 'Milano Centrale', '2');
INSERT INTO `train_booking`.`stazioni` (`KID`, `DESCRIZIONE`, `ID_CITTA`) VALUES ('4', 'Milano Rho ', '2');
INSERT INTO `train_booking`.`stazioni` (`KID`, `DESCRIZIONE`, `ID_CITTA`) VALUES ('5', 'Torino Porta Susa', '3');
INSERT INTO `train_booking`.`stazioni` (`KID`, `DESCRIZIONE`, `ID_CITTA`) VALUES ('6', 'Torino Porta Nuova', '3');
INSERT INTO `train_booking`.`stazioni` (`KID`, `DESCRIZIONE`, `ID_CITTA`) VALUES ('7', 'Firenze Centrale', '4');
INSERT INTO `train_booking`.`stazioni` (`KID`, `DESCRIZIONE`, `ID_CITTA`) VALUES ('8', 'Firenze Santa Maria Novella', '4');
INSERT INTO `train_booking`.`stazioni` (`KID`, `DESCRIZIONE`, `ID_CITTA`) VALUES ('9', 'Lecce Centrale', '5');
INSERT INTO `train_booking`.`stazioni` (`KID`, `DESCRIZIONE`, `ID_CITTA`) VALUES ('10', 'Reggio Calabria Centrale', '6');
INSERT INTO `train_booking`.`stazioni` (`KID`, `DESCRIZIONE`, `ID_CITTA`) VALUES ('11', 'Bologna Centrale', '7');
INSERT INTO `train_booking`.`stazioni` (`KID`, `DESCRIZIONE`, `ID_CITTA`) VALUES ('12', 'Napoli Centrale', '8');
INSERT INTO `train_booking`.`stazioni` (`KID`, `DESCRIZIONE`, `ID_CITTA`) VALUES ('13', 'Genova Piazza Principe', '9');
INSERT INTO `train_booking`.`stazioni` (`KID`, `DESCRIZIONE`, `ID_CITTA`) VALUES ('14', 'Genova Brignole', '9');
INSERT INTO `train_booking`.`stazioni` (`KID`, `DESCRIZIONE`, `ID_CITTA`) VALUES ('15', 'Verona Porta Nuova', '10');
COMMIT;

/**INSERIMENTO DEI TRENI*/
INSERT INTO `train_booking`.`treni` (`KID`, `MODELLO`, `NUMERO_POSTI`, `ANNO_FABBRICAZIONE`) VALUES ('1', 'Frecciarossa 1000', '457', '2025');
INSERT INTO `train_booking`.`treni` (`KID`, `MODELLO`, `NUMERO_POSTI`, `ANNO_FABBRICAZIONE`) VALUES ('2', 'ETR 500', '574', '2025');
INSERT INTO `train_booking`.`treni` (`KID`, `MODELLO`, `NUMERO_POSTI`, `ANNO_FABBRICAZIONE`) VALUES ('3', 'Frecciargento (ETR 485)', '489', '2025');
INSERT INTO `train_booking`.`treni` (`KID`, `MODELLO`, `NUMERO_POSTI`, `ANNO_FABBRICAZIONE`) VALUES ('4', 'Frecciabianca (ETR 460)', '477', '2025');
COMMIT;

/**INSERIMENTO DEI TRATTE*/
INSERT INTO `train_booking`.`tratte` (`KID`, `ID_STAZIONE_DA`, `ID_STAZIONE_A`, `DISTANZA_KM`, `DURATA_PREVISTA_MIN`) VALUES 
(1, 1, 3, 570, 190),  -- Roma Termini → Milano Centrale
(2, 3, 5, 140, 60),   -- Milano Centrale → Torino Porta Susa
(3, 1, 11, 370, 100), -- Roma Termini → Bologna Centrale
(4, 11, 7, 80, 40),   -- Bologna Centrale → Firenze Centrale
(5, 3, 13, 150, 90),  -- Milano Centrale → Genova Piazza Principe
(6, 5, 15, 300, 120), -- Torino Porta Susa → Verona Porta Nuova
(7, 1, 12, 230, 100), -- Roma Termini → Napoli Centrale
(8, 12, 10, 500, 220),-- Napoli Centrale → Reggio Calabria Centrale
(9, 6, 1, 600, 210),  -- Torino Porta Nuova → Roma Termini
(10, 15, 2, 500, 200);-- Verona Porta Nuova → Roma Tiburtina
COMMIT;

/**INSERIMENTO DEI PASSEGGERI*/
INSERT INTO `train_booking`.`passeggeri` (`KID`, `NOME`, `COGNOME`, `CODICE_FISCALE`, `DATA_NASCITA`, `EMAIL`) VALUES
-- OVER 60 (nati prima del 1965)
(1, 'Giuseppe', 'Rossi', 'RSSGPP40A01H501Z', '19400115', 'giuseppe.rossi@email.com'),
(2, 'Maria', 'Bianchi', 'BNCMRA50B52F205Y', '19500220', 'maria.bianchi@email.com'),
(3, 'Antonio', 'Verdi', 'VRDANT58C13D612X', '19580313', 'antonio.verdi@email.com'),
(4, 'Lucia', 'Ferrari', 'FRRLCA62D24E463T', '19620424', 'lucia.ferrari@email.com'),
(5, 'Paolo', 'Gallo', 'GLLPLL63E05F839N', '19630505', 'paolo.gallo@email.com'),
-- UNDER 34 (nati dal 1991 in poi)
(6, 'Chiara', 'Romano', 'RMNCHR99F16G273Q', '19990316', 'chiara.romano@email.com'),
(7, 'Luca', 'Ricci', 'RCCLCU00G27H501D', '20000527', 'luca.ricci@email.com'),
(8, 'Martina', 'Marino', 'MRNMRT98H18I726K', '19981018', 'martina.marino@email.com'),
(9, 'Stefano', 'Greco', 'GRCSTF95I29L781R', '19951029', 'stefano.greco@email.com'),
(10, 'Elisa', 'Bruno', 'BRNELI92L10M082A', '19921210', 'elisa.bruno@email.com'),
-- TRA 36 E 59 (nati tra 1966 e 1989)
(11, 'Simone', 'De Luca', 'DLCSMN85M21N525H', '19850321', 'simone.deluca@email.com'),
(12, 'Ilaria', 'Fontana', 'FNTILR84N02O716E', '19841102', 'ilaria.fontana@email.com'),
(13, 'Andrea', 'Sartori', 'SRTAND80O13P034U', '19801013', 'andrea.sartori@email.com'),
(14, 'Laura', 'Conti', 'CNTLRA74P24Q089Z', '19740224', 'laura.conti@email.com'),
(15, 'Giorgio', 'Moretti', 'MRTGRG70Q05R324C', '19700305', 'giorgio.moretti@email.com'),
(16, 'Valentina', 'Gentile', 'GNTVLN67R16S229V', '19670316', 'valentina.gentile@email.com'),
(17, 'Davide', 'Riva', 'RVADVD75S27T501T', '19750327', 'davide.riva@email.com'),
(18, 'Roberta', 'Longo', 'LNGRBT73T08U018N', '19731008', 'roberta.longo@email.com'),
(19, 'Federico', 'Sanna', 'SNNFDR79U19V739S', '19791119', 'federico.sanna@email.com'),
(20, 'Alessandra', 'Bianco', 'BNCALS78V30W501R', '19781130', 'alessandra.bianco@email.com');
COMMIT;

/**INSERIMENTO DEI TARIFFA*/
INSERT INTO `train_booking`.`tariffa` (`KID`, `DESCRIZIONE`) VALUES ('1', 'Standard');
INSERT INTO `train_booking`.`tariffa` (`KID`, `DESCRIZIONE`, `ETA_MAX`) VALUES ('2', 'Young', '35');
INSERT INTO `train_booking`.`tariffa` (`KID`, `DESCRIZIONE`, `ETA_MIN`) VALUES ('3', 'Over 60', '60');
COMMIT;

/**INSERIMENTO DEI CLASSE*/
INSERT INTO `train_booking`.`classe` (`KID`, `DESCRIZIONE`) VALUES ('1', 'Executive');
INSERT INTO `train_booking`.`classe` (`KID`, `DESCRIZIONE`) VALUES ('2', 'Business');
INSERT INTO `train_booking`.`classe` (`KID`, `DESCRIZIONE`) VALUES ('3', 'Premium');
INSERT INTO `train_booking`.`classe` (`KID`, `DESCRIZIONE`) VALUES ('4', 'Standard');
COMMIT;

/**INSERIMENTO DELLE TRATTE*/
-- Tratte singole base
INSERT INTO `train_booking`.`tratte` (`KID`, `STAZIONE_PARTENZA`, `STAZIONE_ARRIVO`, `DURATA_MINUTI`) VALUES 
(1, 'Roma', 'Milano', 180),          -- Roma - Milano diretta
(2, 'Milano', 'Torino', 90),         -- Milano - Torino
(3, 'Roma', 'Bologna', 120),         -- Roma - Bologna
(4, 'Bologna', 'Firenze', 45),       -- Bologna - Firenze
(5, 'Milano', 'Genova', 105),        -- Milano - Genova
(6, 'Torino', 'Verona', 150),        -- Torino - Verona
(7, 'Roma', 'Napoli', 90),           -- Roma - Napoli
(8, 'Napoli', 'Reggio Calabria', 240), -- Napoli - Reggio Calabria
-- Tratte aggiuntive per percorsi multitratta logici
(9, 'Roma', 'Firenze', 90),          -- Roma - Firenze
(10, 'Firenze', 'Milano', 120),      -- Firenze - Milano
(11, 'Milano', 'Bologna', 60),       -- Milano - Bologna
(12, 'Bologna', 'Roma', 120),        -- Bologna - Roma (inverso di 3)
(13, 'Milano', 'Roma', 180),         -- Milano - Roma (inverso di 1)
(14, 'Firenze', 'Roma', 90),         -- Firenze - Roma (inverso di 9)
(15, 'Firenze', 'Bologna', 45);      -- Firenze - Bologna (inverso di 4)
COMMIT;

/** INSERIMENTO DEI PERCORSI */
INSERT INTO `train_booking`.`percorsi` (`KID`, `DESCRIZIONE`) VALUES 
-- Percorsi con una sola tratta
(1, 'Roma - Milano'),                 -- Tratta diretta 1
(2, 'Milano - Torino'),               -- Tratta diretta 2
(3, 'Roma - Bologna'),                -- Tratta diretta 3
(4, 'Bologna - Firenze'),             -- Tratta diretta 4
(5, 'Milano - Genova'),               -- Tratta diretta 5
(6, 'Torino - Verona'),               -- Tratta diretta 6
(7, 'Roma - Napoli'),                 -- Tratta diretta 7
(8, 'Napoli - Reggio Calabria'),      -- Tratta diretta 8
(9, 'Roma - Firenze'),                -- Tratta diretta 9
-- Percorsi con due tratte (CORRETTI)
(10, 'Milano - Firenze'),             -- Milano→Bologna + Bologna→Firenze
(11, 'Roma - Reggio Calabria'),       -- Roma→Napoli + Napoli→Reggio Calabria
-- Percorsi con tre tratte (CORRETTI)
(12, 'Milano - Reggio Calabria');     -- Milano→Roma + Roma→Napoli + Napoli→Reggio Calabria
COMMIT;

/** INSERIMENTO IN PERCORSO-TRATTE */
INSERT INTO `train_booking`.`percorso_tratte` (`KID`, `ID_PERCORSO`, `ID_TRATTA`, `ORDINE`) VALUES 
-- Percorsi con una tratta
(1, 1, 1, 1),    -- Roma - Milano (tratta 1)
(2, 2, 2, 1),    -- Milano - Torino (tratta 2)
(3, 3, 3, 1),    -- Roma - Bologna (tratta 3)
(4, 4, 4, 1),    -- Bologna - Firenze (tratta 4)
(5, 5, 5, 1),    -- Milano - Genova (tratta 5)
(6, 6, 6, 1),    -- Torino - Verona (tratta 6)
(7, 7, 7, 1),    -- Roma - Napoli (tratta 7)
(8, 8, 8, 1),    -- Napoli - Reggio Calabria (tratta 8)
(9, 9, 9, 1),    -- Roma - Firenze (tratta 9)
-- Percorsi con due tratte (CORRETTI)
(10, 10, 11, 1), -- Milano - Firenze: Milano→Bologna (ordine 1)
(11, 10, 4, 2),  -- Milano - Firenze: Bologna→Firenze (ordine 2)
(12, 11, 7, 1),  -- Roma - Reggio Calabria: Roma→Napoli (ordine 1)
(13, 11, 8, 2),  -- Roma - Reggio Calabria: Napoli→Reggio Calabria (ordine 2)
-- Percorsi con tre tratte (CORRETTI)
(14, 12, 13, 1), -- Milano - Reggio Calabria: Milano→Roma (ordine 1)
(15, 12, 7, 2),  -- Milano - Reggio Calabria: Roma→Napoli (ordine 2)
(16, 12, 8, 3);  -- Milano - Reggio Calabria: Napoli→Reggio Calabria (ordine 3)
COMMIT;

/** INSERIMENTO IN PERCORSO-TARIFFA-CLASSE*/
INSERT INTO `train_booking`.`percorso_tariffa_classe` (`KID`, `ID_PERCORSO`, `ID_TARIFFA`, `ID_CLASSE`, `IMPORTO`) VALUES 
-- Percorso 1: Roma - Milano
(1, 1, 1, 1, 150.00),   -- Standard - Executive
(2, 1, 1, 2, 120.00),   -- Standard - Business
(3, 1, 1, 3, 90.00),    -- Standard - Premium
(4, 1, 1, 4, 65.00),    -- Standard - Standard
(5, 1, 2, 1, 135.00),   -- Young - Executive
(6, 1, 2, 2, 108.00),   -- Young - Business
(7, 1, 2, 3, 81.00),    -- Young - Premium
(8, 1, 2, 4, 58.50),    -- Young - Standard
(9, 1, 3, 1, 127.50),   -- Over 60 - Executive
(10, 1, 3, 2, 102.00),  -- Over 60 - Business
(11, 1, 3, 3, 76.50),   -- Over 60 - Premium
(12, 1, 3, 4, 55.25),   -- Over 60 - Standard

-- Percorso 2: Milano - Torino
(13, 2, 1, 1, 80.00),   -- Standard - Executive
(14, 2, 1, 2, 65.00),   -- Standard - Business
(15, 2, 1, 3, 50.00),   -- Standard - Premium
(16, 2, 1, 4, 35.00),   -- Standard - Standard
(17, 2, 2, 1, 72.00),   -- Young - Executive
(18, 2, 2, 2, 58.50),   -- Young - Business
(19, 2, 2, 3, 45.00),   -- Young - Premium
(20, 2, 2, 4, 31.50),   -- Young - Standard
(21, 2, 3, 1, 68.00),   -- Over 60 - Executive
(22, 2, 3, 2, 55.25),   -- Over 60 - Business
(23, 2, 3, 3, 42.50),   -- Over 60 - Premium
(24, 2, 3, 4, 29.75),   -- Over 60 - Standard

-- Percorso 3: Roma - Bologna
(25, 3, 1, 1, 95.00),   -- Standard - Executive
(26, 3, 1, 2, 75.00),   -- Standard - Business
(27, 3, 1, 3, 58.00),   -- Standard - Premium
(28, 3, 1, 4, 42.00),   -- Standard - Standard
(29, 3, 2, 1, 85.50),   -- Young - Executive
(30, 3, 2, 2, 67.50),   -- Young - Business
(31, 3, 2, 3, 52.20),   -- Young - Premium
(32, 3, 2, 4, 37.80),   -- Young - Standard
(33, 3, 3, 1, 80.75),   -- Over 60 - Executive
(34, 3, 3, 2, 63.75),   -- Over 60 - Business
(35, 3, 3, 3, 49.30),   -- Over 60 - Premium
(36, 3, 3, 4, 35.70),   -- Over 60 - Standard

-- Percorso 4: Bologna - Firenze
(37, 4, 1, 1, 70.00),   -- Standard - Executive
(38, 4, 1, 2, 55.00),   -- Standard - Business
(39, 4, 1, 3, 42.00),   -- Standard - Premium
(40, 4, 1, 4, 30.00),   -- Standard - Standard
(41, 4, 2, 1, 63.00),   -- Young - Executive
(42, 4, 2, 2, 49.50),   -- Young - Business
(43, 4, 2, 3, 37.80),   -- Young - Premium
(44, 4, 2, 4, 27.00),   -- Young - Standard
(45, 4, 3, 1, 59.50),   -- Over 60 - Executive
(46, 4, 3, 2, 46.75),   -- Over 60 - Business
(47, 4, 3, 3, 35.70),   -- Over 60 - Premium
(48, 4, 3, 4, 25.50),   -- Over 60 - Standard

-- Percorso 5: Milano - Genova
(49, 5, 1, 1, 85.00),   -- Standard - Executive
(50, 5, 1, 2, 68.00),   -- Standard - Business
(51, 5, 1, 3, 52.00),   -- Standard - Premium
(52, 5, 1, 4, 38.00),   -- Standard - Standard
(53, 5, 2, 1, 76.50),   -- Young - Executive
(54, 5, 2, 2, 61.20),   -- Young - Business
(55, 5, 2, 3, 46.80),   -- Young - Premium
(56, 5, 2, 4, 34.20),   -- Young - Standard
(57, 5, 3, 1, 72.25),   -- Over 60 - Executive
(58, 5, 3, 2, 57.80),   -- Over 60 - Business
(59, 5, 3, 3, 44.20),   -- Over 60 - Premium
(60, 5, 3, 4, 32.30),   -- Over 60 - Standard

-- Percorso 6: Torino - Verona
(61, 6, 1, 1, 110.00),  -- Standard - Executive
(62, 6, 1, 2, 88.00),   -- Standard - Business
(63, 6, 1, 3, 68.00),   -- Standard - Premium
(64, 6, 1, 4, 48.00),   -- Standard - Standard
(65, 6, 2, 1, 99.00),   -- Young - Executive
(66, 6, 2, 2, 79.20),   -- Young - Business
(67, 6, 2, 3, 61.20),   -- Young - Premium
(68, 6, 2, 4, 43.20),   -- Young - Standard
(69, 6, 3, 1, 93.50),   -- Over 60 - Executive
(70, 6, 3, 2, 74.80),   -- Over 60 - Business
(71, 6, 3, 3, 57.80),   -- Over 60 - Premium
(72, 6, 3, 4, 40.80),   -- Over 60 - Standard

-- Percorso 7: Roma - Napoli
(73, 7, 1, 1, 85.00),   -- Standard - Executive
(74, 7, 1, 2, 68.00),   -- Standard - Business
(75, 7, 1, 3, 52.00),   -- Standard - Premium
(76, 7, 1, 4, 38.00),   -- Standard - Standard
(77, 7, 2, 1, 76.50),   -- Young - Executive
(78, 7, 2, 2, 61.20),   -- Young - Business
(79, 7, 2, 3, 46.80),   -- Young - Premium
(80, 7, 2, 4, 34.20),   -- Young - Standard
(81, 7, 3, 1, 72.25),   -- Over 60 - Executive
(82, 7, 3, 2, 57.80),   -- Over 60 - Business
(83, 7, 3, 3, 44.20),   -- Over 60 - Premium
(84, 7, 3, 4, 32.30),   -- Over 60 - Standard

-- Percorso 8: Napoli - Reggio Calabria
(85, 8, 1, 1, 140.00),  -- Standard - Executive
(86, 8, 1, 2, 115.00),  -- Standard - Business
(87, 8, 1, 3, 88.00),   -- Standard - Premium
(88, 8, 1, 4, 62.00),   -- Standard - Standard
(89, 8, 2, 1, 126.00),  -- Young - Executive
(90, 8, 2, 2, 103.50),  -- Young - Business
(91, 8, 2, 3, 79.20),   -- Young - Premium
(92, 8, 2, 4, 55.80),   -- Young - Standard
(93, 8, 3, 1, 119.00),  -- Over 60 - Executive
(94, 8, 3, 2, 97.75),   -- Over 60 - Business
(95, 8, 3, 3, 74.80),   -- Over 60 - Premium
(96, 8, 3, 4, 52.70),   -- Over 60 - Standard

-- Percorso 9: Roma - Firenze (tratta singola)
(97, 9, 1, 1, 75.00),   -- Standard - Executive
(98, 9, 1, 2, 60.00),   -- Standard - Business
(99, 9, 1, 3, 45.00),   -- Standard - Premium
(100, 9, 1, 4, 32.00),  -- Standard - Standard
(101, 9, 2, 1, 67.50),  -- Young - Executive
(102, 9, 2, 2, 54.00),  -- Young - Business
(103, 9, 2, 3, 40.50),  -- Young - Premium
(104, 9, 2, 4, 28.80),  -- Young - Standard
(105, 9, 3, 1, 63.75),  -- Over 60 - Executive
(106, 9, 3, 2, 51.00),  -- Over 60 - Business
(107, 9, 3, 3, 38.25),  -- Over 60 - Premium
(108, 9, 3, 4, 27.20),  -- Over 60 - Standard

-- Percorso 10: Milano - Firenze (2 tratte: Milano→Bologna + Bologna→Firenze)
(109, 10, 1, 1, 165.00), -- Standard - Executive
(110, 10, 1, 2, 130.00), -- Standard - Business
(111, 10, 1, 3, 100.00), -- Standard - Premium
(112, 10, 1, 4, 72.00),  -- Standard - Standard
(113, 10, 2, 1, 148.50), -- Young - Executive
(114, 10, 2, 2, 117.00), -- Young - Business
(115, 10, 2, 3, 90.00),  -- Young - Premium
(116, 10, 2, 4, 64.80),  -- Young - Standard
(117, 10, 3, 1, 140.25), -- Over 60 - Executive
(118, 10, 3, 2, 110.50), -- Over 60 - Business
(119, 10, 3, 3, 85.00),  -- Over 60 - Premium
(120, 10, 3, 4, 61.20),  -- Over 60 - Standard

-- Percorso 11: Roma - Reggio Calabria (2 tratte: Roma→Napoli + Napoli→Reggio Calabria)
(121, 11, 1, 1, 225.00), -- Standard - Executive
(122, 11, 1, 2, 183.00), -- Standard - Business
(123, 11, 1, 3, 140.00), -- Standard - Premium
(124, 11, 1, 4, 100.00), -- Standard - Standard
(125, 11, 2, 1, 202.50), -- Young - Executive
(126, 11, 2, 2, 164.70), -- Young - Business
(127, 11, 2, 3, 126.00), -- Young - Premium
(128, 11, 2, 4, 90.00),  -- Young - Standard
(129, 11, 3, 1, 191.25), -- Over 60 - Executive
(130, 11, 3, 2, 155.55), -- Over 60 - Business
(131, 11, 3, 3, 119.00), -- Over 60 - Premium
(132, 11, 3, 4, 85.00),  -- Over 60 - Standard

-- Percorso 12: Milano - Reggio Calabria (3 tratte: Milano→Roma + Roma→Napoli + Napoli→Reggio Calabria)
(133, 12, 1, 1, 375.00), -- Standard - Executive
(134, 12, 1, 2, 303.00), -- Standard - Business
(135, 12, 1, 3, 230.00), -- Standard - Premium
(136, 12, 1, 4, 165.00), -- Standard - Standard
(137, 12, 2, 1, 337.50), -- Young - Executive
(138, 12, 2, 2, 272.70), -- Young - Business
(139, 12, 2, 3, 207.00), -- Young - Premium
(140, 12, 2, 4, 148.50), -- Young - Standard
(141, 12, 3, 1, 318.75), -- Over 60 - Executive
(142, 12, 3, 2, 257.55), -- Over 60 - Business
(143, 12, 3, 3, 195.50), -- Over 60 - Premium
(144, 12, 3, 4, 140.25); -- Over 60 - Standard
COMMIT;

/** INSERIMENTO DEI BIGLIETTI*/
INSERT INTO `train_booking`.`biglietti` (`KID`, `ID_PASSEGGERO`, `ID_TRENO`, `ID_PERCORSO_TARIFFA_CLASSE`, `POSTO`, `DATA_BIGLIETTO`, `DATA_ACQUISTO`, `DATA_CANCELLAZIONE`) VALUES 
(1, 1, 1, 9, '12A', '20250115084500', '20250110153000', NULL),     -- Giuseppe (Over 60) - Roma-Milano Executive
(2, 2, 2, 22, '8B', '20250218091500', '20250213104500', NULL),     -- Maria (Over 60) - Milano-Torino Business
(3, 3, 3, 35, '15C', '20250322143000', '20250317162000', NULL),    -- Antonio (Over 60) - Roma-Bologna Premium
(4, 4, 1, 46, '22D', '20250425101500', '20250420093000', NULL),    -- Lucia (Over 60) - Bologna-Firenze Business
(5, 5, 4, 60, '9A', '20250528170000', '20250523141500', NULL),     -- Paolo (Over 60) - Milano-Genova Standard
(6, 6, 2, 7, '18B', '20250130113000', '20250125174500', NULL),     -- Chiara (Young) - Roma-Milano Premium
(7, 7, 1, 20, '5C', '20250205074500', '20250131190000', NULL),     -- Luca (Young) - Milano-Torino Standard
(8, 8, 3, 31, '11D', '20250312160000', '20250307133000', NULL),    -- Martina (Young) - Roma-Bologna Business
(9, 9, 2, 43, '7A', '20250415125000', '20250410201500', NULL),     -- Stefano (Young) - Bologna-Firenze Premium
(10, 10, 4, 56, '14B', '20250520183000', '20250515110000', NULL),  -- Elisa (Young) - Milano-Genova Standard
(11, 11, 1, 4, '20C', '20250208094500', '20250203165000', NULL),   -- Simone (Standard) - Roma-Milano Standard
(12, 12, 3, 26, '3D', '20250318154500', '20250313122000', NULL),   -- Ilaria (Standard) - Roma-Bologna Business
(13, 13, 2, 38, '16A', '20250422120000', '20250417085000', NULL),  -- Andrea (Standard) - Bologna-Firenze Executive
(14, 14, 4, 52, '6B', '20250525134500', '20250520195500', NULL),   -- Laura (Standard) - Milano-Genova Premium
(15, 15, 1, 64, '13C', '20250128104500', '20250123131500', NULL),  -- Giorgio (Standard) - Torino-Verona Standard
(16, 16, 2, 74, '19D', '20250225142000', '20250220171000', NULL),  -- Valentina (Standard) - Roma-Napoli Business
(17, 17, 3, 86, '4A', '20250328105500', '20250323145000', NULL),   -- Davide (Standard) - Napoli-Reggio Calabria Business
(18, 18, 1, 99, '21B', '20250430173000', '20250425112500', NULL),  -- Roberta (Standard) - Roma-Firenze Premium
(19, 19, 4, 112, '8C', '20250605081500', '20250531184000', NULL),  -- Federico (Standard) - Milano-Firenze Standard
(20, 20, 2, 124, '17D', '20250615151500', '20250610103500', NULL); -- Alessandra (Standard) - Roma-Reggio Calabria Standard

/** INSERIMENTO DEI BIGLIETTI_JN (JOURNAL)*/
INSERT INTO `train_booking`.`biglietti_jn` (`KID`, `ID_BIGLIETTO_JN`, `ID_PASSEGGERO`, `ID_TRENO`, `ID_PERCORSO_TARIFFA_CLASSE`, `POSTO`, `DATA_BIGLIETTO`, `DATA_OPERAZIONE`, `ID_TIPO_OPERAZIONE`) VALUES 
(1, 1, 1, 1, 9, '12A', '20250115084500', '20250110153000', 1),     -- Inserimento biglietto Giuseppe
(2, 2, 2, 2, 22, '8B', '20250218091500', '20250213104500', 1),     -- Inserimento biglietto Maria
(3, 3, 3, 3, 35, '15C', '20250322143000', '20250317162000', 1),    -- Inserimento biglietto Antonio
(4, 4, 4, 1, 46, '22D', '20250425101500', '20250420093000', 1),    -- Inserimento biglietto Lucia
(5, 5, 5, 4, 60, '9A', '20250528170000', '20250523141500', 1),     -- Inserimento biglietto Paolo
(6, 6, 6, 2, 7, '18B', '20250130113000', '20250125174500', 1),     -- Inserimento biglietto Chiara
(7, 7, 7, 1, 20, '5C', '20250205074500', '20250131190000', 1),     -- Inserimento biglietto Luca
(8, 8, 8, 3, 31, '11D', '20250312160000', '20250307133000', 1),    -- Inserimento biglietto Martina
(9, 9, 9, 2, 43, '7A', '20250415125000', '20250410201500', 1),     -- Inserimento biglietto Stefano
(10, 10, 10, 4, 56, '14B', '20250520183000', '20250515110000', 1), -- Inserimento biglietto Elisa
(11, 11, 11, 1, 4, '20C', '20250208094500', '20250203165000', 1),  -- Inserimento biglietto Simone
(12, 12, 12, 3, 26, '3D', '20250318154500', '20250313122000', 1),  -- Inserimento biglietto Ilaria
(13, 13, 13, 2, 38, '16A', '20250422120000', '20250417085000', 1), -- Inserimento biglietto Andrea
(14, 14, 14, 4, 52, '6B', '20250525134500', '20250520195500', 1),  -- Inserimento biglietto Laura
(15, 15, 15, 1, 64, '13C', '20250128104500', '20250123131500', 1), -- Inserimento biglietto Giorgio
(16, 16, 16, 2, 74, '19D', '20250225142000', '20250220171000', 1), -- Inserimento biglietto Valentina
(17, 17, 17, 3, 86, '4A', '20250328105500', '20250323145000', 1),  -- Inserimento biglietto Davide
(18, 18, 18, 1, 99, '21B', '20250430173000', '20250425112500', 1), -- Inserimento biglietto Roberta
(19, 19, 19, 4, 112, '8C', '20250605081500', '20250531184000', 1), -- Inserimento biglietto Federico
(20, 20, 20, 2, 124, '17D', '20250615151500', '20250610103500', 1);-- Inserimento biglietto Alessandra
COMMIT;

-- Aggiorna la data cancellazione del biglietto con KID=1
UPDATE train_booking.biglietti SET DATA_CANCELLAZIONE = '20250621120000' WHERE KID = 1;
COMMIT;
-- Inserisce nella JN
INSERT INTO train_booking.biglietti_jn (KID, ID_BIGLIETTO_JN, ID_PASSEGGERO, ID_TRENO, ID_PERCORSO_TARIFFA_CLASSE, POSTO, DATA_BIGLIETTO, DATA_OPERAZIONE, ID_TIPO_OPERAZIONE) VALUES
(21, 20, 10, 4, 5, 'd20', '20250630090000', '20250621120000', 2);
COMMIT;