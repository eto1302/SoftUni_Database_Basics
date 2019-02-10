USE ColonialJourney
SELECT ss.Name AS [SpaceshipName],  sp.Name AS [SpaceportName]
FROM Spaceships AS ss
INNER JOIN Journeys AS j ON j.SpaceshipId = ss.Id
INNER JOIN Spaceports AS sp ON j.DestinationSpaceportId = sp.Id
WHERE ss.LightSpeedRate = (SELECT MAX(LightSpeedRate) FROM Spaceships);
