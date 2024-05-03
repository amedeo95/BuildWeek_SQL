-- Creazione database
CREATE DATABASE VendiCose_Spa;

-- Creazione tabelle
CREATE TABLE Prodotti (
    ProdottoID VARCHAR(50) PRIMARY KEY,
    Nome_Prodotto VARCHAR(50),
    Categoria VARCHAR(50),
    Prezzo DECIMAL(10, 2),
    QuantitàMagazzino INT
);

CREATE TABLE Ordini (
    OrdineID VARCHAR(50) PRIMARY KEY,
    ProdottoID VARCHAR(50),
    MagazzinoID VARCHAR(50),
    QuantitàOrdinata INT,
    DataOrdine DATE,
    FOREIGN KEY (ProdottoID) REFERENCES Prodotti(ProdottoID),
    FOREIGN KEY (MagazzinoID) REFERENCES Magazzini(MagazzinoID)
);

CREATE TABLE Magazzini (
    MagazzinoID VARCHAR(50) PRIMARY KEY,
    NomeMagazzino VARCHAR(50)
);

CREATE TABLE Negozio (
    NegozioID VARCHAR(50),
    MagazzinoID VARCHAR(50),
    Nome_Negozio VARCHAR(50),
    RegioneID VARCHAR(50),
    PRIMARY KEY (NegozioID),
    FOREIGN KEY (MagazzinoID) REFERENCES Magazzini(MagazzinoID),
    FOREIGN KEY (RegioneID) REFERENCES Regioni (RegioneID)
);

CREATE TABLE Regioni (
	RegioneID VARCHAR(50) PRIMARY KEY,
    Nome_Regione VARCHAR(50)
    );
    
CREATE TABLE Transazioni (
    TransazioneID VARCHAR(50) PRIMARY KEY,
    NegozioID VARCHAR(50),
    ProdottoID VARCHAR(50),
    QuantitàVenduta INT,
    DataTransazione DATE,
    FOREIGN KEY (NegozioID) REFERENCES Negozio(NegozioID),
    FOREIGN KEY (ProdottoID) REFERENCES Prodotti(ProdottoID)
);

CREATE TABLE ScorteMagazzino (
    MagazzinoID VARCHAR(50),
    ProdottoID VARCHAR(50),
    QuantitàScorteMagazzino VARCHAR(50),
    PRIMARY KEY (MagazzinoID),
    FOREIGN KEY (MagazzinoID) REFERENCES Magazzini(MagazzinoID),
    FOREIGN KEY (ProdottoID) REFERENCES Prodotti(ProdottoID)
);


-- Inserimento di valori di esempio nella tabella Prodotti
  INSERT INTO Prodotti (ProdottoID, Nome_Prodotto, Categoria, Prezzo, QuantitàMagazzino)
  VALUES
    ('GALADRIEL001', 'Lembas', 'Alimentari', 2.50, 200),
    ('MIRUVOR002', 'Miruvor', 'Bevande', 8.99, 100),
    ('HOBBITON003', 'Piede di Hobbit', 'Gadgets', 1.25, 150),
    ('LORIEN004', 'Manto di Lórien', 'Abbigliamento', 29.99, 80),
    ('WESTFOLD005', 'Pipe dell''Ovest', 'Accessori', 5.50, 120),
    ('GALADRIEL006', 'Pietra di Galadriel', 'Artefatti', 399.99, 50),
    ('ONE_RING007', 'Anello Unico', 'Artefatti', 15.99, 60),
    ('EARENDIL008', 'Stella di Eärendil', 'Gioielli', 350.85, 75),
    ('PALANTIR009', 'Palantír', 'Artefatti', 499.99, 90),
    ('PIPWEED010', 'Foglia di Pipeweed', 'Alimentari', 5.49, 80),
    ('WARGSKIN011', 'Pelle di Warg', 'Abbigliamento', 19.99, 70),
    ('ARKENSTONE012', 'Gemma di Arkenstone', 'Gioielli', 89.99, 1),
    ('GIMLIAXE013', 'Ascia di Gimli', 'Armi', 299.99, 40),
    ('ANDURIL014', 'Spada Anduril', 'Armi', 199.99, 70),
    ('STING015', 'Sting', 'Armi', 79.90, 120),
    ('GONDORCROWN016', 'Corona di Gondor', 'Abbigliamento', 59.99, 35),
    ('LEGOLASHELM017', 'Elmo di Legolas', 'Abbigliamento', 399.99, 70),
    ('LEGOLASBOW018', 'Arco di Legolas', 'Armi', 199.99, 85),
    ('BOMBADILFILTER019', 'Filtro di Bombadil', 'Alimentari', 8.99, 90),
    ('REDBOOK020', 'Libro Rosso della Contea', 'Libri', 49.99, 80);


