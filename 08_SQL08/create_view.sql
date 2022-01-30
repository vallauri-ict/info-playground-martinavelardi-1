CREATE VIEW Vista1 AS
SELECT m.NomeM, m.Citta, o.Titolo
FROM Opera o, Museo m
WHERE o.NomeM = m.NomeM;