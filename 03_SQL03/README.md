# 💻 Esercizio 03 SQL 💻

👩🏻‍💻 __Velardi Martina 5^B informatica__

## Creazione del database Film
### Tabelle
* Attori (__**CodAttore**__, Nome, AnnoNascita, Nazionalità)
* Recita (__**CodAttore***__, __**CodFilm***__)
* Film (__**CodFilm**__, Titolo, AnnoProduzione, Nazionalità, Regista, Genere, Durata)
* Proiezioni (__**CodProiezione**__, CodFilm*, CodSala*, Incasso, DataProiezione)
* Sale (__**CodSala**__, Posti, Nome, Città)

### Query:
* Titolo dei film di Fellini prodotti dopo il 1960
* Il titolo e la durata dei film di fantascienza giapponesi o francesi prodotti dopo il 1990
* Il titolo dei film di fantascienza giapponesi prodotti dopo il 1990 oppure francesi
* Il titolo dei film dello stesso regista di “Casablanca”
* Il titolo ed il genere dei film proiettati il giorno di Natale 2004
* Il titolo ed il genere dei film proiettati a Napoli il giorno di Natale 2004
* I nomi delle sale di Napoli in cui il giorno di Natale 2004 è stato proiettato un film con R.Williams
* Il titolo dei film in cui recitano M. Mastroianni e S.Loren
* Per ogni film che è stato proiettato a Pisa nel gennaio 2005, il titolo del film e il nome della sala