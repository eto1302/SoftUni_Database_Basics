CREATE FUNCTION udf_GetColonistsCount(@PlanetName varchar(30))
RETURNS INT
AS 
BEGIN 
 DECLARE @result INT = 
 (
 SELECT COUNT(c.Id)
 FROM Colonists AS c
 JOIN TravelCards AS tc ON tc.ColonistId = c.Id
 JOIN Journeys AS j ON j.Id = tc.JourneyId
 JOIN Spaceports AS sp ON sp.Id = j.DestinationSpaceportId
 JOIN Planets AS p ON p.Id = sp.PlanetId
 WHERE p.Name = @PlanetName
 );
 RETURN @result;
END