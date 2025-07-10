/**CREAZIONE DELLO SCHEMA DI PRENOTAZIONE BIGLIETTI TRENO */
CREATE SCHEMA `train_booking`;

/**CREAZIONE DELLA TABELLA TIPO_OPERAZIONE */
CREATE TABLE `train_booking`.`tipo_operazione` (
  `KID` INT NOT NULL AUTO_INCREMENT COMMENT 'Chiave primaria della tabella',
  `DESCRIZIONE` VARCHAR(200) NOT NULL COMMENT 'Descrizione dell''operazione',
  PRIMARY KEY (`KID`))
COMMENT = 'Tabella anagrafica delle operazione';

-- Indice per ricerche per descrizione operazione
CREATE INDEX `idx_tipo_operazione_descrizione` ON `train_booking`.`tipo_operazione` (`DESCRIZIONE`);

/**CREAZIONE DELLA TABELLA CITTA */
CREATE TABLE `train_booking`.`citta` (
  `KID` INT NOT NULL COMMENT 'Chiave primaria della tabella',
  `DESCRIZIONE` VARCHAR(200) NOT NULL COMMENT 'Descrizione della citta',
  PRIMARY KEY (`KID`))
COMMENT = 'Tabella anagrafica delle citta';

-- Indice per ricerche per nome città
CREATE INDEX `idx_citta_descrizione` ON `train_booking`.`citta` (`DESCRIZIONE`);

/**CREAZIONE DELLA TABELLA STAZIONI */
CREATE TABLE `train_booking`.`stazioni` (
  `KID` INT NOT NULL COMMENT 'Chiave primaria della tabella',
  `DESCRIZIONE` VARCHAR(200) NOT NULL COMMENT 'Descrizione della stazione',
  `ID_CITTA` INT NOT NULL COMMENT 'Chiave di riferimento della tabella città',
  PRIMARY KEY (`KID`),
  FOREIGN KEY (ID_CITTA) REFERENCES citta(KID))
COMMENT = 'Tabella anagrafica delle stazioni';

-- Indici per ottimizzare le ricerche
CREATE INDEX `idx_stazioni_id_citta` ON `train_booking`.`stazioni` (`ID_CITTA`);
CREATE INDEX `idx_stazioni_descrizione` ON `train_booking`.`stazioni` (`DESCRIZIONE`);
CREATE INDEX `idx_stazioni_citta_desc` ON `train_booking`.`stazioni` (`ID_CITTA`, `DESCRIZIONE`);

/**CREAZIONE DELLA TABELLA TRENI */
CREATE TABLE `train_booking`.`treni` (
  `KID` INT NOT NULL COMMENT 'Chiave primaria della tabella',
  `MODELLO` VARCHAR(200) NOT NULL COMMENT 'Modello della treno',
  `NUMERO_POSTI` INT NOT NULL COMMENT 'Numero di posti diposibili sul treno',
  `ANNO_FABBRICAZIONE` INT NOT NULL COMMENT 'Anno di fabbricazione del treno',
  PRIMARY KEY (`KID`))
COMMENT = 'Tabella anagrafica dei treni';

-- Indici per ricerche su modello, numero posti e anno
CREATE INDEX `idx_treni_modello` ON `train_booking`.`treni` (`MODELLO`);
CREATE INDEX `idx_treni_numero_posti` ON `train_booking`.`treni` (`NUMERO_POSTI`);
CREATE INDEX `idx_treni_anno_fabbricazione` ON `train_booking`.`treni` (`ANNO_FABBRICAZIONE`);

/**CREAZIONE DELLA TABELLA TRATTE */
CREATE TABLE `train_booking`.`tratte` (
  `KID` INT NOT NULL COMMENT 'Chiave primaria della tabella',
  `ID_STAZIONE_DA` INT NOT NULL COMMENT 'Chiave di riferimento della tabella stazioni, indica la stazione di partenza',
  `ID_STAZIONE_A` INT NOT NULL COMMENT 'Chiave di riferimento della tabella stazioni, indica la stazione di arrivo',
  `DISTANZA_KM` INT NOT NULL COMMENT 'Distanza tra la stazione di partenza e quella di arrivo',
  `DURATA_PREVISTA_MIN` INT NOT NULL COMMENT 'Durata prevista per la tratta',
  PRIMARY KEY (`KID`),
  FOREIGN KEY (ID_STAZIONE_DA) REFERENCES stazioni(KID),
  FOREIGN KEY (ID_STAZIONE_A) REFERENCES stazioni(KID))
COMMENT = 'Tabella anagrafica delle tratte';

