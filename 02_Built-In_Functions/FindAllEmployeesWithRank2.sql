USE SoftUni
SELECT *
FROM (
       SELECT EmployeeID,FirstName,LastName,Salary,DENSE_RANK() OVER(PARTITION BY Salary ORDER BY EmployeeID) AS Rank
	   FROM Employees AS R  
) Employees 
WHERE Rank = 2 AND Salary BETWEEN 10000 AND 50000
ORDER BY Salary DESC