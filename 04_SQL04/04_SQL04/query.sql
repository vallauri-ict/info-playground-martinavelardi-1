/* Per ciascun museo di Londra, il numero di opere di artisti italiani ivi conservate */
SELECT m.NomeM, count(*) as NumeroOpere
FROM Artisti a, Opere o, Museo m
WHERE a.Nazionalita='IT'
AND a.NomeA=o.NomeA
AND m.NomeM=o.NomeM
AND m.Citta='Londra'
GROUP BY m.NomeM

/* Il nome dei musei di Londra che non conservano opere di Tiziano */
SELECT m.NomeM
FROM Museo m
WHERE m.Citta='Londra'
AND NOT EXISTS(SELECT *
			   FROM Opere o
			   WHERE o.NomeA='Tiziano'
			   AND o.NomeM=m.NomeM)
/* devo sempre collegare la query interna a quella esterna */

SELECT *
FROM Museo m
WHERE m.Citta='Londra'
AND 'Tiziano' NOT IN(SELECT o.NomeA FROM Artisti a WHERE o.NomeM=m.NomeM)

/* Il nome dei musei di Londra che conservano solo opere di Tiziano */
SELECT m.NomeM
FROM Museo m
WHERE m.Citta='Londra'
AND NOT EXISTS(SELECT *
		       FROM Opere o
		       WHERE o.NomeA<>'Tiziano'
		       AND o.NomeM=m.NomeM)
/* Restituisce anche i musei senza opere */
SELECT *
FROM Museo m
WHERE m.Citta='Londra'
AND 'Tiziano' =ALL(SELECT o.NomeA FROM Opere o WHERE o.NomeM=m.NomeM)

/* Per ciascun artista, il nome dell'artista ed il numero di sue opere conservate alla "Galleria degli Uffizi" */
SELECT o.NomeA, count(*) as NumeroOpere
FROM Opere o
WHERE o.NomeM='Galleria degli Uffizi'
GROUP BY o.NomeA

/* I musei che conservano almeno 2 opere di artisti italiani */
SELECT o.NomeM
FROM Opere o, Artisti a
WHERE a.Nazionalita='IT'
AND a.NomeA=o.NomeA
GROUP BY o.NomeM
HAVING count(*)>1
/* HAVING lavora solo sui record della GROUP BY */
SELECT *
FROM Museo m
WHERE 2<=(SELECT count(*)
		  FROM Opere o, Artisti a
		  WHERE o.NomeA=a.NomeA
		  AND a.Nazionalita='IT'
		  AND m.NomeM=o.NomeM)

/* Per le opere di artisti italiani che non hanno personaggi, il titolo dell'opera ed il nome dell'artista */
SELECT o.Titolo, a.NomeA
FROM Opere o, Artisti a
WHERE a.Nazionalita='IT' 
AND o.NomeA=a.NomeA
AND NOT EXISTS (SELECT *
				FROM Personaggi p
				WHERE p.Codice=o.Codice)

/* Il nome dei musei di Londra che non conservano opere di artisti italiani, eccetto Tiziano */
SELECT m.NomeM
FROM Museo m
WHERE m.Citta='Londra'
AND NOT EXISTS(SELECT *
			   FROM Opere o, Artisti a
			   WHERE A.NomeA <> 'Tiziano'
			   AND a.Nazionalita='IT'
			   AND m.NomeM = o.NomeM)

/* Per ogni museo, il numero di opere divise per la nazionalità dell'artista */
SELECT o.NomeM, a.Nazionalita, Count(*) as NumeroOpere
FROM Opere o, Artisti a
WHERE o.NomeA=a.NomeA
GROUP BY o.NomeM, a.Nazionalita
ORDER BY o.NomeM

/* ------------------------------------------------------------------------------ */
UPDATE Artisti
SET Nazionalita='ES'
WHERE NomeA='Picasso'