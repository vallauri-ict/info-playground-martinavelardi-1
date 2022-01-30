CREATE TRIGGER [Trigger]
	ON [dbo].[Driver]
	AFTER DELETE
	AS BEGIN
		DECLARE @numero int
		DECLARE @full_name varchar(100)
		DECLARE @country char(2)
		DECLARE @date_birth date
		DECLARE @team_id int
		DECLARE @podiums_number int
		DECLARE @data datetime

		SET @numero = (SELECT number FROM deleted)
		SET @full_name = (SELECT full_name FROM deleted)
		SET @country = (SELECT country FROM deleted)
		SET @date_birth = (SELECT date_birth FROM deleted)
		SET @team_id = (SELECT team_id FROM deleted)
		SET @podiums_number = (SELECT podiums_number FROM deleted)
		SET @data = GETDATE()

		INSERT INTO StoricoCancellazioni VALUES(@numero, @full_name, @country, @date_birth, @team_id, @podiums_number, @data)
	END