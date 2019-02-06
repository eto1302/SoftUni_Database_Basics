USE Geography
SELECT c.CountryCode, m.MountainRange, p.PeakName, p.Elevation
FROM Peaks AS p
JOIN Mountains AS m ON m.Id = p.MountainId
JOIN MountainsCountries AS mc ON mc.MountainId = m.Id
JOIN Countries AS c ON c.CountryCode = mc.CountryCode
WHERE p.Elevation > 2835 AND c.CountryCode = 'BG'
ORDER BY Elevation DESC