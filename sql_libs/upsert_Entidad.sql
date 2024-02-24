USE [SECOP]
GO

/****** Object:  Table [dbo].[Entidad]    Script Date: 24/02/2024 10:40:57 a. m. ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE upsert_entidad(
	@idEntidad uniqueidentifier,
	@NitEntidad nvarchar(10),
	@Nombre nvarchar(150),
	@Departamento nvarchar(40),
	@Ciudad nvarchar(40),
	@Orden nvarchar(20),
	@Centralizada bit
) AS
BEGIN
	UPDATE Entidad
	SET
		Departamento = @Departamento,
		Ciudad = @Ciudad,
		Orden = @Orden,
		Centralizada = @Centralizada,
		modifiedon = GETDATE()
	WHERE NIT = @NitEntidad AND Nombre = @Nombre;

	IF @@ROWCOUNT = 0
	BEGIN
		INSERT INTO Entidad (IdEntidad, NIT, Nombre, Departamento, Ciudad, Orden, Centralizada)
		VALUES(@idEntidad, @NitEntidad, @Nombre, @Departamento, @Ciudad, @Orden, @Centralizada)
	END
END