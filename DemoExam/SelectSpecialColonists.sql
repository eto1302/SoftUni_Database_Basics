USE ColonialJourney
SELECT Job, FullName, JobRank
FROM
(
	SELECT tc.JobDuringJourney AS Job, CONCAT(c.FirstName, ' ', c.LastName) AS FullName, DENSE_RANK() OVER (PARTITION BY tc.JobDuringJourney ORDER BY c.Birthdate) AS JobRank
	FROM TravelCards AS tc
	JOIN Colonists AS c ON c.Id = tc.ColonistId
) AS Result
WHERE JobRank = 2