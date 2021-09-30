/* Film di Fellini prodotti dopo il 1960 */
SELECT Titolo
FROM Film
WHERE Regista='Fellini'
AND AnnoProduzione>1960

/* il titolo e la durata dei film di fantascienza giapponesi o francesi prodotti dopo il 1990 */
SELECT f.Titolo, f.Durata
FROM Film f
WHERE f.Genere='Fantascienza'
AND (f.Nazionalita='JP' OR f.Nazionalita='FR')
AND f.AnnoProduzione> 1990

/* il titolo dei film di fantascienza giapponesi prodotti dopo il 1990 oppure francesi */
SELECT f.Titolo
FROM Film f
WHERE f.Genere='Fantascienza'
AND ((f.Nazionalita='JP' AND f.AnnoProduzione>1990) OR f.Nazionalita='FR')

/* I titolo dei film dello stesso regista di “Casablanca” */
SELECT f.Titolo
FROM Film f
WHERE f.Regista=(SELECT f1.Regista FROM Film f1 WHERE f1.Titolo='Casablanca')

/* Il titolo ed il genere dei film proiettati il giorno di Natale 2004 */
SELECT DISTINCT f.Titolo, f.Genere
FROM Film f, Proiezioni p
WHERE f.CodFilm=p.CodFilm
AND p.DataProiezione='20041225'

/* Il titolo ed il genere dei film proiettati a Napoli il giorno di Natale 2004 */
SELECT f.Titolo, f.Genere
FROM Film f, Sale s, Proiezioni p
WHERE (f.CodFilm=p.CodFilm)
AND p.CodSala=s.CodSala
AND s.Citta='Napoli'
AND p.DataProiezione='20041225'

/* I nomi delle sale di Napoli in cui il giorno di Natale 2004 è stato proiettato un film con R.Williams */
SELECT DISTINCT s.Nome
FROM Sale s, Proiezioni p, Attori a, Recita r
WHERE p.CodSala = s.CodSala
AND r.CodAttore=a.CodAttore
AND r.CodFilm=p.CodFilm
AND s.Citta='Napoli'
AND p.DataProiezione='20041225'
AND a.Nome='R.Williams'

/* Il titolo dei film in cui recitano M. Mastroianni e S.Loren */
SELECT f.Titolo
FROM Film f, Attori a, Recita r
WHERE f.CodFilm=r.CodFilm
AND r.CodAttore=a.CodAttore
AND f.CodFilm IN (SELECT f.CodFilm
FROM Film f, Attori a, Recita r
WHERE f.CodFilm=r.CodFilm
AND r.CodAttore=a.CodAttore
AND a.Nome='Mastroianni')
AND a.Nome='Loren'

/* soluzione 2 */
SELECT f.CodFilm
FROM Film f, Recita r, Attori a, Recita r2, Attori a2
WHERE a.CodAttore=r.CodAttore
AND f.CodFilm=r.CodFilm
AND a.Nome='Mastroianni'
AND f.CodFilm=r2.CodFilm
AND r2.CodAttore=a2.CodAttore
AND a2.Nome='Loren'

/* soluzione 3 */
SELECT f.Titolo
FROM Film f
WHERE 'Mastroianni' IN (SELECT a.Nome FROM Attori a, Recita r WHERE r.CodAttore=a.CodAttore AND r.CodFilm=f.CodFilm)
AND 'Loren' IN (SELECT a.Nome FROM Attori a, Recita r WHERE r.CodAttore=a.CodAttore AND r.CodFilm=f.CodFilm)

/* Per ogni film che è stato proiettato a Pisa nel gennaio 2005, il titolo del film e il nome della sala. */
SELECT f.Titolo
FROM Film f, Sale s, Proiezioni p
WHERE f.CodFilm=p.CodFilm
AND p.CodSala=s.CodSala
AND s.Citta='Pisa'
AND p.DataProiezione BETWEEN '20050101' AND '20050131'