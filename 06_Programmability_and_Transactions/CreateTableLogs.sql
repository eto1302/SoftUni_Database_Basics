--USE Bank
--CREATE TABLE Logs (
--  LogId int NOT NULL IDENTITY, 
--  AccountId int NOT NULL, 
--  OldSum money NOT NULL, 
--  NewSum money NOT NULL,
--  CONSTRAINT PK_Logs PRIMARY KEY (LogId),
--  CONSTRAINT FK_Logs_Accounts FOREIGN KEY (AccountId) REFERENCES Accounts(Id)
--)
CREATE TRIGGER tr_AccountBalanceChange ON Accounts FOR UPDATE
AS
BEGIN
  DECLARE @accountId int = (SELECT Id FROM inserted);
  DECLARE @oldBalance money = (SELECT Balance FROM deleted);
  DECLARE @newBalance money = (SELECT Balance FROM inserted);
  IF(@newBalance <> @oldBalance)
    INSERT INTO Logs VALUES (@accountId, @oldBalance, @newBalance);
END