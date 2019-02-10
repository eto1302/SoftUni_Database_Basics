CREATE PROC usp_EmployeesBySalaryLevel(@input varchar(max))
AS  
  SELECT FirstName, LastName
  FROM Employees
  WHERE dbo.ufn_GetSalaryLevel(Salary) = @input