-- Indici cruciali per le ricerche di tratte
CREATE INDEX `idx_tratte_stazione_da` ON `train_booking`.`tratte` (`ID_STAZIONE_DA`);
CREATE INDEX `idx_tratte_stazione_a` ON `train_booking`.`tratte` (`ID_STAZIONE_A`);
CREATE INDEX `idx_tratte_da_a` ON `train_booking`.`tratte` (`ID_STAZIONE_DA`, `ID_STAZIONE_A`);
CREATE INDEX `idx_tratte_distanza` ON `train_booking`.`tratte` (`DISTANZA_KM`);
CREATE INDEX `idx_tratte_durata` ON `train_booking`.`tratte` (`DURATA_PREVISTA_MIN`);

/**CREAZIONE DELLA TABELLA PERCORSI */
CREATE TABLE `train_booking`.`percorsi` (
  `KID` INT NOT NULL COMMENT 'Chiave primaria della tabella',
  `DESCRIZIONE` VARCHAR(200) NOT NULL COMMENT 'Descrizione del percorso',
 PRIMARY KEY (`KID`));

-- Indice per ricerche per descrizione percorso
CREATE INDEX `idx_percorsi_descrizione` ON `train_booking`.`percorsi` (`DESCRIZIONE`);
 
/**CREAZIONE DELLA TABELLA PERCORSO_TRATTE */
CREATE TABLE `train_booking`.`percorso_tratte` (
  `KID` INT NOT NULL COMMENT 'Chiave primaria della tabella',
  `ID_PERCORSO` INT NOT NULL COMMENT 'Chiave di riferimento della tabella percorsi',
  `ID_TRATTA` INT NOT NULL COMMENT 'Chiave di riferimento della tabella tratte',
  `ORDINE` INT NOT NULL COMMENT 'Ordine della tratta del percorso',
 PRIMARY KEY (`KID`),
  FOREIGN KEY (ID_PERCORSO) REFERENCES percorsi(KID),
  FOREIGN KEY (ID_TRATTA) REFERENCES tratte(KID));

-- Indici per ottimizzare le join e ordinamenti
CREATE INDEX `idx_percorso_tratte_percorso` ON `train_booking`.`percorso_tratte` (`ID_PERCORSO`);
CREATE INDEX `idx_percorso_tratte_tratta` ON `train_booking`.`percorso_tratte` (`ID_TRATTA`);
CREATE INDEX `idx_percorso_tratte_ordine` ON `train_booking`.`percorso_tratte` (`ID_PERCORSO`, `ORDINE`);
CREATE UNIQUE INDEX `idx_percorso_tratte_unique` ON `train_booking`.`percorso_tratte` (`ID_PERCORSO`, `ID_TRATTA`);

/**CREAZIONE DELLA TABELLA PASSEGGERI */
CREATE TABLE `train_booking`.`passeggeri` (
  `KID` INT NOT NULL COMMENT 'Chiave primaria della tabella',
  `NOME` VARCHAR(200) NOT NULL COMMENT 'Nome del passeggero',
  `COGNOME` VARCHAR(200) NOT NULL COMMENT 'Cagnome del passeggero',
  `CODICE_FISCALE` VARCHAR(16) NOT NULL COMMENT 'Codice fiscale del passeggero',
  `DATA_NASCITA` VARCHAR(14) NOT NULL COMMENT 'Data di nascita del passeggero',
  `EMAIL` VARCHAR(200) NOT NULL COMMENT 'Email del passeggero',
  PRIMARY KEY (`KID`))
COMMENT = 'Tabella anagrafica dei passeggeri';

-- Indici per ricerche frequenti sui passeggeri
CREATE UNIQUE INDEX `idx_passeggeri_codice_fiscale` ON `train_booking`.`passeggeri` (`CODICE_FISCALE`);
CREATE INDEX `idx_passeggeri_email` ON `train_booking`.`passeggeri` (`EMAIL`);
CREATE INDEX `idx_passeggeri_nome_cognome` ON `train_booking`.`passeggeri` (`NOME`, `COGNOME`);
CREATE INDEX `idx_passeggeri_data_nascita` ON `train_booking`.`passeggeri` (`DATA_NASCITA`);
  
/**CREAZIONE DELLA TABELLA TARIFFA */
CREATE TABLE `train_booking`.`tariffa` (
  `KID` INT NOT NULL COMMENT 'Chiave primaria della tabella',
  `DESCRIZIONE` VARCHAR(200) NOT NULL COMMENT 'Descrizione della tariffa',
  `ETA_MAX` INT COMMENT 'Età massima per accedere alla tariffa',
  `ETA_MIN` INT COMMENT 'Età minima per accedere alla tariffa',
  PRIMARY KEY (`KID`))
