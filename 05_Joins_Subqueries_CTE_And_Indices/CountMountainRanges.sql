USE Geography
SELECT CountryCode, COUNT(MountainId) AS MountainRanges
FROM MountainsCountries
WHERE CountryCode = 'US' OR CountryCode = 'BG' OR CountryCode = 'RU'
GROUP BY CountryCode