-- Inserimento di valori di esempio nella tabella Magazzini
INSERT INTO Magazzini (MagazzinoID, NomeMagazzino)
VALUES
    ('MOR001', 'Magazzino dell''Oscuro Dominio'),
    ('MOR002', 'Deposito delle Ombre'),
    ('MOR003', 'Magazzino della Pietra Nera'),
    ('MOR004', 'Covo degli Uruk-hai'),
    ('MOR005', 'Rifugio di Barad-dûr'),
    ('MOR006', 'Magazzino dell''Oscurità Implacabile'),
    ('MOR007', 'Tana dei Nazgûl'),
    ('MOR008', 'Torre dell''Occhio Infido'),
    ('MOR009', 'Antro di Shelob'),
    ('MOR010', 'Forgia dei Draghi Neri');


-- Inserimento di valori di esempio nella tabella Ordini
INSERT INTO Ordini (OrdineID, ProdottoID, MagazzinoID, QuantitàOrdinata, DataOrdine)
VALUES
    ('ABC100100', 'GALADRIEL001', 'MOR001', 50, '2023-02-01'),
    ('KDH002300', 'MIRUVOR002', 'MOR002', 30, '2023-01-01'),
    ('KGS020100', 'HOBBITON003', 'MOR003', 40, '2023-05-01'),
    ('PLA010100', 'LORIEN004', 'MOR004', 20, '2023-05-10'),
    ('ALK020500', 'WESTFOLD005', 'MOR006', 25, '2023-06-18'),
    ('JSS020100', 'GALADRIEL006', 'MOR005', 10, '2023-01-15'),
    ('ALS020100', 'ONE_RING007', 'MOR002', 15, '2023-08-04'),
    ('AZX020100', 'EARENDIL008', 'MOR005', 20, '2023-11-07'),
    ('OOR020100', 'PALANTIR009', 'MOR007', 25, '2023-12-01'),
    ('PPQ020100', 'PIPWEED010', 'MOR003', 30, '2023-08-25'),
    ('ALZ020100', 'WARGSKIN011', 'MOR008', 35, '2023-06-01'),
    ('AJD020100', 'ARKENSTONE012', 'MOR009', 40, '2024-03-01'),
    ('OIQ020100', 'GIMLIAXE013', 'MOR002', 45, '2024-07-05'),
    ('LKE020100', 'ANDURIL014', 'MOR001', 50, '2023-08-02'),
    ('FAX020100', 'STING015', 'MOR005', 55, '2024-02-01'),
    ('NJA020100', 'GONDORCROWN016', 'MOR007', 60, '2023-10-13'),
    ('AAN020100', 'LEGOLASHELM017', 'MOR009', 65, '2024-11-18'),
    ('LKA020100', 'LEGOLASBOW018', 'MOR008', 70, '2023-10-13'),
    ('KAH020100', 'BOMBADILFILTER019', 'MOR010', 75, '2023-09-06'),
    ('AJN09200', 'REDBOOK020', 'MOR001', 80, '2024-06-10');