COMMENT = 'Tabella anagrafica delle tariffe';

-- Indici per ricerche su tariffe
CREATE INDEX `idx_tariffa_descrizione` ON `train_booking`.`tariffa` (`DESCRIZIONE`);
CREATE INDEX `idx_tariffa_eta_max` ON `train_booking`.`tariffa` (`ETA_MAX`);
CREATE INDEX `idx_tariffa_eta_min` ON `train_booking`.`tariffa` (`ETA_MIN`);
CREATE INDEX `idx_tariffa_eta_range` ON `train_booking`.`tariffa` (`ETA_MIN`, `ETA_MAX`);
  
/**CREAZIONE DELLA TABELLA CLASSE */
CREATE TABLE `train_booking`.`classe` (
  `KID` INT NOT NULL COMMENT 'Chiave primaria della tabella',
  `DESCRIZIONE` VARCHAR(200) NOT NULL COMMENT 'Descrizione della classe',
  PRIMARY KEY (`KID`))
COMMENT = 'Tabella anagrafica delle classi';

-- Indice per ricerche per descrizione classe
CREATE INDEX `idx_classe_descrizione` ON `train_booking`.`classe` (`DESCRIZIONE`);

/**CREAZIONE DELLA TABELLA PERCORSO_TARIFFA_CLASSE */
CREATE TABLE `train_booking`.`percorso_tariffa_classe` (
  `KID` INT NOT NULL COMMENT 'Chiave primaria della tabella',
  `ID_PERCORSO` INT NOT NULL COMMENT 'Chiave di riferimento della tabella percorsi, indica il percorso del biglietto',
  `ID_TARIFFA` INT NOT NULL COMMENT 'Chiave di riferimento della tabella tariffe, indica la tariffa del biglietto',
  `ID_CLASSE` INT NOT NULL COMMENT 'Chiave di riferimento della tabella classe, indica la classe',
  `IMPORTO` DECIMAL(10,2) NOT NULL COMMENT 'Importo da pagare',
  PRIMARY KEY (`KID`),
  FOREIGN KEY (ID_PERCORSO) REFERENCES percorsi(KID),
  FOREIGN KEY (ID_TARIFFA) REFERENCES tariffa(KID),
  FOREIGN KEY (ID_CLASSE) REFERENCES classe(KID))
COMMENT = 'Tabella di cross tra percorso, tariffe e classi';

-- Indici per ottimizzare ricerche di prezzi
CREATE INDEX `idx_ptc_percorso` ON `train_booking`.`percorso_tariffa_classe` (`ID_PERCORSO`);
CREATE INDEX `idx_ptc_tariffa` ON `train_booking`.`percorso_tariffa_classe` (`ID_TARIFFA`);
CREATE INDEX `idx_ptc_classe` ON `train_booking`.`percorso_tariffa_classe` (`ID_CLASSE`);
CREATE INDEX `idx_ptc_importo` ON `train_booking`.`percorso_tariffa_classe` (`IMPORTO`);
CREATE UNIQUE INDEX `idx_ptc_unique` ON `train_booking`.`percorso_tariffa_classe` (`ID_PERCORSO`, `ID_TARIFFA`, `ID_CLASSE`);
CREATE INDEX `idx_ptc_percorso_classe` ON `train_booking`.`percorso_tariffa_classe` (`ID_PERCORSO`, `ID_CLASSE`);
  
/**CREAZIONE DELLA TABELLA BIGLIETTI */
CREATE TABLE `train_booking`.`biglietti` (
  `KID` INT NOT NULL COMMENT 'Chiave primaria della tabella',
  `ID_PASSEGGERO` INT NOT NULL COMMENT 'Chiave di riferimento della tabella passeggeri',
  `ID_TRENO` INT NOT NULL COMMENT 'Chiave di riferimento della tabella treni',
  `ID_PERCORSO_TARIFFA_CLASSE` INT NOT NULL COMMENT 'Chiave di riferimento della tabella percorso_tariffa_classe',
  `POSTO` VARCHAR(3) NOT NULL COMMENT 'Posto del biglietto',
  `DATA_BIGLIETTO` VARCHAR(14) NOT NULL COMMENT 'Data effettiva del biglietto',
  `DATA_ACQUISTO` VARCHAR(14) NOT NULL COMMENT 'Data acquisto del biglietto',
  `DATA_CANCELLAZIONE` VARCHAR(14) COMMENT 'Data cancellazione del biglietto',
  PRIMARY KEY (`KID`),
  FOREIGN KEY (ID_PASSEGGERO) REFERENCES passeggeri(KID),
  FOREIGN KEY (ID_TRENO) REFERENCES treni(KID),
  FOREIGN KEY (ID_PERCORSO_TARIFFA_CLASSE) REFERENCES percorso_tariffa_classe(KID))
