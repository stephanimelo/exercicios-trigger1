-- Exercicio 01 de Trigger
-- Log das atualizacoes da tabela Professor

-- Estrutura da tabela de log
CREATE TABLE Tabela_Log_Professor (
    IdLog INT IDENTITY(1,1) PRIMARY KEY,
    CodUsuario VARCHAR(100) NOT NULL,
    CodProfAlterado INT NOT NULL,
    TipoAlteracao VARCHAR(10) NOT NULL,
    DataHora DATETIME NOT NULL
);
GO

-- Trigger de log (INSERT, UPDATE e DELETE)
CREATE TRIGGER trg_Log_Professor
ON Professor
AFTER INSERT, UPDATE, DELETE
AS
BEGIN
    SET NOCOUNT ON;

    IF EXISTS (SELECT 1 FROM inserted) AND EXISTS (SELECT 1 FROM deleted)
    BEGIN
        INSERT INTO Tabela_Log_Professor (CodUsuario, CodProfAlterado, TipoAlteracao, DataHora)
        SELECT SUSER_SNAME(), i.CodProf, 'UPDATE', GETDATE() FROM inserted i;
    END
    ELSE IF EXISTS (SELECT 1 FROM inserted)
    BEGIN
        INSERT INTO Tabela_Log_Professor (CodUsuario, CodProfAlterado, TipoAlteracao, DataHora)
        SELECT SUSER_SNAME(), i.CodProf, 'INSERT', GETDATE() FROM inserted i;
    END
    ELSE
    BEGIN
        INSERT INTO Tabela_Log_Professor (CodUsuario, CodProfAlterado, TipoAlteracao, DataHora)
        SELECT SUSER_SNAME(), d.CodProf, 'DELETE', GETDATE() FROM deleted d;
    END
END;
GO