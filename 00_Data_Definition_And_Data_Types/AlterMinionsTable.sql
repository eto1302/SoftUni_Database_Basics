ALTER TABLE Minions
Add TownId INT CONSTRAINT FK_TownId_Towns FOREIGN KEY REFERENCES Towns(Id)