USE Gringotts
SELECT DISTINCT SUBSTRING(FirstName, 0, 2) AS [FirstLetter]
FROM WizzardDeposits
WHERE DepositGroup = 'Troll Chest'
ORDER BY FirstLetter ASC