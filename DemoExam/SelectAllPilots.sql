USE ColonialJourney
SELECT c.Id, CONCAT(c.FirstName, ' ', c.LastName) AS FullName
FROM Colonists AS c
JOIN TravelCards AS tc ON tc.ColonistId = c.Id
WHERE tc.JobDuringJourney = 'Pilot'
ORDER BY Id ASC