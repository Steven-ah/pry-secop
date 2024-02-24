ALTER TRIGGER Entidad_AuditTrigger
ON Entidad
AFTER INSERT, UPDATE, DELETE
AS
BEGIN
   DECLARE @ObjectIdInserted UNIQUEIDENTIFIER;
   DECLARE @ObjectIdDeleted UNIQUEIDENTIFIER;
   SELECT @ObjectIdInserted = IdEntidad FROM INSERTED;
   SELECT @ObjectIdDeleted = IdEntidad FROM DELETED;

   IF @ObjectIdInserted IS NOT NULL AND @ObjectIdDeleted IS NOT NULL
	  INSERT INTO Auditoria (TableName, ActionType, NewValues, OldValues, ObjectId)
	  VALUES ('Entidad', 'UPDATE', (SELECT * FROM INSERTED FOR XML RAW, TYPE,ROOT('Entidad')), (SELECT * FROM DELETED FOR XML RAW, TYPE,ROOT('Entidad')), @ObjectIdInserted);
   ELSE IF @ObjectIdInserted IS NOT NULL
      INSERT INTO Auditoria (TableName, ActionType, NewValues, ObjectId)
	  VALUES ('Entidad', 'INSERT', (SELECT * FROM INSERTED FOR XML RAW, TYPE,ROOT('Entidad')), @ObjectIdInserted);
   ELSE IF @ObjectIdDeleted IS NOT NULL
	  INSERT INTO Auditoria (TableName, ActionType, OldValues, ObjectId)
	  VALUES ('Entidad', 'DELETE', (SELECT * FROM DELETED FOR XML RAW, TYPE,ROOT('Entidad')), @ObjectIdDeleted);	
END