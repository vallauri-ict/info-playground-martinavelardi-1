SELECT * 
FROM Nazione n INNER JOIN Continente c
ON n.codContinente = c.idContinente

SELECT * 
FROM Nazione n LEFT JOIN Continente c
ON n.codContinente = c.idContinente

SELECT * 
FROM Nazione n RIGHT JOIN Continente c
ON n.codContinente = c.idContinente