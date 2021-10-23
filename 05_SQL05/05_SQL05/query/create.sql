DROP TABLE Proprietari, Assicurazioni, Automobili, Sinistro,AutoCoinvolte;

/* Creazione  tabelle */
CREATE TABLE Proprietari(
	CodF VARCHAR(5) PRIMARY KEY,
	Nome VARCHAR(20),
	Residenza VARCHAR(20)
)

CREATE TABLE Assicurazioni(
	CodAss INT PRIMARY KEY,
	Nome VARCHAR(20),
	Sede VARCHAR(20)
)

CREATE TABLE Automobili(
	Targa VARCHAR(7) PRIMARY KEY,
	Marca VARCHAR(10),
	Cilindrata INT,
	Potenza INT,
	CodF VARCHAR(5),
	FOREIGN KEY(CodF) REFERENCES Proprietari(CodF),
	FOREIGN KEY(CodAss) REFERENCES Assicurazioni(CodAss)
)

CREATE TABLE Sinistro(
	CodS INT PRIMARY KEY,
	Localita VARCHAR(20),
	Data DATE
)

CREATE TABLE AutoCoinvolte(
	CodS INT,
	Targa VARCHAR(7),
	PRIMARY KEY(CodS, Targa),
	FOREIGN KEY(CodS) REFERENCES Sinistro(CodS),
	FOREIGN KEY(Targa) REFERENCES Automobile(Targa),
	ImportoDelDanno INT
)
