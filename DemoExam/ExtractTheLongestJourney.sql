USE ColonialJourney
SELECT j.Id, p.Name AS PlanetName, sp.Name AS SpaceportName, j.Purpose AS JourneyPurpose
FROM Journeys AS j
JOIN Spaceports AS sp ON sp.Id = j.DestinationSpaceportId
JOIN Planets AS p ON p.Id = sp.PlanetId

WHERE (j.JourneyEnd - j.JourneyStart) = (SELECT MIN(JourneyEnd - JourneyStart) FROM Journeys);
