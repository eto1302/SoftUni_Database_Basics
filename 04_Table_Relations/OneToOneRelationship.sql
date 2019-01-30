CREATE TABLE Passports
(
PassportID int PRIMARY KEY IDENTITY,
PassportNumber varchar(20) NOT NULL,
)

CREATE TABLE Persons
(
PersonID int PRIMARY KEY IDENTITY,
FirstName varchar(200) NOT NULL,
Salary	float(2),
PassportID int UNIQUE,
CONSTRAINT FK_Passports_Persons FOREIGN KEY
(PassportID) REFERENCES Passports(PassportID)
)
