INSERT INTO Proprietari VALUES
('JSK','Giorgia','Genova'),
('KRT','Andrea','Milano'),
('PTL','Elida','Brescia')
UPDATE Proprietari SET
Nome='Martina'
WHERE CodF='KRT'
INSERT INTO Assicurazioni VALUES
(1,'Generali','Torino'),
(2,'Sara','Cuneo'),
(3,'Allianz','Roma')
UPDATE Assicurazioni SET
Sede='Savigliano'
WHERE CodAss=2
INSERT INTO Automobili VALUES
('AR582OS','Fiat',1500,120,'QNG',2),
('TO302HA','Mercedes',2500,150,'PTL',1),
('PA792YV','Audi',2000,140,'KRT',3)
UPDATE Automobili SET
Cilindrata=2400
WHERE Targa='TO302HA'
INSERT INTO Sinistro VALUES
(1,'Carmagnola','2000-12-13'),
(2,'Alba','2002-02-06'),
(3, 'Roma','2010-10-10')
INSERT INTO AutoCoinvolte VALUES
(1,'PA792YV',200),
(3,'AR582OS',350),
(2,'TO302HA',500)