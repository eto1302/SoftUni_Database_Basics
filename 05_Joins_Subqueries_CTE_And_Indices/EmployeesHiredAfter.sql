USE SoftUni
SELECT e.FirstName, e.LastName, e.HireDate, d.Name
FROM Employees AS e
INNER JOIN Departments AS d ON e.DepartmentID = d.DepartmentID
WHERE e.HireDate > '1999/1/1' AND (d.Name = 'Sales' OR d.Name = 'Finance')
ORDER BY e.HireDate ASC