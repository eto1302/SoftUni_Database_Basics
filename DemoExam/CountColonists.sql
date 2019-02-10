USE ColonialJourney
SELECT COUNT(c.Id) AS [count]
FROM Colonists AS c
INNER JOIN TravelCards AS tc ON tc.ColonistId = c.Id
INNER JOIN Journeys AS j ON tc.JourneyId= j.Id
WHERE j.Purpose = 'Technical'
