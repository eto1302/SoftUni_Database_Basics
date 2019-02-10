USE ColonialJourney
SELECT TOP(1) j.Id, tc.JobDuringJourney AS JobName
FROM Journeys AS j
JOIN TravelCards AS tc ON tc.JourneyId = j.Id
WHERE (j.JourneyEnd - j.JourneyStart) = (SELECT MAX(JourneyEnd - JourneyStart) FROM Journeys)
GROUP BY tc.JobDuringJourney, j.Id
ORDER BY COUNT(tc.JobDuringJourney) ASC