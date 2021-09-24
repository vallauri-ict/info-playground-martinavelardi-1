/* Le città da cui partono voli per Roma */
SELECT DISTINCT v.CittaPart
FROM Volo v
WHERE v.CittaArr='Roma'
ORDER BY v.CittaPart

/* Città con aeroporto con numero di piste non noto */
SELECT a.Citta
FROM Aeroporto a
WHERE a.NumPiste IS NULL

/* Per ogni volo misto (sia merci che passeggeri): codice volo e dati di trasporto */
SELECT *
FROM Aereo a, Volo v
WHERE a.TipoAereo=v.TipoAereo
AND a.QtaMerci>0
AND a.NumPasseggeri>0