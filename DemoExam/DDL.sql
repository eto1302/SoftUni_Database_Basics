CREATE DATABASE ColonialJourney

CREATE TABLE Planets
(
Id INT PRIMARY KEY IDENTITY,
Name varchar(30) NOT NULL
)

CREATE TABLE Spaceships
(
Id INT PRIMARY KEY IDENTITY,
Name varchar(50) NOT NULL,
Manufacturer varchar(30) NOT NULL,
LightSpeedRate INT DEFAULT(0)
)

CREATE TABLE Colonists
(
Id INT PRIMARY KEY IDENTITY,
FirstName varchar(20) NOT NULL,
LastName varchar(20) NOT NULL,
Ucn varchar(10) NOT NULL UNIQUE,
BirthDate DATE NOT NULL
)

CREATE TABLE Spaceports
(
Id INT PRIMARY KEY IDENTITY,
Name varchar(50) NOT NULL,
PlanetId INT NOT NULL,
CONSTRAINT FK_Planets_Spaceports FOREIGN KEY
(PlanetId) REFERENCES Planets(Id)
)

CREATE TABLE Journeys
(
Id INT PRIMARY KEY IDENTITY,
JourneyStart DateTime NOT NULL,
JourneyEnd DateTime NOT NULL,
Purpose varchar(11) CHECK(Purpose = 'Medical' OR Purpose = 'Technical' OR Purpose =  'Educational' OR Purpose =  'Military'),
DestinationSpaceportId INT NOT NULL,
CONSTRAINT FK_Spaceport_Journeys FOREIGN KEY
(DestinationSpaceportId) REFERENCES Spaceports(Id),
SpaceshipId INT NOT NULL,
CONSTRAINT FK_Spaceship_Journeys FOREIGN KEY
(SpaceshipId) REFERENCES Spaceships(Id)
)

CREATE TABLE TravelCards
(
Id INT PRIMARY KEY IDENTITY,
CardNumber varchar(10) NOT NULL UNIQUE,
JobDuringJourney varchar(8) NOT NULL CHECK(JobDuringJourney = 'Pilot' OR JobDuringJourney = 'Engineer' OR JobDuringJourney =  'Trooper' OR JobDuringJourney =  'Cleaner' OR JobDuringJourney =  'Cook'),
ColonistId INT NOT NULL,
CONSTRAINT FK_Colonists_TravelCards FOREIGN KEY
(ColonistId) REFERENCES Colonists(Id),
JourneyId INT NOT NULL,
CONSTRAINT FK_Journeys_TravelCards FOREIGN KEY
(JourneyId) REFERENCES Journeys(Id)
)