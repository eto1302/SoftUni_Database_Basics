CREATE PROC usp_DeleteEmployeesFromDepartment @departmentId INT
AS
	ALTER TABLE Departments
	ALTER COLUMN ManagerID INT NULL

	ALTER TABLE Employees
	ALTER COLUMN ManagerID INT NULL

	ALTER TABLE Employees
	ALTER COLUMN DepartmentID INT NULL

	UPDATE Employees
	SET ManagerID = NULL, DepartmentID = NULL
	WHERE Employees.DepartmentID = @departmentId

	UPDATE Departments
	SET ManagerID = NULL
	WHERE Departments.DepartmentID = @departmentId

	DELETE FROM Departments
	WHERE Departments.DepartmentID = @departmentId

	DELETE FROM Employees
	WHERE Employees.DepartmentID = @departmentId

	SELECT COUNT(*) FROM Employees
	WHERE DepartmentID = @departmentId