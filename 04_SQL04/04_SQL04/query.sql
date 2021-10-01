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
			   AND o.NomeM=m.NomeM) /* devo sempre collegare la query interna a quella esterna */

/* Il nome dei musei di Londra che conservano solo opere di Tiziano */
SELECT m.NomeM
FROM Museo m
WHERE m.Citta='Londra'
AND EXISTS(SELECT *
			   FROM Opere o
			   WHERE o.NomeA='Tiziano'
			   AND o.NomeM=m.NomeM)

/* Per ciascun artista, il nome dell'artista ed il numero di sue opere conservate alla "Galleria degli Uffizi" */
SELECT o.NomeA, count(*) as NumeroOpere
FROM Museo m, Opere o
WHERE m.NomeM='Galleria degli Uffizi'
AND m.NomeM=o.NomeM
GROUP BY o.NomeA

/* I musei che conservano almeno 20 opere di artisti italiani */
SELECT o.NomeM
FROM Opere o, Artisti a
WHERE a.Nazionalita='IT'
AND a.NomeA=o.NomeA
GROUP BY o.NomeM
HAVING count(*)>=20

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
SELECT o.NomeM, a.Nazionalita, Count(*) NumeroOpere
FROM Opere o, Artisti a
WHERE o.NomeA=a.NomeA
GROUP BY o.NomeM, a.Nazionalita 