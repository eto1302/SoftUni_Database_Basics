USE ColonialJourney
SELECT s.Name, s.Manufacturer
FROM Spaceships AS s
INNER JOIN Journeys AS j ON j.SpaceshipId = s.Id
INNER JOIN TravelCards AS tc ON j.Id = tc.JourneyId
INNER JOIN Colonists AS c ON tc.ColonistId = c.Id
WHERE c.Id IN 
(
SELECT C.Id 
FROM Colonists AS C 
JOIN TravelCards AS Tc ON Tc.ColonistId = C.Id 
WHERE Tc.JobDuringJourney = 'Pilot'
) AND YEAR(c.BirthDate) >= 1989
ORDER BY s.Name