-- Inserimento di valori di esempio nella tabella Negozio
INSERT INTO Negozio (NegozioID, MagazzinoID, Nome_Negozio, RegioneID)
VALUES
    ('AnelloMagico001', 'MOR001', 'La Bottega dell''Anello Magico', 'RIVENDELL_L6M4'),
    ('PuledroBalzo002', 'MOR009', 'La Locanda del Puledro Balzo', 'SHIRE_X1Z9'),
    ('MercanteElicefalo003', 'MOR005', 'Il Mercante di Elicefalo', 'GONDOLIN_Q2Z9'),
    ('UnicoAnello004', 'MOR003', 'La Bottega dell''Unico Anello', 'DALE_Y6R2'),
    ('EmporioRivendell005', 'MOR010', 'L''Emporio di Rivendell', 'ESGAROTH_X3N7'),
    ('MercanteHobbiton006', 'MOR003', 'Il Mercante di Hobbiton', 'BREE_L9W3'),
    ('DispensaSecondaColazione007', 'MOR008', 'La Dispensa di Seconda Colazione', 'MORIA_W5P1'),
    ('AlberoBianco008', 'MOR005', 'La Bottega dell''Albero Bianco', 'DOLAMROTH_U8F4'),
    ('TavernaBevitoreBirra009', 'MOR001', 'La Taverna del Bevitore di Birra', 'HOBBITON_R4A6'),
    ('EmporioLothlorien010', 'MOR007', 'L''Emporio di Lothlórien', 'DUNHARROW_T3G7'),
    ('RifugioMontagna011', 'MOR005', 'Il Rifugio della Montagna', 'EDORAS_Z1K8'),
    ('StellaSerafina012', 'MOR006', 'La Stella di Serafina','GONDOR_V2S8'),
    ('BottegaArgonath013', 'MOR003', 'La Bottega degli Argonath', 'LOTHLORIEN_N4J9'),
    ('RistoranteAragorn014', 'MOR010', 'Il Ristorante di Aragorn', 'BUCKLAND_R7Y2'),
    ('LocandaBalrog015', 'MOR007', 'La Locanda del Balrog', 'MINASTIRITH_U7F3'),
    ('BottegaGandalf016', 'MOR009', 'La Bottega di Gandalf', 'SHIRE_K3P8'),
    ('CasaElfi017', 'MOR007', 'La Casa degli Elfi', 'ROHAN_W9U3'),
    ('EmporioMoria018', 'MOR002', 'L''Emporio di Moria', 'ISENGARD_P8H5'),
    ('RifugioThorin019', 'MOR005', 'Il Rifugio di Thorin', 'MORDOR_S2D6'),
    ('OsteriaFrodo020', 'MOR004', 'L''Osteria di Frodo', 'EREGION_T5Q1');

    -- Inserimento di valori delle regioni italiane nella tabella Regioni
INSERT INTO Regioni (RegioneID, Nome_Regione)
VALUES
    ('SHIRE_X1Z9', 'Contea'),
    ('BUCKLAND_R7Y2', 'Buckland'),
    ('SHIRE_K3P8', 'Shire'),
    ('EREGION_T5Q1', 'Eregion'),
    ('ROHAN_W9U3', 'Rohan'),
    ('GONDOR_V2S8', 'Gondor'),
    ('RIVENDELL_L6M4', 'Rivendell'),
    ('LOTHLORIEN_N4J9', 'Lothlórien'),
    ('ISENGARD_P8H5', 'Isengard'),
    ('MORDOR_S2D6', 'Mordor'),
    ('MINASTIRITH_U7F3', 'Minas Tirith'),
    ('EDORAS_Z1K8', 'Edoras'),
    ('HOBBITON_R4A6', 'Hobbiton'),
    ('BREE_L9W3', 'Bree'),
    ('DALE_Y6R2', 'Dale'),
    ('ESGAROTH_X3N7', 'Esgaroth'),
    ('DOLAMROTH_U8F4', 'Dol Amroth'),
    ('GONDOLIN_Q2Z9', 'Gondolin'),
    ('MORIA_W5P1', 'Moria'),
    ('DUNHARROW_T3G7', 'Dunharrow');


-- Inserimento di valori di esempio nella tabella Transazioni
INSERT INTO Transazioni (TransazioneID, NegozioID, ProdottoID, QuantitàVenduta, DataTransazione)
VALUES
    ('10ABC01','AnelloMagico001', 'GALADRIEL001', '15', '2023-01-07'),
    ('10FRT54','PuledroBalzo002', 'MIRUVOR002', '10', '2023-02-18'),
    ('05RFY96','MercanteElicefalo003', 'HOBBITON003', '10', '2023-08-05'),
    ('41OLP67', 'UnicoAnello004', 'LORIEN004', '7', '2023-02-11'),
    ('59KGD75', 'EmporioRivendell005', 'WESTFOLD005', '20', '2023-06-04'),
    ('03YGT79','MercanteHobbiton006', 'GALADRIEL006', '5', '2023-01-09'),
    ('59HYR81', 'DispensaSecondaColazione007', 'ONE_RING007', '7', '2023-11-25'),
    ('01ZYE77', 'AlberoBianco008', 'EARENDIL008', '4', '2023-11-27'),
    ('01HYS12', 'TavernaBevitoreBirra009', 'PALANTIR009', '3', '2023-07-03'),
    ('07UHY12', 'EmporioLothlorien010', 'PIPWEED010', '5', '2023-05-19'),
    ('66JYS99', 'RifugioMontagna011', 'WARGSKIN011', '10', '2023-03-28'),
    ('12KAX09', 'StellaSerafina012', 'WARGSKIN011', '6', '2023-04-24'),
    ('19LAP67', 'BottegaArgonath013', 'ARKENSTONE012', '7', '2023-09-04'),
    ('57URT09', 'RistoranteAragorn014', 'GIMLIAXE013', '6', '2023-10-07'),
    ('61KSK05', 'LocandaBalrog015', 'ANDURIL014', '12', '2023-12-09'),
    ('81OAL06', 'BottegaGandalf016', 'STING015', '14', '2023-04-22'),
    ('00UYM95', 'CasaElfi017', 'GONDORCROWN016', '7', '2023-03-25'),
    ('70BVC93', 'EmporioMoria018', 'LEGOLASHELM017', '4', '2023-01-19'),
    ('04GHD95', 'RifugioThorin019', 'BOMBADILFILTER019', '5', '2023-09-12'),
    ('75HFZ04', 'OsteriaFrodo020', 'REDBOOK020', '9', '2023-06-11');

