USE Diablo
SELECT TOP(50) Name, LEFT(CONVERT(varchar, Start, 120), 10) AS Start FROM Games
WHERE YEAR(Start) = 2011 OR YEAR(Start) = 2012
ORDER BY Start, Name