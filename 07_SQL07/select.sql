SELECT 'Negozio' AS Tipo, [Data] FROM VenditaNegozio
UNION
SELECT 'Internet' AS Tipo, [Data] FROM VenditaInternet
ORDER BY [Data] DESC;

SELECT [Data] FROM VenditaNegozio
INTERSECT
SELECT [Data] FROM VenditaInternet
ORDER BY [Data] DESC;

SELECT [Data] FROM VenditaNegozio
EXCEPT
SELECT [Data] FROM VenditaInternet
ORDER BY [Data] DESC;