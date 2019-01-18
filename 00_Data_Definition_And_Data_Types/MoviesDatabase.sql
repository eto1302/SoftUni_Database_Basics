CREATE DATABASE Movies
CREATE TABLE Directors
(
Id int NOT NULL IDENTITY,
DirectorName varchar(20),
Notes nvarchar(max),
PRIMARY KEY (Id)
)
CREATE TABLE Genres
(
Id int NOT NULL IDENTITY,
GenreName varchar(20),
Notes nvarchar(max),
PRIMARY KEY (Id)
)
CREATE TABLE Categories
(
Id int NOT NULL IDENTITY,
CategoryName varchar(20),
Notes nvarchar(max),
PRIMARY KEY (Id)
)
CREATE TABLE Movies
(
Id int NOT NULL IDENTITY,
Title varchar(50),
DirectorId int,
CopyrightYear int,
Length int,
GenreId int,
CategoryId int,
Rating numeric(2,1),
Notes nvarchar(max),
PRIMARY KEY (Id),
FOREIGN KEY (DirectorId) REFERENCES Directors (Id),
FOREIGN KEY (GenreId) REFERENCES Genres (Id),
FOREIGN KEY (CategoryId) REFERENCES Categories (Id),
)

INSERT INTO Directors (DirectorName, Notes)
VALUES
	('Steven Spielberg', 'A great director'),
	('Christopher Nolan', 'Best known for his cerebral, often nonlinear story-telling'),
	('Susanne Bier', 'Known for In a Better World (2010), After the Wedding (2006) and Brothers (2004).'),
	('Kathryn Bigelow', 'Director of The Hurt Locker'),
	('Ridley Scott', 'His reputation remains solidly intact.')

INSERT INTO Genres (GenreName)
VALUES
	('Drama'),('History'),('Thriller'),('Romance'),('Sci-Fi')

INSERT INTO Categories (CategoryName)
VALUES
	('R'),('PG-13'),('PG-18'),('Avoid at all cost'),('Hmmmm')

INSERT INTO Movies (Title, DirectorId, CopyrightYear, Length, GenreId, CategoryId, Rating, Notes)
VALUES
	('Gladiator', 5, 2000, 155, 1, 1, 8.5, NULL),
	('The Prestige', 2, 2006, 130, 5, 2, 8.5, 'One of my favourite movies'),
	('The Hurt Locker', 4, 2008, 131, 3, 1, 7.6, NULL),
	('After the Wedding', 3, 2006, 155, 1, 1, 7.8, 'Amazing performance from everyone'),
	('Jurassic Park', 1, 2008, 120, 1, 1, 7.4, NULL)