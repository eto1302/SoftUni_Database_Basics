USE Gringotts
SELECT w.DepositGroup, 
  SUM(w.DepositAmount) AS [TotalSum]
FROM WizzardDeposits AS w WHERE MagicWandCreator = 'Ollivander family'
GROUP BY w.DepositGroup
HAVING Sum(w.DepositAmount) < 150000
ORDER BY TotalSum DESC