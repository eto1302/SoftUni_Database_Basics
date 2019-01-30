CREATE TABLE Manufacturers
(
ManufacturerID int PRIMARY KEY IDENTITY,
Name varchar(200) NOT NULL,
EstablishedOn date
)

CREATE TABLE Models
(
ModelID int PRIMARY KEY IDENTITY,
Name varchar(200) NOT NULL,
ManufacturerID int UNIQUE,
CONSTRAINT FK_Manufacturer_Models FOREIGN KEY
(ManufacturerID) REFERENCES Manufacturers(ManufacturerID)
)
