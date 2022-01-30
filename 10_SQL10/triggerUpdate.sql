CREATE TRIGGER [TriggerUpdate]
	ON [dbo].[Driver]
	AFTER UPDATE
	AS BEGIN
		DECLARE @numero int
		DECLARE @numeroNew int
		DECLARE @full_name varchar(100)
		DECLARE @full_nameNew varchar(100)
		DECLARE @country char(2)
		DECLARE @countryNew char(2)
		DECLARE @date_birth date
		DECLARE @date_birthNew date
		DECLARE @team_id int
		DECLARE @team_idNew int
		DECLARE @podiums_number int
		DECLARE @podiums_numberNew int
		DECLARE @data datetime

		SET @numero = (SELECT number FROM deleted)
		SET @numeroNew = (SELECT number FROM inserted)
		SET @full_name = (SELECT full_name FROM deleted)
		SET @full_nameNew = (SELECT full_name FROM inserted)
		SET @country = (SELECT country FROM deleted)
		SET @countryNew = (SELECT country FROM inserted)
		SET @date_birth = (SELECT date_birth FROM deleted)
		SET @date_birthNew = (SELECT date_birth FROM inserted)
		SET @team_id = (SELECT team_id FROM deleted)
		SET @team_idNew = (SELECT team_id FROM inserted)
		SET @podiums_number = (SELECT podiums_number FROM deleted)
		SET @podiums_numberNew = (SELECT podiums_number FROM inserted)
		SET @data = GETDATE()

		INSERT INTO StoricoAggiornamenti VALUES(@numero, @full_name, @country, @date_birth, @team_id, @podiums_number, @numeroNew, @full_nameNew, @countryNew, @date_birthNew, @team_idNew, @podiums_numberNew, @data)
	END

