USE ColonialJourney
SELECT Id, CONCAT(FirstName, ' ', LastName) AS [FullName], Ucn
FROM Colonists
ORDER BY FirstName ASC, LastName ASC, Id ASC