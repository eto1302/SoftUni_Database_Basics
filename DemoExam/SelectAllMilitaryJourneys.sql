USE ColonialJourney
SELECT Id, CONVERT(VARCHAR(10), JourneyStart, 103), CONVERT(VARCHAR(10), JourneyEnd, 103)
FROM Journeys	
WHERE Purpose = 'Military'
ORDER BY JourneyStart ASC