CREATE TABLE DeletedJourneys
(
Id INT ,
JourneyStart DateTime NOT NULL,
JourneyEnd DateTime NOT NULL,
Purpose varchar(11) CHECK(Purpose = 'Medical' OR Purpose = 'Technical' OR Purpose =  'Educational' OR Purpose =  'Military'),
DestinationSpaceportId INT NOT NULL,
CONSTRAINT FK_Spaceport_Journeys1 FOREIGN KEY
(DestinationSpaceportId) REFERENCES Spaceports(Id),
SpaceshipId INT NOT NULL,
CONSTRAINT FK_Spaceship_Journeys1 FOREIGN KEY
(SpaceshipId) REFERENCES Spaceships(Id)
)
GO

CREATE TRIGGER tr_DeletedJourneyes 
ON Journeys 
AFTER DELETE 
AS
	INSERT INTO DeletedJourneys
	SELECT 	
		j.Id,
		j.JourneyStart,
		j.JourneyEnd,
		j.Purpose,
		j.DestinationSpaceportId,
		j.SpaceshipId
	FROM deleted as j