CREATE TRIGGER [dbo].[NuovaAuto]
    ON [dbo].[Auto]
    INSTEAD OF INSERT
    AS
    BEGIN
        DECLARE @Targa varchar(8)
		DECLARE @Cilindrata int
		DECLARE @Prezzo decimal(8, 2)
		DECLARE @Modello varchar(30)
		DECLARE @Colore varchar(20)
		DECLARE @Marca varchar(20)
		DECLARE @Alimentazione varchar(20)
		DECLARE @IdProprietario int

		SET @Cilindrata = (SELECT Cilindrata FROM inserted)
		SET @Targa = (SELECT Targa FROM inserted)
		SET @Colore = (SELECT Colore FROM inserted)
		SET @Prezzo = (SELECT Prezzo FROM inserted)
		SET @Modello = (SELECT Modello FROM inserted)
		SET @Marca = (SELECT Marca FROM inserted)
		SET @Alimentazione = (SELECT Alimentazione FROM inserted)
		SET @IdProprietario = (SELECT IdProprietario FROM inserted)

		IF(@Cilindrata < 900)
			SET @Cilindrata = 900
		IF(@Cilindrata > 4800)
			SET @Cilindrata = 4800

		INSERT INTO [Auto] VALUES
			(@Targa, @Cilindrata, @Prezzo, @Modello, @Colore, @Marca, @Alimentazione, @IdProprietario)
    END;

CREATE TRIGGER [dbo].[CreaStorico]
    ON [dbo].[Auto]
    FOR UPDATE
    AS
    BEGIN
        SET NoCount ON

		DECLARE @Targa varchar(8)
		DECLARE @VecchioPrezzo decimal(8, 2)
		DECLARE @NuovoPrezzo decimal(8, 2)

		SET @Targa = (SELECT Targa FROM deleted)
		SET @VecchioPrezzo = (SELECT Prezzo FROM deleted)
		SET @NuovoPrezzo = (SELECT Prezzo FROM inserted)

		INSERT INTO Storia(Targa, VecchioPrezzo, NuovoPrezzo) VALUES 
			(@Targa, @VecchioPrezzo, @NuovoPrezzo)
    END;