COMMENT = 'Tabella anagrafica dei biglietti';

-- Indici cruciali per le operazioni sui biglietti
CREATE INDEX `idx_biglietti_passeggero` ON `train_booking`.`biglietti` (`ID_PASSEGGERO`);
CREATE INDEX `idx_biglietti_treno` ON `train_booking`.`biglietti` (`ID_TRENO`);
CREATE INDEX `idx_biglietti_ptc` ON `train_booking`.`biglietti` (`ID_PERCORSO_TARIFFA_CLASSE`);
CREATE INDEX `idx_biglietti_data_biglietto` ON `train_booking`.`biglietti` (`DATA_BIGLIETTO`);
CREATE INDEX `idx_biglietti_data_acquisto` ON `train_booking`.`biglietti` (`DATA_ACQUISTO`);
CREATE INDEX `idx_biglietti_data_cancellazione` ON `train_booking`.`biglietti` (`DATA_CANCELLAZIONE`);
CREATE INDEX `idx_biglietti_posto` ON `train_booking`.`biglietti` (`POSTO`);
CREATE INDEX `idx_biglietti_treno_data` ON `train_booking`.`biglietti` (`ID_TRENO`, `DATA_BIGLIETTO`);
CREATE INDEX `idx_biglietti_treno_posto` ON `train_booking`.`biglietti` (`ID_TRENO`, `POSTO`);
CREATE INDEX `idx_biglietti_attivi` ON `train_booking`.`biglietti` (`DATA_CANCELLAZIONE`) WHERE `DATA_CANCELLAZIONE` IS NULL;
  
/**CREAZIONE DELLA TABELLA BIGLIETTI_JN */
CREATE TABLE `train_booking`.`biglietti_jn` (
  `KID` INT NOT NULL COMMENT 'Chiave primaria della tabella',
  `ID_BIGLIETTO_JN` INT NOT NULL COMMENT 'Chiave di riferimento della tabella biglietti',
  `ID_PASSEGGERO` INT NOT NULL COMMENT 'Chiave di riferimento della tabella passeggeri',
  `ID_TRENO` INT NOT NULL COMMENT 'Chiave di riferimento della tabella treni',
  `ID_PERCORSO_TARIFFA_CLASSE` INT NOT NULL COMMENT 'Chiave di riferimento della tabella percorso_tariffa_classe',
  `POSTO` VARCHAR(3) NOT NULL COMMENT 'Posto del biglietto',
  `DATA_BIGLIETTO` VARCHAR(14) NOT NULL COMMENT 'Data effettiva del biglietto',
  `DATA_OPERAZIONE` VARCHAR(14) NOT NULL COMMENT 'Data operazione',
  `ID_TIPO_OPERAZIONE` INT NOT NULL COMMENT 'Chiave di riferimento della tabella id_tipo_operazione',
  PRIMARY KEY (`KID`),
  FOREIGN KEY (ID_BIGLIETTO_JN) REFERENCES biglietti(KID),
  FOREIGN KEY (ID_PASSEGGERO) REFERENCES passeggeri(KID),
  FOREIGN KEY (ID_TRENO) REFERENCES treni(KID),
  FOREIGN KEY (ID_PERCORSO_TARIFFA_CLASSE) REFERENCES percorso_tariffa_classe(KID),
  FOREIGN KEY (ID_TIPO_OPERAZIONE) REFERENCES tipo_operazione(KID))
COMMENT = 'Tabella journal dei biglietti';

-- Indici per audit e storico operazioni
CREATE INDEX `idx_biglietti_jn_biglietto` ON `train_booking`.`biglietti_jn` (`ID_BIGLIETTO_JN`);
CREATE INDEX `idx_biglietti_jn_passeggero` ON `train_booking`.`biglietti_jn` (`ID_PASSEGGERO`);
CREATE INDEX `idx_biglietti_jn_data_operazione` ON `train_booking`.`biglietti_jn` (`DATA_OPERAZIONE`);
CREATE INDEX `idx_biglietti_jn_tipo_operazione` ON `train_booking`.`biglietti_jn` (`ID_TIPO_OPERAZIONE`);
CREATE INDEX `idx_biglietti_jn_treno_data` ON `train_booking`.`biglietti_jn` (`ID_TRENO`, `DATA_BIGLIETTO`);
CREATE INDEX `idx_biglietti_jn_audit` ON `train_booking`.`biglietti_jn` (`ID_BIGLIETTO_JN`, `DATA_OPERAZIONE`, `ID_TIPO_OPERAZIONE`);