-- Inserimento di valori di esempio nella tabella ScorteMagazzino
INSERT INTO ScorteMagazzino (MagazzinoID, ProdottoID, QuantitàScorteMagazzino)
VALUES
    ('MOR001', 'GALADRIEL001', '180'),
    ('MOR002', 'MIRUVOR002', '85'),
    ('MOR003', 'HOBBITON003', '120'),
    ('MOR004', 'LORIEN004', '70'),
    ('MOR005', 'WESTFOLD005', '100'),
    ('MOR006', 'GALADRIEL006', '45'),
    ('MOR007', 'ONE_RING007', '55'),
    ('MOR008', 'EARENDIL008', '65'),
    ('MOR009', 'PALANTIR009', '75'),
    ('MOR010', 'PIPWEED010', '50');
    

/* Query da svolgere
*/

-- creazione procedura per aggiornare la tabella dopo che viene venduto un prodotto in negozio
DELIMITER //

CREATE PROCEDURE AggiornaScorteDopoVendita (
    IN TransazioneID INT,
    IN NegozioID INT,
    IN ProdottoID INT,
    IN QuantitàVenduta INT
)
BEGIN

    -- Trova il MagazzinoID corrispondente al NegozioID fornito
    SELECT MagazzinoID FROM Negozio WHERE NegozioID = NegozioID;

    -- Aggiorna la quantità di prodotto nel magazzino dopo la vendita
    UPDATE ScorteMagazzino
    SET QuantitàMagazzino = QuantitàMagazzino - QuantitàVenduta
    WHERE MagazzinoID = MagazzinoID AND ProdottoID = ProdottoID;

END //

DELIMITER ;

-- aggiornamento delle scorte del magazzino dopo una vendita
UPDATE ScorteMagazzino
SET 
	QuantitàMagazzino = QuantitàMagazzino - QuantitàVenduta
WHERE MagazzinoID = (
    SELECT MagazzinoID
    FROM Negozio
    WHERE NegozioID = NegozioID
)
AND ProdottoID = ProdottoID;

 -- unità di prodotto presenti in magazzino e monitoraggio soglie di restock
SELECT
	prod.ProdottoID,
    scor.MagazzinoID,
    prod.Nome_Prodotto,
    prod.Categoria,
    prod.Prezzo,
    prod.QuantitàMagazzino,
    scor.QuantitàScorteMagazzino,
    prod.QuantitàMagazzino - scor.QuantitàScorteMagazzino AS DiffTraProdotti
FROM prodotti prod
INNER JOIN scortemagazzino scor
	ON prod.ProdottoID = scor.ProdottoID
ORDER BY DiffTraProdotti DESC;


-- Totale venduto per prodotti in base al negozio
SELECT
    prod.Nome_Prodotto,
    neg.Nome_Negozio,
    reg.Nome_Regione,
    prod.QuantitàMagazzino,
    scor.QuantitàScorteMagazzino,
    prod.QuantitàMagazzino - scor.QuantitàScorteMagazzino AS DiffTraProdotti,
    prod.Prezzo,
    tra.QuantitàVenduta,
    prod.Prezzo * tra.QuantitàVenduta AS TotaleVenduto
FROM prodotti prod
INNER JOIN transazioni tra 
	ON prod.ProdottoID = tra.ProdottoID
INNER JOIN negozio neg 
	ON tra.NegozioID = neg.NegozioID
INNER JOIN regioni reg
	ON neg.RegioneID = reg.RegioneID
INNER JOIN scortemagazzino scor
	ON scor.ProdottoID = prod.ProdottoID
ORDER BY TotaleVenduto DESC;